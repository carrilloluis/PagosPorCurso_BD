/*
@description Gestión de Pagos/Cuotas por un Curso 
@author Luis Carrillo Gutiérrez
@date Enero, 2022
@version 0.0.1b
*/

-- Escala Pago
DROP TABLE IF EXISTS [Tarifario]; 
CREATE TABLE IF NOT EXISTS [Tarifario]
( 
	[id] CHAR(36) NOT NULL,
	[descripción] VARCHAR(128) NOT NULL, -- concepto de pago
	[monto] NUMERIC(8, 3) NOT NULL, 
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Curso];
CREATE TABLE IF NOT EXISTS [Curso]
(
	[id] CHAR(36) NOT NULL,
	[denominación] VARCHAR(64) NOT NULL,
	[descripción] TEXT NOT NULL,
	[día de inicio] DATE NULL, -- temporalidad
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Alumno];
CREATE TABLE IF NOT EXISTS [Alumno]
(
	[id] CHAR(36) NOT NULL,
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL,
	PRIMARY KEY(id)
) WITHOUT RowId;

-- Inscripción
DROP TABLE IF EXISTS [Matrícula]; 
CREATE TABLE IF NOT EXISTS [Matrícula]
(
	[id] INTEGER NOT NULL,
	[id del curso] CHAR(36) NOT NULL REFERENCES [Curso](id),
	[id del alumno] CHAR(36) NOT NULL REFERENCES [Alumno](id),
	[id de la tarifa] CHAR(36) NOT NULL REFERENCES [Tarifario](id),
	[número de cuotas] INTEGER UNSIGNED NOT NULL DEFAULT 1,
	PRIMARY KEY(id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Registro de Pagos];
CREATE TABLE IF NOT EXISTS [Registro de Pagos]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[id de matrícula] INTEGER UNSIGNED NOT NULL REFERENCES [Matrícula](id),
	[monto abonado] NUMERIC(8,3) NOT NULL,
	[número de cuota] INTEGER UNSIGNED NOT NULL,
	[fecha de vencimiento] DATE NOT NULL,
	PRIMARY KEY(id)
) WITHOUT RowId;