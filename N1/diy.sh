#!/bin/bash

# Default IP
# sed -i 's/192.168.1.1/192.168.50.99/g' package/base-files/files/bin/config_generate

sed -i 's/DISTRIB_DESCRIPTION=OpenWrt /DISTRIB_DESCRIPTION=ImmortalWrt 23.05.4 Compiled by hkguyor /g' package/base-files/files/etc/openwrt_release

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic

# Update packages
cp -fr package/amlogic/luci-app-amlogic feeds/luci/applications/

# Clean packages
rm -rf package/amlogic

echo -e "\e[32m$0 [DONE]\e[0m"
