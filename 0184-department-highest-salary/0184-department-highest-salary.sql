# Write your MySQL query statement below
with view as (select *, dense_rank() over (partition by departmentid order by salary desc) as rankss from employee)
select d.name as department, v.name as employee, v.salary from view v join department d on v.departmentid = d.id where rankss = 1
