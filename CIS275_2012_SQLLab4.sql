/*
*************************************************************************************
CIS275, SQL Lab4, 
five questions provided by Vicki Jonathan, Instructor
modified by Jeff fried
PCC using Microsoft SQL Server 2008
8/21/2017
Saud Aljandal 
10 June 2012 DUE DATE
-------------------------------------------------------------------------------------
You need to know how to interpret story problems, translate their requirements into 
queries, write queries to class standards, and identify whether output is correct.
-------------------------------------------------------------------------------------
SELECT clause contains formatted projection items one to a line separated by commas
and aliased with user-friendly names in single quotes.
CAST(column_name AS CHAR(#)) for character data where # is best-fit field length.
STR(column_name, precision, scale) for numbers where precision is best-fit field 
    length which includes the decimal point and optional scale is the number of 
    decimal places (use 2 for money, omit for whole numbers).
CONVERT(CHAR(12), column_name, #) for dates where # is the style number for date.
SQL keywords and table names are uppercase. Every query to end with a semi-colon.
*************************************************************************************
*/

USE FiredUp    -- ensures correct database is active


GO
PRINT 'CIS2275, Lab4, question 1, twenty (20) points possible
What types of stoves have sold in at least three different states and
somewhere in Canada? Display the stove type.' + CHAR(10);
SELECT 
STOVE.Type AS 'StoveType' 
FROM STOVE,CUSTOMER, INVOICE, INV_LINE_ITEM
WHERE STOVE.SerialNumber=INV_LINE_ITEM.FK_StoveNbr
AND INV_LINE_ITEM.FK_InvoiceNbr=INVOICE.InvoiceNbr 
AND INVOICE.FK_CustomerID=CUSTOMER.CustomerID 
AND CUSTOMER.Country LIKE 'CAN'  GROUP BY STOVE.Type INTERSECT
SELECT
STOVE.Type FROM STOVE, CUSTOMER, INVOICE, INV_LINE_ITEM 
WHERE STOVE.SerialNumber=INV_LINE_ITEM.FK_StoveNbr 
AND INV_LINE_ITEM.FK_InvoiceNbr=INVOICE.InvoiceNbr 
AND INVOICE.FK_CustomerID=CUSTOMER.CustomerID 
AND  CUSTOMER.Country LIKE 'USA' GROUP BY STOVE.Type HAVING COUNT(DISTINCT CUSTOMER.StateProvince) >= 3;
GO


GO
PRINT 'CIS275, Lab4, question 2, twenty (20) points possible
Out of all the invoices containing FiredAlways stoves, show those with the three 
highest total price. Display the invoice number, invoice date, and totalprice. ' + CHAR(10);
SELECT DISTINCT
TOP (3) INVOICE.InvoiceNbr,
CONVERT(char(12),INVOICE.InvoiceDt,101) AS Date,
INVOICE.TotalPrice
FROM INVOICE, INV_LINE_ITEM, STOVE
WHERE INVOICE.InvoiceNbr=INV_LINE_ITEM.FK_InvoiceNbr
AND INV_LINE_ITEM.FK_StoveNbr=STOVE.SerialNumber
AND STOVE.Type LIKE 'FiredAlways' ORDER BY INVOICE.TotalPrice DESC;
GO


GO
PRINT 'CIS275, Lab4, question 3, twenty (20) points possible
Who has sold stoves in the two most popular states?
Display the employee number, employee name, the name of the two most popular states, 
and the number of stoves sold by the employees in those states.  (''Most popular 
state'' means the state or states for customers who purchased the most stoves, 
regardless of the stove type and version. Do not hardcode a specific state into your 
query.)' + CHAR(10);
SELECT
TOP 2 CUSTOMER.StateProvince AS State,
COUNT(INV_LINE_ITEM.Quantity) AS Count
FROM CUSTOMER, STOVE, INVOICE, INV_LINE_ITEM
WHERE CUSTOMER.CustomerID=INVOICE.FK_CustomerID
AND INVOICE.InvoiceNbr=INV_LINE_ITEM.FK_InvoiceNbr
AND INV_LINE_ITEM.FK_StoveNbr=STOVE.SerialNumber
GROUP BY CUSTOMER.StateProvince
ORDER BY COUNT(INV_LINE_ITEM.Quantity) DESC;

SELECT
EMPLOYEE.EmpID,EMPLOYEE.Name,
CUSTOMER.StateProvince AS State,
COUNT(INV_LINE_ITEM.Quantity) AS '#Sold'
FROM CUSTOMER, STOVE, INVOICE,INV_LINE_ITEM, EMPLOYEE
WHERE CUSTOMER.CustomerID=INVOICE.FK_CustomerID
AND INVOICE.InvoiceNbr=INV_LINE_ITEM.FK_InvoiceNbr
AND INV_LINE_ITEM.FK_StoveNbr=STOVE.SerialNumber
AND EMPLOYEE.EmpID=INVOICE.FK_EmpID
AND CUSTOMER.StateProvince IN (SELECT TOP 2 CUSTOMER.StateProvince
FROM CUSTOMER, STOVE, INVOICE, INV_LINE_ITEM
WHERE CUSTOMER.CustomerID=INVOICE.FK_CustomerID
AND INVOICE.InvoiceNbr=INV_LINE_ITEM.FK_InvoiceNbr AND INV_LINE_ITEM.FK_StoveNbr=STOVE.SerialNumber
GROUP BY CUSTOMER.StateProvince ORDER BY COUNT(INV_LINE_ITEM.Quantity) DESC)
GROUP BY EMPLOYEE.EmpID,EMPLOYEE.Name,CUSTOMER.StateProvince;
GO


GO
PRINT 'CIS275, Lab4, question 4, twenty (20) points possible
Show employees having sold the type and version of stove that has been repaired the 
most? Display the employee name, stove type, stove version, and number of times 
repaired. If there is more than one employee then display them all. Do not hardcode 
a specific type or version into your query. (We are not asking for the person whose 
stoves get repaired the most. The employee who sold the most of the least reliable 
stove may have gotten lucky with their particular sales.)' + CHAR(10);
SELECT E.Name,COUNT(S.SerialNumber) AS 'timesrepaired'
FROM STOVE S, STOVE_REPAIR SR, EMPLOYEE E, INVOICE I, INV_LINE_ITEM INV 
WHERE E.EmpID=I.FK_EmpID AND I.InvoiceNbr=INV.FK_InvoiceNbr AND INV.FK_StoveNbr=S.SerialNumber AND S.SerialNumber=SR.FK_StoveNbr
GROUP BY E.Name
HAVING COUNT(S.SerialNumber)=(SELECT MAX(A.timesrepaired) 
FROM (SELECT COUNT(S.SerialNumber) AS 'timesrepaired' 
FROM STOVE S, STOVE_REPAIR SR
WHERE S.SerialNumber=SR.FK_StoveNbr
GROUP BY S.Type,S.Version) AS A);
GO


GO
PRINT 'CIS275, Lab4, question 5, twenty (20) points possible
Which invoice has the second-lowest total price among invoices that do not include a 
sale of a FiredAlways stove? Display the invoice number, invoice date, and invoice 
total price. If there is more than one invoice then display all of them. (Finding 
invoices that do not include a FiredAlways stove is NOT the same as finding invoices 
where a line item contains something other than a FiredAlways stove -- invoices have 
more than one line. Avoid a JOIN with STOVE since the lowest price may not involve 
any stove sales.)' + CHAR(10);
SELECT
I.InvoiceNbr,
CONVERT(char(12),I.InvoiceDt,101) AS InvoiceDate,I.TotalPrice
FROM INVOICE I
WHERE I.TotalPrice =
(SELECT MIN(I.TotalPrice)
FROM INVOICE I
WHERE I.TotalPrice <>
(SELECT MIN(I.TotalPrice)
FROM INV_LINE_ITEM INV, INVOICE I
WHERE  INV.FK_InvoiceNbr=I.InvoiceNbr AND INV.FK_StoveNbr NOT IN 
(SELECT S.SerialNumber FROM STOVE S WHERE S.Type LIKE 'FiredAlways') OR INV.FK_StoveNbr IS NULL) );
GO


GO
-------------------------------------------------------------------------------------
-- This is an anonymous program block. DO NOT CHANGE OR DELETE.
-------------------------------------------------------------------------------------
BEGIN
    PRINT '|---' + REPLICATE('+----',15) + '|';
    PRINT ' End of CIS275 Lab4' + REPLICATE(' ',50) + CONVERT(CHAR(12),GETDATE(),101);
    PRINT '|---' + REPLICATE('+----',15) + '|';
END;


