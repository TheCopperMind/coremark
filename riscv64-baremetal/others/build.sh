# Compile the Mandlebrot program
#
riscv64-unknown-elf-gcc -v -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S test_threads.c
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o test_threads.o test_threads.s

# Link against the soft-float library functions
#
riscv64-unknown-elf-ld -m elf32lriscv -o test_threads.out -T link_map.txt test_threads.o ../lib/*.o 

# Dump a map file
#
riscv64-unknown-elf-objdump -D -s test_threads.out > test_threads.dump

# Generate a hex file for the FPGA
#
elf2hex --bit-width 32  --input test_threads.out --output test_threads.hex
