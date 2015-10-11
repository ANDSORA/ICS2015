#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr add

#if DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	DATA_TYPE result = op_dest->val + op_src->val;
	OPERAND_W(op_dest, result);

	setEFLAGS_ALU((uint32_t)op_dest->val,(uint32_t)op_src->val,0);

	print_asm_template2();
}

make_instr_helper(r2rm)
make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
