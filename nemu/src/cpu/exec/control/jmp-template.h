#include "cpu/exec/template-start.h"

void Load_SR_cache(SEG_REG *);

#define instr jmp

#if DATA_BYTE == 1
make_helper(ljmp) {
	cpu.eip = instr_fetch(eip+1, 4);
	cpu.CS.val += instr_fetch(eip+5, 2);
	Load_SR_cache(&cpu.CS);
	return 7;
}

#else
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
