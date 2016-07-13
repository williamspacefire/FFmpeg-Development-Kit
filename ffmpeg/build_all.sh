#!/bin/bash
export DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT="$(dirname "${DIR}")"
export NDK="$(dirname "${PARENT}")"
export PATH="$PATH:$NDK"
export PROJECT_JNI="$(dirname "${NDK}")/JNI/app/jni"
export PROJECT_LIBS="$(dirname "${NDK}")/JNI/app/libs"
#export CONFIGURATION="pass here additional configuration flags if you want to"
#export ADDI_CFLAGS="pass here additional c-flags like include I/path"
#eport ADDI_LDFLAGS="pass here additional flags like include L/path for linker"
export COMMON="--disable-static --disable-programs --disable-doc --enable-shared --enable-protocol=file"
./build_armeabi.sh
./build_armeabi-v7a.sh
./build_arm64-v8a.sh
./build_mips.sh
./build_x86.sh
