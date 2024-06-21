#!/bin/bash

sudo cp release/dmswitch /usr/local/bin
sudo mkdir -p /etc/dmswitch
sudo cp -r config/hooks /etc/dmswitch
sudo cp config/config.toml /etc/dmswitch
sudo cp config/dmswitch.service /etc/systemd/system
sudo systemctl enable dmswitch.service
sudo systemctl start dmswitch.service
