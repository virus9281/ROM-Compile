FROM ubuntu:latest
ADD https://storage.googleapis.com/git-repo-downloads/repo transfer telegram /bin/
RUN chmod a+x /bin/repo;chmod a+x /bin/transfer; chmod a+x /bin/telegram
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8 USE_CCACHE=1
RUN apt-get update; apt-get install -y --no-install-recommends \
    adb autoconf automake axel bc bison build-essential \
    ccache clang cmake expat fastboot flex g++ \
    g++-multilib gawk gcc gcc-multilib git gnupg gperf \
    htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev \
    libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev \
    libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop \
    maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
    pngquant python2.7 python-all-dev re2c schedtool squashfs-tools subversion \
    texinfo unzip w3m xsltproc zip zlib1g-dev lzip \
    libxml-simple-perl apt-utils curl wget \
    libncurses5 python-is-python3 openssh-server; \
    apt-get update; rm -rf /var/lib/apt/lists/*

WORKDIR /evox
RUN repo init -u https://github.com/Evolution-X/manifest -b ten --depth 1
RUN repo sync --force-sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc)