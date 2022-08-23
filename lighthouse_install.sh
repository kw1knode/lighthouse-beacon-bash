#Updates
sudo apt-get update -y && sudo apt-get upgrade -y
#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#Install Dependencies 
sudo apt install -y git gcc g++ make cmake pkg-config libssl-dev

# Pull and Permissions
git clone https://github.com/sigp/lighthouse.git
cd lighthouse
make
sudo cp /$HOME/.cargo/bin/lighthouse /usr/local/bin
sudo useradd --no-create-home --shell /bin/false lighthousebeacon
sudo mkdir -p /var/lib/lighthouse/beacon-node
sudo chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse/beacon-node

#Systemctl
echo "[Unit]
Description=Lighthouse Beacon Node
After=network.target
Wants=network.target

[Service]
User=lighthousebeacon
Group=lighthousebeacon
Type=simple
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/lighthouse  beacon_node --checkpoint-sync-url https://<PROJECT-ID>:<PROJECT-SECRET>@eth2-beacon-mainnet.infura.io --datadir /var/lib/lighthouse/beacon-node --network mainnet --metrics --execution-endpoint http://localhost:8545 --execution-jwt /data/erigon/datadir/jwt.hex

[Install]
WantedBy=default.target" >> /etc/systemd/system/lighthousebeacon.service

#Run Lighthouse
sudo systemctl daemon-reload
sudo systemctl start lighthousebeacon



