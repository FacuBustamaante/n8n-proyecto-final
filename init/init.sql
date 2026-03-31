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
