#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage: ./stm32_read_flash.sh /path/to/output_file.bin"
    exit 1
fi

RET=`openocd -f interface/stlink-v2.cfg -f target/stm32f0x.cfg -c "init" -c "reset halt" -c "flash banks" -c "dump_image $1 0x08000000 0xf000" -c "poll" -c "exit"`

exit $RET
