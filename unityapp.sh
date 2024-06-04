#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function server {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/server.sh)
}

function testnet_menu {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/testnet_menu.sh)
}

function mainet_menu {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/mainet_menu.sh)
}

function other_menu {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/other_menu.sh)
}

function monitor {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/monitoring/monitoring.sh)
}

function backup {
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/backup.sh)
}


function main_menu {
    while true; do
	clear
        anima
	clear
        logo 
printBlue "● Unity Nodes App
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Commands for the server (terminal)   │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Testnet Cosmos Network               │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Mainet Cosmos Network                │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Other Node (automatic installation)  │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Monitoring                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Validator Backup                     │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice, and enter the item number ► " choice
         case "$choice" in
        1)
        clear
        server
        ;;
        2)
        clear
        testnet_menu
        ;;
        3)
        clear
        mainet_menu
        ;;
        4)
        clear
        other_menu
        ;;
        5)
        clear
        monitor
        ;;         
        6)
        clear
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
