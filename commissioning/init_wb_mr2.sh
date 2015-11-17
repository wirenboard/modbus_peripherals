#!/bin/bash
set -e

echo "USAGE: $0 <PORT> <SLAVE_ID>"
PORT=$1
ADDR=$2
SETTINGS="-pnone -s2"

function set_coils {
    modbus_client  -mrtu $PORT $SETTINGS -t0x0F -a$ADDR -r0x00 $1 $2
}


echo "Setting address $ADDR via broadcast command..."
modbus_client  -mrtu $PORT $SETTINGS -t0x06 -a0x00 -r0x80 $ADDR

echo "Verifying address $ADDR"
modbus_client  -mrtu $PORT $SETTINGS -t0x06 -a$ADDR -r0x80 $ADDR


echo "Setting button mode to 0"
modbus_client -mrtu -s1 -pnone $PORT $SETTINGS -a$ADDR -t0x06 -r5 0


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


echo " Please disconnect and then reconnect power supply."
read -n1 -r -p "Press any key when ready..." key


echo "Verifying address $ADDR"
modbus_client  -mrtu $PORT $SETTINGS -t0x06 -a$ADDR -r0x80 $ADDR
