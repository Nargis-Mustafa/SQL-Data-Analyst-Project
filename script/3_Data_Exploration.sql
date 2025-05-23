/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months

select min(order_date) as first_order,
max(order_date) as Last_order,
datediff(year,min(order_date),max(order_date)) as Total_year
from gold.fact_sales


-- Find the youngest and oldest customer based on birthdate

select max(birthdate) as youngest_customer,
datediff(year,max(birthdate),getdate()) as Youngest_customer_age,
min(birthdate) as oldest_customer,
datediff(year,min(birthdate),getdate()) as Oldest_customer_age
from gold.dim_customers
