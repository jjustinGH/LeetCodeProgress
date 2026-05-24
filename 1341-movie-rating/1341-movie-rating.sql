# Write your MySQL query statement below
with rate_cnt as (
    select m.user_id, u.name, count(*) as rated_cnt from movierating m join users u on m.user_id = u.user_id group by m.user_id order by rated_cnt desc, u.name
),
top_rating as (
    select m.movie_id, mo.title, avg(m.rating) as toprating from movierating m join movies mo on m.movie_id = mo.movie_id where month(m.created_at) = 2 and year(m.created_at) = 2020 group by m.movie_id order by toprating desc, mo.title
)
select name as results from users where user_id = (select user_id from rate_cnt limit 1) union all select title from movies where movie_id = (select movie_id from top_rating limit 1)