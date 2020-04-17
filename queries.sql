-- Multi-Table Query Practice
SELECT * FROM [Order]
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName
    FROM Product P
    JOIN Category C
    ON P.CategoryId = C.Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id, S.CompanyName
    FROM [Order] O
    JOIN Shipper S
    ON O.ShipVia = S.Id
    WHERE OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT P.ProductName, OD.Quantity
FROM Product P
JOIN OrderDetail OD
ON P.Id = OD.ProductId
WHERE OrderID = '10251'
ORDER BY ProductName 

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.OrderId, C.CompanyName, E.LastName
FROM [Order] O
JOIN Customer C
ON O.CustomerId = C.Id
JOIN Employee E
ON O.EmployeeId = E.Id