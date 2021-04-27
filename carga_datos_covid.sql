/*
Covid reports v2 
-----------------

Archivo de carga de datos desde el dataset a la base de datos. 
Primero se carga a una DB temporal con un BULK INSERT y luego a la DB definitiva. 
La ubicación del dataset descomprimido se setea en la variable @Path. 
Origen de datos: http://datos.salud.gob.ar/dataset/covid-19-casos-registrados-en-la-republica-argentina/archivo/fd657d02-a33a-498b-a91b-2ef1a68b8d16
El mismo contiene cada uno de los tests y/o casos sospechosos de Covid que hubieron en Argentina. Se van a utilizar 
los casos no descartados. 

CHANGELOG

v2.00
- Los tipos de datos definidos son genéricos, fueron hechos sin hacer una evaluacion exhaustiva
del dataset. En una siguiente version los ajustaré. Los correctos y definitivos se ajustan en el archivo de limpieza. 

*/

CREATE DATABASE Covid_Temp
GO

USE Covid_Temp
GO


CREATE TABLE Covid19Casos (
[id_evento_caso] 	[varchar](14),
[sexo] 	[varchar](4),
[edad] 	[varchar](5),
[edad_años_meses] 	[nvarchar](10),
[residencia_pais_nombre] 	[nvarchar](32),
[residencia_provincia_nombre] 	[nvarchar](30),
[residencia_departamento_nombre] [nvarchar](32),
[carga_provincia_nombre] 	[nvarchar](30),
[fecha_inicio_sintomas] 	[varchar](12),
[fecha_apertura] 	[varchar](12),
[sepi_apertura] 	[varchar](4),
[fecha_internacion] 	[varchar](12),
[cuidado_intensivo] 	[varchar](4),
[fecha_cui_intensivo] 	[varchar](12),
[fallecido] 	[varchar](4),
[fecha_fallecimiento] 	[varchar](12),
[asistencia_respiratoria_mecanica] 	[varchar](4),
[carga_provincia_id]	[varchar](4),
[origen_financiamiento] 	[varchar](30),
[clasificacion] 	[varchar](94),
[clasificacion_resumen] 	[varchar](30),
[residencia_provincia_id] 	[varchar](4),
[fecha_diagnostico] 	[varchar](12),
[residencia_departamento_id] 	[varchar](5),
[ultima_actualizacion] 	[varchar](12)
);


DECLARE @Path varchar(50) = 'E:\covid\Covid19Casos.csv'

BULK INSERT Covid19Casos
FROM @Path
WITH
(
	FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

-- Eliminar columnas con datos iguales en todas sus filas y que no suman
ALTER TABLE Covid19Casos
DROP COLUMN edad_años_meses

ALTER TABLE Covid19Casos
DROP COLUMN ultima_actualizacion


-- Crear base de datos definitiva adonde se copiarán los datos filtrados
CREATE DATABASE Covid
GO
USE Covid
GO

CREATE TABLE CasosConfirmados (
[id_evento_caso] 	[varchar](14),
[sexo] 	[varchar](4),
[edad] 	[varchar](5),
[residencia_pais_nombre] 	[nvarchar](32),
[residencia_provincia_nombre] 	[nvarchar](30),
[residencia_departamento_nombre] [nvarchar](32),
[carga_provincia_nombre] 	[nvarchar](30),
[fecha_inicio_sintomas] 	[varchar](12),
[fecha_apertura] 	[varchar](12),
[sepi_apertura] 	[varchar](4),
[fecha_internacion] 	[varchar](12),
[cuidado_intensivo] 	[varchar](4),
[fecha_cui_intensivo] 	[varchar](12),
[fallecido] 	[varchar](4),
[fecha_fallecimiento] 	[varchar](12),
[asistencia_respiratoria_mecanica] 	[varchar](4),
[carga_provincia_id]	[varchar](4),
[origen_financiamiento] 	[varchar](30),
[clasificacion] 	[varchar](94),
[clasificacion_resumen] 	[varchar](30),
[residencia_provincia_id] 	[varchar](4),
[fecha_diagnostico] 	[varchar](12),
[residencia_departamento_id] 	[varchar](5)
)

CREATE TABLE CasosDescartados (
[id_evento_caso] 	[varchar](14),
[sexo] 	[varchar](4),
[edad] 	[varchar](5),
[residencia_pais_nombre] 	[nvarchar](32),
[residencia_provincia_nombre] 	[nvarchar](30),
[residencia_departamento_nombre] [nvarchar](32),
[carga_provincia_nombre] 	[nvarchar](30),
[fecha_inicio_sintomas] 	[varchar](12),
[fecha_apertura] 	[varchar](12),
[sepi_apertura] 	[varchar](4),
[fecha_internacion] 	[varchar](12),
[cuidado_intensivo] 	[varchar](4),
[fecha_cui_intensivo] 	[varchar](12),
[fallecido] 	[varchar](4),
[fecha_fallecimiento] 	[varchar](12),
[asistencia_respiratoria_mecanica] 	[varchar](4),
[carga_provincia_id]	[varchar](4),
[origen_financiamiento] 	[varchar](30),
[clasificacion] 	[varchar](94),
[clasificacion_resumen] 	[varchar](30),
[residencia_provincia_id] 	[varchar](4),
[fecha_diagnostico] 	[varchar](12),
[residencia_departamento_id] 	[varchar](5)
)


-- Carga de los casos no descartados en la tabla CasosConfirmados

INSERT INTO CasosConfirmados

SELECT * FROM Covid_Temp.dbo.Covid19Casos
WHERE 
	clasificacion_resumen <> '"Descartado"'
	AND
	clasificacion <> '"%No Activo%"' 

/* Cargar los datos de test descartados demora mucho tiempo y no aporta datos necesarios actualmente 
INSERT INTO CasosDescartados

SELECT * FROM Covid_Temp.dbo.Covid19Casos
WHERE 
	clasificacion_resumen = '"Descartado"' */



-- Tabla temporal para pruebas en la limpieza de datos 

/*CREATE TABLE ##vartemp (
	nombreColumna varchar(32),
	dataType varchar(8),
	Length int
)

INSERT INTO ##vartemp
	SELECT column_name
	FROM information_schema.columns
	WHERE table_name = 'CasosConfirmados'

SELECT nombreColumna FROM ##vartemp

DELETE FROM ##vartemp
WHERE nombreColumna = 'fecha_inicio_sintomas'

DROP TABLE ##vartemp */

