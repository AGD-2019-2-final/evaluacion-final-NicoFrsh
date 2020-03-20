import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    #min1,min2,min3,min4,min5 = 100000
    
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    curval = None
    keys = None
    keys = str(keys)

    for line in sys.stdin:

        val, key = line.split("\t")
        key = int(key.strip())


        if val == curval:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            keys = keys + "," + str(key)
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curval is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\n".format(curval, keys))

            curval = val
            keys = str(key)

    sys.stdout.write("{}\t{}\n".format(curval, keys))