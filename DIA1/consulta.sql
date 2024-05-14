-- lo primero a realizar es conectarse a la base de datos desde la terminal
psql -U postgres

-- Paso 2: Crea una base de datos llamada prueba1
CREATE DATABASE prueba1;

-- Paso 3: Lista las bases de datos creadas.
\l

-- Paso 4: Conéctate a la base de datos.
\c prueba1;

-- paso x: salir de la terminal de Postgresql
\q

-- listar las tablas de una base de datos
\d 

-- describe/detalla una tabla
\d clientes
\d+ clientes


-- INSERTAR VALORES A UNA TABLA 
--Paso 6: Insertar valores a los campos nombre y apellido
insert into clientes (nombre, apellido) values ('Julio','Palma');
insert into clientes (nombre, apellido) values ('Julio','Palma');
insert into clientes (nombre, apellido) values ('Cepi', 'Llito');
insert into clientes (apellido, nombre) values ('Gatica', 'Najla');


-- CONSULTAR REGISTROS EN UNA TABLA
select * from clientes order by nombre desc;
select * from clientes order by nombre asc;

-- BORRAR ALGUN REGISTRO DE LA TABLA
DELETE FROM clientes WHERE nombre = 'Julio' and apellido = 'Palma';

-- ELIMINAR
DELETE FROM clientes ;