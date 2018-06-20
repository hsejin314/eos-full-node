## eos node 간편 설치법
pre-builded 컨테이너 이미지를 통한 간단한 EOS 풀노드 설치방법
참고자료 : https://github.com/EOSIO/eos/wiki/Local-Environment

# 시스템 요구사항
- 8GB RAM free required
- 20GB Disk free required
- Ubuntu 18.04 recommended 

# 0. lxd 설치

```console
# LXD client 설치
apt install lxd lxd-client
# lxd 초기설정 
sudo lxd init
# EOS 풀노드 container를 위한 초기설정 가이드
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
참고자료 :  https://linuxcontainers.org/ko/lxd/getting-started-cli/


# 1. eos prebuilded 컨데이너 이미지파일 다운로드

```console
git clone https://github.com/acroeos/Googledrive_API ~/eos && cd eos
python3 google_request.py 18YXnq0doZBRD8-y4UD1TJCMooJrAEWJh ~/eos/eos-node105.tar.gz
  약 ~5분정도의 시간이 소요되니 기다려주세요...
  '~'에서 경로문제가 발생하면 eos디렉토리까지의 경로를 입력해주세요
```

# 2. Launch container 

```console
# lxd이미지 파일 추출
lxc image import eos-node105.tar.gz --alias eos-node-img
# lxd 시작
lxc launch eos-node-img eos-node
lxc start eos-node #(if lxc is stopped)
# 컨데이너 접속 (계정 이름: eos)
lxc exec eos-node -- su - eos
```

# 3. 시간동기화 필요 

```console
sudo timedatectl set-ntp no
# Check if default timesyncd is off
timedatectl
sudo apt-get install ntp
# Check if ntp is fine
sudo ntpq -p
```

# 4. nodeos 실행

```console
cd ~/eos-full-node

./start.sh --delete-all-blocks --genesis-json genesis.json
# 아래 명령어를 통해 로그를 확인 할 수 있습니다..
tail -f stderr.txt
```

# 5. 리싱크

```console
# Hard resync
./start.sh --delete-all-blocks --genesis-json genesis.json
tail -F stderr.txt
```

