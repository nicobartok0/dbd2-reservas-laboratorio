# Comandos para configurar la ejecución del script todos los días
# a las 2 a.m.
crontab -e

0 2 * * * /home/tu_usuario/backup_mongo.sh >> /home/tu_usuario/backup_mongo.log 2>&1

