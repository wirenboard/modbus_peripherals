#!/bin/bash

if [ $# -ne 0 ]
  then
    echo "Usage: ./stm32_unlock.sh"
    exit 1
fi

openocd -d0 -f interface/stlink-v2.cfg -f target/gd32e230.cfg -c "reset_config srst_only srst_nogate connect_assert_srst" -c "init" -c "reset halt" -c "stm32f1x unlock 0" -c "exit"