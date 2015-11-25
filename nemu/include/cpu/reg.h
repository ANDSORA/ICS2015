#ifndef __REG_H__
#define __REG_H__

#include "common.h"

enum { R_EAX, R_ECX, R_EDX, R_EBX, R_ESP, R_EBP, R_ESI, R_EDI };
enum { R_AX, R_CX, R_DX, R_BX, R_SP, R_BP, R_SI, R_DI };
enum { R_AL, R_CL, R_DL, R_BL, R_AH, R_CH, R_DH, R_BH };

/* TODO: Re-organize the `CPU_state' structure to match the register
 * encoding scheme in i386 instruction format. For example, if we
 * access cpu.gpr[3]._16, we will get the `bx' register; if we access
 * cpu.gpr[1]._8[1], we will get the 'ch' register. Hint: Use `union'.
 * For more details about the register encoding scheme, see i386 manual.
 */

typedef union {
	union {
		uint32_t _32;
		uint16_t _16;
		uint8_t _8[2];
	} gpr[8];

	/* Do NOT change the order of the GPRs' definitions. */

	struct {
		/* common registers */
		uint32_t eax, ecx, edx, ebx, esp, ebp, esi, edi;

		/* instruction register */
		swaddr_t eip;

		/* eflags registers */
		union {
			uint32_t EFLAGS;
			struct {
				uint32_t CF:1; uint32_t ef_1:1; uint32_t PF:1; uint32_t ef_3:1;
				uint32_t AF:1; uint32_t ef_5:1; uint32_t ZF:1; uint32_t SF:1;
				uint32_t TF:1; uint32_t IF:1;   uint32_t DF:1; uint32_t OF:1;
				uint32_t OL:1; uint32_t IP:1;   uint32_t NT:1; uint32_t ef_15:1;
				uint32_t RF:1; uint32_t VM:1;   uint32_t ef_18_31:14;
			};
		};

		/* gdtr */
		struct {
			uint64_t limit : 16;
			uint64_t base : 32;
		} gdtr;

		/* cr0 */
		union {
			uint32_t cr0;
			struct {
				uint32_t PE:1; uint32_t MP:1; uint32_t EM:1; uint32_t TS:1;
				uint32_t ET:1; uint32_t cr0_reserved:26; uint32_t PG:1;
			};
		};

		/* segment registers */
		struct {
			uint16_t RPL : 2;
			uint16_t TI : 1;
			uint16_t IDX : 13;
		} CS,SS,DS,ES;

	};
	struct {
		uint16_t ax, axxx, cx, cxxx, dx, dxxx, bx, bxxx;
		uint16_t sp, spxx, bp, bpxx, si, sixx, di, dixx;
	};
	struct {
		uint8_t al, ah, alx, ahx, cl, ch, clx, chx;
		uint8_t dl, dh, dlx, dhx, bl, bh, blx, bhx;
	};

} CPU_state;

extern CPU_state cpu;
//extern CPU_EFLAGS EFLAGS;

static inline int check_reg_index(int index) {
	assert(index >= 0 && index < 8);
	return index;
}

#define reg_l(index) (cpu.gpr[check_reg_index(index)]._32)
#define reg_w(index) (cpu.gpr[check_reg_index(index)]._16)
#define reg_b(index) (cpu.gpr[check_reg_index(index) & 0x3]._8[index >> 2])

extern const char* regsl[];
extern const char* regsw[];
extern const char* regsb[];

#endif
