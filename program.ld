  MEMORY
  {
    RAM (rwx) : ORIGIN = 0x00001000, LENGTH = 0x0600
  }
  SECTIONS
  {
    .text :
    {
      *(.boot)
      *(.text)
      *(.rodata*)
    } > RAM
    .data :
    {
      . = ALIGN(4);
      *(.sbss)
      *(.data)
      *(.bss)
      *(.rela*)
      *(COMMON)
    } > RAM
  }
