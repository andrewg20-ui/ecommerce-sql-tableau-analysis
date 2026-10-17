-- PostgreSQL: observed repeat purchase within 90 days of first recorded order.
-- Export the result, with column headers, as repeat_purchase_cohorts.csv.
-- Cohort window: 2012-04-01 inclusive to 2014-12-01 exclusive.
-- Follow-up orders: all recorded orders before 2015-03-01.
-- Sequence the full available history BEFORE limiting first-purchase cohorts.
-- This preserves earlier buyers' first recorded purchase dates.
-- Non-null user_id is treated as a customer; unique order_id is assumed.
-- A second distinct order at the same timestamp qualifies.
-- Orders are included even if subsequently refunded.
-- Export additive counts; calculate the weighted rate in Tableau.
-- Expected from Andrew's prior results, pending export validation:
-- 32 rows, 24,105 customers, 439 repeat customers (1.82% overall).

WITH purchase_sequence AS (
    SELECT
        user_id,
        created_at,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY created_at, order_id
        ) AS purchase_number,
        LEAD(created_at) OVER (
            PARTITION BY user_id
            ORDER BY created_at, order_id
        ) AS next_purchase_at
    FROM orders
    WHERE created_at < TIMESTAMP '2015-03-01'
      AND user_id IS NOT NULL
)
SELECT
    DATE_TRUNC('month', created_at)::date AS first_purchase_month,
    COUNT(*) AS customers,
    COUNT(*) FILTER (
        WHERE next_purchase_at <= created_at + INTERVAL '90 days'
    ) AS repeat_customers_90d
FROM purchase_sequence
WHERE purchase_number = 1
  AND created_at >= TIMESTAMP '2012-04-01'
  AND created_at < TIMESTAMP '2014-12-01'
GROUP BY 1
ORDER BY 1;
