use sql_store;
select
	c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    oi.quantity,
    oi.unit_price,
    (quantity*unit_price) as invoice,
    o.status as status_id,
    os.name as order_status
from customers c
join orders o on
	c.customer_id=o.customer_id
join order_statuses os on
	o.status=os.order_status_id
join order_items oi on
	o.order_id=oi.order_id

order by customer_id
