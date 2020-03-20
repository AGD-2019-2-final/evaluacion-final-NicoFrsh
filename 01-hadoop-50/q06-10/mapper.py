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
        counter = 0
        for word in line.split("   "):
          counter += 1
          if counter == 1:
            sys.stdout.write("{}\t".format(word))
          if counter == 3:
            sys.stdout.write("{}".format(word))
