import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    #min1,min2,min3,min4,min5 = 100000
    
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    counter = 0
    for line in sys.stdin:
      if counter >= 6:
        break
      else:
        counter += 1
        val, key,fecha = line.split("\t")
        fecha = fecha.strip()
        val = int(val)
        sys.stdout.write("{}\t{}\t{}\n".format(key,fecha,val))