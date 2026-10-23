-- PostgreSQL export definition; statement matched product_monthly.sql on 2026-10-22.
-- Comparison allowed introductory comments, blank lines, and the final line break only.
-- Original source-database execution and run date were not independently observed.

SELECT
    DATE_TRUNC('month', oi.created_at)::date AS month,
    oi.product_id,
    p.product_name,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(SUM(oi.price_usd)::numeric, 2) AS gross_revenue,
    ROUND(SUM(oi.cogs_usd)::numeric, 2) AS cogs,
    ROUND(
        SUM(oi.price_usd - oi.cogs_usd)::numeric,
        2
    ) AS gross_profit
FROM order_items oi
LEFT JOIN products p
    ON p.product_id = oi.product_id
WHERE oi.created_at >= DATE '2012-04-01'
  AND oi.created_at <  DATE '2015-03-01'
GROUP BY
    DATE_TRUNC('month', oi.created_at)::date,
    oi.product_id,
    p.product_name
ORDER BY
    month,
    oi.product_id;
