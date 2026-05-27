# Write your MySQL query statement below
with pairs as (
    select a.product_id as product1_id, b.product_id as product2_id, count(a.user_id) as customer_count from productpurchases a join productpurchases b on a.user_id = b.user_id and a.product_id < b.product_id group by product1_id, product2_id having count(a.user_id) >= 3
)
select p.product1_id, p.product2_id, pi1.category as product1_category, pi2.category as product2_category, p.customer_count from pairs p join productinfo pi1 on p.product1_id = pi1.product_id join productinfo pi2 on p.product2_id = pi2.product_id order by customer_count desc, product1_id, product2_id