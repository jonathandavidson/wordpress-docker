#!/bin/bash

# Script to restore a database dump created by the backup-db.sh script

# Set variables
DB_NAME="exampledb"
DB_USER="exampleuser"
DB_PASS="examplepass"
BACKUP_DIR="./backups"

# Check if backup file is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <backup-file.sql>"
    echo "Available backups in $BACKUP_DIR:"
    ls -la "$BACKUP_DIR" | grep "\.sql"
    exit 1
fi

BACKUP_FILE="$1"

# Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file $BACKUP_FILE not found!"
    exit 1
fi

# Restore the database
echo "Restoring database $DB_NAME from $BACKUP_FILE..."
echo "Running: docker-compose exec -T db mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$BACKUP_FILE""
docker-compose exec -T db mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$BACKUP_FILE"

# Check if restore was successful
if [ $? -eq 0 ]; then
    echo "Database restored successfully from $BACKUP_FILE"
else
    echo "Database restore failed!"
    exit 1
fi
