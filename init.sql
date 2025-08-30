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

INSERT INTO usuarios (nombre, email) VALUES ('Luis Marquez', 'luis@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Ana Torres', 'ana@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Carlos Méndez', 'carlos@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('María López', 'maria@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Jorge Rivera', 'jorge@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Sofía Hernández', 'sofia@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Ricardo Pérez', 'ricardo@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Lucía Fernández', 'lucia@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Andrés Gómez', 'andres@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Verónica Díaz', 'veronica@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Fernando Torres', 'fernando@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Patricia Morales', 'patricia@example.com');

INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (1, 'Desarrollador fullstack', 'https://luis.dev');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (2, 'Diseñadora gráfica', 'https://anaart.com');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (3, 'Instructor de Java y mentor de estudiantes', 'https://carlos.learn');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (4, 'Especialista en marketing digital', 'https://maria.marketing');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (5, 'Emprendedor y consultor tecnológico', 'https://jorge.tech');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (6, 'Diseñadora de interfaces web', 'https://sofia.design');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (7, 'Experto en bases de datos', 'https://ricardo.db');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (8, 'Desarrollador frontend', 'https://lucia.dev');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (9, 'Instructor de Python y IA', 'https://andres.ai');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (10, 'Diseñadora UX/UI avanzada', 'https://veronica.design');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (11, 'Consultor de negocios tecnológicos', 'https://fernando.tech');
INSERT INTO perfiles (usuario_id, biografia, sitio_web) VALUES (12, 'Especialista en ciberseguridad', 'https://patricia.sec');

INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Curso de SQL Básico', 'Aprende a consultar bases de datos.', 1);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Diseño UX/UI', 'Principios del diseño centrado en el usuario.', 2);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Spring Boot Avanzado', 'Desarrollo backend con Java y Spring.', 1);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Python para Principiantes', 'Aprende Python desde cero.', 3);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Marketing Avanzado', 'Estrategias de marketing digital.', 4);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Frontend con React', 'Desarrollo web moderno con React.', 8);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Base de Datos Oracle', 'Administración de bases de datos Oracle.', 7);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Inteligencia Artificial', 'Fundamentos de IA aplicada.', 9);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Ciberseguridad', 'Protege sistemas y datos de ataques.', 12);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Emprendimiento Tecnológico', 'Cómo crear tu startup tecnológica.', 5);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Diseño Avanzado UX/UI', 'Técnicas avanzadas de diseño centrado en usuario.', 10);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Java Intermedio', 'Profundiza en Java y patrones de diseño.', 3);
INSERT INTO cursos (titulo, descripcion, creador_id) VALUES ('Spring Boot Microservicios', 'Arquitectura de microservicios con Spring Boot.', 1);

INSERT INTO categorias (nombre) VALUES ('Programación');
INSERT INTO categorias (nombre) VALUES ('Diseño');
INSERT INTO categorias (nombre) VALUES ('Backend');
INSERT INTO categorias (nombre) VALUES ('Frontend');
INSERT INTO categorias (nombre) VALUES ('Marketing Digital');
INSERT INTO categorias (nombre) VALUES ('Python');
INSERT INTO categorias (nombre) VALUES ('React');
INSERT INTO categorias (nombre) VALUES ('IA');
INSERT INTO categorias (nombre) VALUES ('Ciberseguridad');
INSERT INTO categorias (nombre) VALUES ('Emprendimiento');

INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (1, 3);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (2, 2);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (3, 3);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (4, 6); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (5, 5); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (6, 7); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (7, 3); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (8, 8); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (9, 9); 
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (10, 10);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (11, 2);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (12, 1);
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES (13, 3);

INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (2, 1, TO_DATE('2025-06-01', 'YYYY-MM-DD') );
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 1, TO_DATE('2025-06-02', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 2, TO_DATE('2025-06-03', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (4, 1, TO_DATE('2025-06-05', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (5, 2, TO_DATE('2025-06-06', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (6, 3, TO_DATE('2025-06-07', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (7, 4, TO_DATE('2025-06-08', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (8, 5, TO_DATE('2025-06-09', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (9, 6, TO_DATE('2025-06-10', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (10, 7, TO_DATE('2025-06-11', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (11, 8, TO_DATE('2025-06-12', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (12, 9, TO_DATE('2025-06-13', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (1, 10, TO_DATE('2025-06-14', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (2, 10, TO_DATE('2025-06-15', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (3, 9, TO_DATE('2025-06-16', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (4, 7, TO_DATE('2025-06-17', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (5, 8, TO_DATE('2025-06-18', 'YYYY-MM-DD'));
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES (6, 6, TO_DATE('2025-06-19', 'YYYY-MM-DD'));