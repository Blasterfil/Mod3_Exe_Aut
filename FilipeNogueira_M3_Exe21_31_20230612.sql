USE NORTHWIND

--EXE21
--In the Customers table, show the total number of customers per Country and City.

SELECT COUNT(CustomerID) AS TotalCustomerByCountry , Country, City FROM Customers
GROUP BY Country, City
ORDER BY COUNT(*) DESC

--EXE22
--What products do we have in our inventory that should be reordered?
--For now, just use the fields UnitsInStock and ReorderLevel, where UnitsInStock is less than the ReorderLevel, ignoring the fields UnitsOnOrder and Discontinued. Order the results by ProductID.

SELECT ProductName, UnitsInStock, ReorderLevel FROM PRODUCTS
WHERE UnitsInStock < ReorderLevel
ORDER BY ProductID

--EXE23
--Now we need to incorporate these fields—UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued—into our calculation. We’ll define “products that need reordering” with the following:
--UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel
--The Discontinued flag is false (0).

SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM PRODUCTS
WHERE UnitsInStock + UnitsOnOrder <= ReorderLevel AND Discontinued = 0
ORDER BY ProductID

--EXE24
--A salesperson for Northwind is going on a business trip to visit customers, and would like to see a list of all customers, sorted by region, alphabetically.
--However, he wants the customers with no region (null in the Region field) to be at the end, instead of at the top, where you’d normally find the null values.
--Within the same region, companies should be sorted by CustomerID.
SELECT CUSTOMERID, COMPANYNAME, REGION FROM CUSTOMERS ORDER BY 
    CASE 
        WHEN REGION IS NULL THEN 1
        ELSE 0
    END, REGION, CUSTOMERID

--EXE25
--Some of the countries we ship to have very high freight charges.
--We'd like to investigate some more shipping options for our customers, to be able to offer them lower freight charges.
--Return the three ship countries with the highest average freight overall, in descending order by average freight.

SELECT  TOP 3 ShipCountry, FreightAverage = AVG(Freight) FROM Orders
GROUP BY ShipCountry
ORDER BY FreightAverage DESC

--EXE26
--We're continuing on the question above on high freight charges. Now, instead of using all the orders we have, we only want to see orders from the year 2015.

SELECT  TOP 3 ShipCountry, FreightAverage = AVG(Freight) FROM Orders
WHERE OrderDate >= '20150101' AND OrderDate <= '20151231'
GROUP BY ShipCountry
ORDER BY FreightAverage DESC

--EXE27
--What is the OrderID of the order that the (incorrect) answer above is missing?
10806

--EXE28
--We're continuing to work on high freight charges. 
--We now want to get the three ship countries with the highest average freight charges.
--But instead of filtering for a particular year, we want to use the last 12 months of order data, using as the end date the last OrderDate in Orders.

SELECT TOP 3 ShipCountry, FreightAverage = AVG(Freight) FROM Orders
WHERE OrderDate >= DATEADD(YEAR, -1, (SELECT MAX(Orderdate) FROM Orders))
GROUP BY ShipCountry
ORDER BY FreightAverage DESC

--EXE29
--We're doing inventory, and need to show information like the below, for all orders. Sort by OrderID and Product ID.

SELECT Employees.EmployeeID, LastName, Orders.OrderId, ProductName, Quantity FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
ORDER BY OrderID

--EXE30
--There are some customers who have never actually placed an order. Show these customers.

SELECT Customers.CustomerID, Orders.CustomerId AS Orders FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.CustomerID IS NULL

--EXE31
--One employee (Margaret Peacock, EmployeeID 4) has placed the most orders.
--However, there are some customers who've never placed an order with her.
--Show only those customers who have never placed an order with her.

SELECT Customers.CustomerID AS Customers, Orders.CustomerID AS Orders FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID AND Orders.EmployeeID = 4
WHERE Orders.CustomerID IS NULL