--OPERADOR BETWEEN (Seleccionar valores en un rango determinado)
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40;
SELECT * FROM Products WHERE NOT Price BETWEEN 20 AND 40 AND CategoryID = 6;

SELECT * FROM Employees WHERE BirthDate BETWEEN '1960-0-1' AND '1970-0-1';

--OPERADOR LIKE (Buscar datos con comodines(caracteres = 2) pero es limitado)
-- % puede terminar con cualquier cosa o que tenga el caracter es suficiente %er%
-- _ hace referencia a un caracter cualquiera
SELECT * FROM Employees WHERE LastName LIKE '%Fuller';
SELECT * FROM Employees WHERE LastName LIKE 'Fu%';
SELECT * FROM Employees WHERE LastName LIKE '%u%';

SELECT * FROM Employees 
WHERE LastName LIKE 'f%';

--IS NULL, IS NOT NULL
SELECT * FROM Products WHERE ProductName IS NOT NULL 
ORDER BY ProductName ASC;

--IN, NOT IN (OPERADORES LOGICOS)
SELECT * FROM Products WHERE SupplierID IN (3,4,5,6);

SELECT * FROM Employees WHERE LastName IN ('Fuller','King');

SELECT * FROM Employees WHERE LastName NOT IN ('Fuller','King');

--SUBCONSULTAS FUNCIONES DE AGREGACIÓN 
SELECT count(FirstName) AS Cantidad_de_nombres FROM Employees;
SELECT sum(Price) AS total_precios FROM Products;
SELECT round(AVG(Price),3) AS promedio_de_precios FROM Products;
SELECT ProductName,MIN(Price) as precio_minimo FROM Products WHERE ProductName IS NOT NULL;
SELECT ProductName,MAX(Price) as precio_minimo FROM Products;

--GROUP BY Y HAVING
--GROUP BY se agrupa uno o varios registros segun varios valores de las columnas y regresa el primer valor de la columna
SELECT CategoryID,round(AVG(Price)) AS Promedio FROM Products
WHERE ProductName IS NOT NULL
GROUP BY CategoryID 
--ORDER BY Promedio DESC;
--HAVING es como un where pero para grupos (funciones de agregacion), NO PARA REGISTROS, se usa luego de un group by
SELECT SupplierID, CategoryID,round(AVG(Price)) AS Promedio FROM Products
WHERE ProductName IS NOT NULL
GROUP BY SupplierID
HAVING Promedio > 40;

/*
1.PRIMERO SE SELECCIONAN LOS REGISTROS
2.SE FILTRAN LOS REGISTROS CON CONDICIONES
3.AGRUPAR REGISTROS CON GROUP BY
4.SE UTILIZA HAVING CON GRUPOS
5.ORDER BY , SE HACE EL ORDENAMIENTO

SELECT... FROM ....
WHERE.....
GROUP BY ....
HAVING .....
ORDER BY .....
*/

--NO SE PUEDE USAR UNA FUNCION DE AGREGACION CON EL RESULTADO DE OTRA
SELECT ProductID, sum(Quantity) AS sumas_cantidades FROM OrderDetails
GROUP BY ProductID
--HAVING sumas_cantidades < 50
ORDER BY sumas_cantidades ASC
LIMIT 1; 

