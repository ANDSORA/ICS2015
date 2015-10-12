#include "cpu/exec/template-start.h"

#define instr movzx



make_helper(concat(movzx_rmb2r_, SUFFIX)) {
	int len = concat(decode_rmb2r_, SUFFIX)(eip + 1);
	OPERAND_W(op_dest, (DATA_TYPE)op_src->val);

	print_asm("movzb" str(SUFFIX) " %s,%s", op_src->str, op_dest->str);
	return len+1;
}


#include "cpu/exec/template-end.h"
