DECLARE @nombreTabla varchar(30) = 'CasosConfirmados'

DECLARE cursorTypes CURSOR FOR
	SELECT column_name
	FROM information_schema.columns
	WHERE table_name = @nombreTabla;


OPEN cursorTypes; 

DECLARE @nombreColumna varchar(32)
DECLARE @dataType varchar(8)
DECLARE @Length int

FETCH NEXT FROM cursorTypes INTO @nombreColumna

WHILE @@FETCH_STATUS = 0
	BEGIN
			UPDATE CasosConfirmados
			SET @nombreColumna = STUFF(@nombreColumna,1,1,'')
			PRINT 'Comillas iniciales eliminadas de: ' + @nombreColumna -- columna a limpiar
		PRINT ' ' 
		FETCH NEXT FROM cursorTypes INTO @nombreColumna
	END

CLOSE cursorTypes; 
DEALLOCATE cursorTypes; 

SELECT TOP 10 * FROM CasosConfirmados


			UPDATE CasosConfirmados
			SET @nombreColumna = STUFF(@nombreColumna,len(@nombreColumna),1,'')
					PRINT '-- Comillas finales eliminadas --'



UPDATE CasosConfirmados
SET fecha_inicio_sintomas = STUFF(fecha_inicio_sintomas,len(fecha_inicio_sintomas),1,'')

UPDATE CasosConfirmados
SET residencia_pais_nombre = 'Argentina'
WHERE id_evento_caso = '"1000007"'


declare @provincia nvarchar(30)
set @provincia = (Select carga_provincia_nombre FROM CasosConfirmados
where id_evento_caso = '"10000026"')



