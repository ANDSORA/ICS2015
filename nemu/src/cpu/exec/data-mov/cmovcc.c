#include "cpu/exec/helper.h"

#define DATA_BYTE 2

#define instr cmovo
#define instr_value (cpu.OF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovno
#define instr_value (cpu.OF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovb
#define instr_value (cpu.CF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovae
#define instr_value (cpu.CF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmove
#define instr_value (cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovne
#define instr_value (cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovbe
#define instr_value (cpu.CF==1||cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmova
#define instr_value (cpu.CF==0&&cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovs
#define instr_value (cpu.SF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovns
#define instr_value (cpu.SF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovp
#define instr_value (cpu.PF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovnp
#define instr_value (cpu.PF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovl
#define instr_value (cpu.SF!=cpu.OF)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovge
#define instr_value (cpu.SF==cpu.OF)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovle
#define instr_value ((cpu.SF!=cpu.OF)||cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovg
#define instr_value ((cpu.SF==cpu.OF)&&cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr

#undef DATA_BYTE



#define DATA_BYTE 4

#define instr cmovo
#define instr_value (cpu.OF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovno
#define instr_value (cpu.OF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovb
#define instr_value (cpu.CF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovae
#define instr_value (cpu.CF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmove
#define instr_value (cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovne
#define instr_value (cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovbe
#define instr_value (cpu.CF==1||cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmova
#define instr_value (cpu.CF==0&&cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovs
#define instr_value (cpu.SF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovns
#define instr_value (cpu.SF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovp
#define instr_value (cpu.PF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovnp
#define instr_value (cpu.PF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovl
#define instr_value (cpu.SF!=cpu.OF)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovge
#define instr_value (cpu.SF==cpu.OF)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovle
#define instr_value ((cpu.SF!=cpu.OF)||cpu.ZF==1)
#include "cmovcc-template.h"
#undef instr_value
#undef instr
#define instr cmovg
#define instr_value ((cpu.SF==cpu.OF)&&cpu.ZF==0)
#include "cmovcc-template.h"
#undef instr_value
#undef instr

#undef DATA_BYTE

make_helper_v(cmovo_rm2r)
make_helper_v(cmovno_rm2r)
make_helper_v(cmovb_rm2r)
make_helper_v(cmovae_rm2r)
make_helper_v(cmove_rm2r)
make_helper_v(cmovne_rm2r)
make_helper_v(cmovbe_rm2r)
make_helper_v(cmova_rm2r)
make_helper_v(cmovs_rm2r)
make_helper_v(cmovns_rm2r)
make_helper_v(cmovp_rm2r)
make_helper_v(cmovnp_rm2r)
make_helper_v(cmovl_rm2r)
make_helper_v(cmovge_rm2r)
make_helper_v(cmovle_rm2r)
make_helper_v(cmovg_rm2r)
