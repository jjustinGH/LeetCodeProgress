# Write your MySQL query statement below
SELECT e.name as Employee from Employee e Join Employee m where e.managerId = m.id and e.salary > m.salary