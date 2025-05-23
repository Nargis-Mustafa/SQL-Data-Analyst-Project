/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/

-- Which categories contribute the most to overall sales?
with category_sales as (
 select 
 category,
 sum(f.sales_amount) as total_sales
 from gold.fact_sales f
 left join gold.dim_products p
 on f.product_key=p.product_key
 group by category)

 select
 category,
 total_sales,
 sum( total_sales)over()as over_all_sale,
 concat(round((cast(total_sales as float)/sum( total_sales)over())*100,2),'%')  as percentage_of_total
 from category_sales
 order by total_sales desc 
