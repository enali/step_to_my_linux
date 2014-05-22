#!/bin/bash
if [ "$#" = 1 ]; then
    WKDIR=$1
else
    printf "Usage:  <./clang.sh workdir>\n"
    exit 1
fi
#1. Get the required tools
#2. Checkout LLVM
svn co http://llvm.org/svn/llvm-project/llvm/trunk $WKDIR/llvm
#3. Checkout Clang
svn co http://llvm.org/svn/llvm-project/cfe/trunk $WKDIR/llvm/tools/clang
#4. Checkout extra Clang Tools:(optional)
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk $WKDIR/llvm/tools/clang/tools/extra
#5. Checkout Compiler-RT
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk $WKDIR/llvm/projects/compiler-rt
#6. Build LLVM and Clang
cd $WKDIR/llvm && mkdir build && cd build
../configure --enable-optimized CC=/usr/bin/gcc CXX=/usr/bin/g++
make && sudo make install
#7. Build libc++.so
svn co http://llvm.org/svn/llvm-project/libcxx/trunk $WKDIR/libcxx
cd $WKDIR/libcxx/lib
./buildit
sudo cp libc++.so.1.0 /usr/lib/
sudo ln -s /usr/lib/libc++.so.1.0 /usr/lib/libc++.so.1
sudo ln -s /usr/lib/libc++.so.1.0 /usr/lib/libc++.so
sudo cp -r ../include/ /usr/include/c++/v1/
#8. Build libc++abi.so
svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk $WKDIR/libcxxabi
cd $WKDIR/libcxxabi/lib
./buildit
sudo cp libc++abi.so.1.0 /usr/lib/
sudo ln -s /usr/lib/libc++abi.so.1.0 /usr/lib/libc++abi.so.1
sudo ln -s /usr/lib/libc++abi.so.1.0 /usr/lib/libc++abi.so
sudo cp -r ../include/ /usr/include/c++/v1/
