#!/bin/bash

git clone https://${GITAUTH}@github.com/n00b-Dev-Stuffs/google-git-cookies.git
bash google-git-cookies/setup_cookies.sh;rm -rf google-git-cookies

repo init -u https://github.com/Evolution-X/manifest -b ten  --depth 1 --groups all,-notdefault,-device,-darwin,-mips
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

export USE_CCACHE=1
ccache -M 20G
source build/envsetup.sh && lunch aosp_sakura-user && mka bacon -j$(nproc --all)
curl -sL https://git.io/file-transfer | sh
./transfer wet out/target/product/sakura/Evolution*