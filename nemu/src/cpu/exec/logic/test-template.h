#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr test

static void do_execute() {
	DATA_TYPE result = op_src->val & op_dest->val;
	setEFLAGS_LOGIC((uint32_t)result,DATA_BYTE);

	print_asm_template2();
}

make_instr_helper(i2a)
make_instr_helper(i2rm)
make_instr_helper(r2rm)

#include "cpu/exec/template-end.h"
