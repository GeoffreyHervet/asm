#!/bin/sh

nasm -f elf64 *.S -o ok.o -g3  && gcc ok.o -g3 && ./a.out
