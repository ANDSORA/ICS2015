#include "cpu/exec/template-start.h"

#define instr ret

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_helper( concat(ret_, SUFFIX) ){
	cpu.eip = MEM_R(cpu.esp, R_SS)-1;
	if(DATA_BYTE==2) cpu.eip &= 0xffff;
	cpu.esp += DATA_BYTE;//we call it "pop"

	print_asm("ret");
	return 1;
}

make_helper( concat(ret_i_, SUFFIX) ){
	uint16_t result = instr_fetch(eip+1,2);
	concat(ret_, SUFFIX)(eip);
	cpu.eip -= 2;
	cpu.esp += result;
	return 3;
}
#endif

#include "cpu/exec/template-end.h"
