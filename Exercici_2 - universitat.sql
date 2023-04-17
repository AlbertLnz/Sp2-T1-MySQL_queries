SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE telefono IS NULL ORDER BY nombre;
SELECT * FROM persona WHERE fecha_nacimiento BETWEEN "1999-01-01" AND "1999-12-31" AND tipo="alumno";
SELECT * FROM persona WHERE tipo="profesor" AND telefono IS NULL AND nif LIKE("%k");
SELECT * FROM asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado=7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre AS departamento FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo="profesor" ORDER BY apellido1 DESC, apellido2 DESC, persona.nombre DESC;
SELECT persona.nombre, nif, apellido1, apellido2, asignatura.nombre AS nombre_asignatura, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona LEFT JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno LEFT JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE nif="26902806M";
SELECT persona.nombre, persona.apellido1, persona.tipo, departamento.nombre AS departamento, grado.nombre AS nombre_grado FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN grado ON asignatura.id_grado = grado.id LEFT JOIN persona ON profesor.id_profesor = persona.id WHERE grado.id=4 GROUP BY persona.nombre;
SELECT * FROM persona LEFT JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE tipo="alumno" AND curso_escolar.id=5 GROUP BY persona.nif;

SELECT departamento.nombre AS nombre_departamento, apellido1, apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY nombre_departamento DESC, apellido1 DESC, apellido2 DESC, persona.nombre DESC;
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_departamento LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo="profesor" & id_departamento IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN persona ON profesor.id_profesor = persona.id WHERE profesor.id_profesor IS NULL;
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL AND persona.tipo="profesor";
SELECT * FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN alumno_se_matricula_asignatura ON profesor.id_profesor = alumno_se_matricula_asignatura.id_curso_escolar LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE profesor.id_departamento IS NULL;

SELECT COUNT(tipo) AS num_alumnos FROM persona WHERE tipo="alumno";
SELECT COUNT(tipo) AS alumnos_1999 FROM persona WHERE tipo="alumno" AND fecha_nacimiento BETWEEN "1999-01-01" AND "1999-12-31";
SELECT departamento.nombre, COUNT(departamento.nombre) AS conteo_departamento FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN persona ON profesor.id_profesor = persona.id GROUP BY departamento.nombre;
SELECT departamento.nombre, COUNT(departamento.nombre) AS profesores FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT * FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado ORDER BY asignatura.nombre;
-
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) AS suma_creditos FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY grado.nombre;
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_asignatura) FROM persona LEFT JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.anyo_inicio ORDER BY curso_escolar.anyo_inicio;
SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo="profesor" AND asignatura.id_profesor IS NOT NULL GROUP BY persona.nombre DESC ORDER BY persona.nombre DESC;
SELECT * FROM persona WHERE tipo="alumno" ORDER BY fecha_nacimiento ASC LIMIT 1;
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo="profesor" AND profesor.id_departamento IS NOT NULL AND asignatura.id_profesor IS NULL;