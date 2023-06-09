SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SHOW COLUMNS FROM producto; /*CAMBIO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
SELECT nombre, precio, ROUND(precio*1.06,2) FROM producto;
SELECT nombre, precio AS euros, ROUND(precio*1.06,2) AS dolars FROM producto;
SELECT UCASE(nombre) AS nombre, precio FROM producto;
SELECT LCASE(nombre) AS nombre, precio FROM producto;
SELECT nombre, REPLACE(nombre, SUBSTR(nombre, 1,2), UCASE(SUBSTR(nombre,1,2))) FROM fabricante;
SELECT nombre, ROUND(precio) AS precioArrodonit FROM producto;
SELECT nombre, TRUNCATE(precio,0) AS precioTruncado FROM producto;
SELECT nombre, codigo_fabricante FROM producto;
SELECT DISTINCT nombre, codigo_fabricante FROM producto GROUP BY codigo_fabricante; /*CAMBIO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
SELECT * FROM fabricante ORDER BY nombre;
SELECT * FROM fabricante ORDER BY nombre DESC;
SELECT * FROM producto ORDER BY nombre ASC, precio DESC;  /*CAMBIO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT * FROM producto ORDER BY precio LIMIT 1;
SELECT * FROM producto ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante=2;
SELECT producto.nombre, precio, fabricante.nombre AS nombre_empresa FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre AS nombre_empresa FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY nombre_empresa;
SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto, fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_empresa FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_empresa FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio LIMIT 1;
SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_empresa FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
¡ERROR! - SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo=2;
¡ERROR! - SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo=6 AND precio>600;
¡ERROR! - SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo=1 OR fabricante.codigo=3 OR fabricante.codigo=5 ORDER BY codigo_fabricante;
¡ERROR! - SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo IN(1,3,5) ORDER BY codigo_fabricante;
SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS producto_nombre, precio FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%e";
SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS producto_nombre, precio FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%w%";
SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_fabricante FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio>=180 ORDER BY precio DESC, nombre_producto;
SELECT fabricante.codigo, fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.codigo = producto.codigo_fabricante IS NULL;
¡ERROR! - SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE codigo_fabricante=2;

¡ERROR! - SELECT producto.codigo, fabricante.nombre AS nombre_empresa, producto.nombre AS nombre_producto, precio FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo_fabricante=2 ORDER BY precio DESC LIMIT 1;
¡ERROR! - SELECT producto.codigo, fabricante.nombre AS nombre_empresa, producto.nombre AS nombre_producto, precio FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo_fabricante=3 ORDER BY precio LIMIT 1;