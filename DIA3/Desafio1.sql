--1 Comienza a grabar:

--2 Entra al terminal:

-- 3 Ingresa al cliente de PostgreSQL desde el terminal:
psql -U postgres 

-- 4 Crea una base de datos xon tu nombre apellido y 3 digitos:
CREATE DATABASE desafio1_jimena_traipe_888;

-- 5  Ingresa a la base de datos creada:
\c desafio1_jimena_traipe_888;

-- 6 Crea una tabla llamada clientes y muestra la info de la tabla:
CREATE TABLE clientes (
    email VARCHAR(50),
    nombre VARCHAR,
    telefono VARCHAR(16),
    empresa VARCHAR(50),
    prioridad SMALLINT
);


-- 7 Ingresa 5 clientes distintos con distintas prioridades:
INSERT INTO clientes VALUES ('cliente1@correo.com', 'María González', '11111111', 'Empresa X', 10);
INSERT INTO clientes VALUES ('cliente2@correo.com', 'Ana Rodríguez', '22222222', 'Empresa Y', 2);
INSERT INTO clientes VALUES ('cliente3@correo.com', 'Sofía López', '33333333', 'Empresa X', 6);
INSERT INTO clientes VALUES ('cliente4@correo.com', 'Luisa García', '44444444', 'Empresa Z', 9);
INSERT INTO clientes VALUES ('cliente5@correo.com', 'Carmen Martínez', '55555555', 'Empresa W', 1);

-- info tabla:
SELECT * from clientes;

--8 Selecciona los tres clientes de mayor prioridad:
SELECT * FROM clientes
ORDER BY prioridad DESC
LIMIT 3;


-- 9 Selecciona una prioridad o una empresa para obtener 2 registros:

--prioridad igual a 10
SELECT * FROM clientes
WHERE prioridad = 10
LIMIT 2;

-- prioridad igual a empresa X

SELECT * FROM clientes
WHERE empresa = 'Empresa X'
LIMIT 2;


-- 10 salir de postgresSQL
\q
