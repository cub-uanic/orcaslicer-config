#!/bin/sh

# crontab -e
# # vi:ft=crontab
# MAILTO=cub.uanic@gmail.com
#
#
# m     h       dom     mon     dow     command
# */15  *       *       *       *       ~/Library/Application\ Support/OrcaSlicer/backup.sh >/dev/null

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cd "$SCRIPT_DIR"

git add -A >/dev/null
git commit --quiet -m update
git fetch --quiet --all
git pull --quiet
git push --quiet

