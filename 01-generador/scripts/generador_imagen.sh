#!/bin/bash

#---
#Crea una imagen de tamaño aleatorio
#El tamaño puede ser:
    # Pequeño (0) : la dimension de la imagen es de 100x100
    # Mediano (1) : la dimension de la imagen es de 250x250
    # Grande (2) : la dimension de la imagen es de 500x500
#---

OUTPUT_DIR=./outputs
FILENAME=file.png

mkdir -p $OUTPUT_DIR

TIPO=$(($RANDOM % 3))

[ $TIPO == 0 ] && convert -size 100x100 xc: +noise Random $OUTPUT_DIR/$FILENAME 
[ $TIPO == 1 ] && convert -size 250x250 xc: +noise Random $OUTPUT_DIR/$FILENAME   
[ $TIPO == 2 ] && convert -size 500x500 xc: +noise Random $OUTPUT_DIR/$FILENAME   

bash hash.sh $OUTPUT_DIR $FILENAME

exit 0