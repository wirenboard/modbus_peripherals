#!/bin/bash

RET=`openocd -f interface/stlink-v2.cfg -f target/stm32g0x.cfg -c "init" -c "reset halt" -c "stm32g0x mass_erase 0" -c "exit"`

exit $RET
