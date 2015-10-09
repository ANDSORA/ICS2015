#include "cpu/exec/template-start.h"

#define instr jcc

#if DATA_BYTE == 1 || DATA_BYTE == 4
static void concat(je_execute_,SUFFIX)() {
	if(cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("je\t0x%x",cpu.eip+DATA_BYTE+1);}
static void concat(jbe_execute_,SUFFIX)() {
	if(cpu.CF==1||cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("jbe\t0x%x",cpu.eip+DATA_BYTE+1);}


make_helper(concat(je_si_,SUFFIX)){
	return idex(eip,concat(decode_si_,SUFFIX),concat(je_execute_,SUFFIX));}
make_helper(concat(jbe_si_,SUFFIX)){
	return idex(eip,concat(decode_si_,SUFFIX),concat(jbe_execute_,SUFFIX));}

#endif

#include "cpu/exec/template-end.h"
