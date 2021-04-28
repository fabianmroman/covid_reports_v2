-- Queries de prueba - exploracion

USE Covid;


-- Listar todas las columnas con sus tipos y max length
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM information_schema.columns
WHERE table_name = 'CasosConfirmados'
ORDER BY DATA_TYPE, CHARACTER_MAXIMUM_LENGTH


-- Queries de exploracion de datos

SELECT residencia_pais_nombre, COUNT(residencia_pais_nombre) AS Total
FROM CasosConfirmados
WHERE residencia_pais_nombre <> 'Argentina'
GROUP BY residencia_pais_nombre
ORDER BY Total DESC

-- Optimizar!!!
DECLARE @Maximo varchar(14)
DECLARE @Minimo varchar(14)
SET @Maximo = (SELECT MAX(id_evento_caso) FROM CasosConfirmados)
SET @Minimo = (SELECT MIN(id_evento_caso) FROM CasosConfirmados)

SELECT * FROM CasosConfirmados
WHERE id_evento_caso = @Maximo

SELECT * FROM CasosConfirmados
WHERE id_evento_caso = @Minimo


SELECT * FROM CasosConfirmados
WHERE residencia_provincia_nombre <> carga_provincia_nombre
ORDER BY carga_provincia_nombre, residencia_provincia_nombre

SELECT * from CasosConfirmados 
WHERE edad LIKE '-%'

SELECT DISTINCT sexo FROM CasosConfirmados

SELECT * FROM CasosConfirmados
WHERE sexo = '"NR"'

SELECT COUNT(fallecido) FROM CasosConfirmados
WHERE fallecido = 'SI'
-- 63483

SELECT COUNT(*) FROM CasosConfirmados
WHERE clasificacion = 'Caso confirmado por laboratorio - No activo (por tiempo de evolución)'
-- 2.157.686

SELECT COUNT(*) FROM CasosConfirmados
WHERE clasificacion = 'Caso sospechoso - No Activo - Con muestra sin resultado concluyente' OR
	  clasificacion = 'Caso con resultado negativo-no conclusivo - No activo'
-- 521694

SELECT COUNT(*) FROM CasosConfirmados
WHERE clasificacion_resumen = 'Sospechoso'
-- 804207

SELECT clasificacion, COUNT(*) AS Cantidad FROM CasosConfirmados
WHERE clasificacion_resumen = 'Sospechoso'
GROUP BY clasificacion
ORDER BY Cantidad


-- Modelo de Query exploratoria
SELECT TOP 10 
	sexo,
	edad,
	residencia_pais_nombre,
	residencia_provincia_nombre,
	residencia_departamento_nombre, 
	fecha_apertura, 
	fecha_diagnostico, 
	clasificacion,
	clasificacion_resumen, 
	origen_financiamiento,
	fallecido
FROM CasosConfirmados

SELECT COUNT(*) FROM CasosConfirmados
WHERE origen_financiamiento = 'Privado'
-- 1188393


SELECT COUNT(*) FROM CasosConfirmados
-- 3629083



-- Query tentativa para sacar los casos diarios (con alias complejo)
DECLARE @Fecha date
DECLARE @Query varchar(1000)
SET @Fecha = '2021-04-22'

SET @Query = 
	'SELECT COUNT(*) AS ''Cantidad ' + CONVERT(varchar, @Fecha, 3) + ''' ' +
	'FROM CasosConfirmados 
	 WHERE
		fecha_apertura = ''' + CAST (@Fecha AS varchar) + ''' ' + 'AND 
		(clasificacion_resumen = ''Confirmado'' OR 
		(clasificacion_resumen = ''Sospechoso''
		AND clasificacion NOT LIKE ''%No activo%'')
		)'

EXEC (@Query)



-- Contar los casos de cada dia 

SELECT fecha_apertura,  COUNT(*) AS 'Cantidad' FROM CasosConfirmados
WHERE
	clasificacion_resumen = 'Confirmado' OR 
	(clasificacion_resumen = 'Sospechoso' AND clasificacion NOT LIKE '%No activo%')
GROUP BY fecha_apertura
ORDER BY fecha_apertura