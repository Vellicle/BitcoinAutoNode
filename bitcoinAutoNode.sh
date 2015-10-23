#!/bin/bash
## Install Dependencies
echo "########### Installing Dependencies"
sudo apt-get update && apt-get dist-upgrade -y
sudo apt-get -y install build-essential automake git libboost-all-dev pkg-config libssl-dev libtool

echo "########## Creating Build Directory"
mkdir /tmp/bitcoinsrc && cd /tmp/bitcoinsrc

echo "########## Grabbing Source Code"
git clone https://github.com/bitcoin/bitcoin
cd /tmp/bitcoinsrc/bitcoin
git checkout v0.11.1

echo "########## Preparing Build"
./autogen.sh
./configure --disable-wallet --with-cli --without-gui

echo "######### Building Bitcoind"
make -j3

echo "######### Installing Bitcoind"
sudo make install

echo "######### Creating User"
sudo su -c "useradd bitnode -s /bin/bash -m -g bitnode"

echo "######## Setting up Bitcoind"
sudo -u bitnode mkdir .bitcoin
config=".bitcoin/bitcoin.conf"
sudo -u binode touch $config
echo "server=1" > $config
echo "daemon=1" >> $config
randUser=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
randPass=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
echo "rpcuser=$randUser" >> $config
echo "rpcpassword=$randPass" >> $config

echo "sudo -u bitnode bitcoind -uacomment='Infohaus'" >> /etc/rc.local
