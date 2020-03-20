import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##

    for line in sys.stdin:
        counter = 0
        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        for word in line.split(','):
            counter += 1
            if counter == 4:
              key = word
            if counter == 5:
              val = word
                ##
                ## escribe al flujo estandar de salida
                ##
        sys.stdout.write("{}\t{}\n".format(key,val))