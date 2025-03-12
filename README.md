# Biblioteca Campus - Consultas SQL

## Listar todos los libros disponibles
```sql
SELECT l.id_libro, l.titulo, l.genero, l.ISBN
FROM Libro l
WHERE l.disponibilidad = 'Disponible'
ORDER BY l.titulo;
```

## Buscar libros por género
```sql
SELECT l.id_libro, l.titulo, l.genero, l.ISBN
FROM Libro l
WHERE l.genero = 'Fantasía'
ORDER BY l.titulo;
```

## Obtener información de un libro por ISBN
```sql
SELECT l.id_libro, l.titulo, l.genero, l.disponibilidad,
       a.nombre AS autor, e.nombre AS editorial, ed.fecha_publicacion
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor
JOIN Edicion ed ON l.id_libro = ed.id_libro
JOIN Editor e ON ed.id_editor = e.id_editor
WHERE l.ISBN = '93245';
```

## Contar el número de libros en la biblioteca
```sql
SELECT COUNT(*) AS total_libros 
FROM Libro;
```

## Listar todos los autores
```sql
SELECT id_autor, nombre
FROM Autor
ORDER BY nombre;
```

## Buscar autores por nombre
```sql
SELECT id_autor, nombre
FROM Autor
WHERE nombre LIKE '%García%'
ORDER BY nombre;
```

## Obtener todos los libros de un autor específico
```sql
SELECT l.id_libro, l.titulo, l.genero, l.ISBN, l.disponibilidad
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor
WHERE a.id_autor = 1
ORDER BY l.titulo;
```

## Listar todas las ediciones de un libro
```sql
SELECT l.titulo, ed.id_edicion, ed.fecha_publicacion, e.nombre AS editorial
FROM Libro l
JOIN Edicion ed ON l.id_libro = ed.id_libro
JOIN Editor e ON ed.id_editor = e.id_editor
WHERE l.id_libro = 1
ORDER BY ed.fecha_publicacion;
```

## Obtener la última edición de un libro
```sql
SELECT l.titulo, ed.id_edicion, ed.fecha_publicacion, e.nombre AS editorial
FROM Libro l
JOIN Edicion ed ON l.id_libro = ed.id_libro
JOIN Editor e ON ed.id_editor = e.id_editor
WHERE l.id_libro = 1
ORDER BY ed.fecha_publicacion DESC
LIMIT 1;
```

## Contar cuántas ediciones hay de un libro específico
```sql
SELECT l.titulo, COUNT(ed.id_edicion) AS total_ediciones
FROM Libro l
JOIN Edicion ed ON l.id_libro = ed.id_libro
WHERE l.id_libro = 1
GROUP BY l.titulo;
```

## Listar todas las transacciones de préstamo
```sql
SELECT t.id_transaccion, l.titulo, m.nombre AS miembro,
       t.fecha_prestamo, t.fecha_devolucion,
       CASE WHEN t.fecha_devolucion IS NULL THEN 'Prestado' ELSE 'Devuelto' END AS estado
FROM Transaccion t
JOIN Libro l ON t.id_libro = l.id_libro
JOIN Miembro m ON t.id_miembro = m.id_miembro
ORDER BY t.fecha_prestamo DESC;
```

## Obtener los libros prestados actualmente
```sql
SELECT l.id_libro, l.titulo, l.genero, m.nombre AS miembro,
       t.fecha_prestamo
FROM Transaccion t
JOIN Libro l ON t.id_libro = l.id_libro
JOIN Miembro m ON t.id_miembro = m.id_miembro
WHERE t.fecha_devolucion IS NULL
ORDER BY t.fecha_prestamo;
```

## Contar el número de transacciones de un miembro específico
```sql
SELECT m.nombre, 
       COUNT(t.id_transaccion) AS total_transacciones
FROM Miembro m
LEFT JOIN Transaccion t ON m.id_miembro = t.id_miembro
WHERE m.id_miembro = 1
GROUP BY m.nombre;
```

## Listar todos los miembros de la biblioteca
```sql
SELECT m.id_miembro, m.nombre, dc.telefono, dc.direccion
FROM Miembro m
LEFT JOIN DatosContacto dc ON m.id_miembro = dc.id_miembro
ORDER BY m.nombre;
```

## Buscar un miembro por nombre
```sql
SELECT m.id_miembro, m.nombre, dc.telefono, dc.direccion
FROM Miembro m
LEFT JOIN DatosContacto dc ON m.id_miembro = dc.id_miembro
WHERE m.nombre LIKE '%Ana%'
ORDER BY m.nombre;
```

## Obtener las transacciones de un miembro específico
```sql
SELECT t.id_transaccion, l.titulo,
       t.fecha_prestamo, t.fecha_devolucion,
       CASE WHEN t.fecha_devolucion IS NULL THEN 'Prestado' ELSE 'Devuelto' END AS estado
FROM Transaccion t
JOIN Libro l ON t.id_libro = l.id_libro
WHERE t.id_miembro = 1
ORDER BY t.fecha_prestamo DESC;
```

## Listar todos los libros y sus autores
```sql
SELECT l.id_libro, l.titulo, l.genero, l.ISBN, 
       a.nombre AS autor
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor
ORDER BY l.titulo, a.nombre;
```

## Obtener el historial de préstamos de un libro específico
```sql
SELECT t.id_transaccion, 
       m.nombre AS miembro,
       t.fecha_prestamo, t.fecha_devolucion,
       CASE WHEN t.fecha_devolucion IS NULL THEN 'Prestado' ELSE 'Devuelto' END AS estado
FROM Transaccion t
JOIN Miembro m ON t.id_miembro = m.id_miembro
WHERE t.id_libro = 1
ORDER BY t.fecha_prestamo DESC;
```

## Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(DISTINCT id_libro) AS total_libros_prestados
FROM Transaccion;
```

## Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT l.id_libro, l.titulo, l.genero, l.ISBN,
       e.nombre AS editorial, ed.fecha_publicacion,
       l.disponibilidad
FROM Libro l
JOIN (
    SELECT id_libro, MAX(fecha_publicacion) AS ultima_fecha
    FROM Edicion
    GROUP BY id_libro
) AS ultima ON l.id_libro = ultima.id_libro
JOIN Edicion ed ON ultima.id_libro = ed.id_libro AND ultima.ultima_fecha = ed.fecha_publicacion
JOIN Editor e ON ed.id_editor = e.id_editor
ORDER BY l.titulo;
```
