
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
c0100066:	e8 d5 0b 00 00       	call   c0100c40 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 de 0b 00 00       	call   c0100c50 <get_ucr3>
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
c01000d7:	a1 80 a5 10 c0       	mov    0xc010a580,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 80 a5 10 c0       	mov    %eax,0xc010a580
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
c010014c:	e8 67 13 00 00       	call   c01014b8 <memset>
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
c0100178:	c7 44 24 10 44 7d 10 	movl   $0xc0107d44,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c a8 7d 10 	movl   $0xc0107da8,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 33 7d 10 	movl   $0xc0107d33,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 54 7d 10 c0 	movl   $0xc0107d54,(%esp)
c010019f:	e8 cc 0d 00 00       	call   c0100f70 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 4c 7d 10 	movl   $0xc0107d4c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c a8 7d 10 	movl   $0xc0107da8,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 33 7d 10 	movl   $0xc0107d33,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 54 7d 10 c0 	movl   $0xc0107d54,(%esp)
c01001ee:	e8 7d 0d 00 00       	call   c0100f70 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 44 7d 10 	movl   $0xc0107d44,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c a8 7d 10 	movl   $0xc0107da8,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 33 7d 10 	movl   $0xc0107d33,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 54 7d 10 c0 	movl   $0xc0107d54,(%esp)
c010022e:	e8 3d 0d 00 00       	call   c0100f70 <printk>
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
c0100258:	c7 44 24 10 4c 7d 10 	movl   $0xc0107d4c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c a8 7d 10 	movl   $0xc0107da8,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 33 7d 10 	movl   $0xc0107d33,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 54 7d 10 c0 	movl   $0xc0107d54,(%esp)
c010027f:	e8 ec 0c 00 00       	call   c0100f70 <printk>
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
c01002a8:	c7 44 24 10 20 7d 10 	movl   $0xc0107d20,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 9e 7d 10 	movl   $0xc0107d9e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 33 7d 10 	movl   $0xc0107d33,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 54 7d 10 c0 	movl   $0xc0107d54,(%esp)
c01002cf:	e8 9c 0c 00 00       	call   c0100f70 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 80 a5 10 c0       	mov    0xc010a580,%eax
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
c01003b7:	e8 c4 09 00 00       	call   c0100d80 <init_segment>
c01003bc:	e8 bf 03 00 00       	call   c0100780 <init_idt>
c01003c1:	e8 4a 03 00 00       	call   c0100710 <init_i8259>
c01003c6:	e8 05 0c 00 00       	call   c0100fd0 <init_serial>
c01003cb:	e8 c0 0d 00 00       	call   c0101190 <init_ide>
c01003d0:	fb                   	sti    
c01003d1:	e8 ba 08 00 00       	call   c0100c90 <init_mm>
c01003d6:	68 3f 7e 10 c0       	push   $0xc0107e3f
c01003db:	6a 4a                	push   $0x4a
c01003dd:	68 ae 7d 10 c0       	push   $0xc0107dae
c01003e2:	68 c0 7d 10 c0       	push   $0xc0107dc0
c01003e7:	e8 84 0b 00 00       	call   c0100f70 <printk>
c01003ec:	e8 bf 07 00 00       	call   c0100bb0 <video_mapping_write_test>
c01003f1:	e8 3a 0a 00 00       	call   c0100e30 <loader>
c01003f6:	89 c3                	mov    %eax,%ebx
c01003f8:	e8 d3 07 00 00       	call   c0100bd0 <video_mapping_read_test>
c01003fd:	e8 1e 08 00 00       	call   c0100c20 <video_mapping_clear>
c0100402:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c0100407:	bd 00 00 00 00       	mov    $0x0,%ebp
c010040c:	83 ec 10             	sub    $0x10,%esp
c010040f:	ff d3                	call   *%ebx
c0100411:	68 3f 7e 10 c0       	push   $0xc0107e3f
c0100416:	6a 6b                	push   $0x6b
c0100418:	68 ae 7d 10 c0       	push   $0xc0107dae
c010041d:	68 f4 7d 10 c0       	push   $0xc0107df4
c0100422:	e8 49 0b 00 00       	call   c0100f70 <printk>
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
c0100446:	e8 b5 08 00 00       	call   c0100d00 <init_page>
c010044b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100451:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100456:	ff e0                	jmp    *%eax
c0100458:	68 49 7e 10 c0       	push   $0xc0107e49
c010045d:	6a 24                	push   $0x24
c010045f:	68 ae 7d 10 c0       	push   $0xc0107dae
c0100464:	68 f4 7d 10 c0       	push   $0xc0107df4
c0100469:	e8 02 0b 00 00       	call   c0100f70 <printk>
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
c010049d:	68 e0 7e 10 c0       	push   $0xc0107ee0
c01004a2:	6a 2c                	push   $0x2c
c01004a4:	68 6c 7e 10 c0       	push   $0xc0107e6c
c01004a9:	68 8c 7e 10 c0       	push   $0xc0107e8c
c01004ae:	e8 bd 0a 00 00       	call   c0100f70 <printk>
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
c01004ee:	e8 6d 07 00 00       	call   c0100c60 <mm_brk>
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
c0100516:	68 4e 7e 10 c0       	push   $0xc0107e4e
c010051b:	68 e0 7e 10 c0       	push   $0xc0107ee0
c0100520:	6a 22                	push   $0x22
c0100522:	68 6c 7e 10 c0       	push   $0xc0107e6c
c0100527:	68 54 7d 10 c0       	push   $0xc0107d54
c010052c:	e8 3f 0a 00 00       	call   c0100f70 <printk>
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
c0100557:	e8 b4 0a 00 00       	call   c0101010 <serial_printc>
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
c010058c:	68 1a 7f 10 c0       	push   $0xc0107f1a
c0100591:	68 01 80 10 c0       	push   $0xc0108001
c0100596:	6a 16                	push   $0x16
c0100598:	68 fe 7e 10 c0       	push   $0xc0107efe
c010059d:	68 54 7d 10 c0       	push   $0xc0107d54
c01005a2:	e8 c9 09 00 00       	call   c0100f70 <printk>
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
c01005f3:	68 eb 7e 10 c0       	push   $0xc0107eeb
c01005f8:	68 01 80 10 c0       	push   $0xc0108001
c01005fd:	6a 15                	push   $0x15
c01005ff:	68 fe 7e 10 c0       	push   $0xc0107efe
c0100604:	68 54 7d 10 c0       	push   $0xc0107d54
c0100609:	e8 62 09 00 00       	call   c0100f70 <printk>
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
c010062f:	0f 88 9b 00 00 00    	js     c01006d0 <irq_handle+0xb0>
c0100635:	3d 80 00 00 00       	cmp    $0x80,%eax
c010063a:	0f 84 b8 00 00 00    	je     c01006f8 <irq_handle+0xd8>
c0100640:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100645:	7e 59                	jle    c01006a0 <irq_handle+0x80>
c0100647:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c010064d:	83 fb 0f             	cmp    $0xf,%ebx
c0100650:	7f 1e                	jg     c0100670 <irq_handle+0x50>
c0100652:	8b 1c 9d 40 c0 12 c0 	mov    -0x3fed3fc0(,%ebx,4),%ebx
c0100659:	85 db                	test   %ebx,%ebx
c010065b:	74 0c                	je     c0100669 <irq_handle+0x49>
c010065d:	8d 76 00             	lea    0x0(%esi),%esi
c0100660:	ff 13                	call   *(%ebx)
c0100662:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100665:	85 db                	test   %ebx,%ebx
c0100667:	75 f7                	jne    c0100660 <irq_handle+0x40>
c0100669:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010066c:	c9                   	leave  
c010066d:	c3                   	ret    
c010066e:	66 90                	xchg   %ax,%ax
c0100670:	83 ec 0c             	sub    $0xc,%esp
c0100673:	68 38 7f 10 c0       	push   $0xc0107f38
c0100678:	68 f6 7f 10 c0       	push   $0xc0107ff6
c010067d:	6a 32                	push   $0x32
c010067f:	68 fe 7e 10 c0       	push   $0xc0107efe
c0100684:	68 54 7d 10 c0       	push   $0xc0107d54
c0100689:	e8 e2 08 00 00       	call   c0100f70 <printk>
c010068e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100693:	d6                   	(bad)  
c0100694:	83 c4 20             	add    $0x20,%esp
c0100697:	eb b9                	jmp    c0100652 <irq_handle+0x32>
c0100699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01006a0:	83 ec 08             	sub    $0x8,%esp
c01006a3:	ff 72 28             	pushl  0x28(%edx)
c01006a6:	50                   	push   %eax
c01006a7:	68 f6 7f 10 c0       	push   $0xc0107ff6
c01006ac:	6a 2f                	push   $0x2f
c01006ae:	68 fe 7e 10 c0       	push   $0xc0107efe
c01006b3:	68 9c 7f 10 c0       	push   $0xc0107f9c
c01006b8:	e8 b3 08 00 00       	call   c0100f70 <printk>
c01006bd:	b8 01 00 00 00       	mov    $0x1,%eax
c01006c2:	d6                   	(bad)  
c01006c3:	83 c4 20             	add    $0x20,%esp
c01006c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006c9:	c9                   	leave  
c01006ca:	c3                   	ret    
c01006cb:	90                   	nop
c01006cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006d0:	68 f6 7f 10 c0       	push   $0xc0107ff6
c01006d5:	6a 29                	push   $0x29
c01006d7:	68 fe 7e 10 c0       	push   $0xc0107efe
c01006dc:	68 50 7f 10 c0       	push   $0xc0107f50
c01006e1:	e8 8a 08 00 00       	call   c0100f70 <printk>
c01006e6:	b8 01 00 00 00       	mov    $0x1,%eax
c01006eb:	d6                   	(bad)  
c01006ec:	83 c4 10             	add    $0x10,%esp
c01006ef:	e9 75 ff ff ff       	jmp    c0100669 <irq_handle+0x49>
c01006f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006f8:	89 55 08             	mov    %edx,0x8(%ebp)
c01006fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006fe:	c9                   	leave  
c01006ff:	e9 7c fd ff ff       	jmp    c0100480 <do_syscall>
c0100704:	66 90                	xchg   %ax,%ax
c0100706:	66 90                	xchg   %ax,%ax
c0100708:	66 90                	xchg   %ax,%ax
c010070a:	66 90                	xchg   %ax,%ax
c010070c:	66 90                	xchg   %ax,%ax
c010070e:	66 90                	xchg   %ax,%ax

c0100710 <init_i8259>:
c0100710:	55                   	push   %ebp
c0100711:	ba 21 00 00 00       	mov    $0x21,%edx
c0100716:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010071b:	89 e5                	mov    %esp,%ebp
c010071d:	ee                   	out    %al,(%dx)
c010071e:	b2 a1                	mov    $0xa1,%dl
c0100720:	ee                   	out    %al,(%dx)
c0100721:	b8 11 00 00 00       	mov    $0x11,%eax
c0100726:	b2 20                	mov    $0x20,%dl
c0100728:	ee                   	out    %al,(%dx)
c0100729:	b8 20 00 00 00       	mov    $0x20,%eax
c010072e:	b2 21                	mov    $0x21,%dl
c0100730:	ee                   	out    %al,(%dx)
c0100731:	b8 04 00 00 00       	mov    $0x4,%eax
c0100736:	ee                   	out    %al,(%dx)
c0100737:	b8 03 00 00 00       	mov    $0x3,%eax
c010073c:	ee                   	out    %al,(%dx)
c010073d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100742:	b2 a0                	mov    $0xa0,%dl
c0100744:	ee                   	out    %al,(%dx)
c0100745:	b8 28 00 00 00       	mov    $0x28,%eax
c010074a:	b2 a1                	mov    $0xa1,%dl
c010074c:	ee                   	out    %al,(%dx)
c010074d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100752:	ee                   	out    %al,(%dx)
c0100753:	b8 03 00 00 00       	mov    $0x3,%eax
c0100758:	ee                   	out    %al,(%dx)
c0100759:	b8 68 00 00 00       	mov    $0x68,%eax
c010075e:	b2 20                	mov    $0x20,%dl
c0100760:	ee                   	out    %al,(%dx)
c0100761:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100766:	ee                   	out    %al,(%dx)
c0100767:	b8 68 00 00 00       	mov    $0x68,%eax
c010076c:	b2 a0                	mov    $0xa0,%dl
c010076e:	ee                   	out    %al,(%dx)
c010076f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100774:	ee                   	out    %al,(%dx)
c0100775:	5d                   	pop    %ebp
c0100776:	c3                   	ret    
c0100777:	66 90                	xchg   %ax,%ax
c0100779:	66 90                	xchg   %ax,%ax
c010077b:	66 90                	xchg   %ax,%ax
c010077d:	66 90                	xchg   %ax,%ax
c010077f:	90                   	nop

c0100780 <init_idt>:
c0100780:	55                   	push   %ebp
c0100781:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100786:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c010078b:	89 d1                	mov    %edx,%ecx
c010078d:	c1 ea 10             	shr    $0x10,%edx
c0100790:	89 e5                	mov    %esp,%ebp
c0100792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100798:	66 89 08             	mov    %cx,(%eax)
c010079b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c01007a1:	83 c0 08             	add    $0x8,%eax
c01007a4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c01007a8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c01007ac:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c01007b0:	3d c0 c9 12 c0       	cmp    $0xc012c9c0,%eax
c01007b5:	75 e1                	jne    c0100798 <init_idt+0x18>
c01007b7:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c01007bc:	ba 08 00 00 00       	mov    $0x8,%edx
c01007c1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007c6:	66 a3 c0 c1 12 c0    	mov    %ax,0xc012c1c0
c01007cc:	c1 e8 10             	shr    $0x10,%eax
c01007cf:	66 89 15 c2 c1 12 c0 	mov    %dx,0xc012c1c2
c01007d6:	66 a3 c6 c1 12 c0    	mov    %ax,0xc012c1c6
c01007dc:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c01007e1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007e6:	66 a3 c8 c1 12 c0    	mov    %ax,0xc012c1c8
c01007ec:	c1 e8 10             	shr    $0x10,%eax
c01007ef:	66 89 0d ca c1 12 c0 	mov    %cx,0xc012c1ca
c01007f6:	66 a3 ce c1 12 c0    	mov    %ax,0xc012c1ce
c01007fc:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100801:	66 89 15 d2 c1 12 c0 	mov    %dx,0xc012c1d2
c0100808:	66 a3 d0 c1 12 c0    	mov    %ax,0xc012c1d0
c010080e:	c1 e8 10             	shr    $0x10,%eax
c0100811:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100816:	66 a3 d6 c1 12 c0    	mov    %ax,0xc012c1d6
c010081c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100821:	ba 08 00 00 00       	mov    $0x8,%edx
c0100826:	66 a3 d8 c1 12 c0    	mov    %ax,0xc012c1d8
c010082c:	c1 e8 10             	shr    $0x10,%eax
c010082f:	66 89 0d da c1 12 c0 	mov    %cx,0xc012c1da
c0100836:	66 a3 de c1 12 c0    	mov    %ax,0xc012c1de
c010083c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100841:	66 89 15 e2 c1 12 c0 	mov    %dx,0xc012c1e2
c0100848:	66 a3 e0 c1 12 c0    	mov    %ax,0xc012c1e0
c010084e:	c1 e8 10             	shr    $0x10,%eax
c0100851:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100856:	66 a3 e6 c1 12 c0    	mov    %ax,0xc012c1e6
c010085c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100861:	ba 08 00 00 00       	mov    $0x8,%edx
c0100866:	66 a3 e8 c1 12 c0    	mov    %ax,0xc012c1e8
c010086c:	c1 e8 10             	shr    $0x10,%eax
c010086f:	66 89 0d ea c1 12 c0 	mov    %cx,0xc012c1ea
c0100876:	66 a3 ee c1 12 c0    	mov    %ax,0xc012c1ee
c010087c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100881:	66 89 15 f2 c1 12 c0 	mov    %dx,0xc012c1f2
c0100888:	66 a3 f0 c1 12 c0    	mov    %ax,0xc012c1f0
c010088e:	c1 e8 10             	shr    $0x10,%eax
c0100891:	c6 05 c4 c1 12 c0 00 	movb   $0x0,0xc012c1c4
c0100898:	c6 05 c5 c1 12 c0 8f 	movb   $0x8f,0xc012c1c5
c010089f:	c6 05 cc c1 12 c0 00 	movb   $0x0,0xc012c1cc
c01008a6:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008ab:	c6 05 cd c1 12 c0 8f 	movb   $0x8f,0xc012c1cd
c01008b2:	c6 05 d4 c1 12 c0 00 	movb   $0x0,0xc012c1d4
c01008b9:	ba 08 00 00 00       	mov    $0x8,%edx
c01008be:	c6 05 d5 c1 12 c0 8f 	movb   $0x8f,0xc012c1d5
c01008c5:	c6 05 dc c1 12 c0 00 	movb   $0x0,0xc012c1dc
c01008cc:	c6 05 dd c1 12 c0 8f 	movb   $0x8f,0xc012c1dd
c01008d3:	c6 05 e4 c1 12 c0 00 	movb   $0x0,0xc012c1e4
c01008da:	c6 05 e5 c1 12 c0 8f 	movb   $0x8f,0xc012c1e5
c01008e1:	c6 05 ec c1 12 c0 00 	movb   $0x0,0xc012c1ec
c01008e8:	c6 05 ed c1 12 c0 8f 	movb   $0x8f,0xc012c1ed
c01008ef:	c6 05 f4 c1 12 c0 00 	movb   $0x0,0xc012c1f4
c01008f6:	c6 05 f5 c1 12 c0 8f 	movb   $0x8f,0xc012c1f5
c01008fd:	66 a3 f6 c1 12 c0    	mov    %ax,0xc012c1f6
c0100903:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100908:	66 a3 f8 c1 12 c0    	mov    %ax,0xc012c1f8
c010090e:	c1 e8 10             	shr    $0x10,%eax
c0100911:	66 89 0d fa c1 12 c0 	mov    %cx,0xc012c1fa
c0100918:	66 a3 fe c1 12 c0    	mov    %ax,0xc012c1fe
c010091e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0100923:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100928:	66 a3 00 c2 12 c0    	mov    %ax,0xc012c200
c010092e:	c1 e8 10             	shr    $0x10,%eax
c0100931:	66 89 15 02 c2 12 c0 	mov    %dx,0xc012c202
c0100938:	66 a3 06 c2 12 c0    	mov    %ax,0xc012c206
c010093e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100943:	66 89 0d 0a c2 12 c0 	mov    %cx,0xc012c20a
c010094a:	66 a3 08 c2 12 c0    	mov    %ax,0xc012c208
c0100950:	c1 e8 10             	shr    $0x10,%eax
c0100953:	ba 08 00 00 00       	mov    $0x8,%edx
c0100958:	66 a3 0e c2 12 c0    	mov    %ax,0xc012c20e
c010095e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100963:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100968:	66 a3 10 c2 12 c0    	mov    %ax,0xc012c210
c010096e:	c1 e8 10             	shr    $0x10,%eax
c0100971:	66 89 15 12 c2 12 c0 	mov    %dx,0xc012c212
c0100978:	66 a3 16 c2 12 c0    	mov    %ax,0xc012c216
c010097e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100983:	66 89 0d 1a c2 12 c0 	mov    %cx,0xc012c21a
c010098a:	66 a3 18 c2 12 c0    	mov    %ax,0xc012c218
c0100990:	c1 e8 10             	shr    $0x10,%eax
c0100993:	ba 08 00 00 00       	mov    $0x8,%edx
c0100998:	66 a3 1e c2 12 c0    	mov    %ax,0xc012c21e
c010099e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c01009a3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009a8:	66 a3 20 c2 12 c0    	mov    %ax,0xc012c220
c01009ae:	c1 e8 10             	shr    $0x10,%eax
c01009b1:	66 89 15 22 c2 12 c0 	mov    %dx,0xc012c222
c01009b8:	66 a3 26 c2 12 c0    	mov    %ax,0xc012c226
c01009be:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c01009c3:	66 89 0d 2a c2 12 c0 	mov    %cx,0xc012c22a
c01009ca:	66 a3 28 c2 12 c0    	mov    %ax,0xc012c228
c01009d0:	c1 e8 10             	shr    $0x10,%eax
c01009d3:	c6 05 fc c1 12 c0 00 	movb   $0x0,0xc012c1fc
c01009da:	c6 05 fd c1 12 c0 8f 	movb   $0x8f,0xc012c1fd
c01009e1:	c6 05 04 c2 12 c0 00 	movb   $0x0,0xc012c204
c01009e8:	ba 08 00 00 00       	mov    $0x8,%edx
c01009ed:	c6 05 05 c2 12 c0 8f 	movb   $0x8f,0xc012c205
c01009f4:	c6 05 0c c2 12 c0 00 	movb   $0x0,0xc012c20c
c01009fb:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a00:	c6 05 0d c2 12 c0 8f 	movb   $0x8f,0xc012c20d
c0100a07:	c6 05 14 c2 12 c0 00 	movb   $0x0,0xc012c214
c0100a0e:	c6 05 15 c2 12 c0 8f 	movb   $0x8f,0xc012c215
c0100a15:	c6 05 1c c2 12 c0 00 	movb   $0x0,0xc012c21c
c0100a1c:	c6 05 1d c2 12 c0 8f 	movb   $0x8f,0xc012c21d
c0100a23:	c6 05 24 c2 12 c0 00 	movb   $0x0,0xc012c224
c0100a2a:	c6 05 25 c2 12 c0 8f 	movb   $0x8f,0xc012c225
c0100a31:	c6 05 2c c2 12 c0 00 	movb   $0x0,0xc012c22c
c0100a38:	66 a3 2e c2 12 c0    	mov    %ax,0xc012c22e
c0100a3e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0100a43:	66 89 15 32 c2 12 c0 	mov    %dx,0xc012c232
c0100a4a:	66 a3 30 c2 12 c0    	mov    %ax,0xc012c230
c0100a50:	c1 e8 10             	shr    $0x10,%eax
c0100a53:	66 89 0d c2 c5 12 c0 	mov    %cx,0xc012c5c2
c0100a5a:	66 a3 36 c2 12 c0    	mov    %ax,0xc012c236
c0100a60:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100a65:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a6a:	66 a3 c0 c5 12 c0    	mov    %ax,0xc012c5c0
c0100a70:	c1 e8 10             	shr    $0x10,%eax
c0100a73:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a78:	66 a3 c6 c5 12 c0    	mov    %ax,0xc012c5c6
c0100a7e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a83:	c6 05 2d c2 12 c0 8f 	movb   $0x8f,0xc012c22d
c0100a8a:	66 a3 c0 c2 12 c0    	mov    %ax,0xc012c2c0
c0100a90:	c1 e8 10             	shr    $0x10,%eax
c0100a93:	c6 05 34 c2 12 c0 00 	movb   $0x0,0xc012c234
c0100a9a:	66 a3 c6 c2 12 c0    	mov    %ax,0xc012c2c6
c0100aa0:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100aa5:	c6 05 35 c2 12 c0 8f 	movb   $0x8f,0xc012c235
c0100aac:	66 a3 30 c3 12 c0    	mov    %ax,0xc012c330
c0100ab2:	c1 e8 10             	shr    $0x10,%eax
c0100ab5:	c6 05 c4 c5 12 c0 00 	movb   $0x0,0xc012c5c4
c0100abc:	66 a3 36 c3 12 c0    	mov    %ax,0xc012c336
c0100ac2:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100ac7:	c6 05 c5 c5 12 c0 ef 	movb   $0xef,0xc012c5c5
c0100ace:	66 a3 80 c1 12 c0    	mov    %ax,0xc012c180
c0100ad4:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c0100ad9:	66 89 15 c2 c2 12 c0 	mov    %dx,0xc012c2c2
c0100ae0:	66 a3 82 c1 12 c0    	mov    %ax,0xc012c182
c0100ae6:	c1 e8 10             	shr    $0x10,%eax
c0100ae9:	c6 05 c4 c2 12 c0 00 	movb   $0x0,0xc012c2c4
c0100af0:	66 a3 84 c1 12 c0    	mov    %ax,0xc012c184
c0100af6:	c6 05 c5 c2 12 c0 8e 	movb   $0x8e,0xc012c2c5
c0100afd:	b8 80 c1 12 c0       	mov    $0xc012c180,%eax
c0100b02:	66 89 0d 32 c3 12 c0 	mov    %cx,0xc012c332
c0100b09:	c6 05 34 c3 12 c0 00 	movb   $0x0,0xc012c334
c0100b10:	c6 05 35 c3 12 c0 8e 	movb   $0x8e,0xc012c335
c0100b17:	0f 01 18             	lidtl  (%eax)
c0100b1a:	5d                   	pop    %ebp
c0100b1b:	c3                   	ret    
c0100b1c:	66 90                	xchg   %ax,%ax
c0100b1e:	66 90                	xchg   %ax,%ax

c0100b20 <create_video_mapping>:
c0100b20:	55                   	push   %ebp
c0100b21:	89 e5                	mov    %esp,%ebp
c0100b23:	53                   	push   %ebx
c0100b24:	83 ec 04             	sub    $0x4,%esp
c0100b27:	e8 14 01 00 00       	call   c0100c40 <get_updir>
c0100b2c:	89 c3                	mov    %eax,%ebx
c0100b2e:	e8 0d 01 00 00       	call   c0100c40 <get_updir>
c0100b33:	39 c3                	cmp    %eax,%ebx
c0100b35:	74 27                	je     c0100b5e <create_video_mapping+0x3e>
c0100b37:	83 ec 0c             	sub    $0xc,%esp
c0100b3a:	68 10 80 10 c0       	push   $0xc0108010
c0100b3f:	68 73 80 10 c0       	push   $0xc0108073
c0100b44:	6a 19                	push   $0x19
c0100b46:	68 36 80 10 c0       	push   $0xc0108036
c0100b4b:	68 54 7d 10 c0       	push   $0xc0107d54
c0100b50:	e8 1b 04 00 00       	call   c0100f70 <printk>
c0100b55:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b5a:	d6                   	(bad)  
c0100b5b:	83 c4 20             	add    $0x20,%esp
c0100b5e:	ba 00 d0 12 00       	mov    $0x12d000,%edx
c0100b63:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100b68:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c0100b6d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b73:	83 ca 07             	or     $0x7,%edx
c0100b76:	89 13                	mov    %edx,(%ebx)
c0100b78:	90                   	nop
c0100b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b80:	89 ca                	mov    %ecx,%edx
c0100b82:	83 c0 04             	add    $0x4,%eax
c0100b85:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b8b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b91:	83 ca 07             	or     $0x7,%edx
c0100b94:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b97:	3d c0 d2 12 c0       	cmp    $0xc012d2c0,%eax
c0100b9c:	75 e2                	jne    c0100b80 <create_video_mapping+0x60>
c0100b9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ba1:	c9                   	leave  
c0100ba2:	c3                   	ret    
c0100ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100bb0 <video_mapping_write_test>:
c0100bb0:	55                   	push   %ebp
c0100bb1:	31 c0                	xor    %eax,%eax
c0100bb3:	89 e5                	mov    %esp,%ebp
c0100bb5:	8d 76 00             	lea    0x0(%esi),%esi
c0100bb8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100bbf:	83 c0 01             	add    $0x1,%eax
c0100bc2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100bc7:	75 ef                	jne    c0100bb8 <video_mapping_write_test+0x8>
c0100bc9:	5d                   	pop    %ebp
c0100bca:	c3                   	ret    
c0100bcb:	90                   	nop
c0100bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100bd0 <video_mapping_read_test>:
c0100bd0:	55                   	push   %ebp
c0100bd1:	89 e5                	mov    %esp,%ebp
c0100bd3:	56                   	push   %esi
c0100bd4:	be 01 00 00 00       	mov    $0x1,%esi
c0100bd9:	53                   	push   %ebx
c0100bda:	31 db                	xor    %ebx,%ebx
c0100bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100be0:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100be7:	74 24                	je     c0100c0d <video_mapping_read_test+0x3d>
c0100be9:	83 ec 0c             	sub    $0xc,%esp
c0100bec:	68 4f 80 10 c0       	push   $0xc010804f
c0100bf1:	68 5b 80 10 c0       	push   $0xc010805b
c0100bf6:	6a 30                	push   $0x30
c0100bf8:	68 36 80 10 c0       	push   $0xc0108036
c0100bfd:	68 54 7d 10 c0       	push   $0xc0107d54
c0100c02:	e8 69 03 00 00       	call   c0100f70 <printk>
c0100c07:	89 f0                	mov    %esi,%eax
c0100c09:	d6                   	(bad)  
c0100c0a:	83 c4 20             	add    $0x20,%esp
c0100c0d:	83 c3 01             	add    $0x1,%ebx
c0100c10:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100c16:	75 c8                	jne    c0100be0 <video_mapping_read_test+0x10>
c0100c18:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100c1b:	5b                   	pop    %ebx
c0100c1c:	5e                   	pop    %esi
c0100c1d:	5d                   	pop    %ebp
c0100c1e:	c3                   	ret    
c0100c1f:	90                   	nop

c0100c20 <video_mapping_clear>:
c0100c20:	55                   	push   %ebp
c0100c21:	89 e5                	mov    %esp,%ebp
c0100c23:	83 ec 0c             	sub    $0xc,%esp
c0100c26:	68 00 fa 00 00       	push   $0xfa00
c0100c2b:	6a 00                	push   $0x0
c0100c2d:	68 00 00 0a 00       	push   $0xa0000
c0100c32:	e8 81 08 00 00       	call   c01014b8 <memset>
c0100c37:	83 c4 10             	add    $0x10,%esp
c0100c3a:	c9                   	leave  
c0100c3b:	c3                   	ret    
c0100c3c:	66 90                	xchg   %ax,%ax
c0100c3e:	66 90                	xchg   %ax,%ax

c0100c40 <get_updir>:
c0100c40:	55                   	push   %ebp
c0100c41:	b8 00 f0 12 c0       	mov    $0xc012f000,%eax
c0100c46:	89 e5                	mov    %esp,%ebp
c0100c48:	5d                   	pop    %ebp
c0100c49:	c3                   	ret    
c0100c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c50 <get_ucr3>:
c0100c50:	55                   	push   %ebp
c0100c51:	a1 04 e0 12 c0       	mov    0xc012e004,%eax
c0100c56:	89 e5                	mov    %esp,%ebp
c0100c58:	5d                   	pop    %ebp
c0100c59:	c3                   	ret    
c0100c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c60 <mm_brk>:
c0100c60:	55                   	push   %ebp
c0100c61:	89 e5                	mov    %esp,%ebp
c0100c63:	53                   	push   %ebx
c0100c64:	83 ec 04             	sub    $0x4,%esp
c0100c67:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100c6a:	a1 00 e0 12 c0       	mov    0xc012e000,%eax
c0100c6f:	39 d8                	cmp    %ebx,%eax
c0100c71:	73 11                	jae    c0100c84 <mm_brk+0x24>
c0100c73:	89 da                	mov    %ebx,%edx
c0100c75:	83 ec 08             	sub    $0x8,%esp
c0100c78:	29 c2                	sub    %eax,%edx
c0100c7a:	52                   	push   %edx
c0100c7b:	50                   	push   %eax
c0100c7c:	e8 cf f3 ff ff       	call   c0100050 <mm_malloc>
c0100c81:	83 c4 10             	add    $0x10,%esp
c0100c84:	89 1d 00 e0 12 c0    	mov    %ebx,0xc012e000
c0100c8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c8d:	c9                   	leave  
c0100c8e:	c3                   	ret    
c0100c8f:	90                   	nop

c0100c90 <init_mm>:
c0100c90:	55                   	push   %ebp
c0100c91:	89 e5                	mov    %esp,%ebp
c0100c93:	53                   	push   %ebx
c0100c94:	83 ec 04             	sub    $0x4,%esp
c0100c97:	e8 54 00 00 00       	call   c0100cf0 <get_kpdir>
c0100c9c:	83 ec 04             	sub    $0x4,%esp
c0100c9f:	89 c3                	mov    %eax,%ebx
c0100ca1:	68 00 10 00 00       	push   $0x1000
c0100ca6:	6a 00                	push   $0x0
c0100ca8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100cae:	68 00 f0 12 c0       	push   $0xc012f000
c0100cb3:	e8 00 08 00 00       	call   c01014b8 <memset>
c0100cb8:	83 c4 0c             	add    $0xc,%esp
c0100cbb:	68 80 00 00 00       	push   $0x80
c0100cc0:	53                   	push   %ebx
c0100cc1:	68 00 fc 12 c0       	push   $0xc012fc00
c0100cc6:	e8 a5 07 00 00       	call   c0101470 <memcpy>
c0100ccb:	b8 00 f0 12 00       	mov    $0x12f000,%eax
c0100cd0:	83 c4 10             	add    $0x10,%esp
c0100cd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100cd6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cdb:	a3 04 e0 12 c0       	mov    %eax,0xc012e004
c0100ce0:	c9                   	leave  
c0100ce1:	c3                   	ret    
c0100ce2:	66 90                	xchg   %ax,%ax
c0100ce4:	66 90                	xchg   %ax,%ax
c0100ce6:	66 90                	xchg   %ax,%ax
c0100ce8:	66 90                	xchg   %ax,%ax
c0100cea:	66 90                	xchg   %ax,%ax
c0100cec:	66 90                	xchg   %ax,%ax
c0100cee:	66 90                	xchg   %ax,%ax

c0100cf0 <get_kpdir>:
c0100cf0:	55                   	push   %ebp
c0100cf1:	b8 00 10 15 c0       	mov    $0xc0151000,%eax
c0100cf6:	89 e5                	mov    %esp,%ebp
c0100cf8:	5d                   	pop    %ebp
c0100cf9:	c3                   	ret    
c0100cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100d00 <init_page>:
c0100d00:	55                   	push   %ebp
c0100d01:	89 e5                	mov    %esp,%ebp
c0100d03:	57                   	push   %edi
c0100d04:	83 ec 08             	sub    $0x8,%esp
c0100d07:	68 00 10 00 00       	push   $0x1000
c0100d0c:	6a 00                	push   $0x0
c0100d0e:	68 00 10 15 00       	push   $0x151000
c0100d13:	e8 a0 07 00 00       	call   c01014b8 <memset>
c0100d18:	b9 00 10 15 00       	mov    $0x151000,%ecx
c0100d1d:	83 c4 10             	add    $0x10,%esp
c0100d20:	ba 00 10 13 00       	mov    $0x131000,%edx
c0100d25:	8d 76 00             	lea    0x0(%esi),%esi
c0100d28:	89 d0                	mov    %edx,%eax
c0100d2a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100d30:	83 c1 04             	add    $0x4,%ecx
c0100d33:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d38:	83 c8 07             	or     $0x7,%eax
c0100d3b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100d3e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100d44:	81 fa 00 10 15 00    	cmp    $0x151000,%edx
c0100d4a:	75 dc                	jne    c0100d28 <init_page+0x28>
c0100d4c:	bf fc 0f 15 00       	mov    $0x150ffc,%edi
c0100d51:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100d56:	fd                   	std    
c0100d57:	ab                   	stos   %eax,%es:(%edi)
c0100d58:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100d5d:	7d f8                	jge    c0100d57 <init_page+0x57>
c0100d5f:	b8 00 10 15 00       	mov    $0x151000,%eax
c0100d64:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d69:	0f 22 d8             	mov    %eax,%cr3
c0100d6c:	0f 20 c0             	mov    %cr0,%eax
c0100d6f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100d74:	0f 22 c0             	mov    %eax,%cr0
c0100d77:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100d7a:	c9                   	leave  
c0100d7b:	c3                   	ret    
c0100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d80 <init_segment>:
c0100d80:	55                   	push   %ebp
c0100d81:	89 e5                	mov    %esp,%ebp
c0100d83:	83 ec 0c             	sub    $0xc,%esp
c0100d86:	6a 18                	push   $0x18
c0100d88:	6a 00                	push   $0x0
c0100d8a:	68 08 00 13 c0       	push   $0xc0130008
c0100d8f:	e8 24 07 00 00       	call   c01014b8 <memset>
c0100d94:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d99:	31 c9                	xor    %ecx,%ecx
c0100d9b:	b8 08 00 13 c0       	mov    $0xc0130008,%eax
c0100da0:	66 89 15 10 00 13 c0 	mov    %dx,0xc0130010
c0100da7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100dac:	66 89 0d 12 00 13 c0 	mov    %cx,0xc0130012
c0100db3:	66 89 15 18 00 13 c0 	mov    %dx,0xc0130018
c0100dba:	ba 17 00 00 00       	mov    $0x17,%edx
c0100dbf:	31 c9                	xor    %ecx,%ecx
c0100dc1:	66 89 15 00 00 13 c0 	mov    %dx,0xc0130000
c0100dc8:	66 a3 02 00 13 c0    	mov    %ax,0xc0130002
c0100dce:	c1 e8 10             	shr    $0x10,%eax
c0100dd1:	66 a3 04 00 13 c0    	mov    %ax,0xc0130004
c0100dd7:	c6 05 14 00 13 c0 00 	movb   $0x0,0xc0130014
c0100dde:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c0100de3:	c6 05 15 00 13 c0 9a 	movb   $0x9a,0xc0130015
c0100dea:	c6 05 16 00 13 c0 cf 	movb   $0xcf,0xc0130016
c0100df1:	c6 05 17 00 13 c0 00 	movb   $0x0,0xc0130017
c0100df8:	66 89 0d 1a 00 13 c0 	mov    %cx,0xc013001a
c0100dff:	c6 05 1c 00 13 c0 00 	movb   $0x0,0xc013001c
c0100e06:	c6 05 1d 00 13 c0 92 	movb   $0x92,0xc013001d
c0100e0d:	c6 05 1e 00 13 c0 cf 	movb   $0xcf,0xc013001e
c0100e14:	c6 05 1f 00 13 c0 00 	movb   $0x0,0xc013001f
c0100e1b:	0f 01 10             	lgdtl  (%eax)
c0100e1e:	83 c4 10             	add    $0x10,%esp
c0100e21:	c9                   	leave  
c0100e22:	c3                   	ret    
c0100e23:	66 90                	xchg   %ax,%ax
c0100e25:	66 90                	xchg   %ax,%ax
c0100e27:	66 90                	xchg   %ax,%ax
c0100e29:	66 90                	xchg   %ax,%ax
c0100e2b:	66 90                	xchg   %ax,%ax
c0100e2d:	66 90                	xchg   %ax,%ax
c0100e2f:	90                   	nop

c0100e30 <loader>:
c0100e30:	55                   	push   %ebp
c0100e31:	89 e5                	mov    %esp,%ebp
c0100e33:	57                   	push   %edi
c0100e34:	56                   	push   %esi
c0100e35:	53                   	push   %ebx
c0100e36:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100e3c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100e42:	68 00 10 00 00       	push   $0x1000
c0100e47:	6a 00                	push   $0x0
c0100e49:	53                   	push   %ebx
c0100e4a:	e8 81 02 00 00       	call   c01010d0 <ide_read>
c0100e4f:	83 c4 10             	add    $0x10,%esp
c0100e52:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100e59:	45 4c 46 
c0100e5c:	74 06                	je     c0100e64 <loader+0x34>
c0100e5e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e63:	d6                   	(bad)  
c0100e64:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100e6a:	83 fa 34             	cmp    $0x34,%edx
c0100e6d:	74 06                	je     c0100e75 <loader+0x45>
c0100e6f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e74:	d6                   	(bad)  
c0100e75:	31 f6                	xor    %esi,%esi
c0100e77:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100e7e:	00 
c0100e7f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e83:	75 1c                	jne    c0100ea1 <loader+0x71>
c0100e85:	eb 71                	jmp    c0100ef8 <loader+0xc8>
c0100e87:	89 f6                	mov    %esi,%esi
c0100e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e90:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e97:	83 c6 01             	add    $0x1,%esi
c0100e9a:	83 c3 20             	add    $0x20,%ebx
c0100e9d:	39 f0                	cmp    %esi,%eax
c0100e9f:	7e 57                	jle    c0100ef8 <loader+0xc8>
c0100ea1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100ea5:	75 e9                	jne    c0100e90 <loader+0x60>
c0100ea7:	83 ec 08             	sub    $0x8,%esp
c0100eaa:	ff 33                	pushl  (%ebx)
c0100eac:	ff 73 f4             	pushl  -0xc(%ebx)
c0100eaf:	e8 9c f1 ff ff       	call   c0100050 <mm_malloc>
c0100eb4:	83 c4 0c             	add    $0xc,%esp
c0100eb7:	ff 73 fc             	pushl  -0x4(%ebx)
c0100eba:	ff 73 f0             	pushl  -0x10(%ebx)
c0100ebd:	50                   	push   %eax
c0100ebe:	89 c7                	mov    %eax,%edi
c0100ec0:	e8 0b 02 00 00       	call   c01010d0 <ide_read>
c0100ec5:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0100ec8:	8b 0b                	mov    (%ebx),%ecx
c0100eca:	83 c4 0c             	add    $0xc,%esp
c0100ecd:	29 d1                	sub    %edx,%ecx
c0100ecf:	01 fa                	add    %edi,%edx
c0100ed1:	51                   	push   %ecx
c0100ed2:	6a 00                	push   $0x0
c0100ed4:	52                   	push   %edx
c0100ed5:	e8 de 05 00 00       	call   c01014b8 <memset>
c0100eda:	8b 03                	mov    (%ebx),%eax
c0100edc:	03 43 f4             	add    -0xc(%ebx),%eax
c0100edf:	83 c4 10             	add    $0x10,%esp
c0100ee2:	83 e8 01             	sub    $0x1,%eax
c0100ee5:	3b 05 00 e0 12 c0    	cmp    0xc012e000,%eax
c0100eeb:	76 a3                	jbe    c0100e90 <loader+0x60>
c0100eed:	a3 00 e0 12 c0       	mov    %eax,0xc012e000
c0100ef2:	eb 9c                	jmp    c0100e90 <loader+0x60>
c0100ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ef8:	83 ec 08             	sub    $0x8,%esp
c0100efb:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100f01:	68 00 00 10 00       	push   $0x100000
c0100f06:	68 00 00 f0 bf       	push   $0xbff00000
c0100f0b:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100f11:	e8 3a f1 ff ff       	call   c0100050 <mm_malloc>
c0100f16:	e8 05 fc ff ff       	call   c0100b20 <create_video_mapping>
c0100f1b:	e8 30 fd ff ff       	call   c0100c50 <get_ucr3>
c0100f20:	0f 22 d8             	mov    %eax,%cr3
c0100f23:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100f29:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100f2c:	5b                   	pop    %ebx
c0100f2d:	5e                   	pop    %esi
c0100f2e:	5f                   	pop    %edi
c0100f2f:	5d                   	pop    %ebp
c0100f30:	c3                   	ret    
c0100f31:	66 90                	xchg   %ax,%ax
c0100f33:	66 90                	xchg   %ax,%ax
c0100f35:	66 90                	xchg   %ax,%ax
c0100f37:	66 90                	xchg   %ax,%ax
c0100f39:	66 90                	xchg   %ax,%ax
c0100f3b:	66 90                	xchg   %ax,%ax
c0100f3d:	66 90                	xchg   %ax,%ax
c0100f3f:	90                   	nop

c0100f40 <sbrk>:
c0100f40:	55                   	push   %ebp
c0100f41:	89 e5                	mov    %esp,%ebp
c0100f43:	83 ec 08             	sub    $0x8,%esp
c0100f46:	68 9e 80 10 c0       	push   $0xc010809e
c0100f4b:	6a 08                	push   $0x8
c0100f4d:	68 88 80 10 c0       	push   $0xc0108088
c0100f52:	68 f4 7d 10 c0       	push   $0xc0107df4
c0100f57:	e8 14 00 00 00       	call   c0100f70 <printk>
c0100f5c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f61:	d6                   	(bad)  
c0100f62:	30 c0                	xor    %al,%al
c0100f64:	c9                   	leave  
c0100f65:	c3                   	ret    
c0100f66:	66 90                	xchg   %ax,%ax
c0100f68:	66 90                	xchg   %ax,%ax
c0100f6a:	66 90                	xchg   %ax,%ax
c0100f6c:	66 90                	xchg   %ax,%ax
c0100f6e:	66 90                	xchg   %ax,%ax

c0100f70 <printk>:
c0100f70:	55                   	push   %ebp
c0100f71:	89 e5                	mov    %esp,%ebp
c0100f73:	56                   	push   %esi
c0100f74:	53                   	push   %ebx
c0100f75:	8d 45 0c             	lea    0xc(%ebp),%eax
c0100f78:	50                   	push   %eax
c0100f79:	ff 75 08             	pushl  0x8(%ebp)
c0100f7c:	68 00 01 00 00       	push   $0x100
c0100f81:	68 00 20 15 c0       	push   $0xc0152000
c0100f86:	e8 45 06 00 00       	call   c01015d0 <vsnprintf>
c0100f8b:	83 c4 10             	add    $0x10,%esp
c0100f8e:	85 c0                	test   %eax,%eax
c0100f90:	89 c6                	mov    %eax,%esi
c0100f92:	7e 26                	jle    c0100fba <printk+0x4a>
c0100f94:	31 db                	xor    %ebx,%ebx
c0100f96:	8d 76 00             	lea    0x0(%esi),%esi
c0100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100fa0:	0f be 93 00 20 15 c0 	movsbl -0x3feae000(%ebx),%edx
c0100fa7:	83 ec 0c             	sub    $0xc,%esp
c0100faa:	83 c3 01             	add    $0x1,%ebx
c0100fad:	52                   	push   %edx
c0100fae:	e8 5d 00 00 00       	call   c0101010 <serial_printc>
c0100fb3:	83 c4 10             	add    $0x10,%esp
c0100fb6:	39 f3                	cmp    %esi,%ebx
c0100fb8:	75 e6                	jne    c0100fa0 <printk+0x30>
c0100fba:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100fbd:	5b                   	pop    %ebx
c0100fbe:	5e                   	pop    %esi
c0100fbf:	5d                   	pop    %ebp
c0100fc0:	c3                   	ret    
c0100fc1:	66 90                	xchg   %ax,%ax
c0100fc3:	66 90                	xchg   %ax,%ax
c0100fc5:	66 90                	xchg   %ax,%ax
c0100fc7:	66 90                	xchg   %ax,%ax
c0100fc9:	66 90                	xchg   %ax,%ax
c0100fcb:	66 90                	xchg   %ax,%ax
c0100fcd:	66 90                	xchg   %ax,%ax
c0100fcf:	90                   	nop

c0100fd0 <init_serial>:
c0100fd0:	55                   	push   %ebp
c0100fd1:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100fd6:	31 c0                	xor    %eax,%eax
c0100fd8:	89 e5                	mov    %esp,%ebp
c0100fda:	ee                   	out    %al,(%dx)
c0100fdb:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100fe0:	b2 fb                	mov    $0xfb,%dl
c0100fe2:	ee                   	out    %al,(%dx)
c0100fe3:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fe8:	b2 f8                	mov    $0xf8,%dl
c0100fea:	ee                   	out    %al,(%dx)
c0100feb:	31 c0                	xor    %eax,%eax
c0100fed:	b2 f9                	mov    $0xf9,%dl
c0100fef:	ee                   	out    %al,(%dx)
c0100ff0:	b8 03 00 00 00       	mov    $0x3,%eax
c0100ff5:	b2 fb                	mov    $0xfb,%dl
c0100ff7:	ee                   	out    %al,(%dx)
c0100ff8:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100ffd:	b2 fa                	mov    $0xfa,%dl
c0100fff:	ee                   	out    %al,(%dx)
c0101000:	b8 0b 00 00 00       	mov    $0xb,%eax
c0101005:	b2 fc                	mov    $0xfc,%dl
c0101007:	ee                   	out    %al,(%dx)
c0101008:	5d                   	pop    %ebp
c0101009:	c3                   	ret    
c010100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101010 <serial_printc>:
c0101010:	55                   	push   %ebp
c0101011:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0101016:	89 e5                	mov    %esp,%ebp
c0101018:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010101b:	90                   	nop
c010101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101020:	ec                   	in     (%dx),%al
c0101021:	a8 20                	test   $0x20,%al
c0101023:	74 fb                	je     c0101020 <serial_printc+0x10>
c0101025:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010102a:	89 c8                	mov    %ecx,%eax
c010102c:	ee                   	out    %al,(%dx)
c010102d:	5d                   	pop    %ebp
c010102e:	c3                   	ret    
c010102f:	90                   	nop

c0101030 <ramdisk_read>:
c0101030:	55                   	push   %ebp
c0101031:	89 e5                	mov    %esp,%ebp
c0101033:	53                   	push   %ebx
c0101034:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101037:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010103a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010103d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101040:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101045:	76 06                	jbe    c010104d <ramdisk_read+0x1d>
c0101047:	b8 01 00 00 00       	mov    $0x1,%eax
c010104c:	d6                   	(bad)  
c010104d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0101050:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101053:	89 55 0c             	mov    %edx,0xc(%ebp)
c0101056:	5b                   	pop    %ebx
c0101057:	5d                   	pop    %ebp
c0101058:	e9 13 04 00 00       	jmp    c0101470 <memcpy>
c010105d:	8d 76 00             	lea    0x0(%esi),%esi

c0101060 <ramdisk_write>:
c0101060:	55                   	push   %ebp
c0101061:	89 e5                	mov    %esp,%ebp
c0101063:	53                   	push   %ebx
c0101064:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101067:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010106a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010106d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101070:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101075:	76 06                	jbe    c010107d <ramdisk_write+0x1d>
c0101077:	b8 01 00 00 00       	mov    $0x1,%eax
c010107c:	d6                   	(bad)  
c010107d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0101080:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101083:	89 55 08             	mov    %edx,0x8(%ebp)
c0101086:	5b                   	pop    %ebx
c0101087:	5d                   	pop    %ebp
c0101088:	e9 e3 03 00 00       	jmp    c0101470 <memcpy>
c010108d:	66 90                	xchg   %ax,%ax
c010108f:	90                   	nop

c0101090 <ide_intr>:
c0101090:	55                   	push   %ebp
c0101091:	c7 05 04 21 15 c0 01 	movl   $0x1,0xc0152104
c0101098:	00 00 00 
c010109b:	89 e5                	mov    %esp,%ebp
c010109d:	5d                   	pop    %ebp
c010109e:	c3                   	ret    
c010109f:	90                   	nop

c01010a0 <ide_writeback>:
c01010a0:	a1 00 21 15 c0       	mov    0xc0152100,%eax
c01010a5:	83 c0 01             	add    $0x1,%eax
c01010a8:	83 f8 64             	cmp    $0x64,%eax
c01010ab:	a3 00 21 15 c0       	mov    %eax,0xc0152100
c01010b0:	74 06                	je     c01010b8 <ide_writeback+0x18>
c01010b2:	c3                   	ret    
c01010b3:	90                   	nop
c01010b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010b8:	55                   	push   %ebp
c01010b9:	89 e5                	mov    %esp,%ebp
c01010bb:	83 ec 08             	sub    $0x8,%esp
c01010be:	e8 dd 01 00 00       	call   c01012a0 <buf_writeback>
c01010c3:	c7 05 00 21 15 c0 00 	movl   $0x0,0xc0152100
c01010ca:	00 00 00 
c01010cd:	c9                   	leave  
c01010ce:	c3                   	ret    
c01010cf:	90                   	nop

c01010d0 <ide_read>:
c01010d0:	55                   	push   %ebp
c01010d1:	89 e5                	mov    %esp,%ebp
c01010d3:	57                   	push   %edi
c01010d4:	56                   	push   %esi
c01010d5:	53                   	push   %ebx
c01010d6:	83 ec 0c             	sub    $0xc,%esp
c01010d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01010dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01010df:	8b 7d 08             	mov    0x8(%ebp),%edi
c01010e2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c01010e5:	29 df                	sub    %ebx,%edi
c01010e7:	85 c0                	test   %eax,%eax
c01010e9:	74 1b                	je     c0101106 <ide_read+0x36>
c01010eb:	90                   	nop
c01010ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010f0:	83 ec 0c             	sub    $0xc,%esp
c01010f3:	53                   	push   %ebx
c01010f4:	e8 07 02 00 00       	call   c0101300 <read_byte>
c01010f9:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c01010fc:	83 c3 01             	add    $0x1,%ebx
c01010ff:	83 c4 10             	add    $0x10,%esp
c0101102:	39 f3                	cmp    %esi,%ebx
c0101104:	75 ea                	jne    c01010f0 <ide_read+0x20>
c0101106:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101109:	5b                   	pop    %ebx
c010110a:	5e                   	pop    %esi
c010110b:	5f                   	pop    %edi
c010110c:	5d                   	pop    %ebp
c010110d:	c3                   	ret    
c010110e:	66 90                	xchg   %ax,%ax

c0101110 <ide_write>:
c0101110:	55                   	push   %ebp
c0101111:	89 e5                	mov    %esp,%ebp
c0101113:	57                   	push   %edi
c0101114:	56                   	push   %esi
c0101115:	53                   	push   %ebx
c0101116:	83 ec 0c             	sub    $0xc,%esp
c0101119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010111c:	8b 45 10             	mov    0x10(%ebp),%eax
c010111f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101122:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101125:	29 df                	sub    %ebx,%edi
c0101127:	85 c0                	test   %eax,%eax
c0101129:	74 1d                	je     c0101148 <ide_write+0x38>
c010112b:	90                   	nop
c010112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101130:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101134:	83 ec 08             	sub    $0x8,%esp
c0101137:	50                   	push   %eax
c0101138:	53                   	push   %ebx
c0101139:	83 c3 01             	add    $0x1,%ebx
c010113c:	e8 ef 01 00 00       	call   c0101330 <write_byte>
c0101141:	83 c4 10             	add    $0x10,%esp
c0101144:	39 f3                	cmp    %esi,%ebx
c0101146:	75 e8                	jne    c0101130 <ide_write+0x20>
c0101148:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010114b:	5b                   	pop    %ebx
c010114c:	5e                   	pop    %esi
c010114d:	5f                   	pop    %edi
c010114e:	5d                   	pop    %ebp
c010114f:	c3                   	ret    

c0101150 <clear_ide_intr>:
c0101150:	55                   	push   %ebp
c0101151:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101158:	00 00 00 
c010115b:	89 e5                	mov    %esp,%ebp
c010115d:	5d                   	pop    %ebp
c010115e:	c3                   	ret    
c010115f:	90                   	nop

c0101160 <wait_ide_intr>:
c0101160:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101165:	55                   	push   %ebp
c0101166:	89 e5                	mov    %esp,%ebp
c0101168:	85 c0                	test   %eax,%eax
c010116a:	75 0e                	jne    c010117a <wait_ide_intr+0x1a>
c010116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101170:	f4                   	hlt    
c0101171:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101176:	85 c0                	test   %eax,%eax
c0101178:	74 f6                	je     c0101170 <wait_ide_intr+0x10>
c010117a:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101181:	00 00 00 
c0101184:	5d                   	pop    %ebp
c0101185:	c3                   	ret    
c0101186:	8d 76 00             	lea    0x0(%esi),%esi
c0101189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101190 <init_ide>:
c0101190:	55                   	push   %ebp
c0101191:	89 e5                	mov    %esp,%ebp
c0101193:	83 ec 08             	sub    $0x8,%esp
c0101196:	e8 d5 00 00 00       	call   c0101270 <buf_init>
c010119b:	83 ec 08             	sub    $0x8,%esp
c010119e:	68 a0 10 10 c0       	push   $0xc01010a0
c01011a3:	6a 00                	push   $0x0
c01011a5:	e8 c6 f3 ff ff       	call   c0100570 <add_irq_handle>
c01011aa:	58                   	pop    %eax
c01011ab:	5a                   	pop    %edx
c01011ac:	68 90 10 10 c0       	push   $0xc0101090
c01011b1:	6a 0e                	push   $0xe
c01011b3:	e8 b8 f3 ff ff       	call   c0100570 <add_irq_handle>
c01011b8:	83 c4 10             	add    $0x10,%esp
c01011bb:	c9                   	leave  
c01011bc:	c3                   	ret    
c01011bd:	66 90                	xchg   %ax,%ax
c01011bf:	90                   	nop

c01011c0 <buf_fetch>:
c01011c0:	55                   	push   %ebp
c01011c1:	89 c2                	mov    %eax,%edx
c01011c3:	89 e5                	mov    %esp,%ebp
c01011c5:	57                   	push   %edi
c01011c6:	56                   	push   %esi
c01011c7:	53                   	push   %ebx
c01011c8:	89 c3                	mov    %eax,%ebx
c01011ca:	83 e3 7f             	and    $0x7f,%ebx
c01011cd:	89 d8                	mov    %ebx,%eax
c01011cf:	83 ec 1c             	sub    $0x1c,%esp
c01011d2:	c1 e0 09             	shl    $0x9,%eax
c01011d5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c01011d8:	8d 81 40 21 15 c0    	lea    -0x3feadec0(%ecx),%eax
c01011de:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c01011e2:	74 5c                	je     c0101240 <buf_fetch+0x80>
c01011e4:	89 d7                	mov    %edx,%edi
c01011e6:	89 da                	mov    %ebx,%edx
c01011e8:	c1 e2 09             	shl    $0x9,%edx
c01011eb:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01011ee:	8d 91 40 21 15 c0    	lea    -0x3feadec0(%ecx),%edx
c01011f4:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c01011fa:	74 54                	je     c0101250 <buf_fetch+0x90>
c01011fc:	8d 72 06             	lea    0x6(%edx),%esi
c01011ff:	83 ec 08             	sub    $0x8,%esp
c0101202:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101205:	57                   	push   %edi
c0101206:	56                   	push   %esi
c0101207:	e8 a4 01 00 00       	call   c01013b0 <disk_do_read>
c010120c:	89 da                	mov    %ebx,%edx
c010120e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101211:	83 c4 10             	add    $0x10,%esp
c0101214:	c1 e2 09             	shl    $0x9,%edx
c0101217:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010121a:	c6 81 44 21 15 c0 01 	movb   $0x1,-0x3feadebc(%ecx)
c0101221:	89 b9 40 21 15 c0    	mov    %edi,-0x3feadec0(%ecx)
c0101227:	c6 81 45 21 15 c0 00 	movb   $0x0,-0x3feadebb(%ecx)
c010122e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101231:	5b                   	pop    %ebx
c0101232:	5e                   	pop    %esi
c0101233:	5f                   	pop    %edi
c0101234:	5d                   	pop    %ebp
c0101235:	c3                   	ret    
c0101236:	8d 76 00             	lea    0x0(%esi),%esi
c0101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101240:	39 91 40 21 15 c0    	cmp    %edx,-0x3feadec0(%ecx)
c0101246:	75 9c                	jne    c01011e4 <buf_fetch+0x24>
c0101248:	eb e4                	jmp    c010122e <buf_fetch+0x6e>
c010124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101250:	8d 72 06             	lea    0x6(%edx),%esi
c0101253:	83 ec 08             	sub    $0x8,%esp
c0101256:	ff b1 40 21 15 c0    	pushl  -0x3feadec0(%ecx)
c010125c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010125f:	56                   	push   %esi
c0101260:	e8 8b 01 00 00       	call   c01013f0 <disk_do_write>
c0101265:	83 c4 10             	add    $0x10,%esp
c0101268:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010126b:	eb 92                	jmp    c01011ff <buf_fetch+0x3f>
c010126d:	8d 76 00             	lea    0x0(%esi),%esi

c0101270 <buf_init>:
c0101270:	55                   	push   %ebp
c0101271:	b8 44 21 15 c0       	mov    $0xc0152144,%eax
c0101276:	89 e5                	mov    %esp,%ebp
c0101278:	90                   	nop
c0101279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101280:	c6 00 00             	movb   $0x0,(%eax)
c0101283:	05 08 02 00 00       	add    $0x208,%eax
c0101288:	3d 44 25 16 c0       	cmp    $0xc0162544,%eax
c010128d:	75 f1                	jne    c0101280 <buf_init+0x10>
c010128f:	5d                   	pop    %ebp
c0101290:	c3                   	ret    
c0101291:	eb 0d                	jmp    c01012a0 <buf_writeback>
c0101293:	90                   	nop
c0101294:	90                   	nop
c0101295:	90                   	nop
c0101296:	90                   	nop
c0101297:	90                   	nop
c0101298:	90                   	nop
c0101299:	90                   	nop
c010129a:	90                   	nop
c010129b:	90                   	nop
c010129c:	90                   	nop
c010129d:	90                   	nop
c010129e:	90                   	nop
c010129f:	90                   	nop

c01012a0 <buf_writeback>:
c01012a0:	55                   	push   %ebp
c01012a1:	89 e5                	mov    %esp,%ebp
c01012a3:	53                   	push   %ebx
c01012a4:	bb 46 21 15 c0       	mov    $0xc0152146,%ebx
c01012a9:	83 ec 04             	sub    $0x4,%esp
c01012ac:	eb 10                	jmp    c01012be <buf_writeback+0x1e>
c01012ae:	66 90                	xchg   %ax,%ax
c01012b0:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01012b6:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c01012bc:	74 32                	je     c01012f0 <buf_writeback+0x50>
c01012be:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01012c2:	75 ec                	jne    c01012b0 <buf_writeback+0x10>
c01012c4:	83 ec 08             	sub    $0x8,%esp
c01012c7:	ff 73 fa             	pushl  -0x6(%ebx)
c01012ca:	53                   	push   %ebx
c01012cb:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01012d1:	e8 1a 01 00 00       	call   c01013f0 <disk_do_write>
c01012d6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c01012dd:	83 c4 10             	add    $0x10,%esp
c01012e0:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c01012e6:	75 d6                	jne    c01012be <buf_writeback+0x1e>
c01012e8:	90                   	nop
c01012e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01012f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01012f3:	c9                   	leave  
c01012f4:	c3                   	ret    
c01012f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101300 <read_byte>:
c0101300:	55                   	push   %ebp
c0101301:	89 e5                	mov    %esp,%ebp
c0101303:	53                   	push   %ebx
c0101304:	83 ec 04             	sub    $0x4,%esp
c0101307:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010130a:	89 d8                	mov    %ebx,%eax
c010130c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101312:	c1 e8 09             	shr    $0x9,%eax
c0101315:	e8 a6 fe ff ff       	call   c01011c0 <buf_fetch>
c010131a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010131f:	83 c4 04             	add    $0x4,%esp
c0101322:	5b                   	pop    %ebx
c0101323:	5d                   	pop    %ebp
c0101324:	c3                   	ret    
c0101325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101330 <write_byte>:
c0101330:	55                   	push   %ebp
c0101331:	89 e5                	mov    %esp,%ebp
c0101333:	56                   	push   %esi
c0101334:	53                   	push   %ebx
c0101335:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101338:	8b 75 0c             	mov    0xc(%ebp),%esi
c010133b:	89 d8                	mov    %ebx,%eax
c010133d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101343:	c1 e8 09             	shr    $0x9,%eax
c0101346:	e8 75 fe ff ff       	call   c01011c0 <buf_fetch>
c010134b:	89 f2                	mov    %esi,%edx
c010134d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101351:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101355:	5b                   	pop    %ebx
c0101356:	5e                   	pop    %esi
c0101357:	5d                   	pop    %ebp
c0101358:	c3                   	ret    
c0101359:	66 90                	xchg   %ax,%ax
c010135b:	66 90                	xchg   %ax,%ax
c010135d:	66 90                	xchg   %ax,%ax
c010135f:	90                   	nop

c0101360 <ide_prepare>:
c0101360:	55                   	push   %ebp
c0101361:	89 c1                	mov    %eax,%ecx
c0101363:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101368:	89 e5                	mov    %esp,%ebp
c010136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101370:	ec                   	in     (%dx),%al
c0101371:	83 e0 c0             	and    $0xffffffc0,%eax
c0101374:	3c 40                	cmp    $0x40,%al
c0101376:	75 f8                	jne    c0101370 <ide_prepare+0x10>
c0101378:	ba f1 01 00 00       	mov    $0x1f1,%edx
c010137d:	31 c0                	xor    %eax,%eax
c010137f:	ee                   	out    %al,(%dx)
c0101380:	b8 01 00 00 00       	mov    $0x1,%eax
c0101385:	b2 f2                	mov    $0xf2,%dl
c0101387:	ee                   	out    %al,(%dx)
c0101388:	b2 f3                	mov    $0xf3,%dl
c010138a:	89 c8                	mov    %ecx,%eax
c010138c:	ee                   	out    %al,(%dx)
c010138d:	89 c8                	mov    %ecx,%eax
c010138f:	b2 f4                	mov    $0xf4,%dl
c0101391:	c1 e8 08             	shr    $0x8,%eax
c0101394:	ee                   	out    %al,(%dx)
c0101395:	89 c8                	mov    %ecx,%eax
c0101397:	b2 f5                	mov    $0xf5,%dl
c0101399:	c1 e8 10             	shr    $0x10,%eax
c010139c:	ee                   	out    %al,(%dx)
c010139d:	89 c8                	mov    %ecx,%eax
c010139f:	b2 f6                	mov    $0xf6,%dl
c01013a1:	c1 e8 18             	shr    $0x18,%eax
c01013a4:	83 c8 e0             	or     $0xffffffe0,%eax
c01013a7:	ee                   	out    %al,(%dx)
c01013a8:	5d                   	pop    %ebp
c01013a9:	c3                   	ret    
c01013aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01013b0 <disk_do_read>:
c01013b0:	55                   	push   %ebp
c01013b1:	89 e5                	mov    %esp,%ebp
c01013b3:	53                   	push   %ebx
c01013b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013b7:	e8 a4 ff ff ff       	call   c0101360 <ide_prepare>
c01013bc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01013c1:	b8 20 00 00 00       	mov    $0x20,%eax
c01013c6:	ee                   	out    %al,(%dx)
c01013c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01013ca:	b2 f0                	mov    $0xf0,%dl
c01013cc:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01013d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01013d8:	ed                   	in     (%dx),%eax
c01013d9:	89 01                	mov    %eax,(%ecx)
c01013db:	83 c1 04             	add    $0x4,%ecx
c01013de:	39 d9                	cmp    %ebx,%ecx
c01013e0:	75 f6                	jne    c01013d8 <disk_do_read+0x28>
c01013e2:	5b                   	pop    %ebx
c01013e3:	5d                   	pop    %ebp
c01013e4:	c3                   	ret    
c01013e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01013f0 <disk_do_write>:
c01013f0:	55                   	push   %ebp
c01013f1:	89 e5                	mov    %esp,%ebp
c01013f3:	53                   	push   %ebx
c01013f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013f7:	e8 64 ff ff ff       	call   c0101360 <ide_prepare>
c01013fc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101401:	b8 30 00 00 00       	mov    $0x30,%eax
c0101406:	ee                   	out    %al,(%dx)
c0101407:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010140a:	b2 f0                	mov    $0xf0,%dl
c010140c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101418:	8b 01                	mov    (%ecx),%eax
c010141a:	ef                   	out    %eax,(%dx)
c010141b:	83 c1 04             	add    $0x4,%ecx
c010141e:	39 d9                	cmp    %ebx,%ecx
c0101420:	75 f6                	jne    c0101418 <disk_do_write+0x28>
c0101422:	5b                   	pop    %ebx
c0101423:	5d                   	pop    %ebp
c0101424:	c3                   	ret    
c0101425:	66 90                	xchg   %ax,%ax
c0101427:	66 90                	xchg   %ax,%ax
c0101429:	66 90                	xchg   %ax,%ax
c010142b:	66 90                	xchg   %ax,%ax
c010142d:	66 90                	xchg   %ax,%ax
c010142f:	90                   	nop

c0101430 <dma_prepare>:
c0101430:	55                   	push   %ebp
c0101431:	89 e5                	mov    %esp,%ebp
c0101433:	83 ec 08             	sub    $0x8,%esp
c0101436:	68 0c 81 10 c0       	push   $0xc010810c
c010143b:	6a 1d                	push   $0x1d
c010143d:	68 a3 80 10 c0       	push   $0xc01080a3
c0101442:	68 c0 80 10 c0       	push   $0xc01080c0
c0101447:	e8 24 fb ff ff       	call   c0100f70 <printk>
c010144c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101451:	d6                   	(bad)  
c0101452:	83 c4 10             	add    $0x10,%esp
c0101455:	c9                   	leave  
c0101456:	c3                   	ret    
c0101457:	89 f6                	mov    %esi,%esi
c0101459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101460 <dma_issue_read>:
c0101460:	55                   	push   %ebp
c0101461:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101466:	89 e5                	mov    %esp,%ebp
c0101468:	ec                   	in     (%dx),%al
c0101469:	83 c8 09             	or     $0x9,%eax
c010146c:	ee                   	out    %al,(%dx)
c010146d:	5d                   	pop    %ebp
c010146e:	c3                   	ret    
c010146f:	90                   	nop

c0101470 <memcpy>:
c0101470:	55                   	push   %ebp
c0101471:	89 e5                	mov    %esp,%ebp
c0101473:	56                   	push   %esi
c0101474:	57                   	push   %edi
c0101475:	53                   	push   %ebx
c0101476:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101479:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010147c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010147f:	fc                   	cld    
c0101480:	83 f9 08             	cmp    $0x8,%ecx
c0101483:	76 26                	jbe    c01014ab <memcpy+0x3b>
c0101485:	89 fa                	mov    %edi,%edx
c0101487:	89 cb                	mov    %ecx,%ebx
c0101489:	83 e2 03             	and    $0x3,%edx
c010148c:	74 10                	je     c010149e <memcpy+0x2e>
c010148e:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101493:	29 d1                	sub    %edx,%ecx
c0101495:	83 e1 03             	and    $0x3,%ecx
c0101498:	29 cb                	sub    %ecx,%ebx
c010149a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010149c:	89 d9                	mov    %ebx,%ecx
c010149e:	c1 e9 02             	shr    $0x2,%ecx
c01014a1:	8d 76 00             	lea    0x0(%esi),%esi
c01014a4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01014a6:	89 d9                	mov    %ebx,%ecx
c01014a8:	83 e1 03             	and    $0x3,%ecx
c01014ab:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01014ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01014b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01014b3:	5b                   	pop    %ebx
c01014b4:	5f                   	pop    %edi
c01014b5:	5e                   	pop    %esi
c01014b6:	c9                   	leave  
c01014b7:	c3                   	ret    

c01014b8 <memset>:
c01014b8:	55                   	push   %ebp
c01014b9:	89 e5                	mov    %esp,%ebp
c01014bb:	57                   	push   %edi
c01014bc:	8b 7d 08             	mov    0x8(%ebp),%edi
c01014bf:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01014c3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01014c6:	fc                   	cld    
c01014c7:	83 f9 10             	cmp    $0x10,%ecx
c01014ca:	76 69                	jbe    c0101535 <memset+0x7d>
c01014cc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014d2:	74 4c                	je     c0101520 <memset+0x68>
c01014d4:	88 07                	mov    %al,(%edi)
c01014d6:	47                   	inc    %edi
c01014d7:	49                   	dec    %ecx
c01014d8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014de:	74 40                	je     c0101520 <memset+0x68>
c01014e0:	88 07                	mov    %al,(%edi)
c01014e2:	47                   	inc    %edi
c01014e3:	49                   	dec    %ecx
c01014e4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014ea:	74 34                	je     c0101520 <memset+0x68>
c01014ec:	88 07                	mov    %al,(%edi)
c01014ee:	47                   	inc    %edi
c01014ef:	49                   	dec    %ecx
c01014f0:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014f6:	74 28                	je     c0101520 <memset+0x68>
c01014f8:	88 07                	mov    %al,(%edi)
c01014fa:	47                   	inc    %edi
c01014fb:	49                   	dec    %ecx
c01014fc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101502:	74 1c                	je     c0101520 <memset+0x68>
c0101504:	88 07                	mov    %al,(%edi)
c0101506:	47                   	inc    %edi
c0101507:	49                   	dec    %ecx
c0101508:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010150e:	74 10                	je     c0101520 <memset+0x68>
c0101510:	88 07                	mov    %al,(%edi)
c0101512:	47                   	inc    %edi
c0101513:	49                   	dec    %ecx
c0101514:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010151a:	74 04                	je     c0101520 <memset+0x68>
c010151c:	88 07                	mov    %al,(%edi)
c010151e:	47                   	inc    %edi
c010151f:	49                   	dec    %ecx
c0101520:	88 c4                	mov    %al,%ah
c0101522:	89 c2                	mov    %eax,%edx
c0101524:	c1 e2 10             	shl    $0x10,%edx
c0101527:	09 d0                	or     %edx,%eax
c0101529:	89 ca                	mov    %ecx,%edx
c010152b:	c1 e9 02             	shr    $0x2,%ecx
c010152e:	83 e2 03             	and    $0x3,%edx
c0101531:	f3 ab                	rep stos %eax,%es:(%edi)
c0101533:	89 d1                	mov    %edx,%ecx
c0101535:	f3 aa                	rep stos %al,%es:(%edi)
c0101537:	8b 45 08             	mov    0x8(%ebp),%eax
c010153a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010153d:	5f                   	pop    %edi
c010153e:	c9                   	leave  
c010153f:	c3                   	ret    

c0101540 <_vsnprintf_r>:
c0101540:	55                   	push   %ebp
c0101541:	89 e5                	mov    %esp,%ebp
c0101543:	56                   	push   %esi
c0101544:	53                   	push   %ebx
c0101545:	83 c4 80             	add    $0xffffff80,%esp
c0101548:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010154b:	8b 75 08             	mov    0x8(%ebp),%esi
c010154e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101551:	85 db                	test   %ebx,%ebx
c0101553:	78 63                	js     c01015b8 <_vsnprintf_r+0x78>
c0101555:	ba 08 02 00 00       	mov    $0x208,%edx
c010155a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c010155f:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c0101563:	8d 53 ff             	lea    -0x1(%ebx),%edx
c0101566:	89 45 90             	mov    %eax,-0x70(%ebp)
c0101569:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010156c:	31 c0                	xor    %eax,%eax
c010156e:	85 db                	test   %ebx,%ebx
c0101570:	0f 45 c2             	cmovne %edx,%eax
c0101573:	89 45 98             	mov    %eax,-0x68(%ebp)
c0101576:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0101579:	8b 45 18             	mov    0x18(%ebp),%eax
c010157c:	89 34 24             	mov    %esi,(%esp)
c010157f:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c0101583:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101587:	8b 45 14             	mov    0x14(%ebp),%eax
c010158a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010158e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0101591:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101595:	e8 86 00 00 00       	call   c0101620 <_svfprintf_r>
c010159a:	83 f8 ff             	cmp    $0xffffffff,%eax
c010159d:	7c 11                	jl     c01015b0 <_vsnprintf_r+0x70>
c010159f:	85 db                	test   %ebx,%ebx
c01015a1:	74 06                	je     c01015a9 <_vsnprintf_r+0x69>
c01015a3:	8b 55 90             	mov    -0x70(%ebp),%edx
c01015a6:	c6 02 00             	movb   $0x0,(%edx)
c01015a9:	83 ec 80             	sub    $0xffffff80,%esp
c01015ac:	5b                   	pop    %ebx
c01015ad:	5e                   	pop    %esi
c01015ae:	5d                   	pop    %ebp
c01015af:	c3                   	ret    
c01015b0:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c01015b6:	eb e7                	jmp    c010159f <_vsnprintf_r+0x5f>
c01015b8:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c01015be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01015c3:	eb e4                	jmp    c01015a9 <_vsnprintf_r+0x69>
c01015c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01015c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01015d0 <vsnprintf>:
c01015d0:	55                   	push   %ebp
c01015d1:	89 e5                	mov    %esp,%ebp
c01015d3:	83 ec 28             	sub    $0x28,%esp
c01015d6:	e8 35 00 00 00       	call   c0101610 <__getreent>
c01015db:	8b 55 14             	mov    0x14(%ebp),%edx
c01015de:	89 54 24 10          	mov    %edx,0x10(%esp)
c01015e2:	8b 55 10             	mov    0x10(%ebp),%edx
c01015e5:	89 04 24             	mov    %eax,(%esp)
c01015e8:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01015ec:	8b 55 0c             	mov    0xc(%ebp),%edx
c01015ef:	89 54 24 08          	mov    %edx,0x8(%esp)
c01015f3:	8b 55 08             	mov    0x8(%ebp),%edx
c01015f6:	89 54 24 04          	mov    %edx,0x4(%esp)
c01015fa:	e8 41 ff ff ff       	call   c0101540 <_vsnprintf_r>
c01015ff:	c9                   	leave  
c0101600:	c3                   	ret    
c0101601:	66 90                	xchg   %ax,%ax
c0101603:	66 90                	xchg   %ax,%ax
c0101605:	66 90                	xchg   %ax,%ax
c0101607:	66 90                	xchg   %ax,%ax
c0101609:	66 90                	xchg   %ax,%ax
c010160b:	66 90                	xchg   %ax,%ax
c010160d:	66 90                	xchg   %ax,%ax
c010160f:	90                   	nop

c0101610 <__getreent>:
c0101610:	55                   	push   %ebp
c0101611:	a1 a0 a5 10 c0       	mov    0xc010a5a0,%eax
c0101616:	89 e5                	mov    %esp,%ebp
c0101618:	5d                   	pop    %ebp
c0101619:	c3                   	ret    
c010161a:	66 90                	xchg   %ax,%ax
c010161c:	66 90                	xchg   %ax,%ax
c010161e:	66 90                	xchg   %ax,%ax

c0101620 <_svfprintf_r>:
c0101620:	55                   	push   %ebp
c0101621:	89 e5                	mov    %esp,%ebp
c0101623:	57                   	push   %edi
c0101624:	56                   	push   %esi
c0101625:	53                   	push   %ebx
c0101626:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c010162c:	8b 45 08             	mov    0x8(%ebp),%eax
c010162f:	89 04 24             	mov    %eax,(%esp)
c0101632:	e8 89 33 00 00       	call   c01049c0 <_localeconv_r>
c0101637:	8b 00                	mov    (%eax),%eax
c0101639:	89 04 24             	mov    %eax,(%esp)
c010163c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c0101642:	e8 d9 4a 00 00       	call   c0106120 <strlen>
c0101647:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c010164d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101650:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0101654:	74 0b                	je     c0101661 <_svfprintf_r+0x41>
c0101656:	8b 40 10             	mov    0x10(%eax),%eax
c0101659:	85 c0                	test   %eax,%eax
c010165b:	0f 84 62 18 00 00    	je     c0102ec3 <_svfprintf_r+0x18a3>
c0101661:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101664:	8d 55 a7             	lea    -0x59(%ebp),%edx
c0101667:	89 c7                	mov    %eax,%edi
c0101669:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c010166f:	90                   	nop
c0101670:	90                   	nop
c0101671:	29 d0                	sub    %edx,%eax
c0101673:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c010167a:	00 00 00 
c010167d:	90                   	nop
c010167e:	90                   	nop
c010167f:	90                   	nop
c0101680:	90                   	nop
c0101681:	90                   	nop
c0101682:	90                   	nop
c0101683:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c010168a:	00 00 00 
c010168d:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c0101694:	00 00 00 
c0101697:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c010169e:	00 00 00 
c01016a1:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c01016a8:	00 00 00 
c01016ab:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c01016b2:	00 00 00 
c01016b5:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c01016bb:	8b 45 10             	mov    0x10(%ebp),%eax
c01016be:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01016c1:	0f b6 00             	movzbl (%eax),%eax
c01016c4:	3c 25                	cmp    $0x25,%al
c01016c6:	74 4d                	je     c0101715 <_svfprintf_r+0xf5>
c01016c8:	84 c0                	test   %al,%al
c01016ca:	75 08                	jne    c01016d4 <_svfprintf_r+0xb4>
c01016cc:	eb 47                	jmp    c0101715 <_svfprintf_r+0xf5>
c01016ce:	66 90                	xchg   %ax,%ax
c01016d0:	84 c0                	test   %al,%al
c01016d2:	74 0a                	je     c01016de <_svfprintf_r+0xbe>
c01016d4:	83 c3 01             	add    $0x1,%ebx
c01016d7:	0f b6 03             	movzbl (%ebx),%eax
c01016da:	3c 25                	cmp    $0x25,%al
c01016dc:	75 f2                	jne    c01016d0 <_svfprintf_r+0xb0>
c01016de:	89 de                	mov    %ebx,%esi
c01016e0:	2b 75 10             	sub    0x10(%ebp),%esi
c01016e3:	74 30                	je     c0101715 <_svfprintf_r+0xf5>
c01016e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01016e8:	83 c7 08             	add    $0x8,%edi
c01016eb:	89 77 fc             	mov    %esi,-0x4(%edi)
c01016ee:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c01016f4:	89 47 f8             	mov    %eax,-0x8(%edi)
c01016f7:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01016fd:	83 c0 01             	add    $0x1,%eax
c0101700:	83 f8 07             	cmp    $0x7,%eax
c0101703:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101709:	0f 8f 91 00 00 00    	jg     c01017a0 <_svfprintf_r+0x180>
c010170f:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c0101715:	80 3b 00             	cmpb   $0x0,(%ebx)
c0101718:	0f 84 aa 00 00 00    	je     c01017c8 <_svfprintf_r+0x1a8>
c010171e:	8d 43 01             	lea    0x1(%ebx),%eax
c0101721:	be 20 00 00 00       	mov    $0x20,%esi
c0101726:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010172d:	31 db                	xor    %ebx,%ebx
c010172f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0101736:	ff ff ff 
c0101739:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101740:	00 00 00 
c0101743:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c010174a:	00 00 00 
c010174d:	8d 48 01             	lea    0x1(%eax),%ecx
c0101750:	0f be 00             	movsbl (%eax),%eax
c0101753:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101756:	83 fa 58             	cmp    $0x58,%edx
c0101759:	0f 87 8f 07 00 00    	ja     c0101eee <_svfprintf_r+0x8ce>
c010175f:	ff 24 95 5c 81 10 c0 	jmp    *-0x3fef7ea4(,%edx,4)
c0101766:	66 90                	xchg   %ax,%ax
c0101768:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c010176f:	89 c8                	mov    %ecx,%eax
c0101771:	eb da                	jmp    c010174d <_svfprintf_r+0x12d>
c0101773:	8b 45 14             	mov    0x14(%ebp),%eax
c0101776:	8b 55 14             	mov    0x14(%ebp),%edx
c0101779:	8b 00                	mov    (%eax),%eax
c010177b:	83 c2 04             	add    $0x4,%edx
c010177e:	89 55 14             	mov    %edx,0x14(%ebp)
c0101781:	85 c0                	test   %eax,%eax
c0101783:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c0101789:	79 e4                	jns    c010176f <_svfprintf_r+0x14f>
c010178b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c0101791:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c0101798:	89 c8                	mov    %ecx,%eax
c010179a:	eb b1                	jmp    c010174d <_svfprintf_r+0x12d>
c010179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01017a0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01017a6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01017aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017ad:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01017b4:	89 04 24             	mov    %eax,(%esp)
c01017b7:	e8 e4 49 00 00       	call   c01061a0 <__ssprint_r>
c01017bc:	85 c0                	test   %eax,%eax
c01017be:	75 30                	jne    c01017f0 <_svfprintf_r+0x1d0>
c01017c0:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01017c3:	e9 47 ff ff ff       	jmp    c010170f <_svfprintf_r+0xef>
c01017c8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01017ce:	85 c0                	test   %eax,%eax
c01017d0:	74 1e                	je     c01017f0 <_svfprintf_r+0x1d0>
c01017d2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01017d8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01017dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017df:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01017e6:	89 04 24             	mov    %eax,(%esp)
c01017e9:	e8 b2 49 00 00       	call   c01061a0 <__ssprint_r>
c01017ee:	66 90                	xchg   %ax,%ax
c01017f0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01017f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01017f8:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c01017fc:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c0101803:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c0101809:	5b                   	pop    %ebx
c010180a:	5e                   	pop    %esi
c010180b:	5f                   	pop    %edi
c010180c:	5d                   	pop    %ebp
c010180d:	c3                   	ret    
c010180e:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0101813:	89 c8                	mov    %ecx,%eax
c0101815:	e9 33 ff ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c010181a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101820:	8b 45 14             	mov    0x14(%ebp),%eax
c0101823:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101826:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010182d:	8d 70 04             	lea    0x4(%eax),%esi
c0101830:	8b 00                	mov    (%eax),%eax
c0101832:	85 c0                	test   %eax,%eax
c0101834:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010183a:	0f 84 7f 18 00 00    	je     c01030bf <_svfprintf_r+0x1a9f>
c0101840:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101846:	85 c0                	test   %eax,%eax
c0101848:	0f 88 b6 17 00 00    	js     c0103004 <_svfprintf_r+0x19e4>
c010184e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101852:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0101858:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010185f:	00 
c0101860:	89 04 24             	mov    %eax,(%esp)
c0101863:	e8 f8 38 00 00       	call   c0105160 <memchr>
c0101868:	85 c0                	test   %eax,%eax
c010186a:	0f 84 a0 19 00 00    	je     c0103210 <_svfprintf_r+0x1bf0>
c0101870:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101876:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010187c:	39 d0                	cmp    %edx,%eax
c010187e:	0f 4f c2             	cmovg  %edx,%eax
c0101881:	89 c2                	mov    %eax,%edx
c0101883:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010188a:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0101890:	31 c0                	xor    %eax,%eax
c0101892:	85 d2                	test   %edx,%edx
c0101894:	0f 49 c2             	cmovns %edx,%eax
c0101897:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c010189d:	89 75 14             	mov    %esi,0x14(%ebp)
c01018a0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01018a7:	00 00 00 
c01018aa:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01018b1:	00 00 00 
c01018b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018b8:	84 db                	test   %bl,%bl
c01018ba:	74 07                	je     c01018c3 <_svfprintf_r+0x2a3>
c01018bc:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c01018c3:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01018c9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01018cf:	89 c8                	mov    %ecx,%eax
c01018d1:	89 f2                	mov    %esi,%edx
c01018d3:	83 c0 02             	add    $0x2,%eax
c01018d6:	83 e2 02             	and    $0x2,%edx
c01018d9:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c01018df:	89 f2                	mov    %esi,%edx
c01018e1:	0f 44 c1             	cmove  %ecx,%eax
c01018e4:	81 e2 84 00 00 00    	and    $0x84,%edx
c01018ea:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01018f0:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c01018f6:	0f 85 1c 06 00 00    	jne    c0101f18 <_svfprintf_r+0x8f8>
c01018fc:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0101902:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0101908:	85 f6                	test   %esi,%esi
c010190a:	0f 8e 08 06 00 00    	jle    c0101f18 <_svfprintf_r+0x8f8>
c0101910:	83 fe 10             	cmp    $0x10,%esi
c0101913:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101919:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010191f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101925:	7f 11                	jg     c0101938 <_svfprintf_r+0x318>
c0101927:	eb 6b                	jmp    c0101994 <_svfprintf_r+0x374>
c0101929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101930:	83 ee 10             	sub    $0x10,%esi
c0101933:	83 fe 10             	cmp    $0x10,%esi
c0101936:	7e 5c                	jle    c0101994 <_svfprintf_r+0x374>
c0101938:	83 c0 01             	add    $0x1,%eax
c010193b:	83 c1 10             	add    $0x10,%ecx
c010193e:	c7 07 d0 82 10 c0    	movl   $0xc01082d0,(%edi)
c0101944:	83 c7 08             	add    $0x8,%edi
c0101947:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010194e:	83 f8 07             	cmp    $0x7,%eax
c0101951:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101957:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010195d:	7e d1                	jle    c0101930 <_svfprintf_r+0x310>
c010195f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101962:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0101966:	89 44 24 04          	mov    %eax,0x4(%esp)
c010196a:	8b 45 08             	mov    0x8(%ebp),%eax
c010196d:	89 04 24             	mov    %eax,(%esp)
c0101970:	e8 2b 48 00 00       	call   c01061a0 <__ssprint_r>
c0101975:	85 c0                	test   %eax,%eax
c0101977:	0f 85 73 fe ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010197d:	83 ee 10             	sub    $0x10,%esi
c0101980:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101986:	83 fe 10             	cmp    $0x10,%esi
c0101989:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010198f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101992:	7f a4                	jg     c0101938 <_svfprintf_r+0x318>
c0101994:	83 c0 01             	add    $0x1,%eax
c0101997:	01 f1                	add    %esi,%ecx
c0101999:	83 f8 07             	cmp    $0x7,%eax
c010199c:	c7 07 d0 82 10 c0    	movl   $0xc01082d0,(%edi)
c01019a2:	89 77 04             	mov    %esi,0x4(%edi)
c01019a5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01019ab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01019b1:	0f 8f 16 0e 00 00    	jg     c01027cd <_svfprintf_r+0x11ad>
c01019b7:	83 c7 08             	add    $0x8,%edi
c01019ba:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01019c1:	e9 58 05 00 00       	jmp    c0101f1e <_svfprintf_r+0x8fe>
c01019c6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01019cd:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01019d3:	8b 45 14             	mov    0x14(%ebp),%eax
c01019d6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01019d9:	0f 85 fd 04 00 00    	jne    c0101edc <_svfprintf_r+0x8bc>
c01019df:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01019e6:	0f 84 f0 04 00 00    	je     c0101edc <_svfprintf_r+0x8bc>
c01019ec:	0f b7 08             	movzwl (%eax),%ecx
c01019ef:	83 c0 04             	add    $0x4,%eax
c01019f2:	89 45 14             	mov    %eax,0x14(%ebp)
c01019f5:	b8 01 00 00 00       	mov    $0x1,%eax
c01019fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101a00:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101a07:	31 db                	xor    %ebx,%ebx
c0101a09:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c0101a0f:	89 f2                	mov    %esi,%edx
c0101a11:	80 e2 7f             	and    $0x7f,%dl
c0101a14:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c0101a1b:	0f 48 d6             	cmovs  %esi,%edx
c0101a1e:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c0101a24:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101a2a:	85 d2                	test   %edx,%edx
c0101a2c:	75 08                	jne    c0101a36 <_svfprintf_r+0x416>
c0101a2e:	85 c9                	test   %ecx,%ecx
c0101a30:	0f 84 ea 08 00 00    	je     c0102320 <_svfprintf_r+0xd00>
c0101a36:	3c 01                	cmp    $0x1,%al
c0101a38:	0f 84 6a 0d 00 00    	je     c01027a8 <_svfprintf_r+0x1188>
c0101a3e:	3c 02                	cmp    $0x2,%al
c0101a40:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101a43:	0f 85 bf 0b 00 00    	jne    c0102608 <_svfprintf_r+0xfe8>
c0101a49:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c0101a4f:	90                   	nop
c0101a50:	89 ca                	mov    %ecx,%edx
c0101a52:	83 e8 01             	sub    $0x1,%eax
c0101a55:	83 e2 0f             	and    $0xf,%edx
c0101a58:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c0101a5c:	c1 e9 04             	shr    $0x4,%ecx
c0101a5f:	85 c9                	test   %ecx,%ecx
c0101a61:	88 10                	mov    %dl,(%eax)
c0101a63:	75 eb                	jne    c0101a50 <_svfprintf_r+0x430>
c0101a65:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0101a68:	29 c2                	sub    %eax,%edx
c0101a6a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101a70:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0101a76:	66 90                	xchg   %ax,%ax
c0101a78:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101a7e:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0101a84:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101a8b:	00 00 00 
c0101a8e:	39 c2                	cmp    %eax,%edx
c0101a90:	0f 4d c2             	cmovge %edx,%eax
c0101a93:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101a99:	e9 1a fe ff ff       	jmp    c01018b8 <_svfprintf_r+0x298>
c0101a9e:	84 db                	test   %bl,%bl
c0101aa0:	89 c8                	mov    %ecx,%eax
c0101aa2:	0f 44 de             	cmove  %esi,%ebx
c0101aa5:	e9 a3 fc ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c0101aaa:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0101ab1:	89 c8                	mov    %ecx,%eax
c0101ab3:	e9 95 fc ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c0101ab8:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c0101abf:	00 00 00 
c0101ac2:	89 c8                	mov    %ecx,%eax
c0101ac4:	e9 84 fc ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c0101ac9:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101acf:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101ad2:	31 ff                	xor    %edi,%edi
c0101ad4:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101adb:	00 00 00 
c0101ade:	66 90                	xchg   %ax,%ax
c0101ae0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c0101ae3:	83 c1 01             	add    $0x1,%ecx
c0101ae6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c0101ae9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c0101aed:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101af0:	83 fa 09             	cmp    $0x9,%edx
c0101af3:	76 eb                	jbe    c0101ae0 <_svfprintf_r+0x4c0>
c0101af5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c0101afb:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101b01:	e9 4d fc ff ff       	jmp    c0101753 <_svfprintf_r+0x133>
c0101b06:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101b0d:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101b14:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b1a:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b1d:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b20:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101b26:	0f 85 61 02 00 00    	jne    c0101d8d <_svfprintf_r+0x76d>
c0101b2c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101b33:	0f 84 54 02 00 00    	je     c0101d8d <_svfprintf_r+0x76d>
c0101b39:	0f bf 08             	movswl (%eax),%ecx
c0101b3c:	83 c0 04             	add    $0x4,%eax
c0101b3f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b42:	85 c9                	test   %ecx,%ecx
c0101b44:	0f 88 53 02 00 00    	js     c0101d9d <_svfprintf_r+0x77d>
c0101b4a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101b51:	b8 01 00 00 00       	mov    $0x1,%eax
c0101b56:	e9 ae fe ff ff       	jmp    c0101a09 <_svfprintf_r+0x3e9>
c0101b5b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0101b62:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b68:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b6b:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b6e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101b74:	0f 84 15 10 00 00    	je     c0102b8f <_svfprintf_r+0x156f>
c0101b7a:	db 28                	fldt   (%eax)
c0101b7c:	83 c0 0c             	add    $0xc,%eax
c0101b7f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b82:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0101b88:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101b8e:	dd 1c 24             	fstpl  (%esp)
c0101b91:	e8 aa 44 00 00       	call   c0106040 <__fpclassifyd>
c0101b96:	83 f8 01             	cmp    $0x1,%eax
c0101b99:	0f 85 82 0f 00 00    	jne    c0102b21 <_svfprintf_r+0x1501>
c0101b9f:	d9 ee                	fldz   
c0101ba1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101ba7:	d9 c9                	fxch   %st(1)
c0101ba9:	df e9                	fucomip %st(1),%st
c0101bab:	dd d8                	fstp   %st(0)
c0101bad:	0f 87 59 15 00 00    	ja     c010310c <_svfprintf_r+0x1aec>
c0101bb3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101bba:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0101bc1:	ba 1e 81 10 c0       	mov    $0xc010811e,%edx
c0101bc6:	b8 22 81 10 c0       	mov    $0xc0108122,%eax
c0101bcb:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0101bd2:	00 00 00 
c0101bd5:	0f 4e c2             	cmovle %edx,%eax
c0101bd8:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101bde:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0101be5:	ff ff ff 
c0101be8:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0101bef:	00 00 00 
c0101bf2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101bf9:	00 00 00 
c0101bfc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101c03:	00 00 00 
c0101c06:	e9 ad fc ff ff       	jmp    c01018b8 <_svfprintf_r+0x298>
c0101c0b:	8d 41 01             	lea    0x1(%ecx),%eax
c0101c0e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101c14:	0f be 01             	movsbl (%ecx),%eax
c0101c17:	83 f8 2a             	cmp    $0x2a,%eax
c0101c1a:	0f 84 84 18 00 00    	je     c01034a4 <_svfprintf_r+0x1e84>
c0101c20:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c23:	31 c9                	xor    %ecx,%ecx
c0101c25:	83 fa 09             	cmp    $0x9,%edx
c0101c28:	0f 87 a8 16 00 00    	ja     c01032d6 <_svfprintf_r+0x1cb6>
c0101c2e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c0101c34:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101c40:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0101c43:	83 c7 01             	add    $0x1,%edi
c0101c46:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0101c49:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c0101c4d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c50:	83 fa 09             	cmp    $0x9,%edx
c0101c53:	76 eb                	jbe    c0101c40 <_svfprintf_r+0x620>
c0101c55:	85 c9                	test   %ecx,%ecx
c0101c57:	89 ca                	mov    %ecx,%edx
c0101c59:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101c5e:	0f 48 d1             	cmovs  %ecx,%edx
c0101c61:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101c67:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c0101c6d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101c73:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0101c79:	e9 d5 fa ff ff       	jmp    c0101753 <_svfprintf_r+0x133>
c0101c7e:	8b 45 14             	mov    0x14(%ebp),%eax
c0101c81:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101c84:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101c8b:	8b 08                	mov    (%eax),%ecx
c0101c8d:	83 c0 04             	add    $0x4,%eax
c0101c90:	89 45 14             	mov    %eax,0x14(%ebp)
c0101c93:	b8 02 00 00 00       	mov    $0x2,%eax
c0101c98:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101c9f:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0101ca6:	c7 85 18 ff ff ff 3f 	movl   $0xc010813f,-0xe8(%ebp)
c0101cad:	81 10 c0 
c0101cb0:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0101cb7:	00 00 00 
c0101cba:	e9 41 fd ff ff       	jmp    c0101a00 <_svfprintf_r+0x3e0>
c0101cbf:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101cc6:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ccc:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ccf:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101cd2:	0f 85 87 00 00 00    	jne    c0101d5f <_svfprintf_r+0x73f>
c0101cd8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101cdf:	74 7e                	je     c0101d5f <_svfprintf_r+0x73f>
c0101ce1:	0f b7 08             	movzwl (%eax),%ecx
c0101ce4:	83 c0 04             	add    $0x4,%eax
c0101ce7:	89 45 14             	mov    %eax,0x14(%ebp)
c0101cea:	31 c0                	xor    %eax,%eax
c0101cec:	e9 0f fd ff ff       	jmp    c0101a00 <_svfprintf_r+0x3e0>
c0101cf1:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c0101cf8:	89 c8                	mov    %ecx,%eax
c0101cfa:	e9 4e fa ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c0101cff:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d06:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d09:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101d0f:	0f 85 97 0b 00 00    	jne    c01028ac <_svfprintf_r+0x128c>
c0101d15:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101d1c:	0f 84 8a 0b 00 00    	je     c01028ac <_svfprintf_r+0x128c>
c0101d22:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d25:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c0101d2c:	8b 00                	mov    (%eax),%eax
c0101d2e:	66 89 10             	mov    %dx,(%eax)
c0101d31:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d34:	83 c0 04             	add    $0x4,%eax
c0101d37:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d3a:	e9 7c f9 ff ff       	jmp    c01016bb <_svfprintf_r+0x9b>
c0101d3f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101d46:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d4d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101d53:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d56:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d59:	0f 84 79 ff ff ff    	je     c0101cd8 <_svfprintf_r+0x6b8>
c0101d5f:	8b 08                	mov    (%eax),%ecx
c0101d61:	83 c0 04             	add    $0x4,%eax
c0101d64:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d67:	31 c0                	xor    %eax,%eax
c0101d69:	e9 92 fc ff ff       	jmp    c0101a00 <_svfprintf_r+0x3e0>
c0101d6e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d75:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101d7b:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d7e:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d81:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101d87:	0f 84 9f fd ff ff    	je     c0101b2c <_svfprintf_r+0x50c>
c0101d8d:	8b 08                	mov    (%eax),%ecx
c0101d8f:	83 c0 04             	add    $0x4,%eax
c0101d92:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d95:	85 c9                	test   %ecx,%ecx
c0101d97:	0f 89 ad fd ff ff    	jns    c0101b4a <_svfprintf_r+0x52a>
c0101d9d:	f7 d9                	neg    %ecx
c0101d9f:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0101da4:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0101dab:	b8 01 00 00 00       	mov    $0x1,%eax
c0101db0:	e9 54 fc ff ff       	jmp    c0101a09 <_svfprintf_r+0x3e9>
c0101db5:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c0101dbc:	89 c8                	mov    %ecx,%eax
c0101dbe:	e9 8a f9 ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c0101dc3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101dca:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101dd0:	8b 45 14             	mov    0x14(%ebp),%eax
c0101dd3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101dd6:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101ddc:	c7 85 18 ff ff ff 3f 	movl   $0xc010813f,-0xe8(%ebp)
c0101de3:	81 10 c0 
c0101de6:	75 71                	jne    c0101e59 <_svfprintf_r+0x839>
c0101de8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101def:	74 68                	je     c0101e59 <_svfprintf_r+0x839>
c0101df1:	0f b7 08             	movzwl (%eax),%ecx
c0101df4:	83 c0 04             	add    $0x4,%eax
c0101df7:	89 45 14             	mov    %eax,0x14(%ebp)
c0101dfa:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0101e01:	b8 02 00 00 00       	mov    $0x2,%eax
c0101e06:	0f 84 f4 fb ff ff    	je     c0101a00 <_svfprintf_r+0x3e0>
c0101e0c:	85 c9                	test   %ecx,%ecx
c0101e0e:	0f 84 ec fb ff ff    	je     c0101a00 <_svfprintf_r+0x3e0>
c0101e14:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c0101e1b:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101e22:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101e29:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c0101e2f:	e9 cc fb ff ff       	jmp    c0101a00 <_svfprintf_r+0x3e0>
c0101e34:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101e3b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e41:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e44:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e47:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101e4d:	c7 85 18 ff ff ff 2e 	movl   $0xc010812e,-0xe8(%ebp)
c0101e54:	81 10 c0 
c0101e57:	74 8f                	je     c0101de8 <_svfprintf_r+0x7c8>
c0101e59:	8b 08                	mov    (%eax),%ecx
c0101e5b:	83 c0 04             	add    $0x4,%eax
c0101e5e:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e61:	eb 97                	jmp    c0101dfa <_svfprintf_r+0x7da>
c0101e63:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e69:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e6c:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e6f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101e76:	8b 00                	mov    (%eax),%eax
c0101e78:	88 45 80             	mov    %al,-0x80(%ebp)
c0101e7b:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e7e:	83 c0 04             	add    $0x4,%eax
c0101e81:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e84:	8d 45 80             	lea    -0x80(%ebp),%eax
c0101e87:	31 db                	xor    %ebx,%ebx
c0101e89:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0101e90:	00 00 00 
c0101e93:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0101e9a:	00 00 00 
c0101e9d:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101ea4:	00 00 00 
c0101ea7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101eae:	00 00 00 
c0101eb1:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101eb7:	e9 07 fa ff ff       	jmp    c01018c3 <_svfprintf_r+0x2a3>
c0101ebc:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101ec3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101eca:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ed0:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ed3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ed6:	0f 84 03 fb ff ff    	je     c01019df <_svfprintf_r+0x3bf>
c0101edc:	8b 08                	mov    (%eax),%ecx
c0101ede:	83 c0 04             	add    $0x4,%eax
c0101ee1:	89 45 14             	mov    %eax,0x14(%ebp)
c0101ee4:	b8 01 00 00 00       	mov    $0x1,%eax
c0101ee9:	e9 12 fb ff ff       	jmp    c0101a00 <_svfprintf_r+0x3e0>
c0101eee:	85 c0                	test   %eax,%eax
c0101ef0:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ef6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ef9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101eff:	0f 84 c3 f8 ff ff    	je     c01017c8 <_svfprintf_r+0x1a8>
c0101f05:	88 45 80             	mov    %al,-0x80(%ebp)
c0101f08:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101f0f:	e9 70 ff ff ff       	jmp    c0101e84 <_svfprintf_r+0x864>
c0101f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101f18:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101f1e:	84 db                	test   %bl,%bl
c0101f20:	74 33                	je     c0101f55 <_svfprintf_r+0x935>
c0101f22:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c0101f28:	83 c1 01             	add    $0x1,%ecx
c0101f2b:	89 07                	mov    %eax,(%edi)
c0101f2d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f33:	83 c7 08             	add    $0x8,%edi
c0101f36:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0101f3d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101f43:	83 c0 01             	add    $0x1,%eax
c0101f46:	83 f8 07             	cmp    $0x7,%eax
c0101f49:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101f4f:	0f 8f 7b 06 00 00    	jg     c01025d0 <_svfprintf_r+0xfb0>
c0101f55:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c0101f5b:	85 db                	test   %ebx,%ebx
c0101f5d:	74 33                	je     c0101f92 <_svfprintf_r+0x972>
c0101f5f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0101f65:	83 c1 02             	add    $0x2,%ecx
c0101f68:	89 07                	mov    %eax,(%edi)
c0101f6a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f70:	83 c7 08             	add    $0x8,%edi
c0101f73:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c0101f7a:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101f80:	83 c0 01             	add    $0x1,%eax
c0101f83:	83 f8 07             	cmp    $0x7,%eax
c0101f86:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101f8c:	0f 8f 06 06 00 00    	jg     c0102598 <_svfprintf_r+0xf78>
c0101f92:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0101f99:	00 00 00 
c0101f9c:	0f 84 c6 03 00 00    	je     c0102368 <_svfprintf_r+0xd48>
c0101fa2:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0101fa8:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c0101fae:	85 f6                	test   %esi,%esi
c0101fb0:	0f 8e d2 00 00 00    	jle    c0102088 <_svfprintf_r+0xa68>
c0101fb6:	83 fe 10             	cmp    $0x10,%esi
c0101fb9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101fbf:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101fc5:	7f 11                	jg     c0101fd8 <_svfprintf_r+0x9b8>
c0101fc7:	eb 6b                	jmp    c0102034 <_svfprintf_r+0xa14>
c0101fc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101fd0:	83 ee 10             	sub    $0x10,%esi
c0101fd3:	83 fe 10             	cmp    $0x10,%esi
c0101fd6:	7e 5c                	jle    c0102034 <_svfprintf_r+0xa14>
c0101fd8:	83 c0 01             	add    $0x1,%eax
c0101fdb:	83 c1 10             	add    $0x10,%ecx
c0101fde:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c0101fe4:	83 c7 08             	add    $0x8,%edi
c0101fe7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0101fee:	83 f8 07             	cmp    $0x7,%eax
c0101ff1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101ff7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101ffd:	7e d1                	jle    c0101fd0 <_svfprintf_r+0x9b0>
c0101fff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102002:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102006:	89 44 24 04          	mov    %eax,0x4(%esp)
c010200a:	8b 45 08             	mov    0x8(%ebp),%eax
c010200d:	89 04 24             	mov    %eax,(%esp)
c0102010:	e8 8b 41 00 00       	call   c01061a0 <__ssprint_r>
c0102015:	85 c0                	test   %eax,%eax
c0102017:	0f 85 d3 f7 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010201d:	83 ee 10             	sub    $0x10,%esi
c0102020:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102026:	83 fe 10             	cmp    $0x10,%esi
c0102029:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010202f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102032:	7f a4                	jg     c0101fd8 <_svfprintf_r+0x9b8>
c0102034:	83 c0 01             	add    $0x1,%eax
c0102037:	01 f1                	add    %esi,%ecx
c0102039:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c010203f:	83 c7 08             	add    $0x8,%edi
c0102042:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102045:	83 f8 07             	cmp    $0x7,%eax
c0102048:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010204e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102054:	7e 32                	jle    c0102088 <_svfprintf_r+0xa68>
c0102056:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010205c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102060:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102063:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102067:	8b 45 08             	mov    0x8(%ebp),%eax
c010206a:	89 04 24             	mov    %eax,(%esp)
c010206d:	e8 2e 41 00 00       	call   c01061a0 <__ssprint_r>
c0102072:	85 c0                	test   %eax,%eax
c0102074:	0f 85 76 f7 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010207a:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102080:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102083:	90                   	nop
c0102084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102088:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c010208f:	01 00 00 
c0102092:	0f 85 50 01 00 00    	jne    c01021e8 <_svfprintf_r+0xbc8>
c0102098:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010209e:	89 07                	mov    %eax,(%edi)
c01020a0:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c01020a6:	01 c1                	add    %eax,%ecx
c01020a8:	89 47 04             	mov    %eax,0x4(%edi)
c01020ab:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020b1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01020b7:	83 c0 01             	add    $0x1,%eax
c01020ba:	83 f8 07             	cmp    $0x7,%eax
c01020bd:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01020c3:	0f 8f 6a 04 00 00    	jg     c0102533 <_svfprintf_r+0xf13>
c01020c9:	83 c7 08             	add    $0x8,%edi
c01020cc:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c01020d3:	0f 84 d7 00 00 00    	je     c01021b0 <_svfprintf_r+0xb90>
c01020d9:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01020df:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01020e5:	85 f6                	test   %esi,%esi
c01020e7:	0f 8e c3 00 00 00    	jle    c01021b0 <_svfprintf_r+0xb90>
c01020ed:	83 fe 10             	cmp    $0x10,%esi
c01020f0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020f6:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01020fc:	7f 0a                	jg     c0102108 <_svfprintf_r+0xae8>
c01020fe:	eb 64                	jmp    c0102164 <_svfprintf_r+0xb44>
c0102100:	83 ee 10             	sub    $0x10,%esi
c0102103:	83 fe 10             	cmp    $0x10,%esi
c0102106:	7e 5c                	jle    c0102164 <_svfprintf_r+0xb44>
c0102108:	83 c0 01             	add    $0x1,%eax
c010210b:	83 c1 10             	add    $0x10,%ecx
c010210e:	c7 07 d0 82 10 c0    	movl   $0xc01082d0,(%edi)
c0102114:	83 c7 08             	add    $0x8,%edi
c0102117:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010211e:	83 f8 07             	cmp    $0x7,%eax
c0102121:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102127:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010212d:	7e d1                	jle    c0102100 <_svfprintf_r+0xae0>
c010212f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102132:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102136:	89 44 24 04          	mov    %eax,0x4(%esp)
c010213a:	8b 45 08             	mov    0x8(%ebp),%eax
c010213d:	89 04 24             	mov    %eax,(%esp)
c0102140:	e8 5b 40 00 00       	call   c01061a0 <__ssprint_r>
c0102145:	85 c0                	test   %eax,%eax
c0102147:	0f 85 a3 f6 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010214d:	83 ee 10             	sub    $0x10,%esi
c0102150:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102156:	83 fe 10             	cmp    $0x10,%esi
c0102159:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010215f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102162:	7f a4                	jg     c0102108 <_svfprintf_r+0xae8>
c0102164:	83 c0 01             	add    $0x1,%eax
c0102167:	01 f1                	add    %esi,%ecx
c0102169:	83 f8 07             	cmp    $0x7,%eax
c010216c:	c7 07 d0 82 10 c0    	movl   $0xc01082d0,(%edi)
c0102172:	89 77 04             	mov    %esi,0x4(%edi)
c0102175:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010217b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102181:	7e 2d                	jle    c01021b0 <_svfprintf_r+0xb90>
c0102183:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102189:	89 44 24 08          	mov    %eax,0x8(%esp)
c010218d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102190:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102194:	8b 45 08             	mov    0x8(%ebp),%eax
c0102197:	89 04 24             	mov    %eax,(%esp)
c010219a:	e8 01 40 00 00       	call   c01061a0 <__ssprint_r>
c010219f:	85 c0                	test   %eax,%eax
c01021a1:	0f 85 49 f6 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01021a7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01021ad:	8d 76 00             	lea    0x0(%esi),%esi
c01021b0:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c01021b6:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c01021bc:	39 c2                	cmp    %eax,%edx
c01021be:	0f 4d c2             	cmovge %edx,%eax
c01021c1:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c01021c7:	85 c9                	test   %ecx,%ecx
c01021c9:	0f 85 99 03 00 00    	jne    c0102568 <_svfprintf_r+0xf48>
c01021cf:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01021d6:	00 00 00 
c01021d9:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01021dc:	e9 da f4 ff ff       	jmp    c01016bb <_svfprintf_r+0x9b>
c01021e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01021e8:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c01021ef:	0f 8e 5b 02 00 00    	jle    c0102450 <_svfprintf_r+0xe30>
c01021f5:	d9 ee                	fldz   
c01021f7:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01021fd:	df e9                	fucomip %st(1),%st
c01021ff:	dd d8                	fstp   %st(0)
c0102201:	0f 8a 59 04 00 00    	jp     c0102660 <_svfprintf_r+0x1040>
c0102207:	0f 85 53 04 00 00    	jne    c0102660 <_svfprintf_r+0x1040>
c010220d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102213:	83 c1 01             	add    $0x1,%ecx
c0102216:	83 c7 08             	add    $0x8,%edi
c0102219:	c7 47 f8 57 81 10 c0 	movl   $0xc0108157,-0x8(%edi)
c0102220:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102227:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010222d:	83 c0 01             	add    $0x1,%eax
c0102230:	83 f8 07             	cmp    $0x7,%eax
c0102233:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102239:	0f 8f 63 09 00 00    	jg     c0102ba2 <_svfprintf_r+0x1582>
c010223f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102245:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c010224b:	7c 0d                	jl     c010225a <_svfprintf_r+0xc3a>
c010224d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102254:	0f 84 72 fe ff ff    	je     c01020cc <_svfprintf_r+0xaac>
c010225a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102260:	83 c7 08             	add    $0x8,%edi
c0102263:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102266:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010226c:	89 47 fc             	mov    %eax,-0x4(%edi)
c010226f:	01 c1                	add    %eax,%ecx
c0102271:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102277:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010227d:	83 c0 01             	add    $0x1,%eax
c0102280:	83 f8 07             	cmp    $0x7,%eax
c0102283:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102289:	0f 8f dc 0b 00 00    	jg     c0102e6b <_svfprintf_r+0x184b>
c010228f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102295:	8d 70 ff             	lea    -0x1(%eax),%esi
c0102298:	85 f6                	test   %esi,%esi
c010229a:	0f 8e 2c fe ff ff    	jle    c01020cc <_svfprintf_r+0xaac>
c01022a0:	83 fe 10             	cmp    $0x10,%esi
c01022a3:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01022a9:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01022af:	7f 13                	jg     c01022c4 <_svfprintf_r+0xca4>
c01022b1:	e9 e6 05 00 00       	jmp    c010289c <_svfprintf_r+0x127c>
c01022b6:	66 90                	xchg   %ax,%ax
c01022b8:	83 ee 10             	sub    $0x10,%esi
c01022bb:	83 fe 10             	cmp    $0x10,%esi
c01022be:	0f 8e d8 05 00 00    	jle    c010289c <_svfprintf_r+0x127c>
c01022c4:	83 c0 01             	add    $0x1,%eax
c01022c7:	83 c1 10             	add    $0x10,%ecx
c01022ca:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01022d0:	83 c7 08             	add    $0x8,%edi
c01022d3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01022da:	83 f8 07             	cmp    $0x7,%eax
c01022dd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01022e3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01022e9:	7e cd                	jle    c01022b8 <_svfprintf_r+0xc98>
c01022eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022ee:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01022f2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01022f9:	89 04 24             	mov    %eax,(%esp)
c01022fc:	e8 9f 3e 00 00       	call   c01061a0 <__ssprint_r>
c0102301:	85 c0                	test   %eax,%eax
c0102303:	0f 85 e7 f4 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102309:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010230f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102312:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102318:	eb 9e                	jmp    c01022b8 <_svfprintf_r+0xc98>
c010231a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102320:	84 c0                	test   %al,%al
c0102322:	75 2c                	jne    c0102350 <_svfprintf_r+0xd30>
c0102324:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010232b:	74 23                	je     c0102350 <_svfprintf_r+0xd30>
c010232d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102333:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0102337:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010233d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102340:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102346:	e9 2d f7 ff ff       	jmp    c0101a78 <_svfprintf_r+0x458>
c010234b:	90                   	nop
c010234c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102350:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102353:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c010235a:	00 00 00 
c010235d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102363:	e9 10 f7 ff ff       	jmp    c0101a78 <_svfprintf_r+0x458>
c0102368:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010236e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102374:	85 f6                	test   %esi,%esi
c0102376:	0f 8e 26 fc ff ff    	jle    c0101fa2 <_svfprintf_r+0x982>
c010237c:	83 fe 10             	cmp    $0x10,%esi
c010237f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102385:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010238b:	7f 0b                	jg     c0102398 <_svfprintf_r+0xd78>
c010238d:	eb 65                	jmp    c01023f4 <_svfprintf_r+0xdd4>
c010238f:	90                   	nop
c0102390:	83 ee 10             	sub    $0x10,%esi
c0102393:	83 fe 10             	cmp    $0x10,%esi
c0102396:	7e 5c                	jle    c01023f4 <_svfprintf_r+0xdd4>
c0102398:	83 c0 01             	add    $0x1,%eax
c010239b:	83 c1 10             	add    $0x10,%ecx
c010239e:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01023a4:	83 c7 08             	add    $0x8,%edi
c01023a7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01023ae:	83 f8 07             	cmp    $0x7,%eax
c01023b1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01023b7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01023bd:	7e d1                	jle    c0102390 <_svfprintf_r+0xd70>
c01023bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023c2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01023c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01023ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01023cd:	89 04 24             	mov    %eax,(%esp)
c01023d0:	e8 cb 3d 00 00       	call   c01061a0 <__ssprint_r>
c01023d5:	85 c0                	test   %eax,%eax
c01023d7:	0f 85 13 f4 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01023dd:	83 ee 10             	sub    $0x10,%esi
c01023e0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01023e6:	83 fe 10             	cmp    $0x10,%esi
c01023e9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01023ef:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01023f2:	7f a4                	jg     c0102398 <_svfprintf_r+0xd78>
c01023f4:	83 c0 01             	add    $0x1,%eax
c01023f7:	01 f1                	add    %esi,%ecx
c01023f9:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01023ff:	83 c7 08             	add    $0x8,%edi
c0102402:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102405:	83 f8 07             	cmp    $0x7,%eax
c0102408:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010240e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102414:	0f 8e 88 fb ff ff    	jle    c0101fa2 <_svfprintf_r+0x982>
c010241a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102420:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102424:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102427:	89 44 24 04          	mov    %eax,0x4(%esp)
c010242b:	8b 45 08             	mov    0x8(%ebp),%eax
c010242e:	89 04 24             	mov    %eax,(%esp)
c0102431:	e8 6a 3d 00 00       	call   c01061a0 <__ssprint_r>
c0102436:	85 c0                	test   %eax,%eax
c0102438:	0f 85 b2 f3 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010243e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102444:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102447:	e9 56 fb ff ff       	jmp    c0101fa2 <_svfprintf_r+0x982>
c010244c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102450:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c0102457:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010245d:	0f 8e df 05 00 00    	jle    c0102a42 <_svfprintf_r+0x1422>
c0102463:	89 07                	mov    %eax,(%edi)
c0102465:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010246b:	8d 51 01             	lea    0x1(%ecx),%edx
c010246e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102475:	83 c7 08             	add    $0x8,%edi
c0102478:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010247e:	83 c0 01             	add    $0x1,%eax
c0102481:	83 f8 07             	cmp    $0x7,%eax
c0102484:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010248a:	0f 8f 59 06 00 00    	jg     c0102ae9 <_svfprintf_r+0x14c9>
c0102490:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c0102496:	83 c0 01             	add    $0x1,%eax
c0102499:	83 c7 08             	add    $0x8,%edi
c010249c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01024a2:	89 5f f8             	mov    %ebx,-0x8(%edi)
c01024a5:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c01024ab:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01024ae:	01 da                	add    %ebx,%edx
c01024b0:	83 f8 07             	cmp    $0x7,%eax
c01024b3:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01024b9:	0f 8f f2 05 00 00    	jg     c0102ab1 <_svfprintf_r+0x1491>
c01024bf:	d9 ee                	fldz   
c01024c1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01024c7:	df e9                	fucomip %st(1),%st
c01024c9:	dd d8                	fstp   %st(0)
c01024cb:	7a 06                	jp     c01024d3 <_svfprintf_r+0xeb3>
c01024cd:	0f 84 33 03 00 00    	je     c0102806 <_svfprintf_r+0x11e6>
c01024d3:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c01024d9:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c01024df:	83 c1 01             	add    $0x1,%ecx
c01024e2:	89 0f                	mov    %ecx,(%edi)
c01024e4:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c01024e7:	89 4f 04             	mov    %ecx,0x4(%edi)
c01024ea:	01 ca                	add    %ecx,%edx
c01024ec:	83 c0 01             	add    $0x1,%eax
c01024ef:	83 f8 07             	cmp    $0x7,%eax
c01024f2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01024f8:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01024fe:	0f 8f 75 05 00 00    	jg     c0102a79 <_svfprintf_r+0x1459>
c0102504:	83 c7 08             	add    $0x8,%edi
c0102507:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c010250d:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c0102513:	89 0f                	mov    %ecx,(%edi)
c0102515:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102518:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c010251b:	83 c0 01             	add    $0x1,%eax
c010251e:	83 f8 07             	cmp    $0x7,%eax
c0102521:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102527:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010252d:	0f 8e 96 fb ff ff    	jle    c01020c9 <_svfprintf_r+0xaa9>
c0102533:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102539:	89 44 24 08          	mov    %eax,0x8(%esp)
c010253d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102540:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102544:	8b 45 08             	mov    0x8(%ebp),%eax
c0102547:	89 04 24             	mov    %eax,(%esp)
c010254a:	e8 51 3c 00 00       	call   c01061a0 <__ssprint_r>
c010254f:	85 c0                	test   %eax,%eax
c0102551:	0f 85 99 f2 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102557:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010255d:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102560:	e9 67 fb ff ff       	jmp    c01020cc <_svfprintf_r+0xaac>
c0102565:	8d 76 00             	lea    0x0(%esi),%esi
c0102568:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010256e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102572:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102575:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102579:	8b 45 08             	mov    0x8(%ebp),%eax
c010257c:	89 04 24             	mov    %eax,(%esp)
c010257f:	e8 1c 3c 00 00       	call   c01061a0 <__ssprint_r>
c0102584:	85 c0                	test   %eax,%eax
c0102586:	0f 84 43 fc ff ff    	je     c01021cf <_svfprintf_r+0xbaf>
c010258c:	e9 5f f2 ff ff       	jmp    c01017f0 <_svfprintf_r+0x1d0>
c0102591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102598:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010259e:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025a2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025a5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ac:	89 04 24             	mov    %eax,(%esp)
c01025af:	e8 ec 3b 00 00       	call   c01061a0 <__ssprint_r>
c01025b4:	85 c0                	test   %eax,%eax
c01025b6:	0f 85 34 f2 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01025bc:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025c2:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025c5:	e9 c8 f9 ff ff       	jmp    c0101f92 <_svfprintf_r+0x972>
c01025ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01025d0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025d6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025da:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025dd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01025e4:	89 04 24             	mov    %eax,(%esp)
c01025e7:	e8 b4 3b 00 00       	call   c01061a0 <__ssprint_r>
c01025ec:	85 c0                	test   %eax,%eax
c01025ee:	0f 85 fc f1 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01025f4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025fa:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025fd:	e9 53 f9 ff ff       	jmp    c0101f55 <_svfprintf_r+0x935>
c0102602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102608:	89 c2                	mov    %eax,%edx
c010260a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102610:	89 c8                	mov    %ecx,%eax
c0102612:	83 ea 01             	sub    $0x1,%edx
c0102615:	83 e0 07             	and    $0x7,%eax
c0102618:	c1 e9 03             	shr    $0x3,%ecx
c010261b:	83 c0 30             	add    $0x30,%eax
c010261e:	85 c9                	test   %ecx,%ecx
c0102620:	88 02                	mov    %al,(%edx)
c0102622:	75 ec                	jne    c0102610 <_svfprintf_r+0xff0>
c0102624:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010262b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c0102631:	0f 84 5b 01 00 00    	je     c0102792 <_svfprintf_r+0x1172>
c0102637:	3c 30                	cmp    $0x30,%al
c0102639:	74 0b                	je     c0102646 <_svfprintf_r+0x1026>
c010263b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c0102642:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0102646:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102649:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010264f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102655:	e9 1e f4 ff ff       	jmp    c0101a78 <_svfprintf_r+0x458>
c010265a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102660:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102666:	85 db                	test   %ebx,%ebx
c0102668:	0f 8e 66 05 00 00    	jle    c0102bd4 <_svfprintf_r+0x15b4>
c010266e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0102674:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c010267a:	01 d0                	add    %edx,%eax
c010267c:	89 c3                	mov    %eax,%ebx
c010267e:	29 d3                	sub    %edx,%ebx
c0102680:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102686:	89 d0                	mov    %edx,%eax
c0102688:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c010268e:	39 d3                	cmp    %edx,%ebx
c0102690:	0f 4f da             	cmovg  %edx,%ebx
c0102693:	85 db                	test   %ebx,%ebx
c0102695:	7e 28                	jle    c01026bf <_svfprintf_r+0x109f>
c0102697:	89 07                	mov    %eax,(%edi)
c0102699:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010269f:	01 d9                	add    %ebx,%ecx
c01026a1:	89 5f 04             	mov    %ebx,0x4(%edi)
c01026a4:	83 c7 08             	add    $0x8,%edi
c01026a7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01026ad:	83 c0 01             	add    $0x1,%eax
c01026b0:	83 f8 07             	cmp    $0x7,%eax
c01026b3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01026b9:	0f 8f 58 09 00 00    	jg     c0103017 <_svfprintf_r+0x19f7>
c01026bf:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c01026c5:	31 c0                	xor    %eax,%eax
c01026c7:	85 db                	test   %ebx,%ebx
c01026c9:	0f 49 c3             	cmovns %ebx,%eax
c01026cc:	29 c6                	sub    %eax,%esi
c01026ce:	85 f6                	test   %esi,%esi
c01026d0:	0f 8e 40 02 00 00    	jle    c0102916 <_svfprintf_r+0x12f6>
c01026d6:	83 fe 10             	cmp    $0x10,%esi
c01026d9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01026df:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01026e5:	7f 15                	jg     c01026fc <_svfprintf_r+0x10dc>
c01026e7:	e9 db 01 00 00       	jmp    c01028c7 <_svfprintf_r+0x12a7>
c01026ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01026f0:	83 ee 10             	sub    $0x10,%esi
c01026f3:	83 fe 10             	cmp    $0x10,%esi
c01026f6:	0f 8e cb 01 00 00    	jle    c01028c7 <_svfprintf_r+0x12a7>
c01026fc:	83 c0 01             	add    $0x1,%eax
c01026ff:	83 c1 10             	add    $0x10,%ecx
c0102702:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c0102708:	83 c7 08             	add    $0x8,%edi
c010270b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102712:	83 f8 07             	cmp    $0x7,%eax
c0102715:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010271b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102721:	7e cd                	jle    c01026f0 <_svfprintf_r+0x10d0>
c0102723:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102726:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010272a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010272e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102731:	89 04 24             	mov    %eax,(%esp)
c0102734:	e8 67 3a 00 00       	call   c01061a0 <__ssprint_r>
c0102739:	85 c0                	test   %eax,%eax
c010273b:	0f 85 af f0 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102741:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102747:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010274a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102750:	eb 9e                	jmp    c01026f0 <_svfprintf_r+0x10d0>
c0102752:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102755:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c010275a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102760:	89 c7                	mov    %eax,%edi
c0102762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102768:	89 c8                	mov    %ecx,%eax
c010276a:	83 ef 01             	sub    $0x1,%edi
c010276d:	f7 e6                	mul    %esi
c010276f:	c1 ea 03             	shr    $0x3,%edx
c0102772:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0102775:	01 c0                	add    %eax,%eax
c0102777:	29 c1                	sub    %eax,%ecx
c0102779:	83 c1 30             	add    $0x30,%ecx
c010277c:	85 d2                	test   %edx,%edx
c010277e:	88 0f                	mov    %cl,(%edi)
c0102780:	89 d1                	mov    %edx,%ecx
c0102782:	75 e4                	jne    c0102768 <_svfprintf_r+0x1148>
c0102784:	89 fa                	mov    %edi,%edx
c0102786:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c010278c:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0102792:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102795:	29 d0                	sub    %edx,%eax
c0102797:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010279d:	e9 d6 f2 ff ff       	jmp    c0101a78 <_svfprintf_r+0x458>
c01027a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01027a8:	83 f9 09             	cmp    $0x9,%ecx
c01027ab:	77 a5                	ja     c0102752 <_svfprintf_r+0x1132>
c01027ad:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c01027b3:	83 c1 30             	add    $0x30,%ecx
c01027b6:	88 4d a7             	mov    %cl,-0x59(%ebp)
c01027b9:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01027bf:	8d 45 a7             	lea    -0x59(%ebp),%eax
c01027c2:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01027c8:	e9 ab f2 ff ff       	jmp    c0101a78 <_svfprintf_r+0x458>
c01027cd:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01027d3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01027d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027da:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027de:	8b 45 08             	mov    0x8(%ebp),%eax
c01027e1:	89 04 24             	mov    %eax,(%esp)
c01027e4:	e8 b7 39 00 00       	call   c01061a0 <__ssprint_r>
c01027e9:	85 c0                	test   %eax,%eax
c01027eb:	0f 85 ff ef ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01027f1:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01027f8:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01027fb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102801:	e9 18 f7 ff ff       	jmp    c0101f1e <_svfprintf_r+0x8fe>
c0102806:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c010280c:	8d 73 ff             	lea    -0x1(%ebx),%esi
c010280f:	85 f6                	test   %esi,%esi
c0102811:	0f 8e f0 fc ff ff    	jle    c0102507 <_svfprintf_r+0xee7>
c0102817:	83 fe 10             	cmp    $0x10,%esi
c010281a:	7e 70                	jle    c010288c <_svfprintf_r+0x126c>
c010281c:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102822:	eb 0c                	jmp    c0102830 <_svfprintf_r+0x1210>
c0102824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102828:	83 ee 10             	sub    $0x10,%esi
c010282b:	83 fe 10             	cmp    $0x10,%esi
c010282e:	7e 5c                	jle    c010288c <_svfprintf_r+0x126c>
c0102830:	83 c0 01             	add    $0x1,%eax
c0102833:	83 c2 10             	add    $0x10,%edx
c0102836:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c010283c:	83 c7 08             	add    $0x8,%edi
c010283f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102846:	83 f8 07             	cmp    $0x7,%eax
c0102849:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010284f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102855:	7e d1                	jle    c0102828 <_svfprintf_r+0x1208>
c0102857:	8b 45 0c             	mov    0xc(%ebp),%eax
c010285a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010285e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102862:	8b 45 08             	mov    0x8(%ebp),%eax
c0102865:	89 04 24             	mov    %eax,(%esp)
c0102868:	e8 33 39 00 00       	call   c01061a0 <__ssprint_r>
c010286d:	85 c0                	test   %eax,%eax
c010286f:	0f 85 7b ef ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102875:	83 ee 10             	sub    $0x10,%esi
c0102878:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010287e:	83 fe 10             	cmp    $0x10,%esi
c0102881:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102887:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010288a:	7f a4                	jg     c0102830 <_svfprintf_r+0x1210>
c010288c:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c0102892:	01 f2                	add    %esi,%edx
c0102894:	89 77 04             	mov    %esi,0x4(%edi)
c0102897:	e9 50 fc ff ff       	jmp    c01024ec <_svfprintf_r+0xecc>
c010289c:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01028a2:	01 f1                	add    %esi,%ecx
c01028a4:	89 77 04             	mov    %esi,0x4(%edi)
c01028a7:	e9 6f fc ff ff       	jmp    c010251b <_svfprintf_r+0xefb>
c01028ac:	8b 45 14             	mov    0x14(%ebp),%eax
c01028af:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c01028b5:	8b 00                	mov    (%eax),%eax
c01028b7:	89 10                	mov    %edx,(%eax)
c01028b9:	8b 45 14             	mov    0x14(%ebp),%eax
c01028bc:	83 c0 04             	add    $0x4,%eax
c01028bf:	89 45 14             	mov    %eax,0x14(%ebp)
c01028c2:	e9 f4 ed ff ff       	jmp    c01016bb <_svfprintf_r+0x9b>
c01028c7:	83 c0 01             	add    $0x1,%eax
c01028ca:	01 f1                	add    %esi,%ecx
c01028cc:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01028d2:	83 c7 08             	add    $0x8,%edi
c01028d5:	89 77 fc             	mov    %esi,-0x4(%edi)
c01028d8:	83 f8 07             	cmp    $0x7,%eax
c01028db:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01028e1:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01028e7:	7e 2d                	jle    c0102916 <_svfprintf_r+0x12f6>
c01028e9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01028ef:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01028fd:	89 04 24             	mov    %eax,(%esp)
c0102900:	e8 9b 38 00 00       	call   c01061a0 <__ssprint_r>
c0102905:	85 c0                	test   %eax,%eax
c0102907:	0f 85 e3 ee ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010290d:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102913:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102916:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010291c:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0102922:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0102928:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c010292e:	89 c6                	mov    %eax,%esi
c0102930:	7c 0d                	jl     c010293f <_svfprintf_r+0x131f>
c0102932:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102939:	0f 84 5e 05 00 00    	je     c0102e9d <_svfprintf_r+0x187d>
c010293f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102945:	89 07                	mov    %eax,(%edi)
c0102947:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010294d:	01 c1                	add    %eax,%ecx
c010294f:	89 47 04             	mov    %eax,0x4(%edi)
c0102952:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102958:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010295e:	83 c0 01             	add    $0x1,%eax
c0102961:	83 f8 07             	cmp    $0x7,%eax
c0102964:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010296a:	0f 8f d9 06 00 00    	jg     c0103049 <_svfprintf_r+0x1a29>
c0102970:	83 c7 08             	add    $0x8,%edi
c0102973:	89 d0                	mov    %edx,%eax
c0102975:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010297b:	89 f2                	mov    %esi,%edx
c010297d:	29 f3                	sub    %esi,%ebx
c010297f:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c0102985:	29 c6                	sub    %eax,%esi
c0102987:	39 de                	cmp    %ebx,%esi
c0102989:	0f 4e de             	cmovle %esi,%ebx
c010298c:	85 db                	test   %ebx,%ebx
c010298e:	7e 29                	jle    c01029b9 <_svfprintf_r+0x1399>
c0102990:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102996:	01 d9                	add    %ebx,%ecx
c0102998:	83 c7 08             	add    $0x8,%edi
c010299b:	89 57 f8             	mov    %edx,-0x8(%edi)
c010299e:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01029a1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01029a7:	83 c0 01             	add    $0x1,%eax
c01029aa:	83 f8 07             	cmp    $0x7,%eax
c01029ad:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01029b3:	0f 8f c8 06 00 00    	jg     c0103081 <_svfprintf_r+0x1a61>
c01029b9:	31 c0                	xor    %eax,%eax
c01029bb:	85 db                	test   %ebx,%ebx
c01029bd:	0f 49 c3             	cmovns %ebx,%eax
c01029c0:	29 c6                	sub    %eax,%esi
c01029c2:	85 f6                	test   %esi,%esi
c01029c4:	0f 8e 02 f7 ff ff    	jle    c01020cc <_svfprintf_r+0xaac>
c01029ca:	83 fe 10             	cmp    $0x10,%esi
c01029cd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01029d3:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01029d9:	7f 11                	jg     c01029ec <_svfprintf_r+0x13cc>
c01029db:	e9 bc fe ff ff       	jmp    c010289c <_svfprintf_r+0x127c>
c01029e0:	83 ee 10             	sub    $0x10,%esi
c01029e3:	83 fe 10             	cmp    $0x10,%esi
c01029e6:	0f 8e b0 fe ff ff    	jle    c010289c <_svfprintf_r+0x127c>
c01029ec:	83 c0 01             	add    $0x1,%eax
c01029ef:	83 c1 10             	add    $0x10,%ecx
c01029f2:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c01029f8:	83 c7 08             	add    $0x8,%edi
c01029fb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102a02:	83 f8 07             	cmp    $0x7,%eax
c0102a05:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a0b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a11:	7e cd                	jle    c01029e0 <_svfprintf_r+0x13c0>
c0102a13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a16:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a21:	89 04 24             	mov    %eax,(%esp)
c0102a24:	e8 77 37 00 00       	call   c01061a0 <__ssprint_r>
c0102a29:	85 c0                	test   %eax,%eax
c0102a2b:	0f 85 bf ed ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102a31:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102a37:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102a3a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a40:	eb 9e                	jmp    c01029e0 <_svfprintf_r+0x13c0>
c0102a42:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102a49:	0f 85 14 fa ff ff    	jne    c0102463 <_svfprintf_r+0xe43>
c0102a4f:	89 07                	mov    %eax,(%edi)
c0102a51:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a57:	8d 51 01             	lea    0x1(%ecx),%edx
c0102a5a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102a61:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102a67:	83 c0 01             	add    $0x1,%eax
c0102a6a:	83 f8 07             	cmp    $0x7,%eax
c0102a6d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a73:	0f 8e 8b fa ff ff    	jle    c0102504 <_svfprintf_r+0xee4>
c0102a79:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102a7f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a83:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a86:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a8d:	89 04 24             	mov    %eax,(%esp)
c0102a90:	e8 0b 37 00 00       	call   c01061a0 <__ssprint_r>
c0102a95:	85 c0                	test   %eax,%eax
c0102a97:	0f 85 53 ed ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102a9d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102aa3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102aa6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102aac:	e9 56 fa ff ff       	jmp    c0102507 <_svfprintf_r+0xee7>
c0102ab1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ab7:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102abb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102abe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ac2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac5:	89 04 24             	mov    %eax,(%esp)
c0102ac8:	e8 d3 36 00 00       	call   c01061a0 <__ssprint_r>
c0102acd:	85 c0                	test   %eax,%eax
c0102acf:	0f 85 1b ed ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102ad5:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102adb:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ade:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102ae4:	e9 d6 f9 ff ff       	jmp    c01024bf <_svfprintf_r+0xe9f>
c0102ae9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102aef:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102af3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102af6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102afa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102afd:	89 04 24             	mov    %eax,(%esp)
c0102b00:	e8 9b 36 00 00       	call   c01061a0 <__ssprint_r>
c0102b05:	85 c0                	test   %eax,%eax
c0102b07:	0f 85 e3 ec ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102b0d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102b13:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102b16:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b1c:	e9 6f f9 ff ff       	jmp    c0102490 <_svfprintf_r+0xe70>
c0102b21:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102b27:	dd 1c 24             	fstpl  (%esp)
c0102b2a:	e8 11 35 00 00       	call   c0106040 <__fpclassifyd>
c0102b2f:	85 c0                	test   %eax,%eax
c0102b31:	0f 85 a3 01 00 00    	jne    c0102cda <_svfprintf_r+0x16ba>
c0102b37:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0102b3e:	ba 26 81 10 c0       	mov    $0xc0108126,%edx
c0102b43:	b8 2a 81 10 c0       	mov    $0xc010812a,%eax
c0102b48:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102b4f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0102b56:	00 00 00 
c0102b59:	0f 4e c2             	cmovle %edx,%eax
c0102b5c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102b62:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0102b69:	ff ff ff 
c0102b6c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0102b73:	00 00 00 
c0102b76:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102b7d:	00 00 00 
c0102b80:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0102b87:	00 00 00 
c0102b8a:	e9 29 ed ff ff       	jmp    c01018b8 <_svfprintf_r+0x298>
c0102b8f:	dd 00                	fldl   (%eax)
c0102b91:	83 c0 08             	add    $0x8,%eax
c0102b94:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102b9a:	89 45 14             	mov    %eax,0x14(%ebp)
c0102b9d:	e9 e6 ef ff ff       	jmp    c0101b88 <_svfprintf_r+0x568>
c0102ba2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ba8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102bac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102baf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bb6:	89 04 24             	mov    %eax,(%esp)
c0102bb9:	e8 e2 35 00 00       	call   c01061a0 <__ssprint_r>
c0102bbe:	85 c0                	test   %eax,%eax
c0102bc0:	0f 85 2a ec ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102bc6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102bcc:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102bcf:	e9 6b f6 ff ff       	jmp    c010223f <_svfprintf_r+0xc1f>
c0102bd4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102bda:	83 c1 01             	add    $0x1,%ecx
c0102bdd:	83 c7 08             	add    $0x8,%edi
c0102be0:	c7 47 f8 57 81 10 c0 	movl   $0xc0108157,-0x8(%edi)
c0102be7:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102bee:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102bf4:	83 c0 01             	add    $0x1,%eax
c0102bf7:	83 f8 07             	cmp    $0x7,%eax
c0102bfa:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c00:	0f 8f ef 02 00 00    	jg     c0102ef5 <_svfprintf_r+0x18d5>
c0102c06:	85 db                	test   %ebx,%ebx
c0102c08:	75 17                	jne    c0102c21 <_svfprintf_r+0x1601>
c0102c0a:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c0102c10:	85 d2                	test   %edx,%edx
c0102c12:	75 0d                	jne    c0102c21 <_svfprintf_r+0x1601>
c0102c14:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102c1b:	0f 84 ab f4 ff ff    	je     c01020cc <_svfprintf_r+0xaac>
c0102c21:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102c27:	83 c7 08             	add    $0x8,%edi
c0102c2a:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102c2d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102c33:	89 47 fc             	mov    %eax,-0x4(%edi)
c0102c36:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0102c39:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c3f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c45:	83 c0 01             	add    $0x1,%eax
c0102c48:	83 f8 07             	cmp    $0x7,%eax
c0102c4b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c51:	0f 8f 60 03 00 00    	jg     c0102fb7 <_svfprintf_r+0x1997>
c0102c57:	f7 db                	neg    %ebx
c0102c59:	85 db                	test   %ebx,%ebx
c0102c5b:	0f 8e 21 03 00 00    	jle    c0102f82 <_svfprintf_r+0x1962>
c0102c61:	83 fb 10             	cmp    $0x10,%ebx
c0102c64:	0f 8e c3 02 00 00    	jle    c0102f2d <_svfprintf_r+0x190d>
c0102c6a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0102c70:	eb 12                	jmp    c0102c84 <_svfprintf_r+0x1664>
c0102c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102c78:	83 eb 10             	sub    $0x10,%ebx
c0102c7b:	83 fb 10             	cmp    $0x10,%ebx
c0102c7e:	0f 8e a9 02 00 00    	jle    c0102f2d <_svfprintf_r+0x190d>
c0102c84:	83 c0 01             	add    $0x1,%eax
c0102c87:	83 c2 10             	add    $0x10,%edx
c0102c8a:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c0102c90:	83 c7 08             	add    $0x8,%edi
c0102c93:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102c9a:	83 f8 07             	cmp    $0x7,%eax
c0102c9d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102ca3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102ca9:	7e cd                	jle    c0102c78 <_svfprintf_r+0x1658>
c0102cab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cae:	89 74 24 08          	mov    %esi,0x8(%esp)
c0102cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102cb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cb9:	89 04 24             	mov    %eax,(%esp)
c0102cbc:	e8 df 34 00 00       	call   c01061a0 <__ssprint_r>
c0102cc1:	85 c0                	test   %eax,%eax
c0102cc3:	0f 85 27 eb ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102cc9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102ccf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102cd2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102cd8:	eb 9e                	jmp    c0102c78 <_svfprintf_r+0x1658>
c0102cda:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c0102ce0:	83 e3 df             	and    $0xffffffdf,%ebx
c0102ce3:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c0102cea:	0f 84 05 03 00 00    	je     c0102ff5 <_svfprintf_r+0x19d5>
c0102cf0:	83 fb 47             	cmp    $0x47,%ebx
c0102cf3:	75 16                	jne    c0102d0b <_svfprintf_r+0x16eb>
c0102cf5:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0102cfb:	b8 01 00 00 00       	mov    $0x1,%eax
c0102d00:	85 d2                	test   %edx,%edx
c0102d02:	0f 45 c2             	cmovne %edx,%eax
c0102d05:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102d0b:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102d11:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102d17:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c0102d1d:	80 cc 01             	or     $0x1,%ah
c0102d20:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c0102d26:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0102d2c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c0102d33:	85 c0                	test   %eax,%eax
c0102d35:	0f 88 ba 05 00 00    	js     c01032f5 <_svfprintf_r+0x1cd5>
c0102d3b:	83 fb 46             	cmp    $0x46,%ebx
c0102d3e:	0f 94 c0             	sete   %al
c0102d41:	89 c6                	mov    %eax,%esi
c0102d43:	0f 84 d4 03 00 00    	je     c010311d <_svfprintf_r+0x1afd>
c0102d49:	83 fb 45             	cmp    $0x45,%ebx
c0102d4c:	0f 85 99 05 00 00    	jne    c01032eb <_svfprintf_r+0x1ccb>
c0102d52:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0102d58:	dd 54 24 04          	fstl   0x4(%esp)
c0102d5c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0102d63:	00 
c0102d64:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0102d6a:	8d 70 01             	lea    0x1(%eax),%esi
c0102d6d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0102d73:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0102d77:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0102d7d:	89 44 24 18          	mov    %eax,0x18(%esp)
c0102d81:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0102d87:	89 44 24 14          	mov    %eax,0x14(%esp)
c0102d8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d8e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0102d92:	89 04 24             	mov    %eax,(%esp)
c0102d95:	e8 56 09 00 00       	call   c01036f0 <_dtoa_r>
c0102d9a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102da0:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0102da3:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0102da9:	d9 ee                	fldz   
c0102dab:	d9 c9                	fxch   %st(1)
c0102dad:	df e9                	fucomip %st(1),%st
c0102daf:	dd d8                	fstp   %st(0)
c0102db1:	0f 8a fd 00 00 00    	jp     c0102eb4 <_svfprintf_r+0x1894>
c0102db7:	89 c8                	mov    %ecx,%eax
c0102db9:	0f 85 f5 00 00 00    	jne    c0102eb4 <_svfprintf_r+0x1894>
c0102dbf:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102dc5:	83 fb 47             	cmp    $0x47,%ebx
c0102dc8:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0102dce:	0f 84 1e 04 00 00    	je     c01031f2 <_svfprintf_r+0x1bd2>
c0102dd4:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c0102ddb:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0102de1:	0f 8e 65 04 00 00    	jle    c010324c <_svfprintf_r+0x1c2c>
c0102de7:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c0102dee:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c0102df4:	0f 84 3c 05 00 00    	je     c0103336 <_svfprintf_r+0x1d16>
c0102dfa:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c0102e00:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c0102e06:	0f 8f f7 04 00 00    	jg     c0103303 <_svfprintf_r+0x1ce3>
c0102e0c:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102e12:	83 e0 01             	and    $0x1,%eax
c0102e15:	0f 85 e2 05 00 00    	jne    c01033fd <_svfprintf_r+0x1ddd>
c0102e1b:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102e21:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0102e28:	00 00 00 
c0102e2b:	85 d2                	test   %edx,%edx
c0102e2d:	0f 49 c2             	cmovns %edx,%eax
c0102e30:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102e36:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c0102e3d:	0f 85 68 03 00 00    	jne    c01031ab <_svfprintf_r+0x1b8b>
c0102e43:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102e49:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0102e4f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102e56:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102e5d:	00 00 00 
c0102e60:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0102e66:	e9 4d ea ff ff       	jmp    c01018b8 <_svfprintf_r+0x298>
c0102e6b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102e71:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102e75:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e78:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e7f:	89 04 24             	mov    %eax,(%esp)
c0102e82:	e8 19 33 00 00       	call   c01061a0 <__ssprint_r>
c0102e87:	85 c0                	test   %eax,%eax
c0102e89:	0f 85 61 e9 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102e8f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102e95:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102e98:	e9 f2 f3 ff ff       	jmp    c010228f <_svfprintf_r+0xc6f>
c0102e9d:	89 d0                	mov    %edx,%eax
c0102e9f:	e9 d1 fa ff ff       	jmp    c0102975 <_svfprintf_r+0x1355>
c0102ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102ea8:	8d 50 01             	lea    0x1(%eax),%edx
c0102eab:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0102eb1:	c6 00 30             	movb   $0x30,(%eax)
c0102eb4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0102eba:	39 c1                	cmp    %eax,%ecx
c0102ebc:	77 ea                	ja     c0102ea8 <_svfprintf_r+0x1888>
c0102ebe:	e9 fc fe ff ff       	jmp    c0102dbf <_svfprintf_r+0x179f>
c0102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ec6:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0102ecd:	00 
c0102ece:	89 04 24             	mov    %eax,(%esp)
c0102ed1:	e8 4a 1b 00 00       	call   c0104a20 <_malloc_r>
c0102ed6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102ed9:	85 c0                	test   %eax,%eax
c0102edb:	89 02                	mov    %eax,(%edx)
c0102edd:	89 42 10             	mov    %eax,0x10(%edx)
c0102ee0:	0f 84 15 06 00 00    	je     c01034fb <_svfprintf_r+0x1edb>
c0102ee6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ee9:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0102ef0:	e9 6c e7 ff ff       	jmp    c0101661 <_svfprintf_r+0x41>
c0102ef5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102efb:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102eff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f02:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f06:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f09:	89 04 24             	mov    %eax,(%esp)
c0102f0c:	e8 8f 32 00 00       	call   c01061a0 <__ssprint_r>
c0102f11:	85 c0                	test   %eax,%eax
c0102f13:	0f 85 d7 e8 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102f19:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102f1f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f22:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102f28:	e9 d9 fc ff ff       	jmp    c0102c06 <_svfprintf_r+0x15e6>
c0102f2d:	83 c0 01             	add    $0x1,%eax
c0102f30:	01 da                	add    %ebx,%edx
c0102f32:	c7 07 c0 82 10 c0    	movl   $0xc01082c0,(%edi)
c0102f38:	83 c7 08             	add    $0x8,%edi
c0102f3b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102f3e:	83 f8 07             	cmp    $0x7,%eax
c0102f41:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102f47:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f4d:	7e 33                	jle    c0102f82 <_svfprintf_r+0x1962>
c0102f4f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102f55:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f5c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f60:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f63:	89 04 24             	mov    %eax,(%esp)
c0102f66:	e8 35 32 00 00       	call   c01061a0 <__ssprint_r>
c0102f6b:	85 c0                	test   %eax,%eax
c0102f6d:	0f 85 7d e8 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102f73:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102f79:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f7c:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102f82:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0102f88:	83 c0 01             	add    $0x1,%eax
c0102f8b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f91:	89 1f                	mov    %ebx,(%edi)
c0102f93:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102f99:	01 da                	add    %ebx,%edx
c0102f9b:	83 f8 07             	cmp    $0x7,%eax
c0102f9e:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102fa1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102fa7:	0f 8f 86 f5 ff ff    	jg     c0102533 <_svfprintf_r+0xf13>
c0102fad:	83 c7 08             	add    $0x8,%edi
c0102fb0:	89 d1                	mov    %edx,%ecx
c0102fb2:	e9 15 f1 ff ff       	jmp    c01020cc <_svfprintf_r+0xaac>
c0102fb7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102fbd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102fc1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102fc4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fcb:	89 04 24             	mov    %eax,(%esp)
c0102fce:	e8 cd 31 00 00       	call   c01061a0 <__ssprint_r>
c0102fd3:	85 c0                	test   %eax,%eax
c0102fd5:	0f 85 15 e8 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c0102fdb:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102fe1:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102fe4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102fea:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102ff0:	e9 62 fc ff ff       	jmp    c0102c57 <_svfprintf_r+0x1637>
c0102ff5:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c0102ffc:	00 00 00 
c0102fff:	e9 07 fd ff ff       	jmp    c0102d0b <_svfprintf_r+0x16eb>
c0103004:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010300a:	89 04 24             	mov    %eax,(%esp)
c010300d:	e8 0e 31 00 00       	call   c0106120 <strlen>
c0103012:	e9 6a e8 ff ff       	jmp    c0101881 <_svfprintf_r+0x261>
c0103017:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010301d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103021:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103024:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103028:	8b 45 08             	mov    0x8(%ebp),%eax
c010302b:	89 04 24             	mov    %eax,(%esp)
c010302e:	e8 6d 31 00 00       	call   c01061a0 <__ssprint_r>
c0103033:	85 c0                	test   %eax,%eax
c0103035:	0f 85 b5 e7 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010303b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103041:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103044:	e9 76 f6 ff ff       	jmp    c01026bf <_svfprintf_r+0x109f>
c0103049:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010304f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103053:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103056:	89 44 24 04          	mov    %eax,0x4(%esp)
c010305a:	8b 45 08             	mov    0x8(%ebp),%eax
c010305d:	89 04 24             	mov    %eax,(%esp)
c0103060:	e8 3b 31 00 00       	call   c01061a0 <__ssprint_r>
c0103065:	85 c0                	test   %eax,%eax
c0103067:	0f 85 83 e7 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c010306d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103073:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103076:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010307c:	e9 f4 f8 ff ff       	jmp    c0102975 <_svfprintf_r+0x1355>
c0103081:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103087:	89 44 24 08          	mov    %eax,0x8(%esp)
c010308b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010308e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103092:	8b 45 08             	mov    0x8(%ebp),%eax
c0103095:	89 04 24             	mov    %eax,(%esp)
c0103098:	e8 03 31 00 00       	call   c01061a0 <__ssprint_r>
c010309d:	85 c0                	test   %eax,%eax
c010309f:	0f 85 4b e7 ff ff    	jne    c01017f0 <_svfprintf_r+0x1d0>
c01030a5:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c01030ab:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030ae:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c01030b4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030ba:	e9 fa f8 ff ff       	jmp    c01029b9 <_svfprintf_r+0x1399>
c01030bf:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01030c5:	b0 06                	mov    $0x6,%al
c01030c7:	89 75 14             	mov    %esi,0x14(%ebp)
c01030ca:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01030d1:	00 00 00 
c01030d4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01030db:	00 00 00 
c01030de:	83 fa 06             	cmp    $0x6,%edx
c01030e1:	0f 46 c2             	cmovbe %edx,%eax
c01030e4:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01030ea:	85 c0                	test   %eax,%eax
c01030ec:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01030f2:	c7 85 28 ff ff ff 50 	movl   $0xc0108150,-0xd8(%ebp)
c01030f9:	81 10 c0 
c01030fc:	0f 49 d0             	cmovns %eax,%edx
c01030ff:	31 db                	xor    %ebx,%ebx
c0103101:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c0103107:	e9 b7 e7 ff ff       	jmp    c01018c3 <_svfprintf_r+0x2a3>
c010310c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0103113:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0103118:	e9 9d ea ff ff       	jmp    c0101bba <_svfprintf_r+0x59a>
c010311d:	ba 03 00 00 00       	mov    $0x3,%edx
c0103122:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103128:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c010312c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0103132:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103136:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c010313c:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103140:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103146:	dd 54 24 04          	fstl   0x4(%esp)
c010314a:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010314e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0103154:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103158:	8b 45 08             	mov    0x8(%ebp),%eax
c010315b:	89 04 24             	mov    %eax,(%esp)
c010315e:	e8 8d 05 00 00       	call   c01036f0 <_dtoa_r>
c0103163:	83 fb 47             	cmp    $0x47,%ebx
c0103166:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010316c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103172:	75 09                	jne    c010317d <_svfprintf_r+0x1b5d>
c0103174:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010317b:	74 5b                	je     c01031d8 <_svfprintf_r+0x1bb8>
c010317d:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0103183:	89 f0                	mov    %esi,%eax
c0103185:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c010318b:	01 d1                	add    %edx,%ecx
c010318d:	84 c0                	test   %al,%al
c010318f:	0f 84 14 fc ff ff    	je     c0102da9 <_svfprintf_r+0x1789>
c0103195:	80 3a 30             	cmpb   $0x30,(%edx)
c0103198:	0f 84 37 02 00 00    	je     c01033d5 <_svfprintf_r+0x1db5>
c010319e:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01031a4:	01 c1                	add    %eax,%ecx
c01031a6:	e9 fe fb ff ff       	jmp    c0102da9 <_svfprintf_r+0x1789>
c01031ab:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01031b1:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c01031b7:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01031bc:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01031c3:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01031ca:	00 00 00 
c01031cd:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c01031d3:	e9 e4 e6 ff ff       	jmp    c01018bc <_svfprintf_r+0x29c>
c01031d8:	dd d8                	fstp   %st(0)
c01031da:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01031e0:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c01031e6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01031ec:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c01031f2:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01031f8:	83 f8 fd             	cmp    $0xfffffffd,%eax
c01031fb:	7c 48                	jl     c0103245 <_svfprintf_r+0x1c25>
c01031fd:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c0103203:	7c 40                	jl     c0103245 <_svfprintf_r+0x1c25>
c0103205:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c010320b:	e9 ea fb ff ff       	jmp    c0102dfa <_svfprintf_r+0x17da>
c0103210:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103216:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010321d:	89 75 14             	mov    %esi,0x14(%ebp)
c0103220:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103227:	00 00 00 
c010322a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103230:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103236:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010323d:	00 00 00 
c0103240:	e9 73 e6 ff ff       	jmp    c01018b8 <_svfprintf_r+0x298>
c0103245:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c010324c:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010324f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c0103256:	85 c9                	test   %ecx,%ecx
c0103258:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010325e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c0103264:	0f 88 2c 02 00 00    	js     c0103496 <_svfprintf_r+0x1e76>
c010326a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c0103271:	83 f9 09             	cmp    $0x9,%ecx
c0103274:	0f 8f ea 00 00 00    	jg     c0103364 <_svfprintf_r+0x1d44>
c010327a:	83 c1 30             	add    $0x30,%ecx
c010327d:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c0103284:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c010328a:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c0103290:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103296:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c010329c:	29 d0                	sub    %edx,%eax
c010329e:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c01032a4:	89 da                	mov    %ebx,%edx
c01032a6:	01 c2                	add    %eax,%edx
c01032a8:	83 fb 01             	cmp    $0x1,%ebx
c01032ab:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01032b1:	0f 8e 21 02 00 00    	jle    c01034d8 <_svfprintf_r+0x1eb8>
c01032b7:	31 c0                	xor    %eax,%eax
c01032b9:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c01032c0:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c01032c7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01032ce:	00 00 00 
c01032d1:	e9 60 fb ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c01032d6:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01032dc:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01032e3:	00 00 00 
c01032e6:	e9 68 e4 ff ff       	jmp    c0101753 <_svfprintf_r+0x133>
c01032eb:	ba 02 00 00 00       	mov    $0x2,%edx
c01032f0:	e9 2d fe ff ff       	jmp    c0103122 <_svfprintf_r+0x1b02>
c01032f5:	d9 e0                	fchs   
c01032f7:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c01032fe:	e9 38 fa ff ff       	jmp    c0102d3b <_svfprintf_r+0x171b>
c0103303:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c0103309:	ba 01 00 00 00       	mov    $0x1,%edx
c010330e:	85 c9                	test   %ecx,%ecx
c0103310:	0f 8e 5a 01 00 00    	jle    c0103470 <_svfprintf_r+0x1e50>
c0103316:	31 c0                	xor    %eax,%eax
c0103318:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c010331e:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103325:	00 00 00 
c0103328:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010332e:	0f 49 c2             	cmovns %edx,%eax
c0103331:	e9 00 fb ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c0103336:	85 c0                	test   %eax,%eax
c0103338:	0f 8e 06 01 00 00    	jle    c0103444 <_svfprintf_r+0x1e24>
c010333e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0103344:	85 f6                	test   %esi,%esi
c0103346:	0f 85 d4 00 00 00    	jne    c0103420 <_svfprintf_r+0x1e00>
c010334c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103353:	0f 85 c7 00 00 00    	jne    c0103420 <_svfprintf_r+0x1e00>
c0103359:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010335f:	e9 d2 fa ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c0103364:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c010336a:	89 f3                	mov    %esi,%ebx
c010336c:	b8 67 66 66 66       	mov    $0x66666667,%eax
c0103371:	83 eb 01             	sub    $0x1,%ebx
c0103374:	f7 e9                	imul   %ecx
c0103376:	89 c8                	mov    %ecx,%eax
c0103378:	c1 f8 1f             	sar    $0x1f,%eax
c010337b:	c1 fa 02             	sar    $0x2,%edx
c010337e:	29 c2                	sub    %eax,%edx
c0103380:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0103383:	01 c0                	add    %eax,%eax
c0103385:	29 c1                	sub    %eax,%ecx
c0103387:	83 fa 09             	cmp    $0x9,%edx
c010338a:	8d 41 30             	lea    0x30(%ecx),%eax
c010338d:	89 d1                	mov    %edx,%ecx
c010338f:	88 03                	mov    %al,(%ebx)
c0103391:	7f d9                	jg     c010336c <_svfprintf_r+0x1d4c>
c0103393:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0103396:	83 c1 30             	add    $0x30,%ecx
c0103399:	39 f0                	cmp    %esi,%eax
c010339b:	88 4b ff             	mov    %cl,-0x1(%ebx)
c010339e:	0f 83 6a 01 00 00    	jae    c010350e <_svfprintf_r+0x1eee>
c01033a4:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c01033aa:	eb 07                	jmp    c01033b3 <_svfprintf_r+0x1d93>
c01033ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01033b0:	0f b6 08             	movzbl (%eax),%ecx
c01033b3:	83 c0 01             	add    $0x1,%eax
c01033b6:	83 c2 01             	add    $0x1,%edx
c01033b9:	39 f0                	cmp    %esi,%eax
c01033bb:	88 4a ff             	mov    %cl,-0x1(%edx)
c01033be:	75 f0                	jne    c01033b0 <_svfprintf_r+0x1d90>
c01033c0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01033c6:	29 d8                	sub    %ebx,%eax
c01033c8:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c01033ce:	01 d0                	add    %edx,%eax
c01033d0:	e9 bb fe ff ff       	jmp    c0103290 <_svfprintf_r+0x1c70>
c01033d5:	d9 ee                	fldz   
c01033d7:	d9 c9                	fxch   %st(1)
c01033d9:	db e9                	fucomi %st(1),%st
c01033db:	dd d9                	fstp   %st(1)
c01033dd:	7a 06                	jp     c01033e5 <_svfprintf_r+0x1dc5>
c01033df:	0f 84 b9 fd ff ff    	je     c010319e <_svfprintf_r+0x1b7e>
c01033e5:	b8 01 00 00 00       	mov    $0x1,%eax
c01033ea:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c01033f0:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c01033f6:	01 c1                	add    %eax,%ecx
c01033f8:	e9 ac f9 ff ff       	jmp    c0102da9 <_svfprintf_r+0x1789>
c01033fd:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103403:	31 c0                	xor    %eax,%eax
c0103405:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c010340c:	00 00 00 
c010340f:	83 c2 01             	add    $0x1,%edx
c0103412:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103418:	0f 49 c2             	cmovns %edx,%eax
c010341b:	e9 16 fa ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c0103420:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103426:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c010342c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0103430:	89 c2                	mov    %eax,%edx
c0103432:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103438:	31 c0                	xor    %eax,%eax
c010343a:	85 d2                	test   %edx,%edx
c010343c:	0f 49 c2             	cmovns %edx,%eax
c010343f:	e9 f2 f9 ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c0103444:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010344a:	85 db                	test   %ebx,%ebx
c010344c:	75 2f                	jne    c010347d <_svfprintf_r+0x1e5d>
c010344e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103455:	75 26                	jne    c010347d <_svfprintf_r+0x1e5d>
c0103457:	b8 01 00 00 00       	mov    $0x1,%eax
c010345c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0103463:	00 00 00 
c0103466:	e9 cb f9 ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c010346b:	90                   	nop
c010346c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103470:	b2 02                	mov    $0x2,%dl
c0103472:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c0103478:	e9 99 fe ff ff       	jmp    c0103316 <_svfprintf_r+0x1cf6>
c010347d:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103483:	31 c0                	xor    %eax,%eax
c0103485:	83 c2 02             	add    $0x2,%edx
c0103488:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010348e:	0f 49 c2             	cmovns %edx,%eax
c0103491:	e9 a0 f9 ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c0103496:	f7 d9                	neg    %ecx
c0103498:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c010349f:	e9 cd fd ff ff       	jmp    c0103271 <_svfprintf_r+0x1c51>
c01034a4:	8b 55 14             	mov    0x14(%ebp),%edx
c01034a7:	8b 45 14             	mov    0x14(%ebp),%eax
c01034aa:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01034b0:	8b 12                	mov    (%edx),%edx
c01034b2:	83 c0 04             	add    $0x4,%eax
c01034b5:	89 45 14             	mov    %eax,0x14(%ebp)
c01034b8:	85 d2                	test   %edx,%edx
c01034ba:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c01034c0:	0f 89 a9 e2 ff ff    	jns    c010176f <_svfprintf_r+0x14f>
c01034c6:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c01034cd:	ff ff ff 
c01034d0:	89 c8                	mov    %ecx,%eax
c01034d2:	e9 76 e2 ff ff       	jmp    c010174d <_svfprintf_r+0x12d>
c01034d7:	90                   	nop
c01034d8:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01034de:	83 e0 01             	and    $0x1,%eax
c01034e1:	0f 85 d0 fd ff ff    	jne    c01032b7 <_svfprintf_r+0x1c97>
c01034e7:	85 d2                	test   %edx,%edx
c01034e9:	0f 49 c2             	cmovns %edx,%eax
c01034ec:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01034f3:	00 00 00 
c01034f6:	e9 3b f9 ff ff       	jmp    c0102e36 <_svfprintf_r+0x1816>
c01034fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01034fe:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0103504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103509:	e9 f5 e2 ff ff       	jmp    c0101803 <_svfprintf_r+0x1e3>
c010350e:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c0103514:	e9 77 fd ff ff       	jmp    c0103290 <_svfprintf_r+0x1c70>
c0103519:	66 90                	xchg   %ax,%ax
c010351b:	66 90                	xchg   %ax,%ax
c010351d:	66 90                	xchg   %ax,%ax
c010351f:	90                   	nop

c0103520 <quorem>:
c0103520:	55                   	push   %ebp
c0103521:	89 c1                	mov    %eax,%ecx
c0103523:	89 e5                	mov    %esp,%ebp
c0103525:	57                   	push   %edi
c0103526:	89 d7                	mov    %edx,%edi
c0103528:	56                   	push   %esi
c0103529:	53                   	push   %ebx
c010352a:	83 ec 3c             	sub    $0x3c,%esp
c010352d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0103530:	8b 42 10             	mov    0x10(%edx),%eax
c0103533:	3b 41 10             	cmp    0x10(%ecx),%eax
c0103536:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0103539:	89 ca                	mov    %ecx,%edx
c010353b:	0f 8f 9f 01 00 00    	jg     c01036e0 <quorem+0x1c0>
c0103541:	83 e8 01             	sub    $0x1,%eax
c0103544:	83 c7 14             	add    $0x14,%edi
c0103547:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010354a:	c1 e0 02             	shl    $0x2,%eax
c010354d:	83 c2 14             	add    $0x14,%edx
c0103550:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c0103553:	01 d0                	add    %edx,%eax
c0103555:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103558:	8b 13                	mov    (%ebx),%edx
c010355a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010355d:	8b 00                	mov    (%eax),%eax
c010355f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0103562:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103565:	31 d2                	xor    %edx,%edx
c0103567:	f7 f1                	div    %ecx
c0103569:	85 c0                	test   %eax,%eax
c010356b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010356e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103571:	0f 84 b5 00 00 00    	je     c010362c <quorem+0x10c>
c0103577:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010357a:	31 f6                	xor    %esi,%esi
c010357c:	89 fa                	mov    %edi,%edx
c010357e:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0103581:	89 f7                	mov    %esi,%edi
c0103583:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c010358a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103590:	83 c2 04             	add    $0x4,%edx
c0103593:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103596:	83 c0 04             	add    $0x4,%eax
c0103599:	0f b7 ce             	movzwl %si,%ecx
c010359c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c01035a0:	03 4d dc             	add    -0x24(%ebp),%ecx
c01035a3:	c1 ee 10             	shr    $0x10,%esi
c01035a6:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c01035aa:	89 cb                	mov    %ecx,%ebx
c01035ac:	0f b7 c9             	movzwl %cx,%ecx
c01035af:	c1 eb 10             	shr    $0x10,%ebx
c01035b2:	29 cf                	sub    %ecx,%edi
c01035b4:	01 f3                	add    %esi,%ebx
c01035b6:	89 de                	mov    %ebx,%esi
c01035b8:	0f b7 db             	movzwl %bx,%ebx
c01035bb:	c1 ee 10             	shr    $0x10,%esi
c01035be:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01035c1:	8b 70 fc             	mov    -0x4(%eax),%esi
c01035c4:	0f b7 ce             	movzwl %si,%ecx
c01035c7:	01 f9                	add    %edi,%ecx
c01035c9:	c1 ee 10             	shr    $0x10,%esi
c01035cc:	29 de                	sub    %ebx,%esi
c01035ce:	89 cb                	mov    %ecx,%ebx
c01035d0:	c1 fb 10             	sar    $0x10,%ebx
c01035d3:	0f b7 c9             	movzwl %cx,%ecx
c01035d6:	01 de                	add    %ebx,%esi
c01035d8:	89 f7                	mov    %esi,%edi
c01035da:	c1 e6 10             	shl    $0x10,%esi
c01035dd:	09 ce                	or     %ecx,%esi
c01035df:	c1 ff 10             	sar    $0x10,%edi
c01035e2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c01035e5:	89 70 fc             	mov    %esi,-0x4(%eax)
c01035e8:	73 a6                	jae    c0103590 <quorem+0x70>
c01035ea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01035ed:	8b 7d c0             	mov    -0x40(%ebp),%edi
c01035f0:	8b 10                	mov    (%eax),%edx
c01035f2:	85 d2                	test   %edx,%edx
c01035f4:	75 36                	jne    c010362c <quorem+0x10c>
c01035f6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01035f9:	89 c2                	mov    %eax,%edx
c01035fb:	83 e8 04             	sub    $0x4,%eax
c01035fe:	39 c1                	cmp    %eax,%ecx
c0103600:	73 21                	jae    c0103623 <quorem+0x103>
c0103602:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103605:	85 f6                	test   %esi,%esi
c0103607:	75 1a                	jne    c0103623 <quorem+0x103>
c0103609:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010360c:	eb 08                	jmp    c0103616 <quorem+0xf6>
c010360e:	66 90                	xchg   %ax,%ax
c0103610:	8b 18                	mov    (%eax),%ebx
c0103612:	85 db                	test   %ebx,%ebx
c0103614:	75 0a                	jne    c0103620 <quorem+0x100>
c0103616:	83 e8 04             	sub    $0x4,%eax
c0103619:	83 ea 01             	sub    $0x1,%edx
c010361c:	39 c1                	cmp    %eax,%ecx
c010361e:	72 f0                	jb     c0103610 <quorem+0xf0>
c0103620:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103623:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103626:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103629:	89 50 10             	mov    %edx,0x10(%eax)
c010362c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010362f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103633:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103636:	89 04 24             	mov    %eax,(%esp)
c0103639:	e8 a2 23 00 00       	call   c01059e0 <__mcmp>
c010363e:	85 c0                	test   %eax,%eax
c0103640:	0f 88 8e 00 00 00    	js     c01036d4 <quorem+0x1b4>
c0103646:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103649:	31 f6                	xor    %esi,%esi
c010364b:	83 c0 01             	add    $0x1,%eax
c010364e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103651:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103658:	83 c7 04             	add    $0x4,%edi
c010365b:	8b 4f fc             	mov    -0x4(%edi),%ecx
c010365e:	83 c0 04             	add    $0x4,%eax
c0103661:	8b 58 fc             	mov    -0x4(%eax),%ebx
c0103664:	0f b7 d1             	movzwl %cx,%edx
c0103667:	29 d6                	sub    %edx,%esi
c0103669:	0f b7 d3             	movzwl %bx,%edx
c010366c:	01 f2                	add    %esi,%edx
c010366e:	c1 e9 10             	shr    $0x10,%ecx
c0103671:	c1 eb 10             	shr    $0x10,%ebx
c0103674:	29 cb                	sub    %ecx,%ebx
c0103676:	89 d1                	mov    %edx,%ecx
c0103678:	c1 f9 10             	sar    $0x10,%ecx
c010367b:	0f b7 d2             	movzwl %dx,%edx
c010367e:	01 cb                	add    %ecx,%ebx
c0103680:	89 de                	mov    %ebx,%esi
c0103682:	c1 e3 10             	shl    $0x10,%ebx
c0103685:	09 d3                	or     %edx,%ebx
c0103687:	c1 fe 10             	sar    $0x10,%esi
c010368a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c010368d:	89 58 fc             	mov    %ebx,-0x4(%eax)
c0103690:	73 c6                	jae    c0103658 <quorem+0x138>
c0103692:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103695:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103698:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c010369b:	8b 02                	mov    (%edx),%eax
c010369d:	85 c0                	test   %eax,%eax
c010369f:	75 33                	jne    c01036d4 <quorem+0x1b4>
c01036a1:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01036a4:	8d 42 fc             	lea    -0x4(%edx),%eax
c01036a7:	39 c1                	cmp    %eax,%ecx
c01036a9:	73 20                	jae    c01036cb <quorem+0x1ab>
c01036ab:	8b 72 fc             	mov    -0x4(%edx),%esi
c01036ae:	85 f6                	test   %esi,%esi
c01036b0:	75 19                	jne    c01036cb <quorem+0x1ab>
c01036b2:	89 fa                	mov    %edi,%edx
c01036b4:	eb 08                	jmp    c01036be <quorem+0x19e>
c01036b6:	66 90                	xchg   %ax,%ax
c01036b8:	8b 18                	mov    (%eax),%ebx
c01036ba:	85 db                	test   %ebx,%ebx
c01036bc:	75 0a                	jne    c01036c8 <quorem+0x1a8>
c01036be:	83 e8 04             	sub    $0x4,%eax
c01036c1:	83 ea 01             	sub    $0x1,%edx
c01036c4:	39 c1                	cmp    %eax,%ecx
c01036c6:	72 f0                	jb     c01036b8 <quorem+0x198>
c01036c8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01036cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01036ce:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01036d1:	89 78 10             	mov    %edi,0x10(%eax)
c01036d4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01036d7:	83 c4 3c             	add    $0x3c,%esp
c01036da:	5b                   	pop    %ebx
c01036db:	5e                   	pop    %esi
c01036dc:	5f                   	pop    %edi
c01036dd:	5d                   	pop    %ebp
c01036de:	c3                   	ret    
c01036df:	90                   	nop
c01036e0:	83 c4 3c             	add    $0x3c,%esp
c01036e3:	31 c0                	xor    %eax,%eax
c01036e5:	5b                   	pop    %ebx
c01036e6:	5e                   	pop    %esi
c01036e7:	5f                   	pop    %edi
c01036e8:	5d                   	pop    %ebp
c01036e9:	c3                   	ret    
c01036ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01036f0 <_dtoa_r>:
c01036f0:	55                   	push   %ebp
c01036f1:	89 e5                	mov    %esp,%ebp
c01036f3:	57                   	push   %edi
c01036f4:	56                   	push   %esi
c01036f5:	53                   	push   %ebx
c01036f6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c01036fc:	8b 75 08             	mov    0x8(%ebp),%esi
c01036ff:	dd 45 0c             	fldl   0xc(%ebp)
c0103702:	8b 5d 20             	mov    0x20(%ebp),%ebx
c0103705:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103708:	8b 46 40             	mov    0x40(%esi),%eax
c010370b:	85 c0                	test   %eax,%eax
c010370d:	74 23                	je     c0103732 <_dtoa_r+0x42>
c010370f:	8b 4e 44             	mov    0x44(%esi),%ecx
c0103712:	ba 01 00 00 00       	mov    $0x1,%edx
c0103717:	d3 e2                	shl    %cl,%edx
c0103719:	89 48 04             	mov    %ecx,0x4(%eax)
c010371c:	89 50 08             	mov    %edx,0x8(%eax)
c010371f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103723:	89 34 24             	mov    %esi,(%esp)
c0103726:	e8 95 1b 00 00       	call   c01052c0 <_Bfree>
c010372b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c0103732:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0103735:	85 ff                	test   %edi,%edi
c0103737:	0f 88 3b 02 00 00    	js     c0103978 <_dtoa_r+0x288>
c010373d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0103743:	89 f8                	mov    %edi,%eax
c0103745:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c010374a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c010374f:	0f 84 e3 01 00 00    	je     c0103938 <_dtoa_r+0x248>
c0103755:	dd 45 c0             	fldl   -0x40(%ebp)
c0103758:	d9 ee                	fldz   
c010375a:	d9 c9                	fxch   %st(1)
c010375c:	db e9                	fucomi %st(1),%st
c010375e:	dd d9                	fstp   %st(1)
c0103760:	7a 36                	jp     c0103798 <_dtoa_r+0xa8>
c0103762:	75 34                	jne    c0103798 <_dtoa_r+0xa8>
c0103764:	dd d8                	fstp   %st(0)
c0103766:	8b 4d 24             	mov    0x24(%ebp),%ecx
c0103769:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010376c:	85 c9                	test   %ecx,%ecx
c010376e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0103774:	0f 84 4e 02 00 00    	je     c01039c8 <_dtoa_r+0x2d8>
c010377a:	8b 45 24             	mov    0x24(%ebp),%eax
c010377d:	c7 00 58 81 10 c0    	movl   $0xc0108158,(%eax)
c0103783:	b8 57 81 10 c0       	mov    $0xc0108157,%eax
c0103788:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c010378e:	5b                   	pop    %ebx
c010378f:	5e                   	pop    %esi
c0103790:	5f                   	pop    %edi
c0103791:	5d                   	pop    %ebp
c0103792:	c3                   	ret    
c0103793:	90                   	nop
c0103794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103798:	8d 45 e0             	lea    -0x20(%ebp),%eax
c010379b:	89 fb                	mov    %edi,%ebx
c010379d:	89 44 24 10          	mov    %eax,0x10(%esp)
c01037a1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01037a4:	dd 54 24 04          	fstl   0x4(%esp)
c01037a8:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01037ac:	dd 5d b8             	fstpl  -0x48(%ebp)
c01037af:	89 34 24             	mov    %esi,(%esp)
c01037b2:	c1 eb 14             	shr    $0x14,%ebx
c01037b5:	e8 76 25 00 00       	call   c0105d30 <__d2b>
c01037ba:	85 db                	test   %ebx,%ebx
c01037bc:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01037bf:	0f 85 db 01 00 00    	jne    c01039a0 <_dtoa_r+0x2b0>
c01037c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01037c8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01037cb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01037ce:	01 c3                	add    %eax,%ebx
c01037d0:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c01037d6:	0f 8c ec 07 00 00    	jl     c0103fc8 <_dtoa_r+0x8d8>
c01037dc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01037df:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c01037e4:	89 f8                	mov    %edi,%eax
c01037e6:	29 d9                	sub    %ebx,%ecx
c01037e8:	d3 e0                	shl    %cl,%eax
c01037ea:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c01037f0:	d3 ea                	shr    %cl,%edx
c01037f2:	09 d0                	or     %edx,%eax
c01037f4:	31 d2                	xor    %edx,%edx
c01037f6:	83 eb 01             	sub    $0x1,%ebx
c01037f9:	89 55 cc             	mov    %edx,-0x34(%ebp)
c01037fc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01037ff:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103802:	df 6d c8             	fildll -0x38(%ebp)
c0103805:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103808:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c010380f:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0103816:	dd 45 b8             	fldl   -0x48(%ebp)
c0103819:	d8 25 f0 82 10 c0    	fsubs  0xc01082f0
c010381f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c0103822:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103825:	dc 0d 08 83 10 c0    	fmull  0xc0108308
c010382b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c010382f:	b4 0c                	mov    $0xc,%ah
c0103831:	dc 05 10 83 10 c0    	faddl  0xc0108310
c0103837:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010383b:	db 45 d4             	fildl  -0x2c(%ebp)
c010383e:	dc 0d 18 83 10 c0    	fmull  0xc0108318
c0103844:	de c1                	faddp  %st,%st(1)
c0103846:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103849:	db 55 b8             	fistl  -0x48(%ebp)
c010384c:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010384f:	d9 ee                	fldz   
c0103851:	df e9                	fucomip %st(1),%st
c0103853:	0f 87 27 07 00 00    	ja     c0103f80 <_dtoa_r+0x890>
c0103859:	dd d8                	fstp   %st(0)
c010385b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c010385f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c0103866:	77 24                	ja     c010388c <_dtoa_r+0x19c>
c0103868:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010386b:	dd 04 c5 e0 83 10 c0 	fldl   -0x3fef7c20(,%eax,8)
c0103872:	dd 45 c0             	fldl   -0x40(%ebp)
c0103875:	d9 c9                	fxch   %st(1)
c0103877:	df e9                	fucomip %st(1),%st
c0103879:	dd d8                	fstp   %st(0)
c010387b:	0f 86 5f 07 00 00    	jbe    c0103fe0 <_dtoa_r+0x8f0>
c0103881:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103885:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c010388c:	89 d0                	mov    %edx,%eax
c010388e:	29 d8                	sub    %ebx,%eax
c0103890:	83 e8 01             	sub    $0x1,%eax
c0103893:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c010389a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010389d:	0f 88 0d 07 00 00    	js     c0103fb0 <_dtoa_r+0x8c0>
c01038a3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01038a6:	85 c0                	test   %eax,%eax
c01038a8:	0f 88 ea 06 00 00    	js     c0103f98 <_dtoa_r+0x8a8>
c01038ae:	01 45 ac             	add    %eax,-0x54(%ebp)
c01038b1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01038b4:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01038bb:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c01038bf:	0f 87 0b 03 00 00    	ja     c0103bd0 <_dtoa_r+0x4e0>
c01038c5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01038c9:	0f 8e 23 10 00 00    	jle    c01048f2 <_dtoa_r+0x1202>
c01038cf:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c01038d3:	31 c0                	xor    %eax,%eax
c01038d5:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c01038d9:	0f 84 43 0d 00 00    	je     c0104622 <_dtoa_r+0xf32>
c01038df:	0f 8e f3 00 00 00    	jle    c01039d8 <_dtoa_r+0x2e8>
c01038e5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c01038e9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c01038f0:	0f 84 f3 00 00 00    	je     c01039e9 <_dtoa_r+0x2f9>
c01038f6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01038fa:	0f 85 d7 02 00 00    	jne    c0103bd7 <_dtoa_r+0x4e7>
c0103900:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103903:	03 5d 18             	add    0x18(%ebp),%ebx
c0103906:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c0103909:	83 c3 01             	add    $0x1,%ebx
c010390c:	83 fb 0e             	cmp    $0xe,%ebx
c010390f:	0f 96 c2             	setbe  %dl
c0103912:	85 db                	test   %ebx,%ebx
c0103914:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c0103917:	0f 8e a7 08 00 00    	jle    c01041c4 <_dtoa_r+0xad4>
c010391d:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103920:	83 fb 0e             	cmp    $0xe,%ebx
c0103923:	89 df                	mov    %ebx,%edi
c0103925:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103929:	20 45 b4             	and    %al,-0x4c(%ebp)
c010392c:	e9 d6 00 00 00       	jmp    c0103a07 <_dtoa_r+0x317>
c0103931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103938:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010393b:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010393e:	85 d2                	test   %edx,%edx
c0103940:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0103946:	b8 e9 82 10 c0       	mov    $0xc01082e9,%eax
c010394b:	74 43                	je     c0103990 <_dtoa_r+0x2a0>
c010394d:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0103950:	85 db                	test   %ebx,%ebx
c0103952:	0f 84 30 fe ff ff    	je     c0103788 <_dtoa_r+0x98>
c0103958:	8b 75 24             	mov    0x24(%ebp),%esi
c010395b:	8d 50 08             	lea    0x8(%eax),%edx
c010395e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0103962:	8d 48 03             	lea    0x3(%eax),%ecx
c0103965:	0f 44 d1             	cmove  %ecx,%edx
c0103968:	89 16                	mov    %edx,(%esi)
c010396a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103970:	5b                   	pop    %ebx
c0103971:	5e                   	pop    %esi
c0103972:	5f                   	pop    %edi
c0103973:	5d                   	pop    %ebp
c0103974:	c3                   	ret    
c0103975:	8d 76 00             	lea    0x0(%esi),%esi
c0103978:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c010397e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c0103984:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c0103987:	e9 b7 fd ff ff       	jmp    c0103743 <_dtoa_r+0x53>
c010398c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103990:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c0103996:	ba e0 82 10 c0       	mov    $0xc01082e0,%edx
c010399b:	0f 44 c2             	cmove  %edx,%eax
c010399e:	eb ad                	jmp    c010394d <_dtoa_r+0x25d>
c01039a0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01039a3:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c01039a9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01039ac:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01039b3:	25 ff ff 0f 00       	and    $0xfffff,%eax
c01039b8:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c01039bd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01039c0:	e9 51 fe ff ff       	jmp    c0103816 <_dtoa_r+0x126>
c01039c5:	8d 76 00             	lea    0x0(%esi),%esi
c01039c8:	b8 57 81 10 c0       	mov    $0xc0108157,%eax
c01039cd:	e9 b6 fd ff ff       	jmp    c0103788 <_dtoa_r+0x98>
c01039d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01039d8:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01039dc:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01039e3:	0f 85 ee 01 00 00    	jne    c0103bd7 <_dtoa_r+0x4e7>
c01039e9:	8b 55 18             	mov    0x18(%ebp),%edx
c01039ec:	85 d2                	test   %edx,%edx
c01039ee:	0f 8e b6 07 00 00    	jle    c01041aa <_dtoa_r+0xaba>
c01039f4:	8b 7d 18             	mov    0x18(%ebp),%edi
c01039f7:	83 ff 0e             	cmp    $0xe,%edi
c01039fa:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c01039fe:	20 45 b4             	and    %al,-0x4c(%ebp)
c0103a01:	89 7d 90             	mov    %edi,-0x70(%ebp)
c0103a04:	89 7d a8             	mov    %edi,-0x58(%ebp)
c0103a07:	83 ff 17             	cmp    $0x17,%edi
c0103a0a:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103a11:	0f 86 e5 0e 00 00    	jbe    c01048fc <_dtoa_r+0x120c>
c0103a17:	b9 01 00 00 00       	mov    $0x1,%ecx
c0103a1c:	b8 04 00 00 00       	mov    $0x4,%eax
c0103a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103a28:	01 c0                	add    %eax,%eax
c0103a2a:	89 ca                	mov    %ecx,%edx
c0103a2c:	8d 58 14             	lea    0x14(%eax),%ebx
c0103a2f:	39 fb                	cmp    %edi,%ebx
c0103a31:	8d 49 01             	lea    0x1(%ecx),%ecx
c0103a34:	76 f2                	jbe    c0103a28 <_dtoa_r+0x338>
c0103a36:	89 56 44             	mov    %edx,0x44(%esi)
c0103a39:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103a3d:	89 34 24             	mov    %esi,(%esp)
c0103a40:	e8 db 17 00 00       	call   c0105220 <_Balloc>
c0103a45:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0103a49:	89 c7                	mov    %eax,%edi
c0103a4b:	89 46 40             	mov    %eax,0x40(%esi)
c0103a4e:	0f 84 bb 01 00 00    	je     c0103c0f <_dtoa_r+0x51f>
c0103a54:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103a57:	dd 45 c0             	fldl   -0x40(%ebp)
c0103a5a:	85 db                	test   %ebx,%ebx
c0103a5c:	0f 8e de 07 00 00    	jle    c0104240 <_dtoa_r+0xb50>
c0103a62:	89 d8                	mov    %ebx,%eax
c0103a64:	83 e0 0f             	and    $0xf,%eax
c0103a67:	dd 04 c5 e0 83 10 c0 	fldl   -0x3fef7c20(,%eax,8)
c0103a6e:	89 d8                	mov    %ebx,%eax
c0103a70:	c1 f8 04             	sar    $0x4,%eax
c0103a73:	a8 10                	test   $0x10,%al
c0103a75:	0f 84 cd 05 00 00    	je     c0104048 <_dtoa_r+0x958>
c0103a7b:	dd 05 c0 83 10 c0    	fldl   0xc01083c0
c0103a81:	83 e0 0f             	and    $0xf,%eax
c0103a84:	b9 03 00 00 00       	mov    $0x3,%ecx
c0103a89:	d8 fa                	fdivr  %st(2),%st
c0103a8b:	85 c0                	test   %eax,%eax
c0103a8d:	74 22                	je     c0103ab1 <_dtoa_r+0x3c1>
c0103a8f:	31 d2                	xor    %edx,%edx
c0103a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103a98:	a8 01                	test   $0x1,%al
c0103a9a:	74 0e                	je     c0103aaa <_dtoa_r+0x3ba>
c0103a9c:	d9 c9                	fxch   %st(1)
c0103a9e:	dc 0c d5 a0 83 10 c0 	fmull  -0x3fef7c60(,%edx,8)
c0103aa5:	d9 c9                	fxch   %st(1)
c0103aa7:	83 c1 01             	add    $0x1,%ecx
c0103aaa:	83 c2 01             	add    $0x1,%edx
c0103aad:	d1 f8                	sar    %eax
c0103aaf:	75 e7                	jne    c0103a98 <_dtoa_r+0x3a8>
c0103ab1:	de f1                	fdivp  %st,%st(1)
c0103ab3:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103ab6:	85 c0                	test   %eax,%eax
c0103ab8:	74 0a                	je     c0103ac4 <_dtoa_r+0x3d4>
c0103aba:	d9 e8                	fld1   
c0103abc:	df e9                	fucomip %st(1),%st
c0103abe:	0f 87 92 0b 00 00    	ja     c0104656 <_dtoa_r+0xf66>
c0103ac4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0103ac7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103aca:	db 45 d4             	fildl  -0x2c(%ebp)
c0103acd:	d8 c9                	fmul   %st(1),%st
c0103acf:	d8 05 fc 82 10 c0    	fadds  0xc01082fc
c0103ad5:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103ad8:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0103adf:	85 c0                	test   %eax,%eax
c0103ae1:	0f 84 89 05 00 00    	je     c0104070 <_dtoa_r+0x980>
c0103ae7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103aea:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0103aed:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103af0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103af3:	85 c0                	test   %eax,%eax
c0103af5:	0f 84 b5 07 00 00    	je     c01042b0 <_dtoa_r+0xbc0>
c0103afb:	d9 05 04 83 10 c0    	flds   0xc0108304
c0103b01:	8d 57 01             	lea    0x1(%edi),%edx
c0103b04:	dc 34 cd d8 83 10 c0 	fdivl  -0x3fef7c28(,%ecx,8)
c0103b0b:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103b0e:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103b12:	b4 0c                	mov    $0xc,%ah
c0103b14:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103b18:	dc 65 c0             	fsubl  -0x40(%ebp)
c0103b1b:	d9 c9                	fxch   %st(1)
c0103b1d:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103b20:	db 55 d4             	fistl  -0x2c(%ebp)
c0103b23:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103b26:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103b2c:	83 c0 30             	add    $0x30,%eax
c0103b2f:	db 45 d4             	fildl  -0x2c(%ebp)
c0103b32:	de e9                	fsubrp %st,%st(1)
c0103b34:	d9 c9                	fxch   %st(1)
c0103b36:	88 07                	mov    %al,(%edi)
c0103b38:	db e9                	fucomi %st(1),%st
c0103b3a:	77 7f                	ja     c0103bbb <_dtoa_r+0x4cb>
c0103b3c:	d9 c1                	fld    %st(1)
c0103b3e:	d8 2d f4 82 10 c0    	fsubrs 0xc01082f4
c0103b44:	d9 c9                	fxch   %st(1)
c0103b46:	db e9                	fucomi %st(1),%st
c0103b48:	dd d9                	fstp   %st(1)
c0103b4a:	0f 87 33 0c 00 00    	ja     c0104783 <_dtoa_r+0x1093>
c0103b50:	83 f9 01             	cmp    $0x1,%ecx
c0103b53:	0f 8e c4 06 00 00    	jle    c010421d <_dtoa_r+0xb2d>
c0103b59:	01 f9                	add    %edi,%ecx
c0103b5b:	d9 05 f8 82 10 c0    	flds   0xc01082f8
c0103b61:	eb 25                	jmp    c0103b88 <_dtoa_r+0x498>
c0103b63:	90                   	nop
c0103b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b68:	d9 c1                	fld    %st(1)
c0103b6a:	d8 2d f4 82 10 c0    	fsubrs 0xc01082f4
c0103b70:	d9 c9                	fxch   %st(1)
c0103b72:	db e9                	fucomi %st(1),%st
c0103b74:	dd d9                	fstp   %st(1)
c0103b76:	0f 87 14 0c 00 00    	ja     c0104790 <_dtoa_r+0x10a0>
c0103b7c:	39 ca                	cmp    %ecx,%edx
c0103b7e:	0f 84 a4 06 00 00    	je     c0104228 <_dtoa_r+0xb38>
c0103b84:	d9 c9                	fxch   %st(1)
c0103b86:	d9 ca                	fxch   %st(2)
c0103b88:	dc c9                	fmul   %st,%st(1)
c0103b8a:	83 c2 01             	add    $0x1,%edx
c0103b8d:	dc ca                	fmul   %st,%st(2)
c0103b8f:	d9 ca                	fxch   %st(2)
c0103b91:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103b94:	db 55 d4             	fistl  -0x2c(%ebp)
c0103b97:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103b9a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b9d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103ba0:	83 c0 30             	add    $0x30,%eax
c0103ba3:	db 45 d4             	fildl  -0x2c(%ebp)
c0103ba6:	de e9                	fsubrp %st,%st(1)
c0103ba8:	d9 c9                	fxch   %st(1)
c0103baa:	88 42 ff             	mov    %al,-0x1(%edx)
c0103bad:	db e9                	fucomi %st(1),%st
c0103baf:	76 b7                	jbe    c0103b68 <_dtoa_r+0x478>
c0103bb1:	dd d8                	fstp   %st(0)
c0103bb3:	dd d8                	fstp   %st(0)
c0103bb5:	dd d8                	fstp   %st(0)
c0103bb7:	dd d8                	fstp   %st(0)
c0103bb9:	eb 06                	jmp    c0103bc1 <_dtoa_r+0x4d1>
c0103bbb:	dd d8                	fstp   %st(0)
c0103bbd:	dd d8                	fstp   %st(0)
c0103bbf:	dd d8                	fstp   %st(0)
c0103bc1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103bc4:	89 fb                	mov    %edi,%ebx
c0103bc6:	89 d7                	mov    %edx,%edi
c0103bc8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103bcb:	e9 70 03 00 00       	jmp    c0103f40 <_dtoa_r+0x850>
c0103bd0:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c0103bd7:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103bde:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103be5:	00 
c0103be6:	89 34 24             	mov    %esi,(%esp)
c0103be9:	e8 32 16 00 00       	call   c0105220 <_Balloc>
c0103bee:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103bf5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c0103bfc:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c0103c03:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c0103c0a:	89 c7                	mov    %eax,%edi
c0103c0c:	89 46 40             	mov    %eax,0x40(%esi)
c0103c0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c12:	85 c0                	test   %eax,%eax
c0103c14:	0f 88 2e 01 00 00    	js     c0103d48 <_dtoa_r+0x658>
c0103c1a:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c0103c1e:	0f 8f 24 01 00 00    	jg     c0103d48 <_dtoa_r+0x658>
c0103c24:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103c27:	dd 04 c5 e0 83 10 c0 	fldl   -0x3fef7c20(,%eax,8)
c0103c2e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103c31:	85 c0                	test   %eax,%eax
c0103c33:	7f 0e                	jg     c0103c43 <_dtoa_r+0x553>
c0103c35:	8b 45 18             	mov    0x18(%ebp),%eax
c0103c38:	c1 e8 1f             	shr    $0x1f,%eax
c0103c3b:	84 c0                	test   %al,%al
c0103c3d:	0f 85 9d 07 00 00    	jne    c01043e0 <_dtoa_r+0xcf0>
c0103c43:	dd 45 c0             	fldl   -0x40(%ebp)
c0103c46:	d9 c0                	fld    %st(0)
c0103c48:	d8 f2                	fdiv   %st(2),%st
c0103c4a:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103c4d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0103c51:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103c55:	b4 0c                	mov    $0xc,%ah
c0103c57:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103c5b:	8d 47 01             	lea    0x1(%edi),%eax
c0103c5e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103c61:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103c64:	db 5d d4             	fistpl -0x2c(%ebp)
c0103c67:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103c6a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103c6d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103c70:	8d 42 30             	lea    0x30(%edx),%eax
c0103c73:	db 45 d4             	fildl  -0x2c(%ebp)
c0103c76:	d8 ca                	fmul   %st(2),%st
c0103c78:	88 07                	mov    %al,(%edi)
c0103c7a:	de e9                	fsubrp %st,%st(1)
c0103c7c:	74 66                	je     c0103ce4 <_dtoa_r+0x5f4>
c0103c7e:	d8 0d f8 82 10 c0    	fmuls  0xc01082f8
c0103c84:	d9 ee                	fldz   
c0103c86:	d9 c9                	fxch   %st(1)
c0103c88:	db e9                	fucomi %st(1),%st
c0103c8a:	dd d9                	fstp   %st(1)
c0103c8c:	0f 8b 33 0c 00 00    	jnp    c01048c5 <_dtoa_r+0x11d5>
c0103c92:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103c95:	8d 47 02             	lea    0x2(%edi),%eax
c0103c98:	d9 05 f8 82 10 c0    	flds   0xc01082f8
c0103c9e:	01 fb                	add    %edi,%ebx
c0103ca0:	eb 19                	jmp    c0103cbb <_dtoa_r+0x5cb>
c0103ca2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103ca8:	dc c9                	fmul   %st,%st(1)
c0103caa:	83 c0 01             	add    $0x1,%eax
c0103cad:	d9 ee                	fldz   
c0103caf:	d9 ca                	fxch   %st(2)
c0103cb1:	db ea                	fucomi %st(2),%st
c0103cb3:	dd da                	fstp   %st(2)
c0103cb5:	0f 8b 73 09 00 00    	jnp    c010462e <_dtoa_r+0xf3e>
c0103cbb:	d9 c1                	fld    %st(1)
c0103cbd:	39 d8                	cmp    %ebx,%eax
c0103cbf:	d8 f3                	fdiv   %st(3),%st
c0103cc1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103cc4:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103cc7:	db 5d d4             	fistpl -0x2c(%ebp)
c0103cca:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103ccd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103cd0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103cd3:	8d 4a 30             	lea    0x30(%edx),%ecx
c0103cd6:	db 45 d4             	fildl  -0x2c(%ebp)
c0103cd9:	d8 cb                	fmul   %st(3),%st
c0103cdb:	88 48 ff             	mov    %cl,-0x1(%eax)
c0103cde:	de ea                	fsubrp %st,%st(2)
c0103ce0:	75 c6                	jne    c0103ca8 <_dtoa_r+0x5b8>
c0103ce2:	dd d8                	fstp   %st(0)
c0103ce4:	d8 c0                	fadd   %st(0),%st
c0103ce6:	db e9                	fucomi %st(1),%st
c0103ce8:	77 1e                	ja     c0103d08 <_dtoa_r+0x618>
c0103cea:	d9 c9                	fxch   %st(1)
c0103cec:	df e9                	fucomip %st(1),%st
c0103cee:	dd d8                	fstp   %st(0)
c0103cf0:	0f 8a 44 09 00 00    	jp     c010463a <_dtoa_r+0xf4a>
c0103cf6:	0f 85 3e 09 00 00    	jne    c010463a <_dtoa_r+0xf4a>
c0103cfc:	83 e2 01             	and    $0x1,%edx
c0103cff:	90                   	nop
c0103d00:	0f 84 34 09 00 00    	je     c010463a <_dtoa_r+0xf4a>
c0103d06:	eb 04                	jmp    c0103d0c <_dtoa_r+0x61c>
c0103d08:	dd d8                	fstp   %st(0)
c0103d0a:	dd d8                	fstp   %st(0)
c0103d0c:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0103d0f:	89 fb                	mov    %edi,%ebx
c0103d11:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c0103d15:	89 cf                	mov    %ecx,%edi
c0103d17:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c0103d1a:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c0103d1d:	eb 0f                	jmp    c0103d2e <_dtoa_r+0x63e>
c0103d1f:	90                   	nop
c0103d20:	39 d3                	cmp    %edx,%ebx
c0103d22:	0f 84 75 09 00 00    	je     c010469d <_dtoa_r+0xfad>
c0103d28:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0103d2c:	89 d7                	mov    %edx,%edi
c0103d2e:	3c 39                	cmp    $0x39,%al
c0103d30:	8d 57 ff             	lea    -0x1(%edi),%edx
c0103d33:	74 eb                	je     c0103d20 <_dtoa_r+0x630>
c0103d35:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0103d38:	83 c0 01             	add    $0x1,%eax
c0103d3b:	88 02                	mov    %al,(%edx)
c0103d3d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0103d40:	e9 fb 01 00 00       	jmp    c0103f40 <_dtoa_r+0x850>
c0103d45:	8d 76 00             	lea    0x0(%esi),%esi
c0103d48:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0103d4b:	85 c9                	test   %ecx,%ecx
c0103d4d:	0f 85 9d 02 00 00    	jne    c0103ff0 <_dtoa_r+0x900>
c0103d53:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0103d56:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0103d59:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0103d60:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d63:	85 c0                	test   %eax,%eax
c0103d65:	7e 14                	jle    c0103d7b <_dtoa_r+0x68b>
c0103d67:	85 db                	test   %ebx,%ebx
c0103d69:	7e 10                	jle    c0103d7b <_dtoa_r+0x68b>
c0103d6b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d6e:	39 d8                	cmp    %ebx,%eax
c0103d70:	0f 4f c3             	cmovg  %ebx,%eax
c0103d73:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103d76:	29 c3                	sub    %eax,%ebx
c0103d78:	29 45 ac             	sub    %eax,-0x54(%ebp)
c0103d7b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103d7e:	85 c0                	test   %eax,%eax
c0103d80:	7e 61                	jle    c0103de3 <_dtoa_r+0x6f3>
c0103d82:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103d85:	85 c0                	test   %eax,%eax
c0103d87:	0f 84 72 04 00 00    	je     c01041ff <_dtoa_r+0xb0f>
c0103d8d:	85 d2                	test   %edx,%edx
c0103d8f:	7e 47                	jle    c0103dd8 <_dtoa_r+0x6e8>
c0103d91:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103d94:	89 54 24 08          	mov    %edx,0x8(%esp)
c0103d98:	89 34 24             	mov    %esi,(%esp)
c0103d9b:	89 55 88             	mov    %edx,-0x78(%ebp)
c0103d9e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103da2:	e8 f9 19 00 00       	call   c01057a0 <__pow5mult>
c0103da7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103daa:	89 34 24             	mov    %esi,(%esp)
c0103dad:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103db1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103db5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103db8:	e8 13 18 00 00       	call   c01055d0 <__multiply>
c0103dbd:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103dc0:	89 34 24             	mov    %esi,(%esp)
c0103dc3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0103dc7:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0103dca:	e8 f1 14 00 00       	call   c01052c0 <_Bfree>
c0103dcf:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0103dd2:	8b 55 88             	mov    -0x78(%ebp),%edx
c0103dd5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103dd8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ddb:	29 d0                	sub    %edx,%eax
c0103ddd:	0f 85 1f 04 00 00    	jne    c0104202 <_dtoa_r+0xb12>
c0103de3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103dea:	00 
c0103deb:	89 34 24             	mov    %esi,(%esp)
c0103dee:	e8 ad 17 00 00       	call   c01055a0 <__i2b>
c0103df3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0103df6:	85 c9                	test   %ecx,%ecx
c0103df8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103dfb:	7e 13                	jle    c0103e10 <_dtoa_r+0x720>
c0103dfd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103e01:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e05:	89 34 24             	mov    %esi,(%esp)
c0103e08:	e8 93 19 00 00       	call   c01057a0 <__pow5mult>
c0103e0d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103e10:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103e14:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103e1b:	0f 8e f7 05 00 00    	jle    c0104418 <_dtoa_r+0xd28>
c0103e21:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103e24:	ba 01 00 00 00       	mov    $0x1,%edx
c0103e29:	85 c0                	test   %eax,%eax
c0103e2b:	0f 85 27 05 00 00    	jne    c0104358 <_dtoa_r+0xc68>
c0103e31:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103e34:	01 d0                	add    %edx,%eax
c0103e36:	83 e0 1f             	and    $0x1f,%eax
c0103e39:	89 c2                	mov    %eax,%edx
c0103e3b:	0f 84 57 03 00 00    	je     c0104198 <_dtoa_r+0xaa8>
c0103e41:	b8 20 00 00 00       	mov    $0x20,%eax
c0103e46:	29 d0                	sub    %edx,%eax
c0103e48:	83 f8 04             	cmp    $0x4,%eax
c0103e4b:	0f 8e 8c 0a 00 00    	jle    c01048dd <_dtoa_r+0x11ed>
c0103e51:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0103e56:	29 d0                	sub    %edx,%eax
c0103e58:	01 45 a0             	add    %eax,-0x60(%ebp)
c0103e5b:	01 c3                	add    %eax,%ebx
c0103e5d:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103e60:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103e63:	85 c0                	test   %eax,%eax
c0103e65:	7e 16                	jle    c0103e7d <_dtoa_r+0x78d>
c0103e67:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103e6b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103e6e:	89 34 24             	mov    %esi,(%esp)
c0103e71:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e75:	e8 46 1a 00 00       	call   c01058c0 <__lshift>
c0103e7a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103e7d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103e80:	85 c0                	test   %eax,%eax
c0103e82:	7e 16                	jle    c0103e9a <_dtoa_r+0x7aa>
c0103e84:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103e88:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103e8b:	89 34 24             	mov    %esi,(%esp)
c0103e8e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e92:	e8 29 1a 00 00       	call   c01058c0 <__lshift>
c0103e97:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103e9a:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103e9d:	85 c0                	test   %eax,%eax
c0103e9f:	0f 85 d3 04 00 00    	jne    c0104378 <_dtoa_r+0xc88>
c0103ea5:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0103ea9:	0f 8e 11 02 00 00    	jle    c01040c0 <_dtoa_r+0x9d0>
c0103eaf:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103eb2:	85 c0                	test   %eax,%eax
c0103eb4:	0f 8f 06 02 00 00    	jg     c01040c0 <_dtoa_r+0x9d0>
c0103eba:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103ebd:	85 c0                	test   %eax,%eax
c0103ebf:	0f 85 e0 01 00 00    	jne    c01040a5 <_dtoa_r+0x9b5>
c0103ec5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ec8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0103ecf:	00 
c0103ed0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c0103ed7:	00 
c0103ed8:	89 34 24             	mov    %esi,(%esp)
c0103edb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103edf:	e8 fc 13 00 00       	call   c01052e0 <__multadd>
c0103ee4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103ee7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103eeb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103eee:	89 04 24             	mov    %eax,(%esp)
c0103ef1:	e8 ea 1a 00 00       	call   c01059e0 <__mcmp>
c0103ef6:	85 c0                	test   %eax,%eax
c0103ef8:	0f 8e a7 01 00 00    	jle    c01040a5 <_dtoa_r+0x9b5>
c0103efe:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0103f02:	89 fb                	mov    %edi,%ebx
c0103f04:	83 c7 01             	add    $0x1,%edi
c0103f07:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c0103f0b:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0103f12:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103f15:	89 34 24             	mov    %esi,(%esp)
c0103f18:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f1c:	e8 9f 13 00 00       	call   c01052c0 <_Bfree>
c0103f21:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f24:	85 c0                	test   %eax,%eax
c0103f26:	74 18                	je     c0103f40 <_dtoa_r+0x850>
c0103f28:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0103f2b:	0f 85 a7 02 00 00    	jne    c01041d8 <_dtoa_r+0xae8>
c0103f31:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f34:	89 34 24             	mov    %esi,(%esp)
c0103f37:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f3b:	e8 80 13 00 00       	call   c01052c0 <_Bfree>
c0103f40:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103f43:	89 34 24             	mov    %esi,(%esp)
c0103f46:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f4a:	e8 71 13 00 00       	call   c01052c0 <_Bfree>
c0103f4f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f52:	8b 75 1c             	mov    0x1c(%ebp),%esi
c0103f55:	c6 07 00             	movb   $0x0,(%edi)
c0103f58:	83 c0 01             	add    $0x1,%eax
c0103f5b:	89 06                	mov    %eax,(%esi)
c0103f5d:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f60:	85 c0                	test   %eax,%eax
c0103f62:	0f 84 90 02 00 00    	je     c01041f8 <_dtoa_r+0xb08>
c0103f68:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f6b:	89 38                	mov    %edi,(%eax)
c0103f6d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103f73:	89 d8                	mov    %ebx,%eax
c0103f75:	5b                   	pop    %ebx
c0103f76:	5e                   	pop    %esi
c0103f77:	5f                   	pop    %edi
c0103f78:	5d                   	pop    %ebp
c0103f79:	c3                   	ret    
c0103f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103f80:	db 45 b8             	fildl  -0x48(%ebp)
c0103f83:	df e9                	fucomip %st(1),%st
c0103f85:	dd d8                	fstp   %st(0)
c0103f87:	7a 06                	jp     c0103f8f <_dtoa_r+0x89f>
c0103f89:	0f 84 cc f8 ff ff    	je     c010385b <_dtoa_r+0x16b>
c0103f8f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103f93:	e9 c3 f8 ff ff       	jmp    c010385b <_dtoa_r+0x16b>
c0103f98:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f9b:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103f9e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0103fa5:	f7 d8                	neg    %eax
c0103fa7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103faa:	e9 0c f9 ff ff       	jmp    c01038bb <_dtoa_r+0x1cb>
c0103faf:	90                   	nop
c0103fb0:	f7 d8                	neg    %eax
c0103fb2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103fb5:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c0103fbc:	e9 e2 f8 ff ff       	jmp    c01038a3 <_dtoa_r+0x1b3>
c0103fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103fc8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103fcb:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c0103fd0:	29 d9                	sub    %ebx,%ecx
c0103fd2:	d3 e0                	shl    %cl,%eax
c0103fd4:	e9 1b f8 ff ff       	jmp    c01037f4 <_dtoa_r+0x104>
c0103fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103fe0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0103fe7:	e9 a0 f8 ff ff       	jmp    c010388c <_dtoa_r+0x19c>
c0103fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103ff0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103ff4:	0f 8e fe 06 00 00    	jle    c01046f8 <_dtoa_r+0x1008>
c0103ffa:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103ffd:	83 e8 01             	sub    $0x1,%eax
c0104000:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0104003:	0f 8c 3b 06 00 00    	jl     c0104644 <_dtoa_r+0xf54>
c0104009:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010400c:	29 c2                	sub    %eax,%edx
c010400e:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0104011:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104014:	85 c9                	test   %ecx,%ecx
c0104016:	89 c8                	mov    %ecx,%eax
c0104018:	0f 88 83 07 00 00    	js     c01047a1 <_dtoa_r+0x10b1>
c010401e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104025:	00 
c0104026:	89 34 24             	mov    %esi,(%esp)
c0104029:	89 55 8c             	mov    %edx,-0x74(%ebp)
c010402c:	01 45 a0             	add    %eax,-0x60(%ebp)
c010402f:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104032:	e8 69 15 00 00       	call   c01055a0 <__i2b>
c0104037:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010403a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010403d:	e9 1e fd ff ff       	jmp    c0103d60 <_dtoa_r+0x670>
c0104042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104048:	d9 c1                	fld    %st(1)
c010404a:	b9 02 00 00 00       	mov    $0x2,%ecx
c010404f:	e9 37 fa ff ff       	jmp    c0103a8b <_dtoa_r+0x39b>
c0104054:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104057:	db 45 d4             	fildl  -0x2c(%ebp)
c010405a:	d8 c9                	fmul   %st(1),%st
c010405c:	d8 05 fc 82 10 c0    	fadds  0xc01082fc
c0104062:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104065:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104070:	d8 25 00 83 10 c0    	fsubs  0xc0108300
c0104076:	dd 45 c0             	fldl   -0x40(%ebp)
c0104079:	d9 c9                	fxch   %st(1)
c010407b:	db e9                	fucomi %st(1),%st
c010407d:	0f 87 0d 02 00 00    	ja     c0104290 <_dtoa_r+0xba0>
c0104083:	d9 c9                	fxch   %st(1)
c0104085:	d9 e0                	fchs   
c0104087:	df e9                	fucomip %st(1),%st
c0104089:	dd d8                	fstp   %st(0)
c010408b:	0f 86 a7 01 00 00    	jbe    c0104238 <_dtoa_r+0xb48>
c0104091:	dd d8                	fstp   %st(0)
c0104093:	eb 02                	jmp    c0104097 <_dtoa_r+0x9a7>
c0104095:	dd d8                	fstp   %st(0)
c0104097:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010409e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01040a5:	8b 45 18             	mov    0x18(%ebp),%eax
c01040a8:	89 fb                	mov    %edi,%ebx
c01040aa:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01040b1:	f7 d0                	not    %eax
c01040b3:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01040b6:	e9 57 fe ff ff       	jmp    c0103f12 <_dtoa_r+0x822>
c01040bb:	90                   	nop
c01040bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01040c0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01040c3:	85 c0                	test   %eax,%eax
c01040c5:	0f 85 c5 03 00 00    	jne    c0104490 <_dtoa_r+0xda0>
c01040cb:	89 75 08             	mov    %esi,0x8(%ebp)
c01040ce:	bb 01 00 00 00       	mov    $0x1,%ebx
c01040d3:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c01040d6:	eb 24                	jmp    c01040fc <_dtoa_r+0xa0c>
c01040d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01040db:	83 c3 01             	add    $0x1,%ebx
c01040de:	89 74 24 04          	mov    %esi,0x4(%esp)
c01040e2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01040e9:	00 
c01040ea:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01040f1:	00 
c01040f2:	89 04 24             	mov    %eax,(%esp)
c01040f5:	e8 e6 11 00 00       	call   c01052e0 <__multadd>
c01040fa:	89 c6                	mov    %eax,%esi
c01040fc:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01040ff:	89 f0                	mov    %esi,%eax
c0104101:	e8 1a f4 ff ff       	call   c0103520 <quorem>
c0104106:	83 c0 30             	add    $0x30,%eax
c0104109:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c010410c:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c0104110:	7c c6                	jl     c01040d8 <_dtoa_r+0x9e8>
c0104112:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104115:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104118:	ba 01 00 00 00       	mov    $0x1,%edx
c010411d:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c0104120:	8b 75 08             	mov    0x8(%ebp),%esi
c0104123:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c010412a:	85 c0                	test   %eax,%eax
c010412c:	0f 4f d0             	cmovg  %eax,%edx
c010412f:	01 fa                	add    %edi,%edx
c0104131:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104134:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010413b:	00 
c010413c:	89 34 24             	mov    %esi,(%esp)
c010413f:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0104142:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104146:	e8 75 17 00 00       	call   c01058c0 <__lshift>
c010414b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c010414e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104152:	89 04 24             	mov    %eax,(%esp)
c0104155:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104158:	e8 83 18 00 00       	call   c01059e0 <__mcmp>
c010415d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0104160:	83 f8 00             	cmp    $0x0,%eax
c0104163:	0f 8e 41 06 00 00    	jle    c01047aa <_dtoa_r+0x10ba>
c0104169:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c010416d:	eb 0f                	jmp    c010417e <_dtoa_r+0xa8e>
c010416f:	90                   	nop
c0104170:	39 c7                	cmp    %eax,%edi
c0104172:	0f 84 70 05 00 00    	je     c01046e8 <_dtoa_r+0xff8>
c0104178:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c010417c:	89 c2                	mov    %eax,%edx
c010417e:	80 f9 39             	cmp    $0x39,%cl
c0104181:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104184:	74 ea                	je     c0104170 <_dtoa_r+0xa80>
c0104186:	83 c1 01             	add    $0x1,%ecx
c0104189:	89 fb                	mov    %edi,%ebx
c010418b:	88 08                	mov    %cl,(%eax)
c010418d:	89 d7                	mov    %edx,%edi
c010418f:	e9 7e fd ff ff       	jmp    c0103f12 <_dtoa_r+0x822>
c0104194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104198:	b8 1c 00 00 00       	mov    $0x1c,%eax
c010419d:	01 45 a0             	add    %eax,-0x60(%ebp)
c01041a0:	01 c3                	add    %eax,%ebx
c01041a2:	01 45 ac             	add    %eax,-0x54(%ebp)
c01041a5:	e9 b6 fc ff ff       	jmp    c0103e60 <_dtoa_r+0x770>
c01041aa:	ba 01 00 00 00       	mov    $0x1,%edx
c01041af:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c01041b6:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c01041bd:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c01041c4:	21 c2                	and    %eax,%edx
c01041c6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c01041c9:	31 d2                	xor    %edx,%edx
c01041cb:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01041d2:	e9 62 f8 ff ff       	jmp    c0103a39 <_dtoa_r+0x349>
c01041d7:	90                   	nop
c01041d8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01041db:	85 d2                	test   %edx,%edx
c01041dd:	0f 84 4e fd ff ff    	je     c0103f31 <_dtoa_r+0x841>
c01041e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01041e6:	89 34 24             	mov    %esi,(%esp)
c01041e9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041ed:	e8 ce 10 00 00       	call   c01052c0 <_Bfree>
c01041f2:	e9 3a fd ff ff       	jmp    c0103f31 <_dtoa_r+0x841>
c01041f7:	90                   	nop
c01041f8:	89 d8                	mov    %ebx,%eax
c01041fa:	e9 89 f5 ff ff       	jmp    c0103788 <_dtoa_r+0x98>
c01041ff:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104202:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104206:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104209:	89 34 24             	mov    %esi,(%esp)
c010420c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104210:	e8 8b 15 00 00       	call   c01057a0 <__pow5mult>
c0104215:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104218:	e9 c6 fb ff ff       	jmp    c0103de3 <_dtoa_r+0x6f3>
c010421d:	dd d8                	fstp   %st(0)
c010421f:	dd d8                	fstp   %st(0)
c0104221:	eb 15                	jmp    c0104238 <_dtoa_r+0xb48>
c0104223:	90                   	nop
c0104224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104228:	dd d8                	fstp   %st(0)
c010422a:	dd d8                	fstp   %st(0)
c010422c:	dd d8                	fstp   %st(0)
c010422e:	eb 08                	jmp    c0104238 <_dtoa_r+0xb48>
c0104230:	dd d8                	fstp   %st(0)
c0104232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104238:	dd 5d c0             	fstpl  -0x40(%ebp)
c010423b:	e9 cf f9 ff ff       	jmp    c0103c0f <_dtoa_r+0x51f>
c0104240:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104243:	f7 d8                	neg    %eax
c0104245:	0f 84 6a 04 00 00    	je     c01046b5 <_dtoa_r+0xfc5>
c010424b:	89 c2                	mov    %eax,%edx
c010424d:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104252:	83 e2 0f             	and    $0xf,%edx
c0104255:	c1 f8 04             	sar    $0x4,%eax
c0104258:	dd 04 d5 e0 83 10 c0 	fldl   -0x3fef7c20(,%edx,8)
c010425f:	85 c0                	test   %eax,%eax
c0104261:	d8 c9                	fmul   %st(1),%st
c0104263:	0f 84 4a f8 ff ff    	je     c0103ab3 <_dtoa_r+0x3c3>
c0104269:	31 d2                	xor    %edx,%edx
c010426b:	90                   	nop
c010426c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104270:	a8 01                	test   $0x1,%al
c0104272:	74 0a                	je     c010427e <_dtoa_r+0xb8e>
c0104274:	dc 0c d5 a0 83 10 c0 	fmull  -0x3fef7c60(,%edx,8)
c010427b:	83 c1 01             	add    $0x1,%ecx
c010427e:	83 c2 01             	add    $0x1,%edx
c0104281:	d1 f8                	sar    %eax
c0104283:	75 eb                	jne    c0104270 <_dtoa_r+0xb80>
c0104285:	e9 29 f8 ff ff       	jmp    c0103ab3 <_dtoa_r+0x3c3>
c010428a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104290:	dd d8                	fstp   %st(0)
c0104292:	dd d8                	fstp   %st(0)
c0104294:	dd d8                	fstp   %st(0)
c0104296:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010429d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01042a4:	e9 55 fc ff ff       	jmp    c0103efe <_dtoa_r+0x80e>
c01042a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01042b0:	d9 7d d2             	fnstcw -0x2e(%ebp)
c01042b3:	8d 41 ff             	lea    -0x1(%ecx),%eax
c01042b6:	dd 45 c0             	fldl   -0x40(%ebp)
c01042b9:	dc 0c c5 e0 83 10 c0 	fmull  -0x3fef7c20(,%eax,8)
c01042c0:	d9 c9                	fxch   %st(1)
c01042c2:	89 45 88             	mov    %eax,-0x78(%ebp)
c01042c5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01042c9:	8d 57 01             	lea    0x1(%edi),%edx
c01042cc:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c01042cf:	b4 0c                	mov    $0xc,%ah
c01042d1:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c01042d5:	d9 6d d0             	fldcw  -0x30(%ebp)
c01042d8:	db 55 d4             	fistl  -0x2c(%ebp)
c01042db:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01042de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01042e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01042e4:	83 c0 30             	add    $0x30,%eax
c01042e7:	83 f9 01             	cmp    $0x1,%ecx
c01042ea:	db 45 d4             	fildl  -0x2c(%ebp)
c01042ed:	de e9                	fsubrp %st,%st(1)
c01042ef:	88 07                	mov    %al,(%edi)
c01042f1:	89 d0                	mov    %edx,%eax
c01042f3:	74 37                	je     c010432c <_dtoa_r+0xc3c>
c01042f5:	d9 05 f8 82 10 c0    	flds   0xc01082f8
c01042fb:	eb 05                	jmp    c0104302 <_dtoa_r+0xc12>
c01042fd:	8d 76 00             	lea    0x0(%esi),%esi
c0104300:	d9 c9                	fxch   %st(1)
c0104302:	dc c9                	fmul   %st,%st(1)
c0104304:	d9 c9                	fxch   %st(1)
c0104306:	83 c0 01             	add    $0x1,%eax
c0104309:	d9 6d d0             	fldcw  -0x30(%ebp)
c010430c:	db 55 d4             	fistl  -0x2c(%ebp)
c010430f:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0104312:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c0104315:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104318:	83 c1 30             	add    $0x30,%ecx
c010431b:	39 d8                	cmp    %ebx,%eax
c010431d:	db 45 d4             	fildl  -0x2c(%ebp)
c0104320:	de e9                	fsubrp %st,%st(1)
c0104322:	88 48 ff             	mov    %cl,-0x1(%eax)
c0104325:	75 d9                	jne    c0104300 <_dtoa_r+0xc10>
c0104327:	dd d9                	fstp   %st(1)
c0104329:	03 55 88             	add    -0x78(%ebp),%edx
c010432c:	d9 05 04 83 10 c0    	flds   0xc0108304
c0104332:	d9 c2                	fld    %st(2)
c0104334:	d8 c1                	fadd   %st(1),%st
c0104336:	d9 ca                	fxch   %st(2)
c0104338:	db ea                	fucomi %st(2),%st
c010433a:	dd da                	fstp   %st(2)
c010433c:	0f 86 7f 03 00 00    	jbe    c01046c1 <_dtoa_r+0xfd1>
c0104342:	dd d8                	fstp   %st(0)
c0104344:	dd d8                	fstp   %st(0)
c0104346:	dd d8                	fstp   %st(0)
c0104348:	dd d8                	fstp   %st(0)
c010434a:	89 fb                	mov    %edi,%ebx
c010434c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0104350:	89 d7                	mov    %edx,%edi
c0104352:	e9 d7 f9 ff ff       	jmp    c0103d2e <_dtoa_r+0x63e>
c0104357:	90                   	nop
c0104358:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010435b:	8b 41 10             	mov    0x10(%ecx),%eax
c010435e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c0104362:	89 04 24             	mov    %eax,(%esp)
c0104365:	e8 56 11 00 00       	call   c01054c0 <__hi0bits>
c010436a:	ba 20 00 00 00       	mov    $0x20,%edx
c010436f:	29 c2                	sub    %eax,%edx
c0104371:	e9 bb fa ff ff       	jmp    c0103e31 <_dtoa_r+0x741>
c0104376:	66 90                	xchg   %ax,%ax
c0104378:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010437b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010437f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104382:	89 04 24             	mov    %eax,(%esp)
c0104385:	e8 56 16 00 00       	call   c01059e0 <__mcmp>
c010438a:	85 c0                	test   %eax,%eax
c010438c:	0f 89 13 fb ff ff    	jns    c0103ea5 <_dtoa_r+0x7b5>
c0104392:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104395:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010439c:	00 
c010439d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01043a4:	00 
c01043a5:	89 34 24             	mov    %esi,(%esp)
c01043a8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01043ac:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c01043b0:	e8 2b 0f 00 00       	call   c01052e0 <__multadd>
c01043b5:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01043b8:	85 c9                	test   %ecx,%ecx
c01043ba:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01043bd:	0f 85 8d 00 00 00    	jne    c0104450 <_dtoa_r+0xd60>
c01043c3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c01043c7:	8b 45 90             	mov    -0x70(%ebp),%eax
c01043ca:	7f 0a                	jg     c01043d6 <_dtoa_r+0xce6>
c01043cc:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01043d0:	0f 8f ff 04 00 00    	jg     c01048d5 <_dtoa_r+0x11e5>
c01043d6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01043d9:	e9 ed fc ff ff       	jmp    c01040cb <_dtoa_r+0x9db>
c01043de:	66 90                	xchg   %ax,%ax
c01043e0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c01043e3:	85 db                	test   %ebx,%ebx
c01043e5:	0f 85 aa fc ff ff    	jne    c0104095 <_dtoa_r+0x9a5>
c01043eb:	d8 0d 00 83 10 c0    	fmuls  0xc0108300
c01043f1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01043f8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01043ff:	dd 45 c0             	fldl   -0x40(%ebp)
c0104402:	d9 c9                	fxch   %st(1)
c0104404:	df e9                	fucomip %st(1),%st
c0104406:	dd d8                	fstp   %st(0)
c0104408:	0f 83 97 fc ff ff    	jae    c01040a5 <_dtoa_r+0x9b5>
c010440e:	e9 eb fa ff ff       	jmp    c0103efe <_dtoa_r+0x80e>
c0104413:	90                   	nop
c0104414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104418:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010441b:	85 c0                	test   %eax,%eax
c010441d:	0f 85 fe f9 ff ff    	jne    c0103e21 <_dtoa_r+0x731>
c0104423:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0104426:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c010442b:	0f 85 f0 f9 ff ff    	jne    c0103e21 <_dtoa_r+0x731>
c0104431:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c0104436:	0f 84 e5 f9 ff ff    	je     c0103e21 <_dtoa_r+0x731>
c010443c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c0104440:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c0104444:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c010444b:	e9 d1 f9 ff ff       	jmp    c0103e21 <_dtoa_r+0x731>
c0104450:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104453:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010445a:	00 
c010445b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104462:	00 
c0104463:	89 34 24             	mov    %esi,(%esp)
c0104466:	89 44 24 04          	mov    %eax,0x4(%esp)
c010446a:	e8 71 0e 00 00       	call   c01052e0 <__multadd>
c010446f:	8b 55 90             	mov    -0x70(%ebp),%edx
c0104472:	85 d2                	test   %edx,%edx
c0104474:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104477:	8b 45 90             	mov    -0x70(%ebp),%eax
c010447a:	7f 0a                	jg     c0104486 <_dtoa_r+0xd96>
c010447c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104480:	0f 8f 4f 04 00 00    	jg     c01048d5 <_dtoa_r+0x11e5>
c0104486:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104490:	85 db                	test   %ebx,%ebx
c0104492:	7e 16                	jle    c01044aa <_dtoa_r+0xdba>
c0104494:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104497:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010449b:	89 34 24             	mov    %esi,(%esp)
c010449e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01044a2:	e8 19 14 00 00       	call   c01058c0 <__lshift>
c01044a7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01044aa:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c01044ad:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01044b0:	85 db                	test   %ebx,%ebx
c01044b2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01044b5:	0f 85 11 03 00 00    	jne    c01047cc <_dtoa_r+0x10dc>
c01044bb:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01044be:	8d 5f 01             	lea    0x1(%edi),%ebx
c01044c1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c01044c4:	01 f8                	add    %edi,%eax
c01044c6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c01044c9:	89 45 90             	mov    %eax,-0x70(%ebp)
c01044cc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01044cf:	83 e0 01             	and    $0x1,%eax
c01044d2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01044d5:	eb 2e                	jmp    c0104505 <_dtoa_r+0xe15>
c01044d7:	90                   	nop
c01044d8:	e8 03 0e 00 00       	call   c01052e0 <__multadd>
c01044dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01044e4:	00 
c01044e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01044ec:	00 
c01044ed:	89 34 24             	mov    %esi,(%esp)
c01044f0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01044f3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01044f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01044fa:	e8 e1 0d 00 00       	call   c01052e0 <__multadd>
c01044ff:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104502:	83 c3 01             	add    $0x1,%ebx
c0104505:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104508:	8d 43 ff             	lea    -0x1(%ebx),%eax
c010450b:	89 45 98             	mov    %eax,-0x68(%ebp)
c010450e:	89 f8                	mov    %edi,%eax
c0104510:	e8 0b f0 ff ff       	call   c0103520 <quorem>
c0104515:	89 3c 24             	mov    %edi,(%esp)
c0104518:	8d 48 30             	lea    0x30(%eax),%ecx
c010451b:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c010451e:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104521:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104524:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104528:	e8 b3 14 00 00       	call   c01059e0 <__mcmp>
c010452d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c0104530:	89 34 24             	mov    %esi,(%esp)
c0104533:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104537:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010453a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010453d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104541:	e8 ea 14 00 00       	call   c0105a30 <__mdiff>
c0104546:	8b 48 0c             	mov    0xc(%eax),%ecx
c0104549:	89 c2                	mov    %eax,%edx
c010454b:	85 c9                	test   %ecx,%ecx
c010454d:	0f 85 c5 00 00 00    	jne    c0104618 <_dtoa_r+0xf28>
c0104553:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104557:	89 3c 24             	mov    %edi,(%esp)
c010455a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010455d:	e8 7e 14 00 00       	call   c01059e0 <__mcmp>
c0104562:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104565:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104569:	89 34 24             	mov    %esi,(%esp)
c010456c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010456f:	e8 4c 0d 00 00       	call   c01052c0 <_Bfree>
c0104574:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104577:	89 c1                	mov    %eax,%ecx
c0104579:	0b 4d 14             	or     0x14(%ebp),%ecx
c010457c:	75 0b                	jne    c0104589 <_dtoa_r+0xe99>
c010457e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0104581:	85 d2                	test   %edx,%edx
c0104583:	0f 84 fb 02 00 00    	je     c0104884 <_dtoa_r+0x1194>
c0104589:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010458c:	85 d2                	test   %edx,%edx
c010458e:	0f 88 7f 01 00 00    	js     c0104713 <_dtoa_r+0x1023>
c0104594:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104597:	0b 4d 14             	or     0x14(%ebp),%ecx
c010459a:	75 0b                	jne    c01045a7 <_dtoa_r+0xeb7>
c010459c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c010459f:	85 c9                	test   %ecx,%ecx
c01045a1:	0f 84 6c 01 00 00    	je     c0104713 <_dtoa_r+0x1023>
c01045a7:	85 c0                	test   %eax,%eax
c01045a9:	0f 8f 82 02 00 00    	jg     c0104831 <_dtoa_r+0x1141>
c01045af:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c01045b3:	89 da                	mov    %ebx,%edx
c01045b5:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c01045b8:	88 43 ff             	mov    %al,-0x1(%ebx)
c01045bb:	0f 84 8d 02 00 00    	je     c010484e <_dtoa_r+0x115e>
c01045c1:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01045c5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045cc:	00 
c01045cd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01045d4:	00 
c01045d5:	89 34 24             	mov    %esi,(%esp)
c01045d8:	e8 03 0d 00 00       	call   c01052e0 <__multadd>
c01045dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045e4:	00 
c01045e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01045ec:	00 
c01045ed:	89 34 24             	mov    %esi,(%esp)
c01045f0:	89 c7                	mov    %eax,%edi
c01045f2:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01045f5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c01045f8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01045fb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045ff:	0f 85 d3 fe ff ff    	jne    c01044d8 <_dtoa_r+0xde8>
c0104605:	e8 d6 0c 00 00       	call   c01052e0 <__multadd>
c010460a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010460d:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104610:	e9 ed fe ff ff       	jmp    c0104502 <_dtoa_r+0xe12>
c0104615:	8d 76 00             	lea    0x0(%esi),%esi
c0104618:	b8 01 00 00 00       	mov    $0x1,%eax
c010461d:	e9 43 ff ff ff       	jmp    c0104565 <_dtoa_r+0xe75>
c0104622:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104629:	e9 d2 f2 ff ff       	jmp    c0103900 <_dtoa_r+0x210>
c010462e:	0f 85 87 f6 ff ff    	jne    c0103cbb <_dtoa_r+0x5cb>
c0104634:	dd d8                	fstp   %st(0)
c0104636:	dd d8                	fstp   %st(0)
c0104638:	dd d8                	fstp   %st(0)
c010463a:	89 fb                	mov    %edi,%ebx
c010463c:	8b 7d c0             	mov    -0x40(%ebp),%edi
c010463f:	e9 fc f8 ff ff       	jmp    c0103f40 <_dtoa_r+0x850>
c0104644:	89 c2                	mov    %eax,%edx
c0104646:	2b 55 b0             	sub    -0x50(%ebp),%edx
c0104649:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010464c:	01 55 94             	add    %edx,-0x6c(%ebp)
c010464f:	31 d2                	xor    %edx,%edx
c0104651:	e9 b8 f9 ff ff       	jmp    c010400e <_dtoa_r+0x91e>
c0104656:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104659:	85 c0                	test   %eax,%eax
c010465b:	0f 84 f3 f9 ff ff    	je     c0104054 <_dtoa_r+0x964>
c0104661:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104664:	85 c0                	test   %eax,%eax
c0104666:	0f 8e c4 fb ff ff    	jle    c0104230 <_dtoa_r+0xb40>
c010466c:	d8 0d f8 82 10 c0    	fmuls  0xc01082f8
c0104672:	83 c1 01             	add    $0x1,%ecx
c0104675:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104678:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c010467b:	89 c1                	mov    %eax,%ecx
c010467d:	83 eb 01             	sub    $0x1,%ebx
c0104680:	db 45 d4             	fildl  -0x2c(%ebp)
c0104683:	d8 c9                	fmul   %st(1),%st
c0104685:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c0104688:	d8 05 fc 82 10 c0    	fadds  0xc01082fc
c010468e:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104691:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0104698:	e9 53 f4 ff ff       	jmp    c0103af0 <_dtoa_r+0x400>
c010469d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01046a0:	c6 03 30             	movb   $0x30,(%ebx)
c01046a3:	83 c0 01             	add    $0x1,%eax
c01046a6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01046a9:	b8 31 00 00 00       	mov    $0x31,%eax
c01046ae:	88 02                	mov    %al,(%edx)
c01046b0:	e9 8b f8 ff ff       	jmp    c0103f40 <_dtoa_r+0x850>
c01046b5:	d9 c0                	fld    %st(0)
c01046b7:	b9 02 00 00 00       	mov    $0x2,%ecx
c01046bc:	e9 f2 f3 ff ff       	jmp    c0103ab3 <_dtoa_r+0x3c3>
c01046c1:	de e2                	fsubp  %st,%st(2)
c01046c3:	d9 c9                	fxch   %st(1)
c01046c5:	df e9                	fucomip %st(1),%st
c01046c7:	dd d8                	fstp   %st(0)
c01046c9:	0f 86 69 fb ff ff    	jbe    c0104238 <_dtoa_r+0xb48>
c01046cf:	dd d8                	fstp   %st(0)
c01046d1:	eb 07                	jmp    c01046da <_dtoa_r+0xfea>
c01046d3:	90                   	nop
c01046d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01046d8:	89 c2                	mov    %eax,%edx
c01046da:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c01046de:	8d 42 ff             	lea    -0x1(%edx),%eax
c01046e1:	74 f5                	je     c01046d8 <_dtoa_r+0xfe8>
c01046e3:	e9 d9 f4 ff ff       	jmp    c0103bc1 <_dtoa_r+0x4d1>
c01046e8:	c6 07 31             	movb   $0x31,(%edi)
c01046eb:	89 fb                	mov    %edi,%ebx
c01046ed:	89 d7                	mov    %edx,%edi
c01046ef:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c01046f3:	e9 1a f8 ff ff       	jmp    c0103f12 <_dtoa_r+0x822>
c01046f8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01046fb:	85 d2                	test   %edx,%edx
c01046fd:	0f 84 1b 01 00 00    	je     c010481e <_dtoa_r+0x112e>
c0104703:	05 33 04 00 00       	add    $0x433,%eax
c0104708:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010470b:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010470e:	e9 0b f9 ff ff       	jmp    c010401e <_dtoa_r+0x92e>
c0104713:	85 c0                	test   %eax,%eax
c0104715:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104718:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010471b:	7e 45                	jle    c0104762 <_dtoa_r+0x1072>
c010471d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104720:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104727:	00 
c0104728:	89 34 24             	mov    %esi,(%esp)
c010472b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010472f:	e8 8c 11 00 00       	call   c01058c0 <__lshift>
c0104734:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c0104737:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010473b:	89 04 24             	mov    %eax,(%esp)
c010473e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104741:	e8 9a 12 00 00       	call   c01059e0 <__mcmp>
c0104746:	83 f8 00             	cmp    $0x0,%eax
c0104749:	0f 8e 5b 01 00 00    	jle    c01048aa <_dtoa_r+0x11ba>
c010474f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104753:	0f 84 0c 01 00 00    	je     c0104865 <_dtoa_r+0x1175>
c0104759:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010475c:	83 c0 31             	add    $0x31,%eax
c010475f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104762:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104765:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104769:	89 cb                	mov    %ecx,%ebx
c010476b:	88 03                	mov    %al,(%ebx)
c010476d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104770:	89 fb                	mov    %edi,%ebx
c0104772:	8d 79 01             	lea    0x1(%ecx),%edi
c0104775:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104778:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010477b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010477e:	e9 8f f7 ff ff       	jmp    c0103f12 <_dtoa_r+0x822>
c0104783:	dd d8                	fstp   %st(0)
c0104785:	dd d8                	fstp   %st(0)
c0104787:	dd d8                	fstp   %st(0)
c0104789:	eb 0d                	jmp    c0104798 <_dtoa_r+0x10a8>
c010478b:	90                   	nop
c010478c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104790:	dd d8                	fstp   %st(0)
c0104792:	dd d8                	fstp   %st(0)
c0104794:	dd d8                	fstp   %st(0)
c0104796:	dd d8                	fstp   %st(0)
c0104798:	89 fb                	mov    %edi,%ebx
c010479a:	89 d7                	mov    %edx,%edi
c010479c:	e9 8d f5 ff ff       	jmp    c0103d2e <_dtoa_r+0x63e>
c01047a1:	29 cb                	sub    %ecx,%ebx
c01047a3:	31 c0                	xor    %eax,%eax
c01047a5:	e9 74 f8 ff ff       	jmp    c010401e <_dtoa_r+0x92e>
c01047aa:	75 0e                	jne    c01047ba <_dtoa_r+0x10ca>
c01047ac:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c01047b0:	74 08                	je     c01047ba <_dtoa_r+0x10ca>
c01047b2:	e9 b2 f9 ff ff       	jmp    c0104169 <_dtoa_r+0xa79>
c01047b7:	90                   	nop
c01047b8:	89 c2                	mov    %eax,%edx
c01047ba:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c01047be:	8d 42 ff             	lea    -0x1(%edx),%eax
c01047c1:	74 f5                	je     c01047b8 <_dtoa_r+0x10c8>
c01047c3:	89 fb                	mov    %edi,%ebx
c01047c5:	89 d7                	mov    %edx,%edi
c01047c7:	e9 46 f7 ff ff       	jmp    c0103f12 <_dtoa_r+0x822>
c01047cc:	8b 40 04             	mov    0x4(%eax),%eax
c01047cf:	89 34 24             	mov    %esi,(%esp)
c01047d2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047d6:	e8 45 0a 00 00       	call   c0105220 <_Balloc>
c01047db:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c01047de:	89 c3                	mov    %eax,%ebx
c01047e0:	8b 41 10             	mov    0x10(%ecx),%eax
c01047e3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c01047ea:	89 44 24 08          	mov    %eax,0x8(%esp)
c01047ee:	89 c8                	mov    %ecx,%eax
c01047f0:	83 c0 0c             	add    $0xc,%eax
c01047f3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047f7:	8d 43 0c             	lea    0xc(%ebx),%eax
c01047fa:	89 04 24             	mov    %eax,(%esp)
c01047fd:	e8 6e cc ff ff       	call   c0101470 <memcpy>
c0104802:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104809:	00 
c010480a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010480e:	89 34 24             	mov    %esi,(%esp)
c0104811:	e8 aa 10 00 00       	call   c01058c0 <__lshift>
c0104816:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104819:	e9 9d fc ff ff       	jmp    c01044bb <_dtoa_r+0xdcb>
c010481e:	b8 36 00 00 00       	mov    $0x36,%eax
c0104823:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104826:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0104829:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010482c:	e9 ed f7 ff ff       	jmp    c010401e <_dtoa_r+0x92e>
c0104831:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104835:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104838:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010483b:	74 28                	je     c0104865 <_dtoa_r+0x1175>
c010483d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104841:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104844:	83 c0 01             	add    $0x1,%eax
c0104847:	89 cb                	mov    %ecx,%ebx
c0104849:	e9 1d ff ff ff       	jmp    c010476b <_dtoa_r+0x107b>
c010484e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104851:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104854:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104857:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010485a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010485d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104860:	e9 cc f8 ff ff       	jmp    c0104131 <_dtoa_r+0xa41>
c0104865:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104868:	b9 39 00 00 00       	mov    $0x39,%ecx
c010486d:	8d 50 01             	lea    0x1(%eax),%edx
c0104870:	c6 00 39             	movb   $0x39,(%eax)
c0104873:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104876:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104879:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010487c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010487f:	e9 fa f8 ff ff       	jmp    c010417e <_dtoa_r+0xa8e>
c0104884:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104887:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c010488a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010488d:	83 fb 39             	cmp    $0x39,%ebx
c0104890:	74 d3                	je     c0104865 <_dtoa_r+0x1175>
c0104892:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104895:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104898:	83 c0 31             	add    $0x31,%eax
c010489b:	85 c9                	test   %ecx,%ecx
c010489d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01048a0:	0f 4e c3             	cmovle %ebx,%eax
c01048a3:	89 cb                	mov    %ecx,%ebx
c01048a5:	e9 c1 fe ff ff       	jmp    c010476b <_dtoa_r+0x107b>
c01048aa:	0f 85 b2 fe ff ff    	jne    c0104762 <_dtoa_r+0x1072>
c01048b0:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c01048b4:	0f 84 a8 fe ff ff    	je     c0104762 <_dtoa_r+0x1072>
c01048ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01048c0:	e9 8a fe ff ff       	jmp    c010474f <_dtoa_r+0x105f>
c01048c5:	0f 85 c7 f3 ff ff    	jne    c0103c92 <_dtoa_r+0x5a2>
c01048cb:	dd d8                	fstp   %st(0)
c01048cd:	dd d8                	fstp   %st(0)
c01048cf:	90                   	nop
c01048d0:	e9 65 fd ff ff       	jmp    c010463a <_dtoa_r+0xf4a>
c01048d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01048d8:	e9 dd f5 ff ff       	jmp    c0103eba <_dtoa_r+0x7ca>
c01048dd:	8d 76 00             	lea    0x0(%esi),%esi
c01048e0:	0f 84 7a f5 ff ff    	je     c0103e60 <_dtoa_r+0x770>
c01048e6:	b8 3c 00 00 00       	mov    $0x3c,%eax
c01048eb:	29 d0                	sub    %edx,%eax
c01048ed:	e9 ab f8 ff ff       	jmp    c010419d <_dtoa_r+0xaad>
c01048f2:	b8 01 00 00 00       	mov    $0x1,%eax
c01048f7:	e9 d9 ef ff ff       	jmp    c01038d5 <_dtoa_r+0x1e5>
c01048fc:	31 d2                	xor    %edx,%edx
c01048fe:	e9 36 f1 ff ff       	jmp    c0103a39 <_dtoa_r+0x349>
c0104903:	66 90                	xchg   %ax,%ax
c0104905:	66 90                	xchg   %ax,%ax
c0104907:	66 90                	xchg   %ax,%ax
c0104909:	66 90                	xchg   %ax,%ax
c010490b:	66 90                	xchg   %ax,%ax
c010490d:	66 90                	xchg   %ax,%ax
c010490f:	90                   	nop

c0104910 <_setlocale_r>:
c0104910:	55                   	push   %ebp
c0104911:	89 e5                	mov    %esp,%ebp
c0104913:	53                   	push   %ebx
c0104914:	83 ec 14             	sub    $0x14,%esp
c0104917:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010491a:	85 db                	test   %ebx,%ebx
c010491c:	74 14                	je     c0104932 <_setlocale_r+0x22>
c010491e:	c7 44 24 04 20 83 10 	movl   $0xc0108320,0x4(%esp)
c0104925:	c0 
c0104926:	89 1c 24             	mov    %ebx,(%esp)
c0104929:	e8 82 17 00 00       	call   c01060b0 <strcmp>
c010492e:	85 c0                	test   %eax,%eax
c0104930:	75 0e                	jne    c0104940 <_setlocale_r+0x30>
c0104932:	83 c4 14             	add    $0x14,%esp
c0104935:	b8 1c 81 10 c0       	mov    $0xc010811c,%eax
c010493a:	5b                   	pop    %ebx
c010493b:	5d                   	pop    %ebp
c010493c:	c3                   	ret    
c010493d:	8d 76 00             	lea    0x0(%esi),%esi
c0104940:	c7 44 24 04 1c 81 10 	movl   $0xc010811c,0x4(%esp)
c0104947:	c0 
c0104948:	89 1c 24             	mov    %ebx,(%esp)
c010494b:	e8 60 17 00 00       	call   c01060b0 <strcmp>
c0104950:	85 c0                	test   %eax,%eax
c0104952:	74 de                	je     c0104932 <_setlocale_r+0x22>
c0104954:	89 1c 24             	mov    %ebx,(%esp)
c0104957:	c7 44 24 04 56 81 10 	movl   $0xc0108156,0x4(%esp)
c010495e:	c0 
c010495f:	e8 4c 17 00 00       	call   c01060b0 <strcmp>
c0104964:	89 c2                	mov    %eax,%edx
c0104966:	31 c0                	xor    %eax,%eax
c0104968:	85 d2                	test   %edx,%edx
c010496a:	ba 1c 81 10 c0       	mov    $0xc010811c,%edx
c010496f:	0f 44 c2             	cmove  %edx,%eax
c0104972:	83 c4 14             	add    $0x14,%esp
c0104975:	5b                   	pop    %ebx
c0104976:	5d                   	pop    %ebp
c0104977:	c3                   	ret    
c0104978:	90                   	nop
c0104979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0104980 <__locale_charset>:
c0104980:	55                   	push   %ebp
c0104981:	b8 20 aa 10 c0       	mov    $0xc010aa20,%eax
c0104986:	89 e5                	mov    %esp,%ebp
c0104988:	5d                   	pop    %ebp
c0104989:	c3                   	ret    
c010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104990 <__locale_mb_cur_max>:
c0104990:	55                   	push   %ebp
c0104991:	a1 78 aa 10 c0       	mov    0xc010aa78,%eax
c0104996:	89 e5                	mov    %esp,%ebp
c0104998:	5d                   	pop    %ebp
c0104999:	c3                   	ret    
c010499a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049a0 <__locale_msgcharset>:
c01049a0:	55                   	push   %ebp
c01049a1:	b8 00 aa 10 c0       	mov    $0xc010aa00,%eax
c01049a6:	89 e5                	mov    %esp,%ebp
c01049a8:	5d                   	pop    %ebp
c01049a9:	c3                   	ret    
c01049aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049b0 <__locale_cjk_lang>:
c01049b0:	55                   	push   %ebp
c01049b1:	31 c0                	xor    %eax,%eax
c01049b3:	89 e5                	mov    %esp,%ebp
c01049b5:	5d                   	pop    %ebp
c01049b6:	c3                   	ret    
c01049b7:	89 f6                	mov    %esi,%esi
c01049b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01049c0 <_localeconv_r>:
c01049c0:	55                   	push   %ebp
c01049c1:	b8 40 aa 10 c0       	mov    $0xc010aa40,%eax
c01049c6:	89 e5                	mov    %esp,%ebp
c01049c8:	5d                   	pop    %ebp
c01049c9:	c3                   	ret    
c01049ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049d0 <setlocale>:
c01049d0:	55                   	push   %ebp
c01049d1:	89 e5                	mov    %esp,%ebp
c01049d3:	83 ec 18             	sub    $0x18,%esp
c01049d6:	e8 35 cc ff ff       	call   c0101610 <__getreent>
c01049db:	8b 55 0c             	mov    0xc(%ebp),%edx
c01049de:	89 54 24 08          	mov    %edx,0x8(%esp)
c01049e2:	8b 55 08             	mov    0x8(%ebp),%edx
c01049e5:	89 04 24             	mov    %eax,(%esp)
c01049e8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01049ec:	e8 1f ff ff ff       	call   c0104910 <_setlocale_r>
c01049f1:	c9                   	leave  
c01049f2:	c3                   	ret    
c01049f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0104a00 <localeconv>:
c0104a00:	55                   	push   %ebp
c0104a01:	89 e5                	mov    %esp,%ebp
c0104a03:	83 ec 08             	sub    $0x8,%esp
c0104a06:	e8 05 cc ff ff       	call   c0101610 <__getreent>
c0104a0b:	b8 40 aa 10 c0       	mov    $0xc010aa40,%eax
c0104a10:	c9                   	leave  
c0104a11:	c3                   	ret    
c0104a12:	66 90                	xchg   %ax,%ax
c0104a14:	66 90                	xchg   %ax,%ax
c0104a16:	66 90                	xchg   %ax,%ax
c0104a18:	66 90                	xchg   %ax,%ax
c0104a1a:	66 90                	xchg   %ax,%ax
c0104a1c:	66 90                	xchg   %ax,%ax
c0104a1e:	66 90                	xchg   %ax,%ax

c0104a20 <_malloc_r>:
c0104a20:	55                   	push   %ebp
c0104a21:	89 e5                	mov    %esp,%ebp
c0104a23:	57                   	push   %edi
c0104a24:	56                   	push   %esi
c0104a25:	53                   	push   %ebx
c0104a26:	83 ec 2c             	sub    $0x2c,%esp
c0104a29:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a2c:	8d 50 0b             	lea    0xb(%eax),%edx
c0104a2f:	83 fa 16             	cmp    $0x16,%edx
c0104a32:	76 6c                	jbe    c0104aa0 <_malloc_r+0x80>
c0104a34:	89 d7                	mov    %edx,%edi
c0104a36:	83 e7 f8             	and    $0xfffffff8,%edi
c0104a39:	89 fe                	mov    %edi,%esi
c0104a3b:	c1 ee 1f             	shr    $0x1f,%esi
c0104a3e:	39 c7                	cmp    %eax,%edi
c0104a40:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a43:	89 f2                	mov    %esi,%edx
c0104a45:	72 67                	jb     c0104aae <_malloc_r+0x8e>
c0104a47:	84 d2                	test   %dl,%dl
c0104a49:	75 63                	jne    c0104aae <_malloc_r+0x8e>
c0104a4b:	89 04 24             	mov    %eax,(%esp)
c0104a4e:	e8 ad 07 00 00       	call   c0105200 <__malloc_lock>
c0104a53:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0104a59:	77 65                	ja     c0104ac0 <_malloc_r+0xa0>
c0104a5b:	89 fa                	mov    %edi,%edx
c0104a5d:	c1 ea 03             	shr    $0x3,%edx
c0104a60:	8d 04 d5 a0 aa 10 c0 	lea    -0x3fef5560(,%edx,8),%eax
c0104a67:	8b 58 0c             	mov    0xc(%eax),%ebx
c0104a6a:	39 c3                	cmp    %eax,%ebx
c0104a6c:	0f 84 3e 05 00 00    	je     c0104fb0 <_malloc_r+0x590>
c0104a72:	8b 43 04             	mov    0x4(%ebx),%eax
c0104a75:	83 e0 fc             	and    $0xfffffffc,%eax
c0104a78:	8b 53 0c             	mov    0xc(%ebx),%edx
c0104a7b:	8b 4b 08             	mov    0x8(%ebx),%ecx
c0104a7e:	89 51 0c             	mov    %edx,0xc(%ecx)
c0104a81:	89 4a 08             	mov    %ecx,0x8(%edx)
c0104a84:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a8c:	89 04 24             	mov    %eax,(%esp)
c0104a8f:	e8 7c 07 00 00       	call   c0105210 <__malloc_unlock>
c0104a94:	8d 43 08             	lea    0x8(%ebx),%eax
c0104a97:	83 c4 2c             	add    $0x2c,%esp
c0104a9a:	5b                   	pop    %ebx
c0104a9b:	5e                   	pop    %esi
c0104a9c:	5f                   	pop    %edi
c0104a9d:	5d                   	pop    %ebp
c0104a9e:	c3                   	ret    
c0104a9f:	90                   	nop
c0104aa0:	bf 10 00 00 00       	mov    $0x10,%edi
c0104aa5:	31 d2                	xor    %edx,%edx
c0104aa7:	39 c7                	cmp    %eax,%edi
c0104aa9:	8b 45 08             	mov    0x8(%ebp),%eax
c0104aac:	73 99                	jae    c0104a47 <_malloc_r+0x27>
c0104aae:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0104ab4:	83 c4 2c             	add    $0x2c,%esp
c0104ab7:	31 c0                	xor    %eax,%eax
c0104ab9:	5b                   	pop    %ebx
c0104aba:	5e                   	pop    %esi
c0104abb:	5f                   	pop    %edi
c0104abc:	5d                   	pop    %ebp
c0104abd:	c3                   	ret    
c0104abe:	66 90                	xchg   %ax,%ax
c0104ac0:	89 fe                	mov    %edi,%esi
c0104ac2:	c1 ee 09             	shr    $0x9,%esi
c0104ac5:	85 f6                	test   %esi,%esi
c0104ac7:	0f 84 ab 01 00 00    	je     c0104c78 <_malloc_r+0x258>
c0104acd:	83 fe 04             	cmp    $0x4,%esi
c0104ad0:	0f 87 8a 03 00 00    	ja     c0104e60 <_malloc_r+0x440>
c0104ad6:	89 fe                	mov    %edi,%esi
c0104ad8:	c1 ee 06             	shr    $0x6,%esi
c0104adb:	83 c6 38             	add    $0x38,%esi
c0104ade:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104ae1:	8d 0c 85 a0 aa 10 c0 	lea    -0x3fef5560(,%eax,4),%ecx
c0104ae8:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104aeb:	39 d9                	cmp    %ebx,%ecx
c0104aed:	75 18                	jne    c0104b07 <_malloc_r+0xe7>
c0104aef:	eb 28                	jmp    c0104b19 <_malloc_r+0xf9>
c0104af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104af8:	85 d2                	test   %edx,%edx
c0104afa:	0f 89 78 ff ff ff    	jns    c0104a78 <_malloc_r+0x58>
c0104b00:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104b03:	39 d9                	cmp    %ebx,%ecx
c0104b05:	74 12                	je     c0104b19 <_malloc_r+0xf9>
c0104b07:	8b 43 04             	mov    0x4(%ebx),%eax
c0104b0a:	83 e0 fc             	and    $0xfffffffc,%eax
c0104b0d:	89 c2                	mov    %eax,%edx
c0104b0f:	29 fa                	sub    %edi,%edx
c0104b11:	83 fa 0f             	cmp    $0xf,%edx
c0104b14:	7e e2                	jle    c0104af8 <_malloc_r+0xd8>
c0104b16:	83 ee 01             	sub    $0x1,%esi
c0104b19:	8d 46 01             	lea    0x1(%esi),%eax
c0104b1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b1f:	8b 1d b0 aa 10 c0    	mov    0xc010aab0,%ebx
c0104b25:	a1 a4 aa 10 c0       	mov    0xc010aaa4,%eax
c0104b2a:	81 fb a8 aa 10 c0    	cmp    $0xc010aaa8,%ebx
c0104b30:	74 6b                	je     c0104b9d <_malloc_r+0x17d>
c0104b32:	8b 73 04             	mov    0x4(%ebx),%esi
c0104b35:	83 e6 fc             	and    $0xfffffffc,%esi
c0104b38:	89 f0                	mov    %esi,%eax
c0104b3a:	29 f8                	sub    %edi,%eax
c0104b3c:	83 f8 0f             	cmp    $0xf,%eax
c0104b3f:	0f 8f a3 03 00 00    	jg     c0104ee8 <_malloc_r+0x4c8>
c0104b45:	85 c0                	test   %eax,%eax
c0104b47:	c7 05 b4 aa 10 c0 a8 	movl   $0xc010aaa8,0xc010aab4
c0104b4e:	aa 10 c0 
c0104b51:	c7 05 b0 aa 10 c0 a8 	movl   $0xc010aaa8,0xc010aab0
c0104b58:	aa 10 c0 
c0104b5b:	0f 89 27 01 00 00    	jns    c0104c88 <_malloc_r+0x268>
c0104b61:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0104b67:	0f 87 1b 03 00 00    	ja     c0104e88 <_malloc_r+0x468>
c0104b6d:	c1 ee 03             	shr    $0x3,%esi
c0104b70:	b8 01 00 00 00       	mov    $0x1,%eax
c0104b75:	89 f1                	mov    %esi,%ecx
c0104b77:	8d 14 f5 a0 aa 10 c0 	lea    -0x3fef5560(,%esi,8),%edx
c0104b7e:	c1 f9 02             	sar    $0x2,%ecx
c0104b81:	d3 e0                	shl    %cl,%eax
c0104b83:	8b 4a 08             	mov    0x8(%edx),%ecx
c0104b86:	0b 05 a4 aa 10 c0    	or     0xc010aaa4,%eax
c0104b8c:	89 53 0c             	mov    %edx,0xc(%ebx)
c0104b8f:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0104b92:	a3 a4 aa 10 c0       	mov    %eax,0xc010aaa4
c0104b97:	89 5a 08             	mov    %ebx,0x8(%edx)
c0104b9a:	89 59 0c             	mov    %ebx,0xc(%ecx)
c0104b9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104ba0:	be 01 00 00 00       	mov    $0x1,%esi
c0104ba5:	c1 f9 02             	sar    $0x2,%ecx
c0104ba8:	d3 e6                	shl    %cl,%esi
c0104baa:	39 c6                	cmp    %eax,%esi
c0104bac:	0f 87 f6 00 00 00    	ja     c0104ca8 <_malloc_r+0x288>
c0104bb2:	85 f0                	test   %esi,%eax
c0104bb4:	0f 85 76 03 00 00    	jne    c0104f30 <_malloc_r+0x510>
c0104bba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104bbd:	01 f6                	add    %esi,%esi
c0104bbf:	83 e2 fc             	and    $0xfffffffc,%edx
c0104bc2:	85 f0                	test   %esi,%eax
c0104bc4:	8d 4a 04             	lea    0x4(%edx),%ecx
c0104bc7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104bca:	0f 85 60 03 00 00    	jne    c0104f30 <_malloc_r+0x510>
c0104bd0:	89 ca                	mov    %ecx,%edx
c0104bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104bd8:	01 f6                	add    %esi,%esi
c0104bda:	83 c2 04             	add    $0x4,%edx
c0104bdd:	85 f0                	test   %esi,%eax
c0104bdf:	74 f7                	je     c0104bd8 <_malloc_r+0x1b8>
c0104be1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104be4:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104be7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104bea:	8d 34 c5 a0 aa 10 c0 	lea    -0x3fef5560(,%eax,8),%esi
c0104bf1:	89 f1                	mov    %esi,%ecx
c0104bf3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104bf6:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104bf9:	39 d9                	cmp    %ebx,%ecx
c0104bfb:	75 1e                	jne    c0104c1b <_malloc_r+0x1fb>
c0104bfd:	e9 36 03 00 00       	jmp    c0104f38 <_malloc_r+0x518>
c0104c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104c08:	85 d2                	test   %edx,%edx
c0104c0a:	0f 89 c0 03 00 00    	jns    c0104fd0 <_malloc_r+0x5b0>
c0104c10:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104c13:	39 d9                	cmp    %ebx,%ecx
c0104c15:	0f 84 1d 03 00 00    	je     c0104f38 <_malloc_r+0x518>
c0104c1b:	8b 43 04             	mov    0x4(%ebx),%eax
c0104c1e:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c21:	89 c2                	mov    %eax,%edx
c0104c23:	29 fa                	sub    %edi,%edx
c0104c25:	83 fa 0f             	cmp    $0xf,%edx
c0104c28:	7e de                	jle    c0104c08 <_malloc_r+0x1e8>
c0104c2a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c0104c2d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c0104c30:	83 cf 01             	or     $0x1,%edi
c0104c33:	8b 73 08             	mov    0x8(%ebx),%esi
c0104c36:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104c39:	89 4e 0c             	mov    %ecx,0xc(%esi)
c0104c3c:	89 71 08             	mov    %esi,0x8(%ecx)
c0104c3f:	89 d1                	mov    %edx,%ecx
c0104c41:	83 c9 01             	or     $0x1,%ecx
c0104c44:	a3 b4 aa 10 c0       	mov    %eax,0xc010aab4
c0104c49:	a3 b0 aa 10 c0       	mov    %eax,0xc010aab0
c0104c4e:	c7 40 0c a8 aa 10 c0 	movl   $0xc010aaa8,0xc(%eax)
c0104c55:	c7 40 08 a8 aa 10 c0 	movl   $0xc010aaa8,0x8(%eax)
c0104c5c:	89 48 04             	mov    %ecx,0x4(%eax)
c0104c5f:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0104c62:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c65:	89 04 24             	mov    %eax,(%esp)
c0104c68:	e8 a3 05 00 00       	call   c0105210 <__malloc_unlock>
c0104c6d:	8d 43 08             	lea    0x8(%ebx),%eax
c0104c70:	e9 22 fe ff ff       	jmp    c0104a97 <_malloc_r+0x77>
c0104c75:	8d 76 00             	lea    0x0(%esi),%esi
c0104c78:	b8 7e 00 00 00       	mov    $0x7e,%eax
c0104c7d:	be 3f 00 00 00       	mov    $0x3f,%esi
c0104c82:	e9 5a fe ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c0104c87:	90                   	nop
c0104c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c8b:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0104c90:	89 04 24             	mov    %eax,(%esp)
c0104c93:	e8 78 05 00 00       	call   c0105210 <__malloc_unlock>
c0104c98:	83 c4 2c             	add    $0x2c,%esp
c0104c9b:	8d 43 08             	lea    0x8(%ebx),%eax
c0104c9e:	5b                   	pop    %ebx
c0104c9f:	5e                   	pop    %esi
c0104ca0:	5f                   	pop    %edi
c0104ca1:	5d                   	pop    %ebp
c0104ca2:	c3                   	ret    
c0104ca3:	90                   	nop
c0104ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104ca8:	8b 1d a8 aa 10 c0    	mov    0xc010aaa8,%ebx
c0104cae:	8b 73 04             	mov    0x4(%ebx),%esi
c0104cb1:	83 e6 fc             	and    $0xfffffffc,%esi
c0104cb4:	39 f7                	cmp    %esi,%edi
c0104cb6:	77 0d                	ja     c0104cc5 <_malloc_r+0x2a5>
c0104cb8:	89 f0                	mov    %esi,%eax
c0104cba:	29 f8                	sub    %edi,%eax
c0104cbc:	83 f8 0f             	cmp    $0xf,%eax
c0104cbf:	0f 8f 6b 01 00 00    	jg     c0104e30 <_malloc_r+0x410>
c0104cc5:	8b 0d 90 25 16 c0    	mov    0xc0162590,%ecx
c0104ccb:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c0104cce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104cd1:	01 f9                	add    %edi,%ecx
c0104cd3:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c0104cd9:	83 c1 10             	add    $0x10,%ecx
c0104cdc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ce1:	83 3d 80 aa 10 c0 ff 	cmpl   $0xffffffff,0xc010aa80
c0104ce8:	0f 44 c1             	cmove  %ecx,%eax
c0104ceb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104cee:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cf5:	89 04 24             	mov    %eax,(%esp)
c0104cf8:	e8 03 13 00 00       	call   c0106000 <_sbrk_r>
c0104cfd:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104d00:	89 c1                	mov    %eax,%ecx
c0104d02:	0f 84 17 03 00 00    	je     c010501f <_malloc_r+0x5ff>
c0104d08:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0104d0b:	0f 87 02 03 00 00    	ja     c0105013 <_malloc_r+0x5f3>
c0104d11:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104d14:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104d1a:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c0104d1d:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104d23:	0f 84 a9 03 00 00    	je     c01050d2 <_malloc_r+0x6b2>
c0104d29:	83 3d 80 aa 10 c0 ff 	cmpl   $0xffffffff,0xc010aa80
c0104d30:	0f 84 ca 03 00 00    	je     c0105100 <_malloc_r+0x6e0>
c0104d36:	89 c8                	mov    %ecx,%eax
c0104d38:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d3b:	01 d0                	add    %edx,%eax
c0104d3d:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0104d42:	89 c8                	mov    %ecx,%eax
c0104d44:	ba 00 10 00 00       	mov    $0x1000,%edx
c0104d49:	83 e0 07             	and    $0x7,%eax
c0104d4c:	74 0c                	je     c0104d5a <_malloc_r+0x33a>
c0104d4e:	29 c1                	sub    %eax,%ecx
c0104d50:	ba 08 10 00 00       	mov    $0x1008,%edx
c0104d55:	8d 49 08             	lea    0x8(%ecx),%ecx
c0104d58:	29 c2                	sub    %eax,%edx
c0104d5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d5d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104d60:	01 c8                	add    %ecx,%eax
c0104d62:	25 ff 0f 00 00       	and    $0xfff,%eax
c0104d67:	29 c2                	sub    %eax,%edx
c0104d69:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d6c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104d70:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0104d73:	89 04 24             	mov    %eax,(%esp)
c0104d76:	e8 85 12 00 00       	call   c0106000 <_sbrk_r>
c0104d7b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104d7e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104d81:	0f 84 6d 03 00 00    	je     c01050f4 <_malloc_r+0x6d4>
c0104d87:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104d8a:	29 c8                	sub    %ecx,%eax
c0104d8c:	01 d0                	add    %edx,%eax
c0104d8e:	83 c8 01             	or     $0x1,%eax
c0104d91:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104d97:	81 fb a0 aa 10 c0    	cmp    $0xc010aaa0,%ebx
c0104d9d:	89 0d a8 aa 10 c0    	mov    %ecx,0xc010aaa8
c0104da3:	89 41 04             	mov    %eax,0x4(%ecx)
c0104da6:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104dac:	0f 84 f2 02 00 00    	je     c01050a4 <_malloc_r+0x684>
c0104db2:	83 fe 0f             	cmp    $0xf,%esi
c0104db5:	0f 86 8d 02 00 00    	jbe    c0105048 <_malloc_r+0x628>
c0104dbb:	8b 43 04             	mov    0x4(%ebx),%eax
c0104dbe:	83 ee 0c             	sub    $0xc,%esi
c0104dc1:	83 e6 f8             	and    $0xfffffff8,%esi
c0104dc4:	83 e0 01             	and    $0x1,%eax
c0104dc7:	09 f0                	or     %esi,%eax
c0104dc9:	83 fe 0f             	cmp    $0xf,%esi
c0104dcc:	89 43 04             	mov    %eax,0x4(%ebx)
c0104dcf:	a1 a8 aa 10 c0       	mov    0xc010aaa8,%eax
c0104dd4:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c0104ddb:	00 
c0104ddc:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c0104de3:	00 
c0104de4:	0f 87 a2 02 00 00    	ja     c010508c <_malloc_r+0x66c>
c0104dea:	3b 15 8c 25 16 c0    	cmp    0xc016258c,%edx
c0104df0:	76 06                	jbe    c0104df8 <_malloc_r+0x3d8>
c0104df2:	89 15 8c 25 16 c0    	mov    %edx,0xc016258c
c0104df8:	3b 15 88 25 16 c0    	cmp    0xc0162588,%edx
c0104dfe:	76 06                	jbe    c0104e06 <_malloc_r+0x3e6>
c0104e00:	89 15 88 25 16 c0    	mov    %edx,0xc0162588
c0104e06:	8b 50 04             	mov    0x4(%eax),%edx
c0104e09:	89 c3                	mov    %eax,%ebx
c0104e0b:	83 e2 fc             	and    $0xfffffffc,%edx
c0104e0e:	89 d0                	mov    %edx,%eax
c0104e10:	29 f8                	sub    %edi,%eax
c0104e12:	39 d7                	cmp    %edx,%edi
c0104e14:	77 05                	ja     c0104e1b <_malloc_r+0x3fb>
c0104e16:	83 f8 0f             	cmp    $0xf,%eax
c0104e19:	7f 15                	jg     c0104e30 <_malloc_r+0x410>
c0104e1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e1e:	89 04 24             	mov    %eax,(%esp)
c0104e21:	e8 ea 03 00 00       	call   c0105210 <__malloc_unlock>
c0104e26:	31 c0                	xor    %eax,%eax
c0104e28:	e9 6a fc ff ff       	jmp    c0104a97 <_malloc_r+0x77>
c0104e2d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e30:	89 fa                	mov    %edi,%edx
c0104e32:	83 c8 01             	or     $0x1,%eax
c0104e35:	83 ca 01             	or     $0x1,%edx
c0104e38:	89 53 04             	mov    %edx,0x4(%ebx)
c0104e3b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104e3e:	89 15 a8 aa 10 c0    	mov    %edx,0xc010aaa8
c0104e44:	89 42 04             	mov    %eax,0x4(%edx)
c0104e47:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e4a:	89 04 24             	mov    %eax,(%esp)
c0104e4d:	e8 be 03 00 00       	call   c0105210 <__malloc_unlock>
c0104e52:	83 c4 2c             	add    $0x2c,%esp
c0104e55:	8d 43 08             	lea    0x8(%ebx),%eax
c0104e58:	5b                   	pop    %ebx
c0104e59:	5e                   	pop    %esi
c0104e5a:	5f                   	pop    %edi
c0104e5b:	5d                   	pop    %ebp
c0104e5c:	c3                   	ret    
c0104e5d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e60:	83 fe 14             	cmp    $0x14,%esi
c0104e63:	0f 86 8f 01 00 00    	jbe    c0104ff8 <_malloc_r+0x5d8>
c0104e69:	83 fe 54             	cmp    $0x54,%esi
c0104e6c:	0f 87 be 01 00 00    	ja     c0105030 <_malloc_r+0x610>
c0104e72:	89 fe                	mov    %edi,%esi
c0104e74:	c1 ee 0c             	shr    $0xc,%esi
c0104e77:	83 c6 6e             	add    $0x6e,%esi
c0104e7a:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104e7d:	e9 5f fc ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c0104e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104e88:	89 f1                	mov    %esi,%ecx
c0104e8a:	c1 e9 09             	shr    $0x9,%ecx
c0104e8d:	83 f9 04             	cmp    $0x4,%ecx
c0104e90:	0f 86 6d 01 00 00    	jbe    c0105003 <_malloc_r+0x5e3>
c0104e96:	83 f9 14             	cmp    $0x14,%ecx
c0104e99:	0f 87 0f 02 00 00    	ja     c01050ae <_malloc_r+0x68e>
c0104e9f:	83 c1 5b             	add    $0x5b,%ecx
c0104ea2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0104ea5:	8d 04 85 a0 aa 10 c0 	lea    -0x3fef5560(,%eax,4),%eax
c0104eac:	8b 50 08             	mov    0x8(%eax),%edx
c0104eaf:	39 c2                	cmp    %eax,%edx
c0104eb1:	0f 84 a1 01 00 00    	je     c0105058 <_malloc_r+0x638>
c0104eb7:	90                   	nop
c0104eb8:	8b 4a 04             	mov    0x4(%edx),%ecx
c0104ebb:	83 e1 fc             	and    $0xfffffffc,%ecx
c0104ebe:	39 ce                	cmp    %ecx,%esi
c0104ec0:	73 07                	jae    c0104ec9 <_malloc_r+0x4a9>
c0104ec2:	8b 52 08             	mov    0x8(%edx),%edx
c0104ec5:	39 d0                	cmp    %edx,%eax
c0104ec7:	75 ef                	jne    c0104eb8 <_malloc_r+0x498>
c0104ec9:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0104ecc:	a1 a4 aa 10 c0       	mov    0xc010aaa4,%eax
c0104ed1:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0104ed4:	89 53 08             	mov    %edx,0x8(%ebx)
c0104ed7:	89 59 08             	mov    %ebx,0x8(%ecx)
c0104eda:	89 5a 0c             	mov    %ebx,0xc(%edx)
c0104edd:	e9 bb fc ff ff       	jmp    c0104b9d <_malloc_r+0x17d>
c0104ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104ee8:	89 c1                	mov    %eax,%ecx
c0104eea:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104eed:	83 c9 01             	or     $0x1,%ecx
c0104ef0:	83 cf 01             	or     $0x1,%edi
c0104ef3:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104ef6:	89 15 b4 aa 10 c0    	mov    %edx,0xc010aab4
c0104efc:	89 15 b0 aa 10 c0    	mov    %edx,0xc010aab0
c0104f02:	c7 42 0c a8 aa 10 c0 	movl   $0xc010aaa8,0xc(%edx)
c0104f09:	c7 42 08 a8 aa 10 c0 	movl   $0xc010aaa8,0x8(%edx)
c0104f10:	89 4a 04             	mov    %ecx,0x4(%edx)
c0104f13:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0104f16:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f19:	89 04 24             	mov    %eax,(%esp)
c0104f1c:	e8 ef 02 00 00       	call   c0105210 <__malloc_unlock>
c0104f21:	8d 43 08             	lea    0x8(%ebx),%eax
c0104f24:	e9 6e fb ff ff       	jmp    c0104a97 <_malloc_r+0x77>
c0104f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104f30:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104f33:	e9 af fc ff ff       	jmp    c0104be7 <_malloc_r+0x1c7>
c0104f38:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0104f3c:	83 c1 08             	add    $0x8,%ecx
c0104f3f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c0104f43:	0f 85 ad fc ff ff    	jne    c0104bf6 <_malloc_r+0x1d6>
c0104f49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104f4c:	eb 12                	jmp    c0104f60 <_malloc_r+0x540>
c0104f4e:	66 90                	xchg   %ax,%ax
c0104f50:	8d 56 f8             	lea    -0x8(%esi),%edx
c0104f53:	8b 36                	mov    (%esi),%esi
c0104f55:	83 e8 01             	sub    $0x1,%eax
c0104f58:	39 d6                	cmp    %edx,%esi
c0104f5a:	0f 85 ea 01 00 00    	jne    c010514a <_malloc_r+0x72a>
c0104f60:	a8 03                	test   $0x3,%al
c0104f62:	75 ec                	jne    c0104f50 <_malloc_r+0x530>
c0104f64:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f67:	f7 d0                	not    %eax
c0104f69:	23 05 a4 aa 10 c0    	and    0xc010aaa4,%eax
c0104f6f:	a3 a4 aa 10 c0       	mov    %eax,0xc010aaa4
c0104f74:	d1 65 dc             	shll   -0x24(%ebp)
c0104f77:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104f7a:	39 c2                	cmp    %eax,%edx
c0104f7c:	0f 87 26 fd ff ff    	ja     c0104ca8 <_malloc_r+0x288>
c0104f82:	85 d2                	test   %edx,%edx
c0104f84:	0f 84 1e fd ff ff    	je     c0104ca8 <_malloc_r+0x288>
c0104f8a:	85 c2                	test   %eax,%edx
c0104f8c:	0f 85 c2 01 00 00    	jne    c0105154 <_malloc_r+0x734>
c0104f92:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0104f95:	89 f1                	mov    %esi,%ecx
c0104f97:	01 d2                	add    %edx,%edx
c0104f99:	83 c1 04             	add    $0x4,%ecx
c0104f9c:	85 d0                	test   %edx,%eax
c0104f9e:	74 f7                	je     c0104f97 <_malloc_r+0x577>
c0104fa0:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104fa3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0104fa6:	e9 3c fc ff ff       	jmp    c0104be7 <_malloc_r+0x1c7>
c0104fab:	90                   	nop
c0104fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104fb0:	8d 43 08             	lea    0x8(%ebx),%eax
c0104fb3:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0104fb6:	39 d8                	cmp    %ebx,%eax
c0104fb8:	0f 85 b4 fa ff ff    	jne    c0104a72 <_malloc_r+0x52>
c0104fbe:	8d 42 02             	lea    0x2(%edx),%eax
c0104fc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104fc4:	e9 56 fb ff ff       	jmp    c0104b1f <_malloc_r+0xff>
c0104fc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104fd0:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104fd5:	8b 53 08             	mov    0x8(%ebx),%edx
c0104fd8:	8b 43 0c             	mov    0xc(%ebx),%eax
c0104fdb:	89 42 0c             	mov    %eax,0xc(%edx)
c0104fde:	89 50 08             	mov    %edx,0x8(%eax)
c0104fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fe4:	89 04 24             	mov    %eax,(%esp)
c0104fe7:	e8 24 02 00 00       	call   c0105210 <__malloc_unlock>
c0104fec:	8d 43 08             	lea    0x8(%ebx),%eax
c0104fef:	e9 a3 fa ff ff       	jmp    c0104a97 <_malloc_r+0x77>
c0104ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104ff8:	83 c6 5b             	add    $0x5b,%esi
c0104ffb:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104ffe:	e9 de fa ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c0105003:	89 f1                	mov    %esi,%ecx
c0105005:	c1 e9 06             	shr    $0x6,%ecx
c0105008:	83 c1 38             	add    $0x38,%ecx
c010500b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010500e:	e9 92 fe ff ff       	jmp    c0104ea5 <_malloc_r+0x485>
c0105013:	81 fb a0 aa 10 c0    	cmp    $0xc010aaa0,%ebx
c0105019:	0f 84 f2 fc ff ff    	je     c0104d11 <_malloc_r+0x2f1>
c010501f:	8b 1d a8 aa 10 c0    	mov    0xc010aaa8,%ebx
c0105025:	8b 53 04             	mov    0x4(%ebx),%edx
c0105028:	83 e2 fc             	and    $0xfffffffc,%edx
c010502b:	e9 de fd ff ff       	jmp    c0104e0e <_malloc_r+0x3ee>
c0105030:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c0105036:	77 3c                	ja     c0105074 <_malloc_r+0x654>
c0105038:	89 fe                	mov    %edi,%esi
c010503a:	c1 ee 0f             	shr    $0xf,%esi
c010503d:	83 c6 77             	add    $0x77,%esi
c0105040:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105043:	e9 99 fa ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c0105048:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c010504f:	89 cb                	mov    %ecx,%ebx
c0105051:	31 d2                	xor    %edx,%edx
c0105053:	e9 b6 fd ff ff       	jmp    c0104e0e <_malloc_r+0x3ee>
c0105058:	c1 f9 02             	sar    $0x2,%ecx
c010505b:	b8 01 00 00 00       	mov    $0x1,%eax
c0105060:	d3 e0                	shl    %cl,%eax
c0105062:	89 d1                	mov    %edx,%ecx
c0105064:	0b 05 a4 aa 10 c0    	or     0xc010aaa4,%eax
c010506a:	a3 a4 aa 10 c0       	mov    %eax,0xc010aaa4
c010506f:	e9 5d fe ff ff       	jmp    c0104ed1 <_malloc_r+0x4b1>
c0105074:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c010507a:	77 47                	ja     c01050c3 <_malloc_r+0x6a3>
c010507c:	89 fe                	mov    %edi,%esi
c010507e:	c1 ee 12             	shr    $0x12,%esi
c0105081:	83 c6 7c             	add    $0x7c,%esi
c0105084:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105087:	e9 55 fa ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c010508c:	8b 45 08             	mov    0x8(%ebp),%eax
c010508f:	83 c3 08             	add    $0x8,%ebx
c0105092:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105096:	89 04 24             	mov    %eax,(%esp)
c0105099:	e8 c2 22 00 00       	call   c0107360 <_free_r>
c010509e:	8b 15 60 25 16 c0    	mov    0xc0162560,%edx
c01050a4:	a1 a8 aa 10 c0       	mov    0xc010aaa8,%eax
c01050a9:	e9 3c fd ff ff       	jmp    c0104dea <_malloc_r+0x3ca>
c01050ae:	83 f9 54             	cmp    $0x54,%ecx
c01050b1:	77 58                	ja     c010510b <_malloc_r+0x6eb>
c01050b3:	89 f1                	mov    %esi,%ecx
c01050b5:	c1 e9 0c             	shr    $0xc,%ecx
c01050b8:	83 c1 6e             	add    $0x6e,%ecx
c01050bb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01050be:	e9 e2 fd ff ff       	jmp    c0104ea5 <_malloc_r+0x485>
c01050c3:	b8 fc 00 00 00       	mov    $0xfc,%eax
c01050c8:	be 7e 00 00 00       	mov    $0x7e,%esi
c01050cd:	e9 0f fa ff ff       	jmp    c0104ae1 <_malloc_r+0xc1>
c01050d2:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c01050d9:	0f 85 4a fc ff ff    	jne    c0104d29 <_malloc_r+0x309>
c01050df:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01050e2:	a1 a8 aa 10 c0       	mov    0xc010aaa8,%eax
c01050e7:	01 f1                	add    %esi,%ecx
c01050e9:	83 c9 01             	or     $0x1,%ecx
c01050ec:	89 48 04             	mov    %ecx,0x4(%eax)
c01050ef:	e9 f6 fc ff ff       	jmp    c0104dea <_malloc_r+0x3ca>
c01050f4:	b8 01 00 00 00       	mov    $0x1,%eax
c01050f9:	31 d2                	xor    %edx,%edx
c01050fb:	e9 91 fc ff ff       	jmp    c0104d91 <_malloc_r+0x371>
c0105100:	89 0d 80 aa 10 c0    	mov    %ecx,0xc010aa80
c0105106:	e9 37 fc ff ff       	jmp    c0104d42 <_malloc_r+0x322>
c010510b:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0105111:	77 10                	ja     c0105123 <_malloc_r+0x703>
c0105113:	89 f1                	mov    %esi,%ecx
c0105115:	c1 e9 0f             	shr    $0xf,%ecx
c0105118:	83 c1 77             	add    $0x77,%ecx
c010511b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010511e:	e9 82 fd ff ff       	jmp    c0104ea5 <_malloc_r+0x485>
c0105123:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0105129:	77 10                	ja     c010513b <_malloc_r+0x71b>
c010512b:	89 f1                	mov    %esi,%ecx
c010512d:	c1 e9 12             	shr    $0x12,%ecx
c0105130:	83 c1 7c             	add    $0x7c,%ecx
c0105133:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105136:	e9 6a fd ff ff       	jmp    c0104ea5 <_malloc_r+0x485>
c010513b:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105140:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0105145:	e9 5b fd ff ff       	jmp    c0104ea5 <_malloc_r+0x485>
c010514a:	a1 a4 aa 10 c0       	mov    0xc010aaa4,%eax
c010514f:	e9 20 fe ff ff       	jmp    c0104f74 <_malloc_r+0x554>
c0105154:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105157:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010515a:	e9 88 fa ff ff       	jmp    c0104be7 <_malloc_r+0x1c7>
c010515f:	90                   	nop

c0105160 <memchr>:
c0105160:	55                   	push   %ebp
c0105161:	89 e5                	mov    %esp,%ebp
c0105163:	57                   	push   %edi
c0105164:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0105168:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010516b:	8b 7d 08             	mov    0x8(%ebp),%edi
c010516e:	31 d2                	xor    %edx,%edx
c0105170:	85 c9                	test   %ecx,%ecx
c0105172:	74 79                	je     c01051ed <L20>
c0105174:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010517a:	74 28                	je     c01051a4 <L5>
c010517c:	3a 07                	cmp    (%edi),%al
c010517e:	74 6a                	je     c01051ea <L15>
c0105180:	47                   	inc    %edi
c0105181:	49                   	dec    %ecx
c0105182:	74 69                	je     c01051ed <L20>
c0105184:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010518a:	74 18                	je     c01051a4 <L5>
c010518c:	3a 07                	cmp    (%edi),%al
c010518e:	74 5a                	je     c01051ea <L15>
c0105190:	47                   	inc    %edi
c0105191:	49                   	dec    %ecx
c0105192:	74 59                	je     c01051ed <L20>
c0105194:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010519a:	74 08                	je     c01051a4 <L5>
c010519c:	3a 07                	cmp    (%edi),%al
c010519e:	74 4a                	je     c01051ea <L15>
c01051a0:	47                   	inc    %edi
c01051a1:	49                   	dec    %ecx
c01051a2:	74 49                	je     c01051ed <L20>

c01051a4 <L5>:
c01051a4:	88 c4                	mov    %al,%ah
c01051a6:	89 c2                	mov    %eax,%edx
c01051a8:	c1 e2 10             	shl    $0x10,%edx
c01051ab:	09 d0                	or     %edx,%eax
c01051ad:	53                   	push   %ebx
c01051ae:	66 90                	xchg   %ax,%ax

c01051b0 <L8>:
c01051b0:	83 e9 04             	sub    $0x4,%ecx
c01051b3:	72 1c                	jb     c01051d1 <L9>
c01051b5:	8b 17                	mov    (%edi),%edx
c01051b7:	83 c7 04             	add    $0x4,%edi
c01051ba:	31 c2                	xor    %eax,%edx
c01051bc:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c01051c2:	f7 d2                	not    %edx
c01051c4:	21 d3                	and    %edx,%ebx
c01051c6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c01051cc:	74 e2                	je     c01051b0 <L8>
c01051ce:	83 ef 04             	sub    $0x4,%edi

c01051d1 <L9>:
c01051d1:	5b                   	pop    %ebx
c01051d2:	31 d2                	xor    %edx,%edx
c01051d4:	83 c1 04             	add    $0x4,%ecx
c01051d7:	74 14                	je     c01051ed <L20>
c01051d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01051e0 <L10>:
c01051e0:	3a 07                	cmp    (%edi),%al
c01051e2:	74 06                	je     c01051ea <L15>
c01051e4:	47                   	inc    %edi
c01051e5:	49                   	dec    %ecx
c01051e6:	75 f8                	jne    c01051e0 <L10>
c01051e8:	31 ff                	xor    %edi,%edi

c01051ea <L15>:
c01051ea:	4a                   	dec    %edx
c01051eb:	21 fa                	and    %edi,%edx

c01051ed <L20>:
c01051ed:	89 d0                	mov    %edx,%eax
c01051ef:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01051f2:	5f                   	pop    %edi
c01051f3:	c9                   	leave  
c01051f4:	c3                   	ret    
c01051f5:	66 90                	xchg   %ax,%ax
c01051f7:	66 90                	xchg   %ax,%ax
c01051f9:	66 90                	xchg   %ax,%ax
c01051fb:	66 90                	xchg   %ax,%ax
c01051fd:	66 90                	xchg   %ax,%ax
c01051ff:	90                   	nop

c0105200 <__malloc_lock>:
c0105200:	55                   	push   %ebp
c0105201:	89 e5                	mov    %esp,%ebp
c0105203:	5d                   	pop    %ebp
c0105204:	c3                   	ret    
c0105205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105210 <__malloc_unlock>:
c0105210:	55                   	push   %ebp
c0105211:	89 e5                	mov    %esp,%ebp
c0105213:	5d                   	pop    %ebp
c0105214:	c3                   	ret    
c0105215:	66 90                	xchg   %ax,%ax
c0105217:	66 90                	xchg   %ax,%ax
c0105219:	66 90                	xchg   %ax,%ax
c010521b:	66 90                	xchg   %ax,%ax
c010521d:	66 90                	xchg   %ax,%ax
c010521f:	90                   	nop

c0105220 <_Balloc>:
c0105220:	55                   	push   %ebp
c0105221:	89 e5                	mov    %esp,%ebp
c0105223:	57                   	push   %edi
c0105224:	56                   	push   %esi
c0105225:	53                   	push   %ebx
c0105226:	83 ec 1c             	sub    $0x1c,%esp
c0105229:	8b 75 08             	mov    0x8(%ebp),%esi
c010522c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010522f:	8b 46 4c             	mov    0x4c(%esi),%eax
c0105232:	85 c0                	test   %eax,%eax
c0105234:	74 2a                	je     c0105260 <_Balloc+0x40>
c0105236:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c0105239:	8b 02                	mov    (%edx),%eax
c010523b:	85 c0                	test   %eax,%eax
c010523d:	74 49                	je     c0105288 <_Balloc+0x68>
c010523f:	8b 08                	mov    (%eax),%ecx
c0105241:	89 0a                	mov    %ecx,(%edx)
c0105243:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c010524a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0105251:	83 c4 1c             	add    $0x1c,%esp
c0105254:	5b                   	pop    %ebx
c0105255:	5e                   	pop    %esi
c0105256:	5f                   	pop    %edi
c0105257:	5d                   	pop    %ebp
c0105258:	c3                   	ret    
c0105259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105260:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0105267:	00 
c0105268:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010526f:	00 
c0105270:	89 34 24             	mov    %esi,(%esp)
c0105273:	e8 38 1f 00 00       	call   c01071b0 <_calloc_r>
c0105278:	85 c0                	test   %eax,%eax
c010527a:	89 46 4c             	mov    %eax,0x4c(%esi)
c010527d:	75 b7                	jne    c0105236 <_Balloc+0x16>
c010527f:	31 c0                	xor    %eax,%eax
c0105281:	eb ce                	jmp    c0105251 <_Balloc+0x31>
c0105283:	90                   	nop
c0105284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105288:	89 d9                	mov    %ebx,%ecx
c010528a:	bf 01 00 00 00       	mov    $0x1,%edi
c010528f:	d3 e7                	shl    %cl,%edi
c0105291:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c0105298:	89 44 24 08          	mov    %eax,0x8(%esp)
c010529c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01052a3:	00 
c01052a4:	89 34 24             	mov    %esi,(%esp)
c01052a7:	e8 04 1f 00 00       	call   c01071b0 <_calloc_r>
c01052ac:	85 c0                	test   %eax,%eax
c01052ae:	74 cf                	je     c010527f <_Balloc+0x5f>
c01052b0:	89 58 04             	mov    %ebx,0x4(%eax)
c01052b3:	89 78 08             	mov    %edi,0x8(%eax)
c01052b6:	eb 8b                	jmp    c0105243 <_Balloc+0x23>
c01052b8:	90                   	nop
c01052b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01052c0 <_Bfree>:
c01052c0:	55                   	push   %ebp
c01052c1:	89 e5                	mov    %esp,%ebp
c01052c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052c6:	85 c0                	test   %eax,%eax
c01052c8:	74 12                	je     c01052dc <_Bfree+0x1c>
c01052ca:	8b 55 08             	mov    0x8(%ebp),%edx
c01052cd:	8b 48 04             	mov    0x4(%eax),%ecx
c01052d0:	8b 52 4c             	mov    0x4c(%edx),%edx
c01052d3:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c01052d6:	8b 0a                	mov    (%edx),%ecx
c01052d8:	89 08                	mov    %ecx,(%eax)
c01052da:	89 02                	mov    %eax,(%edx)
c01052dc:	5d                   	pop    %ebp
c01052dd:	c3                   	ret    
c01052de:	66 90                	xchg   %ax,%ax

c01052e0 <__multadd>:
c01052e0:	55                   	push   %ebp
c01052e1:	89 e5                	mov    %esp,%ebp
c01052e3:	57                   	push   %edi
c01052e4:	56                   	push   %esi
c01052e5:	53                   	push   %ebx
c01052e6:	83 ec 2c             	sub    $0x2c,%esp
c01052e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052ec:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01052ef:	8b 40 10             	mov    0x10(%eax),%eax
c01052f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052f8:	8d 78 14             	lea    0x14(%eax),%edi
c01052fb:	31 c0                	xor    %eax,%eax
c01052fd:	8d 76 00             	lea    0x0(%esi),%esi
c0105300:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c0105303:	0f b7 d1             	movzwl %cx,%edx
c0105306:	0f af 55 10          	imul   0x10(%ebp),%edx
c010530a:	c1 e9 10             	shr    $0x10,%ecx
c010530d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c0105311:	01 da                	add    %ebx,%edx
c0105313:	89 d3                	mov    %edx,%ebx
c0105315:	0f b7 d2             	movzwl %dx,%edx
c0105318:	c1 eb 10             	shr    $0x10,%ebx
c010531b:	01 d9                	add    %ebx,%ecx
c010531d:	89 ce                	mov    %ecx,%esi
c010531f:	c1 e1 10             	shl    $0x10,%ecx
c0105322:	01 d1                	add    %edx,%ecx
c0105324:	c1 ee 10             	shr    $0x10,%esi
c0105327:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c010532a:	83 c0 01             	add    $0x1,%eax
c010532d:	89 f3                	mov    %esi,%ebx
c010532f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105332:	7f cc                	jg     c0105300 <__multadd+0x20>
c0105334:	85 f6                	test   %esi,%esi
c0105336:	74 1b                	je     c0105353 <__multadd+0x73>
c0105338:	8b 45 0c             	mov    0xc(%ebp),%eax
c010533b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c010533e:	3b 78 08             	cmp    0x8(%eax),%edi
c0105341:	7d 1d                	jge    c0105360 <__multadd+0x80>
c0105343:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105346:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105349:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c010534d:	83 c0 01             	add    $0x1,%eax
c0105350:	89 47 10             	mov    %eax,0x10(%edi)
c0105353:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105356:	83 c4 2c             	add    $0x2c,%esp
c0105359:	5b                   	pop    %ebx
c010535a:	5e                   	pop    %esi
c010535b:	5f                   	pop    %edi
c010535c:	5d                   	pop    %ebp
c010535d:	c3                   	ret    
c010535e:	66 90                	xchg   %ax,%ax
c0105360:	8b 40 04             	mov    0x4(%eax),%eax
c0105363:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105366:	83 c0 01             	add    $0x1,%eax
c0105369:	89 44 24 04          	mov    %eax,0x4(%esp)
c010536d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105370:	89 04 24             	mov    %eax,(%esp)
c0105373:	e8 a8 fe ff ff       	call   c0105220 <_Balloc>
c0105378:	89 c3                	mov    %eax,%ebx
c010537a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010537d:	8b 40 10             	mov    0x10(%eax),%eax
c0105380:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0105387:	89 44 24 08          	mov    %eax,0x8(%esp)
c010538b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010538e:	83 c0 0c             	add    $0xc,%eax
c0105391:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105395:	8d 43 0c             	lea    0xc(%ebx),%eax
c0105398:	89 04 24             	mov    %eax,(%esp)
c010539b:	e8 d0 c0 ff ff       	call   c0101470 <memcpy>
c01053a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01053a3:	8b 7d 0c             	mov    0xc(%ebp),%edi
c01053a6:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01053a9:	8b 50 04             	mov    0x4(%eax),%edx
c01053ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01053af:	8b 40 4c             	mov    0x4c(%eax),%eax
c01053b2:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01053b5:	8b 10                	mov    (%eax),%edx
c01053b7:	89 17                	mov    %edx,(%edi)
c01053b9:	89 38                	mov    %edi,(%eax)
c01053bb:	eb 86                	jmp    c0105343 <__multadd+0x63>
c01053bd:	8d 76 00             	lea    0x0(%esi),%esi

c01053c0 <__s2b>:
c01053c0:	55                   	push   %ebp
c01053c1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c01053c6:	89 e5                	mov    %esp,%ebp
c01053c8:	57                   	push   %edi
c01053c9:	56                   	push   %esi
c01053ca:	53                   	push   %ebx
c01053cb:	83 ec 2c             	sub    $0x2c,%esp
c01053ce:	8b 45 14             	mov    0x14(%ebp),%eax
c01053d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01053d4:	8b 75 0c             	mov    0xc(%ebp),%esi
c01053d7:	8d 48 08             	lea    0x8(%eax),%ecx
c01053da:	89 c8                	mov    %ecx,%eax
c01053dc:	f7 ea                	imul   %edx
c01053de:	c1 f9 1f             	sar    $0x1f,%ecx
c01053e1:	d1 fa                	sar    %edx
c01053e3:	29 ca                	sub    %ecx,%edx
c01053e5:	83 fa 01             	cmp    $0x1,%edx
c01053e8:	0f 8e be 00 00 00    	jle    c01054ac <__s2b+0xec>
c01053ee:	b8 01 00 00 00       	mov    $0x1,%eax
c01053f3:	31 c9                	xor    %ecx,%ecx
c01053f5:	8d 76 00             	lea    0x0(%esi),%esi
c01053f8:	01 c0                	add    %eax,%eax
c01053fa:	83 c1 01             	add    $0x1,%ecx
c01053fd:	39 c2                	cmp    %eax,%edx
c01053ff:	7f f7                	jg     c01053f8 <__s2b+0x38>
c0105401:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0105405:	89 1c 24             	mov    %ebx,(%esp)
c0105408:	e8 13 fe ff ff       	call   c0105220 <_Balloc>
c010540d:	8b 55 18             	mov    0x18(%ebp),%edx
c0105410:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c0105414:	89 50 14             	mov    %edx,0x14(%eax)
c0105417:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c010541e:	0f 8e 7c 00 00 00    	jle    c01054a0 <__s2b+0xe0>
c0105424:	8d 4e 09             	lea    0x9(%esi),%ecx
c0105427:	03 75 10             	add    0x10(%ebp),%esi
c010542a:	89 cf                	mov    %ecx,%edi
c010542c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010542f:	90                   	nop
c0105430:	83 c7 01             	add    $0x1,%edi
c0105433:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c0105437:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010543e:	00 
c010543f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105443:	89 1c 24             	mov    %ebx,(%esp)
c0105446:	83 ea 30             	sub    $0x30,%edx
c0105449:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010544d:	e8 8e fe ff ff       	call   c01052e0 <__multadd>
c0105452:	39 f7                	cmp    %esi,%edi
c0105454:	75 da                	jne    c0105430 <__s2b+0x70>
c0105456:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105459:	8b 7d 10             	mov    0x10(%ebp),%edi
c010545c:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c0105460:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0105463:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c0105466:	7e 2e                	jle    c0105496 <__s2b+0xd6>
c0105468:	8b 7d 14             	mov    0x14(%ebp),%edi
c010546b:	29 cf                	sub    %ecx,%edi
c010546d:	01 f7                	add    %esi,%edi
c010546f:	90                   	nop
c0105470:	83 c6 01             	add    $0x1,%esi
c0105473:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c0105477:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010547e:	00 
c010547f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105483:	89 1c 24             	mov    %ebx,(%esp)
c0105486:	83 ea 30             	sub    $0x30,%edx
c0105489:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010548d:	e8 4e fe ff ff       	call   c01052e0 <__multadd>
c0105492:	39 fe                	cmp    %edi,%esi
c0105494:	75 da                	jne    c0105470 <__s2b+0xb0>
c0105496:	83 c4 2c             	add    $0x2c,%esp
c0105499:	5b                   	pop    %ebx
c010549a:	5e                   	pop    %esi
c010549b:	5f                   	pop    %edi
c010549c:	5d                   	pop    %ebp
c010549d:	c3                   	ret    
c010549e:	66 90                	xchg   %ax,%ax
c01054a0:	83 c6 0a             	add    $0xa,%esi
c01054a3:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c01054aa:	eb b4                	jmp    c0105460 <__s2b+0xa0>
c01054ac:	31 c9                	xor    %ecx,%ecx
c01054ae:	e9 4e ff ff ff       	jmp    c0105401 <__s2b+0x41>
c01054b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01054b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01054c0 <__hi0bits>:
c01054c0:	55                   	push   %ebp
c01054c1:	31 c9                	xor    %ecx,%ecx
c01054c3:	89 e5                	mov    %esp,%ebp
c01054c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01054c8:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c01054ce:	75 05                	jne    c01054d5 <__hi0bits+0x15>
c01054d0:	c1 e2 10             	shl    $0x10,%edx
c01054d3:	b1 10                	mov    $0x10,%cl
c01054d5:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c01054db:	75 06                	jne    c01054e3 <__hi0bits+0x23>
c01054dd:	83 c1 08             	add    $0x8,%ecx
c01054e0:	c1 e2 08             	shl    $0x8,%edx
c01054e3:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c01054e9:	75 06                	jne    c01054f1 <__hi0bits+0x31>
c01054eb:	83 c1 04             	add    $0x4,%ecx
c01054ee:	c1 e2 04             	shl    $0x4,%edx
c01054f1:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c01054f7:	75 06                	jne    c01054ff <__hi0bits+0x3f>
c01054f9:	83 c1 02             	add    $0x2,%ecx
c01054fc:	c1 e2 02             	shl    $0x2,%edx
c01054ff:	85 d2                	test   %edx,%edx
c0105501:	89 c8                	mov    %ecx,%eax
c0105503:	78 0d                	js     c0105512 <__hi0bits+0x52>
c0105505:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c010550b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105510:	75 06                	jne    c0105518 <__hi0bits+0x58>
c0105512:	5d                   	pop    %ebp
c0105513:	c3                   	ret    
c0105514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105518:	8d 41 01             	lea    0x1(%ecx),%eax
c010551b:	5d                   	pop    %ebp
c010551c:	c3                   	ret    
c010551d:	8d 76 00             	lea    0x0(%esi),%esi

c0105520 <__lo0bits>:
c0105520:	55                   	push   %ebp
c0105521:	89 e5                	mov    %esp,%ebp
c0105523:	53                   	push   %ebx
c0105524:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105527:	8b 13                	mov    (%ebx),%edx
c0105529:	f6 c2 07             	test   $0x7,%dl
c010552c:	74 1a                	je     c0105548 <__lo0bits+0x28>
c010552e:	31 c0                	xor    %eax,%eax
c0105530:	f6 c2 01             	test   $0x1,%dl
c0105533:	75 0f                	jne    c0105544 <__lo0bits+0x24>
c0105535:	f6 c2 02             	test   $0x2,%dl
c0105538:	75 56                	jne    c0105590 <__lo0bits+0x70>
c010553a:	c1 ea 02             	shr    $0x2,%edx
c010553d:	b8 02 00 00 00       	mov    $0x2,%eax
c0105542:	89 13                	mov    %edx,(%ebx)
c0105544:	5b                   	pop    %ebx
c0105545:	5d                   	pop    %ebp
c0105546:	c3                   	ret    
c0105547:	90                   	nop
c0105548:	31 c9                	xor    %ecx,%ecx
c010554a:	66 85 d2             	test   %dx,%dx
c010554d:	75 05                	jne    c0105554 <__lo0bits+0x34>
c010554f:	c1 ea 10             	shr    $0x10,%edx
c0105552:	b1 10                	mov    $0x10,%cl
c0105554:	84 d2                	test   %dl,%dl
c0105556:	75 06                	jne    c010555e <__lo0bits+0x3e>
c0105558:	83 c1 08             	add    $0x8,%ecx
c010555b:	c1 ea 08             	shr    $0x8,%edx
c010555e:	f6 c2 0f             	test   $0xf,%dl
c0105561:	75 06                	jne    c0105569 <__lo0bits+0x49>
c0105563:	83 c1 04             	add    $0x4,%ecx
c0105566:	c1 ea 04             	shr    $0x4,%edx
c0105569:	f6 c2 03             	test   $0x3,%dl
c010556c:	75 06                	jne    c0105574 <__lo0bits+0x54>
c010556e:	83 c1 02             	add    $0x2,%ecx
c0105571:	c1 ea 02             	shr    $0x2,%edx
c0105574:	f6 c2 01             	test   $0x1,%dl
c0105577:	75 0c                	jne    c0105585 <__lo0bits+0x65>
c0105579:	d1 ea                	shr    %edx
c010557b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105580:	74 c2                	je     c0105544 <__lo0bits+0x24>
c0105582:	83 c1 01             	add    $0x1,%ecx
c0105585:	89 13                	mov    %edx,(%ebx)
c0105587:	89 c8                	mov    %ecx,%eax
c0105589:	5b                   	pop    %ebx
c010558a:	5d                   	pop    %ebp
c010558b:	c3                   	ret    
c010558c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105590:	d1 ea                	shr    %edx
c0105592:	b0 01                	mov    $0x1,%al
c0105594:	89 13                	mov    %edx,(%ebx)
c0105596:	5b                   	pop    %ebx
c0105597:	5d                   	pop    %ebp
c0105598:	c3                   	ret    
c0105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01055a0 <__i2b>:
c01055a0:	55                   	push   %ebp
c01055a1:	89 e5                	mov    %esp,%ebp
c01055a3:	83 ec 18             	sub    $0x18,%esp
c01055a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055a9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01055b0:	00 
c01055b1:	89 04 24             	mov    %eax,(%esp)
c01055b4:	e8 67 fc ff ff       	call   c0105220 <_Balloc>
c01055b9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01055bc:	89 50 14             	mov    %edx,0x14(%eax)
c01055bf:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01055c6:	c9                   	leave  
c01055c7:	c3                   	ret    
c01055c8:	90                   	nop
c01055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01055d0 <__multiply>:
c01055d0:	55                   	push   %ebp
c01055d1:	89 e5                	mov    %esp,%ebp
c01055d3:	57                   	push   %edi
c01055d4:	56                   	push   %esi
c01055d5:	53                   	push   %ebx
c01055d6:	83 ec 3c             	sub    $0x3c,%esp
c01055d9:	8b 75 0c             	mov    0xc(%ebp),%esi
c01055dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01055df:	8b 7e 10             	mov    0x10(%esi),%edi
c01055e2:	8b 58 10             	mov    0x10(%eax),%ebx
c01055e5:	39 df                	cmp    %ebx,%edi
c01055e7:	7d 0e                	jge    c01055f7 <__multiply+0x27>
c01055e9:	89 f8                	mov    %edi,%eax
c01055eb:	89 df                	mov    %ebx,%edi
c01055ed:	89 c3                	mov    %eax,%ebx
c01055ef:	89 f0                	mov    %esi,%eax
c01055f1:	8b 75 10             	mov    0x10(%ebp),%esi
c01055f4:	89 45 10             	mov    %eax,0x10(%ebp)
c01055f7:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c01055fa:	3b 46 08             	cmp    0x8(%esi),%eax
c01055fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105600:	0f 9f c0             	setg   %al
c0105603:	0f b6 c0             	movzbl %al,%eax
c0105606:	03 46 04             	add    0x4(%esi),%eax
c0105609:	89 44 24 04          	mov    %eax,0x4(%esp)
c010560d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105610:	89 04 24             	mov    %eax,(%esp)
c0105613:	e8 08 fc ff ff       	call   c0105220 <_Balloc>
c0105618:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010561b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010561e:	8d 40 14             	lea    0x14(%eax),%eax
c0105621:	8d 14 90             	lea    (%eax,%edx,4),%edx
c0105624:	89 d1                	mov    %edx,%ecx
c0105626:	39 c8                	cmp    %ecx,%eax
c0105628:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010562b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010562e:	73 15                	jae    c0105645 <__multiply+0x75>
c0105630:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105633:	90                   	nop
c0105634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105638:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010563e:	83 c0 04             	add    $0x4,%eax
c0105641:	39 c2                	cmp    %eax,%edx
c0105643:	77 f3                	ja     c0105638 <__multiply+0x68>
c0105645:	8d 46 14             	lea    0x14(%esi),%eax
c0105648:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010564b:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c010564e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105651:	8b 45 10             	mov    0x10(%ebp),%eax
c0105654:	83 c0 14             	add    $0x14,%eax
c0105657:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c010565a:	39 f8                	cmp    %edi,%eax
c010565c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010565f:	89 7d cc             	mov    %edi,-0x34(%ebp)
c0105662:	0f 83 e8 00 00 00    	jae    c0105750 <__multiply+0x180>
c0105668:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010566b:	8b 00                	mov    (%eax),%eax
c010566d:	0f b7 f8             	movzwl %ax,%edi
c0105670:	85 ff                	test   %edi,%edi
c0105672:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105675:	74 5a                	je     c01056d1 <__multiply+0x101>
c0105677:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010567a:	31 db                	xor    %ebx,%ebx
c010567c:	8b 75 d0             	mov    -0x30(%ebp),%esi
c010567f:	eb 09                	jmp    c010568a <__multiply+0xba>
c0105681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105688:	89 fa                	mov    %edi,%edx
c010568a:	8b 0e                	mov    (%esi),%ecx
c010568c:	83 c6 04             	add    $0x4,%esi
c010568f:	0f b7 3a             	movzwl (%edx),%edi
c0105692:	0f b7 c1             	movzwl %cx,%eax
c0105695:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c0105699:	c1 e9 10             	shr    $0x10,%ecx
c010569c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c01056a0:	01 f8                	add    %edi,%eax
c01056a2:	01 d8                	add    %ebx,%eax
c01056a4:	8b 1a                	mov    (%edx),%ebx
c01056a6:	8d 7a 04             	lea    0x4(%edx),%edi
c01056a9:	c1 eb 10             	shr    $0x10,%ebx
c01056ac:	01 d9                	add    %ebx,%ecx
c01056ae:	89 c3                	mov    %eax,%ebx
c01056b0:	c1 eb 10             	shr    $0x10,%ebx
c01056b3:	0f b7 c0             	movzwl %ax,%eax
c01056b6:	01 d9                	add    %ebx,%ecx
c01056b8:	89 cb                	mov    %ecx,%ebx
c01056ba:	c1 e1 10             	shl    $0x10,%ecx
c01056bd:	09 c1                	or     %eax,%ecx
c01056bf:	c1 eb 10             	shr    $0x10,%ebx
c01056c2:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c01056c5:	89 0a                	mov    %ecx,(%edx)
c01056c7:	77 bf                	ja     c0105688 <__multiply+0xb8>
c01056c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01056cc:	89 5a 04             	mov    %ebx,0x4(%edx)
c01056cf:	8b 00                	mov    (%eax),%eax
c01056d1:	c1 e8 10             	shr    $0x10,%eax
c01056d4:	85 c0                	test   %eax,%eax
c01056d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01056d9:	74 61                	je     c010573c <__multiply+0x16c>
c01056db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01056de:	31 ff                	xor    %edi,%edi
c01056e0:	89 fe                	mov    %edi,%esi
c01056e2:	8b 10                	mov    (%eax),%edx
c01056e4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01056e7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01056ea:	89 d3                	mov    %edx,%ebx
c01056ec:	eb 05                	jmp    c01056f3 <__multiply+0x123>
c01056ee:	66 90                	xchg   %ax,%ax
c01056f0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01056f3:	0f b7 08             	movzwl (%eax),%ecx
c01056f6:	c1 eb 10             	shr    $0x10,%ebx
c01056f9:	0f b7 d2             	movzwl %dx,%edx
c01056fc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105700:	83 c0 04             	add    $0x4,%eax
c0105703:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c0105706:	01 f7                	add    %esi,%edi
c0105708:	8b 75 e0             	mov    -0x20(%ebp),%esi
c010570b:	89 fb                	mov    %edi,%ebx
c010570d:	c1 e3 10             	shl    $0x10,%ebx
c0105710:	09 d3                	or     %edx,%ebx
c0105712:	89 1e                	mov    %ebx,(%esi)
c0105714:	8b 5e 04             	mov    0x4(%esi),%ebx
c0105717:	8d 4e 04             	lea    0x4(%esi),%ecx
c010571a:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c010571e:	c1 ef 10             	shr    $0x10,%edi
c0105721:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c0105725:	0f b7 f3             	movzwl %bx,%esi
c0105728:	01 f2                	add    %esi,%edx
c010572a:	01 fa                	add    %edi,%edx
c010572c:	89 d6                	mov    %edx,%esi
c010572e:	c1 ee 10             	shr    $0x10,%esi
c0105731:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0105734:	77 ba                	ja     c01056f0 <__multiply+0x120>
c0105736:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105739:	89 50 04             	mov    %edx,0x4(%eax)
c010573c:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c0105740:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105743:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0105747:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c010574a:	0f 87 18 ff ff ff    	ja     c0105668 <__multiply+0x98>
c0105750:	8b 75 c8             	mov    -0x38(%ebp),%esi
c0105753:	85 f6                	test   %esi,%esi
c0105755:	7e 29                	jle    c0105780 <__multiply+0x1b0>
c0105757:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c010575a:	8b 5f fc             	mov    -0x4(%edi),%ebx
c010575d:	85 db                	test   %ebx,%ebx
c010575f:	75 1f                	jne    c0105780 <__multiply+0x1b0>
c0105761:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105764:	89 d0                	mov    %edx,%eax
c0105766:	c1 e0 02             	shl    $0x2,%eax
c0105769:	29 c7                	sub    %eax,%edi
c010576b:	89 f8                	mov    %edi,%eax
c010576d:	eb 09                	jmp    c0105778 <__multiply+0x1a8>
c010576f:	90                   	nop
c0105770:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105774:	85 c9                	test   %ecx,%ecx
c0105776:	75 05                	jne    c010577d <__multiply+0x1ad>
c0105778:	83 ea 01             	sub    $0x1,%edx
c010577b:	75 f3                	jne    c0105770 <__multiply+0x1a0>
c010577d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105780:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105783:	8b 7d c8             	mov    -0x38(%ebp),%edi
c0105786:	89 78 10             	mov    %edi,0x10(%eax)
c0105789:	83 c4 3c             	add    $0x3c,%esp
c010578c:	5b                   	pop    %ebx
c010578d:	5e                   	pop    %esi
c010578e:	5f                   	pop    %edi
c010578f:	5d                   	pop    %ebp
c0105790:	c3                   	ret    
c0105791:	eb 0d                	jmp    c01057a0 <__pow5mult>
c0105793:	90                   	nop
c0105794:	90                   	nop
c0105795:	90                   	nop
c0105796:	90                   	nop
c0105797:	90                   	nop
c0105798:	90                   	nop
c0105799:	90                   	nop
c010579a:	90                   	nop
c010579b:	90                   	nop
c010579c:	90                   	nop
c010579d:	90                   	nop
c010579e:	90                   	nop
c010579f:	90                   	nop

c01057a0 <__pow5mult>:
c01057a0:	55                   	push   %ebp
c01057a1:	89 e5                	mov    %esp,%ebp
c01057a3:	57                   	push   %edi
c01057a4:	56                   	push   %esi
c01057a5:	53                   	push   %ebx
c01057a6:	83 ec 2c             	sub    $0x2c,%esp
c01057a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01057ac:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01057af:	8b 7d 0c             	mov    0xc(%ebp),%edi
c01057b2:	89 d8                	mov    %ebx,%eax
c01057b4:	83 e0 03             	and    $0x3,%eax
c01057b7:	0f 85 a3 00 00 00    	jne    c0105860 <__pow5mult+0xc0>
c01057bd:	c1 fb 02             	sar    $0x2,%ebx
c01057c0:	85 db                	test   %ebx,%ebx
c01057c2:	74 5c                	je     c0105820 <__pow5mult+0x80>
c01057c4:	8b 71 48             	mov    0x48(%ecx),%esi
c01057c7:	85 f6                	test   %esi,%esi
c01057c9:	0f 84 bd 00 00 00    	je     c010588c <__pow5mult+0xec>
c01057cf:	f6 c3 01             	test   $0x1,%bl
c01057d2:	75 15                	jne    c01057e9 <__pow5mult+0x49>
c01057d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01057d8:	d1 fb                	sar    %ebx
c01057da:	74 44                	je     c0105820 <__pow5mult+0x80>
c01057dc:	8b 06                	mov    (%esi),%eax
c01057de:	85 c0                	test   %eax,%eax
c01057e0:	74 4e                	je     c0105830 <__pow5mult+0x90>
c01057e2:	89 c6                	mov    %eax,%esi
c01057e4:	f6 c3 01             	test   $0x1,%bl
c01057e7:	74 ef                	je     c01057d8 <__pow5mult+0x38>
c01057e9:	89 0c 24             	mov    %ecx,(%esp)
c01057ec:	89 74 24 08          	mov    %esi,0x8(%esp)
c01057f0:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01057f4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01057f7:	e8 d4 fd ff ff       	call   c01055d0 <__multiply>
c01057fc:	85 ff                	test   %edi,%edi
c01057fe:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105801:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105804:	74 52                	je     c0105858 <__pow5mult+0xb8>
c0105806:	8b 57 04             	mov    0x4(%edi),%edx
c0105809:	d1 fb                	sar    %ebx
c010580b:	8b 41 4c             	mov    0x4c(%ecx),%eax
c010580e:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105811:	8b 10                	mov    (%eax),%edx
c0105813:	89 17                	mov    %edx,(%edi)
c0105815:	89 38                	mov    %edi,(%eax)
c0105817:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010581a:	75 c0                	jne    c01057dc <__pow5mult+0x3c>
c010581c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105820:	83 c4 2c             	add    $0x2c,%esp
c0105823:	89 f8                	mov    %edi,%eax
c0105825:	5b                   	pop    %ebx
c0105826:	5e                   	pop    %esi
c0105827:	5f                   	pop    %edi
c0105828:	5d                   	pop    %ebp
c0105829:	c3                   	ret    
c010582a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105830:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105834:	89 74 24 04          	mov    %esi,0x4(%esp)
c0105838:	89 0c 24             	mov    %ecx,(%esp)
c010583b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010583e:	e8 8d fd ff ff       	call   c01055d0 <__multiply>
c0105843:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105846:	89 06                	mov    %eax,(%esi)
c0105848:	89 c6                	mov    %eax,%esi
c010584a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105850:	eb 92                	jmp    c01057e4 <__pow5mult+0x44>
c0105852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105858:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010585b:	e9 78 ff ff ff       	jmp    c01057d8 <__pow5mult+0x38>
c0105860:	8b 04 85 3c 83 10 c0 	mov    -0x3fef7cc4(,%eax,4),%eax
c0105867:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010586b:	89 0c 24             	mov    %ecx,(%esp)
c010586e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0105875:	00 
c0105876:	89 44 24 08          	mov    %eax,0x8(%esp)
c010587a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010587d:	e8 5e fa ff ff       	call   c01052e0 <__multadd>
c0105882:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105885:	89 c7                	mov    %eax,%edi
c0105887:	e9 31 ff ff ff       	jmp    c01057bd <__pow5mult+0x1d>
c010588c:	89 0c 24             	mov    %ecx,(%esp)
c010588f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105896:	00 
c0105897:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010589a:	e8 81 f9 ff ff       	call   c0105220 <_Balloc>
c010589f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01058a2:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c01058a9:	89 c6                	mov    %eax,%esi
c01058ab:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01058b2:	89 41 48             	mov    %eax,0x48(%ecx)
c01058b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01058bb:	e9 0f ff ff ff       	jmp    c01057cf <__pow5mult+0x2f>

c01058c0 <__lshift>:
c01058c0:	55                   	push   %ebp
c01058c1:	89 e5                	mov    %esp,%ebp
c01058c3:	57                   	push   %edi
c01058c4:	56                   	push   %esi
c01058c5:	53                   	push   %ebx
c01058c6:	83 ec 2c             	sub    $0x2c,%esp
c01058c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058cc:	8b 75 10             	mov    0x10(%ebp),%esi
c01058cf:	89 c7                	mov    %eax,%edi
c01058d1:	8b 50 04             	mov    0x4(%eax),%edx
c01058d4:	8b 40 10             	mov    0x10(%eax),%eax
c01058d7:	89 f3                	mov    %esi,%ebx
c01058d9:	c1 fb 05             	sar    $0x5,%ebx
c01058dc:	01 d8                	add    %ebx,%eax
c01058de:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01058e1:	83 c0 01             	add    $0x1,%eax
c01058e4:	89 c1                	mov    %eax,%ecx
c01058e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01058e9:	8b 47 08             	mov    0x8(%edi),%eax
c01058ec:	39 c1                	cmp    %eax,%ecx
c01058ee:	7e 09                	jle    c01058f9 <__lshift+0x39>
c01058f0:	01 c0                	add    %eax,%eax
c01058f2:	83 c2 01             	add    $0x1,%edx
c01058f5:	39 c1                	cmp    %eax,%ecx
c01058f7:	7f f7                	jg     c01058f0 <__lshift+0x30>
c01058f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058fc:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105900:	89 04 24             	mov    %eax,(%esp)
c0105903:	e8 18 f9 ff ff       	call   c0105220 <_Balloc>
c0105908:	85 db                	test   %ebx,%ebx
c010590a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010590d:	8d 50 14             	lea    0x14(%eax),%edx
c0105910:	7e 17                	jle    c0105929 <__lshift+0x69>
c0105912:	31 c0                	xor    %eax,%eax
c0105914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105918:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c010591f:	83 c0 01             	add    $0x1,%eax
c0105922:	39 d8                	cmp    %ebx,%eax
c0105924:	75 f2                	jne    c0105918 <__lshift+0x58>
c0105926:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0105929:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010592c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010592f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105932:	83 c0 14             	add    $0x14,%eax
c0105935:	83 e6 1f             	and    $0x1f,%esi
c0105938:	89 75 e0             	mov    %esi,-0x20(%ebp)
c010593b:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c010593e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105941:	74 7d                	je     c01059c0 <__lshift+0x100>
c0105943:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c010594a:	29 75 dc             	sub    %esi,-0x24(%ebp)
c010594d:	31 f6                	xor    %esi,%esi
c010594f:	eb 09                	jmp    c010595a <__lshift+0x9a>
c0105951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105958:	89 fa                	mov    %edi,%edx
c010595a:	8b 18                	mov    (%eax),%ebx
c010595c:	83 c0 04             	add    $0x4,%eax
c010595f:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105963:	8d 7a 04             	lea    0x4(%edx),%edi
c0105966:	d3 e3                	shl    %cl,%ebx
c0105968:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c010596c:	09 f3                	or     %esi,%ebx
c010596e:	89 1a                	mov    %ebx,(%edx)
c0105970:	8b 70 fc             	mov    -0x4(%eax),%esi
c0105973:	d3 ee                	shr    %cl,%esi
c0105975:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105978:	77 de                	ja     c0105958 <__lshift+0x98>
c010597a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010597d:	89 72 04             	mov    %esi,0x4(%edx)
c0105980:	83 c0 02             	add    $0x2,%eax
c0105983:	85 f6                	test   %esi,%esi
c0105985:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c0105989:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010598c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010598f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0105992:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105995:	83 e8 01             	sub    $0x1,%eax
c0105998:	89 47 10             	mov    %eax,0x10(%edi)
c010599b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010599e:	8b 50 04             	mov    0x4(%eax),%edx
c01059a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01059a4:	8b 40 4c             	mov    0x4c(%eax),%eax
c01059a7:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01059aa:	8b 10                	mov    (%eax),%edx
c01059ac:	89 16                	mov    %edx,(%esi)
c01059ae:	89 30                	mov    %esi,(%eax)
c01059b0:	83 c4 2c             	add    $0x2c,%esp
c01059b3:	89 f8                	mov    %edi,%eax
c01059b5:	5b                   	pop    %ebx
c01059b6:	5e                   	pop    %esi
c01059b7:	5f                   	pop    %edi
c01059b8:	5d                   	pop    %ebp
c01059b9:	c3                   	ret    
c01059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01059c0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01059c3:	90                   	nop
c01059c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01059c8:	83 c0 04             	add    $0x4,%eax
c01059cb:	8b 48 fc             	mov    -0x4(%eax),%ecx
c01059ce:	83 c2 04             	add    $0x4,%edx
c01059d1:	39 c3                	cmp    %eax,%ebx
c01059d3:	89 4a fc             	mov    %ecx,-0x4(%edx)
c01059d6:	77 f0                	ja     c01059c8 <__lshift+0x108>
c01059d8:	eb b2                	jmp    c010598c <__lshift+0xcc>
c01059da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01059e0 <__mcmp>:
c01059e0:	55                   	push   %ebp
c01059e1:	89 e5                	mov    %esp,%ebp
c01059e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01059e6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01059e9:	53                   	push   %ebx
c01059ea:	8b 41 10             	mov    0x10(%ecx),%eax
c01059ed:	8b 5a 10             	mov    0x10(%edx),%ebx
c01059f0:	29 d8                	sub    %ebx,%eax
c01059f2:	85 c0                	test   %eax,%eax
c01059f4:	75 27                	jne    c0105a1d <__mcmp+0x3d>
c01059f6:	c1 e3 02             	shl    $0x2,%ebx
c01059f9:	83 c1 14             	add    $0x14,%ecx
c01059fc:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c01059ff:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c0105a03:	eb 07                	jmp    c0105a0c <__mcmp+0x2c>
c0105a05:	8d 76 00             	lea    0x0(%esi),%esi
c0105a08:	39 c1                	cmp    %eax,%ecx
c0105a0a:	73 14                	jae    c0105a20 <__mcmp+0x40>
c0105a0c:	83 ea 04             	sub    $0x4,%edx
c0105a0f:	83 e8 04             	sub    $0x4,%eax
c0105a12:	8b 1a                	mov    (%edx),%ebx
c0105a14:	39 18                	cmp    %ebx,(%eax)
c0105a16:	74 f0                	je     c0105a08 <__mcmp+0x28>
c0105a18:	19 c0                	sbb    %eax,%eax
c0105a1a:	83 c8 01             	or     $0x1,%eax
c0105a1d:	5b                   	pop    %ebx
c0105a1e:	5d                   	pop    %ebp
c0105a1f:	c3                   	ret    
c0105a20:	31 c0                	xor    %eax,%eax
c0105a22:	5b                   	pop    %ebx
c0105a23:	5d                   	pop    %ebp
c0105a24:	c3                   	ret    
c0105a25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105a30 <__mdiff>:
c0105a30:	55                   	push   %ebp
c0105a31:	89 e5                	mov    %esp,%ebp
c0105a33:	57                   	push   %edi
c0105a34:	56                   	push   %esi
c0105a35:	53                   	push   %ebx
c0105a36:	83 ec 2c             	sub    $0x2c,%esp
c0105a39:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105a3c:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105a3f:	89 34 24             	mov    %esi,(%esp)
c0105a42:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105a46:	e8 95 ff ff ff       	call   c01059e0 <__mcmp>
c0105a4b:	85 c0                	test   %eax,%eax
c0105a4d:	0f 84 25 01 00 00    	je     c0105b78 <__mdiff+0x148>
c0105a53:	0f 88 0f 01 00 00    	js     c0105b68 <__mdiff+0x138>
c0105a59:	31 ff                	xor    %edi,%edi
c0105a5b:	8b 46 04             	mov    0x4(%esi),%eax
c0105a5e:	83 c6 14             	add    $0x14,%esi
c0105a61:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105a65:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a68:	89 04 24             	mov    %eax,(%esp)
c0105a6b:	e8 b0 f7 ff ff       	call   c0105220 <_Balloc>
c0105a70:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0105a73:	89 c2                	mov    %eax,%edx
c0105a75:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105a78:	89 78 0c             	mov    %edi,0xc(%eax)
c0105a7b:	8b 46 fc             	mov    -0x4(%esi),%eax
c0105a7e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0105a81:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105a84:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0105a87:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a8a:	8b 43 10             	mov    0x10(%ebx),%eax
c0105a8d:	31 db                	xor    %ebx,%ebx
c0105a8f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0105a92:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105a95:	89 d0                	mov    %edx,%eax
c0105a97:	83 c0 14             	add    $0x14,%eax
c0105a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105aa0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105aa3:	83 c0 04             	add    $0x4,%eax
c0105aa6:	83 c1 04             	add    $0x4,%ecx
c0105aa9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c0105aad:	8b 3e                	mov    (%esi),%edi
c0105aaf:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0105ab2:	0f b7 d7             	movzwl %di,%edx
c0105ab5:	01 da                	add    %ebx,%edx
c0105ab7:	0f b7 de             	movzwl %si,%ebx
c0105aba:	29 da                	sub    %ebx,%edx
c0105abc:	c1 ef 10             	shr    $0x10,%edi
c0105abf:	89 d3                	mov    %edx,%ebx
c0105ac1:	c1 ee 10             	shr    $0x10,%esi
c0105ac4:	0f b7 d2             	movzwl %dx,%edx
c0105ac7:	c1 fb 10             	sar    $0x10,%ebx
c0105aca:	29 f7                	sub    %esi,%edi
c0105acc:	01 df                	add    %ebx,%edi
c0105ace:	89 fb                	mov    %edi,%ebx
c0105ad0:	c1 e7 10             	shl    $0x10,%edi
c0105ad3:	09 d7                	or     %edx,%edi
c0105ad5:	c1 fb 10             	sar    $0x10,%ebx
c0105ad8:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c0105adb:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105ade:	77 c0                	ja     c0105aa0 <__mdiff+0x70>
c0105ae0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105ae3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105ae6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ae9:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105aec:	39 f1                	cmp    %esi,%ecx
c0105aee:	76 3f                	jbe    c0105b2f <__mdiff+0xff>
c0105af0:	8b 3e                	mov    (%esi),%edi
c0105af2:	83 c6 04             	add    $0x4,%esi
c0105af5:	83 c0 04             	add    $0x4,%eax
c0105af8:	0f b7 d7             	movzwl %di,%edx
c0105afb:	01 da                	add    %ebx,%edx
c0105afd:	89 d3                	mov    %edx,%ebx
c0105aff:	0f b7 d2             	movzwl %dx,%edx
c0105b02:	c1 fb 10             	sar    $0x10,%ebx
c0105b05:	c1 ef 10             	shr    $0x10,%edi
c0105b08:	01 df                	add    %ebx,%edi
c0105b0a:	89 fb                	mov    %edi,%ebx
c0105b0c:	c1 e7 10             	shl    $0x10,%edi
c0105b0f:	09 d7                	or     %edx,%edi
c0105b11:	c1 fb 10             	sar    $0x10,%ebx
c0105b14:	39 f1                	cmp    %esi,%ecx
c0105b16:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105b19:	77 d5                	ja     c0105af0 <__mdiff+0xc0>
c0105b1b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b1e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105b21:	f7 d0                	not    %eax
c0105b23:	01 c8                	add    %ecx,%eax
c0105b25:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105b28:	c1 e8 02             	shr    $0x2,%eax
c0105b2b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c0105b2f:	85 ff                	test   %edi,%edi
c0105b31:	75 23                	jne    c0105b56 <__mdiff+0x126>
c0105b33:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b36:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c0105b3d:	29 d0                	sub    %edx,%eax
c0105b3f:	89 ca                	mov    %ecx,%edx
c0105b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105b48:	83 ea 01             	sub    $0x1,%edx
c0105b4b:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105b4f:	85 c9                	test   %ecx,%ecx
c0105b51:	74 f5                	je     c0105b48 <__mdiff+0x118>
c0105b53:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105b59:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b5c:	89 48 10             	mov    %ecx,0x10(%eax)
c0105b5f:	83 c4 2c             	add    $0x2c,%esp
c0105b62:	5b                   	pop    %ebx
c0105b63:	5e                   	pop    %esi
c0105b64:	5f                   	pop    %edi
c0105b65:	5d                   	pop    %ebp
c0105b66:	c3                   	ret    
c0105b67:	90                   	nop
c0105b68:	89 f0                	mov    %esi,%eax
c0105b6a:	bf 01 00 00 00       	mov    $0x1,%edi
c0105b6f:	89 de                	mov    %ebx,%esi
c0105b71:	89 c3                	mov    %eax,%ebx
c0105b73:	e9 e3 fe ff ff       	jmp    c0105a5b <__mdiff+0x2b>
c0105b78:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b7b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105b82:	00 
c0105b83:	89 04 24             	mov    %eax,(%esp)
c0105b86:	e8 95 f6 ff ff       	call   c0105220 <_Balloc>
c0105b8b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105b92:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0105b99:	83 c4 2c             	add    $0x2c,%esp
c0105b9c:	5b                   	pop    %ebx
c0105b9d:	5e                   	pop    %esi
c0105b9e:	5f                   	pop    %edi
c0105b9f:	5d                   	pop    %ebp
c0105ba0:	c3                   	ret    
c0105ba1:	eb 0d                	jmp    c0105bb0 <__ulp>
c0105ba3:	90                   	nop
c0105ba4:	90                   	nop
c0105ba5:	90                   	nop
c0105ba6:	90                   	nop
c0105ba7:	90                   	nop
c0105ba8:	90                   	nop
c0105ba9:	90                   	nop
c0105baa:	90                   	nop
c0105bab:	90                   	nop
c0105bac:	90                   	nop
c0105bad:	90                   	nop
c0105bae:	90                   	nop
c0105baf:	90                   	nop

c0105bb0 <__ulp>:
c0105bb0:	55                   	push   %ebp
c0105bb1:	89 e5                	mov    %esp,%ebp
c0105bb3:	83 ec 08             	sub    $0x8,%esp
c0105bb6:	dd 45 08             	fldl   0x8(%ebp)
c0105bb9:	dd 5d f8             	fstpl  -0x8(%ebp)
c0105bbc:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c0105bbf:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c0105bc5:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c0105bcb:	85 c9                	test   %ecx,%ecx
c0105bcd:	7e 11                	jle    c0105be0 <__ulp+0x30>
c0105bcf:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0105bd2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105bd9:	dd 45 f8             	fldl   -0x8(%ebp)
c0105bdc:	c9                   	leave  
c0105bdd:	c3                   	ret    
c0105bde:	66 90                	xchg   %ax,%ax
c0105be0:	f7 d9                	neg    %ecx
c0105be2:	c1 f9 14             	sar    $0x14,%ecx
c0105be5:	83 f9 13             	cmp    $0x13,%ecx
c0105be8:	7e 26                	jle    c0105c10 <__ulp+0x60>
c0105bea:	83 f9 32             	cmp    $0x32,%ecx
c0105bed:	b8 01 00 00 00       	mov    $0x1,%eax
c0105bf2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105bf9:	7f 0b                	jg     c0105c06 <__ulp+0x56>
c0105bfb:	ba 33 00 00 00       	mov    $0x33,%edx
c0105c00:	29 ca                	sub    %ecx,%edx
c0105c02:	89 d1                	mov    %edx,%ecx
c0105c04:	d3 e0                	shl    %cl,%eax
c0105c06:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c09:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c0c:	c9                   	leave  
c0105c0d:	c3                   	ret    
c0105c0e:	66 90                	xchg   %ax,%ax
c0105c10:	b8 00 00 08 00       	mov    $0x80000,%eax
c0105c15:	d3 f8                	sar    %cl,%eax
c0105c17:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c1a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105c21:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c24:	c9                   	leave  
c0105c25:	c3                   	ret    
c0105c26:	8d 76 00             	lea    0x0(%esi),%esi
c0105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105c30 <__b2d>:
c0105c30:	55                   	push   %ebp
c0105c31:	89 e5                	mov    %esp,%ebp
c0105c33:	57                   	push   %edi
c0105c34:	56                   	push   %esi
c0105c35:	53                   	push   %ebx
c0105c36:	83 ec 18             	sub    $0x18,%esp
c0105c39:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c3c:	8d 78 14             	lea    0x14(%eax),%edi
c0105c3f:	8b 40 10             	mov    0x10(%eax),%eax
c0105c42:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0105c45:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0105c48:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105c4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c4e:	89 34 24             	mov    %esi,(%esp)
c0105c51:	e8 6a f8 ff ff       	call   c01054c0 <__hi0bits>
c0105c56:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105c59:	ba 20 00 00 00       	mov    $0x20,%edx
c0105c5e:	29 c2                	sub    %eax,%edx
c0105c60:	83 f8 0a             	cmp    $0xa,%eax
c0105c63:	89 11                	mov    %edx,(%ecx)
c0105c65:	7f 41                	jg     c0105ca8 <__b2d+0x78>
c0105c67:	b9 0b 00 00 00       	mov    $0xb,%ecx
c0105c6c:	89 f2                	mov    %esi,%edx
c0105c6e:	29 c1                	sub    %eax,%ecx
c0105c70:	d3 ea                	shr    %cl,%edx
c0105c72:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0105c78:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0105c7b:	31 d2                	xor    %edx,%edx
c0105c7d:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105c80:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105c87:	73 05                	jae    c0105c8e <__b2d+0x5e>
c0105c89:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105c8c:	d3 ea                	shr    %cl,%edx
c0105c8e:	8d 48 15             	lea    0x15(%eax),%ecx
c0105c91:	d3 e6                	shl    %cl,%esi
c0105c93:	09 f2                	or     %esi,%edx
c0105c95:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105c98:	dd 45 e8             	fldl   -0x18(%ebp)
c0105c9b:	83 c4 18             	add    $0x18,%esp
c0105c9e:	5b                   	pop    %ebx
c0105c9f:	5e                   	pop    %esi
c0105ca0:	5f                   	pop    %edi
c0105ca1:	5d                   	pop    %ebp
c0105ca2:	c3                   	ret    
c0105ca3:	90                   	nop
c0105ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ca8:	31 d2                	xor    %edx,%edx
c0105caa:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105cad:	73 09                	jae    c0105cb8 <__b2d+0x88>
c0105caf:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105cb2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0105cb5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105cb8:	89 c3                	mov    %eax,%ebx
c0105cba:	83 eb 0b             	sub    $0xb,%ebx
c0105cbd:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0105cc0:	74 4e                	je     c0105d10 <__b2d+0xe0>
c0105cc2:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105cc6:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0105ccb:	29 c3                	sub    %eax,%ebx
c0105ccd:	89 d0                	mov    %edx,%eax
c0105ccf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105cd6:	d3 e6                	shl    %cl,%esi
c0105cd8:	89 d9                	mov    %ebx,%ecx
c0105cda:	d3 e8                	shr    %cl,%eax
c0105cdc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105cdf:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105ce5:	09 c6                	or     %eax,%esi
c0105ce7:	31 c0                	xor    %eax,%eax
c0105ce9:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105cec:	39 f9                	cmp    %edi,%ecx
c0105cee:	76 07                	jbe    c0105cf7 <__b2d+0xc7>
c0105cf0:	8b 41 fc             	mov    -0x4(%ecx),%eax
c0105cf3:	89 d9                	mov    %ebx,%ecx
c0105cf5:	d3 e8                	shr    %cl,%eax
c0105cf7:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105cfb:	d3 e2                	shl    %cl,%edx
c0105cfd:	09 d0                	or     %edx,%eax
c0105cff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d02:	dd 45 e8             	fldl   -0x18(%ebp)
c0105d05:	83 c4 18             	add    $0x18,%esp
c0105d08:	5b                   	pop    %ebx
c0105d09:	5e                   	pop    %esi
c0105d0a:	5f                   	pop    %edi
c0105d0b:	5d                   	pop    %ebp
c0105d0c:	c3                   	ret    
c0105d0d:	8d 76 00             	lea    0x0(%esi),%esi
c0105d10:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105d16:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105d19:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105d1c:	dd 45 e8             	fldl   -0x18(%ebp)
c0105d1f:	83 c4 18             	add    $0x18,%esp
c0105d22:	5b                   	pop    %ebx
c0105d23:	5e                   	pop    %esi
c0105d24:	5f                   	pop    %edi
c0105d25:	5d                   	pop    %ebp
c0105d26:	c3                   	ret    
c0105d27:	89 f6                	mov    %esi,%esi
c0105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105d30 <__d2b>:
c0105d30:	55                   	push   %ebp
c0105d31:	89 e5                	mov    %esp,%ebp
c0105d33:	57                   	push   %edi
c0105d34:	56                   	push   %esi
c0105d35:	53                   	push   %ebx
c0105d36:	83 ec 2c             	sub    $0x2c,%esp
c0105d39:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d3c:	dd 45 0c             	fldl   0xc(%ebp)
c0105d3f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105d46:	00 
c0105d47:	dd 5d d0             	fstpl  -0x30(%ebp)
c0105d4a:	89 04 24             	mov    %eax,(%esp)
c0105d4d:	e8 ce f4 ff ff       	call   c0105220 <_Balloc>
c0105d52:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0105d55:	89 c6                	mov    %eax,%esi
c0105d57:	89 d8                	mov    %ebx,%eax
c0105d59:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c0105d5f:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0105d64:	c1 eb 14             	shr    $0x14,%ebx
c0105d67:	85 db                	test   %ebx,%ebx
c0105d69:	74 05                	je     c0105d70 <__d2b+0x40>
c0105d6b:	0d 00 00 10 00       	or     $0x100000,%eax
c0105d70:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d73:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105d76:	85 c0                	test   %eax,%eax
c0105d78:	74 56                	je     c0105dd0 <__d2b+0xa0>
c0105d7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d7d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d80:	89 04 24             	mov    %eax,(%esp)
c0105d83:	e8 98 f7 ff ff       	call   c0105520 <__lo0bits>
c0105d88:	85 c0                	test   %eax,%eax
c0105d8a:	0f 85 90 00 00 00    	jne    c0105e20 <__d2b+0xf0>
c0105d90:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105d93:	89 56 14             	mov    %edx,0x14(%esi)
c0105d96:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105d99:	83 fa 01             	cmp    $0x1,%edx
c0105d9c:	19 ff                	sbb    %edi,%edi
c0105d9e:	83 c7 02             	add    $0x2,%edi
c0105da1:	85 db                	test   %ebx,%ebx
c0105da3:	89 56 18             	mov    %edx,0x18(%esi)
c0105da6:	89 7e 10             	mov    %edi,0x10(%esi)
c0105da9:	74 49                	je     c0105df4 <__d2b+0xc4>
c0105dab:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105dae:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0105db5:	89 11                	mov    %edx,(%ecx)
c0105db7:	ba 35 00 00 00       	mov    $0x35,%edx
c0105dbc:	29 c2                	sub    %eax,%edx
c0105dbe:	8b 45 18             	mov    0x18(%ebp),%eax
c0105dc1:	89 10                	mov    %edx,(%eax)
c0105dc3:	83 c4 2c             	add    $0x2c,%esp
c0105dc6:	89 f0                	mov    %esi,%eax
c0105dc8:	5b                   	pop    %ebx
c0105dc9:	5e                   	pop    %esi
c0105dca:	5f                   	pop    %edi
c0105dcb:	5d                   	pop    %ebp
c0105dcc:	c3                   	ret    
c0105dcd:	8d 76 00             	lea    0x0(%esi),%esi
c0105dd0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0105dd3:	bf 01 00 00 00       	mov    $0x1,%edi
c0105dd8:	89 04 24             	mov    %eax,(%esp)
c0105ddb:	e8 40 f7 ff ff       	call   c0105520 <__lo0bits>
c0105de0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105de3:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c0105dea:	89 56 14             	mov    %edx,0x14(%esi)
c0105ded:	83 c0 20             	add    $0x20,%eax
c0105df0:	85 db                	test   %ebx,%ebx
c0105df2:	75 b7                	jne    c0105dab <__d2b+0x7b>
c0105df4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105df7:	2d 32 04 00 00       	sub    $0x432,%eax
c0105dfc:	89 01                	mov    %eax,(%ecx)
c0105dfe:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c0105e02:	c1 e7 05             	shl    $0x5,%edi
c0105e05:	89 04 24             	mov    %eax,(%esp)
c0105e08:	e8 b3 f6 ff ff       	call   c01054c0 <__hi0bits>
c0105e0d:	29 c7                	sub    %eax,%edi
c0105e0f:	8b 45 18             	mov    0x18(%ebp),%eax
c0105e12:	89 38                	mov    %edi,(%eax)
c0105e14:	83 c4 2c             	add    $0x2c,%esp
c0105e17:	89 f0                	mov    %esi,%eax
c0105e19:	5b                   	pop    %ebx
c0105e1a:	5e                   	pop    %esi
c0105e1b:	5f                   	pop    %edi
c0105e1c:	5d                   	pop    %ebp
c0105e1d:	c3                   	ret    
c0105e1e:	66 90                	xchg   %ax,%ax
c0105e20:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e23:	b9 20 00 00 00       	mov    $0x20,%ecx
c0105e28:	29 c1                	sub    %eax,%ecx
c0105e2a:	89 d7                	mov    %edx,%edi
c0105e2c:	d3 e7                	shl    %cl,%edi
c0105e2e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105e31:	09 f9                	or     %edi,%ecx
c0105e33:	89 4e 14             	mov    %ecx,0x14(%esi)
c0105e36:	89 c1                	mov    %eax,%ecx
c0105e38:	d3 ea                	shr    %cl,%edx
c0105e3a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0105e3d:	e9 57 ff ff ff       	jmp    c0105d99 <__d2b+0x69>
c0105e42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105e50 <__ratio>:
c0105e50:	55                   	push   %ebp
c0105e51:	89 e5                	mov    %esp,%ebp
c0105e53:	56                   	push   %esi
c0105e54:	53                   	push   %ebx
c0105e55:	83 ec 30             	sub    $0x30,%esp
c0105e58:	8b 75 08             	mov    0x8(%ebp),%esi
c0105e5b:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0105e5e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105e61:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105e65:	89 34 24             	mov    %esi,(%esp)
c0105e68:	e8 c3 fd ff ff       	call   c0105c30 <__b2d>
c0105e6d:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0105e70:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105e74:	89 1c 24             	mov    %ebx,(%esp)
c0105e77:	dd 55 e0             	fstl   -0x20(%ebp)
c0105e7a:	dd 5d d8             	fstpl  -0x28(%ebp)
c0105e7d:	e8 ae fd ff ff       	call   c0105c30 <__b2d>
c0105e82:	8b 46 10             	mov    0x10(%esi),%eax
c0105e85:	2b 43 10             	sub    0x10(%ebx),%eax
c0105e88:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105e8b:	2b 55 f4             	sub    -0xc(%ebp),%edx
c0105e8e:	c1 e0 05             	shl    $0x5,%eax
c0105e91:	01 d0                	add    %edx,%eax
c0105e93:	dd 55 d0             	fstl   -0x30(%ebp)
c0105e96:	85 c0                	test   %eax,%eax
c0105e98:	dd 45 d8             	fldl   -0x28(%ebp)
c0105e9b:	7e 1b                	jle    c0105eb8 <__ratio+0x68>
c0105e9d:	dd d8                	fstp   %st(0)
c0105e9f:	c1 e0 14             	shl    $0x14,%eax
c0105ea2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105ea5:	dd 45 e0             	fldl   -0x20(%ebp)
c0105ea8:	83 c4 30             	add    $0x30,%esp
c0105eab:	5b                   	pop    %ebx
c0105eac:	de f1                	fdivp  %st,%st(1)
c0105eae:	5e                   	pop    %esi
c0105eaf:	5d                   	pop    %ebp
c0105eb0:	c3                   	ret    
c0105eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105eb8:	dd d9                	fstp   %st(1)
c0105eba:	c1 e0 14             	shl    $0x14,%eax
c0105ebd:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c0105ec0:	dd 45 d0             	fldl   -0x30(%ebp)
c0105ec3:	83 c4 30             	add    $0x30,%esp
c0105ec6:	5b                   	pop    %ebx
c0105ec7:	de f9                	fdivrp %st,%st(1)
c0105ec9:	5e                   	pop    %esi
c0105eca:	5d                   	pop    %ebp
c0105ecb:	c3                   	ret    
c0105ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0105ed0 <_mprec_log10>:
c0105ed0:	55                   	push   %ebp
c0105ed1:	89 e5                	mov    %esp,%ebp
c0105ed3:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ed6:	83 f8 17             	cmp    $0x17,%eax
c0105ed9:	7e 1d                	jle    c0105ef8 <_mprec_log10+0x28>
c0105edb:	d9 e8                	fld1   
c0105edd:	d9 05 f8 82 10 c0    	flds   0xc01082f8
c0105ee3:	90                   	nop
c0105ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ee8:	83 e8 01             	sub    $0x1,%eax
c0105eeb:	dc c9                	fmul   %st,%st(1)
c0105eed:	75 f9                	jne    c0105ee8 <_mprec_log10+0x18>
c0105eef:	dd d8                	fstp   %st(0)
c0105ef1:	5d                   	pop    %ebp
c0105ef2:	c3                   	ret    
c0105ef3:	90                   	nop
c0105ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ef8:	dd 04 c5 e0 83 10 c0 	fldl   -0x3fef7c20(,%eax,8)
c0105eff:	5d                   	pop    %ebp
c0105f00:	c3                   	ret    
c0105f01:	eb 0d                	jmp    c0105f10 <__copybits>
c0105f03:	90                   	nop
c0105f04:	90                   	nop
c0105f05:	90                   	nop
c0105f06:	90                   	nop
c0105f07:	90                   	nop
c0105f08:	90                   	nop
c0105f09:	90                   	nop
c0105f0a:	90                   	nop
c0105f0b:	90                   	nop
c0105f0c:	90                   	nop
c0105f0d:	90                   	nop
c0105f0e:	90                   	nop
c0105f0f:	90                   	nop

c0105f10 <__copybits>:
c0105f10:	55                   	push   %ebp
c0105f11:	89 e5                	mov    %esp,%ebp
c0105f13:	57                   	push   %edi
c0105f14:	8b 7d 10             	mov    0x10(%ebp),%edi
c0105f17:	56                   	push   %esi
c0105f18:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105f1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f1e:	53                   	push   %ebx
c0105f1f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105f22:	8d 56 ff             	lea    -0x1(%esi),%edx
c0105f25:	c1 fa 05             	sar    $0x5,%edx
c0105f28:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c0105f2c:	8d 57 14             	lea    0x14(%edi),%edx
c0105f2f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c0105f32:	39 da                	cmp    %ebx,%edx
c0105f34:	73 34                	jae    c0105f6a <__copybits+0x5a>
c0105f36:	89 c1                	mov    %eax,%ecx
c0105f38:	83 c2 04             	add    $0x4,%edx
c0105f3b:	8b 42 fc             	mov    -0x4(%edx),%eax
c0105f3e:	83 c1 04             	add    $0x4,%ecx
c0105f41:	39 d3                	cmp    %edx,%ebx
c0105f43:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0105f46:	77 f0                	ja     c0105f38 <__copybits+0x28>
c0105f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f4b:	29 fb                	sub    %edi,%ebx
c0105f4d:	8d 53 eb             	lea    -0x15(%ebx),%edx
c0105f50:	c1 ea 02             	shr    $0x2,%edx
c0105f53:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c0105f57:	39 c6                	cmp    %eax,%esi
c0105f59:	76 13                	jbe    c0105f6e <__copybits+0x5e>
c0105f5b:	90                   	nop
c0105f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f60:	83 c0 04             	add    $0x4,%eax
c0105f63:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c0105f6a:	39 c6                	cmp    %eax,%esi
c0105f6c:	77 f2                	ja     c0105f60 <__copybits+0x50>
c0105f6e:	5b                   	pop    %ebx
c0105f6f:	5e                   	pop    %esi
c0105f70:	5f                   	pop    %edi
c0105f71:	5d                   	pop    %ebp
c0105f72:	c3                   	ret    
c0105f73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105f80 <__any_on>:
c0105f80:	55                   	push   %ebp
c0105f81:	89 e5                	mov    %esp,%ebp
c0105f83:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f86:	57                   	push   %edi
c0105f87:	56                   	push   %esi
c0105f88:	53                   	push   %ebx
c0105f89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105f8c:	8d 50 14             	lea    0x14(%eax),%edx
c0105f8f:	8b 40 10             	mov    0x10(%eax),%eax
c0105f92:	c1 fb 05             	sar    $0x5,%ebx
c0105f95:	39 d8                	cmp    %ebx,%eax
c0105f97:	7d 2f                	jge    c0105fc8 <__any_on+0x48>
c0105f99:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c0105f9c:	39 da                	cmp    %ebx,%edx
c0105f9e:	73 1d                	jae    c0105fbd <__any_on+0x3d>
c0105fa0:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105fa3:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0105fa6:	85 db                	test   %ebx,%ebx
c0105fa8:	74 0f                	je     c0105fb9 <__any_on+0x39>
c0105faa:	eb 44                	jmp    c0105ff0 <__any_on+0x70>
c0105fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fb0:	83 e8 04             	sub    $0x4,%eax
c0105fb3:	8b 08                	mov    (%eax),%ecx
c0105fb5:	85 c9                	test   %ecx,%ecx
c0105fb7:	75 37                	jne    c0105ff0 <__any_on+0x70>
c0105fb9:	39 c2                	cmp    %eax,%edx
c0105fbb:	72 f3                	jb     c0105fb0 <__any_on+0x30>
c0105fbd:	31 c0                	xor    %eax,%eax
c0105fbf:	5b                   	pop    %ebx
c0105fc0:	5e                   	pop    %esi
c0105fc1:	5f                   	pop    %edi
c0105fc2:	5d                   	pop    %ebp
c0105fc3:	c3                   	ret    
c0105fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fc8:	7e 1e                	jle    c0105fe8 <__any_on+0x68>
c0105fca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105fcd:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0105fd0:	83 e1 1f             	and    $0x1f,%ecx
c0105fd3:	74 c7                	je     c0105f9c <__any_on+0x1c>
c0105fd5:	8b 3b                	mov    (%ebx),%edi
c0105fd7:	b8 01 00 00 00       	mov    $0x1,%eax
c0105fdc:	89 fe                	mov    %edi,%esi
c0105fde:	d3 ee                	shr    %cl,%esi
c0105fe0:	d3 e6                	shl    %cl,%esi
c0105fe2:	39 fe                	cmp    %edi,%esi
c0105fe4:	75 d9                	jne    c0105fbf <__any_on+0x3f>
c0105fe6:	eb b4                	jmp    c0105f9c <__any_on+0x1c>
c0105fe8:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0105feb:	eb af                	jmp    c0105f9c <__any_on+0x1c>
c0105fed:	8d 76 00             	lea    0x0(%esi),%esi
c0105ff0:	5b                   	pop    %ebx
c0105ff1:	b8 01 00 00 00       	mov    $0x1,%eax
c0105ff6:	5e                   	pop    %esi
c0105ff7:	5f                   	pop    %edi
c0105ff8:	5d                   	pop    %ebp
c0105ff9:	c3                   	ret    
c0105ffa:	66 90                	xchg   %ax,%ax
c0105ffc:	66 90                	xchg   %ax,%ax
c0105ffe:	66 90                	xchg   %ax,%ax

c0106000 <_sbrk_r>:
c0106000:	55                   	push   %ebp
c0106001:	89 e5                	mov    %esp,%ebp
c0106003:	83 ec 18             	sub    $0x18,%esp
c0106006:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106009:	c7 05 94 25 16 c0 00 	movl   $0x0,0xc0162594
c0106010:	00 00 00 
c0106013:	89 04 24             	mov    %eax,(%esp)
c0106016:	e8 25 af ff ff       	call   c0100f40 <sbrk>
c010601b:	83 f8 ff             	cmp    $0xffffffff,%eax
c010601e:	74 08                	je     c0106028 <_sbrk_r+0x28>
c0106020:	c9                   	leave  
c0106021:	c3                   	ret    
c0106022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106028:	8b 15 94 25 16 c0    	mov    0xc0162594,%edx
c010602e:	85 d2                	test   %edx,%edx
c0106030:	74 ee                	je     c0106020 <_sbrk_r+0x20>
c0106032:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106035:	89 11                	mov    %edx,(%ecx)
c0106037:	c9                   	leave  
c0106038:	c3                   	ret    
c0106039:	66 90                	xchg   %ax,%ax
c010603b:	66 90                	xchg   %ax,%ax
c010603d:	66 90                	xchg   %ax,%ax
c010603f:	90                   	nop

c0106040 <__fpclassifyd>:
c0106040:	55                   	push   %ebp
c0106041:	b8 02 00 00 00       	mov    $0x2,%eax
c0106046:	89 e5                	mov    %esp,%ebp
c0106048:	53                   	push   %ebx
c0106049:	83 ec 0c             	sub    $0xc,%esp
c010604c:	dd 45 08             	fldl   0x8(%ebp)
c010604f:	dd 5d f0             	fstpl  -0x10(%ebp)
c0106052:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106055:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0106058:	89 d3                	mov    %edx,%ebx
c010605a:	09 cb                	or     %ecx,%ebx
c010605c:	75 0a                	jne    c0106068 <__fpclassifyd+0x28>
c010605e:	83 c4 0c             	add    $0xc,%esp
c0106061:	5b                   	pop    %ebx
c0106062:	5d                   	pop    %ebp
c0106063:	c3                   	ret    
c0106064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106068:	85 d2                	test   %edx,%edx
c010606a:	0f 94 c2             	sete   %dl
c010606d:	75 08                	jne    c0106077 <__fpclassifyd+0x37>
c010606f:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c0106075:	74 e7                	je     c010605e <__fpclassifyd+0x1e>
c0106077:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c010607d:	b8 04 00 00 00       	mov    $0x4,%eax
c0106082:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c0106088:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c010608e:	76 ce                	jbe    c010605e <__fpclassifyd+0x1e>
c0106090:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c0106096:	b0 03                	mov    $0x3,%al
c0106098:	76 c4                	jbe    c010605e <__fpclassifyd+0x1e>
c010609a:	31 c0                	xor    %eax,%eax
c010609c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c01060a2:	0f 94 c0             	sete   %al
c01060a5:	21 d0                	and    %edx,%eax
c01060a7:	eb b5                	jmp    c010605e <__fpclassifyd+0x1e>
c01060a9:	66 90                	xchg   %ax,%ax
c01060ab:	66 90                	xchg   %ax,%ax
c01060ad:	66 90                	xchg   %ax,%ax
c01060af:	90                   	nop

c01060b0 <strcmp>:
c01060b0:	55                   	push   %ebp
c01060b1:	89 e5                	mov    %esp,%ebp
c01060b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01060b6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01060b9:	53                   	push   %ebx
c01060ba:	89 c1                	mov    %eax,%ecx
c01060bc:	09 d1                	or     %edx,%ecx
c01060be:	83 e1 03             	and    $0x3,%ecx
c01060c1:	75 17                	jne    c01060da <strcmp+0x2a>
c01060c3:	8b 08                	mov    (%eax),%ecx
c01060c5:	3b 0a                	cmp    (%edx),%ecx
c01060c7:	74 33                	je     c01060fc <strcmp+0x4c>
c01060c9:	eb 0f                	jmp    c01060da <strcmp+0x2a>
c01060cb:	90                   	nop
c01060cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060d0:	3a 0a                	cmp    (%edx),%cl
c01060d2:	75 0d                	jne    c01060e1 <strcmp+0x31>
c01060d4:	83 c0 01             	add    $0x1,%eax
c01060d7:	83 c2 01             	add    $0x1,%edx
c01060da:	0f b6 08             	movzbl (%eax),%ecx
c01060dd:	84 c9                	test   %cl,%cl
c01060df:	75 ef                	jne    c01060d0 <strcmp+0x20>
c01060e1:	0f b6 00             	movzbl (%eax),%eax
c01060e4:	0f b6 12             	movzbl (%edx),%edx
c01060e7:	5b                   	pop    %ebx
c01060e8:	5d                   	pop    %ebp
c01060e9:	29 d0                	sub    %edx,%eax
c01060eb:	c3                   	ret    
c01060ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060f0:	83 c0 04             	add    $0x4,%eax
c01060f3:	83 c2 04             	add    $0x4,%edx
c01060f6:	8b 08                	mov    (%eax),%ecx
c01060f8:	3b 0a                	cmp    (%edx),%ecx
c01060fa:	75 de                	jne    c01060da <strcmp+0x2a>
c01060fc:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c0106102:	f7 d1                	not    %ecx
c0106104:	21 cb                	and    %ecx,%ebx
c0106106:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c010610c:	74 e2                	je     c01060f0 <strcmp+0x40>
c010610e:	31 c0                	xor    %eax,%eax
c0106110:	5b                   	pop    %ebx
c0106111:	5d                   	pop    %ebp
c0106112:	c3                   	ret    
c0106113:	66 90                	xchg   %ax,%ax
c0106115:	66 90                	xchg   %ax,%ax
c0106117:	66 90                	xchg   %ax,%ax
c0106119:	66 90                	xchg   %ax,%ax
c010611b:	66 90                	xchg   %ax,%ax
c010611d:	66 90                	xchg   %ax,%ax
c010611f:	90                   	nop

c0106120 <strlen>:
c0106120:	55                   	push   %ebp
c0106121:	89 e5                	mov    %esp,%ebp
c0106123:	57                   	push   %edi
c0106124:	8b 55 08             	mov    0x8(%ebp),%edx
c0106127:	89 d7                	mov    %edx,%edi
c0106129:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010612f:	74 25                	je     c0106156 <L5>
c0106131:	8a 0f                	mov    (%edi),%cl
c0106133:	47                   	inc    %edi
c0106134:	84 c9                	test   %cl,%cl
c0106136:	74 56                	je     c010618e <L15>
c0106138:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010613e:	74 16                	je     c0106156 <L5>
c0106140:	8a 0f                	mov    (%edi),%cl
c0106142:	47                   	inc    %edi
c0106143:	84 c9                	test   %cl,%cl
c0106145:	74 47                	je     c010618e <L15>
c0106147:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010614d:	74 07                	je     c0106156 <L5>
c010614f:	8a 0f                	mov    (%edi),%cl
c0106151:	47                   	inc    %edi
c0106152:	84 c9                	test   %cl,%cl
c0106154:	74 38                	je     c010618e <L15>

c0106156 <L5>:
c0106156:	83 ef 04             	sub    $0x4,%edi
c0106159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0106160 <L10>:
c0106160:	83 c7 04             	add    $0x4,%edi
c0106163:	8b 0f                	mov    (%edi),%ecx
c0106165:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c010616b:	f7 d1                	not    %ecx
c010616d:	21 c8                	and    %ecx,%eax
c010616f:	a9 80 80 80 80       	test   $0x80808080,%eax
c0106174:	74 ea                	je     c0106160 <L10>
c0106176:	f7 d1                	not    %ecx
c0106178:	47                   	inc    %edi
c0106179:	84 c9                	test   %cl,%cl
c010617b:	74 11                	je     c010618e <L15>
c010617d:	47                   	inc    %edi
c010617e:	c1 e9 08             	shr    $0x8,%ecx
c0106181:	84 c9                	test   %cl,%cl
c0106183:	74 09                	je     c010618e <L15>
c0106185:	47                   	inc    %edi
c0106186:	c1 e9 08             	shr    $0x8,%ecx
c0106189:	84 c9                	test   %cl,%cl
c010618b:	74 01                	je     c010618e <L15>
c010618d:	47                   	inc    %edi

c010618e <L15>:
c010618e:	29 d7                	sub    %edx,%edi
c0106190:	8d 47 ff             	lea    -0x1(%edi),%eax
c0106193:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0106196:	5f                   	pop    %edi
c0106197:	c9                   	leave  
c0106198:	c3                   	ret    
c0106199:	66 90                	xchg   %ax,%ax
c010619b:	66 90                	xchg   %ax,%ax
c010619d:	66 90                	xchg   %ax,%ax
c010619f:	90                   	nop

c01061a0 <__ssprint_r>:
c01061a0:	55                   	push   %ebp
c01061a1:	89 e5                	mov    %esp,%ebp
c01061a3:	57                   	push   %edi
c01061a4:	56                   	push   %esi
c01061a5:	53                   	push   %ebx
c01061a6:	83 ec 2c             	sub    $0x2c,%esp
c01061a9:	8b 45 10             	mov    0x10(%ebp),%eax
c01061ac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01061af:	8b 00                	mov    (%eax),%eax
c01061b1:	89 c7                	mov    %eax,%edi
c01061b3:	8b 45 10             	mov    0x10(%ebp),%eax
c01061b6:	8b 40 08             	mov    0x8(%eax),%eax
c01061b9:	85 c0                	test   %eax,%eax
c01061bb:	0f 84 af 01 00 00    	je     c0106370 <__ssprint_r+0x1d0>
c01061c1:	31 c9                	xor    %ecx,%ecx
c01061c3:	31 d2                	xor    %edx,%edx
c01061c5:	8b 03                	mov    (%ebx),%eax
c01061c7:	89 ce                	mov    %ecx,%esi
c01061c9:	85 f6                	test   %esi,%esi
c01061cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01061ce:	0f 84 ec 00 00 00    	je     c01062c0 <__ssprint_r+0x120>
c01061d4:	8b 53 08             	mov    0x8(%ebx),%edx
c01061d7:	39 d6                	cmp    %edx,%esi
c01061d9:	0f 82 fc 00 00 00    	jb     c01062db <__ssprint_r+0x13b>
c01061df:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c01061e3:	66 f7 c1 80 04       	test   $0x480,%cx
c01061e8:	0f 84 fa 00 00 00    	je     c01062e8 <__ssprint_r+0x148>
c01061ee:	8b 53 10             	mov    0x10(%ebx),%edx
c01061f1:	29 d0                	sub    %edx,%eax
c01061f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061f6:	8b 43 14             	mov    0x14(%ebx),%eax
c01061f9:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01061fc:	8d 04 40             	lea    (%eax,%eax,2),%eax
c01061ff:	89 c2                	mov    %eax,%edx
c0106201:	c1 ea 1f             	shr    $0x1f,%edx
c0106204:	01 d0                	add    %edx,%eax
c0106206:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106209:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010620c:	d1 7d e0             	sarl   -0x20(%ebp)
c010620f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c0106213:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0106216:	0f 83 34 01 00 00    	jae    c0106350 <__ssprint_r+0x1b0>
c010621c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010621f:	80 e5 04             	and    $0x4,%ch
c0106222:	0f 84 c8 00 00 00    	je     c01062f0 <__ssprint_r+0x150>
c0106228:	89 44 24 04          	mov    %eax,0x4(%esp)
c010622c:	8b 45 08             	mov    0x8(%ebp),%eax
c010622f:	89 04 24             	mov    %eax,(%esp)
c0106232:	e8 e9 e7 ff ff       	call   c0104a20 <_malloc_r>
c0106237:	85 c0                	test   %eax,%eax
c0106239:	89 c2                	mov    %eax,%edx
c010623b:	0f 84 e1 00 00 00    	je     c0106322 <__ssprint_r+0x182>
c0106241:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106244:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0106247:	89 44 24 08          	mov    %eax,0x8(%esp)
c010624b:	8b 43 10             	mov    0x10(%ebx),%eax
c010624e:	89 14 24             	mov    %edx,(%esp)
c0106251:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106255:	e8 16 b2 ff ff       	call   c0101470 <memcpy>
c010625a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c010625e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106261:	66 25 7f fb          	and    $0xfb7f,%ax
c0106265:	0c 80                	or     $0x80,%al
c0106267:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c010626b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010626e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106271:	89 53 10             	mov    %edx,0x10(%ebx)
c0106274:	89 4b 14             	mov    %ecx,0x14(%ebx)
c0106277:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c010627a:	01 d0                	add    %edx,%eax
c010627c:	89 03                	mov    %eax,(%ebx)
c010627e:	89 f2                	mov    %esi,%edx
c0106280:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0106283:	89 f1                	mov    %esi,%ecx
c0106285:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0106289:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c010628c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c010628f:	89 04 24             	mov    %eax,(%esp)
c0106292:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0106295:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0106299:	e8 22 13 00 00       	call   c01075c0 <memmove>
c010629e:	8b 03                	mov    (%ebx),%eax
c01062a0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01062a3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01062a6:	29 53 08             	sub    %edx,0x8(%ebx)
c01062a9:	01 c8                	add    %ecx,%eax
c01062ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01062ae:	89 03                	mov    %eax,(%ebx)
c01062b0:	8b 51 08             	mov    0x8(%ecx),%edx
c01062b3:	29 f2                	sub    %esi,%edx
c01062b5:	85 d2                	test   %edx,%edx
c01062b7:	89 51 08             	mov    %edx,0x8(%ecx)
c01062ba:	0f 84 98 00 00 00    	je     c0106358 <__ssprint_r+0x1b8>
c01062c0:	8b 77 04             	mov    0x4(%edi),%esi
c01062c3:	83 c7 08             	add    $0x8,%edi
c01062c6:	8b 4f f8             	mov    -0x8(%edi),%ecx
c01062c9:	85 f6                	test   %esi,%esi
c01062cb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01062ce:	74 f0                	je     c01062c0 <__ssprint_r+0x120>
c01062d0:	8b 53 08             	mov    0x8(%ebx),%edx
c01062d3:	39 d6                	cmp    %edx,%esi
c01062d5:	0f 83 04 ff ff ff    	jae    c01061df <__ssprint_r+0x3f>
c01062db:	89 f2                	mov    %esi,%edx
c01062dd:	89 f1                	mov    %esi,%ecx
c01062df:	eb a4                	jmp    c0106285 <__ssprint_r+0xe5>
c01062e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01062e8:	89 d1                	mov    %edx,%ecx
c01062ea:	eb 99                	jmp    c0106285 <__ssprint_r+0xe5>
c01062ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01062f0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01062f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01062f7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01062fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01062fe:	89 04 24             	mov    %eax,(%esp)
c0106301:	e8 4a 13 00 00       	call   c0107650 <_realloc_r>
c0106306:	85 c0                	test   %eax,%eax
c0106308:	89 c2                	mov    %eax,%edx
c010630a:	0f 85 5b ff ff ff    	jne    c010626b <__ssprint_r+0xcb>
c0106310:	8b 43 10             	mov    0x10(%ebx),%eax
c0106313:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106317:	8b 45 08             	mov    0x8(%ebp),%eax
c010631a:	89 04 24             	mov    %eax,(%esp)
c010631d:	e8 3e 10 00 00       	call   c0107360 <_free_r>
c0106322:	8b 45 08             	mov    0x8(%ebp),%eax
c0106325:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010632b:	8b 45 10             	mov    0x10(%ebp),%eax
c010632e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106333:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010633a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106341:	83 c4 2c             	add    $0x2c,%esp
c0106344:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106349:	5b                   	pop    %ebx
c010634a:	5e                   	pop    %esi
c010634b:	5f                   	pop    %edi
c010634c:	5d                   	pop    %ebp
c010634d:	c3                   	ret    
c010634e:	66 90                	xchg   %ax,%ax
c0106350:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106353:	e9 c7 fe ff ff       	jmp    c010621f <__ssprint_r+0x7f>
c0106358:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c010635f:	83 c4 2c             	add    $0x2c,%esp
c0106362:	31 c0                	xor    %eax,%eax
c0106364:	5b                   	pop    %ebx
c0106365:	5e                   	pop    %esi
c0106366:	5f                   	pop    %edi
c0106367:	5d                   	pop    %ebp
c0106368:	c3                   	ret    
c0106369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106370:	8b 45 10             	mov    0x10(%ebp),%eax
c0106373:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010637a:	83 c4 2c             	add    $0x2c,%esp
c010637d:	31 c0                	xor    %eax,%eax
c010637f:	5b                   	pop    %ebx
c0106380:	5e                   	pop    %esi
c0106381:	5f                   	pop    %edi
c0106382:	5d                   	pop    %ebp
c0106383:	c3                   	ret    
c0106384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c010638a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c0106390 <_svfiprintf_r>:
c0106390:	55                   	push   %ebp
c0106391:	89 e5                	mov    %esp,%ebp
c0106393:	57                   	push   %edi
c0106394:	56                   	push   %esi
c0106395:	53                   	push   %ebx
c0106396:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c010639c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010639f:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c01063a3:	74 0b                	je     c01063b0 <_svfiprintf_r+0x20>
c01063a5:	8b 50 10             	mov    0x10(%eax),%edx
c01063a8:	85 d2                	test   %edx,%edx
c01063aa:	0f 84 1c 0d 00 00    	je     c01070cc <_svfiprintf_r+0xd3c>
c01063b0:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01063b3:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01063b6:	89 c6                	mov    %eax,%esi
c01063b8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01063be:	29 d8                	sub    %ebx,%eax
c01063c0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c01063c7:	00 00 00 
c01063ca:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01063d1:	00 00 00 
c01063d4:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01063db:	00 00 00 
c01063de:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c01063e5:	00 00 00 
c01063e8:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c01063ee:	8b 45 10             	mov    0x10(%ebp),%eax
c01063f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01063f4:	0f b6 00             	movzbl (%eax),%eax
c01063f7:	84 c0                	test   %al,%al
c01063f9:	74 58                	je     c0106453 <_svfiprintf_r+0xc3>
c01063fb:	3c 25                	cmp    $0x25,%al
c01063fd:	75 13                	jne    c0106412 <_svfiprintf_r+0x82>
c01063ff:	eb 52                	jmp    c0106453 <_svfiprintf_r+0xc3>
c0106401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106408:	84 c0                	test   %al,%al
c010640a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106410:	74 0a                	je     c010641c <_svfiprintf_r+0x8c>
c0106412:	83 c3 01             	add    $0x1,%ebx
c0106415:	0f b6 03             	movzbl (%ebx),%eax
c0106418:	3c 25                	cmp    $0x25,%al
c010641a:	75 ec                	jne    c0106408 <_svfiprintf_r+0x78>
c010641c:	89 df                	mov    %ebx,%edi
c010641e:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106421:	74 30                	je     c0106453 <_svfiprintf_r+0xc3>
c0106423:	8b 45 10             	mov    0x10(%ebp),%eax
c0106426:	83 c6 08             	add    $0x8,%esi
c0106429:	89 7e fc             	mov    %edi,-0x4(%esi)
c010642c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106432:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106435:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010643b:	83 c0 01             	add    $0x1,%eax
c010643e:	83 f8 07             	cmp    $0x7,%eax
c0106441:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106447:	0f 8f eb 0a 00 00    	jg     c0106f38 <_svfiprintf_r+0xba8>
c010644d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106453:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106456:	0f 84 11 09 00 00    	je     c0106d6d <_svfiprintf_r+0x9dd>
c010645c:	8d 43 01             	lea    0x1(%ebx),%eax
c010645f:	31 ff                	xor    %edi,%edi
c0106461:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106468:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c010646f:	ff ff ff 
c0106472:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0106479:	00 00 00 
c010647c:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c0106483:	00 00 00 
c0106486:	8d 50 01             	lea    0x1(%eax),%edx
c0106489:	0f be 00             	movsbl (%eax),%eax
c010648c:	8d 48 e0             	lea    -0x20(%eax),%ecx
c010648f:	83 f9 58             	cmp    $0x58,%ecx
c0106492:	0f 87 63 03 00 00    	ja     c01067fb <_svfiprintf_r+0x46b>
c0106498:	ff 24 8d a8 84 10 c0 	jmp    *-0x3fef7b58(,%ecx,4)
c010649f:	90                   	nop
c01064a0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c01064a7:	89 d0                	mov    %edx,%eax
c01064a9:	eb db                	jmp    c0106486 <_svfiprintf_r+0xf6>
c01064ab:	8b 45 14             	mov    0x14(%ebp),%eax
c01064ae:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01064b1:	8b 00                	mov    (%eax),%eax
c01064b3:	83 c3 04             	add    $0x4,%ebx
c01064b6:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01064b9:	85 c0                	test   %eax,%eax
c01064bb:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c01064c1:	79 e4                	jns    c01064a7 <_svfiprintf_r+0x117>
c01064c3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c01064c9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c01064d0:	89 d0                	mov    %edx,%eax
c01064d2:	eb b2                	jmp    c0106486 <_svfiprintf_r+0xf6>
c01064d4:	bf 2b 00 00 00       	mov    $0x2b,%edi
c01064d9:	89 d0                	mov    %edx,%eax
c01064db:	eb a9                	jmp    c0106486 <_svfiprintf_r+0xf6>
c01064dd:	8b 45 14             	mov    0x14(%ebp),%eax
c01064e0:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c01064e7:	89 55 10             	mov    %edx,0x10(%ebp)
c01064ea:	ba 02 00 00 00       	mov    $0x2,%edx
c01064ef:	8b 08                	mov    (%eax),%ecx
c01064f1:	83 c0 04             	add    $0x4,%eax
c01064f4:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c01064fb:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c0106502:	89 45 14             	mov    %eax,0x14(%ebp)
c0106505:	c7 85 44 ff ff ff 3f 	movl   $0xc010813f,-0xbc(%ebp)
c010650c:	81 10 c0 
c010650f:	90                   	nop
c0106510:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106517:	31 ff                	xor    %edi,%edi
c0106519:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c010651f:	89 d8                	mov    %ebx,%eax
c0106521:	24 7f                	and    $0x7f,%al
c0106523:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c010652a:	0f 48 c3             	cmovs  %ebx,%eax
c010652d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106533:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106539:	85 c0                	test   %eax,%eax
c010653b:	75 08                	jne    c0106545 <_svfiprintf_r+0x1b5>
c010653d:	85 c9                	test   %ecx,%ecx
c010653f:	0f 84 03 08 00 00    	je     c0106d48 <_svfiprintf_r+0x9b8>
c0106545:	80 fa 01             	cmp    $0x1,%dl
c0106548:	0f 84 8a 0a 00 00    	je     c0106fd8 <_svfiprintf_r+0xc48>
c010654e:	80 fa 02             	cmp    $0x2,%dl
c0106551:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106554:	0f 85 86 01 00 00    	jne    c01066e0 <_svfiprintf_r+0x350>
c010655a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106560:	89 c8                	mov    %ecx,%eax
c0106562:	83 eb 01             	sub    $0x1,%ebx
c0106565:	83 e0 0f             	and    $0xf,%eax
c0106568:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c010656c:	c1 e9 04             	shr    $0x4,%ecx
c010656f:	85 c9                	test   %ecx,%ecx
c0106571:	88 03                	mov    %al,(%ebx)
c0106573:	75 eb                	jne    c0106560 <_svfiprintf_r+0x1d0>
c0106575:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106578:	29 d8                	sub    %ebx,%eax
c010657a:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106580:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106586:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c010658c:	39 c1                	cmp    %eax,%ecx
c010658e:	0f 4d c1             	cmovge %ecx,%eax
c0106591:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106597:	89 f8                	mov    %edi,%eax
c0106599:	3c 01                	cmp    $0x1,%al
c010659b:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c01065a2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01065a8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c01065ae:	89 d0                	mov    %edx,%eax
c01065b0:	89 cf                	mov    %ecx,%edi
c01065b2:	83 c0 02             	add    $0x2,%eax
c01065b5:	83 e7 02             	and    $0x2,%edi
c01065b8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c01065be:	89 cf                	mov    %ecx,%edi
c01065c0:	0f 44 c2             	cmove  %edx,%eax
c01065c3:	81 e7 84 00 00 00    	and    $0x84,%edi
c01065c9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01065cf:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c01065d5:	0f 85 cd 04 00 00    	jne    c0106aa8 <_svfiprintf_r+0x718>
c01065db:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c01065e1:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c01065e7:	85 ff                	test   %edi,%edi
c01065e9:	0f 8e b9 04 00 00    	jle    c0106aa8 <_svfiprintf_r+0x718>
c01065ef:	83 ff 10             	cmp    $0x10,%edi
c01065f2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01065f8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01065fe:	7e 7c                	jle    c010667c <_svfiprintf_r+0x2ec>
c0106600:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c0106606:	89 f1                	mov    %esi,%ecx
c0106608:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010660b:	8b 75 0c             	mov    0xc(%ebp),%esi
c010660e:	eb 08                	jmp    c0106618 <_svfiprintf_r+0x288>
c0106610:	83 ef 10             	sub    $0x10,%edi
c0106613:	83 ff 10             	cmp    $0x10,%edi
c0106616:	7e 5c                	jle    c0106674 <_svfiprintf_r+0x2e4>
c0106618:	83 c0 01             	add    $0x1,%eax
c010661b:	83 c2 10             	add    $0x10,%edx
c010661e:	c7 01 1c 86 10 c0    	movl   $0xc010861c,(%ecx)
c0106624:	83 c1 08             	add    $0x8,%ecx
c0106627:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010662e:	83 f8 07             	cmp    $0x7,%eax
c0106631:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106637:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010663d:	7e d1                	jle    c0106610 <_svfiprintf_r+0x280>
c010663f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106645:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106649:	89 74 24 04          	mov    %esi,0x4(%esp)
c010664d:	89 1c 24             	mov    %ebx,(%esp)
c0106650:	e8 4b fb ff ff       	call   c01061a0 <__ssprint_r>
c0106655:	85 c0                	test   %eax,%eax
c0106657:	0f 85 3b 07 00 00    	jne    c0106d98 <_svfiprintf_r+0xa08>
c010665d:	83 ef 10             	sub    $0x10,%edi
c0106660:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106666:	83 ff 10             	cmp    $0x10,%edi
c0106669:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010666f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106672:	7f a4                	jg     c0106618 <_svfiprintf_r+0x288>
c0106674:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c010667a:	89 ce                	mov    %ecx,%esi
c010667c:	83 c0 01             	add    $0x1,%eax
c010667f:	01 fa                	add    %edi,%edx
c0106681:	c7 06 1c 86 10 c0    	movl   $0xc010861c,(%esi)
c0106687:	83 c6 08             	add    $0x8,%esi
c010668a:	89 7e fc             	mov    %edi,-0x4(%esi)
c010668d:	83 f8 07             	cmp    $0x7,%eax
c0106690:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106696:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010669c:	0f 8e 12 04 00 00    	jle    c0106ab4 <_svfiprintf_r+0x724>
c01066a2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01066a8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01066ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01066af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01066b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01066b6:	89 04 24             	mov    %eax,(%esp)
c01066b9:	e8 e2 fa ff ff       	call   c01061a0 <__ssprint_r>
c01066be:	85 c0                	test   %eax,%eax
c01066c0:	0f 85 d2 06 00 00    	jne    c0106d98 <_svfiprintf_r+0xa08>
c01066c6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01066cc:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01066cf:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01066d5:	e9 da 03 00 00       	jmp    c0106ab4 <_svfiprintf_r+0x724>
c01066da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01066e0:	89 c8                	mov    %ecx,%eax
c01066e2:	83 eb 01             	sub    $0x1,%ebx
c01066e5:	83 e0 07             	and    $0x7,%eax
c01066e8:	c1 e9 03             	shr    $0x3,%ecx
c01066eb:	83 c0 30             	add    $0x30,%eax
c01066ee:	85 c9                	test   %ecx,%ecx
c01066f0:	88 03                	mov    %al,(%ebx)
c01066f2:	75 ec                	jne    c01066e0 <_svfiprintf_r+0x350>
c01066f4:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c01066fb:	89 da                	mov    %ebx,%edx
c01066fd:	0f 84 72 fe ff ff    	je     c0106575 <_svfiprintf_r+0x1e5>
c0106703:	3c 30                	cmp    $0x30,%al
c0106705:	0f 84 6a fe ff ff    	je     c0106575 <_svfiprintf_r+0x1e5>
c010670b:	83 eb 01             	sub    $0x1,%ebx
c010670e:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106711:	29 d8                	sub    %ebx,%eax
c0106713:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0106717:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010671d:	e9 5e fe ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c0106722:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106729:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106730:	89 55 10             	mov    %edx,0x10(%ebp)
c0106733:	8b 45 14             	mov    0x14(%ebp),%eax
c0106736:	0f 85 48 01 00 00    	jne    c0106884 <_svfiprintf_r+0x4f4>
c010673c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106743:	0f 84 3b 01 00 00    	je     c0106884 <_svfiprintf_r+0x4f4>
c0106749:	0f b7 08             	movzwl (%eax),%ecx
c010674c:	83 c0 04             	add    $0x4,%eax
c010674f:	31 d2                	xor    %edx,%edx
c0106751:	89 45 14             	mov    %eax,0x14(%ebp)
c0106754:	e9 b7 fd ff ff       	jmp    c0106510 <_svfiprintf_r+0x180>
c0106759:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106760:	89 f8                	mov    %edi,%eax
c0106762:	89 55 10             	mov    %edx,0x10(%ebp)
c0106765:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c010676b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106772:	8b 45 14             	mov    0x14(%ebp),%eax
c0106775:	75 0d                	jne    c0106784 <_svfiprintf_r+0x3f4>
c0106777:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c010677e:	0f 85 f2 08 00 00    	jne    c0107076 <_svfiprintf_r+0xce6>
c0106784:	8b 08                	mov    (%eax),%ecx
c0106786:	83 c0 04             	add    $0x4,%eax
c0106789:	89 45 14             	mov    %eax,0x14(%ebp)
c010678c:	85 c9                	test   %ecx,%ecx
c010678e:	0f 88 f3 08 00 00    	js     c0107087 <_svfiprintf_r+0xcf7>
c0106794:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010679b:	ba 01 00 00 00       	mov    $0x1,%edx
c01067a0:	e9 74 fd ff ff       	jmp    c0106519 <_svfiprintf_r+0x189>
c01067a5:	0f be 02             	movsbl (%edx),%eax
c01067a8:	8d 5a 01             	lea    0x1(%edx),%ebx
c01067ab:	83 f8 2a             	cmp    $0x2a,%eax
c01067ae:	0f 84 af 09 00 00    	je     c0107163 <_svfiprintf_r+0xdd3>
c01067b4:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01067b7:	31 d2                	xor    %edx,%edx
c01067b9:	83 f9 09             	cmp    $0x9,%ecx
c01067bc:	0f 87 90 09 00 00    	ja     c0107152 <_svfiprintf_r+0xdc2>
c01067c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01067c8:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01067cb:	83 c3 01             	add    $0x1,%ebx
c01067ce:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c01067d1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c01067d5:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01067d8:	83 f9 09             	cmp    $0x9,%ecx
c01067db:	76 eb                	jbe    c01067c8 <_svfiprintf_r+0x438>
c01067dd:	85 d2                	test   %edx,%edx
c01067df:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c01067e4:	0f 48 d1             	cmovs  %ecx,%edx
c01067e7:	8d 48 e0             	lea    -0x20(%eax),%ecx
c01067ea:	83 f9 58             	cmp    $0x58,%ecx
c01067ed:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c01067f3:	89 da                	mov    %ebx,%edx
c01067f5:	0f 86 9d fc ff ff    	jbe    c0106498 <_svfiprintf_r+0x108>
c01067fb:	89 fb                	mov    %edi,%ebx
c01067fd:	85 c0                	test   %eax,%eax
c01067ff:	89 55 10             	mov    %edx,0x10(%ebp)
c0106802:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106808:	0f 84 5f 05 00 00    	je     c0106d6d <_svfiprintf_r+0x9dd>
c010680e:	88 45 80             	mov    %al,-0x80(%ebp)
c0106811:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106814:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010681b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106822:	00 00 00 
c0106825:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010682c:	00 00 00 
c010682f:	e9 5a 01 00 00       	jmp    c010698e <_svfiprintf_r+0x5fe>
c0106834:	31 db                	xor    %ebx,%ebx
c0106836:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106840:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106843:	83 c2 01             	add    $0x1,%edx
c0106846:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106849:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c010684d:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106850:	83 f9 09             	cmp    $0x9,%ecx
c0106853:	76 eb                	jbe    c0106840 <_svfiprintf_r+0x4b0>
c0106855:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c010685b:	e9 2c fc ff ff       	jmp    c010648c <_svfiprintf_r+0xfc>
c0106860:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106867:	00 00 00 
c010686a:	89 d0                	mov    %edx,%eax
c010686c:	e9 15 fc ff ff       	jmp    c0106486 <_svfiprintf_r+0xf6>
c0106871:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106878:	89 55 10             	mov    %edx,0x10(%ebp)
c010687b:	8b 45 14             	mov    0x14(%ebp),%eax
c010687e:	0f 84 b8 fe ff ff    	je     c010673c <_svfiprintf_r+0x3ac>
c0106884:	8b 08                	mov    (%eax),%ecx
c0106886:	83 c0 04             	add    $0x4,%eax
c0106889:	31 d2                	xor    %edx,%edx
c010688b:	89 45 14             	mov    %eax,0x14(%ebp)
c010688e:	e9 7d fc ff ff       	jmp    c0106510 <_svfiprintf_r+0x180>
c0106893:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c010689a:	89 f8                	mov    %edi,%eax
c010689c:	89 55 10             	mov    %edx,0x10(%ebp)
c010689f:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c01068a5:	0f 85 a2 07 00 00    	jne    c010704d <_svfiprintf_r+0xcbd>
c01068ab:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01068b2:	0f 84 95 07 00 00    	je     c010704d <_svfiprintf_r+0xcbd>
c01068b8:	8b 45 14             	mov    0x14(%ebp),%eax
c01068bb:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c01068c2:	8b 00                	mov    (%eax),%eax
c01068c4:	66 89 18             	mov    %bx,(%eax)
c01068c7:	8b 45 14             	mov    0x14(%ebp),%eax
c01068ca:	83 c0 04             	add    $0x4,%eax
c01068cd:	89 45 14             	mov    %eax,0x14(%ebp)
c01068d0:	e9 19 fb ff ff       	jmp    c01063ee <_svfiprintf_r+0x5e>
c01068d5:	89 fb                	mov    %edi,%ebx
c01068d7:	89 55 10             	mov    %edx,0x10(%ebp)
c01068da:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c01068e0:	c7 85 44 ff ff ff 3f 	movl   $0xc010813f,-0xbc(%ebp)
c01068e7:	81 10 c0 
c01068ea:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01068f1:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01068f4:	75 0d                	jne    c0106903 <_svfiprintf_r+0x573>
c01068f6:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01068fd:	0f 85 65 07 00 00    	jne    c0107068 <_svfiprintf_r+0xcd8>
c0106903:	8b 0b                	mov    (%ebx),%ecx
c0106905:	83 c3 04             	add    $0x4,%ebx
c0106908:	89 5d 14             	mov    %ebx,0x14(%ebp)
c010690b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106912:	ba 02 00 00 00       	mov    $0x2,%edx
c0106917:	0f 84 f3 fb ff ff    	je     c0106510 <_svfiprintf_r+0x180>
c010691d:	85 c9                	test   %ecx,%ecx
c010691f:	0f 84 eb fb ff ff    	je     c0106510 <_svfiprintf_r+0x180>
c0106925:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010692c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c0106932:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106939:	e9 d2 fb ff ff       	jmp    c0106510 <_svfiprintf_r+0x180>
c010693e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c0106945:	89 d0                	mov    %edx,%eax
c0106947:	e9 3a fb ff ff       	jmp    c0106486 <_svfiprintf_r+0xf6>
c010694c:	89 f8                	mov    %edi,%eax
c010694e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106951:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106957:	e9 0f fe ff ff       	jmp    c010676b <_svfiprintf_r+0x3db>
c010695c:	8b 45 14             	mov    0x14(%ebp),%eax
c010695f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106962:	89 55 10             	mov    %edx,0x10(%ebp)
c0106965:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010696c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106973:	00 00 00 
c0106976:	8b 00                	mov    (%eax),%eax
c0106978:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010697f:	00 00 00 
c0106982:	88 45 80             	mov    %al,-0x80(%ebp)
c0106985:	8b 45 14             	mov    0x14(%ebp),%eax
c0106988:	83 c0 04             	add    $0x4,%eax
c010698b:	89 45 14             	mov    %eax,0x14(%ebp)
c010698e:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106995:	00 00 00 
c0106998:	e9 05 fc ff ff       	jmp    c01065a2 <_svfiprintf_r+0x212>
c010699d:	89 fb                	mov    %edi,%ebx
c010699f:	89 55 10             	mov    %edx,0x10(%ebp)
c01069a2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c01069a8:	c7 85 44 ff ff ff 2e 	movl   $0xc010812e,-0xbc(%ebp)
c01069af:	81 10 c0 
c01069b2:	e9 33 ff ff ff       	jmp    c01068ea <_svfiprintf_r+0x55a>
c01069b7:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c01069be:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069c5:	89 55 10             	mov    %edx,0x10(%ebp)
c01069c8:	8b 45 14             	mov    0x14(%ebp),%eax
c01069cb:	75 39                	jne    c0106a06 <_svfiprintf_r+0x676>
c01069cd:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01069d4:	74 30                	je     c0106a06 <_svfiprintf_r+0x676>
c01069d6:	0f b7 08             	movzwl (%eax),%ecx
c01069d9:	83 c0 04             	add    $0x4,%eax
c01069dc:	ba 01 00 00 00       	mov    $0x1,%edx
c01069e1:	89 45 14             	mov    %eax,0x14(%ebp)
c01069e4:	e9 27 fb ff ff       	jmp    c0106510 <_svfiprintf_r+0x180>
c01069e9:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c01069f0:	89 d0                	mov    %edx,%eax
c01069f2:	e9 8f fa ff ff       	jmp    c0106486 <_svfiprintf_r+0xf6>
c01069f7:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069fe:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a01:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a04:	74 c7                	je     c01069cd <_svfiprintf_r+0x63d>
c0106a06:	8b 08                	mov    (%eax),%ecx
c0106a08:	83 c0 04             	add    $0x4,%eax
c0106a0b:	ba 01 00 00 00       	mov    $0x1,%edx
c0106a10:	89 45 14             	mov    %eax,0x14(%ebp)
c0106a13:	e9 f8 fa ff ff       	jmp    c0106510 <_svfiprintf_r+0x180>
c0106a18:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a1b:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a1e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106a25:	8b 18                	mov    (%eax),%ebx
c0106a27:	8d 50 04             	lea    0x4(%eax),%edx
c0106a2a:	85 db                	test   %ebx,%ebx
c0106a2c:	0f 84 cc 06 00 00    	je     c01070fe <_svfiprintf_r+0xd6e>
c0106a32:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106a38:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c0106a3e:	85 ff                	test   %edi,%edi
c0106a40:	0f 88 59 06 00 00    	js     c010709f <_svfiprintf_r+0xd0f>
c0106a46:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0106a4a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106a51:	00 
c0106a52:	89 1c 24             	mov    %ebx,(%esp)
c0106a55:	e8 06 e7 ff ff       	call   c0105160 <memchr>
c0106a5a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106a60:	85 c0                	test   %eax,%eax
c0106a62:	0f 84 c5 06 00 00    	je     c010712d <_svfiprintf_r+0xd9d>
c0106a68:	29 d8                	sub    %ebx,%eax
c0106a6a:	39 f8                	cmp    %edi,%eax
c0106a6c:	0f 4f c7             	cmovg  %edi,%eax
c0106a6f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106a76:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106a7c:	89 55 14             	mov    %edx,0x14(%ebp)
c0106a7f:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106a86:	00 00 00 
c0106a89:	e9 f2 fa ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c0106a8e:	89 f8                	mov    %edi,%eax
c0106a90:	84 c0                	test   %al,%al
c0106a92:	b8 20 00 00 00       	mov    $0x20,%eax
c0106a97:	0f 44 f8             	cmove  %eax,%edi
c0106a9a:	89 d0                	mov    %edx,%eax
c0106a9c:	e9 e5 f9 ff ff       	jmp    c0106486 <_svfiprintf_r+0xf6>
c0106aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106aa8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106aae:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ab4:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c0106abb:	74 2e                	je     c0106aeb <_svfiprintf_r+0x75b>
c0106abd:	83 c0 01             	add    $0x1,%eax
c0106ac0:	83 c2 01             	add    $0x1,%edx
c0106ac3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0106ac9:	83 c6 08             	add    $0x8,%esi
c0106acc:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106acf:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0106ad6:	83 f8 07             	cmp    $0x7,%eax
c0106ad9:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106adf:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106ae5:	0f 8f b5 04 00 00    	jg     c0106fa0 <_svfiprintf_r+0xc10>
c0106aeb:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0106af1:	85 c9                	test   %ecx,%ecx
c0106af3:	74 2e                	je     c0106b23 <_svfiprintf_r+0x793>
c0106af5:	83 c0 01             	add    $0x1,%eax
c0106af8:	83 c2 02             	add    $0x2,%edx
c0106afb:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0106b01:	83 c6 08             	add    $0x8,%esi
c0106b04:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106b07:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c0106b0e:	83 f8 07             	cmp    $0x7,%eax
c0106b11:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106b17:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106b1d:	0f 8f 45 04 00 00    	jg     c0106f68 <_svfiprintf_r+0xbd8>
c0106b23:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c0106b2a:	00 00 00 
c0106b2d:	0f 84 9d 02 00 00    	je     c0106dd0 <_svfiprintf_r+0xa40>
c0106b33:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106b39:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c0106b3f:	85 ff                	test   %edi,%edi
c0106b41:	0f 8e e1 00 00 00    	jle    c0106c28 <_svfiprintf_r+0x898>
c0106b47:	83 ff 10             	cmp    $0x10,%edi
c0106b4a:	0f 8e 7c 00 00 00    	jle    c0106bcc <_svfiprintf_r+0x83c>
c0106b50:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c0106b56:	89 f1                	mov    %esi,%ecx
c0106b58:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106b5b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106b5e:	eb 08                	jmp    c0106b68 <_svfiprintf_r+0x7d8>
c0106b60:	83 ef 10             	sub    $0x10,%edi
c0106b63:	83 ff 10             	cmp    $0x10,%edi
c0106b66:	7e 5c                	jle    c0106bc4 <_svfiprintf_r+0x834>
c0106b68:	83 c0 01             	add    $0x1,%eax
c0106b6b:	83 c2 10             	add    $0x10,%edx
c0106b6e:	c7 01 0c 86 10 c0    	movl   $0xc010860c,(%ecx)
c0106b74:	83 c1 08             	add    $0x8,%ecx
c0106b77:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106b7e:	83 f8 07             	cmp    $0x7,%eax
c0106b81:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106b87:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106b8d:	7e d1                	jle    c0106b60 <_svfiprintf_r+0x7d0>
c0106b8f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106b95:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106b99:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106b9d:	89 1c 24             	mov    %ebx,(%esp)
c0106ba0:	e8 fb f5 ff ff       	call   c01061a0 <__ssprint_r>
c0106ba5:	85 c0                	test   %eax,%eax
c0106ba7:	0f 85 eb 01 00 00    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106bad:	83 ef 10             	sub    $0x10,%edi
c0106bb0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106bb6:	83 ff 10             	cmp    $0x10,%edi
c0106bb9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106bbf:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106bc2:	7f a4                	jg     c0106b68 <_svfiprintf_r+0x7d8>
c0106bc4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0106bca:	89 ce                	mov    %ecx,%esi
c0106bcc:	83 c0 01             	add    $0x1,%eax
c0106bcf:	01 fa                	add    %edi,%edx
c0106bd1:	c7 06 0c 86 10 c0    	movl   $0xc010860c,(%esi)
c0106bd7:	83 c6 08             	add    $0x8,%esi
c0106bda:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106bdd:	83 f8 07             	cmp    $0x7,%eax
c0106be0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106be6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106bec:	7e 3a                	jle    c0106c28 <_svfiprintf_r+0x898>
c0106bee:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106bf4:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106bf8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106bfb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0106c02:	89 04 24             	mov    %eax,(%esp)
c0106c05:	e8 96 f5 ff ff       	call   c01061a0 <__ssprint_r>
c0106c0a:	85 c0                	test   %eax,%eax
c0106c0c:	0f 85 86 01 00 00    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106c12:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106c18:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106c1b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106c28:	89 1e                	mov    %ebx,(%esi)
c0106c2a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c0106c30:	83 c0 01             	add    $0x1,%eax
c0106c33:	83 c6 08             	add    $0x8,%esi
c0106c36:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c3c:	89 5e fc             	mov    %ebx,-0x4(%esi)
c0106c3f:	01 da                	add    %ebx,%edx
c0106c41:	83 f8 07             	cmp    $0x7,%eax
c0106c44:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c4a:	0f 8f 80 02 00 00    	jg     c0106ed0 <_svfiprintf_r+0xb40>
c0106c50:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c0106c57:	0f 84 b9 00 00 00    	je     c0106d16 <_svfiprintf_r+0x986>
c0106c5d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106c63:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106c69:	85 ff                	test   %edi,%edi
c0106c6b:	0f 8e a5 00 00 00    	jle    c0106d16 <_svfiprintf_r+0x986>
c0106c71:	83 ff 10             	cmp    $0x10,%edi
c0106c74:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c7a:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0106c80:	7e 71                	jle    c0106cf3 <_svfiprintf_r+0x963>
c0106c82:	89 f1                	mov    %esi,%ecx
c0106c84:	8b 75 08             	mov    0x8(%ebp),%esi
c0106c87:	eb 0f                	jmp    c0106c98 <_svfiprintf_r+0x908>
c0106c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106c90:	83 ef 10             	sub    $0x10,%edi
c0106c93:	83 ff 10             	cmp    $0x10,%edi
c0106c96:	7e 59                	jle    c0106cf1 <_svfiprintf_r+0x961>
c0106c98:	83 c0 01             	add    $0x1,%eax
c0106c9b:	83 c2 10             	add    $0x10,%edx
c0106c9e:	c7 01 1c 86 10 c0    	movl   $0xc010861c,(%ecx)
c0106ca4:	83 c1 08             	add    $0x8,%ecx
c0106ca7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106cae:	83 f8 07             	cmp    $0x7,%eax
c0106cb1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106cb7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106cbd:	7e d1                	jle    c0106c90 <_svfiprintf_r+0x900>
c0106cbf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106cc2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0106cc6:	89 34 24             	mov    %esi,(%esp)
c0106cc9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ccd:	e8 ce f4 ff ff       	call   c01061a0 <__ssprint_r>
c0106cd2:	85 c0                	test   %eax,%eax
c0106cd4:	0f 85 be 00 00 00    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106cda:	83 ef 10             	sub    $0x10,%edi
c0106cdd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106ce3:	83 ff 10             	cmp    $0x10,%edi
c0106ce6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106cec:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106cef:	7f a7                	jg     c0106c98 <_svfiprintf_r+0x908>
c0106cf1:	89 ce                	mov    %ecx,%esi
c0106cf3:	83 c0 01             	add    $0x1,%eax
c0106cf6:	01 fa                	add    %edi,%edx
c0106cf8:	83 f8 07             	cmp    $0x7,%eax
c0106cfb:	c7 06 1c 86 10 c0    	movl   $0xc010861c,(%esi)
c0106d01:	89 7e 04             	mov    %edi,0x4(%esi)
c0106d04:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106d0a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106d10:	0f 8f ee 02 00 00    	jg     c0107004 <_svfiprintf_r+0xc74>
c0106d16:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c0106d1c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0106d22:	39 c6                	cmp    %eax,%esi
c0106d24:	0f 4d c6             	cmovge %esi,%eax
c0106d27:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c0106d2d:	85 d2                	test   %edx,%edx
c0106d2f:	0f 85 d3 01 00 00    	jne    c0106f08 <_svfiprintf_r+0xb78>
c0106d35:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106d3c:	00 00 00 
c0106d3f:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106d42:	e9 a7 f6 ff ff       	jmp    c01063ee <_svfiprintf_r+0x5e>
c0106d47:	90                   	nop
c0106d48:	84 d2                	test   %dl,%dl
c0106d4a:	75 6c                	jne    c0106db8 <_svfiprintf_r+0xa28>
c0106d4c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106d53:	74 63                	je     c0106db8 <_svfiprintf_r+0xa28>
c0106d55:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0106d5b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106d5e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0106d62:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106d68:	e9 13 f8 ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c0106d6d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0106d73:	85 c0                	test   %eax,%eax
c0106d75:	74 21                	je     c0106d98 <_svfiprintf_r+0xa08>
c0106d77:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106d7d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106d81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106d84:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106d88:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d8b:	89 04 24             	mov    %eax,(%esp)
c0106d8e:	e8 0d f4 ff ff       	call   c01061a0 <__ssprint_r>
c0106d93:	90                   	nop
c0106d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106d98:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106d9b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106da0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c0106da4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c0106dab:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0106db1:	5b                   	pop    %ebx
c0106db2:	5e                   	pop    %esi
c0106db3:	5f                   	pop    %edi
c0106db4:	5d                   	pop    %ebp
c0106db5:	c3                   	ret    
c0106db6:	66 90                	xchg   %ax,%ax
c0106db8:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c0106dbf:	00 00 00 
c0106dc2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106dc5:	e9 b6 f7 ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c0106dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106dd0:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106dd6:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106ddc:	85 ff                	test   %edi,%edi
c0106dde:	0f 8e 4f fd ff ff    	jle    c0106b33 <_svfiprintf_r+0x7a3>
c0106de4:	83 ff 10             	cmp    $0x10,%edi
c0106de7:	0f 8e 7f 00 00 00    	jle    c0106e6c <_svfiprintf_r+0xadc>
c0106ded:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0106df3:	89 f1                	mov    %esi,%ecx
c0106df5:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106df8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106dfb:	eb 0b                	jmp    c0106e08 <_svfiprintf_r+0xa78>
c0106dfd:	8d 76 00             	lea    0x0(%esi),%esi
c0106e00:	83 ef 10             	sub    $0x10,%edi
c0106e03:	83 ff 10             	cmp    $0x10,%edi
c0106e06:	7e 5c                	jle    c0106e64 <_svfiprintf_r+0xad4>
c0106e08:	83 c0 01             	add    $0x1,%eax
c0106e0b:	83 c2 10             	add    $0x10,%edx
c0106e0e:	c7 01 0c 86 10 c0    	movl   $0xc010860c,(%ecx)
c0106e14:	83 c1 08             	add    $0x8,%ecx
c0106e17:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106e1e:	83 f8 07             	cmp    $0x7,%eax
c0106e21:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e27:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e2d:	7e d1                	jle    c0106e00 <_svfiprintf_r+0xa70>
c0106e2f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e35:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e39:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106e3d:	89 1c 24             	mov    %ebx,(%esp)
c0106e40:	e8 5b f3 ff ff       	call   c01061a0 <__ssprint_r>
c0106e45:	85 c0                	test   %eax,%eax
c0106e47:	0f 85 4b ff ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106e4d:	83 ef 10             	sub    $0x10,%edi
c0106e50:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e56:	83 ff 10             	cmp    $0x10,%edi
c0106e59:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106e5f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106e62:	7f a4                	jg     c0106e08 <_svfiprintf_r+0xa78>
c0106e64:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c0106e6a:	89 ce                	mov    %ecx,%esi
c0106e6c:	83 c0 01             	add    $0x1,%eax
c0106e6f:	01 fa                	add    %edi,%edx
c0106e71:	c7 06 0c 86 10 c0    	movl   $0xc010860c,(%esi)
c0106e77:	83 c6 08             	add    $0x8,%esi
c0106e7a:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106e7d:	83 f8 07             	cmp    $0x7,%eax
c0106e80:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e86:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e8c:	0f 8e a1 fc ff ff    	jle    c0106b33 <_svfiprintf_r+0x7a3>
c0106e92:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e98:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106e9f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ea3:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ea6:	89 04 24             	mov    %eax,(%esp)
c0106ea9:	e8 f2 f2 ff ff       	call   c01061a0 <__ssprint_r>
c0106eae:	85 c0                	test   %eax,%eax
c0106eb0:	0f 85 e2 fe ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106eb6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106ebc:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106ebf:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ec5:	e9 69 fc ff ff       	jmp    c0106b33 <_svfiprintf_r+0x7a3>
c0106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106ed0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106ed6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106eda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106edd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ee1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ee4:	89 04 24             	mov    %eax,(%esp)
c0106ee7:	e8 b4 f2 ff ff       	call   c01061a0 <__ssprint_r>
c0106eec:	85 c0                	test   %eax,%eax
c0106eee:	0f 85 a4 fe ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106ef4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106efa:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106efd:	e9 4e fd ff ff       	jmp    c0106c50 <_svfiprintf_r+0x8c0>
c0106f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106f08:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f0e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f15:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f19:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f1c:	89 04 24             	mov    %eax,(%esp)
c0106f1f:	e8 7c f2 ff ff       	call   c01061a0 <__ssprint_r>
c0106f24:	85 c0                	test   %eax,%eax
c0106f26:	0f 84 09 fe ff ff    	je     c0106d35 <_svfiprintf_r+0x9a5>
c0106f2c:	e9 67 fe ff ff       	jmp    c0106d98 <_svfiprintf_r+0xa08>
c0106f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106f38:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f3e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f45:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f49:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f4c:	89 04 24             	mov    %eax,(%esp)
c0106f4f:	e8 4c f2 ff ff       	call   c01061a0 <__ssprint_r>
c0106f54:	85 c0                	test   %eax,%eax
c0106f56:	0f 85 3c fe ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106f5c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f5f:	e9 e9 f4 ff ff       	jmp    c010644d <_svfiprintf_r+0xbd>
c0106f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106f68:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f6e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f72:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f75:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f79:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f7c:	89 04 24             	mov    %eax,(%esp)
c0106f7f:	e8 1c f2 ff ff       	call   c01061a0 <__ssprint_r>
c0106f84:	85 c0                	test   %eax,%eax
c0106f86:	0f 85 0c fe ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106f8c:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106f92:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f95:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106f9b:	e9 83 fb ff ff       	jmp    c0106b23 <_svfiprintf_r+0x793>
c0106fa0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106fa6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106faa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106fad:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fb4:	89 04 24             	mov    %eax,(%esp)
c0106fb7:	e8 e4 f1 ff ff       	call   c01061a0 <__ssprint_r>
c0106fbc:	85 c0                	test   %eax,%eax
c0106fbe:	0f 85 d4 fd ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0106fc4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106fca:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106fcd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106fd3:	e9 13 fb ff ff       	jmp    c0106aeb <_svfiprintf_r+0x75b>
c0106fd8:	83 f9 09             	cmp    $0x9,%ecx
c0106fdb:	76 56                	jbe    c0107033 <_svfiprintf_r+0xca3>
c0106fdd:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106fe0:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0106fe5:	83 eb 01             	sub    $0x1,%ebx
c0106fe8:	f7 e1                	mul    %ecx
c0106fea:	c1 ea 03             	shr    $0x3,%edx
c0106fed:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0106ff0:	01 c0                	add    %eax,%eax
c0106ff2:	29 c1                	sub    %eax,%ecx
c0106ff4:	83 c1 30             	add    $0x30,%ecx
c0106ff7:	85 d2                	test   %edx,%edx
c0106ff9:	88 0b                	mov    %cl,(%ebx)
c0106ffb:	89 d1                	mov    %edx,%ecx
c0106ffd:	75 e1                	jne    c0106fe0 <_svfiprintf_r+0xc50>
c0106fff:	e9 71 f5 ff ff       	jmp    c0106575 <_svfiprintf_r+0x1e5>
c0107004:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010700a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010700e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107011:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107015:	8b 45 08             	mov    0x8(%ebp),%eax
c0107018:	89 04 24             	mov    %eax,(%esp)
c010701b:	e8 80 f1 ff ff       	call   c01061a0 <__ssprint_r>
c0107020:	85 c0                	test   %eax,%eax
c0107022:	0f 85 70 fd ff ff    	jne    c0106d98 <_svfiprintf_r+0xa08>
c0107028:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010702e:	e9 e3 fc ff ff       	jmp    c0106d16 <_svfiprintf_r+0x986>
c0107033:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0107039:	83 c1 30             	add    $0x30,%ecx
c010703c:	88 4d a7             	mov    %cl,-0x59(%ebp)
c010703f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0107042:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107048:	e9 33 f5 ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c010704d:	8b 45 14             	mov    0x14(%ebp),%eax
c0107050:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c0107056:	8b 00                	mov    (%eax),%eax
c0107058:	89 18                	mov    %ebx,(%eax)
c010705a:	8b 45 14             	mov    0x14(%ebp),%eax
c010705d:	83 c0 04             	add    $0x4,%eax
c0107060:	89 45 14             	mov    %eax,0x14(%ebp)
c0107063:	e9 86 f3 ff ff       	jmp    c01063ee <_svfiprintf_r+0x5e>
c0107068:	0f b7 0b             	movzwl (%ebx),%ecx
c010706b:	83 c3 04             	add    $0x4,%ebx
c010706e:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0107071:	e9 95 f8 ff ff       	jmp    c010690b <_svfiprintf_r+0x57b>
c0107076:	0f bf 08             	movswl (%eax),%ecx
c0107079:	83 c0 04             	add    $0x4,%eax
c010707c:	89 45 14             	mov    %eax,0x14(%ebp)
c010707f:	85 c9                	test   %ecx,%ecx
c0107081:	0f 89 0d f7 ff ff    	jns    c0106794 <_svfiprintf_r+0x404>
c0107087:	f7 d9                	neg    %ecx
c0107089:	bf 2d 00 00 00       	mov    $0x2d,%edi
c010708e:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c0107095:	ba 01 00 00 00       	mov    $0x1,%edx
c010709a:	e9 7a f4 ff ff       	jmp    c0106519 <_svfiprintf_r+0x189>
c010709f:	89 1c 24             	mov    %ebx,(%esp)
c01070a2:	e8 79 f0 ff ff       	call   c0106120 <strlen>
c01070a7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01070ad:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01070b4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01070bb:	00 00 00 
c01070be:	89 55 14             	mov    %edx,0x14(%ebp)
c01070c1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01070c7:	e9 b4 f4 ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c01070cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01070cf:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c01070d6:	00 
c01070d7:	89 04 24             	mov    %eax,(%esp)
c01070da:	e8 41 d9 ff ff       	call   c0104a20 <_malloc_r>
c01070df:	8b 75 0c             	mov    0xc(%ebp),%esi
c01070e2:	85 c0                	test   %eax,%eax
c01070e4:	89 06                	mov    %eax,(%esi)
c01070e6:	89 46 10             	mov    %eax,0x10(%esi)
c01070e9:	0f 84 a3 00 00 00    	je     c0107192 <_svfiprintf_r+0xe02>
c01070ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01070f2:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c01070f9:	e9 b2 f2 ff ff       	jmp    c01063b0 <_svfiprintf_r+0x20>
c01070fe:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107104:	b8 06 00 00 00       	mov    $0x6,%eax
c0107109:	89 55 14             	mov    %edx,0x14(%ebp)
c010710c:	83 ff 06             	cmp    $0x6,%edi
c010710f:	0f 46 c7             	cmovbe %edi,%eax
c0107112:	85 c0                	test   %eax,%eax
c0107114:	0f 49 d8             	cmovns %eax,%ebx
c0107117:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c010711d:	bb 50 81 10 c0       	mov    $0xc0108150,%ebx
c0107122:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107128:	e9 61 f8 ff ff       	jmp    c010698e <_svfiprintf_r+0x5fe>
c010712d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0107133:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010713a:	89 55 14             	mov    %edx,0x14(%ebp)
c010713d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107144:	00 00 00 
c0107147:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010714d:	e9 2e f4 ff ff       	jmp    c0106580 <_svfiprintf_r+0x1f0>
c0107152:	89 da                	mov    %ebx,%edx
c0107154:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010715b:	00 00 00 
c010715e:	e9 29 f3 ff ff       	jmp    c010648c <_svfiprintf_r+0xfc>
c0107163:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0107166:	89 da                	mov    %ebx,%edx
c0107168:	8b 45 14             	mov    0x14(%ebp),%eax
c010716b:	8b 09                	mov    (%ecx),%ecx
c010716d:	83 c0 04             	add    $0x4,%eax
c0107170:	89 45 14             	mov    %eax,0x14(%ebp)
c0107173:	85 c9                	test   %ecx,%ecx
c0107175:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010717b:	0f 89 26 f3 ff ff    	jns    c01064a7 <_svfiprintf_r+0x117>
c0107181:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c0107188:	ff ff ff 
c010718b:	89 d0                	mov    %edx,%eax
c010718d:	e9 f4 f2 ff ff       	jmp    c0106486 <_svfiprintf_r+0xf6>
c0107192:	8b 45 08             	mov    0x8(%ebp),%eax
c0107195:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010719b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01071a0:	e9 06 fc ff ff       	jmp    c0106dab <_svfiprintf_r+0xa1b>
c01071a5:	66 90                	xchg   %ax,%ax
c01071a7:	66 90                	xchg   %ax,%ax
c01071a9:	66 90                	xchg   %ax,%ax
c01071ab:	66 90                	xchg   %ax,%ax
c01071ad:	66 90                	xchg   %ax,%ax
c01071af:	90                   	nop

c01071b0 <_calloc_r>:
c01071b0:	55                   	push   %ebp
c01071b1:	89 e5                	mov    %esp,%ebp
c01071b3:	53                   	push   %ebx
c01071b4:	83 ec 14             	sub    $0x14,%esp
c01071b7:	8b 45 10             	mov    0x10(%ebp),%eax
c01071ba:	0f af 45 0c          	imul   0xc(%ebp),%eax
c01071be:	89 44 24 04          	mov    %eax,0x4(%esp)
c01071c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01071c5:	89 04 24             	mov    %eax,(%esp)
c01071c8:	e8 53 d8 ff ff       	call   c0104a20 <_malloc_r>
c01071cd:	85 c0                	test   %eax,%eax
c01071cf:	89 c3                	mov    %eax,%ebx
c01071d1:	0f 84 91 00 00 00    	je     c0107268 <_calloc_r+0xb8>
c01071d7:	8b 40 fc             	mov    -0x4(%eax),%eax
c01071da:	83 e0 fc             	and    $0xfffffffc,%eax
c01071dd:	83 e8 04             	sub    $0x4,%eax
c01071e0:	83 f8 24             	cmp    $0x24,%eax
c01071e3:	77 63                	ja     c0107248 <_calloc_r+0x98>
c01071e5:	83 f8 13             	cmp    $0x13,%eax
c01071e8:	89 da                	mov    %ebx,%edx
c01071ea:	77 1c                	ja     c0107208 <_calloc_r+0x58>
c01071ec:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c01071f2:	89 d8                	mov    %ebx,%eax
c01071f4:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c01071fb:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c0107202:	83 c4 14             	add    $0x14,%esp
c0107205:	5b                   	pop    %ebx
c0107206:	5d                   	pop    %ebp
c0107207:	c3                   	ret    
c0107208:	83 f8 1b             	cmp    $0x1b,%eax
c010720b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0107211:	8d 53 08             	lea    0x8(%ebx),%edx
c0107214:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c010721b:	76 cf                	jbe    c01071ec <_calloc_r+0x3c>
c010721d:	83 f8 24             	cmp    $0x24,%eax
c0107220:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107227:	8d 53 10             	lea    0x10(%ebx),%edx
c010722a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c0107231:	75 b9                	jne    c01071ec <_calloc_r+0x3c>
c0107233:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c010723a:	8d 53 18             	lea    0x18(%ebx),%edx
c010723d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c0107244:	eb a6                	jmp    c01071ec <_calloc_r+0x3c>
c0107246:	66 90                	xchg   %ax,%ax
c0107248:	89 1c 24             	mov    %ebx,(%esp)
c010724b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010724f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107256:	00 
c0107257:	e8 5c a2 ff ff       	call   c01014b8 <memset>
c010725c:	83 c4 14             	add    $0x14,%esp
c010725f:	89 d8                	mov    %ebx,%eax
c0107261:	5b                   	pop    %ebx
c0107262:	5d                   	pop    %ebp
c0107263:	c3                   	ret    
c0107264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107268:	31 c0                	xor    %eax,%eax
c010726a:	eb 96                	jmp    c0107202 <_calloc_r+0x52>
c010726c:	66 90                	xchg   %ax,%ax
c010726e:	66 90                	xchg   %ax,%ax

c0107270 <_malloc_trim_r>:
c0107270:	55                   	push   %ebp
c0107271:	89 e5                	mov    %esp,%ebp
c0107273:	57                   	push   %edi
c0107274:	56                   	push   %esi
c0107275:	53                   	push   %ebx
c0107276:	83 ec 1c             	sub    $0x1c,%esp
c0107279:	8b 75 08             	mov    0x8(%ebp),%esi
c010727c:	89 34 24             	mov    %esi,(%esp)
c010727f:	e8 7c df ff ff       	call   c0105200 <__malloc_lock>
c0107284:	a1 a8 aa 10 c0       	mov    0xc010aaa8,%eax
c0107289:	8b 58 04             	mov    0x4(%eax),%ebx
c010728c:	83 e3 fc             	and    $0xfffffffc,%ebx
c010728f:	89 d8                	mov    %ebx,%eax
c0107291:	2b 45 0c             	sub    0xc(%ebp),%eax
c0107294:	05 ef 0f 00 00       	add    $0xfef,%eax
c0107299:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010729e:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c01072a4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c01072aa:	7e 1c                	jle    c01072c8 <_malloc_trim_r+0x58>
c01072ac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01072b3:	00 
c01072b4:	89 34 24             	mov    %esi,(%esp)
c01072b7:	e8 44 ed ff ff       	call   c0106000 <_sbrk_r>
c01072bc:	8b 15 a8 aa 10 c0    	mov    0xc010aaa8,%edx
c01072c2:	01 da                	add    %ebx,%edx
c01072c4:	39 d0                	cmp    %edx,%eax
c01072c6:	74 18                	je     c01072e0 <_malloc_trim_r+0x70>
c01072c8:	89 34 24             	mov    %esi,(%esp)
c01072cb:	e8 40 df ff ff       	call   c0105210 <__malloc_unlock>
c01072d0:	83 c4 1c             	add    $0x1c,%esp
c01072d3:	31 c0                	xor    %eax,%eax
c01072d5:	5b                   	pop    %ebx
c01072d6:	5e                   	pop    %esi
c01072d7:	5f                   	pop    %edi
c01072d8:	5d                   	pop    %ebp
c01072d9:	c3                   	ret    
c01072da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01072e0:	89 f8                	mov    %edi,%eax
c01072e2:	f7 d8                	neg    %eax
c01072e4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01072e8:	89 34 24             	mov    %esi,(%esp)
c01072eb:	e8 10 ed ff ff       	call   c0106000 <_sbrk_r>
c01072f0:	83 f8 ff             	cmp    $0xffffffff,%eax
c01072f3:	74 2b                	je     c0107320 <_malloc_trim_r+0xb0>
c01072f5:	a1 a8 aa 10 c0       	mov    0xc010aaa8,%eax
c01072fa:	29 fb                	sub    %edi,%ebx
c01072fc:	83 cb 01             	or     $0x1,%ebx
c01072ff:	29 3d 60 25 16 c0    	sub    %edi,0xc0162560
c0107305:	89 58 04             	mov    %ebx,0x4(%eax)
c0107308:	89 34 24             	mov    %esi,(%esp)
c010730b:	e8 00 df ff ff       	call   c0105210 <__malloc_unlock>
c0107310:	83 c4 1c             	add    $0x1c,%esp
c0107313:	b8 01 00 00 00       	mov    $0x1,%eax
c0107318:	5b                   	pop    %ebx
c0107319:	5e                   	pop    %esi
c010731a:	5f                   	pop    %edi
c010731b:	5d                   	pop    %ebp
c010731c:	c3                   	ret    
c010731d:	8d 76 00             	lea    0x0(%esi),%esi
c0107320:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107327:	00 
c0107328:	89 34 24             	mov    %esi,(%esp)
c010732b:	e8 d0 ec ff ff       	call   c0106000 <_sbrk_r>
c0107330:	8b 15 a8 aa 10 c0    	mov    0xc010aaa8,%edx
c0107336:	89 c1                	mov    %eax,%ecx
c0107338:	29 d1                	sub    %edx,%ecx
c010733a:	83 f9 0f             	cmp    $0xf,%ecx
c010733d:	7e 89                	jle    c01072c8 <_malloc_trim_r+0x58>
c010733f:	2b 05 80 aa 10 c0    	sub    0xc010aa80,%eax
c0107345:	83 c9 01             	or     $0x1,%ecx
c0107348:	89 4a 04             	mov    %ecx,0x4(%edx)
c010734b:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0107350:	e9 73 ff ff ff       	jmp    c01072c8 <_malloc_trim_r+0x58>
c0107355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0107360 <_free_r>:
c0107360:	55                   	push   %ebp
c0107361:	89 e5                	mov    %esp,%ebp
c0107363:	57                   	push   %edi
c0107364:	56                   	push   %esi
c0107365:	53                   	push   %ebx
c0107366:	83 ec 1c             	sub    $0x1c,%esp
c0107369:	8b 75 0c             	mov    0xc(%ebp),%esi
c010736c:	8b 45 08             	mov    0x8(%ebp),%eax
c010736f:	85 f6                	test   %esi,%esi
c0107371:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107374:	0f 84 fe 00 00 00    	je     c0107478 <_free_r+0x118>
c010737a:	89 04 24             	mov    %eax,(%esp)
c010737d:	e8 7e de ff ff       	call   c0105200 <__malloc_lock>
c0107382:	8b 7e fc             	mov    -0x4(%esi),%edi
c0107385:	8d 56 f8             	lea    -0x8(%esi),%edx
c0107388:	89 f8                	mov    %edi,%eax
c010738a:	83 e0 fe             	and    $0xfffffffe,%eax
c010738d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c0107390:	8b 59 04             	mov    0x4(%ecx),%ebx
c0107393:	83 e3 fc             	and    $0xfffffffc,%ebx
c0107396:	39 0d a8 aa 10 c0    	cmp    %ecx,0xc010aaa8
c010739c:	0f 84 0e 01 00 00    	je     c01074b0 <_free_r+0x150>
c01073a2:	83 e7 01             	and    $0x1,%edi
c01073a5:	89 59 04             	mov    %ebx,0x4(%ecx)
c01073a8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01073af:	75 1f                	jne    c01073d0 <_free_r+0x70>
c01073b1:	8b 76 f8             	mov    -0x8(%esi),%esi
c01073b4:	29 f2                	sub    %esi,%edx
c01073b6:	01 f0                	add    %esi,%eax
c01073b8:	8b 72 08             	mov    0x8(%edx),%esi
c01073bb:	81 fe a8 aa 10 c0    	cmp    $0xc010aaa8,%esi
c01073c1:	0f 84 39 01 00 00    	je     c0107500 <_free_r+0x1a0>
c01073c7:	8b 7a 0c             	mov    0xc(%edx),%edi
c01073ca:	89 7e 0c             	mov    %edi,0xc(%esi)
c01073cd:	89 77 08             	mov    %esi,0x8(%edi)
c01073d0:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c01073d5:	75 21                	jne    c01073f8 <_free_r+0x98>
c01073d7:	8b 75 e0             	mov    -0x20(%ebp),%esi
c01073da:	01 d8                	add    %ebx,%eax
c01073dc:	8b 59 08             	mov    0x8(%ecx),%ebx
c01073df:	85 f6                	test   %esi,%esi
c01073e1:	75 0c                	jne    c01073ef <_free_r+0x8f>
c01073e3:	81 fb a8 aa 10 c0    	cmp    $0xc010aaa8,%ebx
c01073e9:	0f 84 21 01 00 00    	je     c0107510 <_free_r+0x1b0>
c01073ef:	8b 49 0c             	mov    0xc(%ecx),%ecx
c01073f2:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01073f5:	89 59 08             	mov    %ebx,0x8(%ecx)
c01073f8:	89 c1                	mov    %eax,%ecx
c01073fa:	83 c9 01             	or     $0x1,%ecx
c01073fd:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107400:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107403:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107406:	85 c9                	test   %ecx,%ecx
c0107408:	75 56                	jne    c0107460 <_free_r+0x100>
c010740a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010740f:	76 6f                	jbe    c0107480 <_free_r+0x120>
c0107411:	89 c1                	mov    %eax,%ecx
c0107413:	c1 e9 09             	shr    $0x9,%ecx
c0107416:	83 f9 04             	cmp    $0x4,%ecx
c0107419:	0f 87 21 01 00 00    	ja     c0107540 <_free_r+0x1e0>
c010741f:	89 c1                	mov    %eax,%ecx
c0107421:	c1 e9 06             	shr    $0x6,%ecx
c0107424:	83 c1 38             	add    $0x38,%ecx
c0107427:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010742a:	8d 34 9d a0 aa 10 c0 	lea    -0x3fef5560(,%ebx,4),%esi
c0107431:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107434:	39 f3                	cmp    %esi,%ebx
c0107436:	0f 84 14 01 00 00    	je     c0107550 <_free_r+0x1f0>
c010743c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107440:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107443:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107446:	39 c8                	cmp    %ecx,%eax
c0107448:	73 07                	jae    c0107451 <_free_r+0xf1>
c010744a:	8b 5b 08             	mov    0x8(%ebx),%ebx
c010744d:	39 de                	cmp    %ebx,%esi
c010744f:	75 ef                	jne    c0107440 <_free_r+0xe0>
c0107451:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107454:	89 42 0c             	mov    %eax,0xc(%edx)
c0107457:	89 5a 08             	mov    %ebx,0x8(%edx)
c010745a:	89 50 08             	mov    %edx,0x8(%eax)
c010745d:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107460:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107463:	89 45 08             	mov    %eax,0x8(%ebp)
c0107466:	83 c4 1c             	add    $0x1c,%esp
c0107469:	5b                   	pop    %ebx
c010746a:	5e                   	pop    %esi
c010746b:	5f                   	pop    %edi
c010746c:	5d                   	pop    %ebp
c010746d:	e9 9e dd ff ff       	jmp    c0105210 <__malloc_unlock>
c0107472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107478:	83 c4 1c             	add    $0x1c,%esp
c010747b:	5b                   	pop    %ebx
c010747c:	5e                   	pop    %esi
c010747d:	5f                   	pop    %edi
c010747e:	5d                   	pop    %ebp
c010747f:	c3                   	ret    
c0107480:	c1 e8 03             	shr    $0x3,%eax
c0107483:	bb 01 00 00 00       	mov    $0x1,%ebx
c0107488:	89 c1                	mov    %eax,%ecx
c010748a:	c1 f9 02             	sar    $0x2,%ecx
c010748d:	8d 04 c5 a0 aa 10 c0 	lea    -0x3fef5560(,%eax,8),%eax
c0107494:	d3 e3                	shl    %cl,%ebx
c0107496:	8b 48 08             	mov    0x8(%eax),%ecx
c0107499:	09 1d a4 aa 10 c0    	or     %ebx,0xc010aaa4
c010749f:	89 42 0c             	mov    %eax,0xc(%edx)
c01074a2:	89 4a 08             	mov    %ecx,0x8(%edx)
c01074a5:	89 50 08             	mov    %edx,0x8(%eax)
c01074a8:	89 51 0c             	mov    %edx,0xc(%ecx)
c01074ab:	eb b3                	jmp    c0107460 <_free_r+0x100>
c01074ad:	8d 76 00             	lea    0x0(%esi),%esi
c01074b0:	01 d8                	add    %ebx,%eax
c01074b2:	83 e7 01             	and    $0x1,%edi
c01074b5:	75 13                	jne    c01074ca <_free_r+0x16a>
c01074b7:	8b 4e f8             	mov    -0x8(%esi),%ecx
c01074ba:	29 ca                	sub    %ecx,%edx
c01074bc:	01 c8                	add    %ecx,%eax
c01074be:	8b 5a 08             	mov    0x8(%edx),%ebx
c01074c1:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01074c4:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01074c7:	89 59 08             	mov    %ebx,0x8(%ecx)
c01074ca:	89 c1                	mov    %eax,%ecx
c01074cc:	83 c9 01             	or     $0x1,%ecx
c01074cf:	3b 05 84 aa 10 c0    	cmp    0xc010aa84,%eax
c01074d5:	89 4a 04             	mov    %ecx,0x4(%edx)
c01074d8:	89 15 a8 aa 10 c0    	mov    %edx,0xc010aaa8
c01074de:	72 80                	jb     c0107460 <_free_r+0x100>
c01074e0:	a1 90 25 16 c0       	mov    0xc0162590,%eax
c01074e5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01074e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01074ec:	89 04 24             	mov    %eax,(%esp)
c01074ef:	e8 7c fd ff ff       	call   c0107270 <_malloc_trim_r>
c01074f4:	e9 67 ff ff ff       	jmp    c0107460 <_free_r+0x100>
c01074f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107500:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0107507:	e9 c4 fe ff ff       	jmp    c01073d0 <_free_r+0x70>
c010750c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107510:	89 c1                	mov    %eax,%ecx
c0107512:	83 c9 01             	or     $0x1,%ecx
c0107515:	89 15 b4 aa 10 c0    	mov    %edx,0xc010aab4
c010751b:	89 15 b0 aa 10 c0    	mov    %edx,0xc010aab0
c0107521:	c7 42 0c a8 aa 10 c0 	movl   $0xc010aaa8,0xc(%edx)
c0107528:	c7 42 08 a8 aa 10 c0 	movl   $0xc010aaa8,0x8(%edx)
c010752f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107532:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107535:	e9 26 ff ff ff       	jmp    c0107460 <_free_r+0x100>
c010753a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107540:	83 f9 14             	cmp    $0x14,%ecx
c0107543:	77 23                	ja     c0107568 <_free_r+0x208>
c0107545:	83 c1 5b             	add    $0x5b,%ecx
c0107548:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010754b:	e9 da fe ff ff       	jmp    c010742a <_free_r+0xca>
c0107550:	c1 f9 02             	sar    $0x2,%ecx
c0107553:	b8 01 00 00 00       	mov    $0x1,%eax
c0107558:	d3 e0                	shl    %cl,%eax
c010755a:	09 05 a4 aa 10 c0    	or     %eax,0xc010aaa4
c0107560:	89 d8                	mov    %ebx,%eax
c0107562:	e9 ed fe ff ff       	jmp    c0107454 <_free_r+0xf4>
c0107567:	90                   	nop
c0107568:	83 f9 54             	cmp    $0x54,%ecx
c010756b:	77 10                	ja     c010757d <_free_r+0x21d>
c010756d:	89 c1                	mov    %eax,%ecx
c010756f:	c1 e9 0c             	shr    $0xc,%ecx
c0107572:	83 c1 6e             	add    $0x6e,%ecx
c0107575:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107578:	e9 ad fe ff ff       	jmp    c010742a <_free_r+0xca>
c010757d:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0107583:	77 10                	ja     c0107595 <_free_r+0x235>
c0107585:	89 c1                	mov    %eax,%ecx
c0107587:	c1 e9 0f             	shr    $0xf,%ecx
c010758a:	83 c1 77             	add    $0x77,%ecx
c010758d:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107590:	e9 95 fe ff ff       	jmp    c010742a <_free_r+0xca>
c0107595:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c010759b:	77 10                	ja     c01075ad <_free_r+0x24d>
c010759d:	89 c1                	mov    %eax,%ecx
c010759f:	c1 e9 12             	shr    $0x12,%ecx
c01075a2:	83 c1 7c             	add    $0x7c,%ecx
c01075a5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01075a8:	e9 7d fe ff ff       	jmp    c010742a <_free_r+0xca>
c01075ad:	bb fc 00 00 00       	mov    $0xfc,%ebx
c01075b2:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c01075b7:	e9 6e fe ff ff       	jmp    c010742a <_free_r+0xca>
c01075bc:	66 90                	xchg   %ax,%ax
c01075be:	66 90                	xchg   %ax,%ax

c01075c0 <memmove>:
c01075c0:	55                   	push   %ebp
c01075c1:	89 e5                	mov    %esp,%ebp
c01075c3:	56                   	push   %esi
c01075c4:	57                   	push   %edi
c01075c5:	53                   	push   %ebx
c01075c6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01075c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01075cc:	8b 75 0c             	mov    0xc(%ebp),%esi
c01075cf:	fc                   	cld    
c01075d0:	39 fe                	cmp    %edi,%esi
c01075d2:	73 43                	jae    c0107617 <memmove+0x57>
c01075d4:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c01075d8:	39 df                	cmp    %ebx,%edi
c01075da:	77 3b                	ja     c0107617 <memmove+0x57>
c01075dc:	01 ce                	add    %ecx,%esi
c01075de:	01 cf                	add    %ecx,%edi
c01075e0:	fd                   	std    
c01075e1:	83 f9 08             	cmp    $0x8,%ecx
c01075e4:	76 2b                	jbe    c0107611 <memmove+0x51>
c01075e6:	89 fa                	mov    %edi,%edx
c01075e8:	89 cb                	mov    %ecx,%ebx
c01075ea:	83 e2 03             	and    $0x3,%edx
c01075ed:	74 0c                	je     c01075fb <memmove+0x3b>
c01075ef:	89 d1                	mov    %edx,%ecx
c01075f1:	4e                   	dec    %esi
c01075f2:	4f                   	dec    %edi
c01075f3:	29 cb                	sub    %ecx,%ebx
c01075f5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01075f7:	89 d9                	mov    %ebx,%ecx
c01075f9:	46                   	inc    %esi
c01075fa:	47                   	inc    %edi
c01075fb:	c1 e9 02             	shr    $0x2,%ecx
c01075fe:	83 ee 04             	sub    $0x4,%esi
c0107601:	83 ef 04             	sub    $0x4,%edi
c0107604:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107606:	83 c6 04             	add    $0x4,%esi
c0107609:	83 c7 04             	add    $0x4,%edi
c010760c:	89 d9                	mov    %ebx,%ecx
c010760e:	83 e1 03             	and    $0x3,%ecx
c0107611:	4e                   	dec    %esi
c0107612:	4f                   	dec    %edi
c0107613:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107615:	eb 2a                	jmp    c0107641 <memmove+0x81>
c0107617:	83 f9 08             	cmp    $0x8,%ecx
c010761a:	76 23                	jbe    c010763f <memmove+0x7f>
c010761c:	89 fa                	mov    %edi,%edx
c010761e:	89 cb                	mov    %ecx,%ebx
c0107620:	83 e2 03             	and    $0x3,%edx
c0107623:	74 10                	je     c0107635 <memmove+0x75>
c0107625:	b9 04 00 00 00       	mov    $0x4,%ecx
c010762a:	29 d1                	sub    %edx,%ecx
c010762c:	83 e1 03             	and    $0x3,%ecx
c010762f:	29 cb                	sub    %ecx,%ebx
c0107631:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107633:	89 d9                	mov    %ebx,%ecx
c0107635:	c1 e9 02             	shr    $0x2,%ecx
c0107638:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010763a:	89 d9                	mov    %ebx,%ecx
c010763c:	83 e1 03             	and    $0x3,%ecx
c010763f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107641:	8b 45 08             	mov    0x8(%ebp),%eax
c0107644:	fc                   	cld    
c0107645:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107648:	5b                   	pop    %ebx
c0107649:	5f                   	pop    %edi
c010764a:	5e                   	pop    %esi
c010764b:	c9                   	leave  
c010764c:	c3                   	ret    
c010764d:	66 90                	xchg   %ax,%ax
c010764f:	90                   	nop

c0107650 <_realloc_r>:
c0107650:	55                   	push   %ebp
c0107651:	89 e5                	mov    %esp,%ebp
c0107653:	57                   	push   %edi
c0107654:	56                   	push   %esi
c0107655:	53                   	push   %ebx
c0107656:	83 ec 3c             	sub    $0x3c,%esp
c0107659:	8b 45 08             	mov    0x8(%ebp),%eax
c010765c:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010765f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107662:	8b 45 10             	mov    0x10(%ebp),%eax
c0107665:	85 ff                	test   %edi,%edi
c0107667:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010766a:	0f 84 50 02 00 00    	je     c01078c0 <_realloc_r+0x270>
c0107670:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107673:	8d 77 f8             	lea    -0x8(%edi),%esi
c0107676:	89 04 24             	mov    %eax,(%esp)
c0107679:	e8 82 db ff ff       	call   c0105200 <__malloc_lock>
c010767e:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107681:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107684:	89 c3                	mov    %eax,%ebx
c0107686:	8d 51 0b             	lea    0xb(%ecx),%edx
c0107689:	83 e3 fc             	and    $0xfffffffc,%ebx
c010768c:	83 fa 16             	cmp    $0x16,%edx
c010768f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107692:	0f 87 00 01 00 00    	ja     c0107798 <_realloc_r+0x148>
c0107698:	31 d2                	xor    %edx,%edx
c010769a:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c01076a1:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01076a8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01076ab:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c01076ae:	0f 82 1c 02 00 00    	jb     c01078d0 <_realloc_r+0x280>
c01076b4:	84 d2                	test   %dl,%dl
c01076b6:	0f 85 14 02 00 00    	jne    c01078d0 <_realloc_r+0x280>
c01076bc:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c01076bf:	0f 8d eb 00 00 00    	jge    c01077b0 <_realloc_r+0x160>
c01076c5:	8b 0d a8 aa 10 c0    	mov    0xc010aaa8,%ecx
c01076cb:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c01076ce:	39 d1                	cmp    %edx,%ecx
c01076d0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c01076d3:	0f 84 6f 02 00 00    	je     c0107948 <_realloc_r+0x2f8>
c01076d9:	8b 4a 04             	mov    0x4(%edx),%ecx
c01076dc:	89 c8                	mov    %ecx,%eax
c01076de:	83 e0 fe             	and    $0xfffffffe,%eax
c01076e1:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c01076e6:	0f 84 f4 00 00 00    	je     c01077e0 <_realloc_r+0x190>
c01076ec:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c01076f3:	31 d2                	xor    %edx,%edx
c01076f5:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c01076f9:	0f 85 39 01 00 00    	jne    c0107838 <_realloc_r+0x1e8>
c01076ff:	89 f1                	mov    %esi,%ecx
c0107701:	2b 4f f8             	sub    -0x8(%edi),%ecx
c0107704:	8b 41 04             	mov    0x4(%ecx),%eax
c0107707:	83 e0 fc             	and    $0xfffffffc,%eax
c010770a:	85 d2                	test   %edx,%edx
c010770c:	0f 84 f6 02 00 00    	je     c0107a08 <_realloc_r+0x3b8>
c0107712:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0107715:	0f 84 f5 02 00 00    	je     c0107a10 <_realloc_r+0x3c0>
c010771b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c010771e:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107721:	01 d8                	add    %ebx,%eax
c0107723:	01 c2                	add    %eax,%edx
c0107725:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107728:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010772b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010772e:	0f 8c ac 01 00 00    	jl     c01078e0 <_realloc_r+0x290>
c0107734:	8b 42 0c             	mov    0xc(%edx),%eax
c0107737:	83 eb 04             	sub    $0x4,%ebx
c010773a:	8b 52 08             	mov    0x8(%edx),%edx
c010773d:	83 fb 24             	cmp    $0x24,%ebx
c0107740:	8d 71 08             	lea    0x8(%ecx),%esi
c0107743:	89 42 0c             	mov    %eax,0xc(%edx)
c0107746:	89 50 08             	mov    %edx,0x8(%eax)
c0107749:	8b 41 0c             	mov    0xc(%ecx),%eax
c010774c:	8b 51 08             	mov    0x8(%ecx),%edx
c010774f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107752:	89 50 08             	mov    %edx,0x8(%eax)
c0107755:	0f 87 85 03 00 00    	ja     c0107ae0 <_realloc_r+0x490>
c010775b:	83 fb 13             	cmp    $0x13,%ebx
c010775e:	89 f0                	mov    %esi,%eax
c0107760:	76 1a                	jbe    c010777c <_realloc_r+0x12c>
c0107762:	8b 07                	mov    (%edi),%eax
c0107764:	83 fb 1b             	cmp    $0x1b,%ebx
c0107767:	89 41 08             	mov    %eax,0x8(%ecx)
c010776a:	8b 47 04             	mov    0x4(%edi),%eax
c010776d:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107770:	0f 87 8f 03 00 00    	ja     c0107b05 <_realloc_r+0x4b5>
c0107776:	8d 41 10             	lea    0x10(%ecx),%eax
c0107779:	83 c7 08             	add    $0x8,%edi
c010777c:	8b 17                	mov    (%edi),%edx
c010777e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107781:	89 10                	mov    %edx,(%eax)
c0107783:	8b 57 04             	mov    0x4(%edi),%edx
c0107786:	89 50 04             	mov    %edx,0x4(%eax)
c0107789:	8b 57 08             	mov    0x8(%edi),%edx
c010778c:	89 f7                	mov    %esi,%edi
c010778e:	89 ce                	mov    %ecx,%esi
c0107790:	89 50 08             	mov    %edx,0x8(%eax)
c0107793:	8b 41 04             	mov    0x4(%ecx),%eax
c0107796:	eb 1b                	jmp    c01077b3 <_realloc_r+0x163>
c0107798:	83 e2 f8             	and    $0xfffffff8,%edx
c010779b:	89 55 dc             	mov    %edx,-0x24(%ebp)
c010779e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01077a1:	c1 ea 1f             	shr    $0x1f,%edx
c01077a4:	e9 ff fe ff ff       	jmp    c01076a8 <_realloc_r+0x58>
c01077a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01077b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01077b3:	89 da                	mov    %ebx,%edx
c01077b5:	2b 55 dc             	sub    -0x24(%ebp),%edx
c01077b8:	83 fa 0f             	cmp    $0xf,%edx
c01077bb:	77 4b                	ja     c0107808 <_realloc_r+0x1b8>
c01077bd:	83 e0 01             	and    $0x1,%eax
c01077c0:	09 d8                	or     %ebx,%eax
c01077c2:	89 46 04             	mov    %eax,0x4(%esi)
c01077c5:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c01077ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01077cd:	89 04 24             	mov    %eax,(%esp)
c01077d0:	e8 3b da ff ff       	call   c0105210 <__malloc_unlock>
c01077d5:	89 f8                	mov    %edi,%eax
c01077d7:	83 c4 3c             	add    $0x3c,%esp
c01077da:	5b                   	pop    %ebx
c01077db:	5e                   	pop    %esi
c01077dc:	5f                   	pop    %edi
c01077dd:	5d                   	pop    %ebp
c01077de:	c3                   	ret    
c01077df:	90                   	nop
c01077e0:	83 e1 fc             	and    $0xfffffffc,%ecx
c01077e3:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c01077e6:	01 d9                	add    %ebx,%ecx
c01077e8:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c01077eb:	0f 8c 04 ff ff ff    	jl     c01076f5 <_realloc_r+0xa5>
c01077f1:	8b 5a 0c             	mov    0xc(%edx),%ebx
c01077f4:	8b 52 08             	mov    0x8(%edx),%edx
c01077f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01077fa:	89 5a 0c             	mov    %ebx,0xc(%edx)
c01077fd:	89 53 08             	mov    %edx,0x8(%ebx)
c0107800:	89 cb                	mov    %ecx,%ebx
c0107802:	eb af                	jmp    c01077b3 <_realloc_r+0x163>
c0107804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107808:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010780b:	83 e0 01             	and    $0x1,%eax
c010780e:	09 d8                	or     %ebx,%eax
c0107810:	89 46 04             	mov    %eax,0x4(%esi)
c0107813:	89 d0                	mov    %edx,%eax
c0107815:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c0107818:	83 c8 01             	or     $0x1,%eax
c010781b:	89 41 04             	mov    %eax,0x4(%ecx)
c010781e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107821:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107826:	83 c1 08             	add    $0x8,%ecx
c0107829:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010782d:	89 04 24             	mov    %eax,(%esp)
c0107830:	e8 2b fb ff ff       	call   c0107360 <_free_r>
c0107835:	eb 93                	jmp    c01077ca <_realloc_r+0x17a>
c0107837:	90                   	nop
c0107838:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010783b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010783f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107842:	89 04 24             	mov    %eax,(%esp)
c0107845:	e8 d6 d1 ff ff       	call   c0104a20 <_malloc_r>
c010784a:	85 c0                	test   %eax,%eax
c010784c:	89 c1                	mov    %eax,%ecx
c010784e:	0f 84 65 03 00 00    	je     c0107bb9 <_realloc_r+0x569>
c0107854:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107857:	8d 51 f8             	lea    -0x8(%ecx),%edx
c010785a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010785d:	89 c2                	mov    %eax,%edx
c010785f:	83 e2 fe             	and    $0xfffffffe,%edx
c0107862:	01 f2                	add    %esi,%edx
c0107864:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107867:	0f 84 63 02 00 00    	je     c0107ad0 <_realloc_r+0x480>
c010786d:	83 eb 04             	sub    $0x4,%ebx
c0107870:	83 fb 24             	cmp    $0x24,%ebx
c0107873:	0f 87 6f 01 00 00    	ja     c01079e8 <_realloc_r+0x398>
c0107879:	83 fb 13             	cmp    $0x13,%ebx
c010787c:	0f 87 ee 00 00 00    	ja     c0107970 <_realloc_r+0x320>
c0107882:	89 c8                	mov    %ecx,%eax
c0107884:	89 fa                	mov    %edi,%edx
c0107886:	8b 1a                	mov    (%edx),%ebx
c0107888:	89 18                	mov    %ebx,(%eax)
c010788a:	8b 5a 04             	mov    0x4(%edx),%ebx
c010788d:	89 58 04             	mov    %ebx,0x4(%eax)
c0107890:	8b 52 08             	mov    0x8(%edx),%edx
c0107893:	89 50 08             	mov    %edx,0x8(%eax)
c0107896:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0107899:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010789d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01078a0:	89 34 24             	mov    %esi,(%esp)
c01078a3:	e8 b8 fa ff ff       	call   c0107360 <_free_r>
c01078a8:	89 34 24             	mov    %esi,(%esp)
c01078ab:	e8 60 d9 ff ff       	call   c0105210 <__malloc_unlock>
c01078b0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01078b3:	83 c4 3c             	add    $0x3c,%esp
c01078b6:	5b                   	pop    %ebx
c01078b7:	5e                   	pop    %esi
c01078b8:	5f                   	pop    %edi
c01078b9:	89 c8                	mov    %ecx,%eax
c01078bb:	5d                   	pop    %ebp
c01078bc:	c3                   	ret    
c01078bd:	8d 76 00             	lea    0x0(%esi),%esi
c01078c0:	89 45 0c             	mov    %eax,0xc(%ebp)
c01078c3:	83 c4 3c             	add    $0x3c,%esp
c01078c6:	5b                   	pop    %ebx
c01078c7:	5e                   	pop    %esi
c01078c8:	5f                   	pop    %edi
c01078c9:	5d                   	pop    %ebp
c01078ca:	e9 51 d1 ff ff       	jmp    c0104a20 <_malloc_r>
c01078cf:	90                   	nop
c01078d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01078d3:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01078d9:	31 c0                	xor    %eax,%eax
c01078db:	e9 f7 fe ff ff       	jmp    c01077d7 <_realloc_r+0x187>
c01078e0:	89 c2                	mov    %eax,%edx
c01078e2:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c01078e5:	0f 8c 4d ff ff ff    	jl     c0107838 <_realloc_r+0x1e8>
c01078eb:	8b 71 08             	mov    0x8(%ecx),%esi
c01078ee:	83 eb 04             	sub    $0x4,%ebx
c01078f1:	8b 41 0c             	mov    0xc(%ecx),%eax
c01078f4:	83 fb 24             	cmp    $0x24,%ebx
c01078f7:	89 46 0c             	mov    %eax,0xc(%esi)
c01078fa:	89 70 08             	mov    %esi,0x8(%eax)
c01078fd:	8d 71 08             	lea    0x8(%ecx),%esi
c0107900:	0f 87 88 00 00 00    	ja     c010798e <_realloc_r+0x33e>
c0107906:	83 fb 13             	cmp    $0x13,%ebx
c0107909:	89 f0                	mov    %esi,%eax
c010790b:	76 1a                	jbe    c0107927 <_realloc_r+0x2d7>
c010790d:	8b 07                	mov    (%edi),%eax
c010790f:	83 fb 1b             	cmp    $0x1b,%ebx
c0107912:	89 41 08             	mov    %eax,0x8(%ecx)
c0107915:	8b 47 04             	mov    0x4(%edi),%eax
c0107918:	89 41 0c             	mov    %eax,0xc(%ecx)
c010791b:	0f 87 17 02 00 00    	ja     c0107b38 <_realloc_r+0x4e8>
c0107921:	8d 41 10             	lea    0x10(%ecx),%eax
c0107924:	83 c7 08             	add    $0x8,%edi
c0107927:	8b 1f                	mov    (%edi),%ebx
c0107929:	89 18                	mov    %ebx,(%eax)
c010792b:	8b 5f 04             	mov    0x4(%edi),%ebx
c010792e:	89 58 04             	mov    %ebx,0x4(%eax)
c0107931:	8b 5f 08             	mov    0x8(%edi),%ebx
c0107934:	89 f7                	mov    %esi,%edi
c0107936:	89 ce                	mov    %ecx,%esi
c0107938:	89 58 08             	mov    %ebx,0x8(%eax)
c010793b:	89 d3                	mov    %edx,%ebx
c010793d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107940:	e9 6e fe ff ff       	jmp    c01077b3 <_realloc_r+0x163>
c0107945:	8d 76 00             	lea    0x0(%esi),%esi
c0107948:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010794b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010794e:	8b 48 04             	mov    0x4(%eax),%ecx
c0107951:	83 c2 10             	add    $0x10,%edx
c0107954:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107957:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c010795b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c010795e:	01 d9                	add    %ebx,%ecx
c0107960:	39 d1                	cmp    %edx,%ecx
c0107962:	7d 54                	jge    c01079b8 <_realloc_r+0x368>
c0107964:	89 c2                	mov    %eax,%edx
c0107966:	e9 8a fd ff ff       	jmp    c01076f5 <_realloc_r+0xa5>
c010796b:	90                   	nop
c010796c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107970:	8b 07                	mov    (%edi),%eax
c0107972:	83 fb 1b             	cmp    $0x1b,%ebx
c0107975:	89 01                	mov    %eax,(%ecx)
c0107977:	8b 47 04             	mov    0x4(%edi),%eax
c010797a:	89 41 04             	mov    %eax,0x4(%ecx)
c010797d:	0f 87 2d 01 00 00    	ja     c0107ab0 <_realloc_r+0x460>
c0107983:	8d 41 08             	lea    0x8(%ecx),%eax
c0107986:	8d 57 08             	lea    0x8(%edi),%edx
c0107989:	e9 f8 fe ff ff       	jmp    c0107886 <_realloc_r+0x236>
c010798e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107992:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107996:	89 f7                	mov    %esi,%edi
c0107998:	89 34 24             	mov    %esi,(%esp)
c010799b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010799e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01079a1:	e8 1a fc ff ff       	call   c01075c0 <memmove>
c01079a6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01079a9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01079ac:	8b 41 04             	mov    0x4(%ecx),%eax
c01079af:	89 ce                	mov    %ecx,%esi
c01079b1:	89 d3                	mov    %edx,%ebx
c01079b3:	e9 fb fd ff ff       	jmp    c01077b3 <_realloc_r+0x163>
c01079b8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c01079bb:	29 d9                	sub    %ebx,%ecx
c01079bd:	01 de                	add    %ebx,%esi
c01079bf:	83 c9 01             	or     $0x1,%ecx
c01079c2:	89 35 a8 aa 10 c0    	mov    %esi,0xc010aaa8
c01079c8:	89 4e 04             	mov    %ecx,0x4(%esi)
c01079cb:	8b 47 fc             	mov    -0x4(%edi),%eax
c01079ce:	83 e0 01             	and    $0x1,%eax
c01079d1:	09 d8                	or     %ebx,%eax
c01079d3:	89 47 fc             	mov    %eax,-0x4(%edi)
c01079d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01079d9:	89 04 24             	mov    %eax,(%esp)
c01079dc:	e8 2f d8 ff ff       	call   c0105210 <__malloc_unlock>
c01079e1:	89 f8                	mov    %edi,%eax
c01079e3:	e9 ef fd ff ff       	jmp    c01077d7 <_realloc_r+0x187>
c01079e8:	89 0c 24             	mov    %ecx,(%esp)
c01079eb:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01079ef:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01079f3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01079f6:	e8 c5 fb ff ff       	call   c01075c0 <memmove>
c01079fb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01079fe:	e9 93 fe ff ff       	jmp    c0107896 <_realloc_r+0x246>
c0107a03:	90                   	nop
c0107a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107a08:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107a0b:	e9 d2 fe ff ff       	jmp    c01078e2 <_realloc_r+0x292>
c0107a10:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107a13:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0107a16:	01 d0                	add    %edx,%eax
c0107a18:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107a1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0107a1e:	83 c0 10             	add    $0x10,%eax
c0107a21:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0107a24:	0f 8c b8 fe ff ff    	jl     c01078e2 <_realloc_r+0x292>
c0107a2a:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107a2d:	83 eb 04             	sub    $0x4,%ebx
c0107a30:	8b 51 08             	mov    0x8(%ecx),%edx
c0107a33:	83 fb 24             	cmp    $0x24,%ebx
c0107a36:	8d 71 08             	lea    0x8(%ecx),%esi
c0107a39:	89 42 0c             	mov    %eax,0xc(%edx)
c0107a3c:	89 50 08             	mov    %edx,0x8(%eax)
c0107a3f:	0f 87 3d 01 00 00    	ja     c0107b82 <_realloc_r+0x532>
c0107a45:	83 fb 13             	cmp    $0x13,%ebx
c0107a48:	89 f0                	mov    %esi,%eax
c0107a4a:	76 1a                	jbe    c0107a66 <_realloc_r+0x416>
c0107a4c:	8b 07                	mov    (%edi),%eax
c0107a4e:	83 fb 1b             	cmp    $0x1b,%ebx
c0107a51:	89 41 08             	mov    %eax,0x8(%ecx)
c0107a54:	8b 47 04             	mov    0x4(%edi),%eax
c0107a57:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107a5a:	0f 87 3d 01 00 00    	ja     c0107b9d <_realloc_r+0x54d>
c0107a60:	8d 41 10             	lea    0x10(%ecx),%eax
c0107a63:	83 c7 08             	add    $0x8,%edi
c0107a66:	8b 17                	mov    (%edi),%edx
c0107a68:	89 10                	mov    %edx,(%eax)
c0107a6a:	8b 57 04             	mov    0x4(%edi),%edx
c0107a6d:	89 50 04             	mov    %edx,0x4(%eax)
c0107a70:	8b 57 08             	mov    0x8(%edi),%edx
c0107a73:	89 50 08             	mov    %edx,0x8(%eax)
c0107a76:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107a79:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0107a7c:	89 d8                	mov    %ebx,%eax
c0107a7e:	29 df                	sub    %ebx,%edi
c0107a80:	01 c8                	add    %ecx,%eax
c0107a82:	83 cf 01             	or     $0x1,%edi
c0107a85:	a3 a8 aa 10 c0       	mov    %eax,0xc010aaa8
c0107a8a:	89 78 04             	mov    %edi,0x4(%eax)
c0107a8d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107a90:	83 e0 01             	and    $0x1,%eax
c0107a93:	09 d8                	or     %ebx,%eax
c0107a95:	89 41 04             	mov    %eax,0x4(%ecx)
c0107a98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107a9b:	89 04 24             	mov    %eax,(%esp)
c0107a9e:	e8 6d d7 ff ff       	call   c0105210 <__malloc_unlock>
c0107aa3:	89 f0                	mov    %esi,%eax
c0107aa5:	e9 2d fd ff ff       	jmp    c01077d7 <_realloc_r+0x187>
c0107aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107ab0:	8b 47 08             	mov    0x8(%edi),%eax
c0107ab3:	83 fb 24             	cmp    $0x24,%ebx
c0107ab6:	89 41 08             	mov    %eax,0x8(%ecx)
c0107ab9:	8b 47 0c             	mov    0xc(%edi),%eax
c0107abc:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107abf:	74 60                	je     c0107b21 <_realloc_r+0x4d1>
c0107ac1:	8d 41 10             	lea    0x10(%ecx),%eax
c0107ac4:	8d 57 10             	lea    0x10(%edi),%edx
c0107ac7:	e9 ba fd ff ff       	jmp    c0107886 <_realloc_r+0x236>
c0107acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107ad0:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0107ad3:	83 e2 fc             	and    $0xfffffffc,%edx
c0107ad6:	01 d3                	add    %edx,%ebx
c0107ad8:	e9 d6 fc ff ff       	jmp    c01077b3 <_realloc_r+0x163>
c0107add:	8d 76 00             	lea    0x0(%esi),%esi
c0107ae0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107ae4:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107ae8:	89 f7                	mov    %esi,%edi
c0107aea:	89 34 24             	mov    %esi,(%esp)
c0107aed:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107af0:	e8 cb fa ff ff       	call   c01075c0 <memmove>
c0107af5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107af8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107afb:	8b 41 04             	mov    0x4(%ecx),%eax
c0107afe:	89 ce                	mov    %ecx,%esi
c0107b00:	e9 ae fc ff ff       	jmp    c01077b3 <_realloc_r+0x163>
c0107b05:	8b 47 08             	mov    0x8(%edi),%eax
c0107b08:	83 fb 24             	cmp    $0x24,%ebx
c0107b0b:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b0e:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b11:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b14:	74 3e                	je     c0107b54 <_realloc_r+0x504>
c0107b16:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b19:	83 c7 10             	add    $0x10,%edi
c0107b1c:	e9 5b fc ff ff       	jmp    c010777c <_realloc_r+0x12c>
c0107b21:	8b 47 10             	mov    0x10(%edi),%eax
c0107b24:	8d 57 18             	lea    0x18(%edi),%edx
c0107b27:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b2a:	8b 5f 14             	mov    0x14(%edi),%ebx
c0107b2d:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b30:	89 59 14             	mov    %ebx,0x14(%ecx)
c0107b33:	e9 4e fd ff ff       	jmp    c0107886 <_realloc_r+0x236>
c0107b38:	8b 47 08             	mov    0x8(%edi),%eax
c0107b3b:	83 fb 24             	cmp    $0x24,%ebx
c0107b3e:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b41:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b44:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b47:	74 22                	je     c0107b6b <_realloc_r+0x51b>
c0107b49:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b4c:	83 c7 10             	add    $0x10,%edi
c0107b4f:	e9 d3 fd ff ff       	jmp    c0107927 <_realloc_r+0x2d7>
c0107b54:	8b 47 10             	mov    0x10(%edi),%eax
c0107b57:	83 c7 18             	add    $0x18,%edi
c0107b5a:	89 41 18             	mov    %eax,0x18(%ecx)
c0107b5d:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107b60:	8d 41 20             	lea    0x20(%ecx),%eax
c0107b63:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107b66:	e9 11 fc ff ff       	jmp    c010777c <_realloc_r+0x12c>
c0107b6b:	8b 47 10             	mov    0x10(%edi),%eax
c0107b6e:	83 c7 18             	add    $0x18,%edi
c0107b71:	89 41 18             	mov    %eax,0x18(%ecx)
c0107b74:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0107b77:	8d 41 20             	lea    0x20(%ecx),%eax
c0107b7a:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c0107b7d:	e9 a5 fd ff ff       	jmp    c0107927 <_realloc_r+0x2d7>
c0107b82:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107b86:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107b8a:	89 34 24             	mov    %esi,(%esp)
c0107b8d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107b90:	e8 2b fa ff ff       	call   c01075c0 <memmove>
c0107b95:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107b98:	e9 d9 fe ff ff       	jmp    c0107a76 <_realloc_r+0x426>
c0107b9d:	8b 47 08             	mov    0x8(%edi),%eax
c0107ba0:	83 fb 24             	cmp    $0x24,%ebx
c0107ba3:	89 41 10             	mov    %eax,0x10(%ecx)
c0107ba6:	8b 47 0c             	mov    0xc(%edi),%eax
c0107ba9:	89 41 14             	mov    %eax,0x14(%ecx)
c0107bac:	74 1d                	je     c0107bcb <_realloc_r+0x57b>
c0107bae:	8d 41 18             	lea    0x18(%ecx),%eax
c0107bb1:	83 c7 10             	add    $0x10,%edi
c0107bb4:	e9 ad fe ff ff       	jmp    c0107a66 <_realloc_r+0x416>
c0107bb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107bbc:	89 04 24             	mov    %eax,(%esp)
c0107bbf:	e8 4c d6 ff ff       	call   c0105210 <__malloc_unlock>
c0107bc4:	31 c0                	xor    %eax,%eax
c0107bc6:	e9 0c fc ff ff       	jmp    c01077d7 <_realloc_r+0x187>
c0107bcb:	8b 47 10             	mov    0x10(%edi),%eax
c0107bce:	83 c7 18             	add    $0x18,%edi
c0107bd1:	89 41 18             	mov    %eax,0x18(%ecx)
c0107bd4:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107bd7:	8d 41 20             	lea    0x20(%ecx),%eax
c0107bda:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107bdd:	e9 84 fe ff ff       	jmp    c0107a66 <_realloc_r+0x416>
c0107be2:	66 90                	xchg   %ax,%ax
c0107be4:	66 90                	xchg   %ax,%ax
c0107be6:	66 90                	xchg   %ax,%ax
c0107be8:	66 90                	xchg   %ax,%ax
c0107bea:	66 90                	xchg   %ax,%ax
c0107bec:	66 90                	xchg   %ax,%ax
c0107bee:	66 90                	xchg   %ax,%ax

c0107bf0 <cleanup_glue>:
c0107bf0:	55                   	push   %ebp
c0107bf1:	89 e5                	mov    %esp,%ebp
c0107bf3:	56                   	push   %esi
c0107bf4:	53                   	push   %ebx
c0107bf5:	83 ec 10             	sub    $0x10,%esp
c0107bf8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0107bfb:	8b 75 08             	mov    0x8(%ebp),%esi
c0107bfe:	8b 03                	mov    (%ebx),%eax
c0107c00:	85 c0                	test   %eax,%eax
c0107c02:	74 0c                	je     c0107c10 <cleanup_glue+0x20>
c0107c04:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c08:	89 34 24             	mov    %esi,(%esp)
c0107c0b:	e8 e0 ff ff ff       	call   c0107bf0 <cleanup_glue>
c0107c10:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0107c13:	89 75 08             	mov    %esi,0x8(%ebp)
c0107c16:	83 c4 10             	add    $0x10,%esp
c0107c19:	5b                   	pop    %ebx
c0107c1a:	5e                   	pop    %esi
c0107c1b:	5d                   	pop    %ebp
c0107c1c:	e9 3f f7 ff ff       	jmp    c0107360 <_free_r>
c0107c21:	eb 0d                	jmp    c0107c30 <_reclaim_reent>
c0107c23:	90                   	nop
c0107c24:	90                   	nop
c0107c25:	90                   	nop
c0107c26:	90                   	nop
c0107c27:	90                   	nop
c0107c28:	90                   	nop
c0107c29:	90                   	nop
c0107c2a:	90                   	nop
c0107c2b:	90                   	nop
c0107c2c:	90                   	nop
c0107c2d:	90                   	nop
c0107c2e:	90                   	nop
c0107c2f:	90                   	nop

c0107c30 <_reclaim_reent>:
c0107c30:	55                   	push   %ebp
c0107c31:	89 e5                	mov    %esp,%ebp
c0107c33:	57                   	push   %edi
c0107c34:	56                   	push   %esi
c0107c35:	53                   	push   %ebx
c0107c36:	83 ec 1c             	sub    $0x1c,%esp
c0107c39:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107c3c:	3b 1d a0 a5 10 c0    	cmp    0xc010a5a0,%ebx
c0107c42:	0f 84 a6 00 00 00    	je     c0107cee <_reclaim_reent+0xbe>
c0107c48:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107c4b:	85 d2                	test   %edx,%edx
c0107c4d:	74 46                	je     c0107c95 <_reclaim_reent+0x65>
c0107c4f:	31 c0                	xor    %eax,%eax
c0107c51:	31 f6                	xor    %esi,%esi
c0107c53:	90                   	nop
c0107c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107c58:	8b 04 82             	mov    (%edx,%eax,4),%eax
c0107c5b:	85 c0                	test   %eax,%eax
c0107c5d:	75 0b                	jne    c0107c6a <_reclaim_reent+0x3a>
c0107c5f:	eb 1e                	jmp    c0107c7f <_reclaim_reent+0x4f>
c0107c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107c68:	89 f8                	mov    %edi,%eax
c0107c6a:	8b 38                	mov    (%eax),%edi
c0107c6c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c70:	89 1c 24             	mov    %ebx,(%esp)
c0107c73:	e8 e8 f6 ff ff       	call   c0107360 <_free_r>
c0107c78:	85 ff                	test   %edi,%edi
c0107c7a:	75 ec                	jne    c0107c68 <_reclaim_reent+0x38>
c0107c7c:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107c7f:	83 c6 01             	add    $0x1,%esi
c0107c82:	83 fe 20             	cmp    $0x20,%esi
c0107c85:	89 f0                	mov    %esi,%eax
c0107c87:	75 cf                	jne    c0107c58 <_reclaim_reent+0x28>
c0107c89:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107c8d:	89 1c 24             	mov    %ebx,(%esp)
c0107c90:	e8 cb f6 ff ff       	call   c0107360 <_free_r>
c0107c95:	8b 43 40             	mov    0x40(%ebx),%eax
c0107c98:	85 c0                	test   %eax,%eax
c0107c9a:	74 0c                	je     c0107ca8 <_reclaim_reent+0x78>
c0107c9c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ca0:	89 1c 24             	mov    %ebx,(%esp)
c0107ca3:	e8 b8 f6 ff ff       	call   c0107360 <_free_r>
c0107ca8:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c0107cae:	85 c0                	test   %eax,%eax
c0107cb0:	74 22                	je     c0107cd4 <_reclaim_reent+0xa4>
c0107cb2:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0107cb8:	39 f0                	cmp    %esi,%eax
c0107cba:	75 06                	jne    c0107cc2 <_reclaim_reent+0x92>
c0107cbc:	eb 16                	jmp    c0107cd4 <_reclaim_reent+0xa4>
c0107cbe:	66 90                	xchg   %ax,%ax
c0107cc0:	89 f8                	mov    %edi,%eax
c0107cc2:	8b 38                	mov    (%eax),%edi
c0107cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107cc8:	89 1c 24             	mov    %ebx,(%esp)
c0107ccb:	e8 90 f6 ff ff       	call   c0107360 <_free_r>
c0107cd0:	39 fe                	cmp    %edi,%esi
c0107cd2:	75 ec                	jne    c0107cc0 <_reclaim_reent+0x90>
c0107cd4:	8b 43 54             	mov    0x54(%ebx),%eax
c0107cd7:	85 c0                	test   %eax,%eax
c0107cd9:	74 0c                	je     c0107ce7 <_reclaim_reent+0xb7>
c0107cdb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107cdf:	89 1c 24             	mov    %ebx,(%esp)
c0107ce2:	e8 79 f6 ff ff       	call   c0107360 <_free_r>
c0107ce7:	8b 43 38             	mov    0x38(%ebx),%eax
c0107cea:	85 c0                	test   %eax,%eax
c0107cec:	75 08                	jne    c0107cf6 <_reclaim_reent+0xc6>
c0107cee:	83 c4 1c             	add    $0x1c,%esp
c0107cf1:	5b                   	pop    %ebx
c0107cf2:	5e                   	pop    %esi
c0107cf3:	5f                   	pop    %edi
c0107cf4:	5d                   	pop    %ebp
c0107cf5:	c3                   	ret    
c0107cf6:	89 1c 24             	mov    %ebx,(%esp)
c0107cf9:	ff 53 3c             	call   *0x3c(%ebx)
c0107cfc:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0107d02:	85 c0                	test   %eax,%eax
c0107d04:	74 e8                	je     c0107cee <_reclaim_reent+0xbe>
c0107d06:	89 1c 24             	mov    %ebx,(%esp)
c0107d09:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107d0d:	e8 de fe ff ff       	call   c0107bf0 <cleanup_glue>
c0107d12:	83 c4 1c             	add    $0x1c,%esp
c0107d15:	5b                   	pop    %ebx
c0107d16:	5e                   	pop    %esi
c0107d17:	5f                   	pop    %edi
c0107d18:	5d                   	pop    %ebp
c0107d19:	c3                   	ret    
