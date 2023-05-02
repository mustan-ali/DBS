--connect to database
sqlplus cs2112121@10.0.131.130     
C:\Users\test\Desktop\OracleDB\ScriptHR>sqlplus cs2112121@10.0.131.130

--change password
alter user cs2112121 identified by newpass;

--run script file to create tables and populate data in tables
@Create_tables.sql    
@populate.sql       

 --show tables in database
Select * from tab;     

--show data in table countries
Select * from countries;       

--insert data in table regions with multiple columns
insert into regions values(5,'Szabist');       
insert into countries values('SZ','Computer Science',5);

--show table structure with data type and size
describe regions        

--display data in table from specific column
Select COUNTRY_NAME from countries;    
Select COUNTRY_NAME, Region_Id from countries;  

--Built-in functions in SQL
sum(columnName);      --sum of values in a column
min(columnName);      --minimum value in a column
max(columnName);      --maximum value in a column
avg(columnName);      --average of values in a column
count(columnName);    --count of values in a column

--Using built-in functions on single column
Select count(Country_Name) from countries;     
select min(Min_Salary) from jobs;      

--Using built-in functions on multiple columns
select min(Min_Salary), max(Max_Salary) from jobs;
select sum(Min_Salary), sum(Max_Salary) from jobs;    
select avg(Min_Salary), avg(Max_Salary) from jobs;  

--Using built-in functions on single column and giving alias name
Select count(Country_Name) as TotalCountries from countries;       

--Operators in SQL
and     --AND operator
or      --OR operator
not     --NOT operator

--select data from table countries with condition
select * from countries where region_id=5;     
select * from countries where region_id>=3 and region_id<=4;