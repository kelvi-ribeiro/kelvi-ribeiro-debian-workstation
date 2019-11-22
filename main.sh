#!/bin/bash

AUTHOR="Kelvi Ribeiro"
EMAIl="kelvi.ribeiro@gmail.com"
LOW_TIME=1.5
MEDIUM_TIME=4
FONTE = "smblock"

function showWelcomeMessage() {
  installToilet
  createMessage "Be Welcome" smblock
  createMessage "We're about to start" smblock  
  createMessage "Are you ready? (y/n)" smblock
  ## echo "Exibir lista de programas...."
  read  -n 1 -r
  breakLine 1
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" == "$BASH_SOURCE" ]] && removeToilet || return 1
  fi
  startInstallApps

}

function installToilet(){
   sudo apt-get -y install toilet >/dev/null & 
}

function removeToilet(){
   sudo apt-get purge toilet >/dev/null & 
   exit 1
}

function createMessage(){
  sleep $LOW_TIME  
  toilet -f $2 $1
}

function breakLine() {
  for i in $(seq 1 $1); do
    echo
  done
}

function startInstallApps() {
  echo -e "\033[32m| Iniciando instalação das aplicações.... |\033[0m"
  sleep $MEDIUM_TIME
  echo -e "Instalando aplicação do grupo x"
}

function main() {
  clear
  showWelcomeMessage
}

main
