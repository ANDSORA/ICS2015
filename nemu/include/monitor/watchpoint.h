#ifndef __WATCHPOINT_H__
#define __WATCHPOINT_H__

#define T_token_len 64

#include "common.h"

typedef struct watchpoint {
	int NO;
	struct watchpoint *next;

	/* TODO: Add more members if necessary */
	int value;
	char T_token[T_token_len];

} WP;

#endif
