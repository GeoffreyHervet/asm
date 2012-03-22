#!/bin/sh

clang -c main.c -g3 && nasm -f elf64 -o tmp.o -g3 $1 && gcc main.o tmp.o && ./a.out && rm -f tmp.o main.o
