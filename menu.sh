#!/bin/bash

PS3='Elija> '
echo "Hola, soy el menu del TP. Que quiere hacer?"
select opcion in "Clasificar Archivos" "Monitorear Sistema" "Analizar Texto" "Salir"
do
[ -z $opcion ] && echo "Elegir opcion valida!" && continue
[ $REPLY == 1 ] && echo "Eligio Clasificar Archivos" && continue
[ $REPLY == 2 ] && echo "Eligio Monitorear Sistema" && continue
[ $REPLY == 3 ] && echo "Eligio Analizar Texto" && continue
[ $REPLY == 4 ] && echo "Eligio Salir" && break




echo "Opcion elegida: " $opcion
done

exit 0

