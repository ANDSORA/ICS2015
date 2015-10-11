#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr test

#if DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	op_dest->val = op_src->val & op_dest->val;
	setEFLAGS_LOGIC((uint32_t)op_dest->val);

	print_asm_template2();
}

make_instr_helper(r2rm)
#endif

#include "cpu/exec/template-end.h"
