--entrar a postgres
psql -U postgres

--Crear base de datos
CREATE DATABASE desafio2_Jimena_Traipe_888;

-- Seleccionar la base de datos creada:
USE desafio2_Jimena_Traipe_888;

--Crear la tabla "inscritos":
CREATE TABLE inscritos (
    cantidad INT,
    fecha DATE,
    fuente VARCHAR(50)
);

--Insertar los registros en la tabla:
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (44, '2021-01-01', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (56, '2021-01-01', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (39, '2021-01-02', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (81, '2021-01-02', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (12, '2021-01-03', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (91, '2021-01-03', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (48, '2021-01-04', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (45, '2021-01-04', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (55, '2021-01-05', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (33, '2021-01-05', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (18, '2021-01-06', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (12, '2021-01-06', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (34, '2021-01-07', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (24, '2021-01-07', 'Página');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (83, '2021-01-08', 'Blog');
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES (99, '2021-01-08', 'Página');

--Consultas SQL para responder las preguntas:

--1 ¿Cuantos registros hay?
SELECT COUNT(*) AS total_registros FROM inscritos;

--2 ¿Cuantos inscritos hay en total?
SELECT SUM(cantidad) AS total_inscritos FROM inscritos;

--3¿Cual o cuales son los registros de mayor actividad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos GROUP BY fecha;

--5 ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total_inscritos FROM inscritos GROUP BY fecha ORDER BY total_inscritos DESC LIMIT 1;


