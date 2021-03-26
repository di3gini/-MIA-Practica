USE Practica_MIA;
LOAD DATA LOCAL INFILE '/home/diego/Escritorio/datos.csv'
INTO TABLE Carga
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
	nombre_compania,
    contacto_compania,
    correo_compania,
    telefono_compania,
    tipo, 
    nombre, 
    correo, 
    telefono,
    fecha_registro,
    direccion,
    ciudad,
    codigo_postal,
    region,
    producto,
    categoria_producto,
    cantidad,
    precio_unitario
    );