#include "cpu/exec/template-start.h"

#define instr call

/* sometimes maybe useful -ANDSORA
*static void do_execute() {
*	cpu.esp -= DATA_BYTE;
*	MEM_W(cpu.esp,cpu.eip+5);
*	cpu.eip += op_src->val;
*
*	print_asm_template1();
*}
*/

#if DATA_BYTE == 4
make_helper(call_si_l){
	int len = decode_si_l(eip+1);
	
	REG(R_ESP) -= DATA_BYTE;
	MEM_W(REG(R_ESP),eip+len+1);
	cpu.eip += op_src->val;
	print_asm_template1();

	return len+1;
}
#endif

#include "cpu/exec/template-end.h"
