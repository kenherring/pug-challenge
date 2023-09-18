#!/bin/bash
set -eou pipefail

if [ ! -f secrets/progress.cfg ]; then
  PROGRESS_CFG=$DLC/progress.cfg
  [ ! -f "$PROGRESS_CFG" ] && PROGRESS_CFG=/c/Progress/OpenEdge/progress.cfg
  if [ ! -f "$PROGRESS_CFG" ]; then
    echo "ERROR: cannot find progress.cfg"
    exit 1
  fi
  mkdir -p secrets
  cp "$PROGRESS_CFG" secrets/progress.cfg
fi

docker build -f .docker/Dockerfile --secret id=PROGRESS_CFG,src="$DLC/progress.cfg" . --tag oedb:latest
docker tag oedb:latest kherring/oedb:latest

# rm secrets/progress.cfg

echo "docker build successful!"

exit 0
