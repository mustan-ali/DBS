--Creating table
create table mobile(
mid number(6) primary key not null,
mname varchar2 (26));

--creating sequence for primary key of mobile table (autogeneration of primary key)
create sequence sequence_mobile
start with 100
increment by 1
maxvalue 1000
nocycle
cache 5;

--inserting values in mobile table using sequence
insert into mobile values(sequence_mobile.nextval,'iPhone')
insert into mobile values(sequence_mobile.nextval,'&M') --&M used to take input from user

--Index used to speed up the query execution, cannot be applied on primary key
create index  emp_lastname_index on employees(last_name);

--creating view with pre-defined query
create view empdept80
as select employee_id, first_name, salary
from employees where department_id=80;

select * from empdept80;

--replace view is used to replace the existing view
create or replace view empdept80
as select employee_id, first_name, salary
from employees where department_id=80;

select * from empdept80;

--creating view with join of two tables
create or replace view emp_dept_info(
name, annual_salaray, dept_name)
as select e.first_name||' '||e.last_name,e.salary * 12,d.department_name
from employees e join departments d
on (e.department_id=d.department_id);

select * from emp_dept_info;

--creating view with join of two tables and group by clause 
create or replace view dept_info(
deptname, totalsalary, maxsalary, minsalary, average, totalemployees)
as select department_name, sum(e.salary), max(e.salary), min(e.salary), trunc(avg(e.salary),0), count(e.employee_id)
from employees e join departments d
on (e.department_id=d.department_id) group by department_name;

select * from dept_info;

--creating procedure to print text
create or replace procedure greeting
as begin dbms_output.put_line('Welcome to SZABIST');
end;

set serverout on; --to enable dbms_output

--2 ways to execute procedure
execute greeting;   
begin GREETING; end;


--creating procedure to insert values in table
--IN-Input OUT-Output
create or replace procedure insert_country(id in varchar2, name in varchar2, rid in number)
is begin insert into countries values(id, name, rid);
end;

execute insert_country('SU','SZABIST',1);

--creating procedure to update values and print updated value
create or replace procedure update_salary(id in number,amount in number, d out number)
is begin update employees set salary = salary + amount where employee_id = id;
select salary into d from employees where employee_id = id;
dbms_output.put_line('Updated Salary '|| d);
end;

variable X number; --to store output value

execute update_salary(155,10000,:X);


create or replace procedure emp_info(id in number, d out varchar)
is begin 
select first_name into d from employees where employee_id = id;
dbms_output.put_line('Name '|| d);
end;

variable Y varchar2;

execute emp_info(155,:Y);