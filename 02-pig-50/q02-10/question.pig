-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;

sh rm -rf output;

-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
--fs -rm -f -r data.tsv;
--fs -put data.tsv;

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY, 
        valor:INT);
        
--DUMP u;

y = ORDER u BY letra, valor;
--DUMP y;

-- guardar los resultados
--fs -rmdir output
STORE y INTO 'output';

--fs -get output/ .
