CREATE EXTENSION IF NOT EXISTS "postgis";

CREATE SEQUENCE idInstitucion START 1;
CREATE TABLE IF NOT EXISTS Institucion(
    idInstitucion serial NOT null,
    nombreInstitucion text,
    correoInstitucion text,
    contraseniaInstitucion text,
    PRIMARY KEY (idInstitucion)
);

CREATE SEQUENCE idVoluntario START 1;
CREATE TABLE IF NOT EXISTS Voluntario(
    idVoluntario serial NOT null,
    emailVoluntario text,
    rutVoluntario text,
    nombreCompletoVoluntario text,
    contraseniaVoluntario text,
    latitud double precision,
    longitud double precision,
    geom geometry(Point,4326),
    PRIMARY KEY (idVoluntario)
);

CREATE SEQUENCE idHabilidad START 1;
CREATE TABLE IF NOT EXISTS Habilidad(
    idHabilidad serial NOT null,
    nombreHabilidad text,
    PRIMARY KEY (idHabilidad)
);
-- añadidos datos de longitud y latitud, que se usarán para el parametro geom
CREATE SEQUENCE idEmergencia START 1;
CREATE TABLE IF NOT EXISTS Emergencia(
    idEmergencia serial NOT null,
    nombreEmergencia text,
    idInstitucion bigint,
    latitud double precision,
    longitud double precision,
    geom geometry(Point,4326),
    PRIMARY KEY (idEmergencia),
    FOREIGN KEY (idInstitucion) REFERENCES Institucion(idInstitucion)
);

CREATE SEQUENCE idEmehabilidad START 1;
CREATE TABLE IF NOT EXISTS EmeHabilidad(
    idEmehabilidad serial NOT null,
    idEmergencia bigint,
    idHabilidad bigint,
    PRIMARY KEY (idEmehabilidad),
    FOREIGN KEY (idEmergencia) REFERENCES Emergencia(idEmergencia),
    FOREIGN KEY (idHabilidad) REFERENCES Habilidad(idHabilidad)
);

CREATE SEQUENCE idEstadoTarea START 1;
CREATE TABLE IF NOT EXISTS EstadoTarea(
    idEstadoTarea serial NOT null,
    estadoTarea boolean,
    PRIMARY KEY (idEstadoTarea)
);

CREATE SEQUENCE idTarea START 1;
CREATE TABLE IF NOT EXISTS Tarea(
    idTarea serial NOT null,
    nombreTarea text,
    idEstadoTarea bigint,
    idEmergencia bigint,
    PRIMARY KEY (idTarea),
    FOREIGN KEY (idEstadoTarea) REFERENCES EstadoTarea(idEstadoTarea),
    FOREIGN KEY (idEmergencia) REFERENCES Emergencia(idEmergencia)
);

CREATE SEQUENCE idVoluntarioHabilidad START 1;
CREATE TABLE IF NOT EXISTS VoluntarioHabilidad(
    idVoluntarioHabilidad serial NOT null,
    idVoluntario bigint,
    idHabilidad bigint,
    PRIMARY KEY (idVoluntarioHabilidad),
    FOREIGN KEY (idVoluntario) REFERENCES Voluntario(idVoluntario),
    FOREIGN KEY (idHabilidad) REFERENCES Habilidad(idHabilidad)
);

CREATE SEQUENCE idRanking START 1;
CREATE TABLE IF NOT EXISTS Ranking(
    idRanking serial NOT null,
    nombreRanking text,
    idVoluntario bigint,
    idTarea bigint,
    PRIMARY KEY (idRanking),
    FOREIGN KEY (idVoluntario) REFERENCES Voluntario(idVoluntario),
    FOREIGN KEY (idTarea) REFERENCES Tarea(idTarea)
);

CREATE SEQUENCE idTareaHabilidad START 1;
CREATE TABLE IF NOT EXISTS TareaHabilidad(
    idTareaHabilidad serial NOT null,
    idTarea bigint,
    idHabilidad bigint,
    PRIMARY KEY (idTareaHabilidad),
    FOREIGN KEY (idTarea) REFERENCES Tarea(idTarea),
    FOREIGN KEY (idHabilidad) REFERENCES Habilidad(idHabilidad)
)
