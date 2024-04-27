#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function main_menu {
    while true; do
        anima
	clear
        logo 
printBlue "● Commands for the server:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Set server name                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Server update                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Active processes on the server       │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Open port                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Check RAM                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Check CPU                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Check SSD                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ Install Go                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ Removing Go                          │
│ ├───┼──────────────────────────────────────┤
├─┤ 10│ What takes SSD on the server         │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice, and enter the item number ► " choice
         case "$choice" in
1)
printGreen "▼ Set server name ▼" && sleep 1
echo "Enter your server name:"
read NAME
echo ""
sudo hostnamectl set-hostname "$NAME"
printGreen "The server has changed its name, log in to the terminal session"
             ;;
2)
printGreen "▼ Server Update ▼" && sleep 1
echo ""
sudo apt update -y && sudo apt full-upgrade -y && sudo apt -y install mc git wget screen
printGreen "Server successfully updated"
             ;;
3)

printGreen "▼ Active processes on the server ▼" && sleep 1
echo ""
systemctl list-units --type=service --state=running
             ;;
4)
printGreen "▼ Open port ▼" && sleep 1
echo ""
echo "Specify the port you want to open:"
read PORT
sudo ufw allow "$PORT"/tcp
printGreen "Port successfully opened"
             ;;
5)
printGreen "▼ Checking RAM ▼" && sleep 1
echo ""
free
             ;;
6)
printGreen "▼ Checking CPU ▼" && sleep 1
echo ""
             top
             ;;
7)
printGreen "▼ Checking SSD ▼" && sleep 1
echo ""
             df -h
             ;;
8)
printGreen "▼ Installing Go ▼" && sleep 1
echo ""
ver="1.21.4"
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile
go version
             ;;
9)
printGreen "▼ Deleting Go ▼" && sleep 1
echo ""
sudo apt-get remove golang-go && sudo apt-get remove --auto-remove golang-go
printGreen "Go uninstalled successfully"
             ;;
10)
printGreen "▼ Here's what's taking up space on your server ▼" && sleep 1
printYellow "May take 10-20 seconds to load"
echo ""
             find. -type f -size +50M -exec du -h {} + | sort -rh
             ;;
0)
echo "You have exited the menu."
             break
             ;;
*)
echo
printRed "The specified item is incorrect, please try again:"
;;
         esac
	read -p "Press Enter to return to the main menu..."
	done
}

main_menu
