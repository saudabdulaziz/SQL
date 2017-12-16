
--SAUD ALJANDAL


USE FiredUp    -- ensures correct database is active

GO
PRINT 'CIS2275, Lab1, question 1, ten points possible.
Project everything (all columns and all rows) from the SUPPLIERS table.' + CHAR(10)
-- Your SELECT will have a list of column names each separated with a comma (,).
-- Each projection item goes on a separate line. Do not format output nor use aliases.
-- Your FROM will name the table and end with a semi-colon (;).
GO
SELECT SupplierNbr,Name,SalesRep,RepPhoneNumber,CSPhoneNumber,Address,City,State
FROM SUPPLIER;


GO
PRINT 'CIS275, Lab1, question 2, ten points possible.
Project everything (all columns and all rows) from the STOVE table.' + CHAR(10);
-- Your SELECT will have a list of column names each separated with a comma (,).
-- Each projection item goes on a separate line. Do not format output nor use aliases.
-- Your FROM will name the table and end with a semi-colon (;).
GO
SELECT SerialNumber, Type, Version, DateOfManufacture, Color, FK_EmpId
FROM STOVE;


GO
PRINT REPLICATE('=',80) + CHAR(10) +
'From now on every query will have formatted projection items with aliases
and end with a semi-colon. Table names are uppercase.
Formats to use are the following:
CAST(column_name AS CHAR(#)) for character data where # is field length
STR(column_name, precision, scale) for numbers 
    where precision is field length and includes the decimal point 
    and scale is the number of decimal places (always use 2 for money)
CONVERT(CHAR(12), column_name, #) for dates where # is 1 or 101' + 
CHAR(10) +REPLICATE('=',80) + CHAR(10);
GO
PRINT 'CIS275, Lab1, question 3, ten points possible.
Display everything from the PURCHASE_ORDER table.' + CHAR(10);
GO
SELECT E.PONbr,E.OrderDt,E.Terms,FK_SupplierNbr
FROM PURCHASE_ORDER as E;


GO
PRINT 'CIS275, Lab1, question 4, ten points possible.
You have been asked to supply a list of all employees names
and their ID numbers. Do so.' + CHAR(10);
GO
SELECT E.EmpID,E.Name
FROM EMPLOYEE as E;


GO
PRINT 'CIS275, Lab1, question 5, ten points possible.
Show the FK_PartNbr, Quantity, ExtendedPrice and (ExtendedPrice * 1.07) from the
REPAIR_LINE_ITEM table. Limit output to rows have a quantity greater than one.' + CHAR(10);
GO
SELECT STR(F.FK_PartNbr, 4, 0) As 'Part Number',
F.Quantity,F.ExtendedPrice, F.ExtendedPrice * 1.07
FROM REPAIR_LINE_ITEM as F
WHERE F.Quantity > 1;


GO
PRINT 'CIS2275, Lab1, question 6, ten points possible.
What INVOICEs have TotalPrice of more than $200? 
Show InvoiceNbr, InvoiceDt, and TotalPrice.' + CHAR(10)
GO

SELECT STR(I.InvoiceNbr, 4, 0) As 'Invoice Number',
 CONVERT(CHAR(12), I.InvoiceDt, 1) As date, I.TotalPrice
FROM INVOICE AS I
WHERE I.TotalPrice > 200;
 

GO
PRINT 'CIS275, Lab1, question 7, ten points possible.
What INVOICEs have TotalPrice of BETWEEN $1 AND $50? 
Show InvoiceNbr, InvoiceDt, and TotalPrice.' + CHAR(10);
GO
SELECT STR(I.InvoiceNbr, 4, 0) As 'Invoice Number',
CONVERT(CHAR(12), I.InvoiceDt, 1) As date, I.TotalPrice
FROM INVOICE AS I
WHERE I.TotalPrice between 1 and 50;


GO
PRINT 'CIS275, Lab1, question 8, ten points possible.
Display FK_InvoiceNbr, LineNbr, FK_StoveNbr from the INV_LINE_ITEM table.
Eliminate non-stove rows: WHERE FK_PartNbr IS NULL.' + CHAR(10);
GO
SELECT STR(F.FK_InvoiceNbr, 4, 0) As 'Invoice Number',
STR(F.LineNbr, 4, 0) As 'Line Number',
STR(F.FK_StoveNbr, 4, 0) As 'Stove Number'
FROM INV_LINE_ITEM as F
WHERE F.FK_PartNbr IS  NULL;


GO
PRINT 'CIS275, Lab1, question 9, ten points possible.
Show all columns of PURCHASE_ORDER table 
WHERE FK_SupplierNbr IN (801, 803, 805, 807).' + CHAR(10);
GO
SELECT E.PONbr,E.OrderDt,E.Terms,FK_SupplierNbr
FROM PURCHASE_ORDER as E
WHERE FK_SupplierNbr IN (801, 803, 805, 807);


GO
PRINT 'CIS275, Lab1, question 10, ten points possible.
Show all columns of PURCHASE_ORDER table 
WHERE FK_SupplierNbr NOT IN (801, 803, 805, 807).' + CHAR(10);
GO

SELECT E.PONbr,E.OrderDt,E.Terms,FK_SupplierNbr
FROM PURCHASE_ORDER as E
WHERE FK_SupplierNbr NOT IN (801, 803, 805, 807);

-------------------------------------------------------------------------------------
-- This is an anonymous program block. DO NOT CHANGE OR DELETE.
-------------------------------------------------------------------------------------
BEGIN
    PRINT '|---' + REPLICATE('+----',15) + '|';
    PRINT ' End of CIS275 Lab1' + REPLICATE(' ',50) + CONVERT(CHAR(12),GETDATE(),101);
    PRINT '|---' + REPLICATE('+----',15) + '|';
END;


