/* CS460 Winter 2018*/
/* Creates and populates the department and employee tables*/

-- If needed, drop existing tables.
/*
drop table emp;
drop table dept;
*/
 
CREATE TABLE dept(
	deptno INT(2) NOT NULL,
	dept_name VARCHAR(14),
	dept_location VARCHAR(13) 
);

CREATE TABLE emp(
	empno INT(4) NOT NULL,
	emp_name VARCHAR(14),
	job VARCHAR(25),
	mgr INT(4),
	hiredate VARCHAR(12),
	salary DECIMAL(7,2),
	comm DECIMAL(7,2),
	deptno INT(2)
);




-- Primary Keys

ALTER TABLE emp
   ADD CONSTRAINT emp_pk
   PRIMARY KEY (empno);

ALTER TABLE dept
   ADD CONSTRAINT dept_pk
   PRIMARY KEY (deptno);


-- Foreign Keys
-- empLOYEE to DEPARTMENT
ALTER TABLE emp
   ADD CONSTRAINT dept_fk
   FOREIGN KEY (deptno)
   REFERENCES dept(deptno);

-- empLOYEE to empLOYEE
ALTER TABLE emp
   ADD CONSTRAINT boss
   FOREIGN KEY (mgr)
   REFERENCES emp (empno);
   
   
-- Populate Tables with Data   
INSERT INTO dept (deptno, dept_name, dept_location) VALUES (10,'Accounting','New York');
INSERT INTO dept (deptno, dept_name, dept_location) VALUES (20,'Research','Dallas');
INSERT INTO dept (deptno, dept_name, dept_location) VALUES (30,'Sales','Chicago');
INSERT INTO dept (deptno, dept_name, dept_location) VALUES (40,'Operations','Boston');



 
-- Do not check foreign key constraints, we need to insert data first. 
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno)
VALUES (7369,'SMITH','CLERK',7902,'12-17-2010',900,NULL,20);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7499,'ALLEN','SALESMAN',7698,'2-20-2011',1700,300,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7521,'WARD','SALESMAN',7698,'2-22-2011',1350,500,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7566,'JONES','MANAGER',7839,'4-2-2011',3075,NULL,20);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7654,'MARTIN','SALESMAN',7698,'9-28-2001',1350,1400,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7698,'BLAKE','MANAGER',7839,'1-5-2011',2950,NULL,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7782,'CLARK','MANAGER',7839,'9-6-2011',2550,NULL,10);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7788,'SCOTT','ANALYST',7566,'7-13-2007',3100,NULL,20);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7839,'KING','PRESIDENT',NULL,'2-14-2005',5000,NULL,10);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7844,'TURNER','SALESMAN',7698,'9-8-2011',1600,0,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7876,'ADAMS','CLERK',7788,'7-13-2007',1200,NULL,20);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7900,'JAMES','CLERK',7698,'12-3-2011',1050,NULL,30);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7902,'FORD','ANALYST',7566,'3-12-2011',3100,NULL,20);

INSERT INTO emp (empno, emp_name, job, mgr, hiredate, salary, comm, deptno) 
VALUES (7934,'MILLER','CLERK',7782,'1-23-2012',1400,NULL,10);







-- Specify to check foreign key constraints (this is the default)
SET FOREIGN_KEY_CHECKS = 1;

