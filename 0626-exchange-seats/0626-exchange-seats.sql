# Write your MySQL query statement below
with temp as (
    select id, student from seat
)
select id, case when id in (select max(id) from seat) and id % 2 <> 0 then student when id % 2 = 0 then (select student from temp where temp.id = seat.id - 1) else (select student from temp where temp.id = seat.id + 1) end as student from seat