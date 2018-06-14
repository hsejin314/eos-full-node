## eos-full node easy-tutorial
[한국어] (https://github.com/acroeos/eos-full-node/blob/master/READEME_kr.md)

simple and fast setup guide for running eos-full-node with pre-builded container
reference : https://github.com/EOSIO/eos/wiki/Local-Environment

# System Requirements
- 8GB RAM free required
- 20GB Disk free required
- Ubuntu 18.04 recommended 

# 0. Install lxd 

```console
# Install LXD client
apt install lxd lxd-client
# Initial configuration 
sudo lxd init
# Intitial guide for EOS container
Would you like to use LXD clustering? (yes/no) [default=no]:
Do you want to configure a new storage pool? (yes/no) [default=yes]:
Name of the new storage pool [default=default]: eosstrpool
Name of the storage backend to use (btrfs, dir, lvm) [default=btrfs]:
Create a new BTRFS pool? (yes/no) [default=yes]:
Would you like to use an existing block device? (yes/no) [default=no]:
Size in GB of the new loop device (1GB minimum) [default=15GB]:
Would you like to connect to a MAAS server? (yes/no) [default=no]:
Would you like to create a new network bridge? (yes/no) [default=yes]:
What should the new bridge be called? [default=lxdbr0]:
What IPv4 address should be used? (CIDR subnet notation, 쏿utoor 쐍one [default=auto]:
What IPv6 address should be used? (CIDR subnet notation, 쏿utoor 쐍one [default=auto]: auto
Would you like LXD to be available over the network? (yes/no) [default=no]: No
Address to bind LXD to (not including port) [default=all]:
Port to bind LXD to [default=8443]:
Trust password for new clients:
Again:
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]:
```
reference :  https://linuxcontainers.org/ko/lxd/getting-started-cli/


# 1. Download container img file

```console
git clone https://github.com/acroeos/Googledrive_API ~/eos && cd eos
python3 google_request.py 1dhWeAGdf1VG_1qrakF2XhoVCCXSNCWzm /home/cj/eos-fullnode103.tar.gz
  It will take some time...
```

# 2. Launch container 

```console
# import as lxd image
lxc image import eos-fullnode103.tar.gz --alias eos-fullnode-img
# lxd launch
lxc launch eos-fullnode-img eos-fullnode
lxc start eos-fullnode #(if lxc is stopped)
# access to container
lxc exec eos-fullnode -- su - eos
```

# 3. make time in synchronized  

```console
sudo timedatectl set-ntp no
# Check if default timesyncd is off
timedatectl
sudo apt-get install ntp
# Check if ntp is fine
sudo ntpq -p
```

# 4. run nodeos

```console
cd ~/eos-full-node

./start.sh --delete-all-blocks --genesis-json genesis.json
# You can check the logs through..
tail -f stderr.txt
```

# 5. Resync

```console

# Hard resync
./start.sh --delete-all-blocks --genesis-json genesis.json
tail -F stderr.txt
```

