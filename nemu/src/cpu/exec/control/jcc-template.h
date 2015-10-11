#include "cpu/exec/template-start.h"

#if DATA_BYTE == 1 || DATA_BYTE == 4
#if instr == jo
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jo\n");
	if(cpu.OF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jno
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jno\n");
	if(cpu.OF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jb
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jb\n");
	if(cpu.CF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jae
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jae\n");
	if(cpu.CF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == je
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in je\n");
	if(cpu.ZF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jne
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jne\n");
	if(cpu.ZF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jbe
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jbe\n");
	if(cpu.CF==1||cpu.ZF==1) cpu.eip += op_src->val;
	printf("judge=%u\t0x%x\n",cpu.CF==1||cpu.ZF==1,op_src->val);
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == ja
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in ja\n");
	if(cpu.CF==0&&cpu.ZF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == js
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in js\n");
	if(cpu.SF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jns
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jns\n");
	if(cpu.SF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jp
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jp\n");
	if(cpu.PF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jnp
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jnp\n");
	if(cpu.PF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jl
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jl\n");
	if(cpu.SF!=cpu.OF) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jge
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jge\n");
	if(cpu.SF==cpu.OF) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jle
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jle\n");
	if(cpu.SF!=cpu.OF||cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("jle\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr == jg
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jg\n");
	if(cpu.SF==cpu.OF&&cpu.ZF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#endif

make_helper(concat3(instr,_si_,SUFFIX)){
	printf("get in jcc\n");
	return idex(eip,concat(decode_si_,SUFFIX),concat3(instr,_execute_,SUFFIX));
}
#endif

#include "cpu/exec/template-end.h"
