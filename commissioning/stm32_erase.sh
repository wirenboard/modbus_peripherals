#!/bin/bash

RET=`openocd -f interface/stlink-v2.cfg -f target/stm32f0x.cfg -c "init" -c "reset halt" -c "stm32f0x mass_erase 0" -c "exit"`

exit $RET
