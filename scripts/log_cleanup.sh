#!/bin/bash

set -euo pipefail

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
DAYS_OLD=7
DAYS_ARCHIVE=30
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOGFILE="/var/log/cleanup.log"


log() {
	echo "[$TIMESTAMP] $1" | tee -a "$LOGFILE"
}

cleanup_logs() {
    log "Starting log cleanup"

    mkdir -p "$ARCHIVE_DIR"

    find "$LOG_DIR" -maxdepth 1 -name "*.log" \
        -mtime +"$DAYS_OLD" -type f | while read -r logfile; do
            fname=$(basename "$logfile")
            gzip -c "$logfile" > "${ARCHIVE_DIR}/${TIMESTAMP}_${fname}.gz"
            rm "$logfile"
            log "Archived: $logfile"
    done

    find "$ARCHIVE_DIR" -name "*.gz" \
        -mtime +"$DAYS_ARCHIVE" -delete
    log "Deleted archives older than $DAYS_ARCHIVE days"

    log "Cleanup complete"
}

cleanup_logs
exit 0

