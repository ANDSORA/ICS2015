#include "common.h"
#include "cpu/reg.h"
//#include "../../lib-common/x86-inc/mmu.h"


//uint32_t dram_read(hwaddr_t, size_t);
uint32_t L1_cache_read(hwaddr_t, size_t);
//void dram_write(hwaddr_t, size_t, uint32_t);
void L1_cache_write(hwaddr_t, size_t, uint32_t);

lnaddr_t seg_translate(swaddr_t, size_t, uint8_t);
/* Memory accessing interfaces */

uint32_t hwaddr_read(hwaddr_t addr, size_t len) {
	return L1_cache_read(addr, len) & (~0u >> ((4 - len) << 3));
}

void hwaddr_write(hwaddr_t addr, size_t len, uint32_t data) {
	L1_cache_write(addr, len, data);
}

uint32_t lnaddr_read(lnaddr_t addr, size_t len) {
	return hwaddr_read(addr, len);
}

void lnaddr_write(lnaddr_t addr, size_t len, uint32_t data) {
	hwaddr_write(addr, len, data);
}

uint32_t swaddr_read(swaddr_t addr, size_t len, uint8_t sreg) {
#ifdef DEBUG
	assert(len == 1 || len == 2 || len == 4);
#endif
	lnaddr_t lnaddr = seg_translate(addr, len, sreg);
	return lnaddr_read(lnaddr, len);
}

void swaddr_write(swaddr_t addr, size_t len, uint32_t data, uint8_t sreg) {
#ifdef DEBUG
	assert(len == 1 || len == 2 || len == 4);
#endif
	lnaddr_t lnaddr = seg_translate(addr, len, sreg);
	lnaddr_write(lnaddr, len, data);
}

lnaddr_t seg_translate(swaddr_t addr, size_t len, uint8_t sreg){
	SEG_REG *sr = &SREG(sreg);

	//printf("sreg==%u val==0x%x  limit==0x%x base==0x%x\n",sreg, cpu.SR[sreg].val, cpu.SR[sreg].limit, cpu.SR[sreg].base);
	//printf("LA==0x%x LIMIT==0x%x\n", cpu.SR[sreg].base+addr+len-1, (cpu.SR[sreg].limit<<12)|0xfff);
	Assert(sr->base + addr + len - 1 <= ((sr->limit<<12)|0xfff), "LA LIMIT VIOLATED!");
	return sr->base + addr;
}

union {
	uint32_t bit_31_0;
	struct {
		uint32_t bit_15_0 : 16;
		uint32_t bit_23_16 : 8;
		uint32_t bit_31_24 : 8;
	};
} bit_trans;

void Load_SR_cache(uint8_t sreg){
	//Assert(sreg>=0&&sreg<=3, "Unknown Segment Register!");
	SEG_REG *sr = &SREG(sreg);
	Assert((sr->IDX << 3) <= cpu.gdtr.limit, "GDT LIMIT VIOLATED!");

	lnaddr_t addr = cpu.gdtr.base + (sr->IDX << 3);

	bit_trans.bit_15_0 = lnaddr_read(addr+2, 2);
	bit_trans.bit_23_16 = lnaddr_read(addr+4, 1);
	bit_trans.bit_31_24 = lnaddr_read(addr+7, 1);
	sr->base = bit_trans.bit_31_0;

	bit_trans.bit_15_0 = lnaddr_read(addr, 2);
	bit_trans.bit_23_16 = lnaddr_read(addr+6, 1) & 0xf;
	bit_trans.bit_31_24 = 0x0;
	sr->limit = bit_trans.bit_31_0;
}
