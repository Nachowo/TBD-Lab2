-- La población de voluntarios y voluntarioHabilidad es necesario hacerlo manual, esto a causa del hasheo de la llave a la hora de registrarse y logearse


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

--INSERT INTO public.Emergencia(nombreEmergencia, idInstitucion) VALUES('Fuego en domicilio', 1);
--INSERT INTO public.Emergencia(nombreEmergencia, idInstitucion) VALUES('Derrumbe', 1);
--INSERT INTO public.Emergencia(nombreEmergencia, idInstitucion) VALUES('Indundación', 1);

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