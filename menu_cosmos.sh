#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function menu_warden {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/menu_warden.sh)
}

function menu_0G {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0G/menu_0G.sh)
}

function menu_side {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/side/menu_side.sh)
}

function menu_lava {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/lava/menu_lava.sh)
}

function menu_warden {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/babylon/menu_babylon.sh)
}

function menu_cascadia {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/cascadia/menu_cascadia.sh)
}

function menu_dymension {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/dymension/menu_dymension.sh)
}

function menu_zeta {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/zetachain/menu_zeta.sh)
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
			menu_lava
			;;

		5)	
			menu_babylon
			;;
		6)	
			menu_cascadia
			;;
		7)	
			menu_dymension
			;;
		8)	
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
