-- La población de voluntarios y voluntarioHabilidad es necesario hacerlo manual, esto a causa del hasheo de la llave a la hora de registrarse y logearse por lo que esto se hara mediante el FRONTEND --


INSERT INTO public.Institucion(nombreInstitucion, correoInstitucion, contraseniaInstitucion) VALUES('Conaf', 'Conaf@gmail.com', '123');

INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Manejo de manguera');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Rescate en situaciones de inundación');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Manejo de equipo de comunicación de emergencia');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Atención médica de primeros auxilios');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Búsqueda y rescate en zonas colapsadas');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Liderazgo en situaciones de crisis');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Extinción de incendios forestales');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Evacuación de personas en situaciones de riesgo');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Supervivencia en entornos hostiles');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Transporte de heridos y evacuación médica');
INSERT INTO public.Habilidad(nombreHabilidad) VALUES ('Coordinación de recursos de ayuda humanitaria');

--Insert de emergencias nuevo, ahora incluye longitud y latitud

INSERT INTO Emergencia (nombreEmergencia, idInstitucion, latitud, longitud)
VALUES ('Incidente en Santiago', 1, -33.4691, -70.6420);

INSERT INTO Emergencia (nombreEmergencia, idInstitucion, latitud, longitud)
VALUES ('Terremto en Santiago', 1, -33.4691, -70.6420);

INSERT INTO Emergencia (nombreEmergencia, idInstitucion, latitud, longitud)
VALUES ('Incendio forestal', 1, -55.4691, -30.6420);


INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(1, 1);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(1, 4);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(1, 7);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(1, 8);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(1, 9);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(2, 3);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(2, 5);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(2, 6);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(2, 8);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(2, 11);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 2);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 3);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 6);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 8);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 9);
INSERT INTO public.EmeHabilidad(idEmergencia, idHabilidad) VALUES(3, 10);


INSERT INTO public.EstadoTarea(estadoTarea) VALUES(False);

INSERT INTO public.Tarea(nombreTarea, idEstadoTarea, idEmergencia) VALUES('apagar', 1, 1);

INSERT INTO public.TareaHabilidad(idTarea, idHabilidad) VALUES(1, 1);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (1, 'benjaminm@gmail.com', '2030133-3', 'Benjamin Munoz', '123', -33.509406273500936, -70.7562214894338, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (2, 'pabloR@gmail.com', '16607148-8', 'Pablo Ramirez', '123', -33.46537616762551, -70.70206816509021, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (3, 'diego@gmail.com', '23191553-2', 'Diego Ahumada', '123', -33.454407997771135, -70.59342772217948, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (4, 'catalinar@gmail.com', '22610783-5', 'Catalina Ramos', '123', -33.45534615508145, -70.5144658232325, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (5, 'enzozo@gmail.com', '40063760-1', 'Enzo Gulppi', '123', -33.23041092789878, -70.81034904765384, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (6, 'pedrodo@gmail.com', '17343331-k', 'Pedro Avaca', '123', -33.712216546836764, -70.72904444033928, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (7, 'Alejandroa@gmail.com', '52994823-9', 'Alejandro Aldea', '123', -33.454407997771135, -70.5144658232325, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (8, 'nachowo@gmail.com', '34783507-2', 'Ignacio Arias', '123', -33.46537616762551, -70.72904444033928, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (9, 'Yerko@gmail.com', '33971187-9', 'Yerko', '123', -33.712216546836764, -70.59342772217948, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (10, 'gabeloco@gmail.com', '23873647-1', 'Gabriel Ojeda', '123', -33.23041092789878, -70.7562214894338, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (11, 'ludwig213Qgmail.com', '54982737-3', 'Lugwig Ramirez', '123', -33.392667377446, -70.7438126362428, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (12, 'richimmascapo@mail.com', '39345090-8', 'Ricardo Avaca', '123', -33.34162933782827, -70.51447304800946, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (13, 'hectorg@gmail.com', '41955153-8', 'Hector Gallardo', '123', -33.434543957190456, -70.52258066243073, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (14, 'gatitos@gmail.com', '51787326-8', 'Diego Munoz', '123', -34.151361577798475, -70.73406612509535, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (15, 'hola123@gmail.com', '31145284-3', 'Vicente Aldea', '123', -33.04528003096258, -71.41191973415613, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (16, 'chao987@gmail.com', '13758286-4', 'Bastian Bustamante', '123', -33.47814447778775, -70.52756888082367, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (17, 'Alexisgoat@gmail.com', '48399730-2', 'Alexis Sanchez', '123', -33.49918136622592, -70.55569753582496, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (18, 'monitoVidal@gmail.com', '23686947-4', 'Monito Vidal', '123', -33.63326707083405, -70.5952471828527, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (19, 'aranguiz@gmail.com', '33175625-3', 'Charles Aranguiz', '123', -33.74785678522438, -70.86973453354345, NULL);

INSERT INTO public.voluntario(
	idvoluntario, emailvoluntario, rutvoluntario, nombrecompletovoluntario, contraseniavoluntario, latitud, longitud, geom)
	VALUES (20, 'garymedel@gmail.com', '10578642-5', 'gary Medel', '123', -33.824234291018364, -70.73708948806821, NULL);