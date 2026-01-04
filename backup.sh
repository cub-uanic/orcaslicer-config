#!/bin/sh

# crontab -e
#
# m     h       dom     mon     dow     command
# */15  *       *       *       *       ~/Library/Application\ Support/OrcaSlicer/backup.sh >/dev/null

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd $SCRIPT_DIR

git add -A
git commit -m update
git fetch --all
git pull
git push

