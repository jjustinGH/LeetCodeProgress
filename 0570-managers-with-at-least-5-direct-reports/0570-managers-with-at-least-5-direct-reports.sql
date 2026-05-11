# Write your MySQL query statement below
select name from employee where id in (select distinct managerid from employee group by managerid having count(managerid) >= 5)