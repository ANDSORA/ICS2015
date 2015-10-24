#include "cpu/exec/template-start.h"

#define instr call

make_helper( concat(call_si_, SUFFIX) ) {
	int len = concat(decode_si_, SUFFIX)(eip+1);

	cpu.esp -= DATA_BYTE;
	MEM_W( cpu.esp, (DATA_TYPE)(eip+len+1) );

	cpu.eip += op_src->val;
	if(DATA_BYTE==2) cpu.eip = cpu.eip & 0xffff;

	print_asm("call\t0x%x",cpu.eip+len+1);

	return len+1;
}
make_helper( concat(call_rm_, SUFFIX) ) {
	int len = concat(decode_rm_, SUFFIX)(eip+1);

	cpu.esp -= DATA_BYTE;
	MEM_W( cpu.esp, (DATA_TYPE)(eip+len+1) );

	cpu.eip = op_src->val-len-1;
	if(DATA_BYTE==2) cpu.eip = cpu.eip & 0xffff;

	print_asm("call\t0x%x",cpu.eip+len+1);

	return len+1;

}

#include "cpu/exec/template-end.h"
