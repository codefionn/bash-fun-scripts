#!/usr/bin/env bash
OUT_FILE=/tmp/user-`basename "$1"`_`date +"%Y%m%d-%H%M%S"`.tar.xz
UPLOAD_DIR=/Root/userdump/
FILES=("/home/user/programming/" "/home/user/eclipse-workspace-spigot" "/home/user/.config" "/home/user/.vimrc" "/home/user/.bashrc" "/home/user/.profile" "/var/www/localhost/htdocs/mediawiki/images")
tar --xattrs-include='.*' -cpaf "$OUT_FILE" $FILES
megamkdir --no-ask-password "$UPLOAD_DIR"
megaput --no-progress --no-ask-password --path "$UPLOAD_DIR" "$OUT_FILE"
rm "$OUT_FILE"
