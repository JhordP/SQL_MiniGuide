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

