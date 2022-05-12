#!/bin/bash

STLINK_CONFIG="interface/stlink-v2.cfg"
TARGET_CONFIG="$(dirname "$0")/gd32e230.cfg"
UID_REG="0x1ffff7ac"


function read_uid () {
  ret=$(openocd -f $STLINK_CONFIG -f $TARGET_CONFIG -c "reset_config srst_only srst_nogate connect_assert_srst" -c "init" -c "reset halt" -c "mdw $UID_REG 3" -c "halt" -c "exit" 2>&1 >/dev/null | grep "$UID_REG: " | sed "s/$UID_REG: //" | tr -d "[:space:]")
  echo $ret
}


read_uid
