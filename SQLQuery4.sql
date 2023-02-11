CREATE DATABASE SHOP
USE [SHOP]

CREATE TABLE Products (
Id INT IDENTITY PRIMARY KEY,
ProductName NVARCHAR(30) NOT NULL,
Manufacturer NVARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price MONEY NOT NULL
);
CREATE TABLE Customers (
Id INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders(
Id INT IDENTITY PRIMARY KEY,
Prodectld INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
Customerld INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
CreatedAt DATE NOT NULL,
ProductCount INT DEFAULT 1,
Price MONEY NOT NULL
);
CREATE VIEW OrdersProductsCustomers
AS
SELECT Orders.CreatedAt AS OrderDate,
	   Customers.FirstName AS Customer,
	   Products.ProductName AS Product
FROM Orders INNER JOIN Products ON Orders.Prodectld = Products.Id
			INNER JOIN Customers ON Orders.Customerld = Customers.Id

SELECT * FROM OrdersProductsCustomers

CREATE VIEW OrdersProductsCustomers2 (OrderDate, Customer, Product)
AS
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName
FROM Orders INNER JOIN Products ON Orders.Prodectld = Products.Id
			INNER JOIN Customers ON Orders.Customerld = Customers.Id

ALTER VIEW OrdersProductsCustomers
AS
SELECT Orders.CreatedAt AS OrderDate,
	   Customers.FirstName AS Customer,
	   Products.ProductName AS Product,
	   Products.Manufacturer AS Manufacturer
FROM Orders INNER JOIN Products ON Orders.Prodectld = Products.Id
			INNER JOIN Customers ON Orders.Customerld = Customers.Id

DROP VIEW OrdersProductsCustomers

CREATE VIEW ProductView
AS
SELECT ProductName AS Product, Manufacturer, Price
FROM Products

INSERT INTO ProductView (Product, Manufacturer, Price)
VALUES('Nokia 8', 'HDC Global', 18000)

SELECT*FROM ProductView

UPDATE ProductView
SET Price = 15000
WHERE Product = 'Nokia 8'

DELETE FROM ProductView
WHERE Product = 'Nokia 8'