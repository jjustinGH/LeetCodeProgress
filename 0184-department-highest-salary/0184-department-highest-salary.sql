# Write your MySQL query statement below
select d.name as department, e.name as employee, e.salary from employee e left join department d on e.departmentid = d.id where (e.departmentid, e.salary) in (select departmentid, max(salary) from employee group by departmentid )
