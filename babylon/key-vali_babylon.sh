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
printGreen "● Валідатор та гаманець Babylon:
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Створення гаманця                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Відновлення гаманця                  │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Інформація про гаманець              │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Видалити гаманець                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Перевірити баланс                    │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Делегування токенів                  │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Виведення із вязниці                 │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ Створення валідатора                 │
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ Редагування валідатора               │
│ ├───┼──────────────────────────────────────┤
├─┤ 10│ Інформація про валідатора та ключ    │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Вийти                                │
  └───┴──────────────────────────────────────┘"
read -p "Зробіть ваш вибір, та введіть номер пункту ► " choice
        case "$choice" in 
		1)	
			echo ""
            printGreen "↓ Створення гаманця ↓"
            echo ""
            babylond keys add wallet
            echo ""	
			;;
		2)	
			echo ""
            printGreen "↓ Відновлення гаманця ↓"
            echo ""
			babylond keys add wallet --recover 
            echo ""	
			;;
		3)	
			echo ""
            printGreen "↓ Інформація про гаманець ↓"
            echo ""
			babylond keys list
            echo ""	
			;;
		4)	
			echo ""
            printGreen "↓ Видалення гаманця ↓"
			echo ""
			echo "Вкажіть ім'я гаманця:"
			read NAME
			babylond keys delete "$NAME"
            echo ""
			;;
		5)	
			echo ""
            printGreen "↓ Ваш баланс ↓"
            echo ""
            babylond q bank balances $(babylond keys show wallet -a) && sleep 2
            echo ""
			;;
		6)	
			echo ""
            printGreen "↓ Ваш баланс ↓"
	    babylond q bank balances $(babylond keys show wallet -a) | grep amount | awk '{print $3}'
   	    echo ""
            printGreen "↓ Делегування токенів собі ↓"
            echo ""
			echo "↓ Вкажіть кількість токенів ↓:"
			read AMOUNT
            babylond tx epoching delegate $(babylond keys show wallet --bech val -a) "$AMOUNT"ubbn --from wallet --chain-id bbn-test-3 --gas-prices 0.1ubbn --gas-adjustment 1.5 -y && sleep 2
            echo ""
			;;
		7)	
			echo ""
            printGreen "↓ Виведення Вашого валідатора із в'язниці ↓"
			printAddition "(Будьте уважні, виведення із в'язниці може тривати від 10хв)"
            echo ""
            babylond tx slashing unjail --from wallet --chain-id bbn-test-3 --gas-prices 0.1ubbn --gas-adjustment 1.5 --gas auto -y && sleep 2
            echo ""
			;;
		8)
            echo ""
            printGreen "↓ Створення валідатора ↓"
            echo ""
            #!/bin/bash

echo $'\e[32mУ вас є на балансі 200000ubbn щоб успішно створили валідатора? [Y/N]\e[0m'
read -n 1 -r
echo   
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pubkey=$(babylond tendermint show-validator)
    pubkey=$(echo "$pubkey" | jq -r '.key')
    read -p $'\e[32mВкажіть назву вашого moniker: \e[0m' moniker
    read -p $'\e[32mВкажіть вашу пошту(додаткова інформація про вас, рекомендовано вказати): \e[0m' mail

    cat > $HOME/.babylond/config/validator.json <<EOF
    {
        "pubkey": {"@type":"/cosmos.crypto.ed25519.PubKey","key":"$pubkey"},
        "amount": "100000ubbn",
        "moniker": "$moniker",
        "identity": "536FCD2BE18D2DF4",
        "security": "$mail",
        "details": "CPI™️ Ukrainian Community",
        "commission-rate": "0.05",
        "commission-max-rate": "0.2",
        "commission-max-change-rate": "0.2",
        "min-self-delegation": "1"
    }
EOF

    echo $'\e[32mФайл validator.json успішно створено.\e[0m'
    echo ""
    echo $'\e[32mНатисніть CTRL + C, скопіюйте команду створення валідатора нижче та введіть в термінал:\e[0m'
    echo ""
    echo $'\e[31mbabylond tx checkpointing create-validator $HOME/.babylond/config/validator.json \
    --chain-id="bbn-test-3" \
    --gas="750000" \
    --gas-adjustment="1.5" \
    --gas-prices="0.00001ubbn" \
    --from wallet\e[0m'
else
    echo $'\e[32mСтворення валідатора скасовано.\e[0m'
fi
            echo ""	
			;;
		9)
            echo ""
            printGreen "↓ Редагування валідатора ↓"
            echo ""
            echo "Вкажіть ім'я вашого moniker:"
			read MONIKER

			DEFAULT_IDENTITY="536FCD2BE18D2DF4"

			echo "Вкажіть ваш identity (натисніть Enter якщо ви не створювали):"
			read IDENTITY_INPUT

			if [ -n "$IDENTITY_INPUT" ]; then
			  IDENTITY="$IDENTITY_INPUT"
			else
			  IDENTITY="536FCD2BE18D2DF4"
			fi

			babylond tx staking edit-validator \
			--new-moniker="$MONIKER" \
			--identity="$IDENTITY" \
			--details="CPI™️ Ukranian Community" \
			--chain-id=bbn-test-3 \
			--commission-rate=0.10 \
			--from=wallet \
			--gas-prices=0.1ubbn \
			--gas-adjustment=1.5 \
			-y
            echo ""
			;;
		10)
            echo ""
            printGreen "↓ Інформаціця про валідатора та приватний ключ ↓"
            echo ""
            babylond q staking validator $(babylond keys show wallet --bech val -a); cat $HOME/.babylond/config/priv_validator_key.json && sleep 2
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
