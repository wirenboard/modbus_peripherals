#!/bin/bash

STLINK_CONFIG="interface/stlink-v2.cfg"
TARGET_CONFIG="$(dirname "$0")/gd32e230.cfg"
UUID_REG="0x1ffff7ac"


function read_uuid () {
  ret=$(openocd -f $STLINK_CONFIG -f $TARGET_CONFIG -c "reset_config srst_only srst_nogate connect_assert_srst" -c "init" -c "reset halt" -c "mdw $UUID_REG" -c "halt" -c "exit" 2>&1 >/dev/null | grep "$UUID_REG: " | sed "s/$UUID_REG: //")
  echo $ret
}


read_uuid
