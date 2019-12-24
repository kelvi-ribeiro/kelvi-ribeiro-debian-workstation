#!/bin/sh

AUTHOR="Kelvi Ribeiro"
EMAIL="kelvi.ribeiro@gmail.com"
LOW_SLEEP_TIME=2
MEDIUM_SLEEP_TIME=4
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

showWelcomeMessage() {
  printf "${GREEN}+--------------------------------------------------------------+${NC}"
  breakLine 1
  printf "${GREEN}| Welcome, User : $USER |${NC}"
  breakLine 1
  printf "${GREEN}| Author: $AUTHOR |${NC}"
  breakLine 1
  printf "${GREEN}| E-mail: $EMAIL |${NC}"
  breakLine 1
  printf "${GREEN}+--------------------------------------------------------------+${NC}"  
  breakLine 1
  sleep $LOW_SLEEP_TIME
  showListApps
  breakLine 1
  printf "Are you sure you want to install the above applications? (Y/N)? "
  read opt  
 case $opt in
		y*|Y*|"") echo "Starting the Script..." ;;
		n*|N*) echo "Installation of applications cancelled."; return ;;
		*) echo "Invalid choice. Installation of applications cancelled."; return ;;
	esac
  removesEventualAptLocks
  preparesEnvironment
  startInstallApps
}

showListApps(){
  printf "${CYAN} List of applications to be installed:
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

breakLine() {
  for i in $(seq 1 $1); do
    echo
  done
}

startInstallApps() {
  printf "\033[32m| Starting application installation.... |\033[0m"
  sleep $MEDIUM_SLEEP_TIME
  installRepositoryApps
  installSnapAndItsApps
  installManualDownloadedApp
}

removesEventualAptLocks() {
  printf "Removing occasional locks from the apt..."
  sleep $MEDIUM_SLEEP_TIME
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

preparesEnvironment() {
  printf "Preparing environment..."
  sudo apt update  
}

installSnapAndItsApps() {
  printf "Installing Applications from Snap..."
  sleep $MEDIUM_SLEEP_TIME
  sudo snap install slack --classic
  sudo snap install code --classic
  sudo snap install spotify
  sudo snap install postman
  sudo snap install dbeaver-ce
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

installRepositoryApps() {
  printf "Installing Repository applications..."
  sleep $MEDIUM_SLEEP_TIME
  sudo apt install snapd -y
  sudo apt install default-jdk -y 
  sudo apt install git -y 
  sudo apt-get install curl -y   
}

installManualDownloadedApp(){
  printf "Installing manually downloaded applications..."
  sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
  sudo chmod +x /usr/local/bin/docker-compose &&
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

main() {
  clear
  showWelcomeMessage
}

main
