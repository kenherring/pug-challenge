#!/bin/bash
set -eou pipefail

## add the secret license key
# .circleci/hex2bin.sh <<< "$(tr ' ' '\n' <<< "$PROGRESS_CFG_HEX")" > /psc/dlc/progress.cfg
cp /run/secrets/PROGRESS_CFG "$DLC/progress.cfg"

## compile the code
ant create-db

# if [ ! -f target/db/sp2k/sp2k.db ]; then
#   ant create-db
# fi

ls -al target/db/sp2k

ant compile
ant test
