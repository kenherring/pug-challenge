#!/bin/bash
set -eou pipefail

main_block () {
  get_progress_cfg
  build_docker_image
  echo "docker build successful!"
  exit 0
}

get_progress_cfg () {
  [ -f secrets/progress.cfg ] || return 0

  if ${CIRCLECI:-false}; then
    PROGRESS_CFG_HEX="$(.circleci/bin2hex.sh < secrets/progress.cfg)"
  else
    PROGRESS_CFG=$DLC/progress.cfg
    [ ! -f "$PROGRESS_CFG" ] && PROGRESS_CFG=/c/Progress/OpenEdge/progress.cfg
    if [ ! -f "$PROGRESS_CFG" ]; then
      echo "ERROR: cannot find progress.cfg"
      exit 1
    fi
    PROGRESS_CFG_HEX="$(.circleci/bin2hex.sh < "$PROGRESS_CFG")"
  fi

  mkdir -p secrets
  .circleci/hex2bin.sh <<< "$(tr ' ' '\n' <<< "$PROGRESS_CFG_HEX")" > secrets/progress.cfg
}

build_docker_image () {
  docker build -f .docker/Dockerfile --secret id=PROGRESS_CFG,src="$DLC/progress.cfg" . --tag oedb:latest
  docker tag oedb:latest kherring/oedb:latest
  # rm secrets/progress.cfg
}

main_block
