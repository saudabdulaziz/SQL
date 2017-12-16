/*

-----SAUD ALJANDAL-----


CIS-275 DMLab2
Each problem is worth 20 points, total = 100.

In this problem you'll write the sql to move data from the 1NF table STUDENT_CLASS to normalized tables
and check the integrity constraints

Here are the relations represented by the tables

STUDENT_CLASS(StudentId, ClassId, StudentName, ClassDesc)
has the functional and multivalued dependencies:

Student --> StudentName
Student -->--> (ClassId, ClassDesc)

These can be normalized (BCNF and 4NF) by replacing STUDENT_CLASS with three relations:

STUDENT(StudentId(PK), StudentName)

CLASS(ClassId(PK), ClassDesc)

STUDENT_CLASS2(StudentId(PK), ClassId(PK))
	FK:StudentId --> STUDENT.StudentId
	FK:ClassId --> CLASS.ClassId

Referential Integrity Constraints:
	STUDENT_CLASS2.StudentId must exist in STUDENT.StudentId
	STUDENT_CLASS2.ClassId must exist in CLASS.ClassId

In what follows the physical tables have DMLab2_ prefixed
to the relation name

*/
-- you might need to change the name below to your database name
USE DMLab2EnrollmentDB;
GO
-- Problem 1: 
-- Insert rows into DMLab2_STUDENT
-- by selecting the distinct StudentId and StudentName
-- from DMLab2_STUDENT_CLASS
-- 
-- You don't need to format or alias columns or put each column
-- on a separate line for this lab only.
---

GO
SELECT * FROM DMLab2_STUDENT
INSERT INTO DMLab2_STUDENT(StudentId, StudentName)
SELECT  DISTINCT StudentId, StudentName
FROM DMLab2_STUDENT_CLASS;
GO





-- Problem 2:
-- Insert rows into DMLab2_CLASS
-- by selecting the distinct ClassId and ClassDesc
-- from DMLab2_STUDENT_CLASS

GO
SELECT * FROM DMLab2_CLASS 
INSERT INTO DMLab2_CLASS(ClassId ,ClassDesc)
SELECT DISTINCT ClassId, ClassDesc
FROM DMLab2_STUDENT_CLASS;
GO

-- Problem 3:
-- Insert rows into DMLab2_STUDENT_CLASS2
-- by selecting StudentId and ClassId
-- from DMLab2_STUDENT_CLASS
--

GO
SELECT * FROM DMLab2_STUDENT_CLASS2
INSERT INTO DMLab2_STUDENT_CLASS2(StudentId,ClassId)
SELECT StudentId,ClassId
FROM DMLab2_STUDENT_CLASS
GO

-- Problem 4:
-- Write a query to check the referential integrity constraint:
-- DMLab2_STUDENT_CLASS2.StudentId must exist in DMLab2_STUDENT.StudentId
--

GO
SELECT DMLab2_STUDENT_CLASS2.StudentId, DMLab2_STUDENT.StudentId
FROM DMLab2_STUDENT_CLASS2, DMLab2_STUDENT
WHERE DMLab2_STUDENT_CLASS2.StudentId = DMLab2_STUDENT.StudentId;
GO
-- Problem 5:
-- Write a query to check the referential integrity constraint:
-- DMLab2_STUDENT_CLASS2.ClassId must exist in DMLab2_CLASS.ClassId
--

GO
SELECT DMLab2_STUDENT_CLASS2.ClassId, DMLab2_CLASS.ClassId
FROM DMLab2_STUDENT_CLASS2, DMLab2_CLASS
WHERE DMLab2_STUDENT_CLASS2.ClassId = DMLab2_CLASS.ClassId;
GO