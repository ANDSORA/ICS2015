#include "cpu/exec/helper.h"
#include "monitor/monitor.h"

#define BUFFER_LEN 512

make_helper(inv) {
	/* invalid opcode */

	uint32_t temp[8];
	temp[0] = instr_fetch(eip, 4);
	temp[1] = instr_fetch(eip + 4, 4);

	uint8_t *p = (void *)temp;
	printf("invalid opcode(eip = 0x%08x): %02x %02x %02x %02x %02x %02x %02x %02x ...\n\n", 
			eip, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);

	extern char logo [];
	printf("There are two cases which will trigger this unexpected exception:\n\
1. The instruction at eip = 0x%08x is not implemented.\n\
2. Something is implemented incorrectly.\n", eip);
	printf("Find this eip value(0x%08x) in the disassembling result to distinguish which case it is.\n\n", eip);
	printf("\33[1;31mIf it is the first case, see\n%s\nfor more details.\n\nIf it is the second case, remember:\n\
* The machine is always right!\n\
* Every line of untested code is always wrong!\33[0m\n\n", logo);

	assert(0);
}

make_helper(nemu_trap) {
	print_asm("nemu trap (eax = %d)", cpu.eax);

	switch(cpu.eax) {
		case 2:
			{
				//Assert(cpu.edx<16, "The length of string >= 16");
				panic("You shouldn't use this way to output!");
				int i;
				for(i=0; i<cpu.edx; ++i){
					printf("%c", swaddr_read(cpu.ecx + i, 1, R_DS));
				}
				break;
				/*
				char temp[BUFFER_LEN];
				uint32_t len = cpu.edx;
				if(len > 16){
					printf("\nYOU GOT TROUBLE\n");
					len = 16;
				}
				uint32_t idx = 0;
				printf("len == %x\n", len);
				while(len>=4){
					//printf("0x%08x\n",swaddr_read(cpu.ecx + idx, 4, R_DS));//
					*(uint32_t *)(temp + idx) = swaddr_read(cpu.ecx + idx, 4, R_DS);
					len -= 4;
					idx += 4;
				}
				if(len>=2){
					//printf("0x%04x\n",swaddr_read(cpu.ecx + idx, 2, R_DS));//
					*(uint16_t *)(temp + idx) = swaddr_read(cpu.ecx + idx, 2, R_DS);
					len -= 2;
					idx += 2;
				}
				if(len){
					//printf("0x%02x\n",swaddr_read(cpu.ecx + idx, 1, R_DS));//
					*(uint8_t *)(temp + idx) = swaddr_read(cpu.ecx + idx, 1, R_DS);
				}

				printf("%.*s", cpu.edx, temp);
				break; */
			}

		default:
			printf("\33[1;31mnemu: HIT %s TRAP\33[0m at eip = 0x%08x\n\n",
					(cpu.eax == 0 ? "GOOD" : "BAD"), cpu.eip);
			nemu_state = END;
	}

	return 1;
}

