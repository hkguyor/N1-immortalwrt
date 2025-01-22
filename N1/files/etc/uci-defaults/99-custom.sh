#!/bin/sh

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

FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="ImmortalWrt 23.05.4 Compiled by hkguyor"
sed -i "s/DISTRIB_DESCRIPTION='[^']*'/DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'/" "$FILE_PATH"

exit 0
