USE Practica_MIA;
/*REPORTE 1*/
SELECT
    proveedor.nombre,
    proveedor.telefono,
    orden.id_orden,
    SUM(precio) AS precio
FROM detalle_orden
INNER JOIN orden 
    ON orden.id_orden = detalle_orden.orden
INNER JOIN proveedor 
    ON proveedor.id_proveedor = orden.proveedor
GROUP BY proveedor.nombre
ORDER BY precio DESC
LIMIT 1;


/*REPORTE 2*/
SELECT
    cliente.nombre,
    cliente.telefono,
    detalle_venta.venta,
    SUM(detalle_venta.cantidad) 
        AS productos_comprados
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente 
    ON cliente.id_cliente = venta.cliente
GROUP BY detalle_venta.venta
ORDER BY productos_comprados DESC
LIMIT 1;

/*REPORTE 3*/
SELECT 
    proveedor.direccion AS Direccion, 
    region.nombre AS Region, 
    ciudad.nombre AS Ciudad,
    proveedor.codigo_postal AS Codigo_Postal,
    count(region) as Cantidad 
    from proveedor
    INNER JOIN region ON region.id_region = proveedor.region
    INNER JOIN ciudad ON ciudad.id_ciudad = proveedor.ciudad
    GROUP BY Direccion, Region, Ciudad, Codigo_Postal
    ORDER BY Cantidad DESC;
    

/*REPORTE 4*/
SELECT
    cliente.id_cliente AS No_Cliente,
    cliente.nombre AS Nombre,
    count(categoria_producto.Nombre="Cheese") 
    AS cat_cheese,
    SUM(detalle_venta.cantidad*detalle_venta.precio)
        AS Total
FROM venta
INNER JOIN detalle_venta 
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
INNER JOIN producto
    ON detalle_venta.producto = producto.id_producto
INNER JOIN categoria_producto
    ON categoria_producto.id_categoria = producto.categoria
WHERE categoria_producto.id_categoria = producto.categoria
    AND categoria_producto.nombre = "Cheese" 
GROUP BY No_Cliente
ORDER BY cat_cheese DESC
LIMIT 5;

/*REPORTE 5*/
(SELECT 
    MONTH(cliente.fecha_registro) 
        AS Mes_Registro,
    cliente.nombre 
        AS Nombre,
    SUM(detalle_venta.cantidad*detalle_venta.precio)
        AS Total
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
GROUP BY cliente.id_cliente
ORDER BY Total DESC
LIMIT 5)
UNION ALL
(SELECT 
    MONTH(cliente.fecha_registro) 
        AS Mes_Registro,
    cliente.nombre 
        AS Nombre,
    SUM(detalle_venta.cantidad*detalle_venta.precio)
        AS Total
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
GROUP BY cliente.id_cliente
ORDER BY Total ASC
LIMIT 5);

/*REPORTE 6*/
(SELECT 
    categoria_producto.nombre 
        AS Categoria,
    SUM(detalle_venta.precio*detalle_venta.cantidad) 
        AS Total
FROM detalle_venta
INNER JOIN venta
    ON detalle_venta.venta = venta.id_venta
INNER JOIN producto
    ON detalle_venta.producto = producto.id_producto
INNER JOIN categoria_producto
    ON categoria_producto.id_categoria = producto.categoria
GROUP BY Categoria
ORDER BY Total DESC
LIMIT 1)
UNION ALL(
SELECT 
    categoria_producto.nombre 
        AS Categoria,
    SUM(detalle_venta.precio*detalle_venta.cantidad) 
        AS Total
FROM detalle_venta
INNER JOIN venta
    ON detalle_venta.venta = venta.id_venta
INNER JOIN producto
    ON detalle_venta.producto = producto.id_producto
INNER JOIN categoria_producto
    ON categoria_producto.id_categoria = producto.categoria
GROUP BY Categoria
ORDER BY Total ASC
LIMIT 1);

/*REPORTE 7*/
SELECT
    proveedor.nombre AS Proveedor,
    SUM(detalle_orden.cantidad*detalle_orden.precio)
        AS Total
FROM detalle_orden
INNER JOIN orden
    ON orden.id_orden = detalle_orden.orden
INNER JOIN proveedor 
    ON proveedor.id_proveedor = orden.proveedor
INNER JOIN producto
    ON producto.id_producto = detalle_orden.producto
INNER JOIN categoria_producto
    ON categoria_producto.id_categoria = producto.categoria
WHERE categoria_producto.id_categoria = producto.categoria
    AND categoria_producto.nombre = "Fresh Vegetables" 
GROUP BY Proveedor
ORDER BY Total DESC
LIMIT 5;

/*REPORTE 8*/
(SELECT
    cliente.direccion AS Direccion,
    region.nombre AS Region,
    ciudad.nombre AS Ciudad,
    cliente.codigo_postal AS Codigo_Postal
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
INNER JOIN ciudad
    ON ciudad.id_ciudad = cliente.ciudad
INNER JOIN region
    ON region.id_region = cliente.region
GROUP BY cliente.id_cliente
ORDER BY SUM(detalle_venta.cantidad*detalle_venta.precio) DESC
LIMIT 5)
UNION ALL(
SELECT
    cliente.direccion AS Direccion,
    region.nombre AS Region,
    ciudad.nombre AS Ciudad,
    cliente.codigo_postal AS Codigo_Postal
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
INNER JOIN ciudad
    ON ciudad.id_ciudad = cliente.ciudad
INNER JOIN region
    ON region.id_region = cliente.region
GROUP BY cliente.id_cliente
ORDER BY SUM(detalle_venta.cantidad*detalle_venta.precio) ASC
LIMIT 5
)
/*REPORTE 9*/
SELECT
    proveedor.nombre AS Nombre,
    proveedor.telefono AS Telefono,
    orden.id_orden AS No_Orden,
    SUM(detalle_orden.precio*detalle_orden.cantidad)
        AS Total,
    SUM(detalle_orden.cantidad) AS No_Elementos
FROM detalle_orden
INNER JOIN orden 
    ON orden.id_orden = detalle_orden.orden
INNER JOIN proveedor 
    ON proveedor.id_proveedor = orden.proveedor
GROUP BY No_Orden
ORDER BY No_Elementos ASC
LIMIT 5;


/*REPORTE 10*/
SELECT
    cliente.nombre AS Cliente,
    SUM(detalle_venta.cantidad)
        AS Total_Productos
FROM detalle_venta
INNER JOIN venta
    ON venta.id_venta = detalle_venta.venta
INNER JOIN cliente
    ON cliente.id_cliente = venta.cliente
INNER JOIN producto
    ON producto.id_producto = detalle_venta.producto
INNER JOIN categoria_producto
    ON categoria_producto.id_categoria = producto.categoria
WHERE categoria_producto.id_categoria = producto.categoria
    AND categoria_producto.nombre = "Seafood" 
GROUP BY Cliente
ORDER BY Total_Productos DESC
LIMIT 10;
