#!/bin/bash
set -x

if [ ! -f target/db/sp2k/sp2k.db ]; then
  echo "WARNING: target/db/sp2k/sp2k.db does not exist.  running 'ant create-db'"
  ant create-db
fi

start prowin -p .DataDigger/DataDigger.p -s 512 -rereadnolock -pf schema/schema.pf -param "sports2000 schema (target/db/sp2k/spk)"