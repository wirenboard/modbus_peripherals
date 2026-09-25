#!/bin/bash

# Защиту (FAP + аппаратный вотчдог) на AT32 ставит сам загрузчик на первой загрузке
# после того, как устройство приняло прошивку. Здесь lock не делаем: под FAP уже
# не отработает flash_set_boot_memory_as_extension(), и 28 КБ boot memory будут
# потеряны навсегда, а брак с линии станет нечем перешить.

STLINK_CONFIG="interface/stlink-v2.cfg"
TARGET_CONFIG="target/at32f422xx.cfg"


# connect_assert_srst обязателен: загрузчик уводит PA13 (SWDIO) под перемычку
# force mode, и без удержания NRST программатор до чипа не достучится
function flash () {
  openocd -f $STLINK_CONFIG -f $TARGET_CONFIG -c "reset_config srst_only srst_nogate connect_assert_srst" -c "program $1 verify 0x8000000" -c "halt" -c "exit"
}


if [ $# -ne 1 ]
  then
    echo "Usage: $0 /path/to/firmware.bin"
    exit 2
  else
    flash $1
    exit $?
fi
