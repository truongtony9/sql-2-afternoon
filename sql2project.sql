-- Practice joins
#1
SELECT *
FROM Invoice i JOIN InvoiceLine il ON  il.InvoiceId = i.invoiceId
WHERE il.UnitPrice > 0.99;
#2
SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
From Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId;
#3
SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
From Customer c JOIN Employee e ON c.SupportRepId = e.EmployeeId;
#4
SELECT al.Title, ar.Name
FROM Album al JOIN Artist ar ON al.ArtistId = ar.ArtistId;
#5
SELECT pt.TrackId
FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';
#6
SELECT t.Name
FROM Track t JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;
#7
SELECT t.name, p.Name
FROM Track t JOIN PlaylistTrack pt ON t.trackId = pt.TrackId JOIN Playlist p ON pt.PlaylistId = p.PlaylistId
#8
SELECT t.Name, a.title
FROM Track t JOIN Album a ON t.AlbumId = a.AlbumId JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";
-- Practice nested queries
#1
SELECT *
FROM Invoice
WHERE InvoiceId IN (SELECT InvoiceId
FROM InvoiceLine
WHERE UnitPrice > 0.99);
#2
SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN (SELECT PlaylistId
FROM Playlist
WHERE Name = "Music");
#3
SELECT Name
FROM Track
WHERE TrackId IN (SELECT TrackId
FROM PlaylistTrack
WHERE PlaylistId = 5);
#4
Select *
FROM Track
WHERE GenreId IN (SELECT GenreId
FROM Genre
WHERE Name = "Comedy");
#5
SELECT *
FROM Track
WHERE AlbumId IN (SELECT AlbumId
FROM Album
WHERE Name = "Fireball")
#6
SELECT *
FROM Track
WHERE AlbumId IN ( 
  SELECT AlbumId
FROM Album
WHERE ArtistId IN ( 
    SELECT ArtistId
FROM Artist
WHERE Name = "Queen" 
  )
);
-- Practice updating ROWS
#1
UPDATE Customer 
SET Fax = null
WHERE Fax IS NOT null;
#2
UPDATE Customer 
SET Company = "Self"
WHERE Company IS NOT null;
#3
UPDATE Customer 
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";
#4
UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl";
#5
UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = ( SELECT GenreId
    FROM Genre
    WHERE Name = "Metal" ) AND Composer IS null;
-- Group BY
#1
SELECT Count(*), g.Name
FROM Track t JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;
#2
SELECT Count(*), g.Name
FROM Track t JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = "Pop" OR g.Name = "Rock"
GROUP BY g.Name;
#3
SELECT ar.Name, Count(*)
FROM Artist ar JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;
-- Use DISTINCT
#1
SELECT DISTINCT Composer
FROM Track;
#2
SELECT DISTINCT BillingPostalCode
FROM Invoice;
#3
SELECT DISTINCT Company
FROM Customer;
--Delete ROWS
#1
DELETE FROM practice_delete WHERE "Type" = "bronze";
#2
DELETE FROM practice_delete WHERE "Type" = "sliver";
#3
DELETE FROM practice_delete WHERE "Value" = 150;