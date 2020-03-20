-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output

sh rm -rf output

--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -rm -r -f data.tsv;
--fs -put data.tsv;

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY, 
        valor:INT);
--DUMP u;

y = GROUP u BY letra;
--DUMP y;

z = FOREACH y GENERATE $0, COUNT($1);
--DUMP z;

-- guardar los resultados
--fs -rmdir output
STORE z INTO 'output';

--fs -get output/ .
