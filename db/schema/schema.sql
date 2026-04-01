--Creción de la base de datos
CREATE DATABASE centro_medico_sql
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE centro_medico_sql;

--Tabla especialidades

CREATE TABLE especialidades (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;

--Tabla estados de cita
CREATE TABLE estados_cita (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;

--Tabla pacientes
CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    direccion VARCHAR(255),
    activo BOOLEAN NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


--Tabla doctores
CREATE TABLE doctores (
    id_doctor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    id_especialidad INT NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    activo BOOLEAN NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_doctor_especialidad
        FOREIGN KEY (id_especialidad)
        REFERENCES especialidades(id_especialidad)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

--Tabla de citas
CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_doctor INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    motivo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_cita_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_cita_doctor
        FOREIGN KEY (id_doctor)
        REFERENCES doctores(id_doctor)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_cita_estado
        FOREIGN KEY (id_estado)
        REFERENCES estados_cita(id_estado)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT unique_doctor_fecha
        UNIQUE (id_doctor, fecha_cita)
) ENGINE=InnoDB;
--Tabla historial clinico
CREATE TABLE historial_clinico (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    diagnostico TEXT NOT NULL,
    tratamiento TEXT,
    observaciones TEXT,

    CONSTRAINT fk_historial_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;
