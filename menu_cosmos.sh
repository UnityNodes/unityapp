#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function menu_warden {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/menu_warden.sh)
}

function menu_0G {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0g/menu_0g.sh)
}

function menu_side {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/side/menu_side.sh)
}

function menu_initia {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/initia/menu_initia.sh)
}


function main_menu {
    while true; do
		anima
		clear
        logo 
		echo ""
printBlue "● Cosmos menu:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Warden Protocol                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ 0G (Zero Gravity)                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Side Protocol                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Initia                               │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			menu_warden
			;;
		2)	
			menu_0G
			;;
		3)	
			echo ""
			menu_side
			;;
		4)	
			menu_initia
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
