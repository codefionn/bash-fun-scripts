#!/usr/bin/env bash
if [ -z "$1" ] ; then
	echo "Expected db name" 1>&2
	exit 1;
fi

# Backups mysql/mariadb $1 to MEGA
# A SQL file is created in /tmp and then compressed
# Afterwards the file is uploaded and then both files are being removed

OUT_FILE_PLAIN=/tmp/sqldump-$1_`date +"%Y%m%d-%H%M%S"`.sql
OUT_FILE="${OUT_FILE_PLAIN}.tar.xz"
UPLOAD_DIR=/Root/sqldump/
mysqldump -u root $1 > "$OUT_FILE_PLAIN"
tar -caf "$OUT_FILE" "$OUT_FILE_PLAIN"
rm "$OUT_FILE_PLAIN"
megamkdir --no-ask-password "$UPLOAD_DIR"
megaput --no-progress --no-ask-password --path "$UPLOAD_DIR" "$OUT_FILE"
rm "$OUT_FILE"
