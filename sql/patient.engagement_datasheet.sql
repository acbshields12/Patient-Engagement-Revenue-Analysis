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

-- ENGAGEMENT / RETENTION ANALYSIS --

-- Total Patients --
select count(distinct patient_id) as total_patients
from patient_data;

-- Total Visits --
select count(visit_id) as total_visits
from patient_data;

-- Returning Patients --
select count(*) as returning_patient
from (
	select patient_id 
    from patient_data
    group by patient_id
    having count(visit_id) > 1
) as sub;

-- New Patients --
select count(*) as new_patient
from (
	select patient_id 
    from patient_data
    group by patient_id
    having count(visit_id) = 1
) as sub;

-- No-Show Rate --
select
round(sum(case when appointment_status = 'No-Show' then 1 else 0 end) / count(*) *100,2) as no_show_rate_percentage
from patient_data;

-- Visits per Patients --
select patient_id, count(visit_id) as visit_count
from patient_data
group by patient_id
order by visit_count desc;

-- CATEGORY / GROUP DISTRIBUTION --

-- Revenue by Department --
select department, sum(revenue) as total_revenue
from patient_data
where appointment_status = 'Completed'
group by department
order by total_revenue desc;

-- Visits per Department --
select department, count(visit_id) as total_visits
from patient_data
group by department
order by total_visits Desc;

-- Controbution %  by Department --
select 
department, 
sum(revenue) as revenue,
round(sum(revenue) / (select sum(revenue) from patient_data) * 100, 2) as contribution_percent
from patient_data
where appointment_status = 'Completed'
group by department;

-- REGIONAL / HIERARCHICAL RANKING --

-- Total Revenue per State --
select state, sum(revenue) as total_revenue_state
from patient_data
group by state
order by total_revenue_state Desc;

-- Ranking States --
select state,sum(revenue) as total_revenue,
rank() over(order by sum(revenue) desc) as state_rank
from patient_data
group by state;

-- Top Doctors by Revenue --
select doctor, sum(revenue) as total_revenue
from patient_data
where appointment_status = "Completed"
group by doctor
order by total_revenue desc;

-- Doctor Ranking --
select doctor,
sum(revenue) as total_revenue,
rank() over (order by sum(revenue) desc) as doctor_rank
from patient_data
group by doctor;

-- TEMPORAL GROWTH / TREND ANALYSIS --

-- Monthly Revenue Trend --
select
date_format(visit_date, '%y-%m') as 'Month',
sum(revenue) as monthly_revenue
from patient_data
where appointment_status = 'Completed'
group by date_format(visit_date, '%y-%m')
order by date_format(visit_date, '%y-%m');

-- Monthly Visit Trend --
select 
date_format(visit_date, '%y-%m') as 'Month',
count(visit_id) as monthly_visits
from patient_data
group by date_format(visit_date, '%y-%m')
order by date_format(visit_date, '%y-%m');

-- Monthly No Show Trend --
select
date_format(visit_date, '%y-%m') as 'Month',
count(*) as total_appointments,
sum(case
when appointment_status = 'No-Show' 
then 1
else 0
end) as no_shows,
round(sum(case
when appointment_status = "No-Show"
then 1
else 0
end) / count(*) * 100, 2) as no_show_rate
from patient_data
group by date_format(visit_date, '%y-%m')
order by date_format(visit_date, '%y-%m');

-- Trend by Department --
select
date_format(visit_date, '%y-%m') as 'Month',
department, sum(revenue) as revenue
from patient_data
group by date_format(visit_date, '%y-%m'), department
order by date_format(visit_date, '%y-%m');

-- Average Revenue Trend --
select
date_format(visit_date, '%y-%m') as 'Month',
round(avg(revenue),2) as avg_revenue
from patient_data
where appointment_status = 'Completed'
group by date_format(visit_date, '%y-%m')
order by date_format(visit_date, '%y-%m');

-- Quarterly Analysis --
select 
concat(year(visit_date), '-Q', quarter(visit_date)) as 'quarter',
sum(revenue) as revenue
from patient_data
group by concat(year(visit_date), '-Q', quarter(visit_date))
order by concat(year(visit_date), '-Q', quarter(visit_date));

-- Year-over-Year Growth --
select year(visit_date) as 'Year',
sum(revenue) as revenue
from patient_data
group by year(visit_date)
order by year(visit_date);

-- Other Quries --
-- Total Revenue --
select sum(revenue) as total_revenue
from patient_data;

-- Total Visit per Gender --
select gender, count(visit_id) as total_visit_male
from patient_data
where gender = 'Male'
group by gender;

select gender, count(visit_id) as total_visit_female
from patient_data
where gender = 'Female'
group by gender;

-- Completed Appointment Status --
select count(appointment_status) as completed
from patient_data
where appointment_status = 'Completed';

-- No Show Status --
select count(appointment_status) as no_show
from patient_data
where appointment_status = 'No-Show';

-- No Show Rate --
select 
Appointment_Status,
cOUNT(*) as 'No Show Rate'
from patient_data
group by Appointment_Status;

-- Total Patient of Dr. Brain in New York --
select doctor, count(patient_id) as total_patients
from patient_data
where doctor = 'Dr. Brain' and state = 'New York'
group by doctor
;

-- Revenue per Patient --
select patient_id,
sum(revenue) as total_spent
from patient_data
group by patient_id
order by total_spent desc;

-- No show by Department --
select department, count(*) as no_show_count
from patient_data
where appointment_status = 'No-Show'
group by department;

-- Average Revenue per Visits --
select round(avg(revenue), 2) as avg_revenue
from patient_data
where appointment_status = 'Completed';

-- Top 5 States by Visits --
select state,
count(visit_id) as visits
from patient_data
group by state
order by visits desc
limit 5;