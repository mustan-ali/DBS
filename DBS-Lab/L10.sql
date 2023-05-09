--delete table
drop table tablename;

--alter table
alter table cla rename to class;
alter table stud rename to student;
alter table student rename column phone to STUD_PHONE;
alter table student add (phone varchar2(16) unique, age integer);
alter table student add stud_email varchar2(16);
alter table student modify stud_phone integer; 
alter table student drop(stud_phone,stud_email);

--update table records
update student set stud_phone=0331, stud_age=18 where stud_id=1;
update student set stud_phone=0332, stud_age=18 where stud_id=2;
update student set stud_email='xyz@mail.com' where stud_id in (1,2,3,4,5);

--copy table to another table
create table copied as select * from employees;

--delete table records
--Delete / Truncate     Delete for small amount of data & Truncate for large amount of data (in millions)
delete copy;
truncate table copy;

--Virtual Column (derived using other columns) gross_price
create table parts(
part_id integer, part_name varchar(26), capacity integer, cost integer, list_price integer,
gross_price as (((list_price - cost) / cost)*100)) 

insert into parts (part_id, part_name, capacity, cost, list_price) 
values (1,'Battery',25,150,300);

--Virtual Column (derived using other columns and case statement) remarks
alter table parts 
add remarks as (
case  when capacity < 5 then 'Grade D'
      when capacity < 10 then 'Grade C'
      when capacity < 15 then 'Grade B'
      when capacity < 20 then 'Grade A'
       when capacity >= 20 then 'Grade A+'   
end);