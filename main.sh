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
  read -p "Você tem certeza que fazer isso? (Y/N)? " -n 1 -r
  breakLine 1
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" == "$BASH_SOURCE" ]] && exit 1 || return 1
  fi
  removesEventualAptLocks
  preparesEnvironment
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
  installRepositoryApps
  installSnapAndItsApps
}

function removesEventualAptLocks() {
  echo -e "Removendo travas eventuais do apt..."
  sleep $SLEEP_TIME
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

function preparesEnvironment() {
  echo -e "Preparando ambiente..."
  sudo apt update  
}

function installSnapAndItsApps() {
  echo -e "Instalando Apps a partir do Snap..."
  sleep $SLEEP_TIME
  sudo snap install slack --classic
  sudo snap install code --classic
  sudo snap install spotify
  sudo snap install postman
  sudo snap install android-studio --classic
  sudo snap install node --edge --classic
  sudo snap install intellij-idea-community --classic --edge
  sudo snap install docker
  sudo snap install chromium
}

function installRepositoryApps() {
  echo -e "Instalando Apps do Repository"
  sleep $SLEEP_TIME
  sudo apt install snapd -y
  sudo apt install default-jdk -y 
}

function main() {
  clear
  showWelcomeMessage
}

main
