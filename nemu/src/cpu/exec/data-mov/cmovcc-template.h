#include "cpu/exec/template-start.h"

static void concat3(instr,_execute_,SUFFIX)() {
	if(instr_value) OPERAND_W(op_dest,op_src->val);
	print_asm( str(instr) " %s %s",op_src->str,op_dest->str);
}

make_helper(concat3(instr,_r2rm_,SUFFIX)){
	return idex(eip,concat(decode_r2rm_,SUFFIX),concat3(instr,_execute_,SUFFIX));
}

#include "cpu/exec/template-end.h"
