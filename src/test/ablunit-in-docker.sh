#!/bin/bash
set -eou pipefail

PROGRESS_CFG_HEX="$(.circleci/bin2hex.sh < "$DLC/progress.cfg")"
export PROGRESS_CFG_HEX
echo PROGRESS_CFG_HEX="$PROGRESS_CFG_HEX"

#shellcheck disable=SC2016
COMMAND=' set -e; \
          mkdir -p secrets; \
          PROGRESS_CFG_HEX=$(tr " " "\n" <<< "$PROGRESS_CFG_HEX"); \
          .circleci/hex2bin.sh <<< "$PROGRESS_CFG_HEX" > $DLC/progress.cfg; \
          ant compile test;'

PDIR='C:\git\pug-challenge'

docker container rm oedb-compile || true

docker run -it --name oedb-compile \
    -e PROGRESS_CFG_HEX \
    -v "$PDIR":/home/pscadmin/ \
    kherring/oedb:latest \
    bash -c "$COMMAND"
