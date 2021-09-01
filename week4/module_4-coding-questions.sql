--1. Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT
CustomerId
,FirstName || ' ' || LastName AS FullName
,Address
,UPPER(City || ' ' || Country) AS CityCountry
FROM Customers

--2. Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT
FirstName
,SUBSTR(FirstName,1,4) AS '4FirstName'
,LastName
,SUBSTR(LastName,1,2) AS '2LastName'
,LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName,1,2)) AS NewEmployeeUserId
FROM Customers

--3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT
FirstName
,LastName
,DATE('now') - HireDate AS Tenure
FROM Employees
WHERE Tenure >= 15
ORDER BY LastName ASC

--4. Profiling the Customers table, answer the following question.
SELECT * FROM Customers WHERE Phone IS NULL OR address = ''
SELECT * FROM Customers WHERE PostalCode IS NULL OR address = ''
SELECT * FROM Customers WHERE FirstName IS NULL OR address = ''
SELECT * FROM Customers WHERE Address IS NULL OR address = ''
SELECT * FROM Customers WHERE Fax IS NULL OR address = ''
SELECT * FROM Customers WHERE Company IS NULL OR address = ''

--5. Find the cities with the most customers and rank in descending order.
SELECT
City
,COUNT(CustomerId) AS CustomerTotal
FROM Customers
GROUP BY City
ORDER BY CustomerTotal DESC

--6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT
c.FirstName || c.LastName || i.InvoiceId AS NewInvoiceId
FROM Customers c LEFT JOIN Invoices i ON c.CustomerId = i.CustomerId
WHERE NewInvoiceId LIKE 'AstridGruber%'
ORDER BY c.FirstName, c.LastName, i.InvoiceId
