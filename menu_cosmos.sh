#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function menu_warden {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/menu_warden.sh)
}

function menu_0G {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/0G/menu_0g.sh)
}

function menu_side {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/Side/menu_side.sh)
}

function menu_lava {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/lava/menu_lava.sh)
}

function menu_warden {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/babylon/menu_babylon.sh)
}

function menu_cascadia {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/cascadia/menu_cascadia.sh)
}

function menu_dymension {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/dymension/menu_dymension.sh)
}

function menu_zeta {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/zetachain/menu_zeta.sh)
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
├─┤ 4 │ Lava Network                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Babylon                              │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Cascadia                             │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Dymension                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ ZetaChain                            │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printGreen "▼ Warden Protocol ▼"
			menu_warden
			;;
		2)	
			echo ""
            printGreen "▼ 0G (Zero Gravity) ▼"
			menu_0G
			;;
		3)	
			echo ""
            printGreen "▼ Side Protocol ▼"
			menu_side
			;;
		4)	
			echo ""
            printGreen "▼ Lava Network ▼"
			menu_lava
			;;

		5)	
			echo ""
            printGreen "▼ Babylon ▼"
			menu_babylon
			;;
		6)	
			echo ""
            printGreen "▼ Cascadia ▼"
			menu_cascadia
			;;
		7)	
			echo ""
            printGreen "▼ Dymension ▼"
			menu_dymension
			;;
		8)	
			echo ""
            printGreen "▼ ZetaChain ▼"
			menu_zeta
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
