create database sql_project_p1;

 CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,          
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT * FROM retail_sales;

--DATA CLEANING  (START)

--to see if there is null value in data 

SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
	OR
    sale_date IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL 
	OR 
	price_per_unit IS NULL
	OR
	cogs  IS NULL
	OR
	total_sale IS NULL
	OR 
	sale_time IS NULL;
	

-- DELETE THE ROWS HAVING NULL VALUES

DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
	OR
    sale_date IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL 
	OR 
	price_per_unit IS NULL
	OR
	cogs  IS NULL
	OR
	total_sale IS NULL
	OR 
	sale_time IS NULL;

--DATA CLEANING (END)


--DATA EXPLORATION (START)

--HOW MUCH SALES DO WE HAVE ?
SELECT COUNT(*) AS total_sales FROM retail_sales ;

--HOW MUCH CUSTOMER WE HAVE ?
SELECT COUNT(DISTINCT customer_id) AS total_sales FROM retail_sales ;

--HOW MUCH CATEGORY DO WE HAVE ??

SELECT DISTINCT category FROM retail_sales;


--DATA ANALYSIS AND BUISNESS KEY PROBLEMS AND ANSWERS 
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM retail_sales
WHERE sale_date='2022-11-05'

--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of nov-2022 

SELECT *
from retail_sales 
where category='Clothing'
AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
AND quantiy>= 4 

group by category ;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 

SELECT category,SUM(total_sale)
FROM retail_sales
GROUP BY  category ;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT ROUND(AVG(age),2) as avg_age 
FROM retail_sales

WHERE category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT  transactions_id as all_transactions
FROM retail_sales 
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT category ,gender ,COUNT (transactions_id) AS txn_no
FROM retail_sales
GROUP BY category,gender


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select 
extract (YEAR FROM sale_date) as year,
extract (MONTH FROM sale_date) as month  ,
avg(total_sale) as avg_sale
from retail_sales
group by year,month 
order by year, month 

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select DISTINCT(customer_id),SUM(total_sale) as spent
from retail_sales  
group by customer_id
order by spent desc
limit 3 

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT COUNT(DISTINCT customer_id) ,category
FROM retail_sales
GROUP BY category 






















