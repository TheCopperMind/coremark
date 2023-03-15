


# # Compile the Mandlebrot program
# #
# riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S mbrot_multithread.c
# riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o mbrot_multithread.o mbrot_multithread.s

# # Link against the soft-float library functions
# #
# riscv64-unknown-elf-ld -m elf32lriscv -o mbrot_multithread.out -T link_map.txt  mbrot_multithread.o ../lib/*.o  ../../tests/init.o

# # Dump a map file
# #
# riscv64-unknown-elf-objdump -D -s mbrot_multithread.out > mbrot_multithread.dump

# # Generate a hex file for the FPGA
# #
# elf2hex --bit-width 32 --input mbrot_multithread.out --output mbrot_multithread.hex

riscv64-unknown-elf-gcc -v -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S test_join.c
riscv64-unknown-elf-as -march=rv32im -o init.o init.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o test_join.o test_join.s

# Link against the soft-float library functions
#
riscv64-unknown-elf-ld -m elf32lriscv -o test_join.out -T link_map.txt init.o test_join.o ../lib/*.o

# Dump a map file
#
riscv64-unknown-elf-objdump -D -s test_join.out > test_join.dump

# Generate a hex file for the FPGA
#
elf2hex --bit-width 32 --input test_join.out --output test_join.hex



# # Compile the Mandlebrot program
# #
# riscv64-unknown-elf-gcc -v -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S test_prio.c
# riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o test_prio.o test_prio.s

# # Link against the soft-float library functions
# #
# riscv64-unknown-elf-ld -m elf32lriscv -o test_prio.out -T link_map.txt test_prio.o ../lib/*.o  ../../tests/init.o

# # Dump a map file
# #
# riscv64-unknown-elf-objdump -D -s test_prio.out > test_prio.dump

# # Generate a hex file for the FPGA
# #
# elf2hex --bit-width 32 --input test_prio.out --output test_prio.hex





# riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o dummy_mem.o dummy_mem.asm

# # Link against the soft-float library functions
# #
# riscv64-unknown-elf-ld -m elf32lriscv -o dummy_mem.out -T link_map.txt  dummy_mem.o 

# # Dump a map file
# #
# riscv64-unknown-elf-objdump -D -s dummy_mem.out > dummy_mem.dump

# # Generate a hex file for the FPGA
# #
# elf2hex --bit-width 32 --input dummy_mem.out --output dummy_mem.hex