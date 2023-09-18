#!/bin/bash

#shellcheck disable=SC2034,SC2162
read PROGRESS_CFG < /c/Progress/OpenEdge/progress.cfg

docker build -f .docker/Dockerfile --secret id=PROGRESS_CFG,src="$DLC/progress.cfg" . --tag oedb:latest

echo "docker build successful!"

exit 0
