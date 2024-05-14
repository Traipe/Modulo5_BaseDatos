-- Creación de la tabla 'productos'
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2)
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'productos'
INSERT INTO productos (id_producto, nombre, precio)
VALUES
    (1, 'Producto A', 20.99),
    (2, 'Producto B', 15.50),
    (3, 'Producto C', 25.75),
    (4, 'Producto D', 18.50),
    (5, 'Producto E', 30.25),
    (6, 'Producto F', 12.75),
    (7, 'Producto G', 22.99),
    (8, 'Producto H', 15.00),
    (9, 'Producto I', 28.50),
    (10, 'Producto J', 19.99),
    (11, 'Producto K', 10.50),
    (12, 'Producto L', 24.75),
    (13, 'Producto M', 16.50);

-- Creación de la tabla 'pedidos_detalle'
CREATE TABLE pedidos_detalle (
    id_pedido_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'pedidos_detalle'
INSERT INTO pedidos_detalle (id_pedido_detalle, id_pedido, id_producto, cantidad)
VALUES
    (1, 101, 1, 3),
    (2, 101, 2, 2),
    (3, 102, 1, 1),
    (4, 103, 3, 4),
    (5, 104, 4, 2),
    (6, 104, 5, 1),
    (7, 105, 6, 3),
    (8, 105, 7, 2),
    (9, 106, 8, 1),
    (10, 107, 9, 4),
    (11, 107, 10, 2),
    (12, 108, 11, 3),
    (13, 109, 12, 2),
    (14, 110, 13, 1);

-- SUBCONSULTAS

select * from productos;
select * from pedidos_detalle;

-- obtener todos los productos que el precio esté sobre el precio promedio

--paso1

select AVG(precio) from productos; --20.1515384615384615

select * from productos where precio > 20.1515384615384615;

select * from productos where precio > (select AVG(precio) from productos);

-- encontrar los productos que se han vendido mas de una vez
--paso2

select * from productos;
select * from pedidos_detalle;
-- agrupar por producto

select id_producto, count(id_producto) from pedidos_detalle group by id_producto;

select id_producto, count(id_producto) 
from pedidos_detalle 
where count(id_producto) > 1 
group by id_producto;
--ERROR:  no se permiten funciones de agregación en WHERE
--LINE 3: where count(id_producto) > 1

select id_producto, count(id_producto) as cantidad
from pedidos_detalle  
group by id_producto;

-- esto no estaria bien
select id_producto, count(id_producto) as cantidad
from pedidos_detalle  
where cantidad > 1
group by id_producto;
-- nonono

select id_producto, count(id_producto) as cant
from pedidos_detalle  
where cant > 1
group by id_producto;
-- esto tampoco porke : ERROR:  no existe la columna «cant» LINE 3: where cant > 1

-- consulta variante
--con esto tratamos el resultado correcto como una tabla temporal
--dentro del parentesis del from se le agrega la query anterior, pero sin el ;

select * 
from (
    select id_producto, count(id_producto) as cant
from pedidos_detalle  
group by id_producto
) as temporal
;
-- le asignamos un alias "temporal" y ejecutamos
-- y le pedimos que solo filtre el item con 2 cantidades usando where

select * 
from (
    select id_producto, count(id_producto) as cant
from pedidos_detalle  
group by id_producto
) as temporal
where cant > 1
;
-- Aquí nos entrega el detalle del producto más vendido
-- idproducto:    1 | nombre: Producto A |  precio: 20.99
-- Aquí se hicieron 3 consultas


--  id_producto | cant
-------------+------
           1 |    2
(1 row)


--El IN busca los numeros entregados y entrega SOLO los que encuentra
select * 
from productos
where id_producto IN (20,1,55,3 );
-- me muestra solo 2 productos, uno con id 1 y otro de id 3.

