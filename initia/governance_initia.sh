#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printColor blue "● Governance Initia
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ List of all proposals                │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Check vote                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Vote                                 │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printColor green "▼ List of all proposals ▼"
            echo ""
            initiad query gov proposals
            echo ""	
			;;
		2)	
			echo ""
            printColor green "▼ Check vote ▼"
            echo ""
			echo "Enter the number vote"
			read NUMBER_PROPOSAL
			echo ""
			initiad query gov proposal $NUMBER_PROPOSAL \
			--output json | jq
            echo ""	
			;;
		3)	
			echo ""
            printColor green "▼ Vote ▼"
            echo ""
			echo "Enter the number vote"
			read NUMBER_PROPOSAL
			echo ""
			echo "Enter vote options"
			printYellow "Example"
			printYellow "¤ yes"
			printYellow "¤ no"
			printYellow "¤ no_with_veto"
			printYellow "¤ abstain"
			echo ""	
			read VOTE_OPTION
			echo ""	
			initiad tx gov vote $PROPOSAL_NUMBER $VOTE_OPTION \
			--node https://rpc.initia.unitynodes.com \
   			--chain-id $initiachain
			--fees 80000uinit \
			--from wallet
            echo ""	
			;;
		
		0)
			echo ""
			echo "You have exited the menu." 
            break
            ;;
		*)	
			echo
			printColor red "Incorrect choice. Try again..."
			;;
        esac
		read -p "Press Enter to return main menu..."
	done	
}

main_menu
