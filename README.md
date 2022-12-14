# Lighthouse Beacon Node Install


========================================================
### **Install Rust** ###
Install Rust
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`


### **Pull and Permissions** ###
`git clone https://github.com/kw1knode/lighthouse.git`

`cd lighthouse`

`chmod +x lighthouse_install.sh`

### **Edit checkpoint url to a trusted source or remove to sync from genesis** ###

--checkpoint-sync-url `https://<PROJECT-ID>:<PROJECT-SECRET>@eth2-beacon-mainnet.infura.io`

Is checkpoint sync less secure?
No, in fact it is more secure! Checkpoint sync guards against long-range attacks that genesis sync does not. This is due to a property of Proof of Stake consensus known as Weak [Subjectivity](https://blog.ethereum.org/2014/11/25/proof-stake-learned-love-weak-subjectivity).

### **Edit location of jwt.hex to match your deployment, located in erigon data directory** ###

--execution-jwt `/data/erigon/datadir/jwt.hex`


### **Add flag and location of jwt.hex to erigon** ###

--authrpc.jwtsecret=`/data/erigon/datadir/jwt.hex`

### **Give read permission of jwt** ###

(Found in erigon data directory)

`chmod 774 /data/erigon/datadir/jwt.hex` 

### **Install Lighthouse** ###

`./lighthouse_install.sh`

### **Lighthouse Status** ###

`sudo journalctl -f -u lighthousebeacon.service`

### **Allow Peers** ###
```allow 9000 tcp/udp on firewall```

### **Lighthouse Grafana Dashboard** ###

https://raw.githubusercontent.com/sigp/lighthouse-metrics/master/dashboards/Summary.json

### **Official Repo** ###

https://github.com/sigp/lighthouse

### **Notes** ###
This is our merge release! All mainnet users must upgrade to this release v3.0.0 (or a subsequent release) before the Bellatrix fork on Sept 6, 2022, 11:34:47am UTC.
