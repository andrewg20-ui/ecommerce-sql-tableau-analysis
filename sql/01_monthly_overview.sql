-- PostgreSQL export definition; statement matched monthly_overview.sql on 2026-10-22.
-- Comparison allowed introductory comments, blank lines, and the final line break only.
-- Original source-database execution and run date were not independently observed.

WITH orders_by_session AS (
    SELECT
        website_session_id,
        COUNT(*) AS orders,
        SUM(price_usd)::numeric AS gross_revenue
    FROM orders
    GROUP BY website_session_id
),
monthly AS (
    SELECT
        DATE_TRUNC('month', ws.created_at)::date AS month,
        MIN(ws.created_at) AS first_observed_session_at,
        MAX(ws.created_at) AS last_observed_session_at,
        COUNT(*) AS sessions,
        COUNT(obs.website_session_id) AS converting_sessions,
        SUM(COALESCE(obs.orders, 0)) AS orders,
        SUM(COALESCE(obs.gross_revenue, 0)) AS gross_revenue
    FROM website_sessions ws
    LEFT JOIN orders_by_session obs
        ON ws.website_session_id = obs.website_session_id
    GROUP BY 1
)
SELECT
    month,
    first_observed_session_at,
    last_observed_session_at,
    sessions,
    converting_sessions,
    orders,
    ROUND(gross_revenue, 2) AS gross_revenue,
    ROUND(100.0 * converting_sessions / NULLIF(sessions, 0), 2)
        AS conversion_pct,
    ROUND(gross_revenue / NULLIF(orders, 0), 2)
        AS average_order_value,
    ROUND(gross_revenue / NULLIF(sessions, 0), 2)
        AS gross_revenue_per_session
FROM monthly
ORDER BY month;
