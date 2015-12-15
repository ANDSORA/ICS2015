#include "cpu/exec/helper.h"
#include "cpu/decode/modrm.h"

make_helper(nop) {
	print_asm("nop");
	return 1;
}

make_helper(int3) {
	void do_int3();
	do_int3();
	print_asm("int3");

	return 1;
}

make_helper(lea) {
	ModR_M m;
	m.val = instr_fetch(eip + 1, 1);
	int len = load_addr(eip + 1, &m, op_src);
	reg_l(m.reg) = op_src->addr;

	print_asm("leal %s,%%%s", op_src->str, regsl[m.reg]);
	return 1 + len;
}

make_helper(cld) {
	cpu.DF = 0;
	print_asm("cld");
	return 1;
}

make_helper(std) {
	cpu.DF = 1;
	print_asm("std");
	return 1;
}

make_helper(lgdt) {
	uint32_t len = decode_rm_l(eip + 1);
	//swaddr_t addr = instr_fetch(eip + 2, 4);
	cpu.gdtr.limit = instr_fetch(op_src->val, 2);//buggy?
	cpu.gdtr.base = instr_fetch(op_src->val + 2, 4);//buggy?
	printf("len=%x addr=%x limit=%x base=%x\n",len,op_src->val,cpu.gdtr.limit,cpu.gdtr.base);
	print_asm("lgdt 0x%x:0x%x", cpu.gdtr.limit, cpu.gdtr.base);
	return len + 1;
}
