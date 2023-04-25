#!/bin/bash
CROSS_VAL   = "/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"
GCC_VAL     = "/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc"
STRIP_VAL   = "/home/hewenwen/rv1126/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-strip"
INCLUDE_VAL = "/home/hewenwen/minidlna/minidlna-deps/include"
LIBS_VAL    = "/home/hewenwen/minidlna/minidlna-deps/lib"
HOST_VAL    = "aarch64-linux-gnu"
PRE_VAL     = "/home/hewenwen/minidlna/minidlna-deps"
OUTPUT_VAL  = "/home/hewenwen/minidlna/output"

if [ $# == 0 ];then
echo -e "\n---------------prepare file first----------------\n"
cd backup
tar vzxf ffmpeg-6.0.tar.gz -C ../
tar vxf  flac-1.3.4.tar.xz -C ../
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
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared
make -j16; make install
cd ..

cd jpeg-6b 
echo -e "\n\n---------------start to compile jpeg----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared
make -j16; make install; make install-lib ; make install-headers
cd ..

cd zlib-1.2.11 
echo -e "\n\n---------------start to compile zlib----------------\n\n"
CROSS_PREFIX=$CROSS_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --prefix=$PRE_VAL --static
make -j16; make install
cd ..

cd libid3tag-0.15.1b
echo -e "\n\n---------------start to compile libid3tag----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared
make -j16; make install
cd ..

cd libogg-1.3.5 
echo -e "\n\n---------------start to compile libogg----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared
make -j16; make install
cd ..

cd flac-1.3.4 
echo -e "\n\n---------------start to compile flac----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CXX=$CROSS_VALg++ CXXFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared --with-ogg=$PRE_VAL
make -j16; make install
cd ..

cd libvorbis-1.3.7 
echo -e "\n\n---------------start to compile vorbis----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared --with-ogg=$PRE_VAL
make -j16; make install
cd ..

cd sqlite-autoconf-3410200
echo -e "\n\n---------------start to compile sqlite----------------\n\n"
CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL ./configure --host=$HOST_VAL --prefix=$PRE_VAL --disable-shared
make -j16; make install
cd ..

cd ffmpeg-6.0
echo -e "\n\n---------------start to compile ffmpeg----------------\n\n"
./configure --prefix=$PRE_VAL --cross-prefix=$CROSS_VAL --pkg-config=/usr/bin/pkg-config --arch=arm --target-os=linux --disable-shared --extra-cflags=-I$INCLUDE_VAL  --extra-ldflags=-L$LIBS_VAL
make -j16; make install
cd ..

# need automake 1.16.1
cd minidlna-1.3.2
echo -e "\n\n---------------start to compile minidlna----------------\n\n"
STRIP=$STRIP_VAL CC=$GCC_VAL CFLAGS=-I$INCLUDE_VAL CPPFLAGS=-I$INCLUDE_VAL LDFLAGS=-L$LIBS_VAL LIBS="-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavcodec -lswresample -lavutil -lz -lid3tag -lFLAC -logg -lvorbis -ldl -lm" ./configure --host=$HOST_VAL --prefix=$OUTPUT_VAL
make -j16; make install
cd ..
$STRIP_VAL output/sbin/minidlnad

