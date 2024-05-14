-- esto es un comentario caxai

SELECT * FROM demo;
-- solo obtener la columna name
SELECT NAME FROM demo;
SELECT id FROM demo;
SELECT HINT from demo;
-- mezclar varias columnas
SELECT name, hint FROM demo;
SELECT hint, name FROM demo;

-- CLAUSULA WHERE --> filtra, condicion 
SELECT * FROM demo WHERE id = 5;
SELECT * FROM demo WHERE hint = '300';

-- WHERE con OR 
SELECT * FROM demo WHERE id = 5 OR id =8;
SELECT * FROM demo WHERE id = 5 OR id =2;
SELECT * FROM demo WHERE id = 5 OR hint;

--WHERE con AND 
SELECT * FROM demo WHERE id = 5 and id =2;

-- CLAUSUAL LIMIT
SELECT * FROM demo LIMIT 3;

-- CLAUSULA WHERE y LIMIT 
SELECT * FROM demo WHERE id < 6 LIMIT 3;

-- CLAUSULA ORDER BY 
SELECT * FROM demo ORDER BY id desc;
SELECT * FROM demo ORDER BY name desc; 
SELECT * FROM demo ORDER BY HINT desc; 
SELECT * FROM demo ORDER BY HINT Asc; --los numeros quedan primero: 1, 300, 3h 


SELECT HINT,name FROM demo ORDER BY 3 ASC; 
