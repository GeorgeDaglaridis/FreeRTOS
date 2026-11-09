MEMORY
{
    FLASH : ORIGIN = 0x0, LENGTH = 0x20000 /* (128 kB) */
    RAM   : ORIGIN = 0x20000000, LENGTH = 0x800
}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > FLASH
}
