set search_path to retail;
show search_path;
select *
from customers
limit 5;

select count(*) as order_count
from orders;

select order_status, count(*) as order_count
from orders
group by order_status
order by order_count desc;

select country, segment, count(*) as customer_count
from customers
group by country, segment 
order by country, segment;

select 
	order_id,
	order_item_id,
	SUM (quantity * unit_price) as gross_amount,
	SUM (discount_amount) as discount_amount,
	SUM(quantity * unit_price - discount_amount) as net_amount
from order_items
group by order_id,order_item_id 
order by order_id;

select 	
	order_status,
	count(*) as order_count,
	sum(net_amount) as total_net_amount,
	avg(net_amount) as average_net_amount
from vw_order_revenue
group by order_status 
order by total_net_amount desc;

select 
	customer_id,
	count(*) as order_count,
	sum(net_amount) as total_net_amount
from vw_order_revenue
group by customer_id 
having count(*) >= 2
order by total_net_amount desc;

select 	
	order_date,
	count(*) as order_count,
	sum(net_amount) as total_net_amount
from vw_order_revenue
group by order_date 
order by order_date;

select
	products.category,
	count(*) as order_count,
	sum(order_items.quantity * products.unit_price) as gross_amount
from orders
join order_items on orders.order_id = order_items.order_id
join products on order_items.product_id = products.product_id
where order_status = 'complete'
group by category
order by gross_amount desc;

select 
	country,
	count(*) as completed_orders_count,
	sum(net_amount) as total_net_amount
from vw_order_revenue
where order_status = 'complete'
group by country 
order by total_net_amount desc;

select 
	channel,
	count(*) as order_count
from vw_order_revenue
group by channel
having count(*) > 2
order by order_count desc;