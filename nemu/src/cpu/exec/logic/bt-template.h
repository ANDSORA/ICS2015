#include "cpu/exec/template-start.h"

#define instr bt

static void do_execute () {
	if(op_dest->type == OP_TYPE_REG){
		assert(op_src->val < 32);
		cpu.CF = (op_dest->val >> op_src->val) & 1;
	}
	else{
		assert(op_dest->type == OP_TYPE_MEM);
		uint32_t addr_offset = ( (int)op_src->val ) >> 3;
		uint8_t bit_offset = op_src->val & 0x7;
		uint8_t data = swaddr_read(op_dest->addr + addr_offset, 1, R_DS);
		cpu.CF = (data >> bit_offset) & 1;
	}
	print_asm_template2();
}

make_instr_helper(r2rm)
make_instr_helper(rm_imm)

#include "cpu/exec/template-end.h"
