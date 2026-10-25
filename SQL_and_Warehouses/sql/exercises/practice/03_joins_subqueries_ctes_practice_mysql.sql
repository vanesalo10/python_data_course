USE retail_dw;

SELECT 
	o.order_id,
	o.order_ts,
	o.order_status,
	c.customer_name,
	c.segment,
	c.country
from orders o
join customers c
	on o.customer_id = c.customer_id 
order by o.order_id;

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

SELECT
    o.order_id,
    o.order_status,
    p.payment_status,
    p.paid_amount
FROM orders o 
LEFT JOIN payments p 
	ON o.order_id = p.order_id 
ORDER BY o.order_id;

SELECT 
	o.order_id,
	o.order_status,
	p.payment_id,
	p.payment_status
FROM orders o
LEFT JOIN payments p
	ON o.order_id = p.order_id
   AND p.payment_status = 'settled'
WHERE p.payment_id IS NULL
ORDER BY o.order_id;

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
	ON o.customer_id = o.customer_id 
ORDER BY r.net_amount DESC;

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

SELECT 
	o.order_id,
	o.order_status,
	p.payment_status 
FROM orders o
JOIN payments p
	ON o.order_id = p.order_id 
	AND (
		p.payment_status <> 'settled'
		OR p.payment_status IS NULL
	)
WHERE o.order_status = 'complete'
ORDER BY o.order_id;

SELECT 
	c.customer_id,
	c.customer_name,
	COALESCE(
		SUM(oi.quantity * oi.unit_price - oi.discount_amount), 0) AS net_amount
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id 
LEFT JOIN order_items oi
	ON o.order_id = oi.order_id 
GROUP BY 
	c.customer_id,
	c.customer_name 
ORDER BY net_amount DESC;

SELECT 
	p.product_id,
	p.product_name
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL
ORDER BY product_name;