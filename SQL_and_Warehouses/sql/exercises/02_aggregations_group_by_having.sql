-- Class 19: SQL aggregations
--
-- Before running:
-- MySQL:      USE retail_dw;
-- PostgreSQL: SET search_path TO retail;
-- Snowflake:  USE DATABASE RETAIL_DW; USE SCHEMA ANALYTICS;

-- 1. Count all orders.
SELECT COUNT(*) AS order_count
FROM orders;

-- 2. Count orders by status.
SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 3. Count customers by country and segment.
SELECT
    country,
    segment,
    COUNT(*) AS customer_count
FROM customers
GROUP BY country, segment
ORDER BY country, segment;

-- 4. Calculate order item revenue.
SELECT
    order_id,
    SUM(quantity * unit_price) AS gross_amount,
    SUM(discount_amount) AS discount_amount,
    SUM(quantity * unit_price - discount_amount) AS net_amount
FROM order_items
GROUP BY order_id
ORDER BY order_id;

-- 5. Aggregate using the denormalized view.
SELECT
    order_status,
    COUNT(*) AS order_count,
    SUM(net_amount) AS total_net_amount,
    AVG(net_amount) AS average_net_amount
FROM vw_order_revenue
GROUP BY order_status
ORDER BY total_net_amount DESC;

-- 6. Use HAVING to filter groups.
SELECT
    customer_id,
    COUNT(*) AS order_count,
    SUM(net_amount) AS total_net_amount
FROM vw_order_revenue
GROUP BY customer_id
HAVING COUNT(*) >= 2
ORDER BY total_net_amount DESC;

-- 7. Aggregate by date.
SELECT
    order_date,
    COUNT(*) AS order_count,
    SUM(net_amount) AS total_net_amount
FROM vw_order_revenue
GROUP BY order_date
ORDER BY order_date;

-- Practice:
-- Which product category produced the most gross revenue?
-- Which country has the highest total net amount?
-- Which channel has more than two orders?

