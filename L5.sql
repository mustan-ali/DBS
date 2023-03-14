--Updating  data
update regions set region_name='KPK' where region_id=9;
update regions set region_name='MEF' where region_id = (select region_id from regions where region_name='Middle East and Africa');

--Deleting data
delete from countries where country_name='Israel';
delete from countries where region_id like 4;
delete from regions where region_id=4;

--EQUI Join
select employee_id, job_title, start_date, end_date, department_id from jobs, job_history where jobs.job_id = job_history.job_id;

select department_name, location_id, start_date, end_date from departments, job_history where departments.department_id = job_history.department_id;

select department_name, location_id, start_date, end_date from departments, job_history where departments.department_id = job_history.department_id and start_date like '%07';

select * from (select department_name, location_id, start_date, end_date from departments, job_history where departments.department_id = job_history.department_id) where start_date like '%07';

--INNER Join: Returns records that have matching values in both tables

--OUTTER Join (LEFT, RIGHT, FULL)

--LEFT OUTER Join: Returns all records from the left table, and the matched records from the right table
select * from (select department_name, location_id, start_date, end_date from departments, job_history 
where departments.department_id = job_history.department_id(+));

--RIGHT OUTER Join: Returns all records from the right table, and the matched records from the left table
select * from (select department_name, location_id, start_date, end_date from departments, job_history 
where departments.department_id(+) = job_history.department_id);

--FULL OUTER Join: Returns all records when there is a match in either left or right table
select * from (select department_name, location_id, start_date, end_date from departments, job_history 
where departments.department_id(+) = job_history.department_id) 
union 
select * from (select department_name, location_id, start_date, end_date from departments, job_history 
where departments.department_id = job_history.department_id(+));