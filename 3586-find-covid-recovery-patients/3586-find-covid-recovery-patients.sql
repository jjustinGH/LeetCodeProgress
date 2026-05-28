# Write your MySQL query statement below
with pos as (
    select patient_id, case when result = "Positive" then test_date end as first_pos from covid_tests where result = "Positive" group by patient_id
),
neg as (
    select c.patient_id, case when c.result = "Negative" then c.test_date end as first_neg from covid_tests c join pos p on c.patient_id = p.patient_id and c.test_date > p.first_pos where result = "Negative" group by c.patient_id
)
select p.patient_id, pa.patient_name, pa.age, datediff(n.first_neg, p.first_pos) as recovery_time from pos p join neg n on p.patient_id = n.patient_id join patients pa on p.patient_id = pa.patient_id order by recovery_time, pa.patient_name