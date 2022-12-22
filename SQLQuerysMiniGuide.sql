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

/***************************************************************************************************************************/
/** INSERTING NEW DATA [INSERT] **/

--To insert in all columns of the table
INSERT INTO testTable VALUES ('value1', 'value2', 'value3');

--To insert in specified columns
INSERT INTO testTable (column1, column3) VALUES ('value1', 'value2');

/***************************************************************************************************************************/
/* NULL DATA */

--Look for Null data
SELECT * FROM testTable WHERE column2 IS NULL;

--Look for Not Null data
SELECT * FROM testTable WHERE column2 IS NOT NULL;
/***************************************************************************************************************************/
/* UPDATE */

--Updating data in a row, with a condition. Otherwise, all data including the columns specified will be updated inside the table.
UPDATE testTable SET column1 = 1, column2 = 'newValue' WHERE column3 = 'value3';
/***************************************************************************************************************************/
/* DELETE */

--Deleting data in a row, with a condition. Otherwise, all data including the columns specified will be deleted inside the table.
DELETE FROM testTable WHERE column1 = 'value2';