#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function server {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/server.sh)
}

function menu_cosmos {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/menu_cosmos.sh)
}

function monitoring {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/monitoring.sh)
}

function validator-backup {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/validator-backup.sh)
}


function main_menu {
    while true; do
        anima
		clear
        logo 
printBlue "● Unity Nodes App:
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Commands for the server (terminal)   │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Nodes Cosmos Network                 │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Monitoring                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Validator Backup                     │
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
             menu_cosmos
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
             validator-backup
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
