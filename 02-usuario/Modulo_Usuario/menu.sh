#!/bin/bash

# Función para clasificar archivos
clasificar_archivos() {
    # Llama al script clasificar.sh aquí
    ./clasificar.sh
}

# Función para monitorear el sistema
monitor_sistema() {
    # Llama al script monitor.sh aquí
    ./monitor.sh
}

# Función para analizar texto
analizar_texto() {
    # Llama al script analizar.sh aquí
    ./analizar.sh
}

PS3='Elija> '
echo "Hola, soy el menu del TP. Que quiere hacer?"
select opcion in "Clasificar Archivos" "Monitorear Sistema" "Analizar Texto" "Salir"
do
 [ -z "$opcion" ] && echo "Elegir opcion valida!" && continue
 [ $REPLY == 1 ] && read -p "Escriba la ruta de los archivos: " ruta_archivos && ./clasificar.sh "$ruta_archivos" && continue        # Llama al script clasificar.sh con la ruta proporcionada && continue
 [ $REPLY == 2 ] && bash monitor_sistema && continue
 [ $REPLY == 3 ] && bash analizar_texto && continue
 [ $REPLY == 4 ] && echo "Eligio Salir" && break

 
echo "Opcion elegida: " $opcion
done

exit 0


