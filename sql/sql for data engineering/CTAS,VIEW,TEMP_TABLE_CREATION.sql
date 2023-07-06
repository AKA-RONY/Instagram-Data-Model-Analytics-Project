CREATE TABLE employees3 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary INTEGER NOT NULL
);

INSERT INTO employees3 (name, department, salary) VALUES
('John Doe', 'Sales', 50000),
('Jane Smith', 'Marketing', 60000),
('Bob Johnson', 'Finance', 70000),
('Karen Williams', 'Sales', 55000),
('Mike Johnson', 'Marketing', 65000),
('Sarah Lee', 'Finance', 75000),
('Swaa Lee', 'Finance', 95000);

select * from  employees3

--create concrete table using CTAS
create table sal_greater_70000 as
select* from employees3 where salary>70000
select *  from sal_greater_70000


--create view table
create view e3 as
(
select * from employees3 where name like 'J%'
)
select * from e3


-- creating temporary table from view table using CTAS
create  temp table temp1 as
(
	select * from e3
)
select * from temp1