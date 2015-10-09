#include "cpu/exec/template-start.h"

#define instr jmp

#if DATA_BYTE == 1
static void do_execute() {
	cpu.eip+=op_src->val;

	print_asm_template1();
}

make_instr_helper(si)
#endif

#include "cpu/exec/template-end.h"
