# Write your MySQL query statement below
with expensive as (
    select *, row_number() over (partition by store_id order by price desc) as exprnk from (select * from inventory where store_id in (select store_id from inventory group by store_id having count(*) >= 3)) t
),
cheap as (
    select *, row_number() over (partition by store_id order by price) as cheaprnk from (select * from inventory where store_id in (select store_id from inventory group by store_id having count(*) >= 3)) t
)
select e.store_id,s.store_name, s.location, e.product_name as most_exp_product, c.product_name as cheapest_product, round(c.quantity/e.quantity,2) as imbalance_ratio from expensive e join cheap c on e.store_id = c.store_id and exprnk = 1 and cheaprnk = 1 join stores s on e.store_id = s.store_id group by e.store_id having imbalance_ratio > 1 order by imbalance_ratio desc, s.store_name