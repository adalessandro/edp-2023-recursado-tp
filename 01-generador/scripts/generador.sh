#!/bin/bash

#Comando encargado de generar un archivo aleatorio, que puede ser un texto, una imagen o un audio
#tipos de archivos:
  #texto (0)
  #imagen(1)
  #audio (2)

tipo=$(($RANDOM % 3))

[ tipo == 0 ] && bash generador_texto.sh
[ tipo == 1 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav
[ tipo == 2 ] && convert -size 100x100 xc: +noise Random noise.png
