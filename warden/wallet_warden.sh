#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printBlue "● Wallet Warden Protocol
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Add new key                          │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Recover key (via mnemonic)           │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ List all keys                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Delete key                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Wallet balance                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Send                                 │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Withdraw rewards from all validators │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ Withdraw rewards including commission|
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ Delegate tokens to yourself          │
│ ├───┼──────────────────────────────────────┤
├─┤ 10│ Delegate tokens to validator         |
│ ├───┼──────────────────────────────────────┤
├─┤ 11│ Redelegate to another validator      │
│ ├───┼──────────────────────────────────────┤
├─┤ 12│ Unbond tokens from your validator    │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printGreen "▼ Add new key ▼"
			echo "Enter your name key (press enter and the default name is "wallet")"
			read NAME_WALLET
            echo ""
			if [ -n "$NAME_WALLET_INPUT" ]; then
			  NAME_WALLET="$NAME_WALLET_INPUT"
			else
			  NAME_WALLET="wallet"
			fi
            wardend keys add $NAME_WALLET
            echo ""	
			;;
		2)	
			echo ""
            printGreen "▼ Recover key (via mnemonic) ▼"
            echo ""
			wardend keys add wallet --recover 
            echo ""	
			;;
		3)	
			echo ""
            printGreen "▼ List all keys  ▼"
            echo ""
			wardend keys list
            echo ""	
			;;
		4)	
			echo ""
            printGreen "▼ Delete key ▼"
			echo "Enter your name key (press enter and the default name is "wallet")"
			read DEL_WALLET
            echo ""
			if [ -n "$DEL_WALLET_INPUT" ]; then
			  DEL_WALLET="$DEL_WALLET_INPUT"
			else
			  DEL_WALLET="wallet"
			fi
            wardend keys delete $DEL_WALLET
            echo ""	
			;;
		5)	
			echo ""
            printGreen "▼ Wallet balance ▼"
            echo ""
            wardend q bank balances $(wardend keys show wallet -a) && sleep 2
            echo ""
			;;
		6)	
			echo ""
            printGreen "▼ Send ▼"
			echo "Enter address to which you want to send "
			read RECIPENT
			echo "Enter amount for send "
			read AMOUNT
			echo ""
			wardend tx bank send wallet $RECIPENT "$AMOUNT"uward --chain-id $wardenchain --fees 5000uward --from wallet
     		echo ""
			;;
		7)	
			echo ""
            printGreen "▼ Withdraw rewards from all validators ▼"
            echo ""
			wardend tx distribution withdraw-all-rewards --chain-id $wardenchain --fees 5000uward --from wallet
            echo ""
			;;
		8)
            echo ""
            printGreen "▼ Withdraw rewards including commission ▼"
            echo ""
			echo "Enter your address validator"
			read VALOPER
            wardend tx distribution withdraw-rewards $VALOPER --commission --chain-id $wardenchain --fees 5000uward --from wallet
			;;
		9)
            echo ""
            printGreen "▼ Delegate tokens to yourself ▼"
			echo "Enter amoun for delegation"
			read AMOUNT
			echo ""
			wardend tx staking delegate $(wardend keys show wallet --bech val -a) "$AMOUNT"uward --from wallet --chain-id $wardenchain --gas-prices 0.01uward --gas-adjustment 1.5 -y  
			;;
		10)
            echo ""
            printGreen "▼ Delegate tokens to validator ▼"
			echo "Enter address validator"
			read VALIDATOR
			echo "Enter amoun for delegation"
			read AMOUNT
			echo ""
			wardend tx staking delegate $VALIDATOR "$AMOUNT"uward --chain-id $wardenchain --fees 5000uward --from wallet 
			;;	
		11)
            echo ""
            printGreen "▼ Redelegate to another validator ▼"
            echo "Enter address validator"
			read VALIDATOR
			echo "Enter amoun for delegation"
			read AMOUNT
			echo ""
			wardend tx staking redelegate $(wardend keys show wallet --bech val -a) $VALIDATOR "$AMOUNT"uward --chain-id $wardenchain --fees 5000uward --from wallet 
			;;	
		12)
            echo ""
            printGreen "▼ Unbond tokens from your validator ▼"
			echo ""
			wardend tx staking unbond $(wardend keys show wallet --bech val -a) uward --chain-id $wardenchain --fees 5000uward --from wallet 
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
