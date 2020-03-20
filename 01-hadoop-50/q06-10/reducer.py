import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    curmax = 0
    curmin = 1000000

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
          if val > curmax:
            curmax = val
          if val < curmin:
            curmin = val
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, curmax, curmin))

            curkey = key
            curmax = val
            curmin = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, curmax, curmin))