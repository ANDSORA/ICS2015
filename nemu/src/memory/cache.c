#include "common.h"

#define SLOT_WIDTH 6
#define SET_WIDTH 3
#define SET_IDX_WIDTH 7
#define TAG_WIDTH (27 - SLOT_WIDTH - SET_IDX_WIDTH)

#define SLOT_SIZE (1 << SLOT_WIDTH)
#define SET_SIZE (1 << SET_WIDTH)
#define SET_NUM (1 << SET_IDX_WIDTH)
#define TAG_SIZE (1 << TAG_WIDTH)

#define CACHE_SIZE ( SLOT_SIZE * SET_SIZE * SET_NUM )

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


