SELECT *
FROM retail_dw.customers; 

SELECT 
	customer_id, 
	customer_name,
	segment,
	country
FROM customers;

SELECT 
	customer_id,
	customer_name,
	country 
FROM customers
WHERE country = 'Colombia';

SELECT 
	order_id,
	customer_id ,
	order_status ,
	channel ,
	order_ts 
FROM orders
WHERE order_status = 'complete'
	AND channel = 'web';

SELECT 
	order_id ,
	order_status ,
	channel 
FROM orders
WHERE order_status IN ('complete', 'refunded');

SELECT order_ts 
FROM orders
LIMIT 1;

SELECT 
	order_id ,
	order_ts ,
	order_status 
FROM orders 
WHERE order_ts 
	BETWEEN '2026-07-03 00:00:00' 
	AND '2026-07-05 23:59:59';

SELECT 
	product_id,
	product_name,
	category,
	unit_price
FROM products 
ORDER BY unit_price DESC;

SELECT 
	product_id,
	product_name,
	unit_price
FROM products 
ORDER BY unit_price DESC 
LIMIT 3;

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

SELECT *
FROM products
WHERE category = 'Technology'
	AND active_flag = 1
	AND unit_price > 50;

SELECT order_id, customer_id, channel
FROM orders 
WHERE channel = 'store';

SELECT order_id, order_ts, created_at, updated_at
FROM orders
ORDER BY order_ts DESC
LIMIT 5;


SELECT
    order_status,
    COUNT(*) 
FROM orders
GROUP BY order_status
ORDER BY COUNT(*) DESC;