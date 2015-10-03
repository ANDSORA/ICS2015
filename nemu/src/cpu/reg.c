#include "nemu.h"
#include <stdlib.h>
#include <time.h>
#include "cpu/exec/eflags.h"

CPU_state cpu;

const char *regsl[] = {"eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi"};
const char *regsw[] = {"ax", "cx", "dx", "bx", "sp", "bp", "si", "di"};
const char *regsb[] = {"al", "cl", "dl", "bl", "ah", "ch", "dh", "bh"};

void reg_test() {
	srand(time(0));
	uint32_t sample[8];
	uint32_t eip_sample = rand();
	cpu.eip = eip_sample;

	int i;
	for(i = R_EAX; i <= R_EDI; i ++) {
		sample[i] = rand();
		reg_l(i) = sample[i];
		assert(reg_w(i) == (sample[i] & 0xffff));
	}

	assert(reg_b(R_AL) == (sample[R_EAX] & 0xff));
	assert(reg_b(R_AH) == ((sample[R_EAX] >> 8) & 0xff));
	assert(reg_b(R_BL) == (sample[R_EBX] & 0xff));
	assert(reg_b(R_BH) == ((sample[R_EBX] >> 8) & 0xff));
	assert(reg_b(R_CL) == (sample[R_ECX] & 0xff));
	assert(reg_b(R_CH) == ((sample[R_ECX] >> 8) & 0xff));
	assert(reg_b(R_DL) == (sample[R_EDX] & 0xff));
	assert(reg_b(R_DH) == ((sample[R_EDX] >> 8) & 0xff));

	assert(sample[R_EAX] == cpu.eax);
	assert(sample[R_ECX] == cpu.ecx);
	assert(sample[R_EDX] == cpu.edx);
	assert(sample[R_EBX] == cpu.ebx);
	assert(sample[R_ESP] == cpu.esp);
	assert(sample[R_EBP] == cpu.ebp);
	assert(sample[R_ESI] == cpu.esi);
	assert(sample[R_EDI] == cpu.edi);

	assert(eip_sample == cpu.eip);
}


/* ANDSORA*/
void HELLO_ANDSORA() {
	printf("Hello, my head files\n");
}

void setEFLAGS_CPAZSO(uint32_t x,uint32_t y,bool c) {
	if(c)y=~y+1;

	uint32_t result=x+y;
	uint32_t temp=result&0xff;

	cpu.CF= result<x;

	temp=temp^(temp>>1);
	temp=temp^(temp>>2);
	temp=temp^(temp>>4);
	cpu.PF= ~temp&1;

	cpu.AF= (result&0xf)<(x&0xf);

	cpu.ZF= result==0;

	cpu.SF= result>>31;

	cpu.OF= ( ((int)x<0) == ((int)y<0) ) && ( ((int)x<0) != ((int)result<0) );
}

void testEFLAGS() {
	unsigned a,b,c;

	a=0x7286;b=0x1329045;c=a+b;
	setEFLAGS_CPAZSO(a,b,0);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

}
