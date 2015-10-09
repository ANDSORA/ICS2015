#include "cpu/exec/template-start.h"

#define instr jbe

#if DATA_BYTE == 1
static void do_execute() {
	if(cpu.CF==1||cpu.ZF==1) cpu.eip+=op_src->val;

	print_asm_template1();
}

make_instr_helper(si)
#endif

#include "cpu/exec/template-end.h"