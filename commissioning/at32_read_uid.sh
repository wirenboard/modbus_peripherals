#!/bin/bash

# UID у AT32F422 - 96 бит по 0x1FFFF7E8 (UID_BASE в libwbmcu-system/include/at32f422.h),
# у GD32E230 он лежит по другому адресу, поэтому скрипт отдельный.

STLINK_CONFIG="interface/stlink-v2.cfg"
TARGET_CONFIG="target/at32f422xx.cfg"
UID_REG="0x1ffff7e8"


function read_uid () {
  ret=$(openocd -f $STLINK_CONFIG -f $TARGET_CONFIG -c "reset_config srst_only srst_nogate connect_assert_srst" -c "init" -c "reset halt" -c "mdh $UID_REG 6" -c "halt" -c "exit" 2>&1 >/dev/null | grep "$UID_REG: " | sed "s/$UID_REG: //" | tr -d "[:space:]")
  echo $ret
}


read_uid
