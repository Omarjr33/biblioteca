CREATE DATABASE IF NOT EXISTS biblioteca_campus;
USE biblioteca_campus;

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(50),
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    disponibilidad ENUM('Disponible', 'Prestado') DEFAULT 'Disponible'
);


CREATE TABLE Autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE LibroAutor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor) ON DELETE CASCADE
);


CREATE TABLE Editor (
    id_editor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE Edicion (
    id_edicion INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    fecha_publicacion DATE NOT NULL,
    id_editor INT,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE,
    FOREIGN KEY (id_editor) REFERENCES Editor(id_editor) ON DELETE SET NULL
);

CREATE TABLE Miembro (
    id_miembro INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE DatosContacto (
    id_contacto INT PRIMARY KEY AUTO_INCREMENT,
    id_miembro INT,
    telefono VARCHAR(20),
    direccion VARCHAR(50),
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro) ON DELETE CASCADE
);


CREATE TABLE Transaccion (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    id_miembro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE,
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro) ON DELETE CASCADE
);
