#!/bin/bash
# Entry script for base container image

base64 --decode <<< "$PROGRESS_CFG_BASE64" > "$DLC/progress.cfg"

chown -R --reference=/psc/dlc pscadmin /psc/wrk

SCRIPTPATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

source "${SCRIPTPATH}/create-db.sh"
EXIT_CODE=$?

# Exit with exit code if createdb exited with exit code other than 0
if [ ${EXIT_CODE} -ne 0 ]; then
  echo "ERROR: Failed to create database. Exiting."
  exit ${EXIT_CODE}
fi

source "${SCRIPTPATH}/start-db-server.sh"
