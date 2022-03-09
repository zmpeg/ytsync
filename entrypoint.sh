#!/bin/sh
set -u # or set -o nounset
: "$WORKDIR"
: "$WAITTIME"

cd $WORKDIR

while true; do

	yt-dlp --config-location youtube-dl.conf

	find . -type d -maxdepth 1 -exec rename-in-folder "{}" \;

	sleep $WAITTIME

done
