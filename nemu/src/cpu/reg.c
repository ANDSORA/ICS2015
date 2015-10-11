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

void setPF(uint32_t x){
	uint32_t temp=x&0xff;
	temp=temp^(temp>>1);
	temp=temp^(temp>>2);
	temp=temp^(temp>>4);
	cpu.PF= ~temp&1;
}

void setEFLAGS_ALU(uint32_t x,uint32_t y,bool cin) {
	if(cin) y=~y;

	uint32_t result=x+y+cin;
	bool cout= ( (((x&1)+(y&1)+cin)>>1) + (x>>1) + (y>>1) )>>31;

	cpu.CF= cin^cout;
	setPF(result);
	cpu.AF= cin^(( (x&15)+(y&15)+cin )>>4);
	cpu.ZF= result==0;
	cpu.SF= result>>31;
	cpu.OF= cout^( (((x<<1)>>1)+((y<<1)>>1)+cin)>>31 );
}

void setEFLAGS_test(uint32_t x){
	cpu.CF=0;
	setPF(x);
	cpu.ZF= x==0;
	cpu.SF= x>>31;
	cpu.OF=0;
}

void testEFLAGS() {
	unsigned a,b,c;

	a=0x1;b=0x0;c=a+b;
	setEFLAGS_ALU(a,b,0);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0xffffffff;b=0x1;c=a+b;
	setEFLAGS_ALU(a,b,0);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x80000000;b=0x80000000;c=a+b;
	setEFLAGS_ALU(a,b,0);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x7286;b=0x1329045;c=a-b;
	setEFLAGS_ALU(a,b,1);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0xffffffff;b=0xffffffff;c=a-b;
	setEFLAGS_ALU(a,b,1);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x80000000;b=0x80000000;c=a-b;
	setEFLAGS_ALU(a,b,1);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x0;b=0x0;c=a-b;
	setEFLAGS_ALU(a,b,1);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);


}
