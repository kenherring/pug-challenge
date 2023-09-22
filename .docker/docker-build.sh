#!/bin/bash
set -eou pipefail

main_block () {
  copy_deps
  build_docker_image
  cleanup
  echo "docker build successful!"
  exit 0
}

copy_deps () {
  mkdir -p .docker/temp
  cp "$DLC/tty/ablunit.pl" .docker/temp/ablunit.pl
}

build_docker_image () {
  docker build -f .docker/Dockerfile --secret id=PROGRESS_CFG,src="$DLC/progress.cfg" . --tag oedb:latest
  docker tag oedb:latest kherring/oedb:latest
}

cleanup () {
  rm -rf .docker/temp
}

main_block
