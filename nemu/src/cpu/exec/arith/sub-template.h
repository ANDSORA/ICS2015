#include "cpu/exec/template-start.h"

#define instr sub

static void do_execute () {
	DATA_TYPE result = op_dest->val - op_src->simm;
	OPERAND_W(op_dest, result);

	//wait my EFLAGS;

	print_asm_template2();
}

#if DATA_BYTE == 2 || DATE_BYTE == 4
make_instr_helper(si2rm)
#endif

#include "cpu/exec/template-end.h"
