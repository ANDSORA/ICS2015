#include "cpu/exec/template-start.h"

void Load_SR_cache(uint8_t);
void init_tlb();

#define instr mov

static void do_execute() {
	OPERAND_W(op_dest, op_src->val);
	print_asm_template2();
}

make_instr_helper(i2r)
make_instr_helper(i2rm)
make_instr_helper(r2rm)
make_instr_helper(rm2r)

make_helper(concat(mov_a2moffs_, SUFFIX)) {
	swaddr_t addr = instr_fetch(eip + 1, 4);
	MEM_W(addr, REG(R_EAX), R_DS);

	print_asm("mov" str(SUFFIX) " %%%s,0x%x", REG_NAME(R_EAX), addr);
	return 5;
}

make_helper(concat(mov_moffs2a_, SUFFIX)) {
	swaddr_t addr = instr_fetch(eip + 1, 4);
	REG(R_EAX) = MEM_R(addr, R_DS);

	print_asm("mov" str(SUFFIX) " 0x%x,%%%s", addr, REG_NAME(R_EAX));
	return 5;
}

#if DATA_BYTE == 2
make_helper(mov_rm2s_w) {
	int len = decode_rm_w(eip + 1);
	SREG(op_src2->reg).val = op_src->val;
	Load_SR_cache(op_src2->reg);
	print_asm("mov\t%s,%%%s", op_src->str, SREG_NAME(op_src2->reg));
	return len + 1;
}

#elif DATA_BYTE == 4
make_helper(mov_c2rm_l) {
	int len = decode_rm_l(eip + 1);
	switch(op_src2->reg){
		case 0: OPERAND_W(op_src, cpu.cr0.val); print_asm("movl cr0,%s", op_src->str); break;
		case 3: OPERAND_W(op_src, cpu.cr3.val); print_asm("movl cr3,%s", op_src->str); break;
		default: panic("No such control register!"); break;
	}
	return len + 1;
}

make_helper(mov_rm2c_l) {
	int len = decode_rm_l(eip + 1);
	switch(op_src2->reg){
		case 0: cpu.cr0.val = op_src->val; print_asm("movl %s,cr0", op_src->str); break;
		case 3: cpu.cr3.val = op_src->val; init_tlb(); print_asm("mov %s,cr3", op_src->str); break;
		default: panic("No such control register!"); break;
	}
	return len + 1;
}

#endif

#include "cpu/exec/template-end.h"
