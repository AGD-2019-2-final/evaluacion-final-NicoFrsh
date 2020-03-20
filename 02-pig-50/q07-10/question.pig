-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
sh rm -rf output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -rm -f -r data.tsv;
--fs -put data.tsv;

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (c1:CHARARRAY, 
        c2:BAG{t: TUPLE(minusc:CHARARRAY)}, 
        c3:MAP[]);

y = FOREACH u GENERATE c1, SIZE(c2), SIZE(c3);
y = ORDER y BY $0, $1, $2;
--DUMP y;

-- guardar los resultados
--fs -rmdir output
STORE y INTO 'output' USING PigStorage(',');

--fs -get output/ .
