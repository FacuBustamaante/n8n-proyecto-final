CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    stock_actual INTEGER DEFAULT 0,
    stock_minimo INTEGER DEFAULT 5,
    precio DECIMAL(10,2),
    categoria_id INTEGER REFERENCES categorias(id),
    proveedor_email VARCHAR(100)
);
-- Movimiento de stock para el análisis
CREATE TABLE movimientos_stock (
    id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES productos(id),

    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('entrada', 'salida')),
    
    cantidad INTEGER NOT NULL,
    
    motivo VARCHAR(50) NOT NULL CHECK (motivo IN ('venta', 'compra', 'ajuste')),
    
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios_telegram (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telegram_id BIGINT NOT NULL UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios_telegram (telegram_id, first_name, last_name, created_at)
VALUES (8688167579, 'Lucas', 'Russo', NOW());

INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Hogar'), ('Libros');

INSERT INTO productos (nombre, stock_actual, stock_minimo, precio, categoria_id, proveedor_email) VALUES
-- Electrónica (ID 1)
('Laptop Gamer', 2, 5, 1200.00, 1, 'tech_supplies@example.com'),
('Monitor 24 Pulgadas', 3, 5, 250.00, 1, 'tech_supplies@example.com'),
('Teclado Mecánico RGB', 10, 8, 85.50, 1, 'perifericos_sa@example.com'),
('Mouse Inalámbrico', 2, 10, 45.00, 1, 'perifericos_sa@example.com'),
('Auriculares Noise Cancelling', 6, 4, 150.00, 1, 'tech_supplies@example.com'),
('Smartphone Gama Media', 1, 3, 400.00, 1, 'mobile_dist@example.com'),
('Tablet 10 Pulgadas', 4, 5, 220.00, 1, 'mobile_dist@example.com'),

-- Hogar (ID 2)
('Cafetera Express', 2, 4, 120.00, 2, 'hogar_ventas@example.com'),
('Lámpara de Escritorio LED', 15, 10, 30.00, 2, 'deco_luz@example.com'),
('Aspiradora Robot', 1, 2, 350.00, 2, 'hogar_ventas@example.com'),
('Juego de Sartenes (3 pzs)', 8, 5, 90.00, 2, 'bazares_unidos@example.com'),
('Licuadora de Mano', 3, 6, 55.00, 2, 'hogar_ventas@example.com'),
('Almohada Viscoelástica', 20, 15, 25.00, 2, 'confort_casa@example.com'),
('Set de Herramientas', 5, 5, 110.00, 2, 'ferreteria_central@example.com'),

-- Libros (ID 3)
('Clean Code - Robert Martin', 7, 10, 45.00, 3, 'editorial_dev@example.com'),
('The Pragmatic Programmer', 4, 6, 50.00, 3, 'editorial_dev@example.com'),
('Don Quijote de la Mancha', 12, 5, 35.00, 3, 'libros_clasicos@example.com'),
('Introducción a Algoritmos', 2, 4, 75.00, 3, 'edu_books@example.com'),
('Crónicas Marcianas', 1, 3, 28.00, 3, 'libros_clasicos@example.com'),
('Design Patterns (GoF)', 5, 8, 65.00, 3, 'editorial_dev@example.com');


-- Insertar movimientos para testeo
-- COMPRAS (entrada)
INSERT INTO movimientos_stock (producto_id, tipo, cantidad, motivo, fecha) VALUES
(4, 'entrada', 50, 'compra', NOW() - INTERVAL '30 days'),
(4, 'entrada', 40, 'compra', NOW() - INTERVAL '20 days'),
(4, 'entrada', 60, 'compra', NOW() - INTERVAL '10 days');

-- VENTAS (salida)
INSERT INTO movimientos_stock (producto_id, tipo, cantidad, motivo, fecha) VALUES
(4, 'salida', 5, 'venta', NOW() - INTERVAL '29 days'),
(4, 'salida', 3, 'venta', NOW() - INTERVAL '28 days'),
(4, 'salida', 4, 'venta', NOW() - INTERVAL '27 days'),
(4, 'salida', 6, 'venta', NOW() - INTERVAL '25 days'),
(4, 'salida', 2, 'venta', NOW() - INTERVAL '24 days'),

(4, 'salida', 7, 'venta', NOW() - INTERVAL '22 days'),
(4, 'salida', 5, 'venta', NOW() - INTERVAL '21 days'),
(4, 'salida', 6, 'venta', NOW() - INTERVAL '19 days'),
(4, 'salida', 4, 'venta', NOW() - INTERVAL '18 days'),

(4, 'salida', 8, 'venta', NOW() - INTERVAL '15 days'),
(4, 'salida', 6, 'venta', NOW() - INTERVAL '14 days'),
(4, 'salida', 7, 'venta', NOW() - INTERVAL '13 days'),

(4, 'salida', 9, 'venta', NOW() - INTERVAL '9 days'),
(4, 'salida', 6, 'venta', NOW() - INTERVAL '8 days'),
(4, 'salida', 5, 'venta', NOW() - INTERVAL '7 days'),

(4, 'salida', 10, 'venta', NOW() - INTERVAL '5 days'),
(4, 'salida', 8, 'venta', NOW() - INTERVAL '4 days'),
(4, 'salida', 7, 'venta', NOW() - INTERVAL '3 days'),

(4, 'salida', 9, 'venta', NOW() - INTERVAL '2 days'),
(4, 'salida', 6, 'venta', NOW() - INTERVAL '1 day');