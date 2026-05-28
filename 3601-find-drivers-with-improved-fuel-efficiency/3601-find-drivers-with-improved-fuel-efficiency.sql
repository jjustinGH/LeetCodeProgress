# Write your MySQL query statement below
with view as (
    select driver_id, avg(case when month(trip_date) between 1 and 6 then distance_km / fuel_consumed end) as first_half_avg, avg(case when month(trip_date) between 7 and 12 then distance_km / fuel_consumed end) as second_half_avg from trips group by driver_id
)
select v.driver_id, d.driver_name, round(v.first_half_avg,2) as first_half_avg, round(v.second_half_avg,2) as second_half_avg, round(v.second_half_avg - v.first_half_avg,2) as efficiency_improvement from view v join drivers d on v.driver_id = d.driver_id where v.first_half_avg is not null and v.second_half_avg is not null and v.second_half_avg - v.first_half_avg > 0 order by efficiency_improvement desc, d.driver_name