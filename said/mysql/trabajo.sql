CREATE DATABASE TiendaEnLinea;
USE TiendaEnLinea;
CREATE TABLE Categorias (
  categoria_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Productos (
  producto_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  precio INT NOT NULL,
  disponibilidad INT NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);
CREATE TABLE Clientes (
  cliente_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  correo VARCHAR(50) NOT NULL
);
CREATE TABLE Pedidos (
  pedido_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  producto_id INT NOT NULL,
  fecha DATE NOT NULL,
  estado VARCHAR(50) NOT NULL,
  FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
INSERT INTO Clientes (nombre, direccion, correo)
VALUES (
    'Juan Perez',
    'Calle 1, Colonia 1, Ciudad 1',
    'juanperez305@example.com'
  ),
  (
    'Pedro Sanchez',
    'Calle 2, Colonia 2, Ciudad 2',
    'pedro123@example.com'
  ),
  (
    'Maria Lopez',
    'Calle 3, Colonia 3, Ciudad 3',
    'marialopez345@example.com'
  ),
  (
    'Ana Ramirez',
    'Calle 4, Colonia 4, Ciudad 4',
    'anaramirez3951@example.com'
  ),
  (
    'Jose Martinez',
    'Calle 5, Colonia 5, Ciudad 5',
    'josemar23515@example.com'
  ),
  (
    'Luis Hernandez',
    'Calle 6, Colonia 6, Ciudad 6',
    'hernandezLuis@example.com'
  );
INSERT INTO Categorias (nombre)
VALUES ('Teléfonos Móviles'),
  ('Videojuegos'),
  ('Cámaras'),
  ('Audífonos');
INSERT INTO Productos (
    nombre,
    descripcion,
    precio,
    disponibilidad,
    categoria_id
  )
VALUES (
    'Samsung Galaxy S10',
    'El mejor teléfono del mercado',
    10000,
    10,
    1
  ),
  (
    'iPhone X',
    'El mejor teléfono del mercado',
    15000,
    5,
    1
  ),
  ('Xbox One', 'Consola de videojuegos', 8000, 20, 2),
  (
    'PlayStation 4',
    'Consola de videojuegos',
    9000,
    15,
    2
  ),
  ('Canon EOS 80D', 'Cámara profesional', 12000, 10, 3),
  ('Nikon D750', 'Cámara profesional', 10000, 10, 3),
  (
    "Beats Studio 3",
    'Audífonos inalámbricos',
    5000,
    10,
    4
  ),
  (
    'Sony MDR 1000X',
    'Audífonos inalámbricos',
    6000,
    10,
    4
  ),
  (
    'Samsung Galaxy S9',
    'El mejor teléfono del mercado',
    9000,
    10,
    1
  ),
  (
    "iPhone 8",
    'El mejor teléfono del mercado',
    12000,
    5,
    1
  );
INSERT INTO Pedidos (cliente_id, fecha, estado, producto_id)
VALUES (1, '2019-01-01', 'Enviado', 1),
  (2, '2019-01-03', 'Enviado', 2),
  (3, '2019-01-06', 'Cancelado', 3),
  (4, '2019-01-07', 'Enviado', 4),
  (5, '2019-01-08', 'Enviado', 5),
  (6, '2019-01-09', 'Pendiente', 6),
  (1, '2019-01-10', 'Cancelado', 7),
  (2, '2019-01-11', 'Enviado', 8),
  (3, '2019-01-12', 'Cancelado', 9),
  (4, '2019-01-13', 'Pendiente', 10),
  (5, '2019-01-14', 'Enviado', 1),
  (6, '2019-01-15', 'Pendiente', 2),
  (1, '2019-01-16', 'Enviado', 3),
  (2, '2019-01-17', 'Enviado', 4),
  (3, '2019-01-18', 'Cancelado', 5),
  (4, '2019-01-19', 'Cancelado', 6),
  (5, '2019-01-20', 'Enviado', 7),
  (6, '2019-01-21', 'Pendiente', 8),
  (1, '2019-01-22', 'Enviado', 9),
  (2, '2019-01-23', 'Pendiente', 10);

--  Consultar todos los productos en una categoría específica (por ejemplo, todos los
-- teléfonos móviles).
--  Encontrar los productos disponibles con un precio inferior a cierto valor.
--  Consultar la información de un cliente en función de su dirección de correo electrónico.
--  Obtener una lista de todos los pedidos realizados por un cliente en particular.
--  Nombre y número de ventas de los productos mostrados de mayor a menor.
--  Consultar todos los pedidos de un cliente con detalles de productos
--  Consultar productos en una categoría específica con sus detalles de categoría
--  Consultar los detalles de un pedido específico con el nombre del cliente
--  Consultar los pedidos con productos y sus respectivas categorías

SELECT *
FROM Productos
WHERE categoria_id = 1;
SELECT *
FROM Productos
WHERE precio < 10000;
SELECT *
FROM Clientes
WHERE correo = 'josemar23515@example.com';
SELECT *
FROM Pedidos
WHERE cliente_id = 1;
SELECT nombre, COUNT(producto_id) AS ventas
FROM Productos
JOIN Pedidos USING (producto_id)
GROUP BY nombre
ORDER BY ventas DESC;
SELECT *
FROM Pedidos
JOIN Productos USING (producto_id)
WHERE cliente_id = 1;
SELECT *
FROM Productos
JOIN Categorias USING (categoria_id)
WHERE categoria_id = 1;
SELECT *
SELECT nombre, producto_id, fecha, estado
FROM Pedidos
JOIN Clientes USING (cliente_id)
WHERE pedido_id = 1;
SELECT *
FROM Pedidos
JOIN Productos USING (producto_id)
JOIN Categorias USING (categoria_id);