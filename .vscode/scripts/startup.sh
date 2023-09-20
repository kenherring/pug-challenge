#!/bin/bash

main_block () {
  mkdir -p target/temp
  pull_ant_dependencies
  create_db
  welcome_message
}

pull_ant_dependencies () {
  if [ ! -f ~/.ant/lib/PCT.jar ]; then
    mkdir -p ~/.ant/lib
    curl -s -L -o ~/.ant/lib/PCT.jar https://github.com/Riverside-Software/pct/releases/download/v226/PCT.jar
  fi
}

create_db () {
  if [ ! -f target/db/sp2k/sp2k.db ]; then
    ant create-db
  fi
}

# pull_docker () {
#   docker pull progresssoftware/prgs-oedb:12.2.12_ent
#   docker pull progresssoftware/prgs-pasoe:12.2.12
# }

welcome_message () {
  echo_green "Welcome to VSCode!"
  echo_blue "\nThis project was created by @kenherring for the 2023 PUG Challenge EU"

  ## https://pugchallenge.eu/session/custom-sonar-rules-measures/
  ## https://pugchallenge.eu/session/vscode/
  ## https://pugchallenge.eu/session/oe-build-pipelines-w-docker/
  echo -e "\n * Wenesday 12:15-13:15 - \"Custom Sonar Rules and Measures\""
  echo " * Thursday 16:30-17:30 - \"VSCode\""
  echo " * Friday   11:45-12:45 = \"OE Build Pipelines w/ Docker\""

  echo -e "\nFind me on:"
  echo    " * GitHub:   https://github.com/kenherring"
  echo    " * LinkedIn: https://www.linkedin.com/in/ken-herring-b55b5287/"
  exit 0
}

echo_blue () {
  echo -e "\033[0;34m$1"
}

echo_red () {
  echo -e "\033[0;31m$1"
}

echo_green () {
  echo -e "\033[0;32m$1"
}

echo_yellow () {
  echo -e "\033[0;33m$1"
}

main_block