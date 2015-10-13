#include "cpu/exec/helper.h"

#define DATA_BYTE 2
#define instr cwtl
#include "cwld-template.h"
#undef instr
#undef DATA_BYTE

#define DATA_BYTE 4
#define instr cltd
#include "cwld-template.h"
#undef instr
#undef DATA_BYTE

make_helper_v(cwld)
