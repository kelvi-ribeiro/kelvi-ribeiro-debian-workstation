#!/bin/bash

AUTHOR="Kelvi Ribeiro"
EMAIl="kelvi.ribeiro@gmail.com"
SLEEP_TIME=5

function showWelcomeMessage() {
  echo -e "\033[32m+--------------------------------------------------------------+\033[0m"
  echo -e "\033[32m| Seja bem Vindo, Usuário $USER |\033[0m"
  echo -e "\033[32m| Autor: $AUTHOR |\033[0m"
  echo -e "\033[32m| E-mail: $EMAIl |\033[0m"
  echo -e "\033[32m+--------------------------------------------------------------+\033[0m\\n"
  echo "Exibir lista de programas...." 
  read -p "Você tem certeza que fazer isso?? (Y/N)? " -n 1 -r
  breakLine 1
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" == "$BASH_SOURCE" ]] && exit 1 || return 1 
  fi
  startInstallApps

}

function breakLine() {  
  for i in $(seq 1 $1); do
    echo
  done  
}

function startInstallApps() {
  echo -e "\033[32m| Iniciando instalação das aplicações.... |\033[0m"
  sleep $SLEEP_TIME
  echo -e "Instalando aplicação do grupo x"
}

function main() {
  clear
  showWelcomeMessage
}

main
