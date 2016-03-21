#!/bin/bash

SOURCE=/source
BUILD=$SOURCE/build
FINAL=$SOURCE/final
VENDOR=$SOURCE/vendor

VERSION_FIXBUF=1.7.1
VERSION_YAF=2.8.1
VERSION_SILK=3.11.0.1

#download
cd $VENDOR
wget http://tools.netsa.cert.org/releases/silk-${VERSION_SILK}.tar.gz
wget http://tools.netsa.cert.org/releases/libfixbuf-${VERSION_FIXBUF}.tar.gz
wget http://tools.netsa.cert.org/releases/yaf-${VERSION_YAF}.tar.gz

#libfixbuf
tar zxvf $VENDOR/libfixbuf-${VERSION_FIXBUF}.tar.gz -C $BUILD
cd $BUILD/libfixbuf-${VERSION_FIXBUF}
./configure && make && make install

#yaf
tar zxvf $VENDOR/yaf-${VERSION_YAF}.tar.gz -C $BUILD
cd $BUILD/yaf-${VERSION_YAF}
sed -i "s/date +\"\%v\"/date +\"\%Y\"/g" configure
./configure --enable-applabel --enable-plugins
make && make install

#silk
tar zxvf $VENDOR/silk-${VERSION_SILK}.tar.gz -C $BUILD
cd $BUILD/silk-${VERSION_SILK}
./configure --with-libfixbuf=/usr/local/lib/pkgconfig --enable-ipv6 --enable-localtime --with-python
make && make install

cd $FINAL
tar zcvf silk-binary.tar.gz /usr/local /usr/lib/python2.7/site-packages
