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
}

function main() {
  clear
  showWelcomeMessage
}

main
