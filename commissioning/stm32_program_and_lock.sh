#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage: ./stm32_program_and_lock.sh /path/to/firmware.bin"
    exit 1
fi

RET=`openocd -f /usr/share/openocd/scripts/interface/stlink-v2.cfg -f /usr/share/openocd/scripts/target/stm32f0x.cfg -c "program $1 verify reset 0x8000000" -c "halt" -c "stm32f1x lock 0" -c "exit"`

exit $RET
