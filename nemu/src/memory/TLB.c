#include "common.h"
#include "cpu/reg.h"
#include "../../lib-common/x86-inc/mmu.h"

#define TLB_WIDTH 6
#define TLB_SIZE (1 << TLB_WIDTH)
#define TLB_MASK (TLB_SIZE - 1)

#define RAND_BIT 4

uint32_t hwaddr_read(hwaddr_t addr, size_t);

typedef struct {
	PTE ptable;
	uint32_t tag;
	bool valid;
} TLB_slot;

static TLB_slot tlb[TLB_SIZE];

void init_tlb(){
	uint32_t i;
	for(i=0; i < TLB_SIZE; ++i){
		tlb[i].valid = 0;
	}
}

hwaddr_t tlb_read(lnaddr_t addr){
	bool hit = 0;
	uint32_t target = (addr >> RAND_BIT) & (TLB_MASK);
	uint32_t offset = addr & 0xfff;
	uint32_t i;
	for(i=0; i < TLB_SIZE; ++i){
		if( (tlb[i].valid) && (tlb[i].tag==(addr>>12)) ){
			hit = 1;
			target = i;
			break;
		}
		else if(!tlb[i].valid){
			target = i;
		}
	}

	//if(hit) printf("^");

	if(!hit){
		uint32_t dir_idx = addr >> 22;
		uint32_t page_idx = (addr >> 12) & 0x3ff;

		hwaddr_t dir_addr = (cpu.cr3.val & 0xfffff000) + dir_idx*4;
		uint32_t dir = hwaddr_read(dir_addr, 4);
		Assert(dir&0x1,"FUCK, MISS IN PDE!");

		hwaddr_t page_addr = (dir & 0xfffff000) + page_idx*4;
		uint32_t page = hwaddr_read(page_addr, 4);
		Assert(dir&0x1,"FUCK, MISS IN PTE!");

		tlb[target].ptable.val = page;
		tlb[target].tag = addr >> 12;
		tlb[target].valid = 1;
	}

	return (tlb[target].ptable.val & 0xfffff000) + offset;
}
