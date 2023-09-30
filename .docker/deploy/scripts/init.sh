#!/bin/bash
set -eou pipefail

# Entry script for base container image
if [ -n "${PROGRESS_CFG_BASE64:-}" ]; then
  base64 --decode <<< "$PROGRESS_CFG_BASE64" > "$DLC/progress.cfg"
fi

# chown -R --reference=/psc/dlc pscadmin /psc/wrk
chmod -R 777 /psc/dlc/bin
chmod u+s /psc/dlc/bin/_mprosrv

SCRIPTPATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

source "${SCRIPTPATH}/create-db.sh"
EXIT_CODE=$?

# Exit with exit code if createdb exited with exit code other than 0
if [ ${EXIT_CODE} -ne 0 ]; then
  echo "ERROR: Failed to create database. Exiting."
  exit ${EXIT_CODE}
fi

source "${SCRIPTPATH}/start-db-server.sh"
