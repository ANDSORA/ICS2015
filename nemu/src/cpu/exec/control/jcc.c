#include "cpu/exec/helper.h"

#define DATA_BYTE 1

#define instr jo
#define instr_num 1
#define instr_value (cpu.OF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jno
#define instr_num 2
#define instr_value (cpu.OF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jb
#define instr_num 3
#define instr_value (cpu.CF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jae
#define instr_num 4
#define instr_value (cpu.CF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr je
#define instr_num 5
#define instr_value (cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jne
#define instr_num 6
#define instr_value (cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jbe
#define instr_num 7
#define instr_value (cpu.CF==1||cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr ja
#define instr_num 8
#define instr_value (cpu.CF==0&&cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr js
#define instr_num 9
#define instr_value (cpu.SF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jns
#define instr_num 10
#define instr_value (cpu.SF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jp
#define instr_num 11
#define instr_value (cpu.PF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jnp
#define instr_num 12
#define instr_value (cpu.PF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jl
#define instr_num 13
#define instr_value (cpu.SF!=cpu.OF)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jge
#define instr_num 14
#define instr_value (cpu.SF==cpu.OF)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jle
#define instr_num 15
#define instr_value ((cpu.SF!=cpu.OF)||cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jg
#define instr_num 16
#define instr_value ((cpu.SF==cpu.OF)&&cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr

#undef DATA_BYTE



#define DATA_BYTE 4

#define instr jo
#define instr_num 1
#define instr_value (cpu.OF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jno
#define instr_num 2
#define instr_value (cpu.OF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jb
#define instr_num 3
#define instr_value (cpu.CF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jae
#define instr_num 4
#define instr_value (cpu.CF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr je
#define instr_num 5
#define instr_value (cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jne
#define instr_num 6
#define instr_value (cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jbe
#define instr_num 7
#define instr_value (cpu.CF==1||cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr ja
#define instr_num 8
#define instr_value (cpu.CF==0&&cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr js
#define instr_num 9
#define instr_value (cpu.SF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jns
#define instr_num 10
#define instr_value (cpu.SF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jp
#define instr_num 11
#define instr_value (cpu.PF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jnp
#define instr_num 12
#define instr_value (cpu.PF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jl
#define instr_num 13
#define instr_value (cpu.SF!=cpu.OF)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jge
#define instr_num 14
#define instr_value (cpu.SF==cpu.OF)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jle
#define instr_num 15
#define instr_value ((cpu.SF!=cpu.OF)||cpu.ZF==1)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr
#define instr jg
#define instr_num 16
#define instr_value ((cpu.SF==cpu.OF)&&cpu.ZF==0)
#include "jcc-template.h"
#undef instr_num
#undef instr_value
#undef instr

#undef DATA_BYTE
