#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		anima
		clear
        logo 
printBlue "● Validator management Warden:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Create Validator                     │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Edit validator                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Unjail                               │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Jail reason                          │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Validator details                    │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printGreen "▼ Create Validator ▼"
			echo ""
			printColor blue "Enter your Validator Name"
			read MONIKER
            echo ""
			printColor blue "Enter your Website (Press enter and this option will be left blank)"
			read WEBSITE
            echo ""
			printColor blue "Enter your Identity (Press enter and this option will be left blank)"
			read IDENTITY
            echo ""
			printColor blue "Enter your Details (Press enter and this option will be left blank)"
			read DETAILS
            echo ""
	    		printColor blue "Enter your Email (Press enter and this option will be left blank)"
			read EMAIL
            echo ""
			
			

			if [ -n "$WEBSITE_INPUT" ]; then
			  WEBSITE="$WEBSITE_INPUT"
			else
			  WEBSITE=""
			fi

			if [ -n "$IDENTITY_INPUT" ]; then
			  IDENTITY="$IDENTITY_INPUT"
			else
			  IDENTITY=""
			fi

			if [ -n "$DETAILS_INPUT" ]; then
			  DETAILS="$DETAILS_INPUT"
			else
			  DETAILS=""
			fi

			if [ -n "$EMAIL_INPUT" ]; then
			  EMAIL="$EMAIL_INPUT"
			else
			  EMAIL=""
			fi

            wardend tx staking create-validator \
  			--commission-max-change-rate "0.05" \
  			--commission-max-rate "0.10" \
   			--commission-rate "0.05" \
			--min-self-delegation "1" \
			--pubkey=$(wardend tendermint show-validator) \
			--new-moniker "$MONIKER" \
			--website "$WEBSITE" \
			--identity "$IDENTITY" \
			--details "$DETAILS" \
			--security-contact="$EMAIL" \
			--chain-id $wardenchain \
			--fees 5000uward \
			--from wallet
   			-y
            echo ""	
			;;
		2)	
			echo ""
            printGreen "▼ Edit Validator ▼"
			echo ""
			printColor blue "Enter your Validator Name"
			read MONIKER
            echo ""
			printColor blue "Enter your Website (Press enter and this option will be left blank)"
			read WEBSITE
            echo ""
			printColor blue "Enter your Identity (Press enter and this option will be left blank)"
			read IDENTITY
            echo ""
			printColor blue "Enter your Details (Press enter and this option will be left blank)"
			read DETAILS
            echo ""
			
			if [ -n "$NAME_WALLET_INPUT" ]; then
			  NAME_WALLET="$NAME_WALLET_INPUT"
			else
			  NAME_WALLET="wallet"
			fi

			if [ -n "$WEBSITE_INPUT" ]; then
			  WEBSITE="$WEBSITE_INPUT"
			else
			  WEBSITE=""
			fi

			if [ -n "$IDENTITY_INPUT" ]; then
			  IDENTITY="$IDENTITY_INPUT"
			else
			  IDENTITY=""
			fi

			if [ -n "$DETAILS_INPUT" ]; then
			  DETAILS="$DETAILS_INPUT"
			else
			  DETAILS=""
			fi

			if [ -n "$EMAIL_INPUT" ]; then
			  EMAIL="$EMAIL_INPUT"
			else
			  EMAIL=""
			fi

            wardend tx staking edit-validator \
   			--commission-rate "0.05" \
			--moniker "$MONIKER" \
			--website "$WEBSITE" \
			--identity "$IDENTITY" \
			--details "$DETAILS" \
			--security-contact="$EMAIL" \
			--chain-id $wardenchain \
			--fees 5000uward \
			--from wallet
   			-y
            echo ""	
			;;
		3)	
			echo ""
            printGreen "▼ Unjail Validator  ▼"
            echo ""
			wardend tx slashing unjail --chain-id buenavista-1 --fees 5000uward --from wallet
            echo ""	
			;;
		4)	
			echo ""
            printGreen "▼ Jail reason ▼"
            echo ""
            wardend query slashing signing-info $(wardend tendermint show-validator)
            echo ""	
			;;
		5)	
			echo ""
            printGreen "▼ Validator details ▼"
            echo ""
            wardend q staking validator $(wardend keys show wallet --bech val -a)
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
