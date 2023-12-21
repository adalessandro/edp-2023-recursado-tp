FROM ubuntu:22.04
LABEL maintainer="Gonzalo Longo longogonzalo.g@gmail.com EDP - TUIA"

WORKDIR /app
ADD scripts/ .

#Instalo paquetes necesarios para el modulo usuario
RUN apt -y update
RUN apt -y install ffmpeg
RUN apt install -y graphicsmagick-imagemagick-compat 
RUN apt install cron

#Da error cuando ejecuta cron dentro de contenedor
#Ademas, probe a mano con crontab -e pero no funciona cron
ENTRYPOINT ["bash","cron.sh"]