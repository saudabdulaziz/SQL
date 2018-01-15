/*
*************************************************************************************
assignment1
CS 460
Saud Aljandal 
1/10/2018
*************************************************************************************
*/

USE usr_aljandals_0;   -- ensures correct database is active


 -- 1.	Add an IT department (with dept # 50) located in Ashland. 
INSERT INTO dept (deptno, dept_name, dept_location) VALUES (50,'IT','Ashland');

-- 2. Add yourself to the employee table as a database administrator working in the IT department.
-- You were hired today, and you boss will be the president of the company. (You can make up your ID number, salary, and commission!). 
INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7935,'SAUD','Database administrator',7839,'1-10-2018',4900,NULL,50);

-- 3.	Give everyone a 3% raise. 
UPDATE emp SET salary = salary * 1.03;  

-- 4.	Modify the record of the employee Smith so that Smith now has the same manager as the employee Martin. 
UPDATE emp SET mgr = 7698 WHERE empno = 7369;

-- 5. Remove all employees who directly work for the employee Blake. Then, Rollback your modications. 
START TRANSACTION;
DELETE FROM emp WHERE mgr = 7698;
-- emps with mgr number have been removed from the list.

ROLLBACK;
-- emps got back to the list after executing rollback


-- 6.	Give all employees who don’t currently get a commission a $100 commission value.  
UPDATE emp SET comm = 100 WHERE comm IS NULL;

-- 7.	Write a query to show the updated employee table. 
SELECT * FROM usr_aljandals_0.emp ;

-- 8.	Write a query that shows just employee names and salaries listed in alphabetical order by name. 
SELECT emp_name, salary FROM emp ORDER BY emp_name;