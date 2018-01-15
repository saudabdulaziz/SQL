/*
*************************************************************************************
assignment 2
CS 460
Saud Aljandal 
1/14/2018
*************************************************************************************
*/

USE usr_aljandals_0;   -- ensures correct database is active

-- SELECT * FROM emp;
-- 1.	Determine the max, min, and average salaries
SELECT MAX(emp.salary), MIN(emp.salary), avg(emp.salary) FROM emp;

-- 2.	Determine the total amount of money spent on payroll  (no commision values)
SELECT sum(emp.salary) FROM emp;

-- 3.	List the employees by name in lowercase form.
SELECT lower(emp.emp_name) FROM emp;

-- 4. 	List all exisitng jobs, but only list each type once. 
SELECT distinct emp.job from emp; 

-- 5.	Select departments that (a) start with ‘s’, (b) end with ‘s’, (c) contain an ‘s’.
SELECT * FROM dept WHERE dept.dept_name LIKE 's%' ;
SELECT * FROM dept WHERE dept.dept_name LIKE '%s' ;
SELECT * FROM dept WHERE dept.dept_name LIKE '%c%' ;


-- 6. 
SELECT * FROM emp JOIN dept;
SELECT * FROM emp NATURAL JOIN dept;
SELECT * FROM emp LEFT JOIN  dept USING (deptno);
SELECT * FROM emp RIGHT JOIN  dept USING (deptno);
-- 	explain how the result set differs. 
/*
JOIN combins rows from two or more tables.
NATURAL JOIN combins the colomns with the same name.
LEFT JOIN returned all left table with matched data from right table.
right JOIN returned all right table with matched data from left table.
*/



-- 7.	Count the number of employees in each department
SELECT deptno,count(empno) FROM emp right JOIN dept using (deptno) group by deptno;

-- 8 Edit #7 so departments are order alphabetically. 
SELECT deptno,count(empno) FROM emp right JOIN dept using (deptno) group by deptno order by dept_name;

-- 9 Edit #8 so only departments with 3 or more employees show up. 
SELECT deptno,count(empno) FROM emp right JOIN dept using (deptno) group by deptno  having count(empno)>=3 order by dept_name;


-- 10 
SELECT emp_name FROM emp 
WHERE DEPTNO in (
	SELECT deptno FROM dept WHERE dept_name LIKE '%S%' );
-- it didn't work becaouse the WHERE clause subquery returned more than 1 row .
-- we can fix it by using IN. IN allows us to specify multiple values in a WHERE clause.
-- JOIN will merge the tables together while in this question we just need to bring some data from other table and apply them to the condition.
