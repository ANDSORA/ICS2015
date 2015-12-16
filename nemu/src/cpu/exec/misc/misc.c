#include "cpu/exec/helper.h"
#include "cpu/decode/modrm.h"

void raise_intr(uint8_t);

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

make_helper(Int){
	uint8_t NO = instr_fetch(eip + 1, 1);
	cpu.esp -= 4;
	swaddr_write(cpu.esp, 4, cpu.EFLAGS, R_SS);
	cpu.esp -= 4;
	swaddr_write(cpu.esp, 2, cpu.CS.val, R_SS);
	cpu.esp -= 4;
	swaddr_write(cpu.esp, 4, cpu.eip+2, R_SS);

	print_asm("int 0x%x", NO);

	raise_intr(NO);

	return 2;
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
	cpu.gdtr.limit = lnaddr_read(op_src->addr, 2);//buggy?
	cpu.gdtr.base = lnaddr_read(op_src->addr + 2, 4);//buggy?
	//printf("len=%x val=%x addr=%x limit=%x base=%x\n",len,op_src->val,op_src->addr,cpu.gdtr.limit,cpu.gdtr.base);
	print_asm("lgdt\t0x%x", op_src->addr);
	return len + 1;
}

make_helper(lidt) {
	uint32_t len = decode_rm_l(eip + 1);
	cpu.idtr.limit = lnaddr_read(op_src->addr, 2);
	cpu.idtr.base = lnaddr_read(op_src->addr + 2, 4);
	print_asm("lidt\t0x%x", op_src->addr);
	return len + 1;
}

make_helper(pusha) {
	uint32_t temp = cpu.esp;
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.eax, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.ecx, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.edx, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.ebx, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, temp, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.ebp, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.esi, R_SS);
	cpu.esp -= 4; swaddr_write(cpu.esp, 4, cpu.edi, R_SS);
	print_asm("pusha");
	return 1;
}
