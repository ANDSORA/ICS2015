
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
c010002b:	e9 10 04 00 00       	jmp    c0100440 <init>

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
c0100066:	e8 05 0c 00 00       	call   c0100c70 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 0e 0c 00 00       	call   c0100c80 <get_ucr3>
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
c01000d7:	a1 00 a0 10 c0       	mov    0xc010a000,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 00 a0 10 c0       	mov    %eax,0xc010a000
c01000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
c01000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
c0100102:	74 54                	je     c0100158 <mm_malloc+0x108>
c0100104:	89 d8                	mov    %ebx,%eax
c0100106:	c1 e8 16             	shr    $0x16,%eax
c0100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
c010010c:	f6 01 01             	testb  $0x1,(%ecx)
c010010f:	75 a7                	jne    c01000b8 <mm_malloc+0x68>
c0100111:	a1 00 b0 10 c0       	mov    0xc010b000,%eax
c0100116:	89 c6                	mov    %eax,%esi
c0100118:	83 c0 01             	add    $0x1,%eax
c010011b:	c1 e6 0c             	shl    $0xc,%esi
c010011e:	81 c6 00 c0 10 c0    	add    $0xc010c000,%esi
c0100124:	a3 00 b0 10 c0       	mov    %eax,0xc010b000
c0100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
c010012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100134:	83 c8 07             	or     $0x7,%eax
c0100137:	89 01                	mov    %eax,(%ecx)
c0100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100140:	00 
c0100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100148:	00 
c0100149:	89 34 24             	mov    %esi,(%esp)
c010014c:	e8 97 13 00 00       	call   c01014e8 <memset>
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
c0100178:	c7 44 24 10 84 7d 10 	movl   $0xc0107d84,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c e8 7d 10 	movl   $0xc0107de8,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 73 7d 10 	movl   $0xc0107d73,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 94 7d 10 c0 	movl   $0xc0107d94,(%esp)
c010019f:	e8 fc 0d 00 00       	call   c0100fa0 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 8c 7d 10 	movl   $0xc0107d8c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c e8 7d 10 	movl   $0xc0107de8,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 73 7d 10 	movl   $0xc0107d73,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 94 7d 10 c0 	movl   $0xc0107d94,(%esp)
c01001ee:	e8 ad 0d 00 00       	call   c0100fa0 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 84 7d 10 	movl   $0xc0107d84,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c e8 7d 10 	movl   $0xc0107de8,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 73 7d 10 	movl   $0xc0107d73,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 94 7d 10 c0 	movl   $0xc0107d94,(%esp)
c010022e:	e8 6d 0d 00 00       	call   c0100fa0 <printk>
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
c0100258:	c7 44 24 10 8c 7d 10 	movl   $0xc0107d8c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c e8 7d 10 	movl   $0xc0107de8,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 73 7d 10 	movl   $0xc0107d73,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 94 7d 10 c0 	movl   $0xc0107d94,(%esp)
c010027f:	e8 1c 0d 00 00       	call   c0100fa0 <printk>
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
c01002a8:	c7 44 24 10 60 7d 10 	movl   $0xc0107d60,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c de 7d 10 	movl   $0xc0107dde,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 73 7d 10 	movl   $0xc0107d73,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 94 7d 10 c0 	movl   $0xc0107d94,(%esp)
c01002cf:	e8 cc 0c 00 00       	call   c0100fa0 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 00 a0 10 c0       	mov    0xc010a000,%eax
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
c010039a:	e8 81 02 00 00       	call   c0100620 <irq_handle>
c010039f:	83 c4 04             	add    $0x4,%esp
c01003a2:	61                   	popa   
c01003a3:	83 c4 08             	add    $0x8,%esp
c01003a6:	cf                   	iret   
c01003a7:	66 90                	xchg   %ax,%ax
c01003a9:	66 90                	xchg   %ax,%ax
c01003ab:	66 90                	xchg   %ax,%ax
c01003ad:	66 90                	xchg   %ax,%ax
c01003af:	90                   	nop

c01003b0 <init_cond>:
c01003b0:	55                   	push   %ebp
c01003b1:	89 e5                	mov    %esp,%ebp
c01003b3:	53                   	push   %ebx
c01003b4:	83 ec 04             	sub    $0x4,%esp
c01003b7:	e8 f4 09 00 00       	call   c0100db0 <init_segment>
c01003bc:	e8 ef 03 00 00       	call   c01007b0 <init_idt>
c01003c1:	e8 7a 03 00 00       	call   c0100740 <init_i8259>
c01003c6:	e8 35 0c 00 00       	call   c0101000 <init_serial>
c01003cb:	e8 f0 0d 00 00       	call   c01011c0 <init_ide>
c01003d0:	fb                   	sti    
c01003d1:	e8 ea 08 00 00       	call   c0100cc0 <init_mm>
c01003d6:	68 7f 7e 10 c0       	push   $0xc0107e7f
c01003db:	6a 4a                	push   $0x4a
c01003dd:	68 ee 7d 10 c0       	push   $0xc0107dee
c01003e2:	68 00 7e 10 c0       	push   $0xc0107e00
c01003e7:	e8 b4 0b 00 00       	call   c0100fa0 <printk>
c01003ec:	e8 ef 07 00 00       	call   c0100be0 <video_mapping_write_test>
c01003f1:	e8 6a 0a 00 00       	call   c0100e60 <loader>
c01003f6:	89 c3                	mov    %eax,%ebx
c01003f8:	e8 03 08 00 00       	call   c0100c00 <video_mapping_read_test>
c01003fd:	e8 4e 08 00 00       	call   c0100c50 <video_mapping_clear>
c0100402:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c0100407:	bd 00 00 00 00       	mov    $0x0,%ebp
c010040c:	83 ec 10             	sub    $0x10,%esp
c010040f:	ff d3                	call   *%ebx
c0100411:	68 7f 7e 10 c0       	push   $0xc0107e7f
c0100416:	6a 6b                	push   $0x6b
c0100418:	68 ee 7d 10 c0       	push   $0xc0107dee
c010041d:	68 34 7e 10 c0       	push   $0xc0107e34
c0100422:	e8 79 0b 00 00       	call   c0100fa0 <printk>
c0100427:	b8 01 00 00 00       	mov    $0x1,%eax
c010042c:	d6                   	(bad)  
c010042d:	83 c4 20             	add    $0x20,%esp
c0100430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100433:	c9                   	leave  
c0100434:	c3                   	ret    
c0100435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100440 <init>:
c0100440:	55                   	push   %ebp
c0100441:	89 e5                	mov    %esp,%ebp
c0100443:	83 ec 08             	sub    $0x8,%esp
c0100446:	e8 e5 08 00 00       	call   c0100d30 <init_page>
c010044b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100451:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100456:	ff e0                	jmp    *%eax
c0100458:	68 89 7e 10 c0       	push   $0xc0107e89
c010045d:	6a 24                	push   $0x24
c010045f:	68 ee 7d 10 c0       	push   $0xc0107dee
c0100464:	68 34 7e 10 c0       	push   $0xc0107e34
c0100469:	e8 32 0b 00 00       	call   c0100fa0 <printk>
c010046e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100473:	d6                   	(bad)  
c0100474:	83 c4 10             	add    $0x10,%esp
c0100477:	c9                   	leave  
c0100478:	c3                   	ret    
c0100479:	66 90                	xchg   %ax,%ax
c010047b:	66 90                	xchg   %ax,%ax
c010047d:	66 90                	xchg   %ax,%ax
c010047f:	90                   	nop

c0100480 <do_syscall>:
c0100480:	55                   	push   %ebp
c0100481:	89 e5                	mov    %esp,%ebp
c0100483:	56                   	push   %esi
c0100484:	53                   	push   %ebx
c0100485:	8b 75 08             	mov    0x8(%ebp),%esi
c0100488:	8b 46 1c             	mov    0x1c(%esi),%eax
c010048b:	83 f8 04             	cmp    $0x4,%eax
c010048e:	74 78                	je     c0100508 <do_syscall+0x88>
c0100490:	83 f8 2d             	cmp    $0x2d,%eax
c0100493:	74 53                	je     c01004e8 <do_syscall+0x68>
c0100495:	85 c0                	test   %eax,%eax
c0100497:	74 2f                	je     c01004c8 <do_syscall+0x48>
c0100499:	83 ec 0c             	sub    $0xc,%esp
c010049c:	50                   	push   %eax
c010049d:	68 20 7f 10 c0       	push   $0xc0107f20
c01004a2:	6a 2c                	push   $0x2c
c01004a4:	68 ac 7e 10 c0       	push   $0xc0107eac
c01004a9:	68 cc 7e 10 c0       	push   $0xc0107ecc
c01004ae:	e8 ed 0a 00 00       	call   c0100fa0 <printk>
c01004b3:	b8 01 00 00 00       	mov    $0x1,%eax
c01004b8:	d6                   	(bad)  
c01004b9:	83 c4 20             	add    $0x20,%esp
c01004bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01004bf:	5b                   	pop    %ebx
c01004c0:	5e                   	pop    %esi
c01004c1:	5d                   	pop    %ebp
c01004c2:	c3                   	ret    
c01004c3:	90                   	nop
c01004c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01004c8:	fa                   	cli    
c01004c9:	83 ec 08             	sub    $0x8,%esp
c01004cc:	ff 76 18             	pushl  0x18(%esi)
c01004cf:	ff 76 10             	pushl  0x10(%esi)
c01004d2:	e8 99 00 00 00       	call   c0100570 <add_irq_handle>
c01004d7:	fb                   	sti    
c01004d8:	83 c4 10             	add    $0x10,%esp
c01004db:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01004de:	5b                   	pop    %ebx
c01004df:	5e                   	pop    %esi
c01004e0:	5d                   	pop    %ebp
c01004e1:	c3                   	ret    
c01004e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004e8:	83 ec 0c             	sub    $0xc,%esp
c01004eb:	ff 76 10             	pushl  0x10(%esi)
c01004ee:	e8 9d 07 00 00       	call   c0100c90 <mm_brk>
c01004f3:	c7 46 1c 00 00 00 00 	movl   $0x0,0x1c(%esi)
c01004fa:	83 c4 10             	add    $0x10,%esp
c01004fd:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100500:	5b                   	pop    %ebx
c0100501:	5e                   	pop    %esi
c0100502:	5d                   	pop    %ebp
c0100503:	c3                   	ret    
c0100504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100508:	8b 46 10             	mov    0x10(%esi),%eax
c010050b:	83 e8 01             	sub    $0x1,%eax
c010050e:	83 f8 01             	cmp    $0x1,%eax
c0100511:	76 27                	jbe    c010053a <do_syscall+0xba>
c0100513:	83 ec 0c             	sub    $0xc,%esp
c0100516:	68 8e 7e 10 c0       	push   $0xc0107e8e
c010051b:	68 20 7f 10 c0       	push   $0xc0107f20
c0100520:	6a 22                	push   $0x22
c0100522:	68 ac 7e 10 c0       	push   $0xc0107eac
c0100527:	68 94 7d 10 c0       	push   $0xc0107d94
c010052c:	e8 6f 0a 00 00       	call   c0100fa0 <printk>
c0100531:	b8 01 00 00 00       	mov    $0x1,%eax
c0100536:	d6                   	(bad)  
c0100537:	83 c4 20             	add    $0x20,%esp
c010053a:	8b 46 14             	mov    0x14(%esi),%eax
c010053d:	85 c0                	test   %eax,%eax
c010053f:	74 25                	je     c0100566 <do_syscall+0xe6>
c0100541:	31 db                	xor    %ebx,%ebx
c0100543:	90                   	nop
c0100544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100548:	8b 46 18             	mov    0x18(%esi),%eax
c010054b:	83 ec 0c             	sub    $0xc,%esp
c010054e:	83 c3 01             	add    $0x1,%ebx
c0100551:	0f be 44 03 ff       	movsbl -0x1(%ebx,%eax,1),%eax
c0100556:	50                   	push   %eax
c0100557:	e8 e4 0a 00 00       	call   c0101040 <serial_printc>
c010055c:	8b 46 14             	mov    0x14(%esi),%eax
c010055f:	83 c4 10             	add    $0x10,%esp
c0100562:	39 c3                	cmp    %eax,%ebx
c0100564:	72 e2                	jb     c0100548 <do_syscall+0xc8>
c0100566:	89 46 1c             	mov    %eax,0x1c(%esi)
c0100569:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010056c:	5b                   	pop    %ebx
c010056d:	5e                   	pop    %esi
c010056e:	5d                   	pop    %ebp
c010056f:	c3                   	ret    

c0100570 <add_irq_handle>:
c0100570:	55                   	push   %ebp
c0100571:	89 e5                	mov    %esp,%ebp
c0100573:	53                   	push   %ebx
c0100574:	83 ec 04             	sub    $0x4,%esp
c0100577:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010057a:	83 fb 0f             	cmp    $0xf,%ebx
c010057d:	7f 71                	jg     c01005f0 <add_irq_handle+0x80>
c010057f:	a1 00 c0 12 c0       	mov    0xc012c000,%eax
c0100584:	83 f8 20             	cmp    $0x20,%eax
c0100587:	7e 2c                	jle    c01005b5 <add_irq_handle+0x45>
c0100589:	83 ec 0c             	sub    $0xc,%esp
c010058c:	68 5a 7f 10 c0       	push   $0xc0107f5a
c0100591:	68 65 80 10 c0       	push   $0xc0108065
c0100596:	6a 16                	push   $0x16
c0100598:	68 3e 7f 10 c0       	push   $0xc0107f3e
c010059d:	68 94 7d 10 c0       	push   $0xc0107d94
c01005a2:	e8 f9 09 00 00       	call   c0100fa0 <printk>
c01005a7:	b8 01 00 00 00       	mov    $0x1,%eax
c01005ac:	d6                   	(bad)  
c01005ad:	a1 00 c0 12 c0       	mov    0xc012c000,%eax
c01005b2:	83 c4 20             	add    $0x20,%esp
c01005b5:	8d 50 01             	lea    0x1(%eax),%edx
c01005b8:	89 15 00 c0 12 c0    	mov    %edx,0xc012c000
c01005be:	8b 55 0c             	mov    0xc(%ebp),%edx
c01005c1:	89 14 c5 80 c0 12 c0 	mov    %edx,-0x3fed3f80(,%eax,8)
c01005c8:	8b 14 9d 40 c0 12 c0 	mov    -0x3fed3fc0(,%ebx,4),%edx
c01005cf:	89 14 c5 84 c0 12 c0 	mov    %edx,-0x3fed3f7c(,%eax,8)
c01005d6:	8d 04 c5 80 c0 12 c0 	lea    -0x3fed3f80(,%eax,8),%eax
c01005dd:	89 04 9d 40 c0 12 c0 	mov    %eax,-0x3fed3fc0(,%ebx,4)
c01005e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005e7:	c9                   	leave  
c01005e8:	c3                   	ret    
c01005e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 2b 7f 10 c0       	push   $0xc0107f2b
c01005f8:	68 65 80 10 c0       	push   $0xc0108065
c01005fd:	6a 15                	push   $0x15
c01005ff:	68 3e 7f 10 c0       	push   $0xc0107f3e
c0100604:	68 94 7d 10 c0       	push   $0xc0107d94
c0100609:	e8 92 09 00 00       	call   c0100fa0 <printk>
c010060e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100613:	d6                   	(bad)  
c0100614:	83 c4 20             	add    $0x20,%esp
c0100617:	e9 63 ff ff ff       	jmp    c010057f <add_irq_handle+0xf>
c010061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100620 <irq_handle>:
c0100620:	55                   	push   %ebp
c0100621:	89 e5                	mov    %esp,%ebp
c0100623:	53                   	push   %ebx
c0100624:	83 ec 04             	sub    $0x4,%esp
c0100627:	8b 55 08             	mov    0x8(%ebp),%edx
c010062a:	8b 42 20             	mov    0x20(%edx),%eax
c010062d:	85 c0                	test   %eax,%eax
c010062f:	0f 88 ab 00 00 00    	js     c01006e0 <irq_handle+0xc0>
c0100635:	3d 80 00 00 00       	cmp    $0x80,%eax
c010063a:	0f 84 c8 00 00 00    	je     c0100708 <irq_handle+0xe8>
c0100640:	3d ff 00 00 00       	cmp    $0xff,%eax
c0100645:	0f 84 cd 00 00 00    	je     c0100718 <irq_handle+0xf8>
c010064b:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100650:	7e 5e                	jle    c01006b0 <irq_handle+0x90>
c0100652:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c0100658:	83 fb 0f             	cmp    $0xf,%ebx
c010065b:	7f 23                	jg     c0100680 <irq_handle+0x60>
c010065d:	8b 1c 9d 40 c0 12 c0 	mov    -0x3fed3fc0(,%ebx,4),%ebx
c0100664:	85 db                	test   %ebx,%ebx
c0100666:	74 11                	je     c0100679 <irq_handle+0x59>
c0100668:	90                   	nop
c0100669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100670:	ff 13                	call   *(%ebx)
c0100672:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100675:	85 db                	test   %ebx,%ebx
c0100677:	75 f7                	jne    c0100670 <irq_handle+0x50>
c0100679:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010067c:	c9                   	leave  
c010067d:	c3                   	ret    
c010067e:	66 90                	xchg   %ax,%ax
c0100680:	83 ec 0c             	sub    $0xc,%esp
c0100683:	68 78 7f 10 c0       	push   $0xc0107f78
c0100688:	68 5a 80 10 c0       	push   $0xc010805a
c010068d:	6a 32                	push   $0x32
c010068f:	68 3e 7f 10 c0       	push   $0xc0107f3e
c0100694:	68 94 7d 10 c0       	push   $0xc0107d94
c0100699:	e8 02 09 00 00       	call   c0100fa0 <printk>
c010069e:	b8 01 00 00 00       	mov    $0x1,%eax
c01006a3:	d6                   	(bad)  
c01006a4:	83 c4 20             	add    $0x20,%esp
c01006a7:	eb b4                	jmp    c010065d <irq_handle+0x3d>
c01006a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01006b0:	83 ec 08             	sub    $0x8,%esp
c01006b3:	ff 72 28             	pushl  0x28(%edx)
c01006b6:	50                   	push   %eax
c01006b7:	68 5a 80 10 c0       	push   $0xc010805a
c01006bc:	6a 2f                	push   $0x2f
c01006be:	68 3e 7f 10 c0       	push   $0xc0107f3e
c01006c3:	68 00 80 10 c0       	push   $0xc0108000
c01006c8:	e8 d3 08 00 00       	call   c0100fa0 <printk>
c01006cd:	b8 01 00 00 00       	mov    $0x1,%eax
c01006d2:	d6                   	(bad)  
c01006d3:	83 c4 20             	add    $0x20,%esp
c01006d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006d9:	c9                   	leave  
c01006da:	c3                   	ret    
c01006db:	90                   	nop
c01006dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006e0:	68 5a 80 10 c0       	push   $0xc010805a
c01006e5:	6a 29                	push   $0x29
c01006e7:	68 3e 7f 10 c0       	push   $0xc0107f3e
c01006ec:	68 90 7f 10 c0       	push   $0xc0107f90
c01006f1:	e8 aa 08 00 00       	call   c0100fa0 <printk>
c01006f6:	b8 01 00 00 00       	mov    $0x1,%eax
c01006fb:	d6                   	(bad)  
c01006fc:	83 c4 10             	add    $0x10,%esp
c01006ff:	e9 75 ff ff ff       	jmp    c0100679 <irq_handle+0x59>
c0100704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100708:	89 55 08             	mov    %edx,0x8(%ebp)
c010070b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010070e:	c9                   	leave  
c010070f:	e9 6c fd ff ff       	jmp    c0100480 <do_syscall>
c0100714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100718:	68 5a 80 10 c0       	push   $0xc010805a
c010071d:	6a 2d                	push   $0x2d
c010071f:	68 3e 7f 10 c0       	push   $0xc0107f3e
c0100724:	68 dc 7f 10 c0       	push   $0xc0107fdc
c0100729:	e8 72 08 00 00       	call   c0100fa0 <printk>
c010072e:	83 c4 10             	add    $0x10,%esp
c0100731:	e9 43 ff ff ff       	jmp    c0100679 <irq_handle+0x59>
c0100736:	66 90                	xchg   %ax,%ax
c0100738:	66 90                	xchg   %ax,%ax
c010073a:	66 90                	xchg   %ax,%ax
c010073c:	66 90                	xchg   %ax,%ax
c010073e:	66 90                	xchg   %ax,%ax

c0100740 <init_i8259>:
c0100740:	55                   	push   %ebp
c0100741:	ba 21 00 00 00       	mov    $0x21,%edx
c0100746:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010074b:	89 e5                	mov    %esp,%ebp
c010074d:	ee                   	out    %al,(%dx)
c010074e:	b2 a1                	mov    $0xa1,%dl
c0100750:	ee                   	out    %al,(%dx)
c0100751:	b8 11 00 00 00       	mov    $0x11,%eax
c0100756:	b2 20                	mov    $0x20,%dl
c0100758:	ee                   	out    %al,(%dx)
c0100759:	b8 20 00 00 00       	mov    $0x20,%eax
c010075e:	b2 21                	mov    $0x21,%dl
c0100760:	ee                   	out    %al,(%dx)
c0100761:	b8 04 00 00 00       	mov    $0x4,%eax
c0100766:	ee                   	out    %al,(%dx)
c0100767:	b8 03 00 00 00       	mov    $0x3,%eax
c010076c:	ee                   	out    %al,(%dx)
c010076d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100772:	b2 a0                	mov    $0xa0,%dl
c0100774:	ee                   	out    %al,(%dx)
c0100775:	b8 28 00 00 00       	mov    $0x28,%eax
c010077a:	b2 a1                	mov    $0xa1,%dl
c010077c:	ee                   	out    %al,(%dx)
c010077d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100782:	ee                   	out    %al,(%dx)
c0100783:	b8 03 00 00 00       	mov    $0x3,%eax
c0100788:	ee                   	out    %al,(%dx)
c0100789:	b8 68 00 00 00       	mov    $0x68,%eax
c010078e:	b2 20                	mov    $0x20,%dl
c0100790:	ee                   	out    %al,(%dx)
c0100791:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100796:	ee                   	out    %al,(%dx)
c0100797:	b8 68 00 00 00       	mov    $0x68,%eax
c010079c:	b2 a0                	mov    $0xa0,%dl
c010079e:	ee                   	out    %al,(%dx)
c010079f:	b8 0a 00 00 00       	mov    $0xa,%eax
c01007a4:	ee                   	out    %al,(%dx)
c01007a5:	5d                   	pop    %ebp
c01007a6:	c3                   	ret    
c01007a7:	66 90                	xchg   %ax,%ax
c01007a9:	66 90                	xchg   %ax,%ax
c01007ab:	66 90                	xchg   %ax,%ax
c01007ad:	66 90                	xchg   %ax,%ax
c01007af:	90                   	nop

c01007b0 <init_idt>:
c01007b0:	55                   	push   %ebp
c01007b1:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c01007b6:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c01007bb:	89 d1                	mov    %edx,%ecx
c01007bd:	c1 ea 10             	shr    $0x10,%edx
c01007c0:	89 e5                	mov    %esp,%ebp
c01007c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01007c8:	66 89 08             	mov    %cx,(%eax)
c01007cb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c01007d1:	83 c0 08             	add    $0x8,%eax
c01007d4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c01007d8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c01007dc:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c01007e0:	3d c0 c9 12 c0       	cmp    $0xc012c9c0,%eax
c01007e5:	75 e1                	jne    c01007c8 <init_idt+0x18>
c01007e7:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c01007ec:	ba 08 00 00 00       	mov    $0x8,%edx
c01007f1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007f6:	66 a3 c0 c1 12 c0    	mov    %ax,0xc012c1c0
c01007fc:	c1 e8 10             	shr    $0x10,%eax
c01007ff:	66 89 15 c2 c1 12 c0 	mov    %dx,0xc012c1c2
c0100806:	66 a3 c6 c1 12 c0    	mov    %ax,0xc012c1c6
c010080c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100811:	ba 08 00 00 00       	mov    $0x8,%edx
c0100816:	66 a3 c8 c1 12 c0    	mov    %ax,0xc012c1c8
c010081c:	c1 e8 10             	shr    $0x10,%eax
c010081f:	66 89 0d ca c1 12 c0 	mov    %cx,0xc012c1ca
c0100826:	66 a3 ce c1 12 c0    	mov    %ax,0xc012c1ce
c010082c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100831:	66 89 15 d2 c1 12 c0 	mov    %dx,0xc012c1d2
c0100838:	66 a3 d0 c1 12 c0    	mov    %ax,0xc012c1d0
c010083e:	c1 e8 10             	shr    $0x10,%eax
c0100841:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100846:	66 a3 d6 c1 12 c0    	mov    %ax,0xc012c1d6
c010084c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100851:	ba 08 00 00 00       	mov    $0x8,%edx
c0100856:	66 a3 d8 c1 12 c0    	mov    %ax,0xc012c1d8
c010085c:	c1 e8 10             	shr    $0x10,%eax
c010085f:	66 89 0d da c1 12 c0 	mov    %cx,0xc012c1da
c0100866:	66 a3 de c1 12 c0    	mov    %ax,0xc012c1de
c010086c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100871:	66 89 15 e2 c1 12 c0 	mov    %dx,0xc012c1e2
c0100878:	66 a3 e0 c1 12 c0    	mov    %ax,0xc012c1e0
c010087e:	c1 e8 10             	shr    $0x10,%eax
c0100881:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100886:	66 a3 e6 c1 12 c0    	mov    %ax,0xc012c1e6
c010088c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100891:	ba 08 00 00 00       	mov    $0x8,%edx
c0100896:	66 a3 e8 c1 12 c0    	mov    %ax,0xc012c1e8
c010089c:	c1 e8 10             	shr    $0x10,%eax
c010089f:	66 89 0d ea c1 12 c0 	mov    %cx,0xc012c1ea
c01008a6:	66 a3 ee c1 12 c0    	mov    %ax,0xc012c1ee
c01008ac:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c01008b1:	66 89 15 f2 c1 12 c0 	mov    %dx,0xc012c1f2
c01008b8:	66 a3 f0 c1 12 c0    	mov    %ax,0xc012c1f0
c01008be:	c1 e8 10             	shr    $0x10,%eax
c01008c1:	c6 05 c4 c1 12 c0 00 	movb   $0x0,0xc012c1c4
c01008c8:	c6 05 c5 c1 12 c0 8f 	movb   $0x8f,0xc012c1c5
c01008cf:	c6 05 cc c1 12 c0 00 	movb   $0x0,0xc012c1cc
c01008d6:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008db:	c6 05 cd c1 12 c0 8f 	movb   $0x8f,0xc012c1cd
c01008e2:	c6 05 d4 c1 12 c0 00 	movb   $0x0,0xc012c1d4
c01008e9:	ba 08 00 00 00       	mov    $0x8,%edx
c01008ee:	c6 05 d5 c1 12 c0 8f 	movb   $0x8f,0xc012c1d5
c01008f5:	c6 05 dc c1 12 c0 00 	movb   $0x0,0xc012c1dc
c01008fc:	c6 05 dd c1 12 c0 8f 	movb   $0x8f,0xc012c1dd
c0100903:	c6 05 e4 c1 12 c0 00 	movb   $0x0,0xc012c1e4
c010090a:	c6 05 e5 c1 12 c0 8f 	movb   $0x8f,0xc012c1e5
c0100911:	c6 05 ec c1 12 c0 00 	movb   $0x0,0xc012c1ec
c0100918:	c6 05 ed c1 12 c0 8f 	movb   $0x8f,0xc012c1ed
c010091f:	c6 05 f4 c1 12 c0 00 	movb   $0x0,0xc012c1f4
c0100926:	c6 05 f5 c1 12 c0 8f 	movb   $0x8f,0xc012c1f5
c010092d:	66 a3 f6 c1 12 c0    	mov    %ax,0xc012c1f6
c0100933:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100938:	66 a3 f8 c1 12 c0    	mov    %ax,0xc012c1f8
c010093e:	c1 e8 10             	shr    $0x10,%eax
c0100941:	66 89 0d fa c1 12 c0 	mov    %cx,0xc012c1fa
c0100948:	66 a3 fe c1 12 c0    	mov    %ax,0xc012c1fe
c010094e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0100953:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100958:	66 a3 00 c2 12 c0    	mov    %ax,0xc012c200
c010095e:	c1 e8 10             	shr    $0x10,%eax
c0100961:	66 89 15 02 c2 12 c0 	mov    %dx,0xc012c202
c0100968:	66 a3 06 c2 12 c0    	mov    %ax,0xc012c206
c010096e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100973:	66 89 0d 0a c2 12 c0 	mov    %cx,0xc012c20a
c010097a:	66 a3 08 c2 12 c0    	mov    %ax,0xc012c208
c0100980:	c1 e8 10             	shr    $0x10,%eax
c0100983:	ba 08 00 00 00       	mov    $0x8,%edx
c0100988:	66 a3 0e c2 12 c0    	mov    %ax,0xc012c20e
c010098e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100993:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100998:	66 a3 10 c2 12 c0    	mov    %ax,0xc012c210
c010099e:	c1 e8 10             	shr    $0x10,%eax
c01009a1:	66 89 15 12 c2 12 c0 	mov    %dx,0xc012c212
c01009a8:	66 a3 16 c2 12 c0    	mov    %ax,0xc012c216
c01009ae:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c01009b3:	66 89 0d 1a c2 12 c0 	mov    %cx,0xc012c21a
c01009ba:	66 a3 18 c2 12 c0    	mov    %ax,0xc012c218
c01009c0:	c1 e8 10             	shr    $0x10,%eax
c01009c3:	ba 08 00 00 00       	mov    $0x8,%edx
c01009c8:	66 a3 1e c2 12 c0    	mov    %ax,0xc012c21e
c01009ce:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c01009d3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009d8:	66 a3 20 c2 12 c0    	mov    %ax,0xc012c220
c01009de:	c1 e8 10             	shr    $0x10,%eax
c01009e1:	66 89 15 22 c2 12 c0 	mov    %dx,0xc012c222
c01009e8:	66 a3 26 c2 12 c0    	mov    %ax,0xc012c226
c01009ee:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c01009f3:	66 89 0d 2a c2 12 c0 	mov    %cx,0xc012c22a
c01009fa:	66 a3 28 c2 12 c0    	mov    %ax,0xc012c228
c0100a00:	c1 e8 10             	shr    $0x10,%eax
c0100a03:	c6 05 fc c1 12 c0 00 	movb   $0x0,0xc012c1fc
c0100a0a:	c6 05 fd c1 12 c0 8f 	movb   $0x8f,0xc012c1fd
c0100a11:	c6 05 04 c2 12 c0 00 	movb   $0x0,0xc012c204
c0100a18:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a1d:	c6 05 05 c2 12 c0 8f 	movb   $0x8f,0xc012c205
c0100a24:	c6 05 0c c2 12 c0 00 	movb   $0x0,0xc012c20c
c0100a2b:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a30:	c6 05 0d c2 12 c0 8f 	movb   $0x8f,0xc012c20d
c0100a37:	c6 05 14 c2 12 c0 00 	movb   $0x0,0xc012c214
c0100a3e:	c6 05 15 c2 12 c0 8f 	movb   $0x8f,0xc012c215
c0100a45:	c6 05 1c c2 12 c0 00 	movb   $0x0,0xc012c21c
c0100a4c:	c6 05 1d c2 12 c0 8f 	movb   $0x8f,0xc012c21d
c0100a53:	c6 05 24 c2 12 c0 00 	movb   $0x0,0xc012c224
c0100a5a:	c6 05 25 c2 12 c0 8f 	movb   $0x8f,0xc012c225
c0100a61:	c6 05 2c c2 12 c0 00 	movb   $0x0,0xc012c22c
c0100a68:	66 a3 2e c2 12 c0    	mov    %ax,0xc012c22e
c0100a6e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0100a73:	66 89 15 32 c2 12 c0 	mov    %dx,0xc012c232
c0100a7a:	66 a3 30 c2 12 c0    	mov    %ax,0xc012c230
c0100a80:	c1 e8 10             	shr    $0x10,%eax
c0100a83:	66 89 0d c2 c5 12 c0 	mov    %cx,0xc012c5c2
c0100a8a:	66 a3 36 c2 12 c0    	mov    %ax,0xc012c236
c0100a90:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100a95:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a9a:	66 a3 c0 c5 12 c0    	mov    %ax,0xc012c5c0
c0100aa0:	c1 e8 10             	shr    $0x10,%eax
c0100aa3:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100aa8:	66 a3 c6 c5 12 c0    	mov    %ax,0xc012c5c6
c0100aae:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100ab3:	c6 05 2d c2 12 c0 8f 	movb   $0x8f,0xc012c22d
c0100aba:	66 a3 c0 c2 12 c0    	mov    %ax,0xc012c2c0
c0100ac0:	c1 e8 10             	shr    $0x10,%eax
c0100ac3:	c6 05 34 c2 12 c0 00 	movb   $0x0,0xc012c234
c0100aca:	66 a3 c6 c2 12 c0    	mov    %ax,0xc012c2c6
c0100ad0:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100ad5:	c6 05 35 c2 12 c0 8f 	movb   $0x8f,0xc012c235
c0100adc:	66 a3 30 c3 12 c0    	mov    %ax,0xc012c330
c0100ae2:	c1 e8 10             	shr    $0x10,%eax
c0100ae5:	c6 05 c4 c5 12 c0 00 	movb   $0x0,0xc012c5c4
c0100aec:	66 a3 36 c3 12 c0    	mov    %ax,0xc012c336
c0100af2:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100af7:	c6 05 c5 c5 12 c0 ef 	movb   $0xef,0xc012c5c5
c0100afe:	66 a3 80 c1 12 c0    	mov    %ax,0xc012c180
c0100b04:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c0100b09:	66 89 15 c2 c2 12 c0 	mov    %dx,0xc012c2c2
c0100b10:	66 a3 82 c1 12 c0    	mov    %ax,0xc012c182
c0100b16:	c1 e8 10             	shr    $0x10,%eax
c0100b19:	c6 05 c4 c2 12 c0 00 	movb   $0x0,0xc012c2c4
c0100b20:	66 a3 84 c1 12 c0    	mov    %ax,0xc012c184
c0100b26:	c6 05 c5 c2 12 c0 8e 	movb   $0x8e,0xc012c2c5
c0100b2d:	b8 80 c1 12 c0       	mov    $0xc012c180,%eax
c0100b32:	66 89 0d 32 c3 12 c0 	mov    %cx,0xc012c332
c0100b39:	c6 05 34 c3 12 c0 00 	movb   $0x0,0xc012c334
c0100b40:	c6 05 35 c3 12 c0 8e 	movb   $0x8e,0xc012c335
c0100b47:	0f 01 18             	lidtl  (%eax)
c0100b4a:	5d                   	pop    %ebp
c0100b4b:	c3                   	ret    
c0100b4c:	66 90                	xchg   %ax,%ax
c0100b4e:	66 90                	xchg   %ax,%ax

c0100b50 <create_video_mapping>:
c0100b50:	55                   	push   %ebp
c0100b51:	89 e5                	mov    %esp,%ebp
c0100b53:	53                   	push   %ebx
c0100b54:	83 ec 04             	sub    $0x4,%esp
c0100b57:	e8 14 01 00 00       	call   c0100c70 <get_updir>
c0100b5c:	89 c3                	mov    %eax,%ebx
c0100b5e:	e8 0d 01 00 00       	call   c0100c70 <get_updir>
c0100b63:	39 c3                	cmp    %eax,%ebx
c0100b65:	74 27                	je     c0100b8e <create_video_mapping+0x3e>
c0100b67:	83 ec 0c             	sub    $0xc,%esp
c0100b6a:	68 74 80 10 c0       	push   $0xc0108074
c0100b6f:	68 d7 80 10 c0       	push   $0xc01080d7
c0100b74:	6a 19                	push   $0x19
c0100b76:	68 9a 80 10 c0       	push   $0xc010809a
c0100b7b:	68 94 7d 10 c0       	push   $0xc0107d94
c0100b80:	e8 1b 04 00 00       	call   c0100fa0 <printk>
c0100b85:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b8a:	d6                   	(bad)  
c0100b8b:	83 c4 20             	add    $0x20,%esp
c0100b8e:	ba 00 d0 12 00       	mov    $0x12d000,%edx
c0100b93:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100b98:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c0100b9d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100ba3:	83 ca 07             	or     $0x7,%edx
c0100ba6:	89 13                	mov    %edx,(%ebx)
c0100ba8:	90                   	nop
c0100ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100bb0:	89 ca                	mov    %ecx,%edx
c0100bb2:	83 c0 04             	add    $0x4,%eax
c0100bb5:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100bbb:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100bc1:	83 ca 07             	or     $0x7,%edx
c0100bc4:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100bc7:	3d c0 d2 12 c0       	cmp    $0xc012d2c0,%eax
c0100bcc:	75 e2                	jne    c0100bb0 <create_video_mapping+0x60>
c0100bce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bd1:	c9                   	leave  
c0100bd2:	c3                   	ret    
c0100bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100be0 <video_mapping_write_test>:
c0100be0:	55                   	push   %ebp
c0100be1:	31 c0                	xor    %eax,%eax
c0100be3:	89 e5                	mov    %esp,%ebp
c0100be5:	8d 76 00             	lea    0x0(%esi),%esi
c0100be8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100bef:	83 c0 01             	add    $0x1,%eax
c0100bf2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100bf7:	75 ef                	jne    c0100be8 <video_mapping_write_test+0x8>
c0100bf9:	5d                   	pop    %ebp
c0100bfa:	c3                   	ret    
c0100bfb:	90                   	nop
c0100bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100c00 <video_mapping_read_test>:
c0100c00:	55                   	push   %ebp
c0100c01:	89 e5                	mov    %esp,%ebp
c0100c03:	56                   	push   %esi
c0100c04:	be 01 00 00 00       	mov    $0x1,%esi
c0100c09:	53                   	push   %ebx
c0100c0a:	31 db                	xor    %ebx,%ebx
c0100c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100c10:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100c17:	74 24                	je     c0100c3d <video_mapping_read_test+0x3d>
c0100c19:	83 ec 0c             	sub    $0xc,%esp
c0100c1c:	68 b3 80 10 c0       	push   $0xc01080b3
c0100c21:	68 bf 80 10 c0       	push   $0xc01080bf
c0100c26:	6a 30                	push   $0x30
c0100c28:	68 9a 80 10 c0       	push   $0xc010809a
c0100c2d:	68 94 7d 10 c0       	push   $0xc0107d94
c0100c32:	e8 69 03 00 00       	call   c0100fa0 <printk>
c0100c37:	89 f0                	mov    %esi,%eax
c0100c39:	d6                   	(bad)  
c0100c3a:	83 c4 20             	add    $0x20,%esp
c0100c3d:	83 c3 01             	add    $0x1,%ebx
c0100c40:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100c46:	75 c8                	jne    c0100c10 <video_mapping_read_test+0x10>
c0100c48:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100c4b:	5b                   	pop    %ebx
c0100c4c:	5e                   	pop    %esi
c0100c4d:	5d                   	pop    %ebp
c0100c4e:	c3                   	ret    
c0100c4f:	90                   	nop

c0100c50 <video_mapping_clear>:
c0100c50:	55                   	push   %ebp
c0100c51:	89 e5                	mov    %esp,%ebp
c0100c53:	83 ec 0c             	sub    $0xc,%esp
c0100c56:	68 00 fa 00 00       	push   $0xfa00
c0100c5b:	6a 00                	push   $0x0
c0100c5d:	68 00 00 0a 00       	push   $0xa0000
c0100c62:	e8 81 08 00 00       	call   c01014e8 <memset>
c0100c67:	83 c4 10             	add    $0x10,%esp
c0100c6a:	c9                   	leave  
c0100c6b:	c3                   	ret    
c0100c6c:	66 90                	xchg   %ax,%ax
c0100c6e:	66 90                	xchg   %ax,%ax

c0100c70 <get_updir>:
c0100c70:	55                   	push   %ebp
c0100c71:	b8 00 f0 12 c0       	mov    $0xc012f000,%eax
c0100c76:	89 e5                	mov    %esp,%ebp
c0100c78:	5d                   	pop    %ebp
c0100c79:	c3                   	ret    
c0100c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c80 <get_ucr3>:
c0100c80:	55                   	push   %ebp
c0100c81:	a1 04 e0 12 c0       	mov    0xc012e004,%eax
c0100c86:	89 e5                	mov    %esp,%ebp
c0100c88:	5d                   	pop    %ebp
c0100c89:	c3                   	ret    
c0100c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c90 <mm_brk>:
c0100c90:	55                   	push   %ebp
c0100c91:	89 e5                	mov    %esp,%ebp
c0100c93:	53                   	push   %ebx
c0100c94:	83 ec 04             	sub    $0x4,%esp
c0100c97:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100c9a:	a1 00 e0 12 c0       	mov    0xc012e000,%eax
c0100c9f:	39 d8                	cmp    %ebx,%eax
c0100ca1:	73 11                	jae    c0100cb4 <mm_brk+0x24>
c0100ca3:	89 da                	mov    %ebx,%edx
c0100ca5:	83 ec 08             	sub    $0x8,%esp
c0100ca8:	29 c2                	sub    %eax,%edx
c0100caa:	52                   	push   %edx
c0100cab:	50                   	push   %eax
c0100cac:	e8 9f f3 ff ff       	call   c0100050 <mm_malloc>
c0100cb1:	83 c4 10             	add    $0x10,%esp
c0100cb4:	89 1d 00 e0 12 c0    	mov    %ebx,0xc012e000
c0100cba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100cbd:	c9                   	leave  
c0100cbe:	c3                   	ret    
c0100cbf:	90                   	nop

c0100cc0 <init_mm>:
c0100cc0:	55                   	push   %ebp
c0100cc1:	89 e5                	mov    %esp,%ebp
c0100cc3:	53                   	push   %ebx
c0100cc4:	83 ec 04             	sub    $0x4,%esp
c0100cc7:	e8 54 00 00 00       	call   c0100d20 <get_kpdir>
c0100ccc:	83 ec 04             	sub    $0x4,%esp
c0100ccf:	89 c3                	mov    %eax,%ebx
c0100cd1:	68 00 10 00 00       	push   $0x1000
c0100cd6:	6a 00                	push   $0x0
c0100cd8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100cde:	68 00 f0 12 c0       	push   $0xc012f000
c0100ce3:	e8 00 08 00 00       	call   c01014e8 <memset>
c0100ce8:	83 c4 0c             	add    $0xc,%esp
c0100ceb:	68 80 00 00 00       	push   $0x80
c0100cf0:	53                   	push   %ebx
c0100cf1:	68 00 fc 12 c0       	push   $0xc012fc00
c0100cf6:	e8 a5 07 00 00       	call   c01014a0 <memcpy>
c0100cfb:	b8 00 f0 12 00       	mov    $0x12f000,%eax
c0100d00:	83 c4 10             	add    $0x10,%esp
c0100d03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d0b:	a3 04 e0 12 c0       	mov    %eax,0xc012e004
c0100d10:	c9                   	leave  
c0100d11:	c3                   	ret    
c0100d12:	66 90                	xchg   %ax,%ax
c0100d14:	66 90                	xchg   %ax,%ax
c0100d16:	66 90                	xchg   %ax,%ax
c0100d18:	66 90                	xchg   %ax,%ax
c0100d1a:	66 90                	xchg   %ax,%ax
c0100d1c:	66 90                	xchg   %ax,%ax
c0100d1e:	66 90                	xchg   %ax,%ax

c0100d20 <get_kpdir>:
c0100d20:	55                   	push   %ebp
c0100d21:	b8 00 10 15 c0       	mov    $0xc0151000,%eax
c0100d26:	89 e5                	mov    %esp,%ebp
c0100d28:	5d                   	pop    %ebp
c0100d29:	c3                   	ret    
c0100d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100d30 <init_page>:
c0100d30:	55                   	push   %ebp
c0100d31:	89 e5                	mov    %esp,%ebp
c0100d33:	57                   	push   %edi
c0100d34:	83 ec 08             	sub    $0x8,%esp
c0100d37:	68 00 10 00 00       	push   $0x1000
c0100d3c:	6a 00                	push   $0x0
c0100d3e:	68 00 10 15 00       	push   $0x151000
c0100d43:	e8 a0 07 00 00       	call   c01014e8 <memset>
c0100d48:	b9 00 10 15 00       	mov    $0x151000,%ecx
c0100d4d:	83 c4 10             	add    $0x10,%esp
c0100d50:	ba 00 10 13 00       	mov    $0x131000,%edx
c0100d55:	8d 76 00             	lea    0x0(%esi),%esi
c0100d58:	89 d0                	mov    %edx,%eax
c0100d5a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100d60:	83 c1 04             	add    $0x4,%ecx
c0100d63:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d68:	83 c8 07             	or     $0x7,%eax
c0100d6b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100d6e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100d74:	81 fa 00 10 15 00    	cmp    $0x151000,%edx
c0100d7a:	75 dc                	jne    c0100d58 <init_page+0x28>
c0100d7c:	bf fc 0f 15 00       	mov    $0x150ffc,%edi
c0100d81:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100d86:	fd                   	std    
c0100d87:	ab                   	stos   %eax,%es:(%edi)
c0100d88:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100d8d:	7d f8                	jge    c0100d87 <init_page+0x57>
c0100d8f:	b8 00 10 15 00       	mov    $0x151000,%eax
c0100d94:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d99:	0f 22 d8             	mov    %eax,%cr3
c0100d9c:	0f 20 c0             	mov    %cr0,%eax
c0100d9f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100da4:	0f 22 c0             	mov    %eax,%cr0
c0100da7:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100daa:	c9                   	leave  
c0100dab:	c3                   	ret    
c0100dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100db0 <init_segment>:
c0100db0:	55                   	push   %ebp
c0100db1:	89 e5                	mov    %esp,%ebp
c0100db3:	83 ec 0c             	sub    $0xc,%esp
c0100db6:	6a 18                	push   $0x18
c0100db8:	6a 00                	push   $0x0
c0100dba:	68 08 00 13 c0       	push   $0xc0130008
c0100dbf:	e8 24 07 00 00       	call   c01014e8 <memset>
c0100dc4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100dc9:	31 c9                	xor    %ecx,%ecx
c0100dcb:	b8 08 00 13 c0       	mov    $0xc0130008,%eax
c0100dd0:	66 89 15 10 00 13 c0 	mov    %dx,0xc0130010
c0100dd7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100ddc:	66 89 0d 12 00 13 c0 	mov    %cx,0xc0130012
c0100de3:	66 89 15 18 00 13 c0 	mov    %dx,0xc0130018
c0100dea:	ba 17 00 00 00       	mov    $0x17,%edx
c0100def:	31 c9                	xor    %ecx,%ecx
c0100df1:	66 89 15 00 00 13 c0 	mov    %dx,0xc0130000
c0100df8:	66 a3 02 00 13 c0    	mov    %ax,0xc0130002
c0100dfe:	c1 e8 10             	shr    $0x10,%eax
c0100e01:	66 a3 04 00 13 c0    	mov    %ax,0xc0130004
c0100e07:	c6 05 14 00 13 c0 00 	movb   $0x0,0xc0130014
c0100e0e:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c0100e13:	c6 05 15 00 13 c0 9a 	movb   $0x9a,0xc0130015
c0100e1a:	c6 05 16 00 13 c0 cf 	movb   $0xcf,0xc0130016
c0100e21:	c6 05 17 00 13 c0 00 	movb   $0x0,0xc0130017
c0100e28:	66 89 0d 1a 00 13 c0 	mov    %cx,0xc013001a
c0100e2f:	c6 05 1c 00 13 c0 00 	movb   $0x0,0xc013001c
c0100e36:	c6 05 1d 00 13 c0 92 	movb   $0x92,0xc013001d
c0100e3d:	c6 05 1e 00 13 c0 cf 	movb   $0xcf,0xc013001e
c0100e44:	c6 05 1f 00 13 c0 00 	movb   $0x0,0xc013001f
c0100e4b:	0f 01 10             	lgdtl  (%eax)
c0100e4e:	83 c4 10             	add    $0x10,%esp
c0100e51:	c9                   	leave  
c0100e52:	c3                   	ret    
c0100e53:	66 90                	xchg   %ax,%ax
c0100e55:	66 90                	xchg   %ax,%ax
c0100e57:	66 90                	xchg   %ax,%ax
c0100e59:	66 90                	xchg   %ax,%ax
c0100e5b:	66 90                	xchg   %ax,%ax
c0100e5d:	66 90                	xchg   %ax,%ax
c0100e5f:	90                   	nop

c0100e60 <loader>:
c0100e60:	55                   	push   %ebp
c0100e61:	89 e5                	mov    %esp,%ebp
c0100e63:	57                   	push   %edi
c0100e64:	56                   	push   %esi
c0100e65:	53                   	push   %ebx
c0100e66:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100e6c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100e72:	68 00 10 00 00       	push   $0x1000
c0100e77:	6a 00                	push   $0x0
c0100e79:	53                   	push   %ebx
c0100e7a:	e8 81 02 00 00       	call   c0101100 <ide_read>
c0100e7f:	83 c4 10             	add    $0x10,%esp
c0100e82:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100e89:	45 4c 46 
c0100e8c:	74 06                	je     c0100e94 <loader+0x34>
c0100e8e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e93:	d6                   	(bad)  
c0100e94:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100e9a:	83 fa 34             	cmp    $0x34,%edx
c0100e9d:	74 06                	je     c0100ea5 <loader+0x45>
c0100e9f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ea4:	d6                   	(bad)  
c0100ea5:	31 f6                	xor    %esi,%esi
c0100ea7:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100eae:	00 
c0100eaf:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100eb3:	75 1c                	jne    c0100ed1 <loader+0x71>
c0100eb5:	eb 71                	jmp    c0100f28 <loader+0xc8>
c0100eb7:	89 f6                	mov    %esi,%esi
c0100eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100ec0:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100ec7:	83 c6 01             	add    $0x1,%esi
c0100eca:	83 c3 20             	add    $0x20,%ebx
c0100ecd:	39 f0                	cmp    %esi,%eax
c0100ecf:	7e 57                	jle    c0100f28 <loader+0xc8>
c0100ed1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100ed5:	75 e9                	jne    c0100ec0 <loader+0x60>
c0100ed7:	83 ec 08             	sub    $0x8,%esp
c0100eda:	ff 33                	pushl  (%ebx)
c0100edc:	ff 73 f4             	pushl  -0xc(%ebx)
c0100edf:	e8 6c f1 ff ff       	call   c0100050 <mm_malloc>
c0100ee4:	83 c4 0c             	add    $0xc,%esp
c0100ee7:	ff 73 fc             	pushl  -0x4(%ebx)
c0100eea:	ff 73 f0             	pushl  -0x10(%ebx)
c0100eed:	50                   	push   %eax
c0100eee:	89 c7                	mov    %eax,%edi
c0100ef0:	e8 0b 02 00 00       	call   c0101100 <ide_read>
c0100ef5:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0100ef8:	8b 0b                	mov    (%ebx),%ecx
c0100efa:	83 c4 0c             	add    $0xc,%esp
c0100efd:	29 d1                	sub    %edx,%ecx
c0100eff:	01 fa                	add    %edi,%edx
c0100f01:	51                   	push   %ecx
c0100f02:	6a 00                	push   $0x0
c0100f04:	52                   	push   %edx
c0100f05:	e8 de 05 00 00       	call   c01014e8 <memset>
c0100f0a:	8b 03                	mov    (%ebx),%eax
c0100f0c:	03 43 f4             	add    -0xc(%ebx),%eax
c0100f0f:	83 c4 10             	add    $0x10,%esp
c0100f12:	83 e8 01             	sub    $0x1,%eax
c0100f15:	3b 05 00 e0 12 c0    	cmp    0xc012e000,%eax
c0100f1b:	76 a3                	jbe    c0100ec0 <loader+0x60>
c0100f1d:	a3 00 e0 12 c0       	mov    %eax,0xc012e000
c0100f22:	eb 9c                	jmp    c0100ec0 <loader+0x60>
c0100f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f28:	83 ec 08             	sub    $0x8,%esp
c0100f2b:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100f31:	68 00 00 10 00       	push   $0x100000
c0100f36:	68 00 00 f0 bf       	push   $0xbff00000
c0100f3b:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100f41:	e8 0a f1 ff ff       	call   c0100050 <mm_malloc>
c0100f46:	e8 05 fc ff ff       	call   c0100b50 <create_video_mapping>
c0100f4b:	e8 30 fd ff ff       	call   c0100c80 <get_ucr3>
c0100f50:	0f 22 d8             	mov    %eax,%cr3
c0100f53:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100f59:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100f5c:	5b                   	pop    %ebx
c0100f5d:	5e                   	pop    %esi
c0100f5e:	5f                   	pop    %edi
c0100f5f:	5d                   	pop    %ebp
c0100f60:	c3                   	ret    
c0100f61:	66 90                	xchg   %ax,%ax
c0100f63:	66 90                	xchg   %ax,%ax
c0100f65:	66 90                	xchg   %ax,%ax
c0100f67:	66 90                	xchg   %ax,%ax
c0100f69:	66 90                	xchg   %ax,%ax
c0100f6b:	66 90                	xchg   %ax,%ax
c0100f6d:	66 90                	xchg   %ax,%ax
c0100f6f:	90                   	nop

c0100f70 <sbrk>:
c0100f70:	55                   	push   %ebp
c0100f71:	89 e5                	mov    %esp,%ebp
c0100f73:	83 ec 08             	sub    $0x8,%esp
c0100f76:	68 02 81 10 c0       	push   $0xc0108102
c0100f7b:	6a 08                	push   $0x8
c0100f7d:	68 ec 80 10 c0       	push   $0xc01080ec
c0100f82:	68 34 7e 10 c0       	push   $0xc0107e34
c0100f87:	e8 14 00 00 00       	call   c0100fa0 <printk>
c0100f8c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f91:	d6                   	(bad)  
c0100f92:	30 c0                	xor    %al,%al
c0100f94:	c9                   	leave  
c0100f95:	c3                   	ret    
c0100f96:	66 90                	xchg   %ax,%ax
c0100f98:	66 90                	xchg   %ax,%ax
c0100f9a:	66 90                	xchg   %ax,%ax
c0100f9c:	66 90                	xchg   %ax,%ax
c0100f9e:	66 90                	xchg   %ax,%ax

c0100fa0 <printk>:
c0100fa0:	55                   	push   %ebp
c0100fa1:	89 e5                	mov    %esp,%ebp
c0100fa3:	56                   	push   %esi
c0100fa4:	53                   	push   %ebx
c0100fa5:	8d 45 0c             	lea    0xc(%ebp),%eax
c0100fa8:	50                   	push   %eax
c0100fa9:	ff 75 08             	pushl  0x8(%ebp)
c0100fac:	68 00 01 00 00       	push   $0x100
c0100fb1:	68 00 20 15 c0       	push   $0xc0152000
c0100fb6:	e8 45 06 00 00       	call   c0101600 <vsnprintf>
c0100fbb:	83 c4 10             	add    $0x10,%esp
c0100fbe:	85 c0                	test   %eax,%eax
c0100fc0:	89 c6                	mov    %eax,%esi
c0100fc2:	7e 26                	jle    c0100fea <printk+0x4a>
c0100fc4:	31 db                	xor    %ebx,%ebx
c0100fc6:	8d 76 00             	lea    0x0(%esi),%esi
c0100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100fd0:	0f be 93 00 20 15 c0 	movsbl -0x3feae000(%ebx),%edx
c0100fd7:	83 ec 0c             	sub    $0xc,%esp
c0100fda:	83 c3 01             	add    $0x1,%ebx
c0100fdd:	52                   	push   %edx
c0100fde:	e8 5d 00 00 00       	call   c0101040 <serial_printc>
c0100fe3:	83 c4 10             	add    $0x10,%esp
c0100fe6:	39 f3                	cmp    %esi,%ebx
c0100fe8:	75 e6                	jne    c0100fd0 <printk+0x30>
c0100fea:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100fed:	5b                   	pop    %ebx
c0100fee:	5e                   	pop    %esi
c0100fef:	5d                   	pop    %ebp
c0100ff0:	c3                   	ret    
c0100ff1:	66 90                	xchg   %ax,%ax
c0100ff3:	66 90                	xchg   %ax,%ax
c0100ff5:	66 90                	xchg   %ax,%ax
c0100ff7:	66 90                	xchg   %ax,%ax
c0100ff9:	66 90                	xchg   %ax,%ax
c0100ffb:	66 90                	xchg   %ax,%ax
c0100ffd:	66 90                	xchg   %ax,%ax
c0100fff:	90                   	nop

c0101000 <init_serial>:
c0101000:	55                   	push   %ebp
c0101001:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0101006:	31 c0                	xor    %eax,%eax
c0101008:	89 e5                	mov    %esp,%ebp
c010100a:	ee                   	out    %al,(%dx)
c010100b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0101010:	b2 fb                	mov    $0xfb,%dl
c0101012:	ee                   	out    %al,(%dx)
c0101013:	b8 01 00 00 00       	mov    $0x1,%eax
c0101018:	b2 f8                	mov    $0xf8,%dl
c010101a:	ee                   	out    %al,(%dx)
c010101b:	31 c0                	xor    %eax,%eax
c010101d:	b2 f9                	mov    $0xf9,%dl
c010101f:	ee                   	out    %al,(%dx)
c0101020:	b8 03 00 00 00       	mov    $0x3,%eax
c0101025:	b2 fb                	mov    $0xfb,%dl
c0101027:	ee                   	out    %al,(%dx)
c0101028:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c010102d:	b2 fa                	mov    $0xfa,%dl
c010102f:	ee                   	out    %al,(%dx)
c0101030:	b8 0b 00 00 00       	mov    $0xb,%eax
c0101035:	b2 fc                	mov    $0xfc,%dl
c0101037:	ee                   	out    %al,(%dx)
c0101038:	5d                   	pop    %ebp
c0101039:	c3                   	ret    
c010103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101040 <serial_printc>:
c0101040:	55                   	push   %ebp
c0101041:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0101046:	89 e5                	mov    %esp,%ebp
c0101048:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010104b:	90                   	nop
c010104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101050:	ec                   	in     (%dx),%al
c0101051:	a8 20                	test   $0x20,%al
c0101053:	74 fb                	je     c0101050 <serial_printc+0x10>
c0101055:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010105a:	89 c8                	mov    %ecx,%eax
c010105c:	ee                   	out    %al,(%dx)
c010105d:	5d                   	pop    %ebp
c010105e:	c3                   	ret    
c010105f:	90                   	nop

c0101060 <ramdisk_read>:
c0101060:	55                   	push   %ebp
c0101061:	89 e5                	mov    %esp,%ebp
c0101063:	53                   	push   %ebx
c0101064:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101067:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010106a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010106d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101070:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101075:	76 06                	jbe    c010107d <ramdisk_read+0x1d>
c0101077:	b8 01 00 00 00       	mov    $0x1,%eax
c010107c:	d6                   	(bad)  
c010107d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0101080:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101083:	89 55 0c             	mov    %edx,0xc(%ebp)
c0101086:	5b                   	pop    %ebx
c0101087:	5d                   	pop    %ebp
c0101088:	e9 13 04 00 00       	jmp    c01014a0 <memcpy>
c010108d:	8d 76 00             	lea    0x0(%esi),%esi

c0101090 <ramdisk_write>:
c0101090:	55                   	push   %ebp
c0101091:	89 e5                	mov    %esp,%ebp
c0101093:	53                   	push   %ebx
c0101094:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101097:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010109a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010109d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c01010a0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c01010a5:	76 06                	jbe    c01010ad <ramdisk_write+0x1d>
c01010a7:	b8 01 00 00 00       	mov    $0x1,%eax
c01010ac:	d6                   	(bad)  
c01010ad:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01010b0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01010b3:	89 55 08             	mov    %edx,0x8(%ebp)
c01010b6:	5b                   	pop    %ebx
c01010b7:	5d                   	pop    %ebp
c01010b8:	e9 e3 03 00 00       	jmp    c01014a0 <memcpy>
c01010bd:	66 90                	xchg   %ax,%ax
c01010bf:	90                   	nop

c01010c0 <ide_intr>:
c01010c0:	55                   	push   %ebp
c01010c1:	c7 05 04 21 15 c0 01 	movl   $0x1,0xc0152104
c01010c8:	00 00 00 
c01010cb:	89 e5                	mov    %esp,%ebp
c01010cd:	5d                   	pop    %ebp
c01010ce:	c3                   	ret    
c01010cf:	90                   	nop

c01010d0 <ide_writeback>:
c01010d0:	a1 00 21 15 c0       	mov    0xc0152100,%eax
c01010d5:	83 c0 01             	add    $0x1,%eax
c01010d8:	83 f8 64             	cmp    $0x64,%eax
c01010db:	a3 00 21 15 c0       	mov    %eax,0xc0152100
c01010e0:	74 06                	je     c01010e8 <ide_writeback+0x18>
c01010e2:	c3                   	ret    
c01010e3:	90                   	nop
c01010e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010e8:	55                   	push   %ebp
c01010e9:	89 e5                	mov    %esp,%ebp
c01010eb:	83 ec 08             	sub    $0x8,%esp
c01010ee:	e8 dd 01 00 00       	call   c01012d0 <buf_writeback>
c01010f3:	c7 05 00 21 15 c0 00 	movl   $0x0,0xc0152100
c01010fa:	00 00 00 
c01010fd:	c9                   	leave  
c01010fe:	c3                   	ret    
c01010ff:	90                   	nop

c0101100 <ide_read>:
c0101100:	55                   	push   %ebp
c0101101:	89 e5                	mov    %esp,%ebp
c0101103:	57                   	push   %edi
c0101104:	56                   	push   %esi
c0101105:	53                   	push   %ebx
c0101106:	83 ec 0c             	sub    $0xc,%esp
c0101109:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010110c:	8b 45 10             	mov    0x10(%ebp),%eax
c010110f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101112:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101115:	29 df                	sub    %ebx,%edi
c0101117:	85 c0                	test   %eax,%eax
c0101119:	74 1b                	je     c0101136 <ide_read+0x36>
c010111b:	90                   	nop
c010111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101120:	83 ec 0c             	sub    $0xc,%esp
c0101123:	53                   	push   %ebx
c0101124:	e8 07 02 00 00       	call   c0101330 <read_byte>
c0101129:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010112c:	83 c3 01             	add    $0x1,%ebx
c010112f:	83 c4 10             	add    $0x10,%esp
c0101132:	39 f3                	cmp    %esi,%ebx
c0101134:	75 ea                	jne    c0101120 <ide_read+0x20>
c0101136:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101139:	5b                   	pop    %ebx
c010113a:	5e                   	pop    %esi
c010113b:	5f                   	pop    %edi
c010113c:	5d                   	pop    %ebp
c010113d:	c3                   	ret    
c010113e:	66 90                	xchg   %ax,%ax

c0101140 <ide_write>:
c0101140:	55                   	push   %ebp
c0101141:	89 e5                	mov    %esp,%ebp
c0101143:	57                   	push   %edi
c0101144:	56                   	push   %esi
c0101145:	53                   	push   %ebx
c0101146:	83 ec 0c             	sub    $0xc,%esp
c0101149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010114c:	8b 45 10             	mov    0x10(%ebp),%eax
c010114f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101152:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101155:	29 df                	sub    %ebx,%edi
c0101157:	85 c0                	test   %eax,%eax
c0101159:	74 1d                	je     c0101178 <ide_write+0x38>
c010115b:	90                   	nop
c010115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101160:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101164:	83 ec 08             	sub    $0x8,%esp
c0101167:	50                   	push   %eax
c0101168:	53                   	push   %ebx
c0101169:	83 c3 01             	add    $0x1,%ebx
c010116c:	e8 ef 01 00 00       	call   c0101360 <write_byte>
c0101171:	83 c4 10             	add    $0x10,%esp
c0101174:	39 f3                	cmp    %esi,%ebx
c0101176:	75 e8                	jne    c0101160 <ide_write+0x20>
c0101178:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010117b:	5b                   	pop    %ebx
c010117c:	5e                   	pop    %esi
c010117d:	5f                   	pop    %edi
c010117e:	5d                   	pop    %ebp
c010117f:	c3                   	ret    

c0101180 <clear_ide_intr>:
c0101180:	55                   	push   %ebp
c0101181:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101188:	00 00 00 
c010118b:	89 e5                	mov    %esp,%ebp
c010118d:	5d                   	pop    %ebp
c010118e:	c3                   	ret    
c010118f:	90                   	nop

c0101190 <wait_ide_intr>:
c0101190:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101195:	55                   	push   %ebp
c0101196:	89 e5                	mov    %esp,%ebp
c0101198:	85 c0                	test   %eax,%eax
c010119a:	75 0e                	jne    c01011aa <wait_ide_intr+0x1a>
c010119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01011a0:	f4                   	hlt    
c01011a1:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c01011a6:	85 c0                	test   %eax,%eax
c01011a8:	74 f6                	je     c01011a0 <wait_ide_intr+0x10>
c01011aa:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c01011b1:	00 00 00 
c01011b4:	5d                   	pop    %ebp
c01011b5:	c3                   	ret    
c01011b6:	8d 76 00             	lea    0x0(%esi),%esi
c01011b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01011c0 <init_ide>:
c01011c0:	55                   	push   %ebp
c01011c1:	89 e5                	mov    %esp,%ebp
c01011c3:	83 ec 08             	sub    $0x8,%esp
c01011c6:	e8 d5 00 00 00       	call   c01012a0 <buf_init>
c01011cb:	83 ec 08             	sub    $0x8,%esp
c01011ce:	68 d0 10 10 c0       	push   $0xc01010d0
c01011d3:	6a 00                	push   $0x0
c01011d5:	e8 96 f3 ff ff       	call   c0100570 <add_irq_handle>
c01011da:	58                   	pop    %eax
c01011db:	5a                   	pop    %edx
c01011dc:	68 c0 10 10 c0       	push   $0xc01010c0
c01011e1:	6a 0e                	push   $0xe
c01011e3:	e8 88 f3 ff ff       	call   c0100570 <add_irq_handle>
c01011e8:	83 c4 10             	add    $0x10,%esp
c01011eb:	c9                   	leave  
c01011ec:	c3                   	ret    
c01011ed:	66 90                	xchg   %ax,%ax
c01011ef:	90                   	nop

c01011f0 <buf_fetch>:
c01011f0:	55                   	push   %ebp
c01011f1:	89 c2                	mov    %eax,%edx
c01011f3:	89 e5                	mov    %esp,%ebp
c01011f5:	57                   	push   %edi
c01011f6:	56                   	push   %esi
c01011f7:	53                   	push   %ebx
c01011f8:	89 c3                	mov    %eax,%ebx
c01011fa:	83 e3 7f             	and    $0x7f,%ebx
c01011fd:	89 d8                	mov    %ebx,%eax
c01011ff:	83 ec 1c             	sub    $0x1c,%esp
c0101202:	c1 e0 09             	shl    $0x9,%eax
c0101205:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101208:	8d 81 40 21 15 c0    	lea    -0x3feadec0(%ecx),%eax
c010120e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101212:	74 5c                	je     c0101270 <buf_fetch+0x80>
c0101214:	89 d7                	mov    %edx,%edi
c0101216:	89 da                	mov    %ebx,%edx
c0101218:	c1 e2 09             	shl    $0x9,%edx
c010121b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010121e:	8d 91 40 21 15 c0    	lea    -0x3feadec0(%ecx),%edx
c0101224:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010122a:	74 54                	je     c0101280 <buf_fetch+0x90>
c010122c:	8d 72 06             	lea    0x6(%edx),%esi
c010122f:	83 ec 08             	sub    $0x8,%esp
c0101232:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101235:	57                   	push   %edi
c0101236:	56                   	push   %esi
c0101237:	e8 a4 01 00 00       	call   c01013e0 <disk_do_read>
c010123c:	89 da                	mov    %ebx,%edx
c010123e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101241:	83 c4 10             	add    $0x10,%esp
c0101244:	c1 e2 09             	shl    $0x9,%edx
c0101247:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010124a:	c6 81 44 21 15 c0 01 	movb   $0x1,-0x3feadebc(%ecx)
c0101251:	89 b9 40 21 15 c0    	mov    %edi,-0x3feadec0(%ecx)
c0101257:	c6 81 45 21 15 c0 00 	movb   $0x0,-0x3feadebb(%ecx)
c010125e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101261:	5b                   	pop    %ebx
c0101262:	5e                   	pop    %esi
c0101263:	5f                   	pop    %edi
c0101264:	5d                   	pop    %ebp
c0101265:	c3                   	ret    
c0101266:	8d 76 00             	lea    0x0(%esi),%esi
c0101269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101270:	39 91 40 21 15 c0    	cmp    %edx,-0x3feadec0(%ecx)
c0101276:	75 9c                	jne    c0101214 <buf_fetch+0x24>
c0101278:	eb e4                	jmp    c010125e <buf_fetch+0x6e>
c010127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101280:	8d 72 06             	lea    0x6(%edx),%esi
c0101283:	83 ec 08             	sub    $0x8,%esp
c0101286:	ff b1 40 21 15 c0    	pushl  -0x3feadec0(%ecx)
c010128c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010128f:	56                   	push   %esi
c0101290:	e8 8b 01 00 00       	call   c0101420 <disk_do_write>
c0101295:	83 c4 10             	add    $0x10,%esp
c0101298:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010129b:	eb 92                	jmp    c010122f <buf_fetch+0x3f>
c010129d:	8d 76 00             	lea    0x0(%esi),%esi

c01012a0 <buf_init>:
c01012a0:	55                   	push   %ebp
c01012a1:	b8 44 21 15 c0       	mov    $0xc0152144,%eax
c01012a6:	89 e5                	mov    %esp,%ebp
c01012a8:	90                   	nop
c01012a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01012b0:	c6 00 00             	movb   $0x0,(%eax)
c01012b3:	05 08 02 00 00       	add    $0x208,%eax
c01012b8:	3d 44 25 16 c0       	cmp    $0xc0162544,%eax
c01012bd:	75 f1                	jne    c01012b0 <buf_init+0x10>
c01012bf:	5d                   	pop    %ebp
c01012c0:	c3                   	ret    
c01012c1:	eb 0d                	jmp    c01012d0 <buf_writeback>
c01012c3:	90                   	nop
c01012c4:	90                   	nop
c01012c5:	90                   	nop
c01012c6:	90                   	nop
c01012c7:	90                   	nop
c01012c8:	90                   	nop
c01012c9:	90                   	nop
c01012ca:	90                   	nop
c01012cb:	90                   	nop
c01012cc:	90                   	nop
c01012cd:	90                   	nop
c01012ce:	90                   	nop
c01012cf:	90                   	nop

c01012d0 <buf_writeback>:
c01012d0:	55                   	push   %ebp
c01012d1:	89 e5                	mov    %esp,%ebp
c01012d3:	53                   	push   %ebx
c01012d4:	bb 46 21 15 c0       	mov    $0xc0152146,%ebx
c01012d9:	83 ec 04             	sub    $0x4,%esp
c01012dc:	eb 10                	jmp    c01012ee <buf_writeback+0x1e>
c01012de:	66 90                	xchg   %ax,%ax
c01012e0:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01012e6:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c01012ec:	74 32                	je     c0101320 <buf_writeback+0x50>
c01012ee:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01012f2:	75 ec                	jne    c01012e0 <buf_writeback+0x10>
c01012f4:	83 ec 08             	sub    $0x8,%esp
c01012f7:	ff 73 fa             	pushl  -0x6(%ebx)
c01012fa:	53                   	push   %ebx
c01012fb:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101301:	e8 1a 01 00 00       	call   c0101420 <disk_do_write>
c0101306:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010130d:	83 c4 10             	add    $0x10,%esp
c0101310:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c0101316:	75 d6                	jne    c01012ee <buf_writeback+0x1e>
c0101318:	90                   	nop
c0101319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101320:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101323:	c9                   	leave  
c0101324:	c3                   	ret    
c0101325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101330 <read_byte>:
c0101330:	55                   	push   %ebp
c0101331:	89 e5                	mov    %esp,%ebp
c0101333:	53                   	push   %ebx
c0101334:	83 ec 04             	sub    $0x4,%esp
c0101337:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010133a:	89 d8                	mov    %ebx,%eax
c010133c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101342:	c1 e8 09             	shr    $0x9,%eax
c0101345:	e8 a6 fe ff ff       	call   c01011f0 <buf_fetch>
c010134a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010134f:	83 c4 04             	add    $0x4,%esp
c0101352:	5b                   	pop    %ebx
c0101353:	5d                   	pop    %ebp
c0101354:	c3                   	ret    
c0101355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101360 <write_byte>:
c0101360:	55                   	push   %ebp
c0101361:	89 e5                	mov    %esp,%ebp
c0101363:	56                   	push   %esi
c0101364:	53                   	push   %ebx
c0101365:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101368:	8b 75 0c             	mov    0xc(%ebp),%esi
c010136b:	89 d8                	mov    %ebx,%eax
c010136d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101373:	c1 e8 09             	shr    $0x9,%eax
c0101376:	e8 75 fe ff ff       	call   c01011f0 <buf_fetch>
c010137b:	89 f2                	mov    %esi,%edx
c010137d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101381:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101385:	5b                   	pop    %ebx
c0101386:	5e                   	pop    %esi
c0101387:	5d                   	pop    %ebp
c0101388:	c3                   	ret    
c0101389:	66 90                	xchg   %ax,%ax
c010138b:	66 90                	xchg   %ax,%ax
c010138d:	66 90                	xchg   %ax,%ax
c010138f:	90                   	nop

c0101390 <ide_prepare>:
c0101390:	55                   	push   %ebp
c0101391:	89 c1                	mov    %eax,%ecx
c0101393:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101398:	89 e5                	mov    %esp,%ebp
c010139a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01013a0:	ec                   	in     (%dx),%al
c01013a1:	83 e0 c0             	and    $0xffffffc0,%eax
c01013a4:	3c 40                	cmp    $0x40,%al
c01013a6:	75 f8                	jne    c01013a0 <ide_prepare+0x10>
c01013a8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01013ad:	31 c0                	xor    %eax,%eax
c01013af:	ee                   	out    %al,(%dx)
c01013b0:	b8 01 00 00 00       	mov    $0x1,%eax
c01013b5:	b2 f2                	mov    $0xf2,%dl
c01013b7:	ee                   	out    %al,(%dx)
c01013b8:	b2 f3                	mov    $0xf3,%dl
c01013ba:	89 c8                	mov    %ecx,%eax
c01013bc:	ee                   	out    %al,(%dx)
c01013bd:	89 c8                	mov    %ecx,%eax
c01013bf:	b2 f4                	mov    $0xf4,%dl
c01013c1:	c1 e8 08             	shr    $0x8,%eax
c01013c4:	ee                   	out    %al,(%dx)
c01013c5:	89 c8                	mov    %ecx,%eax
c01013c7:	b2 f5                	mov    $0xf5,%dl
c01013c9:	c1 e8 10             	shr    $0x10,%eax
c01013cc:	ee                   	out    %al,(%dx)
c01013cd:	89 c8                	mov    %ecx,%eax
c01013cf:	b2 f6                	mov    $0xf6,%dl
c01013d1:	c1 e8 18             	shr    $0x18,%eax
c01013d4:	83 c8 e0             	or     $0xffffffe0,%eax
c01013d7:	ee                   	out    %al,(%dx)
c01013d8:	5d                   	pop    %ebp
c01013d9:	c3                   	ret    
c01013da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01013e0 <disk_do_read>:
c01013e0:	55                   	push   %ebp
c01013e1:	89 e5                	mov    %esp,%ebp
c01013e3:	53                   	push   %ebx
c01013e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013e7:	e8 a4 ff ff ff       	call   c0101390 <ide_prepare>
c01013ec:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01013f1:	b8 20 00 00 00       	mov    $0x20,%eax
c01013f6:	ee                   	out    %al,(%dx)
c01013f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01013fa:	b2 f0                	mov    $0xf0,%dl
c01013fc:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101408:	ed                   	in     (%dx),%eax
c0101409:	89 01                	mov    %eax,(%ecx)
c010140b:	83 c1 04             	add    $0x4,%ecx
c010140e:	39 d9                	cmp    %ebx,%ecx
c0101410:	75 f6                	jne    c0101408 <disk_do_read+0x28>
c0101412:	5b                   	pop    %ebx
c0101413:	5d                   	pop    %ebp
c0101414:	c3                   	ret    
c0101415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101420 <disk_do_write>:
c0101420:	55                   	push   %ebp
c0101421:	89 e5                	mov    %esp,%ebp
c0101423:	53                   	push   %ebx
c0101424:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101427:	e8 64 ff ff ff       	call   c0101390 <ide_prepare>
c010142c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101431:	b8 30 00 00 00       	mov    $0x30,%eax
c0101436:	ee                   	out    %al,(%dx)
c0101437:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010143a:	b2 f0                	mov    $0xf0,%dl
c010143c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101448:	8b 01                	mov    (%ecx),%eax
c010144a:	ef                   	out    %eax,(%dx)
c010144b:	83 c1 04             	add    $0x4,%ecx
c010144e:	39 d9                	cmp    %ebx,%ecx
c0101450:	75 f6                	jne    c0101448 <disk_do_write+0x28>
c0101452:	5b                   	pop    %ebx
c0101453:	5d                   	pop    %ebp
c0101454:	c3                   	ret    
c0101455:	66 90                	xchg   %ax,%ax
c0101457:	66 90                	xchg   %ax,%ax
c0101459:	66 90                	xchg   %ax,%ax
c010145b:	66 90                	xchg   %ax,%ax
c010145d:	66 90                	xchg   %ax,%ax
c010145f:	90                   	nop

c0101460 <dma_prepare>:
c0101460:	55                   	push   %ebp
c0101461:	89 e5                	mov    %esp,%ebp
c0101463:	83 ec 08             	sub    $0x8,%esp
c0101466:	68 70 81 10 c0       	push   $0xc0108170
c010146b:	6a 1d                	push   $0x1d
c010146d:	68 07 81 10 c0       	push   $0xc0108107
c0101472:	68 24 81 10 c0       	push   $0xc0108124
c0101477:	e8 24 fb ff ff       	call   c0100fa0 <printk>
c010147c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101481:	d6                   	(bad)  
c0101482:	83 c4 10             	add    $0x10,%esp
c0101485:	c9                   	leave  
c0101486:	c3                   	ret    
c0101487:	89 f6                	mov    %esi,%esi
c0101489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101490 <dma_issue_read>:
c0101490:	55                   	push   %ebp
c0101491:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101496:	89 e5                	mov    %esp,%ebp
c0101498:	ec                   	in     (%dx),%al
c0101499:	83 c8 09             	or     $0x9,%eax
c010149c:	ee                   	out    %al,(%dx)
c010149d:	5d                   	pop    %ebp
c010149e:	c3                   	ret    
c010149f:	90                   	nop

c01014a0 <memcpy>:
c01014a0:	55                   	push   %ebp
c01014a1:	89 e5                	mov    %esp,%ebp
c01014a3:	56                   	push   %esi
c01014a4:	57                   	push   %edi
c01014a5:	53                   	push   %ebx
c01014a6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01014a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01014ac:	8b 75 0c             	mov    0xc(%ebp),%esi
c01014af:	fc                   	cld    
c01014b0:	83 f9 08             	cmp    $0x8,%ecx
c01014b3:	76 26                	jbe    c01014db <memcpy+0x3b>
c01014b5:	89 fa                	mov    %edi,%edx
c01014b7:	89 cb                	mov    %ecx,%ebx
c01014b9:	83 e2 03             	and    $0x3,%edx
c01014bc:	74 10                	je     c01014ce <memcpy+0x2e>
c01014be:	b9 04 00 00 00       	mov    $0x4,%ecx
c01014c3:	29 d1                	sub    %edx,%ecx
c01014c5:	83 e1 03             	and    $0x3,%ecx
c01014c8:	29 cb                	sub    %ecx,%ebx
c01014ca:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01014cc:	89 d9                	mov    %ebx,%ecx
c01014ce:	c1 e9 02             	shr    $0x2,%ecx
c01014d1:	8d 76 00             	lea    0x0(%esi),%esi
c01014d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01014d6:	89 d9                	mov    %ebx,%ecx
c01014d8:	83 e1 03             	and    $0x3,%ecx
c01014db:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01014dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01014e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01014e3:	5b                   	pop    %ebx
c01014e4:	5f                   	pop    %edi
c01014e5:	5e                   	pop    %esi
c01014e6:	c9                   	leave  
c01014e7:	c3                   	ret    

c01014e8 <memset>:
c01014e8:	55                   	push   %ebp
c01014e9:	89 e5                	mov    %esp,%ebp
c01014eb:	57                   	push   %edi
c01014ec:	8b 7d 08             	mov    0x8(%ebp),%edi
c01014ef:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01014f3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01014f6:	fc                   	cld    
c01014f7:	83 f9 10             	cmp    $0x10,%ecx
c01014fa:	76 69                	jbe    c0101565 <memset+0x7d>
c01014fc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101502:	74 4c                	je     c0101550 <memset+0x68>
c0101504:	88 07                	mov    %al,(%edi)
c0101506:	47                   	inc    %edi
c0101507:	49                   	dec    %ecx
c0101508:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010150e:	74 40                	je     c0101550 <memset+0x68>
c0101510:	88 07                	mov    %al,(%edi)
c0101512:	47                   	inc    %edi
c0101513:	49                   	dec    %ecx
c0101514:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010151a:	74 34                	je     c0101550 <memset+0x68>
c010151c:	88 07                	mov    %al,(%edi)
c010151e:	47                   	inc    %edi
c010151f:	49                   	dec    %ecx
c0101520:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101526:	74 28                	je     c0101550 <memset+0x68>
c0101528:	88 07                	mov    %al,(%edi)
c010152a:	47                   	inc    %edi
c010152b:	49                   	dec    %ecx
c010152c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101532:	74 1c                	je     c0101550 <memset+0x68>
c0101534:	88 07                	mov    %al,(%edi)
c0101536:	47                   	inc    %edi
c0101537:	49                   	dec    %ecx
c0101538:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010153e:	74 10                	je     c0101550 <memset+0x68>
c0101540:	88 07                	mov    %al,(%edi)
c0101542:	47                   	inc    %edi
c0101543:	49                   	dec    %ecx
c0101544:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010154a:	74 04                	je     c0101550 <memset+0x68>
c010154c:	88 07                	mov    %al,(%edi)
c010154e:	47                   	inc    %edi
c010154f:	49                   	dec    %ecx
c0101550:	88 c4                	mov    %al,%ah
c0101552:	89 c2                	mov    %eax,%edx
c0101554:	c1 e2 10             	shl    $0x10,%edx
c0101557:	09 d0                	or     %edx,%eax
c0101559:	89 ca                	mov    %ecx,%edx
c010155b:	c1 e9 02             	shr    $0x2,%ecx
c010155e:	83 e2 03             	and    $0x3,%edx
c0101561:	f3 ab                	rep stos %eax,%es:(%edi)
c0101563:	89 d1                	mov    %edx,%ecx
c0101565:	f3 aa                	rep stos %al,%es:(%edi)
c0101567:	8b 45 08             	mov    0x8(%ebp),%eax
c010156a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010156d:	5f                   	pop    %edi
c010156e:	c9                   	leave  
c010156f:	c3                   	ret    

c0101570 <_vsnprintf_r>:
c0101570:	55                   	push   %ebp
c0101571:	89 e5                	mov    %esp,%ebp
c0101573:	56                   	push   %esi
c0101574:	53                   	push   %ebx
c0101575:	83 c4 80             	add    $0xffffff80,%esp
c0101578:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010157b:	8b 75 08             	mov    0x8(%ebp),%esi
c010157e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101581:	85 db                	test   %ebx,%ebx
c0101583:	78 63                	js     c01015e8 <_vsnprintf_r+0x78>
c0101585:	ba 08 02 00 00       	mov    $0x208,%edx
c010158a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c010158f:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c0101593:	8d 53 ff             	lea    -0x1(%ebx),%edx
c0101596:	89 45 90             	mov    %eax,-0x70(%ebp)
c0101599:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010159c:	31 c0                	xor    %eax,%eax
c010159e:	85 db                	test   %ebx,%ebx
c01015a0:	0f 45 c2             	cmovne %edx,%eax
c01015a3:	89 45 98             	mov    %eax,-0x68(%ebp)
c01015a6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01015a9:	8b 45 18             	mov    0x18(%ebp),%eax
c01015ac:	89 34 24             	mov    %esi,(%esp)
c01015af:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c01015b3:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01015b7:	8b 45 14             	mov    0x14(%ebp),%eax
c01015ba:	89 44 24 08          	mov    %eax,0x8(%esp)
c01015be:	8d 45 90             	lea    -0x70(%ebp),%eax
c01015c1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01015c5:	e8 86 00 00 00       	call   c0101650 <_svfprintf_r>
c01015ca:	83 f8 ff             	cmp    $0xffffffff,%eax
c01015cd:	7c 11                	jl     c01015e0 <_vsnprintf_r+0x70>
c01015cf:	85 db                	test   %ebx,%ebx
c01015d1:	74 06                	je     c01015d9 <_vsnprintf_r+0x69>
c01015d3:	8b 55 90             	mov    -0x70(%ebp),%edx
c01015d6:	c6 02 00             	movb   $0x0,(%edx)
c01015d9:	83 ec 80             	sub    $0xffffff80,%esp
c01015dc:	5b                   	pop    %ebx
c01015dd:	5e                   	pop    %esi
c01015de:	5d                   	pop    %ebp
c01015df:	c3                   	ret    
c01015e0:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c01015e6:	eb e7                	jmp    c01015cf <_vsnprintf_r+0x5f>
c01015e8:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c01015ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01015f3:	eb e4                	jmp    c01015d9 <_vsnprintf_r+0x69>
c01015f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01015f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101600 <vsnprintf>:
c0101600:	55                   	push   %ebp
c0101601:	89 e5                	mov    %esp,%ebp
c0101603:	83 ec 28             	sub    $0x28,%esp
c0101606:	e8 35 00 00 00       	call   c0101640 <__getreent>
c010160b:	8b 55 14             	mov    0x14(%ebp),%edx
c010160e:	89 54 24 10          	mov    %edx,0x10(%esp)
c0101612:	8b 55 10             	mov    0x10(%ebp),%edx
c0101615:	89 04 24             	mov    %eax,(%esp)
c0101618:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010161c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010161f:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101623:	8b 55 08             	mov    0x8(%ebp),%edx
c0101626:	89 54 24 04          	mov    %edx,0x4(%esp)
c010162a:	e8 41 ff ff ff       	call   c0101570 <_vsnprintf_r>
c010162f:	c9                   	leave  
c0101630:	c3                   	ret    
c0101631:	66 90                	xchg   %ax,%ax
c0101633:	66 90                	xchg   %ax,%ax
c0101635:	66 90                	xchg   %ax,%ax
c0101637:	66 90                	xchg   %ax,%ax
c0101639:	66 90                	xchg   %ax,%ax
c010163b:	66 90                	xchg   %ax,%ax
c010163d:	66 90                	xchg   %ax,%ax
c010163f:	90                   	nop

c0101640 <__getreent>:
c0101640:	55                   	push   %ebp
c0101641:	a1 20 a0 10 c0       	mov    0xc010a020,%eax
c0101646:	89 e5                	mov    %esp,%ebp
c0101648:	5d                   	pop    %ebp
c0101649:	c3                   	ret    
c010164a:	66 90                	xchg   %ax,%ax
c010164c:	66 90                	xchg   %ax,%ax
c010164e:	66 90                	xchg   %ax,%ax

c0101650 <_svfprintf_r>:
c0101650:	55                   	push   %ebp
c0101651:	89 e5                	mov    %esp,%ebp
c0101653:	57                   	push   %edi
c0101654:	56                   	push   %esi
c0101655:	53                   	push   %ebx
c0101656:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c010165c:	8b 45 08             	mov    0x8(%ebp),%eax
c010165f:	89 04 24             	mov    %eax,(%esp)
c0101662:	e8 89 33 00 00       	call   c01049f0 <_localeconv_r>
c0101667:	8b 00                	mov    (%eax),%eax
c0101669:	89 04 24             	mov    %eax,(%esp)
c010166c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c0101672:	e8 d9 4a 00 00       	call   c0106150 <strlen>
c0101677:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c010167d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101680:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0101684:	74 0b                	je     c0101691 <_svfprintf_r+0x41>
c0101686:	8b 40 10             	mov    0x10(%eax),%eax
c0101689:	85 c0                	test   %eax,%eax
c010168b:	0f 84 62 18 00 00    	je     c0102ef3 <_svfprintf_r+0x18a3>
c0101691:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101694:	8d 55 a7             	lea    -0x59(%ebp),%edx
c0101697:	89 c7                	mov    %eax,%edi
c0101699:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c010169f:	90                   	nop
c01016a0:	90                   	nop
c01016a1:	29 d0                	sub    %edx,%eax
c01016a3:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c01016aa:	00 00 00 
c01016ad:	90                   	nop
c01016ae:	90                   	nop
c01016af:	90                   	nop
c01016b0:	90                   	nop
c01016b1:	90                   	nop
c01016b2:	90                   	nop
c01016b3:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01016ba:	00 00 00 
c01016bd:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c01016c4:	00 00 00 
c01016c7:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c01016ce:	00 00 00 
c01016d1:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c01016d8:	00 00 00 
c01016db:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c01016e2:	00 00 00 
c01016e5:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c01016eb:	8b 45 10             	mov    0x10(%ebp),%eax
c01016ee:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01016f1:	0f b6 00             	movzbl (%eax),%eax
c01016f4:	3c 25                	cmp    $0x25,%al
c01016f6:	74 4d                	je     c0101745 <_svfprintf_r+0xf5>
c01016f8:	84 c0                	test   %al,%al
c01016fa:	75 08                	jne    c0101704 <_svfprintf_r+0xb4>
c01016fc:	eb 47                	jmp    c0101745 <_svfprintf_r+0xf5>
c01016fe:	66 90                	xchg   %ax,%ax
c0101700:	84 c0                	test   %al,%al
c0101702:	74 0a                	je     c010170e <_svfprintf_r+0xbe>
c0101704:	83 c3 01             	add    $0x1,%ebx
c0101707:	0f b6 03             	movzbl (%ebx),%eax
c010170a:	3c 25                	cmp    $0x25,%al
c010170c:	75 f2                	jne    c0101700 <_svfprintf_r+0xb0>
c010170e:	89 de                	mov    %ebx,%esi
c0101710:	2b 75 10             	sub    0x10(%ebp),%esi
c0101713:	74 30                	je     c0101745 <_svfprintf_r+0xf5>
c0101715:	8b 45 10             	mov    0x10(%ebp),%eax
c0101718:	83 c7 08             	add    $0x8,%edi
c010171b:	89 77 fc             	mov    %esi,-0x4(%edi)
c010171e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c0101724:	89 47 f8             	mov    %eax,-0x8(%edi)
c0101727:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010172d:	83 c0 01             	add    $0x1,%eax
c0101730:	83 f8 07             	cmp    $0x7,%eax
c0101733:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101739:	0f 8f 91 00 00 00    	jg     c01017d0 <_svfprintf_r+0x180>
c010173f:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c0101745:	80 3b 00             	cmpb   $0x0,(%ebx)
c0101748:	0f 84 aa 00 00 00    	je     c01017f8 <_svfprintf_r+0x1a8>
c010174e:	8d 43 01             	lea    0x1(%ebx),%eax
c0101751:	be 20 00 00 00       	mov    $0x20,%esi
c0101756:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010175d:	31 db                	xor    %ebx,%ebx
c010175f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0101766:	ff ff ff 
c0101769:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101770:	00 00 00 
c0101773:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c010177a:	00 00 00 
c010177d:	8d 48 01             	lea    0x1(%eax),%ecx
c0101780:	0f be 00             	movsbl (%eax),%eax
c0101783:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101786:	83 fa 58             	cmp    $0x58,%edx
c0101789:	0f 87 8f 07 00 00    	ja     c0101f1e <_svfprintf_r+0x8ce>
c010178f:	ff 24 95 c0 81 10 c0 	jmp    *-0x3fef7e40(,%edx,4)
c0101796:	66 90                	xchg   %ax,%ax
c0101798:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c010179f:	89 c8                	mov    %ecx,%eax
c01017a1:	eb da                	jmp    c010177d <_svfprintf_r+0x12d>
c01017a3:	8b 45 14             	mov    0x14(%ebp),%eax
c01017a6:	8b 55 14             	mov    0x14(%ebp),%edx
c01017a9:	8b 00                	mov    (%eax),%eax
c01017ab:	83 c2 04             	add    $0x4,%edx
c01017ae:	89 55 14             	mov    %edx,0x14(%ebp)
c01017b1:	85 c0                	test   %eax,%eax
c01017b3:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c01017b9:	79 e4                	jns    c010179f <_svfprintf_r+0x14f>
c01017bb:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c01017c1:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c01017c8:	89 c8                	mov    %ecx,%eax
c01017ca:	eb b1                	jmp    c010177d <_svfprintf_r+0x12d>
c01017cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01017d0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01017d6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01017da:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017dd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01017e4:	89 04 24             	mov    %eax,(%esp)
c01017e7:	e8 e4 49 00 00       	call   c01061d0 <__ssprint_r>
c01017ec:	85 c0                	test   %eax,%eax
c01017ee:	75 30                	jne    c0101820 <_svfprintf_r+0x1d0>
c01017f0:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01017f3:	e9 47 ff ff ff       	jmp    c010173f <_svfprintf_r+0xef>
c01017f8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01017fe:	85 c0                	test   %eax,%eax
c0101800:	74 1e                	je     c0101820 <_svfprintf_r+0x1d0>
c0101802:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101808:	89 44 24 08          	mov    %eax,0x8(%esp)
c010180c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010180f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101813:	8b 45 08             	mov    0x8(%ebp),%eax
c0101816:	89 04 24             	mov    %eax,(%esp)
c0101819:	e8 b2 49 00 00       	call   c01061d0 <__ssprint_r>
c010181e:	66 90                	xchg   %ax,%ax
c0101820:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101823:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101828:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c010182c:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c0101833:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c0101839:	5b                   	pop    %ebx
c010183a:	5e                   	pop    %esi
c010183b:	5f                   	pop    %edi
c010183c:	5d                   	pop    %ebp
c010183d:	c3                   	ret    
c010183e:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0101843:	89 c8                	mov    %ecx,%eax
c0101845:	e9 33 ff ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c010184a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101850:	8b 45 14             	mov    0x14(%ebp),%eax
c0101853:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101856:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010185d:	8d 70 04             	lea    0x4(%eax),%esi
c0101860:	8b 00                	mov    (%eax),%eax
c0101862:	85 c0                	test   %eax,%eax
c0101864:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010186a:	0f 84 7f 18 00 00    	je     c01030ef <_svfprintf_r+0x1a9f>
c0101870:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101876:	85 c0                	test   %eax,%eax
c0101878:	0f 88 b6 17 00 00    	js     c0103034 <_svfprintf_r+0x19e4>
c010187e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101882:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0101888:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010188f:	00 
c0101890:	89 04 24             	mov    %eax,(%esp)
c0101893:	e8 f8 38 00 00       	call   c0105190 <memchr>
c0101898:	85 c0                	test   %eax,%eax
c010189a:	0f 84 a0 19 00 00    	je     c0103240 <_svfprintf_r+0x1bf0>
c01018a0:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01018a6:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c01018ac:	39 d0                	cmp    %edx,%eax
c01018ae:	0f 4f c2             	cmovg  %edx,%eax
c01018b1:	89 c2                	mov    %eax,%edx
c01018b3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01018ba:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01018c0:	31 c0                	xor    %eax,%eax
c01018c2:	85 d2                	test   %edx,%edx
c01018c4:	0f 49 c2             	cmovns %edx,%eax
c01018c7:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01018cd:	89 75 14             	mov    %esi,0x14(%ebp)
c01018d0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01018d7:	00 00 00 
c01018da:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01018e1:	00 00 00 
c01018e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018e8:	84 db                	test   %bl,%bl
c01018ea:	74 07                	je     c01018f3 <_svfprintf_r+0x2a3>
c01018ec:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c01018f3:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01018f9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01018ff:	89 c8                	mov    %ecx,%eax
c0101901:	89 f2                	mov    %esi,%edx
c0101903:	83 c0 02             	add    $0x2,%eax
c0101906:	83 e2 02             	and    $0x2,%edx
c0101909:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c010190f:	89 f2                	mov    %esi,%edx
c0101911:	0f 44 c1             	cmove  %ecx,%eax
c0101914:	81 e2 84 00 00 00    	and    $0x84,%edx
c010191a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101920:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c0101926:	0f 85 1c 06 00 00    	jne    c0101f48 <_svfprintf_r+0x8f8>
c010192c:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0101932:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0101938:	85 f6                	test   %esi,%esi
c010193a:	0f 8e 08 06 00 00    	jle    c0101f48 <_svfprintf_r+0x8f8>
c0101940:	83 fe 10             	cmp    $0x10,%esi
c0101943:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101949:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010194f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101955:	7f 11                	jg     c0101968 <_svfprintf_r+0x318>
c0101957:	eb 6b                	jmp    c01019c4 <_svfprintf_r+0x374>
c0101959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101960:	83 ee 10             	sub    $0x10,%esi
c0101963:	83 fe 10             	cmp    $0x10,%esi
c0101966:	7e 5c                	jle    c01019c4 <_svfprintf_r+0x374>
c0101968:	83 c0 01             	add    $0x1,%eax
c010196b:	83 c1 10             	add    $0x10,%ecx
c010196e:	c7 07 34 83 10 c0    	movl   $0xc0108334,(%edi)
c0101974:	83 c7 08             	add    $0x8,%edi
c0101977:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010197e:	83 f8 07             	cmp    $0x7,%eax
c0101981:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101987:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010198d:	7e d1                	jle    c0101960 <_svfprintf_r+0x310>
c010198f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101992:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0101996:	89 44 24 04          	mov    %eax,0x4(%esp)
c010199a:	8b 45 08             	mov    0x8(%ebp),%eax
c010199d:	89 04 24             	mov    %eax,(%esp)
c01019a0:	e8 2b 48 00 00       	call   c01061d0 <__ssprint_r>
c01019a5:	85 c0                	test   %eax,%eax
c01019a7:	0f 85 73 fe ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01019ad:	83 ee 10             	sub    $0x10,%esi
c01019b0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01019b6:	83 fe 10             	cmp    $0x10,%esi
c01019b9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01019bf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01019c2:	7f a4                	jg     c0101968 <_svfprintf_r+0x318>
c01019c4:	83 c0 01             	add    $0x1,%eax
c01019c7:	01 f1                	add    %esi,%ecx
c01019c9:	83 f8 07             	cmp    $0x7,%eax
c01019cc:	c7 07 34 83 10 c0    	movl   $0xc0108334,(%edi)
c01019d2:	89 77 04             	mov    %esi,0x4(%edi)
c01019d5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01019db:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01019e1:	0f 8f 16 0e 00 00    	jg     c01027fd <_svfprintf_r+0x11ad>
c01019e7:	83 c7 08             	add    $0x8,%edi
c01019ea:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01019f1:	e9 58 05 00 00       	jmp    c0101f4e <_svfprintf_r+0x8fe>
c01019f6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01019fd:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101a03:	8b 45 14             	mov    0x14(%ebp),%eax
c0101a06:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101a09:	0f 85 fd 04 00 00    	jne    c0101f0c <_svfprintf_r+0x8bc>
c0101a0f:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101a16:	0f 84 f0 04 00 00    	je     c0101f0c <_svfprintf_r+0x8bc>
c0101a1c:	0f b7 08             	movzwl (%eax),%ecx
c0101a1f:	83 c0 04             	add    $0x4,%eax
c0101a22:	89 45 14             	mov    %eax,0x14(%ebp)
c0101a25:	b8 01 00 00 00       	mov    $0x1,%eax
c0101a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101a30:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101a37:	31 db                	xor    %ebx,%ebx
c0101a39:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c0101a3f:	89 f2                	mov    %esi,%edx
c0101a41:	80 e2 7f             	and    $0x7f,%dl
c0101a44:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c0101a4b:	0f 48 d6             	cmovs  %esi,%edx
c0101a4e:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c0101a54:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101a5a:	85 d2                	test   %edx,%edx
c0101a5c:	75 08                	jne    c0101a66 <_svfprintf_r+0x416>
c0101a5e:	85 c9                	test   %ecx,%ecx
c0101a60:	0f 84 ea 08 00 00    	je     c0102350 <_svfprintf_r+0xd00>
c0101a66:	3c 01                	cmp    $0x1,%al
c0101a68:	0f 84 6a 0d 00 00    	je     c01027d8 <_svfprintf_r+0x1188>
c0101a6e:	3c 02                	cmp    $0x2,%al
c0101a70:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101a73:	0f 85 bf 0b 00 00    	jne    c0102638 <_svfprintf_r+0xfe8>
c0101a79:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c0101a7f:	90                   	nop
c0101a80:	89 ca                	mov    %ecx,%edx
c0101a82:	83 e8 01             	sub    $0x1,%eax
c0101a85:	83 e2 0f             	and    $0xf,%edx
c0101a88:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c0101a8c:	c1 e9 04             	shr    $0x4,%ecx
c0101a8f:	85 c9                	test   %ecx,%ecx
c0101a91:	88 10                	mov    %dl,(%eax)
c0101a93:	75 eb                	jne    c0101a80 <_svfprintf_r+0x430>
c0101a95:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0101a98:	29 c2                	sub    %eax,%edx
c0101a9a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101aa0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0101aa6:	66 90                	xchg   %ax,%ax
c0101aa8:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101aae:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0101ab4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101abb:	00 00 00 
c0101abe:	39 c2                	cmp    %eax,%edx
c0101ac0:	0f 4d c2             	cmovge %edx,%eax
c0101ac3:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101ac9:	e9 1a fe ff ff       	jmp    c01018e8 <_svfprintf_r+0x298>
c0101ace:	84 db                	test   %bl,%bl
c0101ad0:	89 c8                	mov    %ecx,%eax
c0101ad2:	0f 44 de             	cmove  %esi,%ebx
c0101ad5:	e9 a3 fc ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0101ada:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0101ae1:	89 c8                	mov    %ecx,%eax
c0101ae3:	e9 95 fc ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0101ae8:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c0101aef:	00 00 00 
c0101af2:	89 c8                	mov    %ecx,%eax
c0101af4:	e9 84 fc ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0101af9:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101aff:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101b02:	31 ff                	xor    %edi,%edi
c0101b04:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101b0b:	00 00 00 
c0101b0e:	66 90                	xchg   %ax,%ax
c0101b10:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c0101b13:	83 c1 01             	add    $0x1,%ecx
c0101b16:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c0101b19:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c0101b1d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101b20:	83 fa 09             	cmp    $0x9,%edx
c0101b23:	76 eb                	jbe    c0101b10 <_svfprintf_r+0x4c0>
c0101b25:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c0101b2b:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101b31:	e9 4d fc ff ff       	jmp    c0101783 <_svfprintf_r+0x133>
c0101b36:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101b3d:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101b44:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b4a:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b4d:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b50:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101b56:	0f 85 61 02 00 00    	jne    c0101dbd <_svfprintf_r+0x76d>
c0101b5c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101b63:	0f 84 54 02 00 00    	je     c0101dbd <_svfprintf_r+0x76d>
c0101b69:	0f bf 08             	movswl (%eax),%ecx
c0101b6c:	83 c0 04             	add    $0x4,%eax
c0101b6f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b72:	85 c9                	test   %ecx,%ecx
c0101b74:	0f 88 53 02 00 00    	js     c0101dcd <_svfprintf_r+0x77d>
c0101b7a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101b81:	b8 01 00 00 00       	mov    $0x1,%eax
c0101b86:	e9 ae fe ff ff       	jmp    c0101a39 <_svfprintf_r+0x3e9>
c0101b8b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0101b92:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b98:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b9b:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b9e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101ba4:	0f 84 15 10 00 00    	je     c0102bbf <_svfprintf_r+0x156f>
c0101baa:	db 28                	fldt   (%eax)
c0101bac:	83 c0 0c             	add    $0xc,%eax
c0101baf:	89 45 14             	mov    %eax,0x14(%ebp)
c0101bb2:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0101bb8:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101bbe:	dd 1c 24             	fstpl  (%esp)
c0101bc1:	e8 aa 44 00 00       	call   c0106070 <__fpclassifyd>
c0101bc6:	83 f8 01             	cmp    $0x1,%eax
c0101bc9:	0f 85 82 0f 00 00    	jne    c0102b51 <_svfprintf_r+0x1501>
c0101bcf:	d9 ee                	fldz   
c0101bd1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101bd7:	d9 c9                	fxch   %st(1)
c0101bd9:	df e9                	fucomip %st(1),%st
c0101bdb:	dd d8                	fstp   %st(0)
c0101bdd:	0f 87 59 15 00 00    	ja     c010313c <_svfprintf_r+0x1aec>
c0101be3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101bea:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0101bf1:	ba 82 81 10 c0       	mov    $0xc0108182,%edx
c0101bf6:	b8 86 81 10 c0       	mov    $0xc0108186,%eax
c0101bfb:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0101c02:	00 00 00 
c0101c05:	0f 4e c2             	cmovle %edx,%eax
c0101c08:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101c0e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0101c15:	ff ff ff 
c0101c18:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0101c1f:	00 00 00 
c0101c22:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101c29:	00 00 00 
c0101c2c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101c33:	00 00 00 
c0101c36:	e9 ad fc ff ff       	jmp    c01018e8 <_svfprintf_r+0x298>
c0101c3b:	8d 41 01             	lea    0x1(%ecx),%eax
c0101c3e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101c44:	0f be 01             	movsbl (%ecx),%eax
c0101c47:	83 f8 2a             	cmp    $0x2a,%eax
c0101c4a:	0f 84 84 18 00 00    	je     c01034d4 <_svfprintf_r+0x1e84>
c0101c50:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c53:	31 c9                	xor    %ecx,%ecx
c0101c55:	83 fa 09             	cmp    $0x9,%edx
c0101c58:	0f 87 a8 16 00 00    	ja     c0103306 <_svfprintf_r+0x1cb6>
c0101c5e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c0101c64:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101c70:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0101c73:	83 c7 01             	add    $0x1,%edi
c0101c76:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0101c79:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c0101c7d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c80:	83 fa 09             	cmp    $0x9,%edx
c0101c83:	76 eb                	jbe    c0101c70 <_svfprintf_r+0x620>
c0101c85:	85 c9                	test   %ecx,%ecx
c0101c87:	89 ca                	mov    %ecx,%edx
c0101c89:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101c8e:	0f 48 d1             	cmovs  %ecx,%edx
c0101c91:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101c97:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c0101c9d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101ca3:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0101ca9:	e9 d5 fa ff ff       	jmp    c0101783 <_svfprintf_r+0x133>
c0101cae:	8b 45 14             	mov    0x14(%ebp),%eax
c0101cb1:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101cb4:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101cbb:	8b 08                	mov    (%eax),%ecx
c0101cbd:	83 c0 04             	add    $0x4,%eax
c0101cc0:	89 45 14             	mov    %eax,0x14(%ebp)
c0101cc3:	b8 02 00 00 00       	mov    $0x2,%eax
c0101cc8:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101ccf:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0101cd6:	c7 85 18 ff ff ff a3 	movl   $0xc01081a3,-0xe8(%ebp)
c0101cdd:	81 10 c0 
c0101ce0:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0101ce7:	00 00 00 
c0101cea:	e9 41 fd ff ff       	jmp    c0101a30 <_svfprintf_r+0x3e0>
c0101cef:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101cf6:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101cfc:	8b 45 14             	mov    0x14(%ebp),%eax
c0101cff:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d02:	0f 85 87 00 00 00    	jne    c0101d8f <_svfprintf_r+0x73f>
c0101d08:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101d0f:	74 7e                	je     c0101d8f <_svfprintf_r+0x73f>
c0101d11:	0f b7 08             	movzwl (%eax),%ecx
c0101d14:	83 c0 04             	add    $0x4,%eax
c0101d17:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d1a:	31 c0                	xor    %eax,%eax
c0101d1c:	e9 0f fd ff ff       	jmp    c0101a30 <_svfprintf_r+0x3e0>
c0101d21:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c0101d28:	89 c8                	mov    %ecx,%eax
c0101d2a:	e9 4e fa ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0101d2f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d36:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d39:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101d3f:	0f 85 97 0b 00 00    	jne    c01028dc <_svfprintf_r+0x128c>
c0101d45:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101d4c:	0f 84 8a 0b 00 00    	je     c01028dc <_svfprintf_r+0x128c>
c0101d52:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d55:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c0101d5c:	8b 00                	mov    (%eax),%eax
c0101d5e:	66 89 10             	mov    %dx,(%eax)
c0101d61:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d64:	83 c0 04             	add    $0x4,%eax
c0101d67:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d6a:	e9 7c f9 ff ff       	jmp    c01016eb <_svfprintf_r+0x9b>
c0101d6f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101d76:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d7d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101d83:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d86:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d89:	0f 84 79 ff ff ff    	je     c0101d08 <_svfprintf_r+0x6b8>
c0101d8f:	8b 08                	mov    (%eax),%ecx
c0101d91:	83 c0 04             	add    $0x4,%eax
c0101d94:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d97:	31 c0                	xor    %eax,%eax
c0101d99:	e9 92 fc ff ff       	jmp    c0101a30 <_svfprintf_r+0x3e0>
c0101d9e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101da5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101dab:	8b 45 14             	mov    0x14(%ebp),%eax
c0101dae:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101db1:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101db7:	0f 84 9f fd ff ff    	je     c0101b5c <_svfprintf_r+0x50c>
c0101dbd:	8b 08                	mov    (%eax),%ecx
c0101dbf:	83 c0 04             	add    $0x4,%eax
c0101dc2:	89 45 14             	mov    %eax,0x14(%ebp)
c0101dc5:	85 c9                	test   %ecx,%ecx
c0101dc7:	0f 89 ad fd ff ff    	jns    c0101b7a <_svfprintf_r+0x52a>
c0101dcd:	f7 d9                	neg    %ecx
c0101dcf:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0101dd4:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0101ddb:	b8 01 00 00 00       	mov    $0x1,%eax
c0101de0:	e9 54 fc ff ff       	jmp    c0101a39 <_svfprintf_r+0x3e9>
c0101de5:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c0101dec:	89 c8                	mov    %ecx,%eax
c0101dee:	e9 8a f9 ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0101df3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101dfa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e00:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e03:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e06:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101e0c:	c7 85 18 ff ff ff a3 	movl   $0xc01081a3,-0xe8(%ebp)
c0101e13:	81 10 c0 
c0101e16:	75 71                	jne    c0101e89 <_svfprintf_r+0x839>
c0101e18:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101e1f:	74 68                	je     c0101e89 <_svfprintf_r+0x839>
c0101e21:	0f b7 08             	movzwl (%eax),%ecx
c0101e24:	83 c0 04             	add    $0x4,%eax
c0101e27:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e2a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0101e31:	b8 02 00 00 00       	mov    $0x2,%eax
c0101e36:	0f 84 f4 fb ff ff    	je     c0101a30 <_svfprintf_r+0x3e0>
c0101e3c:	85 c9                	test   %ecx,%ecx
c0101e3e:	0f 84 ec fb ff ff    	je     c0101a30 <_svfprintf_r+0x3e0>
c0101e44:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c0101e4b:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101e52:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101e59:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c0101e5f:	e9 cc fb ff ff       	jmp    c0101a30 <_svfprintf_r+0x3e0>
c0101e64:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101e6b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e71:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e74:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e77:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101e7d:	c7 85 18 ff ff ff 92 	movl   $0xc0108192,-0xe8(%ebp)
c0101e84:	81 10 c0 
c0101e87:	74 8f                	je     c0101e18 <_svfprintf_r+0x7c8>
c0101e89:	8b 08                	mov    (%eax),%ecx
c0101e8b:	83 c0 04             	add    $0x4,%eax
c0101e8e:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e91:	eb 97                	jmp    c0101e2a <_svfprintf_r+0x7da>
c0101e93:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e99:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e9c:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e9f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101ea6:	8b 00                	mov    (%eax),%eax
c0101ea8:	88 45 80             	mov    %al,-0x80(%ebp)
c0101eab:	8b 45 14             	mov    0x14(%ebp),%eax
c0101eae:	83 c0 04             	add    $0x4,%eax
c0101eb1:	89 45 14             	mov    %eax,0x14(%ebp)
c0101eb4:	8d 45 80             	lea    -0x80(%ebp),%eax
c0101eb7:	31 db                	xor    %ebx,%ebx
c0101eb9:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0101ec0:	00 00 00 
c0101ec3:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0101eca:	00 00 00 
c0101ecd:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101ed4:	00 00 00 
c0101ed7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101ede:	00 00 00 
c0101ee1:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101ee7:	e9 07 fa ff ff       	jmp    c01018f3 <_svfprintf_r+0x2a3>
c0101eec:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101ef3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101efa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101f00:	8b 45 14             	mov    0x14(%ebp),%eax
c0101f03:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101f06:	0f 84 03 fb ff ff    	je     c0101a0f <_svfprintf_r+0x3bf>
c0101f0c:	8b 08                	mov    (%eax),%ecx
c0101f0e:	83 c0 04             	add    $0x4,%eax
c0101f11:	89 45 14             	mov    %eax,0x14(%ebp)
c0101f14:	b8 01 00 00 00       	mov    $0x1,%eax
c0101f19:	e9 12 fb ff ff       	jmp    c0101a30 <_svfprintf_r+0x3e0>
c0101f1e:	85 c0                	test   %eax,%eax
c0101f20:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101f26:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101f29:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101f2f:	0f 84 c3 f8 ff ff    	je     c01017f8 <_svfprintf_r+0x1a8>
c0101f35:	88 45 80             	mov    %al,-0x80(%ebp)
c0101f38:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101f3f:	e9 70 ff ff ff       	jmp    c0101eb4 <_svfprintf_r+0x864>
c0101f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101f48:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101f4e:	84 db                	test   %bl,%bl
c0101f50:	74 33                	je     c0101f85 <_svfprintf_r+0x935>
c0101f52:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c0101f58:	83 c1 01             	add    $0x1,%ecx
c0101f5b:	89 07                	mov    %eax,(%edi)
c0101f5d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f63:	83 c7 08             	add    $0x8,%edi
c0101f66:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0101f6d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101f73:	83 c0 01             	add    $0x1,%eax
c0101f76:	83 f8 07             	cmp    $0x7,%eax
c0101f79:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101f7f:	0f 8f 7b 06 00 00    	jg     c0102600 <_svfprintf_r+0xfb0>
c0101f85:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c0101f8b:	85 db                	test   %ebx,%ebx
c0101f8d:	74 33                	je     c0101fc2 <_svfprintf_r+0x972>
c0101f8f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0101f95:	83 c1 02             	add    $0x2,%ecx
c0101f98:	89 07                	mov    %eax,(%edi)
c0101f9a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101fa0:	83 c7 08             	add    $0x8,%edi
c0101fa3:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c0101faa:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101fb0:	83 c0 01             	add    $0x1,%eax
c0101fb3:	83 f8 07             	cmp    $0x7,%eax
c0101fb6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101fbc:	0f 8f 06 06 00 00    	jg     c01025c8 <_svfprintf_r+0xf78>
c0101fc2:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0101fc9:	00 00 00 
c0101fcc:	0f 84 c6 03 00 00    	je     c0102398 <_svfprintf_r+0xd48>
c0101fd2:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0101fd8:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c0101fde:	85 f6                	test   %esi,%esi
c0101fe0:	0f 8e d2 00 00 00    	jle    c01020b8 <_svfprintf_r+0xa68>
c0101fe6:	83 fe 10             	cmp    $0x10,%esi
c0101fe9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101fef:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101ff5:	7f 11                	jg     c0102008 <_svfprintf_r+0x9b8>
c0101ff7:	eb 6b                	jmp    c0102064 <_svfprintf_r+0xa14>
c0101ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102000:	83 ee 10             	sub    $0x10,%esi
c0102003:	83 fe 10             	cmp    $0x10,%esi
c0102006:	7e 5c                	jle    c0102064 <_svfprintf_r+0xa14>
c0102008:	83 c0 01             	add    $0x1,%eax
c010200b:	83 c1 10             	add    $0x10,%ecx
c010200e:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102014:	83 c7 08             	add    $0x8,%edi
c0102017:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010201e:	83 f8 07             	cmp    $0x7,%eax
c0102021:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102027:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010202d:	7e d1                	jle    c0102000 <_svfprintf_r+0x9b0>
c010202f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102032:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102036:	89 44 24 04          	mov    %eax,0x4(%esp)
c010203a:	8b 45 08             	mov    0x8(%ebp),%eax
c010203d:	89 04 24             	mov    %eax,(%esp)
c0102040:	e8 8b 41 00 00       	call   c01061d0 <__ssprint_r>
c0102045:	85 c0                	test   %eax,%eax
c0102047:	0f 85 d3 f7 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010204d:	83 ee 10             	sub    $0x10,%esi
c0102050:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102056:	83 fe 10             	cmp    $0x10,%esi
c0102059:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010205f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102062:	7f a4                	jg     c0102008 <_svfprintf_r+0x9b8>
c0102064:	83 c0 01             	add    $0x1,%eax
c0102067:	01 f1                	add    %esi,%ecx
c0102069:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c010206f:	83 c7 08             	add    $0x8,%edi
c0102072:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102075:	83 f8 07             	cmp    $0x7,%eax
c0102078:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010207e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102084:	7e 32                	jle    c01020b8 <_svfprintf_r+0xa68>
c0102086:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010208c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102090:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102093:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102097:	8b 45 08             	mov    0x8(%ebp),%eax
c010209a:	89 04 24             	mov    %eax,(%esp)
c010209d:	e8 2e 41 00 00       	call   c01061d0 <__ssprint_r>
c01020a2:	85 c0                	test   %eax,%eax
c01020a4:	0f 85 76 f7 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01020aa:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01020b0:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01020b3:	90                   	nop
c01020b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01020b8:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c01020bf:	01 00 00 
c01020c2:	0f 85 50 01 00 00    	jne    c0102218 <_svfprintf_r+0xbc8>
c01020c8:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01020ce:	89 07                	mov    %eax,(%edi)
c01020d0:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c01020d6:	01 c1                	add    %eax,%ecx
c01020d8:	89 47 04             	mov    %eax,0x4(%edi)
c01020db:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020e1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01020e7:	83 c0 01             	add    $0x1,%eax
c01020ea:	83 f8 07             	cmp    $0x7,%eax
c01020ed:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01020f3:	0f 8f 6a 04 00 00    	jg     c0102563 <_svfprintf_r+0xf13>
c01020f9:	83 c7 08             	add    $0x8,%edi
c01020fc:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c0102103:	0f 84 d7 00 00 00    	je     c01021e0 <_svfprintf_r+0xb90>
c0102109:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010210f:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102115:	85 f6                	test   %esi,%esi
c0102117:	0f 8e c3 00 00 00    	jle    c01021e0 <_svfprintf_r+0xb90>
c010211d:	83 fe 10             	cmp    $0x10,%esi
c0102120:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102126:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010212c:	7f 0a                	jg     c0102138 <_svfprintf_r+0xae8>
c010212e:	eb 64                	jmp    c0102194 <_svfprintf_r+0xb44>
c0102130:	83 ee 10             	sub    $0x10,%esi
c0102133:	83 fe 10             	cmp    $0x10,%esi
c0102136:	7e 5c                	jle    c0102194 <_svfprintf_r+0xb44>
c0102138:	83 c0 01             	add    $0x1,%eax
c010213b:	83 c1 10             	add    $0x10,%ecx
c010213e:	c7 07 34 83 10 c0    	movl   $0xc0108334,(%edi)
c0102144:	83 c7 08             	add    $0x8,%edi
c0102147:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010214e:	83 f8 07             	cmp    $0x7,%eax
c0102151:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102157:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010215d:	7e d1                	jle    c0102130 <_svfprintf_r+0xae0>
c010215f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102162:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102166:	89 44 24 04          	mov    %eax,0x4(%esp)
c010216a:	8b 45 08             	mov    0x8(%ebp),%eax
c010216d:	89 04 24             	mov    %eax,(%esp)
c0102170:	e8 5b 40 00 00       	call   c01061d0 <__ssprint_r>
c0102175:	85 c0                	test   %eax,%eax
c0102177:	0f 85 a3 f6 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010217d:	83 ee 10             	sub    $0x10,%esi
c0102180:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102186:	83 fe 10             	cmp    $0x10,%esi
c0102189:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010218f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102192:	7f a4                	jg     c0102138 <_svfprintf_r+0xae8>
c0102194:	83 c0 01             	add    $0x1,%eax
c0102197:	01 f1                	add    %esi,%ecx
c0102199:	83 f8 07             	cmp    $0x7,%eax
c010219c:	c7 07 34 83 10 c0    	movl   $0xc0108334,(%edi)
c01021a2:	89 77 04             	mov    %esi,0x4(%edi)
c01021a5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01021ab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01021b1:	7e 2d                	jle    c01021e0 <_svfprintf_r+0xb90>
c01021b3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01021b9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01021bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021c0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01021c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01021c7:	89 04 24             	mov    %eax,(%esp)
c01021ca:	e8 01 40 00 00       	call   c01061d0 <__ssprint_r>
c01021cf:	85 c0                	test   %eax,%eax
c01021d1:	0f 85 49 f6 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01021d7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01021dd:	8d 76 00             	lea    0x0(%esi),%esi
c01021e0:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c01021e6:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c01021ec:	39 c2                	cmp    %eax,%edx
c01021ee:	0f 4d c2             	cmovge %edx,%eax
c01021f1:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c01021f7:	85 c9                	test   %ecx,%ecx
c01021f9:	0f 85 99 03 00 00    	jne    c0102598 <_svfprintf_r+0xf48>
c01021ff:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0102206:	00 00 00 
c0102209:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010220c:	e9 da f4 ff ff       	jmp    c01016eb <_svfprintf_r+0x9b>
c0102211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102218:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c010221f:	0f 8e 5b 02 00 00    	jle    c0102480 <_svfprintf_r+0xe30>
c0102225:	d9 ee                	fldz   
c0102227:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c010222d:	df e9                	fucomip %st(1),%st
c010222f:	dd d8                	fstp   %st(0)
c0102231:	0f 8a 59 04 00 00    	jp     c0102690 <_svfprintf_r+0x1040>
c0102237:	0f 85 53 04 00 00    	jne    c0102690 <_svfprintf_r+0x1040>
c010223d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102243:	83 c1 01             	add    $0x1,%ecx
c0102246:	83 c7 08             	add    $0x8,%edi
c0102249:	c7 47 f8 bb 81 10 c0 	movl   $0xc01081bb,-0x8(%edi)
c0102250:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102257:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010225d:	83 c0 01             	add    $0x1,%eax
c0102260:	83 f8 07             	cmp    $0x7,%eax
c0102263:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102269:	0f 8f 63 09 00 00    	jg     c0102bd2 <_svfprintf_r+0x1582>
c010226f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102275:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c010227b:	7c 0d                	jl     c010228a <_svfprintf_r+0xc3a>
c010227d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102284:	0f 84 72 fe ff ff    	je     c01020fc <_svfprintf_r+0xaac>
c010228a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102290:	83 c7 08             	add    $0x8,%edi
c0102293:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102296:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010229c:	89 47 fc             	mov    %eax,-0x4(%edi)
c010229f:	01 c1                	add    %eax,%ecx
c01022a1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01022a7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01022ad:	83 c0 01             	add    $0x1,%eax
c01022b0:	83 f8 07             	cmp    $0x7,%eax
c01022b3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01022b9:	0f 8f dc 0b 00 00    	jg     c0102e9b <_svfprintf_r+0x184b>
c01022bf:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c01022c5:	8d 70 ff             	lea    -0x1(%eax),%esi
c01022c8:	85 f6                	test   %esi,%esi
c01022ca:	0f 8e 2c fe ff ff    	jle    c01020fc <_svfprintf_r+0xaac>
c01022d0:	83 fe 10             	cmp    $0x10,%esi
c01022d3:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01022d9:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01022df:	7f 13                	jg     c01022f4 <_svfprintf_r+0xca4>
c01022e1:	e9 e6 05 00 00       	jmp    c01028cc <_svfprintf_r+0x127c>
c01022e6:	66 90                	xchg   %ax,%ax
c01022e8:	83 ee 10             	sub    $0x10,%esi
c01022eb:	83 fe 10             	cmp    $0x10,%esi
c01022ee:	0f 8e d8 05 00 00    	jle    c01028cc <_svfprintf_r+0x127c>
c01022f4:	83 c0 01             	add    $0x1,%eax
c01022f7:	83 c1 10             	add    $0x10,%ecx
c01022fa:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102300:	83 c7 08             	add    $0x8,%edi
c0102303:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010230a:	83 f8 07             	cmp    $0x7,%eax
c010230d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102313:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102319:	7e cd                	jle    c01022e8 <_svfprintf_r+0xc98>
c010231b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010231e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102322:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102326:	8b 45 08             	mov    0x8(%ebp),%eax
c0102329:	89 04 24             	mov    %eax,(%esp)
c010232c:	e8 9f 3e 00 00       	call   c01061d0 <__ssprint_r>
c0102331:	85 c0                	test   %eax,%eax
c0102333:	0f 85 e7 f4 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102339:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010233f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102342:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102348:	eb 9e                	jmp    c01022e8 <_svfprintf_r+0xc98>
c010234a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102350:	84 c0                	test   %al,%al
c0102352:	75 2c                	jne    c0102380 <_svfprintf_r+0xd30>
c0102354:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010235b:	74 23                	je     c0102380 <_svfprintf_r+0xd30>
c010235d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102363:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0102367:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010236d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102370:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102376:	e9 2d f7 ff ff       	jmp    c0101aa8 <_svfprintf_r+0x458>
c010237b:	90                   	nop
c010237c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102380:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102383:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c010238a:	00 00 00 
c010238d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102393:	e9 10 f7 ff ff       	jmp    c0101aa8 <_svfprintf_r+0x458>
c0102398:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010239e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01023a4:	85 f6                	test   %esi,%esi
c01023a6:	0f 8e 26 fc ff ff    	jle    c0101fd2 <_svfprintf_r+0x982>
c01023ac:	83 fe 10             	cmp    $0x10,%esi
c01023af:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01023b5:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01023bb:	7f 0b                	jg     c01023c8 <_svfprintf_r+0xd78>
c01023bd:	eb 65                	jmp    c0102424 <_svfprintf_r+0xdd4>
c01023bf:	90                   	nop
c01023c0:	83 ee 10             	sub    $0x10,%esi
c01023c3:	83 fe 10             	cmp    $0x10,%esi
c01023c6:	7e 5c                	jle    c0102424 <_svfprintf_r+0xdd4>
c01023c8:	83 c0 01             	add    $0x1,%eax
c01023cb:	83 c1 10             	add    $0x10,%ecx
c01023ce:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c01023d4:	83 c7 08             	add    $0x8,%edi
c01023d7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01023de:	83 f8 07             	cmp    $0x7,%eax
c01023e1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01023e7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01023ed:	7e d1                	jle    c01023c0 <_svfprintf_r+0xd70>
c01023ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01023f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01023fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01023fd:	89 04 24             	mov    %eax,(%esp)
c0102400:	e8 cb 3d 00 00       	call   c01061d0 <__ssprint_r>
c0102405:	85 c0                	test   %eax,%eax
c0102407:	0f 85 13 f4 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010240d:	83 ee 10             	sub    $0x10,%esi
c0102410:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102416:	83 fe 10             	cmp    $0x10,%esi
c0102419:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010241f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102422:	7f a4                	jg     c01023c8 <_svfprintf_r+0xd78>
c0102424:	83 c0 01             	add    $0x1,%eax
c0102427:	01 f1                	add    %esi,%ecx
c0102429:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c010242f:	83 c7 08             	add    $0x8,%edi
c0102432:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102435:	83 f8 07             	cmp    $0x7,%eax
c0102438:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010243e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102444:	0f 8e 88 fb ff ff    	jle    c0101fd2 <_svfprintf_r+0x982>
c010244a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102450:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102454:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102457:	89 44 24 04          	mov    %eax,0x4(%esp)
c010245b:	8b 45 08             	mov    0x8(%ebp),%eax
c010245e:	89 04 24             	mov    %eax,(%esp)
c0102461:	e8 6a 3d 00 00       	call   c01061d0 <__ssprint_r>
c0102466:	85 c0                	test   %eax,%eax
c0102468:	0f 85 b2 f3 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010246e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102474:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102477:	e9 56 fb ff ff       	jmp    c0101fd2 <_svfprintf_r+0x982>
c010247c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102480:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c0102487:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010248d:	0f 8e df 05 00 00    	jle    c0102a72 <_svfprintf_r+0x1422>
c0102493:	89 07                	mov    %eax,(%edi)
c0102495:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010249b:	8d 51 01             	lea    0x1(%ecx),%edx
c010249e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c01024a5:	83 c7 08             	add    $0x8,%edi
c01024a8:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01024ae:	83 c0 01             	add    $0x1,%eax
c01024b1:	83 f8 07             	cmp    $0x7,%eax
c01024b4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01024ba:	0f 8f 59 06 00 00    	jg     c0102b19 <_svfprintf_r+0x14c9>
c01024c0:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c01024c6:	83 c0 01             	add    $0x1,%eax
c01024c9:	83 c7 08             	add    $0x8,%edi
c01024cc:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01024d2:	89 5f f8             	mov    %ebx,-0x8(%edi)
c01024d5:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c01024db:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01024de:	01 da                	add    %ebx,%edx
c01024e0:	83 f8 07             	cmp    $0x7,%eax
c01024e3:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01024e9:	0f 8f f2 05 00 00    	jg     c0102ae1 <_svfprintf_r+0x1491>
c01024ef:	d9 ee                	fldz   
c01024f1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01024f7:	df e9                	fucomip %st(1),%st
c01024f9:	dd d8                	fstp   %st(0)
c01024fb:	7a 06                	jp     c0102503 <_svfprintf_r+0xeb3>
c01024fd:	0f 84 33 03 00 00    	je     c0102836 <_svfprintf_r+0x11e6>
c0102503:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c0102509:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c010250f:	83 c1 01             	add    $0x1,%ecx
c0102512:	89 0f                	mov    %ecx,(%edi)
c0102514:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c0102517:	89 4f 04             	mov    %ecx,0x4(%edi)
c010251a:	01 ca                	add    %ecx,%edx
c010251c:	83 c0 01             	add    $0x1,%eax
c010251f:	83 f8 07             	cmp    $0x7,%eax
c0102522:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102528:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010252e:	0f 8f 75 05 00 00    	jg     c0102aa9 <_svfprintf_r+0x1459>
c0102534:	83 c7 08             	add    $0x8,%edi
c0102537:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c010253d:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c0102543:	89 0f                	mov    %ecx,(%edi)
c0102545:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102548:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c010254b:	83 c0 01             	add    $0x1,%eax
c010254e:	83 f8 07             	cmp    $0x7,%eax
c0102551:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102557:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010255d:	0f 8e 96 fb ff ff    	jle    c01020f9 <_svfprintf_r+0xaa9>
c0102563:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102569:	89 44 24 08          	mov    %eax,0x8(%esp)
c010256d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102570:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102574:	8b 45 08             	mov    0x8(%ebp),%eax
c0102577:	89 04 24             	mov    %eax,(%esp)
c010257a:	e8 51 3c 00 00       	call   c01061d0 <__ssprint_r>
c010257f:	85 c0                	test   %eax,%eax
c0102581:	0f 85 99 f2 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102587:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010258d:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102590:	e9 67 fb ff ff       	jmp    c01020fc <_svfprintf_r+0xaac>
c0102595:	8d 76 00             	lea    0x0(%esi),%esi
c0102598:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010259e:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025a2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025a5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ac:	89 04 24             	mov    %eax,(%esp)
c01025af:	e8 1c 3c 00 00       	call   c01061d0 <__ssprint_r>
c01025b4:	85 c0                	test   %eax,%eax
c01025b6:	0f 84 43 fc ff ff    	je     c01021ff <_svfprintf_r+0xbaf>
c01025bc:	e9 5f f2 ff ff       	jmp    c0101820 <_svfprintf_r+0x1d0>
c01025c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01025c8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025ce:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025d2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025d5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01025dc:	89 04 24             	mov    %eax,(%esp)
c01025df:	e8 ec 3b 00 00       	call   c01061d0 <__ssprint_r>
c01025e4:	85 c0                	test   %eax,%eax
c01025e6:	0f 85 34 f2 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01025ec:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025f2:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025f5:	e9 c8 f9 ff ff       	jmp    c0101fc2 <_svfprintf_r+0x972>
c01025fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102600:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102606:	89 44 24 08          	mov    %eax,0x8(%esp)
c010260a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010260d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102611:	8b 45 08             	mov    0x8(%ebp),%eax
c0102614:	89 04 24             	mov    %eax,(%esp)
c0102617:	e8 b4 3b 00 00       	call   c01061d0 <__ssprint_r>
c010261c:	85 c0                	test   %eax,%eax
c010261e:	0f 85 fc f1 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102624:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010262a:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010262d:	e9 53 f9 ff ff       	jmp    c0101f85 <_svfprintf_r+0x935>
c0102632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102638:	89 c2                	mov    %eax,%edx
c010263a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102640:	89 c8                	mov    %ecx,%eax
c0102642:	83 ea 01             	sub    $0x1,%edx
c0102645:	83 e0 07             	and    $0x7,%eax
c0102648:	c1 e9 03             	shr    $0x3,%ecx
c010264b:	83 c0 30             	add    $0x30,%eax
c010264e:	85 c9                	test   %ecx,%ecx
c0102650:	88 02                	mov    %al,(%edx)
c0102652:	75 ec                	jne    c0102640 <_svfprintf_r+0xff0>
c0102654:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010265b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c0102661:	0f 84 5b 01 00 00    	je     c01027c2 <_svfprintf_r+0x1172>
c0102667:	3c 30                	cmp    $0x30,%al
c0102669:	74 0b                	je     c0102676 <_svfprintf_r+0x1026>
c010266b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c0102672:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0102676:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102679:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010267f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102685:	e9 1e f4 ff ff       	jmp    c0101aa8 <_svfprintf_r+0x458>
c010268a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102690:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102696:	85 db                	test   %ebx,%ebx
c0102698:	0f 8e 66 05 00 00    	jle    c0102c04 <_svfprintf_r+0x15b4>
c010269e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01026a4:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c01026aa:	01 d0                	add    %edx,%eax
c01026ac:	89 c3                	mov    %eax,%ebx
c01026ae:	29 d3                	sub    %edx,%ebx
c01026b0:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c01026b6:	89 d0                	mov    %edx,%eax
c01026b8:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c01026be:	39 d3                	cmp    %edx,%ebx
c01026c0:	0f 4f da             	cmovg  %edx,%ebx
c01026c3:	85 db                	test   %ebx,%ebx
c01026c5:	7e 28                	jle    c01026ef <_svfprintf_r+0x109f>
c01026c7:	89 07                	mov    %eax,(%edi)
c01026c9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01026cf:	01 d9                	add    %ebx,%ecx
c01026d1:	89 5f 04             	mov    %ebx,0x4(%edi)
c01026d4:	83 c7 08             	add    $0x8,%edi
c01026d7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01026dd:	83 c0 01             	add    $0x1,%eax
c01026e0:	83 f8 07             	cmp    $0x7,%eax
c01026e3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01026e9:	0f 8f 58 09 00 00    	jg     c0103047 <_svfprintf_r+0x19f7>
c01026ef:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c01026f5:	31 c0                	xor    %eax,%eax
c01026f7:	85 db                	test   %ebx,%ebx
c01026f9:	0f 49 c3             	cmovns %ebx,%eax
c01026fc:	29 c6                	sub    %eax,%esi
c01026fe:	85 f6                	test   %esi,%esi
c0102700:	0f 8e 40 02 00 00    	jle    c0102946 <_svfprintf_r+0x12f6>
c0102706:	83 fe 10             	cmp    $0x10,%esi
c0102709:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010270f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102715:	7f 15                	jg     c010272c <_svfprintf_r+0x10dc>
c0102717:	e9 db 01 00 00       	jmp    c01028f7 <_svfprintf_r+0x12a7>
c010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102720:	83 ee 10             	sub    $0x10,%esi
c0102723:	83 fe 10             	cmp    $0x10,%esi
c0102726:	0f 8e cb 01 00 00    	jle    c01028f7 <_svfprintf_r+0x12a7>
c010272c:	83 c0 01             	add    $0x1,%eax
c010272f:	83 c1 10             	add    $0x10,%ecx
c0102732:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102738:	83 c7 08             	add    $0x8,%edi
c010273b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102742:	83 f8 07             	cmp    $0x7,%eax
c0102745:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010274b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102751:	7e cd                	jle    c0102720 <_svfprintf_r+0x10d0>
c0102753:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102756:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010275a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010275e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102761:	89 04 24             	mov    %eax,(%esp)
c0102764:	e8 67 3a 00 00       	call   c01061d0 <__ssprint_r>
c0102769:	85 c0                	test   %eax,%eax
c010276b:	0f 85 af f0 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102771:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102777:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010277a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102780:	eb 9e                	jmp    c0102720 <_svfprintf_r+0x10d0>
c0102782:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102785:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c010278a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102790:	89 c7                	mov    %eax,%edi
c0102792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102798:	89 c8                	mov    %ecx,%eax
c010279a:	83 ef 01             	sub    $0x1,%edi
c010279d:	f7 e6                	mul    %esi
c010279f:	c1 ea 03             	shr    $0x3,%edx
c01027a2:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01027a5:	01 c0                	add    %eax,%eax
c01027a7:	29 c1                	sub    %eax,%ecx
c01027a9:	83 c1 30             	add    $0x30,%ecx
c01027ac:	85 d2                	test   %edx,%edx
c01027ae:	88 0f                	mov    %cl,(%edi)
c01027b0:	89 d1                	mov    %edx,%ecx
c01027b2:	75 e4                	jne    c0102798 <_svfprintf_r+0x1148>
c01027b4:	89 fa                	mov    %edi,%edx
c01027b6:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c01027bc:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c01027c2:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01027c5:	29 d0                	sub    %edx,%eax
c01027c7:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01027cd:	e9 d6 f2 ff ff       	jmp    c0101aa8 <_svfprintf_r+0x458>
c01027d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01027d8:	83 f9 09             	cmp    $0x9,%ecx
c01027db:	77 a5                	ja     c0102782 <_svfprintf_r+0x1132>
c01027dd:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c01027e3:	83 c1 30             	add    $0x30,%ecx
c01027e6:	88 4d a7             	mov    %cl,-0x59(%ebp)
c01027e9:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01027ef:	8d 45 a7             	lea    -0x59(%ebp),%eax
c01027f2:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01027f8:	e9 ab f2 ff ff       	jmp    c0101aa8 <_svfprintf_r+0x458>
c01027fd:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102803:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102807:	8b 45 0c             	mov    0xc(%ebp),%eax
c010280a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010280e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102811:	89 04 24             	mov    %eax,(%esp)
c0102814:	e8 b7 39 00 00       	call   c01061d0 <__ssprint_r>
c0102819:	85 c0                	test   %eax,%eax
c010281b:	0f 85 ff ef ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102821:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102828:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010282b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102831:	e9 18 f7 ff ff       	jmp    c0101f4e <_svfprintf_r+0x8fe>
c0102836:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c010283c:	8d 73 ff             	lea    -0x1(%ebx),%esi
c010283f:	85 f6                	test   %esi,%esi
c0102841:	0f 8e f0 fc ff ff    	jle    c0102537 <_svfprintf_r+0xee7>
c0102847:	83 fe 10             	cmp    $0x10,%esi
c010284a:	7e 70                	jle    c01028bc <_svfprintf_r+0x126c>
c010284c:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102852:	eb 0c                	jmp    c0102860 <_svfprintf_r+0x1210>
c0102854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102858:	83 ee 10             	sub    $0x10,%esi
c010285b:	83 fe 10             	cmp    $0x10,%esi
c010285e:	7e 5c                	jle    c01028bc <_svfprintf_r+0x126c>
c0102860:	83 c0 01             	add    $0x1,%eax
c0102863:	83 c2 10             	add    $0x10,%edx
c0102866:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c010286c:	83 c7 08             	add    $0x8,%edi
c010286f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102876:	83 f8 07             	cmp    $0x7,%eax
c0102879:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010287f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102885:	7e d1                	jle    c0102858 <_svfprintf_r+0x1208>
c0102887:	8b 45 0c             	mov    0xc(%ebp),%eax
c010288a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010288e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102892:	8b 45 08             	mov    0x8(%ebp),%eax
c0102895:	89 04 24             	mov    %eax,(%esp)
c0102898:	e8 33 39 00 00       	call   c01061d0 <__ssprint_r>
c010289d:	85 c0                	test   %eax,%eax
c010289f:	0f 85 7b ef ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01028a5:	83 ee 10             	sub    $0x10,%esi
c01028a8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01028ae:	83 fe 10             	cmp    $0x10,%esi
c01028b1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01028b7:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01028ba:	7f a4                	jg     c0102860 <_svfprintf_r+0x1210>
c01028bc:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c01028c2:	01 f2                	add    %esi,%edx
c01028c4:	89 77 04             	mov    %esi,0x4(%edi)
c01028c7:	e9 50 fc ff ff       	jmp    c010251c <_svfprintf_r+0xecc>
c01028cc:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c01028d2:	01 f1                	add    %esi,%ecx
c01028d4:	89 77 04             	mov    %esi,0x4(%edi)
c01028d7:	e9 6f fc ff ff       	jmp    c010254b <_svfprintf_r+0xefb>
c01028dc:	8b 45 14             	mov    0x14(%ebp),%eax
c01028df:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c01028e5:	8b 00                	mov    (%eax),%eax
c01028e7:	89 10                	mov    %edx,(%eax)
c01028e9:	8b 45 14             	mov    0x14(%ebp),%eax
c01028ec:	83 c0 04             	add    $0x4,%eax
c01028ef:	89 45 14             	mov    %eax,0x14(%ebp)
c01028f2:	e9 f4 ed ff ff       	jmp    c01016eb <_svfprintf_r+0x9b>
c01028f7:	83 c0 01             	add    $0x1,%eax
c01028fa:	01 f1                	add    %esi,%ecx
c01028fc:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102902:	83 c7 08             	add    $0x8,%edi
c0102905:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102908:	83 f8 07             	cmp    $0x7,%eax
c010290b:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102911:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102917:	7e 2d                	jle    c0102946 <_svfprintf_r+0x12f6>
c0102919:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010291f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102923:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102926:	89 44 24 04          	mov    %eax,0x4(%esp)
c010292a:	8b 45 08             	mov    0x8(%ebp),%eax
c010292d:	89 04 24             	mov    %eax,(%esp)
c0102930:	e8 9b 38 00 00       	call   c01061d0 <__ssprint_r>
c0102935:	85 c0                	test   %eax,%eax
c0102937:	0f 85 e3 ee ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010293d:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102943:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102946:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010294c:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0102952:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0102958:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c010295e:	89 c6                	mov    %eax,%esi
c0102960:	7c 0d                	jl     c010296f <_svfprintf_r+0x131f>
c0102962:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102969:	0f 84 5e 05 00 00    	je     c0102ecd <_svfprintf_r+0x187d>
c010296f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102975:	89 07                	mov    %eax,(%edi)
c0102977:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010297d:	01 c1                	add    %eax,%ecx
c010297f:	89 47 04             	mov    %eax,0x4(%edi)
c0102982:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102988:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010298e:	83 c0 01             	add    $0x1,%eax
c0102991:	83 f8 07             	cmp    $0x7,%eax
c0102994:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010299a:	0f 8f d9 06 00 00    	jg     c0103079 <_svfprintf_r+0x1a29>
c01029a0:	83 c7 08             	add    $0x8,%edi
c01029a3:	89 d0                	mov    %edx,%eax
c01029a5:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c01029ab:	89 f2                	mov    %esi,%edx
c01029ad:	29 f3                	sub    %esi,%ebx
c01029af:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c01029b5:	29 c6                	sub    %eax,%esi
c01029b7:	39 de                	cmp    %ebx,%esi
c01029b9:	0f 4e de             	cmovle %esi,%ebx
c01029bc:	85 db                	test   %ebx,%ebx
c01029be:	7e 29                	jle    c01029e9 <_svfprintf_r+0x1399>
c01029c0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01029c6:	01 d9                	add    %ebx,%ecx
c01029c8:	83 c7 08             	add    $0x8,%edi
c01029cb:	89 57 f8             	mov    %edx,-0x8(%edi)
c01029ce:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01029d1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01029d7:	83 c0 01             	add    $0x1,%eax
c01029da:	83 f8 07             	cmp    $0x7,%eax
c01029dd:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01029e3:	0f 8f c8 06 00 00    	jg     c01030b1 <_svfprintf_r+0x1a61>
c01029e9:	31 c0                	xor    %eax,%eax
c01029eb:	85 db                	test   %ebx,%ebx
c01029ed:	0f 49 c3             	cmovns %ebx,%eax
c01029f0:	29 c6                	sub    %eax,%esi
c01029f2:	85 f6                	test   %esi,%esi
c01029f4:	0f 8e 02 f7 ff ff    	jle    c01020fc <_svfprintf_r+0xaac>
c01029fa:	83 fe 10             	cmp    $0x10,%esi
c01029fd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a03:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102a09:	7f 11                	jg     c0102a1c <_svfprintf_r+0x13cc>
c0102a0b:	e9 bc fe ff ff       	jmp    c01028cc <_svfprintf_r+0x127c>
c0102a10:	83 ee 10             	sub    $0x10,%esi
c0102a13:	83 fe 10             	cmp    $0x10,%esi
c0102a16:	0f 8e b0 fe ff ff    	jle    c01028cc <_svfprintf_r+0x127c>
c0102a1c:	83 c0 01             	add    $0x1,%eax
c0102a1f:	83 c1 10             	add    $0x10,%ecx
c0102a22:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102a28:	83 c7 08             	add    $0x8,%edi
c0102a2b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102a32:	83 f8 07             	cmp    $0x7,%eax
c0102a35:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a3b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a41:	7e cd                	jle    c0102a10 <_svfprintf_r+0x13c0>
c0102a43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a46:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a51:	89 04 24             	mov    %eax,(%esp)
c0102a54:	e8 77 37 00 00       	call   c01061d0 <__ssprint_r>
c0102a59:	85 c0                	test   %eax,%eax
c0102a5b:	0f 85 bf ed ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102a61:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102a67:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102a6a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a70:	eb 9e                	jmp    c0102a10 <_svfprintf_r+0x13c0>
c0102a72:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102a79:	0f 85 14 fa ff ff    	jne    c0102493 <_svfprintf_r+0xe43>
c0102a7f:	89 07                	mov    %eax,(%edi)
c0102a81:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a87:	8d 51 01             	lea    0x1(%ecx),%edx
c0102a8a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102a91:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102a97:	83 c0 01             	add    $0x1,%eax
c0102a9a:	83 f8 07             	cmp    $0x7,%eax
c0102a9d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102aa3:	0f 8e 8b fa ff ff    	jle    c0102534 <_svfprintf_r+0xee4>
c0102aa9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102aaf:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ab3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ab6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102aba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102abd:	89 04 24             	mov    %eax,(%esp)
c0102ac0:	e8 0b 37 00 00       	call   c01061d0 <__ssprint_r>
c0102ac5:	85 c0                	test   %eax,%eax
c0102ac7:	0f 85 53 ed ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102acd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102ad3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ad6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102adc:	e9 56 fa ff ff       	jmp    c0102537 <_svfprintf_r+0xee7>
c0102ae1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ae7:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102aeb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102aee:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102af2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102af5:	89 04 24             	mov    %eax,(%esp)
c0102af8:	e8 d3 36 00 00       	call   c01061d0 <__ssprint_r>
c0102afd:	85 c0                	test   %eax,%eax
c0102aff:	0f 85 1b ed ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102b05:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102b0b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102b0e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b14:	e9 d6 f9 ff ff       	jmp    c01024ef <_svfprintf_r+0xe9f>
c0102b19:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102b1f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b23:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b26:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b2d:	89 04 24             	mov    %eax,(%esp)
c0102b30:	e8 9b 36 00 00       	call   c01061d0 <__ssprint_r>
c0102b35:	85 c0                	test   %eax,%eax
c0102b37:	0f 85 e3 ec ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102b3d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102b43:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102b46:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b4c:	e9 6f f9 ff ff       	jmp    c01024c0 <_svfprintf_r+0xe70>
c0102b51:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102b57:	dd 1c 24             	fstpl  (%esp)
c0102b5a:	e8 11 35 00 00       	call   c0106070 <__fpclassifyd>
c0102b5f:	85 c0                	test   %eax,%eax
c0102b61:	0f 85 a3 01 00 00    	jne    c0102d0a <_svfprintf_r+0x16ba>
c0102b67:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0102b6e:	ba 8a 81 10 c0       	mov    $0xc010818a,%edx
c0102b73:	b8 8e 81 10 c0       	mov    $0xc010818e,%eax
c0102b78:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102b7f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0102b86:	00 00 00 
c0102b89:	0f 4e c2             	cmovle %edx,%eax
c0102b8c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102b92:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0102b99:	ff ff ff 
c0102b9c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0102ba3:	00 00 00 
c0102ba6:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102bad:	00 00 00 
c0102bb0:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0102bb7:	00 00 00 
c0102bba:	e9 29 ed ff ff       	jmp    c01018e8 <_svfprintf_r+0x298>
c0102bbf:	dd 00                	fldl   (%eax)
c0102bc1:	83 c0 08             	add    $0x8,%eax
c0102bc4:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102bca:	89 45 14             	mov    %eax,0x14(%ebp)
c0102bcd:	e9 e6 ef ff ff       	jmp    c0101bb8 <_svfprintf_r+0x568>
c0102bd2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102bd8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102be3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102be6:	89 04 24             	mov    %eax,(%esp)
c0102be9:	e8 e2 35 00 00       	call   c01061d0 <__ssprint_r>
c0102bee:	85 c0                	test   %eax,%eax
c0102bf0:	0f 85 2a ec ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102bf6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102bfc:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102bff:	e9 6b f6 ff ff       	jmp    c010226f <_svfprintf_r+0xc1f>
c0102c04:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c0a:	83 c1 01             	add    $0x1,%ecx
c0102c0d:	83 c7 08             	add    $0x8,%edi
c0102c10:	c7 47 f8 bb 81 10 c0 	movl   $0xc01081bb,-0x8(%edi)
c0102c17:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102c1e:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102c24:	83 c0 01             	add    $0x1,%eax
c0102c27:	83 f8 07             	cmp    $0x7,%eax
c0102c2a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c30:	0f 8f ef 02 00 00    	jg     c0102f25 <_svfprintf_r+0x18d5>
c0102c36:	85 db                	test   %ebx,%ebx
c0102c38:	75 17                	jne    c0102c51 <_svfprintf_r+0x1601>
c0102c3a:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c0102c40:	85 d2                	test   %edx,%edx
c0102c42:	75 0d                	jne    c0102c51 <_svfprintf_r+0x1601>
c0102c44:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102c4b:	0f 84 ab f4 ff ff    	je     c01020fc <_svfprintf_r+0xaac>
c0102c51:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102c57:	83 c7 08             	add    $0x8,%edi
c0102c5a:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102c5d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102c63:	89 47 fc             	mov    %eax,-0x4(%edi)
c0102c66:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0102c69:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c6f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c75:	83 c0 01             	add    $0x1,%eax
c0102c78:	83 f8 07             	cmp    $0x7,%eax
c0102c7b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c81:	0f 8f 60 03 00 00    	jg     c0102fe7 <_svfprintf_r+0x1997>
c0102c87:	f7 db                	neg    %ebx
c0102c89:	85 db                	test   %ebx,%ebx
c0102c8b:	0f 8e 21 03 00 00    	jle    c0102fb2 <_svfprintf_r+0x1962>
c0102c91:	83 fb 10             	cmp    $0x10,%ebx
c0102c94:	0f 8e c3 02 00 00    	jle    c0102f5d <_svfprintf_r+0x190d>
c0102c9a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0102ca0:	eb 12                	jmp    c0102cb4 <_svfprintf_r+0x1664>
c0102ca2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102ca8:	83 eb 10             	sub    $0x10,%ebx
c0102cab:	83 fb 10             	cmp    $0x10,%ebx
c0102cae:	0f 8e a9 02 00 00    	jle    c0102f5d <_svfprintf_r+0x190d>
c0102cb4:	83 c0 01             	add    $0x1,%eax
c0102cb7:	83 c2 10             	add    $0x10,%edx
c0102cba:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102cc0:	83 c7 08             	add    $0x8,%edi
c0102cc3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102cca:	83 f8 07             	cmp    $0x7,%eax
c0102ccd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102cd3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102cd9:	7e cd                	jle    c0102ca8 <_svfprintf_r+0x1658>
c0102cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cde:	89 74 24 08          	mov    %esi,0x8(%esp)
c0102ce2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ce9:	89 04 24             	mov    %eax,(%esp)
c0102cec:	e8 df 34 00 00       	call   c01061d0 <__ssprint_r>
c0102cf1:	85 c0                	test   %eax,%eax
c0102cf3:	0f 85 27 eb ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102cf9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102cff:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102d02:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102d08:	eb 9e                	jmp    c0102ca8 <_svfprintf_r+0x1658>
c0102d0a:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c0102d10:	83 e3 df             	and    $0xffffffdf,%ebx
c0102d13:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c0102d1a:	0f 84 05 03 00 00    	je     c0103025 <_svfprintf_r+0x19d5>
c0102d20:	83 fb 47             	cmp    $0x47,%ebx
c0102d23:	75 16                	jne    c0102d3b <_svfprintf_r+0x16eb>
c0102d25:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0102d2b:	b8 01 00 00 00       	mov    $0x1,%eax
c0102d30:	85 d2                	test   %edx,%edx
c0102d32:	0f 45 c2             	cmovne %edx,%eax
c0102d35:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102d3b:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102d41:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102d47:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c0102d4d:	80 cc 01             	or     $0x1,%ah
c0102d50:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c0102d56:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0102d5c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c0102d63:	85 c0                	test   %eax,%eax
c0102d65:	0f 88 ba 05 00 00    	js     c0103325 <_svfprintf_r+0x1cd5>
c0102d6b:	83 fb 46             	cmp    $0x46,%ebx
c0102d6e:	0f 94 c0             	sete   %al
c0102d71:	89 c6                	mov    %eax,%esi
c0102d73:	0f 84 d4 03 00 00    	je     c010314d <_svfprintf_r+0x1afd>
c0102d79:	83 fb 45             	cmp    $0x45,%ebx
c0102d7c:	0f 85 99 05 00 00    	jne    c010331b <_svfprintf_r+0x1ccb>
c0102d82:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0102d88:	dd 54 24 04          	fstl   0x4(%esp)
c0102d8c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0102d93:	00 
c0102d94:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0102d9a:	8d 70 01             	lea    0x1(%eax),%esi
c0102d9d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0102da3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0102da7:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0102dad:	89 44 24 18          	mov    %eax,0x18(%esp)
c0102db1:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0102db7:	89 44 24 14          	mov    %eax,0x14(%esp)
c0102dbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dbe:	89 74 24 10          	mov    %esi,0x10(%esp)
c0102dc2:	89 04 24             	mov    %eax,(%esp)
c0102dc5:	e8 56 09 00 00       	call   c0103720 <_dtoa_r>
c0102dca:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102dd0:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0102dd3:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0102dd9:	d9 ee                	fldz   
c0102ddb:	d9 c9                	fxch   %st(1)
c0102ddd:	df e9                	fucomip %st(1),%st
c0102ddf:	dd d8                	fstp   %st(0)
c0102de1:	0f 8a fd 00 00 00    	jp     c0102ee4 <_svfprintf_r+0x1894>
c0102de7:	89 c8                	mov    %ecx,%eax
c0102de9:	0f 85 f5 00 00 00    	jne    c0102ee4 <_svfprintf_r+0x1894>
c0102def:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102df5:	83 fb 47             	cmp    $0x47,%ebx
c0102df8:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0102dfe:	0f 84 1e 04 00 00    	je     c0103222 <_svfprintf_r+0x1bd2>
c0102e04:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c0102e0b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0102e11:	0f 8e 65 04 00 00    	jle    c010327c <_svfprintf_r+0x1c2c>
c0102e17:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c0102e1e:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c0102e24:	0f 84 3c 05 00 00    	je     c0103366 <_svfprintf_r+0x1d16>
c0102e2a:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c0102e30:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c0102e36:	0f 8f f7 04 00 00    	jg     c0103333 <_svfprintf_r+0x1ce3>
c0102e3c:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102e42:	83 e0 01             	and    $0x1,%eax
c0102e45:	0f 85 e2 05 00 00    	jne    c010342d <_svfprintf_r+0x1ddd>
c0102e4b:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102e51:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0102e58:	00 00 00 
c0102e5b:	85 d2                	test   %edx,%edx
c0102e5d:	0f 49 c2             	cmovns %edx,%eax
c0102e60:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102e66:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c0102e6d:	0f 85 68 03 00 00    	jne    c01031db <_svfprintf_r+0x1b8b>
c0102e73:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102e79:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0102e7f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102e86:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102e8d:	00 00 00 
c0102e90:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0102e96:	e9 4d ea ff ff       	jmp    c01018e8 <_svfprintf_r+0x298>
c0102e9b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ea1:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ea8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102eac:	8b 45 08             	mov    0x8(%ebp),%eax
c0102eaf:	89 04 24             	mov    %eax,(%esp)
c0102eb2:	e8 19 33 00 00       	call   c01061d0 <__ssprint_r>
c0102eb7:	85 c0                	test   %eax,%eax
c0102eb9:	0f 85 61 e9 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102ebf:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102ec5:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ec8:	e9 f2 f3 ff ff       	jmp    c01022bf <_svfprintf_r+0xc6f>
c0102ecd:	89 d0                	mov    %edx,%eax
c0102ecf:	e9 d1 fa ff ff       	jmp    c01029a5 <_svfprintf_r+0x1355>
c0102ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102ed8:	8d 50 01             	lea    0x1(%eax),%edx
c0102edb:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0102ee1:	c6 00 30             	movb   $0x30,(%eax)
c0102ee4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0102eea:	39 c1                	cmp    %eax,%ecx
c0102eec:	77 ea                	ja     c0102ed8 <_svfprintf_r+0x1888>
c0102eee:	e9 fc fe ff ff       	jmp    c0102def <_svfprintf_r+0x179f>
c0102ef3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ef6:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0102efd:	00 
c0102efe:	89 04 24             	mov    %eax,(%esp)
c0102f01:	e8 4a 1b 00 00       	call   c0104a50 <_malloc_r>
c0102f06:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102f09:	85 c0                	test   %eax,%eax
c0102f0b:	89 02                	mov    %eax,(%edx)
c0102f0d:	89 42 10             	mov    %eax,0x10(%edx)
c0102f10:	0f 84 15 06 00 00    	je     c010352b <_svfprintf_r+0x1edb>
c0102f16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f19:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0102f20:	e9 6c e7 ff ff       	jmp    c0101691 <_svfprintf_r+0x41>
c0102f25:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102f2b:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f32:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f36:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f39:	89 04 24             	mov    %eax,(%esp)
c0102f3c:	e8 8f 32 00 00       	call   c01061d0 <__ssprint_r>
c0102f41:	85 c0                	test   %eax,%eax
c0102f43:	0f 85 d7 e8 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102f49:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102f4f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f52:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102f58:	e9 d9 fc ff ff       	jmp    c0102c36 <_svfprintf_r+0x15e6>
c0102f5d:	83 c0 01             	add    $0x1,%eax
c0102f60:	01 da                	add    %ebx,%edx
c0102f62:	c7 07 24 83 10 c0    	movl   $0xc0108324,(%edi)
c0102f68:	83 c7 08             	add    $0x8,%edi
c0102f6b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102f6e:	83 f8 07             	cmp    $0x7,%eax
c0102f71:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102f77:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f7d:	7e 33                	jle    c0102fb2 <_svfprintf_r+0x1962>
c0102f7f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102f85:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f89:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f8c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f93:	89 04 24             	mov    %eax,(%esp)
c0102f96:	e8 35 32 00 00       	call   c01061d0 <__ssprint_r>
c0102f9b:	85 c0                	test   %eax,%eax
c0102f9d:	0f 85 7d e8 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c0102fa3:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102fa9:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102fac:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102fb2:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0102fb8:	83 c0 01             	add    $0x1,%eax
c0102fbb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102fc1:	89 1f                	mov    %ebx,(%edi)
c0102fc3:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102fc9:	01 da                	add    %ebx,%edx
c0102fcb:	83 f8 07             	cmp    $0x7,%eax
c0102fce:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102fd1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102fd7:	0f 8f 86 f5 ff ff    	jg     c0102563 <_svfprintf_r+0xf13>
c0102fdd:	83 c7 08             	add    $0x8,%edi
c0102fe0:	89 d1                	mov    %edx,%ecx
c0102fe2:	e9 15 f1 ff ff       	jmp    c01020fc <_svfprintf_r+0xaac>
c0102fe7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102fed:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ff1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ff4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ffb:	89 04 24             	mov    %eax,(%esp)
c0102ffe:	e8 cd 31 00 00       	call   c01061d0 <__ssprint_r>
c0103003:	85 c0                	test   %eax,%eax
c0103005:	0f 85 15 e8 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010300b:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0103011:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103014:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010301a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103020:	e9 62 fc ff ff       	jmp    c0102c87 <_svfprintf_r+0x1637>
c0103025:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c010302c:	00 00 00 
c010302f:	e9 07 fd ff ff       	jmp    c0102d3b <_svfprintf_r+0x16eb>
c0103034:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010303a:	89 04 24             	mov    %eax,(%esp)
c010303d:	e8 0e 31 00 00       	call   c0106150 <strlen>
c0103042:	e9 6a e8 ff ff       	jmp    c01018b1 <_svfprintf_r+0x261>
c0103047:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010304d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103051:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103054:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103058:	8b 45 08             	mov    0x8(%ebp),%eax
c010305b:	89 04 24             	mov    %eax,(%esp)
c010305e:	e8 6d 31 00 00       	call   c01061d0 <__ssprint_r>
c0103063:	85 c0                	test   %eax,%eax
c0103065:	0f 85 b5 e7 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010306b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103071:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103074:	e9 76 f6 ff ff       	jmp    c01026ef <_svfprintf_r+0x109f>
c0103079:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010307f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103083:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103086:	89 44 24 04          	mov    %eax,0x4(%esp)
c010308a:	8b 45 08             	mov    0x8(%ebp),%eax
c010308d:	89 04 24             	mov    %eax,(%esp)
c0103090:	e8 3b 31 00 00       	call   c01061d0 <__ssprint_r>
c0103095:	85 c0                	test   %eax,%eax
c0103097:	0f 85 83 e7 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c010309d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01030a3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030a6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030ac:	e9 f4 f8 ff ff       	jmp    c01029a5 <_svfprintf_r+0x1355>
c01030b1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01030b7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030be:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01030c5:	89 04 24             	mov    %eax,(%esp)
c01030c8:	e8 03 31 00 00       	call   c01061d0 <__ssprint_r>
c01030cd:	85 c0                	test   %eax,%eax
c01030cf:	0f 85 4b e7 ff ff    	jne    c0101820 <_svfprintf_r+0x1d0>
c01030d5:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c01030db:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030de:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c01030e4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030ea:	e9 fa f8 ff ff       	jmp    c01029e9 <_svfprintf_r+0x1399>
c01030ef:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01030f5:	b0 06                	mov    $0x6,%al
c01030f7:	89 75 14             	mov    %esi,0x14(%ebp)
c01030fa:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103101:	00 00 00 
c0103104:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010310b:	00 00 00 
c010310e:	83 fa 06             	cmp    $0x6,%edx
c0103111:	0f 46 c2             	cmovbe %edx,%eax
c0103114:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c010311a:	85 c0                	test   %eax,%eax
c010311c:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103122:	c7 85 28 ff ff ff b4 	movl   $0xc01081b4,-0xd8(%ebp)
c0103129:	81 10 c0 
c010312c:	0f 49 d0             	cmovns %eax,%edx
c010312f:	31 db                	xor    %ebx,%ebx
c0103131:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c0103137:	e9 b7 e7 ff ff       	jmp    c01018f3 <_svfprintf_r+0x2a3>
c010313c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0103143:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0103148:	e9 9d ea ff ff       	jmp    c0101bea <_svfprintf_r+0x59a>
c010314d:	ba 03 00 00 00       	mov    $0x3,%edx
c0103152:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103158:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c010315c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0103162:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103166:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c010316c:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103170:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103176:	dd 54 24 04          	fstl   0x4(%esp)
c010317a:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010317e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0103184:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103188:	8b 45 08             	mov    0x8(%ebp),%eax
c010318b:	89 04 24             	mov    %eax,(%esp)
c010318e:	e8 8d 05 00 00       	call   c0103720 <_dtoa_r>
c0103193:	83 fb 47             	cmp    $0x47,%ebx
c0103196:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010319c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c01031a2:	75 09                	jne    c01031ad <_svfprintf_r+0x1b5d>
c01031a4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01031ab:	74 5b                	je     c0103208 <_svfprintf_r+0x1bb8>
c01031ad:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01031b3:	89 f0                	mov    %esi,%eax
c01031b5:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c01031bb:	01 d1                	add    %edx,%ecx
c01031bd:	84 c0                	test   %al,%al
c01031bf:	0f 84 14 fc ff ff    	je     c0102dd9 <_svfprintf_r+0x1789>
c01031c5:	80 3a 30             	cmpb   $0x30,(%edx)
c01031c8:	0f 84 37 02 00 00    	je     c0103405 <_svfprintf_r+0x1db5>
c01031ce:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01031d4:	01 c1                	add    %eax,%ecx
c01031d6:	e9 fe fb ff ff       	jmp    c0102dd9 <_svfprintf_r+0x1789>
c01031db:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01031e1:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c01031e7:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01031ec:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01031f3:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01031fa:	00 00 00 
c01031fd:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0103203:	e9 e4 e6 ff ff       	jmp    c01018ec <_svfprintf_r+0x29c>
c0103208:	dd d8                	fstp   %st(0)
c010320a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103210:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0103216:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010321c:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c0103222:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103228:	83 f8 fd             	cmp    $0xfffffffd,%eax
c010322b:	7c 48                	jl     c0103275 <_svfprintf_r+0x1c25>
c010322d:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c0103233:	7c 40                	jl     c0103275 <_svfprintf_r+0x1c25>
c0103235:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c010323b:	e9 ea fb ff ff       	jmp    c0102e2a <_svfprintf_r+0x17da>
c0103240:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103246:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010324d:	89 75 14             	mov    %esi,0x14(%ebp)
c0103250:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103257:	00 00 00 
c010325a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103260:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103266:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010326d:	00 00 00 
c0103270:	e9 73 e6 ff ff       	jmp    c01018e8 <_svfprintf_r+0x298>
c0103275:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c010327c:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010327f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c0103286:	85 c9                	test   %ecx,%ecx
c0103288:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010328e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c0103294:	0f 88 2c 02 00 00    	js     c01034c6 <_svfprintf_r+0x1e76>
c010329a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c01032a1:	83 f9 09             	cmp    $0x9,%ecx
c01032a4:	0f 8f ea 00 00 00    	jg     c0103394 <_svfprintf_r+0x1d44>
c01032aa:	83 c1 30             	add    $0x30,%ecx
c01032ad:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c01032b4:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c01032ba:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c01032c0:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c01032c6:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c01032cc:	29 d0                	sub    %edx,%eax
c01032ce:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c01032d4:	89 da                	mov    %ebx,%edx
c01032d6:	01 c2                	add    %eax,%edx
c01032d8:	83 fb 01             	cmp    $0x1,%ebx
c01032db:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01032e1:	0f 8e 21 02 00 00    	jle    c0103508 <_svfprintf_r+0x1eb8>
c01032e7:	31 c0                	xor    %eax,%eax
c01032e9:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c01032f0:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c01032f7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01032fe:	00 00 00 
c0103301:	e9 60 fb ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c0103306:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c010330c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103313:	00 00 00 
c0103316:	e9 68 e4 ff ff       	jmp    c0101783 <_svfprintf_r+0x133>
c010331b:	ba 02 00 00 00       	mov    $0x2,%edx
c0103320:	e9 2d fe ff ff       	jmp    c0103152 <_svfprintf_r+0x1b02>
c0103325:	d9 e0                	fchs   
c0103327:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c010332e:	e9 38 fa ff ff       	jmp    c0102d6b <_svfprintf_r+0x171b>
c0103333:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c0103339:	ba 01 00 00 00       	mov    $0x1,%edx
c010333e:	85 c9                	test   %ecx,%ecx
c0103340:	0f 8e 5a 01 00 00    	jle    c01034a0 <_svfprintf_r+0x1e50>
c0103346:	31 c0                	xor    %eax,%eax
c0103348:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c010334e:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103355:	00 00 00 
c0103358:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010335e:	0f 49 c2             	cmovns %edx,%eax
c0103361:	e9 00 fb ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c0103366:	85 c0                	test   %eax,%eax
c0103368:	0f 8e 06 01 00 00    	jle    c0103474 <_svfprintf_r+0x1e24>
c010336e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0103374:	85 f6                	test   %esi,%esi
c0103376:	0f 85 d4 00 00 00    	jne    c0103450 <_svfprintf_r+0x1e00>
c010337c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103383:	0f 85 c7 00 00 00    	jne    c0103450 <_svfprintf_r+0x1e00>
c0103389:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010338f:	e9 d2 fa ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c0103394:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c010339a:	89 f3                	mov    %esi,%ebx
c010339c:	b8 67 66 66 66       	mov    $0x66666667,%eax
c01033a1:	83 eb 01             	sub    $0x1,%ebx
c01033a4:	f7 e9                	imul   %ecx
c01033a6:	89 c8                	mov    %ecx,%eax
c01033a8:	c1 f8 1f             	sar    $0x1f,%eax
c01033ab:	c1 fa 02             	sar    $0x2,%edx
c01033ae:	29 c2                	sub    %eax,%edx
c01033b0:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01033b3:	01 c0                	add    %eax,%eax
c01033b5:	29 c1                	sub    %eax,%ecx
c01033b7:	83 fa 09             	cmp    $0x9,%edx
c01033ba:	8d 41 30             	lea    0x30(%ecx),%eax
c01033bd:	89 d1                	mov    %edx,%ecx
c01033bf:	88 03                	mov    %al,(%ebx)
c01033c1:	7f d9                	jg     c010339c <_svfprintf_r+0x1d4c>
c01033c3:	8d 43 ff             	lea    -0x1(%ebx),%eax
c01033c6:	83 c1 30             	add    $0x30,%ecx
c01033c9:	39 f0                	cmp    %esi,%eax
c01033cb:	88 4b ff             	mov    %cl,-0x1(%ebx)
c01033ce:	0f 83 6a 01 00 00    	jae    c010353e <_svfprintf_r+0x1eee>
c01033d4:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c01033da:	eb 07                	jmp    c01033e3 <_svfprintf_r+0x1d93>
c01033dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01033e0:	0f b6 08             	movzbl (%eax),%ecx
c01033e3:	83 c0 01             	add    $0x1,%eax
c01033e6:	83 c2 01             	add    $0x1,%edx
c01033e9:	39 f0                	cmp    %esi,%eax
c01033eb:	88 4a ff             	mov    %cl,-0x1(%edx)
c01033ee:	75 f0                	jne    c01033e0 <_svfprintf_r+0x1d90>
c01033f0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01033f6:	29 d8                	sub    %ebx,%eax
c01033f8:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c01033fe:	01 d0                	add    %edx,%eax
c0103400:	e9 bb fe ff ff       	jmp    c01032c0 <_svfprintf_r+0x1c70>
c0103405:	d9 ee                	fldz   
c0103407:	d9 c9                	fxch   %st(1)
c0103409:	db e9                	fucomi %st(1),%st
c010340b:	dd d9                	fstp   %st(1)
c010340d:	7a 06                	jp     c0103415 <_svfprintf_r+0x1dc5>
c010340f:	0f 84 b9 fd ff ff    	je     c01031ce <_svfprintf_r+0x1b7e>
c0103415:	b8 01 00 00 00       	mov    $0x1,%eax
c010341a:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c0103420:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c0103426:	01 c1                	add    %eax,%ecx
c0103428:	e9 ac f9 ff ff       	jmp    c0102dd9 <_svfprintf_r+0x1789>
c010342d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103433:	31 c0                	xor    %eax,%eax
c0103435:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c010343c:	00 00 00 
c010343f:	83 c2 01             	add    $0x1,%edx
c0103442:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103448:	0f 49 c2             	cmovns %edx,%eax
c010344b:	e9 16 fa ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c0103450:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103456:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c010345c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0103460:	89 c2                	mov    %eax,%edx
c0103462:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103468:	31 c0                	xor    %eax,%eax
c010346a:	85 d2                	test   %edx,%edx
c010346c:	0f 49 c2             	cmovns %edx,%eax
c010346f:	e9 f2 f9 ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c0103474:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010347a:	85 db                	test   %ebx,%ebx
c010347c:	75 2f                	jne    c01034ad <_svfprintf_r+0x1e5d>
c010347e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103485:	75 26                	jne    c01034ad <_svfprintf_r+0x1e5d>
c0103487:	b8 01 00 00 00       	mov    $0x1,%eax
c010348c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0103493:	00 00 00 
c0103496:	e9 cb f9 ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c010349b:	90                   	nop
c010349c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01034a0:	b2 02                	mov    $0x2,%dl
c01034a2:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c01034a8:	e9 99 fe ff ff       	jmp    c0103346 <_svfprintf_r+0x1cf6>
c01034ad:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01034b3:	31 c0                	xor    %eax,%eax
c01034b5:	83 c2 02             	add    $0x2,%edx
c01034b8:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01034be:	0f 49 c2             	cmovns %edx,%eax
c01034c1:	e9 a0 f9 ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c01034c6:	f7 d9                	neg    %ecx
c01034c8:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c01034cf:	e9 cd fd ff ff       	jmp    c01032a1 <_svfprintf_r+0x1c51>
c01034d4:	8b 55 14             	mov    0x14(%ebp),%edx
c01034d7:	8b 45 14             	mov    0x14(%ebp),%eax
c01034da:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01034e0:	8b 12                	mov    (%edx),%edx
c01034e2:	83 c0 04             	add    $0x4,%eax
c01034e5:	89 45 14             	mov    %eax,0x14(%ebp)
c01034e8:	85 d2                	test   %edx,%edx
c01034ea:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c01034f0:	0f 89 a9 e2 ff ff    	jns    c010179f <_svfprintf_r+0x14f>
c01034f6:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c01034fd:	ff ff ff 
c0103500:	89 c8                	mov    %ecx,%eax
c0103502:	e9 76 e2 ff ff       	jmp    c010177d <_svfprintf_r+0x12d>
c0103507:	90                   	nop
c0103508:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c010350e:	83 e0 01             	and    $0x1,%eax
c0103511:	0f 85 d0 fd ff ff    	jne    c01032e7 <_svfprintf_r+0x1c97>
c0103517:	85 d2                	test   %edx,%edx
c0103519:	0f 49 c2             	cmovns %edx,%eax
c010351c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103523:	00 00 00 
c0103526:	e9 3b f9 ff ff       	jmp    c0102e66 <_svfprintf_r+0x1816>
c010352b:	8b 45 08             	mov    0x8(%ebp),%eax
c010352e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0103534:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103539:	e9 f5 e2 ff ff       	jmp    c0101833 <_svfprintf_r+0x1e3>
c010353e:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c0103544:	e9 77 fd ff ff       	jmp    c01032c0 <_svfprintf_r+0x1c70>
c0103549:	66 90                	xchg   %ax,%ax
c010354b:	66 90                	xchg   %ax,%ax
c010354d:	66 90                	xchg   %ax,%ax
c010354f:	90                   	nop

c0103550 <quorem>:
c0103550:	55                   	push   %ebp
c0103551:	89 c1                	mov    %eax,%ecx
c0103553:	89 e5                	mov    %esp,%ebp
c0103555:	57                   	push   %edi
c0103556:	89 d7                	mov    %edx,%edi
c0103558:	56                   	push   %esi
c0103559:	53                   	push   %ebx
c010355a:	83 ec 3c             	sub    $0x3c,%esp
c010355d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0103560:	8b 42 10             	mov    0x10(%edx),%eax
c0103563:	3b 41 10             	cmp    0x10(%ecx),%eax
c0103566:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0103569:	89 ca                	mov    %ecx,%edx
c010356b:	0f 8f 9f 01 00 00    	jg     c0103710 <quorem+0x1c0>
c0103571:	83 e8 01             	sub    $0x1,%eax
c0103574:	83 c7 14             	add    $0x14,%edi
c0103577:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010357a:	c1 e0 02             	shl    $0x2,%eax
c010357d:	83 c2 14             	add    $0x14,%edx
c0103580:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c0103583:	01 d0                	add    %edx,%eax
c0103585:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103588:	8b 13                	mov    (%ebx),%edx
c010358a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010358d:	8b 00                	mov    (%eax),%eax
c010358f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0103592:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103595:	31 d2                	xor    %edx,%edx
c0103597:	f7 f1                	div    %ecx
c0103599:	85 c0                	test   %eax,%eax
c010359b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010359e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01035a1:	0f 84 b5 00 00 00    	je     c010365c <quorem+0x10c>
c01035a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035aa:	31 f6                	xor    %esi,%esi
c01035ac:	89 fa                	mov    %edi,%edx
c01035ae:	89 7d c0             	mov    %edi,-0x40(%ebp)
c01035b1:	89 f7                	mov    %esi,%edi
c01035b3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c01035ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01035c0:	83 c2 04             	add    $0x4,%edx
c01035c3:	8b 72 fc             	mov    -0x4(%edx),%esi
c01035c6:	83 c0 04             	add    $0x4,%eax
c01035c9:	0f b7 ce             	movzwl %si,%ecx
c01035cc:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c01035d0:	03 4d dc             	add    -0x24(%ebp),%ecx
c01035d3:	c1 ee 10             	shr    $0x10,%esi
c01035d6:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c01035da:	89 cb                	mov    %ecx,%ebx
c01035dc:	0f b7 c9             	movzwl %cx,%ecx
c01035df:	c1 eb 10             	shr    $0x10,%ebx
c01035e2:	29 cf                	sub    %ecx,%edi
c01035e4:	01 f3                	add    %esi,%ebx
c01035e6:	89 de                	mov    %ebx,%esi
c01035e8:	0f b7 db             	movzwl %bx,%ebx
c01035eb:	c1 ee 10             	shr    $0x10,%esi
c01035ee:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01035f1:	8b 70 fc             	mov    -0x4(%eax),%esi
c01035f4:	0f b7 ce             	movzwl %si,%ecx
c01035f7:	01 f9                	add    %edi,%ecx
c01035f9:	c1 ee 10             	shr    $0x10,%esi
c01035fc:	29 de                	sub    %ebx,%esi
c01035fe:	89 cb                	mov    %ecx,%ebx
c0103600:	c1 fb 10             	sar    $0x10,%ebx
c0103603:	0f b7 c9             	movzwl %cx,%ecx
c0103606:	01 de                	add    %ebx,%esi
c0103608:	89 f7                	mov    %esi,%edi
c010360a:	c1 e6 10             	shl    $0x10,%esi
c010360d:	09 ce                	or     %ecx,%esi
c010360f:	c1 ff 10             	sar    $0x10,%edi
c0103612:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c0103615:	89 70 fc             	mov    %esi,-0x4(%eax)
c0103618:	73 a6                	jae    c01035c0 <quorem+0x70>
c010361a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010361d:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0103620:	8b 10                	mov    (%eax),%edx
c0103622:	85 d2                	test   %edx,%edx
c0103624:	75 36                	jne    c010365c <quorem+0x10c>
c0103626:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103629:	89 c2                	mov    %eax,%edx
c010362b:	83 e8 04             	sub    $0x4,%eax
c010362e:	39 c1                	cmp    %eax,%ecx
c0103630:	73 21                	jae    c0103653 <quorem+0x103>
c0103632:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103635:	85 f6                	test   %esi,%esi
c0103637:	75 1a                	jne    c0103653 <quorem+0x103>
c0103639:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010363c:	eb 08                	jmp    c0103646 <quorem+0xf6>
c010363e:	66 90                	xchg   %ax,%ax
c0103640:	8b 18                	mov    (%eax),%ebx
c0103642:	85 db                	test   %ebx,%ebx
c0103644:	75 0a                	jne    c0103650 <quorem+0x100>
c0103646:	83 e8 04             	sub    $0x4,%eax
c0103649:	83 ea 01             	sub    $0x1,%edx
c010364c:	39 c1                	cmp    %eax,%ecx
c010364e:	72 f0                	jb     c0103640 <quorem+0xf0>
c0103650:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103653:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103656:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103659:	89 50 10             	mov    %edx,0x10(%eax)
c010365c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010365f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103663:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103666:	89 04 24             	mov    %eax,(%esp)
c0103669:	e8 a2 23 00 00       	call   c0105a10 <__mcmp>
c010366e:	85 c0                	test   %eax,%eax
c0103670:	0f 88 8e 00 00 00    	js     c0103704 <quorem+0x1b4>
c0103676:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103679:	31 f6                	xor    %esi,%esi
c010367b:	83 c0 01             	add    $0x1,%eax
c010367e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103681:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103688:	83 c7 04             	add    $0x4,%edi
c010368b:	8b 4f fc             	mov    -0x4(%edi),%ecx
c010368e:	83 c0 04             	add    $0x4,%eax
c0103691:	8b 58 fc             	mov    -0x4(%eax),%ebx
c0103694:	0f b7 d1             	movzwl %cx,%edx
c0103697:	29 d6                	sub    %edx,%esi
c0103699:	0f b7 d3             	movzwl %bx,%edx
c010369c:	01 f2                	add    %esi,%edx
c010369e:	c1 e9 10             	shr    $0x10,%ecx
c01036a1:	c1 eb 10             	shr    $0x10,%ebx
c01036a4:	29 cb                	sub    %ecx,%ebx
c01036a6:	89 d1                	mov    %edx,%ecx
c01036a8:	c1 f9 10             	sar    $0x10,%ecx
c01036ab:	0f b7 d2             	movzwl %dx,%edx
c01036ae:	01 cb                	add    %ecx,%ebx
c01036b0:	89 de                	mov    %ebx,%esi
c01036b2:	c1 e3 10             	shl    $0x10,%ebx
c01036b5:	09 d3                	or     %edx,%ebx
c01036b7:	c1 fe 10             	sar    $0x10,%esi
c01036ba:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c01036bd:	89 58 fc             	mov    %ebx,-0x4(%eax)
c01036c0:	73 c6                	jae    c0103688 <quorem+0x138>
c01036c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01036c5:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01036c8:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c01036cb:	8b 02                	mov    (%edx),%eax
c01036cd:	85 c0                	test   %eax,%eax
c01036cf:	75 33                	jne    c0103704 <quorem+0x1b4>
c01036d1:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01036d4:	8d 42 fc             	lea    -0x4(%edx),%eax
c01036d7:	39 c1                	cmp    %eax,%ecx
c01036d9:	73 20                	jae    c01036fb <quorem+0x1ab>
c01036db:	8b 72 fc             	mov    -0x4(%edx),%esi
c01036de:	85 f6                	test   %esi,%esi
c01036e0:	75 19                	jne    c01036fb <quorem+0x1ab>
c01036e2:	89 fa                	mov    %edi,%edx
c01036e4:	eb 08                	jmp    c01036ee <quorem+0x19e>
c01036e6:	66 90                	xchg   %ax,%ax
c01036e8:	8b 18                	mov    (%eax),%ebx
c01036ea:	85 db                	test   %ebx,%ebx
c01036ec:	75 0a                	jne    c01036f8 <quorem+0x1a8>
c01036ee:	83 e8 04             	sub    $0x4,%eax
c01036f1:	83 ea 01             	sub    $0x1,%edx
c01036f4:	39 c1                	cmp    %eax,%ecx
c01036f6:	72 f0                	jb     c01036e8 <quorem+0x198>
c01036f8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01036fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01036fe:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103701:	89 78 10             	mov    %edi,0x10(%eax)
c0103704:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103707:	83 c4 3c             	add    $0x3c,%esp
c010370a:	5b                   	pop    %ebx
c010370b:	5e                   	pop    %esi
c010370c:	5f                   	pop    %edi
c010370d:	5d                   	pop    %ebp
c010370e:	c3                   	ret    
c010370f:	90                   	nop
c0103710:	83 c4 3c             	add    $0x3c,%esp
c0103713:	31 c0                	xor    %eax,%eax
c0103715:	5b                   	pop    %ebx
c0103716:	5e                   	pop    %esi
c0103717:	5f                   	pop    %edi
c0103718:	5d                   	pop    %ebp
c0103719:	c3                   	ret    
c010371a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0103720 <_dtoa_r>:
c0103720:	55                   	push   %ebp
c0103721:	89 e5                	mov    %esp,%ebp
c0103723:	57                   	push   %edi
c0103724:	56                   	push   %esi
c0103725:	53                   	push   %ebx
c0103726:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c010372c:	8b 75 08             	mov    0x8(%ebp),%esi
c010372f:	dd 45 0c             	fldl   0xc(%ebp)
c0103732:	8b 5d 20             	mov    0x20(%ebp),%ebx
c0103735:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103738:	8b 46 40             	mov    0x40(%esi),%eax
c010373b:	85 c0                	test   %eax,%eax
c010373d:	74 23                	je     c0103762 <_dtoa_r+0x42>
c010373f:	8b 4e 44             	mov    0x44(%esi),%ecx
c0103742:	ba 01 00 00 00       	mov    $0x1,%edx
c0103747:	d3 e2                	shl    %cl,%edx
c0103749:	89 48 04             	mov    %ecx,0x4(%eax)
c010374c:	89 50 08             	mov    %edx,0x8(%eax)
c010374f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103753:	89 34 24             	mov    %esi,(%esp)
c0103756:	e8 95 1b 00 00       	call   c01052f0 <_Bfree>
c010375b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c0103762:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0103765:	85 ff                	test   %edi,%edi
c0103767:	0f 88 3b 02 00 00    	js     c01039a8 <_dtoa_r+0x288>
c010376d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0103773:	89 f8                	mov    %edi,%eax
c0103775:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c010377a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c010377f:	0f 84 e3 01 00 00    	je     c0103968 <_dtoa_r+0x248>
c0103785:	dd 45 c0             	fldl   -0x40(%ebp)
c0103788:	d9 ee                	fldz   
c010378a:	d9 c9                	fxch   %st(1)
c010378c:	db e9                	fucomi %st(1),%st
c010378e:	dd d9                	fstp   %st(1)
c0103790:	7a 36                	jp     c01037c8 <_dtoa_r+0xa8>
c0103792:	75 34                	jne    c01037c8 <_dtoa_r+0xa8>
c0103794:	dd d8                	fstp   %st(0)
c0103796:	8b 4d 24             	mov    0x24(%ebp),%ecx
c0103799:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010379c:	85 c9                	test   %ecx,%ecx
c010379e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c01037a4:	0f 84 4e 02 00 00    	je     c01039f8 <_dtoa_r+0x2d8>
c01037aa:	8b 45 24             	mov    0x24(%ebp),%eax
c01037ad:	c7 00 bc 81 10 c0    	movl   $0xc01081bc,(%eax)
c01037b3:	b8 bb 81 10 c0       	mov    $0xc01081bb,%eax
c01037b8:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c01037be:	5b                   	pop    %ebx
c01037bf:	5e                   	pop    %esi
c01037c0:	5f                   	pop    %edi
c01037c1:	5d                   	pop    %ebp
c01037c2:	c3                   	ret    
c01037c3:	90                   	nop
c01037c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01037c8:	8d 45 e0             	lea    -0x20(%ebp),%eax
c01037cb:	89 fb                	mov    %edi,%ebx
c01037cd:	89 44 24 10          	mov    %eax,0x10(%esp)
c01037d1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01037d4:	dd 54 24 04          	fstl   0x4(%esp)
c01037d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01037dc:	dd 5d b8             	fstpl  -0x48(%ebp)
c01037df:	89 34 24             	mov    %esi,(%esp)
c01037e2:	c1 eb 14             	shr    $0x14,%ebx
c01037e5:	e8 76 25 00 00       	call   c0105d60 <__d2b>
c01037ea:	85 db                	test   %ebx,%ebx
c01037ec:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01037ef:	0f 85 db 01 00 00    	jne    c01039d0 <_dtoa_r+0x2b0>
c01037f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01037f8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01037fb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01037fe:	01 c3                	add    %eax,%ebx
c0103800:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c0103806:	0f 8c ec 07 00 00    	jl     c0103ff8 <_dtoa_r+0x8d8>
c010380c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010380f:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c0103814:	89 f8                	mov    %edi,%eax
c0103816:	29 d9                	sub    %ebx,%ecx
c0103818:	d3 e0                	shl    %cl,%eax
c010381a:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c0103820:	d3 ea                	shr    %cl,%edx
c0103822:	09 d0                	or     %edx,%eax
c0103824:	31 d2                	xor    %edx,%edx
c0103826:	83 eb 01             	sub    $0x1,%ebx
c0103829:	89 55 cc             	mov    %edx,-0x34(%ebp)
c010382c:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010382f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103832:	df 6d c8             	fildll -0x38(%ebp)
c0103835:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103838:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c010383f:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0103846:	dd 45 b8             	fldl   -0x48(%ebp)
c0103849:	d8 25 54 83 10 c0    	fsubs  0xc0108354
c010384f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c0103852:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103855:	dc 0d 70 83 10 c0    	fmull  0xc0108370
c010385b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c010385f:	b4 0c                	mov    $0xc,%ah
c0103861:	dc 05 78 83 10 c0    	faddl  0xc0108378
c0103867:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010386b:	db 45 d4             	fildl  -0x2c(%ebp)
c010386e:	dc 0d 80 83 10 c0    	fmull  0xc0108380
c0103874:	de c1                	faddp  %st,%st(1)
c0103876:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103879:	db 55 b8             	fistl  -0x48(%ebp)
c010387c:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010387f:	d9 ee                	fldz   
c0103881:	df e9                	fucomip %st(1),%st
c0103883:	0f 87 27 07 00 00    	ja     c0103fb0 <_dtoa_r+0x890>
c0103889:	dd d8                	fstp   %st(0)
c010388b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c010388f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c0103896:	77 24                	ja     c01038bc <_dtoa_r+0x19c>
c0103898:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010389b:	dd 04 c5 40 84 10 c0 	fldl   -0x3fef7bc0(,%eax,8)
c01038a2:	dd 45 c0             	fldl   -0x40(%ebp)
c01038a5:	d9 c9                	fxch   %st(1)
c01038a7:	df e9                	fucomip %st(1),%st
c01038a9:	dd d8                	fstp   %st(0)
c01038ab:	0f 86 5f 07 00 00    	jbe    c0104010 <_dtoa_r+0x8f0>
c01038b1:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c01038b5:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c01038bc:	89 d0                	mov    %edx,%eax
c01038be:	29 d8                	sub    %ebx,%eax
c01038c0:	83 e8 01             	sub    $0x1,%eax
c01038c3:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c01038ca:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01038cd:	0f 88 0d 07 00 00    	js     c0103fe0 <_dtoa_r+0x8c0>
c01038d3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01038d6:	85 c0                	test   %eax,%eax
c01038d8:	0f 88 ea 06 00 00    	js     c0103fc8 <_dtoa_r+0x8a8>
c01038de:	01 45 ac             	add    %eax,-0x54(%ebp)
c01038e1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01038e4:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01038eb:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c01038ef:	0f 87 0b 03 00 00    	ja     c0103c00 <_dtoa_r+0x4e0>
c01038f5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01038f9:	0f 8e 23 10 00 00    	jle    c0104922 <_dtoa_r+0x1202>
c01038ff:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c0103903:	31 c0                	xor    %eax,%eax
c0103905:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c0103909:	0f 84 43 0d 00 00    	je     c0104652 <_dtoa_r+0xf32>
c010390f:	0f 8e f3 00 00 00    	jle    c0103a08 <_dtoa_r+0x2e8>
c0103915:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c0103919:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103920:	0f 84 f3 00 00 00    	je     c0103a19 <_dtoa_r+0x2f9>
c0103926:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c010392a:	0f 85 d7 02 00 00    	jne    c0103c07 <_dtoa_r+0x4e7>
c0103930:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103933:	03 5d 18             	add    0x18(%ebp),%ebx
c0103936:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c0103939:	83 c3 01             	add    $0x1,%ebx
c010393c:	83 fb 0e             	cmp    $0xe,%ebx
c010393f:	0f 96 c2             	setbe  %dl
c0103942:	85 db                	test   %ebx,%ebx
c0103944:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c0103947:	0f 8e a7 08 00 00    	jle    c01041f4 <_dtoa_r+0xad4>
c010394d:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103950:	83 fb 0e             	cmp    $0xe,%ebx
c0103953:	89 df                	mov    %ebx,%edi
c0103955:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103959:	20 45 b4             	and    %al,-0x4c(%ebp)
c010395c:	e9 d6 00 00 00       	jmp    c0103a37 <_dtoa_r+0x317>
c0103961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103968:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010396b:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010396e:	85 d2                	test   %edx,%edx
c0103970:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0103976:	b8 4d 83 10 c0       	mov    $0xc010834d,%eax
c010397b:	74 43                	je     c01039c0 <_dtoa_r+0x2a0>
c010397d:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0103980:	85 db                	test   %ebx,%ebx
c0103982:	0f 84 30 fe ff ff    	je     c01037b8 <_dtoa_r+0x98>
c0103988:	8b 75 24             	mov    0x24(%ebp),%esi
c010398b:	8d 50 08             	lea    0x8(%eax),%edx
c010398e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0103992:	8d 48 03             	lea    0x3(%eax),%ecx
c0103995:	0f 44 d1             	cmove  %ecx,%edx
c0103998:	89 16                	mov    %edx,(%esi)
c010399a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c01039a0:	5b                   	pop    %ebx
c01039a1:	5e                   	pop    %esi
c01039a2:	5f                   	pop    %edi
c01039a3:	5d                   	pop    %ebp
c01039a4:	c3                   	ret    
c01039a5:	8d 76 00             	lea    0x0(%esi),%esi
c01039a8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c01039ae:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c01039b4:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c01039b7:	e9 b7 fd ff ff       	jmp    c0103773 <_dtoa_r+0x53>
c01039bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01039c0:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c01039c6:	ba 44 83 10 c0       	mov    $0xc0108344,%edx
c01039cb:	0f 44 c2             	cmove  %edx,%eax
c01039ce:	eb ad                	jmp    c010397d <_dtoa_r+0x25d>
c01039d0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01039d3:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c01039d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01039dc:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01039e3:	25 ff ff 0f 00       	and    $0xfffff,%eax
c01039e8:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c01039ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01039f0:	e9 51 fe ff ff       	jmp    c0103846 <_dtoa_r+0x126>
c01039f5:	8d 76 00             	lea    0x0(%esi),%esi
c01039f8:	b8 bb 81 10 c0       	mov    $0xc01081bb,%eax
c01039fd:	e9 b6 fd ff ff       	jmp    c01037b8 <_dtoa_r+0x98>
c0103a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103a08:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0103a0c:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0103a13:	0f 85 ee 01 00 00    	jne    c0103c07 <_dtoa_r+0x4e7>
c0103a19:	8b 55 18             	mov    0x18(%ebp),%edx
c0103a1c:	85 d2                	test   %edx,%edx
c0103a1e:	0f 8e b6 07 00 00    	jle    c01041da <_dtoa_r+0xaba>
c0103a24:	8b 7d 18             	mov    0x18(%ebp),%edi
c0103a27:	83 ff 0e             	cmp    $0xe,%edi
c0103a2a:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103a2e:	20 45 b4             	and    %al,-0x4c(%ebp)
c0103a31:	89 7d 90             	mov    %edi,-0x70(%ebp)
c0103a34:	89 7d a8             	mov    %edi,-0x58(%ebp)
c0103a37:	83 ff 17             	cmp    $0x17,%edi
c0103a3a:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103a41:	0f 86 e5 0e 00 00    	jbe    c010492c <_dtoa_r+0x120c>
c0103a47:	b9 01 00 00 00       	mov    $0x1,%ecx
c0103a4c:	b8 04 00 00 00       	mov    $0x4,%eax
c0103a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103a58:	01 c0                	add    %eax,%eax
c0103a5a:	89 ca                	mov    %ecx,%edx
c0103a5c:	8d 58 14             	lea    0x14(%eax),%ebx
c0103a5f:	39 fb                	cmp    %edi,%ebx
c0103a61:	8d 49 01             	lea    0x1(%ecx),%ecx
c0103a64:	76 f2                	jbe    c0103a58 <_dtoa_r+0x338>
c0103a66:	89 56 44             	mov    %edx,0x44(%esi)
c0103a69:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103a6d:	89 34 24             	mov    %esi,(%esp)
c0103a70:	e8 db 17 00 00       	call   c0105250 <_Balloc>
c0103a75:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0103a79:	89 c7                	mov    %eax,%edi
c0103a7b:	89 46 40             	mov    %eax,0x40(%esi)
c0103a7e:	0f 84 bb 01 00 00    	je     c0103c3f <_dtoa_r+0x51f>
c0103a84:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103a87:	dd 45 c0             	fldl   -0x40(%ebp)
c0103a8a:	85 db                	test   %ebx,%ebx
c0103a8c:	0f 8e de 07 00 00    	jle    c0104270 <_dtoa_r+0xb50>
c0103a92:	89 d8                	mov    %ebx,%eax
c0103a94:	83 e0 0f             	and    $0xf,%eax
c0103a97:	dd 04 c5 40 84 10 c0 	fldl   -0x3fef7bc0(,%eax,8)
c0103a9e:	89 d8                	mov    %ebx,%eax
c0103aa0:	c1 f8 04             	sar    $0x4,%eax
c0103aa3:	a8 10                	test   $0x10,%al
c0103aa5:	0f 84 cd 05 00 00    	je     c0104078 <_dtoa_r+0x958>
c0103aab:	dd 05 20 84 10 c0    	fldl   0xc0108420
c0103ab1:	83 e0 0f             	and    $0xf,%eax
c0103ab4:	b9 03 00 00 00       	mov    $0x3,%ecx
c0103ab9:	d8 fa                	fdivr  %st(2),%st
c0103abb:	85 c0                	test   %eax,%eax
c0103abd:	74 22                	je     c0103ae1 <_dtoa_r+0x3c1>
c0103abf:	31 d2                	xor    %edx,%edx
c0103ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103ac8:	a8 01                	test   $0x1,%al
c0103aca:	74 0e                	je     c0103ada <_dtoa_r+0x3ba>
c0103acc:	d9 c9                	fxch   %st(1)
c0103ace:	dc 0c d5 00 84 10 c0 	fmull  -0x3fef7c00(,%edx,8)
c0103ad5:	d9 c9                	fxch   %st(1)
c0103ad7:	83 c1 01             	add    $0x1,%ecx
c0103ada:	83 c2 01             	add    $0x1,%edx
c0103add:	d1 f8                	sar    %eax
c0103adf:	75 e7                	jne    c0103ac8 <_dtoa_r+0x3a8>
c0103ae1:	de f1                	fdivp  %st,%st(1)
c0103ae3:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103ae6:	85 c0                	test   %eax,%eax
c0103ae8:	74 0a                	je     c0103af4 <_dtoa_r+0x3d4>
c0103aea:	d9 e8                	fld1   
c0103aec:	df e9                	fucomip %st(1),%st
c0103aee:	0f 87 92 0b 00 00    	ja     c0104686 <_dtoa_r+0xf66>
c0103af4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0103af7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103afa:	db 45 d4             	fildl  -0x2c(%ebp)
c0103afd:	d8 c9                	fmul   %st(1),%st
c0103aff:	d8 05 60 83 10 c0    	fadds  0xc0108360
c0103b05:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103b08:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0103b0f:	85 c0                	test   %eax,%eax
c0103b11:	0f 84 89 05 00 00    	je     c01040a0 <_dtoa_r+0x980>
c0103b17:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103b1a:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0103b1d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103b20:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103b23:	85 c0                	test   %eax,%eax
c0103b25:	0f 84 b5 07 00 00    	je     c01042e0 <_dtoa_r+0xbc0>
c0103b2b:	d9 05 68 83 10 c0    	flds   0xc0108368
c0103b31:	8d 57 01             	lea    0x1(%edi),%edx
c0103b34:	dc 34 cd 38 84 10 c0 	fdivl  -0x3fef7bc8(,%ecx,8)
c0103b3b:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103b3e:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103b42:	b4 0c                	mov    $0xc,%ah
c0103b44:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103b48:	dc 65 c0             	fsubl  -0x40(%ebp)
c0103b4b:	d9 c9                	fxch   %st(1)
c0103b4d:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103b50:	db 55 d4             	fistl  -0x2c(%ebp)
c0103b53:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103b56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b59:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103b5c:	83 c0 30             	add    $0x30,%eax
c0103b5f:	db 45 d4             	fildl  -0x2c(%ebp)
c0103b62:	de e9                	fsubrp %st,%st(1)
c0103b64:	d9 c9                	fxch   %st(1)
c0103b66:	88 07                	mov    %al,(%edi)
c0103b68:	db e9                	fucomi %st(1),%st
c0103b6a:	77 7f                	ja     c0103beb <_dtoa_r+0x4cb>
c0103b6c:	d9 c1                	fld    %st(1)
c0103b6e:	d8 2d 58 83 10 c0    	fsubrs 0xc0108358
c0103b74:	d9 c9                	fxch   %st(1)
c0103b76:	db e9                	fucomi %st(1),%st
c0103b78:	dd d9                	fstp   %st(1)
c0103b7a:	0f 87 33 0c 00 00    	ja     c01047b3 <_dtoa_r+0x1093>
c0103b80:	83 f9 01             	cmp    $0x1,%ecx
c0103b83:	0f 8e c4 06 00 00    	jle    c010424d <_dtoa_r+0xb2d>
c0103b89:	01 f9                	add    %edi,%ecx
c0103b8b:	d9 05 5c 83 10 c0    	flds   0xc010835c
c0103b91:	eb 25                	jmp    c0103bb8 <_dtoa_r+0x498>
c0103b93:	90                   	nop
c0103b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b98:	d9 c1                	fld    %st(1)
c0103b9a:	d8 2d 58 83 10 c0    	fsubrs 0xc0108358
c0103ba0:	d9 c9                	fxch   %st(1)
c0103ba2:	db e9                	fucomi %st(1),%st
c0103ba4:	dd d9                	fstp   %st(1)
c0103ba6:	0f 87 14 0c 00 00    	ja     c01047c0 <_dtoa_r+0x10a0>
c0103bac:	39 ca                	cmp    %ecx,%edx
c0103bae:	0f 84 a4 06 00 00    	je     c0104258 <_dtoa_r+0xb38>
c0103bb4:	d9 c9                	fxch   %st(1)
c0103bb6:	d9 ca                	fxch   %st(2)
c0103bb8:	dc c9                	fmul   %st,%st(1)
c0103bba:	83 c2 01             	add    $0x1,%edx
c0103bbd:	dc ca                	fmul   %st,%st(2)
c0103bbf:	d9 ca                	fxch   %st(2)
c0103bc1:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103bc4:	db 55 d4             	fistl  -0x2c(%ebp)
c0103bc7:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103bca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103bcd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103bd0:	83 c0 30             	add    $0x30,%eax
c0103bd3:	db 45 d4             	fildl  -0x2c(%ebp)
c0103bd6:	de e9                	fsubrp %st,%st(1)
c0103bd8:	d9 c9                	fxch   %st(1)
c0103bda:	88 42 ff             	mov    %al,-0x1(%edx)
c0103bdd:	db e9                	fucomi %st(1),%st
c0103bdf:	76 b7                	jbe    c0103b98 <_dtoa_r+0x478>
c0103be1:	dd d8                	fstp   %st(0)
c0103be3:	dd d8                	fstp   %st(0)
c0103be5:	dd d8                	fstp   %st(0)
c0103be7:	dd d8                	fstp   %st(0)
c0103be9:	eb 06                	jmp    c0103bf1 <_dtoa_r+0x4d1>
c0103beb:	dd d8                	fstp   %st(0)
c0103bed:	dd d8                	fstp   %st(0)
c0103bef:	dd d8                	fstp   %st(0)
c0103bf1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103bf4:	89 fb                	mov    %edi,%ebx
c0103bf6:	89 d7                	mov    %edx,%edi
c0103bf8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103bfb:	e9 70 03 00 00       	jmp    c0103f70 <_dtoa_r+0x850>
c0103c00:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c0103c07:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103c0e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103c15:	00 
c0103c16:	89 34 24             	mov    %esi,(%esp)
c0103c19:	e8 32 16 00 00       	call   c0105250 <_Balloc>
c0103c1e:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103c25:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c0103c2c:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c0103c33:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c0103c3a:	89 c7                	mov    %eax,%edi
c0103c3c:	89 46 40             	mov    %eax,0x40(%esi)
c0103c3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c42:	85 c0                	test   %eax,%eax
c0103c44:	0f 88 2e 01 00 00    	js     c0103d78 <_dtoa_r+0x658>
c0103c4a:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c0103c4e:	0f 8f 24 01 00 00    	jg     c0103d78 <_dtoa_r+0x658>
c0103c54:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103c57:	dd 04 c5 40 84 10 c0 	fldl   -0x3fef7bc0(,%eax,8)
c0103c5e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103c61:	85 c0                	test   %eax,%eax
c0103c63:	7f 0e                	jg     c0103c73 <_dtoa_r+0x553>
c0103c65:	8b 45 18             	mov    0x18(%ebp),%eax
c0103c68:	c1 e8 1f             	shr    $0x1f,%eax
c0103c6b:	84 c0                	test   %al,%al
c0103c6d:	0f 85 9d 07 00 00    	jne    c0104410 <_dtoa_r+0xcf0>
c0103c73:	dd 45 c0             	fldl   -0x40(%ebp)
c0103c76:	d9 c0                	fld    %st(0)
c0103c78:	d8 f2                	fdiv   %st(2),%st
c0103c7a:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103c7d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0103c81:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103c85:	b4 0c                	mov    $0xc,%ah
c0103c87:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103c8b:	8d 47 01             	lea    0x1(%edi),%eax
c0103c8e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103c91:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103c94:	db 5d d4             	fistpl -0x2c(%ebp)
c0103c97:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103c9a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103c9d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103ca0:	8d 42 30             	lea    0x30(%edx),%eax
c0103ca3:	db 45 d4             	fildl  -0x2c(%ebp)
c0103ca6:	d8 ca                	fmul   %st(2),%st
c0103ca8:	88 07                	mov    %al,(%edi)
c0103caa:	de e9                	fsubrp %st,%st(1)
c0103cac:	74 66                	je     c0103d14 <_dtoa_r+0x5f4>
c0103cae:	d8 0d 5c 83 10 c0    	fmuls  0xc010835c
c0103cb4:	d9 ee                	fldz   
c0103cb6:	d9 c9                	fxch   %st(1)
c0103cb8:	db e9                	fucomi %st(1),%st
c0103cba:	dd d9                	fstp   %st(1)
c0103cbc:	0f 8b 33 0c 00 00    	jnp    c01048f5 <_dtoa_r+0x11d5>
c0103cc2:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103cc5:	8d 47 02             	lea    0x2(%edi),%eax
c0103cc8:	d9 05 5c 83 10 c0    	flds   0xc010835c
c0103cce:	01 fb                	add    %edi,%ebx
c0103cd0:	eb 19                	jmp    c0103ceb <_dtoa_r+0x5cb>
c0103cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103cd8:	dc c9                	fmul   %st,%st(1)
c0103cda:	83 c0 01             	add    $0x1,%eax
c0103cdd:	d9 ee                	fldz   
c0103cdf:	d9 ca                	fxch   %st(2)
c0103ce1:	db ea                	fucomi %st(2),%st
c0103ce3:	dd da                	fstp   %st(2)
c0103ce5:	0f 8b 73 09 00 00    	jnp    c010465e <_dtoa_r+0xf3e>
c0103ceb:	d9 c1                	fld    %st(1)
c0103ced:	39 d8                	cmp    %ebx,%eax
c0103cef:	d8 f3                	fdiv   %st(3),%st
c0103cf1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103cf4:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103cf7:	db 5d d4             	fistpl -0x2c(%ebp)
c0103cfa:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103cfd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103d00:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103d03:	8d 4a 30             	lea    0x30(%edx),%ecx
c0103d06:	db 45 d4             	fildl  -0x2c(%ebp)
c0103d09:	d8 cb                	fmul   %st(3),%st
c0103d0b:	88 48 ff             	mov    %cl,-0x1(%eax)
c0103d0e:	de ea                	fsubrp %st,%st(2)
c0103d10:	75 c6                	jne    c0103cd8 <_dtoa_r+0x5b8>
c0103d12:	dd d8                	fstp   %st(0)
c0103d14:	d8 c0                	fadd   %st(0),%st
c0103d16:	db e9                	fucomi %st(1),%st
c0103d18:	77 1e                	ja     c0103d38 <_dtoa_r+0x618>
c0103d1a:	d9 c9                	fxch   %st(1)
c0103d1c:	df e9                	fucomip %st(1),%st
c0103d1e:	dd d8                	fstp   %st(0)
c0103d20:	0f 8a 44 09 00 00    	jp     c010466a <_dtoa_r+0xf4a>
c0103d26:	0f 85 3e 09 00 00    	jne    c010466a <_dtoa_r+0xf4a>
c0103d2c:	83 e2 01             	and    $0x1,%edx
c0103d2f:	90                   	nop
c0103d30:	0f 84 34 09 00 00    	je     c010466a <_dtoa_r+0xf4a>
c0103d36:	eb 04                	jmp    c0103d3c <_dtoa_r+0x61c>
c0103d38:	dd d8                	fstp   %st(0)
c0103d3a:	dd d8                	fstp   %st(0)
c0103d3c:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0103d3f:	89 fb                	mov    %edi,%ebx
c0103d41:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c0103d45:	89 cf                	mov    %ecx,%edi
c0103d47:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c0103d4a:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c0103d4d:	eb 0f                	jmp    c0103d5e <_dtoa_r+0x63e>
c0103d4f:	90                   	nop
c0103d50:	39 d3                	cmp    %edx,%ebx
c0103d52:	0f 84 75 09 00 00    	je     c01046cd <_dtoa_r+0xfad>
c0103d58:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0103d5c:	89 d7                	mov    %edx,%edi
c0103d5e:	3c 39                	cmp    $0x39,%al
c0103d60:	8d 57 ff             	lea    -0x1(%edi),%edx
c0103d63:	74 eb                	je     c0103d50 <_dtoa_r+0x630>
c0103d65:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0103d68:	83 c0 01             	add    $0x1,%eax
c0103d6b:	88 02                	mov    %al,(%edx)
c0103d6d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0103d70:	e9 fb 01 00 00       	jmp    c0103f70 <_dtoa_r+0x850>
c0103d75:	8d 76 00             	lea    0x0(%esi),%esi
c0103d78:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0103d7b:	85 c9                	test   %ecx,%ecx
c0103d7d:	0f 85 9d 02 00 00    	jne    c0104020 <_dtoa_r+0x900>
c0103d83:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0103d86:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0103d89:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0103d90:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d93:	85 c0                	test   %eax,%eax
c0103d95:	7e 14                	jle    c0103dab <_dtoa_r+0x68b>
c0103d97:	85 db                	test   %ebx,%ebx
c0103d99:	7e 10                	jle    c0103dab <_dtoa_r+0x68b>
c0103d9b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d9e:	39 d8                	cmp    %ebx,%eax
c0103da0:	0f 4f c3             	cmovg  %ebx,%eax
c0103da3:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103da6:	29 c3                	sub    %eax,%ebx
c0103da8:	29 45 ac             	sub    %eax,-0x54(%ebp)
c0103dab:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103dae:	85 c0                	test   %eax,%eax
c0103db0:	7e 61                	jle    c0103e13 <_dtoa_r+0x6f3>
c0103db2:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103db5:	85 c0                	test   %eax,%eax
c0103db7:	0f 84 72 04 00 00    	je     c010422f <_dtoa_r+0xb0f>
c0103dbd:	85 d2                	test   %edx,%edx
c0103dbf:	7e 47                	jle    c0103e08 <_dtoa_r+0x6e8>
c0103dc1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103dc4:	89 54 24 08          	mov    %edx,0x8(%esp)
c0103dc8:	89 34 24             	mov    %esi,(%esp)
c0103dcb:	89 55 88             	mov    %edx,-0x78(%ebp)
c0103dce:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103dd2:	e8 f9 19 00 00       	call   c01057d0 <__pow5mult>
c0103dd7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103dda:	89 34 24             	mov    %esi,(%esp)
c0103ddd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103de1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103de5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103de8:	e8 13 18 00 00       	call   c0105600 <__multiply>
c0103ded:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103df0:	89 34 24             	mov    %esi,(%esp)
c0103df3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0103df7:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0103dfa:	e8 f1 14 00 00       	call   c01052f0 <_Bfree>
c0103dff:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0103e02:	8b 55 88             	mov    -0x78(%ebp),%edx
c0103e05:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103e08:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103e0b:	29 d0                	sub    %edx,%eax
c0103e0d:	0f 85 1f 04 00 00    	jne    c0104232 <_dtoa_r+0xb12>
c0103e13:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103e1a:	00 
c0103e1b:	89 34 24             	mov    %esi,(%esp)
c0103e1e:	e8 ad 17 00 00       	call   c01055d0 <__i2b>
c0103e23:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0103e26:	85 c9                	test   %ecx,%ecx
c0103e28:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103e2b:	7e 13                	jle    c0103e40 <_dtoa_r+0x720>
c0103e2d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103e31:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e35:	89 34 24             	mov    %esi,(%esp)
c0103e38:	e8 93 19 00 00       	call   c01057d0 <__pow5mult>
c0103e3d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103e40:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103e44:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103e4b:	0f 8e f7 05 00 00    	jle    c0104448 <_dtoa_r+0xd28>
c0103e51:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103e54:	ba 01 00 00 00       	mov    $0x1,%edx
c0103e59:	85 c0                	test   %eax,%eax
c0103e5b:	0f 85 27 05 00 00    	jne    c0104388 <_dtoa_r+0xc68>
c0103e61:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103e64:	01 d0                	add    %edx,%eax
c0103e66:	83 e0 1f             	and    $0x1f,%eax
c0103e69:	89 c2                	mov    %eax,%edx
c0103e6b:	0f 84 57 03 00 00    	je     c01041c8 <_dtoa_r+0xaa8>
c0103e71:	b8 20 00 00 00       	mov    $0x20,%eax
c0103e76:	29 d0                	sub    %edx,%eax
c0103e78:	83 f8 04             	cmp    $0x4,%eax
c0103e7b:	0f 8e 8c 0a 00 00    	jle    c010490d <_dtoa_r+0x11ed>
c0103e81:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0103e86:	29 d0                	sub    %edx,%eax
c0103e88:	01 45 a0             	add    %eax,-0x60(%ebp)
c0103e8b:	01 c3                	add    %eax,%ebx
c0103e8d:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103e90:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103e93:	85 c0                	test   %eax,%eax
c0103e95:	7e 16                	jle    c0103ead <_dtoa_r+0x78d>
c0103e97:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103e9b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103e9e:	89 34 24             	mov    %esi,(%esp)
c0103ea1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ea5:	e8 46 1a 00 00       	call   c01058f0 <__lshift>
c0103eaa:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103ead:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103eb0:	85 c0                	test   %eax,%eax
c0103eb2:	7e 16                	jle    c0103eca <_dtoa_r+0x7aa>
c0103eb4:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103eb8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ebb:	89 34 24             	mov    %esi,(%esp)
c0103ebe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ec2:	e8 29 1a 00 00       	call   c01058f0 <__lshift>
c0103ec7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103eca:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103ecd:	85 c0                	test   %eax,%eax
c0103ecf:	0f 85 d3 04 00 00    	jne    c01043a8 <_dtoa_r+0xc88>
c0103ed5:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0103ed9:	0f 8e 11 02 00 00    	jle    c01040f0 <_dtoa_r+0x9d0>
c0103edf:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103ee2:	85 c0                	test   %eax,%eax
c0103ee4:	0f 8f 06 02 00 00    	jg     c01040f0 <_dtoa_r+0x9d0>
c0103eea:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103eed:	85 c0                	test   %eax,%eax
c0103eef:	0f 85 e0 01 00 00    	jne    c01040d5 <_dtoa_r+0x9b5>
c0103ef5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ef8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0103eff:	00 
c0103f00:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c0103f07:	00 
c0103f08:	89 34 24             	mov    %esi,(%esp)
c0103f0b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f0f:	e8 fc 13 00 00       	call   c0105310 <__multadd>
c0103f14:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103f17:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f1b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103f1e:	89 04 24             	mov    %eax,(%esp)
c0103f21:	e8 ea 1a 00 00       	call   c0105a10 <__mcmp>
c0103f26:	85 c0                	test   %eax,%eax
c0103f28:	0f 8e a7 01 00 00    	jle    c01040d5 <_dtoa_r+0x9b5>
c0103f2e:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0103f32:	89 fb                	mov    %edi,%ebx
c0103f34:	83 c7 01             	add    $0x1,%edi
c0103f37:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c0103f3b:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0103f42:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103f45:	89 34 24             	mov    %esi,(%esp)
c0103f48:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f4c:	e8 9f 13 00 00       	call   c01052f0 <_Bfree>
c0103f51:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f54:	85 c0                	test   %eax,%eax
c0103f56:	74 18                	je     c0103f70 <_dtoa_r+0x850>
c0103f58:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0103f5b:	0f 85 a7 02 00 00    	jne    c0104208 <_dtoa_r+0xae8>
c0103f61:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f64:	89 34 24             	mov    %esi,(%esp)
c0103f67:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f6b:	e8 80 13 00 00       	call   c01052f0 <_Bfree>
c0103f70:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103f73:	89 34 24             	mov    %esi,(%esp)
c0103f76:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f7a:	e8 71 13 00 00       	call   c01052f0 <_Bfree>
c0103f7f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f82:	8b 75 1c             	mov    0x1c(%ebp),%esi
c0103f85:	c6 07 00             	movb   $0x0,(%edi)
c0103f88:	83 c0 01             	add    $0x1,%eax
c0103f8b:	89 06                	mov    %eax,(%esi)
c0103f8d:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f90:	85 c0                	test   %eax,%eax
c0103f92:	0f 84 90 02 00 00    	je     c0104228 <_dtoa_r+0xb08>
c0103f98:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f9b:	89 38                	mov    %edi,(%eax)
c0103f9d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103fa3:	89 d8                	mov    %ebx,%eax
c0103fa5:	5b                   	pop    %ebx
c0103fa6:	5e                   	pop    %esi
c0103fa7:	5f                   	pop    %edi
c0103fa8:	5d                   	pop    %ebp
c0103fa9:	c3                   	ret    
c0103faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103fb0:	db 45 b8             	fildl  -0x48(%ebp)
c0103fb3:	df e9                	fucomip %st(1),%st
c0103fb5:	dd d8                	fstp   %st(0)
c0103fb7:	7a 06                	jp     c0103fbf <_dtoa_r+0x89f>
c0103fb9:	0f 84 cc f8 ff ff    	je     c010388b <_dtoa_r+0x16b>
c0103fbf:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103fc3:	e9 c3 f8 ff ff       	jmp    c010388b <_dtoa_r+0x16b>
c0103fc8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103fcb:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103fce:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0103fd5:	f7 d8                	neg    %eax
c0103fd7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103fda:	e9 0c f9 ff ff       	jmp    c01038eb <_dtoa_r+0x1cb>
c0103fdf:	90                   	nop
c0103fe0:	f7 d8                	neg    %eax
c0103fe2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103fe5:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c0103fec:	e9 e2 f8 ff ff       	jmp    c01038d3 <_dtoa_r+0x1b3>
c0103ff1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103ff8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103ffb:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c0104000:	29 d9                	sub    %ebx,%ecx
c0104002:	d3 e0                	shl    %cl,%eax
c0104004:	e9 1b f8 ff ff       	jmp    c0103824 <_dtoa_r+0x104>
c0104009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104010:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0104017:	e9 a0 f8 ff ff       	jmp    c01038bc <_dtoa_r+0x19c>
c010401c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104020:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0104024:	0f 8e fe 06 00 00    	jle    c0104728 <_dtoa_r+0x1008>
c010402a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010402d:	83 e8 01             	sub    $0x1,%eax
c0104030:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0104033:	0f 8c 3b 06 00 00    	jl     c0104674 <_dtoa_r+0xf54>
c0104039:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010403c:	29 c2                	sub    %eax,%edx
c010403e:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0104041:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104044:	85 c9                	test   %ecx,%ecx
c0104046:	89 c8                	mov    %ecx,%eax
c0104048:	0f 88 83 07 00 00    	js     c01047d1 <_dtoa_r+0x10b1>
c010404e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104055:	00 
c0104056:	89 34 24             	mov    %esi,(%esp)
c0104059:	89 55 8c             	mov    %edx,-0x74(%ebp)
c010405c:	01 45 a0             	add    %eax,-0x60(%ebp)
c010405f:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104062:	e8 69 15 00 00       	call   c01055d0 <__i2b>
c0104067:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010406a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010406d:	e9 1e fd ff ff       	jmp    c0103d90 <_dtoa_r+0x670>
c0104072:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104078:	d9 c1                	fld    %st(1)
c010407a:	b9 02 00 00 00       	mov    $0x2,%ecx
c010407f:	e9 37 fa ff ff       	jmp    c0103abb <_dtoa_r+0x39b>
c0104084:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104087:	db 45 d4             	fildl  -0x2c(%ebp)
c010408a:	d8 c9                	fmul   %st(1),%st
c010408c:	d8 05 60 83 10 c0    	fadds  0xc0108360
c0104092:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104095:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010409c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01040a0:	d8 25 64 83 10 c0    	fsubs  0xc0108364
c01040a6:	dd 45 c0             	fldl   -0x40(%ebp)
c01040a9:	d9 c9                	fxch   %st(1)
c01040ab:	db e9                	fucomi %st(1),%st
c01040ad:	0f 87 0d 02 00 00    	ja     c01042c0 <_dtoa_r+0xba0>
c01040b3:	d9 c9                	fxch   %st(1)
c01040b5:	d9 e0                	fchs   
c01040b7:	df e9                	fucomip %st(1),%st
c01040b9:	dd d8                	fstp   %st(0)
c01040bb:	0f 86 a7 01 00 00    	jbe    c0104268 <_dtoa_r+0xb48>
c01040c1:	dd d8                	fstp   %st(0)
c01040c3:	eb 02                	jmp    c01040c7 <_dtoa_r+0x9a7>
c01040c5:	dd d8                	fstp   %st(0)
c01040c7:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01040ce:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01040d5:	8b 45 18             	mov    0x18(%ebp),%eax
c01040d8:	89 fb                	mov    %edi,%ebx
c01040da:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01040e1:	f7 d0                	not    %eax
c01040e3:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01040e6:	e9 57 fe ff ff       	jmp    c0103f42 <_dtoa_r+0x822>
c01040eb:	90                   	nop
c01040ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01040f0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01040f3:	85 c0                	test   %eax,%eax
c01040f5:	0f 85 c5 03 00 00    	jne    c01044c0 <_dtoa_r+0xda0>
c01040fb:	89 75 08             	mov    %esi,0x8(%ebp)
c01040fe:	bb 01 00 00 00       	mov    $0x1,%ebx
c0104103:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c0104106:	eb 24                	jmp    c010412c <_dtoa_r+0xa0c>
c0104108:	8b 45 08             	mov    0x8(%ebp),%eax
c010410b:	83 c3 01             	add    $0x1,%ebx
c010410e:	89 74 24 04          	mov    %esi,0x4(%esp)
c0104112:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104119:	00 
c010411a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104121:	00 
c0104122:	89 04 24             	mov    %eax,(%esp)
c0104125:	e8 e6 11 00 00       	call   c0105310 <__multadd>
c010412a:	89 c6                	mov    %eax,%esi
c010412c:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010412f:	89 f0                	mov    %esi,%eax
c0104131:	e8 1a f4 ff ff       	call   c0103550 <quorem>
c0104136:	83 c0 30             	add    $0x30,%eax
c0104139:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c010413c:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c0104140:	7c c6                	jl     c0104108 <_dtoa_r+0x9e8>
c0104142:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104145:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104148:	ba 01 00 00 00       	mov    $0x1,%edx
c010414d:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c0104150:	8b 75 08             	mov    0x8(%ebp),%esi
c0104153:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c010415a:	85 c0                	test   %eax,%eax
c010415c:	0f 4f d0             	cmovg  %eax,%edx
c010415f:	01 fa                	add    %edi,%edx
c0104161:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104164:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010416b:	00 
c010416c:	89 34 24             	mov    %esi,(%esp)
c010416f:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0104172:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104176:	e8 75 17 00 00       	call   c01058f0 <__lshift>
c010417b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c010417e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104182:	89 04 24             	mov    %eax,(%esp)
c0104185:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104188:	e8 83 18 00 00       	call   c0105a10 <__mcmp>
c010418d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0104190:	83 f8 00             	cmp    $0x0,%eax
c0104193:	0f 8e 41 06 00 00    	jle    c01047da <_dtoa_r+0x10ba>
c0104199:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c010419d:	eb 0f                	jmp    c01041ae <_dtoa_r+0xa8e>
c010419f:	90                   	nop
c01041a0:	39 c7                	cmp    %eax,%edi
c01041a2:	0f 84 70 05 00 00    	je     c0104718 <_dtoa_r+0xff8>
c01041a8:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c01041ac:	89 c2                	mov    %eax,%edx
c01041ae:	80 f9 39             	cmp    $0x39,%cl
c01041b1:	8d 42 ff             	lea    -0x1(%edx),%eax
c01041b4:	74 ea                	je     c01041a0 <_dtoa_r+0xa80>
c01041b6:	83 c1 01             	add    $0x1,%ecx
c01041b9:	89 fb                	mov    %edi,%ebx
c01041bb:	88 08                	mov    %cl,(%eax)
c01041bd:	89 d7                	mov    %edx,%edi
c01041bf:	e9 7e fd ff ff       	jmp    c0103f42 <_dtoa_r+0x822>
c01041c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01041c8:	b8 1c 00 00 00       	mov    $0x1c,%eax
c01041cd:	01 45 a0             	add    %eax,-0x60(%ebp)
c01041d0:	01 c3                	add    %eax,%ebx
c01041d2:	01 45 ac             	add    %eax,-0x54(%ebp)
c01041d5:	e9 b6 fc ff ff       	jmp    c0103e90 <_dtoa_r+0x770>
c01041da:	ba 01 00 00 00       	mov    $0x1,%edx
c01041df:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c01041e6:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c01041ed:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c01041f4:	21 c2                	and    %eax,%edx
c01041f6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c01041f9:	31 d2                	xor    %edx,%edx
c01041fb:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0104202:	e9 62 f8 ff ff       	jmp    c0103a69 <_dtoa_r+0x349>
c0104207:	90                   	nop
c0104208:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010420b:	85 d2                	test   %edx,%edx
c010420d:	0f 84 4e fd ff ff    	je     c0103f61 <_dtoa_r+0x841>
c0104213:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104216:	89 34 24             	mov    %esi,(%esp)
c0104219:	89 44 24 04          	mov    %eax,0x4(%esp)
c010421d:	e8 ce 10 00 00       	call   c01052f0 <_Bfree>
c0104222:	e9 3a fd ff ff       	jmp    c0103f61 <_dtoa_r+0x841>
c0104227:	90                   	nop
c0104228:	89 d8                	mov    %ebx,%eax
c010422a:	e9 89 f5 ff ff       	jmp    c01037b8 <_dtoa_r+0x98>
c010422f:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104232:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104236:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104239:	89 34 24             	mov    %esi,(%esp)
c010423c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104240:	e8 8b 15 00 00       	call   c01057d0 <__pow5mult>
c0104245:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104248:	e9 c6 fb ff ff       	jmp    c0103e13 <_dtoa_r+0x6f3>
c010424d:	dd d8                	fstp   %st(0)
c010424f:	dd d8                	fstp   %st(0)
c0104251:	eb 15                	jmp    c0104268 <_dtoa_r+0xb48>
c0104253:	90                   	nop
c0104254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104258:	dd d8                	fstp   %st(0)
c010425a:	dd d8                	fstp   %st(0)
c010425c:	dd d8                	fstp   %st(0)
c010425e:	eb 08                	jmp    c0104268 <_dtoa_r+0xb48>
c0104260:	dd d8                	fstp   %st(0)
c0104262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104268:	dd 5d c0             	fstpl  -0x40(%ebp)
c010426b:	e9 cf f9 ff ff       	jmp    c0103c3f <_dtoa_r+0x51f>
c0104270:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104273:	f7 d8                	neg    %eax
c0104275:	0f 84 6a 04 00 00    	je     c01046e5 <_dtoa_r+0xfc5>
c010427b:	89 c2                	mov    %eax,%edx
c010427d:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104282:	83 e2 0f             	and    $0xf,%edx
c0104285:	c1 f8 04             	sar    $0x4,%eax
c0104288:	dd 04 d5 40 84 10 c0 	fldl   -0x3fef7bc0(,%edx,8)
c010428f:	85 c0                	test   %eax,%eax
c0104291:	d8 c9                	fmul   %st(1),%st
c0104293:	0f 84 4a f8 ff ff    	je     c0103ae3 <_dtoa_r+0x3c3>
c0104299:	31 d2                	xor    %edx,%edx
c010429b:	90                   	nop
c010429c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01042a0:	a8 01                	test   $0x1,%al
c01042a2:	74 0a                	je     c01042ae <_dtoa_r+0xb8e>
c01042a4:	dc 0c d5 00 84 10 c0 	fmull  -0x3fef7c00(,%edx,8)
c01042ab:	83 c1 01             	add    $0x1,%ecx
c01042ae:	83 c2 01             	add    $0x1,%edx
c01042b1:	d1 f8                	sar    %eax
c01042b3:	75 eb                	jne    c01042a0 <_dtoa_r+0xb80>
c01042b5:	e9 29 f8 ff ff       	jmp    c0103ae3 <_dtoa_r+0x3c3>
c01042ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01042c0:	dd d8                	fstp   %st(0)
c01042c2:	dd d8                	fstp   %st(0)
c01042c4:	dd d8                	fstp   %st(0)
c01042c6:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01042cd:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01042d4:	e9 55 fc ff ff       	jmp    c0103f2e <_dtoa_r+0x80e>
c01042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01042e0:	d9 7d d2             	fnstcw -0x2e(%ebp)
c01042e3:	8d 41 ff             	lea    -0x1(%ecx),%eax
c01042e6:	dd 45 c0             	fldl   -0x40(%ebp)
c01042e9:	dc 0c c5 40 84 10 c0 	fmull  -0x3fef7bc0(,%eax,8)
c01042f0:	d9 c9                	fxch   %st(1)
c01042f2:	89 45 88             	mov    %eax,-0x78(%ebp)
c01042f5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01042f9:	8d 57 01             	lea    0x1(%edi),%edx
c01042fc:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c01042ff:	b4 0c                	mov    $0xc,%ah
c0104301:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0104305:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104308:	db 55 d4             	fistl  -0x2c(%ebp)
c010430b:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010430e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104311:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104314:	83 c0 30             	add    $0x30,%eax
c0104317:	83 f9 01             	cmp    $0x1,%ecx
c010431a:	db 45 d4             	fildl  -0x2c(%ebp)
c010431d:	de e9                	fsubrp %st,%st(1)
c010431f:	88 07                	mov    %al,(%edi)
c0104321:	89 d0                	mov    %edx,%eax
c0104323:	74 37                	je     c010435c <_dtoa_r+0xc3c>
c0104325:	d9 05 5c 83 10 c0    	flds   0xc010835c
c010432b:	eb 05                	jmp    c0104332 <_dtoa_r+0xc12>
c010432d:	8d 76 00             	lea    0x0(%esi),%esi
c0104330:	d9 c9                	fxch   %st(1)
c0104332:	dc c9                	fmul   %st,%st(1)
c0104334:	d9 c9                	fxch   %st(1)
c0104336:	83 c0 01             	add    $0x1,%eax
c0104339:	d9 6d d0             	fldcw  -0x30(%ebp)
c010433c:	db 55 d4             	fistl  -0x2c(%ebp)
c010433f:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0104342:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c0104345:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104348:	83 c1 30             	add    $0x30,%ecx
c010434b:	39 d8                	cmp    %ebx,%eax
c010434d:	db 45 d4             	fildl  -0x2c(%ebp)
c0104350:	de e9                	fsubrp %st,%st(1)
c0104352:	88 48 ff             	mov    %cl,-0x1(%eax)
c0104355:	75 d9                	jne    c0104330 <_dtoa_r+0xc10>
c0104357:	dd d9                	fstp   %st(1)
c0104359:	03 55 88             	add    -0x78(%ebp),%edx
c010435c:	d9 05 68 83 10 c0    	flds   0xc0108368
c0104362:	d9 c2                	fld    %st(2)
c0104364:	d8 c1                	fadd   %st(1),%st
c0104366:	d9 ca                	fxch   %st(2)
c0104368:	db ea                	fucomi %st(2),%st
c010436a:	dd da                	fstp   %st(2)
c010436c:	0f 86 7f 03 00 00    	jbe    c01046f1 <_dtoa_r+0xfd1>
c0104372:	dd d8                	fstp   %st(0)
c0104374:	dd d8                	fstp   %st(0)
c0104376:	dd d8                	fstp   %st(0)
c0104378:	dd d8                	fstp   %st(0)
c010437a:	89 fb                	mov    %edi,%ebx
c010437c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0104380:	89 d7                	mov    %edx,%edi
c0104382:	e9 d7 f9 ff ff       	jmp    c0103d5e <_dtoa_r+0x63e>
c0104387:	90                   	nop
c0104388:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010438b:	8b 41 10             	mov    0x10(%ecx),%eax
c010438e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c0104392:	89 04 24             	mov    %eax,(%esp)
c0104395:	e8 56 11 00 00       	call   c01054f0 <__hi0bits>
c010439a:	ba 20 00 00 00       	mov    $0x20,%edx
c010439f:	29 c2                	sub    %eax,%edx
c01043a1:	e9 bb fa ff ff       	jmp    c0103e61 <_dtoa_r+0x741>
c01043a6:	66 90                	xchg   %ax,%ax
c01043a8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01043ab:	89 44 24 04          	mov    %eax,0x4(%esp)
c01043af:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01043b2:	89 04 24             	mov    %eax,(%esp)
c01043b5:	e8 56 16 00 00       	call   c0105a10 <__mcmp>
c01043ba:	85 c0                	test   %eax,%eax
c01043bc:	0f 89 13 fb ff ff    	jns    c0103ed5 <_dtoa_r+0x7b5>
c01043c2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01043c5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01043cc:	00 
c01043cd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01043d4:	00 
c01043d5:	89 34 24             	mov    %esi,(%esp)
c01043d8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01043dc:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c01043e0:	e8 2b 0f 00 00       	call   c0105310 <__multadd>
c01043e5:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01043e8:	85 c9                	test   %ecx,%ecx
c01043ea:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01043ed:	0f 85 8d 00 00 00    	jne    c0104480 <_dtoa_r+0xd60>
c01043f3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c01043f7:	8b 45 90             	mov    -0x70(%ebp),%eax
c01043fa:	7f 0a                	jg     c0104406 <_dtoa_r+0xce6>
c01043fc:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104400:	0f 8f ff 04 00 00    	jg     c0104905 <_dtoa_r+0x11e5>
c0104406:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104409:	e9 ed fc ff ff       	jmp    c01040fb <_dtoa_r+0x9db>
c010440e:	66 90                	xchg   %ax,%ax
c0104410:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104413:	85 db                	test   %ebx,%ebx
c0104415:	0f 85 aa fc ff ff    	jne    c01040c5 <_dtoa_r+0x9a5>
c010441b:	d8 0d 64 83 10 c0    	fmuls  0xc0108364
c0104421:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0104428:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c010442f:	dd 45 c0             	fldl   -0x40(%ebp)
c0104432:	d9 c9                	fxch   %st(1)
c0104434:	df e9                	fucomip %st(1),%st
c0104436:	dd d8                	fstp   %st(0)
c0104438:	0f 83 97 fc ff ff    	jae    c01040d5 <_dtoa_r+0x9b5>
c010443e:	e9 eb fa ff ff       	jmp    c0103f2e <_dtoa_r+0x80e>
c0104443:	90                   	nop
c0104444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104448:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010444b:	85 c0                	test   %eax,%eax
c010444d:	0f 85 fe f9 ff ff    	jne    c0103e51 <_dtoa_r+0x731>
c0104453:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0104456:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c010445b:	0f 85 f0 f9 ff ff    	jne    c0103e51 <_dtoa_r+0x731>
c0104461:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c0104466:	0f 84 e5 f9 ff ff    	je     c0103e51 <_dtoa_r+0x731>
c010446c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c0104470:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c0104474:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c010447b:	e9 d1 f9 ff ff       	jmp    c0103e51 <_dtoa_r+0x731>
c0104480:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104483:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010448a:	00 
c010448b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104492:	00 
c0104493:	89 34 24             	mov    %esi,(%esp)
c0104496:	89 44 24 04          	mov    %eax,0x4(%esp)
c010449a:	e8 71 0e 00 00       	call   c0105310 <__multadd>
c010449f:	8b 55 90             	mov    -0x70(%ebp),%edx
c01044a2:	85 d2                	test   %edx,%edx
c01044a4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01044a7:	8b 45 90             	mov    -0x70(%ebp),%eax
c01044aa:	7f 0a                	jg     c01044b6 <_dtoa_r+0xd96>
c01044ac:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01044b0:	0f 8f 4f 04 00 00    	jg     c0104905 <_dtoa_r+0x11e5>
c01044b6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01044b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01044c0:	85 db                	test   %ebx,%ebx
c01044c2:	7e 16                	jle    c01044da <_dtoa_r+0xdba>
c01044c4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01044c7:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01044cb:	89 34 24             	mov    %esi,(%esp)
c01044ce:	89 44 24 04          	mov    %eax,0x4(%esp)
c01044d2:	e8 19 14 00 00       	call   c01058f0 <__lshift>
c01044d7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01044da:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c01044dd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01044e0:	85 db                	test   %ebx,%ebx
c01044e2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01044e5:	0f 85 11 03 00 00    	jne    c01047fc <_dtoa_r+0x10dc>
c01044eb:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01044ee:	8d 5f 01             	lea    0x1(%edi),%ebx
c01044f1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c01044f4:	01 f8                	add    %edi,%eax
c01044f6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c01044f9:	89 45 90             	mov    %eax,-0x70(%ebp)
c01044fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01044ff:	83 e0 01             	and    $0x1,%eax
c0104502:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0104505:	eb 2e                	jmp    c0104535 <_dtoa_r+0xe15>
c0104507:	90                   	nop
c0104508:	e8 03 0e 00 00       	call   c0105310 <__multadd>
c010450d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104514:	00 
c0104515:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010451c:	00 
c010451d:	89 34 24             	mov    %esi,(%esp)
c0104520:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104523:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104526:	89 44 24 04          	mov    %eax,0x4(%esp)
c010452a:	e8 e1 0d 00 00       	call   c0105310 <__multadd>
c010452f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104532:	83 c3 01             	add    $0x1,%ebx
c0104535:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104538:	8d 43 ff             	lea    -0x1(%ebx),%eax
c010453b:	89 45 98             	mov    %eax,-0x68(%ebp)
c010453e:	89 f8                	mov    %edi,%eax
c0104540:	e8 0b f0 ff ff       	call   c0103550 <quorem>
c0104545:	89 3c 24             	mov    %edi,(%esp)
c0104548:	8d 48 30             	lea    0x30(%eax),%ecx
c010454b:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c010454e:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104551:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104554:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104558:	e8 b3 14 00 00       	call   c0105a10 <__mcmp>
c010455d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c0104560:	89 34 24             	mov    %esi,(%esp)
c0104563:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104567:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010456a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010456d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104571:	e8 ea 14 00 00       	call   c0105a60 <__mdiff>
c0104576:	8b 48 0c             	mov    0xc(%eax),%ecx
c0104579:	89 c2                	mov    %eax,%edx
c010457b:	85 c9                	test   %ecx,%ecx
c010457d:	0f 85 c5 00 00 00    	jne    c0104648 <_dtoa_r+0xf28>
c0104583:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104587:	89 3c 24             	mov    %edi,(%esp)
c010458a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010458d:	e8 7e 14 00 00       	call   c0105a10 <__mcmp>
c0104592:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104595:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104599:	89 34 24             	mov    %esi,(%esp)
c010459c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010459f:	e8 4c 0d 00 00       	call   c01052f0 <_Bfree>
c01045a4:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01045a7:	89 c1                	mov    %eax,%ecx
c01045a9:	0b 4d 14             	or     0x14(%ebp),%ecx
c01045ac:	75 0b                	jne    c01045b9 <_dtoa_r+0xe99>
c01045ae:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01045b1:	85 d2                	test   %edx,%edx
c01045b3:	0f 84 fb 02 00 00    	je     c01048b4 <_dtoa_r+0x1194>
c01045b9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01045bc:	85 d2                	test   %edx,%edx
c01045be:	0f 88 7f 01 00 00    	js     c0104743 <_dtoa_r+0x1023>
c01045c4:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c01045c7:	0b 4d 14             	or     0x14(%ebp),%ecx
c01045ca:	75 0b                	jne    c01045d7 <_dtoa_r+0xeb7>
c01045cc:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c01045cf:	85 c9                	test   %ecx,%ecx
c01045d1:	0f 84 6c 01 00 00    	je     c0104743 <_dtoa_r+0x1023>
c01045d7:	85 c0                	test   %eax,%eax
c01045d9:	0f 8f 82 02 00 00    	jg     c0104861 <_dtoa_r+0x1141>
c01045df:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c01045e3:	89 da                	mov    %ebx,%edx
c01045e5:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c01045e8:	88 43 ff             	mov    %al,-0x1(%ebx)
c01045eb:	0f 84 8d 02 00 00    	je     c010487e <_dtoa_r+0x115e>
c01045f1:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01045f5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045fc:	00 
c01045fd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104604:	00 
c0104605:	89 34 24             	mov    %esi,(%esp)
c0104608:	e8 03 0d 00 00       	call   c0105310 <__multadd>
c010460d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104614:	00 
c0104615:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010461c:	00 
c010461d:	89 34 24             	mov    %esi,(%esp)
c0104620:	89 c7                	mov    %eax,%edi
c0104622:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104625:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c0104628:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010462b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010462f:	0f 85 d3 fe ff ff    	jne    c0104508 <_dtoa_r+0xde8>
c0104635:	e8 d6 0c 00 00       	call   c0105310 <__multadd>
c010463a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010463d:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104640:	e9 ed fe ff ff       	jmp    c0104532 <_dtoa_r+0xe12>
c0104645:	8d 76 00             	lea    0x0(%esi),%esi
c0104648:	b8 01 00 00 00       	mov    $0x1,%eax
c010464d:	e9 43 ff ff ff       	jmp    c0104595 <_dtoa_r+0xe75>
c0104652:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104659:	e9 d2 f2 ff ff       	jmp    c0103930 <_dtoa_r+0x210>
c010465e:	0f 85 87 f6 ff ff    	jne    c0103ceb <_dtoa_r+0x5cb>
c0104664:	dd d8                	fstp   %st(0)
c0104666:	dd d8                	fstp   %st(0)
c0104668:	dd d8                	fstp   %st(0)
c010466a:	89 fb                	mov    %edi,%ebx
c010466c:	8b 7d c0             	mov    -0x40(%ebp),%edi
c010466f:	e9 fc f8 ff ff       	jmp    c0103f70 <_dtoa_r+0x850>
c0104674:	89 c2                	mov    %eax,%edx
c0104676:	2b 55 b0             	sub    -0x50(%ebp),%edx
c0104679:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010467c:	01 55 94             	add    %edx,-0x6c(%ebp)
c010467f:	31 d2                	xor    %edx,%edx
c0104681:	e9 b8 f9 ff ff       	jmp    c010403e <_dtoa_r+0x91e>
c0104686:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104689:	85 c0                	test   %eax,%eax
c010468b:	0f 84 f3 f9 ff ff    	je     c0104084 <_dtoa_r+0x964>
c0104691:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104694:	85 c0                	test   %eax,%eax
c0104696:	0f 8e c4 fb ff ff    	jle    c0104260 <_dtoa_r+0xb40>
c010469c:	d8 0d 5c 83 10 c0    	fmuls  0xc010835c
c01046a2:	83 c1 01             	add    $0x1,%ecx
c01046a5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01046a8:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c01046ab:	89 c1                	mov    %eax,%ecx
c01046ad:	83 eb 01             	sub    $0x1,%ebx
c01046b0:	db 45 d4             	fildl  -0x2c(%ebp)
c01046b3:	d8 c9                	fmul   %st(1),%st
c01046b5:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c01046b8:	d8 05 60 83 10 c0    	fadds  0xc0108360
c01046be:	dd 5d c0             	fstpl  -0x40(%ebp)
c01046c1:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c01046c8:	e9 53 f4 ff ff       	jmp    c0103b20 <_dtoa_r+0x400>
c01046cd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01046d0:	c6 03 30             	movb   $0x30,(%ebx)
c01046d3:	83 c0 01             	add    $0x1,%eax
c01046d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01046d9:	b8 31 00 00 00       	mov    $0x31,%eax
c01046de:	88 02                	mov    %al,(%edx)
c01046e0:	e9 8b f8 ff ff       	jmp    c0103f70 <_dtoa_r+0x850>
c01046e5:	d9 c0                	fld    %st(0)
c01046e7:	b9 02 00 00 00       	mov    $0x2,%ecx
c01046ec:	e9 f2 f3 ff ff       	jmp    c0103ae3 <_dtoa_r+0x3c3>
c01046f1:	de e2                	fsubp  %st,%st(2)
c01046f3:	d9 c9                	fxch   %st(1)
c01046f5:	df e9                	fucomip %st(1),%st
c01046f7:	dd d8                	fstp   %st(0)
c01046f9:	0f 86 69 fb ff ff    	jbe    c0104268 <_dtoa_r+0xb48>
c01046ff:	dd d8                	fstp   %st(0)
c0104701:	eb 07                	jmp    c010470a <_dtoa_r+0xfea>
c0104703:	90                   	nop
c0104704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104708:	89 c2                	mov    %eax,%edx
c010470a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c010470e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104711:	74 f5                	je     c0104708 <_dtoa_r+0xfe8>
c0104713:	e9 d9 f4 ff ff       	jmp    c0103bf1 <_dtoa_r+0x4d1>
c0104718:	c6 07 31             	movb   $0x31,(%edi)
c010471b:	89 fb                	mov    %edi,%ebx
c010471d:	89 d7                	mov    %edx,%edi
c010471f:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0104723:	e9 1a f8 ff ff       	jmp    c0103f42 <_dtoa_r+0x822>
c0104728:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010472b:	85 d2                	test   %edx,%edx
c010472d:	0f 84 1b 01 00 00    	je     c010484e <_dtoa_r+0x112e>
c0104733:	05 33 04 00 00       	add    $0x433,%eax
c0104738:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010473b:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010473e:	e9 0b f9 ff ff       	jmp    c010404e <_dtoa_r+0x92e>
c0104743:	85 c0                	test   %eax,%eax
c0104745:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104748:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010474b:	7e 45                	jle    c0104792 <_dtoa_r+0x1072>
c010474d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104750:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104757:	00 
c0104758:	89 34 24             	mov    %esi,(%esp)
c010475b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010475f:	e8 8c 11 00 00       	call   c01058f0 <__lshift>
c0104764:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c0104767:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010476b:	89 04 24             	mov    %eax,(%esp)
c010476e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104771:	e8 9a 12 00 00       	call   c0105a10 <__mcmp>
c0104776:	83 f8 00             	cmp    $0x0,%eax
c0104779:	0f 8e 5b 01 00 00    	jle    c01048da <_dtoa_r+0x11ba>
c010477f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104783:	0f 84 0c 01 00 00    	je     c0104895 <_dtoa_r+0x1175>
c0104789:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010478c:	83 c0 31             	add    $0x31,%eax
c010478f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104792:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104795:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104799:	89 cb                	mov    %ecx,%ebx
c010479b:	88 03                	mov    %al,(%ebx)
c010479d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01047a0:	89 fb                	mov    %edi,%ebx
c01047a2:	8d 79 01             	lea    0x1(%ecx),%edi
c01047a5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01047a8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01047ab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01047ae:	e9 8f f7 ff ff       	jmp    c0103f42 <_dtoa_r+0x822>
c01047b3:	dd d8                	fstp   %st(0)
c01047b5:	dd d8                	fstp   %st(0)
c01047b7:	dd d8                	fstp   %st(0)
c01047b9:	eb 0d                	jmp    c01047c8 <_dtoa_r+0x10a8>
c01047bb:	90                   	nop
c01047bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01047c0:	dd d8                	fstp   %st(0)
c01047c2:	dd d8                	fstp   %st(0)
c01047c4:	dd d8                	fstp   %st(0)
c01047c6:	dd d8                	fstp   %st(0)
c01047c8:	89 fb                	mov    %edi,%ebx
c01047ca:	89 d7                	mov    %edx,%edi
c01047cc:	e9 8d f5 ff ff       	jmp    c0103d5e <_dtoa_r+0x63e>
c01047d1:	29 cb                	sub    %ecx,%ebx
c01047d3:	31 c0                	xor    %eax,%eax
c01047d5:	e9 74 f8 ff ff       	jmp    c010404e <_dtoa_r+0x92e>
c01047da:	75 0e                	jne    c01047ea <_dtoa_r+0x10ca>
c01047dc:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c01047e0:	74 08                	je     c01047ea <_dtoa_r+0x10ca>
c01047e2:	e9 b2 f9 ff ff       	jmp    c0104199 <_dtoa_r+0xa79>
c01047e7:	90                   	nop
c01047e8:	89 c2                	mov    %eax,%edx
c01047ea:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c01047ee:	8d 42 ff             	lea    -0x1(%edx),%eax
c01047f1:	74 f5                	je     c01047e8 <_dtoa_r+0x10c8>
c01047f3:	89 fb                	mov    %edi,%ebx
c01047f5:	89 d7                	mov    %edx,%edi
c01047f7:	e9 46 f7 ff ff       	jmp    c0103f42 <_dtoa_r+0x822>
c01047fc:	8b 40 04             	mov    0x4(%eax),%eax
c01047ff:	89 34 24             	mov    %esi,(%esp)
c0104802:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104806:	e8 45 0a 00 00       	call   c0105250 <_Balloc>
c010480b:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c010480e:	89 c3                	mov    %eax,%ebx
c0104810:	8b 41 10             	mov    0x10(%ecx),%eax
c0104813:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c010481a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010481e:	89 c8                	mov    %ecx,%eax
c0104820:	83 c0 0c             	add    $0xc,%eax
c0104823:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104827:	8d 43 0c             	lea    0xc(%ebx),%eax
c010482a:	89 04 24             	mov    %eax,(%esp)
c010482d:	e8 6e cc ff ff       	call   c01014a0 <memcpy>
c0104832:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104839:	00 
c010483a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010483e:	89 34 24             	mov    %esi,(%esp)
c0104841:	e8 aa 10 00 00       	call   c01058f0 <__lshift>
c0104846:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104849:	e9 9d fc ff ff       	jmp    c01044eb <_dtoa_r+0xdcb>
c010484e:	b8 36 00 00 00       	mov    $0x36,%eax
c0104853:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104856:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0104859:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010485c:	e9 ed f7 ff ff       	jmp    c010404e <_dtoa_r+0x92e>
c0104861:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104865:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104868:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010486b:	74 28                	je     c0104895 <_dtoa_r+0x1175>
c010486d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104871:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104874:	83 c0 01             	add    $0x1,%eax
c0104877:	89 cb                	mov    %ecx,%ebx
c0104879:	e9 1d ff ff ff       	jmp    c010479b <_dtoa_r+0x107b>
c010487e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104881:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104884:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104887:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010488a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010488d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104890:	e9 cc f8 ff ff       	jmp    c0104161 <_dtoa_r+0xa41>
c0104895:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104898:	b9 39 00 00 00       	mov    $0x39,%ecx
c010489d:	8d 50 01             	lea    0x1(%eax),%edx
c01048a0:	c6 00 39             	movb   $0x39,(%eax)
c01048a3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01048a6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01048a9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01048ac:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01048af:	e9 fa f8 ff ff       	jmp    c01041ae <_dtoa_r+0xa8e>
c01048b4:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01048b7:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c01048ba:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c01048bd:	83 fb 39             	cmp    $0x39,%ebx
c01048c0:	74 d3                	je     c0104895 <_dtoa_r+0x1175>
c01048c2:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c01048c5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01048c8:	83 c0 31             	add    $0x31,%eax
c01048cb:	85 c9                	test   %ecx,%ecx
c01048cd:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01048d0:	0f 4e c3             	cmovle %ebx,%eax
c01048d3:	89 cb                	mov    %ecx,%ebx
c01048d5:	e9 c1 fe ff ff       	jmp    c010479b <_dtoa_r+0x107b>
c01048da:	0f 85 b2 fe ff ff    	jne    c0104792 <_dtoa_r+0x1072>
c01048e0:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c01048e4:	0f 84 a8 fe ff ff    	je     c0104792 <_dtoa_r+0x1072>
c01048ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01048f0:	e9 8a fe ff ff       	jmp    c010477f <_dtoa_r+0x105f>
c01048f5:	0f 85 c7 f3 ff ff    	jne    c0103cc2 <_dtoa_r+0x5a2>
c01048fb:	dd d8                	fstp   %st(0)
c01048fd:	dd d8                	fstp   %st(0)
c01048ff:	90                   	nop
c0104900:	e9 65 fd ff ff       	jmp    c010466a <_dtoa_r+0xf4a>
c0104905:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104908:	e9 dd f5 ff ff       	jmp    c0103eea <_dtoa_r+0x7ca>
c010490d:	8d 76 00             	lea    0x0(%esi),%esi
c0104910:	0f 84 7a f5 ff ff    	je     c0103e90 <_dtoa_r+0x770>
c0104916:	b8 3c 00 00 00       	mov    $0x3c,%eax
c010491b:	29 d0                	sub    %edx,%eax
c010491d:	e9 ab f8 ff ff       	jmp    c01041cd <_dtoa_r+0xaad>
c0104922:	b8 01 00 00 00       	mov    $0x1,%eax
c0104927:	e9 d9 ef ff ff       	jmp    c0103905 <_dtoa_r+0x1e5>
c010492c:	31 d2                	xor    %edx,%edx
c010492e:	e9 36 f1 ff ff       	jmp    c0103a69 <_dtoa_r+0x349>
c0104933:	66 90                	xchg   %ax,%ax
c0104935:	66 90                	xchg   %ax,%ax
c0104937:	66 90                	xchg   %ax,%ax
c0104939:	66 90                	xchg   %ax,%ax
c010493b:	66 90                	xchg   %ax,%ax
c010493d:	66 90                	xchg   %ax,%ax
c010493f:	90                   	nop

c0104940 <_setlocale_r>:
c0104940:	55                   	push   %ebp
c0104941:	89 e5                	mov    %esp,%ebp
c0104943:	53                   	push   %ebx
c0104944:	83 ec 14             	sub    $0x14,%esp
c0104947:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010494a:	85 db                	test   %ebx,%ebx
c010494c:	74 14                	je     c0104962 <_setlocale_r+0x22>
c010494e:	c7 44 24 04 88 83 10 	movl   $0xc0108388,0x4(%esp)
c0104955:	c0 
c0104956:	89 1c 24             	mov    %ebx,(%esp)
c0104959:	e8 82 17 00 00       	call   c01060e0 <strcmp>
c010495e:	85 c0                	test   %eax,%eax
c0104960:	75 0e                	jne    c0104970 <_setlocale_r+0x30>
c0104962:	83 c4 14             	add    $0x14,%esp
c0104965:	b8 80 81 10 c0       	mov    $0xc0108180,%eax
c010496a:	5b                   	pop    %ebx
c010496b:	5d                   	pop    %ebp
c010496c:	c3                   	ret    
c010496d:	8d 76 00             	lea    0x0(%esi),%esi
c0104970:	c7 44 24 04 80 81 10 	movl   $0xc0108180,0x4(%esp)
c0104977:	c0 
c0104978:	89 1c 24             	mov    %ebx,(%esp)
c010497b:	e8 60 17 00 00       	call   c01060e0 <strcmp>
c0104980:	85 c0                	test   %eax,%eax
c0104982:	74 de                	je     c0104962 <_setlocale_r+0x22>
c0104984:	89 1c 24             	mov    %ebx,(%esp)
c0104987:	c7 44 24 04 ba 81 10 	movl   $0xc01081ba,0x4(%esp)
c010498e:	c0 
c010498f:	e8 4c 17 00 00       	call   c01060e0 <strcmp>
c0104994:	89 c2                	mov    %eax,%edx
c0104996:	31 c0                	xor    %eax,%eax
c0104998:	85 d2                	test   %edx,%edx
c010499a:	ba 80 81 10 c0       	mov    $0xc0108180,%edx
c010499f:	0f 44 c2             	cmove  %edx,%eax
c01049a2:	83 c4 14             	add    $0x14,%esp
c01049a5:	5b                   	pop    %ebx
c01049a6:	5d                   	pop    %ebp
c01049a7:	c3                   	ret    
c01049a8:	90                   	nop
c01049a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01049b0 <__locale_charset>:
c01049b0:	55                   	push   %ebp
c01049b1:	b8 a0 a4 10 c0       	mov    $0xc010a4a0,%eax
c01049b6:	89 e5                	mov    %esp,%ebp
c01049b8:	5d                   	pop    %ebp
c01049b9:	c3                   	ret    
c01049ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049c0 <__locale_mb_cur_max>:
c01049c0:	55                   	push   %ebp
c01049c1:	a1 f8 a4 10 c0       	mov    0xc010a4f8,%eax
c01049c6:	89 e5                	mov    %esp,%ebp
c01049c8:	5d                   	pop    %ebp
c01049c9:	c3                   	ret    
c01049ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049d0 <__locale_msgcharset>:
c01049d0:	55                   	push   %ebp
c01049d1:	b8 80 a4 10 c0       	mov    $0xc010a480,%eax
c01049d6:	89 e5                	mov    %esp,%ebp
c01049d8:	5d                   	pop    %ebp
c01049d9:	c3                   	ret    
c01049da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049e0 <__locale_cjk_lang>:
c01049e0:	55                   	push   %ebp
c01049e1:	31 c0                	xor    %eax,%eax
c01049e3:	89 e5                	mov    %esp,%ebp
c01049e5:	5d                   	pop    %ebp
c01049e6:	c3                   	ret    
c01049e7:	89 f6                	mov    %esi,%esi
c01049e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01049f0 <_localeconv_r>:
c01049f0:	55                   	push   %ebp
c01049f1:	b8 c0 a4 10 c0       	mov    $0xc010a4c0,%eax
c01049f6:	89 e5                	mov    %esp,%ebp
c01049f8:	5d                   	pop    %ebp
c01049f9:	c3                   	ret    
c01049fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104a00 <setlocale>:
c0104a00:	55                   	push   %ebp
c0104a01:	89 e5                	mov    %esp,%ebp
c0104a03:	83 ec 18             	sub    $0x18,%esp
c0104a06:	e8 35 cc ff ff       	call   c0101640 <__getreent>
c0104a0b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104a0e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0104a12:	8b 55 08             	mov    0x8(%ebp),%edx
c0104a15:	89 04 24             	mov    %eax,(%esp)
c0104a18:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104a1c:	e8 1f ff ff ff       	call   c0104940 <_setlocale_r>
c0104a21:	c9                   	leave  
c0104a22:	c3                   	ret    
c0104a23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0104a30 <localeconv>:
c0104a30:	55                   	push   %ebp
c0104a31:	89 e5                	mov    %esp,%ebp
c0104a33:	83 ec 08             	sub    $0x8,%esp
c0104a36:	e8 05 cc ff ff       	call   c0101640 <__getreent>
c0104a3b:	b8 c0 a4 10 c0       	mov    $0xc010a4c0,%eax
c0104a40:	c9                   	leave  
c0104a41:	c3                   	ret    
c0104a42:	66 90                	xchg   %ax,%ax
c0104a44:	66 90                	xchg   %ax,%ax
c0104a46:	66 90                	xchg   %ax,%ax
c0104a48:	66 90                	xchg   %ax,%ax
c0104a4a:	66 90                	xchg   %ax,%ax
c0104a4c:	66 90                	xchg   %ax,%ax
c0104a4e:	66 90                	xchg   %ax,%ax

c0104a50 <_malloc_r>:
c0104a50:	55                   	push   %ebp
c0104a51:	89 e5                	mov    %esp,%ebp
c0104a53:	57                   	push   %edi
c0104a54:	56                   	push   %esi
c0104a55:	53                   	push   %ebx
c0104a56:	83 ec 2c             	sub    $0x2c,%esp
c0104a59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a5c:	8d 50 0b             	lea    0xb(%eax),%edx
c0104a5f:	83 fa 16             	cmp    $0x16,%edx
c0104a62:	76 6c                	jbe    c0104ad0 <_malloc_r+0x80>
c0104a64:	89 d7                	mov    %edx,%edi
c0104a66:	83 e7 f8             	and    $0xfffffff8,%edi
c0104a69:	89 fe                	mov    %edi,%esi
c0104a6b:	c1 ee 1f             	shr    $0x1f,%esi
c0104a6e:	39 c7                	cmp    %eax,%edi
c0104a70:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a73:	89 f2                	mov    %esi,%edx
c0104a75:	72 67                	jb     c0104ade <_malloc_r+0x8e>
c0104a77:	84 d2                	test   %dl,%dl
c0104a79:	75 63                	jne    c0104ade <_malloc_r+0x8e>
c0104a7b:	89 04 24             	mov    %eax,(%esp)
c0104a7e:	e8 ad 07 00 00       	call   c0105230 <__malloc_lock>
c0104a83:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0104a89:	77 65                	ja     c0104af0 <_malloc_r+0xa0>
c0104a8b:	89 fa                	mov    %edi,%edx
c0104a8d:	c1 ea 03             	shr    $0x3,%edx
c0104a90:	8d 04 d5 20 a5 10 c0 	lea    -0x3fef5ae0(,%edx,8),%eax
c0104a97:	8b 58 0c             	mov    0xc(%eax),%ebx
c0104a9a:	39 c3                	cmp    %eax,%ebx
c0104a9c:	0f 84 3e 05 00 00    	je     c0104fe0 <_malloc_r+0x590>
c0104aa2:	8b 43 04             	mov    0x4(%ebx),%eax
c0104aa5:	83 e0 fc             	and    $0xfffffffc,%eax
c0104aa8:	8b 53 0c             	mov    0xc(%ebx),%edx
c0104aab:	8b 4b 08             	mov    0x8(%ebx),%ecx
c0104aae:	89 51 0c             	mov    %edx,0xc(%ecx)
c0104ab1:	89 4a 08             	mov    %ecx,0x8(%edx)
c0104ab4:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104ab9:	8b 45 08             	mov    0x8(%ebp),%eax
c0104abc:	89 04 24             	mov    %eax,(%esp)
c0104abf:	e8 7c 07 00 00       	call   c0105240 <__malloc_unlock>
c0104ac4:	8d 43 08             	lea    0x8(%ebx),%eax
c0104ac7:	83 c4 2c             	add    $0x2c,%esp
c0104aca:	5b                   	pop    %ebx
c0104acb:	5e                   	pop    %esi
c0104acc:	5f                   	pop    %edi
c0104acd:	5d                   	pop    %ebp
c0104ace:	c3                   	ret    
c0104acf:	90                   	nop
c0104ad0:	bf 10 00 00 00       	mov    $0x10,%edi
c0104ad5:	31 d2                	xor    %edx,%edx
c0104ad7:	39 c7                	cmp    %eax,%edi
c0104ad9:	8b 45 08             	mov    0x8(%ebp),%eax
c0104adc:	73 99                	jae    c0104a77 <_malloc_r+0x27>
c0104ade:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0104ae4:	83 c4 2c             	add    $0x2c,%esp
c0104ae7:	31 c0                	xor    %eax,%eax
c0104ae9:	5b                   	pop    %ebx
c0104aea:	5e                   	pop    %esi
c0104aeb:	5f                   	pop    %edi
c0104aec:	5d                   	pop    %ebp
c0104aed:	c3                   	ret    
c0104aee:	66 90                	xchg   %ax,%ax
c0104af0:	89 fe                	mov    %edi,%esi
c0104af2:	c1 ee 09             	shr    $0x9,%esi
c0104af5:	85 f6                	test   %esi,%esi
c0104af7:	0f 84 ab 01 00 00    	je     c0104ca8 <_malloc_r+0x258>
c0104afd:	83 fe 04             	cmp    $0x4,%esi
c0104b00:	0f 87 8a 03 00 00    	ja     c0104e90 <_malloc_r+0x440>
c0104b06:	89 fe                	mov    %edi,%esi
c0104b08:	c1 ee 06             	shr    $0x6,%esi
c0104b0b:	83 c6 38             	add    $0x38,%esi
c0104b0e:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104b11:	8d 0c 85 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,4),%ecx
c0104b18:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104b1b:	39 d9                	cmp    %ebx,%ecx
c0104b1d:	75 18                	jne    c0104b37 <_malloc_r+0xe7>
c0104b1f:	eb 28                	jmp    c0104b49 <_malloc_r+0xf9>
c0104b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104b28:	85 d2                	test   %edx,%edx
c0104b2a:	0f 89 78 ff ff ff    	jns    c0104aa8 <_malloc_r+0x58>
c0104b30:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104b33:	39 d9                	cmp    %ebx,%ecx
c0104b35:	74 12                	je     c0104b49 <_malloc_r+0xf9>
c0104b37:	8b 43 04             	mov    0x4(%ebx),%eax
c0104b3a:	83 e0 fc             	and    $0xfffffffc,%eax
c0104b3d:	89 c2                	mov    %eax,%edx
c0104b3f:	29 fa                	sub    %edi,%edx
c0104b41:	83 fa 0f             	cmp    $0xf,%edx
c0104b44:	7e e2                	jle    c0104b28 <_malloc_r+0xd8>
c0104b46:	83 ee 01             	sub    $0x1,%esi
c0104b49:	8d 46 01             	lea    0x1(%esi),%eax
c0104b4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b4f:	8b 1d 30 a5 10 c0    	mov    0xc010a530,%ebx
c0104b55:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c0104b5a:	81 fb 28 a5 10 c0    	cmp    $0xc010a528,%ebx
c0104b60:	74 6b                	je     c0104bcd <_malloc_r+0x17d>
c0104b62:	8b 73 04             	mov    0x4(%ebx),%esi
c0104b65:	83 e6 fc             	and    $0xfffffffc,%esi
c0104b68:	89 f0                	mov    %esi,%eax
c0104b6a:	29 f8                	sub    %edi,%eax
c0104b6c:	83 f8 0f             	cmp    $0xf,%eax
c0104b6f:	0f 8f a3 03 00 00    	jg     c0104f18 <_malloc_r+0x4c8>
c0104b75:	85 c0                	test   %eax,%eax
c0104b77:	c7 05 34 a5 10 c0 28 	movl   $0xc010a528,0xc010a534
c0104b7e:	a5 10 c0 
c0104b81:	c7 05 30 a5 10 c0 28 	movl   $0xc010a528,0xc010a530
c0104b88:	a5 10 c0 
c0104b8b:	0f 89 27 01 00 00    	jns    c0104cb8 <_malloc_r+0x268>
c0104b91:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0104b97:	0f 87 1b 03 00 00    	ja     c0104eb8 <_malloc_r+0x468>
c0104b9d:	c1 ee 03             	shr    $0x3,%esi
c0104ba0:	b8 01 00 00 00       	mov    $0x1,%eax
c0104ba5:	89 f1                	mov    %esi,%ecx
c0104ba7:	8d 14 f5 20 a5 10 c0 	lea    -0x3fef5ae0(,%esi,8),%edx
c0104bae:	c1 f9 02             	sar    $0x2,%ecx
c0104bb1:	d3 e0                	shl    %cl,%eax
c0104bb3:	8b 4a 08             	mov    0x8(%edx),%ecx
c0104bb6:	0b 05 24 a5 10 c0    	or     0xc010a524,%eax
c0104bbc:	89 53 0c             	mov    %edx,0xc(%ebx)
c0104bbf:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0104bc2:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c0104bc7:	89 5a 08             	mov    %ebx,0x8(%edx)
c0104bca:	89 59 0c             	mov    %ebx,0xc(%ecx)
c0104bcd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104bd0:	be 01 00 00 00       	mov    $0x1,%esi
c0104bd5:	c1 f9 02             	sar    $0x2,%ecx
c0104bd8:	d3 e6                	shl    %cl,%esi
c0104bda:	39 c6                	cmp    %eax,%esi
c0104bdc:	0f 87 f6 00 00 00    	ja     c0104cd8 <_malloc_r+0x288>
c0104be2:	85 f0                	test   %esi,%eax
c0104be4:	0f 85 76 03 00 00    	jne    c0104f60 <_malloc_r+0x510>
c0104bea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104bed:	01 f6                	add    %esi,%esi
c0104bef:	83 e2 fc             	and    $0xfffffffc,%edx
c0104bf2:	85 f0                	test   %esi,%eax
c0104bf4:	8d 4a 04             	lea    0x4(%edx),%ecx
c0104bf7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104bfa:	0f 85 60 03 00 00    	jne    c0104f60 <_malloc_r+0x510>
c0104c00:	89 ca                	mov    %ecx,%edx
c0104c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104c08:	01 f6                	add    %esi,%esi
c0104c0a:	83 c2 04             	add    $0x4,%edx
c0104c0d:	85 f0                	test   %esi,%eax
c0104c0f:	74 f7                	je     c0104c08 <_malloc_r+0x1b8>
c0104c11:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104c14:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104c17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104c1a:	8d 34 c5 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,8),%esi
c0104c21:	89 f1                	mov    %esi,%ecx
c0104c23:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104c26:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104c29:	39 d9                	cmp    %ebx,%ecx
c0104c2b:	75 1e                	jne    c0104c4b <_malloc_r+0x1fb>
c0104c2d:	e9 36 03 00 00       	jmp    c0104f68 <_malloc_r+0x518>
c0104c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104c38:	85 d2                	test   %edx,%edx
c0104c3a:	0f 89 c0 03 00 00    	jns    c0105000 <_malloc_r+0x5b0>
c0104c40:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104c43:	39 d9                	cmp    %ebx,%ecx
c0104c45:	0f 84 1d 03 00 00    	je     c0104f68 <_malloc_r+0x518>
c0104c4b:	8b 43 04             	mov    0x4(%ebx),%eax
c0104c4e:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c51:	89 c2                	mov    %eax,%edx
c0104c53:	29 fa                	sub    %edi,%edx
c0104c55:	83 fa 0f             	cmp    $0xf,%edx
c0104c58:	7e de                	jle    c0104c38 <_malloc_r+0x1e8>
c0104c5a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c0104c5d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c0104c60:	83 cf 01             	or     $0x1,%edi
c0104c63:	8b 73 08             	mov    0x8(%ebx),%esi
c0104c66:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104c69:	89 4e 0c             	mov    %ecx,0xc(%esi)
c0104c6c:	89 71 08             	mov    %esi,0x8(%ecx)
c0104c6f:	89 d1                	mov    %edx,%ecx
c0104c71:	83 c9 01             	or     $0x1,%ecx
c0104c74:	a3 34 a5 10 c0       	mov    %eax,0xc010a534
c0104c79:	a3 30 a5 10 c0       	mov    %eax,0xc010a530
c0104c7e:	c7 40 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%eax)
c0104c85:	c7 40 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%eax)
c0104c8c:	89 48 04             	mov    %ecx,0x4(%eax)
c0104c8f:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0104c92:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c95:	89 04 24             	mov    %eax,(%esp)
c0104c98:	e8 a3 05 00 00       	call   c0105240 <__malloc_unlock>
c0104c9d:	8d 43 08             	lea    0x8(%ebx),%eax
c0104ca0:	e9 22 fe ff ff       	jmp    c0104ac7 <_malloc_r+0x77>
c0104ca5:	8d 76 00             	lea    0x0(%esi),%esi
c0104ca8:	b8 7e 00 00 00       	mov    $0x7e,%eax
c0104cad:	be 3f 00 00 00       	mov    $0x3f,%esi
c0104cb2:	e9 5a fe ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c0104cb7:	90                   	nop
c0104cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cbb:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0104cc0:	89 04 24             	mov    %eax,(%esp)
c0104cc3:	e8 78 05 00 00       	call   c0105240 <__malloc_unlock>
c0104cc8:	83 c4 2c             	add    $0x2c,%esp
c0104ccb:	8d 43 08             	lea    0x8(%ebx),%eax
c0104cce:	5b                   	pop    %ebx
c0104ccf:	5e                   	pop    %esi
c0104cd0:	5f                   	pop    %edi
c0104cd1:	5d                   	pop    %ebp
c0104cd2:	c3                   	ret    
c0104cd3:	90                   	nop
c0104cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104cd8:	8b 1d 28 a5 10 c0    	mov    0xc010a528,%ebx
c0104cde:	8b 73 04             	mov    0x4(%ebx),%esi
c0104ce1:	83 e6 fc             	and    $0xfffffffc,%esi
c0104ce4:	39 f7                	cmp    %esi,%edi
c0104ce6:	77 0d                	ja     c0104cf5 <_malloc_r+0x2a5>
c0104ce8:	89 f0                	mov    %esi,%eax
c0104cea:	29 f8                	sub    %edi,%eax
c0104cec:	83 f8 0f             	cmp    $0xf,%eax
c0104cef:	0f 8f 6b 01 00 00    	jg     c0104e60 <_malloc_r+0x410>
c0104cf5:	8b 0d 90 25 16 c0    	mov    0xc0162590,%ecx
c0104cfb:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c0104cfe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d01:	01 f9                	add    %edi,%ecx
c0104d03:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c0104d09:	83 c1 10             	add    $0x10,%ecx
c0104d0c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104d11:	83 3d 00 a5 10 c0 ff 	cmpl   $0xffffffff,0xc010a500
c0104d18:	0f 44 c1             	cmove  %ecx,%eax
c0104d1b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104d1e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d25:	89 04 24             	mov    %eax,(%esp)
c0104d28:	e8 03 13 00 00       	call   c0106030 <_sbrk_r>
c0104d2d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104d30:	89 c1                	mov    %eax,%ecx
c0104d32:	0f 84 17 03 00 00    	je     c010504f <_malloc_r+0x5ff>
c0104d38:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0104d3b:	0f 87 02 03 00 00    	ja     c0105043 <_malloc_r+0x5f3>
c0104d41:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104d44:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104d4a:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c0104d4d:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104d53:	0f 84 a9 03 00 00    	je     c0105102 <_malloc_r+0x6b2>
c0104d59:	83 3d 00 a5 10 c0 ff 	cmpl   $0xffffffff,0xc010a500
c0104d60:	0f 84 ca 03 00 00    	je     c0105130 <_malloc_r+0x6e0>
c0104d66:	89 c8                	mov    %ecx,%eax
c0104d68:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d6b:	01 d0                	add    %edx,%eax
c0104d6d:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0104d72:	89 c8                	mov    %ecx,%eax
c0104d74:	ba 00 10 00 00       	mov    $0x1000,%edx
c0104d79:	83 e0 07             	and    $0x7,%eax
c0104d7c:	74 0c                	je     c0104d8a <_malloc_r+0x33a>
c0104d7e:	29 c1                	sub    %eax,%ecx
c0104d80:	ba 08 10 00 00       	mov    $0x1008,%edx
c0104d85:	8d 49 08             	lea    0x8(%ecx),%ecx
c0104d88:	29 c2                	sub    %eax,%edx
c0104d8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d8d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104d90:	01 c8                	add    %ecx,%eax
c0104d92:	25 ff 0f 00 00       	and    $0xfff,%eax
c0104d97:	29 c2                	sub    %eax,%edx
c0104d99:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d9c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104da0:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0104da3:	89 04 24             	mov    %eax,(%esp)
c0104da6:	e8 85 12 00 00       	call   c0106030 <_sbrk_r>
c0104dab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104dae:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104db1:	0f 84 6d 03 00 00    	je     c0105124 <_malloc_r+0x6d4>
c0104db7:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104dba:	29 c8                	sub    %ecx,%eax
c0104dbc:	01 d0                	add    %edx,%eax
c0104dbe:	83 c8 01             	or     $0x1,%eax
c0104dc1:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104dc7:	81 fb 20 a5 10 c0    	cmp    $0xc010a520,%ebx
c0104dcd:	89 0d 28 a5 10 c0    	mov    %ecx,0xc010a528
c0104dd3:	89 41 04             	mov    %eax,0x4(%ecx)
c0104dd6:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104ddc:	0f 84 f2 02 00 00    	je     c01050d4 <_malloc_r+0x684>
c0104de2:	83 fe 0f             	cmp    $0xf,%esi
c0104de5:	0f 86 8d 02 00 00    	jbe    c0105078 <_malloc_r+0x628>
c0104deb:	8b 43 04             	mov    0x4(%ebx),%eax
c0104dee:	83 ee 0c             	sub    $0xc,%esi
c0104df1:	83 e6 f8             	and    $0xfffffff8,%esi
c0104df4:	83 e0 01             	and    $0x1,%eax
c0104df7:	09 f0                	or     %esi,%eax
c0104df9:	83 fe 0f             	cmp    $0xf,%esi
c0104dfc:	89 43 04             	mov    %eax,0x4(%ebx)
c0104dff:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c0104e04:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c0104e0b:	00 
c0104e0c:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c0104e13:	00 
c0104e14:	0f 87 a2 02 00 00    	ja     c01050bc <_malloc_r+0x66c>
c0104e1a:	3b 15 8c 25 16 c0    	cmp    0xc016258c,%edx
c0104e20:	76 06                	jbe    c0104e28 <_malloc_r+0x3d8>
c0104e22:	89 15 8c 25 16 c0    	mov    %edx,0xc016258c
c0104e28:	3b 15 88 25 16 c0    	cmp    0xc0162588,%edx
c0104e2e:	76 06                	jbe    c0104e36 <_malloc_r+0x3e6>
c0104e30:	89 15 88 25 16 c0    	mov    %edx,0xc0162588
c0104e36:	8b 50 04             	mov    0x4(%eax),%edx
c0104e39:	89 c3                	mov    %eax,%ebx
c0104e3b:	83 e2 fc             	and    $0xfffffffc,%edx
c0104e3e:	89 d0                	mov    %edx,%eax
c0104e40:	29 f8                	sub    %edi,%eax
c0104e42:	39 d7                	cmp    %edx,%edi
c0104e44:	77 05                	ja     c0104e4b <_malloc_r+0x3fb>
c0104e46:	83 f8 0f             	cmp    $0xf,%eax
c0104e49:	7f 15                	jg     c0104e60 <_malloc_r+0x410>
c0104e4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e4e:	89 04 24             	mov    %eax,(%esp)
c0104e51:	e8 ea 03 00 00       	call   c0105240 <__malloc_unlock>
c0104e56:	31 c0                	xor    %eax,%eax
c0104e58:	e9 6a fc ff ff       	jmp    c0104ac7 <_malloc_r+0x77>
c0104e5d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e60:	89 fa                	mov    %edi,%edx
c0104e62:	83 c8 01             	or     $0x1,%eax
c0104e65:	83 ca 01             	or     $0x1,%edx
c0104e68:	89 53 04             	mov    %edx,0x4(%ebx)
c0104e6b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104e6e:	89 15 28 a5 10 c0    	mov    %edx,0xc010a528
c0104e74:	89 42 04             	mov    %eax,0x4(%edx)
c0104e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e7a:	89 04 24             	mov    %eax,(%esp)
c0104e7d:	e8 be 03 00 00       	call   c0105240 <__malloc_unlock>
c0104e82:	83 c4 2c             	add    $0x2c,%esp
c0104e85:	8d 43 08             	lea    0x8(%ebx),%eax
c0104e88:	5b                   	pop    %ebx
c0104e89:	5e                   	pop    %esi
c0104e8a:	5f                   	pop    %edi
c0104e8b:	5d                   	pop    %ebp
c0104e8c:	c3                   	ret    
c0104e8d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e90:	83 fe 14             	cmp    $0x14,%esi
c0104e93:	0f 86 8f 01 00 00    	jbe    c0105028 <_malloc_r+0x5d8>
c0104e99:	83 fe 54             	cmp    $0x54,%esi
c0104e9c:	0f 87 be 01 00 00    	ja     c0105060 <_malloc_r+0x610>
c0104ea2:	89 fe                	mov    %edi,%esi
c0104ea4:	c1 ee 0c             	shr    $0xc,%esi
c0104ea7:	83 c6 6e             	add    $0x6e,%esi
c0104eaa:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104ead:	e9 5f fc ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c0104eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104eb8:	89 f1                	mov    %esi,%ecx
c0104eba:	c1 e9 09             	shr    $0x9,%ecx
c0104ebd:	83 f9 04             	cmp    $0x4,%ecx
c0104ec0:	0f 86 6d 01 00 00    	jbe    c0105033 <_malloc_r+0x5e3>
c0104ec6:	83 f9 14             	cmp    $0x14,%ecx
c0104ec9:	0f 87 0f 02 00 00    	ja     c01050de <_malloc_r+0x68e>
c0104ecf:	83 c1 5b             	add    $0x5b,%ecx
c0104ed2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0104ed5:	8d 04 85 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,4),%eax
c0104edc:	8b 50 08             	mov    0x8(%eax),%edx
c0104edf:	39 c2                	cmp    %eax,%edx
c0104ee1:	0f 84 a1 01 00 00    	je     c0105088 <_malloc_r+0x638>
c0104ee7:	90                   	nop
c0104ee8:	8b 4a 04             	mov    0x4(%edx),%ecx
c0104eeb:	83 e1 fc             	and    $0xfffffffc,%ecx
c0104eee:	39 ce                	cmp    %ecx,%esi
c0104ef0:	73 07                	jae    c0104ef9 <_malloc_r+0x4a9>
c0104ef2:	8b 52 08             	mov    0x8(%edx),%edx
c0104ef5:	39 d0                	cmp    %edx,%eax
c0104ef7:	75 ef                	jne    c0104ee8 <_malloc_r+0x498>
c0104ef9:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0104efc:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c0104f01:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0104f04:	89 53 08             	mov    %edx,0x8(%ebx)
c0104f07:	89 59 08             	mov    %ebx,0x8(%ecx)
c0104f0a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c0104f0d:	e9 bb fc ff ff       	jmp    c0104bcd <_malloc_r+0x17d>
c0104f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104f18:	89 c1                	mov    %eax,%ecx
c0104f1a:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104f1d:	83 c9 01             	or     $0x1,%ecx
c0104f20:	83 cf 01             	or     $0x1,%edi
c0104f23:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104f26:	89 15 34 a5 10 c0    	mov    %edx,0xc010a534
c0104f2c:	89 15 30 a5 10 c0    	mov    %edx,0xc010a530
c0104f32:	c7 42 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%edx)
c0104f39:	c7 42 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%edx)
c0104f40:	89 4a 04             	mov    %ecx,0x4(%edx)
c0104f43:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0104f46:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f49:	89 04 24             	mov    %eax,(%esp)
c0104f4c:	e8 ef 02 00 00       	call   c0105240 <__malloc_unlock>
c0104f51:	8d 43 08             	lea    0x8(%ebx),%eax
c0104f54:	e9 6e fb ff ff       	jmp    c0104ac7 <_malloc_r+0x77>
c0104f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104f60:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104f63:	e9 af fc ff ff       	jmp    c0104c17 <_malloc_r+0x1c7>
c0104f68:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0104f6c:	83 c1 08             	add    $0x8,%ecx
c0104f6f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c0104f73:	0f 85 ad fc ff ff    	jne    c0104c26 <_malloc_r+0x1d6>
c0104f79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104f7c:	eb 12                	jmp    c0104f90 <_malloc_r+0x540>
c0104f7e:	66 90                	xchg   %ax,%ax
c0104f80:	8d 56 f8             	lea    -0x8(%esi),%edx
c0104f83:	8b 36                	mov    (%esi),%esi
c0104f85:	83 e8 01             	sub    $0x1,%eax
c0104f88:	39 d6                	cmp    %edx,%esi
c0104f8a:	0f 85 ea 01 00 00    	jne    c010517a <_malloc_r+0x72a>
c0104f90:	a8 03                	test   $0x3,%al
c0104f92:	75 ec                	jne    c0104f80 <_malloc_r+0x530>
c0104f94:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f97:	f7 d0                	not    %eax
c0104f99:	23 05 24 a5 10 c0    	and    0xc010a524,%eax
c0104f9f:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c0104fa4:	d1 65 dc             	shll   -0x24(%ebp)
c0104fa7:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104faa:	39 c2                	cmp    %eax,%edx
c0104fac:	0f 87 26 fd ff ff    	ja     c0104cd8 <_malloc_r+0x288>
c0104fb2:	85 d2                	test   %edx,%edx
c0104fb4:	0f 84 1e fd ff ff    	je     c0104cd8 <_malloc_r+0x288>
c0104fba:	85 c2                	test   %eax,%edx
c0104fbc:	0f 85 c2 01 00 00    	jne    c0105184 <_malloc_r+0x734>
c0104fc2:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0104fc5:	89 f1                	mov    %esi,%ecx
c0104fc7:	01 d2                	add    %edx,%edx
c0104fc9:	83 c1 04             	add    $0x4,%ecx
c0104fcc:	85 d0                	test   %edx,%eax
c0104fce:	74 f7                	je     c0104fc7 <_malloc_r+0x577>
c0104fd0:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104fd3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0104fd6:	e9 3c fc ff ff       	jmp    c0104c17 <_malloc_r+0x1c7>
c0104fdb:	90                   	nop
c0104fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104fe0:	8d 43 08             	lea    0x8(%ebx),%eax
c0104fe3:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0104fe6:	39 d8                	cmp    %ebx,%eax
c0104fe8:	0f 85 b4 fa ff ff    	jne    c0104aa2 <_malloc_r+0x52>
c0104fee:	8d 42 02             	lea    0x2(%edx),%eax
c0104ff1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104ff4:	e9 56 fb ff ff       	jmp    c0104b4f <_malloc_r+0xff>
c0104ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105000:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0105005:	8b 53 08             	mov    0x8(%ebx),%edx
c0105008:	8b 43 0c             	mov    0xc(%ebx),%eax
c010500b:	89 42 0c             	mov    %eax,0xc(%edx)
c010500e:	89 50 08             	mov    %edx,0x8(%eax)
c0105011:	8b 45 08             	mov    0x8(%ebp),%eax
c0105014:	89 04 24             	mov    %eax,(%esp)
c0105017:	e8 24 02 00 00       	call   c0105240 <__malloc_unlock>
c010501c:	8d 43 08             	lea    0x8(%ebx),%eax
c010501f:	e9 a3 fa ff ff       	jmp    c0104ac7 <_malloc_r+0x77>
c0105024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105028:	83 c6 5b             	add    $0x5b,%esi
c010502b:	8d 04 36             	lea    (%esi,%esi,1),%eax
c010502e:	e9 de fa ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c0105033:	89 f1                	mov    %esi,%ecx
c0105035:	c1 e9 06             	shr    $0x6,%ecx
c0105038:	83 c1 38             	add    $0x38,%ecx
c010503b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010503e:	e9 92 fe ff ff       	jmp    c0104ed5 <_malloc_r+0x485>
c0105043:	81 fb 20 a5 10 c0    	cmp    $0xc010a520,%ebx
c0105049:	0f 84 f2 fc ff ff    	je     c0104d41 <_malloc_r+0x2f1>
c010504f:	8b 1d 28 a5 10 c0    	mov    0xc010a528,%ebx
c0105055:	8b 53 04             	mov    0x4(%ebx),%edx
c0105058:	83 e2 fc             	and    $0xfffffffc,%edx
c010505b:	e9 de fd ff ff       	jmp    c0104e3e <_malloc_r+0x3ee>
c0105060:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c0105066:	77 3c                	ja     c01050a4 <_malloc_r+0x654>
c0105068:	89 fe                	mov    %edi,%esi
c010506a:	c1 ee 0f             	shr    $0xf,%esi
c010506d:	83 c6 77             	add    $0x77,%esi
c0105070:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105073:	e9 99 fa ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c0105078:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c010507f:	89 cb                	mov    %ecx,%ebx
c0105081:	31 d2                	xor    %edx,%edx
c0105083:	e9 b6 fd ff ff       	jmp    c0104e3e <_malloc_r+0x3ee>
c0105088:	c1 f9 02             	sar    $0x2,%ecx
c010508b:	b8 01 00 00 00       	mov    $0x1,%eax
c0105090:	d3 e0                	shl    %cl,%eax
c0105092:	89 d1                	mov    %edx,%ecx
c0105094:	0b 05 24 a5 10 c0    	or     0xc010a524,%eax
c010509a:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c010509f:	e9 5d fe ff ff       	jmp    c0104f01 <_malloc_r+0x4b1>
c01050a4:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c01050aa:	77 47                	ja     c01050f3 <_malloc_r+0x6a3>
c01050ac:	89 fe                	mov    %edi,%esi
c01050ae:	c1 ee 12             	shr    $0x12,%esi
c01050b1:	83 c6 7c             	add    $0x7c,%esi
c01050b4:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01050b7:	e9 55 fa ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c01050bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01050bf:	83 c3 08             	add    $0x8,%ebx
c01050c2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01050c6:	89 04 24             	mov    %eax,(%esp)
c01050c9:	e8 c2 22 00 00       	call   c0107390 <_free_r>
c01050ce:	8b 15 60 25 16 c0    	mov    0xc0162560,%edx
c01050d4:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c01050d9:	e9 3c fd ff ff       	jmp    c0104e1a <_malloc_r+0x3ca>
c01050de:	83 f9 54             	cmp    $0x54,%ecx
c01050e1:	77 58                	ja     c010513b <_malloc_r+0x6eb>
c01050e3:	89 f1                	mov    %esi,%ecx
c01050e5:	c1 e9 0c             	shr    $0xc,%ecx
c01050e8:	83 c1 6e             	add    $0x6e,%ecx
c01050eb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01050ee:	e9 e2 fd ff ff       	jmp    c0104ed5 <_malloc_r+0x485>
c01050f3:	b8 fc 00 00 00       	mov    $0xfc,%eax
c01050f8:	be 7e 00 00 00       	mov    $0x7e,%esi
c01050fd:	e9 0f fa ff ff       	jmp    c0104b11 <_malloc_r+0xc1>
c0105102:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c0105109:	0f 85 4a fc ff ff    	jne    c0104d59 <_malloc_r+0x309>
c010510f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105112:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c0105117:	01 f1                	add    %esi,%ecx
c0105119:	83 c9 01             	or     $0x1,%ecx
c010511c:	89 48 04             	mov    %ecx,0x4(%eax)
c010511f:	e9 f6 fc ff ff       	jmp    c0104e1a <_malloc_r+0x3ca>
c0105124:	b8 01 00 00 00       	mov    $0x1,%eax
c0105129:	31 d2                	xor    %edx,%edx
c010512b:	e9 91 fc ff ff       	jmp    c0104dc1 <_malloc_r+0x371>
c0105130:	89 0d 00 a5 10 c0    	mov    %ecx,0xc010a500
c0105136:	e9 37 fc ff ff       	jmp    c0104d72 <_malloc_r+0x322>
c010513b:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0105141:	77 10                	ja     c0105153 <_malloc_r+0x703>
c0105143:	89 f1                	mov    %esi,%ecx
c0105145:	c1 e9 0f             	shr    $0xf,%ecx
c0105148:	83 c1 77             	add    $0x77,%ecx
c010514b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010514e:	e9 82 fd ff ff       	jmp    c0104ed5 <_malloc_r+0x485>
c0105153:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0105159:	77 10                	ja     c010516b <_malloc_r+0x71b>
c010515b:	89 f1                	mov    %esi,%ecx
c010515d:	c1 e9 12             	shr    $0x12,%ecx
c0105160:	83 c1 7c             	add    $0x7c,%ecx
c0105163:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105166:	e9 6a fd ff ff       	jmp    c0104ed5 <_malloc_r+0x485>
c010516b:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105170:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0105175:	e9 5b fd ff ff       	jmp    c0104ed5 <_malloc_r+0x485>
c010517a:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c010517f:	e9 20 fe ff ff       	jmp    c0104fa4 <_malloc_r+0x554>
c0105184:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105187:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010518a:	e9 88 fa ff ff       	jmp    c0104c17 <_malloc_r+0x1c7>
c010518f:	90                   	nop

c0105190 <memchr>:
c0105190:	55                   	push   %ebp
c0105191:	89 e5                	mov    %esp,%ebp
c0105193:	57                   	push   %edi
c0105194:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0105198:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010519b:	8b 7d 08             	mov    0x8(%ebp),%edi
c010519e:	31 d2                	xor    %edx,%edx
c01051a0:	85 c9                	test   %ecx,%ecx
c01051a2:	74 79                	je     c010521d <L20>
c01051a4:	f7 c7 03 00 00 00    	test   $0x3,%edi
c01051aa:	74 28                	je     c01051d4 <L5>
c01051ac:	3a 07                	cmp    (%edi),%al
c01051ae:	74 6a                	je     c010521a <L15>
c01051b0:	47                   	inc    %edi
c01051b1:	49                   	dec    %ecx
c01051b2:	74 69                	je     c010521d <L20>
c01051b4:	f7 c7 03 00 00 00    	test   $0x3,%edi
c01051ba:	74 18                	je     c01051d4 <L5>
c01051bc:	3a 07                	cmp    (%edi),%al
c01051be:	74 5a                	je     c010521a <L15>
c01051c0:	47                   	inc    %edi
c01051c1:	49                   	dec    %ecx
c01051c2:	74 59                	je     c010521d <L20>
c01051c4:	f7 c7 03 00 00 00    	test   $0x3,%edi
c01051ca:	74 08                	je     c01051d4 <L5>
c01051cc:	3a 07                	cmp    (%edi),%al
c01051ce:	74 4a                	je     c010521a <L15>
c01051d0:	47                   	inc    %edi
c01051d1:	49                   	dec    %ecx
c01051d2:	74 49                	je     c010521d <L20>

c01051d4 <L5>:
c01051d4:	88 c4                	mov    %al,%ah
c01051d6:	89 c2                	mov    %eax,%edx
c01051d8:	c1 e2 10             	shl    $0x10,%edx
c01051db:	09 d0                	or     %edx,%eax
c01051dd:	53                   	push   %ebx
c01051de:	66 90                	xchg   %ax,%ax

c01051e0 <L8>:
c01051e0:	83 e9 04             	sub    $0x4,%ecx
c01051e3:	72 1c                	jb     c0105201 <L9>
c01051e5:	8b 17                	mov    (%edi),%edx
c01051e7:	83 c7 04             	add    $0x4,%edi
c01051ea:	31 c2                	xor    %eax,%edx
c01051ec:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c01051f2:	f7 d2                	not    %edx
c01051f4:	21 d3                	and    %edx,%ebx
c01051f6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c01051fc:	74 e2                	je     c01051e0 <L8>
c01051fe:	83 ef 04             	sub    $0x4,%edi

c0105201 <L9>:
c0105201:	5b                   	pop    %ebx
c0105202:	31 d2                	xor    %edx,%edx
c0105204:	83 c1 04             	add    $0x4,%ecx
c0105207:	74 14                	je     c010521d <L20>
c0105209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105210 <L10>:
c0105210:	3a 07                	cmp    (%edi),%al
c0105212:	74 06                	je     c010521a <L15>
c0105214:	47                   	inc    %edi
c0105215:	49                   	dec    %ecx
c0105216:	75 f8                	jne    c0105210 <L10>
c0105218:	31 ff                	xor    %edi,%edi

c010521a <L15>:
c010521a:	4a                   	dec    %edx
c010521b:	21 fa                	and    %edi,%edx

c010521d <L20>:
c010521d:	89 d0                	mov    %edx,%eax
c010521f:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0105222:	5f                   	pop    %edi
c0105223:	c9                   	leave  
c0105224:	c3                   	ret    
c0105225:	66 90                	xchg   %ax,%ax
c0105227:	66 90                	xchg   %ax,%ax
c0105229:	66 90                	xchg   %ax,%ax
c010522b:	66 90                	xchg   %ax,%ax
c010522d:	66 90                	xchg   %ax,%ax
c010522f:	90                   	nop

c0105230 <__malloc_lock>:
c0105230:	55                   	push   %ebp
c0105231:	89 e5                	mov    %esp,%ebp
c0105233:	5d                   	pop    %ebp
c0105234:	c3                   	ret    
c0105235:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105240 <__malloc_unlock>:
c0105240:	55                   	push   %ebp
c0105241:	89 e5                	mov    %esp,%ebp
c0105243:	5d                   	pop    %ebp
c0105244:	c3                   	ret    
c0105245:	66 90                	xchg   %ax,%ax
c0105247:	66 90                	xchg   %ax,%ax
c0105249:	66 90                	xchg   %ax,%ax
c010524b:	66 90                	xchg   %ax,%ax
c010524d:	66 90                	xchg   %ax,%ax
c010524f:	90                   	nop

c0105250 <_Balloc>:
c0105250:	55                   	push   %ebp
c0105251:	89 e5                	mov    %esp,%ebp
c0105253:	57                   	push   %edi
c0105254:	56                   	push   %esi
c0105255:	53                   	push   %ebx
c0105256:	83 ec 1c             	sub    $0x1c,%esp
c0105259:	8b 75 08             	mov    0x8(%ebp),%esi
c010525c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010525f:	8b 46 4c             	mov    0x4c(%esi),%eax
c0105262:	85 c0                	test   %eax,%eax
c0105264:	74 2a                	je     c0105290 <_Balloc+0x40>
c0105266:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c0105269:	8b 02                	mov    (%edx),%eax
c010526b:	85 c0                	test   %eax,%eax
c010526d:	74 49                	je     c01052b8 <_Balloc+0x68>
c010526f:	8b 08                	mov    (%eax),%ecx
c0105271:	89 0a                	mov    %ecx,(%edx)
c0105273:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c010527a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0105281:	83 c4 1c             	add    $0x1c,%esp
c0105284:	5b                   	pop    %ebx
c0105285:	5e                   	pop    %esi
c0105286:	5f                   	pop    %edi
c0105287:	5d                   	pop    %ebp
c0105288:	c3                   	ret    
c0105289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105290:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0105297:	00 
c0105298:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010529f:	00 
c01052a0:	89 34 24             	mov    %esi,(%esp)
c01052a3:	e8 38 1f 00 00       	call   c01071e0 <_calloc_r>
c01052a8:	85 c0                	test   %eax,%eax
c01052aa:	89 46 4c             	mov    %eax,0x4c(%esi)
c01052ad:	75 b7                	jne    c0105266 <_Balloc+0x16>
c01052af:	31 c0                	xor    %eax,%eax
c01052b1:	eb ce                	jmp    c0105281 <_Balloc+0x31>
c01052b3:	90                   	nop
c01052b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01052b8:	89 d9                	mov    %ebx,%ecx
c01052ba:	bf 01 00 00 00       	mov    $0x1,%edi
c01052bf:	d3 e7                	shl    %cl,%edi
c01052c1:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c01052c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01052cc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01052d3:	00 
c01052d4:	89 34 24             	mov    %esi,(%esp)
c01052d7:	e8 04 1f 00 00       	call   c01071e0 <_calloc_r>
c01052dc:	85 c0                	test   %eax,%eax
c01052de:	74 cf                	je     c01052af <_Balloc+0x5f>
c01052e0:	89 58 04             	mov    %ebx,0x4(%eax)
c01052e3:	89 78 08             	mov    %edi,0x8(%eax)
c01052e6:	eb 8b                	jmp    c0105273 <_Balloc+0x23>
c01052e8:	90                   	nop
c01052e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01052f0 <_Bfree>:
c01052f0:	55                   	push   %ebp
c01052f1:	89 e5                	mov    %esp,%ebp
c01052f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052f6:	85 c0                	test   %eax,%eax
c01052f8:	74 12                	je     c010530c <_Bfree+0x1c>
c01052fa:	8b 55 08             	mov    0x8(%ebp),%edx
c01052fd:	8b 48 04             	mov    0x4(%eax),%ecx
c0105300:	8b 52 4c             	mov    0x4c(%edx),%edx
c0105303:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c0105306:	8b 0a                	mov    (%edx),%ecx
c0105308:	89 08                	mov    %ecx,(%eax)
c010530a:	89 02                	mov    %eax,(%edx)
c010530c:	5d                   	pop    %ebp
c010530d:	c3                   	ret    
c010530e:	66 90                	xchg   %ax,%ax

c0105310 <__multadd>:
c0105310:	55                   	push   %ebp
c0105311:	89 e5                	mov    %esp,%ebp
c0105313:	57                   	push   %edi
c0105314:	56                   	push   %esi
c0105315:	53                   	push   %ebx
c0105316:	83 ec 2c             	sub    $0x2c,%esp
c0105319:	8b 45 0c             	mov    0xc(%ebp),%eax
c010531c:	8b 5d 14             	mov    0x14(%ebp),%ebx
c010531f:	8b 40 10             	mov    0x10(%eax),%eax
c0105322:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105325:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105328:	8d 78 14             	lea    0x14(%eax),%edi
c010532b:	31 c0                	xor    %eax,%eax
c010532d:	8d 76 00             	lea    0x0(%esi),%esi
c0105330:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c0105333:	0f b7 d1             	movzwl %cx,%edx
c0105336:	0f af 55 10          	imul   0x10(%ebp),%edx
c010533a:	c1 e9 10             	shr    $0x10,%ecx
c010533d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c0105341:	01 da                	add    %ebx,%edx
c0105343:	89 d3                	mov    %edx,%ebx
c0105345:	0f b7 d2             	movzwl %dx,%edx
c0105348:	c1 eb 10             	shr    $0x10,%ebx
c010534b:	01 d9                	add    %ebx,%ecx
c010534d:	89 ce                	mov    %ecx,%esi
c010534f:	c1 e1 10             	shl    $0x10,%ecx
c0105352:	01 d1                	add    %edx,%ecx
c0105354:	c1 ee 10             	shr    $0x10,%esi
c0105357:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c010535a:	83 c0 01             	add    $0x1,%eax
c010535d:	89 f3                	mov    %esi,%ebx
c010535f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105362:	7f cc                	jg     c0105330 <__multadd+0x20>
c0105364:	85 f6                	test   %esi,%esi
c0105366:	74 1b                	je     c0105383 <__multadd+0x73>
c0105368:	8b 45 0c             	mov    0xc(%ebp),%eax
c010536b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c010536e:	3b 78 08             	cmp    0x8(%eax),%edi
c0105371:	7d 1d                	jge    c0105390 <__multadd+0x80>
c0105373:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105376:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105379:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c010537d:	83 c0 01             	add    $0x1,%eax
c0105380:	89 47 10             	mov    %eax,0x10(%edi)
c0105383:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105386:	83 c4 2c             	add    $0x2c,%esp
c0105389:	5b                   	pop    %ebx
c010538a:	5e                   	pop    %esi
c010538b:	5f                   	pop    %edi
c010538c:	5d                   	pop    %ebp
c010538d:	c3                   	ret    
c010538e:	66 90                	xchg   %ax,%ax
c0105390:	8b 40 04             	mov    0x4(%eax),%eax
c0105393:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105396:	83 c0 01             	add    $0x1,%eax
c0105399:	89 44 24 04          	mov    %eax,0x4(%esp)
c010539d:	8b 45 08             	mov    0x8(%ebp),%eax
c01053a0:	89 04 24             	mov    %eax,(%esp)
c01053a3:	e8 a8 fe ff ff       	call   c0105250 <_Balloc>
c01053a8:	89 c3                	mov    %eax,%ebx
c01053aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01053ad:	8b 40 10             	mov    0x10(%eax),%eax
c01053b0:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c01053b7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01053bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01053be:	83 c0 0c             	add    $0xc,%eax
c01053c1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01053c5:	8d 43 0c             	lea    0xc(%ebx),%eax
c01053c8:	89 04 24             	mov    %eax,(%esp)
c01053cb:	e8 d0 c0 ff ff       	call   c01014a0 <memcpy>
c01053d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01053d3:	8b 7d 0c             	mov    0xc(%ebp),%edi
c01053d6:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01053d9:	8b 50 04             	mov    0x4(%eax),%edx
c01053dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01053df:	8b 40 4c             	mov    0x4c(%eax),%eax
c01053e2:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01053e5:	8b 10                	mov    (%eax),%edx
c01053e7:	89 17                	mov    %edx,(%edi)
c01053e9:	89 38                	mov    %edi,(%eax)
c01053eb:	eb 86                	jmp    c0105373 <__multadd+0x63>
c01053ed:	8d 76 00             	lea    0x0(%esi),%esi

c01053f0 <__s2b>:
c01053f0:	55                   	push   %ebp
c01053f1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c01053f6:	89 e5                	mov    %esp,%ebp
c01053f8:	57                   	push   %edi
c01053f9:	56                   	push   %esi
c01053fa:	53                   	push   %ebx
c01053fb:	83 ec 2c             	sub    $0x2c,%esp
c01053fe:	8b 45 14             	mov    0x14(%ebp),%eax
c0105401:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105404:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105407:	8d 48 08             	lea    0x8(%eax),%ecx
c010540a:	89 c8                	mov    %ecx,%eax
c010540c:	f7 ea                	imul   %edx
c010540e:	c1 f9 1f             	sar    $0x1f,%ecx
c0105411:	d1 fa                	sar    %edx
c0105413:	29 ca                	sub    %ecx,%edx
c0105415:	83 fa 01             	cmp    $0x1,%edx
c0105418:	0f 8e be 00 00 00    	jle    c01054dc <__s2b+0xec>
c010541e:	b8 01 00 00 00       	mov    $0x1,%eax
c0105423:	31 c9                	xor    %ecx,%ecx
c0105425:	8d 76 00             	lea    0x0(%esi),%esi
c0105428:	01 c0                	add    %eax,%eax
c010542a:	83 c1 01             	add    $0x1,%ecx
c010542d:	39 c2                	cmp    %eax,%edx
c010542f:	7f f7                	jg     c0105428 <__s2b+0x38>
c0105431:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0105435:	89 1c 24             	mov    %ebx,(%esp)
c0105438:	e8 13 fe ff ff       	call   c0105250 <_Balloc>
c010543d:	8b 55 18             	mov    0x18(%ebp),%edx
c0105440:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c0105444:	89 50 14             	mov    %edx,0x14(%eax)
c0105447:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c010544e:	0f 8e 7c 00 00 00    	jle    c01054d0 <__s2b+0xe0>
c0105454:	8d 4e 09             	lea    0x9(%esi),%ecx
c0105457:	03 75 10             	add    0x10(%ebp),%esi
c010545a:	89 cf                	mov    %ecx,%edi
c010545c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010545f:	90                   	nop
c0105460:	83 c7 01             	add    $0x1,%edi
c0105463:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c0105467:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010546e:	00 
c010546f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105473:	89 1c 24             	mov    %ebx,(%esp)
c0105476:	83 ea 30             	sub    $0x30,%edx
c0105479:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010547d:	e8 8e fe ff ff       	call   c0105310 <__multadd>
c0105482:	39 f7                	cmp    %esi,%edi
c0105484:	75 da                	jne    c0105460 <__s2b+0x70>
c0105486:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105489:	8b 7d 10             	mov    0x10(%ebp),%edi
c010548c:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c0105490:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0105493:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c0105496:	7e 2e                	jle    c01054c6 <__s2b+0xd6>
c0105498:	8b 7d 14             	mov    0x14(%ebp),%edi
c010549b:	29 cf                	sub    %ecx,%edi
c010549d:	01 f7                	add    %esi,%edi
c010549f:	90                   	nop
c01054a0:	83 c6 01             	add    $0x1,%esi
c01054a3:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c01054a7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01054ae:	00 
c01054af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01054b3:	89 1c 24             	mov    %ebx,(%esp)
c01054b6:	83 ea 30             	sub    $0x30,%edx
c01054b9:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01054bd:	e8 4e fe ff ff       	call   c0105310 <__multadd>
c01054c2:	39 fe                	cmp    %edi,%esi
c01054c4:	75 da                	jne    c01054a0 <__s2b+0xb0>
c01054c6:	83 c4 2c             	add    $0x2c,%esp
c01054c9:	5b                   	pop    %ebx
c01054ca:	5e                   	pop    %esi
c01054cb:	5f                   	pop    %edi
c01054cc:	5d                   	pop    %ebp
c01054cd:	c3                   	ret    
c01054ce:	66 90                	xchg   %ax,%ax
c01054d0:	83 c6 0a             	add    $0xa,%esi
c01054d3:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c01054da:	eb b4                	jmp    c0105490 <__s2b+0xa0>
c01054dc:	31 c9                	xor    %ecx,%ecx
c01054de:	e9 4e ff ff ff       	jmp    c0105431 <__s2b+0x41>
c01054e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01054e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01054f0 <__hi0bits>:
c01054f0:	55                   	push   %ebp
c01054f1:	31 c9                	xor    %ecx,%ecx
c01054f3:	89 e5                	mov    %esp,%ebp
c01054f5:	8b 55 08             	mov    0x8(%ebp),%edx
c01054f8:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c01054fe:	75 05                	jne    c0105505 <__hi0bits+0x15>
c0105500:	c1 e2 10             	shl    $0x10,%edx
c0105503:	b1 10                	mov    $0x10,%cl
c0105505:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c010550b:	75 06                	jne    c0105513 <__hi0bits+0x23>
c010550d:	83 c1 08             	add    $0x8,%ecx
c0105510:	c1 e2 08             	shl    $0x8,%edx
c0105513:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c0105519:	75 06                	jne    c0105521 <__hi0bits+0x31>
c010551b:	83 c1 04             	add    $0x4,%ecx
c010551e:	c1 e2 04             	shl    $0x4,%edx
c0105521:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c0105527:	75 06                	jne    c010552f <__hi0bits+0x3f>
c0105529:	83 c1 02             	add    $0x2,%ecx
c010552c:	c1 e2 02             	shl    $0x2,%edx
c010552f:	85 d2                	test   %edx,%edx
c0105531:	89 c8                	mov    %ecx,%eax
c0105533:	78 0d                	js     c0105542 <__hi0bits+0x52>
c0105535:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c010553b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105540:	75 06                	jne    c0105548 <__hi0bits+0x58>
c0105542:	5d                   	pop    %ebp
c0105543:	c3                   	ret    
c0105544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105548:	8d 41 01             	lea    0x1(%ecx),%eax
c010554b:	5d                   	pop    %ebp
c010554c:	c3                   	ret    
c010554d:	8d 76 00             	lea    0x0(%esi),%esi

c0105550 <__lo0bits>:
c0105550:	55                   	push   %ebp
c0105551:	89 e5                	mov    %esp,%ebp
c0105553:	53                   	push   %ebx
c0105554:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105557:	8b 13                	mov    (%ebx),%edx
c0105559:	f6 c2 07             	test   $0x7,%dl
c010555c:	74 1a                	je     c0105578 <__lo0bits+0x28>
c010555e:	31 c0                	xor    %eax,%eax
c0105560:	f6 c2 01             	test   $0x1,%dl
c0105563:	75 0f                	jne    c0105574 <__lo0bits+0x24>
c0105565:	f6 c2 02             	test   $0x2,%dl
c0105568:	75 56                	jne    c01055c0 <__lo0bits+0x70>
c010556a:	c1 ea 02             	shr    $0x2,%edx
c010556d:	b8 02 00 00 00       	mov    $0x2,%eax
c0105572:	89 13                	mov    %edx,(%ebx)
c0105574:	5b                   	pop    %ebx
c0105575:	5d                   	pop    %ebp
c0105576:	c3                   	ret    
c0105577:	90                   	nop
c0105578:	31 c9                	xor    %ecx,%ecx
c010557a:	66 85 d2             	test   %dx,%dx
c010557d:	75 05                	jne    c0105584 <__lo0bits+0x34>
c010557f:	c1 ea 10             	shr    $0x10,%edx
c0105582:	b1 10                	mov    $0x10,%cl
c0105584:	84 d2                	test   %dl,%dl
c0105586:	75 06                	jne    c010558e <__lo0bits+0x3e>
c0105588:	83 c1 08             	add    $0x8,%ecx
c010558b:	c1 ea 08             	shr    $0x8,%edx
c010558e:	f6 c2 0f             	test   $0xf,%dl
c0105591:	75 06                	jne    c0105599 <__lo0bits+0x49>
c0105593:	83 c1 04             	add    $0x4,%ecx
c0105596:	c1 ea 04             	shr    $0x4,%edx
c0105599:	f6 c2 03             	test   $0x3,%dl
c010559c:	75 06                	jne    c01055a4 <__lo0bits+0x54>
c010559e:	83 c1 02             	add    $0x2,%ecx
c01055a1:	c1 ea 02             	shr    $0x2,%edx
c01055a4:	f6 c2 01             	test   $0x1,%dl
c01055a7:	75 0c                	jne    c01055b5 <__lo0bits+0x65>
c01055a9:	d1 ea                	shr    %edx
c01055ab:	b8 20 00 00 00       	mov    $0x20,%eax
c01055b0:	74 c2                	je     c0105574 <__lo0bits+0x24>
c01055b2:	83 c1 01             	add    $0x1,%ecx
c01055b5:	89 13                	mov    %edx,(%ebx)
c01055b7:	89 c8                	mov    %ecx,%eax
c01055b9:	5b                   	pop    %ebx
c01055ba:	5d                   	pop    %ebp
c01055bb:	c3                   	ret    
c01055bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01055c0:	d1 ea                	shr    %edx
c01055c2:	b0 01                	mov    $0x1,%al
c01055c4:	89 13                	mov    %edx,(%ebx)
c01055c6:	5b                   	pop    %ebx
c01055c7:	5d                   	pop    %ebp
c01055c8:	c3                   	ret    
c01055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01055d0 <__i2b>:
c01055d0:	55                   	push   %ebp
c01055d1:	89 e5                	mov    %esp,%ebp
c01055d3:	83 ec 18             	sub    $0x18,%esp
c01055d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055d9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01055e0:	00 
c01055e1:	89 04 24             	mov    %eax,(%esp)
c01055e4:	e8 67 fc ff ff       	call   c0105250 <_Balloc>
c01055e9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01055ec:	89 50 14             	mov    %edx,0x14(%eax)
c01055ef:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01055f6:	c9                   	leave  
c01055f7:	c3                   	ret    
c01055f8:	90                   	nop
c01055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105600 <__multiply>:
c0105600:	55                   	push   %ebp
c0105601:	89 e5                	mov    %esp,%ebp
c0105603:	57                   	push   %edi
c0105604:	56                   	push   %esi
c0105605:	53                   	push   %ebx
c0105606:	83 ec 3c             	sub    $0x3c,%esp
c0105609:	8b 75 0c             	mov    0xc(%ebp),%esi
c010560c:	8b 45 10             	mov    0x10(%ebp),%eax
c010560f:	8b 7e 10             	mov    0x10(%esi),%edi
c0105612:	8b 58 10             	mov    0x10(%eax),%ebx
c0105615:	39 df                	cmp    %ebx,%edi
c0105617:	7d 0e                	jge    c0105627 <__multiply+0x27>
c0105619:	89 f8                	mov    %edi,%eax
c010561b:	89 df                	mov    %ebx,%edi
c010561d:	89 c3                	mov    %eax,%ebx
c010561f:	89 f0                	mov    %esi,%eax
c0105621:	8b 75 10             	mov    0x10(%ebp),%esi
c0105624:	89 45 10             	mov    %eax,0x10(%ebp)
c0105627:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c010562a:	3b 46 08             	cmp    0x8(%esi),%eax
c010562d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105630:	0f 9f c0             	setg   %al
c0105633:	0f b6 c0             	movzbl %al,%eax
c0105636:	03 46 04             	add    0x4(%esi),%eax
c0105639:	89 44 24 04          	mov    %eax,0x4(%esp)
c010563d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105640:	89 04 24             	mov    %eax,(%esp)
c0105643:	e8 08 fc ff ff       	call   c0105250 <_Balloc>
c0105648:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010564b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010564e:	8d 40 14             	lea    0x14(%eax),%eax
c0105651:	8d 14 90             	lea    (%eax,%edx,4),%edx
c0105654:	89 d1                	mov    %edx,%ecx
c0105656:	39 c8                	cmp    %ecx,%eax
c0105658:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010565b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010565e:	73 15                	jae    c0105675 <__multiply+0x75>
c0105660:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105663:	90                   	nop
c0105664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105668:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010566e:	83 c0 04             	add    $0x4,%eax
c0105671:	39 c2                	cmp    %eax,%edx
c0105673:	77 f3                	ja     c0105668 <__multiply+0x68>
c0105675:	8d 46 14             	lea    0x14(%esi),%eax
c0105678:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010567b:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c010567e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105681:	8b 45 10             	mov    0x10(%ebp),%eax
c0105684:	83 c0 14             	add    $0x14,%eax
c0105687:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c010568a:	39 f8                	cmp    %edi,%eax
c010568c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010568f:	89 7d cc             	mov    %edi,-0x34(%ebp)
c0105692:	0f 83 e8 00 00 00    	jae    c0105780 <__multiply+0x180>
c0105698:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010569b:	8b 00                	mov    (%eax),%eax
c010569d:	0f b7 f8             	movzwl %ax,%edi
c01056a0:	85 ff                	test   %edi,%edi
c01056a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c01056a5:	74 5a                	je     c0105701 <__multiply+0x101>
c01056a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01056aa:	31 db                	xor    %ebx,%ebx
c01056ac:	8b 75 d0             	mov    -0x30(%ebp),%esi
c01056af:	eb 09                	jmp    c01056ba <__multiply+0xba>
c01056b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01056b8:	89 fa                	mov    %edi,%edx
c01056ba:	8b 0e                	mov    (%esi),%ecx
c01056bc:	83 c6 04             	add    $0x4,%esi
c01056bf:	0f b7 3a             	movzwl (%edx),%edi
c01056c2:	0f b7 c1             	movzwl %cx,%eax
c01056c5:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c01056c9:	c1 e9 10             	shr    $0x10,%ecx
c01056cc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c01056d0:	01 f8                	add    %edi,%eax
c01056d2:	01 d8                	add    %ebx,%eax
c01056d4:	8b 1a                	mov    (%edx),%ebx
c01056d6:	8d 7a 04             	lea    0x4(%edx),%edi
c01056d9:	c1 eb 10             	shr    $0x10,%ebx
c01056dc:	01 d9                	add    %ebx,%ecx
c01056de:	89 c3                	mov    %eax,%ebx
c01056e0:	c1 eb 10             	shr    $0x10,%ebx
c01056e3:	0f b7 c0             	movzwl %ax,%eax
c01056e6:	01 d9                	add    %ebx,%ecx
c01056e8:	89 cb                	mov    %ecx,%ebx
c01056ea:	c1 e1 10             	shl    $0x10,%ecx
c01056ed:	09 c1                	or     %eax,%ecx
c01056ef:	c1 eb 10             	shr    $0x10,%ebx
c01056f2:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c01056f5:	89 0a                	mov    %ecx,(%edx)
c01056f7:	77 bf                	ja     c01056b8 <__multiply+0xb8>
c01056f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01056fc:	89 5a 04             	mov    %ebx,0x4(%edx)
c01056ff:	8b 00                	mov    (%eax),%eax
c0105701:	c1 e8 10             	shr    $0x10,%eax
c0105704:	85 c0                	test   %eax,%eax
c0105706:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105709:	74 61                	je     c010576c <__multiply+0x16c>
c010570b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010570e:	31 ff                	xor    %edi,%edi
c0105710:	89 fe                	mov    %edi,%esi
c0105712:	8b 10                	mov    (%eax),%edx
c0105714:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105717:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010571a:	89 d3                	mov    %edx,%ebx
c010571c:	eb 05                	jmp    c0105723 <__multiply+0x123>
c010571e:	66 90                	xchg   %ax,%ax
c0105720:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0105723:	0f b7 08             	movzwl (%eax),%ecx
c0105726:	c1 eb 10             	shr    $0x10,%ebx
c0105729:	0f b7 d2             	movzwl %dx,%edx
c010572c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105730:	83 c0 04             	add    $0x4,%eax
c0105733:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c0105736:	01 f7                	add    %esi,%edi
c0105738:	8b 75 e0             	mov    -0x20(%ebp),%esi
c010573b:	89 fb                	mov    %edi,%ebx
c010573d:	c1 e3 10             	shl    $0x10,%ebx
c0105740:	09 d3                	or     %edx,%ebx
c0105742:	89 1e                	mov    %ebx,(%esi)
c0105744:	8b 5e 04             	mov    0x4(%esi),%ebx
c0105747:	8d 4e 04             	lea    0x4(%esi),%ecx
c010574a:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c010574e:	c1 ef 10             	shr    $0x10,%edi
c0105751:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c0105755:	0f b7 f3             	movzwl %bx,%esi
c0105758:	01 f2                	add    %esi,%edx
c010575a:	01 fa                	add    %edi,%edx
c010575c:	89 d6                	mov    %edx,%esi
c010575e:	c1 ee 10             	shr    $0x10,%esi
c0105761:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0105764:	77 ba                	ja     c0105720 <__multiply+0x120>
c0105766:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105769:	89 50 04             	mov    %edx,0x4(%eax)
c010576c:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c0105770:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105773:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0105777:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c010577a:	0f 87 18 ff ff ff    	ja     c0105698 <__multiply+0x98>
c0105780:	8b 75 c8             	mov    -0x38(%ebp),%esi
c0105783:	85 f6                	test   %esi,%esi
c0105785:	7e 29                	jle    c01057b0 <__multiply+0x1b0>
c0105787:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c010578a:	8b 5f fc             	mov    -0x4(%edi),%ebx
c010578d:	85 db                	test   %ebx,%ebx
c010578f:	75 1f                	jne    c01057b0 <__multiply+0x1b0>
c0105791:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105794:	89 d0                	mov    %edx,%eax
c0105796:	c1 e0 02             	shl    $0x2,%eax
c0105799:	29 c7                	sub    %eax,%edi
c010579b:	89 f8                	mov    %edi,%eax
c010579d:	eb 09                	jmp    c01057a8 <__multiply+0x1a8>
c010579f:	90                   	nop
c01057a0:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c01057a4:	85 c9                	test   %ecx,%ecx
c01057a6:	75 05                	jne    c01057ad <__multiply+0x1ad>
c01057a8:	83 ea 01             	sub    $0x1,%edx
c01057ab:	75 f3                	jne    c01057a0 <__multiply+0x1a0>
c01057ad:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01057b0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01057b3:	8b 7d c8             	mov    -0x38(%ebp),%edi
c01057b6:	89 78 10             	mov    %edi,0x10(%eax)
c01057b9:	83 c4 3c             	add    $0x3c,%esp
c01057bc:	5b                   	pop    %ebx
c01057bd:	5e                   	pop    %esi
c01057be:	5f                   	pop    %edi
c01057bf:	5d                   	pop    %ebp
c01057c0:	c3                   	ret    
c01057c1:	eb 0d                	jmp    c01057d0 <__pow5mult>
c01057c3:	90                   	nop
c01057c4:	90                   	nop
c01057c5:	90                   	nop
c01057c6:	90                   	nop
c01057c7:	90                   	nop
c01057c8:	90                   	nop
c01057c9:	90                   	nop
c01057ca:	90                   	nop
c01057cb:	90                   	nop
c01057cc:	90                   	nop
c01057cd:	90                   	nop
c01057ce:	90                   	nop
c01057cf:	90                   	nop

c01057d0 <__pow5mult>:
c01057d0:	55                   	push   %ebp
c01057d1:	89 e5                	mov    %esp,%ebp
c01057d3:	57                   	push   %edi
c01057d4:	56                   	push   %esi
c01057d5:	53                   	push   %ebx
c01057d6:	83 ec 2c             	sub    $0x2c,%esp
c01057d9:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01057dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01057df:	8b 7d 0c             	mov    0xc(%ebp),%edi
c01057e2:	89 d8                	mov    %ebx,%eax
c01057e4:	83 e0 03             	and    $0x3,%eax
c01057e7:	0f 85 a3 00 00 00    	jne    c0105890 <__pow5mult+0xc0>
c01057ed:	c1 fb 02             	sar    $0x2,%ebx
c01057f0:	85 db                	test   %ebx,%ebx
c01057f2:	74 5c                	je     c0105850 <__pow5mult+0x80>
c01057f4:	8b 71 48             	mov    0x48(%ecx),%esi
c01057f7:	85 f6                	test   %esi,%esi
c01057f9:	0f 84 bd 00 00 00    	je     c01058bc <__pow5mult+0xec>
c01057ff:	f6 c3 01             	test   $0x1,%bl
c0105802:	75 15                	jne    c0105819 <__pow5mult+0x49>
c0105804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105808:	d1 fb                	sar    %ebx
c010580a:	74 44                	je     c0105850 <__pow5mult+0x80>
c010580c:	8b 06                	mov    (%esi),%eax
c010580e:	85 c0                	test   %eax,%eax
c0105810:	74 4e                	je     c0105860 <__pow5mult+0x90>
c0105812:	89 c6                	mov    %eax,%esi
c0105814:	f6 c3 01             	test   $0x1,%bl
c0105817:	74 ef                	je     c0105808 <__pow5mult+0x38>
c0105819:	89 0c 24             	mov    %ecx,(%esp)
c010581c:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105820:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0105824:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105827:	e8 d4 fd ff ff       	call   c0105600 <__multiply>
c010582c:	85 ff                	test   %edi,%edi
c010582e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105831:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105834:	74 52                	je     c0105888 <__pow5mult+0xb8>
c0105836:	8b 57 04             	mov    0x4(%edi),%edx
c0105839:	d1 fb                	sar    %ebx
c010583b:	8b 41 4c             	mov    0x4c(%ecx),%eax
c010583e:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105841:	8b 10                	mov    (%eax),%edx
c0105843:	89 17                	mov    %edx,(%edi)
c0105845:	89 38                	mov    %edi,(%eax)
c0105847:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010584a:	75 c0                	jne    c010580c <__pow5mult+0x3c>
c010584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105850:	83 c4 2c             	add    $0x2c,%esp
c0105853:	89 f8                	mov    %edi,%eax
c0105855:	5b                   	pop    %ebx
c0105856:	5e                   	pop    %esi
c0105857:	5f                   	pop    %edi
c0105858:	5d                   	pop    %ebp
c0105859:	c3                   	ret    
c010585a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105860:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105864:	89 74 24 04          	mov    %esi,0x4(%esp)
c0105868:	89 0c 24             	mov    %ecx,(%esp)
c010586b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010586e:	e8 8d fd ff ff       	call   c0105600 <__multiply>
c0105873:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105876:	89 06                	mov    %eax,(%esi)
c0105878:	89 c6                	mov    %eax,%esi
c010587a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105880:	eb 92                	jmp    c0105814 <__pow5mult+0x44>
c0105882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105888:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010588b:	e9 78 ff ff ff       	jmp    c0105808 <__pow5mult+0x38>
c0105890:	8b 04 85 9c 83 10 c0 	mov    -0x3fef7c64(,%eax,4),%eax
c0105897:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010589b:	89 0c 24             	mov    %ecx,(%esp)
c010589e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01058a5:	00 
c01058a6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01058aa:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01058ad:	e8 5e fa ff ff       	call   c0105310 <__multadd>
c01058b2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01058b5:	89 c7                	mov    %eax,%edi
c01058b7:	e9 31 ff ff ff       	jmp    c01057ed <__pow5mult+0x1d>
c01058bc:	89 0c 24             	mov    %ecx,(%esp)
c01058bf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01058c6:	00 
c01058c7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01058ca:	e8 81 f9 ff ff       	call   c0105250 <_Balloc>
c01058cf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01058d2:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c01058d9:	89 c6                	mov    %eax,%esi
c01058db:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01058e2:	89 41 48             	mov    %eax,0x48(%ecx)
c01058e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01058eb:	e9 0f ff ff ff       	jmp    c01057ff <__pow5mult+0x2f>

c01058f0 <__lshift>:
c01058f0:	55                   	push   %ebp
c01058f1:	89 e5                	mov    %esp,%ebp
c01058f3:	57                   	push   %edi
c01058f4:	56                   	push   %esi
c01058f5:	53                   	push   %ebx
c01058f6:	83 ec 2c             	sub    $0x2c,%esp
c01058f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058fc:	8b 75 10             	mov    0x10(%ebp),%esi
c01058ff:	89 c7                	mov    %eax,%edi
c0105901:	8b 50 04             	mov    0x4(%eax),%edx
c0105904:	8b 40 10             	mov    0x10(%eax),%eax
c0105907:	89 f3                	mov    %esi,%ebx
c0105909:	c1 fb 05             	sar    $0x5,%ebx
c010590c:	01 d8                	add    %ebx,%eax
c010590e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105911:	83 c0 01             	add    $0x1,%eax
c0105914:	89 c1                	mov    %eax,%ecx
c0105916:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105919:	8b 47 08             	mov    0x8(%edi),%eax
c010591c:	39 c1                	cmp    %eax,%ecx
c010591e:	7e 09                	jle    c0105929 <__lshift+0x39>
c0105920:	01 c0                	add    %eax,%eax
c0105922:	83 c2 01             	add    $0x1,%edx
c0105925:	39 c1                	cmp    %eax,%ecx
c0105927:	7f f7                	jg     c0105920 <__lshift+0x30>
c0105929:	8b 45 08             	mov    0x8(%ebp),%eax
c010592c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105930:	89 04 24             	mov    %eax,(%esp)
c0105933:	e8 18 f9 ff ff       	call   c0105250 <_Balloc>
c0105938:	85 db                	test   %ebx,%ebx
c010593a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010593d:	8d 50 14             	lea    0x14(%eax),%edx
c0105940:	7e 17                	jle    c0105959 <__lshift+0x69>
c0105942:	31 c0                	xor    %eax,%eax
c0105944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105948:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c010594f:	83 c0 01             	add    $0x1,%eax
c0105952:	39 d8                	cmp    %ebx,%eax
c0105954:	75 f2                	jne    c0105948 <__lshift+0x58>
c0105956:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0105959:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010595c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010595f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105962:	83 c0 14             	add    $0x14,%eax
c0105965:	83 e6 1f             	and    $0x1f,%esi
c0105968:	89 75 e0             	mov    %esi,-0x20(%ebp)
c010596b:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c010596e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105971:	74 7d                	je     c01059f0 <__lshift+0x100>
c0105973:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c010597a:	29 75 dc             	sub    %esi,-0x24(%ebp)
c010597d:	31 f6                	xor    %esi,%esi
c010597f:	eb 09                	jmp    c010598a <__lshift+0x9a>
c0105981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105988:	89 fa                	mov    %edi,%edx
c010598a:	8b 18                	mov    (%eax),%ebx
c010598c:	83 c0 04             	add    $0x4,%eax
c010598f:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105993:	8d 7a 04             	lea    0x4(%edx),%edi
c0105996:	d3 e3                	shl    %cl,%ebx
c0105998:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c010599c:	09 f3                	or     %esi,%ebx
c010599e:	89 1a                	mov    %ebx,(%edx)
c01059a0:	8b 70 fc             	mov    -0x4(%eax),%esi
c01059a3:	d3 ee                	shr    %cl,%esi
c01059a5:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01059a8:	77 de                	ja     c0105988 <__lshift+0x98>
c01059aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01059ad:	89 72 04             	mov    %esi,0x4(%edx)
c01059b0:	83 c0 02             	add    $0x2,%eax
c01059b3:	85 f6                	test   %esi,%esi
c01059b5:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c01059b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01059bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01059bf:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01059c2:	8b 75 0c             	mov    0xc(%ebp),%esi
c01059c5:	83 e8 01             	sub    $0x1,%eax
c01059c8:	89 47 10             	mov    %eax,0x10(%edi)
c01059cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059ce:	8b 50 04             	mov    0x4(%eax),%edx
c01059d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01059d4:	8b 40 4c             	mov    0x4c(%eax),%eax
c01059d7:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01059da:	8b 10                	mov    (%eax),%edx
c01059dc:	89 16                	mov    %edx,(%esi)
c01059de:	89 30                	mov    %esi,(%eax)
c01059e0:	83 c4 2c             	add    $0x2c,%esp
c01059e3:	89 f8                	mov    %edi,%eax
c01059e5:	5b                   	pop    %ebx
c01059e6:	5e                   	pop    %esi
c01059e7:	5f                   	pop    %edi
c01059e8:	5d                   	pop    %ebp
c01059e9:	c3                   	ret    
c01059ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01059f0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01059f3:	90                   	nop
c01059f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01059f8:	83 c0 04             	add    $0x4,%eax
c01059fb:	8b 48 fc             	mov    -0x4(%eax),%ecx
c01059fe:	83 c2 04             	add    $0x4,%edx
c0105a01:	39 c3                	cmp    %eax,%ebx
c0105a03:	89 4a fc             	mov    %ecx,-0x4(%edx)
c0105a06:	77 f0                	ja     c01059f8 <__lshift+0x108>
c0105a08:	eb b2                	jmp    c01059bc <__lshift+0xcc>
c0105a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105a10 <__mcmp>:
c0105a10:	55                   	push   %ebp
c0105a11:	89 e5                	mov    %esp,%ebp
c0105a13:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0105a16:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105a19:	53                   	push   %ebx
c0105a1a:	8b 41 10             	mov    0x10(%ecx),%eax
c0105a1d:	8b 5a 10             	mov    0x10(%edx),%ebx
c0105a20:	29 d8                	sub    %ebx,%eax
c0105a22:	85 c0                	test   %eax,%eax
c0105a24:	75 27                	jne    c0105a4d <__mcmp+0x3d>
c0105a26:	c1 e3 02             	shl    $0x2,%ebx
c0105a29:	83 c1 14             	add    $0x14,%ecx
c0105a2c:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c0105a2f:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c0105a33:	eb 07                	jmp    c0105a3c <__mcmp+0x2c>
c0105a35:	8d 76 00             	lea    0x0(%esi),%esi
c0105a38:	39 c1                	cmp    %eax,%ecx
c0105a3a:	73 14                	jae    c0105a50 <__mcmp+0x40>
c0105a3c:	83 ea 04             	sub    $0x4,%edx
c0105a3f:	83 e8 04             	sub    $0x4,%eax
c0105a42:	8b 1a                	mov    (%edx),%ebx
c0105a44:	39 18                	cmp    %ebx,(%eax)
c0105a46:	74 f0                	je     c0105a38 <__mcmp+0x28>
c0105a48:	19 c0                	sbb    %eax,%eax
c0105a4a:	83 c8 01             	or     $0x1,%eax
c0105a4d:	5b                   	pop    %ebx
c0105a4e:	5d                   	pop    %ebp
c0105a4f:	c3                   	ret    
c0105a50:	31 c0                	xor    %eax,%eax
c0105a52:	5b                   	pop    %ebx
c0105a53:	5d                   	pop    %ebp
c0105a54:	c3                   	ret    
c0105a55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105a60 <__mdiff>:
c0105a60:	55                   	push   %ebp
c0105a61:	89 e5                	mov    %esp,%ebp
c0105a63:	57                   	push   %edi
c0105a64:	56                   	push   %esi
c0105a65:	53                   	push   %ebx
c0105a66:	83 ec 2c             	sub    $0x2c,%esp
c0105a69:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105a6c:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105a6f:	89 34 24             	mov    %esi,(%esp)
c0105a72:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105a76:	e8 95 ff ff ff       	call   c0105a10 <__mcmp>
c0105a7b:	85 c0                	test   %eax,%eax
c0105a7d:	0f 84 25 01 00 00    	je     c0105ba8 <__mdiff+0x148>
c0105a83:	0f 88 0f 01 00 00    	js     c0105b98 <__mdiff+0x138>
c0105a89:	31 ff                	xor    %edi,%edi
c0105a8b:	8b 46 04             	mov    0x4(%esi),%eax
c0105a8e:	83 c6 14             	add    $0x14,%esi
c0105a91:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105a95:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a98:	89 04 24             	mov    %eax,(%esp)
c0105a9b:	e8 b0 f7 ff ff       	call   c0105250 <_Balloc>
c0105aa0:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0105aa3:	89 c2                	mov    %eax,%edx
c0105aa5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105aa8:	89 78 0c             	mov    %edi,0xc(%eax)
c0105aab:	8b 46 fc             	mov    -0x4(%esi),%eax
c0105aae:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0105ab1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ab4:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0105ab7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105aba:	8b 43 10             	mov    0x10(%ebx),%eax
c0105abd:	31 db                	xor    %ebx,%ebx
c0105abf:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0105ac2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ac5:	89 d0                	mov    %edx,%eax
c0105ac7:	83 c0 14             	add    $0x14,%eax
c0105aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105ad0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105ad3:	83 c0 04             	add    $0x4,%eax
c0105ad6:	83 c1 04             	add    $0x4,%ecx
c0105ad9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c0105add:	8b 3e                	mov    (%esi),%edi
c0105adf:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0105ae2:	0f b7 d7             	movzwl %di,%edx
c0105ae5:	01 da                	add    %ebx,%edx
c0105ae7:	0f b7 de             	movzwl %si,%ebx
c0105aea:	29 da                	sub    %ebx,%edx
c0105aec:	c1 ef 10             	shr    $0x10,%edi
c0105aef:	89 d3                	mov    %edx,%ebx
c0105af1:	c1 ee 10             	shr    $0x10,%esi
c0105af4:	0f b7 d2             	movzwl %dx,%edx
c0105af7:	c1 fb 10             	sar    $0x10,%ebx
c0105afa:	29 f7                	sub    %esi,%edi
c0105afc:	01 df                	add    %ebx,%edi
c0105afe:	89 fb                	mov    %edi,%ebx
c0105b00:	c1 e7 10             	shl    $0x10,%edi
c0105b03:	09 d7                	or     %edx,%edi
c0105b05:	c1 fb 10             	sar    $0x10,%ebx
c0105b08:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c0105b0b:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105b0e:	77 c0                	ja     c0105ad0 <__mdiff+0x70>
c0105b10:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105b13:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105b16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b19:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105b1c:	39 f1                	cmp    %esi,%ecx
c0105b1e:	76 3f                	jbe    c0105b5f <__mdiff+0xff>
c0105b20:	8b 3e                	mov    (%esi),%edi
c0105b22:	83 c6 04             	add    $0x4,%esi
c0105b25:	83 c0 04             	add    $0x4,%eax
c0105b28:	0f b7 d7             	movzwl %di,%edx
c0105b2b:	01 da                	add    %ebx,%edx
c0105b2d:	89 d3                	mov    %edx,%ebx
c0105b2f:	0f b7 d2             	movzwl %dx,%edx
c0105b32:	c1 fb 10             	sar    $0x10,%ebx
c0105b35:	c1 ef 10             	shr    $0x10,%edi
c0105b38:	01 df                	add    %ebx,%edi
c0105b3a:	89 fb                	mov    %edi,%ebx
c0105b3c:	c1 e7 10             	shl    $0x10,%edi
c0105b3f:	09 d7                	or     %edx,%edi
c0105b41:	c1 fb 10             	sar    $0x10,%ebx
c0105b44:	39 f1                	cmp    %esi,%ecx
c0105b46:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105b49:	77 d5                	ja     c0105b20 <__mdiff+0xc0>
c0105b4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b4e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105b51:	f7 d0                	not    %eax
c0105b53:	01 c8                	add    %ecx,%eax
c0105b55:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105b58:	c1 e8 02             	shr    $0x2,%eax
c0105b5b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c0105b5f:	85 ff                	test   %edi,%edi
c0105b61:	75 23                	jne    c0105b86 <__mdiff+0x126>
c0105b63:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b66:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c0105b6d:	29 d0                	sub    %edx,%eax
c0105b6f:	89 ca                	mov    %ecx,%edx
c0105b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105b78:	83 ea 01             	sub    $0x1,%edx
c0105b7b:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105b7f:	85 c9                	test   %ecx,%ecx
c0105b81:	74 f5                	je     c0105b78 <__mdiff+0x118>
c0105b83:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b86:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105b89:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b8c:	89 48 10             	mov    %ecx,0x10(%eax)
c0105b8f:	83 c4 2c             	add    $0x2c,%esp
c0105b92:	5b                   	pop    %ebx
c0105b93:	5e                   	pop    %esi
c0105b94:	5f                   	pop    %edi
c0105b95:	5d                   	pop    %ebp
c0105b96:	c3                   	ret    
c0105b97:	90                   	nop
c0105b98:	89 f0                	mov    %esi,%eax
c0105b9a:	bf 01 00 00 00       	mov    $0x1,%edi
c0105b9f:	89 de                	mov    %ebx,%esi
c0105ba1:	89 c3                	mov    %eax,%ebx
c0105ba3:	e9 e3 fe ff ff       	jmp    c0105a8b <__mdiff+0x2b>
c0105ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105bb2:	00 
c0105bb3:	89 04 24             	mov    %eax,(%esp)
c0105bb6:	e8 95 f6 ff ff       	call   c0105250 <_Balloc>
c0105bbb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105bc2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0105bc9:	83 c4 2c             	add    $0x2c,%esp
c0105bcc:	5b                   	pop    %ebx
c0105bcd:	5e                   	pop    %esi
c0105bce:	5f                   	pop    %edi
c0105bcf:	5d                   	pop    %ebp
c0105bd0:	c3                   	ret    
c0105bd1:	eb 0d                	jmp    c0105be0 <__ulp>
c0105bd3:	90                   	nop
c0105bd4:	90                   	nop
c0105bd5:	90                   	nop
c0105bd6:	90                   	nop
c0105bd7:	90                   	nop
c0105bd8:	90                   	nop
c0105bd9:	90                   	nop
c0105bda:	90                   	nop
c0105bdb:	90                   	nop
c0105bdc:	90                   	nop
c0105bdd:	90                   	nop
c0105bde:	90                   	nop
c0105bdf:	90                   	nop

c0105be0 <__ulp>:
c0105be0:	55                   	push   %ebp
c0105be1:	89 e5                	mov    %esp,%ebp
c0105be3:	83 ec 08             	sub    $0x8,%esp
c0105be6:	dd 45 08             	fldl   0x8(%ebp)
c0105be9:	dd 5d f8             	fstpl  -0x8(%ebp)
c0105bec:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c0105bef:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c0105bf5:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c0105bfb:	85 c9                	test   %ecx,%ecx
c0105bfd:	7e 11                	jle    c0105c10 <__ulp+0x30>
c0105bff:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0105c02:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105c09:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c0c:	c9                   	leave  
c0105c0d:	c3                   	ret    
c0105c0e:	66 90                	xchg   %ax,%ax
c0105c10:	f7 d9                	neg    %ecx
c0105c12:	c1 f9 14             	sar    $0x14,%ecx
c0105c15:	83 f9 13             	cmp    $0x13,%ecx
c0105c18:	7e 26                	jle    c0105c40 <__ulp+0x60>
c0105c1a:	83 f9 32             	cmp    $0x32,%ecx
c0105c1d:	b8 01 00 00 00       	mov    $0x1,%eax
c0105c22:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105c29:	7f 0b                	jg     c0105c36 <__ulp+0x56>
c0105c2b:	ba 33 00 00 00       	mov    $0x33,%edx
c0105c30:	29 ca                	sub    %ecx,%edx
c0105c32:	89 d1                	mov    %edx,%ecx
c0105c34:	d3 e0                	shl    %cl,%eax
c0105c36:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c39:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c3c:	c9                   	leave  
c0105c3d:	c3                   	ret    
c0105c3e:	66 90                	xchg   %ax,%ax
c0105c40:	b8 00 00 08 00       	mov    $0x80000,%eax
c0105c45:	d3 f8                	sar    %cl,%eax
c0105c47:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c4a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105c51:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c54:	c9                   	leave  
c0105c55:	c3                   	ret    
c0105c56:	8d 76 00             	lea    0x0(%esi),%esi
c0105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105c60 <__b2d>:
c0105c60:	55                   	push   %ebp
c0105c61:	89 e5                	mov    %esp,%ebp
c0105c63:	57                   	push   %edi
c0105c64:	56                   	push   %esi
c0105c65:	53                   	push   %ebx
c0105c66:	83 ec 18             	sub    $0x18,%esp
c0105c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c6c:	8d 78 14             	lea    0x14(%eax),%edi
c0105c6f:	8b 40 10             	mov    0x10(%eax),%eax
c0105c72:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0105c75:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0105c78:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105c7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c7e:	89 34 24             	mov    %esi,(%esp)
c0105c81:	e8 6a f8 ff ff       	call   c01054f0 <__hi0bits>
c0105c86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105c89:	ba 20 00 00 00       	mov    $0x20,%edx
c0105c8e:	29 c2                	sub    %eax,%edx
c0105c90:	83 f8 0a             	cmp    $0xa,%eax
c0105c93:	89 11                	mov    %edx,(%ecx)
c0105c95:	7f 41                	jg     c0105cd8 <__b2d+0x78>
c0105c97:	b9 0b 00 00 00       	mov    $0xb,%ecx
c0105c9c:	89 f2                	mov    %esi,%edx
c0105c9e:	29 c1                	sub    %eax,%ecx
c0105ca0:	d3 ea                	shr    %cl,%edx
c0105ca2:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0105ca8:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0105cab:	31 d2                	xor    %edx,%edx
c0105cad:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105cb0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105cb7:	73 05                	jae    c0105cbe <__b2d+0x5e>
c0105cb9:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105cbc:	d3 ea                	shr    %cl,%edx
c0105cbe:	8d 48 15             	lea    0x15(%eax),%ecx
c0105cc1:	d3 e6                	shl    %cl,%esi
c0105cc3:	09 f2                	or     %esi,%edx
c0105cc5:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105cc8:	dd 45 e8             	fldl   -0x18(%ebp)
c0105ccb:	83 c4 18             	add    $0x18,%esp
c0105cce:	5b                   	pop    %ebx
c0105ccf:	5e                   	pop    %esi
c0105cd0:	5f                   	pop    %edi
c0105cd1:	5d                   	pop    %ebp
c0105cd2:	c3                   	ret    
c0105cd3:	90                   	nop
c0105cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105cd8:	31 d2                	xor    %edx,%edx
c0105cda:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105cdd:	73 09                	jae    c0105ce8 <__b2d+0x88>
c0105cdf:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105ce2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0105ce5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105ce8:	89 c3                	mov    %eax,%ebx
c0105cea:	83 eb 0b             	sub    $0xb,%ebx
c0105ced:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0105cf0:	74 4e                	je     c0105d40 <__b2d+0xe0>
c0105cf2:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105cf6:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0105cfb:	29 c3                	sub    %eax,%ebx
c0105cfd:	89 d0                	mov    %edx,%eax
c0105cff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105d06:	d3 e6                	shl    %cl,%esi
c0105d08:	89 d9                	mov    %ebx,%ecx
c0105d0a:	d3 e8                	shr    %cl,%eax
c0105d0c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105d0f:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105d15:	09 c6                	or     %eax,%esi
c0105d17:	31 c0                	xor    %eax,%eax
c0105d19:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105d1c:	39 f9                	cmp    %edi,%ecx
c0105d1e:	76 07                	jbe    c0105d27 <__b2d+0xc7>
c0105d20:	8b 41 fc             	mov    -0x4(%ecx),%eax
c0105d23:	89 d9                	mov    %ebx,%ecx
c0105d25:	d3 e8                	shr    %cl,%eax
c0105d27:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105d2b:	d3 e2                	shl    %cl,%edx
c0105d2d:	09 d0                	or     %edx,%eax
c0105d2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d32:	dd 45 e8             	fldl   -0x18(%ebp)
c0105d35:	83 c4 18             	add    $0x18,%esp
c0105d38:	5b                   	pop    %ebx
c0105d39:	5e                   	pop    %esi
c0105d3a:	5f                   	pop    %edi
c0105d3b:	5d                   	pop    %ebp
c0105d3c:	c3                   	ret    
c0105d3d:	8d 76 00             	lea    0x0(%esi),%esi
c0105d40:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105d46:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105d49:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105d4c:	dd 45 e8             	fldl   -0x18(%ebp)
c0105d4f:	83 c4 18             	add    $0x18,%esp
c0105d52:	5b                   	pop    %ebx
c0105d53:	5e                   	pop    %esi
c0105d54:	5f                   	pop    %edi
c0105d55:	5d                   	pop    %ebp
c0105d56:	c3                   	ret    
c0105d57:	89 f6                	mov    %esi,%esi
c0105d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105d60 <__d2b>:
c0105d60:	55                   	push   %ebp
c0105d61:	89 e5                	mov    %esp,%ebp
c0105d63:	57                   	push   %edi
c0105d64:	56                   	push   %esi
c0105d65:	53                   	push   %ebx
c0105d66:	83 ec 2c             	sub    $0x2c,%esp
c0105d69:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d6c:	dd 45 0c             	fldl   0xc(%ebp)
c0105d6f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105d76:	00 
c0105d77:	dd 5d d0             	fstpl  -0x30(%ebp)
c0105d7a:	89 04 24             	mov    %eax,(%esp)
c0105d7d:	e8 ce f4 ff ff       	call   c0105250 <_Balloc>
c0105d82:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0105d85:	89 c6                	mov    %eax,%esi
c0105d87:	89 d8                	mov    %ebx,%eax
c0105d89:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c0105d8f:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0105d94:	c1 eb 14             	shr    $0x14,%ebx
c0105d97:	85 db                	test   %ebx,%ebx
c0105d99:	74 05                	je     c0105da0 <__d2b+0x40>
c0105d9b:	0d 00 00 10 00       	or     $0x100000,%eax
c0105da0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105da3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105da6:	85 c0                	test   %eax,%eax
c0105da8:	74 56                	je     c0105e00 <__d2b+0xa0>
c0105daa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105dad:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105db0:	89 04 24             	mov    %eax,(%esp)
c0105db3:	e8 98 f7 ff ff       	call   c0105550 <__lo0bits>
c0105db8:	85 c0                	test   %eax,%eax
c0105dba:	0f 85 90 00 00 00    	jne    c0105e50 <__d2b+0xf0>
c0105dc0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105dc3:	89 56 14             	mov    %edx,0x14(%esi)
c0105dc6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105dc9:	83 fa 01             	cmp    $0x1,%edx
c0105dcc:	19 ff                	sbb    %edi,%edi
c0105dce:	83 c7 02             	add    $0x2,%edi
c0105dd1:	85 db                	test   %ebx,%ebx
c0105dd3:	89 56 18             	mov    %edx,0x18(%esi)
c0105dd6:	89 7e 10             	mov    %edi,0x10(%esi)
c0105dd9:	74 49                	je     c0105e24 <__d2b+0xc4>
c0105ddb:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105dde:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0105de5:	89 11                	mov    %edx,(%ecx)
c0105de7:	ba 35 00 00 00       	mov    $0x35,%edx
c0105dec:	29 c2                	sub    %eax,%edx
c0105dee:	8b 45 18             	mov    0x18(%ebp),%eax
c0105df1:	89 10                	mov    %edx,(%eax)
c0105df3:	83 c4 2c             	add    $0x2c,%esp
c0105df6:	89 f0                	mov    %esi,%eax
c0105df8:	5b                   	pop    %ebx
c0105df9:	5e                   	pop    %esi
c0105dfa:	5f                   	pop    %edi
c0105dfb:	5d                   	pop    %ebp
c0105dfc:	c3                   	ret    
c0105dfd:	8d 76 00             	lea    0x0(%esi),%esi
c0105e00:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0105e03:	bf 01 00 00 00       	mov    $0x1,%edi
c0105e08:	89 04 24             	mov    %eax,(%esp)
c0105e0b:	e8 40 f7 ff ff       	call   c0105550 <__lo0bits>
c0105e10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e13:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c0105e1a:	89 56 14             	mov    %edx,0x14(%esi)
c0105e1d:	83 c0 20             	add    $0x20,%eax
c0105e20:	85 db                	test   %ebx,%ebx
c0105e22:	75 b7                	jne    c0105ddb <__d2b+0x7b>
c0105e24:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105e27:	2d 32 04 00 00       	sub    $0x432,%eax
c0105e2c:	89 01                	mov    %eax,(%ecx)
c0105e2e:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c0105e32:	c1 e7 05             	shl    $0x5,%edi
c0105e35:	89 04 24             	mov    %eax,(%esp)
c0105e38:	e8 b3 f6 ff ff       	call   c01054f0 <__hi0bits>
c0105e3d:	29 c7                	sub    %eax,%edi
c0105e3f:	8b 45 18             	mov    0x18(%ebp),%eax
c0105e42:	89 38                	mov    %edi,(%eax)
c0105e44:	83 c4 2c             	add    $0x2c,%esp
c0105e47:	89 f0                	mov    %esi,%eax
c0105e49:	5b                   	pop    %ebx
c0105e4a:	5e                   	pop    %esi
c0105e4b:	5f                   	pop    %edi
c0105e4c:	5d                   	pop    %ebp
c0105e4d:	c3                   	ret    
c0105e4e:	66 90                	xchg   %ax,%ax
c0105e50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e53:	b9 20 00 00 00       	mov    $0x20,%ecx
c0105e58:	29 c1                	sub    %eax,%ecx
c0105e5a:	89 d7                	mov    %edx,%edi
c0105e5c:	d3 e7                	shl    %cl,%edi
c0105e5e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105e61:	09 f9                	or     %edi,%ecx
c0105e63:	89 4e 14             	mov    %ecx,0x14(%esi)
c0105e66:	89 c1                	mov    %eax,%ecx
c0105e68:	d3 ea                	shr    %cl,%edx
c0105e6a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0105e6d:	e9 57 ff ff ff       	jmp    c0105dc9 <__d2b+0x69>
c0105e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105e80 <__ratio>:
c0105e80:	55                   	push   %ebp
c0105e81:	89 e5                	mov    %esp,%ebp
c0105e83:	56                   	push   %esi
c0105e84:	53                   	push   %ebx
c0105e85:	83 ec 30             	sub    $0x30,%esp
c0105e88:	8b 75 08             	mov    0x8(%ebp),%esi
c0105e8b:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0105e8e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105e91:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105e95:	89 34 24             	mov    %esi,(%esp)
c0105e98:	e8 c3 fd ff ff       	call   c0105c60 <__b2d>
c0105e9d:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0105ea0:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105ea4:	89 1c 24             	mov    %ebx,(%esp)
c0105ea7:	dd 55 e0             	fstl   -0x20(%ebp)
c0105eaa:	dd 5d d8             	fstpl  -0x28(%ebp)
c0105ead:	e8 ae fd ff ff       	call   c0105c60 <__b2d>
c0105eb2:	8b 46 10             	mov    0x10(%esi),%eax
c0105eb5:	2b 43 10             	sub    0x10(%ebx),%eax
c0105eb8:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105ebb:	2b 55 f4             	sub    -0xc(%ebp),%edx
c0105ebe:	c1 e0 05             	shl    $0x5,%eax
c0105ec1:	01 d0                	add    %edx,%eax
c0105ec3:	dd 55 d0             	fstl   -0x30(%ebp)
c0105ec6:	85 c0                	test   %eax,%eax
c0105ec8:	dd 45 d8             	fldl   -0x28(%ebp)
c0105ecb:	7e 1b                	jle    c0105ee8 <__ratio+0x68>
c0105ecd:	dd d8                	fstp   %st(0)
c0105ecf:	c1 e0 14             	shl    $0x14,%eax
c0105ed2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105ed5:	dd 45 e0             	fldl   -0x20(%ebp)
c0105ed8:	83 c4 30             	add    $0x30,%esp
c0105edb:	5b                   	pop    %ebx
c0105edc:	de f1                	fdivp  %st,%st(1)
c0105ede:	5e                   	pop    %esi
c0105edf:	5d                   	pop    %ebp
c0105ee0:	c3                   	ret    
c0105ee1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105ee8:	dd d9                	fstp   %st(1)
c0105eea:	c1 e0 14             	shl    $0x14,%eax
c0105eed:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c0105ef0:	dd 45 d0             	fldl   -0x30(%ebp)
c0105ef3:	83 c4 30             	add    $0x30,%esp
c0105ef6:	5b                   	pop    %ebx
c0105ef7:	de f9                	fdivrp %st,%st(1)
c0105ef9:	5e                   	pop    %esi
c0105efa:	5d                   	pop    %ebp
c0105efb:	c3                   	ret    
c0105efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0105f00 <_mprec_log10>:
c0105f00:	55                   	push   %ebp
c0105f01:	89 e5                	mov    %esp,%ebp
c0105f03:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f06:	83 f8 17             	cmp    $0x17,%eax
c0105f09:	7e 1d                	jle    c0105f28 <_mprec_log10+0x28>
c0105f0b:	d9 e8                	fld1   
c0105f0d:	d9 05 5c 83 10 c0    	flds   0xc010835c
c0105f13:	90                   	nop
c0105f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f18:	83 e8 01             	sub    $0x1,%eax
c0105f1b:	dc c9                	fmul   %st,%st(1)
c0105f1d:	75 f9                	jne    c0105f18 <_mprec_log10+0x18>
c0105f1f:	dd d8                	fstp   %st(0)
c0105f21:	5d                   	pop    %ebp
c0105f22:	c3                   	ret    
c0105f23:	90                   	nop
c0105f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f28:	dd 04 c5 40 84 10 c0 	fldl   -0x3fef7bc0(,%eax,8)
c0105f2f:	5d                   	pop    %ebp
c0105f30:	c3                   	ret    
c0105f31:	eb 0d                	jmp    c0105f40 <__copybits>
c0105f33:	90                   	nop
c0105f34:	90                   	nop
c0105f35:	90                   	nop
c0105f36:	90                   	nop
c0105f37:	90                   	nop
c0105f38:	90                   	nop
c0105f39:	90                   	nop
c0105f3a:	90                   	nop
c0105f3b:	90                   	nop
c0105f3c:	90                   	nop
c0105f3d:	90                   	nop
c0105f3e:	90                   	nop
c0105f3f:	90                   	nop

c0105f40 <__copybits>:
c0105f40:	55                   	push   %ebp
c0105f41:	89 e5                	mov    %esp,%ebp
c0105f43:	57                   	push   %edi
c0105f44:	8b 7d 10             	mov    0x10(%ebp),%edi
c0105f47:	56                   	push   %esi
c0105f48:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105f4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f4e:	53                   	push   %ebx
c0105f4f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105f52:	8d 56 ff             	lea    -0x1(%esi),%edx
c0105f55:	c1 fa 05             	sar    $0x5,%edx
c0105f58:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c0105f5c:	8d 57 14             	lea    0x14(%edi),%edx
c0105f5f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c0105f62:	39 da                	cmp    %ebx,%edx
c0105f64:	73 34                	jae    c0105f9a <__copybits+0x5a>
c0105f66:	89 c1                	mov    %eax,%ecx
c0105f68:	83 c2 04             	add    $0x4,%edx
c0105f6b:	8b 42 fc             	mov    -0x4(%edx),%eax
c0105f6e:	83 c1 04             	add    $0x4,%ecx
c0105f71:	39 d3                	cmp    %edx,%ebx
c0105f73:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0105f76:	77 f0                	ja     c0105f68 <__copybits+0x28>
c0105f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f7b:	29 fb                	sub    %edi,%ebx
c0105f7d:	8d 53 eb             	lea    -0x15(%ebx),%edx
c0105f80:	c1 ea 02             	shr    $0x2,%edx
c0105f83:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c0105f87:	39 c6                	cmp    %eax,%esi
c0105f89:	76 13                	jbe    c0105f9e <__copybits+0x5e>
c0105f8b:	90                   	nop
c0105f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f90:	83 c0 04             	add    $0x4,%eax
c0105f93:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c0105f9a:	39 c6                	cmp    %eax,%esi
c0105f9c:	77 f2                	ja     c0105f90 <__copybits+0x50>
c0105f9e:	5b                   	pop    %ebx
c0105f9f:	5e                   	pop    %esi
c0105fa0:	5f                   	pop    %edi
c0105fa1:	5d                   	pop    %ebp
c0105fa2:	c3                   	ret    
c0105fa3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105fb0 <__any_on>:
c0105fb0:	55                   	push   %ebp
c0105fb1:	89 e5                	mov    %esp,%ebp
c0105fb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fb6:	57                   	push   %edi
c0105fb7:	56                   	push   %esi
c0105fb8:	53                   	push   %ebx
c0105fb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105fbc:	8d 50 14             	lea    0x14(%eax),%edx
c0105fbf:	8b 40 10             	mov    0x10(%eax),%eax
c0105fc2:	c1 fb 05             	sar    $0x5,%ebx
c0105fc5:	39 d8                	cmp    %ebx,%eax
c0105fc7:	7d 2f                	jge    c0105ff8 <__any_on+0x48>
c0105fc9:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c0105fcc:	39 da                	cmp    %ebx,%edx
c0105fce:	73 1d                	jae    c0105fed <__any_on+0x3d>
c0105fd0:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105fd3:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0105fd6:	85 db                	test   %ebx,%ebx
c0105fd8:	74 0f                	je     c0105fe9 <__any_on+0x39>
c0105fda:	eb 44                	jmp    c0106020 <__any_on+0x70>
c0105fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fe0:	83 e8 04             	sub    $0x4,%eax
c0105fe3:	8b 08                	mov    (%eax),%ecx
c0105fe5:	85 c9                	test   %ecx,%ecx
c0105fe7:	75 37                	jne    c0106020 <__any_on+0x70>
c0105fe9:	39 c2                	cmp    %eax,%edx
c0105feb:	72 f3                	jb     c0105fe0 <__any_on+0x30>
c0105fed:	31 c0                	xor    %eax,%eax
c0105fef:	5b                   	pop    %ebx
c0105ff0:	5e                   	pop    %esi
c0105ff1:	5f                   	pop    %edi
c0105ff2:	5d                   	pop    %ebp
c0105ff3:	c3                   	ret    
c0105ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ff8:	7e 1e                	jle    c0106018 <__any_on+0x68>
c0105ffa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105ffd:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0106000:	83 e1 1f             	and    $0x1f,%ecx
c0106003:	74 c7                	je     c0105fcc <__any_on+0x1c>
c0106005:	8b 3b                	mov    (%ebx),%edi
c0106007:	b8 01 00 00 00       	mov    $0x1,%eax
c010600c:	89 fe                	mov    %edi,%esi
c010600e:	d3 ee                	shr    %cl,%esi
c0106010:	d3 e6                	shl    %cl,%esi
c0106012:	39 fe                	cmp    %edi,%esi
c0106014:	75 d9                	jne    c0105fef <__any_on+0x3f>
c0106016:	eb b4                	jmp    c0105fcc <__any_on+0x1c>
c0106018:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c010601b:	eb af                	jmp    c0105fcc <__any_on+0x1c>
c010601d:	8d 76 00             	lea    0x0(%esi),%esi
c0106020:	5b                   	pop    %ebx
c0106021:	b8 01 00 00 00       	mov    $0x1,%eax
c0106026:	5e                   	pop    %esi
c0106027:	5f                   	pop    %edi
c0106028:	5d                   	pop    %ebp
c0106029:	c3                   	ret    
c010602a:	66 90                	xchg   %ax,%ax
c010602c:	66 90                	xchg   %ax,%ax
c010602e:	66 90                	xchg   %ax,%ax

c0106030 <_sbrk_r>:
c0106030:	55                   	push   %ebp
c0106031:	89 e5                	mov    %esp,%ebp
c0106033:	83 ec 18             	sub    $0x18,%esp
c0106036:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106039:	c7 05 94 25 16 c0 00 	movl   $0x0,0xc0162594
c0106040:	00 00 00 
c0106043:	89 04 24             	mov    %eax,(%esp)
c0106046:	e8 25 af ff ff       	call   c0100f70 <sbrk>
c010604b:	83 f8 ff             	cmp    $0xffffffff,%eax
c010604e:	74 08                	je     c0106058 <_sbrk_r+0x28>
c0106050:	c9                   	leave  
c0106051:	c3                   	ret    
c0106052:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106058:	8b 15 94 25 16 c0    	mov    0xc0162594,%edx
c010605e:	85 d2                	test   %edx,%edx
c0106060:	74 ee                	je     c0106050 <_sbrk_r+0x20>
c0106062:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106065:	89 11                	mov    %edx,(%ecx)
c0106067:	c9                   	leave  
c0106068:	c3                   	ret    
c0106069:	66 90                	xchg   %ax,%ax
c010606b:	66 90                	xchg   %ax,%ax
c010606d:	66 90                	xchg   %ax,%ax
c010606f:	90                   	nop

c0106070 <__fpclassifyd>:
c0106070:	55                   	push   %ebp
c0106071:	b8 02 00 00 00       	mov    $0x2,%eax
c0106076:	89 e5                	mov    %esp,%ebp
c0106078:	53                   	push   %ebx
c0106079:	83 ec 0c             	sub    $0xc,%esp
c010607c:	dd 45 08             	fldl   0x8(%ebp)
c010607f:	dd 5d f0             	fstpl  -0x10(%ebp)
c0106082:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106085:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0106088:	89 d3                	mov    %edx,%ebx
c010608a:	09 cb                	or     %ecx,%ebx
c010608c:	75 0a                	jne    c0106098 <__fpclassifyd+0x28>
c010608e:	83 c4 0c             	add    $0xc,%esp
c0106091:	5b                   	pop    %ebx
c0106092:	5d                   	pop    %ebp
c0106093:	c3                   	ret    
c0106094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106098:	85 d2                	test   %edx,%edx
c010609a:	0f 94 c2             	sete   %dl
c010609d:	75 08                	jne    c01060a7 <__fpclassifyd+0x37>
c010609f:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c01060a5:	74 e7                	je     c010608e <__fpclassifyd+0x1e>
c01060a7:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c01060ad:	b8 04 00 00 00       	mov    $0x4,%eax
c01060b2:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c01060b8:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c01060be:	76 ce                	jbe    c010608e <__fpclassifyd+0x1e>
c01060c0:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c01060c6:	b0 03                	mov    $0x3,%al
c01060c8:	76 c4                	jbe    c010608e <__fpclassifyd+0x1e>
c01060ca:	31 c0                	xor    %eax,%eax
c01060cc:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c01060d2:	0f 94 c0             	sete   %al
c01060d5:	21 d0                	and    %edx,%eax
c01060d7:	eb b5                	jmp    c010608e <__fpclassifyd+0x1e>
c01060d9:	66 90                	xchg   %ax,%ax
c01060db:	66 90                	xchg   %ax,%ax
c01060dd:	66 90                	xchg   %ax,%ax
c01060df:	90                   	nop

c01060e0 <strcmp>:
c01060e0:	55                   	push   %ebp
c01060e1:	89 e5                	mov    %esp,%ebp
c01060e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01060e6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01060e9:	53                   	push   %ebx
c01060ea:	89 c1                	mov    %eax,%ecx
c01060ec:	09 d1                	or     %edx,%ecx
c01060ee:	83 e1 03             	and    $0x3,%ecx
c01060f1:	75 17                	jne    c010610a <strcmp+0x2a>
c01060f3:	8b 08                	mov    (%eax),%ecx
c01060f5:	3b 0a                	cmp    (%edx),%ecx
c01060f7:	74 33                	je     c010612c <strcmp+0x4c>
c01060f9:	eb 0f                	jmp    c010610a <strcmp+0x2a>
c01060fb:	90                   	nop
c01060fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106100:	3a 0a                	cmp    (%edx),%cl
c0106102:	75 0d                	jne    c0106111 <strcmp+0x31>
c0106104:	83 c0 01             	add    $0x1,%eax
c0106107:	83 c2 01             	add    $0x1,%edx
c010610a:	0f b6 08             	movzbl (%eax),%ecx
c010610d:	84 c9                	test   %cl,%cl
c010610f:	75 ef                	jne    c0106100 <strcmp+0x20>
c0106111:	0f b6 00             	movzbl (%eax),%eax
c0106114:	0f b6 12             	movzbl (%edx),%edx
c0106117:	5b                   	pop    %ebx
c0106118:	5d                   	pop    %ebp
c0106119:	29 d0                	sub    %edx,%eax
c010611b:	c3                   	ret    
c010611c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106120:	83 c0 04             	add    $0x4,%eax
c0106123:	83 c2 04             	add    $0x4,%edx
c0106126:	8b 08                	mov    (%eax),%ecx
c0106128:	3b 0a                	cmp    (%edx),%ecx
c010612a:	75 de                	jne    c010610a <strcmp+0x2a>
c010612c:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c0106132:	f7 d1                	not    %ecx
c0106134:	21 cb                	and    %ecx,%ebx
c0106136:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c010613c:	74 e2                	je     c0106120 <strcmp+0x40>
c010613e:	31 c0                	xor    %eax,%eax
c0106140:	5b                   	pop    %ebx
c0106141:	5d                   	pop    %ebp
c0106142:	c3                   	ret    
c0106143:	66 90                	xchg   %ax,%ax
c0106145:	66 90                	xchg   %ax,%ax
c0106147:	66 90                	xchg   %ax,%ax
c0106149:	66 90                	xchg   %ax,%ax
c010614b:	66 90                	xchg   %ax,%ax
c010614d:	66 90                	xchg   %ax,%ax
c010614f:	90                   	nop

c0106150 <strlen>:
c0106150:	55                   	push   %ebp
c0106151:	89 e5                	mov    %esp,%ebp
c0106153:	57                   	push   %edi
c0106154:	8b 55 08             	mov    0x8(%ebp),%edx
c0106157:	89 d7                	mov    %edx,%edi
c0106159:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010615f:	74 25                	je     c0106186 <L5>
c0106161:	8a 0f                	mov    (%edi),%cl
c0106163:	47                   	inc    %edi
c0106164:	84 c9                	test   %cl,%cl
c0106166:	74 56                	je     c01061be <L15>
c0106168:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010616e:	74 16                	je     c0106186 <L5>
c0106170:	8a 0f                	mov    (%edi),%cl
c0106172:	47                   	inc    %edi
c0106173:	84 c9                	test   %cl,%cl
c0106175:	74 47                	je     c01061be <L15>
c0106177:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010617d:	74 07                	je     c0106186 <L5>
c010617f:	8a 0f                	mov    (%edi),%cl
c0106181:	47                   	inc    %edi
c0106182:	84 c9                	test   %cl,%cl
c0106184:	74 38                	je     c01061be <L15>

c0106186 <L5>:
c0106186:	83 ef 04             	sub    $0x4,%edi
c0106189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0106190 <L10>:
c0106190:	83 c7 04             	add    $0x4,%edi
c0106193:	8b 0f                	mov    (%edi),%ecx
c0106195:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c010619b:	f7 d1                	not    %ecx
c010619d:	21 c8                	and    %ecx,%eax
c010619f:	a9 80 80 80 80       	test   $0x80808080,%eax
c01061a4:	74 ea                	je     c0106190 <L10>
c01061a6:	f7 d1                	not    %ecx
c01061a8:	47                   	inc    %edi
c01061a9:	84 c9                	test   %cl,%cl
c01061ab:	74 11                	je     c01061be <L15>
c01061ad:	47                   	inc    %edi
c01061ae:	c1 e9 08             	shr    $0x8,%ecx
c01061b1:	84 c9                	test   %cl,%cl
c01061b3:	74 09                	je     c01061be <L15>
c01061b5:	47                   	inc    %edi
c01061b6:	c1 e9 08             	shr    $0x8,%ecx
c01061b9:	84 c9                	test   %cl,%cl
c01061bb:	74 01                	je     c01061be <L15>
c01061bd:	47                   	inc    %edi

c01061be <L15>:
c01061be:	29 d7                	sub    %edx,%edi
c01061c0:	8d 47 ff             	lea    -0x1(%edi),%eax
c01061c3:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01061c6:	5f                   	pop    %edi
c01061c7:	c9                   	leave  
c01061c8:	c3                   	ret    
c01061c9:	66 90                	xchg   %ax,%ax
c01061cb:	66 90                	xchg   %ax,%ax
c01061cd:	66 90                	xchg   %ax,%ax
c01061cf:	90                   	nop

c01061d0 <__ssprint_r>:
c01061d0:	55                   	push   %ebp
c01061d1:	89 e5                	mov    %esp,%ebp
c01061d3:	57                   	push   %edi
c01061d4:	56                   	push   %esi
c01061d5:	53                   	push   %ebx
c01061d6:	83 ec 2c             	sub    $0x2c,%esp
c01061d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01061dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01061df:	8b 00                	mov    (%eax),%eax
c01061e1:	89 c7                	mov    %eax,%edi
c01061e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01061e6:	8b 40 08             	mov    0x8(%eax),%eax
c01061e9:	85 c0                	test   %eax,%eax
c01061eb:	0f 84 af 01 00 00    	je     c01063a0 <__ssprint_r+0x1d0>
c01061f1:	31 c9                	xor    %ecx,%ecx
c01061f3:	31 d2                	xor    %edx,%edx
c01061f5:	8b 03                	mov    (%ebx),%eax
c01061f7:	89 ce                	mov    %ecx,%esi
c01061f9:	85 f6                	test   %esi,%esi
c01061fb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01061fe:	0f 84 ec 00 00 00    	je     c01062f0 <__ssprint_r+0x120>
c0106204:	8b 53 08             	mov    0x8(%ebx),%edx
c0106207:	39 d6                	cmp    %edx,%esi
c0106209:	0f 82 fc 00 00 00    	jb     c010630b <__ssprint_r+0x13b>
c010620f:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c0106213:	66 f7 c1 80 04       	test   $0x480,%cx
c0106218:	0f 84 fa 00 00 00    	je     c0106318 <__ssprint_r+0x148>
c010621e:	8b 53 10             	mov    0x10(%ebx),%edx
c0106221:	29 d0                	sub    %edx,%eax
c0106223:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106226:	8b 43 14             	mov    0x14(%ebx),%eax
c0106229:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010622c:	8d 04 40             	lea    (%eax,%eax,2),%eax
c010622f:	89 c2                	mov    %eax,%edx
c0106231:	c1 ea 1f             	shr    $0x1f,%edx
c0106234:	01 d0                	add    %edx,%eax
c0106236:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106239:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010623c:	d1 7d e0             	sarl   -0x20(%ebp)
c010623f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c0106243:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0106246:	0f 83 34 01 00 00    	jae    c0106380 <__ssprint_r+0x1b0>
c010624c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010624f:	80 e5 04             	and    $0x4,%ch
c0106252:	0f 84 c8 00 00 00    	je     c0106320 <__ssprint_r+0x150>
c0106258:	89 44 24 04          	mov    %eax,0x4(%esp)
c010625c:	8b 45 08             	mov    0x8(%ebp),%eax
c010625f:	89 04 24             	mov    %eax,(%esp)
c0106262:	e8 e9 e7 ff ff       	call   c0104a50 <_malloc_r>
c0106267:	85 c0                	test   %eax,%eax
c0106269:	89 c2                	mov    %eax,%edx
c010626b:	0f 84 e1 00 00 00    	je     c0106352 <__ssprint_r+0x182>
c0106271:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106274:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0106277:	89 44 24 08          	mov    %eax,0x8(%esp)
c010627b:	8b 43 10             	mov    0x10(%ebx),%eax
c010627e:	89 14 24             	mov    %edx,(%esp)
c0106281:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106285:	e8 16 b2 ff ff       	call   c01014a0 <memcpy>
c010628a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c010628e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106291:	66 25 7f fb          	and    $0xfb7f,%ax
c0106295:	0c 80                	or     $0x80,%al
c0106297:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c010629b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010629e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062a1:	89 53 10             	mov    %edx,0x10(%ebx)
c01062a4:	89 4b 14             	mov    %ecx,0x14(%ebx)
c01062a7:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c01062aa:	01 d0                	add    %edx,%eax
c01062ac:	89 03                	mov    %eax,(%ebx)
c01062ae:	89 f2                	mov    %esi,%edx
c01062b0:	89 4b 08             	mov    %ecx,0x8(%ebx)
c01062b3:	89 f1                	mov    %esi,%ecx
c01062b5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01062b9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01062bc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01062bf:	89 04 24             	mov    %eax,(%esp)
c01062c2:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01062c5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01062c9:	e8 22 13 00 00       	call   c01075f0 <memmove>
c01062ce:	8b 03                	mov    (%ebx),%eax
c01062d0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01062d3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01062d6:	29 53 08             	sub    %edx,0x8(%ebx)
c01062d9:	01 c8                	add    %ecx,%eax
c01062db:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01062de:	89 03                	mov    %eax,(%ebx)
c01062e0:	8b 51 08             	mov    0x8(%ecx),%edx
c01062e3:	29 f2                	sub    %esi,%edx
c01062e5:	85 d2                	test   %edx,%edx
c01062e7:	89 51 08             	mov    %edx,0x8(%ecx)
c01062ea:	0f 84 98 00 00 00    	je     c0106388 <__ssprint_r+0x1b8>
c01062f0:	8b 77 04             	mov    0x4(%edi),%esi
c01062f3:	83 c7 08             	add    $0x8,%edi
c01062f6:	8b 4f f8             	mov    -0x8(%edi),%ecx
c01062f9:	85 f6                	test   %esi,%esi
c01062fb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01062fe:	74 f0                	je     c01062f0 <__ssprint_r+0x120>
c0106300:	8b 53 08             	mov    0x8(%ebx),%edx
c0106303:	39 d6                	cmp    %edx,%esi
c0106305:	0f 83 04 ff ff ff    	jae    c010620f <__ssprint_r+0x3f>
c010630b:	89 f2                	mov    %esi,%edx
c010630d:	89 f1                	mov    %esi,%ecx
c010630f:	eb a4                	jmp    c01062b5 <__ssprint_r+0xe5>
c0106311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106318:	89 d1                	mov    %edx,%ecx
c010631a:	eb 99                	jmp    c01062b5 <__ssprint_r+0xe5>
c010631c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106320:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106324:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106327:	89 44 24 04          	mov    %eax,0x4(%esp)
c010632b:	8b 45 08             	mov    0x8(%ebp),%eax
c010632e:	89 04 24             	mov    %eax,(%esp)
c0106331:	e8 4a 13 00 00       	call   c0107680 <_realloc_r>
c0106336:	85 c0                	test   %eax,%eax
c0106338:	89 c2                	mov    %eax,%edx
c010633a:	0f 85 5b ff ff ff    	jne    c010629b <__ssprint_r+0xcb>
c0106340:	8b 43 10             	mov    0x10(%ebx),%eax
c0106343:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106347:	8b 45 08             	mov    0x8(%ebp),%eax
c010634a:	89 04 24             	mov    %eax,(%esp)
c010634d:	e8 3e 10 00 00       	call   c0107390 <_free_r>
c0106352:	8b 45 08             	mov    0x8(%ebp),%eax
c0106355:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010635b:	8b 45 10             	mov    0x10(%ebp),%eax
c010635e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106363:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010636a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106371:	83 c4 2c             	add    $0x2c,%esp
c0106374:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106379:	5b                   	pop    %ebx
c010637a:	5e                   	pop    %esi
c010637b:	5f                   	pop    %edi
c010637c:	5d                   	pop    %ebp
c010637d:	c3                   	ret    
c010637e:	66 90                	xchg   %ax,%ax
c0106380:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106383:	e9 c7 fe ff ff       	jmp    c010624f <__ssprint_r+0x7f>
c0106388:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c010638f:	83 c4 2c             	add    $0x2c,%esp
c0106392:	31 c0                	xor    %eax,%eax
c0106394:	5b                   	pop    %ebx
c0106395:	5e                   	pop    %esi
c0106396:	5f                   	pop    %edi
c0106397:	5d                   	pop    %ebp
c0106398:	c3                   	ret    
c0106399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01063a0:	8b 45 10             	mov    0x10(%ebp),%eax
c01063a3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c01063aa:	83 c4 2c             	add    $0x2c,%esp
c01063ad:	31 c0                	xor    %eax,%eax
c01063af:	5b                   	pop    %ebx
c01063b0:	5e                   	pop    %esi
c01063b1:	5f                   	pop    %edi
c01063b2:	5d                   	pop    %ebp
c01063b3:	c3                   	ret    
c01063b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01063ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c01063c0 <_svfiprintf_r>:
c01063c0:	55                   	push   %ebp
c01063c1:	89 e5                	mov    %esp,%ebp
c01063c3:	57                   	push   %edi
c01063c4:	56                   	push   %esi
c01063c5:	53                   	push   %ebx
c01063c6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c01063cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01063cf:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c01063d3:	74 0b                	je     c01063e0 <_svfiprintf_r+0x20>
c01063d5:	8b 50 10             	mov    0x10(%eax),%edx
c01063d8:	85 d2                	test   %edx,%edx
c01063da:	0f 84 1c 0d 00 00    	je     c01070fc <_svfiprintf_r+0xd3c>
c01063e0:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01063e3:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01063e6:	89 c6                	mov    %eax,%esi
c01063e8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01063ee:	29 d8                	sub    %ebx,%eax
c01063f0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c01063f7:	00 00 00 
c01063fa:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106401:	00 00 00 
c0106404:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010640b:	00 00 00 
c010640e:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c0106415:	00 00 00 
c0106418:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c010641e:	8b 45 10             	mov    0x10(%ebp),%eax
c0106421:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0106424:	0f b6 00             	movzbl (%eax),%eax
c0106427:	84 c0                	test   %al,%al
c0106429:	74 58                	je     c0106483 <_svfiprintf_r+0xc3>
c010642b:	3c 25                	cmp    $0x25,%al
c010642d:	75 13                	jne    c0106442 <_svfiprintf_r+0x82>
c010642f:	eb 52                	jmp    c0106483 <_svfiprintf_r+0xc3>
c0106431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106438:	84 c0                	test   %al,%al
c010643a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106440:	74 0a                	je     c010644c <_svfiprintf_r+0x8c>
c0106442:	83 c3 01             	add    $0x1,%ebx
c0106445:	0f b6 03             	movzbl (%ebx),%eax
c0106448:	3c 25                	cmp    $0x25,%al
c010644a:	75 ec                	jne    c0106438 <_svfiprintf_r+0x78>
c010644c:	89 df                	mov    %ebx,%edi
c010644e:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106451:	74 30                	je     c0106483 <_svfiprintf_r+0xc3>
c0106453:	8b 45 10             	mov    0x10(%ebp),%eax
c0106456:	83 c6 08             	add    $0x8,%esi
c0106459:	89 7e fc             	mov    %edi,-0x4(%esi)
c010645c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106462:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106465:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010646b:	83 c0 01             	add    $0x1,%eax
c010646e:	83 f8 07             	cmp    $0x7,%eax
c0106471:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106477:	0f 8f eb 0a 00 00    	jg     c0106f68 <_svfiprintf_r+0xba8>
c010647d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106483:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106486:	0f 84 11 09 00 00    	je     c0106d9d <_svfiprintf_r+0x9dd>
c010648c:	8d 43 01             	lea    0x1(%ebx),%eax
c010648f:	31 ff                	xor    %edi,%edi
c0106491:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106498:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c010649f:	ff ff ff 
c01064a2:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c01064a9:	00 00 00 
c01064ac:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c01064b3:	00 00 00 
c01064b6:	8d 50 01             	lea    0x1(%eax),%edx
c01064b9:	0f be 00             	movsbl (%eax),%eax
c01064bc:	8d 48 e0             	lea    -0x20(%eax),%ecx
c01064bf:	83 f9 58             	cmp    $0x58,%ecx
c01064c2:	0f 87 63 03 00 00    	ja     c010682b <_svfiprintf_r+0x46b>
c01064c8:	ff 24 8d 08 85 10 c0 	jmp    *-0x3fef7af8(,%ecx,4)
c01064cf:	90                   	nop
c01064d0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c01064d7:	89 d0                	mov    %edx,%eax
c01064d9:	eb db                	jmp    c01064b6 <_svfiprintf_r+0xf6>
c01064db:	8b 45 14             	mov    0x14(%ebp),%eax
c01064de:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01064e1:	8b 00                	mov    (%eax),%eax
c01064e3:	83 c3 04             	add    $0x4,%ebx
c01064e6:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01064e9:	85 c0                	test   %eax,%eax
c01064eb:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c01064f1:	79 e4                	jns    c01064d7 <_svfiprintf_r+0x117>
c01064f3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c01064f9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c0106500:	89 d0                	mov    %edx,%eax
c0106502:	eb b2                	jmp    c01064b6 <_svfiprintf_r+0xf6>
c0106504:	bf 2b 00 00 00       	mov    $0x2b,%edi
c0106509:	89 d0                	mov    %edx,%eax
c010650b:	eb a9                	jmp    c01064b6 <_svfiprintf_r+0xf6>
c010650d:	8b 45 14             	mov    0x14(%ebp),%eax
c0106510:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106517:	89 55 10             	mov    %edx,0x10(%ebp)
c010651a:	ba 02 00 00 00       	mov    $0x2,%edx
c010651f:	8b 08                	mov    (%eax),%ecx
c0106521:	83 c0 04             	add    $0x4,%eax
c0106524:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010652b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c0106532:	89 45 14             	mov    %eax,0x14(%ebp)
c0106535:	c7 85 44 ff ff ff a3 	movl   $0xc01081a3,-0xbc(%ebp)
c010653c:	81 10 c0 
c010653f:	90                   	nop
c0106540:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106547:	31 ff                	xor    %edi,%edi
c0106549:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c010654f:	89 d8                	mov    %ebx,%eax
c0106551:	24 7f                	and    $0x7f,%al
c0106553:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c010655a:	0f 48 c3             	cmovs  %ebx,%eax
c010655d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106563:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106569:	85 c0                	test   %eax,%eax
c010656b:	75 08                	jne    c0106575 <_svfiprintf_r+0x1b5>
c010656d:	85 c9                	test   %ecx,%ecx
c010656f:	0f 84 03 08 00 00    	je     c0106d78 <_svfiprintf_r+0x9b8>
c0106575:	80 fa 01             	cmp    $0x1,%dl
c0106578:	0f 84 8a 0a 00 00    	je     c0107008 <_svfiprintf_r+0xc48>
c010657e:	80 fa 02             	cmp    $0x2,%dl
c0106581:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106584:	0f 85 86 01 00 00    	jne    c0106710 <_svfiprintf_r+0x350>
c010658a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106590:	89 c8                	mov    %ecx,%eax
c0106592:	83 eb 01             	sub    $0x1,%ebx
c0106595:	83 e0 0f             	and    $0xf,%eax
c0106598:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c010659c:	c1 e9 04             	shr    $0x4,%ecx
c010659f:	85 c9                	test   %ecx,%ecx
c01065a1:	88 03                	mov    %al,(%ebx)
c01065a3:	75 eb                	jne    c0106590 <_svfiprintf_r+0x1d0>
c01065a5:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01065a8:	29 d8                	sub    %ebx,%eax
c01065aa:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01065b0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01065b6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c01065bc:	39 c1                	cmp    %eax,%ecx
c01065be:	0f 4d c1             	cmovge %ecx,%eax
c01065c1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01065c7:	89 f8                	mov    %edi,%eax
c01065c9:	3c 01                	cmp    $0x1,%al
c01065cb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c01065d2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01065d8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c01065de:	89 d0                	mov    %edx,%eax
c01065e0:	89 cf                	mov    %ecx,%edi
c01065e2:	83 c0 02             	add    $0x2,%eax
c01065e5:	83 e7 02             	and    $0x2,%edi
c01065e8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c01065ee:	89 cf                	mov    %ecx,%edi
c01065f0:	0f 44 c2             	cmove  %edx,%eax
c01065f3:	81 e7 84 00 00 00    	and    $0x84,%edi
c01065f9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01065ff:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0106605:	0f 85 cd 04 00 00    	jne    c0106ad8 <_svfiprintf_r+0x718>
c010660b:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106611:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106617:	85 ff                	test   %edi,%edi
c0106619:	0f 8e b9 04 00 00    	jle    c0106ad8 <_svfiprintf_r+0x718>
c010661f:	83 ff 10             	cmp    $0x10,%edi
c0106622:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106628:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010662e:	7e 7c                	jle    c01066ac <_svfiprintf_r+0x2ec>
c0106630:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c0106636:	89 f1                	mov    %esi,%ecx
c0106638:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010663b:	8b 75 0c             	mov    0xc(%ebp),%esi
c010663e:	eb 08                	jmp    c0106648 <_svfiprintf_r+0x288>
c0106640:	83 ef 10             	sub    $0x10,%edi
c0106643:	83 ff 10             	cmp    $0x10,%edi
c0106646:	7e 5c                	jle    c01066a4 <_svfiprintf_r+0x2e4>
c0106648:	83 c0 01             	add    $0x1,%eax
c010664b:	83 c2 10             	add    $0x10,%edx
c010664e:	c7 01 7c 86 10 c0    	movl   $0xc010867c,(%ecx)
c0106654:	83 c1 08             	add    $0x8,%ecx
c0106657:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010665e:	83 f8 07             	cmp    $0x7,%eax
c0106661:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106667:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010666d:	7e d1                	jle    c0106640 <_svfiprintf_r+0x280>
c010666f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106675:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106679:	89 74 24 04          	mov    %esi,0x4(%esp)
c010667d:	89 1c 24             	mov    %ebx,(%esp)
c0106680:	e8 4b fb ff ff       	call   c01061d0 <__ssprint_r>
c0106685:	85 c0                	test   %eax,%eax
c0106687:	0f 85 3b 07 00 00    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c010668d:	83 ef 10             	sub    $0x10,%edi
c0106690:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106696:	83 ff 10             	cmp    $0x10,%edi
c0106699:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010669f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c01066a2:	7f a4                	jg     c0106648 <_svfiprintf_r+0x288>
c01066a4:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c01066aa:	89 ce                	mov    %ecx,%esi
c01066ac:	83 c0 01             	add    $0x1,%eax
c01066af:	01 fa                	add    %edi,%edx
c01066b1:	c7 06 7c 86 10 c0    	movl   $0xc010867c,(%esi)
c01066b7:	83 c6 08             	add    $0x8,%esi
c01066ba:	89 7e fc             	mov    %edi,-0x4(%esi)
c01066bd:	83 f8 07             	cmp    $0x7,%eax
c01066c0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01066c6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01066cc:	0f 8e 12 04 00 00    	jle    c0106ae4 <_svfiprintf_r+0x724>
c01066d2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01066d8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01066dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01066df:	89 44 24 04          	mov    %eax,0x4(%esp)
c01066e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01066e6:	89 04 24             	mov    %eax,(%esp)
c01066e9:	e8 e2 fa ff ff       	call   c01061d0 <__ssprint_r>
c01066ee:	85 c0                	test   %eax,%eax
c01066f0:	0f 85 d2 06 00 00    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c01066f6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01066fc:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01066ff:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106705:	e9 da 03 00 00       	jmp    c0106ae4 <_svfiprintf_r+0x724>
c010670a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106710:	89 c8                	mov    %ecx,%eax
c0106712:	83 eb 01             	sub    $0x1,%ebx
c0106715:	83 e0 07             	and    $0x7,%eax
c0106718:	c1 e9 03             	shr    $0x3,%ecx
c010671b:	83 c0 30             	add    $0x30,%eax
c010671e:	85 c9                	test   %ecx,%ecx
c0106720:	88 03                	mov    %al,(%ebx)
c0106722:	75 ec                	jne    c0106710 <_svfiprintf_r+0x350>
c0106724:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c010672b:	89 da                	mov    %ebx,%edx
c010672d:	0f 84 72 fe ff ff    	je     c01065a5 <_svfiprintf_r+0x1e5>
c0106733:	3c 30                	cmp    $0x30,%al
c0106735:	0f 84 6a fe ff ff    	je     c01065a5 <_svfiprintf_r+0x1e5>
c010673b:	83 eb 01             	sub    $0x1,%ebx
c010673e:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106741:	29 d8                	sub    %ebx,%eax
c0106743:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0106747:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010674d:	e9 5e fe ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c0106752:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106759:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106760:	89 55 10             	mov    %edx,0x10(%ebp)
c0106763:	8b 45 14             	mov    0x14(%ebp),%eax
c0106766:	0f 85 48 01 00 00    	jne    c01068b4 <_svfiprintf_r+0x4f4>
c010676c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106773:	0f 84 3b 01 00 00    	je     c01068b4 <_svfiprintf_r+0x4f4>
c0106779:	0f b7 08             	movzwl (%eax),%ecx
c010677c:	83 c0 04             	add    $0x4,%eax
c010677f:	31 d2                	xor    %edx,%edx
c0106781:	89 45 14             	mov    %eax,0x14(%ebp)
c0106784:	e9 b7 fd ff ff       	jmp    c0106540 <_svfiprintf_r+0x180>
c0106789:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106790:	89 f8                	mov    %edi,%eax
c0106792:	89 55 10             	mov    %edx,0x10(%ebp)
c0106795:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c010679b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01067a2:	8b 45 14             	mov    0x14(%ebp),%eax
c01067a5:	75 0d                	jne    c01067b4 <_svfiprintf_r+0x3f4>
c01067a7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01067ae:	0f 85 f2 08 00 00    	jne    c01070a6 <_svfiprintf_r+0xce6>
c01067b4:	8b 08                	mov    (%eax),%ecx
c01067b6:	83 c0 04             	add    $0x4,%eax
c01067b9:	89 45 14             	mov    %eax,0x14(%ebp)
c01067bc:	85 c9                	test   %ecx,%ecx
c01067be:	0f 88 f3 08 00 00    	js     c01070b7 <_svfiprintf_r+0xcf7>
c01067c4:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01067cb:	ba 01 00 00 00       	mov    $0x1,%edx
c01067d0:	e9 74 fd ff ff       	jmp    c0106549 <_svfiprintf_r+0x189>
c01067d5:	0f be 02             	movsbl (%edx),%eax
c01067d8:	8d 5a 01             	lea    0x1(%edx),%ebx
c01067db:	83 f8 2a             	cmp    $0x2a,%eax
c01067de:	0f 84 af 09 00 00    	je     c0107193 <_svfiprintf_r+0xdd3>
c01067e4:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01067e7:	31 d2                	xor    %edx,%edx
c01067e9:	83 f9 09             	cmp    $0x9,%ecx
c01067ec:	0f 87 90 09 00 00    	ja     c0107182 <_svfiprintf_r+0xdc2>
c01067f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01067f8:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01067fb:	83 c3 01             	add    $0x1,%ebx
c01067fe:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c0106801:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c0106805:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106808:	83 f9 09             	cmp    $0x9,%ecx
c010680b:	76 eb                	jbe    c01067f8 <_svfiprintf_r+0x438>
c010680d:	85 d2                	test   %edx,%edx
c010680f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0106814:	0f 48 d1             	cmovs  %ecx,%edx
c0106817:	8d 48 e0             	lea    -0x20(%eax),%ecx
c010681a:	83 f9 58             	cmp    $0x58,%ecx
c010681d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c0106823:	89 da                	mov    %ebx,%edx
c0106825:	0f 86 9d fc ff ff    	jbe    c01064c8 <_svfiprintf_r+0x108>
c010682b:	89 fb                	mov    %edi,%ebx
c010682d:	85 c0                	test   %eax,%eax
c010682f:	89 55 10             	mov    %edx,0x10(%ebp)
c0106832:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106838:	0f 84 5f 05 00 00    	je     c0106d9d <_svfiprintf_r+0x9dd>
c010683e:	88 45 80             	mov    %al,-0x80(%ebp)
c0106841:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106844:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010684b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106852:	00 00 00 
c0106855:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010685c:	00 00 00 
c010685f:	e9 5a 01 00 00       	jmp    c01069be <_svfiprintf_r+0x5fe>
c0106864:	31 db                	xor    %ebx,%ebx
c0106866:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106870:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106873:	83 c2 01             	add    $0x1,%edx
c0106876:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106879:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c010687d:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106880:	83 f9 09             	cmp    $0x9,%ecx
c0106883:	76 eb                	jbe    c0106870 <_svfiprintf_r+0x4b0>
c0106885:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c010688b:	e9 2c fc ff ff       	jmp    c01064bc <_svfiprintf_r+0xfc>
c0106890:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106897:	00 00 00 
c010689a:	89 d0                	mov    %edx,%eax
c010689c:	e9 15 fc ff ff       	jmp    c01064b6 <_svfiprintf_r+0xf6>
c01068a1:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01068a8:	89 55 10             	mov    %edx,0x10(%ebp)
c01068ab:	8b 45 14             	mov    0x14(%ebp),%eax
c01068ae:	0f 84 b8 fe ff ff    	je     c010676c <_svfiprintf_r+0x3ac>
c01068b4:	8b 08                	mov    (%eax),%ecx
c01068b6:	83 c0 04             	add    $0x4,%eax
c01068b9:	31 d2                	xor    %edx,%edx
c01068bb:	89 45 14             	mov    %eax,0x14(%ebp)
c01068be:	e9 7d fc ff ff       	jmp    c0106540 <_svfiprintf_r+0x180>
c01068c3:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01068ca:	89 f8                	mov    %edi,%eax
c01068cc:	89 55 10             	mov    %edx,0x10(%ebp)
c01068cf:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c01068d5:	0f 85 a2 07 00 00    	jne    c010707d <_svfiprintf_r+0xcbd>
c01068db:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01068e2:	0f 84 95 07 00 00    	je     c010707d <_svfiprintf_r+0xcbd>
c01068e8:	8b 45 14             	mov    0x14(%ebp),%eax
c01068eb:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c01068f2:	8b 00                	mov    (%eax),%eax
c01068f4:	66 89 18             	mov    %bx,(%eax)
c01068f7:	8b 45 14             	mov    0x14(%ebp),%eax
c01068fa:	83 c0 04             	add    $0x4,%eax
c01068fd:	89 45 14             	mov    %eax,0x14(%ebp)
c0106900:	e9 19 fb ff ff       	jmp    c010641e <_svfiprintf_r+0x5e>
c0106905:	89 fb                	mov    %edi,%ebx
c0106907:	89 55 10             	mov    %edx,0x10(%ebp)
c010690a:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106910:	c7 85 44 ff ff ff a3 	movl   $0xc01081a3,-0xbc(%ebp)
c0106917:	81 10 c0 
c010691a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106921:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106924:	75 0d                	jne    c0106933 <_svfiprintf_r+0x573>
c0106926:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c010692d:	0f 85 65 07 00 00    	jne    c0107098 <_svfiprintf_r+0xcd8>
c0106933:	8b 0b                	mov    (%ebx),%ecx
c0106935:	83 c3 04             	add    $0x4,%ebx
c0106938:	89 5d 14             	mov    %ebx,0x14(%ebp)
c010693b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106942:	ba 02 00 00 00       	mov    $0x2,%edx
c0106947:	0f 84 f3 fb ff ff    	je     c0106540 <_svfiprintf_r+0x180>
c010694d:	85 c9                	test   %ecx,%ecx
c010694f:	0f 84 eb fb ff ff    	je     c0106540 <_svfiprintf_r+0x180>
c0106955:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010695c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c0106962:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106969:	e9 d2 fb ff ff       	jmp    c0106540 <_svfiprintf_r+0x180>
c010696e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c0106975:	89 d0                	mov    %edx,%eax
c0106977:	e9 3a fb ff ff       	jmp    c01064b6 <_svfiprintf_r+0xf6>
c010697c:	89 f8                	mov    %edi,%eax
c010697e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106981:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106987:	e9 0f fe ff ff       	jmp    c010679b <_svfiprintf_r+0x3db>
c010698c:	8b 45 14             	mov    0x14(%ebp),%eax
c010698f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106992:	89 55 10             	mov    %edx,0x10(%ebp)
c0106995:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010699c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c01069a3:	00 00 00 
c01069a6:	8b 00                	mov    (%eax),%eax
c01069a8:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c01069af:	00 00 00 
c01069b2:	88 45 80             	mov    %al,-0x80(%ebp)
c01069b5:	8b 45 14             	mov    0x14(%ebp),%eax
c01069b8:	83 c0 04             	add    $0x4,%eax
c01069bb:	89 45 14             	mov    %eax,0x14(%ebp)
c01069be:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01069c5:	00 00 00 
c01069c8:	e9 05 fc ff ff       	jmp    c01065d2 <_svfiprintf_r+0x212>
c01069cd:	89 fb                	mov    %edi,%ebx
c01069cf:	89 55 10             	mov    %edx,0x10(%ebp)
c01069d2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c01069d8:	c7 85 44 ff ff ff 92 	movl   $0xc0108192,-0xbc(%ebp)
c01069df:	81 10 c0 
c01069e2:	e9 33 ff ff ff       	jmp    c010691a <_svfiprintf_r+0x55a>
c01069e7:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c01069ee:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069f5:	89 55 10             	mov    %edx,0x10(%ebp)
c01069f8:	8b 45 14             	mov    0x14(%ebp),%eax
c01069fb:	75 39                	jne    c0106a36 <_svfiprintf_r+0x676>
c01069fd:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106a04:	74 30                	je     c0106a36 <_svfiprintf_r+0x676>
c0106a06:	0f b7 08             	movzwl (%eax),%ecx
c0106a09:	83 c0 04             	add    $0x4,%eax
c0106a0c:	ba 01 00 00 00       	mov    $0x1,%edx
c0106a11:	89 45 14             	mov    %eax,0x14(%ebp)
c0106a14:	e9 27 fb ff ff       	jmp    c0106540 <_svfiprintf_r+0x180>
c0106a19:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c0106a20:	89 d0                	mov    %edx,%eax
c0106a22:	e9 8f fa ff ff       	jmp    c01064b6 <_svfiprintf_r+0xf6>
c0106a27:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106a2e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a31:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a34:	74 c7                	je     c01069fd <_svfiprintf_r+0x63d>
c0106a36:	8b 08                	mov    (%eax),%ecx
c0106a38:	83 c0 04             	add    $0x4,%eax
c0106a3b:	ba 01 00 00 00       	mov    $0x1,%edx
c0106a40:	89 45 14             	mov    %eax,0x14(%ebp)
c0106a43:	e9 f8 fa ff ff       	jmp    c0106540 <_svfiprintf_r+0x180>
c0106a48:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a4b:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a4e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106a55:	8b 18                	mov    (%eax),%ebx
c0106a57:	8d 50 04             	lea    0x4(%eax),%edx
c0106a5a:	85 db                	test   %ebx,%ebx
c0106a5c:	0f 84 cc 06 00 00    	je     c010712e <_svfiprintf_r+0xd6e>
c0106a62:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106a68:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c0106a6e:	85 ff                	test   %edi,%edi
c0106a70:	0f 88 59 06 00 00    	js     c01070cf <_svfiprintf_r+0xd0f>
c0106a76:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0106a7a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106a81:	00 
c0106a82:	89 1c 24             	mov    %ebx,(%esp)
c0106a85:	e8 06 e7 ff ff       	call   c0105190 <memchr>
c0106a8a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106a90:	85 c0                	test   %eax,%eax
c0106a92:	0f 84 c5 06 00 00    	je     c010715d <_svfiprintf_r+0xd9d>
c0106a98:	29 d8                	sub    %ebx,%eax
c0106a9a:	39 f8                	cmp    %edi,%eax
c0106a9c:	0f 4f c7             	cmovg  %edi,%eax
c0106a9f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106aa6:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106aac:	89 55 14             	mov    %edx,0x14(%ebp)
c0106aaf:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106ab6:	00 00 00 
c0106ab9:	e9 f2 fa ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c0106abe:	89 f8                	mov    %edi,%eax
c0106ac0:	84 c0                	test   %al,%al
c0106ac2:	b8 20 00 00 00       	mov    $0x20,%eax
c0106ac7:	0f 44 f8             	cmove  %eax,%edi
c0106aca:	89 d0                	mov    %edx,%eax
c0106acc:	e9 e5 f9 ff ff       	jmp    c01064b6 <_svfiprintf_r+0xf6>
c0106ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106ad8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106ade:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ae4:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c0106aeb:	74 2e                	je     c0106b1b <_svfiprintf_r+0x75b>
c0106aed:	83 c0 01             	add    $0x1,%eax
c0106af0:	83 c2 01             	add    $0x1,%edx
c0106af3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0106af9:	83 c6 08             	add    $0x8,%esi
c0106afc:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106aff:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0106b06:	83 f8 07             	cmp    $0x7,%eax
c0106b09:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106b0f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106b15:	0f 8f b5 04 00 00    	jg     c0106fd0 <_svfiprintf_r+0xc10>
c0106b1b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0106b21:	85 c9                	test   %ecx,%ecx
c0106b23:	74 2e                	je     c0106b53 <_svfiprintf_r+0x793>
c0106b25:	83 c0 01             	add    $0x1,%eax
c0106b28:	83 c2 02             	add    $0x2,%edx
c0106b2b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0106b31:	83 c6 08             	add    $0x8,%esi
c0106b34:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106b37:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c0106b3e:	83 f8 07             	cmp    $0x7,%eax
c0106b41:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106b47:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106b4d:	0f 8f 45 04 00 00    	jg     c0106f98 <_svfiprintf_r+0xbd8>
c0106b53:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c0106b5a:	00 00 00 
c0106b5d:	0f 84 9d 02 00 00    	je     c0106e00 <_svfiprintf_r+0xa40>
c0106b63:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106b69:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c0106b6f:	85 ff                	test   %edi,%edi
c0106b71:	0f 8e e1 00 00 00    	jle    c0106c58 <_svfiprintf_r+0x898>
c0106b77:	83 ff 10             	cmp    $0x10,%edi
c0106b7a:	0f 8e 7c 00 00 00    	jle    c0106bfc <_svfiprintf_r+0x83c>
c0106b80:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c0106b86:	89 f1                	mov    %esi,%ecx
c0106b88:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106b8b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106b8e:	eb 08                	jmp    c0106b98 <_svfiprintf_r+0x7d8>
c0106b90:	83 ef 10             	sub    $0x10,%edi
c0106b93:	83 ff 10             	cmp    $0x10,%edi
c0106b96:	7e 5c                	jle    c0106bf4 <_svfiprintf_r+0x834>
c0106b98:	83 c0 01             	add    $0x1,%eax
c0106b9b:	83 c2 10             	add    $0x10,%edx
c0106b9e:	c7 01 6c 86 10 c0    	movl   $0xc010866c,(%ecx)
c0106ba4:	83 c1 08             	add    $0x8,%ecx
c0106ba7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106bae:	83 f8 07             	cmp    $0x7,%eax
c0106bb1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106bb7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106bbd:	7e d1                	jle    c0106b90 <_svfiprintf_r+0x7d0>
c0106bbf:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106bc5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106bc9:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106bcd:	89 1c 24             	mov    %ebx,(%esp)
c0106bd0:	e8 fb f5 ff ff       	call   c01061d0 <__ssprint_r>
c0106bd5:	85 c0                	test   %eax,%eax
c0106bd7:	0f 85 eb 01 00 00    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106bdd:	83 ef 10             	sub    $0x10,%edi
c0106be0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106be6:	83 ff 10             	cmp    $0x10,%edi
c0106be9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106bef:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106bf2:	7f a4                	jg     c0106b98 <_svfiprintf_r+0x7d8>
c0106bf4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0106bfa:	89 ce                	mov    %ecx,%esi
c0106bfc:	83 c0 01             	add    $0x1,%eax
c0106bff:	01 fa                	add    %edi,%edx
c0106c01:	c7 06 6c 86 10 c0    	movl   $0xc010866c,(%esi)
c0106c07:	83 c6 08             	add    $0x8,%esi
c0106c0a:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106c0d:	83 f8 07             	cmp    $0x7,%eax
c0106c10:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c16:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c1c:	7e 3a                	jle    c0106c58 <_svfiprintf_r+0x898>
c0106c1e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106c24:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106c28:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106c2b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106c2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106c32:	89 04 24             	mov    %eax,(%esp)
c0106c35:	e8 96 f5 ff ff       	call   c01061d0 <__ssprint_r>
c0106c3a:	85 c0                	test   %eax,%eax
c0106c3c:	0f 85 86 01 00 00    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106c42:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106c48:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106c4b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106c58:	89 1e                	mov    %ebx,(%esi)
c0106c5a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c0106c60:	83 c0 01             	add    $0x1,%eax
c0106c63:	83 c6 08             	add    $0x8,%esi
c0106c66:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c6c:	89 5e fc             	mov    %ebx,-0x4(%esi)
c0106c6f:	01 da                	add    %ebx,%edx
c0106c71:	83 f8 07             	cmp    $0x7,%eax
c0106c74:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c7a:	0f 8f 80 02 00 00    	jg     c0106f00 <_svfiprintf_r+0xb40>
c0106c80:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c0106c87:	0f 84 b9 00 00 00    	je     c0106d46 <_svfiprintf_r+0x986>
c0106c8d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106c93:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106c99:	85 ff                	test   %edi,%edi
c0106c9b:	0f 8e a5 00 00 00    	jle    c0106d46 <_svfiprintf_r+0x986>
c0106ca1:	83 ff 10             	cmp    $0x10,%edi
c0106ca4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106caa:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0106cb0:	7e 71                	jle    c0106d23 <_svfiprintf_r+0x963>
c0106cb2:	89 f1                	mov    %esi,%ecx
c0106cb4:	8b 75 08             	mov    0x8(%ebp),%esi
c0106cb7:	eb 0f                	jmp    c0106cc8 <_svfiprintf_r+0x908>
c0106cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106cc0:	83 ef 10             	sub    $0x10,%edi
c0106cc3:	83 ff 10             	cmp    $0x10,%edi
c0106cc6:	7e 59                	jle    c0106d21 <_svfiprintf_r+0x961>
c0106cc8:	83 c0 01             	add    $0x1,%eax
c0106ccb:	83 c2 10             	add    $0x10,%edx
c0106cce:	c7 01 7c 86 10 c0    	movl   $0xc010867c,(%ecx)
c0106cd4:	83 c1 08             	add    $0x8,%ecx
c0106cd7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106cde:	83 f8 07             	cmp    $0x7,%eax
c0106ce1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106ce7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106ced:	7e d1                	jle    c0106cc0 <_svfiprintf_r+0x900>
c0106cef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106cf2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0106cf6:	89 34 24             	mov    %esi,(%esp)
c0106cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106cfd:	e8 ce f4 ff ff       	call   c01061d0 <__ssprint_r>
c0106d02:	85 c0                	test   %eax,%eax
c0106d04:	0f 85 be 00 00 00    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106d0a:	83 ef 10             	sub    $0x10,%edi
c0106d0d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106d13:	83 ff 10             	cmp    $0x10,%edi
c0106d16:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106d1c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106d1f:	7f a7                	jg     c0106cc8 <_svfiprintf_r+0x908>
c0106d21:	89 ce                	mov    %ecx,%esi
c0106d23:	83 c0 01             	add    $0x1,%eax
c0106d26:	01 fa                	add    %edi,%edx
c0106d28:	83 f8 07             	cmp    $0x7,%eax
c0106d2b:	c7 06 7c 86 10 c0    	movl   $0xc010867c,(%esi)
c0106d31:	89 7e 04             	mov    %edi,0x4(%esi)
c0106d34:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106d3a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106d40:	0f 8f ee 02 00 00    	jg     c0107034 <_svfiprintf_r+0xc74>
c0106d46:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c0106d4c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0106d52:	39 c6                	cmp    %eax,%esi
c0106d54:	0f 4d c6             	cmovge %esi,%eax
c0106d57:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c0106d5d:	85 d2                	test   %edx,%edx
c0106d5f:	0f 85 d3 01 00 00    	jne    c0106f38 <_svfiprintf_r+0xb78>
c0106d65:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106d6c:	00 00 00 
c0106d6f:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106d72:	e9 a7 f6 ff ff       	jmp    c010641e <_svfiprintf_r+0x5e>
c0106d77:	90                   	nop
c0106d78:	84 d2                	test   %dl,%dl
c0106d7a:	75 6c                	jne    c0106de8 <_svfiprintf_r+0xa28>
c0106d7c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106d83:	74 63                	je     c0106de8 <_svfiprintf_r+0xa28>
c0106d85:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0106d8b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106d8e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0106d92:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106d98:	e9 13 f8 ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c0106d9d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0106da3:	85 c0                	test   %eax,%eax
c0106da5:	74 21                	je     c0106dc8 <_svfiprintf_r+0xa08>
c0106da7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106dad:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106db1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106db4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0106dbb:	89 04 24             	mov    %eax,(%esp)
c0106dbe:	e8 0d f4 ff ff       	call   c01061d0 <__ssprint_r>
c0106dc3:	90                   	nop
c0106dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106dc8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106dcb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106dd0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c0106dd4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c0106ddb:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0106de1:	5b                   	pop    %ebx
c0106de2:	5e                   	pop    %esi
c0106de3:	5f                   	pop    %edi
c0106de4:	5d                   	pop    %ebp
c0106de5:	c3                   	ret    
c0106de6:	66 90                	xchg   %ax,%ax
c0106de8:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c0106def:	00 00 00 
c0106df2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106df5:	e9 b6 f7 ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c0106dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106e00:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106e06:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106e0c:	85 ff                	test   %edi,%edi
c0106e0e:	0f 8e 4f fd ff ff    	jle    c0106b63 <_svfiprintf_r+0x7a3>
c0106e14:	83 ff 10             	cmp    $0x10,%edi
c0106e17:	0f 8e 7f 00 00 00    	jle    c0106e9c <_svfiprintf_r+0xadc>
c0106e1d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0106e23:	89 f1                	mov    %esi,%ecx
c0106e25:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106e28:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106e2b:	eb 0b                	jmp    c0106e38 <_svfiprintf_r+0xa78>
c0106e2d:	8d 76 00             	lea    0x0(%esi),%esi
c0106e30:	83 ef 10             	sub    $0x10,%edi
c0106e33:	83 ff 10             	cmp    $0x10,%edi
c0106e36:	7e 5c                	jle    c0106e94 <_svfiprintf_r+0xad4>
c0106e38:	83 c0 01             	add    $0x1,%eax
c0106e3b:	83 c2 10             	add    $0x10,%edx
c0106e3e:	c7 01 6c 86 10 c0    	movl   $0xc010866c,(%ecx)
c0106e44:	83 c1 08             	add    $0x8,%ecx
c0106e47:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106e4e:	83 f8 07             	cmp    $0x7,%eax
c0106e51:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e57:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e5d:	7e d1                	jle    c0106e30 <_svfiprintf_r+0xa70>
c0106e5f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e65:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e69:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106e6d:	89 1c 24             	mov    %ebx,(%esp)
c0106e70:	e8 5b f3 ff ff       	call   c01061d0 <__ssprint_r>
c0106e75:	85 c0                	test   %eax,%eax
c0106e77:	0f 85 4b ff ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106e7d:	83 ef 10             	sub    $0x10,%edi
c0106e80:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e86:	83 ff 10             	cmp    $0x10,%edi
c0106e89:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106e8f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106e92:	7f a4                	jg     c0106e38 <_svfiprintf_r+0xa78>
c0106e94:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c0106e9a:	89 ce                	mov    %ecx,%esi
c0106e9c:	83 c0 01             	add    $0x1,%eax
c0106e9f:	01 fa                	add    %edi,%edx
c0106ea1:	c7 06 6c 86 10 c0    	movl   $0xc010866c,(%esi)
c0106ea7:	83 c6 08             	add    $0x8,%esi
c0106eaa:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106ead:	83 f8 07             	cmp    $0x7,%eax
c0106eb0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106eb6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106ebc:	0f 8e a1 fc ff ff    	jle    c0106b63 <_svfiprintf_r+0x7a3>
c0106ec2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106ec8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ecf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ed3:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ed6:	89 04 24             	mov    %eax,(%esp)
c0106ed9:	e8 f2 f2 ff ff       	call   c01061d0 <__ssprint_r>
c0106ede:	85 c0                	test   %eax,%eax
c0106ee0:	0f 85 e2 fe ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106ee6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106eec:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106eef:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ef5:	e9 69 fc ff ff       	jmp    c0106b63 <_svfiprintf_r+0x7a3>
c0106efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106f00:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f06:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f0d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f11:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f14:	89 04 24             	mov    %eax,(%esp)
c0106f17:	e8 b4 f2 ff ff       	call   c01061d0 <__ssprint_r>
c0106f1c:	85 c0                	test   %eax,%eax
c0106f1e:	0f 85 a4 fe ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106f24:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106f2a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f2d:	e9 4e fd ff ff       	jmp    c0106c80 <_svfiprintf_r+0x8c0>
c0106f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106f38:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f3e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f45:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f49:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f4c:	89 04 24             	mov    %eax,(%esp)
c0106f4f:	e8 7c f2 ff ff       	call   c01061d0 <__ssprint_r>
c0106f54:	85 c0                	test   %eax,%eax
c0106f56:	0f 84 09 fe ff ff    	je     c0106d65 <_svfiprintf_r+0x9a5>
c0106f5c:	e9 67 fe ff ff       	jmp    c0106dc8 <_svfiprintf_r+0xa08>
c0106f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106f68:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f6e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f72:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f75:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f79:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f7c:	89 04 24             	mov    %eax,(%esp)
c0106f7f:	e8 4c f2 ff ff       	call   c01061d0 <__ssprint_r>
c0106f84:	85 c0                	test   %eax,%eax
c0106f86:	0f 85 3c fe ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106f8c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f8f:	e9 e9 f4 ff ff       	jmp    c010647d <_svfiprintf_r+0xbd>
c0106f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106f98:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f9e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106fa2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106fa5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106fa9:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fac:	89 04 24             	mov    %eax,(%esp)
c0106faf:	e8 1c f2 ff ff       	call   c01061d0 <__ssprint_r>
c0106fb4:	85 c0                	test   %eax,%eax
c0106fb6:	0f 85 0c fe ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106fbc:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106fc2:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106fc5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106fcb:	e9 83 fb ff ff       	jmp    c0106b53 <_svfiprintf_r+0x793>
c0106fd0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106fd6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106fda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106fdd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fe4:	89 04 24             	mov    %eax,(%esp)
c0106fe7:	e8 e4 f1 ff ff       	call   c01061d0 <__ssprint_r>
c0106fec:	85 c0                	test   %eax,%eax
c0106fee:	0f 85 d4 fd ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0106ff4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106ffa:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106ffd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107003:	e9 13 fb ff ff       	jmp    c0106b1b <_svfiprintf_r+0x75b>
c0107008:	83 f9 09             	cmp    $0x9,%ecx
c010700b:	76 56                	jbe    c0107063 <_svfiprintf_r+0xca3>
c010700d:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107010:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0107015:	83 eb 01             	sub    $0x1,%ebx
c0107018:	f7 e1                	mul    %ecx
c010701a:	c1 ea 03             	shr    $0x3,%edx
c010701d:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0107020:	01 c0                	add    %eax,%eax
c0107022:	29 c1                	sub    %eax,%ecx
c0107024:	83 c1 30             	add    $0x30,%ecx
c0107027:	85 d2                	test   %edx,%edx
c0107029:	88 0b                	mov    %cl,(%ebx)
c010702b:	89 d1                	mov    %edx,%ecx
c010702d:	75 e1                	jne    c0107010 <_svfiprintf_r+0xc50>
c010702f:	e9 71 f5 ff ff       	jmp    c01065a5 <_svfiprintf_r+0x1e5>
c0107034:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010703a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010703e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107041:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107045:	8b 45 08             	mov    0x8(%ebp),%eax
c0107048:	89 04 24             	mov    %eax,(%esp)
c010704b:	e8 80 f1 ff ff       	call   c01061d0 <__ssprint_r>
c0107050:	85 c0                	test   %eax,%eax
c0107052:	0f 85 70 fd ff ff    	jne    c0106dc8 <_svfiprintf_r+0xa08>
c0107058:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010705e:	e9 e3 fc ff ff       	jmp    c0106d46 <_svfiprintf_r+0x986>
c0107063:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0107069:	83 c1 30             	add    $0x30,%ecx
c010706c:	88 4d a7             	mov    %cl,-0x59(%ebp)
c010706f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0107072:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107078:	e9 33 f5 ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c010707d:	8b 45 14             	mov    0x14(%ebp),%eax
c0107080:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c0107086:	8b 00                	mov    (%eax),%eax
c0107088:	89 18                	mov    %ebx,(%eax)
c010708a:	8b 45 14             	mov    0x14(%ebp),%eax
c010708d:	83 c0 04             	add    $0x4,%eax
c0107090:	89 45 14             	mov    %eax,0x14(%ebp)
c0107093:	e9 86 f3 ff ff       	jmp    c010641e <_svfiprintf_r+0x5e>
c0107098:	0f b7 0b             	movzwl (%ebx),%ecx
c010709b:	83 c3 04             	add    $0x4,%ebx
c010709e:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01070a1:	e9 95 f8 ff ff       	jmp    c010693b <_svfiprintf_r+0x57b>
c01070a6:	0f bf 08             	movswl (%eax),%ecx
c01070a9:	83 c0 04             	add    $0x4,%eax
c01070ac:	89 45 14             	mov    %eax,0x14(%ebp)
c01070af:	85 c9                	test   %ecx,%ecx
c01070b1:	0f 89 0d f7 ff ff    	jns    c01067c4 <_svfiprintf_r+0x404>
c01070b7:	f7 d9                	neg    %ecx
c01070b9:	bf 2d 00 00 00       	mov    $0x2d,%edi
c01070be:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c01070c5:	ba 01 00 00 00       	mov    $0x1,%edx
c01070ca:	e9 7a f4 ff ff       	jmp    c0106549 <_svfiprintf_r+0x189>
c01070cf:	89 1c 24             	mov    %ebx,(%esp)
c01070d2:	e8 79 f0 ff ff       	call   c0106150 <strlen>
c01070d7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01070dd:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01070e4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01070eb:	00 00 00 
c01070ee:	89 55 14             	mov    %edx,0x14(%ebp)
c01070f1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01070f7:	e9 b4 f4 ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c01070fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01070ff:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0107106:	00 
c0107107:	89 04 24             	mov    %eax,(%esp)
c010710a:	e8 41 d9 ff ff       	call   c0104a50 <_malloc_r>
c010710f:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107112:	85 c0                	test   %eax,%eax
c0107114:	89 06                	mov    %eax,(%esi)
c0107116:	89 46 10             	mov    %eax,0x10(%esi)
c0107119:	0f 84 a3 00 00 00    	je     c01071c2 <_svfiprintf_r+0xe02>
c010711f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107122:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0107129:	e9 b2 f2 ff ff       	jmp    c01063e0 <_svfiprintf_r+0x20>
c010712e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107134:	b8 06 00 00 00       	mov    $0x6,%eax
c0107139:	89 55 14             	mov    %edx,0x14(%ebp)
c010713c:	83 ff 06             	cmp    $0x6,%edi
c010713f:	0f 46 c7             	cmovbe %edi,%eax
c0107142:	85 c0                	test   %eax,%eax
c0107144:	0f 49 d8             	cmovns %eax,%ebx
c0107147:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c010714d:	bb b4 81 10 c0       	mov    $0xc01081b4,%ebx
c0107152:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107158:	e9 61 f8 ff ff       	jmp    c01069be <_svfiprintf_r+0x5fe>
c010715d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0107163:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010716a:	89 55 14             	mov    %edx,0x14(%ebp)
c010716d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107174:	00 00 00 
c0107177:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010717d:	e9 2e f4 ff ff       	jmp    c01065b0 <_svfiprintf_r+0x1f0>
c0107182:	89 da                	mov    %ebx,%edx
c0107184:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010718b:	00 00 00 
c010718e:	e9 29 f3 ff ff       	jmp    c01064bc <_svfiprintf_r+0xfc>
c0107193:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0107196:	89 da                	mov    %ebx,%edx
c0107198:	8b 45 14             	mov    0x14(%ebp),%eax
c010719b:	8b 09                	mov    (%ecx),%ecx
c010719d:	83 c0 04             	add    $0x4,%eax
c01071a0:	89 45 14             	mov    %eax,0x14(%ebp)
c01071a3:	85 c9                	test   %ecx,%ecx
c01071a5:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c01071ab:	0f 89 26 f3 ff ff    	jns    c01064d7 <_svfiprintf_r+0x117>
c01071b1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c01071b8:	ff ff ff 
c01071bb:	89 d0                	mov    %edx,%eax
c01071bd:	e9 f4 f2 ff ff       	jmp    c01064b6 <_svfiprintf_r+0xf6>
c01071c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01071c5:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01071cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01071d0:	e9 06 fc ff ff       	jmp    c0106ddb <_svfiprintf_r+0xa1b>
c01071d5:	66 90                	xchg   %ax,%ax
c01071d7:	66 90                	xchg   %ax,%ax
c01071d9:	66 90                	xchg   %ax,%ax
c01071db:	66 90                	xchg   %ax,%ax
c01071dd:	66 90                	xchg   %ax,%ax
c01071df:	90                   	nop

c01071e0 <_calloc_r>:
c01071e0:	55                   	push   %ebp
c01071e1:	89 e5                	mov    %esp,%ebp
c01071e3:	53                   	push   %ebx
c01071e4:	83 ec 14             	sub    $0x14,%esp
c01071e7:	8b 45 10             	mov    0x10(%ebp),%eax
c01071ea:	0f af 45 0c          	imul   0xc(%ebp),%eax
c01071ee:	89 44 24 04          	mov    %eax,0x4(%esp)
c01071f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01071f5:	89 04 24             	mov    %eax,(%esp)
c01071f8:	e8 53 d8 ff ff       	call   c0104a50 <_malloc_r>
c01071fd:	85 c0                	test   %eax,%eax
c01071ff:	89 c3                	mov    %eax,%ebx
c0107201:	0f 84 91 00 00 00    	je     c0107298 <_calloc_r+0xb8>
c0107207:	8b 40 fc             	mov    -0x4(%eax),%eax
c010720a:	83 e0 fc             	and    $0xfffffffc,%eax
c010720d:	83 e8 04             	sub    $0x4,%eax
c0107210:	83 f8 24             	cmp    $0x24,%eax
c0107213:	77 63                	ja     c0107278 <_calloc_r+0x98>
c0107215:	83 f8 13             	cmp    $0x13,%eax
c0107218:	89 da                	mov    %ebx,%edx
c010721a:	77 1c                	ja     c0107238 <_calloc_r+0x58>
c010721c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c0107222:	89 d8                	mov    %ebx,%eax
c0107224:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c010722b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c0107232:	83 c4 14             	add    $0x14,%esp
c0107235:	5b                   	pop    %ebx
c0107236:	5d                   	pop    %ebp
c0107237:	c3                   	ret    
c0107238:	83 f8 1b             	cmp    $0x1b,%eax
c010723b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0107241:	8d 53 08             	lea    0x8(%ebx),%edx
c0107244:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c010724b:	76 cf                	jbe    c010721c <_calloc_r+0x3c>
c010724d:	83 f8 24             	cmp    $0x24,%eax
c0107250:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107257:	8d 53 10             	lea    0x10(%ebx),%edx
c010725a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c0107261:	75 b9                	jne    c010721c <_calloc_r+0x3c>
c0107263:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c010726a:	8d 53 18             	lea    0x18(%ebx),%edx
c010726d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c0107274:	eb a6                	jmp    c010721c <_calloc_r+0x3c>
c0107276:	66 90                	xchg   %ax,%ax
c0107278:	89 1c 24             	mov    %ebx,(%esp)
c010727b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010727f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107286:	00 
c0107287:	e8 5c a2 ff ff       	call   c01014e8 <memset>
c010728c:	83 c4 14             	add    $0x14,%esp
c010728f:	89 d8                	mov    %ebx,%eax
c0107291:	5b                   	pop    %ebx
c0107292:	5d                   	pop    %ebp
c0107293:	c3                   	ret    
c0107294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107298:	31 c0                	xor    %eax,%eax
c010729a:	eb 96                	jmp    c0107232 <_calloc_r+0x52>
c010729c:	66 90                	xchg   %ax,%ax
c010729e:	66 90                	xchg   %ax,%ax

c01072a0 <_malloc_trim_r>:
c01072a0:	55                   	push   %ebp
c01072a1:	89 e5                	mov    %esp,%ebp
c01072a3:	57                   	push   %edi
c01072a4:	56                   	push   %esi
c01072a5:	53                   	push   %ebx
c01072a6:	83 ec 1c             	sub    $0x1c,%esp
c01072a9:	8b 75 08             	mov    0x8(%ebp),%esi
c01072ac:	89 34 24             	mov    %esi,(%esp)
c01072af:	e8 7c df ff ff       	call   c0105230 <__malloc_lock>
c01072b4:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c01072b9:	8b 58 04             	mov    0x4(%eax),%ebx
c01072bc:	83 e3 fc             	and    $0xfffffffc,%ebx
c01072bf:	89 d8                	mov    %ebx,%eax
c01072c1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01072c4:	05 ef 0f 00 00       	add    $0xfef,%eax
c01072c9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01072ce:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c01072d4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c01072da:	7e 1c                	jle    c01072f8 <_malloc_trim_r+0x58>
c01072dc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01072e3:	00 
c01072e4:	89 34 24             	mov    %esi,(%esp)
c01072e7:	e8 44 ed ff ff       	call   c0106030 <_sbrk_r>
c01072ec:	8b 15 28 a5 10 c0    	mov    0xc010a528,%edx
c01072f2:	01 da                	add    %ebx,%edx
c01072f4:	39 d0                	cmp    %edx,%eax
c01072f6:	74 18                	je     c0107310 <_malloc_trim_r+0x70>
c01072f8:	89 34 24             	mov    %esi,(%esp)
c01072fb:	e8 40 df ff ff       	call   c0105240 <__malloc_unlock>
c0107300:	83 c4 1c             	add    $0x1c,%esp
c0107303:	31 c0                	xor    %eax,%eax
c0107305:	5b                   	pop    %ebx
c0107306:	5e                   	pop    %esi
c0107307:	5f                   	pop    %edi
c0107308:	5d                   	pop    %ebp
c0107309:	c3                   	ret    
c010730a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107310:	89 f8                	mov    %edi,%eax
c0107312:	f7 d8                	neg    %eax
c0107314:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107318:	89 34 24             	mov    %esi,(%esp)
c010731b:	e8 10 ed ff ff       	call   c0106030 <_sbrk_r>
c0107320:	83 f8 ff             	cmp    $0xffffffff,%eax
c0107323:	74 2b                	je     c0107350 <_malloc_trim_r+0xb0>
c0107325:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c010732a:	29 fb                	sub    %edi,%ebx
c010732c:	83 cb 01             	or     $0x1,%ebx
c010732f:	29 3d 60 25 16 c0    	sub    %edi,0xc0162560
c0107335:	89 58 04             	mov    %ebx,0x4(%eax)
c0107338:	89 34 24             	mov    %esi,(%esp)
c010733b:	e8 00 df ff ff       	call   c0105240 <__malloc_unlock>
c0107340:	83 c4 1c             	add    $0x1c,%esp
c0107343:	b8 01 00 00 00       	mov    $0x1,%eax
c0107348:	5b                   	pop    %ebx
c0107349:	5e                   	pop    %esi
c010734a:	5f                   	pop    %edi
c010734b:	5d                   	pop    %ebp
c010734c:	c3                   	ret    
c010734d:	8d 76 00             	lea    0x0(%esi),%esi
c0107350:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107357:	00 
c0107358:	89 34 24             	mov    %esi,(%esp)
c010735b:	e8 d0 ec ff ff       	call   c0106030 <_sbrk_r>
c0107360:	8b 15 28 a5 10 c0    	mov    0xc010a528,%edx
c0107366:	89 c1                	mov    %eax,%ecx
c0107368:	29 d1                	sub    %edx,%ecx
c010736a:	83 f9 0f             	cmp    $0xf,%ecx
c010736d:	7e 89                	jle    c01072f8 <_malloc_trim_r+0x58>
c010736f:	2b 05 00 a5 10 c0    	sub    0xc010a500,%eax
c0107375:	83 c9 01             	or     $0x1,%ecx
c0107378:	89 4a 04             	mov    %ecx,0x4(%edx)
c010737b:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0107380:	e9 73 ff ff ff       	jmp    c01072f8 <_malloc_trim_r+0x58>
c0107385:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0107390 <_free_r>:
c0107390:	55                   	push   %ebp
c0107391:	89 e5                	mov    %esp,%ebp
c0107393:	57                   	push   %edi
c0107394:	56                   	push   %esi
c0107395:	53                   	push   %ebx
c0107396:	83 ec 1c             	sub    $0x1c,%esp
c0107399:	8b 75 0c             	mov    0xc(%ebp),%esi
c010739c:	8b 45 08             	mov    0x8(%ebp),%eax
c010739f:	85 f6                	test   %esi,%esi
c01073a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01073a4:	0f 84 fe 00 00 00    	je     c01074a8 <_free_r+0x118>
c01073aa:	89 04 24             	mov    %eax,(%esp)
c01073ad:	e8 7e de ff ff       	call   c0105230 <__malloc_lock>
c01073b2:	8b 7e fc             	mov    -0x4(%esi),%edi
c01073b5:	8d 56 f8             	lea    -0x8(%esi),%edx
c01073b8:	89 f8                	mov    %edi,%eax
c01073ba:	83 e0 fe             	and    $0xfffffffe,%eax
c01073bd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c01073c0:	8b 59 04             	mov    0x4(%ecx),%ebx
c01073c3:	83 e3 fc             	and    $0xfffffffc,%ebx
c01073c6:	39 0d 28 a5 10 c0    	cmp    %ecx,0xc010a528
c01073cc:	0f 84 0e 01 00 00    	je     c01074e0 <_free_r+0x150>
c01073d2:	83 e7 01             	and    $0x1,%edi
c01073d5:	89 59 04             	mov    %ebx,0x4(%ecx)
c01073d8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01073df:	75 1f                	jne    c0107400 <_free_r+0x70>
c01073e1:	8b 76 f8             	mov    -0x8(%esi),%esi
c01073e4:	29 f2                	sub    %esi,%edx
c01073e6:	01 f0                	add    %esi,%eax
c01073e8:	8b 72 08             	mov    0x8(%edx),%esi
c01073eb:	81 fe 28 a5 10 c0    	cmp    $0xc010a528,%esi
c01073f1:	0f 84 39 01 00 00    	je     c0107530 <_free_r+0x1a0>
c01073f7:	8b 7a 0c             	mov    0xc(%edx),%edi
c01073fa:	89 7e 0c             	mov    %edi,0xc(%esi)
c01073fd:	89 77 08             	mov    %esi,0x8(%edi)
c0107400:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c0107405:	75 21                	jne    c0107428 <_free_r+0x98>
c0107407:	8b 75 e0             	mov    -0x20(%ebp),%esi
c010740a:	01 d8                	add    %ebx,%eax
c010740c:	8b 59 08             	mov    0x8(%ecx),%ebx
c010740f:	85 f6                	test   %esi,%esi
c0107411:	75 0c                	jne    c010741f <_free_r+0x8f>
c0107413:	81 fb 28 a5 10 c0    	cmp    $0xc010a528,%ebx
c0107419:	0f 84 21 01 00 00    	je     c0107540 <_free_r+0x1b0>
c010741f:	8b 49 0c             	mov    0xc(%ecx),%ecx
c0107422:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107425:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107428:	89 c1                	mov    %eax,%ecx
c010742a:	83 c9 01             	or     $0x1,%ecx
c010742d:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107430:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107433:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107436:	85 c9                	test   %ecx,%ecx
c0107438:	75 56                	jne    c0107490 <_free_r+0x100>
c010743a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010743f:	76 6f                	jbe    c01074b0 <_free_r+0x120>
c0107441:	89 c1                	mov    %eax,%ecx
c0107443:	c1 e9 09             	shr    $0x9,%ecx
c0107446:	83 f9 04             	cmp    $0x4,%ecx
c0107449:	0f 87 21 01 00 00    	ja     c0107570 <_free_r+0x1e0>
c010744f:	89 c1                	mov    %eax,%ecx
c0107451:	c1 e9 06             	shr    $0x6,%ecx
c0107454:	83 c1 38             	add    $0x38,%ecx
c0107457:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010745a:	8d 34 9d 20 a5 10 c0 	lea    -0x3fef5ae0(,%ebx,4),%esi
c0107461:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107464:	39 f3                	cmp    %esi,%ebx
c0107466:	0f 84 14 01 00 00    	je     c0107580 <_free_r+0x1f0>
c010746c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107470:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107473:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107476:	39 c8                	cmp    %ecx,%eax
c0107478:	73 07                	jae    c0107481 <_free_r+0xf1>
c010747a:	8b 5b 08             	mov    0x8(%ebx),%ebx
c010747d:	39 de                	cmp    %ebx,%esi
c010747f:	75 ef                	jne    c0107470 <_free_r+0xe0>
c0107481:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107484:	89 42 0c             	mov    %eax,0xc(%edx)
c0107487:	89 5a 08             	mov    %ebx,0x8(%edx)
c010748a:	89 50 08             	mov    %edx,0x8(%eax)
c010748d:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107490:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107493:	89 45 08             	mov    %eax,0x8(%ebp)
c0107496:	83 c4 1c             	add    $0x1c,%esp
c0107499:	5b                   	pop    %ebx
c010749a:	5e                   	pop    %esi
c010749b:	5f                   	pop    %edi
c010749c:	5d                   	pop    %ebp
c010749d:	e9 9e dd ff ff       	jmp    c0105240 <__malloc_unlock>
c01074a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01074a8:	83 c4 1c             	add    $0x1c,%esp
c01074ab:	5b                   	pop    %ebx
c01074ac:	5e                   	pop    %esi
c01074ad:	5f                   	pop    %edi
c01074ae:	5d                   	pop    %ebp
c01074af:	c3                   	ret    
c01074b0:	c1 e8 03             	shr    $0x3,%eax
c01074b3:	bb 01 00 00 00       	mov    $0x1,%ebx
c01074b8:	89 c1                	mov    %eax,%ecx
c01074ba:	c1 f9 02             	sar    $0x2,%ecx
c01074bd:	8d 04 c5 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,8),%eax
c01074c4:	d3 e3                	shl    %cl,%ebx
c01074c6:	8b 48 08             	mov    0x8(%eax),%ecx
c01074c9:	09 1d 24 a5 10 c0    	or     %ebx,0xc010a524
c01074cf:	89 42 0c             	mov    %eax,0xc(%edx)
c01074d2:	89 4a 08             	mov    %ecx,0x8(%edx)
c01074d5:	89 50 08             	mov    %edx,0x8(%eax)
c01074d8:	89 51 0c             	mov    %edx,0xc(%ecx)
c01074db:	eb b3                	jmp    c0107490 <_free_r+0x100>
c01074dd:	8d 76 00             	lea    0x0(%esi),%esi
c01074e0:	01 d8                	add    %ebx,%eax
c01074e2:	83 e7 01             	and    $0x1,%edi
c01074e5:	75 13                	jne    c01074fa <_free_r+0x16a>
c01074e7:	8b 4e f8             	mov    -0x8(%esi),%ecx
c01074ea:	29 ca                	sub    %ecx,%edx
c01074ec:	01 c8                	add    %ecx,%eax
c01074ee:	8b 5a 08             	mov    0x8(%edx),%ebx
c01074f1:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01074f4:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01074f7:	89 59 08             	mov    %ebx,0x8(%ecx)
c01074fa:	89 c1                	mov    %eax,%ecx
c01074fc:	83 c9 01             	or     $0x1,%ecx
c01074ff:	3b 05 04 a5 10 c0    	cmp    0xc010a504,%eax
c0107505:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107508:	89 15 28 a5 10 c0    	mov    %edx,0xc010a528
c010750e:	72 80                	jb     c0107490 <_free_r+0x100>
c0107510:	a1 90 25 16 c0       	mov    0xc0162590,%eax
c0107515:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107519:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010751c:	89 04 24             	mov    %eax,(%esp)
c010751f:	e8 7c fd ff ff       	call   c01072a0 <_malloc_trim_r>
c0107524:	e9 67 ff ff ff       	jmp    c0107490 <_free_r+0x100>
c0107529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107530:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0107537:	e9 c4 fe ff ff       	jmp    c0107400 <_free_r+0x70>
c010753c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107540:	89 c1                	mov    %eax,%ecx
c0107542:	83 c9 01             	or     $0x1,%ecx
c0107545:	89 15 34 a5 10 c0    	mov    %edx,0xc010a534
c010754b:	89 15 30 a5 10 c0    	mov    %edx,0xc010a530
c0107551:	c7 42 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%edx)
c0107558:	c7 42 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%edx)
c010755f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107562:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107565:	e9 26 ff ff ff       	jmp    c0107490 <_free_r+0x100>
c010756a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107570:	83 f9 14             	cmp    $0x14,%ecx
c0107573:	77 23                	ja     c0107598 <_free_r+0x208>
c0107575:	83 c1 5b             	add    $0x5b,%ecx
c0107578:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010757b:	e9 da fe ff ff       	jmp    c010745a <_free_r+0xca>
c0107580:	c1 f9 02             	sar    $0x2,%ecx
c0107583:	b8 01 00 00 00       	mov    $0x1,%eax
c0107588:	d3 e0                	shl    %cl,%eax
c010758a:	09 05 24 a5 10 c0    	or     %eax,0xc010a524
c0107590:	89 d8                	mov    %ebx,%eax
c0107592:	e9 ed fe ff ff       	jmp    c0107484 <_free_r+0xf4>
c0107597:	90                   	nop
c0107598:	83 f9 54             	cmp    $0x54,%ecx
c010759b:	77 10                	ja     c01075ad <_free_r+0x21d>
c010759d:	89 c1                	mov    %eax,%ecx
c010759f:	c1 e9 0c             	shr    $0xc,%ecx
c01075a2:	83 c1 6e             	add    $0x6e,%ecx
c01075a5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01075a8:	e9 ad fe ff ff       	jmp    c010745a <_free_r+0xca>
c01075ad:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01075b3:	77 10                	ja     c01075c5 <_free_r+0x235>
c01075b5:	89 c1                	mov    %eax,%ecx
c01075b7:	c1 e9 0f             	shr    $0xf,%ecx
c01075ba:	83 c1 77             	add    $0x77,%ecx
c01075bd:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01075c0:	e9 95 fe ff ff       	jmp    c010745a <_free_r+0xca>
c01075c5:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c01075cb:	77 10                	ja     c01075dd <_free_r+0x24d>
c01075cd:	89 c1                	mov    %eax,%ecx
c01075cf:	c1 e9 12             	shr    $0x12,%ecx
c01075d2:	83 c1 7c             	add    $0x7c,%ecx
c01075d5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01075d8:	e9 7d fe ff ff       	jmp    c010745a <_free_r+0xca>
c01075dd:	bb fc 00 00 00       	mov    $0xfc,%ebx
c01075e2:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c01075e7:	e9 6e fe ff ff       	jmp    c010745a <_free_r+0xca>
c01075ec:	66 90                	xchg   %ax,%ax
c01075ee:	66 90                	xchg   %ax,%ax

c01075f0 <memmove>:
c01075f0:	55                   	push   %ebp
c01075f1:	89 e5                	mov    %esp,%ebp
c01075f3:	56                   	push   %esi
c01075f4:	57                   	push   %edi
c01075f5:	53                   	push   %ebx
c01075f6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01075f9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01075fc:	8b 75 0c             	mov    0xc(%ebp),%esi
c01075ff:	fc                   	cld    
c0107600:	39 fe                	cmp    %edi,%esi
c0107602:	73 43                	jae    c0107647 <memmove+0x57>
c0107604:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c0107608:	39 df                	cmp    %ebx,%edi
c010760a:	77 3b                	ja     c0107647 <memmove+0x57>
c010760c:	01 ce                	add    %ecx,%esi
c010760e:	01 cf                	add    %ecx,%edi
c0107610:	fd                   	std    
c0107611:	83 f9 08             	cmp    $0x8,%ecx
c0107614:	76 2b                	jbe    c0107641 <memmove+0x51>
c0107616:	89 fa                	mov    %edi,%edx
c0107618:	89 cb                	mov    %ecx,%ebx
c010761a:	83 e2 03             	and    $0x3,%edx
c010761d:	74 0c                	je     c010762b <memmove+0x3b>
c010761f:	89 d1                	mov    %edx,%ecx
c0107621:	4e                   	dec    %esi
c0107622:	4f                   	dec    %edi
c0107623:	29 cb                	sub    %ecx,%ebx
c0107625:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107627:	89 d9                	mov    %ebx,%ecx
c0107629:	46                   	inc    %esi
c010762a:	47                   	inc    %edi
c010762b:	c1 e9 02             	shr    $0x2,%ecx
c010762e:	83 ee 04             	sub    $0x4,%esi
c0107631:	83 ef 04             	sub    $0x4,%edi
c0107634:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107636:	83 c6 04             	add    $0x4,%esi
c0107639:	83 c7 04             	add    $0x4,%edi
c010763c:	89 d9                	mov    %ebx,%ecx
c010763e:	83 e1 03             	and    $0x3,%ecx
c0107641:	4e                   	dec    %esi
c0107642:	4f                   	dec    %edi
c0107643:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107645:	eb 2a                	jmp    c0107671 <memmove+0x81>
c0107647:	83 f9 08             	cmp    $0x8,%ecx
c010764a:	76 23                	jbe    c010766f <memmove+0x7f>
c010764c:	89 fa                	mov    %edi,%edx
c010764e:	89 cb                	mov    %ecx,%ebx
c0107650:	83 e2 03             	and    $0x3,%edx
c0107653:	74 10                	je     c0107665 <memmove+0x75>
c0107655:	b9 04 00 00 00       	mov    $0x4,%ecx
c010765a:	29 d1                	sub    %edx,%ecx
c010765c:	83 e1 03             	and    $0x3,%ecx
c010765f:	29 cb                	sub    %ecx,%ebx
c0107661:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107663:	89 d9                	mov    %ebx,%ecx
c0107665:	c1 e9 02             	shr    $0x2,%ecx
c0107668:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010766a:	89 d9                	mov    %ebx,%ecx
c010766c:	83 e1 03             	and    $0x3,%ecx
c010766f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107671:	8b 45 08             	mov    0x8(%ebp),%eax
c0107674:	fc                   	cld    
c0107675:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107678:	5b                   	pop    %ebx
c0107679:	5f                   	pop    %edi
c010767a:	5e                   	pop    %esi
c010767b:	c9                   	leave  
c010767c:	c3                   	ret    
c010767d:	66 90                	xchg   %ax,%ax
c010767f:	90                   	nop

c0107680 <_realloc_r>:
c0107680:	55                   	push   %ebp
c0107681:	89 e5                	mov    %esp,%ebp
c0107683:	57                   	push   %edi
c0107684:	56                   	push   %esi
c0107685:	53                   	push   %ebx
c0107686:	83 ec 3c             	sub    $0x3c,%esp
c0107689:	8b 45 08             	mov    0x8(%ebp),%eax
c010768c:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010768f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107692:	8b 45 10             	mov    0x10(%ebp),%eax
c0107695:	85 ff                	test   %edi,%edi
c0107697:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010769a:	0f 84 50 02 00 00    	je     c01078f0 <_realloc_r+0x270>
c01076a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01076a3:	8d 77 f8             	lea    -0x8(%edi),%esi
c01076a6:	89 04 24             	mov    %eax,(%esp)
c01076a9:	e8 82 db ff ff       	call   c0105230 <__malloc_lock>
c01076ae:	8b 47 fc             	mov    -0x4(%edi),%eax
c01076b1:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01076b4:	89 c3                	mov    %eax,%ebx
c01076b6:	8d 51 0b             	lea    0xb(%ecx),%edx
c01076b9:	83 e3 fc             	and    $0xfffffffc,%ebx
c01076bc:	83 fa 16             	cmp    $0x16,%edx
c01076bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01076c2:	0f 87 00 01 00 00    	ja     c01077c8 <_realloc_r+0x148>
c01076c8:	31 d2                	xor    %edx,%edx
c01076ca:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c01076d1:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01076d8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01076db:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c01076de:	0f 82 1c 02 00 00    	jb     c0107900 <_realloc_r+0x280>
c01076e4:	84 d2                	test   %dl,%dl
c01076e6:	0f 85 14 02 00 00    	jne    c0107900 <_realloc_r+0x280>
c01076ec:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c01076ef:	0f 8d eb 00 00 00    	jge    c01077e0 <_realloc_r+0x160>
c01076f5:	8b 0d 28 a5 10 c0    	mov    0xc010a528,%ecx
c01076fb:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c01076fe:	39 d1                	cmp    %edx,%ecx
c0107700:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c0107703:	0f 84 6f 02 00 00    	je     c0107978 <_realloc_r+0x2f8>
c0107709:	8b 4a 04             	mov    0x4(%edx),%ecx
c010770c:	89 c8                	mov    %ecx,%eax
c010770e:	83 e0 fe             	and    $0xfffffffe,%eax
c0107711:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c0107716:	0f 84 f4 00 00 00    	je     c0107810 <_realloc_r+0x190>
c010771c:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c0107723:	31 d2                	xor    %edx,%edx
c0107725:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c0107729:	0f 85 39 01 00 00    	jne    c0107868 <_realloc_r+0x1e8>
c010772f:	89 f1                	mov    %esi,%ecx
c0107731:	2b 4f f8             	sub    -0x8(%edi),%ecx
c0107734:	8b 41 04             	mov    0x4(%ecx),%eax
c0107737:	83 e0 fc             	and    $0xfffffffc,%eax
c010773a:	85 d2                	test   %edx,%edx
c010773c:	0f 84 f6 02 00 00    	je     c0107a38 <_realloc_r+0x3b8>
c0107742:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0107745:	0f 84 f5 02 00 00    	je     c0107a40 <_realloc_r+0x3c0>
c010774b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c010774e:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107751:	01 d8                	add    %ebx,%eax
c0107753:	01 c2                	add    %eax,%edx
c0107755:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107758:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010775b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010775e:	0f 8c ac 01 00 00    	jl     c0107910 <_realloc_r+0x290>
c0107764:	8b 42 0c             	mov    0xc(%edx),%eax
c0107767:	83 eb 04             	sub    $0x4,%ebx
c010776a:	8b 52 08             	mov    0x8(%edx),%edx
c010776d:	83 fb 24             	cmp    $0x24,%ebx
c0107770:	8d 71 08             	lea    0x8(%ecx),%esi
c0107773:	89 42 0c             	mov    %eax,0xc(%edx)
c0107776:	89 50 08             	mov    %edx,0x8(%eax)
c0107779:	8b 41 0c             	mov    0xc(%ecx),%eax
c010777c:	8b 51 08             	mov    0x8(%ecx),%edx
c010777f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107782:	89 50 08             	mov    %edx,0x8(%eax)
c0107785:	0f 87 85 03 00 00    	ja     c0107b10 <_realloc_r+0x490>
c010778b:	83 fb 13             	cmp    $0x13,%ebx
c010778e:	89 f0                	mov    %esi,%eax
c0107790:	76 1a                	jbe    c01077ac <_realloc_r+0x12c>
c0107792:	8b 07                	mov    (%edi),%eax
c0107794:	83 fb 1b             	cmp    $0x1b,%ebx
c0107797:	89 41 08             	mov    %eax,0x8(%ecx)
c010779a:	8b 47 04             	mov    0x4(%edi),%eax
c010779d:	89 41 0c             	mov    %eax,0xc(%ecx)
c01077a0:	0f 87 8f 03 00 00    	ja     c0107b35 <_realloc_r+0x4b5>
c01077a6:	8d 41 10             	lea    0x10(%ecx),%eax
c01077a9:	83 c7 08             	add    $0x8,%edi
c01077ac:	8b 17                	mov    (%edi),%edx
c01077ae:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c01077b1:	89 10                	mov    %edx,(%eax)
c01077b3:	8b 57 04             	mov    0x4(%edi),%edx
c01077b6:	89 50 04             	mov    %edx,0x4(%eax)
c01077b9:	8b 57 08             	mov    0x8(%edi),%edx
c01077bc:	89 f7                	mov    %esi,%edi
c01077be:	89 ce                	mov    %ecx,%esi
c01077c0:	89 50 08             	mov    %edx,0x8(%eax)
c01077c3:	8b 41 04             	mov    0x4(%ecx),%eax
c01077c6:	eb 1b                	jmp    c01077e3 <_realloc_r+0x163>
c01077c8:	83 e2 f8             	and    $0xfffffff8,%edx
c01077cb:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01077ce:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01077d1:	c1 ea 1f             	shr    $0x1f,%edx
c01077d4:	e9 ff fe ff ff       	jmp    c01076d8 <_realloc_r+0x58>
c01077d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01077e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01077e3:	89 da                	mov    %ebx,%edx
c01077e5:	2b 55 dc             	sub    -0x24(%ebp),%edx
c01077e8:	83 fa 0f             	cmp    $0xf,%edx
c01077eb:	77 4b                	ja     c0107838 <_realloc_r+0x1b8>
c01077ed:	83 e0 01             	and    $0x1,%eax
c01077f0:	09 d8                	or     %ebx,%eax
c01077f2:	89 46 04             	mov    %eax,0x4(%esi)
c01077f5:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c01077fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01077fd:	89 04 24             	mov    %eax,(%esp)
c0107800:	e8 3b da ff ff       	call   c0105240 <__malloc_unlock>
c0107805:	89 f8                	mov    %edi,%eax
c0107807:	83 c4 3c             	add    $0x3c,%esp
c010780a:	5b                   	pop    %ebx
c010780b:	5e                   	pop    %esi
c010780c:	5f                   	pop    %edi
c010780d:	5d                   	pop    %ebp
c010780e:	c3                   	ret    
c010780f:	90                   	nop
c0107810:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107813:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107816:	01 d9                	add    %ebx,%ecx
c0107818:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c010781b:	0f 8c 04 ff ff ff    	jl     c0107725 <_realloc_r+0xa5>
c0107821:	8b 5a 0c             	mov    0xc(%edx),%ebx
c0107824:	8b 52 08             	mov    0x8(%edx),%edx
c0107827:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010782a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c010782d:	89 53 08             	mov    %edx,0x8(%ebx)
c0107830:	89 cb                	mov    %ecx,%ebx
c0107832:	eb af                	jmp    c01077e3 <_realloc_r+0x163>
c0107834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107838:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010783b:	83 e0 01             	and    $0x1,%eax
c010783e:	09 d8                	or     %ebx,%eax
c0107840:	89 46 04             	mov    %eax,0x4(%esi)
c0107843:	89 d0                	mov    %edx,%eax
c0107845:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c0107848:	83 c8 01             	or     $0x1,%eax
c010784b:	89 41 04             	mov    %eax,0x4(%ecx)
c010784e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107851:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107856:	83 c1 08             	add    $0x8,%ecx
c0107859:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010785d:	89 04 24             	mov    %eax,(%esp)
c0107860:	e8 2b fb ff ff       	call   c0107390 <_free_r>
c0107865:	eb 93                	jmp    c01077fa <_realloc_r+0x17a>
c0107867:	90                   	nop
c0107868:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010786b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010786f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107872:	89 04 24             	mov    %eax,(%esp)
c0107875:	e8 d6 d1 ff ff       	call   c0104a50 <_malloc_r>
c010787a:	85 c0                	test   %eax,%eax
c010787c:	89 c1                	mov    %eax,%ecx
c010787e:	0f 84 65 03 00 00    	je     c0107be9 <_realloc_r+0x569>
c0107884:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107887:	8d 51 f8             	lea    -0x8(%ecx),%edx
c010788a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010788d:	89 c2                	mov    %eax,%edx
c010788f:	83 e2 fe             	and    $0xfffffffe,%edx
c0107892:	01 f2                	add    %esi,%edx
c0107894:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107897:	0f 84 63 02 00 00    	je     c0107b00 <_realloc_r+0x480>
c010789d:	83 eb 04             	sub    $0x4,%ebx
c01078a0:	83 fb 24             	cmp    $0x24,%ebx
c01078a3:	0f 87 6f 01 00 00    	ja     c0107a18 <_realloc_r+0x398>
c01078a9:	83 fb 13             	cmp    $0x13,%ebx
c01078ac:	0f 87 ee 00 00 00    	ja     c01079a0 <_realloc_r+0x320>
c01078b2:	89 c8                	mov    %ecx,%eax
c01078b4:	89 fa                	mov    %edi,%edx
c01078b6:	8b 1a                	mov    (%edx),%ebx
c01078b8:	89 18                	mov    %ebx,(%eax)
c01078ba:	8b 5a 04             	mov    0x4(%edx),%ebx
c01078bd:	89 58 04             	mov    %ebx,0x4(%eax)
c01078c0:	8b 52 08             	mov    0x8(%edx),%edx
c01078c3:	89 50 08             	mov    %edx,0x8(%eax)
c01078c6:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c01078c9:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01078cd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01078d0:	89 34 24             	mov    %esi,(%esp)
c01078d3:	e8 b8 fa ff ff       	call   c0107390 <_free_r>
c01078d8:	89 34 24             	mov    %esi,(%esp)
c01078db:	e8 60 d9 ff ff       	call   c0105240 <__malloc_unlock>
c01078e0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01078e3:	83 c4 3c             	add    $0x3c,%esp
c01078e6:	5b                   	pop    %ebx
c01078e7:	5e                   	pop    %esi
c01078e8:	5f                   	pop    %edi
c01078e9:	89 c8                	mov    %ecx,%eax
c01078eb:	5d                   	pop    %ebp
c01078ec:	c3                   	ret    
c01078ed:	8d 76 00             	lea    0x0(%esi),%esi
c01078f0:	89 45 0c             	mov    %eax,0xc(%ebp)
c01078f3:	83 c4 3c             	add    $0x3c,%esp
c01078f6:	5b                   	pop    %ebx
c01078f7:	5e                   	pop    %esi
c01078f8:	5f                   	pop    %edi
c01078f9:	5d                   	pop    %ebp
c01078fa:	e9 51 d1 ff ff       	jmp    c0104a50 <_malloc_r>
c01078ff:	90                   	nop
c0107900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107903:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0107909:	31 c0                	xor    %eax,%eax
c010790b:	e9 f7 fe ff ff       	jmp    c0107807 <_realloc_r+0x187>
c0107910:	89 c2                	mov    %eax,%edx
c0107912:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107915:	0f 8c 4d ff ff ff    	jl     c0107868 <_realloc_r+0x1e8>
c010791b:	8b 71 08             	mov    0x8(%ecx),%esi
c010791e:	83 eb 04             	sub    $0x4,%ebx
c0107921:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107924:	83 fb 24             	cmp    $0x24,%ebx
c0107927:	89 46 0c             	mov    %eax,0xc(%esi)
c010792a:	89 70 08             	mov    %esi,0x8(%eax)
c010792d:	8d 71 08             	lea    0x8(%ecx),%esi
c0107930:	0f 87 88 00 00 00    	ja     c01079be <_realloc_r+0x33e>
c0107936:	83 fb 13             	cmp    $0x13,%ebx
c0107939:	89 f0                	mov    %esi,%eax
c010793b:	76 1a                	jbe    c0107957 <_realloc_r+0x2d7>
c010793d:	8b 07                	mov    (%edi),%eax
c010793f:	83 fb 1b             	cmp    $0x1b,%ebx
c0107942:	89 41 08             	mov    %eax,0x8(%ecx)
c0107945:	8b 47 04             	mov    0x4(%edi),%eax
c0107948:	89 41 0c             	mov    %eax,0xc(%ecx)
c010794b:	0f 87 17 02 00 00    	ja     c0107b68 <_realloc_r+0x4e8>
c0107951:	8d 41 10             	lea    0x10(%ecx),%eax
c0107954:	83 c7 08             	add    $0x8,%edi
c0107957:	8b 1f                	mov    (%edi),%ebx
c0107959:	89 18                	mov    %ebx,(%eax)
c010795b:	8b 5f 04             	mov    0x4(%edi),%ebx
c010795e:	89 58 04             	mov    %ebx,0x4(%eax)
c0107961:	8b 5f 08             	mov    0x8(%edi),%ebx
c0107964:	89 f7                	mov    %esi,%edi
c0107966:	89 ce                	mov    %ecx,%esi
c0107968:	89 58 08             	mov    %ebx,0x8(%eax)
c010796b:	89 d3                	mov    %edx,%ebx
c010796d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107970:	e9 6e fe ff ff       	jmp    c01077e3 <_realloc_r+0x163>
c0107975:	8d 76 00             	lea    0x0(%esi),%esi
c0107978:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010797b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010797e:	8b 48 04             	mov    0x4(%eax),%ecx
c0107981:	83 c2 10             	add    $0x10,%edx
c0107984:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107987:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c010798b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c010798e:	01 d9                	add    %ebx,%ecx
c0107990:	39 d1                	cmp    %edx,%ecx
c0107992:	7d 54                	jge    c01079e8 <_realloc_r+0x368>
c0107994:	89 c2                	mov    %eax,%edx
c0107996:	e9 8a fd ff ff       	jmp    c0107725 <_realloc_r+0xa5>
c010799b:	90                   	nop
c010799c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01079a0:	8b 07                	mov    (%edi),%eax
c01079a2:	83 fb 1b             	cmp    $0x1b,%ebx
c01079a5:	89 01                	mov    %eax,(%ecx)
c01079a7:	8b 47 04             	mov    0x4(%edi),%eax
c01079aa:	89 41 04             	mov    %eax,0x4(%ecx)
c01079ad:	0f 87 2d 01 00 00    	ja     c0107ae0 <_realloc_r+0x460>
c01079b3:	8d 41 08             	lea    0x8(%ecx),%eax
c01079b6:	8d 57 08             	lea    0x8(%edi),%edx
c01079b9:	e9 f8 fe ff ff       	jmp    c01078b6 <_realloc_r+0x236>
c01079be:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01079c2:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01079c6:	89 f7                	mov    %esi,%edi
c01079c8:	89 34 24             	mov    %esi,(%esp)
c01079cb:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01079ce:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01079d1:	e8 1a fc ff ff       	call   c01075f0 <memmove>
c01079d6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01079d9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01079dc:	8b 41 04             	mov    0x4(%ecx),%eax
c01079df:	89 ce                	mov    %ecx,%esi
c01079e1:	89 d3                	mov    %edx,%ebx
c01079e3:	e9 fb fd ff ff       	jmp    c01077e3 <_realloc_r+0x163>
c01079e8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c01079eb:	29 d9                	sub    %ebx,%ecx
c01079ed:	01 de                	add    %ebx,%esi
c01079ef:	83 c9 01             	or     $0x1,%ecx
c01079f2:	89 35 28 a5 10 c0    	mov    %esi,0xc010a528
c01079f8:	89 4e 04             	mov    %ecx,0x4(%esi)
c01079fb:	8b 47 fc             	mov    -0x4(%edi),%eax
c01079fe:	83 e0 01             	and    $0x1,%eax
c0107a01:	09 d8                	or     %ebx,%eax
c0107a03:	89 47 fc             	mov    %eax,-0x4(%edi)
c0107a06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107a09:	89 04 24             	mov    %eax,(%esp)
c0107a0c:	e8 2f d8 ff ff       	call   c0105240 <__malloc_unlock>
c0107a11:	89 f8                	mov    %edi,%eax
c0107a13:	e9 ef fd ff ff       	jmp    c0107807 <_realloc_r+0x187>
c0107a18:	89 0c 24             	mov    %ecx,(%esp)
c0107a1b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107a1f:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107a23:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107a26:	e8 c5 fb ff ff       	call   c01075f0 <memmove>
c0107a2b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107a2e:	e9 93 fe ff ff       	jmp    c01078c6 <_realloc_r+0x246>
c0107a33:	90                   	nop
c0107a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107a38:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107a3b:	e9 d2 fe ff ff       	jmp    c0107912 <_realloc_r+0x292>
c0107a40:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107a43:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0107a46:	01 d0                	add    %edx,%eax
c0107a48:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107a4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0107a4e:	83 c0 10             	add    $0x10,%eax
c0107a51:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0107a54:	0f 8c b8 fe ff ff    	jl     c0107912 <_realloc_r+0x292>
c0107a5a:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107a5d:	83 eb 04             	sub    $0x4,%ebx
c0107a60:	8b 51 08             	mov    0x8(%ecx),%edx
c0107a63:	83 fb 24             	cmp    $0x24,%ebx
c0107a66:	8d 71 08             	lea    0x8(%ecx),%esi
c0107a69:	89 42 0c             	mov    %eax,0xc(%edx)
c0107a6c:	89 50 08             	mov    %edx,0x8(%eax)
c0107a6f:	0f 87 3d 01 00 00    	ja     c0107bb2 <_realloc_r+0x532>
c0107a75:	83 fb 13             	cmp    $0x13,%ebx
c0107a78:	89 f0                	mov    %esi,%eax
c0107a7a:	76 1a                	jbe    c0107a96 <_realloc_r+0x416>
c0107a7c:	8b 07                	mov    (%edi),%eax
c0107a7e:	83 fb 1b             	cmp    $0x1b,%ebx
c0107a81:	89 41 08             	mov    %eax,0x8(%ecx)
c0107a84:	8b 47 04             	mov    0x4(%edi),%eax
c0107a87:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107a8a:	0f 87 3d 01 00 00    	ja     c0107bcd <_realloc_r+0x54d>
c0107a90:	8d 41 10             	lea    0x10(%ecx),%eax
c0107a93:	83 c7 08             	add    $0x8,%edi
c0107a96:	8b 17                	mov    (%edi),%edx
c0107a98:	89 10                	mov    %edx,(%eax)
c0107a9a:	8b 57 04             	mov    0x4(%edi),%edx
c0107a9d:	89 50 04             	mov    %edx,0x4(%eax)
c0107aa0:	8b 57 08             	mov    0x8(%edi),%edx
c0107aa3:	89 50 08             	mov    %edx,0x8(%eax)
c0107aa6:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107aa9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0107aac:	89 d8                	mov    %ebx,%eax
c0107aae:	29 df                	sub    %ebx,%edi
c0107ab0:	01 c8                	add    %ecx,%eax
c0107ab2:	83 cf 01             	or     $0x1,%edi
c0107ab5:	a3 28 a5 10 c0       	mov    %eax,0xc010a528
c0107aba:	89 78 04             	mov    %edi,0x4(%eax)
c0107abd:	8b 41 04             	mov    0x4(%ecx),%eax
c0107ac0:	83 e0 01             	and    $0x1,%eax
c0107ac3:	09 d8                	or     %ebx,%eax
c0107ac5:	89 41 04             	mov    %eax,0x4(%ecx)
c0107ac8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107acb:	89 04 24             	mov    %eax,(%esp)
c0107ace:	e8 6d d7 ff ff       	call   c0105240 <__malloc_unlock>
c0107ad3:	89 f0                	mov    %esi,%eax
c0107ad5:	e9 2d fd ff ff       	jmp    c0107807 <_realloc_r+0x187>
c0107ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107ae0:	8b 47 08             	mov    0x8(%edi),%eax
c0107ae3:	83 fb 24             	cmp    $0x24,%ebx
c0107ae6:	89 41 08             	mov    %eax,0x8(%ecx)
c0107ae9:	8b 47 0c             	mov    0xc(%edi),%eax
c0107aec:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107aef:	74 60                	je     c0107b51 <_realloc_r+0x4d1>
c0107af1:	8d 41 10             	lea    0x10(%ecx),%eax
c0107af4:	8d 57 10             	lea    0x10(%edi),%edx
c0107af7:	e9 ba fd ff ff       	jmp    c01078b6 <_realloc_r+0x236>
c0107afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107b00:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0107b03:	83 e2 fc             	and    $0xfffffffc,%edx
c0107b06:	01 d3                	add    %edx,%ebx
c0107b08:	e9 d6 fc ff ff       	jmp    c01077e3 <_realloc_r+0x163>
c0107b0d:	8d 76 00             	lea    0x0(%esi),%esi
c0107b10:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107b14:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107b18:	89 f7                	mov    %esi,%edi
c0107b1a:	89 34 24             	mov    %esi,(%esp)
c0107b1d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107b20:	e8 cb fa ff ff       	call   c01075f0 <memmove>
c0107b25:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107b28:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107b2b:	8b 41 04             	mov    0x4(%ecx),%eax
c0107b2e:	89 ce                	mov    %ecx,%esi
c0107b30:	e9 ae fc ff ff       	jmp    c01077e3 <_realloc_r+0x163>
c0107b35:	8b 47 08             	mov    0x8(%edi),%eax
c0107b38:	83 fb 24             	cmp    $0x24,%ebx
c0107b3b:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b3e:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b41:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b44:	74 3e                	je     c0107b84 <_realloc_r+0x504>
c0107b46:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b49:	83 c7 10             	add    $0x10,%edi
c0107b4c:	e9 5b fc ff ff       	jmp    c01077ac <_realloc_r+0x12c>
c0107b51:	8b 47 10             	mov    0x10(%edi),%eax
c0107b54:	8d 57 18             	lea    0x18(%edi),%edx
c0107b57:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b5a:	8b 5f 14             	mov    0x14(%edi),%ebx
c0107b5d:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b60:	89 59 14             	mov    %ebx,0x14(%ecx)
c0107b63:	e9 4e fd ff ff       	jmp    c01078b6 <_realloc_r+0x236>
c0107b68:	8b 47 08             	mov    0x8(%edi),%eax
c0107b6b:	83 fb 24             	cmp    $0x24,%ebx
c0107b6e:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b71:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b74:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b77:	74 22                	je     c0107b9b <_realloc_r+0x51b>
c0107b79:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b7c:	83 c7 10             	add    $0x10,%edi
c0107b7f:	e9 d3 fd ff ff       	jmp    c0107957 <_realloc_r+0x2d7>
c0107b84:	8b 47 10             	mov    0x10(%edi),%eax
c0107b87:	83 c7 18             	add    $0x18,%edi
c0107b8a:	89 41 18             	mov    %eax,0x18(%ecx)
c0107b8d:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107b90:	8d 41 20             	lea    0x20(%ecx),%eax
c0107b93:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107b96:	e9 11 fc ff ff       	jmp    c01077ac <_realloc_r+0x12c>
c0107b9b:	8b 47 10             	mov    0x10(%edi),%eax
c0107b9e:	83 c7 18             	add    $0x18,%edi
c0107ba1:	89 41 18             	mov    %eax,0x18(%ecx)
c0107ba4:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0107ba7:	8d 41 20             	lea    0x20(%ecx),%eax
c0107baa:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c0107bad:	e9 a5 fd ff ff       	jmp    c0107957 <_realloc_r+0x2d7>
c0107bb2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107bb6:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107bba:	89 34 24             	mov    %esi,(%esp)
c0107bbd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107bc0:	e8 2b fa ff ff       	call   c01075f0 <memmove>
c0107bc5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107bc8:	e9 d9 fe ff ff       	jmp    c0107aa6 <_realloc_r+0x426>
c0107bcd:	8b 47 08             	mov    0x8(%edi),%eax
c0107bd0:	83 fb 24             	cmp    $0x24,%ebx
c0107bd3:	89 41 10             	mov    %eax,0x10(%ecx)
c0107bd6:	8b 47 0c             	mov    0xc(%edi),%eax
c0107bd9:	89 41 14             	mov    %eax,0x14(%ecx)
c0107bdc:	74 1d                	je     c0107bfb <_realloc_r+0x57b>
c0107bde:	8d 41 18             	lea    0x18(%ecx),%eax
c0107be1:	83 c7 10             	add    $0x10,%edi
c0107be4:	e9 ad fe ff ff       	jmp    c0107a96 <_realloc_r+0x416>
c0107be9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107bec:	89 04 24             	mov    %eax,(%esp)
c0107bef:	e8 4c d6 ff ff       	call   c0105240 <__malloc_unlock>
c0107bf4:	31 c0                	xor    %eax,%eax
c0107bf6:	e9 0c fc ff ff       	jmp    c0107807 <_realloc_r+0x187>
c0107bfb:	8b 47 10             	mov    0x10(%edi),%eax
c0107bfe:	83 c7 18             	add    $0x18,%edi
c0107c01:	89 41 18             	mov    %eax,0x18(%ecx)
c0107c04:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107c07:	8d 41 20             	lea    0x20(%ecx),%eax
c0107c0a:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107c0d:	e9 84 fe ff ff       	jmp    c0107a96 <_realloc_r+0x416>
c0107c12:	66 90                	xchg   %ax,%ax
c0107c14:	66 90                	xchg   %ax,%ax
c0107c16:	66 90                	xchg   %ax,%ax
c0107c18:	66 90                	xchg   %ax,%ax
c0107c1a:	66 90                	xchg   %ax,%ax
c0107c1c:	66 90                	xchg   %ax,%ax
c0107c1e:	66 90                	xchg   %ax,%ax

c0107c20 <cleanup_glue>:
c0107c20:	55                   	push   %ebp
c0107c21:	89 e5                	mov    %esp,%ebp
c0107c23:	56                   	push   %esi
c0107c24:	53                   	push   %ebx
c0107c25:	83 ec 10             	sub    $0x10,%esp
c0107c28:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0107c2b:	8b 75 08             	mov    0x8(%ebp),%esi
c0107c2e:	8b 03                	mov    (%ebx),%eax
c0107c30:	85 c0                	test   %eax,%eax
c0107c32:	74 0c                	je     c0107c40 <cleanup_glue+0x20>
c0107c34:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c38:	89 34 24             	mov    %esi,(%esp)
c0107c3b:	e8 e0 ff ff ff       	call   c0107c20 <cleanup_glue>
c0107c40:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0107c43:	89 75 08             	mov    %esi,0x8(%ebp)
c0107c46:	83 c4 10             	add    $0x10,%esp
c0107c49:	5b                   	pop    %ebx
c0107c4a:	5e                   	pop    %esi
c0107c4b:	5d                   	pop    %ebp
c0107c4c:	e9 3f f7 ff ff       	jmp    c0107390 <_free_r>
c0107c51:	eb 0d                	jmp    c0107c60 <_reclaim_reent>
c0107c53:	90                   	nop
c0107c54:	90                   	nop
c0107c55:	90                   	nop
c0107c56:	90                   	nop
c0107c57:	90                   	nop
c0107c58:	90                   	nop
c0107c59:	90                   	nop
c0107c5a:	90                   	nop
c0107c5b:	90                   	nop
c0107c5c:	90                   	nop
c0107c5d:	90                   	nop
c0107c5e:	90                   	nop
c0107c5f:	90                   	nop

c0107c60 <_reclaim_reent>:
c0107c60:	55                   	push   %ebp
c0107c61:	89 e5                	mov    %esp,%ebp
c0107c63:	57                   	push   %edi
c0107c64:	56                   	push   %esi
c0107c65:	53                   	push   %ebx
c0107c66:	83 ec 1c             	sub    $0x1c,%esp
c0107c69:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107c6c:	3b 1d 20 a0 10 c0    	cmp    0xc010a020,%ebx
c0107c72:	0f 84 a6 00 00 00    	je     c0107d1e <_reclaim_reent+0xbe>
c0107c78:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107c7b:	85 d2                	test   %edx,%edx
c0107c7d:	74 46                	je     c0107cc5 <_reclaim_reent+0x65>
c0107c7f:	31 c0                	xor    %eax,%eax
c0107c81:	31 f6                	xor    %esi,%esi
c0107c83:	90                   	nop
c0107c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107c88:	8b 04 82             	mov    (%edx,%eax,4),%eax
c0107c8b:	85 c0                	test   %eax,%eax
c0107c8d:	75 0b                	jne    c0107c9a <_reclaim_reent+0x3a>
c0107c8f:	eb 1e                	jmp    c0107caf <_reclaim_reent+0x4f>
c0107c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107c98:	89 f8                	mov    %edi,%eax
c0107c9a:	8b 38                	mov    (%eax),%edi
c0107c9c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ca0:	89 1c 24             	mov    %ebx,(%esp)
c0107ca3:	e8 e8 f6 ff ff       	call   c0107390 <_free_r>
c0107ca8:	85 ff                	test   %edi,%edi
c0107caa:	75 ec                	jne    c0107c98 <_reclaim_reent+0x38>
c0107cac:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107caf:	83 c6 01             	add    $0x1,%esi
c0107cb2:	83 fe 20             	cmp    $0x20,%esi
c0107cb5:	89 f0                	mov    %esi,%eax
c0107cb7:	75 cf                	jne    c0107c88 <_reclaim_reent+0x28>
c0107cb9:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107cbd:	89 1c 24             	mov    %ebx,(%esp)
c0107cc0:	e8 cb f6 ff ff       	call   c0107390 <_free_r>
c0107cc5:	8b 43 40             	mov    0x40(%ebx),%eax
c0107cc8:	85 c0                	test   %eax,%eax
c0107cca:	74 0c                	je     c0107cd8 <_reclaim_reent+0x78>
c0107ccc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107cd0:	89 1c 24             	mov    %ebx,(%esp)
c0107cd3:	e8 b8 f6 ff ff       	call   c0107390 <_free_r>
c0107cd8:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c0107cde:	85 c0                	test   %eax,%eax
c0107ce0:	74 22                	je     c0107d04 <_reclaim_reent+0xa4>
c0107ce2:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0107ce8:	39 f0                	cmp    %esi,%eax
c0107cea:	75 06                	jne    c0107cf2 <_reclaim_reent+0x92>
c0107cec:	eb 16                	jmp    c0107d04 <_reclaim_reent+0xa4>
c0107cee:	66 90                	xchg   %ax,%ax
c0107cf0:	89 f8                	mov    %edi,%eax
c0107cf2:	8b 38                	mov    (%eax),%edi
c0107cf4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107cf8:	89 1c 24             	mov    %ebx,(%esp)
c0107cfb:	e8 90 f6 ff ff       	call   c0107390 <_free_r>
c0107d00:	39 fe                	cmp    %edi,%esi
c0107d02:	75 ec                	jne    c0107cf0 <_reclaim_reent+0x90>
c0107d04:	8b 43 54             	mov    0x54(%ebx),%eax
c0107d07:	85 c0                	test   %eax,%eax
c0107d09:	74 0c                	je     c0107d17 <_reclaim_reent+0xb7>
c0107d0b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107d0f:	89 1c 24             	mov    %ebx,(%esp)
c0107d12:	e8 79 f6 ff ff       	call   c0107390 <_free_r>
c0107d17:	8b 43 38             	mov    0x38(%ebx),%eax
c0107d1a:	85 c0                	test   %eax,%eax
c0107d1c:	75 08                	jne    c0107d26 <_reclaim_reent+0xc6>
c0107d1e:	83 c4 1c             	add    $0x1c,%esp
c0107d21:	5b                   	pop    %ebx
c0107d22:	5e                   	pop    %esi
c0107d23:	5f                   	pop    %edi
c0107d24:	5d                   	pop    %ebp
c0107d25:	c3                   	ret    
c0107d26:	89 1c 24             	mov    %ebx,(%esp)
c0107d29:	ff 53 3c             	call   *0x3c(%ebx)
c0107d2c:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0107d32:	85 c0                	test   %eax,%eax
c0107d34:	74 e8                	je     c0107d1e <_reclaim_reent+0xbe>
c0107d36:	89 1c 24             	mov    %ebx,(%esp)
c0107d39:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107d3d:	e8 de fe ff ff       	call   c0107c20 <cleanup_glue>
c0107d42:	83 c4 1c             	add    $0x1c,%esp
c0107d45:	5b                   	pop    %ebx
c0107d46:	5e                   	pop    %esi
c0107d47:	5f                   	pop    %edi
c0107d48:	5d                   	pop    %ebp
c0107d49:	c3                   	ret    
