# Write your MySQL query statement below
#select * from signups s left join confirmations c on s.user_id = c.user_id
select user_id, round(sum(case when action = "confirmed" then 1 else 0 end)/count(action),2) as confirmation_rate from confirmations group by user_id union select user_id, 0 as confirmation_rate from signups where user_id not in (select user_id from confirmations)