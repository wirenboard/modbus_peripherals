#!/bin/bash

STLINK_CONFIG="interface/stlink-v2.cfg"
TARGET_CONFIG="$(dirname "$0")/gd32e230.cfg"


function flash () {
  RET=`openocd -f $STLINK_CONFIG -f $TARGET_CONFIG -c "reset_config srst_only srst_nogate connect_assert_srst" -c "program $1 verify 0x8000000" -c "halt" -c "exit"`
  return $RET
}


if [ $# -ne 1 ]
  then
    echo "Usage: $0 /path/to/firmware.bin"
    exit 2
  else
    exit $(flash $1)
fi
