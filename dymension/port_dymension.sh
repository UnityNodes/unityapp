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
function port_menu() {
        clear
        logo
printGreen "● Заміна портів Dymension:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ 27657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ 28657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ 29657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ 30657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ 31657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ 32657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ 33657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ 34657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ 35657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 10│ 36657                                │
│ ├───┼──────────────────────────────────────┤
├─┤ 11│ 26657 (Default)                      │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
        read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in
            1)
sed -i.bak -e "s%:1317%:1417%g; 
s%:8080%:8180%g;
s%:9090%:9190%g;
s%:9091%:9191%g;
s%:8545%:8645%g;
s%:8546%:8646%g;
s%:6065%:6165%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:27658%g;
s%:26657%:27657%g;
s%:6060%:6160%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:27656%g;
s%:26660%:27660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:27657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
                ;;
            2)
sed -i.bak -e "s%:1317%:1517%g; 
s%:8080%:8280%g;
s%:9090%:9290%g;
s%:9091%:9291%g;
s%:8545%:8745%g;
s%:8546%:8746%g;
s%:6065%:6265%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:28658%g;
s%:26657%:28657%g;
s%:6060%:6260%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:28656%g;
s%:26660%:28660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:28657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;; 
            3)
sed -i.bak -e "s%:1317%:1617%g; 
s%:8080%:8380%g;
s%:9090%:9390%g;
s%:9091%:9391%g;
s%:8545%:8845%g;
s%:8546%:8846%g;
s%:6065%:6365%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:29658%g;
s%:26657%:29657%g;
s%:6060%:6360%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:29656%g;
s%:26660%:29660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:29657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
  		;;
    	    4)
sed -i.bak -e "s%:1317%:1717%g; 
s%:8080%:8480%g;
s%:9090%:9490%g;
s%:9091%:9491%g;
s%:8545%:8945%g;
s%:8546%:8946%g;
s%:6065%:6465%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:30658%g;
s%:26657%:30657%g;
s%:6060%:6460%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:30656%g;
s%:26660%:30660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:30657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
    	    5)
sed -i.bak -e "s%:1317%:1817%g; 
s%:8080%:8580%g;
s%:9090%:9590%g;
s%:9091%:9591%g;
s%:8545%:9045%g;
s%:8546%:9046%g;
s%:6065%:6565%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:27658%g;
s%:26657%:31657%g;
s%:6060%:6560%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:31656%g;
s%:26660%:31660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:31657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
    	    6)
sed -i.bak -e "s%:1317%:1917%g; 
s%:8080%:8680%g;
s%:9090%:9690%g;
s%:9091%:9691%g;
s%:8545%:9145%g;
s%:8546%:9146%g;
s%:6065%:6665%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:32658%g;
s%:26657%:32657%g;
s%:6060%:6660%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:32656%g;
s%:26660%:32660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:32657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
    	    7)
sed -i.bak -e "s%:1317%:2017%g; 
s%:8080%:8780%g;
s%:9090%:9790%g;
s%:9091%:9791%g;
s%:8545%:9245%g;
s%:8546%:9246%g;
s%:6065%:6765%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:33658%g;
s%:26657%:33657%g;
s%:6060%:6760%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:33656%g;
s%:26660%:33660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:33657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
     	    8)
sed -i.bak -e "s%:1317%:2117%g; 
s%:8080%:8880%g;
s%:9090%:9890%g;
s%:9091%:9891%g;
s%:8545%:9345%g;
s%:8546%:9346%g;
s%:6065%:6865%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:34658%g;
s%:26657%:34657%g;
s%:6060%:6860%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:34656%g;
s%:26660%:34660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:34657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
			9)
sed -i.bak -e "s%:1317%:2217%g; 
s%:8080%:8980%g;
s%:9090%:9990%g;
s%:9091%:9991%g;
s%:8545%:9445%g;
s%:8546%:9446%g;
s%:6065%:6965%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:35658%g;
s%:26657%:35657%g;
s%:6060%:6960%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:35656%g;
s%:26660%:35660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:35657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
    	    10)
sed -i.bak -e "s%:1317%:2317%g; 
s%:8080%:9080%g;
s%:9090%:10090%g;
s%:9091%:10091%g;
s%:8545%:9545%g;
s%:8546%:9546%g;
s%:6065%:7065%g" $HOME/.dymension/config/app.toml	
sed -i.bak -e "s%:26658%:36658%g;
s%:26657%:36657%g;
s%:6060%:7060%g;
s%tcp://0.0.0.0:26656%tcp://0.0.0.0:36656%g;
s%:26660%:36660%g" $HOME/.dymension/config/config.toml
sed -i.bak -e "s%:26657%:36657%g" $HOME/.dymension/config/client.toml
echo "" 
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт змінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
	        ;;
			11)
wget -P /root/.dymension/config/ -N \
	https://raw.githubusercontent.com/CryptoManUA/cosmos/main/dymension/app.toml
wget -P /root/.dymension/config/ -N \
 	https://raw.githubusercontent.com/CryptoManUA/cosmos/main/dymension/client.toml
wget -P /root/.dymension/config/ -N \
  	https://raw.githubusercontent.com/CryptoManUA/cosmos/main/dymension/config.toml
sudo systemctl restart dymd
echo -e "\e[1m\e[32mПорт замінено та перезавантажено ноду\e[0m" && sleep 1
echo -e "\e[1m\e[32mПеревірте роботу ноди\e[0m"
			;;
            0)
            chosen=1
            ;;
            *)
echo -e "\033[31mНеправильно вказаний порт, спробуйте ще раз.\e[0m"
            ;;
       esac
}



function main_menu() {
	chosen=1
    while true; do
        clear
        logo
printGreen "● Порти:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Перевірити які порти відкриті(сервер)│ 
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Порт який займає нода Dymension      │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Заміна портів Dymension              │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
        read -p "Зробіть ваш вибір, та введіть число: " choice
        case "$choice" in
            1)
				clear
				logo
				echo ""
				printGreen "↓ Відкриті порти на Вашому сервері ↓"
				printAddition "приклад 127.0.0.1:26657 - це означає що порт зайнятий нодою"
				printAddition "інші можна використовувати для підселення ноди в мережі Cosmos"
				echo ""
				netstat -tulnp
				echo ""	
				;;
            2)
				clear
				logo
				echo ""
				printGreen "↓ Порт який викортистовує Dymension на сервері ↓"
				echo ""
				ss -tulpn | grep dymd
				echo ""
				printAddition "Якщо немає жодних результатів, це означає що помилка портів"
				echo ""
				;;
            3)	
                port_menu
                ;;
            0)
                echo "Ви вийшли з меню."
                break
                ;;
            *)
                echo -e "\e[31mНекоректний вибір. Спробуйте ще раз.\e[0m"
                ;;
        esac
        read -p "Натисніть Enter, щоб повернутись до головного меню..."
    done
}
		main_menu
		
