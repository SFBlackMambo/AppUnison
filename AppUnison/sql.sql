CREATE TABLE IF NOT EXISTS carrera (
    carrera_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS alumno (
    alumno_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    expediente VARCHAR(9) UNIQUE NOT NULL,
    correo VARCHAR(50) NOT NULL,
    carrera_id INT NOT NULL,
    numero_afiliacion_imss VARCHAR(20) UNIQUE,
    numero_afiliacion_isssteson VARCHAR(20) UNIQUE,
    numero_afiliacion_issste VARCHAR(20) UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    numero_celular VARCHAR(15) NOT NULL,
    comunicacion_ingles ENUM('positivo', 'negativo'),
    semestre TINYINT,
    calificacion_kxardex TINYINT,
    sexo VARCHAR(20),
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
);

CREATE TABLE IF NOT EXISTS unidadreceptora (
    unidadreceptora_id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS profesor (
    profesor_id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    noempleado VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS visita (
    visita_id INT PRIMARY KEY NOT NULL,
    idunidadreceptora INT NOT NULL,
    fechavisita DATE NOT NULL,
    limitedecupo INT NOT NULL,
    horasalida TIME NOT NULL,
    horavuelta TIME NOT NULL,
    profesor_id INT NOT NULL,
    vigenciaconvocatoria DATE NOT NULL,
    restricionsexo VARCHAR(15),
    FOREIGN KEY (idunidadreceptora) REFERENCES unidadreceptora(unidadreceptora_id),
    FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id)
);

CREATE TABLE IF NOT EXISTS asistencia (
    asistencia_id INT NOT NULL,
    visita_id INT NOT NULL,
    alumno_id INT NOT NULL,
    PRIMARY KEY (asistencia_id),
    FOREIGN KEY (visita_id) REFERENCES visita(visita_id),
    FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id)
);

