-- E-commerce portfolio: first versus repeat sessions for Tableau
-- Prepared 2026-10-08 for PostgreSQL. Not executed against the source database.
-- Run this read-only SELECT and export the result as customer_sessions_monthly.csv.
--
-- Grain: session-start month x session type.
-- Window: April 2012 through February 2015, matching the dashboard overview.
-- Classifier: website_sessions.is_repeat_session; assumes 0 = first, 1 = repeat.
-- Preserve NULL or unexpected flags as Unknown so totals remain reconcilable.
-- Repeat sessions are return visits, not necessarily repeat purchases.
--
-- Use the same order pre-aggregation and session-month attribution as the
-- validated acquisition_monthly export. All recorded orders linked to an eligible
-- session contribute, even if an order occurs in a different calendar month.
-- Gross revenue is before refunds. Sessions without orders remain included.
-- Assumes one row per website_session_id and distinct order rows in orders.
-- Raw uniqueness, flag coding, completeness, and timezone remain unverified.
--
-- Reconcile the returned CSV to monthly_overview.csv for every month.
-- Expected full-window totals:
-- sessions = 455909; converting_sessions = 30999; orders = 30999;
-- gross_revenue = 1856559.28.
-- The earlier first/repeat comparison included partial March 2012, so its
-- segment counts are not expected to match this complete-month export exactly.
-- In Tableau, calculate ratios from summed counts and revenue, not row averages.

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
            WHEN ws.is_repeat_session = 0 THEN 'First session'
            WHEN ws.is_repeat_session = 1 THEN 'Repeat session'
            ELSE 'Unknown'
        END AS session_type
    FROM website_sessions ws
    WHERE ws.created_at >= TIMESTAMP '2012-04-01 00:00:00'
      AND ws.created_at <  TIMESTAMP '2015-03-01 00:00:00'
)
SELECT
    cs.month,
    cs.session_type,
    COUNT(*) AS sessions,
    COUNT(obs.website_session_id) AS converting_sessions,
    SUM(COALESCE(obs.orders, 0)) AS orders,
    SUM(COALESCE(obs.gross_revenue, 0)) AS gross_revenue
FROM classified_sessions cs
LEFT JOIN orders_by_session obs
    ON cs.website_session_id = obs.website_session_id
GROUP BY
    cs.month,
    cs.session_type
ORDER BY
    cs.month,
    cs.session_type;
