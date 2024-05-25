#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printColor blue "● Maintenance menu Warden Protocol
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Get validator info                   │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Get sync info                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Get node peer                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Get live peers                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Set minimum gas price                │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Reset chain data                     │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number ► " choice
        case "$choice" in 
		1)	
			echo ""
            printColor green "▼ Get validator info ▼"
            echo ""
            wardend status 2>&1 | jq -r '.ValidatorInfo // .validator_info' && sleep 2
            echo ""	
			;;
		2)	
			echo ""
            		printColor green "▼ Get sync info ▼"
            echo ""
			wardend status 2>&1 | jq -r '.sync_info' && sleep 2
            echo ""	
			;;
		3)	
			echo ""
            printColor green "▼ Get node peer  ▼"
            echo ""
			echo $(wardend tendermint show-node-id)'@'$(curl -s ifconfig.me)':'$(cat ~/.warden/config/config.toml | sed -n '/Address to listen for incoming connection/{n;p;}' | sed 's/.*://; s/".*//') && sleep 2
            echo ""	
			;;
		4)	
			echo ""
            printColor green "▼ Get live peers ▼"
			curl -sS https://rpc.warden.unitynodes.com/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr)"' | awk -F ':' '{print $1":"$(NF)}'
			echo ""
			
            echo ""
			;;
		5)	
			echo ""
            printColor green "▼ Set minimum gas price ▼"
            echo ""
            sed -i -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.001uward\"/" ~/.warden/config/app.toml && sleep 2
            echo ""
			;;
		6)	
			echo ""
            printColor green "▼ Set minimum gas price ▼"
            echo ""
            wardend tendermint unsafe-reset-all --keep-addr-book --home ~/.warden && sleep 2
            echo ""
			;;
		0)
			echo ""
			echo "You have exited the menu." 
            break
            ;;
		*)
			echo
			printColor red "The specified item is incorrect, please try again:"
			;;
         esac
		read -p "Press Enter to return to the main menu..."
		done
}

main_menu
