--1. Using a subquery, find the names of all the tracks for the album "Californication".
SELECT
t.Name,
t.AlbumId
FROM Tracks t 
WHERE t.AlbumId IN (SELECT
                    al.AlbumId
                    FROM Albums al
                    WHERE al.Title = 'Californication')
					
--2. Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT
c.CustomerID,
(c.FirstName || ' ' || c.LastName) AS FullName,
c.City,
c.Email,
COUNT(i.InvoiceId) AS TotalNumber
FROM Customers c INNER JOIN Invoices i
GROUP BY c.CustomerId
/* Different Way
FROM Customers c, Invoices i
WHERE c.CustomerID IN (SELECT
                        i.CustomerID
                        FROM Invoices i
                        )
GROUP BY c.CustomerId
*/

--3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT
t.Name,
al.Title,
ar.ArtistId,
t.TrackId
FROM ((Artists ar INNER JOIN Albums al ON ar.ArtistId = al.ArtistId) 
    INNER JOIN Tracks t ON al.AlbumId = t.AlbumId)
WHERE t.TrackId = 12 AND al.Title = 'For Those About To Rock We Salute You'

--4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT 
m.LastName AS Manager, e.LastName AS Employee
FROM Employees m, Employees e 
WHERE e.ReportsTo = m.EmployeeId

--5. Find the name and ID of the artists who do not have albums. 
SELECT 
ar.ArtistId,
ar.Name,
a.AlbumId
FROM (Artists ar LEFT JOIN Albums a ON ar.ArtistId = a.ArtistId)
WHERE a.AlbumId IS NULL

--6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT 
e.FirstName AS FirstName, 
e.LastName AS LastName
FROM Employees e

UNION

SELECT 
c.FirstName, 
c.LastName
FROM Customers c
ORDER BY LastName DESC

--7. See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT 
c.CustomerId,
(c.FirstName || ' ' || c.LastName) AS FullName,
c.City AS CustomerCity, 
i.BillingCity,
COUNT(i.InvoiceId) AS OrderAmount
FROM (Customers c INNER JOIN Invoices i ON c.CustomerId = i.CustomerId)
WHERE  CustomerCity != i.BillingCity
GROUP BY c.CustomerId
ORDER BY OrderAmount DESC