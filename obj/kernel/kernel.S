
kernel:     file format elf32-i386


Disassembly of section .text:

c0100000 <start>:
c0100000:	0f 01 15 48 00 10 00 	lgdtl  0x100048
c0100007:	0f 20 c0             	mov    %cr0,%eax
c010000a:	83 c8 01             	or     $0x1,%eax
c010000d:	0f 22 c0             	mov    %eax,%cr0
c0100010:	ea 17 00 10 00 08 00 	ljmp   $0x8,$0x100017

c0100017 <start_cond>:
c0100017:	66 b8 10 00          	mov    $0x10,%ax
c010001b:	8e d8                	mov    %eax,%ds
c010001d:	8e c0                	mov    %eax,%es
c010001f:	8e d0                	mov    %eax,%ss
c0100021:	bd 00 00 00 00       	mov    $0x0,%ebp
c0100026:	bc 00 00 00 08       	mov    $0x8000000,%esp
c010002b:	e9 f0 09 00 00       	jmp    c0100a20 <init>

c0100030 <gdt>:
	...
c0100038:	ff                   	(bad)  
c0100039:	ff 00                	incl   (%eax)
c010003b:	00 00                	add    %al,(%eax)
c010003d:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
c0100044:	00 92 cf 00 17 00    	add    %dl,0x1700cf(%edx)

c0100048 <gdtdesc>:
c0100048:	17                   	pop    %ss
c0100049:	00 30                	add    %dh,(%eax)
c010004b:	00 10                	add    %dl,(%eax)
c010004d:	00 66 90             	add    %ah,-0x70(%esi)

c0100050 <mm_malloc>:
c0100050:	55                   	push   %ebp
c0100051:	31 c0                	xor    %eax,%eax
c0100053:	89 e5                	mov    %esp,%ebp
c0100055:	57                   	push   %edi
c0100056:	56                   	push   %esi
c0100057:	53                   	push   %ebx
c0100058:	83 ec 3c             	sub    $0x3c,%esp
c010005b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010005e:	85 db                	test   %ebx,%ebx
c0100060:	0f 8e 36 02 00 00    	jle    c010029c <mm_malloc+0x24c>
c0100066:	e8 25 12 00 00       	call   c0101290 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 2e 12 00 00       	call   c01012a0 <get_ucr3>
c0100072:	8b 55 08             	mov    0x8(%ebp),%edx
c0100075:	8d 5c 1a ff          	lea    -0x1(%edx,%ebx,1),%ebx
c0100079:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c010007c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010007f:	b8 00 10 00 00       	mov    $0x1000,%eax
c0100084:	29 d0                	sub    %edx,%eax
c0100086:	89 da                	mov    %ebx,%edx
c0100088:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c010008e:	01 d0                	add    %edx,%eax
c0100090:	85 c0                	test   %eax,%eax
c0100092:	0f 8e c0 00 00 00    	jle    c0100158 <mm_malloc+0x108>
c0100098:	8b 55 08             	mov    0x8(%ebp),%edx
c010009b:	83 e8 01             	sub    $0x1,%eax
c010009e:	89 f7                	mov    %esi,%edi
c01000a0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01000a5:	8d 84 02 00 10 00 00 	lea    0x1000(%edx,%eax,1),%eax
c01000ac:	89 d3                	mov    %edx,%ebx
c01000ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01000b1:	eb 51                	jmp    c0100104 <mm_malloc+0xb4>
c01000b3:	90                   	nop
c01000b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01000b8:	8b 31                	mov    (%ecx),%esi
c01000ba:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
c01000c0:	81 ee 00 00 00 40    	sub    $0x40000000,%esi
c01000c6:	89 d8                	mov    %ebx,%eax
c01000c8:	c1 e8 0a             	shr    $0xa,%eax
c01000cb:	25 fc 0f 00 00       	and    $0xffc,%eax
c01000d0:	01 c6                	add    %eax,%esi
c01000d2:	f6 06 01             	testb  $0x1,(%esi)
c01000d5:	75 22                	jne    c01000f9 <mm_malloc+0xa9>
c01000d7:	a1 a0 b0 10 c0       	mov    0xc010b0a0,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 a0 b0 10 c0       	mov    %eax,0xc010b0a0
c01000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
c01000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
c0100102:	74 54                	je     c0100158 <mm_malloc+0x108>
c0100104:	89 d8                	mov    %ebx,%eax
c0100106:	c1 e8 16             	shr    $0x16,%eax
c0100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
c010010c:	f6 01 01             	testb  $0x1,(%ecx)
c010010f:	75 a7                	jne    c01000b8 <mm_malloc+0x68>
c0100111:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c0100116:	89 c6                	mov    %eax,%esi
c0100118:	83 c0 01             	add    $0x1,%eax
c010011b:	c1 e6 0c             	shl    $0xc,%esi
c010011e:	81 c6 00 d0 10 c0    	add    $0xc010d000,%esi
c0100124:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c0100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
c010012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100134:	83 c8 07             	or     $0x7,%eax
c0100137:	89 01                	mov    %eax,(%ecx)
c0100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100140:	00 
c0100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100148:	00 
c0100149:	89 34 24             	mov    %esi,(%esp)
c010014c:	e8 b7 19 00 00       	call   c0101b08 <memset>
c0100151:	e9 70 ff ff ff       	jmp    c01000c6 <mm_malloc+0x76>
c0100156:	66 90                	xchg   %ax,%ax
c0100158:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010015b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010015e:	81 eb 00 00 00 40    	sub    $0x40000000,%ebx
c0100164:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
c010016a:	c1 e8 16             	shr    $0x16,%eax
c010016d:	8b 34 83             	mov    (%ebx,%eax,4),%esi
c0100170:	f7 c6 01 00 00 00    	test   $0x1,%esi
c0100176:	75 32                	jne    c01001aa <mm_malloc+0x15a>
c0100178:	c7 44 24 10 a4 83 10 	movl   $0xc01083a4,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 08 84 10 	movl   $0xc0108408,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 93 83 10 	movl   $0xc0108393,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 b4 83 10 c0 	movl   $0xc01083b4,(%esp)
c010019f:	e8 1c 14 00 00       	call   c01015c0 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 ac 83 10 	movl   $0xc01083ac,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 08 84 10 	movl   $0xc0108408,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 93 83 10 	movl   $0xc0108393,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 b4 83 10 c0 	movl   $0xc01083b4,(%esp)
c01001ee:	e8 cd 13 00 00       	call   c01015c0 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 a4 83 10 	movl   $0xc01083a4,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 08 84 10 	movl   $0xc0108408,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 93 83 10 	movl   $0xc0108393,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 b4 83 10 c0 	movl   $0xc01083b4,(%esp)
c010022e:	e8 8d 13 00 00       	call   c01015c0 <printk>
c0100233:	b8 01 00 00 00       	mov    $0x1,%eax
c0100238:	d6                   	(bad)  
c0100239:	8b 55 08             	mov    0x8(%ebp),%edx
c010023c:	8d 83 00 00 00 c0    	lea    -0x40000000(%ebx),%eax
c0100242:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100247:	c1 ea 0c             	shr    $0xc,%edx
c010024a:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c0100250:	8b 1c 90             	mov    (%eax,%edx,4),%ebx
c0100253:	f6 c3 01             	test   $0x1,%bl
c0100256:	75 32                	jne    c010028a <mm_malloc+0x23a>
c0100258:	c7 44 24 10 ac 83 10 	movl   $0xc01083ac,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 08 84 10 	movl   $0xc0108408,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 93 83 10 	movl   $0xc0108393,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 b4 83 10 c0 	movl   $0xc01083b4,(%esp)
c010027f:	e8 3c 13 00 00       	call   c01015c0 <printk>
c0100284:	b8 01 00 00 00       	mov    $0x1,%eax
c0100289:	d6                   	(bad)  
c010028a:	8b 55 08             	mov    0x8(%ebp),%edx
c010028d:	89 d8                	mov    %ebx,%eax
c010028f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100294:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
c010029a:	09 d0                	or     %edx,%eax
c010029c:	83 c4 3c             	add    $0x3c,%esp
c010029f:	5b                   	pop    %ebx
c01002a0:	5e                   	pop    %esi
c01002a1:	5f                   	pop    %edi
c01002a2:	5d                   	pop    %ebp
c01002a3:	c3                   	ret    
c01002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01002a8:	c7 44 24 10 80 83 10 	movl   $0xc0108380,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c fe 83 10 	movl   $0xc01083fe,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 93 83 10 	movl   $0xc0108393,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 b4 83 10 c0 	movl   $0xc01083b4,(%esp)
c01002cf:	e8 ec 12 00 00       	call   c01015c0 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 a0 b0 10 c0       	mov    0xc010b0a0,%eax
c01002df:	e9 03 fe ff ff       	jmp    c01000e7 <mm_malloc+0x97>

c01002e4 <vec0>:
c01002e4:	6a 00                	push   $0x0
c01002e6:	6a 00                	push   $0x0
c01002e8:	e9 ab 00 00 00       	jmp    c0100398 <asm_do_irq>

c01002ed <vec1>:
c01002ed:	6a 00                	push   $0x0
c01002ef:	6a 01                	push   $0x1
c01002f1:	e9 a2 00 00 00       	jmp    c0100398 <asm_do_irq>

c01002f6 <vec2>:
c01002f6:	6a 00                	push   $0x0
c01002f8:	6a 02                	push   $0x2
c01002fa:	e9 99 00 00 00       	jmp    c0100398 <asm_do_irq>

c01002ff <vec3>:
c01002ff:	6a 00                	push   $0x0
c0100301:	6a 03                	push   $0x3
c0100303:	e9 90 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100308 <vec4>:
c0100308:	6a 00                	push   $0x0
c010030a:	6a 04                	push   $0x4
c010030c:	e9 87 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100311 <vec5>:
c0100311:	6a 00                	push   $0x0
c0100313:	6a 05                	push   $0x5
c0100315:	e9 7e 00 00 00       	jmp    c0100398 <asm_do_irq>

c010031a <vec6>:
c010031a:	6a 00                	push   $0x0
c010031c:	6a 06                	push   $0x6
c010031e:	e9 75 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100323 <vec7>:
c0100323:	6a 00                	push   $0x0
c0100325:	6a 07                	push   $0x7
c0100327:	e9 6c 00 00 00       	jmp    c0100398 <asm_do_irq>

c010032c <vec8>:
c010032c:	6a 08                	push   $0x8
c010032e:	e9 65 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100333 <vec9>:
c0100333:	6a 00                	push   $0x0
c0100335:	6a 09                	push   $0x9
c0100337:	e9 5c 00 00 00       	jmp    c0100398 <asm_do_irq>

c010033c <vec10>:
c010033c:	6a 0a                	push   $0xa
c010033e:	e9 55 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100343 <vec11>:
c0100343:	6a 0b                	push   $0xb
c0100345:	e9 4e 00 00 00       	jmp    c0100398 <asm_do_irq>

c010034a <vec12>:
c010034a:	6a 0c                	push   $0xc
c010034c:	e9 47 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100351 <vec13>:
c0100351:	6a 0d                	push   $0xd
c0100353:	e9 40 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100358 <vec14>:
c0100358:	6a 0e                	push   $0xe
c010035a:	e9 39 00 00 00       	jmp    c0100398 <asm_do_irq>

c010035f <vecsys>:
c010035f:	6a 00                	push   $0x0
c0100361:	68 80 00 00 00       	push   $0x80
c0100366:	e9 2d 00 00 00       	jmp    c0100398 <asm_do_irq>

c010036b <irq0>:
c010036b:	6a 00                	push   $0x0
c010036d:	68 e8 03 00 00       	push   $0x3e8
c0100372:	e9 21 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100377 <irq1>:
c0100377:	6a 00                	push   $0x0
c0100379:	68 e9 03 00 00       	push   $0x3e9
c010037e:	e9 15 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100383 <irq14>:
c0100383:	6a 00                	push   $0x0
c0100385:	68 f6 03 00 00       	push   $0x3f6
c010038a:	e9 09 00 00 00       	jmp    c0100398 <asm_do_irq>

c010038f <irq_empty>:
c010038f:	6a 00                	push   $0x0
c0100391:	6a ff                	push   $0xffffffff
c0100393:	e9 00 00 00 00       	jmp    c0100398 <asm_do_irq>

c0100398 <asm_do_irq>:
c0100398:	60                   	pusha  
c0100399:	54                   	push   %esp
c010039a:	e8 a1 08 00 00       	call   c0100c40 <irq_handle>
c010039f:	83 c4 04             	add    $0x4,%esp
c01003a2:	61                   	popa   
c01003a3:	83 c4 08             	add    $0x8,%esp
c01003a6:	cf                   	iret   
c01003a7:	66 90                	xchg   %ax,%ax
c01003a9:	66 90                	xchg   %ax,%ax
c01003ab:	66 90                	xchg   %ax,%ax
c01003ad:	66 90                	xchg   %ax,%ax
c01003af:	90                   	nop

c01003b0 <fs_open>:
c01003b0:	55                   	push   %ebp
c01003b1:	89 e5                	mov    %esp,%ebp
c01003b3:	57                   	push   %edi
c01003b4:	56                   	push   %esi
c01003b5:	53                   	push   %ebx
c01003b6:	83 ec 0c             	sub    $0xc,%esp
c01003b9:	8b 7d 08             	mov    0x8(%ebp),%edi
c01003bc:	85 ff                	test   %edi,%edi
c01003be:	74 7b                	je     c010043b <fs_open+0x8b>
c01003c0:	be 00 86 10 c0       	mov    $0xc0108600,%esi
c01003c5:	31 db                	xor    %ebx,%ebx
c01003c7:	eb 12                	jmp    c01003db <fs_open+0x2b>
c01003c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01003d0:	83 c3 01             	add    $0x1,%ebx
c01003d3:	83 c6 0c             	add    $0xc,%esi
c01003d6:	83 fb 19             	cmp    $0x19,%ebx
c01003d9:	74 35                	je     c0100410 <fs_open+0x60>
c01003db:	83 ec 08             	sub    $0x8,%esp
c01003de:	ff 36                	pushl  (%esi)
c01003e0:	57                   	push   %edi
c01003e1:	e8 aa 17 00 00       	call   c0101b90 <strcmp>
c01003e6:	83 c4 10             	add    $0x10,%esp
c01003e9:	85 c0                	test   %eax,%eax
c01003eb:	75 e3                	jne    c01003d0 <fs_open+0x20>
c01003ed:	8d 43 03             	lea    0x3(%ebx),%eax
c01003f0:	c6 04 c5 00 d0 12 c0 	movb   $0x1,-0x3fed3000(,%eax,8)
c01003f7:	01 
c01003f8:	c7 04 c5 04 d0 12 c0 	movl   $0x0,-0x3fed2ffc(,%eax,8)
c01003ff:	00 00 00 00 
c0100403:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100406:	5b                   	pop    %ebx
c0100407:	5e                   	pop    %esi
c0100408:	5f                   	pop    %edi
c0100409:	5d                   	pop    %ebp
c010040a:	c3                   	ret    
c010040b:	90                   	nop
c010040c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100410:	83 ec 0c             	sub    $0xc,%esp
c0100413:	68 2a 84 10 c0       	push   $0xc010842a
c0100418:	68 e3 85 10 c0       	push   $0xc01085e3
c010041d:	6a 3b                	push   $0x3b
c010041f:	68 17 84 10 c0       	push   $0xc0108417
c0100424:	68 b4 83 10 c0       	push   $0xc01083b4
c0100429:	e8 92 11 00 00       	call   c01015c0 <printk>
c010042e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100433:	d6                   	(bad)  
c0100434:	83 c4 20             	add    $0x20,%esp
c0100437:	b0 1c                	mov    $0x1c,%al
c0100439:	eb b5                	jmp    c01003f0 <fs_open+0x40>
c010043b:	83 ec 0c             	sub    $0xc,%esp
c010043e:	68 0e 84 10 c0       	push   $0xc010840e
c0100443:	68 e3 85 10 c0       	push   $0xc01085e3
c0100448:	6a 34                	push   $0x34
c010044a:	68 17 84 10 c0       	push   $0xc0108417
c010044f:	68 b4 83 10 c0       	push   $0xc01083b4
c0100454:	e8 67 11 00 00       	call   c01015c0 <printk>
c0100459:	b8 01 00 00 00       	mov    $0x1,%eax
c010045e:	d6                   	(bad)  
c010045f:	83 c4 20             	add    $0x20,%esp
c0100462:	e9 59 ff ff ff       	jmp    c01003c0 <fs_open+0x10>
c0100467:	89 f6                	mov    %esi,%esi
c0100469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100470 <fs_read>:
c0100470:	55                   	push   %ebp
c0100471:	89 e5                	mov    %esp,%ebp
c0100473:	57                   	push   %edi
c0100474:	56                   	push   %esi
c0100475:	53                   	push   %ebx
c0100476:	83 ec 0c             	sub    $0xc,%esp
c0100479:	8b 7d 08             	mov    0x8(%ebp),%edi
c010047c:	8d 77 fd             	lea    -0x3(%edi),%esi
c010047f:	83 fe 18             	cmp    $0x18,%esi
c0100482:	0f 87 d8 00 00 00    	ja     c0100560 <fs_read+0xf0>
c0100488:	80 3c fd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%edi,8)
c010048f:	00 
c0100490:	0f 84 9a 00 00 00    	je     c0100530 <fs_read+0xc0>
c0100496:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100499:	85 d2                	test   %edx,%edx
c010049b:	0f 84 ff 00 00 00    	je     c01005a0 <fs_read+0x130>
c01004a1:	8b 45 10             	mov    0x10(%ebp),%eax
c01004a4:	85 c0                	test   %eax,%eax
c01004a6:	74 58                	je     c0100500 <fs_read+0x90>
c01004a8:	8d 1c 76             	lea    (%esi,%esi,2),%ebx
c01004ab:	8b 04 fd 04 d0 12 c0 	mov    -0x3fed2ffc(,%edi,8),%eax
c01004b2:	8b 1c 9d 04 86 10 c0 	mov    -0x3fef79fc(,%ebx,4),%ebx
c01004b9:	29 c3                	sub    %eax,%ebx
c01004bb:	85 db                	test   %ebx,%ebx
c01004bd:	0f 8e cd 00 00 00    	jle    c0100590 <fs_read+0x120>
c01004c3:	3b 5d 10             	cmp    0x10(%ebp),%ebx
c01004c6:	7f 30                	jg     c01004f8 <fs_read+0x88>
c01004c8:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
c01004cb:	83 ec 04             	sub    $0x4,%esp
c01004ce:	53                   	push   %ebx
c01004cf:	03 04 8d 08 86 10 c0 	add    -0x3fef79f8(,%ecx,4),%eax
c01004d6:	50                   	push   %eax
c01004d7:	ff 75 0c             	pushl  0xc(%ebp)
c01004da:	e8 41 12 00 00       	call   c0101720 <ide_read>
c01004df:	01 1c fd 04 d0 12 c0 	add    %ebx,-0x3fed2ffc(,%edi,8)
c01004e6:	83 c4 10             	add    $0x10,%esp
c01004e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01004ec:	89 d8                	mov    %ebx,%eax
c01004ee:	5b                   	pop    %ebx
c01004ef:	5e                   	pop    %esi
c01004f0:	5f                   	pop    %edi
c01004f1:	5d                   	pop    %ebp
c01004f2:	c3                   	ret    
c01004f3:	90                   	nop
c01004f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01004f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01004fb:	eb cb                	jmp    c01004c8 <fs_read+0x58>
c01004fd:	8d 76 00             	lea    0x0(%esi),%esi
c0100500:	83 ec 0c             	sub    $0xc,%esp
c0100503:	68 69 84 10 c0       	push   $0xc0108469
c0100508:	68 db 85 10 c0       	push   $0xc01085db
c010050d:	6a 48                	push   $0x48
c010050f:	68 17 84 10 c0       	push   $0xc0108417
c0100514:	68 b4 83 10 c0       	push   $0xc01083b4
c0100519:	e8 a2 10 00 00       	call   c01015c0 <printk>
c010051e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100523:	d6                   	(bad)  
c0100524:	83 c4 20             	add    $0x20,%esp
c0100527:	e9 7c ff ff ff       	jmp    c01004a8 <fs_read+0x38>
c010052c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100530:	83 ec 0c             	sub    $0xc,%esp
c0100533:	68 54 84 10 c0       	push   $0xc0108454
c0100538:	68 db 85 10 c0       	push   $0xc01085db
c010053d:	6a 45                	push   $0x45
c010053f:	68 17 84 10 c0       	push   $0xc0108417
c0100544:	68 b4 83 10 c0       	push   $0xc01083b4
c0100549:	e8 72 10 00 00       	call   c01015c0 <printk>
c010054e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100553:	d6                   	(bad)  
c0100554:	83 c4 20             	add    $0x20,%esp
c0100557:	e9 3a ff ff ff       	jmp    c0100496 <fs_read+0x26>
c010055c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	68 37 84 10 c0       	push   $0xc0108437
c0100568:	68 db 85 10 c0       	push   $0xc01085db
c010056d:	6a 44                	push   $0x44
c010056f:	68 17 84 10 c0       	push   $0xc0108417
c0100574:	68 b4 83 10 c0       	push   $0xc01083b4
c0100579:	e8 42 10 00 00       	call   c01015c0 <printk>
c010057e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100583:	d6                   	(bad)  
c0100584:	83 c4 20             	add    $0x20,%esp
c0100587:	e9 fc fe ff ff       	jmp    c0100488 <fs_read+0x18>
c010058c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100590:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100593:	31 db                	xor    %ebx,%ebx
c0100595:	89 d8                	mov    %ebx,%eax
c0100597:	5b                   	pop    %ebx
c0100598:	5e                   	pop    %esi
c0100599:	5f                   	pop    %edi
c010059a:	5d                   	pop    %ebp
c010059b:	c3                   	ret    
c010059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005a0:	83 ec 0c             	sub    $0xc,%esp
c01005a3:	68 65 84 10 c0       	push   $0xc0108465
c01005a8:	68 db 85 10 c0       	push   $0xc01085db
c01005ad:	6a 47                	push   $0x47
c01005af:	68 17 84 10 c0       	push   $0xc0108417
c01005b4:	68 b4 83 10 c0       	push   $0xc01083b4
c01005b9:	e8 02 10 00 00       	call   c01015c0 <printk>
c01005be:	b8 01 00 00 00       	mov    $0x1,%eax
c01005c3:	d6                   	(bad)  
c01005c4:	83 c4 20             	add    $0x20,%esp
c01005c7:	e9 d5 fe ff ff       	jmp    c01004a1 <fs_read+0x31>
c01005cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01005d0 <fs_write>:
c01005d0:	55                   	push   %ebp
c01005d1:	89 e5                	mov    %esp,%ebp
c01005d3:	57                   	push   %edi
c01005d4:	56                   	push   %esi
c01005d5:	53                   	push   %ebx
c01005d6:	83 ec 0c             	sub    $0xc,%esp
c01005d9:	8b 7d 08             	mov    0x8(%ebp),%edi
c01005dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01005df:	8b 75 10             	mov    0x10(%ebp),%esi
c01005e2:	8d 47 ff             	lea    -0x1(%edi),%eax
c01005e5:	83 f8 1a             	cmp    $0x1a,%eax
c01005e8:	0f 87 ba 00 00 00    	ja     c01006a8 <fs_write+0xd8>
c01005ee:	85 db                	test   %ebx,%ebx
c01005f0:	0f 84 5a 01 00 00    	je     c0100750 <fs_write+0x180>
c01005f6:	85 f6                	test   %esi,%esi
c01005f8:	74 76                	je     c0100670 <fs_write+0xa0>
c01005fa:	83 ff 01             	cmp    $0x1,%edi
c01005fd:	0f 84 d5 00 00 00    	je     c01006d8 <fs_write+0x108>
c0100603:	83 ff 02             	cmp    $0x2,%edi
c0100606:	0f 84 70 01 00 00    	je     c010077c <fs_write+0x1ac>
c010060c:	80 3c fd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%edi,8)
c0100613:	00 
c0100614:	0f 84 f6 00 00 00    	je     c0100710 <fs_write+0x140>
c010061a:	8d 57 fd             	lea    -0x3(%edi),%edx
c010061d:	8b 0c fd 04 d0 12 c0 	mov    -0x3fed2ffc(,%edi,8),%ecx
c0100624:	8d 04 52             	lea    (%edx,%edx,2),%eax
c0100627:	8b 04 85 04 86 10 c0 	mov    -0x3fef79fc(,%eax,4),%eax
c010062e:	29 c8                	sub    %ecx,%eax
c0100630:	85 c0                	test   %eax,%eax
c0100632:	0f 8e 08 01 00 00    	jle    c0100740 <fs_write+0x170>
c0100638:	39 c6                	cmp    %eax,%esi
c010063a:	7f 2c                	jg     c0100668 <fs_write+0x98>
c010063c:	8d 04 52             	lea    (%edx,%edx,2),%eax
c010063f:	83 ec 04             	sub    $0x4,%esp
c0100642:	56                   	push   %esi
c0100643:	03 0c 85 08 86 10 c0 	add    -0x3fef79f8(,%eax,4),%ecx
c010064a:	51                   	push   %ecx
c010064b:	53                   	push   %ebx
c010064c:	e8 0f 11 00 00       	call   c0101760 <ide_write>
c0100651:	01 34 fd 04 d0 12 c0 	add    %esi,-0x3fed2ffc(,%edi,8)
c0100658:	83 c4 10             	add    $0x10,%esp
c010065b:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010065e:	89 f0                	mov    %esi,%eax
c0100660:	5b                   	pop    %ebx
c0100661:	5e                   	pop    %esi
c0100662:	5f                   	pop    %edi
c0100663:	5d                   	pop    %ebp
c0100664:	c3                   	ret    
c0100665:	8d 76 00             	lea    0x0(%esi),%esi
c0100668:	89 c6                	mov    %eax,%esi
c010066a:	eb d0                	jmp    c010063c <fs_write+0x6c>
c010066c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100670:	83 ec 0c             	sub    $0xc,%esp
c0100673:	68 69 84 10 c0       	push   $0xc0108469
c0100678:	68 d2 85 10 c0       	push   $0xc01085d2
c010067d:	6a 5d                	push   $0x5d
c010067f:	68 17 84 10 c0       	push   $0xc0108417
c0100684:	68 b4 83 10 c0       	push   $0xc01083b4
c0100689:	e8 32 0f 00 00       	call   c01015c0 <printk>
c010068e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100693:	d6                   	(bad)  
c0100694:	83 c4 20             	add    $0x20,%esp
c0100697:	83 ff 01             	cmp    $0x1,%edi
c010069a:	0f 85 63 ff ff ff    	jne    c0100603 <fs_write+0x33>
c01006a0:	eb b9                	jmp    c010065b <fs_write+0x8b>
c01006a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01006a8:	83 ec 0c             	sub    $0xc,%esp
c01006ab:	68 6d 84 10 c0       	push   $0xc010846d
c01006b0:	68 d2 85 10 c0       	push   $0xc01085d2
c01006b5:	6a 5b                	push   $0x5b
c01006b7:	68 17 84 10 c0       	push   $0xc0108417
c01006bc:	68 b4 83 10 c0       	push   $0xc01083b4
c01006c1:	e8 fa 0e 00 00       	call   c01015c0 <printk>
c01006c6:	b8 01 00 00 00       	mov    $0x1,%eax
c01006cb:	d6                   	(bad)  
c01006cc:	83 c4 20             	add    $0x20,%esp
c01006cf:	e9 1a ff ff ff       	jmp    c01005ee <fs_write+0x1e>
c01006d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006d8:	85 f6                	test   %esi,%esi
c01006da:	0f 8e 7b ff ff ff    	jle    c010065b <fs_write+0x8b>
c01006e0:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
c01006e3:	90                   	nop
c01006e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006e8:	0f be 03             	movsbl (%ebx),%eax
c01006eb:	83 ec 0c             	sub    $0xc,%esp
c01006ee:	83 c3 01             	add    $0x1,%ebx
c01006f1:	50                   	push   %eax
c01006f2:	e8 69 0f 00 00       	call   c0101660 <serial_printc>
c01006f7:	83 c4 10             	add    $0x10,%esp
c01006fa:	39 fb                	cmp    %edi,%ebx
c01006fc:	75 ea                	jne    c01006e8 <fs_write+0x118>
c01006fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100701:	89 f0                	mov    %esi,%eax
c0100703:	5b                   	pop    %ebx
c0100704:	5e                   	pop    %esi
c0100705:	5f                   	pop    %edi
c0100706:	5d                   	pop    %ebp
c0100707:	c3                   	ret    
c0100708:	90                   	nop
c0100709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100710:	83 ec 0c             	sub    $0xc,%esp
c0100713:	68 54 84 10 c0       	push   $0xc0108454
c0100718:	68 d2 85 10 c0       	push   $0xc01085d2
c010071d:	6a 6d                	push   $0x6d
c010071f:	68 17 84 10 c0       	push   $0xc0108417
c0100724:	68 b4 83 10 c0       	push   $0xc01083b4
c0100729:	e8 92 0e 00 00       	call   c01015c0 <printk>
c010072e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100733:	d6                   	(bad)  
c0100734:	83 c4 20             	add    $0x20,%esp
c0100737:	e9 de fe ff ff       	jmp    c010061a <fs_write+0x4a>
c010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100740:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100743:	31 f6                	xor    %esi,%esi
c0100745:	89 f0                	mov    %esi,%eax
c0100747:	5b                   	pop    %ebx
c0100748:	5e                   	pop    %esi
c0100749:	5f                   	pop    %edi
c010074a:	5d                   	pop    %ebp
c010074b:	c3                   	ret    
c010074c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100750:	83 ec 0c             	sub    $0xc,%esp
c0100753:	68 65 84 10 c0       	push   $0xc0108465
c0100758:	68 d2 85 10 c0       	push   $0xc01085d2
c010075d:	6a 5c                	push   $0x5c
c010075f:	68 17 84 10 c0       	push   $0xc0108417
c0100764:	68 b4 83 10 c0       	push   $0xc01083b4
c0100769:	e8 52 0e 00 00       	call   c01015c0 <printk>
c010076e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100773:	d6                   	(bad)  
c0100774:	83 c4 20             	add    $0x20,%esp
c0100777:	e9 7a fe ff ff       	jmp    c01005f6 <fs_write+0x26>
c010077c:	83 ec 0c             	sub    $0xc,%esp
c010077f:	68 89 84 10 c0       	push   $0xc0108489
c0100784:	68 d2 85 10 c0       	push   $0xc01085d2
c0100789:	6a 69                	push   $0x69
c010078b:	68 17 84 10 c0       	push   $0xc0108417
c0100790:	68 b4 83 10 c0       	push   $0xc01083b4
c0100795:	e8 26 0e 00 00       	call   c01015c0 <printk>
c010079a:	b8 01 00 00 00       	mov    $0x1,%eax
c010079f:	d6                   	(bad)  
c01007a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
c01007a5:	83 c4 20             	add    $0x20,%esp
c01007a8:	e9 ae fe ff ff       	jmp    c010065b <fs_write+0x8b>
c01007ad:	8d 76 00             	lea    0x0(%esi),%esi

c01007b0 <fs_lseek>:
c01007b0:	55                   	push   %ebp
c01007b1:	89 e5                	mov    %esp,%ebp
c01007b3:	57                   	push   %edi
c01007b4:	56                   	push   %esi
c01007b5:	53                   	push   %ebx
c01007b6:	83 ec 0c             	sub    $0xc,%esp
c01007b9:	8b 7d 08             	mov    0x8(%ebp),%edi
c01007bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01007bf:	8d 77 fd             	lea    -0x3(%edi),%esi
c01007c2:	83 fe 18             	cmp    $0x18,%esi
c01007c5:	0f 87 25 01 00 00    	ja     c01008f0 <fs_lseek+0x140>
c01007cb:	80 3c fd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%edi,8)
c01007d2:	00 
c01007d3:	0f 84 c7 00 00 00    	je     c01008a0 <fs_lseek+0xf0>
c01007d9:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
c01007dd:	0f 84 f1 00 00 00    	je     c01008d4 <fs_lseek+0x124>
c01007e3:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
c01007e7:	0f 84 33 01 00 00    	je     c0100920 <fs_lseek+0x170>
c01007ed:	8b 45 10             	mov    0x10(%ebp),%eax
c01007f0:	85 c0                	test   %eax,%eax
c01007f2:	74 6c                	je     c0100860 <fs_lseek+0xb0>
c01007f4:	83 ec 0c             	sub    $0xc,%esp
c01007f7:	68 89 84 10 c0       	push   $0xc0108489
c01007fc:	68 c9 85 10 c0       	push   $0xc01085c9
c0100801:	68 88 00 00 00       	push   $0x88
c0100806:	68 17 84 10 c0       	push   $0xc0108417
c010080b:	68 b4 83 10 c0       	push   $0xc01083b4
c0100810:	e8 ab 0d 00 00       	call   c01015c0 <printk>
c0100815:	b8 01 00 00 00       	mov    $0x1,%eax
c010081a:	d6                   	(bad)  
c010081b:	8d 04 76             	lea    (%esi,%esi,2),%eax
c010081e:	83 c4 20             	add    $0x20,%esp
c0100821:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0100826:	8b 34 85 04 86 10 c0 	mov    -0x3fef79fc(,%eax,4),%esi
c010082d:	83 fe ff             	cmp    $0xffffffff,%esi
c0100830:	75 40                	jne    c0100872 <fs_lseek+0xc2>
c0100832:	83 ec 0c             	sub    $0xc,%esp
c0100835:	68 50 85 10 c0       	push   $0xc0108550
c010083a:	68 c9 85 10 c0       	push   $0xc01085c9
c010083f:	68 8c 00 00 00       	push   $0x8c
c0100844:	68 17 84 10 c0       	push   $0xc0108417
c0100849:	68 b4 83 10 c0       	push   $0xc01083b4
c010084e:	e8 6d 0d 00 00       	call   c01015c0 <printk>
c0100853:	b8 01 00 00 00       	mov    $0x1,%eax
c0100858:	d6                   	(bad)  
c0100859:	83 c4 20             	add    $0x20,%esp
c010085c:	eb 1a                	jmp    c0100878 <fs_lseek+0xc8>
c010085e:	66 90                	xchg   %ax,%ax
c0100860:	8d 04 76             	lea    (%esi,%esi,2),%eax
c0100863:	8b 04 85 04 86 10 c0 	mov    -0x3fef79fc(,%eax,4),%eax
c010086a:	39 c3                	cmp    %eax,%ebx
c010086c:	89 de                	mov    %ebx,%esi
c010086e:	76 20                	jbe    c0100890 <fs_lseek+0xe0>
c0100870:	89 c6                	mov    %eax,%esi
c0100872:	85 f6                	test   %esi,%esi
c0100874:	89 f3                	mov    %esi,%ebx
c0100876:	78 ba                	js     c0100832 <fs_lseek+0x82>
c0100878:	89 34 fd 04 d0 12 c0 	mov    %esi,-0x3fed2ffc(,%edi,8)
c010087f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100882:	89 d8                	mov    %ebx,%eax
c0100884:	5b                   	pop    %ebx
c0100885:	5e                   	pop    %esi
c0100886:	5f                   	pop    %edi
c0100887:	5d                   	pop    %ebp
c0100888:	c3                   	ret    
c0100889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100890:	85 db                	test   %ebx,%ebx
c0100892:	79 e4                	jns    c0100878 <fs_lseek+0xc8>
c0100894:	eb 9c                	jmp    c0100832 <fs_lseek+0x82>
c0100896:	8d 76 00             	lea    0x0(%esi),%esi
c0100899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01008a0:	83 ec 0c             	sub    $0xc,%esp
c01008a3:	68 54 84 10 c0       	push   $0xc0108454
c01008a8:	68 c9 85 10 c0       	push   $0xc01085c9
c01008ad:	68 81 00 00 00       	push   $0x81
c01008b2:	68 17 84 10 c0       	push   $0xc0108417
c01008b7:	68 b4 83 10 c0       	push   $0xc01083b4
c01008bc:	e8 ff 0c 00 00       	call   c01015c0 <printk>
c01008c1:	b8 01 00 00 00       	mov    $0x1,%eax
c01008c6:	d6                   	(bad)  
c01008c7:	83 c4 20             	add    $0x20,%esp
c01008ca:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
c01008ce:	0f 85 0f ff ff ff    	jne    c01007e3 <fs_lseek+0x33>
c01008d4:	8d 04 76             	lea    (%esi,%esi,2),%eax
c01008d7:	03 1c fd 04 d0 12 c0 	add    -0x3fed2ffc(,%edi,8),%ebx
c01008de:	8b 04 85 04 86 10 c0 	mov    -0x3fef79fc(,%eax,4),%eax
c01008e5:	eb 83                	jmp    c010086a <fs_lseek+0xba>
c01008e7:	89 f6                	mov    %esi,%esi
c01008e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01008f0:	83 ec 0c             	sub    $0xc,%esp
c01008f3:	68 37 84 10 c0       	push   $0xc0108437
c01008f8:	68 c9 85 10 c0       	push   $0xc01085c9
c01008fd:	68 80 00 00 00       	push   $0x80
c0100902:	68 17 84 10 c0       	push   $0xc0108417
c0100907:	68 b4 83 10 c0       	push   $0xc01083b4
c010090c:	e8 af 0c 00 00       	call   c01015c0 <printk>
c0100911:	b8 01 00 00 00       	mov    $0x1,%eax
c0100916:	d6                   	(bad)  
c0100917:	83 c4 20             	add    $0x20,%esp
c010091a:	e9 ac fe ff ff       	jmp    c01007cb <fs_lseek+0x1b>
c010091f:	90                   	nop
c0100920:	8d 04 76             	lea    (%esi,%esi,2),%eax
c0100923:	8b 04 85 04 86 10 c0 	mov    -0x3fef79fc(,%eax,4),%eax
c010092a:	01 c3                	add    %eax,%ebx
c010092c:	e9 39 ff ff ff       	jmp    c010086a <fs_lseek+0xba>
c0100931:	eb 0d                	jmp    c0100940 <fs_close>
c0100933:	90                   	nop
c0100934:	90                   	nop
c0100935:	90                   	nop
c0100936:	90                   	nop
c0100937:	90                   	nop
c0100938:	90                   	nop
c0100939:	90                   	nop
c010093a:	90                   	nop
c010093b:	90                   	nop
c010093c:	90                   	nop
c010093d:	90                   	nop
c010093e:	90                   	nop
c010093f:	90                   	nop

c0100940 <fs_close>:
c0100940:	55                   	push   %ebp
c0100941:	89 e5                	mov    %esp,%ebp
c0100943:	53                   	push   %ebx
c0100944:	83 ec 04             	sub    $0x4,%esp
c0100947:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010094a:	8d 43 fd             	lea    -0x3(%ebx),%eax
c010094d:	83 f8 18             	cmp    $0x18,%eax
c0100950:	76 2a                	jbe    c010097c <fs_close+0x3c>
c0100952:	83 ec 0c             	sub    $0xc,%esp
c0100955:	68 37 84 10 c0       	push   $0xc0108437
c010095a:	68 c0 85 10 c0       	push   $0xc01085c0
c010095f:	68 92 00 00 00       	push   $0x92
c0100964:	68 17 84 10 c0       	push   $0xc0108417
c0100969:	68 b4 83 10 c0       	push   $0xc01083b4
c010096e:	e8 4d 0c 00 00       	call   c01015c0 <printk>
c0100973:	b8 01 00 00 00       	mov    $0x1,%eax
c0100978:	d6                   	(bad)  
c0100979:	83 c4 20             	add    $0x20,%esp
c010097c:	c6 04 dd 00 d0 12 c0 	movb   $0x0,-0x3fed3000(,%ebx,8)
c0100983:	00 
c0100984:	31 c0                	xor    %eax,%eax
c0100986:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100989:	c9                   	leave  
c010098a:	c3                   	ret    
c010098b:	66 90                	xchg   %ax,%ax
c010098d:	66 90                	xchg   %ax,%ax
c010098f:	90                   	nop

c0100990 <init_cond>:
c0100990:	55                   	push   %ebp
c0100991:	89 e5                	mov    %esp,%ebp
c0100993:	53                   	push   %ebx
c0100994:	83 ec 04             	sub    $0x4,%esp
c0100997:	e8 34 0a 00 00       	call   c01013d0 <init_segment>
c010099c:	e8 ff 03 00 00       	call   c0100da0 <init_idt>
c01009a1:	e8 8a 03 00 00       	call   c0100d30 <init_i8259>
c01009a6:	e8 75 0c 00 00       	call   c0101620 <init_serial>
c01009ab:	e8 30 0e 00 00       	call   c01017e0 <init_ide>
c01009b0:	fb                   	sti    
c01009b1:	e8 2a 09 00 00       	call   c01012e0 <init_mm>
c01009b6:	68 bf 87 10 c0       	push   $0xc01087bf
c01009bb:	6a 4a                	push   $0x4a
c01009bd:	68 2c 87 10 c0       	push   $0xc010872c
c01009c2:	68 40 87 10 c0       	push   $0xc0108740
c01009c7:	e8 f4 0b 00 00       	call   c01015c0 <printk>
c01009cc:	e8 2f 08 00 00       	call   c0101200 <video_mapping_write_test>
c01009d1:	e8 aa 0a 00 00       	call   c0101480 <loader>
c01009d6:	89 c3                	mov    %eax,%ebx
c01009d8:	e8 43 08 00 00       	call   c0101220 <video_mapping_read_test>
c01009dd:	e8 8e 08 00 00       	call   c0101270 <video_mapping_clear>
c01009e2:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01009e7:	bd 00 00 00 00       	mov    $0x0,%ebp
c01009ec:	83 ec 10             	sub    $0x10,%esp
c01009ef:	ff d3                	call   *%ebx
c01009f1:	68 bf 87 10 c0       	push   $0xc01087bf
c01009f6:	6a 6b                	push   $0x6b
c01009f8:	68 2c 87 10 c0       	push   $0xc010872c
c01009fd:	68 74 87 10 c0       	push   $0xc0108774
c0100a02:	e8 b9 0b 00 00       	call   c01015c0 <printk>
c0100a07:	b8 01 00 00 00       	mov    $0x1,%eax
c0100a0c:	d6                   	(bad)  
c0100a0d:	83 c4 20             	add    $0x20,%esp
c0100a10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100a13:	c9                   	leave  
c0100a14:	c3                   	ret    
c0100a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100a20 <init>:
c0100a20:	55                   	push   %ebp
c0100a21:	89 e5                	mov    %esp,%ebp
c0100a23:	83 ec 08             	sub    $0x8,%esp
c0100a26:	e8 25 09 00 00       	call   c0101350 <init_page>
c0100a2b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100a31:	b8 90 09 10 c0       	mov    $0xc0100990,%eax
c0100a36:	ff e0                	jmp    *%eax
c0100a38:	68 c9 87 10 c0       	push   $0xc01087c9
c0100a3d:	6a 24                	push   $0x24
c0100a3f:	68 2c 87 10 c0       	push   $0xc010872c
c0100a44:	68 74 87 10 c0       	push   $0xc0108774
c0100a49:	e8 72 0b 00 00       	call   c01015c0 <printk>
c0100a4e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100a53:	d6                   	(bad)  
c0100a54:	83 c4 10             	add    $0x10,%esp
c0100a57:	c9                   	leave  
c0100a58:	c3                   	ret    
c0100a59:	66 90                	xchg   %ax,%ax
c0100a5b:	66 90                	xchg   %ax,%ax
c0100a5d:	66 90                	xchg   %ax,%ax
c0100a5f:	90                   	nop

c0100a60 <do_syscall>:
c0100a60:	55                   	push   %ebp
c0100a61:	89 e5                	mov    %esp,%ebp
c0100a63:	53                   	push   %ebx
c0100a64:	83 ec 04             	sub    $0x4,%esp
c0100a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100a6a:	8b 43 1c             	mov    0x1c(%ebx),%eax
c0100a6d:	83 f8 2d             	cmp    $0x2d,%eax
c0100a70:	0f 87 ea 00 00 00    	ja     c0100b60 <do_syscall+0x100>
c0100a76:	ff 24 85 44 88 10 c0 	jmp    *-0x3fef77bc(,%eax,4)
c0100a7d:	8d 76 00             	lea    0x0(%esi),%esi
c0100a80:	83 ec 0c             	sub    $0xc,%esp
c0100a83:	ff 73 10             	pushl  0x10(%ebx)
c0100a86:	e8 25 08 00 00       	call   c01012b0 <mm_brk>
c0100a8b:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
c0100a92:	83 c4 10             	add    $0x10,%esp
c0100a95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100a98:	c9                   	leave  
c0100a99:	c3                   	ret    
c0100a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100aa0:	fa                   	cli    
c0100aa1:	83 ec 08             	sub    $0x8,%esp
c0100aa4:	ff 73 18             	pushl  0x18(%ebx)
c0100aa7:	ff 73 10             	pushl  0x10(%ebx)
c0100aaa:	e8 e1 00 00 00       	call   c0100b90 <add_irq_handle>
c0100aaf:	fb                   	sti    
c0100ab0:	83 c4 10             	add    $0x10,%esp
c0100ab3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ab6:	c9                   	leave  
c0100ab7:	c3                   	ret    
c0100ab8:	90                   	nop
c0100ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100ac0:	83 ec 04             	sub    $0x4,%esp
c0100ac3:	ff 73 14             	pushl  0x14(%ebx)
c0100ac6:	ff 73 18             	pushl  0x18(%ebx)
c0100ac9:	ff 73 10             	pushl  0x10(%ebx)
c0100acc:	e8 9f f9 ff ff       	call   c0100470 <fs_read>
c0100ad1:	83 c4 10             	add    $0x10,%esp
c0100ad4:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100ad7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ada:	c9                   	leave  
c0100adb:	c3                   	ret    
c0100adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ae0:	83 ec 04             	sub    $0x4,%esp
c0100ae3:	ff 73 14             	pushl  0x14(%ebx)
c0100ae6:	ff 73 18             	pushl  0x18(%ebx)
c0100ae9:	ff 73 10             	pushl  0x10(%ebx)
c0100aec:	e8 df fa ff ff       	call   c01005d0 <fs_write>
c0100af1:	83 c4 10             	add    $0x10,%esp
c0100af4:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100af7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100afa:	c9                   	leave  
c0100afb:	c3                   	ret    
c0100afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b00:	83 ec 08             	sub    $0x8,%esp
c0100b03:	ff 73 18             	pushl  0x18(%ebx)
c0100b06:	ff 73 10             	pushl  0x10(%ebx)
c0100b09:	e8 a2 f8 ff ff       	call   c01003b0 <fs_open>
c0100b0e:	83 c4 10             	add    $0x10,%esp
c0100b11:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100b14:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b17:	c9                   	leave  
c0100b18:	c3                   	ret    
c0100b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b20:	83 ec 0c             	sub    $0xc,%esp
c0100b23:	ff 73 10             	pushl  0x10(%ebx)
c0100b26:	e8 15 fe ff ff       	call   c0100940 <fs_close>
c0100b2b:	83 c4 10             	add    $0x10,%esp
c0100b2e:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100b31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b34:	c9                   	leave  
c0100b35:	c3                   	ret    
c0100b36:	8d 76 00             	lea    0x0(%esi),%esi
c0100b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100b40:	83 ec 04             	sub    $0x4,%esp
c0100b43:	ff 73 14             	pushl  0x14(%ebx)
c0100b46:	ff 73 18             	pushl  0x18(%ebx)
c0100b49:	ff 73 10             	pushl  0x10(%ebx)
c0100b4c:	e8 5f fc ff ff       	call   c01007b0 <fs_lseek>
c0100b51:	83 c4 10             	add    $0x10,%esp
c0100b54:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100b57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b5a:	c9                   	leave  
c0100b5b:	c3                   	ret    
c0100b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b60:	83 ec 0c             	sub    $0xc,%esp
c0100b63:	50                   	push   %eax
c0100b64:	68 fc 88 10 c0       	push   $0xc01088fc
c0100b69:	6a 30                	push   $0x30
c0100b6b:	68 d0 87 10 c0       	push   $0xc01087d0
c0100b70:	68 f0 87 10 c0       	push   $0xc01087f0
c0100b75:	e8 46 0a 00 00       	call   c01015c0 <printk>
c0100b7a:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b7f:	d6                   	(bad)  
c0100b80:	83 c4 20             	add    $0x20,%esp
c0100b83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b86:	c9                   	leave  
c0100b87:	c3                   	ret    
c0100b88:	66 90                	xchg   %ax,%ax
c0100b8a:	66 90                	xchg   %ax,%ax
c0100b8c:	66 90                	xchg   %ax,%ax
c0100b8e:	66 90                	xchg   %ax,%ax

c0100b90 <add_irq_handle>:
c0100b90:	55                   	push   %ebp
c0100b91:	89 e5                	mov    %esp,%ebp
c0100b93:	53                   	push   %ebx
c0100b94:	83 ec 04             	sub    $0x4,%esp
c0100b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100b9a:	83 fb 0f             	cmp    $0xf,%ebx
c0100b9d:	7f 71                	jg     c0100c10 <add_irq_handle+0x80>
c0100b9f:	a1 00 d1 12 c0       	mov    0xc012d100,%eax
c0100ba4:	83 f8 20             	cmp    $0x20,%eax
c0100ba7:	7e 2c                	jle    c0100bd5 <add_irq_handle+0x45>
c0100ba9:	83 ec 0c             	sub    $0xc,%esp
c0100bac:	68 36 89 10 c0       	push   $0xc0108936
c0100bb1:	68 1d 8a 10 c0       	push   $0xc0108a1d
c0100bb6:	6a 16                	push   $0x16
c0100bb8:	68 1a 89 10 c0       	push   $0xc010891a
c0100bbd:	68 b4 83 10 c0       	push   $0xc01083b4
c0100bc2:	e8 f9 09 00 00       	call   c01015c0 <printk>
c0100bc7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100bcc:	d6                   	(bad)  
c0100bcd:	a1 00 d1 12 c0       	mov    0xc012d100,%eax
c0100bd2:	83 c4 20             	add    $0x20,%esp
c0100bd5:	8d 50 01             	lea    0x1(%eax),%edx
c0100bd8:	89 15 00 d1 12 c0    	mov    %edx,0xc012d100
c0100bde:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100be1:	89 14 c5 80 d1 12 c0 	mov    %edx,-0x3fed2e80(,%eax,8)
c0100be8:	8b 14 9d 40 d1 12 c0 	mov    -0x3fed2ec0(,%ebx,4),%edx
c0100bef:	89 14 c5 84 d1 12 c0 	mov    %edx,-0x3fed2e7c(,%eax,8)
c0100bf6:	8d 04 c5 80 d1 12 c0 	lea    -0x3fed2e80(,%eax,8),%eax
c0100bfd:	89 04 9d 40 d1 12 c0 	mov    %eax,-0x3fed2ec0(,%ebx,4)
c0100c04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c07:	c9                   	leave  
c0100c08:	c3                   	ret    
c0100c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100c10:	83 ec 0c             	sub    $0xc,%esp
c0100c13:	68 07 89 10 c0       	push   $0xc0108907
c0100c18:	68 1d 8a 10 c0       	push   $0xc0108a1d
c0100c1d:	6a 15                	push   $0x15
c0100c1f:	68 1a 89 10 c0       	push   $0xc010891a
c0100c24:	68 b4 83 10 c0       	push   $0xc01083b4
c0100c29:	e8 92 09 00 00       	call   c01015c0 <printk>
c0100c2e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100c33:	d6                   	(bad)  
c0100c34:	83 c4 20             	add    $0x20,%esp
c0100c37:	e9 63 ff ff ff       	jmp    c0100b9f <add_irq_handle+0xf>
c0100c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100c40 <irq_handle>:
c0100c40:	55                   	push   %ebp
c0100c41:	89 e5                	mov    %esp,%ebp
c0100c43:	53                   	push   %ebx
c0100c44:	83 ec 04             	sub    $0x4,%esp
c0100c47:	8b 55 08             	mov    0x8(%ebp),%edx
c0100c4a:	8b 42 20             	mov    0x20(%edx),%eax
c0100c4d:	85 c0                	test   %eax,%eax
c0100c4f:	0f 88 9b 00 00 00    	js     c0100cf0 <irq_handle+0xb0>
c0100c55:	3d 80 00 00 00       	cmp    $0x80,%eax
c0100c5a:	0f 84 b8 00 00 00    	je     c0100d18 <irq_handle+0xd8>
c0100c60:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100c65:	7e 59                	jle    c0100cc0 <irq_handle+0x80>
c0100c67:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c0100c6d:	83 fb 0f             	cmp    $0xf,%ebx
c0100c70:	7f 1e                	jg     c0100c90 <irq_handle+0x50>
c0100c72:	8b 1c 9d 40 d1 12 c0 	mov    -0x3fed2ec0(,%ebx,4),%ebx
c0100c79:	85 db                	test   %ebx,%ebx
c0100c7b:	74 0c                	je     c0100c89 <irq_handle+0x49>
c0100c7d:	8d 76 00             	lea    0x0(%esi),%esi
c0100c80:	ff 13                	call   *(%ebx)
c0100c82:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100c85:	85 db                	test   %ebx,%ebx
c0100c87:	75 f7                	jne    c0100c80 <irq_handle+0x40>
c0100c89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c8c:	c9                   	leave  
c0100c8d:	c3                   	ret    
c0100c8e:	66 90                	xchg   %ax,%ax
c0100c90:	83 ec 0c             	sub    $0xc,%esp
c0100c93:	68 54 89 10 c0       	push   $0xc0108954
c0100c98:	68 12 8a 10 c0       	push   $0xc0108a12
c0100c9d:	6a 32                	push   $0x32
c0100c9f:	68 1a 89 10 c0       	push   $0xc010891a
c0100ca4:	68 b4 83 10 c0       	push   $0xc01083b4
c0100ca9:	e8 12 09 00 00       	call   c01015c0 <printk>
c0100cae:	b8 01 00 00 00       	mov    $0x1,%eax
c0100cb3:	d6                   	(bad)  
c0100cb4:	83 c4 20             	add    $0x20,%esp
c0100cb7:	eb b9                	jmp    c0100c72 <irq_handle+0x32>
c0100cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100cc0:	83 ec 08             	sub    $0x8,%esp
c0100cc3:	ff 72 28             	pushl  0x28(%edx)
c0100cc6:	50                   	push   %eax
c0100cc7:	68 12 8a 10 c0       	push   $0xc0108a12
c0100ccc:	6a 2f                	push   $0x2f
c0100cce:	68 1a 89 10 c0       	push   $0xc010891a
c0100cd3:	68 b8 89 10 c0       	push   $0xc01089b8
c0100cd8:	e8 e3 08 00 00       	call   c01015c0 <printk>
c0100cdd:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ce2:	d6                   	(bad)  
c0100ce3:	83 c4 20             	add    $0x20,%esp
c0100ce6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ce9:	c9                   	leave  
c0100cea:	c3                   	ret    
c0100ceb:	90                   	nop
c0100cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100cf0:	68 12 8a 10 c0       	push   $0xc0108a12
c0100cf5:	6a 29                	push   $0x29
c0100cf7:	68 1a 89 10 c0       	push   $0xc010891a
c0100cfc:	68 6c 89 10 c0       	push   $0xc010896c
c0100d01:	e8 ba 08 00 00       	call   c01015c0 <printk>
c0100d06:	b8 01 00 00 00       	mov    $0x1,%eax
c0100d0b:	d6                   	(bad)  
c0100d0c:	83 c4 10             	add    $0x10,%esp
c0100d0f:	e9 75 ff ff ff       	jmp    c0100c89 <irq_handle+0x49>
c0100d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100d18:	89 55 08             	mov    %edx,0x8(%ebp)
c0100d1b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d1e:	c9                   	leave  
c0100d1f:	e9 3c fd ff ff       	jmp    c0100a60 <do_syscall>
c0100d24:	66 90                	xchg   %ax,%ax
c0100d26:	66 90                	xchg   %ax,%ax
c0100d28:	66 90                	xchg   %ax,%ax
c0100d2a:	66 90                	xchg   %ax,%ax
c0100d2c:	66 90                	xchg   %ax,%ax
c0100d2e:	66 90                	xchg   %ax,%ax

c0100d30 <init_i8259>:
c0100d30:	55                   	push   %ebp
c0100d31:	ba 21 00 00 00       	mov    $0x21,%edx
c0100d36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0100d3b:	89 e5                	mov    %esp,%ebp
c0100d3d:	ee                   	out    %al,(%dx)
c0100d3e:	b2 a1                	mov    $0xa1,%dl
c0100d40:	ee                   	out    %al,(%dx)
c0100d41:	b8 11 00 00 00       	mov    $0x11,%eax
c0100d46:	b2 20                	mov    $0x20,%dl
c0100d48:	ee                   	out    %al,(%dx)
c0100d49:	b8 20 00 00 00       	mov    $0x20,%eax
c0100d4e:	b2 21                	mov    $0x21,%dl
c0100d50:	ee                   	out    %al,(%dx)
c0100d51:	b8 04 00 00 00       	mov    $0x4,%eax
c0100d56:	ee                   	out    %al,(%dx)
c0100d57:	b8 03 00 00 00       	mov    $0x3,%eax
c0100d5c:	ee                   	out    %al,(%dx)
c0100d5d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100d62:	b2 a0                	mov    $0xa0,%dl
c0100d64:	ee                   	out    %al,(%dx)
c0100d65:	b8 28 00 00 00       	mov    $0x28,%eax
c0100d6a:	b2 a1                	mov    $0xa1,%dl
c0100d6c:	ee                   	out    %al,(%dx)
c0100d6d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100d72:	ee                   	out    %al,(%dx)
c0100d73:	b8 03 00 00 00       	mov    $0x3,%eax
c0100d78:	ee                   	out    %al,(%dx)
c0100d79:	b8 68 00 00 00       	mov    $0x68,%eax
c0100d7e:	b2 20                	mov    $0x20,%dl
c0100d80:	ee                   	out    %al,(%dx)
c0100d81:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100d86:	ee                   	out    %al,(%dx)
c0100d87:	b8 68 00 00 00       	mov    $0x68,%eax
c0100d8c:	b2 a0                	mov    $0xa0,%dl
c0100d8e:	ee                   	out    %al,(%dx)
c0100d8f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100d94:	ee                   	out    %al,(%dx)
c0100d95:	5d                   	pop    %ebp
c0100d96:	c3                   	ret    
c0100d97:	66 90                	xchg   %ax,%ax
c0100d99:	66 90                	xchg   %ax,%ax
c0100d9b:	66 90                	xchg   %ax,%ax
c0100d9d:	66 90                	xchg   %ax,%ax
c0100d9f:	90                   	nop

c0100da0 <init_idt>:
c0100da0:	55                   	push   %ebp
c0100da1:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100da6:	b8 c0 d2 12 c0       	mov    $0xc012d2c0,%eax
c0100dab:	89 d1                	mov    %edx,%ecx
c0100dad:	c1 ea 10             	shr    $0x10,%edx
c0100db0:	89 e5                	mov    %esp,%ebp
c0100db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100db8:	66 89 08             	mov    %cx,(%eax)
c0100dbb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100dc1:	83 c0 08             	add    $0x8,%eax
c0100dc4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100dc8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c0100dcc:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100dd0:	3d c0 da 12 c0       	cmp    $0xc012dac0,%eax
c0100dd5:	75 e1                	jne    c0100db8 <init_idt+0x18>
c0100dd7:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c0100ddc:	ba 08 00 00 00       	mov    $0x8,%edx
c0100de1:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100de6:	66 a3 c0 d2 12 c0    	mov    %ax,0xc012d2c0
c0100dec:	c1 e8 10             	shr    $0x10,%eax
c0100def:	66 89 15 c2 d2 12 c0 	mov    %dx,0xc012d2c2
c0100df6:	66 a3 c6 d2 12 c0    	mov    %ax,0xc012d2c6
c0100dfc:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100e01:	ba 08 00 00 00       	mov    $0x8,%edx
c0100e06:	66 a3 c8 d2 12 c0    	mov    %ax,0xc012d2c8
c0100e0c:	c1 e8 10             	shr    $0x10,%eax
c0100e0f:	66 89 0d ca d2 12 c0 	mov    %cx,0xc012d2ca
c0100e16:	66 a3 ce d2 12 c0    	mov    %ax,0xc012d2ce
c0100e1c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100e21:	66 89 15 d2 d2 12 c0 	mov    %dx,0xc012d2d2
c0100e28:	66 a3 d0 d2 12 c0    	mov    %ax,0xc012d2d0
c0100e2e:	c1 e8 10             	shr    $0x10,%eax
c0100e31:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100e36:	66 a3 d6 d2 12 c0    	mov    %ax,0xc012d2d6
c0100e3c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100e41:	ba 08 00 00 00       	mov    $0x8,%edx
c0100e46:	66 a3 d8 d2 12 c0    	mov    %ax,0xc012d2d8
c0100e4c:	c1 e8 10             	shr    $0x10,%eax
c0100e4f:	66 89 0d da d2 12 c0 	mov    %cx,0xc012d2da
c0100e56:	66 a3 de d2 12 c0    	mov    %ax,0xc012d2de
c0100e5c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100e61:	66 89 15 e2 d2 12 c0 	mov    %dx,0xc012d2e2
c0100e68:	66 a3 e0 d2 12 c0    	mov    %ax,0xc012d2e0
c0100e6e:	c1 e8 10             	shr    $0x10,%eax
c0100e71:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100e76:	66 a3 e6 d2 12 c0    	mov    %ax,0xc012d2e6
c0100e7c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100e81:	ba 08 00 00 00       	mov    $0x8,%edx
c0100e86:	66 a3 e8 d2 12 c0    	mov    %ax,0xc012d2e8
c0100e8c:	c1 e8 10             	shr    $0x10,%eax
c0100e8f:	66 89 0d ea d2 12 c0 	mov    %cx,0xc012d2ea
c0100e96:	66 a3 ee d2 12 c0    	mov    %ax,0xc012d2ee
c0100e9c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100ea1:	66 89 15 f2 d2 12 c0 	mov    %dx,0xc012d2f2
c0100ea8:	66 a3 f0 d2 12 c0    	mov    %ax,0xc012d2f0
c0100eae:	c1 e8 10             	shr    $0x10,%eax
c0100eb1:	c6 05 c4 d2 12 c0 00 	movb   $0x0,0xc012d2c4
c0100eb8:	c6 05 c5 d2 12 c0 8f 	movb   $0x8f,0xc012d2c5
c0100ebf:	c6 05 cc d2 12 c0 00 	movb   $0x0,0xc012d2cc
c0100ec6:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100ecb:	c6 05 cd d2 12 c0 8f 	movb   $0x8f,0xc012d2cd
c0100ed2:	c6 05 d4 d2 12 c0 00 	movb   $0x0,0xc012d2d4
c0100ed9:	ba 08 00 00 00       	mov    $0x8,%edx
c0100ede:	c6 05 d5 d2 12 c0 8f 	movb   $0x8f,0xc012d2d5
c0100ee5:	c6 05 dc d2 12 c0 00 	movb   $0x0,0xc012d2dc
c0100eec:	c6 05 dd d2 12 c0 8f 	movb   $0x8f,0xc012d2dd
c0100ef3:	c6 05 e4 d2 12 c0 00 	movb   $0x0,0xc012d2e4
c0100efa:	c6 05 e5 d2 12 c0 8f 	movb   $0x8f,0xc012d2e5
c0100f01:	c6 05 ec d2 12 c0 00 	movb   $0x0,0xc012d2ec
c0100f08:	c6 05 ed d2 12 c0 8f 	movb   $0x8f,0xc012d2ed
c0100f0f:	c6 05 f4 d2 12 c0 00 	movb   $0x0,0xc012d2f4
c0100f16:	c6 05 f5 d2 12 c0 8f 	movb   $0x8f,0xc012d2f5
c0100f1d:	66 a3 f6 d2 12 c0    	mov    %ax,0xc012d2f6
c0100f23:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100f28:	66 a3 f8 d2 12 c0    	mov    %ax,0xc012d2f8
c0100f2e:	c1 e8 10             	shr    $0x10,%eax
c0100f31:	66 89 0d fa d2 12 c0 	mov    %cx,0xc012d2fa
c0100f38:	66 a3 fe d2 12 c0    	mov    %ax,0xc012d2fe
c0100f3e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0100f43:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100f48:	66 a3 00 d3 12 c0    	mov    %ax,0xc012d300
c0100f4e:	c1 e8 10             	shr    $0x10,%eax
c0100f51:	66 89 15 02 d3 12 c0 	mov    %dx,0xc012d302
c0100f58:	66 a3 06 d3 12 c0    	mov    %ax,0xc012d306
c0100f5e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100f63:	66 89 0d 0a d3 12 c0 	mov    %cx,0xc012d30a
c0100f6a:	66 a3 08 d3 12 c0    	mov    %ax,0xc012d308
c0100f70:	c1 e8 10             	shr    $0x10,%eax
c0100f73:	ba 08 00 00 00       	mov    $0x8,%edx
c0100f78:	66 a3 0e d3 12 c0    	mov    %ax,0xc012d30e
c0100f7e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100f83:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100f88:	66 a3 10 d3 12 c0    	mov    %ax,0xc012d310
c0100f8e:	c1 e8 10             	shr    $0x10,%eax
c0100f91:	66 89 15 12 d3 12 c0 	mov    %dx,0xc012d312
c0100f98:	66 a3 16 d3 12 c0    	mov    %ax,0xc012d316
c0100f9e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100fa3:	66 89 0d 1a d3 12 c0 	mov    %cx,0xc012d31a
c0100faa:	66 a3 18 d3 12 c0    	mov    %ax,0xc012d318
c0100fb0:	c1 e8 10             	shr    $0x10,%eax
c0100fb3:	ba 08 00 00 00       	mov    $0x8,%edx
c0100fb8:	66 a3 1e d3 12 c0    	mov    %ax,0xc012d31e
c0100fbe:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100fc3:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100fc8:	66 a3 20 d3 12 c0    	mov    %ax,0xc012d320
c0100fce:	c1 e8 10             	shr    $0x10,%eax
c0100fd1:	66 89 15 22 d3 12 c0 	mov    %dx,0xc012d322
c0100fd8:	66 a3 26 d3 12 c0    	mov    %ax,0xc012d326
c0100fde:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100fe3:	66 89 0d 2a d3 12 c0 	mov    %cx,0xc012d32a
c0100fea:	66 a3 28 d3 12 c0    	mov    %ax,0xc012d328
c0100ff0:	c1 e8 10             	shr    $0x10,%eax
c0100ff3:	c6 05 fc d2 12 c0 00 	movb   $0x0,0xc012d2fc
c0100ffa:	c6 05 fd d2 12 c0 8f 	movb   $0x8f,0xc012d2fd
c0101001:	c6 05 04 d3 12 c0 00 	movb   $0x0,0xc012d304
c0101008:	b9 08 00 00 00       	mov    $0x8,%ecx
c010100d:	c6 05 05 d3 12 c0 8f 	movb   $0x8f,0xc012d305
c0101014:	c6 05 0c d3 12 c0 00 	movb   $0x0,0xc012d30c
c010101b:	ba 08 00 00 00       	mov    $0x8,%edx
c0101020:	c6 05 0d d3 12 c0 8f 	movb   $0x8f,0xc012d30d
c0101027:	c6 05 14 d3 12 c0 00 	movb   $0x0,0xc012d314
c010102e:	c6 05 15 d3 12 c0 8f 	movb   $0x8f,0xc012d315
c0101035:	c6 05 1c d3 12 c0 00 	movb   $0x0,0xc012d31c
c010103c:	c6 05 1d d3 12 c0 8f 	movb   $0x8f,0xc012d31d
c0101043:	c6 05 24 d3 12 c0 00 	movb   $0x0,0xc012d324
c010104a:	c6 05 25 d3 12 c0 8f 	movb   $0x8f,0xc012d325
c0101051:	c6 05 2c d3 12 c0 00 	movb   $0x0,0xc012d32c
c0101058:	66 a3 2e d3 12 c0    	mov    %ax,0xc012d32e
c010105e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0101063:	66 89 0d c2 d6 12 c0 	mov    %cx,0xc012d6c2
c010106a:	66 a3 30 d3 12 c0    	mov    %ax,0xc012d330
c0101070:	c1 e8 10             	shr    $0x10,%eax
c0101073:	b9 08 00 00 00       	mov    $0x8,%ecx
c0101078:	66 a3 36 d3 12 c0    	mov    %ax,0xc012d336
c010107e:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0101083:	66 89 15 32 d3 12 c0 	mov    %dx,0xc012d332
c010108a:	66 a3 c0 d6 12 c0    	mov    %ax,0xc012d6c0
c0101090:	c1 e8 10             	shr    $0x10,%eax
c0101093:	ba 08 00 00 00       	mov    $0x8,%edx
c0101098:	66 a3 c6 d6 12 c0    	mov    %ax,0xc012d6c6
c010109e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c01010a3:	66 89 0d ca d3 12 c0 	mov    %cx,0xc012d3ca
c01010aa:	66 a3 c0 d3 12 c0    	mov    %ax,0xc012d3c0
c01010b0:	c1 e8 10             	shr    $0x10,%eax
c01010b3:	b9 ff 07 00 00       	mov    $0x7ff,%ecx
c01010b8:	66 a3 c6 d3 12 c0    	mov    %ax,0xc012d3c6
c01010be:	b8 77 03 10 c0       	mov    $0xc0100377,%eax
c01010c3:	66 89 0d 80 d2 12 c0 	mov    %cx,0xc012d280
c01010ca:	66 a3 c8 d3 12 c0    	mov    %ax,0xc012d3c8
c01010d0:	c1 e8 10             	shr    $0x10,%eax
c01010d3:	66 89 15 c2 d3 12 c0 	mov    %dx,0xc012d3c2
c01010da:	66 a3 ce d3 12 c0    	mov    %ax,0xc012d3ce
c01010e0:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c01010e5:	ba 08 00 00 00       	mov    $0x8,%edx
c01010ea:	66 a3 30 d4 12 c0    	mov    %ax,0xc012d430
c01010f0:	c1 e8 10             	shr    $0x10,%eax
c01010f3:	c6 05 2d d3 12 c0 8f 	movb   $0x8f,0xc012d32d
c01010fa:	66 a3 36 d4 12 c0    	mov    %ax,0xc012d436
c0101100:	b8 c0 d2 12 c0       	mov    $0xc012d2c0,%eax
c0101105:	c6 05 34 d3 12 c0 00 	movb   $0x0,0xc012d334
c010110c:	66 a3 82 d2 12 c0    	mov    %ax,0xc012d282
c0101112:	c1 e8 10             	shr    $0x10,%eax
c0101115:	c6 05 35 d3 12 c0 8f 	movb   $0x8f,0xc012d335
c010111c:	66 a3 84 d2 12 c0    	mov    %ax,0xc012d284
c0101122:	c6 05 c4 d6 12 c0 00 	movb   $0x0,0xc012d6c4
c0101129:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c010112e:	c6 05 c5 d6 12 c0 ef 	movb   $0xef,0xc012d6c5
c0101135:	c6 05 c4 d3 12 c0 00 	movb   $0x0,0xc012d3c4
c010113c:	c6 05 c5 d3 12 c0 8e 	movb   $0x8e,0xc012d3c5
c0101143:	c6 05 cc d3 12 c0 00 	movb   $0x0,0xc012d3cc
c010114a:	c6 05 cd d3 12 c0 8e 	movb   $0x8e,0xc012d3cd
c0101151:	66 89 15 32 d4 12 c0 	mov    %dx,0xc012d432
c0101158:	c6 05 34 d4 12 c0 00 	movb   $0x0,0xc012d434
c010115f:	c6 05 35 d4 12 c0 8e 	movb   $0x8e,0xc012d435
c0101166:	0f 01 18             	lidtl  (%eax)
c0101169:	5d                   	pop    %ebp
c010116a:	c3                   	ret    
c010116b:	66 90                	xchg   %ax,%ax
c010116d:	66 90                	xchg   %ax,%ax
c010116f:	90                   	nop

c0101170 <create_video_mapping>:
c0101170:	55                   	push   %ebp
c0101171:	89 e5                	mov    %esp,%ebp
c0101173:	53                   	push   %ebx
c0101174:	83 ec 04             	sub    $0x4,%esp
c0101177:	e8 14 01 00 00       	call   c0101290 <get_updir>
c010117c:	89 c3                	mov    %eax,%ebx
c010117e:	e8 0d 01 00 00       	call   c0101290 <get_updir>
c0101183:	39 c3                	cmp    %eax,%ebx
c0101185:	74 27                	je     c01011ae <create_video_mapping+0x3e>
c0101187:	83 ec 0c             	sub    $0xc,%esp
c010118a:	68 2c 8a 10 c0       	push   $0xc0108a2c
c010118f:	68 8f 8a 10 c0       	push   $0xc0108a8f
c0101194:	6a 19                	push   $0x19
c0101196:	68 52 8a 10 c0       	push   $0xc0108a52
c010119b:	68 b4 83 10 c0       	push   $0xc01083b4
c01011a0:	e8 1b 04 00 00       	call   c01015c0 <printk>
c01011a5:	b8 01 00 00 00       	mov    $0x1,%eax
c01011aa:	d6                   	(bad)  
c01011ab:	83 c4 20             	add    $0x20,%esp
c01011ae:	ba 00 e0 12 00       	mov    $0x12e000,%edx
c01011b3:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c01011b8:	b8 80 e2 12 c0       	mov    $0xc012e280,%eax
c01011bd:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c01011c3:	83 ca 07             	or     $0x7,%edx
c01011c6:	89 13                	mov    %edx,(%ebx)
c01011c8:	90                   	nop
c01011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011d0:	89 ca                	mov    %ecx,%edx
c01011d2:	83 c0 04             	add    $0x4,%eax
c01011d5:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c01011db:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c01011e1:	83 ca 07             	or     $0x7,%edx
c01011e4:	89 50 fc             	mov    %edx,-0x4(%eax)
c01011e7:	3d c0 e2 12 c0       	cmp    $0xc012e2c0,%eax
c01011ec:	75 e2                	jne    c01011d0 <create_video_mapping+0x60>
c01011ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01011f1:	c9                   	leave  
c01011f2:	c3                   	ret    
c01011f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01011f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101200 <video_mapping_write_test>:
c0101200:	55                   	push   %ebp
c0101201:	31 c0                	xor    %eax,%eax
c0101203:	89 e5                	mov    %esp,%ebp
c0101205:	8d 76 00             	lea    0x0(%esi),%esi
c0101208:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c010120f:	83 c0 01             	add    $0x1,%eax
c0101212:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0101217:	75 ef                	jne    c0101208 <video_mapping_write_test+0x8>
c0101219:	5d                   	pop    %ebp
c010121a:	c3                   	ret    
c010121b:	90                   	nop
c010121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0101220 <video_mapping_read_test>:
c0101220:	55                   	push   %ebp
c0101221:	89 e5                	mov    %esp,%ebp
c0101223:	56                   	push   %esi
c0101224:	be 01 00 00 00       	mov    $0x1,%esi
c0101229:	53                   	push   %ebx
c010122a:	31 db                	xor    %ebx,%ebx
c010122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101230:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0101237:	74 24                	je     c010125d <video_mapping_read_test+0x3d>
c0101239:	83 ec 0c             	sub    $0xc,%esp
c010123c:	68 6b 8a 10 c0       	push   $0xc0108a6b
c0101241:	68 77 8a 10 c0       	push   $0xc0108a77
c0101246:	6a 30                	push   $0x30
c0101248:	68 52 8a 10 c0       	push   $0xc0108a52
c010124d:	68 b4 83 10 c0       	push   $0xc01083b4
c0101252:	e8 69 03 00 00       	call   c01015c0 <printk>
c0101257:	89 f0                	mov    %esi,%eax
c0101259:	d6                   	(bad)  
c010125a:	83 c4 20             	add    $0x20,%esp
c010125d:	83 c3 01             	add    $0x1,%ebx
c0101260:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0101266:	75 c8                	jne    c0101230 <video_mapping_read_test+0x10>
c0101268:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010126b:	5b                   	pop    %ebx
c010126c:	5e                   	pop    %esi
c010126d:	5d                   	pop    %ebp
c010126e:	c3                   	ret    
c010126f:	90                   	nop

c0101270 <video_mapping_clear>:
c0101270:	55                   	push   %ebp
c0101271:	89 e5                	mov    %esp,%ebp
c0101273:	83 ec 0c             	sub    $0xc,%esp
c0101276:	68 00 fa 00 00       	push   $0xfa00
c010127b:	6a 00                	push   $0x0
c010127d:	68 00 00 0a 00       	push   $0xa0000
c0101282:	e8 81 08 00 00       	call   c0101b08 <memset>
c0101287:	83 c4 10             	add    $0x10,%esp
c010128a:	c9                   	leave  
c010128b:	c3                   	ret    
c010128c:	66 90                	xchg   %ax,%ax
c010128e:	66 90                	xchg   %ax,%ax

c0101290 <get_updir>:
c0101290:	55                   	push   %ebp
c0101291:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c0101296:	89 e5                	mov    %esp,%ebp
c0101298:	5d                   	pop    %ebp
c0101299:	c3                   	ret    
c010129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01012a0 <get_ucr3>:
c01012a0:	55                   	push   %ebp
c01012a1:	a1 04 f0 12 c0       	mov    0xc012f004,%eax
c01012a6:	89 e5                	mov    %esp,%ebp
c01012a8:	5d                   	pop    %ebp
c01012a9:	c3                   	ret    
c01012aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01012b0 <mm_brk>:
c01012b0:	55                   	push   %ebp
c01012b1:	89 e5                	mov    %esp,%ebp
c01012b3:	53                   	push   %ebx
c01012b4:	83 ec 04             	sub    $0x4,%esp
c01012b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01012ba:	a1 00 f0 12 c0       	mov    0xc012f000,%eax
c01012bf:	39 d8                	cmp    %ebx,%eax
c01012c1:	73 11                	jae    c01012d4 <mm_brk+0x24>
c01012c3:	89 da                	mov    %ebx,%edx
c01012c5:	83 ec 08             	sub    $0x8,%esp
c01012c8:	29 c2                	sub    %eax,%edx
c01012ca:	52                   	push   %edx
c01012cb:	50                   	push   %eax
c01012cc:	e8 7f ed ff ff       	call   c0100050 <mm_malloc>
c01012d1:	83 c4 10             	add    $0x10,%esp
c01012d4:	89 1d 00 f0 12 c0    	mov    %ebx,0xc012f000
c01012da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01012dd:	c9                   	leave  
c01012de:	c3                   	ret    
c01012df:	90                   	nop

c01012e0 <init_mm>:
c01012e0:	55                   	push   %ebp
c01012e1:	89 e5                	mov    %esp,%ebp
c01012e3:	53                   	push   %ebx
c01012e4:	83 ec 04             	sub    $0x4,%esp
c01012e7:	e8 54 00 00 00       	call   c0101340 <get_kpdir>
c01012ec:	83 ec 04             	sub    $0x4,%esp
c01012ef:	89 c3                	mov    %eax,%ebx
c01012f1:	68 00 10 00 00       	push   $0x1000
c01012f6:	6a 00                	push   $0x0
c01012f8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c01012fe:	68 00 00 13 c0       	push   $0xc0130000
c0101303:	e8 00 08 00 00       	call   c0101b08 <memset>
c0101308:	83 c4 0c             	add    $0xc,%esp
c010130b:	68 80 00 00 00       	push   $0x80
c0101310:	53                   	push   %ebx
c0101311:	68 00 0c 13 c0       	push   $0xc0130c00
c0101316:	e8 a5 07 00 00       	call   c0101ac0 <memcpy>
c010131b:	b8 00 00 13 00       	mov    $0x130000,%eax
c0101320:	83 c4 10             	add    $0x10,%esp
c0101323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101326:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010132b:	a3 04 f0 12 c0       	mov    %eax,0xc012f004
c0101330:	c9                   	leave  
c0101331:	c3                   	ret    
c0101332:	66 90                	xchg   %ax,%ax
c0101334:	66 90                	xchg   %ax,%ax
c0101336:	66 90                	xchg   %ax,%ax
c0101338:	66 90                	xchg   %ax,%ax
c010133a:	66 90                	xchg   %ax,%ax
c010133c:	66 90                	xchg   %ax,%ax
c010133e:	66 90                	xchg   %ax,%ax

c0101340 <get_kpdir>:
c0101340:	55                   	push   %ebp
c0101341:	b8 00 20 15 c0       	mov    $0xc0152000,%eax
c0101346:	89 e5                	mov    %esp,%ebp
c0101348:	5d                   	pop    %ebp
c0101349:	c3                   	ret    
c010134a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101350 <init_page>:
c0101350:	55                   	push   %ebp
c0101351:	89 e5                	mov    %esp,%ebp
c0101353:	57                   	push   %edi
c0101354:	83 ec 08             	sub    $0x8,%esp
c0101357:	68 00 10 00 00       	push   $0x1000
c010135c:	6a 00                	push   $0x0
c010135e:	68 00 20 15 00       	push   $0x152000
c0101363:	e8 a0 07 00 00       	call   c0101b08 <memset>
c0101368:	b9 00 20 15 00       	mov    $0x152000,%ecx
c010136d:	83 c4 10             	add    $0x10,%esp
c0101370:	ba 00 20 13 00       	mov    $0x132000,%edx
c0101375:	8d 76 00             	lea    0x0(%esi),%esi
c0101378:	89 d0                	mov    %edx,%eax
c010137a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0101380:	83 c1 04             	add    $0x4,%ecx
c0101383:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0101388:	83 c8 07             	or     $0x7,%eax
c010138b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c010138e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0101394:	81 fa 00 20 15 00    	cmp    $0x152000,%edx
c010139a:	75 dc                	jne    c0101378 <init_page+0x28>
c010139c:	bf fc 1f 15 00       	mov    $0x151ffc,%edi
c01013a1:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c01013a6:	fd                   	std    
c01013a7:	ab                   	stos   %eax,%es:(%edi)
c01013a8:	2d 00 10 00 00       	sub    $0x1000,%eax
c01013ad:	7d f8                	jge    c01013a7 <init_page+0x57>
c01013af:	b8 00 20 15 00       	mov    $0x152000,%eax
c01013b4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01013b9:	0f 22 d8             	mov    %eax,%cr3
c01013bc:	0f 20 c0             	mov    %cr0,%eax
c01013bf:	0d 00 00 00 80       	or     $0x80000000,%eax
c01013c4:	0f 22 c0             	mov    %eax,%cr0
c01013c7:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01013ca:	c9                   	leave  
c01013cb:	c3                   	ret    
c01013cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01013d0 <init_segment>:
c01013d0:	55                   	push   %ebp
c01013d1:	89 e5                	mov    %esp,%ebp
c01013d3:	83 ec 0c             	sub    $0xc,%esp
c01013d6:	6a 18                	push   $0x18
c01013d8:	6a 00                	push   $0x0
c01013da:	68 08 10 13 c0       	push   $0xc0131008
c01013df:	e8 24 07 00 00       	call   c0101b08 <memset>
c01013e4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c01013e9:	31 c9                	xor    %ecx,%ecx
c01013eb:	b8 08 10 13 c0       	mov    $0xc0131008,%eax
c01013f0:	66 89 15 10 10 13 c0 	mov    %dx,0xc0131010
c01013f7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c01013fc:	66 89 0d 12 10 13 c0 	mov    %cx,0xc0131012
c0101403:	66 89 15 18 10 13 c0 	mov    %dx,0xc0131018
c010140a:	ba 17 00 00 00       	mov    $0x17,%edx
c010140f:	31 c9                	xor    %ecx,%ecx
c0101411:	66 89 15 00 10 13 c0 	mov    %dx,0xc0131000
c0101418:	66 a3 02 10 13 c0    	mov    %ax,0xc0131002
c010141e:	c1 e8 10             	shr    $0x10,%eax
c0101421:	66 a3 04 10 13 c0    	mov    %ax,0xc0131004
c0101427:	c6 05 14 10 13 c0 00 	movb   $0x0,0xc0131014
c010142e:	b8 00 10 13 c0       	mov    $0xc0131000,%eax
c0101433:	c6 05 15 10 13 c0 9a 	movb   $0x9a,0xc0131015
c010143a:	c6 05 16 10 13 c0 cf 	movb   $0xcf,0xc0131016
c0101441:	c6 05 17 10 13 c0 00 	movb   $0x0,0xc0131017
c0101448:	66 89 0d 1a 10 13 c0 	mov    %cx,0xc013101a
c010144f:	c6 05 1c 10 13 c0 00 	movb   $0x0,0xc013101c
c0101456:	c6 05 1d 10 13 c0 92 	movb   $0x92,0xc013101d
c010145d:	c6 05 1e 10 13 c0 cf 	movb   $0xcf,0xc013101e
c0101464:	c6 05 1f 10 13 c0 00 	movb   $0x0,0xc013101f
c010146b:	0f 01 10             	lgdtl  (%eax)
c010146e:	83 c4 10             	add    $0x10,%esp
c0101471:	c9                   	leave  
c0101472:	c3                   	ret    
c0101473:	66 90                	xchg   %ax,%ax
c0101475:	66 90                	xchg   %ax,%ax
c0101477:	66 90                	xchg   %ax,%ax
c0101479:	66 90                	xchg   %ax,%ax
c010147b:	66 90                	xchg   %ax,%ax
c010147d:	66 90                	xchg   %ax,%ax
c010147f:	90                   	nop

c0101480 <loader>:
c0101480:	55                   	push   %ebp
c0101481:	89 e5                	mov    %esp,%ebp
c0101483:	57                   	push   %edi
c0101484:	56                   	push   %esi
c0101485:	53                   	push   %ebx
c0101486:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c010148c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0101492:	68 00 10 00 00       	push   $0x1000
c0101497:	6a 00                	push   $0x0
c0101499:	53                   	push   %ebx
c010149a:	e8 81 02 00 00       	call   c0101720 <ide_read>
c010149f:	83 c4 10             	add    $0x10,%esp
c01014a2:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c01014a9:	45 4c 46 
c01014ac:	74 06                	je     c01014b4 <loader+0x34>
c01014ae:	b8 01 00 00 00       	mov    $0x1,%eax
c01014b3:	d6                   	(bad)  
c01014b4:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c01014ba:	83 fa 34             	cmp    $0x34,%edx
c01014bd:	74 06                	je     c01014c5 <loader+0x45>
c01014bf:	b8 01 00 00 00       	mov    $0x1,%eax
c01014c4:	d6                   	(bad)  
c01014c5:	31 f6                	xor    %esi,%esi
c01014c7:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c01014ce:	00 
c01014cf:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c01014d3:	75 1c                	jne    c01014f1 <loader+0x71>
c01014d5:	eb 71                	jmp    c0101548 <loader+0xc8>
c01014d7:	89 f6                	mov    %esi,%esi
c01014d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01014e0:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c01014e7:	83 c6 01             	add    $0x1,%esi
c01014ea:	83 c3 20             	add    $0x20,%ebx
c01014ed:	39 f0                	cmp    %esi,%eax
c01014ef:	7e 57                	jle    c0101548 <loader+0xc8>
c01014f1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c01014f5:	75 e9                	jne    c01014e0 <loader+0x60>
c01014f7:	83 ec 08             	sub    $0x8,%esp
c01014fa:	ff 33                	pushl  (%ebx)
c01014fc:	ff 73 f4             	pushl  -0xc(%ebx)
c01014ff:	e8 4c eb ff ff       	call   c0100050 <mm_malloc>
c0101504:	83 c4 0c             	add    $0xc,%esp
c0101507:	ff 73 fc             	pushl  -0x4(%ebx)
c010150a:	ff 73 f0             	pushl  -0x10(%ebx)
c010150d:	50                   	push   %eax
c010150e:	89 c7                	mov    %eax,%edi
c0101510:	e8 0b 02 00 00       	call   c0101720 <ide_read>
c0101515:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0101518:	8b 0b                	mov    (%ebx),%ecx
c010151a:	83 c4 0c             	add    $0xc,%esp
c010151d:	29 d1                	sub    %edx,%ecx
c010151f:	01 fa                	add    %edi,%edx
c0101521:	51                   	push   %ecx
c0101522:	6a 00                	push   $0x0
c0101524:	52                   	push   %edx
c0101525:	e8 de 05 00 00       	call   c0101b08 <memset>
c010152a:	8b 03                	mov    (%ebx),%eax
c010152c:	03 43 f4             	add    -0xc(%ebx),%eax
c010152f:	83 c4 10             	add    $0x10,%esp
c0101532:	83 e8 01             	sub    $0x1,%eax
c0101535:	3b 05 00 f0 12 c0    	cmp    0xc012f000,%eax
c010153b:	76 a3                	jbe    c01014e0 <loader+0x60>
c010153d:	a3 00 f0 12 c0       	mov    %eax,0xc012f000
c0101542:	eb 9c                	jmp    c01014e0 <loader+0x60>
c0101544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101548:	83 ec 08             	sub    $0x8,%esp
c010154b:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0101551:	68 00 00 10 00       	push   $0x100000
c0101556:	68 00 00 f0 bf       	push   $0xbff00000
c010155b:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0101561:	e8 ea ea ff ff       	call   c0100050 <mm_malloc>
c0101566:	e8 05 fc ff ff       	call   c0101170 <create_video_mapping>
c010156b:	e8 30 fd ff ff       	call   c01012a0 <get_ucr3>
c0101570:	0f 22 d8             	mov    %eax,%cr3
c0101573:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0101579:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010157c:	5b                   	pop    %ebx
c010157d:	5e                   	pop    %esi
c010157e:	5f                   	pop    %edi
c010157f:	5d                   	pop    %ebp
c0101580:	c3                   	ret    
c0101581:	66 90                	xchg   %ax,%ax
c0101583:	66 90                	xchg   %ax,%ax
c0101585:	66 90                	xchg   %ax,%ax
c0101587:	66 90                	xchg   %ax,%ax
c0101589:	66 90                	xchg   %ax,%ax
c010158b:	66 90                	xchg   %ax,%ax
c010158d:	66 90                	xchg   %ax,%ax
c010158f:	90                   	nop

c0101590 <sbrk>:
c0101590:	55                   	push   %ebp
c0101591:	89 e5                	mov    %esp,%ebp
c0101593:	83 ec 08             	sub    $0x8,%esp
c0101596:	68 ba 8a 10 c0       	push   $0xc0108aba
c010159b:	6a 08                	push   $0x8
c010159d:	68 a4 8a 10 c0       	push   $0xc0108aa4
c01015a2:	68 74 87 10 c0       	push   $0xc0108774
c01015a7:	e8 14 00 00 00       	call   c01015c0 <printk>
c01015ac:	b8 01 00 00 00       	mov    $0x1,%eax
c01015b1:	d6                   	(bad)  
c01015b2:	30 c0                	xor    %al,%al
c01015b4:	c9                   	leave  
c01015b5:	c3                   	ret    
c01015b6:	66 90                	xchg   %ax,%ax
c01015b8:	66 90                	xchg   %ax,%ax
c01015ba:	66 90                	xchg   %ax,%ax
c01015bc:	66 90                	xchg   %ax,%ax
c01015be:	66 90                	xchg   %ax,%ax

c01015c0 <printk>:
c01015c0:	55                   	push   %ebp
c01015c1:	89 e5                	mov    %esp,%ebp
c01015c3:	56                   	push   %esi
c01015c4:	53                   	push   %ebx
c01015c5:	8d 45 0c             	lea    0xc(%ebp),%eax
c01015c8:	50                   	push   %eax
c01015c9:	ff 75 08             	pushl  0x8(%ebp)
c01015cc:	68 00 01 00 00       	push   $0x100
c01015d1:	68 00 30 15 c0       	push   $0xc0153000
c01015d6:	e8 b5 06 00 00       	call   c0101c90 <vsnprintf>
c01015db:	83 c4 10             	add    $0x10,%esp
c01015de:	85 c0                	test   %eax,%eax
c01015e0:	89 c6                	mov    %eax,%esi
c01015e2:	7e 26                	jle    c010160a <printk+0x4a>
c01015e4:	31 db                	xor    %ebx,%ebx
c01015e6:	8d 76 00             	lea    0x0(%esi),%esi
c01015e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01015f0:	0f be 93 00 30 15 c0 	movsbl -0x3fead000(%ebx),%edx
c01015f7:	83 ec 0c             	sub    $0xc,%esp
c01015fa:	83 c3 01             	add    $0x1,%ebx
c01015fd:	52                   	push   %edx
c01015fe:	e8 5d 00 00 00       	call   c0101660 <serial_printc>
c0101603:	83 c4 10             	add    $0x10,%esp
c0101606:	39 f3                	cmp    %esi,%ebx
c0101608:	75 e6                	jne    c01015f0 <printk+0x30>
c010160a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010160d:	5b                   	pop    %ebx
c010160e:	5e                   	pop    %esi
c010160f:	5d                   	pop    %ebp
c0101610:	c3                   	ret    
c0101611:	66 90                	xchg   %ax,%ax
c0101613:	66 90                	xchg   %ax,%ax
c0101615:	66 90                	xchg   %ax,%ax
c0101617:	66 90                	xchg   %ax,%ax
c0101619:	66 90                	xchg   %ax,%ax
c010161b:	66 90                	xchg   %ax,%ax
c010161d:	66 90                	xchg   %ax,%ax
c010161f:	90                   	nop

c0101620 <init_serial>:
c0101620:	55                   	push   %ebp
c0101621:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0101626:	31 c0                	xor    %eax,%eax
c0101628:	89 e5                	mov    %esp,%ebp
c010162a:	ee                   	out    %al,(%dx)
c010162b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0101630:	b2 fb                	mov    $0xfb,%dl
c0101632:	ee                   	out    %al,(%dx)
c0101633:	b8 01 00 00 00       	mov    $0x1,%eax
c0101638:	b2 f8                	mov    $0xf8,%dl
c010163a:	ee                   	out    %al,(%dx)
c010163b:	31 c0                	xor    %eax,%eax
c010163d:	b2 f9                	mov    $0xf9,%dl
c010163f:	ee                   	out    %al,(%dx)
c0101640:	b8 03 00 00 00       	mov    $0x3,%eax
c0101645:	b2 fb                	mov    $0xfb,%dl
c0101647:	ee                   	out    %al,(%dx)
c0101648:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c010164d:	b2 fa                	mov    $0xfa,%dl
c010164f:	ee                   	out    %al,(%dx)
c0101650:	b8 0b 00 00 00       	mov    $0xb,%eax
c0101655:	b2 fc                	mov    $0xfc,%dl
c0101657:	ee                   	out    %al,(%dx)
c0101658:	5d                   	pop    %ebp
c0101659:	c3                   	ret    
c010165a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101660 <serial_printc>:
c0101660:	55                   	push   %ebp
c0101661:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0101666:	89 e5                	mov    %esp,%ebp
c0101668:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010166b:	90                   	nop
c010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101670:	ec                   	in     (%dx),%al
c0101671:	a8 20                	test   $0x20,%al
c0101673:	74 fb                	je     c0101670 <serial_printc+0x10>
c0101675:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010167a:	89 c8                	mov    %ecx,%eax
c010167c:	ee                   	out    %al,(%dx)
c010167d:	5d                   	pop    %ebp
c010167e:	c3                   	ret    
c010167f:	90                   	nop

c0101680 <ramdisk_read>:
c0101680:	55                   	push   %ebp
c0101681:	89 e5                	mov    %esp,%ebp
c0101683:	53                   	push   %ebx
c0101684:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101687:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010168a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010168d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101690:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101695:	76 06                	jbe    c010169d <ramdisk_read+0x1d>
c0101697:	b8 01 00 00 00       	mov    $0x1,%eax
c010169c:	d6                   	(bad)  
c010169d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c01016a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01016a3:	89 55 0c             	mov    %edx,0xc(%ebp)
c01016a6:	5b                   	pop    %ebx
c01016a7:	5d                   	pop    %ebp
c01016a8:	e9 13 04 00 00       	jmp    c0101ac0 <memcpy>
c01016ad:	8d 76 00             	lea    0x0(%esi),%esi

c01016b0 <ramdisk_write>:
c01016b0:	55                   	push   %ebp
c01016b1:	89 e5                	mov    %esp,%ebp
c01016b3:	53                   	push   %ebx
c01016b4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01016b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01016ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01016bd:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c01016c0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c01016c5:	76 06                	jbe    c01016cd <ramdisk_write+0x1d>
c01016c7:	b8 01 00 00 00       	mov    $0x1,%eax
c01016cc:	d6                   	(bad)  
c01016cd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01016d0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01016d3:	89 55 08             	mov    %edx,0x8(%ebp)
c01016d6:	5b                   	pop    %ebx
c01016d7:	5d                   	pop    %ebp
c01016d8:	e9 e3 03 00 00       	jmp    c0101ac0 <memcpy>
c01016dd:	66 90                	xchg   %ax,%ax
c01016df:	90                   	nop

c01016e0 <ide_intr>:
c01016e0:	55                   	push   %ebp
c01016e1:	c7 05 04 31 15 c0 01 	movl   $0x1,0xc0153104
c01016e8:	00 00 00 
c01016eb:	89 e5                	mov    %esp,%ebp
c01016ed:	5d                   	pop    %ebp
c01016ee:	c3                   	ret    
c01016ef:	90                   	nop

c01016f0 <ide_writeback>:
c01016f0:	a1 00 31 15 c0       	mov    0xc0153100,%eax
c01016f5:	83 c0 01             	add    $0x1,%eax
c01016f8:	83 f8 64             	cmp    $0x64,%eax
c01016fb:	a3 00 31 15 c0       	mov    %eax,0xc0153100
c0101700:	74 06                	je     c0101708 <ide_writeback+0x18>
c0101702:	c3                   	ret    
c0101703:	90                   	nop
c0101704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101708:	55                   	push   %ebp
c0101709:	89 e5                	mov    %esp,%ebp
c010170b:	83 ec 08             	sub    $0x8,%esp
c010170e:	e8 dd 01 00 00       	call   c01018f0 <buf_writeback>
c0101713:	c7 05 00 31 15 c0 00 	movl   $0x0,0xc0153100
c010171a:	00 00 00 
c010171d:	c9                   	leave  
c010171e:	c3                   	ret    
c010171f:	90                   	nop

c0101720 <ide_read>:
c0101720:	55                   	push   %ebp
c0101721:	89 e5                	mov    %esp,%ebp
c0101723:	57                   	push   %edi
c0101724:	56                   	push   %esi
c0101725:	53                   	push   %ebx
c0101726:	83 ec 0c             	sub    $0xc,%esp
c0101729:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010172c:	8b 45 10             	mov    0x10(%ebp),%eax
c010172f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101732:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101735:	29 df                	sub    %ebx,%edi
c0101737:	85 c0                	test   %eax,%eax
c0101739:	74 1b                	je     c0101756 <ide_read+0x36>
c010173b:	90                   	nop
c010173c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101740:	83 ec 0c             	sub    $0xc,%esp
c0101743:	53                   	push   %ebx
c0101744:	e8 07 02 00 00       	call   c0101950 <read_byte>
c0101749:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010174c:	83 c3 01             	add    $0x1,%ebx
c010174f:	83 c4 10             	add    $0x10,%esp
c0101752:	39 f3                	cmp    %esi,%ebx
c0101754:	75 ea                	jne    c0101740 <ide_read+0x20>
c0101756:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101759:	5b                   	pop    %ebx
c010175a:	5e                   	pop    %esi
c010175b:	5f                   	pop    %edi
c010175c:	5d                   	pop    %ebp
c010175d:	c3                   	ret    
c010175e:	66 90                	xchg   %ax,%ax

c0101760 <ide_write>:
c0101760:	55                   	push   %ebp
c0101761:	89 e5                	mov    %esp,%ebp
c0101763:	57                   	push   %edi
c0101764:	56                   	push   %esi
c0101765:	53                   	push   %ebx
c0101766:	83 ec 0c             	sub    $0xc,%esp
c0101769:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010176c:	8b 45 10             	mov    0x10(%ebp),%eax
c010176f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101772:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101775:	29 df                	sub    %ebx,%edi
c0101777:	85 c0                	test   %eax,%eax
c0101779:	74 1d                	je     c0101798 <ide_write+0x38>
c010177b:	90                   	nop
c010177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101780:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101784:	83 ec 08             	sub    $0x8,%esp
c0101787:	50                   	push   %eax
c0101788:	53                   	push   %ebx
c0101789:	83 c3 01             	add    $0x1,%ebx
c010178c:	e8 ef 01 00 00       	call   c0101980 <write_byte>
c0101791:	83 c4 10             	add    $0x10,%esp
c0101794:	39 f3                	cmp    %esi,%ebx
c0101796:	75 e8                	jne    c0101780 <ide_write+0x20>
c0101798:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010179b:	5b                   	pop    %ebx
c010179c:	5e                   	pop    %esi
c010179d:	5f                   	pop    %edi
c010179e:	5d                   	pop    %ebp
c010179f:	c3                   	ret    

c01017a0 <clear_ide_intr>:
c01017a0:	55                   	push   %ebp
c01017a1:	c7 05 04 31 15 c0 00 	movl   $0x0,0xc0153104
c01017a8:	00 00 00 
c01017ab:	89 e5                	mov    %esp,%ebp
c01017ad:	5d                   	pop    %ebp
c01017ae:	c3                   	ret    
c01017af:	90                   	nop

c01017b0 <wait_ide_intr>:
c01017b0:	a1 04 31 15 c0       	mov    0xc0153104,%eax
c01017b5:	55                   	push   %ebp
c01017b6:	89 e5                	mov    %esp,%ebp
c01017b8:	85 c0                	test   %eax,%eax
c01017ba:	75 0e                	jne    c01017ca <wait_ide_intr+0x1a>
c01017bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01017c0:	f4                   	hlt    
c01017c1:	a1 04 31 15 c0       	mov    0xc0153104,%eax
c01017c6:	85 c0                	test   %eax,%eax
c01017c8:	74 f6                	je     c01017c0 <wait_ide_intr+0x10>
c01017ca:	c7 05 04 31 15 c0 00 	movl   $0x0,0xc0153104
c01017d1:	00 00 00 
c01017d4:	5d                   	pop    %ebp
c01017d5:	c3                   	ret    
c01017d6:	8d 76 00             	lea    0x0(%esi),%esi
c01017d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01017e0 <init_ide>:
c01017e0:	55                   	push   %ebp
c01017e1:	89 e5                	mov    %esp,%ebp
c01017e3:	83 ec 08             	sub    $0x8,%esp
c01017e6:	e8 d5 00 00 00       	call   c01018c0 <buf_init>
c01017eb:	83 ec 08             	sub    $0x8,%esp
c01017ee:	68 f0 16 10 c0       	push   $0xc01016f0
c01017f3:	6a 00                	push   $0x0
c01017f5:	e8 96 f3 ff ff       	call   c0100b90 <add_irq_handle>
c01017fa:	58                   	pop    %eax
c01017fb:	5a                   	pop    %edx
c01017fc:	68 e0 16 10 c0       	push   $0xc01016e0
c0101801:	6a 0e                	push   $0xe
c0101803:	e8 88 f3 ff ff       	call   c0100b90 <add_irq_handle>
c0101808:	83 c4 10             	add    $0x10,%esp
c010180b:	c9                   	leave  
c010180c:	c3                   	ret    
c010180d:	66 90                	xchg   %ax,%ax
c010180f:	90                   	nop

c0101810 <buf_fetch>:
c0101810:	55                   	push   %ebp
c0101811:	89 c2                	mov    %eax,%edx
c0101813:	89 e5                	mov    %esp,%ebp
c0101815:	57                   	push   %edi
c0101816:	56                   	push   %esi
c0101817:	53                   	push   %ebx
c0101818:	89 c3                	mov    %eax,%ebx
c010181a:	83 e3 7f             	and    $0x7f,%ebx
c010181d:	89 d8                	mov    %ebx,%eax
c010181f:	83 ec 1c             	sub    $0x1c,%esp
c0101822:	c1 e0 09             	shl    $0x9,%eax
c0101825:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101828:	8d 81 40 31 15 c0    	lea    -0x3feacec0(%ecx),%eax
c010182e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101832:	74 5c                	je     c0101890 <buf_fetch+0x80>
c0101834:	89 d7                	mov    %edx,%edi
c0101836:	89 da                	mov    %ebx,%edx
c0101838:	c1 e2 09             	shl    $0x9,%edx
c010183b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010183e:	8d 91 40 31 15 c0    	lea    -0x3feacec0(%ecx),%edx
c0101844:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010184a:	74 54                	je     c01018a0 <buf_fetch+0x90>
c010184c:	8d 72 06             	lea    0x6(%edx),%esi
c010184f:	83 ec 08             	sub    $0x8,%esp
c0101852:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101855:	57                   	push   %edi
c0101856:	56                   	push   %esi
c0101857:	e8 a4 01 00 00       	call   c0101a00 <disk_do_read>
c010185c:	89 da                	mov    %ebx,%edx
c010185e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101861:	83 c4 10             	add    $0x10,%esp
c0101864:	c1 e2 09             	shl    $0x9,%edx
c0101867:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010186a:	c6 81 44 31 15 c0 01 	movb   $0x1,-0x3feacebc(%ecx)
c0101871:	89 b9 40 31 15 c0    	mov    %edi,-0x3feacec0(%ecx)
c0101877:	c6 81 45 31 15 c0 00 	movb   $0x0,-0x3feacebb(%ecx)
c010187e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101881:	5b                   	pop    %ebx
c0101882:	5e                   	pop    %esi
c0101883:	5f                   	pop    %edi
c0101884:	5d                   	pop    %ebp
c0101885:	c3                   	ret    
c0101886:	8d 76 00             	lea    0x0(%esi),%esi
c0101889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101890:	39 91 40 31 15 c0    	cmp    %edx,-0x3feacec0(%ecx)
c0101896:	75 9c                	jne    c0101834 <buf_fetch+0x24>
c0101898:	eb e4                	jmp    c010187e <buf_fetch+0x6e>
c010189a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01018a0:	8d 72 06             	lea    0x6(%edx),%esi
c01018a3:	83 ec 08             	sub    $0x8,%esp
c01018a6:	ff b1 40 31 15 c0    	pushl  -0x3feacec0(%ecx)
c01018ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01018af:	56                   	push   %esi
c01018b0:	e8 8b 01 00 00       	call   c0101a40 <disk_do_write>
c01018b5:	83 c4 10             	add    $0x10,%esp
c01018b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01018bb:	eb 92                	jmp    c010184f <buf_fetch+0x3f>
c01018bd:	8d 76 00             	lea    0x0(%esi),%esi

c01018c0 <buf_init>:
c01018c0:	55                   	push   %ebp
c01018c1:	b8 44 31 15 c0       	mov    $0xc0153144,%eax
c01018c6:	89 e5                	mov    %esp,%ebp
c01018c8:	90                   	nop
c01018c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01018d0:	c6 00 00             	movb   $0x0,(%eax)
c01018d3:	05 08 02 00 00       	add    $0x208,%eax
c01018d8:	3d 44 35 16 c0       	cmp    $0xc0163544,%eax
c01018dd:	75 f1                	jne    c01018d0 <buf_init+0x10>
c01018df:	5d                   	pop    %ebp
c01018e0:	c3                   	ret    
c01018e1:	eb 0d                	jmp    c01018f0 <buf_writeback>
c01018e3:	90                   	nop
c01018e4:	90                   	nop
c01018e5:	90                   	nop
c01018e6:	90                   	nop
c01018e7:	90                   	nop
c01018e8:	90                   	nop
c01018e9:	90                   	nop
c01018ea:	90                   	nop
c01018eb:	90                   	nop
c01018ec:	90                   	nop
c01018ed:	90                   	nop
c01018ee:	90                   	nop
c01018ef:	90                   	nop

c01018f0 <buf_writeback>:
c01018f0:	55                   	push   %ebp
c01018f1:	89 e5                	mov    %esp,%ebp
c01018f3:	53                   	push   %ebx
c01018f4:	bb 46 31 15 c0       	mov    $0xc0153146,%ebx
c01018f9:	83 ec 04             	sub    $0x4,%esp
c01018fc:	eb 10                	jmp    c010190e <buf_writeback+0x1e>
c01018fe:	66 90                	xchg   %ax,%ax
c0101900:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101906:	81 fb 46 35 16 c0    	cmp    $0xc0163546,%ebx
c010190c:	74 32                	je     c0101940 <buf_writeback+0x50>
c010190e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101912:	75 ec                	jne    c0101900 <buf_writeback+0x10>
c0101914:	83 ec 08             	sub    $0x8,%esp
c0101917:	ff 73 fa             	pushl  -0x6(%ebx)
c010191a:	53                   	push   %ebx
c010191b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101921:	e8 1a 01 00 00       	call   c0101a40 <disk_do_write>
c0101926:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010192d:	83 c4 10             	add    $0x10,%esp
c0101930:	81 fb 46 35 16 c0    	cmp    $0xc0163546,%ebx
c0101936:	75 d6                	jne    c010190e <buf_writeback+0x1e>
c0101938:	90                   	nop
c0101939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101940:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101943:	c9                   	leave  
c0101944:	c3                   	ret    
c0101945:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101950 <read_byte>:
c0101950:	55                   	push   %ebp
c0101951:	89 e5                	mov    %esp,%ebp
c0101953:	53                   	push   %ebx
c0101954:	83 ec 04             	sub    $0x4,%esp
c0101957:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010195a:	89 d8                	mov    %ebx,%eax
c010195c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101962:	c1 e8 09             	shr    $0x9,%eax
c0101965:	e8 a6 fe ff ff       	call   c0101810 <buf_fetch>
c010196a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010196f:	83 c4 04             	add    $0x4,%esp
c0101972:	5b                   	pop    %ebx
c0101973:	5d                   	pop    %ebp
c0101974:	c3                   	ret    
c0101975:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101980 <write_byte>:
c0101980:	55                   	push   %ebp
c0101981:	89 e5                	mov    %esp,%ebp
c0101983:	56                   	push   %esi
c0101984:	53                   	push   %ebx
c0101985:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101988:	8b 75 0c             	mov    0xc(%ebp),%esi
c010198b:	89 d8                	mov    %ebx,%eax
c010198d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101993:	c1 e8 09             	shr    $0x9,%eax
c0101996:	e8 75 fe ff ff       	call   c0101810 <buf_fetch>
c010199b:	89 f2                	mov    %esi,%edx
c010199d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c01019a1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c01019a5:	5b                   	pop    %ebx
c01019a6:	5e                   	pop    %esi
c01019a7:	5d                   	pop    %ebp
c01019a8:	c3                   	ret    
c01019a9:	66 90                	xchg   %ax,%ax
c01019ab:	66 90                	xchg   %ax,%ax
c01019ad:	66 90                	xchg   %ax,%ax
c01019af:	90                   	nop

c01019b0 <ide_prepare>:
c01019b0:	55                   	push   %ebp
c01019b1:	89 c1                	mov    %eax,%ecx
c01019b3:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01019b8:	89 e5                	mov    %esp,%ebp
c01019ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01019c0:	ec                   	in     (%dx),%al
c01019c1:	83 e0 c0             	and    $0xffffffc0,%eax
c01019c4:	3c 40                	cmp    $0x40,%al
c01019c6:	75 f8                	jne    c01019c0 <ide_prepare+0x10>
c01019c8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01019cd:	31 c0                	xor    %eax,%eax
c01019cf:	ee                   	out    %al,(%dx)
c01019d0:	b8 01 00 00 00       	mov    $0x1,%eax
c01019d5:	b2 f2                	mov    $0xf2,%dl
c01019d7:	ee                   	out    %al,(%dx)
c01019d8:	b2 f3                	mov    $0xf3,%dl
c01019da:	89 c8                	mov    %ecx,%eax
c01019dc:	ee                   	out    %al,(%dx)
c01019dd:	89 c8                	mov    %ecx,%eax
c01019df:	b2 f4                	mov    $0xf4,%dl
c01019e1:	c1 e8 08             	shr    $0x8,%eax
c01019e4:	ee                   	out    %al,(%dx)
c01019e5:	89 c8                	mov    %ecx,%eax
c01019e7:	b2 f5                	mov    $0xf5,%dl
c01019e9:	c1 e8 10             	shr    $0x10,%eax
c01019ec:	ee                   	out    %al,(%dx)
c01019ed:	89 c8                	mov    %ecx,%eax
c01019ef:	b2 f6                	mov    $0xf6,%dl
c01019f1:	c1 e8 18             	shr    $0x18,%eax
c01019f4:	83 c8 e0             	or     $0xffffffe0,%eax
c01019f7:	ee                   	out    %al,(%dx)
c01019f8:	5d                   	pop    %ebp
c01019f9:	c3                   	ret    
c01019fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101a00 <disk_do_read>:
c0101a00:	55                   	push   %ebp
c0101a01:	89 e5                	mov    %esp,%ebp
c0101a03:	53                   	push   %ebx
c0101a04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a07:	e8 a4 ff ff ff       	call   c01019b0 <ide_prepare>
c0101a0c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101a11:	b8 20 00 00 00       	mov    $0x20,%eax
c0101a16:	ee                   	out    %al,(%dx)
c0101a17:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101a1a:	b2 f0                	mov    $0xf0,%dl
c0101a1c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101a28:	ed                   	in     (%dx),%eax
c0101a29:	89 01                	mov    %eax,(%ecx)
c0101a2b:	83 c1 04             	add    $0x4,%ecx
c0101a2e:	39 d9                	cmp    %ebx,%ecx
c0101a30:	75 f6                	jne    c0101a28 <disk_do_read+0x28>
c0101a32:	5b                   	pop    %ebx
c0101a33:	5d                   	pop    %ebp
c0101a34:	c3                   	ret    
c0101a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101a40 <disk_do_write>:
c0101a40:	55                   	push   %ebp
c0101a41:	89 e5                	mov    %esp,%ebp
c0101a43:	53                   	push   %ebx
c0101a44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a47:	e8 64 ff ff ff       	call   c01019b0 <ide_prepare>
c0101a4c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101a51:	b8 30 00 00 00       	mov    $0x30,%eax
c0101a56:	ee                   	out    %al,(%dx)
c0101a57:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101a5a:	b2 f0                	mov    $0xf0,%dl
c0101a5c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101a68:	8b 01                	mov    (%ecx),%eax
c0101a6a:	ef                   	out    %eax,(%dx)
c0101a6b:	83 c1 04             	add    $0x4,%ecx
c0101a6e:	39 d9                	cmp    %ebx,%ecx
c0101a70:	75 f6                	jne    c0101a68 <disk_do_write+0x28>
c0101a72:	5b                   	pop    %ebx
c0101a73:	5d                   	pop    %ebp
c0101a74:	c3                   	ret    
c0101a75:	66 90                	xchg   %ax,%ax
c0101a77:	66 90                	xchg   %ax,%ax
c0101a79:	66 90                	xchg   %ax,%ax
c0101a7b:	66 90                	xchg   %ax,%ax
c0101a7d:	66 90                	xchg   %ax,%ax
c0101a7f:	90                   	nop

c0101a80 <dma_prepare>:
c0101a80:	55                   	push   %ebp
c0101a81:	89 e5                	mov    %esp,%ebp
c0101a83:	83 ec 08             	sub    $0x8,%esp
c0101a86:	68 28 8b 10 c0       	push   $0xc0108b28
c0101a8b:	6a 1d                	push   $0x1d
c0101a8d:	68 bf 8a 10 c0       	push   $0xc0108abf
c0101a92:	68 dc 8a 10 c0       	push   $0xc0108adc
c0101a97:	e8 24 fb ff ff       	call   c01015c0 <printk>
c0101a9c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101aa1:	d6                   	(bad)  
c0101aa2:	83 c4 10             	add    $0x10,%esp
c0101aa5:	c9                   	leave  
c0101aa6:	c3                   	ret    
c0101aa7:	89 f6                	mov    %esi,%esi
c0101aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101ab0 <dma_issue_read>:
c0101ab0:	55                   	push   %ebp
c0101ab1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101ab6:	89 e5                	mov    %esp,%ebp
c0101ab8:	ec                   	in     (%dx),%al
c0101ab9:	83 c8 09             	or     $0x9,%eax
c0101abc:	ee                   	out    %al,(%dx)
c0101abd:	5d                   	pop    %ebp
c0101abe:	c3                   	ret    
c0101abf:	90                   	nop

c0101ac0 <memcpy>:
c0101ac0:	55                   	push   %ebp
c0101ac1:	89 e5                	mov    %esp,%ebp
c0101ac3:	56                   	push   %esi
c0101ac4:	57                   	push   %edi
c0101ac5:	53                   	push   %ebx
c0101ac6:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101ac9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101acc:	8b 75 0c             	mov    0xc(%ebp),%esi
c0101acf:	fc                   	cld    
c0101ad0:	83 f9 08             	cmp    $0x8,%ecx
c0101ad3:	76 26                	jbe    c0101afb <memcpy+0x3b>
c0101ad5:	89 fa                	mov    %edi,%edx
c0101ad7:	89 cb                	mov    %ecx,%ebx
c0101ad9:	83 e2 03             	and    $0x3,%edx
c0101adc:	74 10                	je     c0101aee <memcpy+0x2e>
c0101ade:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101ae3:	29 d1                	sub    %edx,%ecx
c0101ae5:	83 e1 03             	and    $0x3,%ecx
c0101ae8:	29 cb                	sub    %ecx,%ebx
c0101aea:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0101aec:	89 d9                	mov    %ebx,%ecx
c0101aee:	c1 e9 02             	shr    $0x2,%ecx
c0101af1:	8d 76 00             	lea    0x0(%esi),%esi
c0101af4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101af6:	89 d9                	mov    %ebx,%ecx
c0101af8:	83 e1 03             	and    $0x3,%ecx
c0101afb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0101afd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b00:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101b03:	5b                   	pop    %ebx
c0101b04:	5f                   	pop    %edi
c0101b05:	5e                   	pop    %esi
c0101b06:	c9                   	leave  
c0101b07:	c3                   	ret    

c0101b08 <memset>:
c0101b08:	55                   	push   %ebp
c0101b09:	89 e5                	mov    %esp,%ebp
c0101b0b:	57                   	push   %edi
c0101b0c:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101b0f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101b13:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101b16:	fc                   	cld    
c0101b17:	83 f9 10             	cmp    $0x10,%ecx
c0101b1a:	76 69                	jbe    c0101b85 <memset+0x7d>
c0101b1c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b22:	74 4c                	je     c0101b70 <memset+0x68>
c0101b24:	88 07                	mov    %al,(%edi)
c0101b26:	47                   	inc    %edi
c0101b27:	49                   	dec    %ecx
c0101b28:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b2e:	74 40                	je     c0101b70 <memset+0x68>
c0101b30:	88 07                	mov    %al,(%edi)
c0101b32:	47                   	inc    %edi
c0101b33:	49                   	dec    %ecx
c0101b34:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b3a:	74 34                	je     c0101b70 <memset+0x68>
c0101b3c:	88 07                	mov    %al,(%edi)
c0101b3e:	47                   	inc    %edi
c0101b3f:	49                   	dec    %ecx
c0101b40:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b46:	74 28                	je     c0101b70 <memset+0x68>
c0101b48:	88 07                	mov    %al,(%edi)
c0101b4a:	47                   	inc    %edi
c0101b4b:	49                   	dec    %ecx
c0101b4c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b52:	74 1c                	je     c0101b70 <memset+0x68>
c0101b54:	88 07                	mov    %al,(%edi)
c0101b56:	47                   	inc    %edi
c0101b57:	49                   	dec    %ecx
c0101b58:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b5e:	74 10                	je     c0101b70 <memset+0x68>
c0101b60:	88 07                	mov    %al,(%edi)
c0101b62:	47                   	inc    %edi
c0101b63:	49                   	dec    %ecx
c0101b64:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101b6a:	74 04                	je     c0101b70 <memset+0x68>
c0101b6c:	88 07                	mov    %al,(%edi)
c0101b6e:	47                   	inc    %edi
c0101b6f:	49                   	dec    %ecx
c0101b70:	88 c4                	mov    %al,%ah
c0101b72:	89 c2                	mov    %eax,%edx
c0101b74:	c1 e2 10             	shl    $0x10,%edx
c0101b77:	09 d0                	or     %edx,%eax
c0101b79:	89 ca                	mov    %ecx,%edx
c0101b7b:	c1 e9 02             	shr    $0x2,%ecx
c0101b7e:	83 e2 03             	and    $0x3,%edx
c0101b81:	f3 ab                	rep stos %eax,%es:(%edi)
c0101b83:	89 d1                	mov    %edx,%ecx
c0101b85:	f3 aa                	rep stos %al,%es:(%edi)
c0101b87:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b8a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0101b8d:	5f                   	pop    %edi
c0101b8e:	c9                   	leave  
c0101b8f:	c3                   	ret    

c0101b90 <strcmp>:
c0101b90:	55                   	push   %ebp
c0101b91:	89 e5                	mov    %esp,%ebp
c0101b93:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b96:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b99:	53                   	push   %ebx
c0101b9a:	89 c1                	mov    %eax,%ecx
c0101b9c:	09 d1                	or     %edx,%ecx
c0101b9e:	83 e1 03             	and    $0x3,%ecx
c0101ba1:	75 17                	jne    c0101bba <strcmp+0x2a>
c0101ba3:	8b 08                	mov    (%eax),%ecx
c0101ba5:	3b 0a                	cmp    (%edx),%ecx
c0101ba7:	74 33                	je     c0101bdc <strcmp+0x4c>
c0101ba9:	eb 0f                	jmp    c0101bba <strcmp+0x2a>
c0101bab:	90                   	nop
c0101bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101bb0:	3a 0a                	cmp    (%edx),%cl
c0101bb2:	75 0d                	jne    c0101bc1 <strcmp+0x31>
c0101bb4:	83 c0 01             	add    $0x1,%eax
c0101bb7:	83 c2 01             	add    $0x1,%edx
c0101bba:	0f b6 08             	movzbl (%eax),%ecx
c0101bbd:	84 c9                	test   %cl,%cl
c0101bbf:	75 ef                	jne    c0101bb0 <strcmp+0x20>
c0101bc1:	0f b6 00             	movzbl (%eax),%eax
c0101bc4:	0f b6 12             	movzbl (%edx),%edx
c0101bc7:	5b                   	pop    %ebx
c0101bc8:	5d                   	pop    %ebp
c0101bc9:	29 d0                	sub    %edx,%eax
c0101bcb:	c3                   	ret    
c0101bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101bd0:	83 c0 04             	add    $0x4,%eax
c0101bd3:	83 c2 04             	add    $0x4,%edx
c0101bd6:	8b 08                	mov    (%eax),%ecx
c0101bd8:	3b 0a                	cmp    (%edx),%ecx
c0101bda:	75 de                	jne    c0101bba <strcmp+0x2a>
c0101bdc:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c0101be2:	f7 d1                	not    %ecx
c0101be4:	21 cb                	and    %ecx,%ebx
c0101be6:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c0101bec:	74 e2                	je     c0101bd0 <strcmp+0x40>
c0101bee:	31 c0                	xor    %eax,%eax
c0101bf0:	5b                   	pop    %ebx
c0101bf1:	5d                   	pop    %ebp
c0101bf2:	c3                   	ret    
c0101bf3:	66 90                	xchg   %ax,%ax
c0101bf5:	66 90                	xchg   %ax,%ax
c0101bf7:	66 90                	xchg   %ax,%ax
c0101bf9:	66 90                	xchg   %ax,%ax
c0101bfb:	66 90                	xchg   %ax,%ax
c0101bfd:	66 90                	xchg   %ax,%ax
c0101bff:	90                   	nop

c0101c00 <_vsnprintf_r>:
c0101c00:	55                   	push   %ebp
c0101c01:	89 e5                	mov    %esp,%ebp
c0101c03:	56                   	push   %esi
c0101c04:	53                   	push   %ebx
c0101c05:	83 c4 80             	add    $0xffffff80,%esp
c0101c08:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101c0b:	8b 75 08             	mov    0x8(%ebp),%esi
c0101c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101c11:	85 db                	test   %ebx,%ebx
c0101c13:	78 63                	js     c0101c78 <_vsnprintf_r+0x78>
c0101c15:	ba 08 02 00 00       	mov    $0x208,%edx
c0101c1a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101c1f:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c0101c23:	8d 53 ff             	lea    -0x1(%ebx),%edx
c0101c26:	89 45 90             	mov    %eax,-0x70(%ebp)
c0101c29:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0101c2c:	31 c0                	xor    %eax,%eax
c0101c2e:	85 db                	test   %ebx,%ebx
c0101c30:	0f 45 c2             	cmovne %edx,%eax
c0101c33:	89 45 98             	mov    %eax,-0x68(%ebp)
c0101c36:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0101c39:	8b 45 18             	mov    0x18(%ebp),%eax
c0101c3c:	89 34 24             	mov    %esi,(%esp)
c0101c3f:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c0101c43:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101c47:	8b 45 14             	mov    0x14(%ebp),%eax
c0101c4a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101c4e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0101c51:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101c55:	e8 86 00 00 00       	call   c0101ce0 <_svfprintf_r>
c0101c5a:	83 f8 ff             	cmp    $0xffffffff,%eax
c0101c5d:	7c 11                	jl     c0101c70 <_vsnprintf_r+0x70>
c0101c5f:	85 db                	test   %ebx,%ebx
c0101c61:	74 06                	je     c0101c69 <_vsnprintf_r+0x69>
c0101c63:	8b 55 90             	mov    -0x70(%ebp),%edx
c0101c66:	c6 02 00             	movb   $0x0,(%edx)
c0101c69:	83 ec 80             	sub    $0xffffff80,%esp
c0101c6c:	5b                   	pop    %ebx
c0101c6d:	5e                   	pop    %esi
c0101c6e:	5d                   	pop    %ebp
c0101c6f:	c3                   	ret    
c0101c70:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101c76:	eb e7                	jmp    c0101c5f <_vsnprintf_r+0x5f>
c0101c78:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101c7e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101c83:	eb e4                	jmp    c0101c69 <_vsnprintf_r+0x69>
c0101c85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101c90 <vsnprintf>:
c0101c90:	55                   	push   %ebp
c0101c91:	89 e5                	mov    %esp,%ebp
c0101c93:	83 ec 28             	sub    $0x28,%esp
c0101c96:	e8 35 00 00 00       	call   c0101cd0 <__getreent>
c0101c9b:	8b 55 14             	mov    0x14(%ebp),%edx
c0101c9e:	89 54 24 10          	mov    %edx,0x10(%esp)
c0101ca2:	8b 55 10             	mov    0x10(%ebp),%edx
c0101ca5:	89 04 24             	mov    %eax,(%esp)
c0101ca8:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0101cac:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101caf:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101cb3:	8b 55 08             	mov    0x8(%ebp),%edx
c0101cb6:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101cba:	e8 41 ff ff ff       	call   c0101c00 <_vsnprintf_r>
c0101cbf:	c9                   	leave  
c0101cc0:	c3                   	ret    
c0101cc1:	66 90                	xchg   %ax,%ax
c0101cc3:	66 90                	xchg   %ax,%ax
c0101cc5:	66 90                	xchg   %ax,%ax
c0101cc7:	66 90                	xchg   %ax,%ax
c0101cc9:	66 90                	xchg   %ax,%ax
c0101ccb:	66 90                	xchg   %ax,%ax
c0101ccd:	66 90                	xchg   %ax,%ax
c0101ccf:	90                   	nop

c0101cd0 <__getreent>:
c0101cd0:	55                   	push   %ebp
c0101cd1:	a1 c0 b0 10 c0       	mov    0xc010b0c0,%eax
c0101cd6:	89 e5                	mov    %esp,%ebp
c0101cd8:	5d                   	pop    %ebp
c0101cd9:	c3                   	ret    
c0101cda:	66 90                	xchg   %ax,%ax
c0101cdc:	66 90                	xchg   %ax,%ax
c0101cde:	66 90                	xchg   %ax,%ax

c0101ce0 <_svfprintf_r>:
c0101ce0:	55                   	push   %ebp
c0101ce1:	89 e5                	mov    %esp,%ebp
c0101ce3:	57                   	push   %edi
c0101ce4:	56                   	push   %esi
c0101ce5:	53                   	push   %ebx
c0101ce6:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c0101cec:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cef:	89 04 24             	mov    %eax,(%esp)
c0101cf2:	e8 89 33 00 00       	call   c0105080 <_localeconv_r>
c0101cf7:	8b 00                	mov    (%eax),%eax
c0101cf9:	89 04 24             	mov    %eax,(%esp)
c0101cfc:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c0101d02:	e8 69 4a 00 00       	call   c0106770 <strlen>
c0101d07:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c0101d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d10:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0101d14:	74 0b                	je     c0101d21 <_svfprintf_r+0x41>
c0101d16:	8b 40 10             	mov    0x10(%eax),%eax
c0101d19:	85 c0                	test   %eax,%eax
c0101d1b:	0f 84 62 18 00 00    	je     c0103583 <_svfprintf_r+0x18a3>
c0101d21:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101d24:	8d 55 a7             	lea    -0x59(%ebp),%edx
c0101d27:	89 c7                	mov    %eax,%edi
c0101d29:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0101d2f:	90                   	nop
c0101d30:	90                   	nop
c0101d31:	29 d0                	sub    %edx,%eax
c0101d33:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c0101d3a:	00 00 00 
c0101d3d:	90                   	nop
c0101d3e:	90                   	nop
c0101d3f:	90                   	nop
c0101d40:	90                   	nop
c0101d41:	90                   	nop
c0101d42:	90                   	nop
c0101d43:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0101d4a:	00 00 00 
c0101d4d:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c0101d54:	00 00 00 
c0101d57:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c0101d5e:	00 00 00 
c0101d61:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c0101d68:	00 00 00 
c0101d6b:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c0101d72:	00 00 00 
c0101d75:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c0101d7b:	8b 45 10             	mov    0x10(%ebp),%eax
c0101d7e:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101d81:	0f b6 00             	movzbl (%eax),%eax
c0101d84:	3c 25                	cmp    $0x25,%al
c0101d86:	74 4d                	je     c0101dd5 <_svfprintf_r+0xf5>
c0101d88:	84 c0                	test   %al,%al
c0101d8a:	75 08                	jne    c0101d94 <_svfprintf_r+0xb4>
c0101d8c:	eb 47                	jmp    c0101dd5 <_svfprintf_r+0xf5>
c0101d8e:	66 90                	xchg   %ax,%ax
c0101d90:	84 c0                	test   %al,%al
c0101d92:	74 0a                	je     c0101d9e <_svfprintf_r+0xbe>
c0101d94:	83 c3 01             	add    $0x1,%ebx
c0101d97:	0f b6 03             	movzbl (%ebx),%eax
c0101d9a:	3c 25                	cmp    $0x25,%al
c0101d9c:	75 f2                	jne    c0101d90 <_svfprintf_r+0xb0>
c0101d9e:	89 de                	mov    %ebx,%esi
c0101da0:	2b 75 10             	sub    0x10(%ebp),%esi
c0101da3:	74 30                	je     c0101dd5 <_svfprintf_r+0xf5>
c0101da5:	8b 45 10             	mov    0x10(%ebp),%eax
c0101da8:	83 c7 08             	add    $0x8,%edi
c0101dab:	89 77 fc             	mov    %esi,-0x4(%edi)
c0101dae:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c0101db4:	89 47 f8             	mov    %eax,-0x8(%edi)
c0101db7:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101dbd:	83 c0 01             	add    $0x1,%eax
c0101dc0:	83 f8 07             	cmp    $0x7,%eax
c0101dc3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101dc9:	0f 8f 91 00 00 00    	jg     c0101e60 <_svfprintf_r+0x180>
c0101dcf:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c0101dd5:	80 3b 00             	cmpb   $0x0,(%ebx)
c0101dd8:	0f 84 aa 00 00 00    	je     c0101e88 <_svfprintf_r+0x1a8>
c0101dde:	8d 43 01             	lea    0x1(%ebx),%eax
c0101de1:	be 20 00 00 00       	mov    $0x20,%esi
c0101de6:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101ded:	31 db                	xor    %ebx,%ebx
c0101def:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0101df6:	ff ff ff 
c0101df9:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101e00:	00 00 00 
c0101e03:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c0101e0a:	00 00 00 
c0101e0d:	8d 48 01             	lea    0x1(%eax),%ecx
c0101e10:	0f be 00             	movsbl (%eax),%eax
c0101e13:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101e16:	83 fa 58             	cmp    $0x58,%edx
c0101e19:	0f 87 8f 07 00 00    	ja     c01025ae <_svfprintf_r+0x8ce>
c0101e1f:	ff 24 95 74 8b 10 c0 	jmp    *-0x3fef748c(,%edx,4)
c0101e26:	66 90                	xchg   %ax,%ax
c0101e28:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101e2f:	89 c8                	mov    %ecx,%eax
c0101e31:	eb da                	jmp    c0101e0d <_svfprintf_r+0x12d>
c0101e33:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e36:	8b 55 14             	mov    0x14(%ebp),%edx
c0101e39:	8b 00                	mov    (%eax),%eax
c0101e3b:	83 c2 04             	add    $0x4,%edx
c0101e3e:	89 55 14             	mov    %edx,0x14(%ebp)
c0101e41:	85 c0                	test   %eax,%eax
c0101e43:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c0101e49:	79 e4                	jns    c0101e2f <_svfprintf_r+0x14f>
c0101e4b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c0101e51:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c0101e58:	89 c8                	mov    %ecx,%eax
c0101e5a:	eb b1                	jmp    c0101e0d <_svfprintf_r+0x12d>
c0101e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101e60:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101e66:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e6d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101e71:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e74:	89 04 24             	mov    %eax,(%esp)
c0101e77:	e8 74 49 00 00       	call   c01067f0 <__ssprint_r>
c0101e7c:	85 c0                	test   %eax,%eax
c0101e7e:	75 30                	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0101e80:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101e83:	e9 47 ff ff ff       	jmp    c0101dcf <_svfprintf_r+0xef>
c0101e88:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0101e8e:	85 c0                	test   %eax,%eax
c0101e90:	74 1e                	je     c0101eb0 <_svfprintf_r+0x1d0>
c0101e92:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101e98:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e9f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101ea3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ea6:	89 04 24             	mov    %eax,(%esp)
c0101ea9:	e8 42 49 00 00       	call   c01067f0 <__ssprint_r>
c0101eae:	66 90                	xchg   %ax,%ax
c0101eb0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101eb3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101eb8:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c0101ebc:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c0101ec3:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c0101ec9:	5b                   	pop    %ebx
c0101eca:	5e                   	pop    %esi
c0101ecb:	5f                   	pop    %edi
c0101ecc:	5d                   	pop    %ebp
c0101ecd:	c3                   	ret    
c0101ece:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0101ed3:	89 c8                	mov    %ecx,%eax
c0101ed5:	e9 33 ff ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c0101eda:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ee0:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ee3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ee6:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101eed:	8d 70 04             	lea    0x4(%eax),%esi
c0101ef0:	8b 00                	mov    (%eax),%eax
c0101ef2:	85 c0                	test   %eax,%eax
c0101ef4:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101efa:	0f 84 7f 18 00 00    	je     c010377f <_svfprintf_r+0x1a9f>
c0101f00:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101f06:	85 c0                	test   %eax,%eax
c0101f08:	0f 88 b6 17 00 00    	js     c01036c4 <_svfprintf_r+0x19e4>
c0101f0e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f12:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0101f18:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101f1f:	00 
c0101f20:	89 04 24             	mov    %eax,(%esp)
c0101f23:	e8 f8 38 00 00       	call   c0105820 <memchr>
c0101f28:	85 c0                	test   %eax,%eax
c0101f2a:	0f 84 a0 19 00 00    	je     c01038d0 <_svfprintf_r+0x1bf0>
c0101f30:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101f36:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0101f3c:	39 d0                	cmp    %edx,%eax
c0101f3e:	0f 4f c2             	cmovg  %edx,%eax
c0101f41:	89 c2                	mov    %eax,%edx
c0101f43:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101f4a:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0101f50:	31 c0                	xor    %eax,%eax
c0101f52:	85 d2                	test   %edx,%edx
c0101f54:	0f 49 c2             	cmovns %edx,%eax
c0101f57:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101f5d:	89 75 14             	mov    %esi,0x14(%ebp)
c0101f60:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101f67:	00 00 00 
c0101f6a:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101f71:	00 00 00 
c0101f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101f78:	84 db                	test   %bl,%bl
c0101f7a:	74 07                	je     c0101f83 <_svfprintf_r+0x2a3>
c0101f7c:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c0101f83:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101f89:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c0101f8f:	89 c8                	mov    %ecx,%eax
c0101f91:	89 f2                	mov    %esi,%edx
c0101f93:	83 c0 02             	add    $0x2,%eax
c0101f96:	83 e2 02             	and    $0x2,%edx
c0101f99:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c0101f9f:	89 f2                	mov    %esi,%edx
c0101fa1:	0f 44 c1             	cmove  %ecx,%eax
c0101fa4:	81 e2 84 00 00 00    	and    $0x84,%edx
c0101faa:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101fb0:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c0101fb6:	0f 85 1c 06 00 00    	jne    c01025d8 <_svfprintf_r+0x8f8>
c0101fbc:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0101fc2:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0101fc8:	85 f6                	test   %esi,%esi
c0101fca:	0f 8e 08 06 00 00    	jle    c01025d8 <_svfprintf_r+0x8f8>
c0101fd0:	83 fe 10             	cmp    $0x10,%esi
c0101fd3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101fd9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101fdf:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101fe5:	7f 11                	jg     c0101ff8 <_svfprintf_r+0x318>
c0101fe7:	eb 6b                	jmp    c0102054 <_svfprintf_r+0x374>
c0101fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101ff0:	83 ee 10             	sub    $0x10,%esi
c0101ff3:	83 fe 10             	cmp    $0x10,%esi
c0101ff6:	7e 5c                	jle    c0102054 <_svfprintf_r+0x374>
c0101ff8:	83 c0 01             	add    $0x1,%eax
c0101ffb:	83 c1 10             	add    $0x10,%ecx
c0101ffe:	c7 07 e8 8c 10 c0    	movl   $0xc0108ce8,(%edi)
c0102004:	83 c7 08             	add    $0x8,%edi
c0102007:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010200e:	83 f8 07             	cmp    $0x7,%eax
c0102011:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102017:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010201d:	7e d1                	jle    c0101ff0 <_svfprintf_r+0x310>
c010201f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102022:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102026:	89 44 24 04          	mov    %eax,0x4(%esp)
c010202a:	8b 45 08             	mov    0x8(%ebp),%eax
c010202d:	89 04 24             	mov    %eax,(%esp)
c0102030:	e8 bb 47 00 00       	call   c01067f0 <__ssprint_r>
c0102035:	85 c0                	test   %eax,%eax
c0102037:	0f 85 73 fe ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010203d:	83 ee 10             	sub    $0x10,%esi
c0102040:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102046:	83 fe 10             	cmp    $0x10,%esi
c0102049:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010204f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102052:	7f a4                	jg     c0101ff8 <_svfprintf_r+0x318>
c0102054:	83 c0 01             	add    $0x1,%eax
c0102057:	01 f1                	add    %esi,%ecx
c0102059:	83 f8 07             	cmp    $0x7,%eax
c010205c:	c7 07 e8 8c 10 c0    	movl   $0xc0108ce8,(%edi)
c0102062:	89 77 04             	mov    %esi,0x4(%edi)
c0102065:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010206b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102071:	0f 8f 16 0e 00 00    	jg     c0102e8d <_svfprintf_r+0x11ad>
c0102077:	83 c7 08             	add    $0x8,%edi
c010207a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102081:	e9 58 05 00 00       	jmp    c01025de <_svfprintf_r+0x8fe>
c0102086:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010208d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102093:	8b 45 14             	mov    0x14(%ebp),%eax
c0102096:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102099:	0f 85 fd 04 00 00    	jne    c010259c <_svfprintf_r+0x8bc>
c010209f:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01020a6:	0f 84 f0 04 00 00    	je     c010259c <_svfprintf_r+0x8bc>
c01020ac:	0f b7 08             	movzwl (%eax),%ecx
c01020af:	83 c0 04             	add    $0x4,%eax
c01020b2:	89 45 14             	mov    %eax,0x14(%ebp)
c01020b5:	b8 01 00 00 00       	mov    $0x1,%eax
c01020ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01020c0:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01020c7:	31 db                	xor    %ebx,%ebx
c01020c9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01020cf:	89 f2                	mov    %esi,%edx
c01020d1:	80 e2 7f             	and    $0x7f,%dl
c01020d4:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c01020db:	0f 48 d6             	cmovs  %esi,%edx
c01020de:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c01020e4:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01020ea:	85 d2                	test   %edx,%edx
c01020ec:	75 08                	jne    c01020f6 <_svfprintf_r+0x416>
c01020ee:	85 c9                	test   %ecx,%ecx
c01020f0:	0f 84 ea 08 00 00    	je     c01029e0 <_svfprintf_r+0xd00>
c01020f6:	3c 01                	cmp    $0x1,%al
c01020f8:	0f 84 6a 0d 00 00    	je     c0102e68 <_svfprintf_r+0x1188>
c01020fe:	3c 02                	cmp    $0x2,%al
c0102100:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102103:	0f 85 bf 0b 00 00    	jne    c0102cc8 <_svfprintf_r+0xfe8>
c0102109:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c010210f:	90                   	nop
c0102110:	89 ca                	mov    %ecx,%edx
c0102112:	83 e8 01             	sub    $0x1,%eax
c0102115:	83 e2 0f             	and    $0xf,%edx
c0102118:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c010211c:	c1 e9 04             	shr    $0x4,%ecx
c010211f:	85 c9                	test   %ecx,%ecx
c0102121:	88 10                	mov    %dl,(%eax)
c0102123:	75 eb                	jne    c0102110 <_svfprintf_r+0x430>
c0102125:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0102128:	29 c2                	sub    %eax,%edx
c010212a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102130:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102136:	66 90                	xchg   %ax,%ax
c0102138:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c010213e:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0102144:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010214b:	00 00 00 
c010214e:	39 c2                	cmp    %eax,%edx
c0102150:	0f 4d c2             	cmovge %edx,%eax
c0102153:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102159:	e9 1a fe ff ff       	jmp    c0101f78 <_svfprintf_r+0x298>
c010215e:	84 db                	test   %bl,%bl
c0102160:	89 c8                	mov    %ecx,%eax
c0102162:	0f 44 de             	cmove  %esi,%ebx
c0102165:	e9 a3 fc ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c010216a:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0102171:	89 c8                	mov    %ecx,%eax
c0102173:	e9 95 fc ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c0102178:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c010217f:	00 00 00 
c0102182:	89 c8                	mov    %ecx,%eax
c0102184:	e9 84 fc ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c0102189:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c010218f:	8d 50 d0             	lea    -0x30(%eax),%edx
c0102192:	31 ff                	xor    %edi,%edi
c0102194:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c010219b:	00 00 00 
c010219e:	66 90                	xchg   %ax,%ax
c01021a0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c01021a3:	83 c1 01             	add    $0x1,%ecx
c01021a6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c01021a9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c01021ad:	8d 50 d0             	lea    -0x30(%eax),%edx
c01021b0:	83 fa 09             	cmp    $0x9,%edx
c01021b3:	76 eb                	jbe    c01021a0 <_svfprintf_r+0x4c0>
c01021b5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c01021bb:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c01021c1:	e9 4d fc ff ff       	jmp    c0101e13 <_svfprintf_r+0x133>
c01021c6:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c01021cd:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01021d4:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01021da:	8b 45 14             	mov    0x14(%ebp),%eax
c01021dd:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01021e0:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01021e6:	0f 85 61 02 00 00    	jne    c010244d <_svfprintf_r+0x76d>
c01021ec:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01021f3:	0f 84 54 02 00 00    	je     c010244d <_svfprintf_r+0x76d>
c01021f9:	0f bf 08             	movswl (%eax),%ecx
c01021fc:	83 c0 04             	add    $0x4,%eax
c01021ff:	89 45 14             	mov    %eax,0x14(%ebp)
c0102202:	85 c9                	test   %ecx,%ecx
c0102204:	0f 88 53 02 00 00    	js     c010245d <_svfprintf_r+0x77d>
c010220a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102211:	b8 01 00 00 00       	mov    $0x1,%eax
c0102216:	e9 ae fe ff ff       	jmp    c01020c9 <_svfprintf_r+0x3e9>
c010221b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0102222:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102228:	8b 45 14             	mov    0x14(%ebp),%eax
c010222b:	89 4d 10             	mov    %ecx,0x10(%ebp)
c010222e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0102234:	0f 84 15 10 00 00    	je     c010324f <_svfprintf_r+0x156f>
c010223a:	db 28                	fldt   (%eax)
c010223c:	83 c0 0c             	add    $0xc,%eax
c010223f:	89 45 14             	mov    %eax,0x14(%ebp)
c0102242:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102248:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c010224e:	dd 1c 24             	fstpl  (%esp)
c0102251:	e8 aa 44 00 00       	call   c0106700 <__fpclassifyd>
c0102256:	83 f8 01             	cmp    $0x1,%eax
c0102259:	0f 85 82 0f 00 00    	jne    c01031e1 <_svfprintf_r+0x1501>
c010225f:	d9 ee                	fldz   
c0102261:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102267:	d9 c9                	fxch   %st(1)
c0102269:	df e9                	fucomip %st(1),%st
c010226b:	dd d8                	fstp   %st(0)
c010226d:	0f 87 59 15 00 00    	ja     c01037cc <_svfprintf_r+0x1aec>
c0102273:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010227a:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0102281:	ba 3a 8b 10 c0       	mov    $0xc0108b3a,%edx
c0102286:	b8 3e 8b 10 c0       	mov    $0xc0108b3e,%eax
c010228b:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0102292:	00 00 00 
c0102295:	0f 4e c2             	cmovle %edx,%eax
c0102298:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010229e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c01022a5:	ff ff ff 
c01022a8:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c01022af:	00 00 00 
c01022b2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01022b9:	00 00 00 
c01022bc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01022c3:	00 00 00 
c01022c6:	e9 ad fc ff ff       	jmp    c0101f78 <_svfprintf_r+0x298>
c01022cb:	8d 41 01             	lea    0x1(%ecx),%eax
c01022ce:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01022d4:	0f be 01             	movsbl (%ecx),%eax
c01022d7:	83 f8 2a             	cmp    $0x2a,%eax
c01022da:	0f 84 84 18 00 00    	je     c0103b64 <_svfprintf_r+0x1e84>
c01022e0:	8d 50 d0             	lea    -0x30(%eax),%edx
c01022e3:	31 c9                	xor    %ecx,%ecx
c01022e5:	83 fa 09             	cmp    $0x9,%edx
c01022e8:	0f 87 a8 16 00 00    	ja     c0103996 <_svfprintf_r+0x1cb6>
c01022ee:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c01022f4:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c01022fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102300:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0102303:	83 c7 01             	add    $0x1,%edi
c0102306:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0102309:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c010230d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0102310:	83 fa 09             	cmp    $0x9,%edx
c0102313:	76 eb                	jbe    c0102300 <_svfprintf_r+0x620>
c0102315:	85 c9                	test   %ecx,%ecx
c0102317:	89 ca                	mov    %ecx,%edx
c0102319:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c010231e:	0f 48 d1             	cmovs  %ecx,%edx
c0102321:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102327:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c010232d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0102333:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0102339:	e9 d5 fa ff ff       	jmp    c0101e13 <_svfprintf_r+0x133>
c010233e:	8b 45 14             	mov    0x14(%ebp),%eax
c0102341:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102344:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c010234b:	8b 08                	mov    (%eax),%ecx
c010234d:	83 c0 04             	add    $0x4,%eax
c0102350:	89 45 14             	mov    %eax,0x14(%ebp)
c0102353:	b8 02 00 00 00       	mov    $0x2,%eax
c0102358:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c010235f:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0102366:	c7 85 18 ff ff ff 5b 	movl   $0xc0108b5b,-0xe8(%ebp)
c010236d:	8b 10 c0 
c0102370:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0102377:	00 00 00 
c010237a:	e9 41 fd ff ff       	jmp    c01020c0 <_svfprintf_r+0x3e0>
c010237f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0102386:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c010238c:	8b 45 14             	mov    0x14(%ebp),%eax
c010238f:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102392:	0f 85 87 00 00 00    	jne    c010241f <_svfprintf_r+0x73f>
c0102398:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c010239f:	74 7e                	je     c010241f <_svfprintf_r+0x73f>
c01023a1:	0f b7 08             	movzwl (%eax),%ecx
c01023a4:	83 c0 04             	add    $0x4,%eax
c01023a7:	89 45 14             	mov    %eax,0x14(%ebp)
c01023aa:	31 c0                	xor    %eax,%eax
c01023ac:	e9 0f fd ff ff       	jmp    c01020c0 <_svfprintf_r+0x3e0>
c01023b1:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c01023b8:	89 c8                	mov    %ecx,%eax
c01023ba:	e9 4e fa ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c01023bf:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01023c6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01023c9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01023cf:	0f 85 97 0b 00 00    	jne    c0102f6c <_svfprintf_r+0x128c>
c01023d5:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01023dc:	0f 84 8a 0b 00 00    	je     c0102f6c <_svfprintf_r+0x128c>
c01023e2:	8b 45 14             	mov    0x14(%ebp),%eax
c01023e5:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c01023ec:	8b 00                	mov    (%eax),%eax
c01023ee:	66 89 10             	mov    %dx,(%eax)
c01023f1:	8b 45 14             	mov    0x14(%ebp),%eax
c01023f4:	83 c0 04             	add    $0x4,%eax
c01023f7:	89 45 14             	mov    %eax,0x14(%ebp)
c01023fa:	e9 7c f9 ff ff       	jmp    c0101d7b <_svfprintf_r+0x9b>
c01023ff:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0102406:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010240d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102413:	8b 45 14             	mov    0x14(%ebp),%eax
c0102416:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102419:	0f 84 79 ff ff ff    	je     c0102398 <_svfprintf_r+0x6b8>
c010241f:	8b 08                	mov    (%eax),%ecx
c0102421:	83 c0 04             	add    $0x4,%eax
c0102424:	89 45 14             	mov    %eax,0x14(%ebp)
c0102427:	31 c0                	xor    %eax,%eax
c0102429:	e9 92 fc ff ff       	jmp    c01020c0 <_svfprintf_r+0x3e0>
c010242e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0102435:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c010243b:	8b 45 14             	mov    0x14(%ebp),%eax
c010243e:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102441:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0102447:	0f 84 9f fd ff ff    	je     c01021ec <_svfprintf_r+0x50c>
c010244d:	8b 08                	mov    (%eax),%ecx
c010244f:	83 c0 04             	add    $0x4,%eax
c0102452:	89 45 14             	mov    %eax,0x14(%ebp)
c0102455:	85 c9                	test   %ecx,%ecx
c0102457:	0f 89 ad fd ff ff    	jns    c010220a <_svfprintf_r+0x52a>
c010245d:	f7 d9                	neg    %ecx
c010245f:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0102464:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c010246b:	b8 01 00 00 00       	mov    $0x1,%eax
c0102470:	e9 54 fc ff ff       	jmp    c01020c9 <_svfprintf_r+0x3e9>
c0102475:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c010247c:	89 c8                	mov    %ecx,%eax
c010247e:	e9 8a f9 ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c0102483:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010248a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102490:	8b 45 14             	mov    0x14(%ebp),%eax
c0102493:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102496:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c010249c:	c7 85 18 ff ff ff 5b 	movl   $0xc0108b5b,-0xe8(%ebp)
c01024a3:	8b 10 c0 
c01024a6:	75 71                	jne    c0102519 <_svfprintf_r+0x839>
c01024a8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01024af:	74 68                	je     c0102519 <_svfprintf_r+0x839>
c01024b1:	0f b7 08             	movzwl (%eax),%ecx
c01024b4:	83 c0 04             	add    $0x4,%eax
c01024b7:	89 45 14             	mov    %eax,0x14(%ebp)
c01024ba:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01024c1:	b8 02 00 00 00       	mov    $0x2,%eax
c01024c6:	0f 84 f4 fb ff ff    	je     c01020c0 <_svfprintf_r+0x3e0>
c01024cc:	85 c9                	test   %ecx,%ecx
c01024ce:	0f 84 ec fb ff ff    	je     c01020c0 <_svfprintf_r+0x3e0>
c01024d4:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c01024db:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c01024e2:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c01024e9:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c01024ef:	e9 cc fb ff ff       	jmp    c01020c0 <_svfprintf_r+0x3e0>
c01024f4:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01024fb:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102501:	8b 45 14             	mov    0x14(%ebp),%eax
c0102504:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102507:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c010250d:	c7 85 18 ff ff ff 4a 	movl   $0xc0108b4a,-0xe8(%ebp)
c0102514:	8b 10 c0 
c0102517:	74 8f                	je     c01024a8 <_svfprintf_r+0x7c8>
c0102519:	8b 08                	mov    (%eax),%ecx
c010251b:	83 c0 04             	add    $0x4,%eax
c010251e:	89 45 14             	mov    %eax,0x14(%ebp)
c0102521:	eb 97                	jmp    c01024ba <_svfprintf_r+0x7da>
c0102523:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102529:	8b 45 14             	mov    0x14(%ebp),%eax
c010252c:	89 4d 10             	mov    %ecx,0x10(%ebp)
c010252f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0102536:	8b 00                	mov    (%eax),%eax
c0102538:	88 45 80             	mov    %al,-0x80(%ebp)
c010253b:	8b 45 14             	mov    0x14(%ebp),%eax
c010253e:	83 c0 04             	add    $0x4,%eax
c0102541:	89 45 14             	mov    %eax,0x14(%ebp)
c0102544:	8d 45 80             	lea    -0x80(%ebp),%eax
c0102547:	31 db                	xor    %ebx,%ebx
c0102549:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0102550:	00 00 00 
c0102553:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c010255a:	00 00 00 
c010255d:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102564:	00 00 00 
c0102567:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010256e:	00 00 00 
c0102571:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102577:	e9 07 fa ff ff       	jmp    c0101f83 <_svfprintf_r+0x2a3>
c010257c:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0102583:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010258a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102590:	8b 45 14             	mov    0x14(%ebp),%eax
c0102593:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102596:	0f 84 03 fb ff ff    	je     c010209f <_svfprintf_r+0x3bf>
c010259c:	8b 08                	mov    (%eax),%ecx
c010259e:	83 c0 04             	add    $0x4,%eax
c01025a1:	89 45 14             	mov    %eax,0x14(%ebp)
c01025a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01025a9:	e9 12 fb ff ff       	jmp    c01020c0 <_svfprintf_r+0x3e0>
c01025ae:	85 c0                	test   %eax,%eax
c01025b0:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01025b6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01025b9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01025bf:	0f 84 c3 f8 ff ff    	je     c0101e88 <_svfprintf_r+0x1a8>
c01025c5:	88 45 80             	mov    %al,-0x80(%ebp)
c01025c8:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01025cf:	e9 70 ff ff ff       	jmp    c0102544 <_svfprintf_r+0x864>
c01025d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01025d8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025de:	84 db                	test   %bl,%bl
c01025e0:	74 33                	je     c0102615 <_svfprintf_r+0x935>
c01025e2:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c01025e8:	83 c1 01             	add    $0x1,%ecx
c01025eb:	89 07                	mov    %eax,(%edi)
c01025ed:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01025f3:	83 c7 08             	add    $0x8,%edi
c01025f6:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01025fd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102603:	83 c0 01             	add    $0x1,%eax
c0102606:	83 f8 07             	cmp    $0x7,%eax
c0102609:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010260f:	0f 8f 7b 06 00 00    	jg     c0102c90 <_svfprintf_r+0xfb0>
c0102615:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c010261b:	85 db                	test   %ebx,%ebx
c010261d:	74 33                	je     c0102652 <_svfprintf_r+0x972>
c010261f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0102625:	83 c1 02             	add    $0x2,%ecx
c0102628:	89 07                	mov    %eax,(%edi)
c010262a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102630:	83 c7 08             	add    $0x8,%edi
c0102633:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c010263a:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102640:	83 c0 01             	add    $0x1,%eax
c0102643:	83 f8 07             	cmp    $0x7,%eax
c0102646:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010264c:	0f 8f 06 06 00 00    	jg     c0102c58 <_svfprintf_r+0xf78>
c0102652:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0102659:	00 00 00 
c010265c:	0f 84 c6 03 00 00    	je     c0102a28 <_svfprintf_r+0xd48>
c0102662:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0102668:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c010266e:	85 f6                	test   %esi,%esi
c0102670:	0f 8e d2 00 00 00    	jle    c0102748 <_svfprintf_r+0xa68>
c0102676:	83 fe 10             	cmp    $0x10,%esi
c0102679:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010267f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102685:	7f 11                	jg     c0102698 <_svfprintf_r+0x9b8>
c0102687:	eb 6b                	jmp    c01026f4 <_svfprintf_r+0xa14>
c0102689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102690:	83 ee 10             	sub    $0x10,%esi
c0102693:	83 fe 10             	cmp    $0x10,%esi
c0102696:	7e 5c                	jle    c01026f4 <_svfprintf_r+0xa14>
c0102698:	83 c0 01             	add    $0x1,%eax
c010269b:	83 c1 10             	add    $0x10,%ecx
c010269e:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c01026a4:	83 c7 08             	add    $0x8,%edi
c01026a7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01026ae:	83 f8 07             	cmp    $0x7,%eax
c01026b1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01026b7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01026bd:	7e d1                	jle    c0102690 <_svfprintf_r+0x9b0>
c01026bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026c2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01026c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01026cd:	89 04 24             	mov    %eax,(%esp)
c01026d0:	e8 1b 41 00 00       	call   c01067f0 <__ssprint_r>
c01026d5:	85 c0                	test   %eax,%eax
c01026d7:	0f 85 d3 f7 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01026dd:	83 ee 10             	sub    $0x10,%esi
c01026e0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01026e6:	83 fe 10             	cmp    $0x10,%esi
c01026e9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01026ef:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01026f2:	7f a4                	jg     c0102698 <_svfprintf_r+0x9b8>
c01026f4:	83 c0 01             	add    $0x1,%eax
c01026f7:	01 f1                	add    %esi,%ecx
c01026f9:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c01026ff:	83 c7 08             	add    $0x8,%edi
c0102702:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102705:	83 f8 07             	cmp    $0x7,%eax
c0102708:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010270e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102714:	7e 32                	jle    c0102748 <_svfprintf_r+0xa68>
c0102716:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010271c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102720:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102723:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102727:	8b 45 08             	mov    0x8(%ebp),%eax
c010272a:	89 04 24             	mov    %eax,(%esp)
c010272d:	e8 be 40 00 00       	call   c01067f0 <__ssprint_r>
c0102732:	85 c0                	test   %eax,%eax
c0102734:	0f 85 76 f7 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010273a:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102740:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102743:	90                   	nop
c0102744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102748:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c010274f:	01 00 00 
c0102752:	0f 85 50 01 00 00    	jne    c01028a8 <_svfprintf_r+0xbc8>
c0102758:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010275e:	89 07                	mov    %eax,(%edi)
c0102760:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c0102766:	01 c1                	add    %eax,%ecx
c0102768:	89 47 04             	mov    %eax,0x4(%edi)
c010276b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102771:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102777:	83 c0 01             	add    $0x1,%eax
c010277a:	83 f8 07             	cmp    $0x7,%eax
c010277d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102783:	0f 8f 6a 04 00 00    	jg     c0102bf3 <_svfprintf_r+0xf13>
c0102789:	83 c7 08             	add    $0x8,%edi
c010278c:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c0102793:	0f 84 d7 00 00 00    	je     c0102870 <_svfprintf_r+0xb90>
c0102799:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010279f:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01027a5:	85 f6                	test   %esi,%esi
c01027a7:	0f 8e c3 00 00 00    	jle    c0102870 <_svfprintf_r+0xb90>
c01027ad:	83 fe 10             	cmp    $0x10,%esi
c01027b0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01027b6:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01027bc:	7f 0a                	jg     c01027c8 <_svfprintf_r+0xae8>
c01027be:	eb 64                	jmp    c0102824 <_svfprintf_r+0xb44>
c01027c0:	83 ee 10             	sub    $0x10,%esi
c01027c3:	83 fe 10             	cmp    $0x10,%esi
c01027c6:	7e 5c                	jle    c0102824 <_svfprintf_r+0xb44>
c01027c8:	83 c0 01             	add    $0x1,%eax
c01027cb:	83 c1 10             	add    $0x10,%ecx
c01027ce:	c7 07 e8 8c 10 c0    	movl   $0xc0108ce8,(%edi)
c01027d4:	83 c7 08             	add    $0x8,%edi
c01027d7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01027de:	83 f8 07             	cmp    $0x7,%eax
c01027e1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01027e7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01027ed:	7e d1                	jle    c01027c0 <_svfprintf_r+0xae0>
c01027ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01027f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01027fd:	89 04 24             	mov    %eax,(%esp)
c0102800:	e8 eb 3f 00 00       	call   c01067f0 <__ssprint_r>
c0102805:	85 c0                	test   %eax,%eax
c0102807:	0f 85 a3 f6 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010280d:	83 ee 10             	sub    $0x10,%esi
c0102810:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102816:	83 fe 10             	cmp    $0x10,%esi
c0102819:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010281f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102822:	7f a4                	jg     c01027c8 <_svfprintf_r+0xae8>
c0102824:	83 c0 01             	add    $0x1,%eax
c0102827:	01 f1                	add    %esi,%ecx
c0102829:	83 f8 07             	cmp    $0x7,%eax
c010282c:	c7 07 e8 8c 10 c0    	movl   $0xc0108ce8,(%edi)
c0102832:	89 77 04             	mov    %esi,0x4(%edi)
c0102835:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010283b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102841:	7e 2d                	jle    c0102870 <_svfprintf_r+0xb90>
c0102843:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102849:	89 44 24 08          	mov    %eax,0x8(%esp)
c010284d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102850:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102854:	8b 45 08             	mov    0x8(%ebp),%eax
c0102857:	89 04 24             	mov    %eax,(%esp)
c010285a:	e8 91 3f 00 00       	call   c01067f0 <__ssprint_r>
c010285f:	85 c0                	test   %eax,%eax
c0102861:	0f 85 49 f6 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102867:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010286d:	8d 76 00             	lea    0x0(%esi),%esi
c0102870:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c0102876:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c010287c:	39 c2                	cmp    %eax,%edx
c010287e:	0f 4d c2             	cmovge %edx,%eax
c0102881:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c0102887:	85 c9                	test   %ecx,%ecx
c0102889:	0f 85 99 03 00 00    	jne    c0102c28 <_svfprintf_r+0xf48>
c010288f:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0102896:	00 00 00 
c0102899:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010289c:	e9 da f4 ff ff       	jmp    c0101d7b <_svfprintf_r+0x9b>
c01028a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01028a8:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c01028af:	0f 8e 5b 02 00 00    	jle    c0102b10 <_svfprintf_r+0xe30>
c01028b5:	d9 ee                	fldz   
c01028b7:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01028bd:	df e9                	fucomip %st(1),%st
c01028bf:	dd d8                	fstp   %st(0)
c01028c1:	0f 8a 59 04 00 00    	jp     c0102d20 <_svfprintf_r+0x1040>
c01028c7:	0f 85 53 04 00 00    	jne    c0102d20 <_svfprintf_r+0x1040>
c01028cd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01028d3:	83 c1 01             	add    $0x1,%ecx
c01028d6:	83 c7 08             	add    $0x8,%edi
c01028d9:	c7 47 f8 89 84 10 c0 	movl   $0xc0108489,-0x8(%edi)
c01028e0:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01028e7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01028ed:	83 c0 01             	add    $0x1,%eax
c01028f0:	83 f8 07             	cmp    $0x7,%eax
c01028f3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01028f9:	0f 8f 63 09 00 00    	jg     c0103262 <_svfprintf_r+0x1582>
c01028ff:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102905:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c010290b:	7c 0d                	jl     c010291a <_svfprintf_r+0xc3a>
c010290d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102914:	0f 84 72 fe ff ff    	je     c010278c <_svfprintf_r+0xaac>
c010291a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102920:	83 c7 08             	add    $0x8,%edi
c0102923:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102926:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010292c:	89 47 fc             	mov    %eax,-0x4(%edi)
c010292f:	01 c1                	add    %eax,%ecx
c0102931:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102937:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010293d:	83 c0 01             	add    $0x1,%eax
c0102940:	83 f8 07             	cmp    $0x7,%eax
c0102943:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102949:	0f 8f dc 0b 00 00    	jg     c010352b <_svfprintf_r+0x184b>
c010294f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102955:	8d 70 ff             	lea    -0x1(%eax),%esi
c0102958:	85 f6                	test   %esi,%esi
c010295a:	0f 8e 2c fe ff ff    	jle    c010278c <_svfprintf_r+0xaac>
c0102960:	83 fe 10             	cmp    $0x10,%esi
c0102963:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102969:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010296f:	7f 13                	jg     c0102984 <_svfprintf_r+0xca4>
c0102971:	e9 e6 05 00 00       	jmp    c0102f5c <_svfprintf_r+0x127c>
c0102976:	66 90                	xchg   %ax,%ax
c0102978:	83 ee 10             	sub    $0x10,%esi
c010297b:	83 fe 10             	cmp    $0x10,%esi
c010297e:	0f 8e d8 05 00 00    	jle    c0102f5c <_svfprintf_r+0x127c>
c0102984:	83 c0 01             	add    $0x1,%eax
c0102987:	83 c1 10             	add    $0x10,%ecx
c010298a:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102990:	83 c7 08             	add    $0x8,%edi
c0102993:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010299a:	83 f8 07             	cmp    $0x7,%eax
c010299d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01029a3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01029a9:	7e cd                	jle    c0102978 <_svfprintf_r+0xc98>
c01029ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029ae:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01029b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01029b9:	89 04 24             	mov    %eax,(%esp)
c01029bc:	e8 2f 3e 00 00       	call   c01067f0 <__ssprint_r>
c01029c1:	85 c0                	test   %eax,%eax
c01029c3:	0f 85 e7 f4 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01029c9:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01029cf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01029d2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01029d8:	eb 9e                	jmp    c0102978 <_svfprintf_r+0xc98>
c01029da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01029e0:	84 c0                	test   %al,%al
c01029e2:	75 2c                	jne    c0102a10 <_svfprintf_r+0xd30>
c01029e4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01029eb:	74 23                	je     c0102a10 <_svfprintf_r+0xd30>
c01029ed:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c01029f3:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c01029f7:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01029fd:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102a00:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102a06:	e9 2d f7 ff ff       	jmp    c0102138 <_svfprintf_r+0x458>
c0102a0b:	90                   	nop
c0102a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102a10:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102a13:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c0102a1a:	00 00 00 
c0102a1d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102a23:	e9 10 f7 ff ff       	jmp    c0102138 <_svfprintf_r+0x458>
c0102a28:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0102a2e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102a34:	85 f6                	test   %esi,%esi
c0102a36:	0f 8e 26 fc ff ff    	jle    c0102662 <_svfprintf_r+0x982>
c0102a3c:	83 fe 10             	cmp    $0x10,%esi
c0102a3f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a45:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102a4b:	7f 0b                	jg     c0102a58 <_svfprintf_r+0xd78>
c0102a4d:	eb 65                	jmp    c0102ab4 <_svfprintf_r+0xdd4>
c0102a4f:	90                   	nop
c0102a50:	83 ee 10             	sub    $0x10,%esi
c0102a53:	83 fe 10             	cmp    $0x10,%esi
c0102a56:	7e 5c                	jle    c0102ab4 <_svfprintf_r+0xdd4>
c0102a58:	83 c0 01             	add    $0x1,%eax
c0102a5b:	83 c1 10             	add    $0x10,%ecx
c0102a5e:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102a64:	83 c7 08             	add    $0x8,%edi
c0102a67:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102a6e:	83 f8 07             	cmp    $0x7,%eax
c0102a71:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a77:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a7d:	7e d1                	jle    c0102a50 <_svfprintf_r+0xd70>
c0102a7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a82:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102a86:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a8d:	89 04 24             	mov    %eax,(%esp)
c0102a90:	e8 5b 3d 00 00       	call   c01067f0 <__ssprint_r>
c0102a95:	85 c0                	test   %eax,%eax
c0102a97:	0f 85 13 f4 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102a9d:	83 ee 10             	sub    $0x10,%esi
c0102aa0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102aa6:	83 fe 10             	cmp    $0x10,%esi
c0102aa9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102aaf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ab2:	7f a4                	jg     c0102a58 <_svfprintf_r+0xd78>
c0102ab4:	83 c0 01             	add    $0x1,%eax
c0102ab7:	01 f1                	add    %esi,%ecx
c0102ab9:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102abf:	83 c7 08             	add    $0x8,%edi
c0102ac2:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102ac5:	83 f8 07             	cmp    $0x7,%eax
c0102ac8:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102ace:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102ad4:	0f 8e 88 fb ff ff    	jle    c0102662 <_svfprintf_r+0x982>
c0102ada:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ae0:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ae4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ae7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102aeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aee:	89 04 24             	mov    %eax,(%esp)
c0102af1:	e8 fa 3c 00 00       	call   c01067f0 <__ssprint_r>
c0102af6:	85 c0                	test   %eax,%eax
c0102af8:	0f 85 b2 f3 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102afe:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102b04:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102b07:	e9 56 fb ff ff       	jmp    c0102662 <_svfprintf_r+0x982>
c0102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102b10:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c0102b17:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102b1d:	0f 8e df 05 00 00    	jle    c0103102 <_svfprintf_r+0x1422>
c0102b23:	89 07                	mov    %eax,(%edi)
c0102b25:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b2b:	8d 51 01             	lea    0x1(%ecx),%edx
c0102b2e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102b35:	83 c7 08             	add    $0x8,%edi
c0102b38:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102b3e:	83 c0 01             	add    $0x1,%eax
c0102b41:	83 f8 07             	cmp    $0x7,%eax
c0102b44:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102b4a:	0f 8f 59 06 00 00    	jg     c01031a9 <_svfprintf_r+0x14c9>
c0102b50:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c0102b56:	83 c0 01             	add    $0x1,%eax
c0102b59:	83 c7 08             	add    $0x8,%edi
c0102b5c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102b62:	89 5f f8             	mov    %ebx,-0x8(%edi)
c0102b65:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c0102b6b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102b6e:	01 da                	add    %ebx,%edx
c0102b70:	83 f8 07             	cmp    $0x7,%eax
c0102b73:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102b79:	0f 8f f2 05 00 00    	jg     c0103171 <_svfprintf_r+0x1491>
c0102b7f:	d9 ee                	fldz   
c0102b81:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102b87:	df e9                	fucomip %st(1),%st
c0102b89:	dd d8                	fstp   %st(0)
c0102b8b:	7a 06                	jp     c0102b93 <_svfprintf_r+0xeb3>
c0102b8d:	0f 84 33 03 00 00    	je     c0102ec6 <_svfprintf_r+0x11e6>
c0102b93:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c0102b99:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102b9f:	83 c1 01             	add    $0x1,%ecx
c0102ba2:	89 0f                	mov    %ecx,(%edi)
c0102ba4:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c0102ba7:	89 4f 04             	mov    %ecx,0x4(%edi)
c0102baa:	01 ca                	add    %ecx,%edx
c0102bac:	83 c0 01             	add    $0x1,%eax
c0102baf:	83 f8 07             	cmp    $0x7,%eax
c0102bb2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102bb8:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102bbe:	0f 8f 75 05 00 00    	jg     c0103139 <_svfprintf_r+0x1459>
c0102bc4:	83 c7 08             	add    $0x8,%edi
c0102bc7:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c0102bcd:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c0102bd3:	89 0f                	mov    %ecx,(%edi)
c0102bd5:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102bd8:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c0102bdb:	83 c0 01             	add    $0x1,%eax
c0102bde:	83 f8 07             	cmp    $0x7,%eax
c0102be1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102be7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102bed:	0f 8e 96 fb ff ff    	jle    c0102789 <_svfprintf_r+0xaa9>
c0102bf3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102bf9:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102bfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c00:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c04:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c07:	89 04 24             	mov    %eax,(%esp)
c0102c0a:	e8 e1 3b 00 00       	call   c01067f0 <__ssprint_r>
c0102c0f:	85 c0                	test   %eax,%eax
c0102c11:	0f 85 99 f2 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102c17:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102c1d:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102c20:	e9 67 fb ff ff       	jmp    c010278c <_svfprintf_r+0xaac>
c0102c25:	8d 76 00             	lea    0x0(%esi),%esi
c0102c28:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c2e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c35:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c39:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c3c:	89 04 24             	mov    %eax,(%esp)
c0102c3f:	e8 ac 3b 00 00       	call   c01067f0 <__ssprint_r>
c0102c44:	85 c0                	test   %eax,%eax
c0102c46:	0f 84 43 fc ff ff    	je     c010288f <_svfprintf_r+0xbaf>
c0102c4c:	e9 5f f2 ff ff       	jmp    c0101eb0 <_svfprintf_r+0x1d0>
c0102c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102c58:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c5e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c65:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c6c:	89 04 24             	mov    %eax,(%esp)
c0102c6f:	e8 7c 3b 00 00       	call   c01067f0 <__ssprint_r>
c0102c74:	85 c0                	test   %eax,%eax
c0102c76:	0f 85 34 f2 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102c7c:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102c82:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102c85:	e9 c8 f9 ff ff       	jmp    c0102652 <_svfprintf_r+0x972>
c0102c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102c90:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c96:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c9d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ca1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ca4:	89 04 24             	mov    %eax,(%esp)
c0102ca7:	e8 44 3b 00 00       	call   c01067f0 <__ssprint_r>
c0102cac:	85 c0                	test   %eax,%eax
c0102cae:	0f 85 fc f1 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102cb4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102cba:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102cbd:	e9 53 f9 ff ff       	jmp    c0102615 <_svfprintf_r+0x935>
c0102cc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102cc8:	89 c2                	mov    %eax,%edx
c0102cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102cd0:	89 c8                	mov    %ecx,%eax
c0102cd2:	83 ea 01             	sub    $0x1,%edx
c0102cd5:	83 e0 07             	and    $0x7,%eax
c0102cd8:	c1 e9 03             	shr    $0x3,%ecx
c0102cdb:	83 c0 30             	add    $0x30,%eax
c0102cde:	85 c9                	test   %ecx,%ecx
c0102ce0:	88 02                	mov    %al,(%edx)
c0102ce2:	75 ec                	jne    c0102cd0 <_svfprintf_r+0xff0>
c0102ce4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102ceb:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c0102cf1:	0f 84 5b 01 00 00    	je     c0102e52 <_svfprintf_r+0x1172>
c0102cf7:	3c 30                	cmp    $0x30,%al
c0102cf9:	74 0b                	je     c0102d06 <_svfprintf_r+0x1026>
c0102cfb:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c0102d02:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0102d06:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102d09:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102d0f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102d15:	e9 1e f4 ff ff       	jmp    c0102138 <_svfprintf_r+0x458>
c0102d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102d20:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102d26:	85 db                	test   %ebx,%ebx
c0102d28:	0f 8e 66 05 00 00    	jle    c0103294 <_svfprintf_r+0x15b4>
c0102d2e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0102d34:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102d3a:	01 d0                	add    %edx,%eax
c0102d3c:	89 c3                	mov    %eax,%ebx
c0102d3e:	29 d3                	sub    %edx,%ebx
c0102d40:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102d46:	89 d0                	mov    %edx,%eax
c0102d48:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102d4e:	39 d3                	cmp    %edx,%ebx
c0102d50:	0f 4f da             	cmovg  %edx,%ebx
c0102d53:	85 db                	test   %ebx,%ebx
c0102d55:	7e 28                	jle    c0102d7f <_svfprintf_r+0x109f>
c0102d57:	89 07                	mov    %eax,(%edi)
c0102d59:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102d5f:	01 d9                	add    %ebx,%ecx
c0102d61:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102d64:	83 c7 08             	add    $0x8,%edi
c0102d67:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102d6d:	83 c0 01             	add    $0x1,%eax
c0102d70:	83 f8 07             	cmp    $0x7,%eax
c0102d73:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102d79:	0f 8f 58 09 00 00    	jg     c01036d7 <_svfprintf_r+0x19f7>
c0102d7f:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c0102d85:	31 c0                	xor    %eax,%eax
c0102d87:	85 db                	test   %ebx,%ebx
c0102d89:	0f 49 c3             	cmovns %ebx,%eax
c0102d8c:	29 c6                	sub    %eax,%esi
c0102d8e:	85 f6                	test   %esi,%esi
c0102d90:	0f 8e 40 02 00 00    	jle    c0102fd6 <_svfprintf_r+0x12f6>
c0102d96:	83 fe 10             	cmp    $0x10,%esi
c0102d99:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102d9f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102da5:	7f 15                	jg     c0102dbc <_svfprintf_r+0x10dc>
c0102da7:	e9 db 01 00 00       	jmp    c0102f87 <_svfprintf_r+0x12a7>
c0102dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102db0:	83 ee 10             	sub    $0x10,%esi
c0102db3:	83 fe 10             	cmp    $0x10,%esi
c0102db6:	0f 8e cb 01 00 00    	jle    c0102f87 <_svfprintf_r+0x12a7>
c0102dbc:	83 c0 01             	add    $0x1,%eax
c0102dbf:	83 c1 10             	add    $0x10,%ecx
c0102dc2:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102dc8:	83 c7 08             	add    $0x8,%edi
c0102dcb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102dd2:	83 f8 07             	cmp    $0x7,%eax
c0102dd5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102ddb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102de1:	7e cd                	jle    c0102db0 <_svfprintf_r+0x10d0>
c0102de3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102de6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102dea:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102dee:	8b 45 08             	mov    0x8(%ebp),%eax
c0102df1:	89 04 24             	mov    %eax,(%esp)
c0102df4:	e8 f7 39 00 00       	call   c01067f0 <__ssprint_r>
c0102df9:	85 c0                	test   %eax,%eax
c0102dfb:	0f 85 af f0 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102e01:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102e07:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102e0a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102e10:	eb 9e                	jmp    c0102db0 <_svfprintf_r+0x10d0>
c0102e12:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102e15:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c0102e1a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102e20:	89 c7                	mov    %eax,%edi
c0102e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102e28:	89 c8                	mov    %ecx,%eax
c0102e2a:	83 ef 01             	sub    $0x1,%edi
c0102e2d:	f7 e6                	mul    %esi
c0102e2f:	c1 ea 03             	shr    $0x3,%edx
c0102e32:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0102e35:	01 c0                	add    %eax,%eax
c0102e37:	29 c1                	sub    %eax,%ecx
c0102e39:	83 c1 30             	add    $0x30,%ecx
c0102e3c:	85 d2                	test   %edx,%edx
c0102e3e:	88 0f                	mov    %cl,(%edi)
c0102e40:	89 d1                	mov    %edx,%ecx
c0102e42:	75 e4                	jne    c0102e28 <_svfprintf_r+0x1148>
c0102e44:	89 fa                	mov    %edi,%edx
c0102e46:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c0102e4c:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0102e52:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102e55:	29 d0                	sub    %edx,%eax
c0102e57:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102e5d:	e9 d6 f2 ff ff       	jmp    c0102138 <_svfprintf_r+0x458>
c0102e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102e68:	83 f9 09             	cmp    $0x9,%ecx
c0102e6b:	77 a5                	ja     c0102e12 <_svfprintf_r+0x1132>
c0102e6d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102e73:	83 c1 30             	add    $0x30,%ecx
c0102e76:	88 4d a7             	mov    %cl,-0x59(%ebp)
c0102e79:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102e7f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102e82:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102e88:	e9 ab f2 ff ff       	jmp    c0102138 <_svfprintf_r+0x458>
c0102e8d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102e93:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102e97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e9a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ea1:	89 04 24             	mov    %eax,(%esp)
c0102ea4:	e8 47 39 00 00       	call   c01067f0 <__ssprint_r>
c0102ea9:	85 c0                	test   %eax,%eax
c0102eab:	0f 85 ff ef ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102eb1:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102eb8:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ebb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102ec1:	e9 18 f7 ff ff       	jmp    c01025de <_svfprintf_r+0x8fe>
c0102ec6:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102ecc:	8d 73 ff             	lea    -0x1(%ebx),%esi
c0102ecf:	85 f6                	test   %esi,%esi
c0102ed1:	0f 8e f0 fc ff ff    	jle    c0102bc7 <_svfprintf_r+0xee7>
c0102ed7:	83 fe 10             	cmp    $0x10,%esi
c0102eda:	7e 70                	jle    c0102f4c <_svfprintf_r+0x126c>
c0102edc:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102ee2:	eb 0c                	jmp    c0102ef0 <_svfprintf_r+0x1210>
c0102ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102ee8:	83 ee 10             	sub    $0x10,%esi
c0102eeb:	83 fe 10             	cmp    $0x10,%esi
c0102eee:	7e 5c                	jle    c0102f4c <_svfprintf_r+0x126c>
c0102ef0:	83 c0 01             	add    $0x1,%eax
c0102ef3:	83 c2 10             	add    $0x10,%edx
c0102ef6:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102efc:	83 c7 08             	add    $0x8,%edi
c0102eff:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102f06:	83 f8 07             	cmp    $0x7,%eax
c0102f09:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102f0f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f15:	7e d1                	jle    c0102ee8 <_svfprintf_r+0x1208>
c0102f17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f1a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102f1e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f22:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f25:	89 04 24             	mov    %eax,(%esp)
c0102f28:	e8 c3 38 00 00       	call   c01067f0 <__ssprint_r>
c0102f2d:	85 c0                	test   %eax,%eax
c0102f2f:	0f 85 7b ef ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102f35:	83 ee 10             	sub    $0x10,%esi
c0102f38:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102f3e:	83 fe 10             	cmp    $0x10,%esi
c0102f41:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102f47:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f4a:	7f a4                	jg     c0102ef0 <_svfprintf_r+0x1210>
c0102f4c:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102f52:	01 f2                	add    %esi,%edx
c0102f54:	89 77 04             	mov    %esi,0x4(%edi)
c0102f57:	e9 50 fc ff ff       	jmp    c0102bac <_svfprintf_r+0xecc>
c0102f5c:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102f62:	01 f1                	add    %esi,%ecx
c0102f64:	89 77 04             	mov    %esi,0x4(%edi)
c0102f67:	e9 6f fc ff ff       	jmp    c0102bdb <_svfprintf_r+0xefb>
c0102f6c:	8b 45 14             	mov    0x14(%ebp),%eax
c0102f6f:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c0102f75:	8b 00                	mov    (%eax),%eax
c0102f77:	89 10                	mov    %edx,(%eax)
c0102f79:	8b 45 14             	mov    0x14(%ebp),%eax
c0102f7c:	83 c0 04             	add    $0x4,%eax
c0102f7f:	89 45 14             	mov    %eax,0x14(%ebp)
c0102f82:	e9 f4 ed ff ff       	jmp    c0101d7b <_svfprintf_r+0x9b>
c0102f87:	83 c0 01             	add    $0x1,%eax
c0102f8a:	01 f1                	add    %esi,%ecx
c0102f8c:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0102f92:	83 c7 08             	add    $0x8,%edi
c0102f95:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102f98:	83 f8 07             	cmp    $0x7,%eax
c0102f9b:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102fa1:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102fa7:	7e 2d                	jle    c0102fd6 <_svfprintf_r+0x12f6>
c0102fa9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102faf:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102fb3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102fb6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fbd:	89 04 24             	mov    %eax,(%esp)
c0102fc0:	e8 2b 38 00 00       	call   c01067f0 <__ssprint_r>
c0102fc5:	85 c0                	test   %eax,%eax
c0102fc7:	0f 85 e3 ee ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0102fcd:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102fd3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102fd6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102fdc:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0102fe2:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0102fe8:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c0102fee:	89 c6                	mov    %eax,%esi
c0102ff0:	7c 0d                	jl     c0102fff <_svfprintf_r+0x131f>
c0102ff2:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102ff9:	0f 84 5e 05 00 00    	je     c010355d <_svfprintf_r+0x187d>
c0102fff:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0103005:	89 07                	mov    %eax,(%edi)
c0103007:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010300d:	01 c1                	add    %eax,%ecx
c010300f:	89 47 04             	mov    %eax,0x4(%edi)
c0103012:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103018:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010301e:	83 c0 01             	add    $0x1,%eax
c0103021:	83 f8 07             	cmp    $0x7,%eax
c0103024:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010302a:	0f 8f d9 06 00 00    	jg     c0103709 <_svfprintf_r+0x1a29>
c0103030:	83 c7 08             	add    $0x8,%edi
c0103033:	89 d0                	mov    %edx,%eax
c0103035:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010303b:	89 f2                	mov    %esi,%edx
c010303d:	29 f3                	sub    %esi,%ebx
c010303f:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c0103045:	29 c6                	sub    %eax,%esi
c0103047:	39 de                	cmp    %ebx,%esi
c0103049:	0f 4e de             	cmovle %esi,%ebx
c010304c:	85 db                	test   %ebx,%ebx
c010304e:	7e 29                	jle    c0103079 <_svfprintf_r+0x1399>
c0103050:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103056:	01 d9                	add    %ebx,%ecx
c0103058:	83 c7 08             	add    $0x8,%edi
c010305b:	89 57 f8             	mov    %edx,-0x8(%edi)
c010305e:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0103061:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0103067:	83 c0 01             	add    $0x1,%eax
c010306a:	83 f8 07             	cmp    $0x7,%eax
c010306d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103073:	0f 8f c8 06 00 00    	jg     c0103741 <_svfprintf_r+0x1a61>
c0103079:	31 c0                	xor    %eax,%eax
c010307b:	85 db                	test   %ebx,%ebx
c010307d:	0f 49 c3             	cmovns %ebx,%eax
c0103080:	29 c6                	sub    %eax,%esi
c0103082:	85 f6                	test   %esi,%esi
c0103084:	0f 8e 02 f7 ff ff    	jle    c010278c <_svfprintf_r+0xaac>
c010308a:	83 fe 10             	cmp    $0x10,%esi
c010308d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103093:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0103099:	7f 11                	jg     c01030ac <_svfprintf_r+0x13cc>
c010309b:	e9 bc fe ff ff       	jmp    c0102f5c <_svfprintf_r+0x127c>
c01030a0:	83 ee 10             	sub    $0x10,%esi
c01030a3:	83 fe 10             	cmp    $0x10,%esi
c01030a6:	0f 8e b0 fe ff ff    	jle    c0102f5c <_svfprintf_r+0x127c>
c01030ac:	83 c0 01             	add    $0x1,%eax
c01030af:	83 c1 10             	add    $0x10,%ecx
c01030b2:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c01030b8:	83 c7 08             	add    $0x8,%edi
c01030bb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01030c2:	83 f8 07             	cmp    $0x7,%eax
c01030c5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01030cb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01030d1:	7e cd                	jle    c01030a0 <_svfprintf_r+0x13c0>
c01030d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030d6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01030da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030de:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e1:	89 04 24             	mov    %eax,(%esp)
c01030e4:	e8 07 37 00 00       	call   c01067f0 <__ssprint_r>
c01030e9:	85 c0                	test   %eax,%eax
c01030eb:	0f 85 bf ed ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01030f1:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030f7:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030fa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103100:	eb 9e                	jmp    c01030a0 <_svfprintf_r+0x13c0>
c0103102:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103109:	0f 85 14 fa ff ff    	jne    c0102b23 <_svfprintf_r+0xe43>
c010310f:	89 07                	mov    %eax,(%edi)
c0103111:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103117:	8d 51 01             	lea    0x1(%ecx),%edx
c010311a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0103121:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103127:	83 c0 01             	add    $0x1,%eax
c010312a:	83 f8 07             	cmp    $0x7,%eax
c010312d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103133:	0f 8e 8b fa ff ff    	jle    c0102bc4 <_svfprintf_r+0xee4>
c0103139:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010313f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103143:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103146:	89 44 24 04          	mov    %eax,0x4(%esp)
c010314a:	8b 45 08             	mov    0x8(%ebp),%eax
c010314d:	89 04 24             	mov    %eax,(%esp)
c0103150:	e8 9b 36 00 00       	call   c01067f0 <__ssprint_r>
c0103155:	85 c0                	test   %eax,%eax
c0103157:	0f 85 53 ed ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010315d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0103163:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103166:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010316c:	e9 56 fa ff ff       	jmp    c0102bc7 <_svfprintf_r+0xee7>
c0103171:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103177:	89 44 24 08          	mov    %eax,0x8(%esp)
c010317b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010317e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103182:	8b 45 08             	mov    0x8(%ebp),%eax
c0103185:	89 04 24             	mov    %eax,(%esp)
c0103188:	e8 63 36 00 00       	call   c01067f0 <__ssprint_r>
c010318d:	85 c0                	test   %eax,%eax
c010318f:	0f 85 1b ed ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0103195:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010319b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010319e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01031a4:	e9 d6 f9 ff ff       	jmp    c0102b7f <_svfprintf_r+0xe9f>
c01031a9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01031af:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031b6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01031bd:	89 04 24             	mov    %eax,(%esp)
c01031c0:	e8 2b 36 00 00       	call   c01067f0 <__ssprint_r>
c01031c5:	85 c0                	test   %eax,%eax
c01031c7:	0f 85 e3 ec ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01031cd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01031d3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01031d6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01031dc:	e9 6f f9 ff ff       	jmp    c0102b50 <_svfprintf_r+0xe70>
c01031e1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01031e7:	dd 1c 24             	fstpl  (%esp)
c01031ea:	e8 11 35 00 00       	call   c0106700 <__fpclassifyd>
c01031ef:	85 c0                	test   %eax,%eax
c01031f1:	0f 85 a3 01 00 00    	jne    c010339a <_svfprintf_r+0x16ba>
c01031f7:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c01031fe:	ba 42 8b 10 c0       	mov    $0xc0108b42,%edx
c0103203:	b8 46 8b 10 c0       	mov    $0xc0108b46,%eax
c0103208:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010320f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0103216:	00 00 00 
c0103219:	0f 4e c2             	cmovle %edx,%eax
c010321c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0103222:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0103229:	ff ff ff 
c010322c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0103233:	00 00 00 
c0103236:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010323d:	00 00 00 
c0103240:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103247:	00 00 00 
c010324a:	e9 29 ed ff ff       	jmp    c0101f78 <_svfprintf_r+0x298>
c010324f:	dd 00                	fldl   (%eax)
c0103251:	83 c0 08             	add    $0x8,%eax
c0103254:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c010325a:	89 45 14             	mov    %eax,0x14(%ebp)
c010325d:	e9 e6 ef ff ff       	jmp    c0102248 <_svfprintf_r+0x568>
c0103262:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103268:	89 44 24 08          	mov    %eax,0x8(%esp)
c010326c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010326f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103273:	8b 45 08             	mov    0x8(%ebp),%eax
c0103276:	89 04 24             	mov    %eax,(%esp)
c0103279:	e8 72 35 00 00       	call   c01067f0 <__ssprint_r>
c010327e:	85 c0                	test   %eax,%eax
c0103280:	0f 85 2a ec ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0103286:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010328c:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010328f:	e9 6b f6 ff ff       	jmp    c01028ff <_svfprintf_r+0xc1f>
c0103294:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010329a:	83 c1 01             	add    $0x1,%ecx
c010329d:	83 c7 08             	add    $0x8,%edi
c01032a0:	c7 47 f8 89 84 10 c0 	movl   $0xc0108489,-0x8(%edi)
c01032a7:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01032ae:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01032b4:	83 c0 01             	add    $0x1,%eax
c01032b7:	83 f8 07             	cmp    $0x7,%eax
c01032ba:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01032c0:	0f 8f ef 02 00 00    	jg     c01035b5 <_svfprintf_r+0x18d5>
c01032c6:	85 db                	test   %ebx,%ebx
c01032c8:	75 17                	jne    c01032e1 <_svfprintf_r+0x1601>
c01032ca:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c01032d0:	85 d2                	test   %edx,%edx
c01032d2:	75 0d                	jne    c01032e1 <_svfprintf_r+0x1601>
c01032d4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01032db:	0f 84 ab f4 ff ff    	je     c010278c <_svfprintf_r+0xaac>
c01032e1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c01032e7:	83 c7 08             	add    $0x8,%edi
c01032ea:	89 47 f8             	mov    %eax,-0x8(%edi)
c01032ed:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c01032f3:	89 47 fc             	mov    %eax,-0x4(%edi)
c01032f6:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c01032f9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01032ff:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103305:	83 c0 01             	add    $0x1,%eax
c0103308:	83 f8 07             	cmp    $0x7,%eax
c010330b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103311:	0f 8f 60 03 00 00    	jg     c0103677 <_svfprintf_r+0x1997>
c0103317:	f7 db                	neg    %ebx
c0103319:	85 db                	test   %ebx,%ebx
c010331b:	0f 8e 21 03 00 00    	jle    c0103642 <_svfprintf_r+0x1962>
c0103321:	83 fb 10             	cmp    $0x10,%ebx
c0103324:	0f 8e c3 02 00 00    	jle    c01035ed <_svfprintf_r+0x190d>
c010332a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0103330:	eb 12                	jmp    c0103344 <_svfprintf_r+0x1664>
c0103332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103338:	83 eb 10             	sub    $0x10,%ebx
c010333b:	83 fb 10             	cmp    $0x10,%ebx
c010333e:	0f 8e a9 02 00 00    	jle    c01035ed <_svfprintf_r+0x190d>
c0103344:	83 c0 01             	add    $0x1,%eax
c0103347:	83 c2 10             	add    $0x10,%edx
c010334a:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c0103350:	83 c7 08             	add    $0x8,%edi
c0103353:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010335a:	83 f8 07             	cmp    $0x7,%eax
c010335d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103363:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103369:	7e cd                	jle    c0103338 <_svfprintf_r+0x1658>
c010336b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010336e:	89 74 24 08          	mov    %esi,0x8(%esp)
c0103372:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103376:	8b 45 08             	mov    0x8(%ebp),%eax
c0103379:	89 04 24             	mov    %eax,(%esp)
c010337c:	e8 6f 34 00 00       	call   c01067f0 <__ssprint_r>
c0103381:	85 c0                	test   %eax,%eax
c0103383:	0f 85 27 eb ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0103389:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010338f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103392:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103398:	eb 9e                	jmp    c0103338 <_svfprintf_r+0x1658>
c010339a:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c01033a0:	83 e3 df             	and    $0xffffffdf,%ebx
c01033a3:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c01033aa:	0f 84 05 03 00 00    	je     c01036b5 <_svfprintf_r+0x19d5>
c01033b0:	83 fb 47             	cmp    $0x47,%ebx
c01033b3:	75 16                	jne    c01033cb <_svfprintf_r+0x16eb>
c01033b5:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01033bb:	b8 01 00 00 00       	mov    $0x1,%eax
c01033c0:	85 d2                	test   %edx,%edx
c01033c2:	0f 45 c2             	cmovne %edx,%eax
c01033c5:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c01033cb:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01033d1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01033d7:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c01033dd:	80 cc 01             	or     $0x1,%ah
c01033e0:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c01033e6:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c01033ec:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c01033f3:	85 c0                	test   %eax,%eax
c01033f5:	0f 88 ba 05 00 00    	js     c01039b5 <_svfprintf_r+0x1cd5>
c01033fb:	83 fb 46             	cmp    $0x46,%ebx
c01033fe:	0f 94 c0             	sete   %al
c0103401:	89 c6                	mov    %eax,%esi
c0103403:	0f 84 d4 03 00 00    	je     c01037dd <_svfprintf_r+0x1afd>
c0103409:	83 fb 45             	cmp    $0x45,%ebx
c010340c:	0f 85 99 05 00 00    	jne    c01039ab <_svfprintf_r+0x1ccb>
c0103412:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103418:	dd 54 24 04          	fstl   0x4(%esp)
c010341c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0103423:	00 
c0103424:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c010342a:	8d 70 01             	lea    0x1(%eax),%esi
c010342d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103433:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0103437:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c010343d:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103441:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0103447:	89 44 24 14          	mov    %eax,0x14(%esp)
c010344b:	8b 45 08             	mov    0x8(%ebp),%eax
c010344e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0103452:	89 04 24             	mov    %eax,(%esp)
c0103455:	e8 56 09 00 00       	call   c0103db0 <_dtoa_r>
c010345a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0103460:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0103463:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103469:	d9 ee                	fldz   
c010346b:	d9 c9                	fxch   %st(1)
c010346d:	df e9                	fucomip %st(1),%st
c010346f:	dd d8                	fstp   %st(0)
c0103471:	0f 8a fd 00 00 00    	jp     c0103574 <_svfprintf_r+0x1894>
c0103477:	89 c8                	mov    %ecx,%eax
c0103479:	0f 85 f5 00 00 00    	jne    c0103574 <_svfprintf_r+0x1894>
c010347f:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0103485:	83 fb 47             	cmp    $0x47,%ebx
c0103488:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c010348e:	0f 84 1e 04 00 00    	je     c01038b2 <_svfprintf_r+0x1bd2>
c0103494:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c010349b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01034a1:	0f 8e 65 04 00 00    	jle    c010390c <_svfprintf_r+0x1c2c>
c01034a7:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c01034ae:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c01034b4:	0f 84 3c 05 00 00    	je     c01039f6 <_svfprintf_r+0x1d16>
c01034ba:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c01034c0:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c01034c6:	0f 8f f7 04 00 00    	jg     c01039c3 <_svfprintf_r+0x1ce3>
c01034cc:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01034d2:	83 e0 01             	and    $0x1,%eax
c01034d5:	0f 85 e2 05 00 00    	jne    c0103abd <_svfprintf_r+0x1ddd>
c01034db:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c01034e1:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c01034e8:	00 00 00 
c01034eb:	85 d2                	test   %edx,%edx
c01034ed:	0f 49 c2             	cmovns %edx,%eax
c01034f0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01034f6:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c01034fd:	0f 85 68 03 00 00    	jne    c010386b <_svfprintf_r+0x1b8b>
c0103503:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103509:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c010350f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0103516:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010351d:	00 00 00 
c0103520:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0103526:	e9 4d ea ff ff       	jmp    c0101f78 <_svfprintf_r+0x298>
c010352b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103531:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103535:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103538:	89 44 24 04          	mov    %eax,0x4(%esp)
c010353c:	8b 45 08             	mov    0x8(%ebp),%eax
c010353f:	89 04 24             	mov    %eax,(%esp)
c0103542:	e8 a9 32 00 00       	call   c01067f0 <__ssprint_r>
c0103547:	85 c0                	test   %eax,%eax
c0103549:	0f 85 61 e9 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010354f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103555:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103558:	e9 f2 f3 ff ff       	jmp    c010294f <_svfprintf_r+0xc6f>
c010355d:	89 d0                	mov    %edx,%eax
c010355f:	e9 d1 fa ff ff       	jmp    c0103035 <_svfprintf_r+0x1355>
c0103564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103568:	8d 50 01             	lea    0x1(%eax),%edx
c010356b:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0103571:	c6 00 30             	movb   $0x30,(%eax)
c0103574:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c010357a:	39 c1                	cmp    %eax,%ecx
c010357c:	77 ea                	ja     c0103568 <_svfprintf_r+0x1888>
c010357e:	e9 fc fe ff ff       	jmp    c010347f <_svfprintf_r+0x179f>
c0103583:	8b 45 08             	mov    0x8(%ebp),%eax
c0103586:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c010358d:	00 
c010358e:	89 04 24             	mov    %eax,(%esp)
c0103591:	e8 4a 1b 00 00       	call   c01050e0 <_malloc_r>
c0103596:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103599:	85 c0                	test   %eax,%eax
c010359b:	89 02                	mov    %eax,(%edx)
c010359d:	89 42 10             	mov    %eax,0x10(%edx)
c01035a0:	0f 84 15 06 00 00    	je     c0103bbb <_svfprintf_r+0x1edb>
c01035a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035a9:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c01035b0:	e9 6c e7 ff ff       	jmp    c0101d21 <_svfprintf_r+0x41>
c01035b5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01035bb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01035bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01035c2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01035c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035c9:	89 04 24             	mov    %eax,(%esp)
c01035cc:	e8 1f 32 00 00       	call   c01067f0 <__ssprint_r>
c01035d1:	85 c0                	test   %eax,%eax
c01035d3:	0f 85 d7 e8 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01035d9:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01035df:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01035e2:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01035e8:	e9 d9 fc ff ff       	jmp    c01032c6 <_svfprintf_r+0x15e6>
c01035ed:	83 c0 01             	add    $0x1,%eax
c01035f0:	01 da                	add    %ebx,%edx
c01035f2:	c7 07 d8 8c 10 c0    	movl   $0xc0108cd8,(%edi)
c01035f8:	83 c7 08             	add    $0x8,%edi
c01035fb:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01035fe:	83 f8 07             	cmp    $0x7,%eax
c0103601:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103607:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010360d:	7e 33                	jle    c0103642 <_svfprintf_r+0x1962>
c010360f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103615:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103619:	8b 45 0c             	mov    0xc(%ebp),%eax
c010361c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103620:	8b 45 08             	mov    0x8(%ebp),%eax
c0103623:	89 04 24             	mov    %eax,(%esp)
c0103626:	e8 c5 31 00 00       	call   c01067f0 <__ssprint_r>
c010362b:	85 c0                	test   %eax,%eax
c010362d:	0f 85 7d e8 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0103633:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0103639:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010363c:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103642:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0103648:	83 c0 01             	add    $0x1,%eax
c010364b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103651:	89 1f                	mov    %ebx,(%edi)
c0103653:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103659:	01 da                	add    %ebx,%edx
c010365b:	83 f8 07             	cmp    $0x7,%eax
c010365e:	89 5f 04             	mov    %ebx,0x4(%edi)
c0103661:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103667:	0f 8f 86 f5 ff ff    	jg     c0102bf3 <_svfprintf_r+0xf13>
c010366d:	83 c7 08             	add    $0x8,%edi
c0103670:	89 d1                	mov    %edx,%ecx
c0103672:	e9 15 f1 ff ff       	jmp    c010278c <_svfprintf_r+0xaac>
c0103677:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010367d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103681:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103684:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103688:	8b 45 08             	mov    0x8(%ebp),%eax
c010368b:	89 04 24             	mov    %eax,(%esp)
c010368e:	e8 5d 31 00 00       	call   c01067f0 <__ssprint_r>
c0103693:	85 c0                	test   %eax,%eax
c0103695:	0f 85 15 e8 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010369b:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01036a1:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01036a4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01036aa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01036b0:	e9 62 fc ff ff       	jmp    c0103317 <_svfprintf_r+0x1637>
c01036b5:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c01036bc:	00 00 00 
c01036bf:	e9 07 fd ff ff       	jmp    c01033cb <_svfprintf_r+0x16eb>
c01036c4:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01036ca:	89 04 24             	mov    %eax,(%esp)
c01036cd:	e8 9e 30 00 00       	call   c0106770 <strlen>
c01036d2:	e9 6a e8 ff ff       	jmp    c0101f41 <_svfprintf_r+0x261>
c01036d7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01036dd:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036e4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01036eb:	89 04 24             	mov    %eax,(%esp)
c01036ee:	e8 fd 30 00 00       	call   c01067f0 <__ssprint_r>
c01036f3:	85 c0                	test   %eax,%eax
c01036f5:	0f 85 b5 e7 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c01036fb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103701:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103704:	e9 76 f6 ff ff       	jmp    c0102d7f <_svfprintf_r+0x109f>
c0103709:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010370f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103713:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103716:	89 44 24 04          	mov    %eax,0x4(%esp)
c010371a:	8b 45 08             	mov    0x8(%ebp),%eax
c010371d:	89 04 24             	mov    %eax,(%esp)
c0103720:	e8 cb 30 00 00       	call   c01067f0 <__ssprint_r>
c0103725:	85 c0                	test   %eax,%eax
c0103727:	0f 85 83 e7 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c010372d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103733:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103736:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010373c:	e9 f4 f8 ff ff       	jmp    c0103035 <_svfprintf_r+0x1355>
c0103741:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103747:	89 44 24 08          	mov    %eax,0x8(%esp)
c010374b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010374e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103752:	8b 45 08             	mov    0x8(%ebp),%eax
c0103755:	89 04 24             	mov    %eax,(%esp)
c0103758:	e8 93 30 00 00       	call   c01067f0 <__ssprint_r>
c010375d:	85 c0                	test   %eax,%eax
c010375f:	0f 85 4b e7 ff ff    	jne    c0101eb0 <_svfprintf_r+0x1d0>
c0103765:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c010376b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010376e:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c0103774:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010377a:	e9 fa f8 ff ff       	jmp    c0103079 <_svfprintf_r+0x1399>
c010377f:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103785:	b0 06                	mov    $0x6,%al
c0103787:	89 75 14             	mov    %esi,0x14(%ebp)
c010378a:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103791:	00 00 00 
c0103794:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010379b:	00 00 00 
c010379e:	83 fa 06             	cmp    $0x6,%edx
c01037a1:	0f 46 c2             	cmovbe %edx,%eax
c01037a4:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01037aa:	85 c0                	test   %eax,%eax
c01037ac:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01037b2:	c7 85 28 ff ff ff 6c 	movl   $0xc0108b6c,-0xd8(%ebp)
c01037b9:	8b 10 c0 
c01037bc:	0f 49 d0             	cmovns %eax,%edx
c01037bf:	31 db                	xor    %ebx,%ebx
c01037c1:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c01037c7:	e9 b7 e7 ff ff       	jmp    c0101f83 <_svfprintf_r+0x2a3>
c01037cc:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01037d3:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01037d8:	e9 9d ea ff ff       	jmp    c010227a <_svfprintf_r+0x59a>
c01037dd:	ba 03 00 00 00       	mov    $0x3,%edx
c01037e2:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c01037e8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c01037ec:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c01037f2:	89 44 24 18          	mov    %eax,0x18(%esp)
c01037f6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c01037fc:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103800:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103806:	dd 54 24 04          	fstl   0x4(%esp)
c010380a:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010380e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0103814:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103818:	8b 45 08             	mov    0x8(%ebp),%eax
c010381b:	89 04 24             	mov    %eax,(%esp)
c010381e:	e8 8d 05 00 00       	call   c0103db0 <_dtoa_r>
c0103823:	83 fb 47             	cmp    $0x47,%ebx
c0103826:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010382c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103832:	75 09                	jne    c010383d <_svfprintf_r+0x1b5d>
c0103834:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010383b:	74 5b                	je     c0103898 <_svfprintf_r+0x1bb8>
c010383d:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0103843:	89 f0                	mov    %esi,%eax
c0103845:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c010384b:	01 d1                	add    %edx,%ecx
c010384d:	84 c0                	test   %al,%al
c010384f:	0f 84 14 fc ff ff    	je     c0103469 <_svfprintf_r+0x1789>
c0103855:	80 3a 30             	cmpb   $0x30,(%edx)
c0103858:	0f 84 37 02 00 00    	je     c0103a95 <_svfprintf_r+0x1db5>
c010385e:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103864:	01 c1                	add    %eax,%ecx
c0103866:	e9 fe fb ff ff       	jmp    c0103469 <_svfprintf_r+0x1789>
c010386b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103871:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0103877:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c010387c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0103883:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010388a:	00 00 00 
c010388d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0103893:	e9 e4 e6 ff ff       	jmp    c0101f7c <_svfprintf_r+0x29c>
c0103898:	dd d8                	fstp   %st(0)
c010389a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01038a0:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c01038a6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01038ac:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c01038b2:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01038b8:	83 f8 fd             	cmp    $0xfffffffd,%eax
c01038bb:	7c 48                	jl     c0103905 <_svfprintf_r+0x1c25>
c01038bd:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c01038c3:	7c 40                	jl     c0103905 <_svfprintf_r+0x1c25>
c01038c5:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c01038cb:	e9 ea fb ff ff       	jmp    c01034ba <_svfprintf_r+0x17da>
c01038d0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01038d6:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01038dd:	89 75 14             	mov    %esi,0x14(%ebp)
c01038e0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01038e7:	00 00 00 
c01038ea:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01038f0:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01038f6:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01038fd:	00 00 00 
c0103900:	e9 73 e6 ff ff       	jmp    c0101f78 <_svfprintf_r+0x298>
c0103905:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c010390c:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010390f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c0103916:	85 c9                	test   %ecx,%ecx
c0103918:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010391e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c0103924:	0f 88 2c 02 00 00    	js     c0103b56 <_svfprintf_r+0x1e76>
c010392a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c0103931:	83 f9 09             	cmp    $0x9,%ecx
c0103934:	0f 8f ea 00 00 00    	jg     c0103a24 <_svfprintf_r+0x1d44>
c010393a:	83 c1 30             	add    $0x30,%ecx
c010393d:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c0103944:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c010394a:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c0103950:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103956:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c010395c:	29 d0                	sub    %edx,%eax
c010395e:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c0103964:	89 da                	mov    %ebx,%edx
c0103966:	01 c2                	add    %eax,%edx
c0103968:	83 fb 01             	cmp    $0x1,%ebx
c010396b:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103971:	0f 8e 21 02 00 00    	jle    c0103b98 <_svfprintf_r+0x1eb8>
c0103977:	31 c0                	xor    %eax,%eax
c0103979:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c0103980:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c0103987:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010398e:	00 00 00 
c0103991:	e9 60 fb ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103996:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c010399c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01039a3:	00 00 00 
c01039a6:	e9 68 e4 ff ff       	jmp    c0101e13 <_svfprintf_r+0x133>
c01039ab:	ba 02 00 00 00       	mov    $0x2,%edx
c01039b0:	e9 2d fe ff ff       	jmp    c01037e2 <_svfprintf_r+0x1b02>
c01039b5:	d9 e0                	fchs   
c01039b7:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c01039be:	e9 38 fa ff ff       	jmp    c01033fb <_svfprintf_r+0x171b>
c01039c3:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c01039c9:	ba 01 00 00 00       	mov    $0x1,%edx
c01039ce:	85 c9                	test   %ecx,%ecx
c01039d0:	0f 8e 5a 01 00 00    	jle    c0103b30 <_svfprintf_r+0x1e50>
c01039d6:	31 c0                	xor    %eax,%eax
c01039d8:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c01039de:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c01039e5:	00 00 00 
c01039e8:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01039ee:	0f 49 c2             	cmovns %edx,%eax
c01039f1:	e9 00 fb ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c01039f6:	85 c0                	test   %eax,%eax
c01039f8:	0f 8e 06 01 00 00    	jle    c0103b04 <_svfprintf_r+0x1e24>
c01039fe:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0103a04:	85 f6                	test   %esi,%esi
c0103a06:	0f 85 d4 00 00 00    	jne    c0103ae0 <_svfprintf_r+0x1e00>
c0103a0c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103a13:	0f 85 c7 00 00 00    	jne    c0103ae0 <_svfprintf_r+0x1e00>
c0103a19:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103a1f:	e9 d2 fa ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103a24:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c0103a2a:	89 f3                	mov    %esi,%ebx
c0103a2c:	b8 67 66 66 66       	mov    $0x66666667,%eax
c0103a31:	83 eb 01             	sub    $0x1,%ebx
c0103a34:	f7 e9                	imul   %ecx
c0103a36:	89 c8                	mov    %ecx,%eax
c0103a38:	c1 f8 1f             	sar    $0x1f,%eax
c0103a3b:	c1 fa 02             	sar    $0x2,%edx
c0103a3e:	29 c2                	sub    %eax,%edx
c0103a40:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0103a43:	01 c0                	add    %eax,%eax
c0103a45:	29 c1                	sub    %eax,%ecx
c0103a47:	83 fa 09             	cmp    $0x9,%edx
c0103a4a:	8d 41 30             	lea    0x30(%ecx),%eax
c0103a4d:	89 d1                	mov    %edx,%ecx
c0103a4f:	88 03                	mov    %al,(%ebx)
c0103a51:	7f d9                	jg     c0103a2c <_svfprintf_r+0x1d4c>
c0103a53:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0103a56:	83 c1 30             	add    $0x30,%ecx
c0103a59:	39 f0                	cmp    %esi,%eax
c0103a5b:	88 4b ff             	mov    %cl,-0x1(%ebx)
c0103a5e:	0f 83 6a 01 00 00    	jae    c0103bce <_svfprintf_r+0x1eee>
c0103a64:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c0103a6a:	eb 07                	jmp    c0103a73 <_svfprintf_r+0x1d93>
c0103a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103a70:	0f b6 08             	movzbl (%eax),%ecx
c0103a73:	83 c0 01             	add    $0x1,%eax
c0103a76:	83 c2 01             	add    $0x1,%edx
c0103a79:	39 f0                	cmp    %esi,%eax
c0103a7b:	88 4a ff             	mov    %cl,-0x1(%edx)
c0103a7e:	75 f0                	jne    c0103a70 <_svfprintf_r+0x1d90>
c0103a80:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103a86:	29 d8                	sub    %ebx,%eax
c0103a88:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c0103a8e:	01 d0                	add    %edx,%eax
c0103a90:	e9 bb fe ff ff       	jmp    c0103950 <_svfprintf_r+0x1c70>
c0103a95:	d9 ee                	fldz   
c0103a97:	d9 c9                	fxch   %st(1)
c0103a99:	db e9                	fucomi %st(1),%st
c0103a9b:	dd d9                	fstp   %st(1)
c0103a9d:	7a 06                	jp     c0103aa5 <_svfprintf_r+0x1dc5>
c0103a9f:	0f 84 b9 fd ff ff    	je     c010385e <_svfprintf_r+0x1b7e>
c0103aa5:	b8 01 00 00 00       	mov    $0x1,%eax
c0103aaa:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c0103ab0:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c0103ab6:	01 c1                	add    %eax,%ecx
c0103ab8:	e9 ac f9 ff ff       	jmp    c0103469 <_svfprintf_r+0x1789>
c0103abd:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103ac3:	31 c0                	xor    %eax,%eax
c0103ac5:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103acc:	00 00 00 
c0103acf:	83 c2 01             	add    $0x1,%edx
c0103ad2:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103ad8:	0f 49 c2             	cmovns %edx,%eax
c0103adb:	e9 16 fa ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103ae0:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103ae6:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103aec:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0103af0:	89 c2                	mov    %eax,%edx
c0103af2:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103af8:	31 c0                	xor    %eax,%eax
c0103afa:	85 d2                	test   %edx,%edx
c0103afc:	0f 49 c2             	cmovns %edx,%eax
c0103aff:	e9 f2 f9 ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103b04:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c0103b0a:	85 db                	test   %ebx,%ebx
c0103b0c:	75 2f                	jne    c0103b3d <_svfprintf_r+0x1e5d>
c0103b0e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103b15:	75 26                	jne    c0103b3d <_svfprintf_r+0x1e5d>
c0103b17:	b8 01 00 00 00       	mov    $0x1,%eax
c0103b1c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0103b23:	00 00 00 
c0103b26:	e9 cb f9 ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103b2b:	90                   	nop
c0103b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b30:	b2 02                	mov    $0x2,%dl
c0103b32:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c0103b38:	e9 99 fe ff ff       	jmp    c01039d6 <_svfprintf_r+0x1cf6>
c0103b3d:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103b43:	31 c0                	xor    %eax,%eax
c0103b45:	83 c2 02             	add    $0x2,%edx
c0103b48:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103b4e:	0f 49 c2             	cmovns %edx,%eax
c0103b51:	e9 a0 f9 ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103b56:	f7 d9                	neg    %ecx
c0103b58:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c0103b5f:	e9 cd fd ff ff       	jmp    c0103931 <_svfprintf_r+0x1c51>
c0103b64:	8b 55 14             	mov    0x14(%ebp),%edx
c0103b67:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b6a:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0103b70:	8b 12                	mov    (%edx),%edx
c0103b72:	83 c0 04             	add    $0x4,%eax
c0103b75:	89 45 14             	mov    %eax,0x14(%ebp)
c0103b78:	85 d2                	test   %edx,%edx
c0103b7a:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0103b80:	0f 89 a9 e2 ff ff    	jns    c0101e2f <_svfprintf_r+0x14f>
c0103b86:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0103b8d:	ff ff ff 
c0103b90:	89 c8                	mov    %ecx,%eax
c0103b92:	e9 76 e2 ff ff       	jmp    c0101e0d <_svfprintf_r+0x12d>
c0103b97:	90                   	nop
c0103b98:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0103b9e:	83 e0 01             	and    $0x1,%eax
c0103ba1:	0f 85 d0 fd ff ff    	jne    c0103977 <_svfprintf_r+0x1c97>
c0103ba7:	85 d2                	test   %edx,%edx
c0103ba9:	0f 49 c2             	cmovns %edx,%eax
c0103bac:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103bb3:	00 00 00 
c0103bb6:	e9 3b f9 ff ff       	jmp    c01034f6 <_svfprintf_r+0x1816>
c0103bbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bbe:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0103bc4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103bc9:	e9 f5 e2 ff ff       	jmp    c0101ec3 <_svfprintf_r+0x1e3>
c0103bce:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c0103bd4:	e9 77 fd ff ff       	jmp    c0103950 <_svfprintf_r+0x1c70>
c0103bd9:	66 90                	xchg   %ax,%ax
c0103bdb:	66 90                	xchg   %ax,%ax
c0103bdd:	66 90                	xchg   %ax,%ax
c0103bdf:	90                   	nop

c0103be0 <quorem>:
c0103be0:	55                   	push   %ebp
c0103be1:	89 c1                	mov    %eax,%ecx
c0103be3:	89 e5                	mov    %esp,%ebp
c0103be5:	57                   	push   %edi
c0103be6:	89 d7                	mov    %edx,%edi
c0103be8:	56                   	push   %esi
c0103be9:	53                   	push   %ebx
c0103bea:	83 ec 3c             	sub    $0x3c,%esp
c0103bed:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0103bf0:	8b 42 10             	mov    0x10(%edx),%eax
c0103bf3:	3b 41 10             	cmp    0x10(%ecx),%eax
c0103bf6:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0103bf9:	89 ca                	mov    %ecx,%edx
c0103bfb:	0f 8f 9f 01 00 00    	jg     c0103da0 <quorem+0x1c0>
c0103c01:	83 e8 01             	sub    $0x1,%eax
c0103c04:	83 c7 14             	add    $0x14,%edi
c0103c07:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103c0a:	c1 e0 02             	shl    $0x2,%eax
c0103c0d:	83 c2 14             	add    $0x14,%edx
c0103c10:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c0103c13:	01 d0                	add    %edx,%eax
c0103c15:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103c18:	8b 13                	mov    (%ebx),%edx
c0103c1a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103c1d:	8b 00                	mov    (%eax),%eax
c0103c1f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0103c22:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103c25:	31 d2                	xor    %edx,%edx
c0103c27:	f7 f1                	div    %ecx
c0103c29:	85 c0                	test   %eax,%eax
c0103c2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103c2e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103c31:	0f 84 b5 00 00 00    	je     c0103cec <quorem+0x10c>
c0103c37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103c3a:	31 f6                	xor    %esi,%esi
c0103c3c:	89 fa                	mov    %edi,%edx
c0103c3e:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0103c41:	89 f7                	mov    %esi,%edi
c0103c43:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103c50:	83 c2 04             	add    $0x4,%edx
c0103c53:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103c56:	83 c0 04             	add    $0x4,%eax
c0103c59:	0f b7 ce             	movzwl %si,%ecx
c0103c5c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c0103c60:	03 4d dc             	add    -0x24(%ebp),%ecx
c0103c63:	c1 ee 10             	shr    $0x10,%esi
c0103c66:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c0103c6a:	89 cb                	mov    %ecx,%ebx
c0103c6c:	0f b7 c9             	movzwl %cx,%ecx
c0103c6f:	c1 eb 10             	shr    $0x10,%ebx
c0103c72:	29 cf                	sub    %ecx,%edi
c0103c74:	01 f3                	add    %esi,%ebx
c0103c76:	89 de                	mov    %ebx,%esi
c0103c78:	0f b7 db             	movzwl %bx,%ebx
c0103c7b:	c1 ee 10             	shr    $0x10,%esi
c0103c7e:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0103c81:	8b 70 fc             	mov    -0x4(%eax),%esi
c0103c84:	0f b7 ce             	movzwl %si,%ecx
c0103c87:	01 f9                	add    %edi,%ecx
c0103c89:	c1 ee 10             	shr    $0x10,%esi
c0103c8c:	29 de                	sub    %ebx,%esi
c0103c8e:	89 cb                	mov    %ecx,%ebx
c0103c90:	c1 fb 10             	sar    $0x10,%ebx
c0103c93:	0f b7 c9             	movzwl %cx,%ecx
c0103c96:	01 de                	add    %ebx,%esi
c0103c98:	89 f7                	mov    %esi,%edi
c0103c9a:	c1 e6 10             	shl    $0x10,%esi
c0103c9d:	09 ce                	or     %ecx,%esi
c0103c9f:	c1 ff 10             	sar    $0x10,%edi
c0103ca2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c0103ca5:	89 70 fc             	mov    %esi,-0x4(%eax)
c0103ca8:	73 a6                	jae    c0103c50 <quorem+0x70>
c0103caa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103cad:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0103cb0:	8b 10                	mov    (%eax),%edx
c0103cb2:	85 d2                	test   %edx,%edx
c0103cb4:	75 36                	jne    c0103cec <quorem+0x10c>
c0103cb6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103cb9:	89 c2                	mov    %eax,%edx
c0103cbb:	83 e8 04             	sub    $0x4,%eax
c0103cbe:	39 c1                	cmp    %eax,%ecx
c0103cc0:	73 21                	jae    c0103ce3 <quorem+0x103>
c0103cc2:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103cc5:	85 f6                	test   %esi,%esi
c0103cc7:	75 1a                	jne    c0103ce3 <quorem+0x103>
c0103cc9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103ccc:	eb 08                	jmp    c0103cd6 <quorem+0xf6>
c0103cce:	66 90                	xchg   %ax,%ax
c0103cd0:	8b 18                	mov    (%eax),%ebx
c0103cd2:	85 db                	test   %ebx,%ebx
c0103cd4:	75 0a                	jne    c0103ce0 <quorem+0x100>
c0103cd6:	83 e8 04             	sub    $0x4,%eax
c0103cd9:	83 ea 01             	sub    $0x1,%edx
c0103cdc:	39 c1                	cmp    %eax,%ecx
c0103cde:	72 f0                	jb     c0103cd0 <quorem+0xf0>
c0103ce0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103ce3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103ce6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103ce9:	89 50 10             	mov    %edx,0x10(%eax)
c0103cec:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0103cef:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cf3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103cf6:	89 04 24             	mov    %eax,(%esp)
c0103cf9:	e8 a2 23 00 00       	call   c01060a0 <__mcmp>
c0103cfe:	85 c0                	test   %eax,%eax
c0103d00:	0f 88 8e 00 00 00    	js     c0103d94 <quorem+0x1b4>
c0103d06:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103d09:	31 f6                	xor    %esi,%esi
c0103d0b:	83 c0 01             	add    $0x1,%eax
c0103d0e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103d11:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103d18:	83 c7 04             	add    $0x4,%edi
c0103d1b:	8b 4f fc             	mov    -0x4(%edi),%ecx
c0103d1e:	83 c0 04             	add    $0x4,%eax
c0103d21:	8b 58 fc             	mov    -0x4(%eax),%ebx
c0103d24:	0f b7 d1             	movzwl %cx,%edx
c0103d27:	29 d6                	sub    %edx,%esi
c0103d29:	0f b7 d3             	movzwl %bx,%edx
c0103d2c:	01 f2                	add    %esi,%edx
c0103d2e:	c1 e9 10             	shr    $0x10,%ecx
c0103d31:	c1 eb 10             	shr    $0x10,%ebx
c0103d34:	29 cb                	sub    %ecx,%ebx
c0103d36:	89 d1                	mov    %edx,%ecx
c0103d38:	c1 f9 10             	sar    $0x10,%ecx
c0103d3b:	0f b7 d2             	movzwl %dx,%edx
c0103d3e:	01 cb                	add    %ecx,%ebx
c0103d40:	89 de                	mov    %ebx,%esi
c0103d42:	c1 e3 10             	shl    $0x10,%ebx
c0103d45:	09 d3                	or     %edx,%ebx
c0103d47:	c1 fe 10             	sar    $0x10,%esi
c0103d4a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c0103d4d:	89 58 fc             	mov    %ebx,-0x4(%eax)
c0103d50:	73 c6                	jae    c0103d18 <quorem+0x138>
c0103d52:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103d55:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103d58:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c0103d5b:	8b 02                	mov    (%edx),%eax
c0103d5d:	85 c0                	test   %eax,%eax
c0103d5f:	75 33                	jne    c0103d94 <quorem+0x1b4>
c0103d61:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103d64:	8d 42 fc             	lea    -0x4(%edx),%eax
c0103d67:	39 c1                	cmp    %eax,%ecx
c0103d69:	73 20                	jae    c0103d8b <quorem+0x1ab>
c0103d6b:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103d6e:	85 f6                	test   %esi,%esi
c0103d70:	75 19                	jne    c0103d8b <quorem+0x1ab>
c0103d72:	89 fa                	mov    %edi,%edx
c0103d74:	eb 08                	jmp    c0103d7e <quorem+0x19e>
c0103d76:	66 90                	xchg   %ax,%ax
c0103d78:	8b 18                	mov    (%eax),%ebx
c0103d7a:	85 db                	test   %ebx,%ebx
c0103d7c:	75 0a                	jne    c0103d88 <quorem+0x1a8>
c0103d7e:	83 e8 04             	sub    $0x4,%eax
c0103d81:	83 ea 01             	sub    $0x1,%edx
c0103d84:	39 c1                	cmp    %eax,%ecx
c0103d86:	72 f0                	jb     c0103d78 <quorem+0x198>
c0103d88:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103d8b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103d8e:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103d91:	89 78 10             	mov    %edi,0x10(%eax)
c0103d94:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103d97:	83 c4 3c             	add    $0x3c,%esp
c0103d9a:	5b                   	pop    %ebx
c0103d9b:	5e                   	pop    %esi
c0103d9c:	5f                   	pop    %edi
c0103d9d:	5d                   	pop    %ebp
c0103d9e:	c3                   	ret    
c0103d9f:	90                   	nop
c0103da0:	83 c4 3c             	add    $0x3c,%esp
c0103da3:	31 c0                	xor    %eax,%eax
c0103da5:	5b                   	pop    %ebx
c0103da6:	5e                   	pop    %esi
c0103da7:	5f                   	pop    %edi
c0103da8:	5d                   	pop    %ebp
c0103da9:	c3                   	ret    
c0103daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0103db0 <_dtoa_r>:
c0103db0:	55                   	push   %ebp
c0103db1:	89 e5                	mov    %esp,%ebp
c0103db3:	57                   	push   %edi
c0103db4:	56                   	push   %esi
c0103db5:	53                   	push   %ebx
c0103db6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c0103dbc:	8b 75 08             	mov    0x8(%ebp),%esi
c0103dbf:	dd 45 0c             	fldl   0xc(%ebp)
c0103dc2:	8b 5d 20             	mov    0x20(%ebp),%ebx
c0103dc5:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103dc8:	8b 46 40             	mov    0x40(%esi),%eax
c0103dcb:	85 c0                	test   %eax,%eax
c0103dcd:	74 23                	je     c0103df2 <_dtoa_r+0x42>
c0103dcf:	8b 4e 44             	mov    0x44(%esi),%ecx
c0103dd2:	ba 01 00 00 00       	mov    $0x1,%edx
c0103dd7:	d3 e2                	shl    %cl,%edx
c0103dd9:	89 48 04             	mov    %ecx,0x4(%eax)
c0103ddc:	89 50 08             	mov    %edx,0x8(%eax)
c0103ddf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103de3:	89 34 24             	mov    %esi,(%esp)
c0103de6:	e8 95 1b 00 00       	call   c0105980 <_Bfree>
c0103deb:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c0103df2:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0103df5:	85 ff                	test   %edi,%edi
c0103df7:	0f 88 3b 02 00 00    	js     c0104038 <_dtoa_r+0x288>
c0103dfd:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0103e03:	89 f8                	mov    %edi,%eax
c0103e05:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c0103e0a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c0103e0f:	0f 84 e3 01 00 00    	je     c0103ff8 <_dtoa_r+0x248>
c0103e15:	dd 45 c0             	fldl   -0x40(%ebp)
c0103e18:	d9 ee                	fldz   
c0103e1a:	d9 c9                	fxch   %st(1)
c0103e1c:	db e9                	fucomi %st(1),%st
c0103e1e:	dd d9                	fstp   %st(1)
c0103e20:	7a 36                	jp     c0103e58 <_dtoa_r+0xa8>
c0103e22:	75 34                	jne    c0103e58 <_dtoa_r+0xa8>
c0103e24:	dd d8                	fstp   %st(0)
c0103e26:	8b 4d 24             	mov    0x24(%ebp),%ecx
c0103e29:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0103e2c:	85 c9                	test   %ecx,%ecx
c0103e2e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0103e34:	0f 84 4e 02 00 00    	je     c0104088 <_dtoa_r+0x2d8>
c0103e3a:	8b 45 24             	mov    0x24(%ebp),%eax
c0103e3d:	c7 00 8a 84 10 c0    	movl   $0xc010848a,(%eax)
c0103e43:	b8 89 84 10 c0       	mov    $0xc0108489,%eax
c0103e48:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103e4e:	5b                   	pop    %ebx
c0103e4f:	5e                   	pop    %esi
c0103e50:	5f                   	pop    %edi
c0103e51:	5d                   	pop    %ebp
c0103e52:	c3                   	ret    
c0103e53:	90                   	nop
c0103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103e58:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0103e5b:	89 fb                	mov    %edi,%ebx
c0103e5d:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103e61:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0103e64:	dd 54 24 04          	fstl   0x4(%esp)
c0103e68:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103e6c:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103e6f:	89 34 24             	mov    %esi,(%esp)
c0103e72:	c1 eb 14             	shr    $0x14,%ebx
c0103e75:	e8 76 25 00 00       	call   c01063f0 <__d2b>
c0103e7a:	85 db                	test   %ebx,%ebx
c0103e7c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103e7f:	0f 85 db 01 00 00    	jne    c0104060 <_dtoa_r+0x2b0>
c0103e85:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103e88:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0103e8b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103e8e:	01 c3                	add    %eax,%ebx
c0103e90:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c0103e96:	0f 8c ec 07 00 00    	jl     c0104688 <_dtoa_r+0x8d8>
c0103e9c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0103e9f:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c0103ea4:	89 f8                	mov    %edi,%eax
c0103ea6:	29 d9                	sub    %ebx,%ecx
c0103ea8:	d3 e0                	shl    %cl,%eax
c0103eaa:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c0103eb0:	d3 ea                	shr    %cl,%edx
c0103eb2:	09 d0                	or     %edx,%eax
c0103eb4:	31 d2                	xor    %edx,%edx
c0103eb6:	83 eb 01             	sub    $0x1,%ebx
c0103eb9:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0103ebc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0103ebf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103ec2:	df 6d c8             	fildll -0x38(%ebp)
c0103ec5:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103ec8:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c0103ecf:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0103ed6:	dd 45 b8             	fldl   -0x48(%ebp)
c0103ed9:	d8 25 08 8d 10 c0    	fsubs  0xc0108d08
c0103edf:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c0103ee2:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103ee5:	dc 0d 20 8d 10 c0    	fmull  0xc0108d20
c0103eeb:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103eef:	b4 0c                	mov    $0xc,%ah
c0103ef1:	dc 05 28 8d 10 c0    	faddl  0xc0108d28
c0103ef7:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103efb:	db 45 d4             	fildl  -0x2c(%ebp)
c0103efe:	dc 0d 30 8d 10 c0    	fmull  0xc0108d30
c0103f04:	de c1                	faddp  %st,%st(1)
c0103f06:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103f09:	db 55 b8             	fistl  -0x48(%ebp)
c0103f0c:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103f0f:	d9 ee                	fldz   
c0103f11:	df e9                	fucomip %st(1),%st
c0103f13:	0f 87 27 07 00 00    	ja     c0104640 <_dtoa_r+0x890>
c0103f19:	dd d8                	fstp   %st(0)
c0103f1b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c0103f1f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c0103f26:	77 24                	ja     c0103f4c <_dtoa_r+0x19c>
c0103f28:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f2b:	dd 04 c5 e0 8d 10 c0 	fldl   -0x3fef7220(,%eax,8)
c0103f32:	dd 45 c0             	fldl   -0x40(%ebp)
c0103f35:	d9 c9                	fxch   %st(1)
c0103f37:	df e9                	fucomip %st(1),%st
c0103f39:	dd d8                	fstp   %st(0)
c0103f3b:	0f 86 5f 07 00 00    	jbe    c01046a0 <_dtoa_r+0x8f0>
c0103f41:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103f45:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0103f4c:	89 d0                	mov    %edx,%eax
c0103f4e:	29 d8                	sub    %ebx,%eax
c0103f50:	83 e8 01             	sub    $0x1,%eax
c0103f53:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c0103f5a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103f5d:	0f 88 0d 07 00 00    	js     c0104670 <_dtoa_r+0x8c0>
c0103f63:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f66:	85 c0                	test   %eax,%eax
c0103f68:	0f 88 ea 06 00 00    	js     c0104658 <_dtoa_r+0x8a8>
c0103f6e:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103f71:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103f74:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0103f7b:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c0103f7f:	0f 87 0b 03 00 00    	ja     c0104290 <_dtoa_r+0x4e0>
c0103f85:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c0103f89:	0f 8e 23 10 00 00    	jle    c0104fb2 <_dtoa_r+0x1202>
c0103f8f:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c0103f93:	31 c0                	xor    %eax,%eax
c0103f95:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c0103f99:	0f 84 43 0d 00 00    	je     c0104ce2 <_dtoa_r+0xf32>
c0103f9f:	0f 8e f3 00 00 00    	jle    c0104098 <_dtoa_r+0x2e8>
c0103fa5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c0103fa9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103fb0:	0f 84 f3 00 00 00    	je     c01040a9 <_dtoa_r+0x2f9>
c0103fb6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c0103fba:	0f 85 d7 02 00 00    	jne    c0104297 <_dtoa_r+0x4e7>
c0103fc0:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103fc3:	03 5d 18             	add    0x18(%ebp),%ebx
c0103fc6:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c0103fc9:	83 c3 01             	add    $0x1,%ebx
c0103fcc:	83 fb 0e             	cmp    $0xe,%ebx
c0103fcf:	0f 96 c2             	setbe  %dl
c0103fd2:	85 db                	test   %ebx,%ebx
c0103fd4:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c0103fd7:	0f 8e a7 08 00 00    	jle    c0104884 <_dtoa_r+0xad4>
c0103fdd:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103fe0:	83 fb 0e             	cmp    $0xe,%ebx
c0103fe3:	89 df                	mov    %ebx,%edi
c0103fe5:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103fe9:	20 45 b4             	and    %al,-0x4c(%ebp)
c0103fec:	e9 d6 00 00 00       	jmp    c01040c7 <_dtoa_r+0x317>
c0103ff1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103ff8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0103ffb:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0103ffe:	85 d2                	test   %edx,%edx
c0104000:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0104006:	b8 01 8d 10 c0       	mov    $0xc0108d01,%eax
c010400b:	74 43                	je     c0104050 <_dtoa_r+0x2a0>
c010400d:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0104010:	85 db                	test   %ebx,%ebx
c0104012:	0f 84 30 fe ff ff    	je     c0103e48 <_dtoa_r+0x98>
c0104018:	8b 75 24             	mov    0x24(%ebp),%esi
c010401b:	8d 50 08             	lea    0x8(%eax),%edx
c010401e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0104022:	8d 48 03             	lea    0x3(%eax),%ecx
c0104025:	0f 44 d1             	cmove  %ecx,%edx
c0104028:	89 16                	mov    %edx,(%esi)
c010402a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0104030:	5b                   	pop    %ebx
c0104031:	5e                   	pop    %esi
c0104032:	5f                   	pop    %edi
c0104033:	5d                   	pop    %ebp
c0104034:	c3                   	ret    
c0104035:	8d 76 00             	lea    0x0(%esi),%esi
c0104038:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c010403e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c0104044:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c0104047:	e9 b7 fd ff ff       	jmp    c0103e03 <_dtoa_r+0x53>
c010404c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104050:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c0104056:	ba f8 8c 10 c0       	mov    $0xc0108cf8,%edx
c010405b:	0f 44 c2             	cmove  %edx,%eax
c010405e:	eb ad                	jmp    c010400d <_dtoa_r+0x25d>
c0104060:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0104063:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c0104069:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010406c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104073:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0104078:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c010407d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104080:	e9 51 fe ff ff       	jmp    c0103ed6 <_dtoa_r+0x126>
c0104085:	8d 76 00             	lea    0x0(%esi),%esi
c0104088:	b8 89 84 10 c0       	mov    $0xc0108489,%eax
c010408d:	e9 b6 fd ff ff       	jmp    c0103e48 <_dtoa_r+0x98>
c0104092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104098:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c010409c:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01040a3:	0f 85 ee 01 00 00    	jne    c0104297 <_dtoa_r+0x4e7>
c01040a9:	8b 55 18             	mov    0x18(%ebp),%edx
c01040ac:	85 d2                	test   %edx,%edx
c01040ae:	0f 8e b6 07 00 00    	jle    c010486a <_dtoa_r+0xaba>
c01040b4:	8b 7d 18             	mov    0x18(%ebp),%edi
c01040b7:	83 ff 0e             	cmp    $0xe,%edi
c01040ba:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c01040be:	20 45 b4             	and    %al,-0x4c(%ebp)
c01040c1:	89 7d 90             	mov    %edi,-0x70(%ebp)
c01040c4:	89 7d a8             	mov    %edi,-0x58(%ebp)
c01040c7:	83 ff 17             	cmp    $0x17,%edi
c01040ca:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01040d1:	0f 86 e5 0e 00 00    	jbe    c0104fbc <_dtoa_r+0x120c>
c01040d7:	b9 01 00 00 00       	mov    $0x1,%ecx
c01040dc:	b8 04 00 00 00       	mov    $0x4,%eax
c01040e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01040e8:	01 c0                	add    %eax,%eax
c01040ea:	89 ca                	mov    %ecx,%edx
c01040ec:	8d 58 14             	lea    0x14(%eax),%ebx
c01040ef:	39 fb                	cmp    %edi,%ebx
c01040f1:	8d 49 01             	lea    0x1(%ecx),%ecx
c01040f4:	76 f2                	jbe    c01040e8 <_dtoa_r+0x338>
c01040f6:	89 56 44             	mov    %edx,0x44(%esi)
c01040f9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01040fd:	89 34 24             	mov    %esi,(%esp)
c0104100:	e8 db 17 00 00       	call   c01058e0 <_Balloc>
c0104105:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0104109:	89 c7                	mov    %eax,%edi
c010410b:	89 46 40             	mov    %eax,0x40(%esi)
c010410e:	0f 84 bb 01 00 00    	je     c01042cf <_dtoa_r+0x51f>
c0104114:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0104117:	dd 45 c0             	fldl   -0x40(%ebp)
c010411a:	85 db                	test   %ebx,%ebx
c010411c:	0f 8e de 07 00 00    	jle    c0104900 <_dtoa_r+0xb50>
c0104122:	89 d8                	mov    %ebx,%eax
c0104124:	83 e0 0f             	and    $0xf,%eax
c0104127:	dd 04 c5 e0 8d 10 c0 	fldl   -0x3fef7220(,%eax,8)
c010412e:	89 d8                	mov    %ebx,%eax
c0104130:	c1 f8 04             	sar    $0x4,%eax
c0104133:	a8 10                	test   $0x10,%al
c0104135:	0f 84 cd 05 00 00    	je     c0104708 <_dtoa_r+0x958>
c010413b:	dd 05 c0 8d 10 c0    	fldl   0xc0108dc0
c0104141:	83 e0 0f             	and    $0xf,%eax
c0104144:	b9 03 00 00 00       	mov    $0x3,%ecx
c0104149:	d8 fa                	fdivr  %st(2),%st
c010414b:	85 c0                	test   %eax,%eax
c010414d:	74 22                	je     c0104171 <_dtoa_r+0x3c1>
c010414f:	31 d2                	xor    %edx,%edx
c0104151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104158:	a8 01                	test   $0x1,%al
c010415a:	74 0e                	je     c010416a <_dtoa_r+0x3ba>
c010415c:	d9 c9                	fxch   %st(1)
c010415e:	dc 0c d5 a0 8d 10 c0 	fmull  -0x3fef7260(,%edx,8)
c0104165:	d9 c9                	fxch   %st(1)
c0104167:	83 c1 01             	add    $0x1,%ecx
c010416a:	83 c2 01             	add    $0x1,%edx
c010416d:	d1 f8                	sar    %eax
c010416f:	75 e7                	jne    c0104158 <_dtoa_r+0x3a8>
c0104171:	de f1                	fdivp  %st,%st(1)
c0104173:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0104176:	85 c0                	test   %eax,%eax
c0104178:	74 0a                	je     c0104184 <_dtoa_r+0x3d4>
c010417a:	d9 e8                	fld1   
c010417c:	df e9                	fucomip %st(1),%st
c010417e:	0f 87 92 0b 00 00    	ja     c0104d16 <_dtoa_r+0xf66>
c0104184:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104187:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010418a:	db 45 d4             	fildl  -0x2c(%ebp)
c010418d:	d8 c9                	fmul   %st(1),%st
c010418f:	d8 05 14 8d 10 c0    	fadds  0xc0108d14
c0104195:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104198:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010419f:	85 c0                	test   %eax,%eax
c01041a1:	0f 84 89 05 00 00    	je     c0104730 <_dtoa_r+0x980>
c01041a7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01041aa:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01041ad:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01041b0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01041b3:	85 c0                	test   %eax,%eax
c01041b5:	0f 84 b5 07 00 00    	je     c0104970 <_dtoa_r+0xbc0>
c01041bb:	d9 05 1c 8d 10 c0    	flds   0xc0108d1c
c01041c1:	8d 57 01             	lea    0x1(%edi),%edx
c01041c4:	dc 34 cd d8 8d 10 c0 	fdivl  -0x3fef7228(,%ecx,8)
c01041cb:	d9 7d d2             	fnstcw -0x2e(%ebp)
c01041ce:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01041d2:	b4 0c                	mov    $0xc,%ah
c01041d4:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c01041d8:	dc 65 c0             	fsubl  -0x40(%ebp)
c01041db:	d9 c9                	fxch   %st(1)
c01041dd:	d9 6d d0             	fldcw  -0x30(%ebp)
c01041e0:	db 55 d4             	fistl  -0x2c(%ebp)
c01041e3:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01041e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01041e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01041ec:	83 c0 30             	add    $0x30,%eax
c01041ef:	db 45 d4             	fildl  -0x2c(%ebp)
c01041f2:	de e9                	fsubrp %st,%st(1)
c01041f4:	d9 c9                	fxch   %st(1)
c01041f6:	88 07                	mov    %al,(%edi)
c01041f8:	db e9                	fucomi %st(1),%st
c01041fa:	77 7f                	ja     c010427b <_dtoa_r+0x4cb>
c01041fc:	d9 c1                	fld    %st(1)
c01041fe:	d8 2d 0c 8d 10 c0    	fsubrs 0xc0108d0c
c0104204:	d9 c9                	fxch   %st(1)
c0104206:	db e9                	fucomi %st(1),%st
c0104208:	dd d9                	fstp   %st(1)
c010420a:	0f 87 33 0c 00 00    	ja     c0104e43 <_dtoa_r+0x1093>
c0104210:	83 f9 01             	cmp    $0x1,%ecx
c0104213:	0f 8e c4 06 00 00    	jle    c01048dd <_dtoa_r+0xb2d>
c0104219:	01 f9                	add    %edi,%ecx
c010421b:	d9 05 10 8d 10 c0    	flds   0xc0108d10
c0104221:	eb 25                	jmp    c0104248 <_dtoa_r+0x498>
c0104223:	90                   	nop
c0104224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104228:	d9 c1                	fld    %st(1)
c010422a:	d8 2d 0c 8d 10 c0    	fsubrs 0xc0108d0c
c0104230:	d9 c9                	fxch   %st(1)
c0104232:	db e9                	fucomi %st(1),%st
c0104234:	dd d9                	fstp   %st(1)
c0104236:	0f 87 14 0c 00 00    	ja     c0104e50 <_dtoa_r+0x10a0>
c010423c:	39 ca                	cmp    %ecx,%edx
c010423e:	0f 84 a4 06 00 00    	je     c01048e8 <_dtoa_r+0xb38>
c0104244:	d9 c9                	fxch   %st(1)
c0104246:	d9 ca                	fxch   %st(2)
c0104248:	dc c9                	fmul   %st,%st(1)
c010424a:	83 c2 01             	add    $0x1,%edx
c010424d:	dc ca                	fmul   %st,%st(2)
c010424f:	d9 ca                	fxch   %st(2)
c0104251:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104254:	db 55 d4             	fistl  -0x2c(%ebp)
c0104257:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010425a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010425d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104260:	83 c0 30             	add    $0x30,%eax
c0104263:	db 45 d4             	fildl  -0x2c(%ebp)
c0104266:	de e9                	fsubrp %st,%st(1)
c0104268:	d9 c9                	fxch   %st(1)
c010426a:	88 42 ff             	mov    %al,-0x1(%edx)
c010426d:	db e9                	fucomi %st(1),%st
c010426f:	76 b7                	jbe    c0104228 <_dtoa_r+0x478>
c0104271:	dd d8                	fstp   %st(0)
c0104273:	dd d8                	fstp   %st(0)
c0104275:	dd d8                	fstp   %st(0)
c0104277:	dd d8                	fstp   %st(0)
c0104279:	eb 06                	jmp    c0104281 <_dtoa_r+0x4d1>
c010427b:	dd d8                	fstp   %st(0)
c010427d:	dd d8                	fstp   %st(0)
c010427f:	dd d8                	fstp   %st(0)
c0104281:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104284:	89 fb                	mov    %edi,%ebx
c0104286:	89 d7                	mov    %edx,%edi
c0104288:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010428b:	e9 70 03 00 00       	jmp    c0104600 <_dtoa_r+0x850>
c0104290:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c0104297:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c010429e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01042a5:	00 
c01042a6:	89 34 24             	mov    %esi,(%esp)
c01042a9:	e8 32 16 00 00       	call   c01058e0 <_Balloc>
c01042ae:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c01042b5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c01042bc:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c01042c3:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c01042ca:	89 c7                	mov    %eax,%edi
c01042cc:	89 46 40             	mov    %eax,0x40(%esi)
c01042cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01042d2:	85 c0                	test   %eax,%eax
c01042d4:	0f 88 2e 01 00 00    	js     c0104408 <_dtoa_r+0x658>
c01042da:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c01042de:	0f 8f 24 01 00 00    	jg     c0104408 <_dtoa_r+0x658>
c01042e4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01042e7:	dd 04 c5 e0 8d 10 c0 	fldl   -0x3fef7220(,%eax,8)
c01042ee:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01042f1:	85 c0                	test   %eax,%eax
c01042f3:	7f 0e                	jg     c0104303 <_dtoa_r+0x553>
c01042f5:	8b 45 18             	mov    0x18(%ebp),%eax
c01042f8:	c1 e8 1f             	shr    $0x1f,%eax
c01042fb:	84 c0                	test   %al,%al
c01042fd:	0f 85 9d 07 00 00    	jne    c0104aa0 <_dtoa_r+0xcf0>
c0104303:	dd 45 c0             	fldl   -0x40(%ebp)
c0104306:	d9 c0                	fld    %st(0)
c0104308:	d8 f2                	fdiv   %st(2),%st
c010430a:	d9 7d d2             	fnstcw -0x2e(%ebp)
c010430d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0104311:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0104315:	b4 0c                	mov    $0xc,%ah
c0104317:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010431b:	8d 47 01             	lea    0x1(%edi),%eax
c010431e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104321:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104324:	db 5d d4             	fistpl -0x2c(%ebp)
c0104327:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010432a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010432d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0104330:	8d 42 30             	lea    0x30(%edx),%eax
c0104333:	db 45 d4             	fildl  -0x2c(%ebp)
c0104336:	d8 ca                	fmul   %st(2),%st
c0104338:	88 07                	mov    %al,(%edi)
c010433a:	de e9                	fsubrp %st,%st(1)
c010433c:	74 66                	je     c01043a4 <_dtoa_r+0x5f4>
c010433e:	d8 0d 10 8d 10 c0    	fmuls  0xc0108d10
c0104344:	d9 ee                	fldz   
c0104346:	d9 c9                	fxch   %st(1)
c0104348:	db e9                	fucomi %st(1),%st
c010434a:	dd d9                	fstp   %st(1)
c010434c:	0f 8b 33 0c 00 00    	jnp    c0104f85 <_dtoa_r+0x11d5>
c0104352:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104355:	8d 47 02             	lea    0x2(%edi),%eax
c0104358:	d9 05 10 8d 10 c0    	flds   0xc0108d10
c010435e:	01 fb                	add    %edi,%ebx
c0104360:	eb 19                	jmp    c010437b <_dtoa_r+0x5cb>
c0104362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104368:	dc c9                	fmul   %st,%st(1)
c010436a:	83 c0 01             	add    $0x1,%eax
c010436d:	d9 ee                	fldz   
c010436f:	d9 ca                	fxch   %st(2)
c0104371:	db ea                	fucomi %st(2),%st
c0104373:	dd da                	fstp   %st(2)
c0104375:	0f 8b 73 09 00 00    	jnp    c0104cee <_dtoa_r+0xf3e>
c010437b:	d9 c1                	fld    %st(1)
c010437d:	39 d8                	cmp    %ebx,%eax
c010437f:	d8 f3                	fdiv   %st(3),%st
c0104381:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104384:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104387:	db 5d d4             	fistpl -0x2c(%ebp)
c010438a:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010438d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0104390:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0104393:	8d 4a 30             	lea    0x30(%edx),%ecx
c0104396:	db 45 d4             	fildl  -0x2c(%ebp)
c0104399:	d8 cb                	fmul   %st(3),%st
c010439b:	88 48 ff             	mov    %cl,-0x1(%eax)
c010439e:	de ea                	fsubrp %st,%st(2)
c01043a0:	75 c6                	jne    c0104368 <_dtoa_r+0x5b8>
c01043a2:	dd d8                	fstp   %st(0)
c01043a4:	d8 c0                	fadd   %st(0),%st
c01043a6:	db e9                	fucomi %st(1),%st
c01043a8:	77 1e                	ja     c01043c8 <_dtoa_r+0x618>
c01043aa:	d9 c9                	fxch   %st(1)
c01043ac:	df e9                	fucomip %st(1),%st
c01043ae:	dd d8                	fstp   %st(0)
c01043b0:	0f 8a 44 09 00 00    	jp     c0104cfa <_dtoa_r+0xf4a>
c01043b6:	0f 85 3e 09 00 00    	jne    c0104cfa <_dtoa_r+0xf4a>
c01043bc:	83 e2 01             	and    $0x1,%edx
c01043bf:	90                   	nop
c01043c0:	0f 84 34 09 00 00    	je     c0104cfa <_dtoa_r+0xf4a>
c01043c6:	eb 04                	jmp    c01043cc <_dtoa_r+0x61c>
c01043c8:	dd d8                	fstp   %st(0)
c01043ca:	dd d8                	fstp   %st(0)
c01043cc:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c01043cf:	89 fb                	mov    %edi,%ebx
c01043d1:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c01043d5:	89 cf                	mov    %ecx,%edi
c01043d7:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c01043da:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c01043dd:	eb 0f                	jmp    c01043ee <_dtoa_r+0x63e>
c01043df:	90                   	nop
c01043e0:	39 d3                	cmp    %edx,%ebx
c01043e2:	0f 84 75 09 00 00    	je     c0104d5d <_dtoa_r+0xfad>
c01043e8:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c01043ec:	89 d7                	mov    %edx,%edi
c01043ee:	3c 39                	cmp    $0x39,%al
c01043f0:	8d 57 ff             	lea    -0x1(%edi),%edx
c01043f3:	74 eb                	je     c01043e0 <_dtoa_r+0x630>
c01043f5:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c01043f8:	83 c0 01             	add    $0x1,%eax
c01043fb:	88 02                	mov    %al,(%edx)
c01043fd:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0104400:	e9 fb 01 00 00       	jmp    c0104600 <_dtoa_r+0x850>
c0104405:	8d 76 00             	lea    0x0(%esi),%esi
c0104408:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010440b:	85 c9                	test   %ecx,%ecx
c010440d:	0f 85 9d 02 00 00    	jne    c01046b0 <_dtoa_r+0x900>
c0104413:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104416:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104419:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104420:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104423:	85 c0                	test   %eax,%eax
c0104425:	7e 14                	jle    c010443b <_dtoa_r+0x68b>
c0104427:	85 db                	test   %ebx,%ebx
c0104429:	7e 10                	jle    c010443b <_dtoa_r+0x68b>
c010442b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010442e:	39 d8                	cmp    %ebx,%eax
c0104430:	0f 4f c3             	cmovg  %ebx,%eax
c0104433:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0104436:	29 c3                	sub    %eax,%ebx
c0104438:	29 45 ac             	sub    %eax,-0x54(%ebp)
c010443b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010443e:	85 c0                	test   %eax,%eax
c0104440:	7e 61                	jle    c01044a3 <_dtoa_r+0x6f3>
c0104442:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104445:	85 c0                	test   %eax,%eax
c0104447:	0f 84 72 04 00 00    	je     c01048bf <_dtoa_r+0xb0f>
c010444d:	85 d2                	test   %edx,%edx
c010444f:	7e 47                	jle    c0104498 <_dtoa_r+0x6e8>
c0104451:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104454:	89 54 24 08          	mov    %edx,0x8(%esp)
c0104458:	89 34 24             	mov    %esi,(%esp)
c010445b:	89 55 88             	mov    %edx,-0x78(%ebp)
c010445e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104462:	e8 f9 19 00 00       	call   c0105e60 <__pow5mult>
c0104467:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c010446a:	89 34 24             	mov    %esi,(%esp)
c010446d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104471:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104475:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104478:	e8 13 18 00 00       	call   c0105c90 <__multiply>
c010447d:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0104480:	89 34 24             	mov    %esi,(%esp)
c0104483:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104487:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010448a:	e8 f1 14 00 00       	call   c0105980 <_Bfree>
c010448f:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0104492:	8b 55 88             	mov    -0x78(%ebp),%edx
c0104495:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104498:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010449b:	29 d0                	sub    %edx,%eax
c010449d:	0f 85 1f 04 00 00    	jne    c01048c2 <_dtoa_r+0xb12>
c01044a3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01044aa:	00 
c01044ab:	89 34 24             	mov    %esi,(%esp)
c01044ae:	e8 ad 17 00 00       	call   c0105c60 <__i2b>
c01044b3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c01044b6:	85 c9                	test   %ecx,%ecx
c01044b8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01044bb:	7e 13                	jle    c01044d0 <_dtoa_r+0x720>
c01044bd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01044c1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01044c5:	89 34 24             	mov    %esi,(%esp)
c01044c8:	e8 93 19 00 00       	call   c0105e60 <__pow5mult>
c01044cd:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01044d0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c01044d4:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01044db:	0f 8e f7 05 00 00    	jle    c0104ad8 <_dtoa_r+0xd28>
c01044e1:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01044e4:	ba 01 00 00 00       	mov    $0x1,%edx
c01044e9:	85 c0                	test   %eax,%eax
c01044eb:	0f 85 27 05 00 00    	jne    c0104a18 <_dtoa_r+0xc68>
c01044f1:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01044f4:	01 d0                	add    %edx,%eax
c01044f6:	83 e0 1f             	and    $0x1f,%eax
c01044f9:	89 c2                	mov    %eax,%edx
c01044fb:	0f 84 57 03 00 00    	je     c0104858 <_dtoa_r+0xaa8>
c0104501:	b8 20 00 00 00       	mov    $0x20,%eax
c0104506:	29 d0                	sub    %edx,%eax
c0104508:	83 f8 04             	cmp    $0x4,%eax
c010450b:	0f 8e 8c 0a 00 00    	jle    c0104f9d <_dtoa_r+0x11ed>
c0104511:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0104516:	29 d0                	sub    %edx,%eax
c0104518:	01 45 a0             	add    %eax,-0x60(%ebp)
c010451b:	01 c3                	add    %eax,%ebx
c010451d:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104520:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0104523:	85 c0                	test   %eax,%eax
c0104525:	7e 16                	jle    c010453d <_dtoa_r+0x78d>
c0104527:	89 44 24 08          	mov    %eax,0x8(%esp)
c010452b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010452e:	89 34 24             	mov    %esi,(%esp)
c0104531:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104535:	e8 46 1a 00 00       	call   c0105f80 <__lshift>
c010453a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010453d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104540:	85 c0                	test   %eax,%eax
c0104542:	7e 16                	jle    c010455a <_dtoa_r+0x7aa>
c0104544:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104548:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010454b:	89 34 24             	mov    %esi,(%esp)
c010454e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104552:	e8 29 1a 00 00       	call   c0105f80 <__lshift>
c0104557:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010455a:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010455d:	85 c0                	test   %eax,%eax
c010455f:	0f 85 d3 04 00 00    	jne    c0104a38 <_dtoa_r+0xc88>
c0104565:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104569:	0f 8e 11 02 00 00    	jle    c0104780 <_dtoa_r+0x9d0>
c010456f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104572:	85 c0                	test   %eax,%eax
c0104574:	0f 8f 06 02 00 00    	jg     c0104780 <_dtoa_r+0x9d0>
c010457a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010457d:	85 c0                	test   %eax,%eax
c010457f:	0f 85 e0 01 00 00    	jne    c0104765 <_dtoa_r+0x9b5>
c0104585:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104588:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010458f:	00 
c0104590:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c0104597:	00 
c0104598:	89 34 24             	mov    %esi,(%esp)
c010459b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010459f:	e8 fc 13 00 00       	call   c01059a0 <__multadd>
c01045a4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01045a7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045ab:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01045ae:	89 04 24             	mov    %eax,(%esp)
c01045b1:	e8 ea 1a 00 00       	call   c01060a0 <__mcmp>
c01045b6:	85 c0                	test   %eax,%eax
c01045b8:	0f 8e a7 01 00 00    	jle    c0104765 <_dtoa_r+0x9b5>
c01045be:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c01045c2:	89 fb                	mov    %edi,%ebx
c01045c4:	83 c7 01             	add    $0x1,%edi
c01045c7:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c01045cb:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01045d2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01045d5:	89 34 24             	mov    %esi,(%esp)
c01045d8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045dc:	e8 9f 13 00 00       	call   c0105980 <_Bfree>
c01045e1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01045e4:	85 c0                	test   %eax,%eax
c01045e6:	74 18                	je     c0104600 <_dtoa_r+0x850>
c01045e8:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c01045eb:	0f 85 a7 02 00 00    	jne    c0104898 <_dtoa_r+0xae8>
c01045f1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01045f4:	89 34 24             	mov    %esi,(%esp)
c01045f7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045fb:	e8 80 13 00 00       	call   c0105980 <_Bfree>
c0104600:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104603:	89 34 24             	mov    %esi,(%esp)
c0104606:	89 44 24 04          	mov    %eax,0x4(%esp)
c010460a:	e8 71 13 00 00       	call   c0105980 <_Bfree>
c010460f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104612:	8b 75 1c             	mov    0x1c(%ebp),%esi
c0104615:	c6 07 00             	movb   $0x0,(%edi)
c0104618:	83 c0 01             	add    $0x1,%eax
c010461b:	89 06                	mov    %eax,(%esi)
c010461d:	8b 45 24             	mov    0x24(%ebp),%eax
c0104620:	85 c0                	test   %eax,%eax
c0104622:	0f 84 90 02 00 00    	je     c01048b8 <_dtoa_r+0xb08>
c0104628:	8b 45 24             	mov    0x24(%ebp),%eax
c010462b:	89 38                	mov    %edi,(%eax)
c010462d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0104633:	89 d8                	mov    %ebx,%eax
c0104635:	5b                   	pop    %ebx
c0104636:	5e                   	pop    %esi
c0104637:	5f                   	pop    %edi
c0104638:	5d                   	pop    %ebp
c0104639:	c3                   	ret    
c010463a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104640:	db 45 b8             	fildl  -0x48(%ebp)
c0104643:	df e9                	fucomip %st(1),%st
c0104645:	dd d8                	fstp   %st(0)
c0104647:	7a 06                	jp     c010464f <_dtoa_r+0x89f>
c0104649:	0f 84 cc f8 ff ff    	je     c0103f1b <_dtoa_r+0x16b>
c010464f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104653:	e9 c3 f8 ff ff       	jmp    c0103f1b <_dtoa_r+0x16b>
c0104658:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010465b:	29 45 a0             	sub    %eax,-0x60(%ebp)
c010465e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0104665:	f7 d8                	neg    %eax
c0104667:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010466a:	e9 0c f9 ff ff       	jmp    c0103f7b <_dtoa_r+0x1cb>
c010466f:	90                   	nop
c0104670:	f7 d8                	neg    %eax
c0104672:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104675:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c010467c:	e9 e2 f8 ff ff       	jmp    c0103f63 <_dtoa_r+0x1b3>
c0104681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104688:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010468b:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c0104690:	29 d9                	sub    %ebx,%ecx
c0104692:	d3 e0                	shl    %cl,%eax
c0104694:	e9 1b f8 ff ff       	jmp    c0103eb4 <_dtoa_r+0x104>
c0104699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01046a0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c01046a7:	e9 a0 f8 ff ff       	jmp    c0103f4c <_dtoa_r+0x19c>
c01046ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01046b0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c01046b4:	0f 8e fe 06 00 00    	jle    c0104db8 <_dtoa_r+0x1008>
c01046ba:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01046bd:	83 e8 01             	sub    $0x1,%eax
c01046c0:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01046c3:	0f 8c 3b 06 00 00    	jl     c0104d04 <_dtoa_r+0xf54>
c01046c9:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01046cc:	29 c2                	sub    %eax,%edx
c01046ce:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01046d1:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01046d4:	85 c9                	test   %ecx,%ecx
c01046d6:	89 c8                	mov    %ecx,%eax
c01046d8:	0f 88 83 07 00 00    	js     c0104e61 <_dtoa_r+0x10b1>
c01046de:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01046e5:	00 
c01046e6:	89 34 24             	mov    %esi,(%esp)
c01046e9:	89 55 8c             	mov    %edx,-0x74(%ebp)
c01046ec:	01 45 a0             	add    %eax,-0x60(%ebp)
c01046ef:	01 45 ac             	add    %eax,-0x54(%ebp)
c01046f2:	e8 69 15 00 00       	call   c0105c60 <__i2b>
c01046f7:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01046fa:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01046fd:	e9 1e fd ff ff       	jmp    c0104420 <_dtoa_r+0x670>
c0104702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104708:	d9 c1                	fld    %st(1)
c010470a:	b9 02 00 00 00       	mov    $0x2,%ecx
c010470f:	e9 37 fa ff ff       	jmp    c010414b <_dtoa_r+0x39b>
c0104714:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104717:	db 45 d4             	fildl  -0x2c(%ebp)
c010471a:	d8 c9                	fmul   %st(1),%st
c010471c:	d8 05 14 8d 10 c0    	fadds  0xc0108d14
c0104722:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104725:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010472c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104730:	d8 25 18 8d 10 c0    	fsubs  0xc0108d18
c0104736:	dd 45 c0             	fldl   -0x40(%ebp)
c0104739:	d9 c9                	fxch   %st(1)
c010473b:	db e9                	fucomi %st(1),%st
c010473d:	0f 87 0d 02 00 00    	ja     c0104950 <_dtoa_r+0xba0>
c0104743:	d9 c9                	fxch   %st(1)
c0104745:	d9 e0                	fchs   
c0104747:	df e9                	fucomip %st(1),%st
c0104749:	dd d8                	fstp   %st(0)
c010474b:	0f 86 a7 01 00 00    	jbe    c01048f8 <_dtoa_r+0xb48>
c0104751:	dd d8                	fstp   %st(0)
c0104753:	eb 02                	jmp    c0104757 <_dtoa_r+0x9a7>
c0104755:	dd d8                	fstp   %st(0)
c0104757:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010475e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104765:	8b 45 18             	mov    0x18(%ebp),%eax
c0104768:	89 fb                	mov    %edi,%ebx
c010476a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0104771:	f7 d0                	not    %eax
c0104773:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104776:	e9 57 fe ff ff       	jmp    c01045d2 <_dtoa_r+0x822>
c010477b:	90                   	nop
c010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104780:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104783:	85 c0                	test   %eax,%eax
c0104785:	0f 85 c5 03 00 00    	jne    c0104b50 <_dtoa_r+0xda0>
c010478b:	89 75 08             	mov    %esi,0x8(%ebp)
c010478e:	bb 01 00 00 00       	mov    $0x1,%ebx
c0104793:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c0104796:	eb 24                	jmp    c01047bc <_dtoa_r+0xa0c>
c0104798:	8b 45 08             	mov    0x8(%ebp),%eax
c010479b:	83 c3 01             	add    $0x1,%ebx
c010479e:	89 74 24 04          	mov    %esi,0x4(%esp)
c01047a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01047a9:	00 
c01047aa:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01047b1:	00 
c01047b2:	89 04 24             	mov    %eax,(%esp)
c01047b5:	e8 e6 11 00 00       	call   c01059a0 <__multadd>
c01047ba:	89 c6                	mov    %eax,%esi
c01047bc:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01047bf:	89 f0                	mov    %esi,%eax
c01047c1:	e8 1a f4 ff ff       	call   c0103be0 <quorem>
c01047c6:	83 c0 30             	add    $0x30,%eax
c01047c9:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c01047cc:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c01047d0:	7c c6                	jl     c0104798 <_dtoa_r+0x9e8>
c01047d2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01047d5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01047d8:	ba 01 00 00 00       	mov    $0x1,%edx
c01047dd:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c01047e0:	8b 75 08             	mov    0x8(%ebp),%esi
c01047e3:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01047ea:	85 c0                	test   %eax,%eax
c01047ec:	0f 4f d0             	cmovg  %eax,%edx
c01047ef:	01 fa                	add    %edi,%edx
c01047f1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01047f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01047fb:	00 
c01047fc:	89 34 24             	mov    %esi,(%esp)
c01047ff:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0104802:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104806:	e8 75 17 00 00       	call   c0105f80 <__lshift>
c010480b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c010480e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104812:	89 04 24             	mov    %eax,(%esp)
c0104815:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104818:	e8 83 18 00 00       	call   c01060a0 <__mcmp>
c010481d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0104820:	83 f8 00             	cmp    $0x0,%eax
c0104823:	0f 8e 41 06 00 00    	jle    c0104e6a <_dtoa_r+0x10ba>
c0104829:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c010482d:	eb 0f                	jmp    c010483e <_dtoa_r+0xa8e>
c010482f:	90                   	nop
c0104830:	39 c7                	cmp    %eax,%edi
c0104832:	0f 84 70 05 00 00    	je     c0104da8 <_dtoa_r+0xff8>
c0104838:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c010483c:	89 c2                	mov    %eax,%edx
c010483e:	80 f9 39             	cmp    $0x39,%cl
c0104841:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104844:	74 ea                	je     c0104830 <_dtoa_r+0xa80>
c0104846:	83 c1 01             	add    $0x1,%ecx
c0104849:	89 fb                	mov    %edi,%ebx
c010484b:	88 08                	mov    %cl,(%eax)
c010484d:	89 d7                	mov    %edx,%edi
c010484f:	e9 7e fd ff ff       	jmp    c01045d2 <_dtoa_r+0x822>
c0104854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104858:	b8 1c 00 00 00       	mov    $0x1c,%eax
c010485d:	01 45 a0             	add    %eax,-0x60(%ebp)
c0104860:	01 c3                	add    %eax,%ebx
c0104862:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104865:	e9 b6 fc ff ff       	jmp    c0104520 <_dtoa_r+0x770>
c010486a:	ba 01 00 00 00       	mov    $0x1,%edx
c010486f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c0104876:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c010487d:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c0104884:	21 c2                	and    %eax,%edx
c0104886:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c0104889:	31 d2                	xor    %edx,%edx
c010488b:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0104892:	e9 62 f8 ff ff       	jmp    c01040f9 <_dtoa_r+0x349>
c0104897:	90                   	nop
c0104898:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010489b:	85 d2                	test   %edx,%edx
c010489d:	0f 84 4e fd ff ff    	je     c01045f1 <_dtoa_r+0x841>
c01048a3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01048a6:	89 34 24             	mov    %esi,(%esp)
c01048a9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01048ad:	e8 ce 10 00 00       	call   c0105980 <_Bfree>
c01048b2:	e9 3a fd ff ff       	jmp    c01045f1 <_dtoa_r+0x841>
c01048b7:	90                   	nop
c01048b8:	89 d8                	mov    %ebx,%eax
c01048ba:	e9 89 f5 ff ff       	jmp    c0103e48 <_dtoa_r+0x98>
c01048bf:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01048c2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01048c6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01048c9:	89 34 24             	mov    %esi,(%esp)
c01048cc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01048d0:	e8 8b 15 00 00       	call   c0105e60 <__pow5mult>
c01048d5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01048d8:	e9 c6 fb ff ff       	jmp    c01044a3 <_dtoa_r+0x6f3>
c01048dd:	dd d8                	fstp   %st(0)
c01048df:	dd d8                	fstp   %st(0)
c01048e1:	eb 15                	jmp    c01048f8 <_dtoa_r+0xb48>
c01048e3:	90                   	nop
c01048e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01048e8:	dd d8                	fstp   %st(0)
c01048ea:	dd d8                	fstp   %st(0)
c01048ec:	dd d8                	fstp   %st(0)
c01048ee:	eb 08                	jmp    c01048f8 <_dtoa_r+0xb48>
c01048f0:	dd d8                	fstp   %st(0)
c01048f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01048f8:	dd 5d c0             	fstpl  -0x40(%ebp)
c01048fb:	e9 cf f9 ff ff       	jmp    c01042cf <_dtoa_r+0x51f>
c0104900:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104903:	f7 d8                	neg    %eax
c0104905:	0f 84 6a 04 00 00    	je     c0104d75 <_dtoa_r+0xfc5>
c010490b:	89 c2                	mov    %eax,%edx
c010490d:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104912:	83 e2 0f             	and    $0xf,%edx
c0104915:	c1 f8 04             	sar    $0x4,%eax
c0104918:	dd 04 d5 e0 8d 10 c0 	fldl   -0x3fef7220(,%edx,8)
c010491f:	85 c0                	test   %eax,%eax
c0104921:	d8 c9                	fmul   %st(1),%st
c0104923:	0f 84 4a f8 ff ff    	je     c0104173 <_dtoa_r+0x3c3>
c0104929:	31 d2                	xor    %edx,%edx
c010492b:	90                   	nop
c010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104930:	a8 01                	test   $0x1,%al
c0104932:	74 0a                	je     c010493e <_dtoa_r+0xb8e>
c0104934:	dc 0c d5 a0 8d 10 c0 	fmull  -0x3fef7260(,%edx,8)
c010493b:	83 c1 01             	add    $0x1,%ecx
c010493e:	83 c2 01             	add    $0x1,%edx
c0104941:	d1 f8                	sar    %eax
c0104943:	75 eb                	jne    c0104930 <_dtoa_r+0xb80>
c0104945:	e9 29 f8 ff ff       	jmp    c0104173 <_dtoa_r+0x3c3>
c010494a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104950:	dd d8                	fstp   %st(0)
c0104952:	dd d8                	fstp   %st(0)
c0104954:	dd d8                	fstp   %st(0)
c0104956:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010495d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104964:	e9 55 fc ff ff       	jmp    c01045be <_dtoa_r+0x80e>
c0104969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104970:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0104973:	8d 41 ff             	lea    -0x1(%ecx),%eax
c0104976:	dd 45 c0             	fldl   -0x40(%ebp)
c0104979:	dc 0c c5 e0 8d 10 c0 	fmull  -0x3fef7220(,%eax,8)
c0104980:	d9 c9                	fxch   %st(1)
c0104982:	89 45 88             	mov    %eax,-0x78(%ebp)
c0104985:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0104989:	8d 57 01             	lea    0x1(%edi),%edx
c010498c:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c010498f:	b4 0c                	mov    $0xc,%ah
c0104991:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0104995:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104998:	db 55 d4             	fistl  -0x2c(%ebp)
c010499b:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010499e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01049a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01049a4:	83 c0 30             	add    $0x30,%eax
c01049a7:	83 f9 01             	cmp    $0x1,%ecx
c01049aa:	db 45 d4             	fildl  -0x2c(%ebp)
c01049ad:	de e9                	fsubrp %st,%st(1)
c01049af:	88 07                	mov    %al,(%edi)
c01049b1:	89 d0                	mov    %edx,%eax
c01049b3:	74 37                	je     c01049ec <_dtoa_r+0xc3c>
c01049b5:	d9 05 10 8d 10 c0    	flds   0xc0108d10
c01049bb:	eb 05                	jmp    c01049c2 <_dtoa_r+0xc12>
c01049bd:	8d 76 00             	lea    0x0(%esi),%esi
c01049c0:	d9 c9                	fxch   %st(1)
c01049c2:	dc c9                	fmul   %st,%st(1)
c01049c4:	d9 c9                	fxch   %st(1)
c01049c6:	83 c0 01             	add    $0x1,%eax
c01049c9:	d9 6d d0             	fldcw  -0x30(%ebp)
c01049cc:	db 55 d4             	fistl  -0x2c(%ebp)
c01049cf:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01049d2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c01049d5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01049d8:	83 c1 30             	add    $0x30,%ecx
c01049db:	39 d8                	cmp    %ebx,%eax
c01049dd:	db 45 d4             	fildl  -0x2c(%ebp)
c01049e0:	de e9                	fsubrp %st,%st(1)
c01049e2:	88 48 ff             	mov    %cl,-0x1(%eax)
c01049e5:	75 d9                	jne    c01049c0 <_dtoa_r+0xc10>
c01049e7:	dd d9                	fstp   %st(1)
c01049e9:	03 55 88             	add    -0x78(%ebp),%edx
c01049ec:	d9 05 1c 8d 10 c0    	flds   0xc0108d1c
c01049f2:	d9 c2                	fld    %st(2)
c01049f4:	d8 c1                	fadd   %st(1),%st
c01049f6:	d9 ca                	fxch   %st(2)
c01049f8:	db ea                	fucomi %st(2),%st
c01049fa:	dd da                	fstp   %st(2)
c01049fc:	0f 86 7f 03 00 00    	jbe    c0104d81 <_dtoa_r+0xfd1>
c0104a02:	dd d8                	fstp   %st(0)
c0104a04:	dd d8                	fstp   %st(0)
c0104a06:	dd d8                	fstp   %st(0)
c0104a08:	dd d8                	fstp   %st(0)
c0104a0a:	89 fb                	mov    %edi,%ebx
c0104a0c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0104a10:	89 d7                	mov    %edx,%edi
c0104a12:	e9 d7 f9 ff ff       	jmp    c01043ee <_dtoa_r+0x63e>
c0104a17:	90                   	nop
c0104a18:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0104a1b:	8b 41 10             	mov    0x10(%ecx),%eax
c0104a1e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c0104a22:	89 04 24             	mov    %eax,(%esp)
c0104a25:	e8 56 11 00 00       	call   c0105b80 <__hi0bits>
c0104a2a:	ba 20 00 00 00       	mov    $0x20,%edx
c0104a2f:	29 c2                	sub    %eax,%edx
c0104a31:	e9 bb fa ff ff       	jmp    c01044f1 <_dtoa_r+0x741>
c0104a36:	66 90                	xchg   %ax,%ax
c0104a38:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104a3b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104a3f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104a42:	89 04 24             	mov    %eax,(%esp)
c0104a45:	e8 56 16 00 00       	call   c01060a0 <__mcmp>
c0104a4a:	85 c0                	test   %eax,%eax
c0104a4c:	0f 89 13 fb ff ff    	jns    c0104565 <_dtoa_r+0x7b5>
c0104a52:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104a55:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104a5c:	00 
c0104a5d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104a64:	00 
c0104a65:	89 34 24             	mov    %esi,(%esp)
c0104a68:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104a6c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104a70:	e8 2b 0f 00 00       	call   c01059a0 <__multadd>
c0104a75:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104a78:	85 c9                	test   %ecx,%ecx
c0104a7a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104a7d:	0f 85 8d 00 00 00    	jne    c0104b10 <_dtoa_r+0xd60>
c0104a83:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c0104a87:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104a8a:	7f 0a                	jg     c0104a96 <_dtoa_r+0xce6>
c0104a8c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104a90:	0f 8f ff 04 00 00    	jg     c0104f95 <_dtoa_r+0x11e5>
c0104a96:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104a99:	e9 ed fc ff ff       	jmp    c010478b <_dtoa_r+0x9db>
c0104a9e:	66 90                	xchg   %ax,%ax
c0104aa0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104aa3:	85 db                	test   %ebx,%ebx
c0104aa5:	0f 85 aa fc ff ff    	jne    c0104755 <_dtoa_r+0x9a5>
c0104aab:	d8 0d 18 8d 10 c0    	fmuls  0xc0108d18
c0104ab1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0104ab8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104abf:	dd 45 c0             	fldl   -0x40(%ebp)
c0104ac2:	d9 c9                	fxch   %st(1)
c0104ac4:	df e9                	fucomip %st(1),%st
c0104ac6:	dd d8                	fstp   %st(0)
c0104ac8:	0f 83 97 fc ff ff    	jae    c0104765 <_dtoa_r+0x9b5>
c0104ace:	e9 eb fa ff ff       	jmp    c01045be <_dtoa_r+0x80e>
c0104ad3:	90                   	nop
c0104ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104ad8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104adb:	85 c0                	test   %eax,%eax
c0104add:	0f 85 fe f9 ff ff    	jne    c01044e1 <_dtoa_r+0x731>
c0104ae3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0104ae6:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c0104aeb:	0f 85 f0 f9 ff ff    	jne    c01044e1 <_dtoa_r+0x731>
c0104af1:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c0104af6:	0f 84 e5 f9 ff ff    	je     c01044e1 <_dtoa_r+0x731>
c0104afc:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c0104b00:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c0104b04:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0104b0b:	e9 d1 f9 ff ff       	jmp    c01044e1 <_dtoa_r+0x731>
c0104b10:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104b13:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104b1a:	00 
c0104b1b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104b22:	00 
c0104b23:	89 34 24             	mov    %esi,(%esp)
c0104b26:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104b2a:	e8 71 0e 00 00       	call   c01059a0 <__multadd>
c0104b2f:	8b 55 90             	mov    -0x70(%ebp),%edx
c0104b32:	85 d2                	test   %edx,%edx
c0104b34:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104b37:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104b3a:	7f 0a                	jg     c0104b46 <_dtoa_r+0xd96>
c0104b3c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104b40:	0f 8f 4f 04 00 00    	jg     c0104f95 <_dtoa_r+0x11e5>
c0104b46:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104b50:	85 db                	test   %ebx,%ebx
c0104b52:	7e 16                	jle    c0104b6a <_dtoa_r+0xdba>
c0104b54:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104b57:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0104b5b:	89 34 24             	mov    %esi,(%esp)
c0104b5e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104b62:	e8 19 14 00 00       	call   c0105f80 <__lshift>
c0104b67:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104b6a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c0104b6d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104b70:	85 db                	test   %ebx,%ebx
c0104b72:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104b75:	0f 85 11 03 00 00    	jne    c0104e8c <_dtoa_r+0x10dc>
c0104b7b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104b7e:	8d 5f 01             	lea    0x1(%edi),%ebx
c0104b81:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c0104b84:	01 f8                	add    %edi,%eax
c0104b86:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c0104b89:	89 45 90             	mov    %eax,-0x70(%ebp)
c0104b8c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104b8f:	83 e0 01             	and    $0x1,%eax
c0104b92:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0104b95:	eb 2e                	jmp    c0104bc5 <_dtoa_r+0xe15>
c0104b97:	90                   	nop
c0104b98:	e8 03 0e 00 00       	call   c01059a0 <__multadd>
c0104b9d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104ba4:	00 
c0104ba5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104bac:	00 
c0104bad:	89 34 24             	mov    %esi,(%esp)
c0104bb0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104bb3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104bba:	e8 e1 0d 00 00       	call   c01059a0 <__multadd>
c0104bbf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104bc2:	83 c3 01             	add    $0x1,%ebx
c0104bc5:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104bc8:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0104bcb:	89 45 98             	mov    %eax,-0x68(%ebp)
c0104bce:	89 f8                	mov    %edi,%eax
c0104bd0:	e8 0b f0 ff ff       	call   c0103be0 <quorem>
c0104bd5:	89 3c 24             	mov    %edi,(%esp)
c0104bd8:	8d 48 30             	lea    0x30(%eax),%ecx
c0104bdb:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c0104bde:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104be1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104be4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104be8:	e8 b3 14 00 00       	call   c01060a0 <__mcmp>
c0104bed:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c0104bf0:	89 34 24             	mov    %esi,(%esp)
c0104bf3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104bf7:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104bfa:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104bfd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c01:	e8 ea 14 00 00       	call   c01060f0 <__mdiff>
c0104c06:	8b 48 0c             	mov    0xc(%eax),%ecx
c0104c09:	89 c2                	mov    %eax,%edx
c0104c0b:	85 c9                	test   %ecx,%ecx
c0104c0d:	0f 85 c5 00 00 00    	jne    c0104cd8 <_dtoa_r+0xf28>
c0104c13:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c17:	89 3c 24             	mov    %edi,(%esp)
c0104c1a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104c1d:	e8 7e 14 00 00       	call   c01060a0 <__mcmp>
c0104c22:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104c25:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104c29:	89 34 24             	mov    %esi,(%esp)
c0104c2c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104c2f:	e8 4c 0d 00 00       	call   c0105980 <_Bfree>
c0104c34:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104c37:	89 c1                	mov    %eax,%ecx
c0104c39:	0b 4d 14             	or     0x14(%ebp),%ecx
c0104c3c:	75 0b                	jne    c0104c49 <_dtoa_r+0xe99>
c0104c3e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0104c41:	85 d2                	test   %edx,%edx
c0104c43:	0f 84 fb 02 00 00    	je     c0104f44 <_dtoa_r+0x1194>
c0104c49:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0104c4c:	85 d2                	test   %edx,%edx
c0104c4e:	0f 88 7f 01 00 00    	js     c0104dd3 <_dtoa_r+0x1023>
c0104c54:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104c57:	0b 4d 14             	or     0x14(%ebp),%ecx
c0104c5a:	75 0b                	jne    c0104c67 <_dtoa_r+0xeb7>
c0104c5c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0104c5f:	85 c9                	test   %ecx,%ecx
c0104c61:	0f 84 6c 01 00 00    	je     c0104dd3 <_dtoa_r+0x1023>
c0104c67:	85 c0                	test   %eax,%eax
c0104c69:	0f 8f 82 02 00 00    	jg     c0104ef1 <_dtoa_r+0x1141>
c0104c6f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104c73:	89 da                	mov    %ebx,%edx
c0104c75:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c0104c78:	88 43 ff             	mov    %al,-0x1(%ebx)
c0104c7b:	0f 84 8d 02 00 00    	je     c0104f0e <_dtoa_r+0x115e>
c0104c81:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0104c85:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104c8c:	00 
c0104c8d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104c94:	00 
c0104c95:	89 34 24             	mov    %esi,(%esp)
c0104c98:	e8 03 0d 00 00       	call   c01059a0 <__multadd>
c0104c9d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104ca4:	00 
c0104ca5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104cac:	00 
c0104cad:	89 34 24             	mov    %esi,(%esp)
c0104cb0:	89 c7                	mov    %eax,%edi
c0104cb2:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104cb5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c0104cb8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104cbb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cbf:	0f 85 d3 fe ff ff    	jne    c0104b98 <_dtoa_r+0xde8>
c0104cc5:	e8 d6 0c 00 00       	call   c01059a0 <__multadd>
c0104cca:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104ccd:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104cd0:	e9 ed fe ff ff       	jmp    c0104bc2 <_dtoa_r+0xe12>
c0104cd5:	8d 76 00             	lea    0x0(%esi),%esi
c0104cd8:	b8 01 00 00 00       	mov    $0x1,%eax
c0104cdd:	e9 43 ff ff ff       	jmp    c0104c25 <_dtoa_r+0xe75>
c0104ce2:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104ce9:	e9 d2 f2 ff ff       	jmp    c0103fc0 <_dtoa_r+0x210>
c0104cee:	0f 85 87 f6 ff ff    	jne    c010437b <_dtoa_r+0x5cb>
c0104cf4:	dd d8                	fstp   %st(0)
c0104cf6:	dd d8                	fstp   %st(0)
c0104cf8:	dd d8                	fstp   %st(0)
c0104cfa:	89 fb                	mov    %edi,%ebx
c0104cfc:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0104cff:	e9 fc f8 ff ff       	jmp    c0104600 <_dtoa_r+0x850>
c0104d04:	89 c2                	mov    %eax,%edx
c0104d06:	2b 55 b0             	sub    -0x50(%ebp),%edx
c0104d09:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0104d0c:	01 55 94             	add    %edx,-0x6c(%ebp)
c0104d0f:	31 d2                	xor    %edx,%edx
c0104d11:	e9 b8 f9 ff ff       	jmp    c01046ce <_dtoa_r+0x91e>
c0104d16:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104d19:	85 c0                	test   %eax,%eax
c0104d1b:	0f 84 f3 f9 ff ff    	je     c0104714 <_dtoa_r+0x964>
c0104d21:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104d24:	85 c0                	test   %eax,%eax
c0104d26:	0f 8e c4 fb ff ff    	jle    c01048f0 <_dtoa_r+0xb40>
c0104d2c:	d8 0d 10 8d 10 c0    	fmuls  0xc0108d10
c0104d32:	83 c1 01             	add    $0x1,%ecx
c0104d35:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104d38:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0104d3b:	89 c1                	mov    %eax,%ecx
c0104d3d:	83 eb 01             	sub    $0x1,%ebx
c0104d40:	db 45 d4             	fildl  -0x2c(%ebp)
c0104d43:	d8 c9                	fmul   %st(1),%st
c0104d45:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c0104d48:	d8 05 14 8d 10 c0    	fadds  0xc0108d14
c0104d4e:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104d51:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0104d58:	e9 53 f4 ff ff       	jmp    c01041b0 <_dtoa_r+0x400>
c0104d5d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104d60:	c6 03 30             	movb   $0x30,(%ebx)
c0104d63:	83 c0 01             	add    $0x1,%eax
c0104d66:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104d69:	b8 31 00 00 00       	mov    $0x31,%eax
c0104d6e:	88 02                	mov    %al,(%edx)
c0104d70:	e9 8b f8 ff ff       	jmp    c0104600 <_dtoa_r+0x850>
c0104d75:	d9 c0                	fld    %st(0)
c0104d77:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104d7c:	e9 f2 f3 ff ff       	jmp    c0104173 <_dtoa_r+0x3c3>
c0104d81:	de e2                	fsubp  %st,%st(2)
c0104d83:	d9 c9                	fxch   %st(1)
c0104d85:	df e9                	fucomip %st(1),%st
c0104d87:	dd d8                	fstp   %st(0)
c0104d89:	0f 86 69 fb ff ff    	jbe    c01048f8 <_dtoa_r+0xb48>
c0104d8f:	dd d8                	fstp   %st(0)
c0104d91:	eb 07                	jmp    c0104d9a <_dtoa_r+0xfea>
c0104d93:	90                   	nop
c0104d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104d98:	89 c2                	mov    %eax,%edx
c0104d9a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c0104d9e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104da1:	74 f5                	je     c0104d98 <_dtoa_r+0xfe8>
c0104da3:	e9 d9 f4 ff ff       	jmp    c0104281 <_dtoa_r+0x4d1>
c0104da8:	c6 07 31             	movb   $0x31,(%edi)
c0104dab:	89 fb                	mov    %edi,%ebx
c0104dad:	89 d7                	mov    %edx,%edi
c0104daf:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0104db3:	e9 1a f8 ff ff       	jmp    c01045d2 <_dtoa_r+0x822>
c0104db8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0104dbb:	85 d2                	test   %edx,%edx
c0104dbd:	0f 84 1b 01 00 00    	je     c0104ede <_dtoa_r+0x112e>
c0104dc3:	05 33 04 00 00       	add    $0x433,%eax
c0104dc8:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104dcb:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104dce:	e9 0b f9 ff ff       	jmp    c01046de <_dtoa_r+0x92e>
c0104dd3:	85 c0                	test   %eax,%eax
c0104dd5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104dd8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104ddb:	7e 45                	jle    c0104e22 <_dtoa_r+0x1072>
c0104ddd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104de0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104de7:	00 
c0104de8:	89 34 24             	mov    %esi,(%esp)
c0104deb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104def:	e8 8c 11 00 00       	call   c0105f80 <__lshift>
c0104df4:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c0104df7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104dfb:	89 04 24             	mov    %eax,(%esp)
c0104dfe:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104e01:	e8 9a 12 00 00       	call   c01060a0 <__mcmp>
c0104e06:	83 f8 00             	cmp    $0x0,%eax
c0104e09:	0f 8e 5b 01 00 00    	jle    c0104f6a <_dtoa_r+0x11ba>
c0104e0f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104e13:	0f 84 0c 01 00 00    	je     c0104f25 <_dtoa_r+0x1175>
c0104e19:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104e1c:	83 c0 31             	add    $0x31,%eax
c0104e1f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104e22:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104e25:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104e29:	89 cb                	mov    %ecx,%ebx
c0104e2b:	88 03                	mov    %al,(%ebx)
c0104e2d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104e30:	89 fb                	mov    %edi,%ebx
c0104e32:	8d 79 01             	lea    0x1(%ecx),%edi
c0104e35:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104e38:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104e3b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104e3e:	e9 8f f7 ff ff       	jmp    c01045d2 <_dtoa_r+0x822>
c0104e43:	dd d8                	fstp   %st(0)
c0104e45:	dd d8                	fstp   %st(0)
c0104e47:	dd d8                	fstp   %st(0)
c0104e49:	eb 0d                	jmp    c0104e58 <_dtoa_r+0x10a8>
c0104e4b:	90                   	nop
c0104e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104e50:	dd d8                	fstp   %st(0)
c0104e52:	dd d8                	fstp   %st(0)
c0104e54:	dd d8                	fstp   %st(0)
c0104e56:	dd d8                	fstp   %st(0)
c0104e58:	89 fb                	mov    %edi,%ebx
c0104e5a:	89 d7                	mov    %edx,%edi
c0104e5c:	e9 8d f5 ff ff       	jmp    c01043ee <_dtoa_r+0x63e>
c0104e61:	29 cb                	sub    %ecx,%ebx
c0104e63:	31 c0                	xor    %eax,%eax
c0104e65:	e9 74 f8 ff ff       	jmp    c01046de <_dtoa_r+0x92e>
c0104e6a:	75 0e                	jne    c0104e7a <_dtoa_r+0x10ca>
c0104e6c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104e70:	74 08                	je     c0104e7a <_dtoa_r+0x10ca>
c0104e72:	e9 b2 f9 ff ff       	jmp    c0104829 <_dtoa_r+0xa79>
c0104e77:	90                   	nop
c0104e78:	89 c2                	mov    %eax,%edx
c0104e7a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c0104e7e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104e81:	74 f5                	je     c0104e78 <_dtoa_r+0x10c8>
c0104e83:	89 fb                	mov    %edi,%ebx
c0104e85:	89 d7                	mov    %edx,%edi
c0104e87:	e9 46 f7 ff ff       	jmp    c01045d2 <_dtoa_r+0x822>
c0104e8c:	8b 40 04             	mov    0x4(%eax),%eax
c0104e8f:	89 34 24             	mov    %esi,(%esp)
c0104e92:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104e96:	e8 45 0a 00 00       	call   c01058e0 <_Balloc>
c0104e9b:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104e9e:	89 c3                	mov    %eax,%ebx
c0104ea0:	8b 41 10             	mov    0x10(%ecx),%eax
c0104ea3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0104eaa:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104eae:	89 c8                	mov    %ecx,%eax
c0104eb0:	83 c0 0c             	add    $0xc,%eax
c0104eb3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104eb7:	8d 43 0c             	lea    0xc(%ebx),%eax
c0104eba:	89 04 24             	mov    %eax,(%esp)
c0104ebd:	e8 fe cb ff ff       	call   c0101ac0 <memcpy>
c0104ec2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104ec9:	00 
c0104eca:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104ece:	89 34 24             	mov    %esi,(%esp)
c0104ed1:	e8 aa 10 00 00       	call   c0105f80 <__lshift>
c0104ed6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104ed9:	e9 9d fc ff ff       	jmp    c0104b7b <_dtoa_r+0xdcb>
c0104ede:	b8 36 00 00 00       	mov    $0x36,%eax
c0104ee3:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104ee6:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0104ee9:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104eec:	e9 ed f7 ff ff       	jmp    c01046de <_dtoa_r+0x92e>
c0104ef1:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104ef5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104ef8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104efb:	74 28                	je     c0104f25 <_dtoa_r+0x1175>
c0104efd:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104f01:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104f04:	83 c0 01             	add    $0x1,%eax
c0104f07:	89 cb                	mov    %ecx,%ebx
c0104f09:	e9 1d ff ff ff       	jmp    c0104e2b <_dtoa_r+0x107b>
c0104f0e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104f11:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104f14:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104f17:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f1a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104f1d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104f20:	e9 cc f8 ff ff       	jmp    c01047f1 <_dtoa_r+0xa41>
c0104f25:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104f28:	b9 39 00 00 00       	mov    $0x39,%ecx
c0104f2d:	8d 50 01             	lea    0x1(%eax),%edx
c0104f30:	c6 00 39             	movb   $0x39,(%eax)
c0104f33:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104f36:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f39:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104f3c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104f3f:	e9 fa f8 ff ff       	jmp    c010483e <_dtoa_r+0xa8e>
c0104f44:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104f47:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104f4a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104f4d:	83 fb 39             	cmp    $0x39,%ebx
c0104f50:	74 d3                	je     c0104f25 <_dtoa_r+0x1175>
c0104f52:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104f55:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104f58:	83 c0 31             	add    $0x31,%eax
c0104f5b:	85 c9                	test   %ecx,%ecx
c0104f5d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104f60:	0f 4e c3             	cmovle %ebx,%eax
c0104f63:	89 cb                	mov    %ecx,%ebx
c0104f65:	e9 c1 fe ff ff       	jmp    c0104e2b <_dtoa_r+0x107b>
c0104f6a:	0f 85 b2 fe ff ff    	jne    c0104e22 <_dtoa_r+0x1072>
c0104f70:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104f74:	0f 84 a8 fe ff ff    	je     c0104e22 <_dtoa_r+0x1072>
c0104f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104f80:	e9 8a fe ff ff       	jmp    c0104e0f <_dtoa_r+0x105f>
c0104f85:	0f 85 c7 f3 ff ff    	jne    c0104352 <_dtoa_r+0x5a2>
c0104f8b:	dd d8                	fstp   %st(0)
c0104f8d:	dd d8                	fstp   %st(0)
c0104f8f:	90                   	nop
c0104f90:	e9 65 fd ff ff       	jmp    c0104cfa <_dtoa_r+0xf4a>
c0104f95:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104f98:	e9 dd f5 ff ff       	jmp    c010457a <_dtoa_r+0x7ca>
c0104f9d:	8d 76 00             	lea    0x0(%esi),%esi
c0104fa0:	0f 84 7a f5 ff ff    	je     c0104520 <_dtoa_r+0x770>
c0104fa6:	b8 3c 00 00 00       	mov    $0x3c,%eax
c0104fab:	29 d0                	sub    %edx,%eax
c0104fad:	e9 ab f8 ff ff       	jmp    c010485d <_dtoa_r+0xaad>
c0104fb2:	b8 01 00 00 00       	mov    $0x1,%eax
c0104fb7:	e9 d9 ef ff ff       	jmp    c0103f95 <_dtoa_r+0x1e5>
c0104fbc:	31 d2                	xor    %edx,%edx
c0104fbe:	e9 36 f1 ff ff       	jmp    c01040f9 <_dtoa_r+0x349>
c0104fc3:	66 90                	xchg   %ax,%ax
c0104fc5:	66 90                	xchg   %ax,%ax
c0104fc7:	66 90                	xchg   %ax,%ax
c0104fc9:	66 90                	xchg   %ax,%ax
c0104fcb:	66 90                	xchg   %ax,%ax
c0104fcd:	66 90                	xchg   %ax,%ax
c0104fcf:	90                   	nop

c0104fd0 <_setlocale_r>:
c0104fd0:	55                   	push   %ebp
c0104fd1:	89 e5                	mov    %esp,%ebp
c0104fd3:	53                   	push   %ebx
c0104fd4:	83 ec 14             	sub    $0x14,%esp
c0104fd7:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0104fda:	85 db                	test   %ebx,%ebx
c0104fdc:	74 14                	je     c0104ff2 <_setlocale_r+0x22>
c0104fde:	c7 44 24 04 38 8d 10 	movl   $0xc0108d38,0x4(%esp)
c0104fe5:	c0 
c0104fe6:	89 1c 24             	mov    %ebx,(%esp)
c0104fe9:	e8 a2 cb ff ff       	call   c0101b90 <strcmp>
c0104fee:	85 c0                	test   %eax,%eax
c0104ff0:	75 0e                	jne    c0105000 <_setlocale_r+0x30>
c0104ff2:	83 c4 14             	add    $0x14,%esp
c0104ff5:	b8 38 8b 10 c0       	mov    $0xc0108b38,%eax
c0104ffa:	5b                   	pop    %ebx
c0104ffb:	5d                   	pop    %ebp
c0104ffc:	c3                   	ret    
c0104ffd:	8d 76 00             	lea    0x0(%esi),%esi
c0105000:	c7 44 24 04 38 8b 10 	movl   $0xc0108b38,0x4(%esp)
c0105007:	c0 
c0105008:	89 1c 24             	mov    %ebx,(%esp)
c010500b:	e8 80 cb ff ff       	call   c0101b90 <strcmp>
c0105010:	85 c0                	test   %eax,%eax
c0105012:	74 de                	je     c0104ff2 <_setlocale_r+0x22>
c0105014:	89 1c 24             	mov    %ebx,(%esp)
c0105017:	c7 44 24 04 72 8b 10 	movl   $0xc0108b72,0x4(%esp)
c010501e:	c0 
c010501f:	e8 6c cb ff ff       	call   c0101b90 <strcmp>
c0105024:	89 c2                	mov    %eax,%edx
c0105026:	31 c0                	xor    %eax,%eax
c0105028:	85 d2                	test   %edx,%edx
c010502a:	ba 38 8b 10 c0       	mov    $0xc0108b38,%edx
c010502f:	0f 44 c2             	cmove  %edx,%eax
c0105032:	83 c4 14             	add    $0x14,%esp
c0105035:	5b                   	pop    %ebx
c0105036:	5d                   	pop    %ebp
c0105037:	c3                   	ret    
c0105038:	90                   	nop
c0105039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105040 <__locale_charset>:
c0105040:	55                   	push   %ebp
c0105041:	b8 40 b5 10 c0       	mov    $0xc010b540,%eax
c0105046:	89 e5                	mov    %esp,%ebp
c0105048:	5d                   	pop    %ebp
c0105049:	c3                   	ret    
c010504a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105050 <__locale_mb_cur_max>:
c0105050:	55                   	push   %ebp
c0105051:	a1 98 b5 10 c0       	mov    0xc010b598,%eax
c0105056:	89 e5                	mov    %esp,%ebp
c0105058:	5d                   	pop    %ebp
c0105059:	c3                   	ret    
c010505a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105060 <__locale_msgcharset>:
c0105060:	55                   	push   %ebp
c0105061:	b8 20 b5 10 c0       	mov    $0xc010b520,%eax
c0105066:	89 e5                	mov    %esp,%ebp
c0105068:	5d                   	pop    %ebp
c0105069:	c3                   	ret    
c010506a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105070 <__locale_cjk_lang>:
c0105070:	55                   	push   %ebp
c0105071:	31 c0                	xor    %eax,%eax
c0105073:	89 e5                	mov    %esp,%ebp
c0105075:	5d                   	pop    %ebp
c0105076:	c3                   	ret    
c0105077:	89 f6                	mov    %esi,%esi
c0105079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105080 <_localeconv_r>:
c0105080:	55                   	push   %ebp
c0105081:	b8 60 b5 10 c0       	mov    $0xc010b560,%eax
c0105086:	89 e5                	mov    %esp,%ebp
c0105088:	5d                   	pop    %ebp
c0105089:	c3                   	ret    
c010508a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105090 <setlocale>:
c0105090:	55                   	push   %ebp
c0105091:	89 e5                	mov    %esp,%ebp
c0105093:	83 ec 18             	sub    $0x18,%esp
c0105096:	e8 35 cc ff ff       	call   c0101cd0 <__getreent>
c010509b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010509e:	89 54 24 08          	mov    %edx,0x8(%esp)
c01050a2:	8b 55 08             	mov    0x8(%ebp),%edx
c01050a5:	89 04 24             	mov    %eax,(%esp)
c01050a8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01050ac:	e8 1f ff ff ff       	call   c0104fd0 <_setlocale_r>
c01050b1:	c9                   	leave  
c01050b2:	c3                   	ret    
c01050b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01050b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01050c0 <localeconv>:
c01050c0:	55                   	push   %ebp
c01050c1:	89 e5                	mov    %esp,%ebp
c01050c3:	83 ec 08             	sub    $0x8,%esp
c01050c6:	e8 05 cc ff ff       	call   c0101cd0 <__getreent>
c01050cb:	b8 60 b5 10 c0       	mov    $0xc010b560,%eax
c01050d0:	c9                   	leave  
c01050d1:	c3                   	ret    
c01050d2:	66 90                	xchg   %ax,%ax
c01050d4:	66 90                	xchg   %ax,%ax
c01050d6:	66 90                	xchg   %ax,%ax
c01050d8:	66 90                	xchg   %ax,%ax
c01050da:	66 90                	xchg   %ax,%ax
c01050dc:	66 90                	xchg   %ax,%ax
c01050de:	66 90                	xchg   %ax,%ax

c01050e0 <_malloc_r>:
c01050e0:	55                   	push   %ebp
c01050e1:	89 e5                	mov    %esp,%ebp
c01050e3:	57                   	push   %edi
c01050e4:	56                   	push   %esi
c01050e5:	53                   	push   %ebx
c01050e6:	83 ec 2c             	sub    $0x2c,%esp
c01050e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01050ec:	8d 50 0b             	lea    0xb(%eax),%edx
c01050ef:	83 fa 16             	cmp    $0x16,%edx
c01050f2:	76 6c                	jbe    c0105160 <_malloc_r+0x80>
c01050f4:	89 d7                	mov    %edx,%edi
c01050f6:	83 e7 f8             	and    $0xfffffff8,%edi
c01050f9:	89 fe                	mov    %edi,%esi
c01050fb:	c1 ee 1f             	shr    $0x1f,%esi
c01050fe:	39 c7                	cmp    %eax,%edi
c0105100:	8b 45 08             	mov    0x8(%ebp),%eax
c0105103:	89 f2                	mov    %esi,%edx
c0105105:	72 67                	jb     c010516e <_malloc_r+0x8e>
c0105107:	84 d2                	test   %dl,%dl
c0105109:	75 63                	jne    c010516e <_malloc_r+0x8e>
c010510b:	89 04 24             	mov    %eax,(%esp)
c010510e:	e8 ad 07 00 00       	call   c01058c0 <__malloc_lock>
c0105113:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0105119:	77 65                	ja     c0105180 <_malloc_r+0xa0>
c010511b:	89 fa                	mov    %edi,%edx
c010511d:	c1 ea 03             	shr    $0x3,%edx
c0105120:	8d 04 d5 c0 b5 10 c0 	lea    -0x3fef4a40(,%edx,8),%eax
c0105127:	8b 58 0c             	mov    0xc(%eax),%ebx
c010512a:	39 c3                	cmp    %eax,%ebx
c010512c:	0f 84 3e 05 00 00    	je     c0105670 <_malloc_r+0x590>
c0105132:	8b 43 04             	mov    0x4(%ebx),%eax
c0105135:	83 e0 fc             	and    $0xfffffffc,%eax
c0105138:	8b 53 0c             	mov    0xc(%ebx),%edx
c010513b:	8b 4b 08             	mov    0x8(%ebx),%ecx
c010513e:	89 51 0c             	mov    %edx,0xc(%ecx)
c0105141:	89 4a 08             	mov    %ecx,0x8(%edx)
c0105144:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0105149:	8b 45 08             	mov    0x8(%ebp),%eax
c010514c:	89 04 24             	mov    %eax,(%esp)
c010514f:	e8 7c 07 00 00       	call   c01058d0 <__malloc_unlock>
c0105154:	8d 43 08             	lea    0x8(%ebx),%eax
c0105157:	83 c4 2c             	add    $0x2c,%esp
c010515a:	5b                   	pop    %ebx
c010515b:	5e                   	pop    %esi
c010515c:	5f                   	pop    %edi
c010515d:	5d                   	pop    %ebp
c010515e:	c3                   	ret    
c010515f:	90                   	nop
c0105160:	bf 10 00 00 00       	mov    $0x10,%edi
c0105165:	31 d2                	xor    %edx,%edx
c0105167:	39 c7                	cmp    %eax,%edi
c0105169:	8b 45 08             	mov    0x8(%ebp),%eax
c010516c:	73 99                	jae    c0105107 <_malloc_r+0x27>
c010516e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0105174:	83 c4 2c             	add    $0x2c,%esp
c0105177:	31 c0                	xor    %eax,%eax
c0105179:	5b                   	pop    %ebx
c010517a:	5e                   	pop    %esi
c010517b:	5f                   	pop    %edi
c010517c:	5d                   	pop    %ebp
c010517d:	c3                   	ret    
c010517e:	66 90                	xchg   %ax,%ax
c0105180:	89 fe                	mov    %edi,%esi
c0105182:	c1 ee 09             	shr    $0x9,%esi
c0105185:	85 f6                	test   %esi,%esi
c0105187:	0f 84 ab 01 00 00    	je     c0105338 <_malloc_r+0x258>
c010518d:	83 fe 04             	cmp    $0x4,%esi
c0105190:	0f 87 8a 03 00 00    	ja     c0105520 <_malloc_r+0x440>
c0105196:	89 fe                	mov    %edi,%esi
c0105198:	c1 ee 06             	shr    $0x6,%esi
c010519b:	83 c6 38             	add    $0x38,%esi
c010519e:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01051a1:	8d 0c 85 c0 b5 10 c0 	lea    -0x3fef4a40(,%eax,4),%ecx
c01051a8:	8b 59 0c             	mov    0xc(%ecx),%ebx
c01051ab:	39 d9                	cmp    %ebx,%ecx
c01051ad:	75 18                	jne    c01051c7 <_malloc_r+0xe7>
c01051af:	eb 28                	jmp    c01051d9 <_malloc_r+0xf9>
c01051b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01051b8:	85 d2                	test   %edx,%edx
c01051ba:	0f 89 78 ff ff ff    	jns    c0105138 <_malloc_r+0x58>
c01051c0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c01051c3:	39 d9                	cmp    %ebx,%ecx
c01051c5:	74 12                	je     c01051d9 <_malloc_r+0xf9>
c01051c7:	8b 43 04             	mov    0x4(%ebx),%eax
c01051ca:	83 e0 fc             	and    $0xfffffffc,%eax
c01051cd:	89 c2                	mov    %eax,%edx
c01051cf:	29 fa                	sub    %edi,%edx
c01051d1:	83 fa 0f             	cmp    $0xf,%edx
c01051d4:	7e e2                	jle    c01051b8 <_malloc_r+0xd8>
c01051d6:	83 ee 01             	sub    $0x1,%esi
c01051d9:	8d 46 01             	lea    0x1(%esi),%eax
c01051dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01051df:	8b 1d d0 b5 10 c0    	mov    0xc010b5d0,%ebx
c01051e5:	a1 c4 b5 10 c0       	mov    0xc010b5c4,%eax
c01051ea:	81 fb c8 b5 10 c0    	cmp    $0xc010b5c8,%ebx
c01051f0:	74 6b                	je     c010525d <_malloc_r+0x17d>
c01051f2:	8b 73 04             	mov    0x4(%ebx),%esi
c01051f5:	83 e6 fc             	and    $0xfffffffc,%esi
c01051f8:	89 f0                	mov    %esi,%eax
c01051fa:	29 f8                	sub    %edi,%eax
c01051fc:	83 f8 0f             	cmp    $0xf,%eax
c01051ff:	0f 8f a3 03 00 00    	jg     c01055a8 <_malloc_r+0x4c8>
c0105205:	85 c0                	test   %eax,%eax
c0105207:	c7 05 d4 b5 10 c0 c8 	movl   $0xc010b5c8,0xc010b5d4
c010520e:	b5 10 c0 
c0105211:	c7 05 d0 b5 10 c0 c8 	movl   $0xc010b5c8,0xc010b5d0
c0105218:	b5 10 c0 
c010521b:	0f 89 27 01 00 00    	jns    c0105348 <_malloc_r+0x268>
c0105221:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0105227:	0f 87 1b 03 00 00    	ja     c0105548 <_malloc_r+0x468>
c010522d:	c1 ee 03             	shr    $0x3,%esi
c0105230:	b8 01 00 00 00       	mov    $0x1,%eax
c0105235:	89 f1                	mov    %esi,%ecx
c0105237:	8d 14 f5 c0 b5 10 c0 	lea    -0x3fef4a40(,%esi,8),%edx
c010523e:	c1 f9 02             	sar    $0x2,%ecx
c0105241:	d3 e0                	shl    %cl,%eax
c0105243:	8b 4a 08             	mov    0x8(%edx),%ecx
c0105246:	0b 05 c4 b5 10 c0    	or     0xc010b5c4,%eax
c010524c:	89 53 0c             	mov    %edx,0xc(%ebx)
c010524f:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0105252:	a3 c4 b5 10 c0       	mov    %eax,0xc010b5c4
c0105257:	89 5a 08             	mov    %ebx,0x8(%edx)
c010525a:	89 59 0c             	mov    %ebx,0xc(%ecx)
c010525d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105260:	be 01 00 00 00       	mov    $0x1,%esi
c0105265:	c1 f9 02             	sar    $0x2,%ecx
c0105268:	d3 e6                	shl    %cl,%esi
c010526a:	39 c6                	cmp    %eax,%esi
c010526c:	0f 87 f6 00 00 00    	ja     c0105368 <_malloc_r+0x288>
c0105272:	85 f0                	test   %esi,%eax
c0105274:	0f 85 76 03 00 00    	jne    c01055f0 <_malloc_r+0x510>
c010527a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010527d:	01 f6                	add    %esi,%esi
c010527f:	83 e2 fc             	and    $0xfffffffc,%edx
c0105282:	85 f0                	test   %esi,%eax
c0105284:	8d 4a 04             	lea    0x4(%edx),%ecx
c0105287:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010528a:	0f 85 60 03 00 00    	jne    c01055f0 <_malloc_r+0x510>
c0105290:	89 ca                	mov    %ecx,%edx
c0105292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105298:	01 f6                	add    %esi,%esi
c010529a:	83 c2 04             	add    $0x4,%edx
c010529d:	85 f0                	test   %esi,%eax
c010529f:	74 f7                	je     c0105298 <_malloc_r+0x1b8>
c01052a1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01052a4:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01052a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01052aa:	8d 34 c5 c0 b5 10 c0 	lea    -0x3fef4a40(,%eax,8),%esi
c01052b1:	89 f1                	mov    %esi,%ecx
c01052b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01052b6:	8b 59 0c             	mov    0xc(%ecx),%ebx
c01052b9:	39 d9                	cmp    %ebx,%ecx
c01052bb:	75 1e                	jne    c01052db <_malloc_r+0x1fb>
c01052bd:	e9 36 03 00 00       	jmp    c01055f8 <_malloc_r+0x518>
c01052c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01052c8:	85 d2                	test   %edx,%edx
c01052ca:	0f 89 c0 03 00 00    	jns    c0105690 <_malloc_r+0x5b0>
c01052d0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c01052d3:	39 d9                	cmp    %ebx,%ecx
c01052d5:	0f 84 1d 03 00 00    	je     c01055f8 <_malloc_r+0x518>
c01052db:	8b 43 04             	mov    0x4(%ebx),%eax
c01052de:	83 e0 fc             	and    $0xfffffffc,%eax
c01052e1:	89 c2                	mov    %eax,%edx
c01052e3:	29 fa                	sub    %edi,%edx
c01052e5:	83 fa 0f             	cmp    $0xf,%edx
c01052e8:	7e de                	jle    c01052c8 <_malloc_r+0x1e8>
c01052ea:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c01052ed:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c01052f0:	83 cf 01             	or     $0x1,%edi
c01052f3:	8b 73 08             	mov    0x8(%ebx),%esi
c01052f6:	89 7b 04             	mov    %edi,0x4(%ebx)
c01052f9:	89 4e 0c             	mov    %ecx,0xc(%esi)
c01052fc:	89 71 08             	mov    %esi,0x8(%ecx)
c01052ff:	89 d1                	mov    %edx,%ecx
c0105301:	83 c9 01             	or     $0x1,%ecx
c0105304:	a3 d4 b5 10 c0       	mov    %eax,0xc010b5d4
c0105309:	a3 d0 b5 10 c0       	mov    %eax,0xc010b5d0
c010530e:	c7 40 0c c8 b5 10 c0 	movl   $0xc010b5c8,0xc(%eax)
c0105315:	c7 40 08 c8 b5 10 c0 	movl   $0xc010b5c8,0x8(%eax)
c010531c:	89 48 04             	mov    %ecx,0x4(%eax)
c010531f:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0105322:	8b 45 08             	mov    0x8(%ebp),%eax
c0105325:	89 04 24             	mov    %eax,(%esp)
c0105328:	e8 a3 05 00 00       	call   c01058d0 <__malloc_unlock>
c010532d:	8d 43 08             	lea    0x8(%ebx),%eax
c0105330:	e9 22 fe ff ff       	jmp    c0105157 <_malloc_r+0x77>
c0105335:	8d 76 00             	lea    0x0(%esi),%esi
c0105338:	b8 7e 00 00 00       	mov    $0x7e,%eax
c010533d:	be 3f 00 00 00       	mov    $0x3f,%esi
c0105342:	e9 5a fe ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c0105347:	90                   	nop
c0105348:	8b 45 08             	mov    0x8(%ebp),%eax
c010534b:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0105350:	89 04 24             	mov    %eax,(%esp)
c0105353:	e8 78 05 00 00       	call   c01058d0 <__malloc_unlock>
c0105358:	83 c4 2c             	add    $0x2c,%esp
c010535b:	8d 43 08             	lea    0x8(%ebx),%eax
c010535e:	5b                   	pop    %ebx
c010535f:	5e                   	pop    %esi
c0105360:	5f                   	pop    %edi
c0105361:	5d                   	pop    %ebp
c0105362:	c3                   	ret    
c0105363:	90                   	nop
c0105364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105368:	8b 1d c8 b5 10 c0    	mov    0xc010b5c8,%ebx
c010536e:	8b 73 04             	mov    0x4(%ebx),%esi
c0105371:	83 e6 fc             	and    $0xfffffffc,%esi
c0105374:	39 f7                	cmp    %esi,%edi
c0105376:	77 0d                	ja     c0105385 <_malloc_r+0x2a5>
c0105378:	89 f0                	mov    %esi,%eax
c010537a:	29 f8                	sub    %edi,%eax
c010537c:	83 f8 0f             	cmp    $0xf,%eax
c010537f:	0f 8f 6b 01 00 00    	jg     c01054f0 <_malloc_r+0x410>
c0105385:	8b 0d 90 35 16 c0    	mov    0xc0163590,%ecx
c010538b:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c010538e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105391:	01 f9                	add    %edi,%ecx
c0105393:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c0105399:	83 c1 10             	add    $0x10,%ecx
c010539c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01053a1:	83 3d a0 b5 10 c0 ff 	cmpl   $0xffffffff,0xc010b5a0
c01053a8:	0f 44 c1             	cmove  %ecx,%eax
c01053ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01053ae:	89 44 24 04          	mov    %eax,0x4(%esp)
c01053b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01053b5:	89 04 24             	mov    %eax,(%esp)
c01053b8:	e8 03 13 00 00       	call   c01066c0 <_sbrk_r>
c01053bd:	83 f8 ff             	cmp    $0xffffffff,%eax
c01053c0:	89 c1                	mov    %eax,%ecx
c01053c2:	0f 84 17 03 00 00    	je     c01056df <_malloc_r+0x5ff>
c01053c8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01053cb:	0f 87 02 03 00 00    	ja     c01056d3 <_malloc_r+0x5f3>
c01053d1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01053d4:	03 15 60 35 16 c0    	add    0xc0163560,%edx
c01053da:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c01053dd:	89 15 60 35 16 c0    	mov    %edx,0xc0163560
c01053e3:	0f 84 a9 03 00 00    	je     c0105792 <_malloc_r+0x6b2>
c01053e9:	83 3d a0 b5 10 c0 ff 	cmpl   $0xffffffff,0xc010b5a0
c01053f0:	0f 84 ca 03 00 00    	je     c01057c0 <_malloc_r+0x6e0>
c01053f6:	89 c8                	mov    %ecx,%eax
c01053f8:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c01053fb:	01 d0                	add    %edx,%eax
c01053fd:	a3 60 35 16 c0       	mov    %eax,0xc0163560
c0105402:	89 c8                	mov    %ecx,%eax
c0105404:	ba 00 10 00 00       	mov    $0x1000,%edx
c0105409:	83 e0 07             	and    $0x7,%eax
c010540c:	74 0c                	je     c010541a <_malloc_r+0x33a>
c010540e:	29 c1                	sub    %eax,%ecx
c0105410:	ba 08 10 00 00       	mov    $0x1008,%edx
c0105415:	8d 49 08             	lea    0x8(%ecx),%ecx
c0105418:	29 c2                	sub    %eax,%edx
c010541a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010541d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105420:	01 c8                	add    %ecx,%eax
c0105422:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105427:	29 c2                	sub    %eax,%edx
c0105429:	8b 45 08             	mov    0x8(%ebp),%eax
c010542c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105430:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105433:	89 04 24             	mov    %eax,(%esp)
c0105436:	e8 85 12 00 00       	call   c01066c0 <_sbrk_r>
c010543b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c010543e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0105441:	0f 84 6d 03 00 00    	je     c01057b4 <_malloc_r+0x6d4>
c0105447:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010544a:	29 c8                	sub    %ecx,%eax
c010544c:	01 d0                	add    %edx,%eax
c010544e:	83 c8 01             	or     $0x1,%eax
c0105451:	03 15 60 35 16 c0    	add    0xc0163560,%edx
c0105457:	81 fb c0 b5 10 c0    	cmp    $0xc010b5c0,%ebx
c010545d:	89 0d c8 b5 10 c0    	mov    %ecx,0xc010b5c8
c0105463:	89 41 04             	mov    %eax,0x4(%ecx)
c0105466:	89 15 60 35 16 c0    	mov    %edx,0xc0163560
c010546c:	0f 84 f2 02 00 00    	je     c0105764 <_malloc_r+0x684>
c0105472:	83 fe 0f             	cmp    $0xf,%esi
c0105475:	0f 86 8d 02 00 00    	jbe    c0105708 <_malloc_r+0x628>
c010547b:	8b 43 04             	mov    0x4(%ebx),%eax
c010547e:	83 ee 0c             	sub    $0xc,%esi
c0105481:	83 e6 f8             	and    $0xfffffff8,%esi
c0105484:	83 e0 01             	and    $0x1,%eax
c0105487:	09 f0                	or     %esi,%eax
c0105489:	83 fe 0f             	cmp    $0xf,%esi
c010548c:	89 43 04             	mov    %eax,0x4(%ebx)
c010548f:	a1 c8 b5 10 c0       	mov    0xc010b5c8,%eax
c0105494:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c010549b:	00 
c010549c:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c01054a3:	00 
c01054a4:	0f 87 a2 02 00 00    	ja     c010574c <_malloc_r+0x66c>
c01054aa:	3b 15 8c 35 16 c0    	cmp    0xc016358c,%edx
c01054b0:	76 06                	jbe    c01054b8 <_malloc_r+0x3d8>
c01054b2:	89 15 8c 35 16 c0    	mov    %edx,0xc016358c
c01054b8:	3b 15 88 35 16 c0    	cmp    0xc0163588,%edx
c01054be:	76 06                	jbe    c01054c6 <_malloc_r+0x3e6>
c01054c0:	89 15 88 35 16 c0    	mov    %edx,0xc0163588
c01054c6:	8b 50 04             	mov    0x4(%eax),%edx
c01054c9:	89 c3                	mov    %eax,%ebx
c01054cb:	83 e2 fc             	and    $0xfffffffc,%edx
c01054ce:	89 d0                	mov    %edx,%eax
c01054d0:	29 f8                	sub    %edi,%eax
c01054d2:	39 d7                	cmp    %edx,%edi
c01054d4:	77 05                	ja     c01054db <_malloc_r+0x3fb>
c01054d6:	83 f8 0f             	cmp    $0xf,%eax
c01054d9:	7f 15                	jg     c01054f0 <_malloc_r+0x410>
c01054db:	8b 45 08             	mov    0x8(%ebp),%eax
c01054de:	89 04 24             	mov    %eax,(%esp)
c01054e1:	e8 ea 03 00 00       	call   c01058d0 <__malloc_unlock>
c01054e6:	31 c0                	xor    %eax,%eax
c01054e8:	e9 6a fc ff ff       	jmp    c0105157 <_malloc_r+0x77>
c01054ed:	8d 76 00             	lea    0x0(%esi),%esi
c01054f0:	89 fa                	mov    %edi,%edx
c01054f2:	83 c8 01             	or     $0x1,%eax
c01054f5:	83 ca 01             	or     $0x1,%edx
c01054f8:	89 53 04             	mov    %edx,0x4(%ebx)
c01054fb:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c01054fe:	89 15 c8 b5 10 c0    	mov    %edx,0xc010b5c8
c0105504:	89 42 04             	mov    %eax,0x4(%edx)
c0105507:	8b 45 08             	mov    0x8(%ebp),%eax
c010550a:	89 04 24             	mov    %eax,(%esp)
c010550d:	e8 be 03 00 00       	call   c01058d0 <__malloc_unlock>
c0105512:	83 c4 2c             	add    $0x2c,%esp
c0105515:	8d 43 08             	lea    0x8(%ebx),%eax
c0105518:	5b                   	pop    %ebx
c0105519:	5e                   	pop    %esi
c010551a:	5f                   	pop    %edi
c010551b:	5d                   	pop    %ebp
c010551c:	c3                   	ret    
c010551d:	8d 76 00             	lea    0x0(%esi),%esi
c0105520:	83 fe 14             	cmp    $0x14,%esi
c0105523:	0f 86 8f 01 00 00    	jbe    c01056b8 <_malloc_r+0x5d8>
c0105529:	83 fe 54             	cmp    $0x54,%esi
c010552c:	0f 87 be 01 00 00    	ja     c01056f0 <_malloc_r+0x610>
c0105532:	89 fe                	mov    %edi,%esi
c0105534:	c1 ee 0c             	shr    $0xc,%esi
c0105537:	83 c6 6e             	add    $0x6e,%esi
c010553a:	8d 04 36             	lea    (%esi,%esi,1),%eax
c010553d:	e9 5f fc ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c0105542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105548:	89 f1                	mov    %esi,%ecx
c010554a:	c1 e9 09             	shr    $0x9,%ecx
c010554d:	83 f9 04             	cmp    $0x4,%ecx
c0105550:	0f 86 6d 01 00 00    	jbe    c01056c3 <_malloc_r+0x5e3>
c0105556:	83 f9 14             	cmp    $0x14,%ecx
c0105559:	0f 87 0f 02 00 00    	ja     c010576e <_malloc_r+0x68e>
c010555f:	83 c1 5b             	add    $0x5b,%ecx
c0105562:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105565:	8d 04 85 c0 b5 10 c0 	lea    -0x3fef4a40(,%eax,4),%eax
c010556c:	8b 50 08             	mov    0x8(%eax),%edx
c010556f:	39 c2                	cmp    %eax,%edx
c0105571:	0f 84 a1 01 00 00    	je     c0105718 <_malloc_r+0x638>
c0105577:	90                   	nop
c0105578:	8b 4a 04             	mov    0x4(%edx),%ecx
c010557b:	83 e1 fc             	and    $0xfffffffc,%ecx
c010557e:	39 ce                	cmp    %ecx,%esi
c0105580:	73 07                	jae    c0105589 <_malloc_r+0x4a9>
c0105582:	8b 52 08             	mov    0x8(%edx),%edx
c0105585:	39 d0                	cmp    %edx,%eax
c0105587:	75 ef                	jne    c0105578 <_malloc_r+0x498>
c0105589:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010558c:	a1 c4 b5 10 c0       	mov    0xc010b5c4,%eax
c0105591:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0105594:	89 53 08             	mov    %edx,0x8(%ebx)
c0105597:	89 59 08             	mov    %ebx,0x8(%ecx)
c010559a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c010559d:	e9 bb fc ff ff       	jmp    c010525d <_malloc_r+0x17d>
c01055a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01055a8:	89 c1                	mov    %eax,%ecx
c01055aa:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c01055ad:	83 c9 01             	or     $0x1,%ecx
c01055b0:	83 cf 01             	or     $0x1,%edi
c01055b3:	89 7b 04             	mov    %edi,0x4(%ebx)
c01055b6:	89 15 d4 b5 10 c0    	mov    %edx,0xc010b5d4
c01055bc:	89 15 d0 b5 10 c0    	mov    %edx,0xc010b5d0
c01055c2:	c7 42 0c c8 b5 10 c0 	movl   $0xc010b5c8,0xc(%edx)
c01055c9:	c7 42 08 c8 b5 10 c0 	movl   $0xc010b5c8,0x8(%edx)
c01055d0:	89 4a 04             	mov    %ecx,0x4(%edx)
c01055d3:	89 04 02             	mov    %eax,(%edx,%eax,1)
c01055d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055d9:	89 04 24             	mov    %eax,(%esp)
c01055dc:	e8 ef 02 00 00       	call   c01058d0 <__malloc_unlock>
c01055e1:	8d 43 08             	lea    0x8(%ebx),%eax
c01055e4:	e9 6e fb ff ff       	jmp    c0105157 <_malloc_r+0x77>
c01055e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01055f0:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01055f3:	e9 af fc ff ff       	jmp    c01052a7 <_malloc_r+0x1c7>
c01055f8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01055fc:	83 c1 08             	add    $0x8,%ecx
c01055ff:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c0105603:	0f 85 ad fc ff ff    	jne    c01052b6 <_malloc_r+0x1d6>
c0105609:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010560c:	eb 12                	jmp    c0105620 <_malloc_r+0x540>
c010560e:	66 90                	xchg   %ax,%ax
c0105610:	8d 56 f8             	lea    -0x8(%esi),%edx
c0105613:	8b 36                	mov    (%esi),%esi
c0105615:	83 e8 01             	sub    $0x1,%eax
c0105618:	39 d6                	cmp    %edx,%esi
c010561a:	0f 85 ea 01 00 00    	jne    c010580a <_malloc_r+0x72a>
c0105620:	a8 03                	test   $0x3,%al
c0105622:	75 ec                	jne    c0105610 <_malloc_r+0x530>
c0105624:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105627:	f7 d0                	not    %eax
c0105629:	23 05 c4 b5 10 c0    	and    0xc010b5c4,%eax
c010562f:	a3 c4 b5 10 c0       	mov    %eax,0xc010b5c4
c0105634:	d1 65 dc             	shll   -0x24(%ebp)
c0105637:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010563a:	39 c2                	cmp    %eax,%edx
c010563c:	0f 87 26 fd ff ff    	ja     c0105368 <_malloc_r+0x288>
c0105642:	85 d2                	test   %edx,%edx
c0105644:	0f 84 1e fd ff ff    	je     c0105368 <_malloc_r+0x288>
c010564a:	85 c2                	test   %eax,%edx
c010564c:	0f 85 c2 01 00 00    	jne    c0105814 <_malloc_r+0x734>
c0105652:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0105655:	89 f1                	mov    %esi,%ecx
c0105657:	01 d2                	add    %edx,%edx
c0105659:	83 c1 04             	add    $0x4,%ecx
c010565c:	85 d0                	test   %edx,%eax
c010565e:	74 f7                	je     c0105657 <_malloc_r+0x577>
c0105660:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105663:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105666:	e9 3c fc ff ff       	jmp    c01052a7 <_malloc_r+0x1c7>
c010566b:	90                   	nop
c010566c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105670:	8d 43 08             	lea    0x8(%ebx),%eax
c0105673:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0105676:	39 d8                	cmp    %ebx,%eax
c0105678:	0f 85 b4 fa ff ff    	jne    c0105132 <_malloc_r+0x52>
c010567e:	8d 42 02             	lea    0x2(%edx),%eax
c0105681:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105684:	e9 56 fb ff ff       	jmp    c01051df <_malloc_r+0xff>
c0105689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105690:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0105695:	8b 53 08             	mov    0x8(%ebx),%edx
c0105698:	8b 43 0c             	mov    0xc(%ebx),%eax
c010569b:	89 42 0c             	mov    %eax,0xc(%edx)
c010569e:	89 50 08             	mov    %edx,0x8(%eax)
c01056a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01056a4:	89 04 24             	mov    %eax,(%esp)
c01056a7:	e8 24 02 00 00       	call   c01058d0 <__malloc_unlock>
c01056ac:	8d 43 08             	lea    0x8(%ebx),%eax
c01056af:	e9 a3 fa ff ff       	jmp    c0105157 <_malloc_r+0x77>
c01056b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01056b8:	83 c6 5b             	add    $0x5b,%esi
c01056bb:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01056be:	e9 de fa ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c01056c3:	89 f1                	mov    %esi,%ecx
c01056c5:	c1 e9 06             	shr    $0x6,%ecx
c01056c8:	83 c1 38             	add    $0x38,%ecx
c01056cb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01056ce:	e9 92 fe ff ff       	jmp    c0105565 <_malloc_r+0x485>
c01056d3:	81 fb c0 b5 10 c0    	cmp    $0xc010b5c0,%ebx
c01056d9:	0f 84 f2 fc ff ff    	je     c01053d1 <_malloc_r+0x2f1>
c01056df:	8b 1d c8 b5 10 c0    	mov    0xc010b5c8,%ebx
c01056e5:	8b 53 04             	mov    0x4(%ebx),%edx
c01056e8:	83 e2 fc             	and    $0xfffffffc,%edx
c01056eb:	e9 de fd ff ff       	jmp    c01054ce <_malloc_r+0x3ee>
c01056f0:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c01056f6:	77 3c                	ja     c0105734 <_malloc_r+0x654>
c01056f8:	89 fe                	mov    %edi,%esi
c01056fa:	c1 ee 0f             	shr    $0xf,%esi
c01056fd:	83 c6 77             	add    $0x77,%esi
c0105700:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105703:	e9 99 fa ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c0105708:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c010570f:	89 cb                	mov    %ecx,%ebx
c0105711:	31 d2                	xor    %edx,%edx
c0105713:	e9 b6 fd ff ff       	jmp    c01054ce <_malloc_r+0x3ee>
c0105718:	c1 f9 02             	sar    $0x2,%ecx
c010571b:	b8 01 00 00 00       	mov    $0x1,%eax
c0105720:	d3 e0                	shl    %cl,%eax
c0105722:	89 d1                	mov    %edx,%ecx
c0105724:	0b 05 c4 b5 10 c0    	or     0xc010b5c4,%eax
c010572a:	a3 c4 b5 10 c0       	mov    %eax,0xc010b5c4
c010572f:	e9 5d fe ff ff       	jmp    c0105591 <_malloc_r+0x4b1>
c0105734:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c010573a:	77 47                	ja     c0105783 <_malloc_r+0x6a3>
c010573c:	89 fe                	mov    %edi,%esi
c010573e:	c1 ee 12             	shr    $0x12,%esi
c0105741:	83 c6 7c             	add    $0x7c,%esi
c0105744:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105747:	e9 55 fa ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c010574c:	8b 45 08             	mov    0x8(%ebp),%eax
c010574f:	83 c3 08             	add    $0x8,%ebx
c0105752:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105756:	89 04 24             	mov    %eax,(%esp)
c0105759:	e8 52 22 00 00       	call   c01079b0 <_free_r>
c010575e:	8b 15 60 35 16 c0    	mov    0xc0163560,%edx
c0105764:	a1 c8 b5 10 c0       	mov    0xc010b5c8,%eax
c0105769:	e9 3c fd ff ff       	jmp    c01054aa <_malloc_r+0x3ca>
c010576e:	83 f9 54             	cmp    $0x54,%ecx
c0105771:	77 58                	ja     c01057cb <_malloc_r+0x6eb>
c0105773:	89 f1                	mov    %esi,%ecx
c0105775:	c1 e9 0c             	shr    $0xc,%ecx
c0105778:	83 c1 6e             	add    $0x6e,%ecx
c010577b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010577e:	e9 e2 fd ff ff       	jmp    c0105565 <_malloc_r+0x485>
c0105783:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105788:	be 7e 00 00 00       	mov    $0x7e,%esi
c010578d:	e9 0f fa ff ff       	jmp    c01051a1 <_malloc_r+0xc1>
c0105792:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c0105799:	0f 85 4a fc ff ff    	jne    c01053e9 <_malloc_r+0x309>
c010579f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01057a2:	a1 c8 b5 10 c0       	mov    0xc010b5c8,%eax
c01057a7:	01 f1                	add    %esi,%ecx
c01057a9:	83 c9 01             	or     $0x1,%ecx
c01057ac:	89 48 04             	mov    %ecx,0x4(%eax)
c01057af:	e9 f6 fc ff ff       	jmp    c01054aa <_malloc_r+0x3ca>
c01057b4:	b8 01 00 00 00       	mov    $0x1,%eax
c01057b9:	31 d2                	xor    %edx,%edx
c01057bb:	e9 91 fc ff ff       	jmp    c0105451 <_malloc_r+0x371>
c01057c0:	89 0d a0 b5 10 c0    	mov    %ecx,0xc010b5a0
c01057c6:	e9 37 fc ff ff       	jmp    c0105402 <_malloc_r+0x322>
c01057cb:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01057d1:	77 10                	ja     c01057e3 <_malloc_r+0x703>
c01057d3:	89 f1                	mov    %esi,%ecx
c01057d5:	c1 e9 0f             	shr    $0xf,%ecx
c01057d8:	83 c1 77             	add    $0x77,%ecx
c01057db:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01057de:	e9 82 fd ff ff       	jmp    c0105565 <_malloc_r+0x485>
c01057e3:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c01057e9:	77 10                	ja     c01057fb <_malloc_r+0x71b>
c01057eb:	89 f1                	mov    %esi,%ecx
c01057ed:	c1 e9 12             	shr    $0x12,%ecx
c01057f0:	83 c1 7c             	add    $0x7c,%ecx
c01057f3:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01057f6:	e9 6a fd ff ff       	jmp    c0105565 <_malloc_r+0x485>
c01057fb:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105800:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0105805:	e9 5b fd ff ff       	jmp    c0105565 <_malloc_r+0x485>
c010580a:	a1 c4 b5 10 c0       	mov    0xc010b5c4,%eax
c010580f:	e9 20 fe ff ff       	jmp    c0105634 <_malloc_r+0x554>
c0105814:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105817:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010581a:	e9 88 fa ff ff       	jmp    c01052a7 <_malloc_r+0x1c7>
c010581f:	90                   	nop

c0105820 <memchr>:
c0105820:	55                   	push   %ebp
c0105821:	89 e5                	mov    %esp,%ebp
c0105823:	57                   	push   %edi
c0105824:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0105828:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010582b:	8b 7d 08             	mov    0x8(%ebp),%edi
c010582e:	31 d2                	xor    %edx,%edx
c0105830:	85 c9                	test   %ecx,%ecx
c0105832:	74 79                	je     c01058ad <L20>
c0105834:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010583a:	74 28                	je     c0105864 <L5>
c010583c:	3a 07                	cmp    (%edi),%al
c010583e:	74 6a                	je     c01058aa <L15>
c0105840:	47                   	inc    %edi
c0105841:	49                   	dec    %ecx
c0105842:	74 69                	je     c01058ad <L20>
c0105844:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010584a:	74 18                	je     c0105864 <L5>
c010584c:	3a 07                	cmp    (%edi),%al
c010584e:	74 5a                	je     c01058aa <L15>
c0105850:	47                   	inc    %edi
c0105851:	49                   	dec    %ecx
c0105852:	74 59                	je     c01058ad <L20>
c0105854:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010585a:	74 08                	je     c0105864 <L5>
c010585c:	3a 07                	cmp    (%edi),%al
c010585e:	74 4a                	je     c01058aa <L15>
c0105860:	47                   	inc    %edi
c0105861:	49                   	dec    %ecx
c0105862:	74 49                	je     c01058ad <L20>

c0105864 <L5>:
c0105864:	88 c4                	mov    %al,%ah
c0105866:	89 c2                	mov    %eax,%edx
c0105868:	c1 e2 10             	shl    $0x10,%edx
c010586b:	09 d0                	or     %edx,%eax
c010586d:	53                   	push   %ebx
c010586e:	66 90                	xchg   %ax,%ax

c0105870 <L8>:
c0105870:	83 e9 04             	sub    $0x4,%ecx
c0105873:	72 1c                	jb     c0105891 <L9>
c0105875:	8b 17                	mov    (%edi),%edx
c0105877:	83 c7 04             	add    $0x4,%edi
c010587a:	31 c2                	xor    %eax,%edx
c010587c:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c0105882:	f7 d2                	not    %edx
c0105884:	21 d3                	and    %edx,%ebx
c0105886:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c010588c:	74 e2                	je     c0105870 <L8>
c010588e:	83 ef 04             	sub    $0x4,%edi

c0105891 <L9>:
c0105891:	5b                   	pop    %ebx
c0105892:	31 d2                	xor    %edx,%edx
c0105894:	83 c1 04             	add    $0x4,%ecx
c0105897:	74 14                	je     c01058ad <L20>
c0105899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01058a0 <L10>:
c01058a0:	3a 07                	cmp    (%edi),%al
c01058a2:	74 06                	je     c01058aa <L15>
c01058a4:	47                   	inc    %edi
c01058a5:	49                   	dec    %ecx
c01058a6:	75 f8                	jne    c01058a0 <L10>
c01058a8:	31 ff                	xor    %edi,%edi

c01058aa <L15>:
c01058aa:	4a                   	dec    %edx
c01058ab:	21 fa                	and    %edi,%edx

c01058ad <L20>:
c01058ad:	89 d0                	mov    %edx,%eax
c01058af:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01058b2:	5f                   	pop    %edi
c01058b3:	c9                   	leave  
c01058b4:	c3                   	ret    
c01058b5:	66 90                	xchg   %ax,%ax
c01058b7:	66 90                	xchg   %ax,%ax
c01058b9:	66 90                	xchg   %ax,%ax
c01058bb:	66 90                	xchg   %ax,%ax
c01058bd:	66 90                	xchg   %ax,%ax
c01058bf:	90                   	nop

c01058c0 <__malloc_lock>:
c01058c0:	55                   	push   %ebp
c01058c1:	89 e5                	mov    %esp,%ebp
c01058c3:	5d                   	pop    %ebp
c01058c4:	c3                   	ret    
c01058c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01058c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01058d0 <__malloc_unlock>:
c01058d0:	55                   	push   %ebp
c01058d1:	89 e5                	mov    %esp,%ebp
c01058d3:	5d                   	pop    %ebp
c01058d4:	c3                   	ret    
c01058d5:	66 90                	xchg   %ax,%ax
c01058d7:	66 90                	xchg   %ax,%ax
c01058d9:	66 90                	xchg   %ax,%ax
c01058db:	66 90                	xchg   %ax,%ax
c01058dd:	66 90                	xchg   %ax,%ax
c01058df:	90                   	nop

c01058e0 <_Balloc>:
c01058e0:	55                   	push   %ebp
c01058e1:	89 e5                	mov    %esp,%ebp
c01058e3:	57                   	push   %edi
c01058e4:	56                   	push   %esi
c01058e5:	53                   	push   %ebx
c01058e6:	83 ec 1c             	sub    $0x1c,%esp
c01058e9:	8b 75 08             	mov    0x8(%ebp),%esi
c01058ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01058ef:	8b 46 4c             	mov    0x4c(%esi),%eax
c01058f2:	85 c0                	test   %eax,%eax
c01058f4:	74 2a                	je     c0105920 <_Balloc+0x40>
c01058f6:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c01058f9:	8b 02                	mov    (%edx),%eax
c01058fb:	85 c0                	test   %eax,%eax
c01058fd:	74 49                	je     c0105948 <_Balloc+0x68>
c01058ff:	8b 08                	mov    (%eax),%ecx
c0105901:	89 0a                	mov    %ecx,(%edx)
c0105903:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c010590a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0105911:	83 c4 1c             	add    $0x1c,%esp
c0105914:	5b                   	pop    %ebx
c0105915:	5e                   	pop    %esi
c0105916:	5f                   	pop    %edi
c0105917:	5d                   	pop    %ebp
c0105918:	c3                   	ret    
c0105919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105920:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0105927:	00 
c0105928:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010592f:	00 
c0105930:	89 34 24             	mov    %esi,(%esp)
c0105933:	e8 c8 1e 00 00       	call   c0107800 <_calloc_r>
c0105938:	85 c0                	test   %eax,%eax
c010593a:	89 46 4c             	mov    %eax,0x4c(%esi)
c010593d:	75 b7                	jne    c01058f6 <_Balloc+0x16>
c010593f:	31 c0                	xor    %eax,%eax
c0105941:	eb ce                	jmp    c0105911 <_Balloc+0x31>
c0105943:	90                   	nop
c0105944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105948:	89 d9                	mov    %ebx,%ecx
c010594a:	bf 01 00 00 00       	mov    $0x1,%edi
c010594f:	d3 e7                	shl    %cl,%edi
c0105951:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c0105958:	89 44 24 08          	mov    %eax,0x8(%esp)
c010595c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105963:	00 
c0105964:	89 34 24             	mov    %esi,(%esp)
c0105967:	e8 94 1e 00 00       	call   c0107800 <_calloc_r>
c010596c:	85 c0                	test   %eax,%eax
c010596e:	74 cf                	je     c010593f <_Balloc+0x5f>
c0105970:	89 58 04             	mov    %ebx,0x4(%eax)
c0105973:	89 78 08             	mov    %edi,0x8(%eax)
c0105976:	eb 8b                	jmp    c0105903 <_Balloc+0x23>
c0105978:	90                   	nop
c0105979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105980 <_Bfree>:
c0105980:	55                   	push   %ebp
c0105981:	89 e5                	mov    %esp,%ebp
c0105983:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105986:	85 c0                	test   %eax,%eax
c0105988:	74 12                	je     c010599c <_Bfree+0x1c>
c010598a:	8b 55 08             	mov    0x8(%ebp),%edx
c010598d:	8b 48 04             	mov    0x4(%eax),%ecx
c0105990:	8b 52 4c             	mov    0x4c(%edx),%edx
c0105993:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c0105996:	8b 0a                	mov    (%edx),%ecx
c0105998:	89 08                	mov    %ecx,(%eax)
c010599a:	89 02                	mov    %eax,(%edx)
c010599c:	5d                   	pop    %ebp
c010599d:	c3                   	ret    
c010599e:	66 90                	xchg   %ax,%ax

c01059a0 <__multadd>:
c01059a0:	55                   	push   %ebp
c01059a1:	89 e5                	mov    %esp,%ebp
c01059a3:	57                   	push   %edi
c01059a4:	56                   	push   %esi
c01059a5:	53                   	push   %ebx
c01059a6:	83 ec 2c             	sub    $0x2c,%esp
c01059a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059ac:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01059af:	8b 40 10             	mov    0x10(%eax),%eax
c01059b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059b8:	8d 78 14             	lea    0x14(%eax),%edi
c01059bb:	31 c0                	xor    %eax,%eax
c01059bd:	8d 76 00             	lea    0x0(%esi),%esi
c01059c0:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c01059c3:	0f b7 d1             	movzwl %cx,%edx
c01059c6:	0f af 55 10          	imul   0x10(%ebp),%edx
c01059ca:	c1 e9 10             	shr    $0x10,%ecx
c01059cd:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c01059d1:	01 da                	add    %ebx,%edx
c01059d3:	89 d3                	mov    %edx,%ebx
c01059d5:	0f b7 d2             	movzwl %dx,%edx
c01059d8:	c1 eb 10             	shr    $0x10,%ebx
c01059db:	01 d9                	add    %ebx,%ecx
c01059dd:	89 ce                	mov    %ecx,%esi
c01059df:	c1 e1 10             	shl    $0x10,%ecx
c01059e2:	01 d1                	add    %edx,%ecx
c01059e4:	c1 ee 10             	shr    $0x10,%esi
c01059e7:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c01059ea:	83 c0 01             	add    $0x1,%eax
c01059ed:	89 f3                	mov    %esi,%ebx
c01059ef:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01059f2:	7f cc                	jg     c01059c0 <__multadd+0x20>
c01059f4:	85 f6                	test   %esi,%esi
c01059f6:	74 1b                	je     c0105a13 <__multadd+0x73>
c01059f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c01059fe:	3b 78 08             	cmp    0x8(%eax),%edi
c0105a01:	7d 1d                	jge    c0105a20 <__multadd+0x80>
c0105a03:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105a06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105a09:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c0105a0d:	83 c0 01             	add    $0x1,%eax
c0105a10:	89 47 10             	mov    %eax,0x10(%edi)
c0105a13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a16:	83 c4 2c             	add    $0x2c,%esp
c0105a19:	5b                   	pop    %ebx
c0105a1a:	5e                   	pop    %esi
c0105a1b:	5f                   	pop    %edi
c0105a1c:	5d                   	pop    %ebp
c0105a1d:	c3                   	ret    
c0105a1e:	66 90                	xchg   %ax,%ax
c0105a20:	8b 40 04             	mov    0x4(%eax),%eax
c0105a23:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105a26:	83 c0 01             	add    $0x1,%eax
c0105a29:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105a2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a30:	89 04 24             	mov    %eax,(%esp)
c0105a33:	e8 a8 fe ff ff       	call   c01058e0 <_Balloc>
c0105a38:	89 c3                	mov    %eax,%ebx
c0105a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a3d:	8b 40 10             	mov    0x10(%eax),%eax
c0105a40:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0105a47:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105a4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a4e:	83 c0 0c             	add    $0xc,%eax
c0105a51:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105a55:	8d 43 0c             	lea    0xc(%ebx),%eax
c0105a58:	89 04 24             	mov    %eax,(%esp)
c0105a5b:	e8 60 c0 ff ff       	call   c0101ac0 <memcpy>
c0105a60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a63:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105a66:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0105a69:	8b 50 04             	mov    0x4(%eax),%edx
c0105a6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a6f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105a72:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105a75:	8b 10                	mov    (%eax),%edx
c0105a77:	89 17                	mov    %edx,(%edi)
c0105a79:	89 38                	mov    %edi,(%eax)
c0105a7b:	eb 86                	jmp    c0105a03 <__multadd+0x63>
c0105a7d:	8d 76 00             	lea    0x0(%esi),%esi

c0105a80 <__s2b>:
c0105a80:	55                   	push   %ebp
c0105a81:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c0105a86:	89 e5                	mov    %esp,%ebp
c0105a88:	57                   	push   %edi
c0105a89:	56                   	push   %esi
c0105a8a:	53                   	push   %ebx
c0105a8b:	83 ec 2c             	sub    $0x2c,%esp
c0105a8e:	8b 45 14             	mov    0x14(%ebp),%eax
c0105a91:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105a94:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105a97:	8d 48 08             	lea    0x8(%eax),%ecx
c0105a9a:	89 c8                	mov    %ecx,%eax
c0105a9c:	f7 ea                	imul   %edx
c0105a9e:	c1 f9 1f             	sar    $0x1f,%ecx
c0105aa1:	d1 fa                	sar    %edx
c0105aa3:	29 ca                	sub    %ecx,%edx
c0105aa5:	83 fa 01             	cmp    $0x1,%edx
c0105aa8:	0f 8e be 00 00 00    	jle    c0105b6c <__s2b+0xec>
c0105aae:	b8 01 00 00 00       	mov    $0x1,%eax
c0105ab3:	31 c9                	xor    %ecx,%ecx
c0105ab5:	8d 76 00             	lea    0x0(%esi),%esi
c0105ab8:	01 c0                	add    %eax,%eax
c0105aba:	83 c1 01             	add    $0x1,%ecx
c0105abd:	39 c2                	cmp    %eax,%edx
c0105abf:	7f f7                	jg     c0105ab8 <__s2b+0x38>
c0105ac1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0105ac5:	89 1c 24             	mov    %ebx,(%esp)
c0105ac8:	e8 13 fe ff ff       	call   c01058e0 <_Balloc>
c0105acd:	8b 55 18             	mov    0x18(%ebp),%edx
c0105ad0:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c0105ad4:	89 50 14             	mov    %edx,0x14(%eax)
c0105ad7:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105ade:	0f 8e 7c 00 00 00    	jle    c0105b60 <__s2b+0xe0>
c0105ae4:	8d 4e 09             	lea    0x9(%esi),%ecx
c0105ae7:	03 75 10             	add    0x10(%ebp),%esi
c0105aea:	89 cf                	mov    %ecx,%edi
c0105aec:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105aef:	90                   	nop
c0105af0:	83 c7 01             	add    $0x1,%edi
c0105af3:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c0105af7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0105afe:	00 
c0105aff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105b03:	89 1c 24             	mov    %ebx,(%esp)
c0105b06:	83 ea 30             	sub    $0x30,%edx
c0105b09:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0105b0d:	e8 8e fe ff ff       	call   c01059a0 <__multadd>
c0105b12:	39 f7                	cmp    %esi,%edi
c0105b14:	75 da                	jne    c0105af0 <__s2b+0x70>
c0105b16:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105b19:	8b 7d 10             	mov    0x10(%ebp),%edi
c0105b1c:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c0105b20:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0105b23:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c0105b26:	7e 2e                	jle    c0105b56 <__s2b+0xd6>
c0105b28:	8b 7d 14             	mov    0x14(%ebp),%edi
c0105b2b:	29 cf                	sub    %ecx,%edi
c0105b2d:	01 f7                	add    %esi,%edi
c0105b2f:	90                   	nop
c0105b30:	83 c6 01             	add    $0x1,%esi
c0105b33:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c0105b37:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0105b3e:	00 
c0105b3f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105b43:	89 1c 24             	mov    %ebx,(%esp)
c0105b46:	83 ea 30             	sub    $0x30,%edx
c0105b49:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0105b4d:	e8 4e fe ff ff       	call   c01059a0 <__multadd>
c0105b52:	39 fe                	cmp    %edi,%esi
c0105b54:	75 da                	jne    c0105b30 <__s2b+0xb0>
c0105b56:	83 c4 2c             	add    $0x2c,%esp
c0105b59:	5b                   	pop    %ebx
c0105b5a:	5e                   	pop    %esi
c0105b5b:	5f                   	pop    %edi
c0105b5c:	5d                   	pop    %ebp
c0105b5d:	c3                   	ret    
c0105b5e:	66 90                	xchg   %ax,%ax
c0105b60:	83 c6 0a             	add    $0xa,%esi
c0105b63:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c0105b6a:	eb b4                	jmp    c0105b20 <__s2b+0xa0>
c0105b6c:	31 c9                	xor    %ecx,%ecx
c0105b6e:	e9 4e ff ff ff       	jmp    c0105ac1 <__s2b+0x41>
c0105b73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105b80 <__hi0bits>:
c0105b80:	55                   	push   %ebp
c0105b81:	31 c9                	xor    %ecx,%ecx
c0105b83:	89 e5                	mov    %esp,%ebp
c0105b85:	8b 55 08             	mov    0x8(%ebp),%edx
c0105b88:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c0105b8e:	75 05                	jne    c0105b95 <__hi0bits+0x15>
c0105b90:	c1 e2 10             	shl    $0x10,%edx
c0105b93:	b1 10                	mov    $0x10,%cl
c0105b95:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c0105b9b:	75 06                	jne    c0105ba3 <__hi0bits+0x23>
c0105b9d:	83 c1 08             	add    $0x8,%ecx
c0105ba0:	c1 e2 08             	shl    $0x8,%edx
c0105ba3:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c0105ba9:	75 06                	jne    c0105bb1 <__hi0bits+0x31>
c0105bab:	83 c1 04             	add    $0x4,%ecx
c0105bae:	c1 e2 04             	shl    $0x4,%edx
c0105bb1:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c0105bb7:	75 06                	jne    c0105bbf <__hi0bits+0x3f>
c0105bb9:	83 c1 02             	add    $0x2,%ecx
c0105bbc:	c1 e2 02             	shl    $0x2,%edx
c0105bbf:	85 d2                	test   %edx,%edx
c0105bc1:	89 c8                	mov    %ecx,%eax
c0105bc3:	78 0d                	js     c0105bd2 <__hi0bits+0x52>
c0105bc5:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c0105bcb:	b8 20 00 00 00       	mov    $0x20,%eax
c0105bd0:	75 06                	jne    c0105bd8 <__hi0bits+0x58>
c0105bd2:	5d                   	pop    %ebp
c0105bd3:	c3                   	ret    
c0105bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105bd8:	8d 41 01             	lea    0x1(%ecx),%eax
c0105bdb:	5d                   	pop    %ebp
c0105bdc:	c3                   	ret    
c0105bdd:	8d 76 00             	lea    0x0(%esi),%esi

c0105be0 <__lo0bits>:
c0105be0:	55                   	push   %ebp
c0105be1:	89 e5                	mov    %esp,%ebp
c0105be3:	53                   	push   %ebx
c0105be4:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105be7:	8b 13                	mov    (%ebx),%edx
c0105be9:	f6 c2 07             	test   $0x7,%dl
c0105bec:	74 1a                	je     c0105c08 <__lo0bits+0x28>
c0105bee:	31 c0                	xor    %eax,%eax
c0105bf0:	f6 c2 01             	test   $0x1,%dl
c0105bf3:	75 0f                	jne    c0105c04 <__lo0bits+0x24>
c0105bf5:	f6 c2 02             	test   $0x2,%dl
c0105bf8:	75 56                	jne    c0105c50 <__lo0bits+0x70>
c0105bfa:	c1 ea 02             	shr    $0x2,%edx
c0105bfd:	b8 02 00 00 00       	mov    $0x2,%eax
c0105c02:	89 13                	mov    %edx,(%ebx)
c0105c04:	5b                   	pop    %ebx
c0105c05:	5d                   	pop    %ebp
c0105c06:	c3                   	ret    
c0105c07:	90                   	nop
c0105c08:	31 c9                	xor    %ecx,%ecx
c0105c0a:	66 85 d2             	test   %dx,%dx
c0105c0d:	75 05                	jne    c0105c14 <__lo0bits+0x34>
c0105c0f:	c1 ea 10             	shr    $0x10,%edx
c0105c12:	b1 10                	mov    $0x10,%cl
c0105c14:	84 d2                	test   %dl,%dl
c0105c16:	75 06                	jne    c0105c1e <__lo0bits+0x3e>
c0105c18:	83 c1 08             	add    $0x8,%ecx
c0105c1b:	c1 ea 08             	shr    $0x8,%edx
c0105c1e:	f6 c2 0f             	test   $0xf,%dl
c0105c21:	75 06                	jne    c0105c29 <__lo0bits+0x49>
c0105c23:	83 c1 04             	add    $0x4,%ecx
c0105c26:	c1 ea 04             	shr    $0x4,%edx
c0105c29:	f6 c2 03             	test   $0x3,%dl
c0105c2c:	75 06                	jne    c0105c34 <__lo0bits+0x54>
c0105c2e:	83 c1 02             	add    $0x2,%ecx
c0105c31:	c1 ea 02             	shr    $0x2,%edx
c0105c34:	f6 c2 01             	test   $0x1,%dl
c0105c37:	75 0c                	jne    c0105c45 <__lo0bits+0x65>
c0105c39:	d1 ea                	shr    %edx
c0105c3b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105c40:	74 c2                	je     c0105c04 <__lo0bits+0x24>
c0105c42:	83 c1 01             	add    $0x1,%ecx
c0105c45:	89 13                	mov    %edx,(%ebx)
c0105c47:	89 c8                	mov    %ecx,%eax
c0105c49:	5b                   	pop    %ebx
c0105c4a:	5d                   	pop    %ebp
c0105c4b:	c3                   	ret    
c0105c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105c50:	d1 ea                	shr    %edx
c0105c52:	b0 01                	mov    $0x1,%al
c0105c54:	89 13                	mov    %edx,(%ebx)
c0105c56:	5b                   	pop    %ebx
c0105c57:	5d                   	pop    %ebp
c0105c58:	c3                   	ret    
c0105c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105c60 <__i2b>:
c0105c60:	55                   	push   %ebp
c0105c61:	89 e5                	mov    %esp,%ebp
c0105c63:	83 ec 18             	sub    $0x18,%esp
c0105c66:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c69:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105c70:	00 
c0105c71:	89 04 24             	mov    %eax,(%esp)
c0105c74:	e8 67 fc ff ff       	call   c01058e0 <_Balloc>
c0105c79:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105c7c:	89 50 14             	mov    %edx,0x14(%eax)
c0105c7f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105c86:	c9                   	leave  
c0105c87:	c3                   	ret    
c0105c88:	90                   	nop
c0105c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105c90 <__multiply>:
c0105c90:	55                   	push   %ebp
c0105c91:	89 e5                	mov    %esp,%ebp
c0105c93:	57                   	push   %edi
c0105c94:	56                   	push   %esi
c0105c95:	53                   	push   %ebx
c0105c96:	83 ec 3c             	sub    $0x3c,%esp
c0105c99:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105c9c:	8b 45 10             	mov    0x10(%ebp),%eax
c0105c9f:	8b 7e 10             	mov    0x10(%esi),%edi
c0105ca2:	8b 58 10             	mov    0x10(%eax),%ebx
c0105ca5:	39 df                	cmp    %ebx,%edi
c0105ca7:	7d 0e                	jge    c0105cb7 <__multiply+0x27>
c0105ca9:	89 f8                	mov    %edi,%eax
c0105cab:	89 df                	mov    %ebx,%edi
c0105cad:	89 c3                	mov    %eax,%ebx
c0105caf:	89 f0                	mov    %esi,%eax
c0105cb1:	8b 75 10             	mov    0x10(%ebp),%esi
c0105cb4:	89 45 10             	mov    %eax,0x10(%ebp)
c0105cb7:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c0105cba:	3b 46 08             	cmp    0x8(%esi),%eax
c0105cbd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105cc0:	0f 9f c0             	setg   %al
c0105cc3:	0f b6 c0             	movzbl %al,%eax
c0105cc6:	03 46 04             	add    0x4(%esi),%eax
c0105cc9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105ccd:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cd0:	89 04 24             	mov    %eax,(%esp)
c0105cd3:	e8 08 fc ff ff       	call   c01058e0 <_Balloc>
c0105cd8:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105cdb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105cde:	8d 40 14             	lea    0x14(%eax),%eax
c0105ce1:	8d 14 90             	lea    (%eax,%edx,4),%edx
c0105ce4:	89 d1                	mov    %edx,%ecx
c0105ce6:	39 c8                	cmp    %ecx,%eax
c0105ce8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ceb:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0105cee:	73 15                	jae    c0105d05 <__multiply+0x75>
c0105cf0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105cf3:	90                   	nop
c0105cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105cf8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105cfe:	83 c0 04             	add    $0x4,%eax
c0105d01:	39 c2                	cmp    %eax,%edx
c0105d03:	77 f3                	ja     c0105cf8 <__multiply+0x68>
c0105d05:	8d 46 14             	lea    0x14(%esi),%eax
c0105d08:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105d0b:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c0105d0e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105d11:	8b 45 10             	mov    0x10(%ebp),%eax
c0105d14:	83 c0 14             	add    $0x14,%eax
c0105d17:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c0105d1a:	39 f8                	cmp    %edi,%eax
c0105d1c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105d1f:	89 7d cc             	mov    %edi,-0x34(%ebp)
c0105d22:	0f 83 e8 00 00 00    	jae    c0105e10 <__multiply+0x180>
c0105d28:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105d2b:	8b 00                	mov    (%eax),%eax
c0105d2d:	0f b7 f8             	movzwl %ax,%edi
c0105d30:	85 ff                	test   %edi,%edi
c0105d32:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105d35:	74 5a                	je     c0105d91 <__multiply+0x101>
c0105d37:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0105d3a:	31 db                	xor    %ebx,%ebx
c0105d3c:	8b 75 d0             	mov    -0x30(%ebp),%esi
c0105d3f:	eb 09                	jmp    c0105d4a <__multiply+0xba>
c0105d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105d48:	89 fa                	mov    %edi,%edx
c0105d4a:	8b 0e                	mov    (%esi),%ecx
c0105d4c:	83 c6 04             	add    $0x4,%esi
c0105d4f:	0f b7 3a             	movzwl (%edx),%edi
c0105d52:	0f b7 c1             	movzwl %cx,%eax
c0105d55:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c0105d59:	c1 e9 10             	shr    $0x10,%ecx
c0105d5c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105d60:	01 f8                	add    %edi,%eax
c0105d62:	01 d8                	add    %ebx,%eax
c0105d64:	8b 1a                	mov    (%edx),%ebx
c0105d66:	8d 7a 04             	lea    0x4(%edx),%edi
c0105d69:	c1 eb 10             	shr    $0x10,%ebx
c0105d6c:	01 d9                	add    %ebx,%ecx
c0105d6e:	89 c3                	mov    %eax,%ebx
c0105d70:	c1 eb 10             	shr    $0x10,%ebx
c0105d73:	0f b7 c0             	movzwl %ax,%eax
c0105d76:	01 d9                	add    %ebx,%ecx
c0105d78:	89 cb                	mov    %ecx,%ebx
c0105d7a:	c1 e1 10             	shl    $0x10,%ecx
c0105d7d:	09 c1                	or     %eax,%ecx
c0105d7f:	c1 eb 10             	shr    $0x10,%ebx
c0105d82:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c0105d85:	89 0a                	mov    %ecx,(%edx)
c0105d87:	77 bf                	ja     c0105d48 <__multiply+0xb8>
c0105d89:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105d8c:	89 5a 04             	mov    %ebx,0x4(%edx)
c0105d8f:	8b 00                	mov    (%eax),%eax
c0105d91:	c1 e8 10             	shr    $0x10,%eax
c0105d94:	85 c0                	test   %eax,%eax
c0105d96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d99:	74 61                	je     c0105dfc <__multiply+0x16c>
c0105d9b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105d9e:	31 ff                	xor    %edi,%edi
c0105da0:	89 fe                	mov    %edi,%esi
c0105da2:	8b 10                	mov    (%eax),%edx
c0105da4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105da7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105daa:	89 d3                	mov    %edx,%ebx
c0105dac:	eb 05                	jmp    c0105db3 <__multiply+0x123>
c0105dae:	66 90                	xchg   %ax,%ax
c0105db0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0105db3:	0f b7 08             	movzwl (%eax),%ecx
c0105db6:	c1 eb 10             	shr    $0x10,%ebx
c0105db9:	0f b7 d2             	movzwl %dx,%edx
c0105dbc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105dc0:	83 c0 04             	add    $0x4,%eax
c0105dc3:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c0105dc6:	01 f7                	add    %esi,%edi
c0105dc8:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0105dcb:	89 fb                	mov    %edi,%ebx
c0105dcd:	c1 e3 10             	shl    $0x10,%ebx
c0105dd0:	09 d3                	or     %edx,%ebx
c0105dd2:	89 1e                	mov    %ebx,(%esi)
c0105dd4:	8b 5e 04             	mov    0x4(%esi),%ebx
c0105dd7:	8d 4e 04             	lea    0x4(%esi),%ecx
c0105dda:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c0105dde:	c1 ef 10             	shr    $0x10,%edi
c0105de1:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c0105de5:	0f b7 f3             	movzwl %bx,%esi
c0105de8:	01 f2                	add    %esi,%edx
c0105dea:	01 fa                	add    %edi,%edx
c0105dec:	89 d6                	mov    %edx,%esi
c0105dee:	c1 ee 10             	shr    $0x10,%esi
c0105df1:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0105df4:	77 ba                	ja     c0105db0 <__multiply+0x120>
c0105df6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105df9:	89 50 04             	mov    %edx,0x4(%eax)
c0105dfc:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c0105e00:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105e03:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0105e07:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c0105e0a:	0f 87 18 ff ff ff    	ja     c0105d28 <__multiply+0x98>
c0105e10:	8b 75 c8             	mov    -0x38(%ebp),%esi
c0105e13:	85 f6                	test   %esi,%esi
c0105e15:	7e 29                	jle    c0105e40 <__multiply+0x1b0>
c0105e17:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0105e1a:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0105e1d:	85 db                	test   %ebx,%ebx
c0105e1f:	75 1f                	jne    c0105e40 <__multiply+0x1b0>
c0105e21:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105e24:	89 d0                	mov    %edx,%eax
c0105e26:	c1 e0 02             	shl    $0x2,%eax
c0105e29:	29 c7                	sub    %eax,%edi
c0105e2b:	89 f8                	mov    %edi,%eax
c0105e2d:	eb 09                	jmp    c0105e38 <__multiply+0x1a8>
c0105e2f:	90                   	nop
c0105e30:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105e34:	85 c9                	test   %ecx,%ecx
c0105e36:	75 05                	jne    c0105e3d <__multiply+0x1ad>
c0105e38:	83 ea 01             	sub    $0x1,%edx
c0105e3b:	75 f3                	jne    c0105e30 <__multiply+0x1a0>
c0105e3d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105e40:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105e43:	8b 7d c8             	mov    -0x38(%ebp),%edi
c0105e46:	89 78 10             	mov    %edi,0x10(%eax)
c0105e49:	83 c4 3c             	add    $0x3c,%esp
c0105e4c:	5b                   	pop    %ebx
c0105e4d:	5e                   	pop    %esi
c0105e4e:	5f                   	pop    %edi
c0105e4f:	5d                   	pop    %ebp
c0105e50:	c3                   	ret    
c0105e51:	eb 0d                	jmp    c0105e60 <__pow5mult>
c0105e53:	90                   	nop
c0105e54:	90                   	nop
c0105e55:	90                   	nop
c0105e56:	90                   	nop
c0105e57:	90                   	nop
c0105e58:	90                   	nop
c0105e59:	90                   	nop
c0105e5a:	90                   	nop
c0105e5b:	90                   	nop
c0105e5c:	90                   	nop
c0105e5d:	90                   	nop
c0105e5e:	90                   	nop
c0105e5f:	90                   	nop

c0105e60 <__pow5mult>:
c0105e60:	55                   	push   %ebp
c0105e61:	89 e5                	mov    %esp,%ebp
c0105e63:	57                   	push   %edi
c0105e64:	56                   	push   %esi
c0105e65:	53                   	push   %ebx
c0105e66:	83 ec 2c             	sub    $0x2c,%esp
c0105e69:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105e6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0105e6f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105e72:	89 d8                	mov    %ebx,%eax
c0105e74:	83 e0 03             	and    $0x3,%eax
c0105e77:	0f 85 a3 00 00 00    	jne    c0105f20 <__pow5mult+0xc0>
c0105e7d:	c1 fb 02             	sar    $0x2,%ebx
c0105e80:	85 db                	test   %ebx,%ebx
c0105e82:	74 5c                	je     c0105ee0 <__pow5mult+0x80>
c0105e84:	8b 71 48             	mov    0x48(%ecx),%esi
c0105e87:	85 f6                	test   %esi,%esi
c0105e89:	0f 84 bd 00 00 00    	je     c0105f4c <__pow5mult+0xec>
c0105e8f:	f6 c3 01             	test   $0x1,%bl
c0105e92:	75 15                	jne    c0105ea9 <__pow5mult+0x49>
c0105e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105e98:	d1 fb                	sar    %ebx
c0105e9a:	74 44                	je     c0105ee0 <__pow5mult+0x80>
c0105e9c:	8b 06                	mov    (%esi),%eax
c0105e9e:	85 c0                	test   %eax,%eax
c0105ea0:	74 4e                	je     c0105ef0 <__pow5mult+0x90>
c0105ea2:	89 c6                	mov    %eax,%esi
c0105ea4:	f6 c3 01             	test   $0x1,%bl
c0105ea7:	74 ef                	je     c0105e98 <__pow5mult+0x38>
c0105ea9:	89 0c 24             	mov    %ecx,(%esp)
c0105eac:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105eb0:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0105eb4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105eb7:	e8 d4 fd ff ff       	call   c0105c90 <__multiply>
c0105ebc:	85 ff                	test   %edi,%edi
c0105ebe:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105ec1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ec4:	74 52                	je     c0105f18 <__pow5mult+0xb8>
c0105ec6:	8b 57 04             	mov    0x4(%edi),%edx
c0105ec9:	d1 fb                	sar    %ebx
c0105ecb:	8b 41 4c             	mov    0x4c(%ecx),%eax
c0105ece:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105ed1:	8b 10                	mov    (%eax),%edx
c0105ed3:	89 17                	mov    %edx,(%edi)
c0105ed5:	89 38                	mov    %edi,(%eax)
c0105ed7:	8b 7d e0             	mov    -0x20(%ebp),%edi
c0105eda:	75 c0                	jne    c0105e9c <__pow5mult+0x3c>
c0105edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ee0:	83 c4 2c             	add    $0x2c,%esp
c0105ee3:	89 f8                	mov    %edi,%eax
c0105ee5:	5b                   	pop    %ebx
c0105ee6:	5e                   	pop    %esi
c0105ee7:	5f                   	pop    %edi
c0105ee8:	5d                   	pop    %ebp
c0105ee9:	c3                   	ret    
c0105eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105ef0:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105ef4:	89 74 24 04          	mov    %esi,0x4(%esp)
c0105ef8:	89 0c 24             	mov    %ecx,(%esp)
c0105efb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105efe:	e8 8d fd ff ff       	call   c0105c90 <__multiply>
c0105f03:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105f06:	89 06                	mov    %eax,(%esi)
c0105f08:	89 c6                	mov    %eax,%esi
c0105f0a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105f10:	eb 92                	jmp    c0105ea4 <__pow5mult+0x44>
c0105f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105f18:	8b 7d e0             	mov    -0x20(%ebp),%edi
c0105f1b:	e9 78 ff ff ff       	jmp    c0105e98 <__pow5mult+0x38>
c0105f20:	8b 04 85 3c 8d 10 c0 	mov    -0x3fef72c4(,%eax,4),%eax
c0105f27:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0105f2b:	89 0c 24             	mov    %ecx,(%esp)
c0105f2e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0105f35:	00 
c0105f36:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105f3a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105f3d:	e8 5e fa ff ff       	call   c01059a0 <__multadd>
c0105f42:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105f45:	89 c7                	mov    %eax,%edi
c0105f47:	e9 31 ff ff ff       	jmp    c0105e7d <__pow5mult+0x1d>
c0105f4c:	89 0c 24             	mov    %ecx,(%esp)
c0105f4f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105f56:	00 
c0105f57:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105f5a:	e8 81 f9 ff ff       	call   c01058e0 <_Balloc>
c0105f5f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105f62:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c0105f69:	89 c6                	mov    %eax,%esi
c0105f6b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105f72:	89 41 48             	mov    %eax,0x48(%ecx)
c0105f75:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105f7b:	e9 0f ff ff ff       	jmp    c0105e8f <__pow5mult+0x2f>

c0105f80 <__lshift>:
c0105f80:	55                   	push   %ebp
c0105f81:	89 e5                	mov    %esp,%ebp
c0105f83:	57                   	push   %edi
c0105f84:	56                   	push   %esi
c0105f85:	53                   	push   %ebx
c0105f86:	83 ec 2c             	sub    $0x2c,%esp
c0105f89:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f8c:	8b 75 10             	mov    0x10(%ebp),%esi
c0105f8f:	89 c7                	mov    %eax,%edi
c0105f91:	8b 50 04             	mov    0x4(%eax),%edx
c0105f94:	8b 40 10             	mov    0x10(%eax),%eax
c0105f97:	89 f3                	mov    %esi,%ebx
c0105f99:	c1 fb 05             	sar    $0x5,%ebx
c0105f9c:	01 d8                	add    %ebx,%eax
c0105f9e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105fa1:	83 c0 01             	add    $0x1,%eax
c0105fa4:	89 c1                	mov    %eax,%ecx
c0105fa6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fa9:	8b 47 08             	mov    0x8(%edi),%eax
c0105fac:	39 c1                	cmp    %eax,%ecx
c0105fae:	7e 09                	jle    c0105fb9 <__lshift+0x39>
c0105fb0:	01 c0                	add    %eax,%eax
c0105fb2:	83 c2 01             	add    $0x1,%edx
c0105fb5:	39 c1                	cmp    %eax,%ecx
c0105fb7:	7f f7                	jg     c0105fb0 <__lshift+0x30>
c0105fb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fbc:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105fc0:	89 04 24             	mov    %eax,(%esp)
c0105fc3:	e8 18 f9 ff ff       	call   c01058e0 <_Balloc>
c0105fc8:	85 db                	test   %ebx,%ebx
c0105fca:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105fcd:	8d 50 14             	lea    0x14(%eax),%edx
c0105fd0:	7e 17                	jle    c0105fe9 <__lshift+0x69>
c0105fd2:	31 c0                	xor    %eax,%eax
c0105fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fd8:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c0105fdf:	83 c0 01             	add    $0x1,%eax
c0105fe2:	39 d8                	cmp    %ebx,%eax
c0105fe4:	75 f2                	jne    c0105fd8 <__lshift+0x58>
c0105fe6:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0105fe9:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105fec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fef:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105ff2:	83 c0 14             	add    $0x14,%eax
c0105ff5:	83 e6 1f             	and    $0x1f,%esi
c0105ff8:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105ffb:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c0105ffe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0106001:	74 7d                	je     c0106080 <__lshift+0x100>
c0106003:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c010600a:	29 75 dc             	sub    %esi,-0x24(%ebp)
c010600d:	31 f6                	xor    %esi,%esi
c010600f:	eb 09                	jmp    c010601a <__lshift+0x9a>
c0106011:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106018:	89 fa                	mov    %edi,%edx
c010601a:	8b 18                	mov    (%eax),%ebx
c010601c:	83 c0 04             	add    $0x4,%eax
c010601f:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0106023:	8d 7a 04             	lea    0x4(%edx),%edi
c0106026:	d3 e3                	shl    %cl,%ebx
c0106028:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c010602c:	09 f3                	or     %esi,%ebx
c010602e:	89 1a                	mov    %ebx,(%edx)
c0106030:	8b 70 fc             	mov    -0x4(%eax),%esi
c0106033:	d3 ee                	shr    %cl,%esi
c0106035:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0106038:	77 de                	ja     c0106018 <__lshift+0x98>
c010603a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010603d:	89 72 04             	mov    %esi,0x4(%edx)
c0106040:	83 c0 02             	add    $0x2,%eax
c0106043:	85 f6                	test   %esi,%esi
c0106045:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c0106049:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010604c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010604f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0106052:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106055:	83 e8 01             	sub    $0x1,%eax
c0106058:	89 47 10             	mov    %eax,0x10(%edi)
c010605b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010605e:	8b 50 04             	mov    0x4(%eax),%edx
c0106061:	8b 45 08             	mov    0x8(%ebp),%eax
c0106064:	8b 40 4c             	mov    0x4c(%eax),%eax
c0106067:	8d 04 90             	lea    (%eax,%edx,4),%eax
c010606a:	8b 10                	mov    (%eax),%edx
c010606c:	89 16                	mov    %edx,(%esi)
c010606e:	89 30                	mov    %esi,(%eax)
c0106070:	83 c4 2c             	add    $0x2c,%esp
c0106073:	89 f8                	mov    %edi,%eax
c0106075:	5b                   	pop    %ebx
c0106076:	5e                   	pop    %esi
c0106077:	5f                   	pop    %edi
c0106078:	5d                   	pop    %ebp
c0106079:	c3                   	ret    
c010607a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106080:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0106083:	90                   	nop
c0106084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106088:	83 c0 04             	add    $0x4,%eax
c010608b:	8b 48 fc             	mov    -0x4(%eax),%ecx
c010608e:	83 c2 04             	add    $0x4,%edx
c0106091:	39 c3                	cmp    %eax,%ebx
c0106093:	89 4a fc             	mov    %ecx,-0x4(%edx)
c0106096:	77 f0                	ja     c0106088 <__lshift+0x108>
c0106098:	eb b2                	jmp    c010604c <__lshift+0xcc>
c010609a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01060a0 <__mcmp>:
c01060a0:	55                   	push   %ebp
c01060a1:	89 e5                	mov    %esp,%ebp
c01060a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01060a6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01060a9:	53                   	push   %ebx
c01060aa:	8b 41 10             	mov    0x10(%ecx),%eax
c01060ad:	8b 5a 10             	mov    0x10(%edx),%ebx
c01060b0:	29 d8                	sub    %ebx,%eax
c01060b2:	85 c0                	test   %eax,%eax
c01060b4:	75 27                	jne    c01060dd <__mcmp+0x3d>
c01060b6:	c1 e3 02             	shl    $0x2,%ebx
c01060b9:	83 c1 14             	add    $0x14,%ecx
c01060bc:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c01060bf:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c01060c3:	eb 07                	jmp    c01060cc <__mcmp+0x2c>
c01060c5:	8d 76 00             	lea    0x0(%esi),%esi
c01060c8:	39 c1                	cmp    %eax,%ecx
c01060ca:	73 14                	jae    c01060e0 <__mcmp+0x40>
c01060cc:	83 ea 04             	sub    $0x4,%edx
c01060cf:	83 e8 04             	sub    $0x4,%eax
c01060d2:	8b 1a                	mov    (%edx),%ebx
c01060d4:	39 18                	cmp    %ebx,(%eax)
c01060d6:	74 f0                	je     c01060c8 <__mcmp+0x28>
c01060d8:	19 c0                	sbb    %eax,%eax
c01060da:	83 c8 01             	or     $0x1,%eax
c01060dd:	5b                   	pop    %ebx
c01060de:	5d                   	pop    %ebp
c01060df:	c3                   	ret    
c01060e0:	31 c0                	xor    %eax,%eax
c01060e2:	5b                   	pop    %ebx
c01060e3:	5d                   	pop    %ebp
c01060e4:	c3                   	ret    
c01060e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01060f0 <__mdiff>:
c01060f0:	55                   	push   %ebp
c01060f1:	89 e5                	mov    %esp,%ebp
c01060f3:	57                   	push   %edi
c01060f4:	56                   	push   %esi
c01060f5:	53                   	push   %ebx
c01060f6:	83 ec 2c             	sub    $0x2c,%esp
c01060f9:	8b 75 0c             	mov    0xc(%ebp),%esi
c01060fc:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01060ff:	89 34 24             	mov    %esi,(%esp)
c0106102:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0106106:	e8 95 ff ff ff       	call   c01060a0 <__mcmp>
c010610b:	85 c0                	test   %eax,%eax
c010610d:	0f 84 25 01 00 00    	je     c0106238 <__mdiff+0x148>
c0106113:	0f 88 0f 01 00 00    	js     c0106228 <__mdiff+0x138>
c0106119:	31 ff                	xor    %edi,%edi
c010611b:	8b 46 04             	mov    0x4(%esi),%eax
c010611e:	83 c6 14             	add    $0x14,%esi
c0106121:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106125:	8b 45 08             	mov    0x8(%ebp),%eax
c0106128:	89 04 24             	mov    %eax,(%esp)
c010612b:	e8 b0 f7 ff ff       	call   c01058e0 <_Balloc>
c0106130:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0106133:	89 c2                	mov    %eax,%edx
c0106135:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106138:	89 78 0c             	mov    %edi,0xc(%eax)
c010613b:	8b 46 fc             	mov    -0x4(%esi),%eax
c010613e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0106141:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106144:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0106147:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010614a:	8b 43 10             	mov    0x10(%ebx),%eax
c010614d:	31 db                	xor    %ebx,%ebx
c010614f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0106152:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106155:	89 d0                	mov    %edx,%eax
c0106157:	83 c0 14             	add    $0x14,%eax
c010615a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106160:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0106163:	83 c0 04             	add    $0x4,%eax
c0106166:	83 c1 04             	add    $0x4,%ecx
c0106169:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c010616d:	8b 3e                	mov    (%esi),%edi
c010616f:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0106172:	0f b7 d7             	movzwl %di,%edx
c0106175:	01 da                	add    %ebx,%edx
c0106177:	0f b7 de             	movzwl %si,%ebx
c010617a:	29 da                	sub    %ebx,%edx
c010617c:	c1 ef 10             	shr    $0x10,%edi
c010617f:	89 d3                	mov    %edx,%ebx
c0106181:	c1 ee 10             	shr    $0x10,%esi
c0106184:	0f b7 d2             	movzwl %dx,%edx
c0106187:	c1 fb 10             	sar    $0x10,%ebx
c010618a:	29 f7                	sub    %esi,%edi
c010618c:	01 df                	add    %ebx,%edi
c010618e:	89 fb                	mov    %edi,%ebx
c0106190:	c1 e7 10             	shl    $0x10,%edi
c0106193:	09 d7                	or     %edx,%edi
c0106195:	c1 fb 10             	sar    $0x10,%ebx
c0106198:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c010619b:	89 78 fc             	mov    %edi,-0x4(%eax)
c010619e:	77 c0                	ja     c0106160 <__mdiff+0x70>
c01061a0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c01061a3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01061a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01061a9:	89 75 e0             	mov    %esi,-0x20(%ebp)
c01061ac:	39 f1                	cmp    %esi,%ecx
c01061ae:	76 3f                	jbe    c01061ef <__mdiff+0xff>
c01061b0:	8b 3e                	mov    (%esi),%edi
c01061b2:	83 c6 04             	add    $0x4,%esi
c01061b5:	83 c0 04             	add    $0x4,%eax
c01061b8:	0f b7 d7             	movzwl %di,%edx
c01061bb:	01 da                	add    %ebx,%edx
c01061bd:	89 d3                	mov    %edx,%ebx
c01061bf:	0f b7 d2             	movzwl %dx,%edx
c01061c2:	c1 fb 10             	sar    $0x10,%ebx
c01061c5:	c1 ef 10             	shr    $0x10,%edi
c01061c8:	01 df                	add    %ebx,%edi
c01061ca:	89 fb                	mov    %edi,%ebx
c01061cc:	c1 e7 10             	shl    $0x10,%edi
c01061cf:	09 d7                	or     %edx,%edi
c01061d1:	c1 fb 10             	sar    $0x10,%ebx
c01061d4:	39 f1                	cmp    %esi,%ecx
c01061d6:	89 78 fc             	mov    %edi,-0x4(%eax)
c01061d9:	77 d5                	ja     c01061b0 <__mdiff+0xc0>
c01061db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01061de:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01061e1:	f7 d0                	not    %eax
c01061e3:	01 c8                	add    %ecx,%eax
c01061e5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01061e8:	c1 e8 02             	shr    $0x2,%eax
c01061eb:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c01061ef:	85 ff                	test   %edi,%edi
c01061f1:	75 23                	jne    c0106216 <__mdiff+0x126>
c01061f3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c01061f6:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c01061fd:	29 d0                	sub    %edx,%eax
c01061ff:	89 ca                	mov    %ecx,%edx
c0106201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106208:	83 ea 01             	sub    $0x1,%edx
c010620b:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c010620f:	85 c9                	test   %ecx,%ecx
c0106211:	74 f5                	je     c0106208 <__mdiff+0x118>
c0106213:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0106216:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106219:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c010621c:	89 48 10             	mov    %ecx,0x10(%eax)
c010621f:	83 c4 2c             	add    $0x2c,%esp
c0106222:	5b                   	pop    %ebx
c0106223:	5e                   	pop    %esi
c0106224:	5f                   	pop    %edi
c0106225:	5d                   	pop    %ebp
c0106226:	c3                   	ret    
c0106227:	90                   	nop
c0106228:	89 f0                	mov    %esi,%eax
c010622a:	bf 01 00 00 00       	mov    $0x1,%edi
c010622f:	89 de                	mov    %ebx,%esi
c0106231:	89 c3                	mov    %eax,%ebx
c0106233:	e9 e3 fe ff ff       	jmp    c010611b <__mdiff+0x2b>
c0106238:	8b 45 08             	mov    0x8(%ebp),%eax
c010623b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106242:	00 
c0106243:	89 04 24             	mov    %eax,(%esp)
c0106246:	e8 95 f6 ff ff       	call   c01058e0 <_Balloc>
c010624b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0106252:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0106259:	83 c4 2c             	add    $0x2c,%esp
c010625c:	5b                   	pop    %ebx
c010625d:	5e                   	pop    %esi
c010625e:	5f                   	pop    %edi
c010625f:	5d                   	pop    %ebp
c0106260:	c3                   	ret    
c0106261:	eb 0d                	jmp    c0106270 <__ulp>
c0106263:	90                   	nop
c0106264:	90                   	nop
c0106265:	90                   	nop
c0106266:	90                   	nop
c0106267:	90                   	nop
c0106268:	90                   	nop
c0106269:	90                   	nop
c010626a:	90                   	nop
c010626b:	90                   	nop
c010626c:	90                   	nop
c010626d:	90                   	nop
c010626e:	90                   	nop
c010626f:	90                   	nop

c0106270 <__ulp>:
c0106270:	55                   	push   %ebp
c0106271:	89 e5                	mov    %esp,%ebp
c0106273:	83 ec 08             	sub    $0x8,%esp
c0106276:	dd 45 08             	fldl   0x8(%ebp)
c0106279:	dd 5d f8             	fstpl  -0x8(%ebp)
c010627c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c010627f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c0106285:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c010628b:	85 c9                	test   %ecx,%ecx
c010628d:	7e 11                	jle    c01062a0 <__ulp+0x30>
c010628f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0106292:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0106299:	dd 45 f8             	fldl   -0x8(%ebp)
c010629c:	c9                   	leave  
c010629d:	c3                   	ret    
c010629e:	66 90                	xchg   %ax,%ax
c01062a0:	f7 d9                	neg    %ecx
c01062a2:	c1 f9 14             	sar    $0x14,%ecx
c01062a5:	83 f9 13             	cmp    $0x13,%ecx
c01062a8:	7e 26                	jle    c01062d0 <__ulp+0x60>
c01062aa:	83 f9 32             	cmp    $0x32,%ecx
c01062ad:	b8 01 00 00 00       	mov    $0x1,%eax
c01062b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01062b9:	7f 0b                	jg     c01062c6 <__ulp+0x56>
c01062bb:	ba 33 00 00 00       	mov    $0x33,%edx
c01062c0:	29 ca                	sub    %ecx,%edx
c01062c2:	89 d1                	mov    %edx,%ecx
c01062c4:	d3 e0                	shl    %cl,%eax
c01062c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01062c9:	dd 45 f8             	fldl   -0x8(%ebp)
c01062cc:	c9                   	leave  
c01062cd:	c3                   	ret    
c01062ce:	66 90                	xchg   %ax,%ax
c01062d0:	b8 00 00 08 00       	mov    $0x80000,%eax
c01062d5:	d3 f8                	sar    %cl,%eax
c01062d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01062da:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01062e1:	dd 45 f8             	fldl   -0x8(%ebp)
c01062e4:	c9                   	leave  
c01062e5:	c3                   	ret    
c01062e6:	8d 76 00             	lea    0x0(%esi),%esi
c01062e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01062f0 <__b2d>:
c01062f0:	55                   	push   %ebp
c01062f1:	89 e5                	mov    %esp,%ebp
c01062f3:	57                   	push   %edi
c01062f4:	56                   	push   %esi
c01062f5:	53                   	push   %ebx
c01062f6:	83 ec 18             	sub    $0x18,%esp
c01062f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01062fc:	8d 78 14             	lea    0x14(%eax),%edi
c01062ff:	8b 40 10             	mov    0x10(%eax),%eax
c0106302:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0106305:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0106308:	8d 43 fc             	lea    -0x4(%ebx),%eax
c010630b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010630e:	89 34 24             	mov    %esi,(%esp)
c0106311:	e8 6a f8 ff ff       	call   c0105b80 <__hi0bits>
c0106316:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0106319:	ba 20 00 00 00       	mov    $0x20,%edx
c010631e:	29 c2                	sub    %eax,%edx
c0106320:	83 f8 0a             	cmp    $0xa,%eax
c0106323:	89 11                	mov    %edx,(%ecx)
c0106325:	7f 41                	jg     c0106368 <__b2d+0x78>
c0106327:	b9 0b 00 00 00       	mov    $0xb,%ecx
c010632c:	89 f2                	mov    %esi,%edx
c010632e:	29 c1                	sub    %eax,%ecx
c0106330:	d3 ea                	shr    %cl,%edx
c0106332:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0106338:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010633b:	31 d2                	xor    %edx,%edx
c010633d:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0106340:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106347:	73 05                	jae    c010634e <__b2d+0x5e>
c0106349:	8b 53 f8             	mov    -0x8(%ebx),%edx
c010634c:	d3 ea                	shr    %cl,%edx
c010634e:	8d 48 15             	lea    0x15(%eax),%ecx
c0106351:	d3 e6                	shl    %cl,%esi
c0106353:	09 f2                	or     %esi,%edx
c0106355:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0106358:	dd 45 e8             	fldl   -0x18(%ebp)
c010635b:	83 c4 18             	add    $0x18,%esp
c010635e:	5b                   	pop    %ebx
c010635f:	5e                   	pop    %esi
c0106360:	5f                   	pop    %edi
c0106361:	5d                   	pop    %ebp
c0106362:	c3                   	ret    
c0106363:	90                   	nop
c0106364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106368:	31 d2                	xor    %edx,%edx
c010636a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c010636d:	73 09                	jae    c0106378 <__b2d+0x88>
c010636f:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0106372:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0106375:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0106378:	89 c3                	mov    %eax,%ebx
c010637a:	83 eb 0b             	sub    $0xb,%ebx
c010637d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0106380:	74 4e                	je     c01063d0 <__b2d+0xe0>
c0106382:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0106386:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c010638b:	29 c3                	sub    %eax,%ebx
c010638d:	89 d0                	mov    %edx,%eax
c010638f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106396:	d3 e6                	shl    %cl,%esi
c0106398:	89 d9                	mov    %ebx,%ecx
c010639a:	d3 e8                	shr    %cl,%eax
c010639c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c010639f:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c01063a5:	09 c6                	or     %eax,%esi
c01063a7:	31 c0                	xor    %eax,%eax
c01063a9:	89 75 ec             	mov    %esi,-0x14(%ebp)
c01063ac:	39 f9                	cmp    %edi,%ecx
c01063ae:	76 07                	jbe    c01063b7 <__b2d+0xc7>
c01063b0:	8b 41 fc             	mov    -0x4(%ecx),%eax
c01063b3:	89 d9                	mov    %ebx,%ecx
c01063b5:	d3 e8                	shr    %cl,%eax
c01063b7:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c01063bb:	d3 e2                	shl    %cl,%edx
c01063bd:	09 d0                	or     %edx,%eax
c01063bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063c2:	dd 45 e8             	fldl   -0x18(%ebp)
c01063c5:	83 c4 18             	add    $0x18,%esp
c01063c8:	5b                   	pop    %ebx
c01063c9:	5e                   	pop    %esi
c01063ca:	5f                   	pop    %edi
c01063cb:	5d                   	pop    %ebp
c01063cc:	c3                   	ret    
c01063cd:	8d 76 00             	lea    0x0(%esi),%esi
c01063d0:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c01063d6:	89 75 ec             	mov    %esi,-0x14(%ebp)
c01063d9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01063dc:	dd 45 e8             	fldl   -0x18(%ebp)
c01063df:	83 c4 18             	add    $0x18,%esp
c01063e2:	5b                   	pop    %ebx
c01063e3:	5e                   	pop    %esi
c01063e4:	5f                   	pop    %edi
c01063e5:	5d                   	pop    %ebp
c01063e6:	c3                   	ret    
c01063e7:	89 f6                	mov    %esi,%esi
c01063e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01063f0 <__d2b>:
c01063f0:	55                   	push   %ebp
c01063f1:	89 e5                	mov    %esp,%ebp
c01063f3:	57                   	push   %edi
c01063f4:	56                   	push   %esi
c01063f5:	53                   	push   %ebx
c01063f6:	83 ec 2c             	sub    $0x2c,%esp
c01063f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01063fc:	dd 45 0c             	fldl   0xc(%ebp)
c01063ff:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106406:	00 
c0106407:	dd 5d d0             	fstpl  -0x30(%ebp)
c010640a:	89 04 24             	mov    %eax,(%esp)
c010640d:	e8 ce f4 ff ff       	call   c01058e0 <_Balloc>
c0106412:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0106415:	89 c6                	mov    %eax,%esi
c0106417:	89 d8                	mov    %ebx,%eax
c0106419:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c010641f:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0106424:	c1 eb 14             	shr    $0x14,%ebx
c0106427:	85 db                	test   %ebx,%ebx
c0106429:	74 05                	je     c0106430 <__d2b+0x40>
c010642b:	0d 00 00 10 00       	or     $0x100000,%eax
c0106430:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106433:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106436:	85 c0                	test   %eax,%eax
c0106438:	74 56                	je     c0106490 <__d2b+0xa0>
c010643a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010643d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0106440:	89 04 24             	mov    %eax,(%esp)
c0106443:	e8 98 f7 ff ff       	call   c0105be0 <__lo0bits>
c0106448:	85 c0                	test   %eax,%eax
c010644a:	0f 85 90 00 00 00    	jne    c01064e0 <__d2b+0xf0>
c0106450:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106453:	89 56 14             	mov    %edx,0x14(%esi)
c0106456:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106459:	83 fa 01             	cmp    $0x1,%edx
c010645c:	19 ff                	sbb    %edi,%edi
c010645e:	83 c7 02             	add    $0x2,%edi
c0106461:	85 db                	test   %ebx,%ebx
c0106463:	89 56 18             	mov    %edx,0x18(%esi)
c0106466:	89 7e 10             	mov    %edi,0x10(%esi)
c0106469:	74 49                	je     c01064b4 <__d2b+0xc4>
c010646b:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010646e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0106475:	89 11                	mov    %edx,(%ecx)
c0106477:	ba 35 00 00 00       	mov    $0x35,%edx
c010647c:	29 c2                	sub    %eax,%edx
c010647e:	8b 45 18             	mov    0x18(%ebp),%eax
c0106481:	89 10                	mov    %edx,(%eax)
c0106483:	83 c4 2c             	add    $0x2c,%esp
c0106486:	89 f0                	mov    %esi,%eax
c0106488:	5b                   	pop    %ebx
c0106489:	5e                   	pop    %esi
c010648a:	5f                   	pop    %edi
c010648b:	5d                   	pop    %ebp
c010648c:	c3                   	ret    
c010648d:	8d 76 00             	lea    0x0(%esi),%esi
c0106490:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0106493:	bf 01 00 00 00       	mov    $0x1,%edi
c0106498:	89 04 24             	mov    %eax,(%esp)
c010649b:	e8 40 f7 ff ff       	call   c0105be0 <__lo0bits>
c01064a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01064a3:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c01064aa:	89 56 14             	mov    %edx,0x14(%esi)
c01064ad:	83 c0 20             	add    $0x20,%eax
c01064b0:	85 db                	test   %ebx,%ebx
c01064b2:	75 b7                	jne    c010646b <__d2b+0x7b>
c01064b4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01064b7:	2d 32 04 00 00       	sub    $0x432,%eax
c01064bc:	89 01                	mov    %eax,(%ecx)
c01064be:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c01064c2:	c1 e7 05             	shl    $0x5,%edi
c01064c5:	89 04 24             	mov    %eax,(%esp)
c01064c8:	e8 b3 f6 ff ff       	call   c0105b80 <__hi0bits>
c01064cd:	29 c7                	sub    %eax,%edi
c01064cf:	8b 45 18             	mov    0x18(%ebp),%eax
c01064d2:	89 38                	mov    %edi,(%eax)
c01064d4:	83 c4 2c             	add    $0x2c,%esp
c01064d7:	89 f0                	mov    %esi,%eax
c01064d9:	5b                   	pop    %ebx
c01064da:	5e                   	pop    %esi
c01064db:	5f                   	pop    %edi
c01064dc:	5d                   	pop    %ebp
c01064dd:	c3                   	ret    
c01064de:	66 90                	xchg   %ax,%ax
c01064e0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01064e3:	b9 20 00 00 00       	mov    $0x20,%ecx
c01064e8:	29 c1                	sub    %eax,%ecx
c01064ea:	89 d7                	mov    %edx,%edi
c01064ec:	d3 e7                	shl    %cl,%edi
c01064ee:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01064f1:	09 f9                	or     %edi,%ecx
c01064f3:	89 4e 14             	mov    %ecx,0x14(%esi)
c01064f6:	89 c1                	mov    %eax,%ecx
c01064f8:	d3 ea                	shr    %cl,%edx
c01064fa:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01064fd:	e9 57 ff ff ff       	jmp    c0106459 <__d2b+0x69>
c0106502:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106510 <__ratio>:
c0106510:	55                   	push   %ebp
c0106511:	89 e5                	mov    %esp,%ebp
c0106513:	56                   	push   %esi
c0106514:	53                   	push   %ebx
c0106515:	83 ec 30             	sub    $0x30,%esp
c0106518:	8b 75 08             	mov    0x8(%ebp),%esi
c010651b:	8d 45 f0             	lea    -0x10(%ebp),%eax
c010651e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0106521:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106525:	89 34 24             	mov    %esi,(%esp)
c0106528:	e8 c3 fd ff ff       	call   c01062f0 <__b2d>
c010652d:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0106530:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106534:	89 1c 24             	mov    %ebx,(%esp)
c0106537:	dd 55 e0             	fstl   -0x20(%ebp)
c010653a:	dd 5d d8             	fstpl  -0x28(%ebp)
c010653d:	e8 ae fd ff ff       	call   c01062f0 <__b2d>
c0106542:	8b 46 10             	mov    0x10(%esi),%eax
c0106545:	2b 43 10             	sub    0x10(%ebx),%eax
c0106548:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010654b:	2b 55 f4             	sub    -0xc(%ebp),%edx
c010654e:	c1 e0 05             	shl    $0x5,%eax
c0106551:	01 d0                	add    %edx,%eax
c0106553:	dd 55 d0             	fstl   -0x30(%ebp)
c0106556:	85 c0                	test   %eax,%eax
c0106558:	dd 45 d8             	fldl   -0x28(%ebp)
c010655b:	7e 1b                	jle    c0106578 <__ratio+0x68>
c010655d:	dd d8                	fstp   %st(0)
c010655f:	c1 e0 14             	shl    $0x14,%eax
c0106562:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0106565:	dd 45 e0             	fldl   -0x20(%ebp)
c0106568:	83 c4 30             	add    $0x30,%esp
c010656b:	5b                   	pop    %ebx
c010656c:	de f1                	fdivp  %st,%st(1)
c010656e:	5e                   	pop    %esi
c010656f:	5d                   	pop    %ebp
c0106570:	c3                   	ret    
c0106571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106578:	dd d9                	fstp   %st(1)
c010657a:	c1 e0 14             	shl    $0x14,%eax
c010657d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c0106580:	dd 45 d0             	fldl   -0x30(%ebp)
c0106583:	83 c4 30             	add    $0x30,%esp
c0106586:	5b                   	pop    %ebx
c0106587:	de f9                	fdivrp %st,%st(1)
c0106589:	5e                   	pop    %esi
c010658a:	5d                   	pop    %ebp
c010658b:	c3                   	ret    
c010658c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0106590 <_mprec_log10>:
c0106590:	55                   	push   %ebp
c0106591:	89 e5                	mov    %esp,%ebp
c0106593:	8b 45 08             	mov    0x8(%ebp),%eax
c0106596:	83 f8 17             	cmp    $0x17,%eax
c0106599:	7e 1d                	jle    c01065b8 <_mprec_log10+0x28>
c010659b:	d9 e8                	fld1   
c010659d:	d9 05 10 8d 10 c0    	flds   0xc0108d10
c01065a3:	90                   	nop
c01065a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01065a8:	83 e8 01             	sub    $0x1,%eax
c01065ab:	dc c9                	fmul   %st,%st(1)
c01065ad:	75 f9                	jne    c01065a8 <_mprec_log10+0x18>
c01065af:	dd d8                	fstp   %st(0)
c01065b1:	5d                   	pop    %ebp
c01065b2:	c3                   	ret    
c01065b3:	90                   	nop
c01065b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01065b8:	dd 04 c5 e0 8d 10 c0 	fldl   -0x3fef7220(,%eax,8)
c01065bf:	5d                   	pop    %ebp
c01065c0:	c3                   	ret    
c01065c1:	eb 0d                	jmp    c01065d0 <__copybits>
c01065c3:	90                   	nop
c01065c4:	90                   	nop
c01065c5:	90                   	nop
c01065c6:	90                   	nop
c01065c7:	90                   	nop
c01065c8:	90                   	nop
c01065c9:	90                   	nop
c01065ca:	90                   	nop
c01065cb:	90                   	nop
c01065cc:	90                   	nop
c01065cd:	90                   	nop
c01065ce:	90                   	nop
c01065cf:	90                   	nop

c01065d0 <__copybits>:
c01065d0:	55                   	push   %ebp
c01065d1:	89 e5                	mov    %esp,%ebp
c01065d3:	57                   	push   %edi
c01065d4:	8b 7d 10             	mov    0x10(%ebp),%edi
c01065d7:	56                   	push   %esi
c01065d8:	8b 75 0c             	mov    0xc(%ebp),%esi
c01065db:	8b 45 08             	mov    0x8(%ebp),%eax
c01065de:	53                   	push   %ebx
c01065df:	8b 4f 10             	mov    0x10(%edi),%ecx
c01065e2:	8d 56 ff             	lea    -0x1(%esi),%edx
c01065e5:	c1 fa 05             	sar    $0x5,%edx
c01065e8:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c01065ec:	8d 57 14             	lea    0x14(%edi),%edx
c01065ef:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c01065f2:	39 da                	cmp    %ebx,%edx
c01065f4:	73 34                	jae    c010662a <__copybits+0x5a>
c01065f6:	89 c1                	mov    %eax,%ecx
c01065f8:	83 c2 04             	add    $0x4,%edx
c01065fb:	8b 42 fc             	mov    -0x4(%edx),%eax
c01065fe:	83 c1 04             	add    $0x4,%ecx
c0106601:	39 d3                	cmp    %edx,%ebx
c0106603:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0106606:	77 f0                	ja     c01065f8 <__copybits+0x28>
c0106608:	8b 45 08             	mov    0x8(%ebp),%eax
c010660b:	29 fb                	sub    %edi,%ebx
c010660d:	8d 53 eb             	lea    -0x15(%ebx),%edx
c0106610:	c1 ea 02             	shr    $0x2,%edx
c0106613:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c0106617:	39 c6                	cmp    %eax,%esi
c0106619:	76 13                	jbe    c010662e <__copybits+0x5e>
c010661b:	90                   	nop
c010661c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106620:	83 c0 04             	add    $0x4,%eax
c0106623:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c010662a:	39 c6                	cmp    %eax,%esi
c010662c:	77 f2                	ja     c0106620 <__copybits+0x50>
c010662e:	5b                   	pop    %ebx
c010662f:	5e                   	pop    %esi
c0106630:	5f                   	pop    %edi
c0106631:	5d                   	pop    %ebp
c0106632:	c3                   	ret    
c0106633:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106640 <__any_on>:
c0106640:	55                   	push   %ebp
c0106641:	89 e5                	mov    %esp,%ebp
c0106643:	8b 45 08             	mov    0x8(%ebp),%eax
c0106646:	57                   	push   %edi
c0106647:	56                   	push   %esi
c0106648:	53                   	push   %ebx
c0106649:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010664c:	8d 50 14             	lea    0x14(%eax),%edx
c010664f:	8b 40 10             	mov    0x10(%eax),%eax
c0106652:	c1 fb 05             	sar    $0x5,%ebx
c0106655:	39 d8                	cmp    %ebx,%eax
c0106657:	7d 2f                	jge    c0106688 <__any_on+0x48>
c0106659:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c010665c:	39 da                	cmp    %ebx,%edx
c010665e:	73 1d                	jae    c010667d <__any_on+0x3d>
c0106660:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0106663:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0106666:	85 db                	test   %ebx,%ebx
c0106668:	74 0f                	je     c0106679 <__any_on+0x39>
c010666a:	eb 44                	jmp    c01066b0 <__any_on+0x70>
c010666c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106670:	83 e8 04             	sub    $0x4,%eax
c0106673:	8b 08                	mov    (%eax),%ecx
c0106675:	85 c9                	test   %ecx,%ecx
c0106677:	75 37                	jne    c01066b0 <__any_on+0x70>
c0106679:	39 c2                	cmp    %eax,%edx
c010667b:	72 f3                	jb     c0106670 <__any_on+0x30>
c010667d:	31 c0                	xor    %eax,%eax
c010667f:	5b                   	pop    %ebx
c0106680:	5e                   	pop    %esi
c0106681:	5f                   	pop    %edi
c0106682:	5d                   	pop    %ebp
c0106683:	c3                   	ret    
c0106684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106688:	7e 1e                	jle    c01066a8 <__any_on+0x68>
c010668a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c010668d:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0106690:	83 e1 1f             	and    $0x1f,%ecx
c0106693:	74 c7                	je     c010665c <__any_on+0x1c>
c0106695:	8b 3b                	mov    (%ebx),%edi
c0106697:	b8 01 00 00 00       	mov    $0x1,%eax
c010669c:	89 fe                	mov    %edi,%esi
c010669e:	d3 ee                	shr    %cl,%esi
c01066a0:	d3 e6                	shl    %cl,%esi
c01066a2:	39 fe                	cmp    %edi,%esi
c01066a4:	75 d9                	jne    c010667f <__any_on+0x3f>
c01066a6:	eb b4                	jmp    c010665c <__any_on+0x1c>
c01066a8:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c01066ab:	eb af                	jmp    c010665c <__any_on+0x1c>
c01066ad:	8d 76 00             	lea    0x0(%esi),%esi
c01066b0:	5b                   	pop    %ebx
c01066b1:	b8 01 00 00 00       	mov    $0x1,%eax
c01066b6:	5e                   	pop    %esi
c01066b7:	5f                   	pop    %edi
c01066b8:	5d                   	pop    %ebp
c01066b9:	c3                   	ret    
c01066ba:	66 90                	xchg   %ax,%ax
c01066bc:	66 90                	xchg   %ax,%ax
c01066be:	66 90                	xchg   %ax,%ax

c01066c0 <_sbrk_r>:
c01066c0:	55                   	push   %ebp
c01066c1:	89 e5                	mov    %esp,%ebp
c01066c3:	83 ec 18             	sub    $0x18,%esp
c01066c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01066c9:	c7 05 94 35 16 c0 00 	movl   $0x0,0xc0163594
c01066d0:	00 00 00 
c01066d3:	89 04 24             	mov    %eax,(%esp)
c01066d6:	e8 b5 ae ff ff       	call   c0101590 <sbrk>
c01066db:	83 f8 ff             	cmp    $0xffffffff,%eax
c01066de:	74 08                	je     c01066e8 <_sbrk_r+0x28>
c01066e0:	c9                   	leave  
c01066e1:	c3                   	ret    
c01066e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01066e8:	8b 15 94 35 16 c0    	mov    0xc0163594,%edx
c01066ee:	85 d2                	test   %edx,%edx
c01066f0:	74 ee                	je     c01066e0 <_sbrk_r+0x20>
c01066f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01066f5:	89 11                	mov    %edx,(%ecx)
c01066f7:	c9                   	leave  
c01066f8:	c3                   	ret    
c01066f9:	66 90                	xchg   %ax,%ax
c01066fb:	66 90                	xchg   %ax,%ax
c01066fd:	66 90                	xchg   %ax,%ax
c01066ff:	90                   	nop

c0106700 <__fpclassifyd>:
c0106700:	55                   	push   %ebp
c0106701:	b8 02 00 00 00       	mov    $0x2,%eax
c0106706:	89 e5                	mov    %esp,%ebp
c0106708:	53                   	push   %ebx
c0106709:	83 ec 0c             	sub    $0xc,%esp
c010670c:	dd 45 08             	fldl   0x8(%ebp)
c010670f:	dd 5d f0             	fstpl  -0x10(%ebp)
c0106712:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106715:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0106718:	89 d3                	mov    %edx,%ebx
c010671a:	09 cb                	or     %ecx,%ebx
c010671c:	75 0a                	jne    c0106728 <__fpclassifyd+0x28>
c010671e:	83 c4 0c             	add    $0xc,%esp
c0106721:	5b                   	pop    %ebx
c0106722:	5d                   	pop    %ebp
c0106723:	c3                   	ret    
c0106724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106728:	85 d2                	test   %edx,%edx
c010672a:	0f 94 c2             	sete   %dl
c010672d:	75 08                	jne    c0106737 <__fpclassifyd+0x37>
c010672f:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c0106735:	74 e7                	je     c010671e <__fpclassifyd+0x1e>
c0106737:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c010673d:	b8 04 00 00 00       	mov    $0x4,%eax
c0106742:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c0106748:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c010674e:	76 ce                	jbe    c010671e <__fpclassifyd+0x1e>
c0106750:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c0106756:	b0 03                	mov    $0x3,%al
c0106758:	76 c4                	jbe    c010671e <__fpclassifyd+0x1e>
c010675a:	31 c0                	xor    %eax,%eax
c010675c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c0106762:	0f 94 c0             	sete   %al
c0106765:	21 d0                	and    %edx,%eax
c0106767:	eb b5                	jmp    c010671e <__fpclassifyd+0x1e>
c0106769:	66 90                	xchg   %ax,%ax
c010676b:	66 90                	xchg   %ax,%ax
c010676d:	66 90                	xchg   %ax,%ax
c010676f:	90                   	nop

c0106770 <strlen>:
c0106770:	55                   	push   %ebp
c0106771:	89 e5                	mov    %esp,%ebp
c0106773:	57                   	push   %edi
c0106774:	8b 55 08             	mov    0x8(%ebp),%edx
c0106777:	89 d7                	mov    %edx,%edi
c0106779:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010677f:	74 25                	je     c01067a6 <L5>
c0106781:	8a 0f                	mov    (%edi),%cl
c0106783:	47                   	inc    %edi
c0106784:	84 c9                	test   %cl,%cl
c0106786:	74 56                	je     c01067de <L15>
c0106788:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010678e:	74 16                	je     c01067a6 <L5>
c0106790:	8a 0f                	mov    (%edi),%cl
c0106792:	47                   	inc    %edi
c0106793:	84 c9                	test   %cl,%cl
c0106795:	74 47                	je     c01067de <L15>
c0106797:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010679d:	74 07                	je     c01067a6 <L5>
c010679f:	8a 0f                	mov    (%edi),%cl
c01067a1:	47                   	inc    %edi
c01067a2:	84 c9                	test   %cl,%cl
c01067a4:	74 38                	je     c01067de <L15>

c01067a6 <L5>:
c01067a6:	83 ef 04             	sub    $0x4,%edi
c01067a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01067b0 <L10>:
c01067b0:	83 c7 04             	add    $0x4,%edi
c01067b3:	8b 0f                	mov    (%edi),%ecx
c01067b5:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c01067bb:	f7 d1                	not    %ecx
c01067bd:	21 c8                	and    %ecx,%eax
c01067bf:	a9 80 80 80 80       	test   $0x80808080,%eax
c01067c4:	74 ea                	je     c01067b0 <L10>
c01067c6:	f7 d1                	not    %ecx
c01067c8:	47                   	inc    %edi
c01067c9:	84 c9                	test   %cl,%cl
c01067cb:	74 11                	je     c01067de <L15>
c01067cd:	47                   	inc    %edi
c01067ce:	c1 e9 08             	shr    $0x8,%ecx
c01067d1:	84 c9                	test   %cl,%cl
c01067d3:	74 09                	je     c01067de <L15>
c01067d5:	47                   	inc    %edi
c01067d6:	c1 e9 08             	shr    $0x8,%ecx
c01067d9:	84 c9                	test   %cl,%cl
c01067db:	74 01                	je     c01067de <L15>
c01067dd:	47                   	inc    %edi

c01067de <L15>:
c01067de:	29 d7                	sub    %edx,%edi
c01067e0:	8d 47 ff             	lea    -0x1(%edi),%eax
c01067e3:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01067e6:	5f                   	pop    %edi
c01067e7:	c9                   	leave  
c01067e8:	c3                   	ret    
c01067e9:	66 90                	xchg   %ax,%ax
c01067eb:	66 90                	xchg   %ax,%ax
c01067ed:	66 90                	xchg   %ax,%ax
c01067ef:	90                   	nop

c01067f0 <__ssprint_r>:
c01067f0:	55                   	push   %ebp
c01067f1:	89 e5                	mov    %esp,%ebp
c01067f3:	57                   	push   %edi
c01067f4:	56                   	push   %esi
c01067f5:	53                   	push   %ebx
c01067f6:	83 ec 2c             	sub    $0x2c,%esp
c01067f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01067fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01067ff:	8b 00                	mov    (%eax),%eax
c0106801:	89 c7                	mov    %eax,%edi
c0106803:	8b 45 10             	mov    0x10(%ebp),%eax
c0106806:	8b 40 08             	mov    0x8(%eax),%eax
c0106809:	85 c0                	test   %eax,%eax
c010680b:	0f 84 af 01 00 00    	je     c01069c0 <__ssprint_r+0x1d0>
c0106811:	31 c9                	xor    %ecx,%ecx
c0106813:	31 d2                	xor    %edx,%edx
c0106815:	8b 03                	mov    (%ebx),%eax
c0106817:	89 ce                	mov    %ecx,%esi
c0106819:	85 f6                	test   %esi,%esi
c010681b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c010681e:	0f 84 ec 00 00 00    	je     c0106910 <__ssprint_r+0x120>
c0106824:	8b 53 08             	mov    0x8(%ebx),%edx
c0106827:	39 d6                	cmp    %edx,%esi
c0106829:	0f 82 fc 00 00 00    	jb     c010692b <__ssprint_r+0x13b>
c010682f:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c0106833:	66 f7 c1 80 04       	test   $0x480,%cx
c0106838:	0f 84 fa 00 00 00    	je     c0106938 <__ssprint_r+0x148>
c010683e:	8b 53 10             	mov    0x10(%ebx),%edx
c0106841:	29 d0                	sub    %edx,%eax
c0106843:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106846:	8b 43 14             	mov    0x14(%ebx),%eax
c0106849:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010684c:	8d 04 40             	lea    (%eax,%eax,2),%eax
c010684f:	89 c2                	mov    %eax,%edx
c0106851:	c1 ea 1f             	shr    $0x1f,%edx
c0106854:	01 d0                	add    %edx,%eax
c0106856:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106859:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010685c:	d1 7d e0             	sarl   -0x20(%ebp)
c010685f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c0106863:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0106866:	0f 83 34 01 00 00    	jae    c01069a0 <__ssprint_r+0x1b0>
c010686c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010686f:	80 e5 04             	and    $0x4,%ch
c0106872:	0f 84 c8 00 00 00    	je     c0106940 <__ssprint_r+0x150>
c0106878:	89 44 24 04          	mov    %eax,0x4(%esp)
c010687c:	8b 45 08             	mov    0x8(%ebp),%eax
c010687f:	89 04 24             	mov    %eax,(%esp)
c0106882:	e8 59 e8 ff ff       	call   c01050e0 <_malloc_r>
c0106887:	85 c0                	test   %eax,%eax
c0106889:	89 c2                	mov    %eax,%edx
c010688b:	0f 84 e1 00 00 00    	je     c0106972 <__ssprint_r+0x182>
c0106891:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106894:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0106897:	89 44 24 08          	mov    %eax,0x8(%esp)
c010689b:	8b 43 10             	mov    0x10(%ebx),%eax
c010689e:	89 14 24             	mov    %edx,(%esp)
c01068a1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01068a5:	e8 16 b2 ff ff       	call   c0101ac0 <memcpy>
c01068aa:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c01068ae:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01068b1:	66 25 7f fb          	and    $0xfb7f,%ax
c01068b5:	0c 80                	or     $0x80,%al
c01068b7:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c01068bb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01068be:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01068c1:	89 53 10             	mov    %edx,0x10(%ebx)
c01068c4:	89 4b 14             	mov    %ecx,0x14(%ebx)
c01068c7:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c01068ca:	01 d0                	add    %edx,%eax
c01068cc:	89 03                	mov    %eax,(%ebx)
c01068ce:	89 f2                	mov    %esi,%edx
c01068d0:	89 4b 08             	mov    %ecx,0x8(%ebx)
c01068d3:	89 f1                	mov    %esi,%ecx
c01068d5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01068d9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01068dc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01068df:	89 04 24             	mov    %eax,(%esp)
c01068e2:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01068e5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01068e9:	e8 22 13 00 00       	call   c0107c10 <memmove>
c01068ee:	8b 03                	mov    (%ebx),%eax
c01068f0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01068f3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01068f6:	29 53 08             	sub    %edx,0x8(%ebx)
c01068f9:	01 c8                	add    %ecx,%eax
c01068fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01068fe:	89 03                	mov    %eax,(%ebx)
c0106900:	8b 51 08             	mov    0x8(%ecx),%edx
c0106903:	29 f2                	sub    %esi,%edx
c0106905:	85 d2                	test   %edx,%edx
c0106907:	89 51 08             	mov    %edx,0x8(%ecx)
c010690a:	0f 84 98 00 00 00    	je     c01069a8 <__ssprint_r+0x1b8>
c0106910:	8b 77 04             	mov    0x4(%edi),%esi
c0106913:	83 c7 08             	add    $0x8,%edi
c0106916:	8b 4f f8             	mov    -0x8(%edi),%ecx
c0106919:	85 f6                	test   %esi,%esi
c010691b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010691e:	74 f0                	je     c0106910 <__ssprint_r+0x120>
c0106920:	8b 53 08             	mov    0x8(%ebx),%edx
c0106923:	39 d6                	cmp    %edx,%esi
c0106925:	0f 83 04 ff ff ff    	jae    c010682f <__ssprint_r+0x3f>
c010692b:	89 f2                	mov    %esi,%edx
c010692d:	89 f1                	mov    %esi,%ecx
c010692f:	eb a4                	jmp    c01068d5 <__ssprint_r+0xe5>
c0106931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106938:	89 d1                	mov    %edx,%ecx
c010693a:	eb 99                	jmp    c01068d5 <__ssprint_r+0xe5>
c010693c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106940:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106944:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106947:	89 44 24 04          	mov    %eax,0x4(%esp)
c010694b:	8b 45 08             	mov    0x8(%ebp),%eax
c010694e:	89 04 24             	mov    %eax,(%esp)
c0106951:	e8 4a 13 00 00       	call   c0107ca0 <_realloc_r>
c0106956:	85 c0                	test   %eax,%eax
c0106958:	89 c2                	mov    %eax,%edx
c010695a:	0f 85 5b ff ff ff    	jne    c01068bb <__ssprint_r+0xcb>
c0106960:	8b 43 10             	mov    0x10(%ebx),%eax
c0106963:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106967:	8b 45 08             	mov    0x8(%ebp),%eax
c010696a:	89 04 24             	mov    %eax,(%esp)
c010696d:	e8 3e 10 00 00       	call   c01079b0 <_free_r>
c0106972:	8b 45 08             	mov    0x8(%ebp),%eax
c0106975:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010697b:	8b 45 10             	mov    0x10(%ebp),%eax
c010697e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106983:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010698a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106991:	83 c4 2c             	add    $0x2c,%esp
c0106994:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106999:	5b                   	pop    %ebx
c010699a:	5e                   	pop    %esi
c010699b:	5f                   	pop    %edi
c010699c:	5d                   	pop    %ebp
c010699d:	c3                   	ret    
c010699e:	66 90                	xchg   %ax,%ax
c01069a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01069a3:	e9 c7 fe ff ff       	jmp    c010686f <__ssprint_r+0x7f>
c01069a8:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c01069af:	83 c4 2c             	add    $0x2c,%esp
c01069b2:	31 c0                	xor    %eax,%eax
c01069b4:	5b                   	pop    %ebx
c01069b5:	5e                   	pop    %esi
c01069b6:	5f                   	pop    %edi
c01069b7:	5d                   	pop    %ebp
c01069b8:	c3                   	ret    
c01069b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01069c0:	8b 45 10             	mov    0x10(%ebp),%eax
c01069c3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c01069ca:	83 c4 2c             	add    $0x2c,%esp
c01069cd:	31 c0                	xor    %eax,%eax
c01069cf:	5b                   	pop    %ebx
c01069d0:	5e                   	pop    %esi
c01069d1:	5f                   	pop    %edi
c01069d2:	5d                   	pop    %ebp
c01069d3:	c3                   	ret    
c01069d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01069da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c01069e0 <_svfiprintf_r>:
c01069e0:	55                   	push   %ebp
c01069e1:	89 e5                	mov    %esp,%ebp
c01069e3:	57                   	push   %edi
c01069e4:	56                   	push   %esi
c01069e5:	53                   	push   %ebx
c01069e6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c01069ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01069ef:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c01069f3:	74 0b                	je     c0106a00 <_svfiprintf_r+0x20>
c01069f5:	8b 50 10             	mov    0x10(%eax),%edx
c01069f8:	85 d2                	test   %edx,%edx
c01069fa:	0f 84 1c 0d 00 00    	je     c010771c <_svfiprintf_r+0xd3c>
c0106a00:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106a03:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106a06:	89 c6                	mov    %eax,%esi
c0106a08:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0106a0e:	29 d8                	sub    %ebx,%eax
c0106a10:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c0106a17:	00 00 00 
c0106a1a:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106a21:	00 00 00 
c0106a24:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0106a2b:	00 00 00 
c0106a2e:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c0106a35:	00 00 00 
c0106a38:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c0106a3e:	8b 45 10             	mov    0x10(%ebp),%eax
c0106a41:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0106a44:	0f b6 00             	movzbl (%eax),%eax
c0106a47:	84 c0                	test   %al,%al
c0106a49:	74 58                	je     c0106aa3 <_svfiprintf_r+0xc3>
c0106a4b:	3c 25                	cmp    $0x25,%al
c0106a4d:	75 13                	jne    c0106a62 <_svfiprintf_r+0x82>
c0106a4f:	eb 52                	jmp    c0106aa3 <_svfiprintf_r+0xc3>
c0106a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106a58:	84 c0                	test   %al,%al
c0106a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106a60:	74 0a                	je     c0106a6c <_svfiprintf_r+0x8c>
c0106a62:	83 c3 01             	add    $0x1,%ebx
c0106a65:	0f b6 03             	movzbl (%ebx),%eax
c0106a68:	3c 25                	cmp    $0x25,%al
c0106a6a:	75 ec                	jne    c0106a58 <_svfiprintf_r+0x78>
c0106a6c:	89 df                	mov    %ebx,%edi
c0106a6e:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106a71:	74 30                	je     c0106aa3 <_svfiprintf_r+0xc3>
c0106a73:	8b 45 10             	mov    0x10(%ebp),%eax
c0106a76:	83 c6 08             	add    $0x8,%esi
c0106a79:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106a7c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106a82:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106a85:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106a8b:	83 c0 01             	add    $0x1,%eax
c0106a8e:	83 f8 07             	cmp    $0x7,%eax
c0106a91:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106a97:	0f 8f eb 0a 00 00    	jg     c0107588 <_svfiprintf_r+0xba8>
c0106a9d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106aa3:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106aa6:	0f 84 11 09 00 00    	je     c01073bd <_svfiprintf_r+0x9dd>
c0106aac:	8d 43 01             	lea    0x1(%ebx),%eax
c0106aaf:	31 ff                	xor    %edi,%edi
c0106ab1:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106ab8:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c0106abf:	ff ff ff 
c0106ac2:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0106ac9:	00 00 00 
c0106acc:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c0106ad3:	00 00 00 
c0106ad6:	8d 50 01             	lea    0x1(%eax),%edx
c0106ad9:	0f be 00             	movsbl (%eax),%eax
c0106adc:	8d 48 e0             	lea    -0x20(%eax),%ecx
c0106adf:	83 f9 58             	cmp    $0x58,%ecx
c0106ae2:	0f 87 63 03 00 00    	ja     c0106e4b <_svfiprintf_r+0x46b>
c0106ae8:	ff 24 8d a8 8e 10 c0 	jmp    *-0x3fef7158(,%ecx,4)
c0106aef:	90                   	nop
c0106af0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106af7:	89 d0                	mov    %edx,%eax
c0106af9:	eb db                	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0106afb:	8b 45 14             	mov    0x14(%ebp),%eax
c0106afe:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106b01:	8b 00                	mov    (%eax),%eax
c0106b03:	83 c3 04             	add    $0x4,%ebx
c0106b06:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0106b09:	85 c0                	test   %eax,%eax
c0106b0b:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c0106b11:	79 e4                	jns    c0106af7 <_svfiprintf_r+0x117>
c0106b13:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c0106b19:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c0106b20:	89 d0                	mov    %edx,%eax
c0106b22:	eb b2                	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0106b24:	bf 2b 00 00 00       	mov    $0x2b,%edi
c0106b29:	89 d0                	mov    %edx,%eax
c0106b2b:	eb a9                	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0106b2d:	8b 45 14             	mov    0x14(%ebp),%eax
c0106b30:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106b37:	89 55 10             	mov    %edx,0x10(%ebp)
c0106b3a:	ba 02 00 00 00       	mov    $0x2,%edx
c0106b3f:	8b 08                	mov    (%eax),%ecx
c0106b41:	83 c0 04             	add    $0x4,%eax
c0106b44:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c0106b4b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c0106b52:	89 45 14             	mov    %eax,0x14(%ebp)
c0106b55:	c7 85 44 ff ff ff 5b 	movl   $0xc0108b5b,-0xbc(%ebp)
c0106b5c:	8b 10 c0 
c0106b5f:	90                   	nop
c0106b60:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106b67:	31 ff                	xor    %edi,%edi
c0106b69:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c0106b6f:	89 d8                	mov    %ebx,%eax
c0106b71:	24 7f                	and    $0x7f,%al
c0106b73:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c0106b7a:	0f 48 c3             	cmovs  %ebx,%eax
c0106b7d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106b83:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106b89:	85 c0                	test   %eax,%eax
c0106b8b:	75 08                	jne    c0106b95 <_svfiprintf_r+0x1b5>
c0106b8d:	85 c9                	test   %ecx,%ecx
c0106b8f:	0f 84 03 08 00 00    	je     c0107398 <_svfiprintf_r+0x9b8>
c0106b95:	80 fa 01             	cmp    $0x1,%dl
c0106b98:	0f 84 8a 0a 00 00    	je     c0107628 <_svfiprintf_r+0xc48>
c0106b9e:	80 fa 02             	cmp    $0x2,%dl
c0106ba1:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106ba4:	0f 85 86 01 00 00    	jne    c0106d30 <_svfiprintf_r+0x350>
c0106baa:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106bb0:	89 c8                	mov    %ecx,%eax
c0106bb2:	83 eb 01             	sub    $0x1,%ebx
c0106bb5:	83 e0 0f             	and    $0xf,%eax
c0106bb8:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c0106bbc:	c1 e9 04             	shr    $0x4,%ecx
c0106bbf:	85 c9                	test   %ecx,%ecx
c0106bc1:	88 03                	mov    %al,(%ebx)
c0106bc3:	75 eb                	jne    c0106bb0 <_svfiprintf_r+0x1d0>
c0106bc5:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106bc8:	29 d8                	sub    %ebx,%eax
c0106bca:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106bd0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106bd6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c0106bdc:	39 c1                	cmp    %eax,%ecx
c0106bde:	0f 4d c1             	cmovge %ecx,%eax
c0106be1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106be7:	89 f8                	mov    %edi,%eax
c0106be9:	3c 01                	cmp    $0x1,%al
c0106beb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c0106bf2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106bf8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c0106bfe:	89 d0                	mov    %edx,%eax
c0106c00:	89 cf                	mov    %ecx,%edi
c0106c02:	83 c0 02             	add    $0x2,%eax
c0106c05:	83 e7 02             	and    $0x2,%edi
c0106c08:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c0106c0e:	89 cf                	mov    %ecx,%edi
c0106c10:	0f 44 c2             	cmove  %edx,%eax
c0106c13:	81 e7 84 00 00 00    	and    $0x84,%edi
c0106c19:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106c1f:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0106c25:	0f 85 cd 04 00 00    	jne    c01070f8 <_svfiprintf_r+0x718>
c0106c2b:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106c31:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106c37:	85 ff                	test   %edi,%edi
c0106c39:	0f 8e b9 04 00 00    	jle    c01070f8 <_svfiprintf_r+0x718>
c0106c3f:	83 ff 10             	cmp    $0x10,%edi
c0106c42:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106c48:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c4e:	7e 7c                	jle    c0106ccc <_svfiprintf_r+0x2ec>
c0106c50:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c0106c56:	89 f1                	mov    %esi,%ecx
c0106c58:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106c5b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106c5e:	eb 08                	jmp    c0106c68 <_svfiprintf_r+0x288>
c0106c60:	83 ef 10             	sub    $0x10,%edi
c0106c63:	83 ff 10             	cmp    $0x10,%edi
c0106c66:	7e 5c                	jle    c0106cc4 <_svfiprintf_r+0x2e4>
c0106c68:	83 c0 01             	add    $0x1,%eax
c0106c6b:	83 c2 10             	add    $0x10,%edx
c0106c6e:	c7 01 1c 90 10 c0    	movl   $0xc010901c,(%ecx)
c0106c74:	83 c1 08             	add    $0x8,%ecx
c0106c77:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106c7e:	83 f8 07             	cmp    $0x7,%eax
c0106c81:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c87:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c8d:	7e d1                	jle    c0106c60 <_svfiprintf_r+0x280>
c0106c8f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106c95:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106c99:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106c9d:	89 1c 24             	mov    %ebx,(%esp)
c0106ca0:	e8 4b fb ff ff       	call   c01067f0 <__ssprint_r>
c0106ca5:	85 c0                	test   %eax,%eax
c0106ca7:	0f 85 3b 07 00 00    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0106cad:	83 ef 10             	sub    $0x10,%edi
c0106cb0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106cb6:	83 ff 10             	cmp    $0x10,%edi
c0106cb9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106cbf:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106cc2:	7f a4                	jg     c0106c68 <_svfiprintf_r+0x288>
c0106cc4:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c0106cca:	89 ce                	mov    %ecx,%esi
c0106ccc:	83 c0 01             	add    $0x1,%eax
c0106ccf:	01 fa                	add    %edi,%edx
c0106cd1:	c7 06 1c 90 10 c0    	movl   $0xc010901c,(%esi)
c0106cd7:	83 c6 08             	add    $0x8,%esi
c0106cda:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106cdd:	83 f8 07             	cmp    $0x7,%eax
c0106ce0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106ce6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106cec:	0f 8e 12 04 00 00    	jle    c0107104 <_svfiprintf_r+0x724>
c0106cf2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106cf8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106cfc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106cff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106d03:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d06:	89 04 24             	mov    %eax,(%esp)
c0106d09:	e8 e2 fa ff ff       	call   c01067f0 <__ssprint_r>
c0106d0e:	85 c0                	test   %eax,%eax
c0106d10:	0f 85 d2 06 00 00    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0106d16:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106d1c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106d1f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106d25:	e9 da 03 00 00       	jmp    c0107104 <_svfiprintf_r+0x724>
c0106d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106d30:	89 c8                	mov    %ecx,%eax
c0106d32:	83 eb 01             	sub    $0x1,%ebx
c0106d35:	83 e0 07             	and    $0x7,%eax
c0106d38:	c1 e9 03             	shr    $0x3,%ecx
c0106d3b:	83 c0 30             	add    $0x30,%eax
c0106d3e:	85 c9                	test   %ecx,%ecx
c0106d40:	88 03                	mov    %al,(%ebx)
c0106d42:	75 ec                	jne    c0106d30 <_svfiprintf_r+0x350>
c0106d44:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106d4b:	89 da                	mov    %ebx,%edx
c0106d4d:	0f 84 72 fe ff ff    	je     c0106bc5 <_svfiprintf_r+0x1e5>
c0106d53:	3c 30                	cmp    $0x30,%al
c0106d55:	0f 84 6a fe ff ff    	je     c0106bc5 <_svfiprintf_r+0x1e5>
c0106d5b:	83 eb 01             	sub    $0x1,%ebx
c0106d5e:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106d61:	29 d8                	sub    %ebx,%eax
c0106d63:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0106d67:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106d6d:	e9 5e fe ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c0106d72:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106d79:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106d80:	89 55 10             	mov    %edx,0x10(%ebp)
c0106d83:	8b 45 14             	mov    0x14(%ebp),%eax
c0106d86:	0f 85 48 01 00 00    	jne    c0106ed4 <_svfiprintf_r+0x4f4>
c0106d8c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106d93:	0f 84 3b 01 00 00    	je     c0106ed4 <_svfiprintf_r+0x4f4>
c0106d99:	0f b7 08             	movzwl (%eax),%ecx
c0106d9c:	83 c0 04             	add    $0x4,%eax
c0106d9f:	31 d2                	xor    %edx,%edx
c0106da1:	89 45 14             	mov    %eax,0x14(%ebp)
c0106da4:	e9 b7 fd ff ff       	jmp    c0106b60 <_svfiprintf_r+0x180>
c0106da9:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106db0:	89 f8                	mov    %edi,%eax
c0106db2:	89 55 10             	mov    %edx,0x10(%ebp)
c0106db5:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106dbb:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106dc2:	8b 45 14             	mov    0x14(%ebp),%eax
c0106dc5:	75 0d                	jne    c0106dd4 <_svfiprintf_r+0x3f4>
c0106dc7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106dce:	0f 85 f2 08 00 00    	jne    c01076c6 <_svfiprintf_r+0xce6>
c0106dd4:	8b 08                	mov    (%eax),%ecx
c0106dd6:	83 c0 04             	add    $0x4,%eax
c0106dd9:	89 45 14             	mov    %eax,0x14(%ebp)
c0106ddc:	85 c9                	test   %ecx,%ecx
c0106dde:	0f 88 f3 08 00 00    	js     c01076d7 <_svfiprintf_r+0xcf7>
c0106de4:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106deb:	ba 01 00 00 00       	mov    $0x1,%edx
c0106df0:	e9 74 fd ff ff       	jmp    c0106b69 <_svfiprintf_r+0x189>
c0106df5:	0f be 02             	movsbl (%edx),%eax
c0106df8:	8d 5a 01             	lea    0x1(%edx),%ebx
c0106dfb:	83 f8 2a             	cmp    $0x2a,%eax
c0106dfe:	0f 84 af 09 00 00    	je     c01077b3 <_svfiprintf_r+0xdd3>
c0106e04:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106e07:	31 d2                	xor    %edx,%edx
c0106e09:	83 f9 09             	cmp    $0x9,%ecx
c0106e0c:	0f 87 90 09 00 00    	ja     c01077a2 <_svfiprintf_r+0xdc2>
c0106e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106e18:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0106e1b:	83 c3 01             	add    $0x1,%ebx
c0106e1e:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c0106e21:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c0106e25:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106e28:	83 f9 09             	cmp    $0x9,%ecx
c0106e2b:	76 eb                	jbe    c0106e18 <_svfiprintf_r+0x438>
c0106e2d:	85 d2                	test   %edx,%edx
c0106e2f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0106e34:	0f 48 d1             	cmovs  %ecx,%edx
c0106e37:	8d 48 e0             	lea    -0x20(%eax),%ecx
c0106e3a:	83 f9 58             	cmp    $0x58,%ecx
c0106e3d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c0106e43:	89 da                	mov    %ebx,%edx
c0106e45:	0f 86 9d fc ff ff    	jbe    c0106ae8 <_svfiprintf_r+0x108>
c0106e4b:	89 fb                	mov    %edi,%ebx
c0106e4d:	85 c0                	test   %eax,%eax
c0106e4f:	89 55 10             	mov    %edx,0x10(%ebp)
c0106e52:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106e58:	0f 84 5f 05 00 00    	je     c01073bd <_svfiprintf_r+0x9dd>
c0106e5e:	88 45 80             	mov    %al,-0x80(%ebp)
c0106e61:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106e64:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106e6b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106e72:	00 00 00 
c0106e75:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c0106e7c:	00 00 00 
c0106e7f:	e9 5a 01 00 00       	jmp    c0106fde <_svfiprintf_r+0x5fe>
c0106e84:	31 db                	xor    %ebx,%ebx
c0106e86:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106e90:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106e93:	83 c2 01             	add    $0x1,%edx
c0106e96:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106e99:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c0106e9d:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106ea0:	83 f9 09             	cmp    $0x9,%ecx
c0106ea3:	76 eb                	jbe    c0106e90 <_svfiprintf_r+0x4b0>
c0106ea5:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c0106eab:	e9 2c fc ff ff       	jmp    c0106adc <_svfiprintf_r+0xfc>
c0106eb0:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106eb7:	00 00 00 
c0106eba:	89 d0                	mov    %edx,%eax
c0106ebc:	e9 15 fc ff ff       	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0106ec1:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106ec8:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ecb:	8b 45 14             	mov    0x14(%ebp),%eax
c0106ece:	0f 84 b8 fe ff ff    	je     c0106d8c <_svfiprintf_r+0x3ac>
c0106ed4:	8b 08                	mov    (%eax),%ecx
c0106ed6:	83 c0 04             	add    $0x4,%eax
c0106ed9:	31 d2                	xor    %edx,%edx
c0106edb:	89 45 14             	mov    %eax,0x14(%ebp)
c0106ede:	e9 7d fc ff ff       	jmp    c0106b60 <_svfiprintf_r+0x180>
c0106ee3:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106eea:	89 f8                	mov    %edi,%eax
c0106eec:	89 55 10             	mov    %edx,0x10(%ebp)
c0106eef:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106ef5:	0f 85 a2 07 00 00    	jne    c010769d <_svfiprintf_r+0xcbd>
c0106efb:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106f02:	0f 84 95 07 00 00    	je     c010769d <_svfiprintf_r+0xcbd>
c0106f08:	8b 45 14             	mov    0x14(%ebp),%eax
c0106f0b:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c0106f12:	8b 00                	mov    (%eax),%eax
c0106f14:	66 89 18             	mov    %bx,(%eax)
c0106f17:	8b 45 14             	mov    0x14(%ebp),%eax
c0106f1a:	83 c0 04             	add    $0x4,%eax
c0106f1d:	89 45 14             	mov    %eax,0x14(%ebp)
c0106f20:	e9 19 fb ff ff       	jmp    c0106a3e <_svfiprintf_r+0x5e>
c0106f25:	89 fb                	mov    %edi,%ebx
c0106f27:	89 55 10             	mov    %edx,0x10(%ebp)
c0106f2a:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106f30:	c7 85 44 ff ff ff 5b 	movl   $0xc0108b5b,-0xbc(%ebp)
c0106f37:	8b 10 c0 
c0106f3a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106f41:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106f44:	75 0d                	jne    c0106f53 <_svfiprintf_r+0x573>
c0106f46:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106f4d:	0f 85 65 07 00 00    	jne    c01076b8 <_svfiprintf_r+0xcd8>
c0106f53:	8b 0b                	mov    (%ebx),%ecx
c0106f55:	83 c3 04             	add    $0x4,%ebx
c0106f58:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0106f5b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106f62:	ba 02 00 00 00       	mov    $0x2,%edx
c0106f67:	0f 84 f3 fb ff ff    	je     c0106b60 <_svfiprintf_r+0x180>
c0106f6d:	85 c9                	test   %ecx,%ecx
c0106f6f:	0f 84 eb fb ff ff    	je     c0106b60 <_svfiprintf_r+0x180>
c0106f75:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c0106f7c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c0106f82:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106f89:	e9 d2 fb ff ff       	jmp    c0106b60 <_svfiprintf_r+0x180>
c0106f8e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c0106f95:	89 d0                	mov    %edx,%eax
c0106f97:	e9 3a fb ff ff       	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0106f9c:	89 f8                	mov    %edi,%eax
c0106f9e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106fa1:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106fa7:	e9 0f fe ff ff       	jmp    c0106dbb <_svfiprintf_r+0x3db>
c0106fac:	8b 45 14             	mov    0x14(%ebp),%eax
c0106faf:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106fb2:	89 55 10             	mov    %edx,0x10(%ebp)
c0106fb5:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106fbc:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106fc3:	00 00 00 
c0106fc6:	8b 00                	mov    (%eax),%eax
c0106fc8:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c0106fcf:	00 00 00 
c0106fd2:	88 45 80             	mov    %al,-0x80(%ebp)
c0106fd5:	8b 45 14             	mov    0x14(%ebp),%eax
c0106fd8:	83 c0 04             	add    $0x4,%eax
c0106fdb:	89 45 14             	mov    %eax,0x14(%ebp)
c0106fde:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106fe5:	00 00 00 
c0106fe8:	e9 05 fc ff ff       	jmp    c0106bf2 <_svfiprintf_r+0x212>
c0106fed:	89 fb                	mov    %edi,%ebx
c0106fef:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ff2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106ff8:	c7 85 44 ff ff ff 4a 	movl   $0xc0108b4a,-0xbc(%ebp)
c0106fff:	8b 10 c0 
c0107002:	e9 33 ff ff ff       	jmp    c0106f3a <_svfiprintf_r+0x55a>
c0107007:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c010700e:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0107015:	89 55 10             	mov    %edx,0x10(%ebp)
c0107018:	8b 45 14             	mov    0x14(%ebp),%eax
c010701b:	75 39                	jne    c0107056 <_svfiprintf_r+0x676>
c010701d:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0107024:	74 30                	je     c0107056 <_svfiprintf_r+0x676>
c0107026:	0f b7 08             	movzwl (%eax),%ecx
c0107029:	83 c0 04             	add    $0x4,%eax
c010702c:	ba 01 00 00 00       	mov    $0x1,%edx
c0107031:	89 45 14             	mov    %eax,0x14(%ebp)
c0107034:	e9 27 fb ff ff       	jmp    c0106b60 <_svfiprintf_r+0x180>
c0107039:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c0107040:	89 d0                	mov    %edx,%eax
c0107042:	e9 8f fa ff ff       	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c0107047:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c010704e:	89 55 10             	mov    %edx,0x10(%ebp)
c0107051:	8b 45 14             	mov    0x14(%ebp),%eax
c0107054:	74 c7                	je     c010701d <_svfiprintf_r+0x63d>
c0107056:	8b 08                	mov    (%eax),%ecx
c0107058:	83 c0 04             	add    $0x4,%eax
c010705b:	ba 01 00 00 00       	mov    $0x1,%edx
c0107060:	89 45 14             	mov    %eax,0x14(%ebp)
c0107063:	e9 f8 fa ff ff       	jmp    c0106b60 <_svfiprintf_r+0x180>
c0107068:	8b 45 14             	mov    0x14(%ebp),%eax
c010706b:	89 55 10             	mov    %edx,0x10(%ebp)
c010706e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0107075:	8b 18                	mov    (%eax),%ebx
c0107077:	8d 50 04             	lea    0x4(%eax),%edx
c010707a:	85 db                	test   %ebx,%ebx
c010707c:	0f 84 cc 06 00 00    	je     c010774e <_svfiprintf_r+0xd6e>
c0107082:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107088:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c010708e:	85 ff                	test   %edi,%edi
c0107090:	0f 88 59 06 00 00    	js     c01076ef <_svfiprintf_r+0xd0f>
c0107096:	89 7c 24 08          	mov    %edi,0x8(%esp)
c010709a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01070a1:	00 
c01070a2:	89 1c 24             	mov    %ebx,(%esp)
c01070a5:	e8 76 e7 ff ff       	call   c0105820 <memchr>
c01070aa:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01070b0:	85 c0                	test   %eax,%eax
c01070b2:	0f 84 c5 06 00 00    	je     c010777d <_svfiprintf_r+0xd9d>
c01070b8:	29 d8                	sub    %ebx,%eax
c01070ba:	39 f8                	cmp    %edi,%eax
c01070bc:	0f 4f c7             	cmovg  %edi,%eax
c01070bf:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01070c6:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01070cc:	89 55 14             	mov    %edx,0x14(%ebp)
c01070cf:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01070d6:	00 00 00 
c01070d9:	e9 f2 fa ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c01070de:	89 f8                	mov    %edi,%eax
c01070e0:	84 c0                	test   %al,%al
c01070e2:	b8 20 00 00 00       	mov    $0x20,%eax
c01070e7:	0f 44 f8             	cmove  %eax,%edi
c01070ea:	89 d0                	mov    %edx,%eax
c01070ec:	e9 e5 f9 ff ff       	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c01070f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01070f8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01070fe:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107104:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c010710b:	74 2e                	je     c010713b <_svfiprintf_r+0x75b>
c010710d:	83 c0 01             	add    $0x1,%eax
c0107110:	83 c2 01             	add    $0x1,%edx
c0107113:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0107119:	83 c6 08             	add    $0x8,%esi
c010711c:	89 4e f8             	mov    %ecx,-0x8(%esi)
c010711f:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0107126:	83 f8 07             	cmp    $0x7,%eax
c0107129:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010712f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0107135:	0f 8f b5 04 00 00    	jg     c01075f0 <_svfiprintf_r+0xc10>
c010713b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0107141:	85 c9                	test   %ecx,%ecx
c0107143:	74 2e                	je     c0107173 <_svfiprintf_r+0x793>
c0107145:	83 c0 01             	add    $0x1,%eax
c0107148:	83 c2 02             	add    $0x2,%edx
c010714b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0107151:	83 c6 08             	add    $0x8,%esi
c0107154:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0107157:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c010715e:	83 f8 07             	cmp    $0x7,%eax
c0107161:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107167:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010716d:	0f 8f 45 04 00 00    	jg     c01075b8 <_svfiprintf_r+0xbd8>
c0107173:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c010717a:	00 00 00 
c010717d:	0f 84 9d 02 00 00    	je     c0107420 <_svfiprintf_r+0xa40>
c0107183:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107189:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c010718f:	85 ff                	test   %edi,%edi
c0107191:	0f 8e e1 00 00 00    	jle    c0107278 <_svfiprintf_r+0x898>
c0107197:	83 ff 10             	cmp    $0x10,%edi
c010719a:	0f 8e 7c 00 00 00    	jle    c010721c <_svfiprintf_r+0x83c>
c01071a0:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c01071a6:	89 f1                	mov    %esi,%ecx
c01071a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01071ab:	8b 75 0c             	mov    0xc(%ebp),%esi
c01071ae:	eb 08                	jmp    c01071b8 <_svfiprintf_r+0x7d8>
c01071b0:	83 ef 10             	sub    $0x10,%edi
c01071b3:	83 ff 10             	cmp    $0x10,%edi
c01071b6:	7e 5c                	jle    c0107214 <_svfiprintf_r+0x834>
c01071b8:	83 c0 01             	add    $0x1,%eax
c01071bb:	83 c2 10             	add    $0x10,%edx
c01071be:	c7 01 0c 90 10 c0    	movl   $0xc010900c,(%ecx)
c01071c4:	83 c1 08             	add    $0x8,%ecx
c01071c7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c01071ce:	83 f8 07             	cmp    $0x7,%eax
c01071d1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01071d7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01071dd:	7e d1                	jle    c01071b0 <_svfiprintf_r+0x7d0>
c01071df:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01071e5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01071e9:	89 74 24 04          	mov    %esi,0x4(%esp)
c01071ed:	89 1c 24             	mov    %ebx,(%esp)
c01071f0:	e8 fb f5 ff ff       	call   c01067f0 <__ssprint_r>
c01071f5:	85 c0                	test   %eax,%eax
c01071f7:	0f 85 eb 01 00 00    	jne    c01073e8 <_svfiprintf_r+0xa08>
c01071fd:	83 ef 10             	sub    $0x10,%edi
c0107200:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107206:	83 ff 10             	cmp    $0x10,%edi
c0107209:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010720f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0107212:	7f a4                	jg     c01071b8 <_svfiprintf_r+0x7d8>
c0107214:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c010721a:	89 ce                	mov    %ecx,%esi
c010721c:	83 c0 01             	add    $0x1,%eax
c010721f:	01 fa                	add    %edi,%edx
c0107221:	c7 06 0c 90 10 c0    	movl   $0xc010900c,(%esi)
c0107227:	83 c6 08             	add    $0x8,%esi
c010722a:	89 7e fc             	mov    %edi,-0x4(%esi)
c010722d:	83 f8 07             	cmp    $0x7,%eax
c0107230:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107236:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010723c:	7e 3a                	jle    c0107278 <_svfiprintf_r+0x898>
c010723e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107244:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107248:	8b 45 0c             	mov    0xc(%ebp),%eax
c010724b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010724f:	8b 45 08             	mov    0x8(%ebp),%eax
c0107252:	89 04 24             	mov    %eax,(%esp)
c0107255:	e8 96 f5 ff ff       	call   c01067f0 <__ssprint_r>
c010725a:	85 c0                	test   %eax,%eax
c010725c:	0f 85 86 01 00 00    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0107262:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107268:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010726b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107278:	89 1e                	mov    %ebx,(%esi)
c010727a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c0107280:	83 c0 01             	add    $0x1,%eax
c0107283:	83 c6 08             	add    $0x8,%esi
c0107286:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010728c:	89 5e fc             	mov    %ebx,-0x4(%esi)
c010728f:	01 da                	add    %ebx,%edx
c0107291:	83 f8 07             	cmp    $0x7,%eax
c0107294:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010729a:	0f 8f 80 02 00 00    	jg     c0107520 <_svfiprintf_r+0xb40>
c01072a0:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c01072a7:	0f 84 b9 00 00 00    	je     c0107366 <_svfiprintf_r+0x986>
c01072ad:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c01072b3:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c01072b9:	85 ff                	test   %edi,%edi
c01072bb:	0f 8e a5 00 00 00    	jle    c0107366 <_svfiprintf_r+0x986>
c01072c1:	83 ff 10             	cmp    $0x10,%edi
c01072c4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01072ca:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01072d0:	7e 71                	jle    c0107343 <_svfiprintf_r+0x963>
c01072d2:	89 f1                	mov    %esi,%ecx
c01072d4:	8b 75 08             	mov    0x8(%ebp),%esi
c01072d7:	eb 0f                	jmp    c01072e8 <_svfiprintf_r+0x908>
c01072d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01072e0:	83 ef 10             	sub    $0x10,%edi
c01072e3:	83 ff 10             	cmp    $0x10,%edi
c01072e6:	7e 59                	jle    c0107341 <_svfiprintf_r+0x961>
c01072e8:	83 c0 01             	add    $0x1,%eax
c01072eb:	83 c2 10             	add    $0x10,%edx
c01072ee:	c7 01 1c 90 10 c0    	movl   $0xc010901c,(%ecx)
c01072f4:	83 c1 08             	add    $0x8,%ecx
c01072f7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c01072fe:	83 f8 07             	cmp    $0x7,%eax
c0107301:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107307:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010730d:	7e d1                	jle    c01072e0 <_svfiprintf_r+0x900>
c010730f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107312:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107316:	89 34 24             	mov    %esi,(%esp)
c0107319:	89 44 24 04          	mov    %eax,0x4(%esp)
c010731d:	e8 ce f4 ff ff       	call   c01067f0 <__ssprint_r>
c0107322:	85 c0                	test   %eax,%eax
c0107324:	0f 85 be 00 00 00    	jne    c01073e8 <_svfiprintf_r+0xa08>
c010732a:	83 ef 10             	sub    $0x10,%edi
c010732d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107333:	83 ff 10             	cmp    $0x10,%edi
c0107336:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010733c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c010733f:	7f a7                	jg     c01072e8 <_svfiprintf_r+0x908>
c0107341:	89 ce                	mov    %ecx,%esi
c0107343:	83 c0 01             	add    $0x1,%eax
c0107346:	01 fa                	add    %edi,%edx
c0107348:	83 f8 07             	cmp    $0x7,%eax
c010734b:	c7 06 1c 90 10 c0    	movl   $0xc010901c,(%esi)
c0107351:	89 7e 04             	mov    %edi,0x4(%esi)
c0107354:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010735a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0107360:	0f 8f ee 02 00 00    	jg     c0107654 <_svfiprintf_r+0xc74>
c0107366:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c010736c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0107372:	39 c6                	cmp    %eax,%esi
c0107374:	0f 4d c6             	cmovge %esi,%eax
c0107377:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c010737d:	85 d2                	test   %edx,%edx
c010737f:	0f 85 d3 01 00 00    	jne    c0107558 <_svfiprintf_r+0xb78>
c0107385:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c010738c:	00 00 00 
c010738f:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0107392:	e9 a7 f6 ff ff       	jmp    c0106a3e <_svfiprintf_r+0x5e>
c0107397:	90                   	nop
c0107398:	84 d2                	test   %dl,%dl
c010739a:	75 6c                	jne    c0107408 <_svfiprintf_r+0xa28>
c010739c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c01073a3:	74 63                	je     c0107408 <_svfiprintf_r+0xa28>
c01073a5:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c01073ab:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01073ae:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c01073b2:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01073b8:	e9 13 f8 ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c01073bd:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01073c3:	85 c0                	test   %eax,%eax
c01073c5:	74 21                	je     c01073e8 <_svfiprintf_r+0xa08>
c01073c7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01073cd:	89 44 24 08          	mov    %eax,0x8(%esp)
c01073d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01073d4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01073d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01073db:	89 04 24             	mov    %eax,(%esp)
c01073de:	e8 0d f4 ff ff       	call   c01067f0 <__ssprint_r>
c01073e3:	90                   	nop
c01073e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01073e8:	8b 75 0c             	mov    0xc(%ebp),%esi
c01073eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01073f0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c01073f4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c01073fb:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0107401:	5b                   	pop    %ebx
c0107402:	5e                   	pop    %esi
c0107403:	5f                   	pop    %edi
c0107404:	5d                   	pop    %ebp
c0107405:	c3                   	ret    
c0107406:	66 90                	xchg   %ax,%ax
c0107408:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c010740f:	00 00 00 
c0107412:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107415:	e9 b6 f7 ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c010741a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107420:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0107426:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c010742c:	85 ff                	test   %edi,%edi
c010742e:	0f 8e 4f fd ff ff    	jle    c0107183 <_svfiprintf_r+0x7a3>
c0107434:	83 ff 10             	cmp    $0x10,%edi
c0107437:	0f 8e 7f 00 00 00    	jle    c01074bc <_svfiprintf_r+0xadc>
c010743d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0107443:	89 f1                	mov    %esi,%ecx
c0107445:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107448:	8b 75 0c             	mov    0xc(%ebp),%esi
c010744b:	eb 0b                	jmp    c0107458 <_svfiprintf_r+0xa78>
c010744d:	8d 76 00             	lea    0x0(%esi),%esi
c0107450:	83 ef 10             	sub    $0x10,%edi
c0107453:	83 ff 10             	cmp    $0x10,%edi
c0107456:	7e 5c                	jle    c01074b4 <_svfiprintf_r+0xad4>
c0107458:	83 c0 01             	add    $0x1,%eax
c010745b:	83 c2 10             	add    $0x10,%edx
c010745e:	c7 01 0c 90 10 c0    	movl   $0xc010900c,(%ecx)
c0107464:	83 c1 08             	add    $0x8,%ecx
c0107467:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010746e:	83 f8 07             	cmp    $0x7,%eax
c0107471:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107477:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010747d:	7e d1                	jle    c0107450 <_svfiprintf_r+0xa70>
c010747f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107485:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107489:	89 74 24 04          	mov    %esi,0x4(%esp)
c010748d:	89 1c 24             	mov    %ebx,(%esp)
c0107490:	e8 5b f3 ff ff       	call   c01067f0 <__ssprint_r>
c0107495:	85 c0                	test   %eax,%eax
c0107497:	0f 85 4b ff ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c010749d:	83 ef 10             	sub    $0x10,%edi
c01074a0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01074a6:	83 ff 10             	cmp    $0x10,%edi
c01074a9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01074af:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c01074b2:	7f a4                	jg     c0107458 <_svfiprintf_r+0xa78>
c01074b4:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c01074ba:	89 ce                	mov    %ecx,%esi
c01074bc:	83 c0 01             	add    $0x1,%eax
c01074bf:	01 fa                	add    %edi,%edx
c01074c1:	c7 06 0c 90 10 c0    	movl   $0xc010900c,(%esi)
c01074c7:	83 c6 08             	add    $0x8,%esi
c01074ca:	89 7e fc             	mov    %edi,-0x4(%esi)
c01074cd:	83 f8 07             	cmp    $0x7,%eax
c01074d0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01074d6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01074dc:	0f 8e a1 fc ff ff    	jle    c0107183 <_svfiprintf_r+0x7a3>
c01074e2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01074e8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01074ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01074ef:	89 44 24 04          	mov    %eax,0x4(%esp)
c01074f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01074f6:	89 04 24             	mov    %eax,(%esp)
c01074f9:	e8 f2 f2 ff ff       	call   c01067f0 <__ssprint_r>
c01074fe:	85 c0                	test   %eax,%eax
c0107500:	0f 85 e2 fe ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0107506:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010750c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010750f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107515:	e9 69 fc ff ff       	jmp    c0107183 <_svfiprintf_r+0x7a3>
c010751a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107520:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107526:	89 44 24 08          	mov    %eax,0x8(%esp)
c010752a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010752d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107531:	8b 45 08             	mov    0x8(%ebp),%eax
c0107534:	89 04 24             	mov    %eax,(%esp)
c0107537:	e8 b4 f2 ff ff       	call   c01067f0 <__ssprint_r>
c010753c:	85 c0                	test   %eax,%eax
c010753e:	0f 85 a4 fe ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0107544:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010754a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010754d:	e9 4e fd ff ff       	jmp    c01072a0 <_svfiprintf_r+0x8c0>
c0107552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107558:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010755e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107562:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107565:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107569:	8b 45 08             	mov    0x8(%ebp),%eax
c010756c:	89 04 24             	mov    %eax,(%esp)
c010756f:	e8 7c f2 ff ff       	call   c01067f0 <__ssprint_r>
c0107574:	85 c0                	test   %eax,%eax
c0107576:	0f 84 09 fe ff ff    	je     c0107385 <_svfiprintf_r+0x9a5>
c010757c:	e9 67 fe ff ff       	jmp    c01073e8 <_svfiprintf_r+0xa08>
c0107581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107588:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010758e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107592:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107595:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107599:	8b 45 08             	mov    0x8(%ebp),%eax
c010759c:	89 04 24             	mov    %eax,(%esp)
c010759f:	e8 4c f2 ff ff       	call   c01067f0 <__ssprint_r>
c01075a4:	85 c0                	test   %eax,%eax
c01075a6:	0f 85 3c fe ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c01075ac:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01075af:	e9 e9 f4 ff ff       	jmp    c0106a9d <_svfiprintf_r+0xbd>
c01075b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01075b8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01075be:	89 44 24 08          	mov    %eax,0x8(%esp)
c01075c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01075c5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01075c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01075cc:	89 04 24             	mov    %eax,(%esp)
c01075cf:	e8 1c f2 ff ff       	call   c01067f0 <__ssprint_r>
c01075d4:	85 c0                	test   %eax,%eax
c01075d6:	0f 85 0c fe ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c01075dc:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01075e2:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01075e5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01075eb:	e9 83 fb ff ff       	jmp    c0107173 <_svfiprintf_r+0x793>
c01075f0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01075f6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01075fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01075fd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107601:	8b 45 08             	mov    0x8(%ebp),%eax
c0107604:	89 04 24             	mov    %eax,(%esp)
c0107607:	e8 e4 f1 ff ff       	call   c01067f0 <__ssprint_r>
c010760c:	85 c0                	test   %eax,%eax
c010760e:	0f 85 d4 fd ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0107614:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010761a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010761d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107623:	e9 13 fb ff ff       	jmp    c010713b <_svfiprintf_r+0x75b>
c0107628:	83 f9 09             	cmp    $0x9,%ecx
c010762b:	76 56                	jbe    c0107683 <_svfiprintf_r+0xca3>
c010762d:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107630:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0107635:	83 eb 01             	sub    $0x1,%ebx
c0107638:	f7 e1                	mul    %ecx
c010763a:	c1 ea 03             	shr    $0x3,%edx
c010763d:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0107640:	01 c0                	add    %eax,%eax
c0107642:	29 c1                	sub    %eax,%ecx
c0107644:	83 c1 30             	add    $0x30,%ecx
c0107647:	85 d2                	test   %edx,%edx
c0107649:	88 0b                	mov    %cl,(%ebx)
c010764b:	89 d1                	mov    %edx,%ecx
c010764d:	75 e1                	jne    c0107630 <_svfiprintf_r+0xc50>
c010764f:	e9 71 f5 ff ff       	jmp    c0106bc5 <_svfiprintf_r+0x1e5>
c0107654:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010765a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010765e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107661:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107665:	8b 45 08             	mov    0x8(%ebp),%eax
c0107668:	89 04 24             	mov    %eax,(%esp)
c010766b:	e8 80 f1 ff ff       	call   c01067f0 <__ssprint_r>
c0107670:	85 c0                	test   %eax,%eax
c0107672:	0f 85 70 fd ff ff    	jne    c01073e8 <_svfiprintf_r+0xa08>
c0107678:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010767e:	e9 e3 fc ff ff       	jmp    c0107366 <_svfiprintf_r+0x986>
c0107683:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0107689:	83 c1 30             	add    $0x30,%ecx
c010768c:	88 4d a7             	mov    %cl,-0x59(%ebp)
c010768f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0107692:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107698:	e9 33 f5 ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c010769d:	8b 45 14             	mov    0x14(%ebp),%eax
c01076a0:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c01076a6:	8b 00                	mov    (%eax),%eax
c01076a8:	89 18                	mov    %ebx,(%eax)
c01076aa:	8b 45 14             	mov    0x14(%ebp),%eax
c01076ad:	83 c0 04             	add    $0x4,%eax
c01076b0:	89 45 14             	mov    %eax,0x14(%ebp)
c01076b3:	e9 86 f3 ff ff       	jmp    c0106a3e <_svfiprintf_r+0x5e>
c01076b8:	0f b7 0b             	movzwl (%ebx),%ecx
c01076bb:	83 c3 04             	add    $0x4,%ebx
c01076be:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01076c1:	e9 95 f8 ff ff       	jmp    c0106f5b <_svfiprintf_r+0x57b>
c01076c6:	0f bf 08             	movswl (%eax),%ecx
c01076c9:	83 c0 04             	add    $0x4,%eax
c01076cc:	89 45 14             	mov    %eax,0x14(%ebp)
c01076cf:	85 c9                	test   %ecx,%ecx
c01076d1:	0f 89 0d f7 ff ff    	jns    c0106de4 <_svfiprintf_r+0x404>
c01076d7:	f7 d9                	neg    %ecx
c01076d9:	bf 2d 00 00 00       	mov    $0x2d,%edi
c01076de:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c01076e5:	ba 01 00 00 00       	mov    $0x1,%edx
c01076ea:	e9 7a f4 ff ff       	jmp    c0106b69 <_svfiprintf_r+0x189>
c01076ef:	89 1c 24             	mov    %ebx,(%esp)
c01076f2:	e8 79 f0 ff ff       	call   c0106770 <strlen>
c01076f7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01076fd:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0107704:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010770b:	00 00 00 
c010770e:	89 55 14             	mov    %edx,0x14(%ebp)
c0107711:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107717:	e9 b4 f4 ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c010771c:	8b 45 08             	mov    0x8(%ebp),%eax
c010771f:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0107726:	00 
c0107727:	89 04 24             	mov    %eax,(%esp)
c010772a:	e8 b1 d9 ff ff       	call   c01050e0 <_malloc_r>
c010772f:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107732:	85 c0                	test   %eax,%eax
c0107734:	89 06                	mov    %eax,(%esi)
c0107736:	89 46 10             	mov    %eax,0x10(%esi)
c0107739:	0f 84 a3 00 00 00    	je     c01077e2 <_svfiprintf_r+0xe02>
c010773f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107742:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0107749:	e9 b2 f2 ff ff       	jmp    c0106a00 <_svfiprintf_r+0x20>
c010774e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107754:	b8 06 00 00 00       	mov    $0x6,%eax
c0107759:	89 55 14             	mov    %edx,0x14(%ebp)
c010775c:	83 ff 06             	cmp    $0x6,%edi
c010775f:	0f 46 c7             	cmovbe %edi,%eax
c0107762:	85 c0                	test   %eax,%eax
c0107764:	0f 49 d8             	cmovns %eax,%ebx
c0107767:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c010776d:	bb 6c 8b 10 c0       	mov    $0xc0108b6c,%ebx
c0107772:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107778:	e9 61 f8 ff ff       	jmp    c0106fde <_svfiprintf_r+0x5fe>
c010777d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0107783:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010778a:	89 55 14             	mov    %edx,0x14(%ebp)
c010778d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107794:	00 00 00 
c0107797:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010779d:	e9 2e f4 ff ff       	jmp    c0106bd0 <_svfiprintf_r+0x1f0>
c01077a2:	89 da                	mov    %ebx,%edx
c01077a4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01077ab:	00 00 00 
c01077ae:	e9 29 f3 ff ff       	jmp    c0106adc <_svfiprintf_r+0xfc>
c01077b3:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01077b6:	89 da                	mov    %ebx,%edx
c01077b8:	8b 45 14             	mov    0x14(%ebp),%eax
c01077bb:	8b 09                	mov    (%ecx),%ecx
c01077bd:	83 c0 04             	add    $0x4,%eax
c01077c0:	89 45 14             	mov    %eax,0x14(%ebp)
c01077c3:	85 c9                	test   %ecx,%ecx
c01077c5:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c01077cb:	0f 89 26 f3 ff ff    	jns    c0106af7 <_svfiprintf_r+0x117>
c01077d1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c01077d8:	ff ff ff 
c01077db:	89 d0                	mov    %edx,%eax
c01077dd:	e9 f4 f2 ff ff       	jmp    c0106ad6 <_svfiprintf_r+0xf6>
c01077e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01077e5:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01077eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01077f0:	e9 06 fc ff ff       	jmp    c01073fb <_svfiprintf_r+0xa1b>
c01077f5:	66 90                	xchg   %ax,%ax
c01077f7:	66 90                	xchg   %ax,%ax
c01077f9:	66 90                	xchg   %ax,%ax
c01077fb:	66 90                	xchg   %ax,%ax
c01077fd:	66 90                	xchg   %ax,%ax
c01077ff:	90                   	nop

c0107800 <_calloc_r>:
c0107800:	55                   	push   %ebp
c0107801:	89 e5                	mov    %esp,%ebp
c0107803:	53                   	push   %ebx
c0107804:	83 ec 14             	sub    $0x14,%esp
c0107807:	8b 45 10             	mov    0x10(%ebp),%eax
c010780a:	0f af 45 0c          	imul   0xc(%ebp),%eax
c010780e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107812:	8b 45 08             	mov    0x8(%ebp),%eax
c0107815:	89 04 24             	mov    %eax,(%esp)
c0107818:	e8 c3 d8 ff ff       	call   c01050e0 <_malloc_r>
c010781d:	85 c0                	test   %eax,%eax
c010781f:	89 c3                	mov    %eax,%ebx
c0107821:	0f 84 91 00 00 00    	je     c01078b8 <_calloc_r+0xb8>
c0107827:	8b 40 fc             	mov    -0x4(%eax),%eax
c010782a:	83 e0 fc             	and    $0xfffffffc,%eax
c010782d:	83 e8 04             	sub    $0x4,%eax
c0107830:	83 f8 24             	cmp    $0x24,%eax
c0107833:	77 63                	ja     c0107898 <_calloc_r+0x98>
c0107835:	83 f8 13             	cmp    $0x13,%eax
c0107838:	89 da                	mov    %ebx,%edx
c010783a:	77 1c                	ja     c0107858 <_calloc_r+0x58>
c010783c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c0107842:	89 d8                	mov    %ebx,%eax
c0107844:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c010784b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c0107852:	83 c4 14             	add    $0x14,%esp
c0107855:	5b                   	pop    %ebx
c0107856:	5d                   	pop    %ebp
c0107857:	c3                   	ret    
c0107858:	83 f8 1b             	cmp    $0x1b,%eax
c010785b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0107861:	8d 53 08             	lea    0x8(%ebx),%edx
c0107864:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c010786b:	76 cf                	jbe    c010783c <_calloc_r+0x3c>
c010786d:	83 f8 24             	cmp    $0x24,%eax
c0107870:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107877:	8d 53 10             	lea    0x10(%ebx),%edx
c010787a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c0107881:	75 b9                	jne    c010783c <_calloc_r+0x3c>
c0107883:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c010788a:	8d 53 18             	lea    0x18(%ebx),%edx
c010788d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c0107894:	eb a6                	jmp    c010783c <_calloc_r+0x3c>
c0107896:	66 90                	xchg   %ax,%ax
c0107898:	89 1c 24             	mov    %ebx,(%esp)
c010789b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010789f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01078a6:	00 
c01078a7:	e8 5c a2 ff ff       	call   c0101b08 <memset>
c01078ac:	83 c4 14             	add    $0x14,%esp
c01078af:	89 d8                	mov    %ebx,%eax
c01078b1:	5b                   	pop    %ebx
c01078b2:	5d                   	pop    %ebp
c01078b3:	c3                   	ret    
c01078b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01078b8:	31 c0                	xor    %eax,%eax
c01078ba:	eb 96                	jmp    c0107852 <_calloc_r+0x52>
c01078bc:	66 90                	xchg   %ax,%ax
c01078be:	66 90                	xchg   %ax,%ax

c01078c0 <_malloc_trim_r>:
c01078c0:	55                   	push   %ebp
c01078c1:	89 e5                	mov    %esp,%ebp
c01078c3:	57                   	push   %edi
c01078c4:	56                   	push   %esi
c01078c5:	53                   	push   %ebx
c01078c6:	83 ec 1c             	sub    $0x1c,%esp
c01078c9:	8b 75 08             	mov    0x8(%ebp),%esi
c01078cc:	89 34 24             	mov    %esi,(%esp)
c01078cf:	e8 ec df ff ff       	call   c01058c0 <__malloc_lock>
c01078d4:	a1 c8 b5 10 c0       	mov    0xc010b5c8,%eax
c01078d9:	8b 58 04             	mov    0x4(%eax),%ebx
c01078dc:	83 e3 fc             	and    $0xfffffffc,%ebx
c01078df:	89 d8                	mov    %ebx,%eax
c01078e1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01078e4:	05 ef 0f 00 00       	add    $0xfef,%eax
c01078e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01078ee:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c01078f4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c01078fa:	7e 1c                	jle    c0107918 <_malloc_trim_r+0x58>
c01078fc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107903:	00 
c0107904:	89 34 24             	mov    %esi,(%esp)
c0107907:	e8 b4 ed ff ff       	call   c01066c0 <_sbrk_r>
c010790c:	8b 15 c8 b5 10 c0    	mov    0xc010b5c8,%edx
c0107912:	01 da                	add    %ebx,%edx
c0107914:	39 d0                	cmp    %edx,%eax
c0107916:	74 18                	je     c0107930 <_malloc_trim_r+0x70>
c0107918:	89 34 24             	mov    %esi,(%esp)
c010791b:	e8 b0 df ff ff       	call   c01058d0 <__malloc_unlock>
c0107920:	83 c4 1c             	add    $0x1c,%esp
c0107923:	31 c0                	xor    %eax,%eax
c0107925:	5b                   	pop    %ebx
c0107926:	5e                   	pop    %esi
c0107927:	5f                   	pop    %edi
c0107928:	5d                   	pop    %ebp
c0107929:	c3                   	ret    
c010792a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107930:	89 f8                	mov    %edi,%eax
c0107932:	f7 d8                	neg    %eax
c0107934:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107938:	89 34 24             	mov    %esi,(%esp)
c010793b:	e8 80 ed ff ff       	call   c01066c0 <_sbrk_r>
c0107940:	83 f8 ff             	cmp    $0xffffffff,%eax
c0107943:	74 2b                	je     c0107970 <_malloc_trim_r+0xb0>
c0107945:	a1 c8 b5 10 c0       	mov    0xc010b5c8,%eax
c010794a:	29 fb                	sub    %edi,%ebx
c010794c:	83 cb 01             	or     $0x1,%ebx
c010794f:	29 3d 60 35 16 c0    	sub    %edi,0xc0163560
c0107955:	89 58 04             	mov    %ebx,0x4(%eax)
c0107958:	89 34 24             	mov    %esi,(%esp)
c010795b:	e8 70 df ff ff       	call   c01058d0 <__malloc_unlock>
c0107960:	83 c4 1c             	add    $0x1c,%esp
c0107963:	b8 01 00 00 00       	mov    $0x1,%eax
c0107968:	5b                   	pop    %ebx
c0107969:	5e                   	pop    %esi
c010796a:	5f                   	pop    %edi
c010796b:	5d                   	pop    %ebp
c010796c:	c3                   	ret    
c010796d:	8d 76 00             	lea    0x0(%esi),%esi
c0107970:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107977:	00 
c0107978:	89 34 24             	mov    %esi,(%esp)
c010797b:	e8 40 ed ff ff       	call   c01066c0 <_sbrk_r>
c0107980:	8b 15 c8 b5 10 c0    	mov    0xc010b5c8,%edx
c0107986:	89 c1                	mov    %eax,%ecx
c0107988:	29 d1                	sub    %edx,%ecx
c010798a:	83 f9 0f             	cmp    $0xf,%ecx
c010798d:	7e 89                	jle    c0107918 <_malloc_trim_r+0x58>
c010798f:	2b 05 a0 b5 10 c0    	sub    0xc010b5a0,%eax
c0107995:	83 c9 01             	or     $0x1,%ecx
c0107998:	89 4a 04             	mov    %ecx,0x4(%edx)
c010799b:	a3 60 35 16 c0       	mov    %eax,0xc0163560
c01079a0:	e9 73 ff ff ff       	jmp    c0107918 <_malloc_trim_r+0x58>
c01079a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01079a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01079b0 <_free_r>:
c01079b0:	55                   	push   %ebp
c01079b1:	89 e5                	mov    %esp,%ebp
c01079b3:	57                   	push   %edi
c01079b4:	56                   	push   %esi
c01079b5:	53                   	push   %ebx
c01079b6:	83 ec 1c             	sub    $0x1c,%esp
c01079b9:	8b 75 0c             	mov    0xc(%ebp),%esi
c01079bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01079bf:	85 f6                	test   %esi,%esi
c01079c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01079c4:	0f 84 fe 00 00 00    	je     c0107ac8 <_free_r+0x118>
c01079ca:	89 04 24             	mov    %eax,(%esp)
c01079cd:	e8 ee de ff ff       	call   c01058c0 <__malloc_lock>
c01079d2:	8b 7e fc             	mov    -0x4(%esi),%edi
c01079d5:	8d 56 f8             	lea    -0x8(%esi),%edx
c01079d8:	89 f8                	mov    %edi,%eax
c01079da:	83 e0 fe             	and    $0xfffffffe,%eax
c01079dd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c01079e0:	8b 59 04             	mov    0x4(%ecx),%ebx
c01079e3:	83 e3 fc             	and    $0xfffffffc,%ebx
c01079e6:	39 0d c8 b5 10 c0    	cmp    %ecx,0xc010b5c8
c01079ec:	0f 84 0e 01 00 00    	je     c0107b00 <_free_r+0x150>
c01079f2:	83 e7 01             	and    $0x1,%edi
c01079f5:	89 59 04             	mov    %ebx,0x4(%ecx)
c01079f8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01079ff:	75 1f                	jne    c0107a20 <_free_r+0x70>
c0107a01:	8b 76 f8             	mov    -0x8(%esi),%esi
c0107a04:	29 f2                	sub    %esi,%edx
c0107a06:	01 f0                	add    %esi,%eax
c0107a08:	8b 72 08             	mov    0x8(%edx),%esi
c0107a0b:	81 fe c8 b5 10 c0    	cmp    $0xc010b5c8,%esi
c0107a11:	0f 84 39 01 00 00    	je     c0107b50 <_free_r+0x1a0>
c0107a17:	8b 7a 0c             	mov    0xc(%edx),%edi
c0107a1a:	89 7e 0c             	mov    %edi,0xc(%esi)
c0107a1d:	89 77 08             	mov    %esi,0x8(%edi)
c0107a20:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c0107a25:	75 21                	jne    c0107a48 <_free_r+0x98>
c0107a27:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0107a2a:	01 d8                	add    %ebx,%eax
c0107a2c:	8b 59 08             	mov    0x8(%ecx),%ebx
c0107a2f:	85 f6                	test   %esi,%esi
c0107a31:	75 0c                	jne    c0107a3f <_free_r+0x8f>
c0107a33:	81 fb c8 b5 10 c0    	cmp    $0xc010b5c8,%ebx
c0107a39:	0f 84 21 01 00 00    	je     c0107b60 <_free_r+0x1b0>
c0107a3f:	8b 49 0c             	mov    0xc(%ecx),%ecx
c0107a42:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107a45:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107a48:	89 c1                	mov    %eax,%ecx
c0107a4a:	83 c9 01             	or     $0x1,%ecx
c0107a4d:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107a50:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107a53:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107a56:	85 c9                	test   %ecx,%ecx
c0107a58:	75 56                	jne    c0107ab0 <_free_r+0x100>
c0107a5a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0107a5f:	76 6f                	jbe    c0107ad0 <_free_r+0x120>
c0107a61:	89 c1                	mov    %eax,%ecx
c0107a63:	c1 e9 09             	shr    $0x9,%ecx
c0107a66:	83 f9 04             	cmp    $0x4,%ecx
c0107a69:	0f 87 21 01 00 00    	ja     c0107b90 <_free_r+0x1e0>
c0107a6f:	89 c1                	mov    %eax,%ecx
c0107a71:	c1 e9 06             	shr    $0x6,%ecx
c0107a74:	83 c1 38             	add    $0x38,%ecx
c0107a77:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107a7a:	8d 34 9d c0 b5 10 c0 	lea    -0x3fef4a40(,%ebx,4),%esi
c0107a81:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107a84:	39 f3                	cmp    %esi,%ebx
c0107a86:	0f 84 14 01 00 00    	je     c0107ba0 <_free_r+0x1f0>
c0107a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107a90:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107a93:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107a96:	39 c8                	cmp    %ecx,%eax
c0107a98:	73 07                	jae    c0107aa1 <_free_r+0xf1>
c0107a9a:	8b 5b 08             	mov    0x8(%ebx),%ebx
c0107a9d:	39 de                	cmp    %ebx,%esi
c0107a9f:	75 ef                	jne    c0107a90 <_free_r+0xe0>
c0107aa1:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107aa4:	89 42 0c             	mov    %eax,0xc(%edx)
c0107aa7:	89 5a 08             	mov    %ebx,0x8(%edx)
c0107aaa:	89 50 08             	mov    %edx,0x8(%eax)
c0107aad:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107ab0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107ab3:	89 45 08             	mov    %eax,0x8(%ebp)
c0107ab6:	83 c4 1c             	add    $0x1c,%esp
c0107ab9:	5b                   	pop    %ebx
c0107aba:	5e                   	pop    %esi
c0107abb:	5f                   	pop    %edi
c0107abc:	5d                   	pop    %ebp
c0107abd:	e9 0e de ff ff       	jmp    c01058d0 <__malloc_unlock>
c0107ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107ac8:	83 c4 1c             	add    $0x1c,%esp
c0107acb:	5b                   	pop    %ebx
c0107acc:	5e                   	pop    %esi
c0107acd:	5f                   	pop    %edi
c0107ace:	5d                   	pop    %ebp
c0107acf:	c3                   	ret    
c0107ad0:	c1 e8 03             	shr    $0x3,%eax
c0107ad3:	bb 01 00 00 00       	mov    $0x1,%ebx
c0107ad8:	89 c1                	mov    %eax,%ecx
c0107ada:	c1 f9 02             	sar    $0x2,%ecx
c0107add:	8d 04 c5 c0 b5 10 c0 	lea    -0x3fef4a40(,%eax,8),%eax
c0107ae4:	d3 e3                	shl    %cl,%ebx
c0107ae6:	8b 48 08             	mov    0x8(%eax),%ecx
c0107ae9:	09 1d c4 b5 10 c0    	or     %ebx,0xc010b5c4
c0107aef:	89 42 0c             	mov    %eax,0xc(%edx)
c0107af2:	89 4a 08             	mov    %ecx,0x8(%edx)
c0107af5:	89 50 08             	mov    %edx,0x8(%eax)
c0107af8:	89 51 0c             	mov    %edx,0xc(%ecx)
c0107afb:	eb b3                	jmp    c0107ab0 <_free_r+0x100>
c0107afd:	8d 76 00             	lea    0x0(%esi),%esi
c0107b00:	01 d8                	add    %ebx,%eax
c0107b02:	83 e7 01             	and    $0x1,%edi
c0107b05:	75 13                	jne    c0107b1a <_free_r+0x16a>
c0107b07:	8b 4e f8             	mov    -0x8(%esi),%ecx
c0107b0a:	29 ca                	sub    %ecx,%edx
c0107b0c:	01 c8                	add    %ecx,%eax
c0107b0e:	8b 5a 08             	mov    0x8(%edx),%ebx
c0107b11:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0107b14:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107b17:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107b1a:	89 c1                	mov    %eax,%ecx
c0107b1c:	83 c9 01             	or     $0x1,%ecx
c0107b1f:	3b 05 a4 b5 10 c0    	cmp    0xc010b5a4,%eax
c0107b25:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107b28:	89 15 c8 b5 10 c0    	mov    %edx,0xc010b5c8
c0107b2e:	72 80                	jb     c0107ab0 <_free_r+0x100>
c0107b30:	a1 90 35 16 c0       	mov    0xc0163590,%eax
c0107b35:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107b39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107b3c:	89 04 24             	mov    %eax,(%esp)
c0107b3f:	e8 7c fd ff ff       	call   c01078c0 <_malloc_trim_r>
c0107b44:	e9 67 ff ff ff       	jmp    c0107ab0 <_free_r+0x100>
c0107b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107b50:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0107b57:	e9 c4 fe ff ff       	jmp    c0107a20 <_free_r+0x70>
c0107b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107b60:	89 c1                	mov    %eax,%ecx
c0107b62:	83 c9 01             	or     $0x1,%ecx
c0107b65:	89 15 d4 b5 10 c0    	mov    %edx,0xc010b5d4
c0107b6b:	89 15 d0 b5 10 c0    	mov    %edx,0xc010b5d0
c0107b71:	c7 42 0c c8 b5 10 c0 	movl   $0xc010b5c8,0xc(%edx)
c0107b78:	c7 42 08 c8 b5 10 c0 	movl   $0xc010b5c8,0x8(%edx)
c0107b7f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107b82:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107b85:	e9 26 ff ff ff       	jmp    c0107ab0 <_free_r+0x100>
c0107b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107b90:	83 f9 14             	cmp    $0x14,%ecx
c0107b93:	77 23                	ja     c0107bb8 <_free_r+0x208>
c0107b95:	83 c1 5b             	add    $0x5b,%ecx
c0107b98:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107b9b:	e9 da fe ff ff       	jmp    c0107a7a <_free_r+0xca>
c0107ba0:	c1 f9 02             	sar    $0x2,%ecx
c0107ba3:	b8 01 00 00 00       	mov    $0x1,%eax
c0107ba8:	d3 e0                	shl    %cl,%eax
c0107baa:	09 05 c4 b5 10 c0    	or     %eax,0xc010b5c4
c0107bb0:	89 d8                	mov    %ebx,%eax
c0107bb2:	e9 ed fe ff ff       	jmp    c0107aa4 <_free_r+0xf4>
c0107bb7:	90                   	nop
c0107bb8:	83 f9 54             	cmp    $0x54,%ecx
c0107bbb:	77 10                	ja     c0107bcd <_free_r+0x21d>
c0107bbd:	89 c1                	mov    %eax,%ecx
c0107bbf:	c1 e9 0c             	shr    $0xc,%ecx
c0107bc2:	83 c1 6e             	add    $0x6e,%ecx
c0107bc5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107bc8:	e9 ad fe ff ff       	jmp    c0107a7a <_free_r+0xca>
c0107bcd:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0107bd3:	77 10                	ja     c0107be5 <_free_r+0x235>
c0107bd5:	89 c1                	mov    %eax,%ecx
c0107bd7:	c1 e9 0f             	shr    $0xf,%ecx
c0107bda:	83 c1 77             	add    $0x77,%ecx
c0107bdd:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107be0:	e9 95 fe ff ff       	jmp    c0107a7a <_free_r+0xca>
c0107be5:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0107beb:	77 10                	ja     c0107bfd <_free_r+0x24d>
c0107bed:	89 c1                	mov    %eax,%ecx
c0107bef:	c1 e9 12             	shr    $0x12,%ecx
c0107bf2:	83 c1 7c             	add    $0x7c,%ecx
c0107bf5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107bf8:	e9 7d fe ff ff       	jmp    c0107a7a <_free_r+0xca>
c0107bfd:	bb fc 00 00 00       	mov    $0xfc,%ebx
c0107c02:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0107c07:	e9 6e fe ff ff       	jmp    c0107a7a <_free_r+0xca>
c0107c0c:	66 90                	xchg   %ax,%ax
c0107c0e:	66 90                	xchg   %ax,%ax

c0107c10 <memmove>:
c0107c10:	55                   	push   %ebp
c0107c11:	89 e5                	mov    %esp,%ebp
c0107c13:	56                   	push   %esi
c0107c14:	57                   	push   %edi
c0107c15:	53                   	push   %ebx
c0107c16:	8b 7d 08             	mov    0x8(%ebp),%edi
c0107c19:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0107c1c:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107c1f:	fc                   	cld    
c0107c20:	39 fe                	cmp    %edi,%esi
c0107c22:	73 43                	jae    c0107c67 <memmove+0x57>
c0107c24:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c0107c28:	39 df                	cmp    %ebx,%edi
c0107c2a:	77 3b                	ja     c0107c67 <memmove+0x57>
c0107c2c:	01 ce                	add    %ecx,%esi
c0107c2e:	01 cf                	add    %ecx,%edi
c0107c30:	fd                   	std    
c0107c31:	83 f9 08             	cmp    $0x8,%ecx
c0107c34:	76 2b                	jbe    c0107c61 <memmove+0x51>
c0107c36:	89 fa                	mov    %edi,%edx
c0107c38:	89 cb                	mov    %ecx,%ebx
c0107c3a:	83 e2 03             	and    $0x3,%edx
c0107c3d:	74 0c                	je     c0107c4b <memmove+0x3b>
c0107c3f:	89 d1                	mov    %edx,%ecx
c0107c41:	4e                   	dec    %esi
c0107c42:	4f                   	dec    %edi
c0107c43:	29 cb                	sub    %ecx,%ebx
c0107c45:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107c47:	89 d9                	mov    %ebx,%ecx
c0107c49:	46                   	inc    %esi
c0107c4a:	47                   	inc    %edi
c0107c4b:	c1 e9 02             	shr    $0x2,%ecx
c0107c4e:	83 ee 04             	sub    $0x4,%esi
c0107c51:	83 ef 04             	sub    $0x4,%edi
c0107c54:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107c56:	83 c6 04             	add    $0x4,%esi
c0107c59:	83 c7 04             	add    $0x4,%edi
c0107c5c:	89 d9                	mov    %ebx,%ecx
c0107c5e:	83 e1 03             	and    $0x3,%ecx
c0107c61:	4e                   	dec    %esi
c0107c62:	4f                   	dec    %edi
c0107c63:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107c65:	eb 2a                	jmp    c0107c91 <memmove+0x81>
c0107c67:	83 f9 08             	cmp    $0x8,%ecx
c0107c6a:	76 23                	jbe    c0107c8f <memmove+0x7f>
c0107c6c:	89 fa                	mov    %edi,%edx
c0107c6e:	89 cb                	mov    %ecx,%ebx
c0107c70:	83 e2 03             	and    $0x3,%edx
c0107c73:	74 10                	je     c0107c85 <memmove+0x75>
c0107c75:	b9 04 00 00 00       	mov    $0x4,%ecx
c0107c7a:	29 d1                	sub    %edx,%ecx
c0107c7c:	83 e1 03             	and    $0x3,%ecx
c0107c7f:	29 cb                	sub    %ecx,%ebx
c0107c81:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107c83:	89 d9                	mov    %ebx,%ecx
c0107c85:	c1 e9 02             	shr    $0x2,%ecx
c0107c88:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107c8a:	89 d9                	mov    %ebx,%ecx
c0107c8c:	83 e1 03             	and    $0x3,%ecx
c0107c8f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107c91:	8b 45 08             	mov    0x8(%ebp),%eax
c0107c94:	fc                   	cld    
c0107c95:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107c98:	5b                   	pop    %ebx
c0107c99:	5f                   	pop    %edi
c0107c9a:	5e                   	pop    %esi
c0107c9b:	c9                   	leave  
c0107c9c:	c3                   	ret    
c0107c9d:	66 90                	xchg   %ax,%ax
c0107c9f:	90                   	nop

c0107ca0 <_realloc_r>:
c0107ca0:	55                   	push   %ebp
c0107ca1:	89 e5                	mov    %esp,%ebp
c0107ca3:	57                   	push   %edi
c0107ca4:	56                   	push   %esi
c0107ca5:	53                   	push   %ebx
c0107ca6:	83 ec 3c             	sub    $0x3c,%esp
c0107ca9:	8b 45 08             	mov    0x8(%ebp),%eax
c0107cac:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0107caf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107cb2:	8b 45 10             	mov    0x10(%ebp),%eax
c0107cb5:	85 ff                	test   %edi,%edi
c0107cb7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107cba:	0f 84 50 02 00 00    	je     c0107f10 <_realloc_r+0x270>
c0107cc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107cc3:	8d 77 f8             	lea    -0x8(%edi),%esi
c0107cc6:	89 04 24             	mov    %eax,(%esp)
c0107cc9:	e8 f2 db ff ff       	call   c01058c0 <__malloc_lock>
c0107cce:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107cd1:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107cd4:	89 c3                	mov    %eax,%ebx
c0107cd6:	8d 51 0b             	lea    0xb(%ecx),%edx
c0107cd9:	83 e3 fc             	and    $0xfffffffc,%ebx
c0107cdc:	83 fa 16             	cmp    $0x16,%edx
c0107cdf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107ce2:	0f 87 00 01 00 00    	ja     c0107de8 <_realloc_r+0x148>
c0107ce8:	31 d2                	xor    %edx,%edx
c0107cea:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c0107cf1:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0107cf8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107cfb:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c0107cfe:	0f 82 1c 02 00 00    	jb     c0107f20 <_realloc_r+0x280>
c0107d04:	84 d2                	test   %dl,%dl
c0107d06:	0f 85 14 02 00 00    	jne    c0107f20 <_realloc_r+0x280>
c0107d0c:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c0107d0f:	0f 8d eb 00 00 00    	jge    c0107e00 <_realloc_r+0x160>
c0107d15:	8b 0d c8 b5 10 c0    	mov    0xc010b5c8,%ecx
c0107d1b:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c0107d1e:	39 d1                	cmp    %edx,%ecx
c0107d20:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c0107d23:	0f 84 6f 02 00 00    	je     c0107f98 <_realloc_r+0x2f8>
c0107d29:	8b 4a 04             	mov    0x4(%edx),%ecx
c0107d2c:	89 c8                	mov    %ecx,%eax
c0107d2e:	83 e0 fe             	and    $0xfffffffe,%eax
c0107d31:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c0107d36:	0f 84 f4 00 00 00    	je     c0107e30 <_realloc_r+0x190>
c0107d3c:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c0107d43:	31 d2                	xor    %edx,%edx
c0107d45:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c0107d49:	0f 85 39 01 00 00    	jne    c0107e88 <_realloc_r+0x1e8>
c0107d4f:	89 f1                	mov    %esi,%ecx
c0107d51:	2b 4f f8             	sub    -0x8(%edi),%ecx
c0107d54:	8b 41 04             	mov    0x4(%ecx),%eax
c0107d57:	83 e0 fc             	and    $0xfffffffc,%eax
c0107d5a:	85 d2                	test   %edx,%edx
c0107d5c:	0f 84 f6 02 00 00    	je     c0108058 <_realloc_r+0x3b8>
c0107d62:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0107d65:	0f 84 f5 02 00 00    	je     c0108060 <_realloc_r+0x3c0>
c0107d6b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0107d6e:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107d71:	01 d8                	add    %ebx,%eax
c0107d73:	01 c2                	add    %eax,%edx
c0107d75:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107d78:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0107d7b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0107d7e:	0f 8c ac 01 00 00    	jl     c0107f30 <_realloc_r+0x290>
c0107d84:	8b 42 0c             	mov    0xc(%edx),%eax
c0107d87:	83 eb 04             	sub    $0x4,%ebx
c0107d8a:	8b 52 08             	mov    0x8(%edx),%edx
c0107d8d:	83 fb 24             	cmp    $0x24,%ebx
c0107d90:	8d 71 08             	lea    0x8(%ecx),%esi
c0107d93:	89 42 0c             	mov    %eax,0xc(%edx)
c0107d96:	89 50 08             	mov    %edx,0x8(%eax)
c0107d99:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107d9c:	8b 51 08             	mov    0x8(%ecx),%edx
c0107d9f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107da2:	89 50 08             	mov    %edx,0x8(%eax)
c0107da5:	0f 87 85 03 00 00    	ja     c0108130 <_realloc_r+0x490>
c0107dab:	83 fb 13             	cmp    $0x13,%ebx
c0107dae:	89 f0                	mov    %esi,%eax
c0107db0:	76 1a                	jbe    c0107dcc <_realloc_r+0x12c>
c0107db2:	8b 07                	mov    (%edi),%eax
c0107db4:	83 fb 1b             	cmp    $0x1b,%ebx
c0107db7:	89 41 08             	mov    %eax,0x8(%ecx)
c0107dba:	8b 47 04             	mov    0x4(%edi),%eax
c0107dbd:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107dc0:	0f 87 8f 03 00 00    	ja     c0108155 <_realloc_r+0x4b5>
c0107dc6:	8d 41 10             	lea    0x10(%ecx),%eax
c0107dc9:	83 c7 08             	add    $0x8,%edi
c0107dcc:	8b 17                	mov    (%edi),%edx
c0107dce:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107dd1:	89 10                	mov    %edx,(%eax)
c0107dd3:	8b 57 04             	mov    0x4(%edi),%edx
c0107dd6:	89 50 04             	mov    %edx,0x4(%eax)
c0107dd9:	8b 57 08             	mov    0x8(%edi),%edx
c0107ddc:	89 f7                	mov    %esi,%edi
c0107dde:	89 ce                	mov    %ecx,%esi
c0107de0:	89 50 08             	mov    %edx,0x8(%eax)
c0107de3:	8b 41 04             	mov    0x4(%ecx),%eax
c0107de6:	eb 1b                	jmp    c0107e03 <_realloc_r+0x163>
c0107de8:	83 e2 f8             	and    $0xfffffff8,%edx
c0107deb:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0107dee:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0107df1:	c1 ea 1f             	shr    $0x1f,%edx
c0107df4:	e9 ff fe ff ff       	jmp    c0107cf8 <_realloc_r+0x58>
c0107df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107e00:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107e03:	89 da                	mov    %ebx,%edx
c0107e05:	2b 55 dc             	sub    -0x24(%ebp),%edx
c0107e08:	83 fa 0f             	cmp    $0xf,%edx
c0107e0b:	77 4b                	ja     c0107e58 <_realloc_r+0x1b8>
c0107e0d:	83 e0 01             	and    $0x1,%eax
c0107e10:	09 d8                	or     %ebx,%eax
c0107e12:	89 46 04             	mov    %eax,0x4(%esi)
c0107e15:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c0107e1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107e1d:	89 04 24             	mov    %eax,(%esp)
c0107e20:	e8 ab da ff ff       	call   c01058d0 <__malloc_unlock>
c0107e25:	89 f8                	mov    %edi,%eax
c0107e27:	83 c4 3c             	add    $0x3c,%esp
c0107e2a:	5b                   	pop    %ebx
c0107e2b:	5e                   	pop    %esi
c0107e2c:	5f                   	pop    %edi
c0107e2d:	5d                   	pop    %ebp
c0107e2e:	c3                   	ret    
c0107e2f:	90                   	nop
c0107e30:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107e33:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107e36:	01 d9                	add    %ebx,%ecx
c0107e38:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c0107e3b:	0f 8c 04 ff ff ff    	jl     c0107d45 <_realloc_r+0xa5>
c0107e41:	8b 5a 0c             	mov    0xc(%edx),%ebx
c0107e44:	8b 52 08             	mov    0x8(%edx),%edx
c0107e47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107e4a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c0107e4d:	89 53 08             	mov    %edx,0x8(%ebx)
c0107e50:	89 cb                	mov    %ecx,%ebx
c0107e52:	eb af                	jmp    c0107e03 <_realloc_r+0x163>
c0107e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107e58:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107e5b:	83 e0 01             	and    $0x1,%eax
c0107e5e:	09 d8                	or     %ebx,%eax
c0107e60:	89 46 04             	mov    %eax,0x4(%esi)
c0107e63:	89 d0                	mov    %edx,%eax
c0107e65:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c0107e68:	83 c8 01             	or     $0x1,%eax
c0107e6b:	89 41 04             	mov    %eax,0x4(%ecx)
c0107e6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107e71:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107e76:	83 c1 08             	add    $0x8,%ecx
c0107e79:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0107e7d:	89 04 24             	mov    %eax,(%esp)
c0107e80:	e8 2b fb ff ff       	call   c01079b0 <_free_r>
c0107e85:	eb 93                	jmp    c0107e1a <_realloc_r+0x17a>
c0107e87:	90                   	nop
c0107e88:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107e8b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107e8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107e92:	89 04 24             	mov    %eax,(%esp)
c0107e95:	e8 46 d2 ff ff       	call   c01050e0 <_malloc_r>
c0107e9a:	85 c0                	test   %eax,%eax
c0107e9c:	89 c1                	mov    %eax,%ecx
c0107e9e:	0f 84 65 03 00 00    	je     c0108209 <_realloc_r+0x569>
c0107ea4:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107ea7:	8d 51 f8             	lea    -0x8(%ecx),%edx
c0107eaa:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0107ead:	89 c2                	mov    %eax,%edx
c0107eaf:	83 e2 fe             	and    $0xfffffffe,%edx
c0107eb2:	01 f2                	add    %esi,%edx
c0107eb4:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107eb7:	0f 84 63 02 00 00    	je     c0108120 <_realloc_r+0x480>
c0107ebd:	83 eb 04             	sub    $0x4,%ebx
c0107ec0:	83 fb 24             	cmp    $0x24,%ebx
c0107ec3:	0f 87 6f 01 00 00    	ja     c0108038 <_realloc_r+0x398>
c0107ec9:	83 fb 13             	cmp    $0x13,%ebx
c0107ecc:	0f 87 ee 00 00 00    	ja     c0107fc0 <_realloc_r+0x320>
c0107ed2:	89 c8                	mov    %ecx,%eax
c0107ed4:	89 fa                	mov    %edi,%edx
c0107ed6:	8b 1a                	mov    (%edx),%ebx
c0107ed8:	89 18                	mov    %ebx,(%eax)
c0107eda:	8b 5a 04             	mov    0x4(%edx),%ebx
c0107edd:	89 58 04             	mov    %ebx,0x4(%eax)
c0107ee0:	8b 52 08             	mov    0x8(%edx),%edx
c0107ee3:	89 50 08             	mov    %edx,0x8(%eax)
c0107ee6:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0107ee9:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107eed:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107ef0:	89 34 24             	mov    %esi,(%esp)
c0107ef3:	e8 b8 fa ff ff       	call   c01079b0 <_free_r>
c0107ef8:	89 34 24             	mov    %esi,(%esp)
c0107efb:	e8 d0 d9 ff ff       	call   c01058d0 <__malloc_unlock>
c0107f00:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107f03:	83 c4 3c             	add    $0x3c,%esp
c0107f06:	5b                   	pop    %ebx
c0107f07:	5e                   	pop    %esi
c0107f08:	5f                   	pop    %edi
c0107f09:	89 c8                	mov    %ecx,%eax
c0107f0b:	5d                   	pop    %ebp
c0107f0c:	c3                   	ret    
c0107f0d:	8d 76 00             	lea    0x0(%esi),%esi
c0107f10:	89 45 0c             	mov    %eax,0xc(%ebp)
c0107f13:	83 c4 3c             	add    $0x3c,%esp
c0107f16:	5b                   	pop    %ebx
c0107f17:	5e                   	pop    %esi
c0107f18:	5f                   	pop    %edi
c0107f19:	5d                   	pop    %ebp
c0107f1a:	e9 c1 d1 ff ff       	jmp    c01050e0 <_malloc_r>
c0107f1f:	90                   	nop
c0107f20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107f23:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0107f29:	31 c0                	xor    %eax,%eax
c0107f2b:	e9 f7 fe ff ff       	jmp    c0107e27 <_realloc_r+0x187>
c0107f30:	89 c2                	mov    %eax,%edx
c0107f32:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107f35:	0f 8c 4d ff ff ff    	jl     c0107e88 <_realloc_r+0x1e8>
c0107f3b:	8b 71 08             	mov    0x8(%ecx),%esi
c0107f3e:	83 eb 04             	sub    $0x4,%ebx
c0107f41:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107f44:	83 fb 24             	cmp    $0x24,%ebx
c0107f47:	89 46 0c             	mov    %eax,0xc(%esi)
c0107f4a:	89 70 08             	mov    %esi,0x8(%eax)
c0107f4d:	8d 71 08             	lea    0x8(%ecx),%esi
c0107f50:	0f 87 88 00 00 00    	ja     c0107fde <_realloc_r+0x33e>
c0107f56:	83 fb 13             	cmp    $0x13,%ebx
c0107f59:	89 f0                	mov    %esi,%eax
c0107f5b:	76 1a                	jbe    c0107f77 <_realloc_r+0x2d7>
c0107f5d:	8b 07                	mov    (%edi),%eax
c0107f5f:	83 fb 1b             	cmp    $0x1b,%ebx
c0107f62:	89 41 08             	mov    %eax,0x8(%ecx)
c0107f65:	8b 47 04             	mov    0x4(%edi),%eax
c0107f68:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107f6b:	0f 87 17 02 00 00    	ja     c0108188 <_realloc_r+0x4e8>
c0107f71:	8d 41 10             	lea    0x10(%ecx),%eax
c0107f74:	83 c7 08             	add    $0x8,%edi
c0107f77:	8b 1f                	mov    (%edi),%ebx
c0107f79:	89 18                	mov    %ebx,(%eax)
c0107f7b:	8b 5f 04             	mov    0x4(%edi),%ebx
c0107f7e:	89 58 04             	mov    %ebx,0x4(%eax)
c0107f81:	8b 5f 08             	mov    0x8(%edi),%ebx
c0107f84:	89 f7                	mov    %esi,%edi
c0107f86:	89 ce                	mov    %ecx,%esi
c0107f88:	89 58 08             	mov    %ebx,0x8(%eax)
c0107f8b:	89 d3                	mov    %edx,%ebx
c0107f8d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107f90:	e9 6e fe ff ff       	jmp    c0107e03 <_realloc_r+0x163>
c0107f95:	8d 76 00             	lea    0x0(%esi),%esi
c0107f98:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0107f9b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0107f9e:	8b 48 04             	mov    0x4(%eax),%ecx
c0107fa1:	83 c2 10             	add    $0x10,%edx
c0107fa4:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107fa7:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c0107fab:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0107fae:	01 d9                	add    %ebx,%ecx
c0107fb0:	39 d1                	cmp    %edx,%ecx
c0107fb2:	7d 54                	jge    c0108008 <_realloc_r+0x368>
c0107fb4:	89 c2                	mov    %eax,%edx
c0107fb6:	e9 8a fd ff ff       	jmp    c0107d45 <_realloc_r+0xa5>
c0107fbb:	90                   	nop
c0107fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107fc0:	8b 07                	mov    (%edi),%eax
c0107fc2:	83 fb 1b             	cmp    $0x1b,%ebx
c0107fc5:	89 01                	mov    %eax,(%ecx)
c0107fc7:	8b 47 04             	mov    0x4(%edi),%eax
c0107fca:	89 41 04             	mov    %eax,0x4(%ecx)
c0107fcd:	0f 87 2d 01 00 00    	ja     c0108100 <_realloc_r+0x460>
c0107fd3:	8d 41 08             	lea    0x8(%ecx),%eax
c0107fd6:	8d 57 08             	lea    0x8(%edi),%edx
c0107fd9:	e9 f8 fe ff ff       	jmp    c0107ed6 <_realloc_r+0x236>
c0107fde:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107fe2:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107fe6:	89 f7                	mov    %esi,%edi
c0107fe8:	89 34 24             	mov    %esi,(%esp)
c0107feb:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0107fee:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107ff1:	e8 1a fc ff ff       	call   c0107c10 <memmove>
c0107ff6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107ff9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0107ffc:	8b 41 04             	mov    0x4(%ecx),%eax
c0107fff:	89 ce                	mov    %ecx,%esi
c0108001:	89 d3                	mov    %edx,%ebx
c0108003:	e9 fb fd ff ff       	jmp    c0107e03 <_realloc_r+0x163>
c0108008:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010800b:	29 d9                	sub    %ebx,%ecx
c010800d:	01 de                	add    %ebx,%esi
c010800f:	83 c9 01             	or     $0x1,%ecx
c0108012:	89 35 c8 b5 10 c0    	mov    %esi,0xc010b5c8
c0108018:	89 4e 04             	mov    %ecx,0x4(%esi)
c010801b:	8b 47 fc             	mov    -0x4(%edi),%eax
c010801e:	83 e0 01             	and    $0x1,%eax
c0108021:	09 d8                	or     %ebx,%eax
c0108023:	89 47 fc             	mov    %eax,-0x4(%edi)
c0108026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108029:	89 04 24             	mov    %eax,(%esp)
c010802c:	e8 9f d8 ff ff       	call   c01058d0 <__malloc_unlock>
c0108031:	89 f8                	mov    %edi,%eax
c0108033:	e9 ef fd ff ff       	jmp    c0107e27 <_realloc_r+0x187>
c0108038:	89 0c 24             	mov    %ecx,(%esp)
c010803b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010803f:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0108043:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108046:	e8 c5 fb ff ff       	call   c0107c10 <memmove>
c010804b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010804e:	e9 93 fe ff ff       	jmp    c0107ee6 <_realloc_r+0x246>
c0108053:	90                   	nop
c0108054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0108058:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c010805b:	e9 d2 fe ff ff       	jmp    c0107f32 <_realloc_r+0x292>
c0108060:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0108063:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108066:	01 d0                	add    %edx,%eax
c0108068:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010806b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010806e:	83 c0 10             	add    $0x10,%eax
c0108071:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0108074:	0f 8c b8 fe ff ff    	jl     c0107f32 <_realloc_r+0x292>
c010807a:	8b 41 0c             	mov    0xc(%ecx),%eax
c010807d:	83 eb 04             	sub    $0x4,%ebx
c0108080:	8b 51 08             	mov    0x8(%ecx),%edx
c0108083:	83 fb 24             	cmp    $0x24,%ebx
c0108086:	8d 71 08             	lea    0x8(%ecx),%esi
c0108089:	89 42 0c             	mov    %eax,0xc(%edx)
c010808c:	89 50 08             	mov    %edx,0x8(%eax)
c010808f:	0f 87 3d 01 00 00    	ja     c01081d2 <_realloc_r+0x532>
c0108095:	83 fb 13             	cmp    $0x13,%ebx
c0108098:	89 f0                	mov    %esi,%eax
c010809a:	76 1a                	jbe    c01080b6 <_realloc_r+0x416>
c010809c:	8b 07                	mov    (%edi),%eax
c010809e:	83 fb 1b             	cmp    $0x1b,%ebx
c01080a1:	89 41 08             	mov    %eax,0x8(%ecx)
c01080a4:	8b 47 04             	mov    0x4(%edi),%eax
c01080a7:	89 41 0c             	mov    %eax,0xc(%ecx)
c01080aa:	0f 87 3d 01 00 00    	ja     c01081ed <_realloc_r+0x54d>
c01080b0:	8d 41 10             	lea    0x10(%ecx),%eax
c01080b3:	83 c7 08             	add    $0x8,%edi
c01080b6:	8b 17                	mov    (%edi),%edx
c01080b8:	89 10                	mov    %edx,(%eax)
c01080ba:	8b 57 04             	mov    0x4(%edi),%edx
c01080bd:	89 50 04             	mov    %edx,0x4(%eax)
c01080c0:	8b 57 08             	mov    0x8(%edi),%edx
c01080c3:	89 50 08             	mov    %edx,0x8(%eax)
c01080c6:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c01080c9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01080cc:	89 d8                	mov    %ebx,%eax
c01080ce:	29 df                	sub    %ebx,%edi
c01080d0:	01 c8                	add    %ecx,%eax
c01080d2:	83 cf 01             	or     $0x1,%edi
c01080d5:	a3 c8 b5 10 c0       	mov    %eax,0xc010b5c8
c01080da:	89 78 04             	mov    %edi,0x4(%eax)
c01080dd:	8b 41 04             	mov    0x4(%ecx),%eax
c01080e0:	83 e0 01             	and    $0x1,%eax
c01080e3:	09 d8                	or     %ebx,%eax
c01080e5:	89 41 04             	mov    %eax,0x4(%ecx)
c01080e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01080eb:	89 04 24             	mov    %eax,(%esp)
c01080ee:	e8 dd d7 ff ff       	call   c01058d0 <__malloc_unlock>
c01080f3:	89 f0                	mov    %esi,%eax
c01080f5:	e9 2d fd ff ff       	jmp    c0107e27 <_realloc_r+0x187>
c01080fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0108100:	8b 47 08             	mov    0x8(%edi),%eax
c0108103:	83 fb 24             	cmp    $0x24,%ebx
c0108106:	89 41 08             	mov    %eax,0x8(%ecx)
c0108109:	8b 47 0c             	mov    0xc(%edi),%eax
c010810c:	89 41 0c             	mov    %eax,0xc(%ecx)
c010810f:	74 60                	je     c0108171 <_realloc_r+0x4d1>
c0108111:	8d 41 10             	lea    0x10(%ecx),%eax
c0108114:	8d 57 10             	lea    0x10(%edi),%edx
c0108117:	e9 ba fd ff ff       	jmp    c0107ed6 <_realloc_r+0x236>
c010811c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0108120:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0108123:	83 e2 fc             	and    $0xfffffffc,%edx
c0108126:	01 d3                	add    %edx,%ebx
c0108128:	e9 d6 fc ff ff       	jmp    c0107e03 <_realloc_r+0x163>
c010812d:	8d 76 00             	lea    0x0(%esi),%esi
c0108130:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0108134:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0108138:	89 f7                	mov    %esi,%edi
c010813a:	89 34 24             	mov    %esi,(%esp)
c010813d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108140:	e8 cb fa ff ff       	call   c0107c10 <memmove>
c0108145:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108148:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c010814b:	8b 41 04             	mov    0x4(%ecx),%eax
c010814e:	89 ce                	mov    %ecx,%esi
c0108150:	e9 ae fc ff ff       	jmp    c0107e03 <_realloc_r+0x163>
c0108155:	8b 47 08             	mov    0x8(%edi),%eax
c0108158:	83 fb 24             	cmp    $0x24,%ebx
c010815b:	89 41 10             	mov    %eax,0x10(%ecx)
c010815e:	8b 47 0c             	mov    0xc(%edi),%eax
c0108161:	89 41 14             	mov    %eax,0x14(%ecx)
c0108164:	74 3e                	je     c01081a4 <_realloc_r+0x504>
c0108166:	8d 41 18             	lea    0x18(%ecx),%eax
c0108169:	83 c7 10             	add    $0x10,%edi
c010816c:	e9 5b fc ff ff       	jmp    c0107dcc <_realloc_r+0x12c>
c0108171:	8b 47 10             	mov    0x10(%edi),%eax
c0108174:	8d 57 18             	lea    0x18(%edi),%edx
c0108177:	89 41 10             	mov    %eax,0x10(%ecx)
c010817a:	8b 5f 14             	mov    0x14(%edi),%ebx
c010817d:	8d 41 18             	lea    0x18(%ecx),%eax
c0108180:	89 59 14             	mov    %ebx,0x14(%ecx)
c0108183:	e9 4e fd ff ff       	jmp    c0107ed6 <_realloc_r+0x236>
c0108188:	8b 47 08             	mov    0x8(%edi),%eax
c010818b:	83 fb 24             	cmp    $0x24,%ebx
c010818e:	89 41 10             	mov    %eax,0x10(%ecx)
c0108191:	8b 47 0c             	mov    0xc(%edi),%eax
c0108194:	89 41 14             	mov    %eax,0x14(%ecx)
c0108197:	74 22                	je     c01081bb <_realloc_r+0x51b>
c0108199:	8d 41 18             	lea    0x18(%ecx),%eax
c010819c:	83 c7 10             	add    $0x10,%edi
c010819f:	e9 d3 fd ff ff       	jmp    c0107f77 <_realloc_r+0x2d7>
c01081a4:	8b 47 10             	mov    0x10(%edi),%eax
c01081a7:	83 c7 18             	add    $0x18,%edi
c01081aa:	89 41 18             	mov    %eax,0x18(%ecx)
c01081ad:	8b 57 fc             	mov    -0x4(%edi),%edx
c01081b0:	8d 41 20             	lea    0x20(%ecx),%eax
c01081b3:	89 51 1c             	mov    %edx,0x1c(%ecx)
c01081b6:	e9 11 fc ff ff       	jmp    c0107dcc <_realloc_r+0x12c>
c01081bb:	8b 47 10             	mov    0x10(%edi),%eax
c01081be:	83 c7 18             	add    $0x18,%edi
c01081c1:	89 41 18             	mov    %eax,0x18(%ecx)
c01081c4:	8b 5f fc             	mov    -0x4(%edi),%ebx
c01081c7:	8d 41 20             	lea    0x20(%ecx),%eax
c01081ca:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c01081cd:	e9 a5 fd ff ff       	jmp    c0107f77 <_realloc_r+0x2d7>
c01081d2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01081d6:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01081da:	89 34 24             	mov    %esi,(%esp)
c01081dd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01081e0:	e8 2b fa ff ff       	call   c0107c10 <memmove>
c01081e5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01081e8:	e9 d9 fe ff ff       	jmp    c01080c6 <_realloc_r+0x426>
c01081ed:	8b 47 08             	mov    0x8(%edi),%eax
c01081f0:	83 fb 24             	cmp    $0x24,%ebx
c01081f3:	89 41 10             	mov    %eax,0x10(%ecx)
c01081f6:	8b 47 0c             	mov    0xc(%edi),%eax
c01081f9:	89 41 14             	mov    %eax,0x14(%ecx)
c01081fc:	74 1d                	je     c010821b <_realloc_r+0x57b>
c01081fe:	8d 41 18             	lea    0x18(%ecx),%eax
c0108201:	83 c7 10             	add    $0x10,%edi
c0108204:	e9 ad fe ff ff       	jmp    c01080b6 <_realloc_r+0x416>
c0108209:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010820c:	89 04 24             	mov    %eax,(%esp)
c010820f:	e8 bc d6 ff ff       	call   c01058d0 <__malloc_unlock>
c0108214:	31 c0                	xor    %eax,%eax
c0108216:	e9 0c fc ff ff       	jmp    c0107e27 <_realloc_r+0x187>
c010821b:	8b 47 10             	mov    0x10(%edi),%eax
c010821e:	83 c7 18             	add    $0x18,%edi
c0108221:	89 41 18             	mov    %eax,0x18(%ecx)
c0108224:	8b 57 fc             	mov    -0x4(%edi),%edx
c0108227:	8d 41 20             	lea    0x20(%ecx),%eax
c010822a:	89 51 1c             	mov    %edx,0x1c(%ecx)
c010822d:	e9 84 fe ff ff       	jmp    c01080b6 <_realloc_r+0x416>
c0108232:	66 90                	xchg   %ax,%ax
c0108234:	66 90                	xchg   %ax,%ax
c0108236:	66 90                	xchg   %ax,%ax
c0108238:	66 90                	xchg   %ax,%ax
c010823a:	66 90                	xchg   %ax,%ax
c010823c:	66 90                	xchg   %ax,%ax
c010823e:	66 90                	xchg   %ax,%ax

c0108240 <cleanup_glue>:
c0108240:	55                   	push   %ebp
c0108241:	89 e5                	mov    %esp,%ebp
c0108243:	56                   	push   %esi
c0108244:	53                   	push   %ebx
c0108245:	83 ec 10             	sub    $0x10,%esp
c0108248:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010824b:	8b 75 08             	mov    0x8(%ebp),%esi
c010824e:	8b 03                	mov    (%ebx),%eax
c0108250:	85 c0                	test   %eax,%eax
c0108252:	74 0c                	je     c0108260 <cleanup_glue+0x20>
c0108254:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108258:	89 34 24             	mov    %esi,(%esp)
c010825b:	e8 e0 ff ff ff       	call   c0108240 <cleanup_glue>
c0108260:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0108263:	89 75 08             	mov    %esi,0x8(%ebp)
c0108266:	83 c4 10             	add    $0x10,%esp
c0108269:	5b                   	pop    %ebx
c010826a:	5e                   	pop    %esi
c010826b:	5d                   	pop    %ebp
c010826c:	e9 3f f7 ff ff       	jmp    c01079b0 <_free_r>
c0108271:	eb 0d                	jmp    c0108280 <_reclaim_reent>
c0108273:	90                   	nop
c0108274:	90                   	nop
c0108275:	90                   	nop
c0108276:	90                   	nop
c0108277:	90                   	nop
c0108278:	90                   	nop
c0108279:	90                   	nop
c010827a:	90                   	nop
c010827b:	90                   	nop
c010827c:	90                   	nop
c010827d:	90                   	nop
c010827e:	90                   	nop
c010827f:	90                   	nop

c0108280 <_reclaim_reent>:
c0108280:	55                   	push   %ebp
c0108281:	89 e5                	mov    %esp,%ebp
c0108283:	57                   	push   %edi
c0108284:	56                   	push   %esi
c0108285:	53                   	push   %ebx
c0108286:	83 ec 1c             	sub    $0x1c,%esp
c0108289:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010828c:	3b 1d c0 b0 10 c0    	cmp    0xc010b0c0,%ebx
c0108292:	0f 84 a6 00 00 00    	je     c010833e <_reclaim_reent+0xbe>
c0108298:	8b 53 4c             	mov    0x4c(%ebx),%edx
c010829b:	85 d2                	test   %edx,%edx
c010829d:	74 46                	je     c01082e5 <_reclaim_reent+0x65>
c010829f:	31 c0                	xor    %eax,%eax
c01082a1:	31 f6                	xor    %esi,%esi
c01082a3:	90                   	nop
c01082a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01082a8:	8b 04 82             	mov    (%edx,%eax,4),%eax
c01082ab:	85 c0                	test   %eax,%eax
c01082ad:	75 0b                	jne    c01082ba <_reclaim_reent+0x3a>
c01082af:	eb 1e                	jmp    c01082cf <_reclaim_reent+0x4f>
c01082b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01082b8:	89 f8                	mov    %edi,%eax
c01082ba:	8b 38                	mov    (%eax),%edi
c01082bc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01082c0:	89 1c 24             	mov    %ebx,(%esp)
c01082c3:	e8 e8 f6 ff ff       	call   c01079b0 <_free_r>
c01082c8:	85 ff                	test   %edi,%edi
c01082ca:	75 ec                	jne    c01082b8 <_reclaim_reent+0x38>
c01082cc:	8b 53 4c             	mov    0x4c(%ebx),%edx
c01082cf:	83 c6 01             	add    $0x1,%esi
c01082d2:	83 fe 20             	cmp    $0x20,%esi
c01082d5:	89 f0                	mov    %esi,%eax
c01082d7:	75 cf                	jne    c01082a8 <_reclaim_reent+0x28>
c01082d9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01082dd:	89 1c 24             	mov    %ebx,(%esp)
c01082e0:	e8 cb f6 ff ff       	call   c01079b0 <_free_r>
c01082e5:	8b 43 40             	mov    0x40(%ebx),%eax
c01082e8:	85 c0                	test   %eax,%eax
c01082ea:	74 0c                	je     c01082f8 <_reclaim_reent+0x78>
c01082ec:	89 44 24 04          	mov    %eax,0x4(%esp)
c01082f0:	89 1c 24             	mov    %ebx,(%esp)
c01082f3:	e8 b8 f6 ff ff       	call   c01079b0 <_free_r>
c01082f8:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c01082fe:	85 c0                	test   %eax,%eax
c0108300:	74 22                	je     c0108324 <_reclaim_reent+0xa4>
c0108302:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0108308:	39 f0                	cmp    %esi,%eax
c010830a:	75 06                	jne    c0108312 <_reclaim_reent+0x92>
c010830c:	eb 16                	jmp    c0108324 <_reclaim_reent+0xa4>
c010830e:	66 90                	xchg   %ax,%ax
c0108310:	89 f8                	mov    %edi,%eax
c0108312:	8b 38                	mov    (%eax),%edi
c0108314:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108318:	89 1c 24             	mov    %ebx,(%esp)
c010831b:	e8 90 f6 ff ff       	call   c01079b0 <_free_r>
c0108320:	39 fe                	cmp    %edi,%esi
c0108322:	75 ec                	jne    c0108310 <_reclaim_reent+0x90>
c0108324:	8b 43 54             	mov    0x54(%ebx),%eax
c0108327:	85 c0                	test   %eax,%eax
c0108329:	74 0c                	je     c0108337 <_reclaim_reent+0xb7>
c010832b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010832f:	89 1c 24             	mov    %ebx,(%esp)
c0108332:	e8 79 f6 ff ff       	call   c01079b0 <_free_r>
c0108337:	8b 43 38             	mov    0x38(%ebx),%eax
c010833a:	85 c0                	test   %eax,%eax
c010833c:	75 08                	jne    c0108346 <_reclaim_reent+0xc6>
c010833e:	83 c4 1c             	add    $0x1c,%esp
c0108341:	5b                   	pop    %ebx
c0108342:	5e                   	pop    %esi
c0108343:	5f                   	pop    %edi
c0108344:	5d                   	pop    %ebp
c0108345:	c3                   	ret    
c0108346:	89 1c 24             	mov    %ebx,(%esp)
c0108349:	ff 53 3c             	call   *0x3c(%ebx)
c010834c:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0108352:	85 c0                	test   %eax,%eax
c0108354:	74 e8                	je     c010833e <_reclaim_reent+0xbe>
c0108356:	89 1c 24             	mov    %ebx,(%esp)
c0108359:	89 44 24 04          	mov    %eax,0x4(%esp)
c010835d:	e8 de fe ff ff       	call   c0108240 <cleanup_glue>
c0108362:	83 c4 1c             	add    $0x1c,%esp
c0108365:	5b                   	pop    %ebx
c0108366:	5e                   	pop    %esi
c0108367:	5f                   	pop    %edi
c0108368:	5d                   	pop    %ebp
c0108369:	c3                   	ret    
