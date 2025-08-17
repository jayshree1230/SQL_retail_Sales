SELECT * FROM sql_porject_p2.retail_sales_analysis;
select count(*) from retail_sales_analysis;
select * from retail_sales_analysis 
where sale_time is Null
or customer_id is Null
or gender is Null
or age is Null
or category is Null
or quantiy is Null
or price_per_unit is Null
or cogs is Null
or total_sale;

/* Data Exploration
--how many unique customers we have? */
select count(distinct customer_id) as total_sales from retail_sales_analysis;

/* how many category we have*/
select distinct category as Category from retail_sales_analysis;

/*Data Analysis & Business key Problems & Answers*
Q1-write an sql query to retrive all columns for sales made on '2022-11-05'*/

select * from retail_sales_analysis
where sale_date='2022-11-05';

/*write a sql query to retrive all the transactions where thw category is 'clothing' & quantity sold is more than 10 in the month of Nov-2022*/

select * from retail_sales_analysis
where category='Clothing' and quantiy>=4
and date_format(sale_date,'YYYY-MM')='2022-11';

/*write sql query to calculate the total sales for each category*/
select category, sum(total_sale) as TotalSales, count(*) as total_Orders from retail_sales_analysis
group by category;

/*Q4 write a sql query to find the average of customers who purchased items from beauty category*/
select round(avg(age)) as Average_age from retail_sales_analysis
where category='beauty';

/*write a sql query to find all transactions where the total-Sale is greather than 1000*/

select * from retail_sales_analysis
where total_sale>1000;

/*write a sql query to find  the total number of transactions made by each gender in each category*/

select  category,gender, count(transactions_id) As Transactions from retail_sales_analysis
group by gender,category
order by category;

/* write a sql query to calculate the average sale for each month. find out the best selling month in each year*/

select year(sale_date) As Year,month(sale_date) As Month,
avg(total_sale) as average_sale
from retail_sales_analysis
group by year,month
order by year,average_sale Desc;

/* write sql query to find the top 5 customers based on highest total sales*/

select customer_id,
sum(total_sale) as TotalSale
from retail_sales_analysis
group by customer_id
order by TotalSale Desc limit 5;

/* write a sql query to find the number of unique customers who puchased items from each category*/

select category, 
count(distinct customer_id)from retail_sales_analysis
group by category;

/* write a sql query to create each shift and no of orders*/
SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS no_of_orders
FROM retail_sales_analysis
GROUP BY shift
ORDER BY no_of_orders DESC;

/*end of project
