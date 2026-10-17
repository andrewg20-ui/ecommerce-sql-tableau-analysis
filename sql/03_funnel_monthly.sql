-- E-commerce portfolio: monthly ordered website funnel for Tableau
-- Prepared 2026-10-01 for PostgreSQL. Not run against Andrew's database.
-- Run the complete SELECT and export the result as funnel_monthly.csv.
--
-- Grain: session-start month x device_type x stage (seven rows per group).
-- Window: sessions starting April 2012 through February 2015.
-- Include every recorded pageview/order linked to those sessions, even when
-- its timestamp falls outside the session's calendar month or date window.
-- No table, view, index, or source-data changes are made by this query.
--
-- Method change from the earlier page-presence funnel:
-- stage_sessions counts sessions that reached this stage AFTER all previous
-- stages in sequence. Intervening/repeated pages are allowed. Tied pageview
-- timestamps are ordered by website_pageview_id as a deterministic tie-break.
-- This measures the catalog-to-checkout path; valid purchases that skip a
-- tracked stage need not appear in its final stage.
-- page_reach_sessions counts visits regardless of prior stages/order, retaining
-- the earlier MAX-flag approach for comparison in this same date window.
-- Final page stage = /thank-you-for-your-order, NOT an orders-table count.
-- orders_table_converting_sessions counts distinct sessions with actual orders;
-- it is populated ONLY on stage 1, for reconciliation with acquisition_monthly.
--
-- stage_sessions and page_reach_sessions are session counts, not pageviews.
-- session_cohort_size repeats once per stage. Aggregate it within a stage,
-- never across all stages. Do not sum stage counts into a business session KPI.
-- For Tableau continuation rates, use SUM(stage_sessions) divided by
-- SUM(previous_stage_sessions), with Stage in the view; stage 1 has no prior.
-- For cumulative reach, use SUM(stage_sessions) / SUM(session_cohort_size).
-- Do not average per-month or per-device percentages.
--
-- Expected stage-1 checks from the validated acquisition export:
-- all sessions 455909; desktop 315407; mobile 140502;
-- orders-table converting sessions 30999 (desktop 26650; mobile 4349).
-- Reconcile these per month too. All counts should be nonnegative;
-- stage_sessions must not increase as stage_order increases and must not
-- exceed page_reach_sessions. Do not force order-confirmation counts to equal
-- actual converting sessions; investigate any difference.
--
-- Schema/URLs recovered from earlier project messages on 2026-10-01.
-- Assumes unique session/pageview IDs and non-null pageview timestamps.
-- Only observed literal URL variants are mapped; no URL normalization added.

WITH session_cohort AS (
    SELECT
        ws.website_session_id,
        DATE_TRUNC('month', ws.created_at) AS month,
        ws.device_type
    FROM website_sessions ws
    WHERE ws.created_at >= '2012-04-01 00:00:00'
      AND ws.created_at <  '2015-03-01 00:00:00'
),
mapped_pageviews AS (
    SELECT
        pv.website_session_id,
        pv.website_pageview_id,
        pv.created_at,
        CASE
            WHEN pv.pageview_url = '/products' THEN 2
            WHEN pv.pageview_url IN (
                '/the-original-mr-fuzzy',
                '/the-forever-love-bear',
                '/the-birthday-sugar-panda',
                '/the-hudson-river-mini-bear'
            ) THEN 3
            WHEN pv.pageview_url = '/cart' THEN 4
            WHEN pv.pageview_url = '/shipping' THEN 5
            WHEN pv.pageview_url IN ('/billing', '/billing-2') THEN 6
            WHEN pv.pageview_url = '/thank-you-for-your-order' THEN 7
        END AS stage_order
    FROM website_pageviews pv
    JOIN session_cohort s
      ON s.website_session_id = pv.website_session_id
),
ranked_pageviews AS (
    SELECT
        website_session_id,
        stage_order,
        ROW_NUMBER() OVER (
            PARTITION BY website_session_id
            ORDER BY created_at, website_pageview_id
        ) AS event_position
    FROM mapped_pageviews
    WHERE stage_order IS NOT NULL
),
products_reached AS (
    SELECT website_session_id, MIN(event_position) AS event_position
    FROM ranked_pageviews
    WHERE stage_order = 2
    GROUP BY website_session_id
),
detail_reached AS (
    SELECT pv.website_session_id, MIN(pv.event_position) AS event_position
    FROM ranked_pageviews pv
    JOIN products_reached previous
      ON previous.website_session_id = pv.website_session_id
     AND pv.event_position > previous.event_position
    WHERE pv.stage_order = 3
    GROUP BY pv.website_session_id
),
cart_reached AS (
    SELECT pv.website_session_id, MIN(pv.event_position) AS event_position
    FROM ranked_pageviews pv
    JOIN detail_reached previous
      ON previous.website_session_id = pv.website_session_id
     AND pv.event_position > previous.event_position
    WHERE pv.stage_order = 4
    GROUP BY pv.website_session_id
),
shipping_reached AS (
    SELECT pv.website_session_id, MIN(pv.event_position) AS event_position
    FROM ranked_pageviews pv
    JOIN cart_reached previous
      ON previous.website_session_id = pv.website_session_id
     AND pv.event_position > previous.event_position
    WHERE pv.stage_order = 5
    GROUP BY pv.website_session_id
),
billing_reached AS (
    SELECT pv.website_session_id, MIN(pv.event_position) AS event_position
    FROM ranked_pageviews pv
    JOIN shipping_reached previous
      ON previous.website_session_id = pv.website_session_id
     AND pv.event_position > previous.event_position
    WHERE pv.stage_order = 6
    GROUP BY pv.website_session_id
),
confirmation_reached AS (
    SELECT pv.website_session_id, MIN(pv.event_position) AS event_position
    FROM ranked_pageviews pv
    JOIN billing_reached previous
      ON previous.website_session_id = pv.website_session_id
     AND pv.event_position > previous.event_position
    WHERE pv.stage_order = 7
    GROUP BY pv.website_session_id
),
page_presence AS (
    SELECT
        website_session_id,
        MAX(CASE WHEN stage_order = 2 THEN 1 ELSE 0 END) AS products,
        MAX(CASE WHEN stage_order = 3 THEN 1 ELSE 0 END) AS detail,
        MAX(CASE WHEN stage_order = 4 THEN 1 ELSE 0 END) AS cart,
        MAX(CASE WHEN stage_order = 5 THEN 1 ELSE 0 END) AS shipping,
        MAX(CASE WHEN stage_order = 6 THEN 1 ELSE 0 END) AS billing,
        MAX(CASE WHEN stage_order = 7 THEN 1 ELSE 0 END) AS confirmation
    FROM ranked_pageviews
    GROUP BY website_session_id
),
order_presence AS (
    SELECT DISTINCT o.website_session_id
    FROM orders o
    JOIN session_cohort s
      ON s.website_session_id = o.website_session_id
),
monthly_counts AS (
    SELECT
        s.month,
        s.device_type,
        COUNT(*) AS sessions,
        COUNT(pr.website_session_id) AS ordered_products,
        COUNT(dr.website_session_id) AS ordered_detail,
        COUNT(cr.website_session_id) AS ordered_cart,
        COUNT(sr.website_session_id) AS ordered_shipping,
        COUNT(br.website_session_id) AS ordered_billing,
        COUNT(fr.website_session_id) AS ordered_confirmation,
        SUM(COALESCE(pp.products, 0)) AS visited_products,
        SUM(COALESCE(pp.detail, 0)) AS visited_detail,
        SUM(COALESCE(pp.cart, 0)) AS visited_cart,
        SUM(COALESCE(pp.shipping, 0)) AS visited_shipping,
        SUM(COALESCE(pp.billing, 0)) AS visited_billing,
        SUM(COALESCE(pp.confirmation, 0)) AS visited_confirmation,
        COUNT(op.website_session_id) AS converting_sessions
    FROM session_cohort s
    LEFT JOIN products_reached pr ON pr.website_session_id = s.website_session_id
    LEFT JOIN detail_reached dr ON dr.website_session_id = s.website_session_id
    LEFT JOIN cart_reached cr ON cr.website_session_id = s.website_session_id
    LEFT JOIN shipping_reached sr ON sr.website_session_id = s.website_session_id
    LEFT JOIN billing_reached br ON br.website_session_id = s.website_session_id
    LEFT JOIN confirmation_reached fr ON fr.website_session_id = s.website_session_id
    LEFT JOIN page_presence pp ON pp.website_session_id = s.website_session_id
    LEFT JOIN order_presence op ON op.website_session_id = s.website_session_id
    GROUP BY s.month, s.device_type
),
stage_counts AS (
    SELECT month, device_type, 1 AS stage_order, 'Session' AS stage,
           sessions AS stage_sessions, sessions AS page_reach_sessions,
           sessions AS session_cohort_size, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 2, 'Products', ordered_products,
           visited_products, sessions, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 3, 'Product detail', ordered_detail,
           visited_detail, sessions, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 4, 'Cart', ordered_cart,
           visited_cart, sessions, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 5, 'Shipping', ordered_shipping,
           visited_shipping, sessions, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 6, 'Billing', ordered_billing,
           visited_billing, sessions, converting_sessions
    FROM monthly_counts
    UNION ALL
    SELECT month, device_type, 7, 'Order confirmation', ordered_confirmation,
           visited_confirmation, sessions, converting_sessions
    FROM monthly_counts
)
SELECT
    month,
    device_type,
    stage_order,
    stage,
    stage_sessions,
    LAG(stage_sessions) OVER (
        PARTITION BY month, device_type
        ORDER BY stage_order
    ) AS previous_stage_sessions,
    session_cohort_size,
    page_reach_sessions,
    CASE WHEN stage_order = 1 THEN converting_sessions END
        AS orders_table_converting_sessions
FROM stage_counts
ORDER BY month, device_type, stage_order;
