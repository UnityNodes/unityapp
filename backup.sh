#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

backup_node() {
    local node_name="$1"
    local source_dir="$2"
    local files_to_copy=("${@:3}")
    local backup_dir="$HOME/BACKUP/$node_name/config"
    local backup_message_printed=false

    for file_to_copy in "${files_to_copy[@]}"; do
        if [ -f "$source_dir/$file_to_copy" ]; then
            backup_message_printed=true
            break
        fi
    done

    if [ "$backup_message_printed" == true ]; then
        mkdir -p "$backup_dir" || { echo "Failed to create backup directory $backup_dir"; return; }

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
            warden_source_dir="$HOME/.warden/"
            warden_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$warden_source_dir" "${warden_files_to_copy[@]}"
            ;;
        OG)
            OG_source_dir="$HOME/.evmosd/"
            OG_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$OG_source_dir" "${OG_files_to_copy[@]}"
            ;;
        Mantra)
            mantra_source_dir="$HOME/.mantrachain/"
            mantra_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$mantra_source_dir" "${mantra_files_to_copy[@]}"
            ;;
        Lava)
            lava_source_dir="$HOME/.lava/"
            lava_files_to_copy=("config/priv_validator_key.json")
            backup_node "$node_name" "$lava_source_dir" "${lava_files_to_copy[@]}"
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
            backup_dir="$HOME/BACKUP/Lava/"
            node_source_dir="$HOME/.lava/config/"
            ;;
        Nibiru)
            backup_dir="$HOME/BACKUP/Nibiru/"
            node_source_dir="$HOME/.nibid/config/"
            ;;
        Babylon)
            backup_dir="$HOME/BACKUP/Babylon/"
            node_source_dir="$HOME/.babylond/config/"
            ;;
        Warden)
            backup_dir="$HOME/BACKUP/Warden/"
            node_source_dir="$HOME/.warden/config/"
            ;;
        OG)
            backup_dir="$HOME/BACKUP/0G/"
            node_source_dir="$HOME/.evmosd/config/"
            ;;
        Mantra)
            backup_dir="$HOME/BACKUP/MantraChain/"
            node_source_dir="$HOME/.mantrachain/config/"
            ;;
        *)
            echo "Invalid node name..."
            return
            ;;
    esac

    if [ -d "$backup_dir/$node_name/config/" ]; then
        if [ -f "$backup_dir/$node_name/config/priv_validator_key.json" ]; then
            cp "$backup_dir/$node_name/config/priv_validator_key.json" "$node_source_dir" && {
                systemctl restart "$node_name"d
                echo -e "\e[1m\e[32m$node_name backup files have been moved\e[0m" && sleep 1
                echo -e "\e[1m\e[32mAll you have to do is restore your wallet with a mnemonic phrase...\e[0m"
            } || {
                echo "Failed to move backup file."
            }
        else
            echo "Backup file priv_validator_key.json not found in $node_name backup."
        fi
    else
        echo "Backup directory for $node_name not found."
    fi
}


function view_priv() {
    echo -e "\e[1m\e[32mOpen priv_validator_key in text format to save in text format.\e[0m"
    read -p "Enter the name of the node (Lava, Nibiru, Warden, OG, Mantra, Babylon): " node_name
    case "$node_name" in
        Lava)
            printColor green "▼ Lava ▼"
            if [ -f "$HOME/.lava/config/priv_validator_key.json" ]; then
                cat "$HOME/.lava/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
            ;;
        Nibiru)
            printColor green "▼ Nibiru ▼"
            if [ -f "$HOME/.nibid/config/priv_validator_key.json" ]; then
                cat "$HOME/.nibid/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
            ;;
        Babylon)
            printColor green "▼ Babylon ▼"
            if [ -f "$HOME/.babylond/config/priv_validator_key.json" ]; then
                cat "$HOME/.babylond/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
            ;;
        Warden)
            printColor green "▼ Warden ▼"
            if [ -f "$HOME/.warden/config/priv_validator_key.json" ]; then
                cat "$HOME/.warden/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
            ;; 
        OG)
            printColor green "▼ 0G ▼"
            if [ -f "$HOME/.evmosd/config/priv_validator_key.json" ]; then
                cat "$HOME/.evmosd/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
            ;;
        Mantra)
            printColor green "▼ Mantra Chain ▼"
            if [ -f "$HOME/.mantrachain/config/priv_validator_key.json" ]; then
                cat "$HOME/.mantrachain/config/priv_validator_key.json"
            else
                echo "File not found."
            fi
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
