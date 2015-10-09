#include "cpu/exec/template-start.h"

#define instr leave

#if DATA_BYTE == 4
make_helper(leave_l){
	REG(R_ESP) = REG(R_EBP);
	REG(R_EBP) = MEM_R(REG(R_ESP));
	REG(R_ESP) -= DATA_BYTE;

	print_asm("leave");

	return 1;
}
#endif

#include "cpu/exec/template-end.h"
