#!/bin/bash

pip install nose healpy # Installing python dependencies

#### Install libsharp ####
git clone https://github.com/Libsharp/libsharp.git 
cd libsharp
autoconf
./configure
make
make install
mv lib/* $TRAVIS_BUILD_DIR/
mv include/* $TRAVIS_BUILD_DIR/
mv bin/* $TRAVIS_BUILD_DIR/
export PATH=$TRAVIS_BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRAVIS_BUILD_DIR/lib:/usr/local/lib
export LDFLAGS="-L$TRAVIS_BUILD_DIR/lib -L/usr/local/lib"
export CPPFLAGS="-I$TRAVIS_BUILD_DIR/include -I/usr/local/include"

#### Install GSL2.0+ ####
wget http://mirror.rise.ph/gnu/gsl/gsl-2.4.tar.gz && tar xzf gsl-2.4.tar.gz && cd gsl-2.4 &&  ./configure && make && sudo make install && cd ..

#### Install NaMaster C ####
cd $HOME
git clone https://github.com/LSSTDESC/NaMaster.git
cd NaMaster
./configure --prefix $HOME=$TRAVIS_BUILD_DIR
make
make install