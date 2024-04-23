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

function main_menu {
    while true; do
		clear
        logo 
printGreen "● Сервісні команди ⚙️: 
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Старт ноди                           │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Рестарт ноди                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Зупинка ноди                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Журнал логів                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Статус ноди та синхронізації         │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Верхній блок ноди                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Версія ноди та версія tag            │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти з меню                         │
  └───┴──────────────────────────────────────┘"
read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in 
		1)	
			echo ""
			printGreen "▼ Старт ноди ▼" && sleep 1
			echo ""
            sudo systemctl start sided
			printGreen "Нода успішно запущена"
            ;;
		2)	
			echo ""
			printGreen "▼ Рестарт ноди ▼" && sleep 1
			echo ""
            sudo systemctl restart sided
			printGreen "Нода успішно перезапущена"
            ;;
		3)	
			echo ""
			printGreen "▼ Зупинка ноди ▼" && sleep 1
			echo ""
            sudo systemctl stop sided
			printGreen "Нода успішно зупинена"
            ;;
		4)	
			echo ""
            printGreen "↓ Журнал логів Side ↓ Натисніть CTRL+C щоб вийти ↓" && sleep 1
            echo ""
            sudo journalctl -u sided -f -o cat
            echo ""
			;;
		5)	
			echo ""
            printGreen "↓ Статус ноди та синхронізація ↓" && sleep 1
            echo ""
            sided status 2>&1 | jq; systemctl status sided && sleep 2
            echo ""	
			;;
		6)	
			echo ""
            printGreen "↓ Верхній блок вашої ноди ↓"
            echo ""
			sided status 2>&1 | jq .SyncInfo.latest_block_height && sleep 2
            echo ""	
			;;
		7)	
			echo ""
            printGreen "↓ Ваша версії ноди та версія tag ↓" && sleep 1
            echo ""
            sided version; sided status | jq .NodeInfo.version| tr -d '"' && sleep 2
            echo "" 
			;;
		0)
			echo ""
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