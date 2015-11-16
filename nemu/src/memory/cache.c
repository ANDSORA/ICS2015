#include "common.h"
#include "burst.h"
#include "misc.h"

#define SLOT_WIDTH 6
#define SET_WIDTH 3
#define SET_IDX_WIDTH 7
#define TAG_WIDTH (27 - SLOT_WIDTH - SET_IDX_WIDTH)

#define SLOT_SIZE (1 << SLOT_WIDTH)
#define SLOT_MASK (SLOT_SIZE - 1)
#define SET_SIZE (1 << SET_WIDTH)
#define SET_NUM (1 << SET_IDX_WIDTH)
#define TAG_SIZE (1 << TAG_WIDTH)

#define CACHE_SIZE ( SLOT_SIZE * SET_SIZE * SET_NUM )
#define HW_MEM_SIZE (128 * 1024 * 1024)

#define RAND_BIT 3

uint32_t dram_read(hwaddr_t, size_t);

typedef struct {
	uint8_t data[SLOT_SIZE];
	uint32_t tag : TAG_WIDTH;
	bool valid;
} cache_slot;

union {
	struct {
		uint32_t addr_in_slot : SLOT_WIDTH;
		uint32_t set_idx      : SET_IDX_WIDTH;
		uint32_t tag_idx      : TAG_WIDTH;
	};
	uint32_t addr;
} cache_addr;

cache_slot cache[SET_SIZE * SET_NUM];



static void cache_read_inner(hwaddr_t addr, void *temp) {
	Assert(addr < HW_MEM_SIZE, "physical address %x is outside of the physical memory!", addr);

	cache_addr.addr = addr & ~BURST_MASK;

	bool hit = 0;
	uint32_t target = (addr>>RAND_BIT) & (SET_SIZE);
	uint32_t base_slot_idx = SET_SIZE*cache_addr.set_idx;
	uint32_t i;

	for(i = 0; i < SET_SIZE; ++i){
		if( (cache[base_slot_idx+i].tag==cache_addr.tag_idx) && cache[base_slot_idx+i].valid ) {
			hit = 1;
			target = i;
			break;
		}
	}
	
	cache_slot *slot = cache + base_slot_idx + target;

	if(!hit) {
		hwaddr_t base_addr = addr & ~SLOT_MASK;
		for(i = 0; i< (SLOT_SIZE)/4; ++i) {
			uint8_t fuck[16];
			uint32_t temp_data = dram_read(base_addr + 4*i, 4);
			*(uint32_t *)(fuck + 4*i) = temp_data;
			//*(uint32_t *)(slot->data + 4*i) = temp_data;//dram_read(base_addr + 4*i, 4);
		}
	}

	memcpy(temp, slot->data + (cache_addr.addr & SLOT_MASK), BURST_LEN);
}

uint32_t cache_read(hwaddr_t addr, size_t len) {
	uint32_t offset = addr & BURST_MASK;
	uint8_t temp[2 * BURST_LEN];

	cache_read_inner(addr, temp);

	if(offset + len > BURST_LEN) {
		/* data cross the slot boundary */
		cache_read_inner(addr + BURST_LEN, temp + BURST_LEN);
	}

	return unalign_rw(temp + offset, 4);
}

	/*
	 * compute hit *
	uint32_t i;
	uint32_t target = (addr>>3) & 7;
	uint32_t base_idx = SET_SIZE*cache_addr.set_idx;
	for(i=0;i<8;++i) {
		if( (cache[base_idx+i].tag==cache_addr.tag_idx) && cache[base_idx+i].valid ) {
			hit = 1;
			target = i;
			break;
		}
	}

	if(!hit) {
		* get slot from dram *
		hwaddr_t base_addr = addr - offset;
		cache_slot *slot = cache + base_idx + target;

		for(i=0;i<16;++i){
			*(uint32_t *)(slot->data+4*i) = dram_read(base_addr+4*i,4);
		}
	}

	memcpy(temp, cache[base_idx+target].data[offset&60], 4);
	
	if(offset+len > SLOT_SIZE){
		hit = 0;
		target = (addr>>3) & 7;
		cache_addr.addr = addr + 4;
		base_idx = SET_SIZE*cache_addr.set_idx;
		for(i=0;i<8;++i) {
			if( (cache[base_idx+i].tag==cache_addr.tag_idx) && cache[base_idx+i].valid ) {
				hit = 1;
				target = i;
				break;
			}
		}

		if(!hit) {
			* get slot from dram *
			hwaddr_t base_addr = addr 
	}

}*/
