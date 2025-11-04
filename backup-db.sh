#!/bin/bash

# Script to backup the exampledb MySQL database from the docker-compose setup

# Set variables
DB_NAME="exampledb"
DB_USER="exampleuser"
DB_PASS="examplepass"
BACKUP_DIR="./backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform the backup using mysqldump
echo "Backing up database $DB_NAME..."
docker-compose exec db mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
