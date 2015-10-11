#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr inc

static void do_execute () {
	DATA_TYPE result = op_src->val + 1;
	OPERAND_W(op_src, result);

	/* TODO: Update EFLAGS. */
	//panic("please implement me");
	bool CF_old=cpu.CF; //we don't affect CF here -ANDSORA
	setEFLAGS_ALU((uint32_t)op_src->val,1,0);
	cpu.CF=CF_old;

	print_asm_template1();
}

make_instr_helper(rm)
#if DATA_BYTE == 2 || DATA_BYTE == 4
make_instr_helper(r)
#endif

#include "cpu/exec/template-end.h"
