#include "cpu/exec/template-start.h"

make_helper( concat(cwld_,SUFFIX) ) {
	REG(R_EDX) = (int)(REG(R_EAX))<0 ? (DATA_TYPE_S)(-1) : 0;
	asm( str(instr) );
	return 1;
}

#include "cpu/exec/template-end.h"
