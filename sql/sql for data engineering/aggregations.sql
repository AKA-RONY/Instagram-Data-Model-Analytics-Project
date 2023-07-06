CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    sales_date DATE,
    sales_amount NUMERIC(10,2)
);
INSERT INTO sales (product_name, sales_date, sales_amount)
VALUES
    ('Product A', '2022-01-01', 100.50),
    ('Product B', '2022-01-01', 150.25),
    ('Product C', '2022-01-02', 75.00),
    ('Product A', '2022-01-02', 50.75),
    ('Product B', '2022-01-03', 200.00),
    ('Product C', '2022-01-03', 125.50);
	
select * from sales


select product_name, sum(sales_amount) from sales group by product_name
select product_name,avg(sales_amount) from sales group by product_name
select product_name,count(product_name) from sales group by product_name
select product_name,max(sales_amount) from sales group by 
product_name order by max(sales_amount)  desc limit 1
select product_name,max(sales_amount) from sales group by product_name
select product_name, min(sales_amount)from sales group by product_name 
--SELECT product_name, MAX(sales_amount) AS maximum_sales_amount, MIN(sales_amount) AS minimum_sales_amount
--FROM sales
--GROUP BY product_name;
select sales_date , sum(sales_amount) from sales group by sales_date
select sales_date, avg(sales_amount) from sales group by sales_date
select sales_date,count(*) from sales group by sales_date
select sales_date, max(sales_amount) , min(sales_amount) from sales  group by sales_date
select product_name,sales_date, sum(sales_amount) from sales group by (sales_date, product_name)
select product_name, sales_date , avg(sales_amount) from sales group by sales_date,product_name
select product_name, sales_date, count(*) from sales group by sales_date, product_name
select product_name,sales_date,max(sales_amount),min(sales_amount) from sales group by  sales_date, product_name