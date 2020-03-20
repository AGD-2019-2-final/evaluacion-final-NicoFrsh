import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        
        key,val = line.split(",")
        val = int(val)
        sys.stdout.write("{},{}\n".format(val,key))        