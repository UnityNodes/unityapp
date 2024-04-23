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
 function server() {
 	bash <(curl -s https://raw.githubusercontent.com/CryptoManUA/cosmos/main/server.sh)
}

 function menu_node() {
 	bash <(curl -s https://raw.githubusercontent.com/CryptoManUA/cosmos/main/node_menu.sh)
}
 function monitor() {
 	bash <(curl -s https://raw.githubusercontent.com/asapov01/Install-Grafana/main/installmonitoring.sh)
}

 function backup() {
 	bash <(curl -s https://raw.githubusercontent.com/asapov01/Backup/main/backup.sh)
}

function main_menu {
    while true; do
		clear
        logo 
printGreen "● Головне меню:
│    
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Команди для сервера (термінал)       │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Взаємодія з нодами Cosmos            │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Моніторинг                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Бекап                                │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in 
		1)	
			clear
			logo
			printGreen "▼ Команди для сервера (Робота з сервером) ▼" && sleep 1
			echo ""
            server
            ;;
		2)	
			clear
			logo
			printGreen "▼ Взаємодія з нодами Cosmos ▼" && sleep 1
			echo ""
            menu_node
            ;;
		3)	
			printGreen "▼ Встановлення моніторонгу ▼" && sleep 1
			clear
			echo ""
            monitor
            ;;
		4)	
			printGreen "▼ Створення бекапу ▼" && sleep 1
			clear
			echo ""
            backup
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
