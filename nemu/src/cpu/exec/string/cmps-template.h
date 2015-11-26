#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr cmps

make_helper( concat(cmps_,SUFFIX) ) {
	setEFLAGS_ALU( MEM_R(cpu.esi, R_DS), MEM_R(cpu.edi, R_ES), 1, DATA_BYTE);
	if(cpu.DF){
		cpu.esi -= DATA_BYTE;
		cpu.edi -= DATA_BYTE;
	}
	else{
		cpu.esi += DATA_BYTE;
		cpu.edi += DATA_BYTE;
	}
	
	print_asm(str(instr) str(SUFFIX) );
	return 1;
}

#include "cpu/exec/template-end.h"
