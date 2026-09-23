set search_path to retail;

select 
	order_id,
	customer_id,
	order_date,
	net_amount,
	rank() over (order by net_amount desc) as revenue_rank
from vw_order_revenue
order by revenue_rank;

select 
	customer_id,
	customer_name,
	order_id,
	order_date,
	rank() over(
		partition by customer_id 
		order by order_date desc
	) as customer_order_recency_rank
from vw_order_revenue
order by customer_id, customer_order_recency_rank;

select 		
	order_date,
	order_id,
	net_amount,
	SUM(net_amount) over(
		order by order_date, order_id
		rows between unbounded preceding and current row
	) as running_net_amount
from vw_order_revenue
order by order_date, order_id;

SELECT
    order_id,
    channel,
    net_amount,
    AVG(net_amount) OVER (PARTITION BY channel) AS average_channel_net_amount,
    net_amount - AVG(net_amount) OVER (PARTITION BY channel) AS amount_vs_channel_average
FROM vw_order_revenue
order by channel, net_amount desc;

select 	
	order_id,
	order_date,
	order_status,
	net_amount
from vw_order_revenue
where order_date >= '2026-07-05'
order by order_date, order_id;

WITH duplicated_order_events AS (
    SELECT 1001 AS order_id, 'complete' AS order_status, '2026-07-01 09:30:00' AS updated_at
    UNION ALL SELECT 1001, 'complete', '2026-07-01 09:45:00'
    UNION ALL SELECT 1002, 'pending', '2026-07-02 10:10:00'
    UNION ALL SELECT 1002, 'complete', '2026-07-02 10:25:00'
),
ranked_events as (
	select 
		order_id,
		order_status,
		updated_at,
		row_number() over(
			partition by order_id
			order by updated_at desc
		) as row_num
	from duplicated_order_events
)
select
	order_id,
	order_status,
	updated_at
from ranked_events
where row_num = 1
order by order_id;

with ranked_orders as(
	select
		order_id,
		country,
		net_amount,
		row_number() over(
			partition by country
			order by net_amount desc
		) as row_num
	from vw_order_revenue
)
select
	order_id,
	country,
	net_amount
from ranked_orders
where row_num = 1
order by net_amount desc;

with ranked_orders as (
	select 
		order_id,
		order_date,
		customer_id,
		customer_name,
		row_number() over(
			partition by customer_id
			order by order_date
		) as row_num
	from vw_order_revenue
)
select 
	order_id,
	order_date,
	customer_id,
	customer_name
from ranked_orders 
where row_num = 1
order by customer_id;

SELECT
    order_date,
    order_id,
    net_amount,
    AVG(net_amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM vw_order_revenue
ORDER BY order_date, order_id;








