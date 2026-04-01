--Especialidades

INSERT INTO especialidades (nombre, descripcion) VALUES
('Cardiología', 'Especialidad del corazón'),
('Pediatría', 'Medicina infantil'),
('Dermatología', 'Especialidad de la piel');

--Estados de cita

INSERT INTO estados_cita (nombre, descripcion) VALUES
('Programada', 'La cita ha sido agendada'),
('Completada', 'La cita ya fue atendida'),
('Cancelada', 'La cita fue cancelada'),
('No asistió', 'El paciente no se presentó');

--Pacientes

INSERT INTO pacientes 
(nombre, apellido, fecha_nacimiento, telefono, email, direccion)
VALUES
('Juan', 'Perez', '1990-05-10', '6641111111', 'juan@email.com', 'Tijuana'),
('Maria', 'Lopez', '1985-08-21', '6642222222', 'maria@email.com', 'Tijuana'),
('Carlos', 'Ramirez', '2000-03-15', '6643333333', 'carlos@email.com', 'Rosarito');


--Dotores

INSERT INTO doctores
(nombre, apellido, id_especialidad, telefono, email)
VALUES
('Ana', 'Martinez', 1, '6644444444', 'ana@hospital.com'),
('Luis', 'Gonzalez', 2, '6645555555', 'luis@hospital.com'),
('Sofia', 'Hernandez', 3, '6646666666', 'sofia@hospital.com');

--Citas

INSERT INTO citas
(id_paciente, id_doctor, id_estado, fecha_cita, motivo)
VALUES
(1, 1, 1, '2026-03-10 10:00:00', 'Dolor de pecho'),
(2, 2, 1, '2026-03-10 11:00:00', 'Chequeo general'),
(3, 3, 1, '2026-03-11 09:30:00', 'Problema en la piel');
