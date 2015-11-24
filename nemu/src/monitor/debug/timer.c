#include "common.h"

static uint64_t time_count;

void init_time_count(){
	time_count = 0;
}

void add_time_count(uint64_t adder){
	time_count += adder;
}

void printf_time_count(){
	printf("time_count = %lld\n", time_count);
}
