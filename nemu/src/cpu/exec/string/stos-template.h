#include "cpu/exec/template-start.h"

#define instr stos

make_helper( concat(stos_,SUFFIX) ) {
	MEM_W(cpu.edi, REG(R_EAX));
	if(cpu.DF) cpu.edi -= DATA_BYTE;
	else cpu.edi += DATA_BYTE;
	print_asm(str(instr) str(SUFFIX) );
	return 1;
}

#include "cpu/exec/template-end.h"
