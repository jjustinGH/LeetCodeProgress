# Write your MySQL query statement below
with cnt as (
    select user_id, reaction, count(*) as total from reactions group by reaction, user_id order by user_id, total desc
)
select user_id, reaction as dominant_reaction, round(total / sum(total),2) as reaction_ratio from cnt group by user_id having sum(total) >= 5 and reaction_ratio >= 0.6 order by reaction_ratio desc, user_id