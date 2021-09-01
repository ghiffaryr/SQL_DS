--1. How many albums does the artist Led Zeppelin have? 
SELECT
COUNT(DISTINCT al.AlbumId) AS AlbumTotal
,al.ArtistId
,ar.Name
FROM albums al, artists ar
WHERE  al.ArtistId in (SELECT
                        ar.ArtistId
                        FROM artists ar
                        WHERE ar.Name = 'Led Zeppelin')

--2. Create a list of album titles and the unit prices for the artist "Audioslave".
SELECT
al.Title
,t.UnitPrice
,ar.Name
FROM ((artists ar INNER JOIN albums al ON ar.ArtistId = al.ArtistId) 
                INNER JOIN tracks t ON al.AlbumId = t.AlbumId)
WHERE ar.Name = 'Audioslave'

--3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
SELECT
c.FirstName
,c.LastName
,i.InvoiceId
FROM (customers c LEFT JOIN invoices i ON c.CustomerId = i.CustomerId)
WHERE i.InvoiceId IS NULL

--4. Find the total price for each album. What is the total price for the album “Big Ones”?
SELECT
al.Title
,SUM(t.UnitPrice)
FROM (albums al INNER JOIN tracks t ON al.AlbumId = t.AlbumId)
WHERE al.Title = 'Big Ones'

--5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?
SELECT
i.InvoiceId
FROM invoices i CROSS JOIN invoice_items it