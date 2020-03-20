-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
sh rm -rf output;
--
--fs -rm -f -r data.csv;
--fs -put data.csv;

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (c1:INT, 
        c2:CHARARRAY, 
        c3:CHARARRAY,
        c4:CHARARRAY,
        c5:CHARARRAY,
        c6:INT);
        
y = FOREACH u GENERATE CONCAT(c2, '@', c3);
--DUMP y;

-- guardar los resultados
--fs -rmdir output
STORE y INTO 'output';

--fs -get output/ .


