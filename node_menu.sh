#!/bin/bash

function logo() {
    bash <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/logo.sh)
}
	

function printGreen {
    echo -e "\e[1m\e[32m${1}\e[0m"
}

function printRed {
    echo -e "\e[1m\e[31m${1}\e[0m"
	
}
function printAddition {
    echo -e "\e[4m${1}\e[0m"
	
}
 function menu_lava() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/lava/menu_lava.sh)
}

 function menu_dymension() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/dymension/menu_dymension.sh)
}
 function menu_babylon() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/babylon/menu_babylon.sh)
}
 function menu_zetachain() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/zetachain/menu_zetachain.sh)
}

 function menu_cascadia() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/cascadia/menu_cascadia.sh)
}

function menu_side() {
 	bash <(curl -s https://raw.githubusercontent.com/UnityNodes/cosmos/main/side/menu_side.sh)
}

function main_menu {
    while true; do
		clear
        logo 
printGreen "● Cosmos network projects:
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Lava Network                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Dymension                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Babylon                              │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ ZetaChain                            │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Cascadia                             │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Side                                 │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice, and enter the item number ► " choice
         case "$choice" in
1)
printGreen "▼ Lava Network ▼" && sleep 1
clear
echo ""
             menu_lava
             ;;
2)
printGreen "▼ Dimension ▼" && sleep 1
clear
echo ""
             menu_dimension
             ;;
3)
printGreen "▼ Babylon ▼" && sleep 1
clear
echo ""
             menu_babylon
             ;;
4)
printGreen "▼ ZetaChain ▼" && sleep 1
clear
echo ""
             menu_zetachain
             ;;
5)
printGreen "▼ Cascadia ▼" && sleep 1
clear
echo ""
             menu_cascadia
             ;;
6)
printGreen "▼ Side ▼" && sleep 1
clear
echo ""
             menu_side
             ;;
0)
echo "You have exited the menu."
             break
             ;;
*)
echo
printRed "The specified item is incorrect, please try again:"
;;
         esac
read -p "Press Enter to return to the main menu..."
done
}

main_menu
