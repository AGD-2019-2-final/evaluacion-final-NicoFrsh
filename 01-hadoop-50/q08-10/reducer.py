import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    curval = 0
    prom = 0
    
    counter = 1

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)
        prom = val

        if key == curkey:
          counter += 1
          curval += val
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                prom = curval / counter
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, curval, prom))

            curkey = key
            curval = val

            counter = 1

    prom = curval / counter
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, curval, prom))