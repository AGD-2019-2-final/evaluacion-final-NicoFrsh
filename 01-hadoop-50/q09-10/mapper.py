import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##


    for line in sys.stdin:
        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        key, fecha, val = line.split("   ")
        val = val.strip()
        if len(val)!=3:
          tmp = len(val)
          for i in range(0,3-tmp):
            val = "0" + val

        sys.stdout.write("{}\t{}\t{}\n".format(val,key,fecha))