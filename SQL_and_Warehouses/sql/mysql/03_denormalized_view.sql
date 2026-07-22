USE retail_dw;

CREATE OR REPLACE VIEW vw_order_revenue AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.segment,
    c.country,
    CAST(o.order_ts AS DATE) AS order_date,
    o.order_status,
    o.channel,
    o.currency,
    COUNT(DISTINCT oi.order_item_id) AS item_count,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price) AS gross_amount,
    SUM(oi.discount_amount) AS discount_amount,
    SUM(oi.quantity * oi.unit_price - oi.discount_amount) AS net_amount,
    MAX(p.payment_status) AS payment_status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
LEFT JOIN payments p
    ON o.order_id = p.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.segment,
    c.country,
    CAST(o.order_ts AS DATE),
    o.order_status,
    o.channel,
    o.currency;

