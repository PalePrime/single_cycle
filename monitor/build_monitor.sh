/Volumes/PerExtern/ToolsForWasm/native/clang/bin/clang --target=riscv32-none-elf -march=rv32i -mabi=ilp32 -nostdlib -O1 -fno-inline -T monitor.ld monitor.c -o monitor.o
/Volumes/PerExtern/ToolsForWasm/native/clang/bin/llvm-objdump --disassemble monitor.o
riscv64-unknown-elf-objcopy -O verilog -S --verilog-data-width 4 monitor.o monitor.list
