#include "cpu/exec/template-start.h"

#define instr movsx

#if DATA_BYTE == 4
make_helper(concat(movsx_rmw2r_, SUFFIX)) {
	int len = concat(decode_rmw2r_, SUFFIX)(eip + 1);
	DATA_TYPE_S result = (((DATA_TYPE_S)op_src->val) <<16) >>16;
	OPERAND_W(op_dest, result);

	print_asm("movsw" str(SUFFIX) " %s,%s", op_src->str, op_dest->str);
	return len+1;
}
#endif

make_helper(concat(movsx_rmb2r_, SUFFIX)) {
	int len = concat(decode_rmb2r_, SUFFIX)(eip + 1);
	DATA_TYPE_S result = (((DATA_TYPE_S)op_src->val) <<((DATA_BYTE-1)<<3) ) >>((DATA_BYTE-1)<<3);
	OPERAND_W(op_dest, result);

	print_asm("movsb" str(SUFFIX) " %s,%s", op_src->str, op_dest->str);
	return len+1;
}

#include "cpu/exec/template-end.h"
