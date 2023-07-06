CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  marks FLOAT(2)
);
INSERT INTO students (name, age, marks) VALUES
  ('John', 20, 78.5),
  ('Jane', 22, 89.2),
  ('Peter', 21, 92.3),
  ('Mary', 23, 86.7),
  ('David', 19, 73.9);
 
 select* from students
select name,cast(marks as integer) from students;
  SELECT *, CAST(marks AS INTEGER) FROM students;
select name,cast(age as text )from students

SELECT cast('2022-01-01' as date);
SELECT cast('2022-01-01' as timestamp);
SELECT cast('2022-01-01' as dfs ) AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' 

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    customer_name VARCHAR(255),
    total_amount NUMERIC(10,2)
);
INSERT INTO orders (order_date, customer_name, total_amount) VALUES
('2022-01-01 10:00:00', 'John Doe', 100.00),
('2022-01-02 12:30:00', 'Jane Smith', 200.50),
('2022-01-03 14:45:00', 'Bob Johnson', 50.25),
('2022-01-04 20:15:00', 'Sara Lee', 75.80);

select customer_name,cast (order_date as timestamp) as order_date_time from orders
select customer_name,order_date,cast( order_date as timestamp) at time zone 'UTC' at time zone 'America/New_York' as der_datetime_ny
from orders

select customer_name,cast(order_date as date ) as od from orders
select customer_name,cast(order_date as time ) as od from orders

select 
id,order_date,
extract(day from order_date)as order_day,
extract(month from order_date)as order_month,
extract(hour from order_date)as order_hour,
extract(min from order_date)as order_min,
extract(year from order_date)as order_year
from orders


select order_date at time zone 'utc' at time zone 'america/los_angeles' as o_d_pst from orders
