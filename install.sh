#!/bin/sh

cd "$(dirname "$0")" || exit 1

if ! type btmon > /dev/null 2>&1; then
    apt update
    apt install btmon
fi

mkdir -p /opt/picom
cp picom-rssi-harvester /opt/picom
cp config /opt/picom

if type systemctl > /dev/null 2>&1; then
    cp picom-rssi-harvester.service /lib/systemd/system
    systemctl enable picom-rssi-harvester.service
    systemctl restart picom-rssi-harvester.service
fi
