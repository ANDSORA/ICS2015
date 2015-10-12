#include "cpu/exec/template-start.h"

#if DATA_BYTE == 1 || DATA_BYTE == 4
static void concat3(instr,_execute_,SUFFIX)() {
	uint32_t addr = cpu.eip+op_src->val+DATA_BYTE+1;
	if(instr_value) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x", addr);
}

make_helper(concat3(instr,_si_,SUFFIX)){
	return idex(eip,concat(decode_si_,SUFFIX),concat3(instr,_execute_,SUFFIX));
}
#endif

#include "cpu/exec/template-end.h"
