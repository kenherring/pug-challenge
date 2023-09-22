#!/bin/bash
set -eou pipefail

PROGRESS_CFG_BASE64=$(base64 "$DLC/progress.cfg")
export PROGRESS_CFG_BASE64

#shellcheck disable=SC2016
COMMAND='base64 --decode <<< "$PROGRESS_CFG_BASE64" > "$DLC/progress.cfg" &&
         ant test'

PDIR="$(cmd //c cd || pwd)"

docker container rm oedb-compile || true

docker run -it --name oedb-compile \
    -e PROGRESS_CFG_BASE64 \
    -v "$PDIR":/home/pscadmin/ \
    kherring/oedb:latest \
    bash -c "$COMMAND"
