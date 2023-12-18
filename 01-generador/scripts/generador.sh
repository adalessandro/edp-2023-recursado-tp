#!/bin/bash

#---
#Crea un archivo aleatorio, puede ser de 3 tipos:
  #texto (0)
  #imagen(1)
  #audio (2)
#---

TIPO=$(($RANDOM % 3))

[ $TIPO == 0 ] && bash generador_texto.sh
[ $TIPO == 1 ] && bash generador_imagen.sh
[ $TIPO == 2 ] && bash generador_audio.sh

exit 0