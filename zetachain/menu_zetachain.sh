#!/bin/bash

function logo() {
    bash <(curl -s https://raw.githubusercontent.com/CPITMschool/Scripts/main/logo.sh)
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
 function service_zetachain() {
 	bash <(curl -s https://raw.githubusercontent.com/CryptoManUA/cosmos/main/zetachain/service_zetachain.sh)
}

 function key-vali_zetachain() {
 	bash <(curl -s https://raw.githubusercontent.com/CryptoManUA/cosmos/main/zetachain/key-vali_zetachain.sh)
}
 function port_zetachain() {
 	bash <(curl -s https://raw.githubusercontent.com/CryptoManUA/cosmos/main/zetachain/port_zetachain.sh)
}

function main_menu {
    while true; do
		clear
        logo 
printGreen "● Виберіть направлення дій ZetaChain:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Сервсні команди                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Гаманець та валідатор                │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Порти                                │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти з меню                         │
  └───┴──────────────────────────────────────┘"
read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in 
		1)	
			printGreen "▼ Сервсні команди для ноди ▼" && sleep 1
			clear
			echo ""
            service_zetachain
            ;;
		2)	
			printGreen "▼ Операції з гаманецм та валідатором ▼" && sleep 1
			clear
			echo ""
            key-vali_zetachain
            ;;
		3)	
			printGreen "▼ Вибір дій з портами ▼" && sleep 1
			clear
			echo ""
            port_zetachain
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
