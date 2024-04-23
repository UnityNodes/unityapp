#!/bin/bash

function logo() {
     bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/logo.sh)
}

function printGreen {
     echo -e "\e[1m\e[32m${1}\e[0m"
}

function printRed {
     echo -e "\e[1m\e[31m${1}\e[0m"

}
function printAddition {
     echo -e "\e[4m${1}\e[0m"
}

  function server() {
  bash <(curl -s https://raw.githubusercontent.com/unitynodes/cosmos/main/server.sh)
}

  function menu_node() {
  bash <(curl -s https://raw.githubusercontent.com/unitynodes/cosmos/main/node_menu.sh)
}
  function monitor() {
  bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/monitoring.sh)
}

  function backup() {
  bash <(curl -s https://raw.githubusercontent.com/unitynodes/scritps/main/backup.sh)
}

function main_menu {
     while true; do
clear
         logo
printGreen "● Main Menu:
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Commands for the server (terminal)   │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Cosmos network projects              │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Monitoring                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Backup                               │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice, and enter the item number ► " choice
         case "$choice" in
1)
clear
logo
printGreen "▼ Commands for the server (Working with the server) ▼" && sleep 1
echo ""
             server
             ;;
2)
clear
logo
printGreen "▼ Interaction with Cosmos nodes ▼" && sleep 1
echo ""
             menu_node
             ;;
3)
printGreen "▼ Setting up monitor ▼" && sleep 1
clear
echo ""
             monitor
             ;;
4)
printGreen "▼ Creating backup ▼" && sleep 1
clear
echo ""
             backup
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
