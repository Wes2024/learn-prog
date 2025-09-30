--obtener registros de la tabla
SELECT * FROM users;
SELECT name,age FROM users;

--insertar registros a la tabla
INSERT INTO users (name,lastname,age) VALUES ('Weslei','Salinas',24);
INSERT INTO users (name, lastname, age) VALUES ('Pedro','Fernandez', 40);
INSERT INTO users (name, lastname, age) VALUES ('Carla','Perez',28);
--insertar varios registros a la tabla
INSERT INTO users (name, lastname, age) VALUES ('Jose','Palmas',30),
											   ('Maria', 'Josefina', 45),
											   ('Carlos','Sierra',25);

											   
--eliminar registros de la tabla por edad (age)
DELETE FROM users WHERE age = 24;
DELETE FROM users;

DELETE FROM med_appts WHERE id_appt = 1;

--tabla med_appts
SELECT * FROM med_appts;
INSERT INTO med_appts (id_doctor, id_user, reason,schedule) VALUES (2,3,'Dolor de cabeza','11:30');

--verificar tablas de la base de datos
PRAGMA database_list;
SELECT name FROM sqlite_master WHERE type='table';


SELECT * FROM med_appts WHERE users ;
