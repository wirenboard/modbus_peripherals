#!/bin/bash
set -e

PORT=/dev/ttyUSB0
ADDR=$1

function set_coils {
    modbus_client  -mrtu $PORT -t0x0F -a$ADDR -r0x00 $1 $2
}


echo "Setting address $ADDR via broadcast command..."
modbus_client  -mrtu $PORT -t0x06 -a0x00 -r0x80 $ADDR

echo "Verifying address $ADDR"
modbus_client  -mrtu $PORT -t0x06 -a$ADDR -r0x80 $ADDR


echo "Set 0, 1"
set_coils 0 1
sleep 1
echo "Set 1, 0"
set_coils 1 0
sleep 1
echo "Set 1, 1"
set_coils 1 1



printf -v ADDR_HEX "%x" "$ADDR"
echo "========================"
echo "  Module address:  $ADDR (DEC) == 0x${ADDR_HEX} (HEX)"

