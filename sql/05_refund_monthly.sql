-- PostgreSQL export definition; statement matched refund_monthly.sql on 2026-10-22.
-- Comparison allowed introductory comments, blank lines, and the final line break only.
-- Original source-database execution and run date were not independently observed.

WITH refunds_30d AS (
    SELECT DISTINCT
        r.order_item_id
    FROM order_item_refunds r
    JOIN order_items oi
        ON r.order_item_id = oi.order_item_id
    WHERE r.created_at >= oi.created_at
      AND r.created_at <= oi.created_at + INTERVAL '30 days'
)
SELECT
    DATE_TRUNC('month', oi.created_at)::date AS sale_month,
    oi.product_id,
    p.product_name,
    COUNT(oi.order_item_id) AS items_sold,
    COUNT(r.order_item_id) AS refunded_items_30d
FROM order_items oi
LEFT JOIN products p
    ON p.product_id = oi.product_id
LEFT JOIN refunds_30d r
    ON r.order_item_id = oi.order_item_id
WHERE oi.created_at >= DATE '2012-04-01'
  AND oi.created_at <  DATE '2015-03-01'
GROUP BY
    DATE_TRUNC('month', oi.created_at)::date,
    oi.product_id,
    p.product_name
ORDER BY
    sale_month,
    oi.product_id;
