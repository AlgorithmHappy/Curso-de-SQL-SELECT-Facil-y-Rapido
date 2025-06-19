# Curso-de-SQL-SELECT-Facil-y-Rapido
Aprende a realizar consultas SQL de forma clara y práctica. En este curso en específico dominarás el uso de SELECT para extraer, filtrar, ordenar y agrupar datos desde bases de datos. Ideal para principiantes y quienes quieren reforzar sus conocimientos en consultas con SQL.

## Licencia
Este proyecto está bajo la licencia [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).  
Puedes compartir y adaptar el contenido **siempre que des crédito y no lo uses con fines comerciales**.

## Tema 1: ¿Que es SQL y DML?. Estructura de una consulta con "Select"
### Definicion de SQL y DML
SQL son las siglas en inglés de Structured Query Language, que se traduce al español como Lenguaje de Consulta Estructurado. Es un lenguaje de programación declarativo que permite manipular grandes volúmenes de datos almacenados en una base de datos, mediante instrucciones específicas.
SQL está compuesto por cuatro subconjuntos de comandos: DML, DDL, DCL y TCL. El subconjunto más utilizado es el DML.
DML significa Data Manipulation Language (Lenguaje de Manipulación de Datos). Este conjunto de comandos se utiliza para consultar y modificar los datos almacenados en las tablas de una base de datos, lo que lo convierte en el más usado en el día a día del trabajo con bases de datos.
Los principales comandos de DML son:
- SELECT: para consultar datos de una tabla
- INSERT: para insertar nuevos registros
- UPDATE: para actualizar datos existentes
- DELETE: para eliminar registros
En este curso nos enfocaremos exclusivamente en el comando SELECT y en todo lo que se puede lograr con él.

#### Glosario
- Lenguaje de programacion: Un lenguaje de programación es una herramienta que permite a los seres humanos "comunicarse" con una computadora para darle instrucciones. Estas instrucciones pueden utilizarse para crear software (aplicaciones) que pueden ser usados por personas a través de distintos dispositivos.
- Declarativo: Es un tipo de lenguaje de programación cuyo enfoque está en describir lo que se quiere lograr, en lugar de explicar cómo hacerlo paso a paso. En otras palabras, su semántica se basa en el "qué" se desea obtener, no en el "cómo" se debe ejecutar.
- Comando: Es la instrucción más básica que se le puede dar a una computadora para que realice una acción específica.
- Base de datos: Es un software (aplicacion) que permite la gestion de una gran cantidad de datos.

### Primera consulta
La consulta mas basica que se puede realizar es:
```sql
SELECT email FROM usuarios;
-- La palabra "SELECT" indica las columnas que quieres de la tabla, con el "FROM" indicas que tabla de la base de datos quieres y con el ";" indicas que hasta ahi acaba la instruccion.

SELECT nombre, email FROM usuarios;
-- Si deseas consultar varias columnas puedes separar por coma cada una de las columnas que quieras.

-- Si quisieramos traducir estas linea a lenguaje humano yo las traduciria asi "Selecciona la columna email desde la tabla usuarios"
```

#### Variante
```sql
SELECT * FROM usuarios;
-- Con el "*" indicas que quieres mostrar todas las columnas de dicha tabla, en este caso "usuarios"
```

### Notas:
**Nota:** Las sentencias utilizadas pueden ser en mayusculas o en minusculas

**Nota:** Es importante contar con los permisos adecuados sobre las tablas a las que se les aplica una sentencia SELECT, ya que podrían estar restringidas y provocar el siguiente error: "
ORA-00942: table or view does not exist"

### Ejercicios:
1. Consulta todos los datos de la tabla "CURSOS"
2. Consulta las columnas "BIOGRAFIA" y "SITIO_WEB" de la tabla "PERFILES"
3. ¿Que columnas tiene la tabla "INSCRIPCIONES"?
4. ¿Que cursos existen en la base de datos?

## Tema 2: Sentencia "WHERE"
WHERE es una cláusula que se utiliza para filtrar filas en una consulta SQL con SELECT. Esta cláusula permite establecer condiciones específicas para mostrar únicamente los registros que cumplan ciertos criterios.
Para realizar estas filtraciones, WHERE emplea operadores de comparación, que se describen a continuación:
- = : Filtra los datos que sean iguales al valor especificado.
- < : Filtra los datos que sean menores que el valor especificado.
- \> : Filtra los datos que sean mayores que el valor especificado.
- <= : Filtra los datos que sean menores o iguales al valor especificado.
- \>= : Filtra los datos que sean mayores o iguales al valor especificado.
- != o <> : Filtra los datos que sean diferentes al valor especificado.

### Consultas
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

#### Uso de textos o (strings)
Si se desea comparar datos de tipo cadena de texto (strings), es necesario encerrar los valores entre comillas simples (' ').
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

### Ejercisios:
1. ¿Quien es el usuario con el id 2?
2. ¿Cuales son los usuarios con id mayor a 1?
3. ¿Que id tiene la categoria "Diseño"?
4. ¿En orden alfabetico por nombre de usuario quien es menor a 'Carlos Méndez'?
5. ¿Cuales son los cursos del usuario con id 1?
6. ¿Que consulta harias para mostrar el "CURSO_ID" 1 Y 3?

## Base de datos utilizada:
**Nota:** Ejecutar linea por linea, es decir desde que inicia la instruccion hasta donde esta el ";"
```sql
-- Crear secuencias para las claves primarias
CREATE SEQUENCE seq_usuarios START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_perfiles START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cursos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_categorias START WITH 1 INCREMENT BY 1;

-- Tabla: usuarios
CREATE TABLE usuarios (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    email VARCHAR2(100) UNIQUE
);

-- Trigger para ID automático en usuarios
CREATE OR REPLACE TRIGGER trg_usuarios_id
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    :new.id := seq_usuarios.NEXTVAL;
END;

-- Tabla: perfiles (1:1 con usuarios)
CREATE TABLE perfiles (
    id NUMBER PRIMARY KEY,
    usuario_id NUMBER UNIQUE,
    biografia CLOB,
    sitio_web VARCHAR2(255),
    CONSTRAINT fk_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE OR REPLACE TRIGGER trg_perfiles_id
BEFORE INSERT ON perfiles
FOR EACH ROW
BEGIN
    :new.id := seq_perfiles.NEXTVAL;
END;

-- Tabla: cursos (1:N con usuarios)
CREATE TABLE cursos (
    id NUMBER PRIMARY KEY,
    titulo VARCHAR2(150),
    descripcion CLOB,
    creador_id NUMBER,
    CONSTRAINT fk_curso_creador FOREIGN KEY (creador_id) REFERENCES usuarios(id)
);

CREATE OR REPLACE TRIGGER trg_cursos_id
BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN
    :new.id := seq_cursos.NEXTVAL;
END;

-- Tabla: categorias
CREATE TABLE categorias (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) UNIQUE
);

CREATE OR REPLACE TRIGGER trg_categorias_id
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    :new.id := seq_categorias.NEXTVAL;
END;

-- Tabla intermedia: cursos_categorias (relación N:N)
CREATE TABLE cursos_categorias (
    curso_id NUMBER,
    categoria_id NUMBER,
    PRIMARY KEY (curso_id, categoria_id),
    CONSTRAINT fk_cc_curso FOREIGN KEY (curso_id) REFERENCES cursos(id),
    CONSTRAINT fk_cc_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE OR REPLACE TRIGGER trg_categorias_id
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    :new.id := seq_categorias.NEXTVAL;
END;

-- Tabla: inscripciones (relación N:N entre usuarios y cursos)
CREATE TABLE inscripciones (
    usuario_id NUMBER,
    curso_id NUMBER,
    fecha_inscripcion DATE,
    PRIMARY KEY (usuario_id, curso_id),
    CONSTRAINT fk_insc_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT fk_insc_curso FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Insertar datos en usuarios
INSERT INTO usuarios (nombre, email) VALUES ('Luis Marquez', 'luis@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Ana Torres', 'ana@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Carlos Méndez', 'carlos@example.com');

-- Insertar perfiles (1:1)
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (1, 'Desarrollador fullstack', 'https://luis.dev');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (2, 'Diseñadora gráfica', 'https://anaart.com');


-- Insertar cursos (1:N)
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Curso de SQL Básico', 'Aprende a consultar bases de datos.', 1);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Diseño UX/UI', 'Principios del diseño centrado en el usuario.', 2);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Spring Boot Avanzado', 'Desarrollo backend con Java y Spring.', 1);

-- Insertar categorías
INSERT INTO categorias (nombre) VALUES ('Programación');
INSERT INTO categorias (nombre) VALUES ('Diseño');
INSERT INTO categorias (nombre) VALUES ('Backend');
INSERT INTO categorias (nombre) VALUES ('Frontend');

-- Relacionar cursos con categorías (N:N)
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 3);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (2, 2);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 3);

-- Inscripciones de usuarios a cursos (N:N)
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (2, 1, TO_DATE('2025-06-01', 'YYYY-MM-DD') );
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 1, TO_DATE('2025-06-02', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 2, TO_DATE('2025-06-03', 'YYYY-MM-DD'));
```