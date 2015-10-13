#include "cpu/exec/template-start.h"

#define instr stos

make_helper( concat(stos_,SUFFIX) ) {
	REG(R_EDI) = REG(R_EAX);
	if(cpu.DF) REG(R_EDI) -= DATA_BYTE;
	else REG(R_EDI) += DATA_BYTE;
	print_asm(str(instr) str(SUFFIX) );
	return 1;
}

#include "cpu/exec/template-end.h"
