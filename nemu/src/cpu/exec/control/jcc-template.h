#include "cpu/exec/template-start.h"

#if DATA_BYTE == 1 || DATA_BYTE == 4
#if instr == je
static void concat3(instr,_execute_,SUFFIX)() {
	if(cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("je\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jbe
static void concat3(instr,_execute_,SUFFIX)() {
	if(cpu.CF==1||cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("jbe\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jle
static void concat3(instr,_execute_,SUFFIX)() {
	if(cpu.SF!=cpu.OF||cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("jle\t0x%x",cpu.eip+DATA_BYTE+1);}
#endif

make_helper(concat3(instr,_si_,SUFFIX)){
	return idex(eip,concat(decode_si_,SUFFIX),concat3(instr,_execute_,SUFFIX));
}
#endif

#include "cpu/exec/template-end.h"
