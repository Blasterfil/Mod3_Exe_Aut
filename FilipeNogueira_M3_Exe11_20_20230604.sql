USE Northwind

--EXE11
--In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.

SELECT FirstName, LastName, Title, CAST(BirthDate AS DATE) AS BirthDate FROM Employees
ORDER BY BirthDate

--EXE12
--Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, showing FirstName and LastName joined together in one column, with a space in-between.

SELECT FirstName, LastName, concat(FirstName, ' ', LastName) 'FullName'  FROM Employees

--EXE13
--In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together.
-- We’ll ignore the Discount field for now. In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.

SELECT ORDERID, PRODUCTID, UNITPRICE, QUANTITY, UNITPRICE * QUANTITY AS TOTALPRICE FROM OrderDetails
ORDER BY OrderID, ProductID

--EXE14
--How many customers do we have in the Customers table? Show one value only, and don’t rely on getting the recordcount at the end of a resultset.

SELECT COUNT(1) AS 'TOTAL CUSTOMERS' FROM Customers

--EXE15
--Show the date of the first order ever made in the Orders table.

SELECT TOP 1 OrderDate FROM ORDERS

--EXE16
--Show a list of countries where the Northwind company has customers.

SELECT COUNTRY FROM CUSTOMERS
GROUP BY COUNTRY

--EXE17
--Show a list of all the different values in the Customers table for ContactTitles.
--Also include a count for each ContactTitle.
--This is similar in concept to the previous question “Countries where there are customers”, except we now want a count for each ContactTitle.

SELECT ContactTitle, COUNT(1) AS 'Number of Titles of Contact' FROM Customers
GROUP BY ContactTitle

--EXE18
--We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID.

SELECT ProductID, ProductName, CompanyName FROM PRODUCTS
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
ORDER BY ProductID

--EXE19
--We’d like to show a list of the Orders that were made, including the Shipper that was used.
--Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.
--In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.

SELECT OrderID, OrderDate = CONVERT(DATE, OrderDate), CompanyName FROM ORDERS
JOIN SHIPPERS ON SHIPPERS.SHIPPERID = ORDERS.ShipVia
WHERE OrderID < 10300
ORDER BY OrderID

--EXE20
--For this problem, we’d like to see the total number of products in each category. Sort the results by the total number of products, in descending order.

SELECT COUNT(PRODUCTID) AS TotalProductsByCategory FROM PRODUCTS
GROUP BY CategoryID
ORDER BY COUNT(CategoryID) DESC
