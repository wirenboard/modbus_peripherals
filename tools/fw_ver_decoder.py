#!/usr/bin/python
import sys

def decode_fw_ver(in_str):
    chars = [chr(int(x, 16)) for x in in_str.strip().split()]
    fw_ver_str = "".join((c if c != '\x00' else ' ') for c in chars)
    return fw_ver_str

def main():
    if len(sys.argv) != 2:
        print 'USAGE: ./fw_ver_decoder.py "<hex numbers>" \n e.g. "0x004d 0x0061 0x0072 0x0020 0x0032 0x0035 0x0020 0x0032 0x0030 0x0031 0x0035 0x0000 0x0031 0x0033 0x003a 0x0034 0x0039 0x003a 0x0033"'
        return

    in_str = sys.argv[1]
    print decode_fw_ver(in_str)

if __name__ == '__main__':
    main()
