#!/bin/bash

uci del dhcp.lan.ra
uci del dhcp.lan.ra_slaac
uci del dhcp.lan.ra_flags
uci del dhcp.lan.max_preferred_lifetime
uci del dhcp.lan.max_valid_lifetime
uci set dhcp.lan.ignore='1'
uci add_list network.lan.dns='192.168.50.1'

# Default IP
# sed -i 's/192.168.1.1/192.168.50.99/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic

# Update packages
cp -fr package/amlogic/luci-app-amlogic feeds/luci/applications/

# Clean packages
rm -rf package/amlogic
