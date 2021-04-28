-- Archivo temporal para limpieza de datos, ajuste de tipo de datos y optimización. 
-- La versión definitiva será con un cursor.
-- Los datos del CSV están en UTF-8 y en otra codificación, por lo cual por más que use SQL Server 2019, iba a tener 
-- que hacer el mismo trabajo. 

-- 28/04/2021: El uso de índices aceleró enormemente la velocidad de las queries, pudiendo hacer queries más extensas/detalladas.
-- Evaluar usar índices antes de la limpieza, luego hacer un rebuild. 


USE Covid;

-- Eliminar comillas

UPDATE CasosConfirmados
SET edad = STUFF(edad,1,1,'')

UPDATE CasosConfirmados
SET edad = STUFF(edad,len(edad),1,'')

UPDATE CasosConfirmados
SET residencia_provincia_nombre = STUFF(residencia_provincia_nombre,1,1,'')

UPDATE CasosConfirmados
SET residencia_provincia_nombre = STUFF(residencia_provincia_nombre,len(residencia_provincia_nombre),1,'')

UPDATE CasosConfirmados
SET residencia_departamento_nombre = STUFF(residencia_departamento_nombre,1,1,'')

UPDATE CasosConfirmados
SET residencia_departamento_nombre = STUFF(residencia_departamento_nombre,len(residencia_departamento_nombre),1,'')

UPDATE CasosConfirmados
SET carga_provincia_nombre = STUFF(carga_provincia_nombre,1,1,'')

UPDATE CasosConfirmados
SET carga_provincia_nombre = STUFF(carga_provincia_nombre,len(carga_provincia_nombre),1,'')

UPDATE CasosConfirmados
SET fecha_apertura = STUFF(fecha_apertura,1,1,'')

UPDATE CasosConfirmados
SET fecha_apertura = STUFF(fecha_apertura,len(fecha_apertura),1,'')

UPDATE CasosConfirmados
SET sepi_apertura = STUFF(sepi_apertura,1,1,'')

UPDATE CasosConfirmados
SET sepi_apertura = STUFF(sepi_apertura,len(sepi_apertura),1,'')

UPDATE CasosConfirmados
SET fecha_internacion = STUFF(fecha_internacion,1,1,'')

UPDATE CasosConfirmados
SET fecha_internacion = STUFF(fecha_internacion,len(fecha_internacion),1,'')

UPDATE CasosConfirmados
SET cuidado_intensivo = STUFF(cuidado_intensivo,1,1,'')

UPDATE CasosConfirmados
SET cuidado_intensivo = STUFF(cuidado_intensivo,len(cuidado_intensivo),1,'')

UPDATE CasosConfirmados
SET fecha_cui_intensivo = STUFF(fecha_cui_intensivo,1,1,'')

UPDATE CasosConfirmados
SET fecha_cui_intensivo = STUFF(fecha_cui_intensivo,len(fecha_cui_intensivo),1,'')

UPDATE CasosConfirmados
SET fallecido = STUFF(fallecido,1,1,'')

UPDATE CasosConfirmados
SET fallecido = STUFF(fallecido,len(fallecido),1,'')

UPDATE CasosConfirmados
SET fecha_fallecimiento = STUFF(fecha_fallecimiento,1,1,'')

UPDATE CasosConfirmados
SET fecha_fallecimiento = STUFF(fecha_fallecimiento,len(fecha_fallecimiento),1,'')

UPDATE CasosConfirmados
SET asistencia_respiratoria_mecanica = STUFF(asistencia_respiratoria_mecanica,1,1,'')

UPDATE CasosConfirmados
SET asistencia_respiratoria_mecanica = STUFF(asistencia_respiratoria_mecanica,len(asistencia_respiratoria_mecanica),1,'')

UPDATE CasosConfirmados
SET carga_provincia_id = STUFF(carga_provincia_id,1,1,'')

UPDATE CasosConfirmados
SET carga_provincia_id = STUFF(carga_provincia_id,len(carga_provincia_id),1,'')

UPDATE CasosConfirmados
SET origen_financiamiento = STUFF(origen_financiamiento,1,1,'')

UPDATE CasosConfirmados
SET origen_financiamiento = STUFF(origen_financiamiento,len(origen_financiamiento),1,'')

UPDATE CasosConfirmados
SET clasificacion = STUFF(clasificacion,1,1,'')

UPDATE CasosConfirmados
SET clasificacion = STUFF(clasificacion,len(clasificacion),1,'')

UPDATE CasosConfirmados
SET clasificacion_resumen = STUFF(clasificacion_resumen,1,1,'')

UPDATE CasosConfirmados
SET clasificacion_resumen = STUFF(clasificacion_resumen,len(clasificacion_resumen),1,'')

UPDATE CasosConfirmados
SET residencia_provincia_id = STUFF(residencia_provincia_id,1,1,'')

UPDATE CasosConfirmados
SET residencia_provincia_id = STUFF(residencia_provincia_id,len(residencia_provincia_id),1,'')

UPDATE CasosConfirmados
SET fecha_diagnostico = STUFF(fecha_diagnostico,1,1,'')

UPDATE CasosConfirmados
SET fecha_diagnostico = STUFF(fecha_diagnostico,len(fecha_diagnostico),1,'')

UPDATE CasosConfirmados
SET residencia_departamento_id = STUFF(residencia_departamento_id,1,1,'')

UPDATE CasosConfirmados
SET residencia_departamento_id = STUFF(residencia_departamento_id,len(residencia_departamento_id),1,'')

UPDATE CasosConfirmados
SET ultima_actualizacion = STUFF(ultima_actualizacion,1,1,'')

UPDATE CasosConfirmados
SET ultima_actualizacion = STUFF(ultima_actualizacion,len(ultima_actualizacion),1,'')

UPDATE CasosConfirmados
SET id_evento_caso = STUFF(id_evento_caso,1,1,'')

UPDATE CasosConfirmados
SET id_evento_caso = STUFF(id_evento_caso,len(id_evento_caso),1,'')

UPDATE CasosConfirmados
SET sexo = STUFF(sexo,1,1,'')

UPDATE CasosConfirmados
SET sexo = STUFF(sexo,len(sexo),1,'')

UPDATE CasosConfirmados
SET residencia_pais_nombre = STUFF(residencia_pais_nombre,1,1,'')

UPDATE CasosConfirmados
SET residencia_pais_nombre = STUFF(residencia_pais_nombre,len(residencia_pais_nombre),1,'')

UPDATE CasosConfirmados
SET fecha_inicio_sintomas = STUFF(fecha_inicio_sintomas,1,1,'')

UPDATE CasosConfirmados
SET fecha_inicio_sintomas = STUFF(fecha_inicio_sintomas,len(fecha_inicio_sintomas),1,'')



-- Corregir caracteres especiales

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├í',N'á')
WHERE residencia_departamento_nombre LIKE N'%├í%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├®',N'é')
WHERE residencia_departamento_nombre LIKE N'%├®%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├¡',N'í')
WHERE residencia_departamento_nombre LIKE N'%├¡%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├│',N'ó')
WHERE residencia_departamento_nombre LIKE N'%├│%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├║',N'ú')
WHERE residencia_departamento_nombre LIKE N'%├║%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├æ',N'Ñ')
WHERE residencia_departamento_nombre LIKE N'%├æ%'

UPDATE CasosConfirmados
SET residencia_departamento_nombre = REPLACE(residencia_departamento_nombre,N'├▒',N'ñ')
WHERE residencia_departamento_nombre LIKE N'%├▒%'



UPDATE CasosConfirmados
SET residencia_provincia_nombre = REPLACE(residencia_provincia_nombre,N'├í',N'á')
WHERE residencia_provincia_nombre LIKE N'%├í%'

UPDATE CasosConfirmados
SET residencia_provincia_nombre = REPLACE(residencia_provincia_nombre,N'├®',N'é')
WHERE residencia_provincia_nombre LIKE N'%├®%'

UPDATE CasosConfirmados
SET residencia_provincia_nombre = REPLACE(residencia_provincia_nombre,N'├¡',N'í')
WHERE residencia_provincia_nombre LIKE N'%├¡%'

UPDATE CasosConfirmados
SET residencia_provincia_nombre = REPLACE(residencia_provincia_nombre,N'├│',N'ó')
WHERE residencia_provincia_nombre LIKE N'%├│%'

UPDATE CasosConfirmados
SET residencia_provincia_nombre = REPLACE(residencia_provincia_nombre,N'├║',N'ú')
WHERE residencia_provincia_nombre LIKE N'%├║%'

UPDATE CasosConfirmados
SET carga_provincia_nombre = REPLACE(carga_provincia_nombre,N'├í',N'á')
WHERE carga_provincia_nombre LIKE N'%├í%'

UPDATE CasosConfirmados
SET carga_provincia_nombre = REPLACE(carga_provincia_nombre,N'├®',N'é')
WHERE carga_provincia_nombre LIKE N'%├®%'

UPDATE CasosConfirmados
SET carga_provincia_nombre = REPLACE(carga_provincia_nombre,N'├¡',N'í')
WHERE carga_provincia_nombre LIKE N'%├¡%'

UPDATE CasosConfirmados
SET carga_provincia_nombre = REPLACE(carga_provincia_nombre,N'├│',N'ó')
WHERE carga_provincia_nombre LIKE N'%├│%'

UPDATE CasosConfirmados
SET carga_provincia_nombre = REPLACE(carga_provincia_nombre,N'├║',N'ú')
WHERE carga_provincia_nombre LIKE N'%├║%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├í',N'á')
WHERE residencia_pais_nombre LIKE N'%├í%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├®',N'é')
WHERE residencia_pais_nombre LIKE N'%├®%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├¡',N'í')
WHERE residencia_pais_nombre LIKE N'%├¡%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├│',N'ó')
WHERE residencia_pais_nombre LIKE N'%├│%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├║',N'ú')
WHERE residencia_pais_nombre LIKE N'%├║%'

UPDATE CasosConfirmados
SET residencia_pais_nombre = REPLACE(residencia_pais_nombre,N'├▒',N'ñ')
WHERE residencia_pais_nombre LIKE N'%├▒%'


UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├í',N'á')
WHERE clasificacion LIKE N'%├í%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├®',N'é')
WHERE clasificacion LIKE N'%├®%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├¡',N'í')
WHERE clasificacion LIKE N'%├¡%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├│',N'ó')
WHERE clasificacion LIKE N'%├│%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├║',N'ú')
WHERE clasificacion LIKE N'%├║%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion,N'├▒',N'ñ')
WHERE clasificacion LIKE N'%├▒%'

UPDATE CasosConfirmados
SET clasificacion = REPLACE(clasificacion ,N'├æ',N'Ñ')
WHERE clasificacion  LIKE N'%├æ%'


UPDATE CasosConfirmados
SET origen_financiamiento = N'Público'
WHERE origen_financiamiento = N'P+¦blico'

UPDATE CasosConfirmados
SET clasificacion = N'Caso confirmado por criterio clínico - epidemiológico -  Activo internado'
WHERE clasificacion = N'Caso confirmado por criterio cl+¡nico - epidemiol+¦gico -  Activo internado'

UPDATE CasosConfirmados
SET clasificacion = N'Caso confirmado por criterio clínico-epidemiológico - No activo (por tiempo de evolución)'
WHERE clasificacion = N'Caso confirmado por criterio cl+¡nico-epidemiol+¦gico - No activo (por tiempo de evoluci+¦n)'

UPDATE CasosConfirmados
SET clasificacion = N'Caso confirmado por criterio clínico-epidemiologico - Fallecido'
WHERE clasificacion = N'Caso confirmado por criterio cl+¡nico-epidemiologico - Fallecido'

UPDATE CasosConfirmados
SET clasificacion = N'Caso confirmado por laboratorio - No activo (por tiempo de evolución)'
WHERE clasificacion = N'Caso confirmado por laboratorio - No activo (por tiempo de evoluci+¦n)'

UPDATE CasosConfirmados
SET clasificacion = N'Caso confirmado por criterio clinico-epidemiológico - Activo'
WHERE clasificacion = N'Caso confirmado por criterio clinico-epidemiol-+gico - Activo'



-- Optimizacion de tipos de datos

ALTER TABLE CasosConfirmados ALTER COLUMN id_evento_caso int;

ALTER TABLE CasosConfirmados ALTER COLUMN fecha_inicio_sintomas date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_apertura date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_cui_intensivo date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_fallecimiento date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_diagnostico date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_fallecimiento date;
ALTER TABLE CasosConfirmados ALTER COLUMN fecha_internacion date;

ALTER TABLE CasosConfirmados ALTER COLUMN sexo varchar(2);
ALTER TABLE CasosConfirmados ALTER COLUMN residencia_pais_nombre varchar(30); -- eliminar luego
ALTER TABLE CasosConfirmados ALTER COLUMN residencia_departamento_nombre varchar(30); -- eliminar luego
ALTER TABLE CasosConfirmados ALTER COLUMN origen_financiamiento varchar(8);

ALTER TABLE CasosConfirmados ALTER COLUMN edad smallint;
ALTER TABLE CasosConfirmados ALTER COLUMN sepi_apertura tinyint;
ALTER TABLE CasosConfirmados ALTER COLUMN residencia_departamento_id smallint;
ALTER TABLE CasosConfirmados ALTER COLUMN residencia_provincia_id smallint;
ALTER TABLE CasosConfirmados ALTER COLUMN carga_provincia_id smallint;


-- Setear Primary Key
ALTER TABLE CasosConfirmados ALTER COLUMN id_evento_caso int NOT NULL
ALTER TABLE CasosConfirmados ADD PRIMARY KEY (id_evento_caso)


-- Crear índices del resto de las columnas
-- (menos de los ids internos que no los usaré de momento)

CREATE NONCLUSTERED INDEX [NonClusteredIndex-sexo-edad] ON [dbo].[CasosConfirmados]
(
	[sexo] ASC,
	[edad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE 

= OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


CREATE NONCLUSTERED INDEX [NonClusteredIndex-fechas] ON [dbo].[CasosConfirmados]
(
	[fecha_inicio_sintomas] ASC,
	[fecha_apertura] ASC,
	[fecha_internacion] ASC,
	[fecha_cui_intensivo] ASC,
	[fecha_fallecimiento] ASC,
	[fecha_diagnostico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE 

= OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


CREATE NONCLUSTERED INDEX [NonClusteredIndex-misc] ON [dbo].[CasosConfirmados]
(
	[cuidado_intensivo] ASC,
	[fallecido] ASC, 
	[asistencia_respiratoria_mecanica] ASC,
	[origen_financiamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE 

= OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


CREATE NONCLUSTERED INDEX [NonClusteredIndex-misc] ON [dbo].[CasosConfirmados]
(
	[cuidado_intensivo] ASC,
	[fallecido] ASC,
	[asistencia_respiratoria_mecanica] ASC,
	[origen_financiamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE 

= OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


CREATE NONCLUSTERED INDEX [NonClusteredIndex-clasificaciones] ON [dbo].[CasosConfirmados]
(
	[clasificacion] ASC,
	[clasificacion_resumen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE 

= OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO