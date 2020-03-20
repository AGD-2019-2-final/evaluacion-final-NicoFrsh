-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
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
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY, 
        valor:INT);
        
y = ORDER u BY valor;

z = FOREACH y GENERATE $2;
z = LIMIT z 5;
--DUMP z;

-- guardar los resultados
--fs -rmdir output
STORE z INTO 'output';

--fs -get output/ .