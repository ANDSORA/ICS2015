#include "cpu/exec/template-start.h"

#define instr movs

make_helper( concat(movs_,SUFFIX) ) {
	MEM_W(cpu.edi, MEM_R(cpu.esi, R_DS), R_ES);
	if(cpu.DF){
		cpu.edi -= DATA_BYTE;
		cpu.esi -= DATA_BYTE;
	}
	else{
		cpu.edi += DATA_BYTE;
		cpu.esi += DATA_BYTE;
	}
	print_asm(str(instr) str(SUFFIX));
	return 1;
}

#include "cpu/exec/template-end.h"
