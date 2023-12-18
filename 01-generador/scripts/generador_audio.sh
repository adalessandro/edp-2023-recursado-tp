#!/bin/bash

#---
#Crea un audio de tamaño aleatorio
#El tamaño puede ser:
    # Pequeño (0) : duraccion del audio de 5 segundos
    # Mediano (1) : duraccion del audio de 10 segundos
    # Grande (2) : duraccion del audio de 20 segundos
#---

OUTPUT_DIR=./outputs
FILENAME=file.wav

mkdir -p $OUTPUT_DIR

TIPO=$(($RANDOM % 3))

[ $TIPO == 0 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" $OUTPUT_DIR/$FILENAME 
[ $TIPO == 1 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=10" $OUTPUT_DIR/$FILENAME   
[ $TIPO == 2 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=20" $OUTPUT_DIR/$FILENAME   

bash hash.sh $OUTPUT_DIR $FILENAME

exit 0