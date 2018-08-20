#!/bin/bash

# Install chealpix

wget https://sourceforge.net/projects/healpix/files/Healpix_3.11/autotools_packages/chealpix-3.11.4.tar.gz && tar xzf chealpix-3.11.4.tar.gz && cd chealpix-3.11.4 && ./configure --enable-shared && make && sudo make install && cd ..
# Install healpy and nose

pip install nose healpy

#### Install libsharp ####
git clone https://github.com/Libsharp/libsharp.git 
cd libsharp
autoconf -i
./configure --enable-pic
make
make install
export PATH=`pwd`/auto/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/auto/lib:/usr/local/lib
export LDFLAGS="-L`pwd`/auto/lib -L/usr/local/lib"
export CPPFLAGS="-I`pwd`/auto/include -I/usr/local/include"

#### Install GSL2.0+ ####
wget http://mirror.rise.ph/gnu/gsl/gsl-2.4.tar.gz && tar xzf gsl-2.4.tar.gz && cd gsl-2.4 &&  ./configure --enable-shared && make && sudo make install && cd ..

#### Install NaMaster C ####
cd $HOME
git clone https://github.com/LSSTDESC/NaMaster.git
cd NaMaster
./configure --prefix $HOME=$TRAVIS_BUILD_DIR
make
make install
