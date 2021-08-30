--1.For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.
--Retrieve all the records from the Employees table.
SELECT *
FROM Employees
Where LastName = 'King';

--2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table
SELECT FirstName,
LastName,
Birthdate,
Address,
City,
State
FROM Employees;

--3. Retrieve all the columns from the Tracks table, but only return 20 rows.
SELECT *
FROM Tracks
Limit 20;