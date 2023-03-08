--display the job_id and the number of employees in each job_id
select job_id, count(job_id) from employees group by job_id;

--display the job_id and the number of employees in each job_id where the number of employees is greater than or equal to 5
select job_id, count(job_id) from employees group by job_id having count(job_id)>=5;