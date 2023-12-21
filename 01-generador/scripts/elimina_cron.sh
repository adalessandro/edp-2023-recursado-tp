#!/bin/bash

#---
#Elimina todas las tareas programada en crontab
#---

DIR=$(pwd)

crontab -l > job
echo "" > job
crontab job
rm job
