#!/bin/bash

SYSTEMD_ROOT="/lib/systemd/system"
DYNDNS_ROOT="/etc/dyndns"

function install_dyndns_updater() {
    install -v -d ${DYNDNS_ROOT}
    install -v -m 0755 ./dyndns-update ${DYNDNS_ROOT}/

    touch ${DYNDNS_ROOT}/sites.conf
    chmod 0600 ${DYNDNS_ROOT}/sites.conf

    install -v dyndns.service ${SYSTEMD_ROOT}
    install -v dyndns.timer ${SYSTEMD_ROOT}

    systemctl daemon-reload
    systemctl enable dyndns.timer
    systemctl start --now dyndns.timer
}

if [ $EUID -ne 0 ]; then
    sudo $0 $@
else
    install_dyndns_updater $@
fi
