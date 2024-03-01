#!/bin/bash

# Verificar si se proporciona una ruta como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <ruta_de_archivos>"
    exit 1
fi

# Obtener la ruta proporcionada como argumento
ruta_archivos=$1

# Verificar y crear las carpetas si no existen
mkdir -p $ruta_archivos/outputs/img
mkdir -p $ruta_archivos/outputs/snd
mkdir -p $ruta_archivos/outputs/txt

# Clasificar archivos y moverlos a las carpetas correspondientes
contador_img=1
contador_snd=1
contador_txt=1

for archivo in $ruta_archivos/*; do
    tipo=$(file -b --mime-type "$archivo")

    if [[ $tipo == *"image"* ]]; then
        extension="${archivo##*.}"
        mv "$archivo" "$ruta_archivos/outputs/img/img${contador_img}.$extension"
        ((contador_img++))
    elif [[ $tipo == *"audio"* ]]; then
        extension="${archivo##*.}"
        mv "$archivo" "$ruta_archivos/outputs/snd/snd${contador_snd}.$extension"
        ((contador_snd++))
    elif [[ $tipo == *"text"* ]]; then
        extension="${archivo##*.}"
        mv "$archivo" "$ruta_archivos/outputs/txt/txt${contador_txt}.$extension"
        ((contador_txt++))
    fi
done

# Crear un archivo .tar del directorio 'outputs'
tar -cf $ruta_archivos/outputs.tar -C $ruta_archivos outputs

echo "Archivos clasificados correctamente en la estructura de carpetas."
echo "Se ha creado el archivo outputs.tar"


