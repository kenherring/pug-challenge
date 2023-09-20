#!/bin/bash
set -eou pipefail

cp /c/Progress/OpenEdge/progress.cfg secrets/progress.cfg
cp /c/Progress/OpenEdge/progress.cfg secrets2/progress.orig.cfg
PROGRESS_CFG_HEX="$(.circleci/bin2hex.sh < secrets/progress.cfg | tr '\n' ' ')"
export PROGRESS_CFG_HEX
.circleci/bin2hex.sh < secrets/progress.cfg | tr '\n' ' ' > secrets2/progress.cfg1.hex

PROGRESS_CFG_HEX=$(tr ' ' '\n' <<< "$PROGRESS_CFG_HEX"); \
echo 120
echo "$PROGRESS_CFG_HEX" > secrets2/progress.cfg2.hex
echo 121
.circleci/hex2bin.sh <<< "$PROGRESS_CFG_HEX" > secrets2/progress.new.cfg
echo 122
cat secrets2/progress.orig.cfg
cat secrets2/progress.new.cfg
echo 123

echo "DONE TEST"
exit 1

#shellcheck disable=SC2016
COMMAND=' set -e; \
          mkdir -p secrets; \
          echo 100 "PROGRESS_CFG_HEX=\"$PROGRESS_CFG_HEX\""; \
          PROGRESS_CFG_HEX=$(tr " " "\n" <<< "$PROGRESS_CFG_HEX"); \
          ls -al; \
          .circleci/hex2bin.sh <<< "$PROGRESS_CFG_HEX" > secrets/progress.cfg; \
          cat secrets/progress.cfg; \
          cp secrets/progress.cfg secrets/progress.posthex.cfg; \
          cp secrets/progress.cfg /psc/dlc/progress.cfg; \
          ls -al; \
          ls -al secrets; \
          ant compile || echo 101; \
          pwd; \
          ls secrets; \
          echo 400; \
          ls -al /home/pscadmin/secrets/progress.cfg; \
          echo 401;'
echo 101 "COMMAND='$COMMAND'" 

PDIR='C:\git\pug-challenge'

docker container rm oedb-compile || true

docker run -it --name oedb-compile \
    -e PROGRESS_CFG_HEX \
    -v "$PDIR":/home/pscadmin/ \
    kherring/oedb:latest \
    bash -c "$COMMAND"

echo 103
mkdir -p secrets2
echo 104
docker cp oedb-compile:/home/pscadmin/secrets/progress.cfg secrets2/
echo 105
cp /c/Progress/OpenEdge/progress.cfg secrets2/progress.orig.cfg
