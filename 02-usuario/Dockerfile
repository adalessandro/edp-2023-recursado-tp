# Usa una imagen base de Linux
FROM ubuntu:latest

# Copia los scripts al contenedor
COPY edp-2023-recursado-tp/02-usuario /02-usuario

# Establece permisos de ejecución para los scripts
RUN chmod +x edp-2023-recursado-tp/02-usuario/scripts/*.sh

# Define el directorio de trabajo por defecto
WORKDIR /02-usuario

# Comando por defecto al ejecutar el contenedor
CMD ["bash", "scripts/menu.sh"]

