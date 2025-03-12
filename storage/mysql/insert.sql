INSERT INTO Autor (nombre) VALUES
('J.K. Rodrigo'),
('Stephen King'),
('Isabel Allende'),
('Alvaro Torres'),
('Mario Vargas Llosa'),
('George R.R. Martin'),
('Jane Austen');


INSERT INTO Editor (nombre) VALUES
('Editorial Sudamericana'),
('Alfaguara'),
('Bloomsbury'),
('Salamandra'),
('Viking Press'),
('Scribner'),
('Plaza & Janés'),
('kasandra'),
('Seix'),
('Books'),
('T. Egerton'),
('Barsa');


INSERT INTO Libro (titulo, genero, ISBN, disponibilidad) VALUES
('Cien años de soledad', 'Realismo mágico', '92342', 'Disponible'),
('Harry Potter y la piedra filosofal', 'Fantasía', '23454', 'Disponible'),
('It', 'Terror', '9781501142970', 'Prestado'),
('La casa de los espíritus', 'Realismo mágico', '93245', 'Disponible'),
('Tokio Blues', 'Novela', '23465445', 'Prestado'),
('La ciudad y los perros', 'Novela social', '34562', 'Disponible'),
('Juego de Tronos', 'Fantasía épica', '934523', 'Prestado'),
('Orgullo y prejuicio', 'Novela romántica', '934656', 'Disponible');

INSERT INTO LibroAutor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO Edicion (id_libro, fecha_publicacion, id_editor) VALUES
(1, '1900-05-30', 1),
(1, '2007-05-30', 2),
(2, '1999-06-26', 3),
(2, '2015-10-06', 4),
(3, '1986-09-15', 5),
(3, '2017-09-05', 6),
(4, '1982-01-01', 7),
(5, '2016-09-04', 8),
(6, '1963-01-01', 9),
(7, '1996-08-01', 10),
(8, '1813-01-28', 11),
(8, '2010-10-01', 12);

INSERT INTO Miembro (nombre) VALUES
('Ana López'),
('Carlos Gómez'),
('María Rodríguez'),
('Javier Martínez'),
('Laura Pérez');

INSERT INTO DatosContacto (id_miembro, telefono, direccion) VALUES
(1, '123-456-7890', 'Calle Principal 123'),
(2, '234-567-8901', 'Avenida Central 456'),
(3, '345-678-9012', 'Plaza Mayor 789'),
(4, '456-789-0123', 'Callejón Verde 321'),
(5, '567-890-1234', 'Calle del Sol 654');

INSERT INTO Transaccion (id_libro, id_miembro, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2023-06-01', '2023-06-14'),
(2, 2, '2023-06-05', '2023-06-18'),
(3, 3, '2023-06-10', NULL),
(4, 4, '2023-06-15', '2023-06-25'),
(5, 5, '2023-06-20', NULL),
(6, 1, '2023-06-25', NULL),
(7, 2, '2023-06-30', NULL),
(8, 3, '2023-07-05', NULL),
(1, 4, '2023-07-10', NULL),
(2, 5, '2023-07-15', NULL);