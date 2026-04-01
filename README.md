# 🏥 Centro Médico SQL

## 📌 Descripción
Sistema relacional diseñado para la gestión de pacientes, doctores y citas médicas, enfocado en integridad de datos, normalización y control de consistencia.

Este proyecto simula un entorno de producción aplicando buenas prácticas de bases de datos.

---

## 🧠 Objetivos del proyecto

- Diseñar un modelo relacional normalizado (3FN)
- Implementar integridad referencial con claves foráneas
- Evitar inconsistencias mediante restricciones (RESTRICT, UNIQUE)
- Simular control de datos en un sistema médico real

---

## 🏗 Estructura del proyecto 
```
centro-medico-sql/
├── README.md
├── db/
│   ├── schema/
│   │   ├── 01_tables.sql
│   │   ├── 02_constraints.sql
│   │   └── 03_indexes.sql
│   ├── seed/
│   │   └── seed_data.sql
│   ├── queries/
│   │   ├── pacientes.sql
│   │   ├── citas.sql
│   │   └── reportes.sql
│   └── migrations/ (En proceso)
```
