#include "cpu/exec/template-start.h"

#define instr call

#if DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	int x=op_src->val;
	if(DATA_BYTE==2)x=(x<<16)>>16;
	cpu.eip += x;
}

make_instr_helper(i)
#endif

#include "cpu/exec/template-end.h"
