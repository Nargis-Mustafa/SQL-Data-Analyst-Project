/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

 --Which 5 product generate the highest revenue
 select top 5  p.product_name,sum(s.sales_amount) as total_revunue
 from gold.fact_sales s
 left join gold.dim_products p
 on s.product_key=p.product_key
 group by p.product_name
 order by total_revunue desc
 
 -- what are the 5 worst performing product in term of sales?
  select  top 5 p.product_name,sum(s.sales_amount) as total_revunue
 from gold.fact_sales s
 left join gold.dim_products p
 on s.product_key=p.product_key
 group by p.product_name
 order by total_revunue 
