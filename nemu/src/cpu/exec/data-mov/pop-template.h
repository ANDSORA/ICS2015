#include "cpu/exec/template-start.h"

#define instr pop

static void do_execute() {
	//op_src->val = MEM_R( REG(R_ESP) );
	OPERAND_W(op_src, MEM_R(REG(R_ESP)) );
	REG(R_ESP) += DATA_BYTE;

	print_asm_template1();
}

#if DATA_BYTE == 2 || DATA_BYTE == 4
make_instr_helper(rm)
make_instr_helper(r)
#endif

#include "cpu/exec/template-end.h"
