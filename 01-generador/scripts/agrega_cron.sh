#!/bin/bash

#---
#Programa la ejecucion del script generador.sh
#para generar un archivo aleatorio cada 1 minuto
#---

DIR=$(pwd)

crontab -l > job
echo "*/1 * * * * cd $DIR; ./generador.sh" > job
crontab job
rm job

