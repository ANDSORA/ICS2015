
hello-inline-asm:     file format elf32-i386


Disassembly of section .text:

08048074 <start>:
 8048074:	bd 00 00 00 00       	mov    $0x0,%ebp
 8048079:	bc 00 00 00 08       	mov    $0x8000000,%esp
 804807e:	83 ec 10             	sub    $0x10,%esp
 8048081:	e8 00 00 00 00       	call   8048086 <main>

08048086 <main>:
 8048086:	55                   	push   %ebp
 8048087:	89 e5                	mov    %esp,%ebp
 8048089:	b8 04 00 00 00       	mov    $0x4,%eax
 804808e:	bb 01 00 00 00       	mov    $0x1,%ebx
 8048093:	b9 ac 80 04 08       	mov    $0x80480ac,%ecx
 8048098:	ba 0e 00 00 00       	mov    $0xe,%edx
 804809d:	cd 80                	int    $0x80
 804809f:	b8 00 00 00 00       	mov    $0x0,%eax
 80480a4:	d6                   	(bad)  
 80480a5:	b8 00 00 00 00       	mov    $0x0,%eax
 80480aa:	5d                   	pop    %ebp
 80480ab:	c3                   	ret    
