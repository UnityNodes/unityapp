#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

backup_node() {
    local node_name="$1"
    local source_dir="$2"
    local files_to_copy=("${@:3}")
    local backup_dir="$HOME/BACKUP/$node_name/config"
    local backup_message_printed=false

    # Перевірка наявності файлів для резервного копіювання
    for file_to_copy in "${files_to_copy[@]}"; do
        if [ -f "$source_dir/$file_to_copy" ]; then
            backup_message_printed=true
            break
        fi
    done

    # Вивід повідомлення про резервне копіювання, якщо є файли для копіювання
    if [ "$backup_message_printed" == true ]; then
        mkdir -p "$backup_dir" || { echo "Failed to create backup directory $backup_dir"; return; }

        # Копіювання файлів у папку резервного копіювання
        echo "Copying files to $backup_dir"
        for file_to_copy in "${files_to_copy[@]}"; do
            if [ -f "$source_dir/$file_to_copy" ]; then
                cp "$source_dir/$file_to_copy" "$backup_dir/" || { echo "Failed to transfer node backup files $node_name"; return; }
            fi
        done
        echo "Backup completed"
    else
        echo "No files to backup for node $node_name"
    fi
}

function backup() {
    printYellow "Backup Lava, Nibiru, Warden, OG, Mantra, Babylon nodes (performed only for those installed on the server, stored in the $HOME/BACKUP folder)"
    printYellow "Save in $HOME/BACKUP"
    read -p "Enter a node name (Lava, Nibiru, Warden, OG, Mantra, Babylon): " node_name
    case "$node_name" in
        Warden)
        node_name="Warden"
	warden_source_dir="$HOME/.warden/"
	warden_files_to_copy=("config/priv_validator_key.json")
	backup_node "$node_name" "$warden_source_dir" "${warden_files_to_copy[@]}"
            ;;
        OG)
            lava_source_dir="$HOME/.evmosd/"
            lava_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$og_source_dir" "${og_files_to_copy[@]}"
            echo ""
            ;;
        Mantra)
            lava_source_dir="$HOME/.mantrachain/"
            lava_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$mantra_source_dir" "${mantra_files_to_copy[@]}"
            echo ""
            ;;    

        Lava)
            lava_source_dir="$HOME/.lava/"
            lava_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$lava_source_dir" "${lava_files_to_copy[@]}"
            echo ""
            ;;
        Nibiru)
            nibiru_source_dir="$HOME/.nibid/"
            nibiru_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$nibiru_source_dir" "${nibiru_files_to_copy[@]}"
            ;;
        Babylon)
            babylon_source_dir="$HOME/.babylond"
            babylon_files_to_copy=("config/priv_validator_key.json" "data/priv_validator_state.json")
            backup_node "$node_name" "$babylon_source_dir" "${babylon_files_to_copy[@]}"

            ;;
        *)
            echo "Invalid node name..."
            ;;
    esac
}

function move_backup_files() {
    printYellow "Move node backup files (in case you reinstalled/upgraded node/deleted node)"
    printYellow "Move from $HOME/BACKUP folder"
    read -p "Enter the name of the node (Lava, Nibiru, Warden, OG, Mantra, Babylon): " node_name
    case "$node_name" in
        Lava)
            cp "$HOME/BACKUP/Lava backup/priv_validator_key.json" "$HOME/.lava/config/"
            systemctl restart lavad
            echo -e "\e[1m\e[32mLava backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;
        Nibiru)
            nibiru_source_dir="$HOME/.nibid/"
            cp "$HOME/BACKUP/Nibiru backup/priv_validator_key.json" "$nibiru_source_dir/config/"
            systemctl restart nibid
            echo -e "\e[1m\e[32mNibiru backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;
        Babylon)
            babylon_source_dir="$HOME/.babylond/"
            cp "$HOME/BACKUP/Babylon backup/priv_validator_key.json" "$babylon_source_dir/config/"
            systemctl restart babylond
            echo -e "\e[1m\e[32mBabylon backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;
        Warden)
            warden_source_dir="$HOME/.warden/"
            cp "$HOME/BACKUP/Warden backup/priv_validator_key.json" "$HOME/.warden/config/"
            systemctl restart wardend
            echo -e "\e[1m\e[32mWarden backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;
        OG)
            og_source_dir="$HOME/.evmosd/"
            cp "$HOME/BACKUP/0G backup/priv_validator_key.json" "$HOME/.evmosd/config/"
            systemctl restart evmosd
            echo -e "\e[1m\e[32m0G backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;
        Mantra)
            mantra_source_dir="$HOME/.mantrachain/"
            cp "$HOME/BACKUP/MantraChain backup/priv_validator_key.json" "$HOME/.mantrachain/config/"
            systemctl restart mantrachaind
            echo -e "\e[1m\e[32mMantra backup files have been moved\e[0m" && sleep 1
            echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            ;;     
        *)
            echo "Invalid node name..."
            ;;
    esac
}


function view_priv() {
    echo -e "\e[1m\e[32mOpen priv_validator_key in text format to save in text format.\e[0m"
    read -p "Enter the name of the node (Lava, Nibiru, Warden, OG, Mantra, Babylon): " node_name
    case "$node_name" in
        Lava)
            printColor green "▼ Lava ▼"
            cat "$HOME/.lava/config/priv_validator_key.json"
            ;;
        Nibiru)
            printColor green "▼ Nibiru ▼"
            cat "$HOME/.nibid/config/priv_validator_key.json"
            ;;
        Babylon)
            printColor green "▼ Babylon ▼"
            cat "$HOME/.babylond/config/priv_validator_key.json"
            ;;
        Warden)
            printColor green "▼ Warden ▼"
            cat "$HOME/.warden/config/priv_validator_key.json"
            ;; 
        OG)
            printColor green "▼ 0G ▼"
            cat "$HOME/.evmosd/config/priv_validator_key.json"
            ;;
        Mantra)
            printColor green "▼ Mantra Chain ▼"
            cat "$HOME/.mantrachain/config/priv_validator_key.json"
            ;;    
        *)
            echo "Invalid node name..."
            ;;
    esac
}

function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printColor blue "● Backup Validator
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Backup nodes                         │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Backup transfer                      │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Open file priv_validator_key.json    │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
            1)
                backup
                ;;
            2)
                move_backup_files
                ;;
            3)
                view_priv
                ;;
            0)
                echo ""
                echo "You have exited the menu." 
                break
                ;;
            *)
                printColor red "Incorrect choice. Try again..."
                ;;
        esac
        read -p "Press Enter to return main menu..."
    done
}

main_menu
