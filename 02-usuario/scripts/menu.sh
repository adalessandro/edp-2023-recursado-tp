#!/bin/bash

PS3='Elija> '
echo "Hola soy el menu del TP, que desea hacer?"

select opcion in "Clasificar Archivos" "Monitorear Sistema" "Analizar Texto" "Salir"
do
 [[ -z $opcion ]] && echo "Elegir opcion valida!" && continue
 [ $REPLY == 1 ] && echo bash clasificar.sh && continue
 [ $REPLY == 2 ] && echo bash monitorear.sh && continue
 [ $REPLY == 3 ] && echo bash analizar.sh && continue
 [ $REPLY == 4 ] && echo "Eligio Salir" && break
 echo "Opcion elegida: " $opcion
done

exit 0

#Modificar las llamadas a scripts para agregar la ruta absoluta y que funcione en cualquier lado.
