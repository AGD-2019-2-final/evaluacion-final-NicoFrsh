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
        ##
        ## genera las tuplas palabra \tabulador 1
        ## ya que es un conteo de palabras
        ##
        key, valores = line.split("\t")
        key = str(key.strip())
        valores = valores.strip()

        for i in range(0,2-len(key)):
          key = "0" + key

        for val in valores.split(","):
          sys.stdout.write("{}\t{}\n".format(val,key))
        