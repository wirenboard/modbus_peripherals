#!/bin/bash

PORT=/dev/ttyUSB0
ADDR=$1

function set_rgb {
    modbus_client  -mrtu $PORT -t0x10 -a$ADDR -r0x00 $1 $2 $3
}


echo "Setting address $ADDR via broadcast command..."
modbus_client  -mrtu $PORT -t0x06 -a0x00 -r0x80 $ADDR

echo "Verifying address $ADDR"
modbus_client  -mrtu $PORT -t0x06 -a$ADDR -r0x80 $ADDR


echo "Set B=FF G=00 R=00"
set_rgb 0xff 0x00 0x00
sleep 2

echo "Set B=00 G=FF R=00"
set_rgb 0x00 0xff 0x00

sleep 2

echo "Set B=00 G=00 R=FF"
set_rgb 0x00 0x00 0xff
sleep 2

echo "Set B=0A G=0A R=0A"
set_rgb 0x0A 0x0A 0x0A


printf -v ADDR_HEX "%x" "$ADDR"
echo "========================"
echo "  Module address:  $ADDR (DEC) == 0x${ADDR_HEX} (HEX)"
