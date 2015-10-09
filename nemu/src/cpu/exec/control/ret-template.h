#include "cpu/exec/template-start.h"

#define instr ret

#if DATA_BYTE == 4
make_helper(ret_l){
	cpu.eip = MEM_R(REG(R_ESP))-1;
	REG(R_ESP) += DATA_BYTE;//we call it "pop"

	print_asm("ret");

	return 1;
}
#endif

#include "cpu/exec/template-end.h"