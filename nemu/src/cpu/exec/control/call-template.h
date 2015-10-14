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

static void do_execute() {
	REG(R_ESP) -= DATA_BYTE;
	MEM_W( REG(R_ESP), (DATA_TYPE)(cpu.eip+DATA_BYTE+1));
	cpu.eip += op_src->val;
	if(DATA_BYTE==2) cpu.eip = cpu.eip & 0xffff;

	print_asm("call\t0x%x",cpu.eip+DATA_BYTE+1);
}

make_instr_helper(i)

#include "cpu/exec/template-end.h"
