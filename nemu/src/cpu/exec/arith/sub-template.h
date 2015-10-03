#include "cpu/exec/template-start.h"

#define instr sub

#if DATA_BYTE == 2 || DATA_BYTE ==4
static void do_execute() {
	DATA_TYPE result = op_dest->val - op_src->val;
	OPERAND_W(op_dest, result);

	//wait my EFLAGS;
	//setEFLAGS_CPAZSO((uint32_t)op_dest->val,(uint32_t)op_src->val);

	print_asm_template2();
}
#endif

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
