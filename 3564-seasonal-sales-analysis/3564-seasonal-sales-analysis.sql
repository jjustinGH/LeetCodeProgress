# Write your MySQL query statement below
select season, category, total_quantity, total_revenue from (
select  
case when month(s.sale_date) = 12 or month(s.sale_date) between 1 and 2 then 'Winter'
when month(s.sale_date) between 3 and 5 then 'Spring'
when month(s.sale_date) between 6 and 8 then 'Summer'
when month(s.sale_date) between 9 and 11 then 'Fall' end as season,
p.category, sum(s.quantity) as total_quantity, sum(s.price * s.quantity) as total_revenue
from sales s join products p on s.product_id = p.product_id group by season,p.category order by sum(s.quantity) desc, total_revenue desc, p.category
) t group by season order by season