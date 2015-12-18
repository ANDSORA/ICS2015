#include "cpu/exec/template-start.h"

uint32_t pio_read(ioaddr_t, size_t);

#define instr in

make_helper( concat(in_i2a_, SUFFIX) ) {
	ioaddr_t ioaddr = instr_fetch(eip + 1, 1);
	REG(R_EAX) = (DATA_TYPE)pio_read(ioaddr, DATA_BYTE); 
	print_asm("in" str(SUFFIX) " 0x%x, %%%s", ioaddr, REG_NAME(R_EAX));
	return 2;
}

make_helper( concat(in_d2a_, SUFFIX) ) {
	ioaddr_t ioaddr = cpu.dx;
	REG(R_EAX) = (DATA_TYPE)pio_read(ioaddr, DATA_BYTE);
	print_asm("in" str(SUFFIX) " 0x%x, %%%s", ioaddr, REG_NAME(R_EAX));
	return 1;
}


#include "cpu/exec/template-end.h"
