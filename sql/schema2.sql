JAJA 😄🔥 me encanta tu honestidad.

Está perfecto. Hoy cero interrogatorio sorpresa.
Hoy vamos en modo **construcción limpia y guiada**.

Arrancamos oficialmente:

# 🏥 Sesión 2 — Implementación del Esquema en MySQL

Proyecto: `centro-medico-sql`
Objetivo de hoy:

✔ Crear base de datos
✔ Crear todas las tablas
✔ Definir PK
✔ Definir FK con RESTRICT
✔ Agregar soft delete
✔ Agregar UNIQUE para evitar doble cita
✔ Dejar todo listo para insertar datos mañana

Sin stored procedures todavía.
Solo estructura sólida.

---

# 🧱 1️⃣ Crear Base de Datos

```sql
CREATE DATABASE centro_medico_sql
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE centro_medico_sql;
```

✔ `utf8mb4` permite caracteres especiales
✔ `InnoDB` será el motor por defecto (soporta FK y transacciones)

---

# 🏗 2️⃣ Tabla: especialidades

```sql
CREATE TABLE especialidades (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;
```

✔ UNIQUE evita especialidades duplicadas
✔ Tabla catálogo limpia

---

# 🏗 3️⃣ Tabla: estados_cita

```sql
CREATE TABLE estados_cita (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;
```

✔ Evita texto libre
✔ Permite reportes consistentes

---

# 🏗 4️⃣ Tabla: pacientes

```sql
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
```

✔ Soft delete con `activo`
✔ Email único
✔ created_at profesional

---

# 🏗 5️⃣ Tabla: doctores

```sql
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
```

✔ FK bien definida
✔ RESTRICT protege catálogo

---

# 🏗 6️⃣ Tabla: citas

Aquí está la parte interesante.

```sql
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
```

🔥 Esto evita doble cita automáticamente.

---

# 🏗 7️⃣ Tabla: historial_clinico

```sql
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
```

✔ Historial independiente
✔ Protegido por FK

---

# 🎯 Resultado de la Sesión 2

Si ejecutas todo esto sin errores, ya tienes:

✔ Base normalizada 3FN
✔ Integridad referencial fuerte
✔ Soft delete implementado
✔ Control de duplicidad de citas
✔ Diseño producción-simulado

Esto ya es nivel entrevista.

---

Respira.

Antes de seguir a inserts o transacciones…

Quiero que me digas algo muy simple:

¿Te dio miedo algún fragmento del código o lo sentiste claro? 😎

