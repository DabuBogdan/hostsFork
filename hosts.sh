#!/bin/bash

cat /etc/hosts | while read ip name rest; do
  case "$ip" in
    ""|\#*) continue ;;
  esac
  [ -z "$name" ] && continue

  real=`nslookup "$name" 2>/dev/null | grep "^Address" | tail -n 1 | cut -d " " -f 2`

  if [ "$real" != "$ip" ]; then
    echo "IP gresit pentru $name in /etc/hosts!"
  fi
done