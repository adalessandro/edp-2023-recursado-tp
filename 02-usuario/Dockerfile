# Utiliza imagen de Ubuntu
FROM ubuntu

# Instala las dependencias necesarias 

RUN apt-get update && apt-get install -y ffmpeg imagemagick

# Crea un directorio de trabajo en el contenedor
WORKDIR /app

# Agrega todos los archivos de la carpeta Modulo_Generar al directorio de traba>
ADD Modulo_Usuario/ .

# Establece permisos de ejecución para el script generador.sh
RUN chmod +x menu.sh

# Define el comando por defecto al ejecutar el contenedor
ENTRYPOINT ["bash","menu.sh"]


