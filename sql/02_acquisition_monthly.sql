-- E-commerce portfolio: monthly acquisition export for Tableau
-- Prepared 2026-09-25 for PostgreSQL; not executed against the source database.
-- Run this SELECT and export its result as acquisition_monthly.csv.
--
-- Grain: session month x channel x utm_source x utm_campaign x device_type.
-- Window: April 2012 through February 2015 (session start time).
-- Revenue: gross sales before refunds, attributed to the linked session month.
-- All recorded orders linked to an eligible session contribute, including orders
-- whose order timestamp falls in a different calendar month from their session.
--
-- Channel CASE rules were recovered from the earlier project conversation.
-- Keep NULL source/campaign/device values; do not drop their session counts.
-- Assumes website_sessions.website_session_id is unique, as in the overview.
-- Pre-aggregating orders prevents multiple orders from multiplying sessions.
--
-- Expected totals, to verify after execution:
-- sessions = 455909; converting_sessions = 30999; orders = 30999;
-- gross_revenue = 1856559.28.
-- Each month must also reconcile to the matching monthly_overview.csv row.
-- Recompute Tableau ratios from summed counts/dollars, not averaged row rates.

WITH orders_by_session AS (
    SELECT
        website_session_id,
        COUNT(*) AS orders,
        SUM(price_usd)::numeric AS gross_revenue
    FROM orders
    GROUP BY website_session_id
),
classified_sessions AS (
    SELECT
        ws.website_session_id,
        DATE_TRUNC('month', ws.created_at)::date AS month,
        CASE
            WHEN ws.utm_source IN ('gsearch', 'bsearch')
                THEN 'Paid Search'
            WHEN ws.utm_source = 'socialbook'
                THEN 'Paid Social'
            WHEN ws.utm_source IS NULL
                AND ws.http_referer IN (
                    'https://www.gsearch.com',
                    'https://www.bsearch.com'
                )
                THEN 'Organic Search'
            WHEN ws.utm_source IS NULL AND ws.http_referer IS NULL
                THEN 'Direct'
            ELSE 'Other'
        END AS channel,
        ws.utm_source,
        ws.utm_campaign,
        ws.device_type
    FROM website_sessions ws
    WHERE ws.created_at >= TIMESTAMP '2012-04-01 00:00:00'
      AND ws.created_at <  TIMESTAMP '2015-03-01 00:00:00'
)
SELECT
    cs.month,
    cs.channel,
    cs.utm_source,
    cs.utm_campaign,
    cs.device_type,
    COUNT(*) AS sessions,
    COUNT(obs.website_session_id) AS converting_sessions,
    SUM(COALESCE(obs.orders, 0)) AS orders,
    SUM(COALESCE(obs.gross_revenue, 0)) AS gross_revenue
FROM classified_sessions cs
LEFT JOIN orders_by_session obs
    ON cs.website_session_id = obs.website_session_id
GROUP BY 1, 2, 3, 4, 5
ORDER BY 1, 2, 3, 4, 5;
