-- Class 21: Analytical SQL, window functions, date logic, and deduplication
--
-- Before running:
-- MySQL:      USE retail_dw;
-- PostgreSQL: SET search_path TO retail;
-- Snowflake:  USE DATABASE RETAIL_DW; USE SCHEMA ANALYTICS;

-- 1. Rank orders by net amount.
SELECT
    order_id,
    customer_id,
    order_date,
    net_amount,
    RANK() OVER (ORDER BY net_amount DESC) AS revenue_rank
FROM vw_order_revenue
ORDER BY revenue_rank;

-- 2. Rank each customer's orders by recency.
SELECT
    order_id,
    customer_id,
    order_date,
    net_amount,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date DESC, order_id DESC
    ) AS customer_order_recency_rank
FROM vw_order_revenue
ORDER BY customer_id, customer_order_recency_rank;

-- 3. Running total by order date.
SELECT
    order_date,
    order_id,
    net_amount,
    SUM(net_amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_net_amount
FROM vw_order_revenue
ORDER BY order_date, order_id;

-- 4. Compare each order to the average order amount in its channel.
SELECT
    order_id,
    channel,
    net_amount,
    AVG(net_amount) OVER (PARTITION BY channel) AS average_channel_net_amount,
    net_amount - AVG(net_amount) OVER (PARTITION BY channel) AS amount_vs_channel_average
FROM vw_order_revenue
ORDER BY channel, net_amount DESC;

-- 5. Date logic with fixed dates.
SELECT
    order_id,
    order_date,
    order_status,
    net_amount
FROM vw_order_revenue
WHERE order_date >= '2026-07-05'
ORDER BY order_date, order_id;

-- 6. Deduplication pattern using ROW_NUMBER.
WITH duplicated_order_events AS (
    SELECT 1001 AS order_id, 'complete' AS order_status, '2026-07-01 09:30:00' AS updated_at
    UNION ALL SELECT 1001, 'complete', '2026-07-01 09:45:00'
    UNION ALL SELECT 1002, 'pending', '2026-07-02 10:10:00'
    UNION ALL SELECT 1002, 'complete', '2026-07-02 10:25:00'
),
ranked_events AS (
    SELECT
        order_id,
        order_status,
        updated_at,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY updated_at DESC
        ) AS row_num
    FROM duplicated_order_events
)
SELECT
    order_id,
    order_status,
    updated_at
FROM ranked_events
WHERE row_num = 1
ORDER BY order_id;

-- Practice:
-- Find the top order by net amount for each country.
-- Find the first order date for each customer.
-- Add a moving average of net amount using a window frame.

