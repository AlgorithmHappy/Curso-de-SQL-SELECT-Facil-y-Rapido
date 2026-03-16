# Filtrado de datos con el operador `IN`

**`IN`** es un **operador** que se utiliza con **`WHERE`** para el **filtrado de datos de cualquier tipo** (int, varchar, date, etc.) **devolviendo coincidencias** con una lista de datos separados por **`,`**.

## Consultas

```sql
SELECT
	*
FROM 
	INSCRIPCIONES
WHERE 
fecha_inscripcion IN (
	TO_DATE('2025-06-01 00:00:00', 'YYYY-MM-DD HH24:mi:ss'),
	TO_DATE('2025-06-02 00:00:00', 'YYYY-MM-DD HH24:mi:ss')
);
-- Aqui "IN(...)" esta filtrando los renglones que si coincidan con las inscripciones en
-- las fechas "2025-06-01 00:00:00" y "2025-06-02 00:00:00", poner especial atencion en
-- la ","

SELECT
	*
FROM 
	INSCRIPCIONES
WHERE 
fecha_inscripcion NOT IN(
	TO_DATE('2025-06-01 00:00:00', 'YYYY-MM-DD HH24:mi:ss'),
	TO_DATE('2025-06-02 00:00:00', 'YYYY-MM-DD HH24:mi:ss')
);
-- Tambien se puede negar el "IN" es decir devolver los renglones que no esten dentro
-- de nuestra lista declarada en "IN"
```

##  Coincidencia de conjuntos de columnas

**`IN`** tambien puede **filtrar renglones haciendo cuincidir conjuntos de columnas** como en los siguientes ejemplos:

## Consultas

```sql
SELECT * FROM PERFILES WHERE (id, usuario_id) IN ( (7, 7), (5, 5), (1, 9) );
-- Aqui "IN" indica que filtre todos los renglones cuyos valores en las columnas
-- id y usuario_id sean exactamente a los 3 conjuntos (7, 7), (5, 5) y (1, 9)

SELECT
	*
FROM
	CURSOS
WHERE
(id, titulo, creador_id) IN (
	(10, 'Emprendimiento Tecnológico', 5),
	(3, 'Spring Boot Avanzado', 1),
	(0, 'Base de datos microsoft', 1)
)
-- Este es un ejemplo de un in con 3 conjuntos de 3, se puede hacer con la cantidad de
-- conjuntos que se requieran
```

##  `IN` es mucho mas poderoso de lo que cres

**`IN`** puede contener la **lista de renglones que te de como resultado una consulta SQL**, asi como **convinar** dicho resultado con **el truco de los conjuntos**, como en los siguientes ejemplos:
```sql
SELECT
	*
FROM
	CURSOS
WHERE
creador_id IN(
	SELECT
		ID
	FROM
		USUARIOS
	WHERE
		nombre = 'Carlos Méndez'
	OR 	nombre = 'Ana Torres'
);
-- Aqui le estamos pasando a "IN" una consulta que devuelve los renglones
-- del id de los usuarios, es decir la lista de los usuarios con el nombre
-- Carlos Méndez y Ana Torres, por lo que la consulta completa devolvera
-- todos los cursos impartidos por estos usuarios
```