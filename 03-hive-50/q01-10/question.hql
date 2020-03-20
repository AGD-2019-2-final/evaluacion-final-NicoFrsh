-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS docs;
DROP TABLE IF EXISTS reg_count;

-- crear tabla
CREATE TABLE docs(letra STRING, fecha DATE, valor INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE docs;

-- Cantidad de registros por cada letra de la columna 1
CREATE TABLE reg_count
AS
    SELECT letra, count(1)
    FROM docs
GROUP BY letra
ORDER BY letra;

--SELECT * FROM reg_count;

-- guardar resultados en la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM reg_count;