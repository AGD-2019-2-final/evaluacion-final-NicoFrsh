-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
        
y = FOREACH u GENERATE FLATTEN(c3);
y = GROUP y BY $0;
z = FOREACH y GENERATE $0, COUNT(y);

--DUMP z;

-- guardar los resultados
--fs -rmdir output
STORE z INTO 'output' USING PigStorage(',');

--fs -get output/ .
