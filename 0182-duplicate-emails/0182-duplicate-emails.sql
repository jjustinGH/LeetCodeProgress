# Write your MySQL query statement below
select distinct a.email as Email from Person A join Person B where A.id <> B.id and A.email = B.email