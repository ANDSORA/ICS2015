#include "common.h"
#include "cpu/reg.h"
//#include "../../lib-common/x86-inc/mmu.h"

//SegDesc gdt[NR_SEGMENTS];

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

union {
	uint32_t addr;
	struct {
		uint32_t addr_15_0 : 16;
		uint32_t addr_23_16 : 8;
		uint32_t addr_31_24 : 8;
	};
} lnaddr_trans;

lnaddr_t seg_translate(swaddr_t addr, size_t len, uint8_t sreg){
	SEG_REG *sr;
	switch(sreg){
		case R_ES: sr = &cpu.ES; break;
		case R_CS: sr = &cpu.CS; break;
		case R_SS: sr = &cpu.SS; break;
		case R_DS: sr = &cpu.DS; break;
		default: panic("Unknown Segment Register!"); break;
	}	

	return sr->base + addr;
}
