CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  salary NUMERIC,
  position VARCHAR(50)
);
INSERT INTO employee (name, age, salary, position) VALUES
('John Doe', 25, 2500, 'Developer'),
('Jane Smith', 30, 3500, 'Manager'),
('Bob Johnson', 45, 5000, 'Director'),
('Mike Brown', 22, 2000, 'Intern');

select name,salary,
case 
when salary>3000 then 'high'
when salary>2000 and salary<2999 then ' medium'
else 'low'
end as salary_range
from employee


select 
case 
when salary>3000 then 'high'
when salary>2000 and salary<2999 then ' medium'
else 'low'
end as salary_range,
count(*)
from employee
group by salary_range


select * from employee

select name,age,salary,
case
when salary<2500 and age<25 then 'jr.dev'
when salary between 2500 and 3500 and age between 25 and 35 then 'dev'
when salary>3500 and age>35 then 'sr.dev'
else 'other'
end as emp_group
from employee

