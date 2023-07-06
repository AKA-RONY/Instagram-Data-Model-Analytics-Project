create table customers2(
	customer_id serial primary key,
	customer_name varchar(50) not null,
	customer_email varchar(50) not null
);
INSERT INTO customers2 (customer_name, customer_email) VALUES
    ('John Doe', 'johndoe@example.com'),
    ('Jane Smith', 'janesmith@example.com'),
    ('Bob Johnson', 'bobjohnson@example.com');
create table orders2(
	order_id serial primary key,
	customer_id integer not null,
	order_date date not null,
	order_amount decimal(10,2) not null
);
INSERT INTO orders2 (customer_id, order_date, order_amount) VALUES
    (1, '2021-01-01', 50.00),
    (1, '2021-02-01', 75.00),
    (2, '2021-02-15', 125.00),
    (3, '2021-03-01', 200.00);


select * from customers2
select * from orders2

select customer_name from customers2 where customer_id in ( select customer_id from orders2 where order_amount>100)

select customer_name,customer_email,
(select count(*) from orders2 where orders2.customer_id= customers2.customer_id)as total_orders,
(select sum(order_amount) from orders2 where  orders2.customer_id=customers2.customer_id ) as total_amount
from customers2 

select customer_name ,
(select avg(order_amount)from orders2 where orders2.customer_id=customers2.customer_id 
group by customer_name) 
as avg_cus_amt from customers2

select customer_name , avg(order_amount) as avg_order_amt from
(select * from customers2 c inner join orders2 o on c.customer_id= o.order_id) 
as cus_orders group by customer_name

select customer_name, count(*) as total_orders from customers2 inner join orders2 on customers2.customer_id
=orders2.customer_id group by customer_name having count(*)>1



select customer_name , customer_email from customers2 
where customer_id in (select customer_id 
from orders2 where order_amount>100)

select customer_name,customer_email ,
(select count (*) from orders2 where 
 orders2.customer_id=customers2.customer_id) as order_count, 
 (select sum(order_amount) from orders2 where orders2.customer_id=customers2.customer_id )
 from customers2

select customer_name, 
(select avg(order_amount) from orders2 where orders2.customer_id=customers2.customer_id)
from customers2

SELECT customer_name, AVG(order_amount) as avg_order_amount
FROM (
    SELECT *
    FROM customers2
    INNER JOIN orders2 ON customers2.customer_id = orders2.customer_id
) AS cust_orders
GROUP BY customer_name;


select customer_name, count(*) from orders2 inner join customers2 on orders2.customer_id=customers2.customer_id 
group by customer_name
having  count(*) >1

select customer_name ,count(*) from orders2 inner join  customers2 on orders2.customer_id=customers2.customer_id
group by customer_name
having count(*)>1


select* from orders2
select*from customers2
   
----performing the same qtns with joiins
select  customer_name,customer_email,
order_amount from orders2 o inner join customers2 c on 
o.customer_id=c.customer_id where order_amount>100



with new_cte as(
	select name,salary 
	from employee 
	where salary>=50
)

select * from new_cte where salary>45000