# Write your MySQL query statement below
with active as(
    select user_id, plan_name, monthly_amount from subscription_events where (user_id, event_date) in (select user_id, max(event_date) from subscription_events group by user_id) and event_type != 'cancel' group by user_id having sum(event_type = 'downgrade') > 0
)
select s.user_id, a.plan_name as current_plan, a.monthly_amount as current_monthly_amount, max(s.monthly_amount) as max_historical_amount, datediff(max(s.event_date), min(s.event_date)) as days_as_subscriber from subscription_events s join active a on s.user_id = a.user_id group by s.user_id having current_monthly_amount / max_historical_amount < 0.5 and days_as_subscriber >= 60 order by days_as_subscriber desc, s.user_id