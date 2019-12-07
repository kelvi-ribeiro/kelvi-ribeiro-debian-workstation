#!/bin/bash

AUTHOR="Kelvi Ribeiro"
EMAIl="kelvi.ribeiro@gmail.com"
LOW_SLEEP_TIME=2
MEDIUM_SLEEP_TIME=4
PURPLE='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function showWelcomeMessage() {
  echo -e "${GREEN}+--------------------------------------------------------------+${NC}"
  echo -e "${GREEN}| Seja bem Vindo, Usuário $USER |${NC}"
  echo -e "${GREEN}| Autor: $AUTHOR |${NC}"
  echo -e "${GREEN}| E-mail: $EMAIl |${NC}"
  echo -e "${GREEN}+--------------------------------------------------------------+${NC}"
  breakLine 1
  sleep $LOW_SLEEP_TIME
  showListApps
  breakLine 1
  read -p "Tem certeza que deseja instalar as aplicações acima ? (Y/N)? " -n 1 -r
  breakLine 1
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" == "$BASH_SOURCE" ]] && exit 1 || return 1
  fi
  removesEventualAptLocks
  preparesEnvironment
  startInstallApps
}

function showListApps(){
  echo -e "${PURPLE} Lista de aplicações que irão ser instalados:
  1. android-studio
  2. chromium
  3. vs-code
  4. curl
  5. default-jdk
  6. docker
  7. docker-compose  
  8. flameshot-app
  9. git
  10. google-cloud-sdk
  11. intellij-idea-community  
  12. ngrok
  13. node
  14. postman
  15. slack
  16. snapd
  17. spotify
  18. telegram-desktop ${NC}"
}

function breakLine() {
  for i in $(seq 1 $1); do
    echo
  done
}

function startInstallApps() {
  echo -e "\033[32m| Iniciando instalação das aplicações.... |\033[0m"
  sleep $MEDIUM_SLEEP_TIME
  installRepositoryApps
  installSnapAndItsApps
  installDownloadedApp
}

function removesEventualAptLocks() {
  echo -e "Removendo travas eventuais do apt..."
  sleep $MEDIUM_SLEEP_TIME
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

function preparesEnvironment() {
  echo -e "Preparando ambiente..."
  sudo apt update  
}

function installSnapAndItsApps() {
  echo -e "Instalando Apps a partir do Snap..."
  sleep $MEDIUM_SLEEP_TIME
  sudo snap install slack --classic
  sudo snap install code --classic
  sudo snap install spotify
  sudo snap install postman
  sudo snap install android-studio --classic
  sudo snap install node --edge --classic
  sudo snap install intellij-idea-community --classic --edge
  sudo snap install docker
  sudo snap install chromium  
  sudo snap install ngrok
  sudo snap install telegram-desktop
  sudo snap install flameshot-app
  sudo snap install google-cloud-sdk --classic
}

function installRepositoryApps() {
  echo -e "Instalando Apps do Repository"
  sleep $MEDIUM_SLEEP_TIME
  sudo apt install snapd -y
  sudo apt install default-jdk -y 
  sudo apt install git 
  sudo apt-get install curl -y   
}

function installDownloadedApp(){
  echo -e "Instalando Apps Baixados"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
  sudo chmod +x /usr/local/bin/docker-compose &&
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

function main() {
  clear
  showWelcomeMessage
}

main
