--Character Functions
--Case Conversion Function

--lower() converts all characters in a string to lowercase
select lower('HELLO') from dual;
select lower(job_title) from jobs;

--upper() converts all characters in a string to uppercase
select upper('hello') from dual;

--INITCAP() converts the first character of each word in a string to uppercase
select initcap('hello world') from dual;

--Character Manipulation Functions

--Concat() concatenates two or more strings
select concat(job_id,job_title) from jobs;

--Substr() extracts a substring from a string with given range
select substr(title,4,10) from (select concat(job_id,job_title) as title from jobs);

--Instr() returns the position of a character or substring in a string
select job_title, instr(job_title,'S') from jobs;
select job_title from jobs where instr(lower(job_title),'s') > 0;

--Length() returns the length of a string
select length(job_title) from jobs;
select substr(title,4,10), length(title) from (select concat(job_id,job_title) as title from jobs);
select length(substr(title,4,10)) from (select concat(job_id,job_title) as title from jobs);

--LPAD() / RPAD() adds characters to the left or right of a string to make it a specified length
select RPAD(salary,6,'*') from employees;
select LPAD(salary,6,'*') from employees;
select LPAD(salary,5,0), RPAD(salary,5,0) from employees;

--Trim() removes specified characters from the beginning
select trim('S' from job_title) from jobs;

--Replace() replaces a character or substring with another character or substring
select replace(first_name,'a','*') from employees where job_id='SA_REP';
select replace(first_name,'P','*') from employees;

--sysdate() returns the current date
select sysdate from dual;
select hire_date, (sysdate-hire_date)/ 30 from employees;

--round() rounds a number to a specified number of decimal places
select hire_date, round((sysdate-hire_date)/ 30.4) from employees;
select hire_date, round((sysdate-hire_date)/ 30.4,2) from employees;

--trunc() removes specified decimal places from a number
select hire_date, trunc((sysdate-hire_date)/ 30.4) from employees;
select hire_date, trunc((sysdate-hire_date)/ 30.4,2) from employees;