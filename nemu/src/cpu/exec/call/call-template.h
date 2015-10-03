#include "cpu/exec/template-start.h"

#define instr call

#if DATA_BYTE == 2 || DATA_BYTE == 4
static void do_execute() {
	//printf("%u",eip);
	//uint32_t a=instr_fetch(eip+1,4);
	//printf("%u\n",a);
}

make_instr_helper(i)
#endif

#include "cpu/exec/template-end.h"
