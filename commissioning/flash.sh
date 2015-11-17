#!/bin/bash

#depends on binutils-arm-linux-gnueabi
# https://github.com/texane/stlink

if [ $# -eq 0 ]; then
    echo "USAGE: $0 <firmware.hex>"
    exit 0
fi

FWBIN=`mktemp`
arm-linux-gnueabi-objcopy -Iihex -Obinary $1 $FWBIN

st-flash --reset write $FWBIN 0x08000000

rm $FWBIN
