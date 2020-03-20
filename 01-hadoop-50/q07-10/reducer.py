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
    for line in sys.stdin:
      key, val, fecha = line.split("\t")
      fecha = fecha.strip()
      val = int(val)
      sys.stdout.write("{}\t{}\t{}\n".format(key,fecha,val))