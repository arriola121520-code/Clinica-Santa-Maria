-- Base de datos de Clínica Santa María (MySQL)
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL,              -- ADMIN, RECEPCIONISTA
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS especialidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS medico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cmp VARCHAR(9) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(9),
    email VARCHAR(100),
    especialidad_id INT NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (especialidad_id) REFERENCES especialidad(id)
);

CREATE TABLE IF NOT EXISTS paciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(9),
    email VARCHAR(100),
    direccion VARCHAR(150),
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS horario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medico_id INT NOT NULL,
    dia_semana TINYINT NOT NULL,           -- 1=Lunes ... 7=Domingo
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (medico_id) REFERENCES medico(id)
);

CREATE TABLE IF NOT EXISTS cita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    observaciones VARCHAR(255),
    estado VARCHAR(15) NOT NULL DEFAULT 'PROGRAMADA',  -- PROGRAMADA, ATENDIDA, CANCELADA
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id)
);

-- Datos iniciales (la contraseña se cifra sola en el primer login)
INSERT INTO usuario (username, password, nombre, rol) VALUES
    ('admin', 'admin123', 'Administrador', 'ADMIN'),
    ('recep01', 'recep123', 'Recepcionista', 'RECEPCIONISTA')
ON DUPLICATE KEY UPDATE username = username;

INSERT INTO especialidad (nombre) VALUES
    ('Medicina General'), ('Pediatría'), ('Cardiología'),
    ('Dermatología'), ('Ginecología')
ON DUPLICATE KEY UPDATE nombre = nombre;
