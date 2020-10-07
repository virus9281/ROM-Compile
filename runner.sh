#!/bin/bash

git clone https://${GITAUTH}@github.com/n00b-Dev-Stuffs/google-git-cookies.git
bash google-git-cookies/setup_cookies.sh;rm -rf google-git-cookies

repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q --depth 1 --groups all,-notdefault,-device,-darwin,-x86,-mips
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
git clone https://github.com/krishiv8190/device_xiaomi_sakura device/xiaomi/sakura
git clone https://github.com/mahajant99/vendor_xiaomi vendor/xiaomi
git clone https://github.com/darkhz/revvz_sakura kernel/xiaomi/msm8953
export USE_CCACHE=1
ccache -M 20G
source brunch sakura
curl -sL https://git.io/file-transfer | sh
./transfer wet out/target/product/sakura/RROS*
