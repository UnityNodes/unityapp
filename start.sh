#!/bin/bash

function logo() {
    bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/logo.sh)
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
 function menu_english() {
 	bash <(curl -s https://raw.githubusercontent.com/unitynodes/cosmos/main/menu_english.sh)
}

 function menu_ukrainian() {
 	bash <(curl -s https://raw.githubusercontent.com/unitynodes/cosmos/main/menu_ukrainian.sh)
}
 function menu_russian() {
 	bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/menu_russian.sh)
}

function main_menu {
    while true; do
		clear
        logo 
printGreen "●:
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ English                              │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Українська                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Русский                              │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice, and enter the item number ► " choice
         case "$choice" in
1)
clear
logo
printGreen "▼ Select English ▼" && sleep 1
echo ""
             menu_english
             ;;
2)
clear
logo
printGreen "▼ Вибрано Українська ▼" && sleep 1
echo ""
             menu_ukrainian
             ;;
3)
printGreen "▼ Выбран Русский ▼" && sleep 1
clear
echo ""
             menu_russian
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
