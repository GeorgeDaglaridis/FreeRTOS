MEMORY
{
    FLASH : ORIGIN = 0x0, LENGTH = 0x20000 /* (128 kB) */
    RAM   : ORIGIN = 0x20000000, LENGTH = 0x2000 /* (8 kB) */
}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > FLASH

    __StackTop = ORIGIN(RAM) + LENGTH(RAM);
    PROVIDE(__stack = __StackTop - 4);
}
