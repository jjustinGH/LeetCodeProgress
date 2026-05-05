# Write your MySQL query statement below
select max(nums) as num from (select num as nums from mynumbers group by num having count(*) = 1) t