#!/usr/bin/env bash
kill -9 rog-control-center
sudo rm /etc/asusd/aura.ron
sudo systemctl restart asusd
