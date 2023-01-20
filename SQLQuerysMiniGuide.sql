/****SQL QUERYS MINI GUIDE by Jhordany Polanco*****/

/* TABLE SEARCH [SELECT] */
--Search columns
SELECT column1, column2, column3 FROM testTable;

--Search all columns
SELECT * FROM testTable;

--Search different data between specified columns, all(*) the columns, or a singular column.
SELECT DISTINCT column1, column2 FROM testTable;

--Puts a condition to the search.
SELECT column1, column2, column3 FROM testTable WHERE column1>18;
SELECT column1, column2, column3 FROM testTable WHERE column2='name';

--OR
SELECT column1, column2, column3 FROM testTable WHERE column1>18 OR column2='name';
--AND
SELECT column1, column2, column3 FROM testTable WHERE column1>18 AND column2='name';
--NOT
SELECT column1, column2, column3 FROM testTable WHERE NOT column1>18 AND NOT column2='name';

--Order the searching by descendent and ascendent order using the datatype of the column as refference
SELECT * FROM testTable ORDER BY column1 DESC;

--Group first by column1 in descendent way, and then by the column3 ascendent when they have the same column1 data.
SELECT * FROM testTable ORDER BY column1 DESC, column3 ASC;

--Look for Null data
SELECT * FROM testTable WHERE column2 IS NULL;

--Look for Not Null data
SELECT * FROM testTable WHERE column2 IS NOT NULL;

--Search a specified quantity of rows in the table
SELECT TOP 5 column1, column2 FROM testTable WHERE column3 = 'value';
SELECT TOP 5 PERCENT column1, column2 FROM testTable;

--Search min (smallest) and max (largest) values of the selected column
SELECT MIN(column1) FROM testTable WHERE column2>=20;
SELECT MAX(column1) FROM testTable WHERE column2=35; 

--You can use AS keyword to specify how you want the column to be called.
--The query below looks for the largest value of the col1 that supplies the condition and name the result "largerValue".
SELECT MAX(column1) AS largerValue FROM testTable WHERE column2=10 

--COUNT: Returns the number of rows that matches a specified criteria
SELECT COUNT(column2) FROM testTable WHERE column1 = 'value';

--AVERAGE: Returns the average value of a numeric column.
SELECT AVG(column1) FROM testTable WHERE column1 = 'value';

--SUM: returns the total sum of a numeric column.
SELECT SUM(column1) FROM testTable WHERE column1 = 'value';

--Search using a filter or pattern. % is like * in a linux[ls -lrt Something*]
-- the _ works like quantity of chars to look with the criteria. % and _ are Wildcards. Example:

SELECT TOP 5 column1, column2 FROM testTable WHERE column3 LIKE 'sys%'; --Looks for 5 col1 and col2 which col3 starts with 'sys'
SELECT TOP 5 column1, column2 FROM testTable WHERE column3 LIKE '%sys'; --Looks for 5 col1 and col2 which col3 ends with 'sys'
SELECT TOP 5 column1, column2 FROM testTable WHERE column3 LIKE '%sys%'; --Looks for 5 col1 and col2 which col3 has 'sys' anywhere
SELECT * FROM testTable WHERE column2 LIKE 'Ju_%' --Finds any value that starts with 'Ju' and is at least 3 character length
SELECT * FROM testTable WHERE column2 LIKE 'J__%' --Finds any value that starts with 'J' and is at least 3 character length
SELECT * FROM testTable WHERE column2 LIKE '___a%' --Finds any value that has 'a' in the 4th position.

--Wildcards. Data taken from https://www.w3schools.com/sql/sql_wildcards.asp
/*
%	Represents zero or more characters	bl% finds bl, black, blue, and blob
_	Represents a single character	h_t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
^	Represents any character not in the brackets	h[^oa]t finds hit, but not hot and hat
-	Represents any single character within the specified range	c[a-b]t finds cat and cbt
*/

--OR condition shorthand: IN
SELECT column1 FROM testTable WHERE column1 IN ('value1','value2','value3') --returns all col1 equals to value1, value2, or value3
SELECT column1 FROM testTable WHERE column1 NOT IN ('value1','value2','value3') --returns all col1 not equals to value1, value2, or value3
SELECT * FROM testTable WHERE column2 IN (SELECT _column FROM anotherTable) --returns all data which values are the same in col2(testTable) and _column(anotherTable)

--Search data between ranges. Putting NOT before Between makes it to discard the range in the query result.
SELECT * FROM testTable WHERE column1 BETWEEN 10 AND 20; --Numeric: Between values 10-20
SELECT * FROM testTable WHERE column1 BETWEEN 'A-value' AND 'D-value'; --Text: Alphabetic search between A-value and D-value.
SELECT * FROM testTable WHERE column1 BETWEEN #09/19/2014# AND #08/10/2022#; --Date: in this case Between 19Sept2014 and 10Augt2022
SELECT * FROM testTable WHERE column1 BETWEEN '2014-09-19' AND '2022-08-10'; --Date: in this case Between 19Sept2014 and 10Augt2022

--Aliases for columns
SELECT IDcolumn AS ID, column2 AS customer FROM testTable;

--Aliases with spaces
SELECT column2 AS [Some New Name] FROM testTable;

--Combine columns with Alias
SELECT clientName, clientAddress + ', ' + City + ', ' + Country AS clAdress FROM clientTable

--Aliases with tables
SELECT t.ticketID, t.ticketDate, u.username FROM Users AS u, Ticket as t WHERE u.username='Some Name' AND u.userID=t.userID;

--**JOINS**-- https://www.w3schools.com/sql/sql_join.asp
-------------------------------------------------------------------------------------------------------
--Inner Join: selects records that have matching values in both tables. Shows data when there is NOT null value in neither of the tables.
SELECT t1.nameColumn, t2.purchaseColumn FROM personTable AS t1 INNER JOIN marketTable AS t2 ON t1.personID = t2.customerID;

--Left Join: returns all records from the left table (table1), and the matching records from the right table (table2). 
--The result is 0 records from the right side, if there is no match. Doesn't matter if the Left table does not have a match or 
--the Right table has null data on that ID, it shows all the left side data.
SELECT t1.nameColumn, t2.purchaseColumn FROM personTable AS t1 LEFT JOIN marketTable AS t2 ON t1.personID = t2.customerID;

--Right Join: returns all records from the right table (table2), and the matching records from the left table (table1). 
--The result is 0 records from the left side, if there is no match. Doesn't matter if the Right table does not have a match or 
--the Left table has null data on that ID, it shows all the Right side data.
SELECT t1.nameColumn, t2.purchaseColumn FROM personTable AS t1 RIGHT JOIN marketTable AS t2 ON t1.personID = t2.customerID;

--Full Join: FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
--BTW: FULL JOIN and FULL OUTER JOIN are the same.
SELECT t1.nameColumn, t2.purchaseColumn FROM personTable AS t1 FULL JOIN marketTable AS t2 ON t1.personID = t2.customerID WHERE something = 'whatever';

--"Self Join:" I personally don't think why i would ever use this. A table joined itself.
SELECT A.Table1 AS ColumnName1, B.Table1 AS ColumnName2, A.City
FROM Table1 A, Table1 B --These are different Aliases for the same table.
WHERE A.CustomerID <> B.CustomerID --Not equal ID
AND A.City = B.City 
ORDER BY A.City;
---------------------------------------------------------------------------------------------------

--UNION: Combines the result of two or more SELECTs.
-->SELECT statements within UNION must have the same number of columns.
-->They must have similar data types.
-->The columns in every SELECT statement must also be in the same order.
-->UNION applies DISTINCT by default. To To allow duplicate values, you can use UNION ALL.
SELECT CountryColumn FROM table1 UNION SELECT CountryColumn FROM table2;
SELECT Address FROM table1 WHERE City = 'Argentina' UNION SELECT Address FROM table2 WHERE City = 'Argentina';

--Categorize first by Owner and second by Store.
SELECT 'Owner' AS Relationship, Name FROM table1 WHERE Status='OK' UNION SELECT 'Store', Name FROM table2 WHERE Status='Ok';

--Categorize with statistics: Group By. It should be used with [COUNT(), MAX(), MIN(), SUM(), AVG()]
SELECT columns FROM table1 WHERE data='somename' GROUP BY column;
SELECT COUNT(IDEmployees), department FROM Employees WHERE condition GROUP BY department;

/***************************************************************************************************************************/
/** INSERTING NEW DATA [INSERT] **/

--To insert in all columns of the table
INSERT INTO testTable VALUES ('value1', 'value2', 'value3');

--To insert in specified columns
INSERT INTO testTable (column1, column3) VALUES ('value1', 'value2');

/***************************************************************************************************************************/
/* UPDATE EXISTING DATA [UPDATE] */

--Updating data in a row, with a condition. Otherwise, all data including the columns specified will be updated inside the table.
UPDATE testTable SET column1 = 1, column2 = 'newValue' WHERE column3 = 'value3';
/***************************************************************************************************************************/
/* DELETE OR DISCARD DATA [DELETE] */

--Deleting data in a row, with a condition. Otherwise, all data including the columns specified will be deleted inside the table.
DELETE FROM testTable WHERE column1 = 'value2';

