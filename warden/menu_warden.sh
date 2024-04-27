#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function one-lines {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/one-line_warden.sh)
}

function service {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/service_warden.sh)
}

function wallet {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/wallet_warden.sh)
}

function validator {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/validator_warden.sh)
}

function maintenance {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/maintenance_warden.sh)
}

function govermance {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/govermance_warden.sh)
}

function port {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/warden/port_warden.sh)
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
            one-lines
            ;;
		2)	
			clear
			echo ""
            service
            ;;
		3)	
			clear
			echo ""
           wallet
            ;;	
		4)	
			clear
			echo ""
            validator
            ;;
		5)	
			clear
			echo ""
            maintenance
            ;;
		6)	
			clear
			echo ""
            govermance
            ;;
		7)	
			clear
			echo ""
            ports
            ;;								
		0)
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
