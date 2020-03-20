-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS docs;

-- crear tabla
CREATE TABLE docs(letra STRING, fecha DATE, valor INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE docs;

-- 5 valores diferentes mas pequenos de la tercera columna
DROP TABLE IF EXISTS docs_min;
CREATE TABLE docs_min
AS
    SELECT DISTINCT(valor)
    FROM docs
ORDER BY valor
LIMIT 5;

-- guardar resultados
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM docs_min;