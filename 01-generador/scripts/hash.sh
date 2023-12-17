#!/bin/bash

#Hashea el nombre del archivo pasado
ARCHIVOS=$(ls outputs)
OUTPUT_DIR=outputs


for FILE in $ARCHIVOS
do
    md5sum $OUTPUT_DIR/$FILE > hash
    mv $OUTPUT_DIR/$FILE $(cut -d " " -f 1 hash)
    rm hash
done


