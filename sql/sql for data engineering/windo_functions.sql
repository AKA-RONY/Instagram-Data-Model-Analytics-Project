CREATE TABLE sales2 (
  date DATE,
  salesperson VARCHAR(50),
  sales_amount INT
);
INSERT INTO sales2 (date, salesperson, sales_amount)
VALUES
  ('2022-01-01', 'Alice', 1000),
  ('2022-01-01', 'Bob', 1500),
  ('2022-01-02', 'Alice', 2000),
  ('2022-01-02', 'Bob', 2500),
  ('2022-01-03', 'Alice', 3000),
  ('2022-01-03', 'Bob', 3500),
  ('2022-01-04', 'Alice', 4000),
  ('2022-01-04', 'Bob', 4500),
  ('2022-01-05', 'Alice', 5000),
  ('2022-01-05', 'Bob', 5500);
  
  
  select* from sales2
  
  select
  date,
  salesperson,
  sales_amount,
  sum(sales_amount)
  over(partition by salesperson order by date)
  as running_total from sales2
  
  select
  date,
  salesperson,
  sales_amount,
  sum(sales_amount)
  over(partition by salesperson order by date)
  as running_total from sales2
   
  select salesperson,sum(sales_amount)
  from sales2 group by salesperson
  
  select 
  date,
  salesperson,
  sales_amount,
  100.0*sales_amount/sum(sales_amount)
  over(partition by salesperson order by date) as
  percentage_total from sales2
  
    
  select 
  date,
  salesperson,
  sales_amount,
  100.0*sales_amount/sum(sales_amount)
  over(partition by date order by date) as
  percentage_total from sales2
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  