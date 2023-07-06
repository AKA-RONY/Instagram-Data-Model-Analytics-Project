CREATE TABLE sales_data (
    id SERIAL PRIMARY KEY,
    date DATE,
    item TEXT,
    units_sold INTEGER,
    price_per_unit NUMERIC(10, 2)
);
INSERT INTO sales_data (date, item, units_sold, price_per_unit)
VALUES
    ('2021-01-01', 'apple', 10, 1.50),
    ('2021-01-02', 'banana', 20, 0.75),
    ('2021-01-03', 'orange', 15, 1.00),
    ('2021-01-04', 'apple', 12, 1.50),
    ('2021-01-05', 'banana', 18, 0.75),
    ('2021-01-06', 'orange', 20, 1.00),
    ('2021-01-07', 'apple', 8, 1.50),
    ('2021-01-08', 'banana', 22, 0.75),
    ('2021-01-09', 'orange', 10, 1.00);
	
	select date,item,units_sold,
	rank()over(order by units_sold desc),
	dense_rank()over(order by units_sold desc),
	row_number() over( order by units_sold desc )
	from sales_data
	
	select item,units_sold ,
	lag(units_sold) over( order by date) as 
	previous_units_sold from sales_data
	
	select date,item, units_sold,
	lead(units_sold)over (order by date) as next_item_sold
	from sales_data
	
	--What is the rank of each item based on the number of units sold in the "sales_data" table?
	select * from sales_data
	
	select item,units_sold,
	rank()over(order by units_sold desc),
	dense_rank() over( order by units_sold desc)
	from sales_data
	
	--What is the row number of each item based on the number of units sold in the "sales_data" table?
	select item,units_sold,
	row_number() over( order by units_sold desc )
	from sales_data
	
	--What is the previous day's unit sold for each item in the "sales_data" table?
	
	select item, units_sold,
	lag(units_sold)over (order by date) as previous_unit
	from sales_data
	
	--What is the next day's unit sold for each item in the "sales_data" table?
	
	select item,units_sold,
	lead(units_sold)over (order by date )
	from sales_data
	
	
	