#!/bin/bash

#---
#Recibe un directorio y un nombre de archivo perteneciente a ese directorio y
#renombra el archivo con su hash correspondiente
#---

OUTPUT_DIR=$1
FILENAME=$2

if [[ ! -e $OUTPUT_DIR/$FILENAME ]]
then
    echo "Error! Archivo inexistente"
    exit 1
fi

md5sum $OUTPUT_DIR/$FILENAME > hash
mv $OUTPUT_DIR/$FILENAME $OUTPUT_DIR/$(cut -d " " -f 1 hash)
rm hash
exit 0
