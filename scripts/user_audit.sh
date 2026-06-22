#!/usr/bin/bash

set -euo pipefail

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOGFILE="/var/log/user_audit.log"
REPORT_FILE="/tmp/user_audit_$(date +%Y%m%d).txt"


log() {
	echo "[TIMESTAMP] $1" | tee -a "$LOGFILE"

}

run_audit(){

	log "Starting user audit"

	{
		echo "================================"
        	echo "User Audit Report: $TIMESTAMP"
       		echo "================================"
        	echo ""

		echo "--- Users with sudo access ---"
        	getent group sudo | cut -d: -f4 | tr ',' '\n'
        	echo ""

        	echo "--- Users with login shell ---"
        	awk -F: '$7 !~ /nologin|false/ {print $1, $7}' /etc/passwd
        	echo ""

        	echo "--- Recent logins ---"
        	last -n 10
        	echo ""

        	echo "--- Users with empty passwords ---"
        	sudo awk -F: '($2 == "" || $2 == "!") {print $1}' /etc/shadow || true
        	echo ""

    } | tee "$REPORT_FILE"

    log "Audit complete. Report saved to $REPORT_FILE"
}

run_audit
exit 0


