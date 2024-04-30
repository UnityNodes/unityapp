#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/UnityNodes/scripts/main/utils.sh)

function addip() {
    while true; do
        read -p "Do you want to add another server for monitoring? [Y/N]:" yn
        case $yn in
            [Yy]* )
                read -p "Enter the IP: " ip
                read -p "Enter a name to display in Grafana: " label

                cat << EOF >> $HOME/prometheus/prometheus.yml
    - targets: ['$ip:9100']
      labels:
        label: "$label"
EOF
                ;;
            [Nn]* ) break;;
            * ) echo "Please enter Y or N.";;
        esac
    done
}

function full() {
    printGreen "Update the server"
    sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install wget && sudo ufw allow 9100/tcp && sudo ufw allow 9095/tcp

    printGreen "Installing node-exporter"
    cd $HOME && \
    wget https://github.com/prometheus/node_exporter/releases/download/v1.2.0/node_exporter-1.2.0.linux-amd64.tar.gz && \
    tar xvf node_exporter-1.2.0.linux-amd64.tar.gz && \
    rm node_exporter-1.2.0.linux-amd64.tar.gz && \
    sudo mv node_exporter-1.2.0.linux-amd64 node_exporter && \
    chmod +x $HOME/node_exporter/node_exporter && \
    mv $HOME/node_exporter/node_exporter /usr/bin && \
    rm -Rvf $HOME/node_exporter/

    sudo tee /etc/systemd/system/exporterd.service > /dev/null <<EOF
[Unit]
Description=node_exporter
After=network-online.target
[Service]
User=$USER
ExecStart=/usr/bin/node_exporter
Restart=always
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload && \
    sudo systemctl enable exporterd && \
    sudo systemctl restart exporterd

    printGreen "Install Prometheus"
    wget https://github.com/prometheus/prometheus/releases/download/v2.28.1/prometheus-2.28.1.linux-amd64.tar.gz && \
    tar xvf prometheus-2.28.1.linux-amd64.tar.gz && \
    rm prometheus-2.28.1.linux-amd64.tar.gz && \
    mv prometheus-2.28.1.linux-amd64 prometheus
    wget -O $HOME/prometheus/prometheus.yml https://raw.githubusercontent.com/asapov01/Install-Grafana/main/prometheus.yml && \
    printGreen "Add the IP and enter the server name to display the servers in Grafana"
    read -p "Enter IP: " ip
    read -p "Enter a name to display in Grafana: " label

    cat << EOF >> $HOME/prometheus/prometheus.yml
scrape_configs:
  - job_name: "node_exporter"
    static_configs:
    - targets: ['$ip:9100']
      labels:
        label: "$label"
EOF

    while true; do
        read -p "Do you want to add another server for monitoring? [Y/N]:" yn
        case $yn in
            [Yy]* )
                read -p "Enter IP: " ip
                read -p "Enter a name to display in Grafana: " label

                cat << EOF >> $HOME/prometheus/prometheus.yml
    - targets: ['$ip:9100']
      labels:
        label: "$label"
EOF
                ;;
            [Nn]* ) break;;
            * ) echo "Please enter Y or N.";;
        esac
    done

    sudo systemctl restart prometheusd
    chmod +x $HOME/prometheus/prometheus
    sudo tee /etc/systemd/system/prometheusd.service > /dev/null <<EOF
[Unit]
Description=prometheus
After=network-online.target
[Service]
User=$USER
ExecStart=$HOME/prometheus/prometheus \
--config.file="$HOME/prometheus/prometheus.yml"
Restart=always
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF
    sudo sed -i '/^ExecStart=/ s/$/ --web.listen-address=":9999"/' /etc/systemd/system/prometheusd.service
    sudo systemctl daemon-reload && \
    sudo systemctl enable prometheusd && \

    printGreen "Install Grafana"
    sudo apt-get install -y adduser libfontconfig1 && \
    wget https://dl.grafana.com/oss/release/grafana_8.0.6_amd64.deb && \
    sudo dpkg -i grafana_8.0.6_amd64.deb

    sudo systemctl daemon-reload && \
    sudo systemctl enable grafana-server && \
    sudo systemctl restart grafana-server
    sudo systemctl restart prometheusd && \
    echo ""
    printGreen "Installed Node-Exporter, Prometheus, Grafana"
    printGreen "Now go to the guide and create a dashboard in Grafana"
    echo ""
}

function node_exporter() {
    printGreen "Install Node Exporter"
    sudo apt-get update && sudo apt-get upgrade -y && sudo ufw allow 9100/tcp && sudo ufw allow 9095/tcp
    cd $HOME && \
    wget https://github.com/prometheus/node_exporter/releases/download/v1.2.0/node_exporter-1.2.0.linux-amd64.tar.gz && \
    tar xvf node_exporter-1.2.0.linux-amd64.tar.gz && \
    rm node_exporter-1.2.0.linux-amd64.tar.gz && \
    sudo mv node_exporter-1.2.0.linux-amd64 node_exporter && \
    chmod +x $HOME/node_exporter/node_exporter && \
    mv $HOME/node_exporter/node_exporter /usr/bin && \
    rm -Rvf $HOME/node_exporter/

    sudo tee /etc/systemd/system/prometheusd.service > /dev/null <<EOF
[Unit]
Description=prometheus
After=network-online.target
[Service]
User=$USER
ExecStart=$HOME/prometheus/prometheus --config.file="$HOME/prometheus/prometheus.yml" --web.listen-address=":9095"
--config.file="$HOME/prometheus/prometheus.yml"
Restart=always
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload && \
    sudo systemctl enable exporterd && \
    sudo systemctl restart exporterd

    echo ""
    printLine
    echo "Check log log of node exporter - sudo journalctl -u exporterd -f"
    printLine
}


function main_menu {
    while true; do
		clear
		anima
		clear
        logo 
printColor blue "● Monitoring
│
│ ┌───┬──────────────────────────────────────┐
├─┤ 1 │ Node exporter + Prometheus + Grafana │
│ ├───┼──────────────────────────────────────┤
├─┤ 2 │ Node exporter                        │
│ ├───┼──────────────────────────────────────┤
├─┤ 3 │ Add server for monitoring            │
│ ├───┼──────────────────────────────────────┤
└─┤ 0 │ Exit                                 │
  └───┴──────────────────────────────────────┘"
read -p "Make your choice and enter the item number: ► " choice
        case "$choice" in 
		1)	
			echo ""
            printColor green "▼ List of all proposals ▼"
            echo ""
            full
            echo ""	
			;;
		2)	
			echo ""
            printColor green "▼ Check vote ▼"
            echo ""
			node_exporter
            echo ""	
			;;
		3)	
			echo ""
            addip
			;;
		
		0)
			echo ""
			echo "You have exited the menu." 
            break
            ;;
		*)	
			echo
			printColor red "Incorrect choice. Try again..."
			;;
        esac
		read -p "Press Enter to return main menu..."
	done	
}

main_menu