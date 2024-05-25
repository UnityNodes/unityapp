#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printBlue "● One-line codes Side Protocol
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
			bash <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/initia/install-initia.sh)
			;;
		2)	
			echo ""
            printGreen "▼ Auto update ▼"
			cd $HOME
			rm -rf initia
			git clone https://github.com/initia-labs/initia.git
			cd initia
			git checkout v0.2.15
			make install
			sudo systemctl start initiad.service
			sudo journalctl -u initiad.service -f -o cat

			;;
		3)	
			echo ""
            printGreen "▼ Remove node ▼"
            echo ""
			cd $HOME
			sudo systemctl stop initiad
			sudo systemctl disable initiad
			sudo rm /etc/systemd/system/initiad.service
			sudo systemctl daemon-reload
			rm -f $(which initiad)
			rm -rf ~/.initia
			rm -rf $HOME/initia
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
