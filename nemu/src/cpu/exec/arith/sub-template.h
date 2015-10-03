#include "cpu/exec/template-start.h"

#define instr sub

#if DATA_BYTE == 2 || DATA_BYTE ==4
static void do_execute() {
	DATA_TYPE result = op_dest->val - op_src->simm;
	OPERAND_W(op_dest, result);

	//wait my EFLAGS;

	print_asm_template2();
}
#endif

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
