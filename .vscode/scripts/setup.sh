#!/bin/bash

main_block () {
  pull_ant_dependencies
  welcome_message
}

pull_ant_dependencies () {
  mkdir -p ~/.ant/lib
  curl -s -L -o ~/.ant/lib/PCT.jar https://github.com/Riverside-Software/pct/releases/download/v226/PCT.jar
}

pull_docker () {
  docker pull progresssoftware/prgs-oedb:12.2.12_ent
  docker pull progresssoftware/prgs-pasoe:12.2.12
}

welcome_message () {
  echo_green "Welcome to VSCode!"
  echo_blue "This project was created for the 2023 PUG Challenge (EU)"
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