--Natural Join (joins tables that have same column names) 
select * from jobs natural join job_history;
select * from employees natural join departments;
select * from employees natural join departments where department_id = 80;

--Cross Join (joins all rows of one table with all rows of another table)
select * from jobs cross join job_history;

--Self Join (joins a table with itself)
select worker.last_name, manager.last_name
from employees worker join employees manager
on (worker.manager_id = manager.employee_id);

select worker.last_name, manager.last_name, manager.manager_id,worker.employee_id
from employees worker join employees manager
on (worker.manager_id = manager.employee_id);

--Union (joins two tables without duplicates)
select department_id, manager_id from employees
union
select department_id, manager_id from departments;

--Union All (joins two tables with duplicates)
select department_id, manager_id from employees
union all
select department_id, manager_id from departments;

--Intersect (joins two tables with common rows)
select department_id, manager_id from employees
intersect
select department_id, manager_id from departments;

--Minus (displays rows from first table that are not in second table)
select department_id, manager_id from employees
minus
select department_id, manager_id from departments;

--Creating tables & inserting data
create table teacher(
TID number (6) primary key,
TNAME varchar2 (26) not null,
TEMAIL varchar2 (60) not null unique
)

insert all 
into teacher(TID,TNAME,TEMAIL) values(101,'John','john@xyz.com')
into teacher(TID,TNAME,TEMAIL) values(102,'Cena','cena@xyz.com')
into teacher(TID,TNAME,TEMAIL) values(103,'Jeff','jeff@xyz.com')
select * from dual;

create table student(
SID number(6) primary key,
SNAME varchar2 (26) not null,
SUBJECT varchar (50) not null,
TID number (6), constraint std_thr_fk foreign key (TID) references teacher(TID)
);

insert all 
into student(SID,SNAME,SUBJECT,TID) values(1,'Martix','Maths',101)
into student(SID,SNAME,SUBJECT,TID) values(2,'Garrix','Science',102)
into student(SID,SNAME,SUBJECT,TID) values(3,'Robbert','English',103)
select * from dual;

--Data Types
--char
--varchar
--varchar2
--number
--bfile