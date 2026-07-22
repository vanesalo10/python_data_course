-- Class 23: SQL data quality checks
--
-- Before running:
-- MySQL:      USE retail_dw;
-- PostgreSQL: SET search_path TO retail;
-- Snowflake:  USE DATABASE RETAIL_DW; USE SCHEMA ANALYTICS;

-- 1. Row count check.
SELECT
    'orders_row_count' AS check_name,
    COUNT(*) AS observed_value
FROM orders;

-- 2. Null check for primary key.
SELECT
    'orders_order_id_not_null' AS check_name,
    COUNT(*) AS failed_rows
FROM orders
WHERE order_id IS NULL;

-- 3. Duplicate primary key check.
SELECT
    'orders_order_id_unique' AS check_name,
    COUNT(*) AS duplicated_keys
FROM (
    SELECT order_id
    FROM orders
    GROUP BY order_id
    HAVING COUNT(*) > 1
) duplicated;

-- 4. Accepted values check.
SELECT
    'orders_status_accepted_values' AS check_name,
    order_status,
    COUNT(*) AS failed_rows
FROM orders
WHERE order_status NOT IN ('complete', 'cancelled', 'refunded', 'pending')
GROUP BY order_status;

-- 5. Referential integrity check: orders without a customer.
SELECT
    'orders_customer_fk' AS check_name,
    COUNT(*) AS failed_rows
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 6. Referential integrity check: order items without a product.
SELECT
    'order_items_product_fk' AS check_name,
    COUNT(*) AS failed_rows
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 7. Numeric range check.
SELECT
    'order_items_quantity_positive' AS check_name,
    COUNT(*) AS failed_rows
FROM order_items
WHERE quantity <= 0;

-- 8. Freshness check using a fixed expected minimum date.
SELECT
    'orders_freshness' AS check_name,
    MAX(CAST(order_ts AS DATE)) AS latest_order_date,
    CASE
        WHEN MAX(CAST(order_ts AS DATE)) >= '2026-07-08' THEN 'PASS'
        ELSE 'FAIL'
    END AS status
FROM orders;

-- 9. Reconciliation check: order item totals vs payment amount.
WITH order_item_totals AS (
    SELECT
        order_id,
        SUM(quantity * unit_price - discount_amount) AS calculated_net_amount
    FROM order_items
    GROUP BY order_id
)
SELECT
    t.order_id,
    t.calculated_net_amount,
    p.paid_amount,
    p.payment_status,
    t.calculated_net_amount - p.paid_amount AS difference
FROM order_item_totals t
JOIN payments p
    ON t.order_id = p.order_id
WHERE ABS(t.calculated_net_amount - p.paid_amount) > 0.01
  AND p.payment_status = 'settled'
ORDER BY t.order_id;

-- 10. Validation report pattern.
SELECT
    'orders_have_rows' AS check_name,
    'table' AS checked_object,
    COUNT(*) AS observed_value,
    0 AS expected_minimum,
    CASE WHEN COUNT(*) > 0 THEN 'PASS' ELSE 'FAIL' END AS status
FROM orders
UNION ALL
SELECT
    'orders_no_null_customer_id' AS check_name,
    'orders.customer_id' AS checked_object,
    COUNT(*) AS observed_value,
    0 AS expected_minimum,
    CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS status
FROM orders
WHERE customer_id IS NULL
UNION ALL
SELECT
    'payments_no_negative_amounts' AS check_name,
    'payments.paid_amount' AS checked_object,
    COUNT(*) AS observed_value,
    0 AS expected_minimum,
    CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS status
FROM payments
WHERE paid_amount < 0;

-- Practice:
-- Add a check for unexpected currencies.
-- Add a check for orders updated before they were created.
-- Add a check for complete orders without settled payments.

