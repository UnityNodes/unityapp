#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printBlue "● One-line codes 0G Labs (Zero Gravity)
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
			bash <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/0g-testnet/0g-install.sh)
			;;
		2)	
			echo ""
            printGreen "▼ Auto update ▼"
			printRed "There are no actual updates"
			;;
		3)	
			echo ""
            printGreen "▼ Remove node ▼"
            echo ""
			cd $HOME
			sudo systemctl stop 0gchaind
			sudo systemctl disable 0gchaind
			sudo rm /etc/systemd/system/0gchaind.service
			sudo systemctl daemon-reload
			rm -f $(which 0gchaind)
			rm -rf ~/.0gchain
			rm -rf $HOME/0gchain
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
