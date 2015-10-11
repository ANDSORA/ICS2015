#include "cpu/exec/template-start.h"

#if DATA_BYTE == 1 || DATA_BYTE == 4
#if instr_num == 1
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jo\n");
	if(cpu.OF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 2
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jno\n");
	if(cpu.OF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 3
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jb\n");
	if(cpu.CF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 4
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jae\n");
	if(cpu.CF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 5
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in je\n");
	if(cpu.ZF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 6
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jne\n");
	if(cpu.ZF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 7
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jbe\n");
	if(cpu.CF==1||cpu.ZF==1) cpu.eip += op_src->val;
	printf("judge=%u\t0x%x\n",cpu.CF==1||cpu.ZF==1,op_src->val);
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 8
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in ja\n");
	if(cpu.CF==0&&cpu.ZF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 9
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in js\n");
	if(cpu.SF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 10
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jns\n");
	if(cpu.SF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 11
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jp\n");
	if(cpu.PF==1) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 12
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jnp\n");
	if(cpu.PF==0) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 13
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jl\n");
	if(cpu.SF!=cpu.OF) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 14
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jge\n");
	if(cpu.SF==cpu.OF) cpu.eip += op_src->val;
	print_asm( str(instr) "\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 15
static void concat3(instr,_execute_,SUFFIX)() {
	printf("get in jle\n");
	if(cpu.SF!=cpu.OF||cpu.ZF==1) cpu.eip += op_src->val;
	print_asm("jle\t0x%x",cpu.eip+DATA_BYTE+1);}
#elif instr_num == 16
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
