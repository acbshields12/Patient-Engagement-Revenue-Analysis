create database Patient_Engagement;
use Patient_Engagement;

create table patient_data (
patient_id int,
visit_id int,
first_name Varchar (25),
last_name varchar (25),
gender varchar (25),
age int,
department varchar (50),
visit_date date,
state varchar (50),
doctor varchar (50),
appointment_status varchar (50),
revenue decimal(10,2),
full_name varchar (50),
returning_patient varchar (25),
age_group varchar (25)
);

select *
from patient_data;

-- Total Patients --
select count(distinct patient_id) as total_patients
from patient_data;

-- Total Visits --
select count(visit_id) as total_visits
from patient_data;

-- Total Revenue --
select sum(revenue)
from patient_data;

-- No-Show Rate --
select
round(sum(case when appointment_status = 'No-Show' then 1 else 0 end) / count(*) *100,2) as no_show_rate_percentage
from patient_data;

-- Total Revenue per State --
select state, sum(revenue) as total_revenue_state
from patient_data
group by state
order by total_revenue_state Desc;

-- Monthly Revenue Trend --
select
date_format(visit_date, '%y-%m') as 'Month',
sum(revenue) as monthly_revenue
from patient_data
where appointment_status = 'Completed'
group by date_format(visit_date, '%y-%m')
order by date_format(visit_date, '%y-%m');

-- Returning Patients --
select count(*) as returning_patient
from (
	select patient_id 
    from patient_data
    group by patient_id
    having count(visit_id) > 1
) as sub;

-- Top Doctors by Revenue --
select doctor, sum(revenue) as total_revenue
from patient_data
where appointment_status = "Completed"
group by doctor
order by total_revenue desc;

-- No Show Status by State --
select state, count(appointment_status) as no_show
from patient_data
where appointment_status = 'No-Show'
group by state;