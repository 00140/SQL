CREATE ROLE bibliotecario WITH LOGIN PASSWORD 'aa';

CREATE DATABASE biblioteca;

GRANT ALL PRIVILEGES ON DATABASE biblioteca TO nuevo_usuario;

USE biblioteca;

CREATE SCHEMA IF NOT EXISTS blt;



--drop table if exists blt.personas

CREATE TABLE IF NOT EXISTS blt.personas
(
    id_persona SERIAL PRIMARY KEY,
	nombre varchar(150),
	apellido varchar(150),
	area varchar(100)

)

GRANT ALL ON TABLE blt.personas TO bibliotecario;



--drop table if exists blt.usuarios

CREATE TABLE IF NOT EXISTS blt.usuarios
(
    id_usuario SERIAL PRIMARY KEY,
	username varchar(100),
	password varchar(255),
	perfil varchar(50),
	id_persona INTEGER,

	CONSTRAINT fk_rel_usuarios
                FOREIGN KEY (id_persona)
                REFERENCES blt.personas(id_persona)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

GRANT ALL ON TABLE blt.usuarios TO bibliotecario;






-- drop table if exists blt.libros

CREATE TABLE IF NOT EXISTS blt.libros
(
    id_libro SERIAL PRIMARY KEY,
	titulo varchar(150),
	autor varchar(250),
	genero varchar(50),
	estatus varchar(20),
	descripcion varchar(250)

);

GRANT ALL ON TABLE blt.libros TO bibliotecario;



--drop table if exists blt.prestamos

CREATE TABLE IF NOT EXISTS blt.prestamos
(
    id_prestamo BIGSERIAL PRIMARY KEY,
	id_persona int,
	id_libro int,
	fecha_ini_prestamo TIMESTAMP,
	fecha_fin_prestamo TIMESTAMP,
	observaciones varchar(255),
	pretado_por int,

	CONSTRAINT fk_rel_id_persona
                FOREIGN KEY (id_persona)
                REFERENCES blt.personas(id_persona)
                ON DELETE CASCADE
                ON UPDATE CASCADE,

    CONSTRAINT fk_rel_id_libro
               FOREIGN KEY (id_libro)
               REFERENCES blt.libros(id_libro)
               ON DELETE CASCADE
               ON UPDATE CASCADE,

    CONSTRAINT fk_rel_prestador
                FOREIGN KEY (pretado_por)
                REFERENCES blt.personas(id_persona)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

GRANT ALL ON TABLE blt.prestamos TO bibliotecario;










//TODO: UTILIDADES ********************

ALTER TABLE nombre_tabla RENAME COLUMN actual_nombre_columna TO nuevo_nombre_columna;

ALTER TABLE squema.nombre_tabla ALTER COLUMN nombre_columna TYPE VARCHAR(100);



