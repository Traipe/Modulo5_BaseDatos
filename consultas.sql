-- Lo primero a realizar es conectarse a la base de datos
--Paso 1: Accedemos al cliente de postgresql via terminal.
psql -U postgres

-- Paso 2: Crear una base de datos llamada prueba1.
CREATE DATABASE prueba1; --SENTENCIA SQL

-- Paso 3: Lista las bases de datos creadas.
\l --COMANDO, va sin ;

-- Paso 4: Conéctate a la base de datos.
\c prueba1 --comando

-- Paso 4.5: Salir de la terminal de postgres
\q

-- Paso 5: CREACION DE UNA TABLA usa palabras reservadas
-- VARCHAR ---> string
create table clientes(
nombre varchar(30),
apellido varchar(30)
);

--- Listar las tablas de la base de datos:
\d

--- Muestra el detalle de la tabla
\d clientes
\d+ clientes

-- Paso 6: INSERTAR VALORES A UNA TABLA a los campos nombre y apellido.
insert into clientes (nombre, apellido) values ('Najla','Gatica');
insert into clientes (nombre, apellido) values ('Salomé','Fierro');
insert into clientes values ('Israel', 'Palma');
insert into clientes (apellido, nombre) values ('Traipe','Jimena');


-- Paso 7: CONSULTAMOS los datos ingresados con:
select * from clientes;

-- Paso 7a: CONSULTAMOS por orden descendente de nombre:
select * from clientes order by nombre desc;

-- Paso 7b: CONSULTAMOS por orden alfabetico de apellido:
select * from clientes order by apellido asc;

-- BORRAR ALGÚN REGISTRO DE LA TABLA
DELETE FROM clientes WHERE nombre = 'Israel'; -- ahí borro solo a israel

-- ELIMINAR datos de la tabla (BORRA TODOS LOS REGISTROS)
DELETE FROM clientes;

-- ELIMINAR la tabla completa
DROP table nombre_tabla;

-- ELIMINAR la base de datos
DROP DATABASE nombre_database;

--INVESTIGAR PRIMARY KEY / FOREIGN KEY
Clave Primaria (Primary Key):
--Es un atributo (o conjunto de atributos) que identifica de manera ÚNICA cada fila en una tabla.
--No puede contener valores duplicados ni nulos.
--Se define utilizando la restricción PRIMARY KEY al crear o alterar una tabla.

CREATE TABLE Ejemplo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);


Clave Externa (Foreign Key):
--Es un atributo (o conjunto de atributos) en una tabla que hace referencia a la clave primaria de otra tabla.
--Se utiliza para establecer relaciones entre tablas y mantener la integridad referencial.
--Se define utilizando la restricción FOREIGN KEY al crear o alterar una tabla.

CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    fecha DATE,
    total NUMERIC(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);



-- FUNCIONES DE AGREGADO
SELECT SUM(columna) FROM tabla;

SELECT AVG(columna) FROM tabla;

SELECT MAX(columna) FROM tabla;

SELECT MIN(columna) FROM tabla;

SELECT COUNT(*) FROM tabla;

--- El IN busca solo lo que encuentra
--filtra o comprueba si un valor existe en una lista determinada
SELECT * FROM productos WHERE id_producto IN (20,1,55,3);

---- MODIFICAR UNA TABLA
ALTER TABLE nombre_tabla ADD PRIMARY KEY (rut);


******************************************************
--CREACION DE USUARIO
CREATE USER JIMENA WITH PASSWORD 'Admin1234';
---crear base de datos para el usuario
CREATE DATABASE JIMENA WITH OWNER JIMENA;
--ASIGNAR PERMISOS
ALTER USER jimena WITH SUPERUSER CREATEDB CREATEROLE;

--entrar a la base de datos: 
psql -U jimena

SELECT usename FROM pg_user;