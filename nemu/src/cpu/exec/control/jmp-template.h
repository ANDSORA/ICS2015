#include "cpu/exec/template-start.h"

#define instr jmp

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_helper( concat(jmp_rm_, SUFFIX) ) {
	int len = concat(decode_rm_, SUFFIX)(eip+1);
	cpu.eip = op_src->val-len-1;
	if(DATA_BYTE==2){
		cpu.eip &= 0xffff;
	}

	print_asm(str(instr) "\t0x%x",cpu.eip+len+1);
	return len+1;
}
#endif

make_helper( concat(jmp_si_, SUFFIX) ) {
	int len = concat(decode_si_, SUFFIX)(eip+1);
	cpu.eip += op_src->val;
	if(DATA_BYTE==2){
		cpu.eip &= 0xffff;
	}

	print_asm(str(instr) "\t0x%x",cpu.eip+len+1);
	return len+1;
}

#include "cpu/exec/template-end.h"
