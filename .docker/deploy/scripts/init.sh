#!/bin/bash
# Entry script for base container image

echo 100 DB_CREATE_METHOD=$DB_CREATE_METHOD
rm -f "$DLC/progress.cfg"
echo 101
ln -s /run/secrets/PROGRESS_CFG "$DLC/progress.cfg"
echo 102
ls -al /psc/wrk/sp2k
chown -R --reference=/psc/dlc pscadmin /psc/wrk
echo 103
# chmod -R 777 /psc/wrk
echo 104
ls -al /psc/wrk/sp2k
echo 105

SCRIPTPATH=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
echo 106 "${SCRIPT_PATH}/create-db.sh"
source ${SCRIPTPATH}/create-db.sh
echo 107
EXIT_CODE=$?
# Exit with exit code if createdb exited with exit code other than 0
if [ ${EXIT_CODE} -ne 0 ]; then
  echo "ERROR: Failed to create database. Exiting."
  exit ${EXIT_CODE}
fi

source "${SCRIPTPATH}/start-db-server.sh"
