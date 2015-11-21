#include "common.h"
#include "burst.h"
#include "misc.h"

/* Simulate the (main) behavor of L2_Cache.
 * --ANDSORA
 */

#define SLOT_WIDTH 6
#define SET_WIDTH 4
#define SET_IDX_WIDTH 16
#define TAG_WIDTH (27 - SLOT_WIDTH - SET_IDX_WIDTH)

#define SLOT_SIZE (1 << SLOT_WIDTH)
#define SLOT_MASK (SLOT_SIZE - 1)
#define SET_SIZE (1 << SET_WIDTH)
#define SET_MASK (SET_SIZE - 1)
#define SET_NUM (1 << SET_IDX_WIDTH)
#define TAG_SIZE (1 << TAG_WIDTH)

#define CACHE_SIZE ( SLOT_SIZE * SET_SIZE * SET_NUM )
#define HW_MEM_SIZE (128 * 1024 * 1024)

#define RAND_BIT 3

uint32_t dram_read(hwaddr_t, size_t);
uint32_t dram_write(hwaddr_t, size_t, uint32_t);

typedef struct {
	uint8_t data[SLOT_SIZE];
	uint32_t tag : TAG_WIDTH;
	bool valid;
	bool dirty;
} L2_cache_slot;

static union {
	struct {
		uint32_t addr_in_slot : SLOT_WIDTH;
		uint32_t set_idx      : SET_IDX_WIDTH;
		uint32_t tag_idx      : TAG_WIDTH;
	};
	uint32_t addr;
} cache_addr, backup_addr;

static L2_cache_slot cache[SET_SIZE * SET_NUM];

void init_L2_cache() {
	int i;
	for(i = 0; i < SET_NUM*SET_SIZE; ++i){
		cache[i].valid = 0;
	}
}

static void L2_cache_read_inner(hwaddr_t addr, void *temp) {
	//Log("(cache_read_inner) addr = %x", addr);
	//printf("^");
	Assert(addr < HW_MEM_SIZE, "physical address %x is outside of the physical memory!", addr);

	cache_addr.addr = addr & ~BURST_MASK;

	bool hit = 0;
	uint32_t target = (addr >> RAND_BIT) & (SET_MASK);
	uint32_t base_slot_idx = SET_SIZE * cache_addr.set_idx;
	uint32_t i;

	for(i = 0; i < SET_SIZE; ++i){
		if( (cache[base_slot_idx+i].tag==cache_addr.tag_idx) && cache[base_slot_idx+i].valid) {
			//Log("hit in cache, addr = %x", addr);
			hit = 1;
			target = i;
			break;
		}
	}
	
	L2_cache_slot *slot = cache + base_slot_idx + target;

	//if(!(hit && !slot->dirty)) {
	if(!hit) {
		hwaddr_t base_addr = addr & ~SLOT_MASK;

		/* first write back the dirty slot */
		if(slot->valid && slot->dirty){
			Log("write back the dirty slot in cache_read");
			backup_addr.addr = 0;
			backup_addr.tag_idx = slot->tag;
			backup_addr.set_idx = target;
			backup_addr.addr_in_slot = 0; 
			for(i = 0; i < ((SLOT_SIZE)/4); ++i) {
				uint8_t *temp_buf = slot->data + 4*i;
				dram_write(backup_addr.addr + 4*i, 4, *(uint32_t *)temp_buf);
			}
		}

		/* then allocate the slot */
		for(i = 0; i < ((SLOT_SIZE)/4); ++i) {
			uint8_t *temp_buf = slot->data + 4*i;
			*(uint32_t *)temp_buf = dram_read(base_addr + 4*i, 4);
		}
		slot->valid = 1;
		slot->dirty = 0;
		slot->tag = cache_addr.tag_idx;
	}

	memcpy(temp, slot->data + (cache_addr.addr & SLOT_MASK), BURST_LEN);
}

static void L2_cache_write_inner(hwaddr_t addr, void *temp, void *mask) {
	Assert(addr < HW_MEM_SIZE, "physical address %x is outside of the physical memory!", addr);

	cache_addr.addr = addr & ~BURST_MASK;

	bool hit = 0;
	uint32_t target = (addr >> RAND_BIT) & (SET_MASK);
	uint32_t base_slot_idx = SET_SIZE * cache_addr.set_idx;
	uint32_t i;
	
	for(i = 0; i < SET_SIZE; ++i){
		if( (cache[base_slot_idx+i].tag==cache_addr.tag_idx) && cache[base_slot_idx+i].valid) {
			hit = 1;
			target = i;
			break;
		}
	}

	L2_cache_slot *slot = cache + base_slot_idx + target;

	if(hit) {
		memcpy_with_mask(slot->data + (cache_addr.addr & SLOT_MASK), temp, BURST_LEN, mask);
		slot->dirty = 1;
	}
	else {
		hwaddr_t base_addr = addr & ~SLOT_MASK;

		/* first write back the dirty slot */
		if(slot->valid && slot->dirty){
			Log("write back the dirty slot in cache_read");
			backup_addr.addr = 0;
			backup_addr.tag_idx = slot->tag;
			backup_addr.set_idx = target;
			backup_addr.addr_in_slot = 0; 
			for(i = 0; i < ((SLOT_SIZE)/4); ++i) {
				uint8_t *temp_buf = slot->data + 4*i;
				dram_write(backup_addr.addr + 4*i, 4, *(uint32_t *)temp_buf);
			}
		}


		/* then write the dram *
		uint8_t *temp_data;
		uint32_t temp_idx;
		size_t temp_len = 0;
		for(i = 0; i < BURST_LEN; ++i){
			if(*((uint8_t *)mask + i)){
				if(temp_len == 0) {
					temp_idx = i;
					temp_data = (uint8_t *)temp + i;
				}
				//temp_data[temp_len] = *((uint8_t *)temp + i);
				temp_len++;
			}
		}
		Assert(temp_len<=4, "temp_len is flowed");
		if(temp_len) dram_write(cache_addr.addr + temp_idx, temp_len, *(uint32_t *)temp_data);
		*/	

		/* at last load the slot */
		for(i = 0; i < ((SLOT_SIZE)/4); ++i) {
			uint8_t *temp_buf = slot->data + 4*i;
			*(uint32_t *)temp_buf = dram_read(base_addr + 4*i, 4);
		}
		slot->valid = 1;
		slot->dirty = 1;
		slot->tag = cache_addr.tag_idx;

		memcpy_with_mask(slot->data + (cache_addr.addr & SLOT_MASK), temp, BURST_LEN, mask);//?

	}
}

uint32_t L2_cache_read(hwaddr_t addr, size_t len) {
	//Log("(cache_read) addr = %x", addr);
	uint32_t offset = addr & BURST_MASK;
	uint8_t temp[2 * BURST_LEN];

	L2_cache_read_inner(addr, temp);

	if(offset + len > BURST_LEN) {
		/* data cross the slot boundary */
		L2_cache_read_inner(addr + BURST_LEN, temp + BURST_LEN);
	}

	return unalign_rw(temp + offset, 4);
}

void L2_cache_write(hwaddr_t addr, size_t len, uint32_t data) {
	uint32_t offset = addr & BURST_MASK;
	uint8_t temp[2 * BURST_LEN];
	uint8_t mask[2 * BURST_LEN];
	memset(mask, 0, 2 * BURST_LEN);

	*(uint32_t *)(temp + offset) = data;
	memset(mask + offset, 1, len);

	L2_cache_write_inner(addr, temp, mask);

	if(offset + len > BURST_LEN) {
		/* data cross the slot boundary */
		L2_cache_write_inner(addr + BURST_LEN, temp + BURST_LEN, mask + BURST_LEN);
	}
	
	//dram_write(addr, len, data);
}

void L2_cache_check(hwaddr_t addr) {
	if(addr > HW_MEM_SIZE) {
		printf("physical address %x is outside of the physical memory!\n", addr);
		return;
	}

	cache_addr.addr = addr & ~BURST_MASK;

	bool hit = 0;
	uint32_t target = (addr >> RAND_BIT) & (SET_MASK);
	uint32_t base_slot_idx = SET_SIZE * cache_addr.set_idx;
	uint32_t i;
	
	for(i = 0; i < SET_SIZE; ++i){
		if( (cache[base_slot_idx+i].tag==cache_addr.tag_idx) && cache[base_slot_idx+i].valid ) {
			hit = 1;
			target = i;
			break;
		}
	}

	if(hit) {
		printf("HIT IN L2-CACHE!\n");

		L2_cache_slot *slot = cache + base_slot_idx + target;
		printf("tag:0x%04x\tvalid:%x\t\tdirty:%x\n", slot->tag, slot->valid, slot->dirty);
		for(i = 0; i < (SLOT_SIZE)/4; ++i){
			uint8_t *temp_buf = slot->data + 4*i;
			printf("0x%08x\t", *(uint32_t *)temp_buf);
		}printf("\n");
	}
	else {
		printf("MISSED IN L2-CACHE!\n");
		
		printf("valid\tdirty\ttag\t(in the corresponding set)\n");
		for(i = 0; i < SET_SIZE; ++i){
			printf("%x\t%x\t0x%04x\n", cache[base_slot_idx+i].valid, cache[base_slot_idx+i].dirty, cache[base_slot_idx+i].tag);
		}
	}
	printf("\n");
	return;
}
