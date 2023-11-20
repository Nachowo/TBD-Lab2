-- tabla de logs
CREATE TABLE IF NOT EXISTS logs (
    id SERIAL PRIMARY KEY,
    idUsuario BIGINT,
    tipo TEXT,
    descripcion TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- función para tabla voluntarios
CREATE OR REPLACE FUNCTION log_voluntarios()
RETURNS TRIGGER AS 
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idvoluntario, 'Insert', 'Nueva inserción realizada');
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idvoluntario, 'Update', 'Actualización realizada');
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (OLD.idvoluntario, 'Delete', 'Eliminación realizada');
    END IF;
    
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

-- trigger para tabla voluntarios
DROP TRIGGER IF EXISTS trigger_consulta_voluntarios ON voluntario;

CREATE TRIGGER trigger_consulta_voluntarios
AFTER INSERT OR DELETE OR UPDATE ON voluntario
FOR EACH ROW
EXECUTE FUNCTION log_voluntarios();

-- función para tabla voluntarioHabilidad
CREATE OR REPLACE FUNCTION log_voluntarioHabilidad()
RETURNS TRIGGER AS 
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idvoluntario, 'Insert', 'Nueva inserción realizada');
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idvoluntario, 'Update', 'Actualización realizada');
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (OLD.idvoluntario, 'Delete', 'Eliminación realizada');
    END IF;
    
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

-- trigger para tabla voluntarioHabilidad
DROP TRIGGER IF EXISTS trigger_voluntarioHabilidad ON voluntarioHabilidad;

CREATE TRIGGER trigger_voluntarioHabilidad
AFTER INSERT OR DELETE OR UPDATE ON voluntarioHabilidad
FOR EACH ROW
EXECUTE FUNCTION log_voluntarioHabilidad();

-- función para tabla Emergencias
CREATE OR REPLACE FUNCTION log_emergencia()
RETURNS TRIGGER AS 
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idinstitucion, 'Insert', 'La institucion ha creado una emergencia');
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idinstitucion, 'Update', 'La institucion ha actualizado una emergencia');
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (OLD.idinstitucion, 'Delete', 'La institucion ha eliminado una emergencia');
    END IF;
    
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

-- trigger para tabla Emergencias
DROP TRIGGER IF EXISTS trigger_emergencia ON emergencia;

CREATE TRIGGER trigger_emergencia
AFTER INSERT OR DELETE OR UPDATE ON emergencia
FOR EACH ROW
EXECUTE FUNCTION log_emergencia();

-- función para tabla Instituciones
CREATE OR REPLACE FUNCTION log_institucion()
RETURNS TRIGGER AS 
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idinstitucion, 'Insert', 'Se ha creado la institucion');
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (NEW.idinstitucion, 'Update', 'Se ha actualizado la institucion');
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO logs (idUsuario, tipo, descripcion) VALUES (OLD.idinstitucion, 'Delete', 'Se ha eliminado la institucion');
    END IF;
    
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

-- trigger para tabla Instituciones
DROP TRIGGER IF EXISTS trigger_institucion ON institucion;

CREATE TRIGGER trigger_institucion
AFTER INSERT OR DELETE OR UPDATE ON institucion
FOR EACH ROW
EXECUTE FUNCTION log_institucion();

-- Función para añadir geom a la tabla Emergencia
CREATE OR REPLACE FUNCTION actualizar_coordenadas_emergencia()
RETURNS TRIGGER AS $$
BEGIN
    NEW.geom = ST_SetSRID(ST_MakePoint(NEW.longitud, NEW.latitud), 4326);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que activa la función para la tabla Emergencia
CREATE TRIGGER trig_actualizar_coordenadas_emergencia
BEFORE INSERT OR UPDATE
ON Emergencia
FOR EACH ROW
EXECUTE FUNCTION actualizar_coordenadas_emergencia();

-- Función para añadir geom a la tabla Voluntario
CREATE OR REPLACE FUNCTION actualizar_coordenadas_voluntario()
RETURNS TRIGGER AS $$
BEGIN
    NEW.geom = ST_SetSRID(ST_MakePoint(NEW.longitud, NEW.latitud), 4326);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que activa la función para la tabla Voluntario
CREATE TRIGGER trig_actualizar_coordenadas_voluntario
BEFORE INSERT OR UPDATE
ON Voluntario
FOR EACH ROW
EXECUTE FUNCTION actualizar_coordenadas_voluntario();
