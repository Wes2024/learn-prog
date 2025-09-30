--SUBCONSULTAS (consultas dentro de otras)
SELECT ProductID,
       Quantity,
	   (SELECT ProductName FROM Products WHERE OD.ProductID = ProductID) AS Nombre
FROM OrderDetails AS OD


SELECT ProductID,
       Quantity,
	   (SELECT ProductName FROM Products WHERE OD.ProductID = ProductID) AS Nombre,
	   (SELECT Price FROM Products WHERE OD.ProductID = ProductID) AS Precio
FROM OrderDetails AS OD

SELECT nombre, total_vendido FROM (
SELECT ProductID, SUM(Quantity) AS total_vendido, 
		(SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS nombre,
	   (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS precio,
	   ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID))) as total_recaudado
FROM OrderDetails AS OD
WHERE precio > 40
GROUP BY ProductID
ORDER BY total_recaudado ASC
) WHERE total_vendido > 100;


--EJERCICIO COMPLEJO
SELECT FirstName,LastName, 
( 
  SELECT SUM(od.Quantity) FROM Orders AS o, OrderDetails AS od
  WHERE o.EmployeeID = e.EmployeeID AND o.OrderID = od.OrderID
) AS unidades_totales
FROM [Employees] e
WHERE unidades_totales < (SELECT AVG(unidades_totales) FROM ( 
 SELECT (SELECT SUM(od.Quantity) FROM Orders AS o, OrderDetails AS od
  WHERE o.EmployeeID = e2.EmployeeID AND o.OrderID = od.OrderID) AS unidades_totales
 FROM [Employees] e2
 GROUP BY e2.EmployeeID
 ) 
 )   
WITH TotalPorEmpleado AS (
  SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(od.Quantity) AS unidades_totales
  FROM Employees e
  INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
  INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
  GROUP BY e.EmployeeID, e.FirstName, e.LastName
),
PromedioUnidades AS (
  SELECT AVG(unidades_totales) AS promedio_unidades
  FROM TotalPorEmpleado
)

SELECT t.FirstName, t.LastName, t.unidades_totales
FROM TotalPorEmpleado t
CROSS JOIN PromedioUnidades p
WHERE t.unidades_totales < p.promedio_unidades;







