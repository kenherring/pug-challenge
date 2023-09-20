#!/bin/bash
set -eou pipefail

## add the secret license key
# if [ -n "${PROGRESS_CFG_HEX:-}" ]; then
#   echo "saving CFG from HEX"
#   .circleci/hex2bin.sh <<< "$(tr ' ' '\n' <<< "$PROGRESS_CFG_HEX")" > "$DLC/progress.cfg"
# else
if [ -f /run/secrets/PROGRESS_CFG ]; then
  echo "copying secret CFG"
  cp /run/secrets/PROGRESS_CFG "$DLC/progress.cfg"
fi

cat "$DLC/progress.cfg"

## compile the code

if [ "${OS:-}" = "Windows_NT" ]; then
  DB_DIR=target/db/sp2k
else
  DB_DIR=target/db-unix/sp2k
fi

if [ ! -f "$DB_DIR/sp2k.db" ]; then
  ant create-db
fi

ant compile
ant test
