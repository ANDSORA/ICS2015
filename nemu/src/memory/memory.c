#include "common.h"
#include "burst.h"
#include "cpu/reg.h"
//#include "../../lib-common/x86-inc/mmu.h"

int is_mmio(hwaddr_t);
uint32_t mmio_read(hwaddr_t, size_t, int);
void mmio_write(hwaddr_t, size_t, uint32_t, int);

//uint32_t dram_read(hwaddr_t, size_t);
uint32_t L1_cache_read(hwaddr_t, size_t);
hwaddr_t tlb_read(lnaddr_t);
//void dram_write(hwaddr_t, size_t, uint32_t);
void L1_cache_write(hwaddr_t, size_t, uint32_t);

lnaddr_t seg_translate(swaddr_t, size_t, uint8_t);
hwaddr_t page_translate(lnaddr_t);

void page_check(lnaddr_t);

/* Memory accessing interfaces */

uint32_t hwaddr_read(hwaddr_t addr, size_t len) {
	int map_NO = is_mmio(addr);
	if(map_NO == -1) return L1_cache_read(addr, len) & (~0u >> ((4 - len) << 3));
	else return mmio_read(addr, len, map_NO) & (~0u >> ((4 - len) << 3));
}

void hwaddr_write(hwaddr_t addr, size_t len, uint32_t data) {
	int map_NO = is_mmio(addr);
	if(map_NO == -1) L1_cache_write(addr, len, data);
	else mmio_write(addr, len, data, map_NO);
}

uint32_t lnaddr_read(lnaddr_t addr, size_t len) {
	uint32_t offset = addr & 0xfff;
	if(offset + len > 0x1000){
		/* data across the page boundary */
		//Log("Data across the page boundary");

		uint8_t temp[8];
		uint32_t temp_offset = addr & 3;
		
		hwaddr_t hwaddr = page_translate(addr);
		*(uint32_t *)(temp + temp_offset) = hwaddr_read(hwaddr, 4-temp_offset);

		hwaddr = page_translate(addr-offset+0x1000);
		*(uint32_t *)(temp + 4) = hwaddr_read(hwaddr, len+temp_offset-4);

		return unalign_rw(temp + temp_offset, 4) & (~0u >> ((4 - len) << 3));
	}
	else{
		hwaddr_t hwaddr = page_translate(addr);
		return hwaddr_read(hwaddr, len);
	}	

	/*
	uint32_t offset = addr & 0xfff;
	if(offset + len > 0x1000){
		* data across the page boundary *
		panic("Data Across The Page Boundary!");
	}
	else{
		hwaddr_t hwaddr = page_translate(addr);
		printf("(hwaddr_read) data=0x%x",hwaddr_read(hwaddr, len));
		return hwaddr_read(hwaddr, len);
	} */
}

void lnaddr_write(lnaddr_t addr, size_t len, uint32_t data) {
	uint32_t offset = addr & 0xfff;
	if(offset + len > 0x1000){
		/* data across the page boundary */
		//Log("Data across the page boundary");

		uint32_t temp_offset = addr & 3;

		hwaddr_t hwaddr = page_translate(addr);
		hwaddr_write(hwaddr, 4-temp_offset, data);

		hwaddr = page_translate(addr-offset+0x1000);
		hwaddr_write(hwaddr, len+temp_offset-4, data>>((4-temp_offset)<<3) );

	}
	else{
		hwaddr_t hwaddr = page_translate(addr);
		hwaddr_write(hwaddr, len, data);
	}

	/*
	printf("(lnaddr_write) addr=0x%x\n",addr);
	uint32_t offset = addr & 0xfff;
	if(offset + len > 0x1000){
		* data across the page boundary *
		panic("Data Across The Page Boundary!");
	}
	else{
		hwaddr_t hwaddr = page_translate(addr);
		hwaddr_write(hwaddr, len, data);
	} */
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
	if(!cpu.cr0.protect_enable) return addr;

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

hwaddr_t page_translate(lnaddr_t addr){
	//Log("(page_trans)in)");
	if(!(cpu.cr0.protect_enable&&cpu.cr0.paging)) return addr;

	return tlb_read(addr);
	/*
	//Log("(page_trans)lnaddr=0x%x", addr);

	uint32_t dir_idx = addr >> 22;
	uint32_t page_idx = (addr >> 12) & 0x3ff;
	uint32_t offset = addr & 0xfff;

	hwaddr_t dir_addr = (cpu.cr3.val & 0xfffff000) + dir_idx*4;
	uint32_t dir = hwaddr_read(dir_addr, 4);
	Assert(dir&0x1,"FUCK, MISS IN PDE!");
	
	hwaddr_t page_addr = (dir & 0xfffff000) + page_idx*4;
	uint32_t page = hwaddr_read(page_addr, 4);
	Assert(page&0x1,"FUCK, MISS IN PTE!");

	//Log("(page_trans)hwaddr=0x%x", (page&0xfffff000)+offset);

	return (page & 0xfffff000) + offset; */
}

void page_check(lnaddr_t addr){
	if(!(cpu.cr0.protect_enable&&cpu.cr0.paging)){
		printf("Sorry, paging is not enabled for now\n");
		return;
	}

	uint32_t dir_idx = addr >> 22;
	uint32_t page_idx = (addr >> 12) & 0x3ff;
	uint32_t offset = addr & 0xfff;
	printf("CR3 = 0x%x\n",cpu.cr3.val);

	hwaddr_t dir_addr = (cpu.cr3.val & 0xfffff000) + dir_idx*4;
	uint32_t dir = hwaddr_read(dir_addr, 4);
	printf("PDE = 0x%x\n",dir);
	if(!(dir&0x1)){
		printf("missed in pde\n");
		return;
	}

	hwaddr_t page_addr = (dir & 0xfffff000) + page_idx*4;
	uint32_t page = hwaddr_read(page_addr, 4);
	printf("PTE = 0x%x\n",page);
	if(!(page&0x1)){
		printf("missed in pte\n");
		return;
	}

	printf("hwaddr = 0x%x\n", (page & 0xfffff000) + offset);
	return;
}
