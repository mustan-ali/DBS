--Create procedure to details of employee
create or replace procedure read_emp(
id in number, fname out varchar2, lname out varchar2, 
sal out number, dpt_id out number,j_id out varchar2)
is begin 
select first_name into fname from employees where employee_id=id;
select last_name into lname from employees where employee_id=id;
select salary into sal from employees where employee_id=id;
select department_id into dpt_id from employees where employee_id=id;
select job_id into j_id from employees where employee_id=id;
dbms_output.put_line(FNAME ||' '|| LNAME ||' '|| SAL ||' '|| DPT_ID ||' '|| J_ID);
end;

variable fn varchar2;
variable l varchar2;
variable s number;
variable d number;
variable j varchar2;
set serverout on;

execute read_emp(155,:fn,:l,:s,:d,:j);      --Method 1 to call procedure

begin       --Method 2 to call procedure
read_emp(155,:fn,:l,:s,:d,:j);
end;


--Create procedure to see if employee is senior or junior
create or replace procedure is_senior(
id in varchar2, msg out varchar2)
is 
jdate date;
years number;
begin
select hire_date into jdate from employees where employee_id =id;
years:= (months_between(sysdate, jdate)/12);

if years >= 5 then
    msg:='Senior';
else
    msg:='Junior';
end if;  
dbms_output.put_line(msg);
end;

set serverout on;
variable M varchar2;

execute is_senior(165,:M);


--Function to add two numbers and return result
create or replace function add_num(
num1 number, num2 number)
return number is
num3 number;
begin
num3 := num1 + num2;
return num3;
end;

select add_num(10,20) from dual;


--Function to find square of a number
create or replace function square(
num1 number)
return number is
num2 number;
begin
num2 := num1 * num1;
return num2;
end;

select square(5) from dual;


--Function to find unit digit of a number
create or replace function get_unit(
num1 number)
return number is
num2 number;
begin
num2 := substr(num1, length(num1)-1, length(num1));
return num2;
end;

select get_unit(502) from dual;


--Exception Handling
create or replace function is_junior(id in varchar2)
return varchar2
is 
jdate date;
years number;
msg varchar2(100);
begin
select hire_date into jdate from employees where employee_id =id;
years:= (months_between(sysdate, jdate)/12);

if years >= 10 then
    msg:='Senior';
else
    msg:='Junior';
end if;  

return msg;

EXCEPTION
WHEN NO_DATA_FOUND then 
    return 'No Employee Found';
WHEN TOO_MANY_ROWS then 
   return 'Multiple Employees Found';
WHEN OTHERS then 
   return 'Unknown Error Occured';   
end;

set serverout on;
select is_junior(15) from dual;     --Method 1 to call function

declare m varchar2(100);    --Method 2 to call function
begin
m := is_junior(250);
dbms_output.put_line(m);
end;


--Function return value
--Procedure does not return value
--Default value in function parameter is IN
--In Parameterized function we use IS
--In Non-Parameterized function we use AS
-- := is used to assign value to variable in PL/SQL