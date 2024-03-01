#!/bin/bash

# Función para estadísticas de longitud de palabras
stats_words() {
    echo "Indicador estadístico de longitud de palabras:"
    file_content=$(<"$1")
    words=($file_content)
    word_count=${#words[@]}

    longest=""
    shortest=${words[0]}
    total_length=0

    for word in "${words[@]}"; do
        # Eliminar puntuación al principio o final de la palabra
        word="${word#"${word%%[![:punct:]]*}"}"
        word="${word%"${word##*[![:punct:]]}"}"

        # Actualizar la palabra más larga y más corta
        if [[ ${#word} -gt ${#longest} ]]; then
            longest=$word
        fi
        if [[ ${#word} -lt ${#shortest} ]]; then
            shortest=$word
        fi

        # Sumar longitud para el promedio
        total_length=$((total_length + ${#word}))
    done

    average_length=$(bc -l <<< "scale=2; $total_length / $word_count")

    echo "Palabra más larga: $longest"
    echo "Palabra más corta: $shortest"
    echo "Longitud promedio de palabras: $average_length"
}

# Función para detectar palíndromos
palindrome_detection() {
    echo "Palabras palíndromo encontradas:"
    file_content=$(<"$1")
    words=($file_content)

    for word in "${words[@]}"; do
        # Eliminar puntuación al principio o final de la palabra
        word="${word#"${word%%[![:punct:]]*}"}"
        word="${word%"${word##*[![:punct:]]}"}"

        # Convertir a minúsculas y eliminar acentos
        lowercase_word=$(echo "$word" | tr '[:upper:]' '[:lower:]' | iconv -f utf-8 -t ascii//TRANSLIT)

        # Revertir la palabra para verificar si es un palíndromo
        reversed=$(echo "$lowercase_word" | rev)
        if [[ "$lowercase_word" == "$reversed" ]]; then
            echo "$word"
        fi
    done
}

# Función para detectar direcciones de correo electrónico
mail_address_detection() {
    echo "Direcciones de correo electrónico encontradas:"
    file_content=$(<"$1")

    # Buscar direcciones de correo electrónico usando una expresión regular
    email_addresses=$(grep -E -o '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b' <<< "$file_content" | sort -u)
    echo "$email_addresses"
}

# Menú de opciones
echo "Bienvenido al Analizador de Textos"
read -p "Ingrese la ruta del archivo de texto: " filepath

if [ ! -f "$filepath" ]; then
    echo "El archivo no existe."
    exit 1
fi

PS3="Seleccione una opción: "
options=("Estadísticas de longitud de palabras" "Palabras palíndromo" "Detectar direcciones de correo electrónico" "Salir")

select opt in "${options[@]}"; do
    case $REPLY in
    1)
        stats_words "$filepath"
        ;;
    2)
        palindrome_detection "$filepath"
        ;;
    3)
        mail_address_detection "$filepath"
        ;;
    4)
        echo "Saliendo..."
        break
        ;;
    *)
        echo "Opción inválida"
        ;;
    esac
done

