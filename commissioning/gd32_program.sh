#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage: ./stm32_program_and_lock.sh /path/to/firmware.bin"
    exit 1
fi

RET=`openocd -f interface/stlink-v2.cfg -f target/gd32e230.cfg -c "reset_config srst_only srst_nogate connect_assert_srst" -c "program $1 verify 0x8000000" -c "halt" -c "exit"`

exit $RET