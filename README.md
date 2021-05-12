# Covid reports v2 
Origen de datos: http://datos.salud.gob.ar/dataset/covid-19-casos-registrados-en-la-republica-argentina/archivo/fd657d02-a33a-498b-a91b-2ef1a68b8d16

El mismo contiene cada uno de los tests y/o casos sospechosos de Covid que hubieron en Argentina. Se van a utilizar los casos no descartados. 

Archivos: 
- carga_datos_covid.sql: script para cargar los datos del dataset a la base de datos.
- limpieza_datos_temporal.sql: script para limpiar los datos cargados a la DB y optimizar los tipos de datos.
- queries_test.sql: queries de prueba para explorar, limpiar datos y probar formas de obtener informacion. 

28/04/2021: El uso de índices mejoró enormemente la velocidad, pudiendo hacer queries más extensas y/o demandantes.
