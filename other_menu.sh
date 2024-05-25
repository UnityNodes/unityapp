#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		anima
		clear
        logo 
		echo ""
printBlue "● Other (Automatic installation)
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ NuLink                               │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
		bash <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/nulink/autoinstall-en.sh)
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
