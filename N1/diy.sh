#!/bin/bash

# Default IP
# sed -i 's/192.168.1.1/192.168.50.99/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic

# Update packages
cp -fr package/amlogic/luci-app-amlogic feeds/luci/applications/

# Clean packages
rm -rf package/amlogic

echo "src/gz openwrt_kiddin9 https://dl.openwrt.ai/latest/packages/aarch64_cortex-a53/kiddin9" >> package/system/opkg/files/customfeeds.conf

sed -i "s/DISTRIB_DESCRIPTION='[^']*'/DISTRIB_DESCRIPTION='ImmortalWrt 23.05.4 Compiled by hkguyor'/" package/base-files/files/etc/openwrt_release

echo -e "\e[32m$0 [DONE]\e[0m"
