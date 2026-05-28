# Write your MySQL query statement below
with view as (
    select employee_id, sum(duration_hours) as total, yearweek(meeting_date, 1) as weeks from meetings group by employee_id, weeks having total > 20
)
select v.employee_id, e.employee_name, e.department, count(distinct v.weeks) as meeting_heavy_weeks from view v join employees e on v.employee_id = e.employee_id group by employee_id having meeting_heavy_weeks > 1 order by meeting_heavy_weeks desc, e.employee_name