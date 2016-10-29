#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

if [ $# -ne 1 ]
  then
    echo "Usage: ./stm32_continuous_programming.sh /path/to/firmware.bin"
    exit 1
fi

while true; do
    read -rsp $'Connect next device and press [ENTER] to continue or Ctrl+C to exit...\n'
    ./stm32_program_and_lock.sh $1
    if [ $? -ne 0 ]
	then
	    echo -e "${RED}**********************************\n**********************************\nDevice was not programmed!\nTry again or call an engineer\n**********************************\n**********************************\n${NC}"
	else
	    echo ""
    fi
done