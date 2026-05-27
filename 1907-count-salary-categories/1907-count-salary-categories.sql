# Write your MySQL query statement below
with cat as 
    (select "Low Salary" as category union select "Average Salary" union select "High Salary"
)
select c.category, count(t.category) as accounts_count from cat c left join (select case when income < 20000 then "Low Salary" when income > 50000 then "High Salary" else "Average Salary" end as "category" from accounts) t on c.category = t.category group by c.category order by accounts_count desc