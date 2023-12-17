#!/bin/bash

#Genera un archivo de texto de tamaño aleatorio
#El tamaño puede ser:
    # Pequeño (0) : archivo de texto de 1000 caracteres
    # Mediano (1) : archivo de texto de 2500 caracteres
    # Grande (2) : archivo de texto de 5000 caracteres

OUTPUT_DIR=outputs
FILENAME=file.txt

mkdir -p $OUTPUT_DIR

TIPO=$(($RANDOM % 3))

[ $TIPO == 0 ] && base64 /dev/urandom | head -c 1000 > $OUTPUT_DIR/$FILENAME 
[ $TIPO == 1 ] && base64 /dev/urandom | head -c 2500 > $OUTPUT_DIR/$FILENAME   
[ $TIPO == 2 ] && base64 /dev/urandom | head -c 5000 > $OUTPUT_DIR/$FILENAME   

