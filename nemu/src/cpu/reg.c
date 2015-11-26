#include "nemu.h"
#include <stdlib.h>
#include <time.h>
#include "cpu/exec/eflags.h"

CPU_state cpu;

const char *regsl[] = {"eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi"};
const char *regsw[] = {"ax", "cx", "dx", "bx", "sp", "bp", "si", "di"};
const char *regsb[] = {"al", "cl", "dl", "bl", "ah", "ch", "dh", "bh"};
const char *sregs[] = {"es", "cs", "ss", "ds"};

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

void setEFLAGS_ALU(uint32_t x,uint32_t y,bool cin,uint32_t data_len) {
	if(cin) y=~y;

	uint32_t bit_len=((data_len)<<3);
	uint32_t mask=((uint32_t)0xffffffff)>>(32-bit_len);
	uint32_t result=(x+y+cin)&mask;
	bool cMSB = ( (x&(mask>>1)) + (y&(mask>>1)) + cin ) >> (bit_len-1);
	bool cout = ( ((x>>(bit_len-1))&1) + ((y>>(bit_len-1))&1) + cMSB ) >> 1;

	cpu.CF= cin^cout;
	setPF(result);
	cpu.AF= cin^(( (x&0xf)+(y&0xf)+cin )>>4);
	cpu.ZF= result==0;
	cpu.SF= result>>(bit_len-1);
	cpu.OF= cout^cMSB;
}

void setEFLAGS_LOGIC(uint32_t x,uint32_t data_len){
	cpu.CF=0;
	setPF(x);
	cpu.ZF= x==0;
	cpu.SF= ( x>>((data_len<<3)-1) ) & 1;
	cpu.OF=0;
}

void testEFLAGS() {
	unsigned a,b,c;

	a=0x1;b=0x0;c=a+b;
	setEFLAGS_ALU(a,b,0,4);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0xffffffff;b=0x1;c=a+b;
	setEFLAGS_ALU(a,b,0,4);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x80000000;b=0x80000000;c=a+b;
	setEFLAGS_ALU(a,b,0,4);
	printf("0x%x + 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x7286;b=0x1329045;c=a-b;
	setEFLAGS_ALU(a,b,1,4);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0xffffffff;b=0xffffffff;c=a-b;
	setEFLAGS_ALU(a,b,1,4);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x80000000;b=0x80000000;c=a-b;
	setEFLAGS_ALU(a,b,1,4);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);

	a=0x0;b=0x0;c=a-b;
	setEFLAGS_ALU(a,b,1,4);
	printf("0x%x - 0x%x = 0x%x CPAZSO=%u%u%u%u%u%u\n",a,b,c,cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF);


}
