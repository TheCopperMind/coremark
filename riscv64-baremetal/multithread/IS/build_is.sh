riscv64-unknown-elf-gcc -v -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S is.c
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o is.o is.s

# Link against the soft-float library functions
#
riscv64-unknown-elf-ld -m elf32lriscv -o is.out -T ../link_map.txt ../init.o is.o ../../lib/*.o

# Dump a map file
#
riscv64-unknown-elf-objdump -D -s is.out > is.dump

# Generate a hex file for the FPGA
#
elf2hex --bit-width 32 --input is.out --output is.hex