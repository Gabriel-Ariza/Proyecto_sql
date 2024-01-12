


# 4. aprendices que están en la carrera de Electronica.
SELECT a.nombre AS nombre_aprendiz, a.edad AS edad, c.nombre AS carrera
FROM carrera AS c
JOIN ruta AS r ON r.id_carrera = c.id_carrera
JOIN matricula AS m ON m.id_ruta = r.id_ruta
JOIN aprendiz AS a ON a.id_aprendiz = m.id_aprendiz
WHERE c.nombre LIKE 'Electrónica' GROUP BY a.nombre, a.edad, c.nombre;



# 5. Aprendices que cancelaron en la ruta de aprendizaje.
SELECT DISTINCT a.nombre AS nombre_aprendiz, e.nombre AS ruta, m.estado AS estado_matricula
FROM aprendiz AS a
JOIN matricula AS m ON m.id_aprendiz = a.id_aprendiz
JOIN ruta AS r ON r.id_ruta = m.id_ruta
JOIN enfasis AS e ON e.id_enfasis = r.id_enfasis
WHERE m.estado LIKE 'cancelado'



# 6. Nombre de los cursos que no tienen un instructor asignado.
SELECT nombre AS nombre_curso, id_instructor AS instructor 
FROM curso WHERE id_instructor IS NULL;



# 7. instructores que dictan cursos en la ruta “Sistemas de Información Empresariales”.
SELECT DISTINCT i.nombre AS instructor, c.nombre AS curso, cr.id_ruta AS Ruta, e.nombre AS enfasis
FROM curso_ruta AS cr
JOIN curso AS c ON c.id_curso = cr.id_curso
JOIN enfasis AS e ON e.id_enfasis = cr.id_ruta
JOIN instructor AS i ON i.id_instructor = c.id_instructor
WHERE cr.id_ruta = 1



# 8. Aprendices que terminaron una carrera con su ruta.
SELECT DISTINCT a.nombre AS aprendiz, c.nombre AS carrera, e.nombre AS ruta_escogida, m.estado AS estado
FROM enfasis AS e
JOIN ruta AS r ON r.id_enfasis = e.id_enfasis
JOIN carrera AS c ON c.id_carrera = r.id_carrera
JOIN matricula AS m ON m.id_ruta = r.id_ruta
JOIN aprendiz AS a ON a.id_aprendiz = m.id_aprendiz
WHERE m.estado LIKE 'Terminado';



# 9. Aprendices matriculados en "Bases de Datos Relacionales"
SELECT
FROM



# 10. Instructores que no tienen un curso asignado
SELECT i.nombre AS instructores_sin_curso FROM instructor AS i
LEFT JOIN curso AS c ON c.id_instructor = i.id_instructor
WHERE c.id_instructor IS NULL;

