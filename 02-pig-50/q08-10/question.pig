-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
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
        
y = FOREACH u GENERATE FLATTEN(c2), FLATTEN(c3);
y = GROUP y BY ($0,$1);
y = FOREACH y GENERATE $0, COUNT(y);
--DUMP y;

-- guardar los resultados
--fs -rmdir output
STORE y INTO 'output';

--fs -get output/ .
