#!/usr/bin/env bash
cd base
./build.sh
if [ "$?" != "0" ]; then
    exit 1
fi
cd -
cd dev
./build.sh
if [ "$?" != "0" ]; then
    exit 1
fi
cd -
cd supervisor
./build.sh
if [ "$?" != "0" ]; then
    exit 1
fi
cd -
cd guacamole-server
./build.sh
if [ "$?" != "0" ]; then
    exit 1
fi
cd -
cd gui
./build.sh
if [ "$?" != "0" ]; then
    exit 1
fi
cd -
