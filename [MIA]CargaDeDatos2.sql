
USE Practica_MIA;
/*INSERCCIÓN DE REGIÓN */
INSERT INTO region(nombre) SELECT distinct region FROM Carga;

/*INSERCCIÓN DE CATEGORIA DE PRODUCTO*/
INSERT INTO categoria_producto(nombre) SELECT DISTINCT categoria_producto FROM Carga;

/*INSERCCIÓN DE COMPANIA*/
INSERT INTO compania(nombre,contacto,correo,telefono) 
SELECT DISTINCT nombre_compania, contacto_compania, correo_compania, telefono_compania 
FROM Carga;

/*INSERCCIÓN DE PRODUCTO*/
INSERT INTO producto(nombre,precio,categoria)
SELECT DISTINCT Carga.producto, Carga.precio_unitario, categoria_producto.id_categoria
FROM Carga
INNER JOIN categoria_producto ON categoria_producto.nombre = Carga.categoria_producto;

/*INSERCCIÓN DE CIUDAD*/
INSERT INTO ciudad(nombre) SELECT DISTINCT ciudad FROM Carga;

/*INSERCCION DE CLIENTE*/
INSERT INTO cliente(nombre, correo, telefono, fecha_registro, direccion, codigo_postal, ciudad, region)
SELECT DISTINCT Carga.nombre, Carga.correo, Carga.telefono, STR_TO_DATE(Carga.fecha_registro,'%d/%m/%Y'), 
Carga.direccion, Carga.codigo_postal, ciudad.id_ciudad, region.id_region
FROM Carga
INNER JOIN ciudad ON Carga.ciudad = ciudad.nombre
INNER JOIN region ON Carga.region = region.nombre
WHERE Carga.tipo = "C";

/*INSERCCIÓN DE PROVEEDOR*/
INSERT INTO proveedor(nombre, correo, telefono, fecha_registro, direccion, codigo_postal, ciudad, region)
SELECT DISTINCT Carga.nombre, Carga.correo, Carga.telefono, STR_TO_DATE(Carga.fecha_registro,'%d/%m/%Y'), 
Carga.direccion, Carga.codigo_postal, ciudad.id_ciudad, region.id_region
FROM Carga
INNER JOIN ciudad ON Carga.ciudad = ciudad.nombre
INNER JOIN region ON Carga.region = region.nombre
WHERE Carga.tipo = "P";

/*INSERCCIÓN detalle_compania*/
INSERT INTO detalle_compania(proveedor, compania)
SELECT DISTINCT proveedor.id_proveedor, compania.id_compania 
FROM Carga
INNER JOIN proveedor ON Carga.nombre = proveedor.nombre
INNER JOIN compania ON Carga.nombre_compania = compania.nombre
WHERE Carga.tipo = "P";

/*INSERCCIÓN DE ORDEN*/
INSERT INTO orden(proveedor)
SELECT DISTINCT proveedor.id_proveedor
FROM Carga
INNER JOIN proveedor ON Carga.nombre = proveedor.nombre
WHERE Carga.tipo = "P";

/*INSERCCIÓN DE VENTA*/
INSERT INTO venta(cliente)
SELECT DISTINCT cliente.id_cliente
FROM Carga
INNER JOIN cliente ON Carga.nombre = cliente.nombre
WHERE Carga.tipo = "C";

/*INSERCCION DETALLE ORDEN*/
INSERT INTO detalle_orden(orden, producto, cantidad, precio)
SELECT orden.id_orden, producto.id_producto, Carga.cantidad, Carga.precio_unitario
FROM Carga
INNER JOIN proveedor ON proveedor.nombre = Carga.nombre AND Carga.tipo = "P"
INNER JOIN orden ON orden.proveedor = proveedor.id_proveedor
INNER JOIN producto ON producto.nombre = Carga.producto
ORDER BY 1 ASC;


/*INSERCCION DETALLE VENTA*/
INSERT INTO detalle_venta(venta, producto, cantidad, precio)
SELECT venta.id_venta, producto.id_producto, Carga.cantidad, Carga.precio_unitario
FROM Carga
INNER JOIN cliente ON cliente.nombre = Carga.nombre AND Carga.tipo = "C"
INNER JOIN venta ON venta.cliente = cliente.id_cliente
INNER JOIN producto ON producto.nombre = Carga.producto
ORDER BY 1 ASC;

