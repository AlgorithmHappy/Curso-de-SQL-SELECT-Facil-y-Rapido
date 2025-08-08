# Filtrado complejo con operaciones lógicas: AND, OR y NOT

Si se **requiere realizar un filtrado más complejo** de las filas arrojadas por tu gestor de bases de datos, se pueden utilizar los operadores lógicos, con los cuales **es posible combinar filtros en la cláusula `WHERE`**.  
Estos operadores son los siguientes:

- **AND**: Filtra los datos que **cumplan todas las condiciones dadas**, sin excepción.
- **OR**: Filtra los datos que **cumplan al menos una de las condiciones dadas**.
- **NOT**: Filtra los datos que **NO cumplan** con las condiciones dadas.


## Consultas
Estos son ejemplos con los cuales puedes entender mejor estos operadores:
```sql
SELECT * FROM CATEGORIAS WHERE id = 1 AND nombre = 'Programación';
-- Aquí se están filtrando los renglones cuyo dato "ID" sea igual a 1
-- y, además, que su nombre sea igual a "Programación". Es decir,
-- si el renglón con id igual a 1 no tuviera el "nombre" de
-- "Programación", esta consulta no devolvería ningún resultado, ya
-- que se deben cumplir todas las condiciones dadas.

SELECT * FROM CURSOS WHERE id > 0 AND titulo = 'Curso de SQL Básico' AND creador_id < 3;
-- Se pueden agregar tantos filtros (condiciones) como se requieran.
-- También puedes utilizar diferentes operadores (=, <, >, !=, <>) en cada condición.

SELECT * FROM PERFILES WHERE usuario_id = 2 OR usuario_id = -1;
-- Con el operador OR se filtran los datos que cumplan al menos una
-- de las condiciones. Igual que con AND, se pueden agregar
-- tantas condiciones como se necesiten y usar cualquier operador (=, <, >, !=, <>).

SELECT * FROM PERFILES WHERE usuario_id = 2 OR usuario_id = 1;
-- El operador OR permite obtener más de un resultado que cumpla alguna de las condiciones.

SELECT * FROM INSCRIPCIONES WHERE NOT curso_id = 1;
-- El operador NOT niega la condición, es decir, filtra todos los
-- renglones que "NO" tengan el "curso_id" igual a 1. No es posible
-- usar múltiples NOT a menos que se combinen con AND u OR.
```

## Combinar operadores
Es posible la combinacion de operadores AND, OR y NOT en una misma clausula WHERE para realizar filtraciones con mas precision, sin embargo es recomendable utilizar parentesis para tener mejor legibilidad en estas operaciones.
Ejemplos

## Consultas
