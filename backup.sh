#!/bin/sh

# crontab -e
# <-------------
# # vi:ft=crontab
#
# m     h       dom     mon     dow     command
# */15  *       *       *       *       ~/Library/Application\ Support/OrcaSlicer/backup.sh >/dev/null
# ------------->

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
cd "$SCRIPT_DIR" || exit 0

git add -A >/dev/null 2>&1
git commit -m update >/dev/null 2>&1 || true

# проверка доступности github
ssh -o BatchMode=yes -o ConnectTimeout=5 git@github.com 2>&1 | grep -q "successfully" || exit 0

{
    git fetch --all
    git pull
    git push
} >/dev/null 2>&1 || true

exit 0

