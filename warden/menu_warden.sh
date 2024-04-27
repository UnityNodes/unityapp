#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function one-lines {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/one-line_warden.sh)
}

function service {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/sevice_warden.sh)
}

function wallet {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/wallet_warden.sh)
}

function validator {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/validator_warden.sh)
}

function govermance {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/one-line_warden.sh)
}

function port {
	bash bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/warden/port_warden.sh)
}


function main_menu {
    while true; do
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
			printGreen "▼ One-line codes (Install, Update, etc) ▼" && sleep 1
			clear
			echo ""
            service_lava
            ;;
		2)	
			printGreen "▼ Service (start,stop,restart etc) ▼" && sleep 1
			clear
			echo ""
            key-vali_lava
            ;;
		3)	
			printGreen "▼ Wallet (balance, delegate etc) ▼" && sleep 1
			clear
			echo ""
            port_lava
            ;;	
		4)	
			printGreen "▼ Validator (create,edit etc) ▼" && sleep 1
			clear
			echo ""
            port_lava
            ;;
		5)	
			printGreen "▼ Maintenance (peers,sync info etc) ▼" && sleep 1
			clear
			echo ""
            port_lava
            ;;
		6)	
			printGreen "▼ Govermance (vote, proposal etc) ▼" && sleep 1
			clear
			echo ""
            port_lava
            ;;
		7)	
			printGreen "▼ Ports (change etc) ▼" && sleep 1
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
			printRed "Неправильно вказаний пункт, спробуйте ще раз:"
			;;
        esac
		read -p "Натисніть Enter, щоб повернутись до головного меню..."
	done	
}

main_menu
