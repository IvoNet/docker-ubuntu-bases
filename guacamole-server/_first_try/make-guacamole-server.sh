#!/usr/bin/env bash

echo "Building the Apache Guacamole Server..."

cd /project

#wget "http://ftp.nluug.nl/internet/apache/guacamole/0.9.14/source/guacamole-server-0.9.14.tar.gz"
#tar -xvvf guacamole-server-0.9.14.tar.gz
#cd guacamole-server-0.9.14

git clone --depth 1  https://github.com/apache/guacamole-server.git
cd guacamole-server

autoreconf -fi
./configure --prefix="/usr/local/guacamole" --disable-guaclog
make
make install
ldconfig


#checkinstall

