#!/bin/bash

RET=`openocd -f interface/stlink-v2.cfg -f target/gd32e230.cfg -c "reset_config srst_only srst_nogate connect_assert_srst" -c "init" -c "reset halt" -c "stm32f0x mass_erase 0" -c "exit"`

exit $RET
