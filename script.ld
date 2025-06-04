/* Thanks https://github.com/darklife/darkriscv */
  __heap_size   = 0x200;  /* required amount of heap */
  __stack_size  = 0x800;  /* required amount of stack */

  MEMORY
  {
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00400
    RAM (rwx) : ORIGIN = 0x00000400, LENGTH = 0x0FB00
  }
  SECTIONS
  {
    .text :
    {
      *(.boot)
    } > ROM
    .text :
    {
      *(.text)
      *(.text)
      *(.rodata*)
    } > RAM
    .data :
    {
      . = ALIGN(4);
      *(.sbss)
      *(.data)
      *(.bss)
      *(COMMON)
    } > RAM

  }
                        