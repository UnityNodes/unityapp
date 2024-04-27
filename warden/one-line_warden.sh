#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		anima
		clear
        logo 
printBlue "● One-line codes:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Auto installer                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Auto update                          │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Remove node                          │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printGreen "▼ Auto installer ▼"
			
			;;
		2)	
			echo ""
            printGreen "▼ Auto update ▼"
			
			;;
		3)	
			echo ""
            printGreen "▼ Remove node ▼"
            echo ""
			cd $HOME
			sudo systemctl stop wardend
			sudo systemctl disable wardend
			sudo rm /etc/systemd/system/warden.service
			sudo systemctl daemon-reload
			rm -f $(which wardend)
			rm -rf ~/.warden
			rm -rf $HOME/wardenprotocol
            echo ""	
			;;
		0)
			echo ""
			echo "You have exited the menu." 
            break
            ;;
		*)	
			echo
			printRed "Incorrect choice. Try again..."
			;;
        esac
		read -p "Press Enter to return main menu..."
	done	
}

main_menu
