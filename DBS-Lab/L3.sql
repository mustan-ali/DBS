-- calculate the annual salary of each employee and display the result in a new column called annual_salary
select first_name, last_name, salary*12 as "annual_salary" from employees;

--calculate bonus with conditions
select first_name, last_name, salary*12 as "annual_salary", salary*2 as "Bonus" from employees where salary>20000;
select first_name, last_name, salary*12 as "annual_salary", salary*3 as "Bonus" from employees where salary>15000 and salary<19000 ;

--calculate tax with conditions
select first_name, last_name, salary*12 as "annual_salary", salary*3 as "Bonus", salary*12*0.02 as "tax" from employees where salary>15000 and salary<19000;

--calculate net salary with conditions
select first_name, last_name, salary*12 as "annual_salary", salary*3 as "Bonus", salary*12*0.02 as "tax", salary*12-salary*12*0.02 as net_salary from employees where salary>15000 and salary<19000;

--print the name & salary of the employee who has the higher salary than the employee whose last name is 'Austin'
select first_name, salary from employees where salary>(select salary from employees where last_name='Austin') ;

select * from dual; 
select 'mustan' as name from dual;

--insert multiple rows into a table
insert all  
  into regions(region_id,region_name) values(9,'A')  
  into regions(region_id,region_name) values(10,'B')  
  select * from dual;

insert all  
  into jobs(job_id,job_title,min_salary,max_salary) values('ST','Staff',2000,4000)  
  into jobs(job_id,job_title,min_salary,max_salary) values ('FT','Faculty',9000,15000)  
  into jobs(job_id,job_title,min_salary,max_salary) values ('AD','Admin',9000,20000)  
  select * from dual;

select * from jobs where job_id='ST' or job_id='FT' or job_id='AD';

--print details of the employee whose job id matches with the job id of the employee whose employee id is 141
select last_name, job_id from employees where job_id=(select job_id from employees where employee_id =141);

--Sorting Ascending and Descending
select first_name from employees order by first_name asc;
select first_name from employees order by first_name desc;

--Print the first name which are unique
select distinct first_name from employees;

select distinct first_name from employees order by first_name asc;
select distinct first_name, last_name from employees order by first_name asc;

--Concat first name and last name
select first_name || last_name from employees;
select first_name || last_name from employees order by first_name;

--Concat first name and last name with space & string ( || concatenation operator)
select first_name || ' ' ||last_name from employees order by first_name;
select first_name || ' ' ||last_name as employee_detail from employees order by first_name;
select 'My first name is' || first_name from employees order by first_name;
select 'My first name is ' || first_name || ' and my salary is ' || salary from employees where employee_id>=110 and employee_id<=120 order by first_name;

--select details of the employee whose employee id is >=150 and <=155
select first_name, last_name from employees where employee_id between 150 and 155;

--select details of the specific employee with certain details
select first_name, last_name from employees where employee_id in(146,150,110,100);
select first_name, last_name from employees where job_id in('ST_CLERK');

--Group rows that have the same value in a column
select job_id from employees group by job_id;
select job_id, count(job_id) from employees group by job_id;
select job_id, count(job_id), sum(salary) from employees group by job_id;

--print details of the employee whose job id matches with the job id of the employee whose last name is 'Dilly' and salary is higher than 'Dilly'
select first_name, salary from employees where job_id=(select job_id from employees where last_name='Dilly') and salary>(select salary from employees where last_name='Dilly');