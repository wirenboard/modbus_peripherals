#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage: ./stm32_program_and_lock.sh /path/to/firmware.bin"
    exit 1
fi

RET=`openocd -f interface/stlink-v2.cfg -f target/stm32f0x.cfg  -c "reset_config srst_only srst_nogate connect_assert_srst" -c "program $1 verify 0x8000000" -c "halt" -c "stm32f1x lock 0" -c "exit"`

exit $RET
