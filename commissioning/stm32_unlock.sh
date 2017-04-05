#!/bin/bash

if [ $# -ne 0 ]
  then
    echo "Usage: ./stm32_unlock.sh"
    exit 1
fi

openocd -d0 -f /usr/share/openocd/scripts/interface/stlink-v2.cfg -f /usr/share/openocd/scripts/target/stm32f0x.cfg -c "init" -c "reset halt" -c "stm32f1x unlock 0" -c "exit"