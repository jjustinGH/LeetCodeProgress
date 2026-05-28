# Write your MySQL query statement below
with ranked as (
    select employee_id, rating, row_number() over(partition by employee_id order by review_date desc) as rnk from performance_reviews
),
score as (
    select employee_id, sum(case when rnk = 1 then rating end) as r1, sum(case when rnk = 2 then rating end) as r2, sum(case when rnk = 3 then rating end) as r3 from ranked group by employee_id having count(rnk) >= 3 and r1 > r2 and r2 > r3 and r1 - r3 > 0
)
select s.employee_id, e.name, r1-r3 as improvement_score from score s join employees e on s.employee_id = e.employee_id order by improvement_score desc, e.name
