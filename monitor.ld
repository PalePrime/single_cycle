/* Thanks https://github.com/darklife/darkriscv */
  __heap_size   = 0x200;  /* required amount of heap */
  __stack_size  = 0x800;  /* required amount of stack */

  MEMORY
  {
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 0x01000
  }
  SECTIONS
  {
    .text :
    {
      *(.boot)
      *(.text)
      *(.text)
      . = ALIGN(4);
    } > RAM
    .data :
    {
      . = ALIGN(4);
      *(.rodata*)
      *(.sbss)
      *(.data)
      *(.bss)
      *(COMMON)
    } > RAM

  }
                        