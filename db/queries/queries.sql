--Citas con información completa
SELECT 
    c.id_cita,
    CONCAT(p.nombre, ' ', p.apellido) AS paciente,
    CONCAT(d.nombre, ' ', d.apellido) AS doctor,
    e.nombre AS estado,
    c.fecha_cita,
    c.motivo
FROM citas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN doctores d ON c.id_doctor = d.id_doctor
JOIN estados_cita e ON c.id_estado = e.id_estado;

--Citas por doctor

SELECT 
    d.nombre,
    COUNT(c.id_cita) AS total_citas
FROM doctores d
LEFT JOIN citas c ON d.id_doctor = c.id_doctor
GROUP BY d.nombre;

--Historial de un paciente especifico
SELECT 
    p.nombre,
    h.fecha_registro,
    h.diagnostico,
    h.tratamiento
FROM historial_clinico h
JOIN pacientes p ON h.id_paciente = p.id_paciente
WHERE p.id_paciente = 1;
