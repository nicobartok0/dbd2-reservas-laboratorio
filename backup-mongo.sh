#!/bin/bash
# ============================================
#  Script de backup diario de MongoDB
#  Base de datos: reservas-db
#  Autor: Nicolás Bartolomeo
# ============================================

# 📍 CONFIGURACIÓN
# Ruta absoluta al repositorio donde se guardarán los backups
REPO_PATH="./"   # 🔧 <-- cámbiala por la ruta real
DB_NAME="reservas-db"
EXPORT_DIR="$REPO_PATH/db/exports"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$EXPORT_DIR/$DB_NAME-$DATE"

# ✅ Crear carpeta de destino si no existe
mkdir -p "$EXPORT_DIR"

# 💾 Ejecutar mongodump
echo "Iniciando backup de la base de datos '$DB_NAME'..."
mongodump --db="$DB_NAME" --out="$BACKUP_DIR"

# 📦 Comprimir el backup (opcional)
tar -czf "$BACKUP_DIR.tar.gz" -C "$EXPORT_DIR" "$(basename "$BACKUP_DIR")"

# 🧹 Limpiar el directorio sin comprimir (opcional)
rm -rf "$BACKUP_DIR"

# 🕒 Mantener solo los últimos 7 backups (opcional)
find "$EXPORT_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "✅ Backup completado: $BACKUP_DIR.tar.gz"
