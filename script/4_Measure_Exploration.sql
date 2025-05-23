/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/


-- Find the Total Sales
select sum(sales_amount)as Total_sales
from gold.fact_sales

-- find How many ites are sold
select sum(quantity) as Total_item_sold
from gold.fact_sales

-- Find the average selling price
select avg(price) as Average_price
from gold.fact_sales

-- Find the total number of orders
select count(distinct order_number) as number_of_order
from gold.fact_sales

--Find the total number of products
select count(product_key) as total_product
from gold.dim_products

--Find the total number of customers
select count(customer_key) as Total_customer
from gold.dim_customers
select count( distinct customer_key) as Total_customer
from gold.dim_customers

--Find the total number of customers that has placed an order
select count( distinct customer_key) as Total_customer
from gold.fact_sales 

--Generate a report thet show all key matrics of the business

select 'Total Sales' as Measure_Name,sum(sales_amount)as Measure_Value
from gold.fact_sales
union all
select 'Total Quantity' as Measure_Name,sum(quantity) as Measure_Value
from gold.fact_sales
union all
select 'Average Price' as Measure_Name,avg(price) as Measure_Value
from gold.fact_sales
union all
select 'Total Nr. Orders' as Measure_Name,count(distinct order_number) as Measure_Value
from gold.fact_sales
union all
select 'Total Nr. Product' as Measure_Name, count(product_key) as Measure_Value
from gold.dim_products
union all
select 'Total Nr. Customer' as Measure_Name,count( distinct customer_key) as Measure_Value
from gold.fact_sales



