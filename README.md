## eos-full node easy-tutorial
simple and fast setup guide for running eos-full-node with pre-builded container
reference : https://github.com/EOSIO/eos/wiki/Local-Environment

# System Requirements
- 8GB RAM free required
- 20GB Disk free required
- Ubuntu 18.04 recommended 

# 1. Install lxd 

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
# install curl if you need
sudo apt install curl
# dwownload image file
curl -H "Authorization: Bearer ya29.GlvaBZCoNfik3qBrCtnuAYePRjNTZ63LDISzlihUSL21CdeCkQXYeTf76TX9psr96lu7KVJSuBEjXEfiOSj-j1CN74OsG9SKpZqYX-MmRmLAY9YOWW253VRUmi3l" https://www.googleapis.com/drive/v3/files/17MTgVbFc9pqt65r2MWs5oZH8fVukh_h-?alt=media -o EOS-fullnode_lxd_v1022.tar.gz

```

# 2. Launch container 

```console
# import as lxd image
lxc image import EOS-fullnode_lxd_v1022.tar.gz --alias eos-fullnode-img
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

```
