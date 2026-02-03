#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# ⬇️⬇️⬇️ 核心修改：使用官方推荐的最新源 (https://github.com/Openwrt-Passwall/openwrt-passwall) ⬇️⬇️⬇️
# 注意：使用 sed '1i' 命令是为了把源插入到文件的【第一行】(顶部)
# 这样能保证 PassWall 提供的 Sing-box/Xray 核心被优先使用，避免版本冲突

# 1. 引入 PassWall 的核心依赖包 (Sing-box, Xray, Geoview 等)
sed -i '1i src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' feeds.conf.default

# 插入 PassWall 核心包 (Packages) - 这一行会在最上面
sed -i '1i src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' feeds.conf.default

# ⬆️⬆️⬆️ 修改结束 ⬆️⬆️⬆️
