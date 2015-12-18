#include "cpu/exec/template-start.h"

void pio_write(ioaddr_t, size_t, uint32_t);

#define instr out

make_helper( concat(out_a2i_, SUFFIX) ) {
	ioaddr_t ioaddr = instr_fetch(eip + 1, 1);
	pio_write(ioaddr, DATA_BYTE, REG(R_EAX));
	print_asm("out" str(SUFFIX) " %%%s,0x%x", REG_NAME(R_EAX), ioaddr);
	return 2;
}

make_helper( concat(out_a2d_, SUFFIX) ) {
	ioaddr_t ioaddr = cpu.dx;
	pio_write(ioaddr, DATA_BYTE, REG(R_EAX));
	print_asm("out" str(SUFFIX) " %%%s, 0x%x", REG_NAME(R_EAX), ioaddr);
	return 1;
}


#include "cpu/exec/template-end.h"
