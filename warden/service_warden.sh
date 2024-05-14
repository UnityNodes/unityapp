#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function main_menu {
    while true; do
		anima
		clear
        logo
printBlue "● Services Warden: 
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Reload service configuration (deamon)│
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Enable service                       │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Disable service                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 4 │ Start service                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 5 │ Stop service                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 6 │ Restart service                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 7 │ Check service status                 │
│ ├───┼──────────────────────────────────────┤
├─┤ 8 │ Check service logs                   │
│ ├───┼──────────────────────────────────────┤
├─┤ 9 │ Remove node                          │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
			printGreen "▼ Reload the service configuration ▼" && sleep 1
			echo ""
            sudo systemctl daemon-reload
			printGreen "Restarting the service configuration was successful"
            ;;
		2)	
			echo ""
			printGreen "▼ Enable service ▼" && sleep 1
			echo ""
            sudo systemctl enable wardend
			printGreen "Enable service was successful"
            ;;
		3)	
			echo ""
			printGreen "▼ Disable service ▼" && sleep 1
			echo ""
            sudo systemctl disable wardend
			printGreen "Disable service was successful"
            ;;
		4)	
			echo ""
            printGreen "↓ Start service ↓" && sleep 1
            echo ""
            sudo systemctl start wardend
			printGreen "Start service was successful"
            echo ""
			;;
		5)	
			echo ""
            printGreen "↓ Stop service  ↓" && sleep 1
            echo ""
            sudo systemctl start wardend
			printGreen "Stop service was successful"
            echo ""
			;;
		6)	
			echo ""
            printGreen "↓ Restart service  ↓" && sleep 1
            echo ""
            sudo systemctl restart wardend
			printGreen "Restart service was successful"
            echo ""
			;;
   
		7)	
			echo ""
            printGreen "↓ Status service  ↓" && sleep 1
            echo ""
            sudo systemctl status wardend
			printGreen "Status service was successful"
            echo ""
			;;
   		8)	
			echo ""
            printGreen "↓ Status service  ↓" && sleep 1
            echo ""
            sudo journalctl -u wardend -f --no-hostname -o cat
		printGreen "Status service was successful"
            echo ""
			;;
		0)
			echo ""
			echo "You have exited the menu." 
            break
            		;;
		*)	
			echo
			printRed "Incorrect choice. Try again..."
			;;
        esac
		read -p "Press Enter to return main menu..."
	done	
}

main_menu
