#!/bin/bash

# Obtener la fecha y hora actual
CURRENT_DATE=$(date "+%d_%m_%Y:%H_%M_%S")

# Crear directorio para almacenar los reportes si no existe
mkdir -p outputs

# Obtener uso de CPU
CPU_USAGE=$(top -bn1 | grep '%Cpu' | tail -n 1 | tr -s ' ' | cut -d ' ' -f 2)

# Obtener uso de RAM
RAM_USAGE=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 3)
TOTAL_RAM=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 2)
RAM_USAGE_PERCENT=$((RAM_USAGE * 100 / TOTAL_RAM))

# Obtener número de procesos corriendo
PROCESS_COUNT=$(ps aux | wc -l)

# Obtener espacio libre en el disco
DISK_FREE=$(df -h --output=avail / | tail -n 1)

# Guardar el reporte en un archivo
REPORT_FILE="outputs/report_${CURRENT_DATE}.txt"

echo "Uso de CPU: ${CPU_USAGE}%" > "$REPORT_FILE"
echo "Uso de RAM: ${RAM_USAGE_PERCENT}%" >> "$REPORT_FILE"
echo "Nro de procesos corriendo en el sistema: ${PROCESS_COUNT}" >> "$REPORT_FILE"
echo "Espacio libre en el disco: ${DISK_FREE}" >> "$REPORT_FILE"

echo "Reporte generado en ${REPORT_FILE}"

