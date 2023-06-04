USE Northwind

--EXE1
--Which shippers do we have? We have a table called Shippers. Return all the fields from all the shippers.

SELECT * FROM Shippers

--EXE2
--In the Categories table, selecting all the fields using this SQL: "Select * from Categories" will return 8 columns. We only want to see two columns, CategoryName and Description.

SELECT CategoryName, Description FROM Categories

--EXE3
--We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. Write a SQL statement that returns only those employees.

SELECT FirstName, LastName, HireDate FROM Employees
WHERE Title = 'Sales Representative'

--EXE4
--Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States.

SELECT FirstName, LastName, HireDate FROM Employees
WHERE Title = 'Sales Representative'AND Country = 'USA'

--EXE5
--Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.

SELECT * FROM Orders
WHERE EmployeeID = 5

--EXE6
--In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager.

SELECT SupplierID, ContactName, ContactTitle FROM Suppliers
WHERE ContactTitle != 'Marketing Manager'

--EXE7
--In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso”.

SELECT PRODUCTID, PRODUCTNAME FROM Products
WHERE ProductName LIKE '%queso%'

--EXE8
--Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

SELECT OrderID, CustomerID, ShipCountry FROM ORDERS
WHERE ShipCountry = 'FRANCE' OR ShipCountry = 'BELGIUM'

--EXE9
--Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders from any Latin American country.
--But we don’t have a list of Latin American countries in a table in the Northwind database.
--So, we’re going to just use this list of Latin American countries that happen to be in the Orders table:
--Brazil
--Mexico
--Argentina
--Venezuela It doesn’t make sense to use multiple Or statements anymore, it would get too convoluted. Use the In statement.

SELECT OrderID, CustomerID, ShipCountry FROM ORDERS
WHERE ShipCountry IN ('BRAZIL', 'MEXICO', 'ARGENTINA', 'VENEZUELA')

--EXE10
--For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first.

SELECT FirstName, LastName, Title, BirthDate FROM Employees
ORDER BY BirthDate