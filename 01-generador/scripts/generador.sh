#!/bin/bash

#---
#Crea un archivo aleatorio, puede ser de 3 tipos:
  #texto (0)
  #imagen(1)
  #audio (2)
#---

# Aclaracion crond para programar tarea:

# Para que el generador se ejecute cada 1 minuto se debe
# establecer la siguiente tarea usando el comando crontab -e:
# */1 * * * * /path-correspondiente/edp-2023-recursado-tp/01-generador/scripts/generador.sh

TIPO=$(($RANDOM % 3))

[ $TIPO == 0 ] && bash /home/gon/tuia/edp/bin/tp/edp-2023-recursado-tp/01-generador/scripts/generador_texto.sh
[ $TIPO == 1 ] && bash /home/gon/tuia/edp/bin/tp/edp-2023-recursado-tp/01-generador/scripts/generador_imagen.sh
[ $TIPO == 2 ] && bash /home/gon/tuia/edp/bin/tp/edp-2023-recursado-tp/01-generador/scripts/generador_audio.sh

exit 0