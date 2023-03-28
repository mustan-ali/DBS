--mod function returns the remainder
select mod(12,5) from dual;
select mod(salary,1000) from employees where job_id='SA_REP';

--add_months function adds months to a date
select add_months(sysdate,12) from dual;

--month_between function returns the number of months between two dates
select months_between(sysdate,hire_date) from employees;
select months_between(sysdate,add_months(hire_date,6)) from employees;

--last_day function returns the last day of the month
select last_day(sysdate) from dual;

--next_day function returns the next day of the week
select sysdate, next_day(sysdate,'Sunday') from dual;
select sysdate, next_day(sysdate,1) from dual;

--round function & trunc function
select sysdate, round(sysdate,'Month') from dual;
select round(hire_date,'Month'), round(hire_date,'Year') from employees;
select trunc(hire_date,'Month'), trunc(hire_date,'Year') from employees;
select hire_date, round(hire_date,'Month'), trunc(hire_date,'Month') from employees;

--Type Casting
--Implicit (Conversion is done automatically)
select 10+20, '10'+20 from dual;
select * from job_history where start_date='01-JAN-2007';
select * from job_history where start_date='01/JAN/07';

--Explicit (Conversion is not done automatically)
--to_char()     Num to Char
--to_Char()     Date to Char
--to_Date()     Char to Date 
--to_Number()   Char to Num 
select to_number('$10','$99')+20 from dual;
select to_number('$125','$000')+20 from dual;
select * from job_history where start_date=to_date('Jan/07/01','MM YY DD');
select to_char(start_date,'MM YY DD') from job_history;
select to_char(start_date,'MM.YY.DD') from job_history;

--Take input from the user
select * from job_history where department_id > &d;
select * from employees where employee_id = &d;
select * from employees where to_char(hire_date,'MM')= &d;

--Date Formats in Oracle
--YYYY  1997
select start_date, to_char(start_date,'YYYY') from job_history;
--YY    97
select start_date, to_char(start_date,'YY') from job_history;
--Year  Nineteen Ninety Seven
select start_date, to_char(start_date,'Year') from job_history;
--MM    09
select start_date, to_char(start_date,'MM') from job_history;
--Month September
select start_date, to_char(start_date,'Month') from job_history;
--MON  SEP
select start_date, to_char(start_date,'MON') from job_history;
--DY  SUN
select start_date, to_char(start_date,'DY') from job_history;
--DAY   SUNDAY
select start_date, to_char(start_date,'DAY') from job_history;
--DDSP  Twenty One
 select start_date, to_char(start_date,'DDSP') from job_history;
--DDTH  21st
select start_date, to_char(start_date,'DDTH') from job_history;
--DDSPTH    Twenty First
select start_date, to_char(start_date,'DDSPTH') from job_history;