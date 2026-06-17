#!/usr/bin/bash

set -euo pipefail  # -e exits immediately if any command fails , -u treat any unset varianle as error and - o pipefail if any command in pipe fails , the whole pipe fails

THRESHOLD=80
LOGFILE="/var/log/disk_check.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
HOSTNAME=$(hostname)

log () {
	echo "[$TIMESTAMP] $1" | tee -a "$LOGFILE"
}


check_disk() {
	local usage
	local mount
	while IFS= read -r line; do
		usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
		mount=$(echo "$line" | awk '{print $6}' )
		if [ "$usage" -ge "$THRESHOLD" ] ; then
			log "ALERT: $mount is at ${usage}% (threshold: ${THRESHOLD}%)"
		else
        		log "OK: $mount is at ${usage}%"

		fi 
	done < <(df -h | grep -vE '^Filesystem|tmpfs|udev')

}

check_disk
exit 0


