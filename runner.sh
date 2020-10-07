#!/bin/bash

git clone https://${GITAUTH}@github.com/n00b-Dev-Stuffs/google-git-cookies.git
bash google-git-cookies/setup_cookies.sh;rm -rf google-git-cookies

repo init -u https://github.com/AOSPA/manifest -b quartz --depth 1 --groups all,-notdefault,-device,-darwin,-mips
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

export USE_CCACHE=1
ccache -M 20G
source rom-build.sh sakura
curl -sL https://git.io/file-transfer | sh
./transfer wet out/target/product/sakura/Evolution*
