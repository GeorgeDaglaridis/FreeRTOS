PROJ=boot
CPU ?=cortex-m3
BOARD ?=stm32vldiscovery

OBJ = boot.o

.PHONY: all
all: $(PROJ).elf

%.o: %.S
	@echo "here 2"
	arm-none-eabi-as -mthumb -mcpu=$(CPU) -g -c $^ -o $@

$(PROJ).elf: $(OBJ)
	@echo "here 1"
	arm-none-eabi-ld -Tmap.ld $^ -o $@
	arm-none-eabi-objdump -D -S $@ > $@.lst
	arm-none-eabi-readelf -a $@ > $@.debug

qemu:
	qemu-system-arm -S -M $(BOARD) -cpu $(CPU) -nographic -kernel \
	$(PROJ).elf -gdb tcp::1234

gdb:
	gdb-multiarch -q $(PROJ).elf -ex "target remote localhost:1234"

clean:
	rm -rf *.o *.elf *.debug *.lst *.gdb_history