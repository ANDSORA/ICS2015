#include "common.h"
#include "memory.h"
#include <string.h>
#include <elf.h>

#define ELF_OFFSET_IN_DISK 0

#ifdef HAS_DEVICE
void ide_read(uint8_t *, uint32_t, uint32_t);
#else
void ramdisk_read(uint8_t *, uint32_t, uint32_t);
#endif

#define STACK_SIZE (1 << 20)

void create_video_mapping();
uint32_t get_ucr3();

uint32_t loader() {
	Elf32_Ehdr *elf;
	Elf32_Phdr *ph = NULL;

	uint8_t buf[4096];

#ifdef HAS_DEVICE
	ide_read(buf, ELF_OFFSET_IN_DISK, 4096);
#else
	ramdisk_read(buf, ELF_OFFSET_IN_DISK, 4096);
#endif

	elf = (void*)buf;

	/* TODO: fix the magic number with the correct one */
	const uint32_t elf_magic = 0x464c457f;
	uint32_t *p_magic = (void *)buf;
	nemu_assert(*p_magic == elf_magic);

	/* Load each program segment */
	//panic("please implement me");
	Elf32_Phdr *base_ph = (void *)buf + elf->e_phoff;
	nemu_assert(elf->e_phoff == 52);

	int i;
	//nemu_assert(elf->e_phnum == 3);
	for(i=0; i<elf->e_phnum; ++i) {
		/* Scan the program header table, load each segment into memory */
		//ph = base_ph + i*elf->e_phentsize;
		ph = base_ph + i;
		if(ph->p_type == PT_LOAD) {

			uint32_t hwaddr = mm_malloc(ph->p_vaddr, ph->p_memsz);

			/* TODO: read the content of the segment from the ELF file 
			 * to the memory region [VirtAddr, VirtAddr + FileSiz)
			 */

			//ramdisk_read( (void *)hwaddr, ELF_OFFSET_IN_DISK+ph->p_offset, ph->p_filesz);
			ide_read( (void *)hwaddr, ELF_OFFSET_IN_DISK + ph->p_offset, ph->p_filesz);
			 
			/* TODO: zero the memory region 
			 * [VirtAddr + FileSiz, VirtAddr + MemSiz)
			 */
			memset((void *)(hwaddr + ph->p_filesz), 0, ph->p_memsz - ph->p_filesz);


			/* update the page dir and table --ANDSORA *
			PDE *pdir = (PDE *)( (cpu.cr3.val&0xfffff000) + (hwaddr>>22)*4 );
			PTE *ptable = (PTE *)( (pdir->val&0xfffff000) + ((hwaddr>>12)&0x3ff)*4 );
			pdir->present = 1;
			ptable->present = 1; */

#ifdef IA32_PAGE
			/* Record the program break for future use. */
			extern uint32_t brk;
			uint32_t new_brk = ph->p_vaddr + ph->p_memsz - 1;
			if(brk < new_brk) { brk = new_brk; }
#endif
		}
	}

	volatile uint32_t entry = elf->e_entry;

#ifdef IA32_PAGE
	mm_malloc(KOFFSET - STACK_SIZE, STACK_SIZE);

//#ifdef HAS_DEVICE
	create_video_mapping();
//#endif

	write_cr3(get_ucr3());
#endif

	return entry;
}
