#include "cpu/exec/template-start.h"
#include "cpu/exec/eflags.h"

#define instr cmp

#if DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	setEFLAGS_CPAZSO((uint32_t)op_dest->val,(uint32_t)op_src->val,1);

	print_asm_template2();
}

make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
