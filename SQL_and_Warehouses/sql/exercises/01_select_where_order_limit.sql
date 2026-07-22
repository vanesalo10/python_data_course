-- Class 18: SQL basics
--
-- Before running:
-- MySQL:      USE retail_dw;
-- PostgreSQL: SET search_path TO retail;
-- Snowflake:  USE DATABASE RETAIL_DW; USE SCHEMA ANALYTICS;

-- 1. See all customers.
SELECT *
FROM customers;

-- 2. Select specific columns.
SELECT
    customer_id,
    customer_name,
    segment,
    country
FROM customers;

-- 3. Filter rows with WHERE.
SELECT
    customer_id,
    customer_name,
    country
FROM customers
WHERE country = 'Colombia';

-- 4. Filter with multiple conditions.
SELECT
    order_id,
    customer_id,
    order_status,
    channel,
    order_ts
FROM orders
WHERE order_status = 'complete'
  AND channel = 'web';

-- 5. Use IN for a list of values.
SELECT
    order_id,
    order_status,
    channel
FROM orders
WHERE order_status IN ('complete', 'refunded');

-- 6. Use BETWEEN for ranges.
SELECT
    order_id,
    order_ts,
    order_status
FROM orders
WHERE order_ts BETWEEN '2026-07-03 00:00:00' AND '2026-07-05 23:59:59';

-- 7. Sort results.
SELECT
    product_id,
    product_name,
    category,
    unit_price
FROM products
ORDER BY unit_price DESC;

-- 8. Limit results.
SELECT
    product_id,
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 3;

-- 9. Create aliases and expressions.
SELECT
    order_item_id,
    order_id,
    quantity,
    unit_price,
    discount_amount,
    quantity * unit_price AS gross_amount,
    quantity * unit_price - discount_amount AS net_amount
FROM order_items
ORDER BY order_id, order_item_id;

-- Practice:
-- Find all active Technology products priced above 50.
-- Find all orders from the store channel.
-- Return the five most recent orders.

