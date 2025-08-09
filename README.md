# Curso-de-SQL-SELECT-Facil-y-Rapido

## Introducción
Aprende a realizar consultas SQL de forma clara y práctica. En este curso en específico dominarás el uso de SELECT para extraer, filtrar, ordenar y agrupar datos desde bases de datos. Ideal para principiantes y quienes quieren reforzar sus conocimientos en consultas con SQL.

## Índice de Contenidos

1. [¿Qué es SQL y DML? Estructura de una consulta con "Select"](¿Que%20es%20SQL%20y%20DML%3F%20Estructura%20de%20una%20consulta%20con%20Select.md)
2. [Filtra datos con la cláusula "Where"](Filtra%20datos%20con%20la%20clausula%20Where.md)
2. [Filtrado complejo con operaciones lógicas: AND, OR y NOT](Filtrado%20complejo%20con%20operaciones%20logicas%20AND%20OR%20y%20NOT.md)

## Licencia
Este proyecto está bajo la licencia [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).  
Puedes compartir y adaptar el contenido **siempre que des crédito y no lo uses con fines comerciales**.

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