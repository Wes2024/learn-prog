--JOINS
--INNER JOIN (Son una forma de combinar datos de dos tablas en bases de datos)

SELECT CustomerName,EmployeeID,OrderID FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

--crear una tabla
CREATE TABLE "Rewards" (
	"RewardsID" INTEGER,
	"EmployeeID" INTEGER,
	"Reward" INTEGER,
	"Month" TEXT,
	PRIMARY KEY("RewardsID" AUTOINCREMENT)
);

INSERT INTO Rewards (EmployeeID,Reward,Month) VALUES 
(3,200,"January"),
(2,180,"February"),
(5,250,"March"),
(1,280,"April"),
(8,160,"May"),
(null,null,"June");

SELECT FirstName|| ' ' ||LastName as FullName,Reward,Month FROM Employees e
INNER JOIN Rewards r ON e.EmployeeID = r.EmployeeID;

/*LEFT JOIN (muestra todos los registros de la tabla de la izquierda y las coincidencias
que existan en la tabla de la derecha. Si no hay coincidencias, muestra NULL en los campos 
de la tabla derecha.)
*/
SELECT FirstName|| ' ' ||LastName as FullName,Reward,Month FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID;
 
 /*RIGHT JOIN ( es lo contrario, ya que muestra todos los registros de la tabla de la derecha 
 y las coincidencias en la tabla de la izquierda. Si no hay coincidencias, muestra NULL
 en los campos de la tabla izquierda.)
 */
 SELECT FirstName|| ' ' ||LastName as FullName,Reward,Month FROM Employees e
RIGHT JOIN Rewards r ON e.EmployeeID = r.EmployeeID;
 /*
 El FULL JOIN (también llamado FULL OUTER JOIN, devuelve todos los registros de dos tablas,
 las filas que coinciden y también las que no tienen coincidencias en ninguna de ellas.
 Es como unir un LEFT JOIN y un RIGHT JOIN al mismo tiempo: muestra toda la informació n
 de ambas tablas, y en los lugares donde no haya coincidencias llena esos campos con
 valores NULL.
 */
SELECT FirstName|| ' ' ||LastName as FullName,Reward,Month FROM Employees e
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

UNION

SELECT FirstName|| ' ' ||LastName as FullName,Reward,Month FROM Employees e
RIGHT JOIN Rewards r ON e.EmployeeID = r.EmployeeID;

--UNION SIRVE PARA COMBINAR 2 O MAS TABLAS POR MEDIO DE CONSULTAS ELIMINANDO FILAS DUPLICADAS
--UNION ALL , SIRVE PARA COMBINAR 2 O MAS TABLAS POR MEDIO DE CONSULTAS PERO SIN ELIMINAR DUPLICADOS
--(ES NECESARIO TENER LOS 2 CAMPOS SIMILARES EN AMBAS TABLAS)

 /*
 El CROSS JOIN combina cada fila de una tabla con cada fila de otra, 
 generando todas las combinaciones posibles de ambas tablas. 
 Esto se conoce como producto cartesiano.
 En palabras simples, si tienes una tabla con 3 filas y otra con 4 filas, 
 el resultado de un CROSS JOIN tendrá 3 x 4 = 12 filas, cada una con una combinación
 diferente de las filas de ambas tablas. No se requiere condición de unión para 
 este tipo de join, ya que no filtra coincidencias, sino que muestra todas las 
 combinaciones posibles
 */
SELECT * FROM Customers c, Orders o

SELECT * 
FROM Customers
CROSS JOIN Orders;
