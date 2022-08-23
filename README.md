# Lighthouse Beacon Node Install


========================================================
### **Download lighthouse_install.sh** ###
`git clone https://github.com/kw1knode/lighthouse.git`

`cd lighthouse`

`chmod +x lighthouse_install.sh`

### **Edit checkpoint url to a trusted source or remove to sync from genesis** ###

--checkpoint-sync-url `https://<PROJECT-ID>:<PROJECT-SECRET>@eth2-beacon-mainnet.infura.io`

### **Edit location of jwt.hex to match your deployment, located in erigon data directory** ###

--execution-jwt `/data/erigon/datadir/jwt.hex`

### **Add to location of jwt.hex to your erigon deployment** ###

--authrpc.jwtsecret `/data/erigon/datadir/jwt.hex`

#### **Run install.sh**

`./lighthouse_install.sh`

### **Lighthouse Grafana Dashboard** ###

https://raw.githubusercontent.com/sigp/lighthouse-metrics/master/dashboards/Summary.json

### **Official Repo** ###

https://github.com/sigp/lighthouse
