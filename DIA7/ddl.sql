-- Paso 1: Crear una base de datos
create database nombre_base_de_datos;

-- Paso 2: Mostrar todas las tablas de una base de datos.
\dt;


-- Paso 3: Mostrar una tabla en específica.
\dt nombre_tabla;

-- Paso 4: Eliminar una tabla de la base de datos.
drop table nombre_tabla;

--Paso 5: Modificar un campo de una tabla.
ALTER TABLE nombre tabla ADD column_name datatype;