#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function one-lines {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/one-line_warden.sh)
}

function service {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/sevice_warden.sh)
}

function wallet {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/wallet_warden.sh)
}

function validator {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/validator_warden.sh)
}

function govermance {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/one-line_warden.sh)
}

function port {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/port_warden.sh)
}


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printBlue "● Menu Warden:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ One-line codes (Install, Update, etc)│
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Service (start,stop,restart etc)     │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Wallet (balance, delegate etc)       │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Validator (create,edit etc)          │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Maintenance (peers,sync info etc)    │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Govermance (vote, proposal etc)      │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Ports (change etc)                   │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			clear
			echo ""
            service_lava
            ;;
		2)	
			clear
			echo ""
            key-vali_lava
            ;;
		3)	
			clear
			echo ""
            port_lava
            ;;	
		4)	
			clear
			echo ""
            port_lava
            ;;
		5)	
			clear
			echo ""
            port_lava
            ;;
		6)	
			clear
			echo ""
            port_lava
            ;;
		7)	
			clear
			echo ""
            port_lava
            ;;								
		0)
			echo "Ви вийшли з меню." 
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
