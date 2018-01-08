#!/bin/sh
REMOTE='192.168.1.2:/'
LOCAL='/media'

interface=$1 status=$2
if [ "$CONNECTION_UUID" = "7e64138d-bb9f-4869-9140-6c8276895990" ]; then
  case $status in
    up)
        mount $REMOTE $LOCAL
      ;;
    down)
        umount /media
      ;;
  esac
fi
