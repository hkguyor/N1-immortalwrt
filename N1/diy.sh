#!/bin/bash

# Default IP
# sed -i 's/192.168.1.1/192.168.50.99/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic

# Update packages
cp -fr package/amlogic/luci-app-amlogic feeds/luci/applications/

# Clean packages
rm -rf package/amlogic

cat >> package/base-files/files/etc/uci-defaults/99-custom <<EOF
uci set system.@system[0].hostname='NoneWrt'
uci commit system

uci set network.lan.ipaddr='192.168.50.99'  
uci set network.lan.gateway='192.168.50.1'   
uci add_list network.lan.dns='192.168.50.1'
uci commit network

uci del dhcp.lan.ra
uci del dhcp.lan.ra_slaac
uci del dhcp.lan.ra_flags
uci del dhcp.lan.max_preferred_lifetime
uci del dhcp.lan.max_valid_lifetime
uci set dhcp.lan.ignore='1'
uci commit dhcp

uci del firewall.cfg01e63d.synflood_protect
uci commit firewall

exit 0
EFO
