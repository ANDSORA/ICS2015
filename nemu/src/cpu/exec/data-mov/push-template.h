#include "cpu/exec/template-start.h"

#define instr push

#if DATA_BYTE == 1
make_helper(push_i_b) {
	int len=decode_i_b(eip);
	cpu.esp -= 4;
	swaddr_write(cpu.esp, 4, op_src->val);

	print_asm_template1();
	return len+1;
}
#elif DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	REG(R_ESP) -= DATA_BYTE;
	MEM_W( REG(R_ESP),  op_src->val);

	print_asm_template1();
}

make_instr_helper(i)
make_instr_helper(rm)
make_instr_helper(r)
#endif

#include "cpu/exec/template-end.h"
