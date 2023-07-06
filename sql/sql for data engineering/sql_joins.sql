select* from customers
select * from orders
select * from customers full outer join orders on customers.id=orders.customer_id

select c.name,c.email from customers c inner join orders o on c.id=o.customer_id where o.product ='iPhone'

select customers.name,count(orders.id) as num_orders from customers  left join orders 
on customers.id=orders.customer_id group by customers.name order by num_orders desc


select product ,sum(quantity *price) as revenue from orders group by product order by revenue desc


select customers.name,customers.email from customers full outer join orders on  customers.id=orders.customer_id
where orders.id is NULL

insert into customers values(6,'rony','salvikbhowal444@gmail.com')

SELECT customers.name, customers.email
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.id IS NULL;


select * from employees
select * from salaries
select * from employees full outer join salaries on employees.id= salaries.employee_id
select* from employee_tab2


select e.name,e.salary,m.name,m.salary from employee e left join employee m on e.mgr_id=m.emp_id

select e.name,e.salary,m.name,m.salary from employee e left join employee m on e.mgr_id=m.emp_id

select e.name,e.salary from employee e inner join employee  m on e.mgr_id=m.emp_id  where e.salary>m.salary


