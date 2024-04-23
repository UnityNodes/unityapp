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
 function monitor() {
 	bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/monitoring.sh)
}

 function backup() {
 	bash <(curl -s https://raw.githubusercontent.com/unitynodes/scripts/main/backup.sh)
}

function main_menu {
    while true; do
		clear
        logo 
printGreen "● Команди для сервера:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Встановити назву серверу             │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Оновлення сервера                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Активні процеси на сервері           │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Відкрити порт                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Перевірити RAM                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Перевірити CPU                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Перевірити SSD                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ Встановити Go                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ Видалення Go                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 10│ Що займає SSD на сервері             │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in 
		1)	
			clear
			logo
			printGreen "▼ Встановити назву сервера ▼" && sleep 1
			echo "Вкажіть ім'я вашого сервера:"
			read NAME
			echo ""
            sudo hostnamectl set-hostname "$NAME"
			printGreen "Сервер змінив назву, перезайдіть в термінальну сесію"
            ;;
		2)	
			clear
			logo
			printGreen "▼ Оновлення сервера ▼" && sleep 1
			echo ""
            sudo apt update -y && sudo apt full-upgrade -y && sudo apt -y install mc git wget screen
			printGreen "Сервер успішно оновлений"
            ;;
		3)	
			clear
			logo
			printGreen "▼ Активні процеси на сервері ▼" && sleep 1
			echo ""
            systemctl list-units --type=service --state=running	
            ;;
		4)	
			clear
			logo
			printGreen "▼ Відкрити порт ▼" && sleep 1
			echo ""
			echo "Вкажіть порт який хочете відкрити:"
			read PORT
            sudo ufw allow "$PORT"/tcp
			printGreen "Порт успішно відкритий"			
            ;;
		5)	
			clear
			logo
			printGreen "▼ Перевірка RAM ▼" && sleep 1
			echo ""
            free
            ;;
		6)	
			clear
			logo
			printGreen "▼ Перевірка CPU ▼" && sleep 1
			echo ""
            top
            ;;
		7)	
			clear
			logo
			printGreen "▼ Перевірка SSD ▼" && sleep 1
			echo ""
            df -h
            ;;
		8)	
			clear
			logo
			printGreen "▼ Встановлення Go ▼" && sleep 1
			echo ""	
			ver="1.21.4"
			wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
			sudo rm -rf /usr/local/go
			sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
			rm "go$ver.linux-amd64.tar.gz"
			echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
			source $HOME/.bash_profile
			go version
			printGreen "Go успішно встановленно"	
            ;;
		9)	
			clear
			logo
			printGreen "▼ Видалення Go ▼" && sleep 1
			echo ""	
			sudo apt-get remove golang-go && sudo apt-get remove --auto-remove golang-go
			printGreen "Go успішно видалено"	
            ;;
		10)	
			clear
			logo
			printGreen "▼ Ось що займає місце на Вашому сервері ▼" && sleep 1
			printAddition Може загружатись 10-20 секунд
			echo ""
            find . -type f -size +50M -exec du -h {} + | sort -rh	
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
