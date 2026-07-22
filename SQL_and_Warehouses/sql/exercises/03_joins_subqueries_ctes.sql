-- Class 20: Joins, subqueries, and CTEs
--
-- Before running:
-- MySQL:      USE retail_dw;
-- PostgreSQL: SET search_path TO retail;
-- Snowflake:  USE DATABASE RETAIL_DW; USE SCHEMA ANALYTICS;

-- 1. Inner join orders to customers.
SELECT
    o.order_id,
    o.order_ts,
    o.order_status,
    c.customer_name,
    c.segment,
    c.country
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- 2. Join through order_items to products.
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price - oi.discount_amount AS net_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id, oi.order_item_id;

-- 3. Left join orders to payments.
SELECT
    o.order_id,
    o.order_status,
    p.payment_status,
    p.paid_amount
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
ORDER BY o.order_id;

-- 4. Anti-join pattern: orders without settled payments.
SELECT
    o.order_id,
    o.order_status,
    p.payment_status
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
   AND p.payment_status = 'settled'
WHERE p.payment_id IS NULL
ORDER BY o.order_id;

-- 5. Subquery: customers with at least two orders.
SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
);

-- 6. CTE: compute revenue first, then join to customer details.
WITH order_revenue AS (
    SELECT
        order_id,
        SUM(quantity * unit_price - discount_amount) AS net_amount
    FROM order_items
    GROUP BY order_id
)
SELECT
    o.order_id,
    c.customer_name,
    c.country,
    r.net_amount
FROM order_revenue r
JOIN orders o
    ON r.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY r.net_amount DESC;

-- 7. CTE chain: revenue by category.
WITH line_items AS (
    SELECT
        p.category,
        oi.quantity * oi.unit_price - oi.discount_amount AS net_amount
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
),
category_revenue AS (
    SELECT
        category,
        SUM(net_amount) AS total_net_amount
    FROM line_items
    GROUP BY category
)
SELECT *
FROM category_revenue
ORDER BY total_net_amount DESC;

-- Practice:
-- Find complete orders whose payment is not settled.
-- Find each customer's total order amount.
-- Find products that have never been sold.

