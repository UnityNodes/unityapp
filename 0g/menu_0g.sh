#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function one-lines {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/one-line_0gchain.sh)
}

function service {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/service_0g.sh)
}

function wallet {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/wallet_0g.sh)
}

function validator {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/validator_0g.sh)
}

function maintenance {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/maintenance_0g.sh)
}

function governance {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/govermance_0g.sh)
}

function port {
	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/0gchain/port_0g.sh)
}


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printBlue "● Menu 0G Labs (Zero Gravity):
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ One-line codes (install, update, etc)│
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Service (start,stop,restart etc)     │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Wallet (balance, delegate etc)       │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Validator (create,edit etc)          │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Maintenance (peers,sync info etc)    │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Governance (vote, proposal etc)      │
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
            governance
            ;;
		7)	
			clear
			echo ""
            port
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
