--Cambiar nombres de las tablas para visualizarlas de otra forma
SELECT LastName AS apellido, FirstName AS nombre FROM Employees;

SELECT * FROM Products;

SELECT SUM(Price) AS suma_de_precios FROM Products
 
--Permite utilizar diferentes filtros para ordenar
--ASC ascendente , DESC desendente
SELECT * FROM Products ORDER BY Price ASC;
SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Products ORDER BY ProductName ASC NULLS LAST;
SELECT * FROM Products ORDER BY ProductName DESC NULLS FIRST;

--FUNCION RANDOM
SELECT * FROM Products ORDER BY RANDOM() NULLS LAST;


SELECT * FROM Products ORDER BY ProductName, SupplierID;

SELECT * FROM Suppliers ORDER BY SupplierName;
SELECT * FROM Suppliers ORDER BY City;

SELECT * FROM Orders ORDER BY OrderDate;
SELECT * FROM Orders ORDER BY CustomerID;

--Seleccionar solo elementos unicos sin duplicados con DISTINCT
SELECT DISTINCT ProductName FROM Products ORDER BY ProductName ASC;

--Clausula WHERE
SELECT ProductName FROM Products WHERE Price>=20;
SELECT * FROM Products WHERE ProductID=14;
SELECT * FROM Products WHERE Price<=40;
SELECT * FROM Products WHERE Price = 0;
SELECT * FROM Customers WHERE Country = 'Mexico';
SELECT * FROM Suppliers WHERE City = 'Salerno'
--Clausula para actualizar registros UPDATE
--UPDATE Products SET CategoryID = 3, SupplierID = 2 WHERE ProductID=78;

--Operador AND, OR, NOT
SELECT * FROM Products WHERE CategoryID=2 AND Price=10;

SELECT * FROM Customers WHERE CustomerID>=50 AND CustomerID < 55;
SELECT * FROM Employees WHERE FirstName = 'Nancy' OR FirstName = 'Anne';

SELECT * FROM Products WHERE (Price<20 OR CategoryID = 6) AND SupplierID = 7;

SELECT * FROM Orders WHERE (EmployeeID = 6 AND ShipperID = 1);

SELECT * FROM Products WHERE NOT Price > 40;

SELECT * FROM Customers WHERE NOT Country = 'USA'AND NOT Country = 'France';
SELECT * FROM Customers WHERE NOT (Country = 'USA'OR Country = 'France');
SELECT * FROM Customers WHERE Country NOT IN ('USA', 'France');

SELECT * FROM Customers WHERE (CustomerID >= 50 AND CustomerID < 55) AND NOT Country ='Germany';
SELECT * FROM Customers WHERE CustomerID >= 50 AND NOT (Country ='Germany' OR Country = 'UK' 
OR Country = 'Argentina' OR Country = 'Mexico'OR Country = 'USA' OR Country = 'France')
LIMIT 5;

--Ejercicio
SELECT * FROM Products WHERE NOT (CategoryID = 6 OR SupplierID = 1) AND Price <=30 
ORDER BY RANDOM() LIMIT 3;


--Distinto (! =) vs NOT
SELECT * FROM Customers WHERE Country != 'USA'; 





