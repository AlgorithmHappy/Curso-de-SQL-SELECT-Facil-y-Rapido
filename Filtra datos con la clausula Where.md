# Filtra datos con la clausula "Where"
**WHERE** es una cláusula que se utiliza para **filtrar filas** en una consulta **SQL** con **SELECT**. Esta cláusula permite establecer condiciones específicas para mostrar únicamente los registros que cumplan ciertos criterios.
Para realizar estas filtraciones, **WHERE** emplea operadores de comparación, que se describen a continuación:
- **=** : Filtra los datos que sean **iguales** al valor especificado.
- **<** : Filtra los datos que sean **menores que** el valor especificado.
- **\>** : Filtra los datos que sean **mayores que** el valor especificado.
- **<=** : Filtra los datos que sean **menores o iguales** al valor especificado.
- **\>=** : Filtra los datos que sean **mayores o iguales** al valor especificado.
- **!= o <>** : Filtra los datos que sean **diferentes** al valor especificado.

## Consultas
Las consultas que se pueden realizar con esto son:
```sql
SELECT * FROM CATEGORIAS WHERE id = 1;
-- Aqui se esta filtrando los renglones cuyo dato "ID" sea igual a 1

SELECT * FROM CATEGORIAS WHERE id > 1;
-- Aqui se filtran los renglones cuyo dato "ID" es mayor a 1

SELECT * FROM CATEGORIAS WHERE id < 3;
-- Aqui se filtran los renglones cuyo dato "ID" es menor a 3

SELECT * FROM CATEGORIAS WHERE id != 3;
SELECT * FROM CATEGORIAS WHERE id <> 3;
-- En estas 2 consultas se filtran los renglones cuyo dato "ID" es diferente a 3
```

## Uso de textos o (strings)
Si se desea comparar datos de tipo cadena de texto **(strings)**, es necesario encerrar los valores entre comillas simples (' ').
```sql
SELECT * FROM CATEGORIAS WHERE NOMBRE = 'Programación';
-- Aqui se esta filtrando los renglones que en cuyo dato "NOMBRE" sea igual que el texto 'Programación'

SELECT * FROM CATEGORIAS WHERE NOMBRE < 'Programación';
-- Se puede utilizar los operadors "<" y ">" con textos para compararlos alfabeticamente

SELECT * FROM CATEGORIAS WHERE NOMBRE = 'Programación';
SELECT * FROM CATEGORIAS WHERE NOMBRE != 'Programación';
SELECT * FROM CATEGORIAS WHERE NOMBRE <> 'Programación';
-- Los demas operadores se trabajan igual que con los numeros
```
### Notas:
**Nota:** En los datos de tipo texto "strings" si son sensibles a mayusculas y minusculas.

**Nota:** Los datos numericos con punto decimal son tratados igual que los numericos normales.

**Nota:** Los datos de tipo fecha (date) se explicaran mas adelante.

## Ejercisios:
1. ¿Quien es el usuario con el id 2?
2. ¿Cuales son los usuarios con id mayor a 1?
3. ¿Que id tiene la categoria "Diseño"?
4. ¿En orden alfabetico por nombre de usuario quien es menor a 'Carlos Méndez'?
5. ¿Cuales son los cursos del usuario con id 1?
6. ¿Que consulta harias para mostrar el "CURSO_ID" 1 Y 3?
