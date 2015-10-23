BitcoinAutoNode
===============

A script to run (ideally just after starting up a new server/vps) to automatically setup `bitcoind` and have it start on boot.

This script runs `bitcoind` under the `bitcoin` user. An alias (`btc`) is added to the current user's `.bashrc`. Where you'd normally type `bitcoin-cli` you can type `btc`, eg: `btc getinfo`.

It has been tested on Ubuntu Server 14.04 and 15.04. It is intended for use only on these distros.

One Liner
---------

    wget -q -O - https://raw.github.com/OverlordQ/BitcoinAutoNode/master/bitcoinAutoNode.sh | sudo bash

You should really check out the code before running that though.


Notes
-----

