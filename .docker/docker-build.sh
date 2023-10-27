#!/bin/bash

#shellcheck disable=SC2034,SC2162
PROGRESS_CFG=$DLC/progress.cfg
[ ! -f "$PROGRESS_CFG" ] && PROGRESS_CFG=/mnt/c/Progress/OpenEdge/progress.cfg
[ ! -f "$PROGRESS_CFG" ] && echo "ERROR: cannot find progress.cfg" && exit 1

docker build -f .docker/Dockerfile --secret id=PROGRESS_CFG,src="$PROGRESS_CFG" . --tag oedb:latest

echo "docker build successful!"

exit 0
