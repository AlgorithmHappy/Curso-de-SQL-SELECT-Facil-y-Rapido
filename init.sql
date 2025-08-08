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
/

-- Tabla: perfiles
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
/

-- Tabla: cursos
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
/

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
/

-- Tabla intermedia: cursos_categorias
CREATE TABLE cursos_categorias (
    curso_id NUMBER,
    categoria_id NUMBER,
    PRIMARY KEY (curso_id, categoria_id),
    CONSTRAINT fk_cc_curso FOREIGN KEY (curso_id) REFERENCES cursos(id),
    CONSTRAINT fk_cc_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla: inscripciones
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

-- Insertar perfiles
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (1, 'Desarrollador fullstack', 'https://luis.dev');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (2, 'Diseñadora gráfica', 'https://anaart.com');

-- Insertar cursos
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Curso de SQL Básico', 'Aprende a consultar bases de datos.', 1);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Diseño UX/UI', 'Principios del diseño centrado en el usuario.', 2);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Spring Boot Avanzado', 'Desarrollo backend con Java y Spring.', 1);

-- Insertar categorías
INSERT INTO categorias (nombre) VALUES ('Programación');
INSERT INTO categorias (nombre) VALUES ('Diseño');
INSERT INTO categorias (nombre) VALUES ('Backend');
INSERT INTO categorias (nombre) VALUES ('Frontend');

-- Relacionar cursos con categorías
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 3);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (2, 2);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 3);

-- Inscripciones
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (2, 1, TO_DATE('2025-06-01', 'YYYY-MM-DD') );
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 1, TO_DATE('2025-06-02', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 2, TO_DATE('2025-06-03', 'YYYY-MM-DD'));
