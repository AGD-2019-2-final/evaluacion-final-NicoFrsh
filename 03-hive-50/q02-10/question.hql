-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS docs;
DROP TABLE IF EXISTS docs_ord;

-- crear tabla
CREATE TABLE docs(letra STRING, fecha DATE, valor INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE docs;

-- ordenar por letra y valor
CREATE TABLE docs_ord
AS
    SELECT *
    FROM docs
ORDER BY letra, valor, fecha;

-- guardar resultado en la carpeta output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM docs_ord;