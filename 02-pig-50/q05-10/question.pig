-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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
--DUMP u;        

y = FOREACH u GENERATE FLATTEN(c2);
y = GROUP y BY $0;
z = FOREACH y GENERATE $0, COUNT(y);
--DUMP z;

-- guardar los resultados
--fs -rmdir output
STORE z INTO 'output';

--fs -get output/ .

