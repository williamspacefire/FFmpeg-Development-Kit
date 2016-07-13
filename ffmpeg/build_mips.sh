#!/bin/bash
SYSROOT=$NDK/platforms/android-14/arch-mips/
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64
function build_one
{
./configure --prefix=$PREFIX $COMMON $CONFIGURATION --cross-prefix=$TOOLCHAIN/bin/mipsel-linux-android- --target-os=linux --arch=mips --enable-cross-compile --sysroot=$SYSROOT --extra-cflags="-Os -fpic $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS"

make clean
make -j2
make install
}

export CPU=mips
PREFIX=$(pwd)/android/$CPU 
build_one
cp Android.mk $PREFIX/Android.mk
cd $PROJECT_JNI
export ABI=$CPU
export PLATFORM="android-14"
ndk-build
cp -r "$PROJECT_LIBS/$CPU" "$PROJECT_LIBS/../out" 
cd $DIR
