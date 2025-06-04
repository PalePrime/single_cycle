/* Thanks https://github.com/darklife/darkriscv */

  MEMORY
  {
    ROM (rwx) : ORIGIN = 0x00001000, LENGTH = 0x0400
    RAM (rwx) : ORIGIN = 0x00001400, LENGTH = 0x0400
  }
  SECTIONS
  {
    .text :
    {
      *(.boot)
      *(.text)
      *(.text)
      *(.rodata*)
    } > ROM
    .data :
    {
      *(.sbss)
      *(.data)
      *(.bss)
      *(.rela*)
      *(COMMON)
    } > RAM
  }
                        