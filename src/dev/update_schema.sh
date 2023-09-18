#!/bin/bash

main_block () {
  mkdir target/temp
  echo "main_block"
  ant update-db
}

########## MAIN BLOCK ##########
main_block