#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright © %YEAR% %USER% <%MAIL%>

from pwn import *
import sys

skip_ip=[]
context.log_level="debug"
pwn_file="./pwn"
elf=ELF(pwn_file)
#libc=ELF("./libc.so.6")
#heap_add=0
#stack_add=0
timeout=30
PORT=1234
pid=0

def get_cc(ip=None):
    global pid
    if ip == None:
        r=process(pwn_file)
        pid=0
    else:
        r=remote(ip,PORT)
    return r

def debug():
    log.debug("process pid:%d"%pid)
    #log.debug("libc address:0x%x"%libc.address)
    #log.debug("heap add:0x%x"%heap_add)
    #log.debug("libc add:0x%x"%libc.add)
    pause()

class random_str:
    def __mul__(self,length):
        if length%8 == 0:
            ret="".join([p64(randint(0x7f56ecd12000,0x7f56ecd52000)) for _ in range(length/8)])
        elif length%4 == 0:
            ret="".join([p32(randint(0x400000,0x604000)) for _ in range(length/4)])
        else:
            ret="".join([chr(randint(0,0xff)) for _ in range(length)])
        ret=ret.replace("\n","\x01")
        return ret

A=random_str()


def exploit(ip):
    #r=remote(ip,9999)
    r=get_cc()
    return flag

if __name__ == "__main__":
    host="127.0.0.1"
    print exploit(host)




