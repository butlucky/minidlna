ENV_CONFIG="CROSS_PREFIX=~/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- \
CC=~/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc \
CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include \
CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib"

$ENV_CONFIG ./configure --host=aarch64-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared --with-ogg=/home/hewenwen/minidlna/minidlna-deps/


