#!bin/bash

OUTPUT_DIR=outputs
mkdir -p $OUTPUT_DIR

FILENAME="reporte"
DATE=$(date +%F-%T)

echo "HOLA QUERES MONITOREAR LA PC?"

echo "Usuario: $USER" > $OUTPUT_DIR/$FILENAME-$DATE.txt
echo "Uso de CPU: 0%" >> $OUTPUT_DIR/$FILENAME-$DATE.txt