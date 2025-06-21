DROP DATABASE NUTRI;
CREATE DATABASE NUTRI;
USE NUTRI;

--
-- BASE DE DATOS ---------------------- 
--

-- PACIENTE --------------------------- 

DROP TABLE IF EXISTS PACIENTE;
CREATE TABLE IF NOT EXISTS PACIENTE(
	ID_PACIENTE INT AUTO_INCREMENT COMMENT 'Id de paciente',
    NOMBRE VARCHAR(25) NOT NULL COMMENT 'Nombre del cliente',
    EDAD INTEGER NOT NULL COMMENT 'Edad cliente',
	ALTURA INTEGER NOT NULL COMMENT 'Altura cliente',
    FECHA_NACIMIENTO DATE NOT NULL COMMENT 'Fecha nacimiento cliente',
    TELEFONO VARCHAR(25) NOT NULL COMMENT 'Telefono cliente',
    OBJETIVO VARCHAR(25) NOT NULL COMMENT 'Objetivo cliente',
PRIMARY KEY (ID_PACIENTE)
);


-- CONSULTA --------------------------- 

DROP TABLE IF EXISTS CONSULTA;
CREATE TABLE IF NOT EXISTS CONSULTA(
	ID_CONSULTA INT AUTO_INCREMENT COMMENT 'Id de consulta',
    ID_PACIENTE_CONSULTA INT COMMENT 'Id de paciente tabla paciente',
    FECHA_CONSULTA DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de consulta',
    PESO DECIMAL(5,2) COMMENT 'Peso en consulta',
    CINTURA DECIMAL(5,2) COMMENT 'Cintura en consulta',
    ABDOMEN DECIMAL(5,2) COMMENT 'Abdomen en consulta',
    CADERA DECIMAL(5,2) COMMENT 'Cadera en consulta',
CONSTRAINT `FK_ID_PACIENTE_CONSULTA` FOREIGN KEY (ID_PACIENTE_CONSULTA) REFERENCES PACIENTE (ID_PACIENTE),
PRIMARY KEY (ID_CONSULTA)
);

-- MEDICION PLIEGUES --------------------------- 

DROP TABLE IF EXISTS MEDICION;
CREATE TABLE IF NOT EXISTS MEDICION(
	ID_MEDICION INT AUTO_INCREMENT COMMENT 'Id de medicion',
    ID_PACIENTE_MEDICION INT COMMENT 'Id de paciente tabla paciente',
	FECHA_MEDICION DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de medicion',
	TRICEPS DECIMAL(5,2) COMMENT 'Tricepts en medicion',
    BICEPS DECIMAL(5,2) COMMENT 'Biceps en medicion',
    SUBESCAPULAR DECIMAL(5,2) COMMENT 'Subescapular en medicion',
    CRESTA_LLIACA DECIMAL(5,2) COMMENT 'Cresta en medicion',
    SUPRAILIACO DECIMAL(5,2) COMMENT 'Suprailiaco en medicion',
    ABDOMINAL DECIMAL(5,2) COMMENT 'Abdominal en medicion',
    MUSLO DECIMAL(5,2) COMMENT 'Muslo en medicion',
    PANTORILLA DECIMAL(5,2) COMMENT 'Pantorilla en medicion',
CONSTRAINT `FK_ID_PACIENTE_MEDICION` FOREIGN KEY (ID_PACIENTE_MEDICION) REFERENCES PACIENTE (ID_PACIENTE),
PRIMARY KEY (ID_MEDICION)
);

-- VARIACION PLIEGUES --------------------------- 

DROP TABLE IF EXISTS VARIACION_PLIEGUES;
CREATE TABLE IF NOT EXISTS VARIACION_PLIEGUES(
	ID_MEDICION_VARIACION INT AUTO_INCREMENT COMMENT 'Id de medicion tras variacion',
    ID_PACIENTE_VARIACION INT COMMENT 'Id de paciente tabla paciente',
	FECHA_PRIMERA_MEDICION DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de medicion anterior',
	FECHA_MEDICION_ACTUAL DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de medicion actual',
	TRICEPS DECIMAL(5,2) COMMENT 'Tricepts en medicion',
    BICEPS DECIMAL(5,2) COMMENT 'Biceps en medicion',
    SUBESCAPULAR DECIMAL(5,2) COMMENT 'Subescapular en medicion',
    CRESTA_LLIACA DECIMAL(5,2) COMMENT 'Cresta en medicion',
    SUPRAILIACO DECIMAL(5,2) COMMENT 'Suprailiaco en medicion',
    ABDOMINAL DECIMAL(5,2) COMMENT 'Abdominal en medicion',
    MUSLO DECIMAL(5,2) COMMENT 'Muslo en medicion',
    PANTORILLA DECIMAL(5,2) COMMENT 'Pantorilla en medicion',
CONSTRAINT `FK_ID_PACIENTE_VARIACION` FOREIGN KEY (ID_PACIENTE_VARIACION) REFERENCES PACIENTE (ID_PACIENTE),
PRIMARY KEY (ID_MEDICION_VARIACION)
);


-- TESTEO PACIENTES --------------------------- 

INSERT INTO PACIENTE (NOMBRE, EDAD, ALTURA, FECHA_NACIMIENTO, TELEFONO, OBJETIVO) 
VALUES('Lucas','50','191','2024-12-17','3515286981','Cagar mejor');
SELECT * FROM PACIENTE;

-- TESTEO CONSULTA --------------------------- 

INSERT INTO CONSULTA (ID_PACIENTE_CONSULTA, FECHA_CONSULTA, PESO, CINTURA, ABDOMEN, CADERA)
VALUES(4,NOW(),'80','5','45.3','36.4');
SELECT * FROM CONSULTA;

-- TESTEO MEDICION PLIEGUES --------------------------- 

INSERT INTO MEDICION (ID_PACIENTE_MEDICION, FECHA_MEDICION, TRICEPS, BICEPS, SUBESCAPULAR, CRESTA_LLIACA, SUPRAILIACO, ABDOMINAL, MUSLO, PANTORILLA)
VALUES(10,'2024-12-17','6','7','8','9','10','11','12','13');
SELECT * FROM MEDICION;

-- TESTEO VARIACION PLIEGUES --------------------------- 



	ID_PACIENTE INT AUTO_INCREMENT COMMENT 'Id de paciente',
    NOMBRE VARCHAR(25) NOT NULL COMMENT 'Nombre del cliente',
    EDAD INTEGER NOT NULL COMMENT 'Edad cliente',
	ALTURA INTEGER NOT NULL COMMENT 'Altura cliente',
    FECHA_NACIMIENTO DATE NOT NULL COMMENT 'Fecha nacimiento cliente',
    TELEFONO VARCHAR(25) NOT NULL COMMENT 'Telefono cliente',
    OBJETIVO VARCHAR(25) NOT NULL COMMENT 'Objetivo cliente',

INSERT INTO PACIENTE VALUES(,'1','99','199',NOW());




"INSERT INTO variaciones (usuario_id, fecha_inicio, fecha_fin, delta_triceps, delta_biceps)
SELECT 
    m1.usuario_id,
    m1.fecha AS fecha_inicio,
    m2.fecha AS fecha_fin,
    m2.triceps - m1.triceps AS delta_triceps,
    m2.biceps - m1.biceps AS delta_biceps
FROM mediciones m1
JOIN mediciones m2 
    ON m1.usuario_id = m2.usuario_id 
    AND m1.fecha < m2.fecha; -- Asegurarse de no duplicar o comparar la misma fecha"
    
"INSERT INTO variaciones (usuario_id, fecha_inicio, fecha_fin, delta_triceps, delta_biceps)
SELECT 
    m1.usuario_id,
    m1.fecha AS fecha_inicio,
    m2.fecha AS fecha_fin,
    m2.triceps - m1.triceps AS delta_triceps,
    m2.biceps - m1.biceps AS delta_biceps
FROM mediciones m1
JOIN mediciones m2 
    ON m1.usuario_id = m2.usuario_id 
    AND m1.fecha < m2.fecha
WHERE m1.fecha >= '2024-12-01' AND m2.fecha <= '2024-12-30'; -- Rango específico"
