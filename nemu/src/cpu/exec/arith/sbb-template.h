#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr sbb

static void do_execute() {
	DATA_TYPE tmp = op_src->val + cpu.CF;
	DATA_TYPE result = op_dest->val - op_src->val;

	OPERAND_W(op_dest, result);
	setEFLAGS_ALU((uint32_t)op_dest->val, (uint32_t)tmp, 1);

	print_asm_template2();
}

make_instr_helper(i2a)
make_instr_helper(i2rm)
make_instr_helper(r2rm)
make_instr_helper(rm2r)

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
