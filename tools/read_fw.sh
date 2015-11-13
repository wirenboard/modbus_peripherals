#!/bin/bash
if [[ $# != 2 ]]; then
    echo "USAGE: $0 <port> <slave_id>"
fi

modbus_client -mrtu $1 -s2 -pnone -a$2 -t0x04 -r220 -c24 | tail -n1 | cut -d':' -f2 | cut -c 2- | xargs -d'\n'  ~/work/board/modbus_peripherals/tools/fw_ver_decoder.py 