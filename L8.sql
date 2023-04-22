--Case Statement
--Calculate the bonus for each employee based on their job_id using the case statement
SELECT first_name, last_name, salary,
case job_id when 'IT_PROG' then salary * 0.2
            when 'PU_CLERK' then salary * 0.17
            when 'ST_CLERK' then salary *0.16
            else salary * 0.1
end as "Inc_salary"
from employees;


--Calculate the bonus and total salary for each employee based on their job_id using the case statement
SELECT first_name, last_name, salary,
case job_id when 'IT_PROG' then salary * 0.2
            when 'PU_CLERK' then salary * 0.17
            when 'ST_CLERK' then salary *0.16
            else salary * 0.1
end as "Inc_salary",
case job_id when 'IT_PROG' then salary * 1.2
            when 'PU_CLERK' then salary * 1.17
            when 'ST_CLERK' then salary * 1.16
            else salary * 1.1
end as "Total_salary"
from employees;


--Print the commission for each employee.
SELECT first_name, commission_pct, 
case when commission_pct is null then 'No Commisson' 
                else to_char(commission_pct)
end as "Commission"
from employees;


--Print Commission Amount for each employee. 
SELECT first_name, commission_pct, 
case when commission_pct is null then 'No Commisson' 
                else to_char(commission_pct * salary)
end as "Commission Amount"
from employees;


--Calculate grade for each employee based on their salary.
SELECT first_name, salary,
case  when salary between 0 and 5000 then 'Grade A'
      when salary between 5000 and 10000 then 'Grade B'
      when salary between 10000 and 15000 then 'Grade C'
      when salary between 15000 and 20000 then 'Grade D'
      when salary between 20000 and 25000 then 'Grade E'
      else 'Grade  F'   
end as "Grade"
from employees;


--Decode function
--Calculate the bonus for each employee based on their job_id using the decode statement
select first_name,
decode(job_id, 'IT_CLERK',0.2*salary,'PU_CLERK',0.17*salary,0.1*salary) as "Increment"
from employees;


--Calculate grade for each employee based on their salary using the decode statement
select first_name,
decode(job_id, 'AD_PRES','A', 'ST_MAN','B', 'IT_PROG','C', 'SA_REP','D', 'ST_CLERK','E', 0) as "Grade"
from employees;