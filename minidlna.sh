#!/bin/bash
if [ $# == 0 ];then
echo -e "\n---------------prepare file first----------------\n"
cd backup
tar vzxf ffmpeg-6.0.tar.gz -C ../
tar vxf flac-1.4.2.tar.xz -C ../
tar vjxf jpeg-6b.tar.bz2 -C ../
tar vjxf libexif-0.6.24.tar.bz2 -C ../
tar vzxf libid3tag_0.15.1b.orig.tar.gz -C ../
tar vzxf libogg-1.3.5.tar.gz -C ../
tar vzxf libvorbis-1.3.7.tar.gz -C ../
tar vzxf minidlna-1.3.2.tar.gz -C ../
tar vzxf sqlite-autoconf-3410200.tar.gz -C ../
tar vzxf zlib-1.2.11.tar.gz -C ../
cd ..
mkdir -p minidlna-deps/bin
mkdir -p minidlna-deps/lib
mkdir -p minidlna-deps/share
mkdir -p minidlna-deps/include
mkdir -p minidlna-deps/man/man1
fi

cd libexif-0.6.24
echo -e "\n\n---------------start to compile libexif----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared
make -j16; make install
cd ..

cd jpeg-6b 
echo -e "\n\n---------------start to compile jpeg----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared
make -j16; make install; make install-lib ; make install-headers
cd ..

cd zlib-1.2.11 
echo -e "\n\n---------------start to compile zlib----------------\n\n"
CROSS_PREFIX=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --prefix=/home/hewenwen/minidlna/minidlna-deps --static
make -j16; make install
cd ..

cd libid3tag-0.15.1b
echo -e "\n\n---------------start to compile libid3tag----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared
make -j16; make install
cd ..

cd libogg-1.3.5 
echo -e "\n\n---------------start to compile libogg----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared
make -j16; make install
cd ..

cd flac-1.4.2 
echo -e "\n\n---------------start to compile flac----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CXX=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ CXXFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared --with-ogg=/home/hewenwen/minidlna/minidlna-deps
make -j16; make install
cd ..

cd libvorbis-1.3.7 
echo -e "\n\n---------------start to compile vorbis----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared --with-ogg=/home/hewenwen/minidlna/minidlna-deps
make -j16; make install
cd ..

cd sqlite-autoconf-3410200
echo -e "\n\n---------------start to compile sqlite----------------\n\n"
CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/minidlna-deps --disable-shared
make -j16; make install
cd ..

cd ffmpeg-6.0
echo -e "\n\n---------------start to compile ffmpeg----------------\n\n"
./configure --prefix=/home/hewenwen/minidlna/minidlna-deps --cross-prefix=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- --pkg-config=/usr/bin/pkg-config --arch=arm --target-os=linux --disable-shared --extra-cflags=-I/home/hewenwen/minidlna/minidlna-deps/include  --extra-ldflags=-L/home/hewenwen/minidlna/minidlna-deps/lib
make -j16; make install
cd ..

# need automake 1.16.1
cd minidlna-1.3.2
echo -e "\n\n---------------start to compile minidlna----------------\n\n"
STRIP=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-strip CC=/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc CFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include CPPFLAGS=-I/home/hewenwen/minidlna/minidlna-deps/include LDFLAGS=-L/home/hewenwen/minidlna/minidlna-deps/lib LIBS="-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavcodec -lswresample -lavutil -lz -lid3tag -lFLAC -logg -lvorbis -ldl -lm" ./configure --host=arm-linux-gnu --prefix=/home/hewenwen/minidlna/output
make -j16; make install
cd ..
/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-strip output/sbin/minidlnad

