
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
c010002b:	e9 00 04 00 00       	jmp    c0100430 <init>

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
c0100066:	e8 75 0b 00 00       	call   c0100be0 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 7e 0b 00 00       	call   c0100bf0 <get_ucr3>
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
c01000d7:	a1 00 20 10 c0       	mov    0xc0102000,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 00 20 10 c0       	mov    %eax,0xc0102000
c01000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
c01000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
c0100102:	74 54                	je     c0100158 <mm_malloc+0x108>
c0100104:	89 d8                	mov    %ebx,%eax
c0100106:	c1 e8 16             	shr    $0x16,%eax
c0100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
c010010c:	f6 01 01             	testb  $0x1,(%ecx)
c010010f:	75 a7                	jne    c01000b8 <mm_malloc+0x68>
c0100111:	a1 00 30 10 c0       	mov    0xc0103000,%eax
c0100116:	89 c6                	mov    %eax,%esi
c0100118:	83 c0 01             	add    $0x1,%eax
c010011b:	c1 e6 0c             	shl    $0xc,%esi
c010011e:	81 c6 00 40 10 c0    	add    $0xc0104000,%esi
c0100124:	a3 00 30 10 c0       	mov    %eax,0xc0103000
c0100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
c010012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100134:	83 c8 07             	or     $0x7,%eax
c0100137:	89 01                	mov    %eax,(%ecx)
c0100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100140:	00 
c0100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100148:	00 
c0100149:	89 34 24             	mov    %esi,(%esp)
c010014c:	e8 b7 12 00 00       	call   c0101408 <memset>
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
c0100178:	c7 44 24 10 b4 14 10 	movl   $0xc01014b4,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 18 15 10 	movl   $0xc0101518,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 a3 14 10 	movl   $0xc01014a3,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 c4 14 10 c0 	movl   $0xc01014c4,(%esp)
c010019f:	e8 6c 0d 00 00       	call   c0100f10 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 bc 14 10 	movl   $0xc01014bc,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 18 15 10 	movl   $0xc0101518,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 a3 14 10 	movl   $0xc01014a3,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 c4 14 10 c0 	movl   $0xc01014c4,(%esp)
c01001ee:	e8 1d 0d 00 00       	call   c0100f10 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 b4 14 10 	movl   $0xc01014b4,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 18 15 10 	movl   $0xc0101518,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 a3 14 10 	movl   $0xc01014a3,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 c4 14 10 c0 	movl   $0xc01014c4,(%esp)
c010022e:	e8 dd 0c 00 00       	call   c0100f10 <printk>
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
c0100258:	c7 44 24 10 bc 14 10 	movl   $0xc01014bc,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 18 15 10 	movl   $0xc0101518,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 a3 14 10 	movl   $0xc01014a3,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 c4 14 10 c0 	movl   $0xc01014c4,(%esp)
c010027f:	e8 8c 0c 00 00       	call   c0100f10 <printk>
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
c01002a8:	c7 44 24 10 90 14 10 	movl   $0xc0101490,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 0e 15 10 	movl   $0xc010150e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 a3 14 10 	movl   $0xc01014a3,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 c4 14 10 c0 	movl   $0xc01014c4,(%esp)
c01002cf:	e8 3c 0c 00 00       	call   c0100f10 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 00 20 10 c0       	mov    0xc0102000,%eax
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
c010039a:	e8 01 02 00 00       	call   c01005a0 <irq_handle>
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
c01003b7:	e8 64 09 00 00       	call   c0100d20 <init_segment>
c01003bc:	e8 5f 03 00 00       	call   c0100720 <init_idt>
c01003c1:	e8 6a 08 00 00       	call   c0100c30 <init_mm>
c01003c6:	68 af 15 10 c0       	push   $0xc01015af
c01003cb:	6a 4a                	push   $0x4a
c01003cd:	68 1e 15 10 c0       	push   $0xc010151e
c01003d2:	68 30 15 10 c0       	push   $0xc0101530
c01003d7:	e8 34 0b 00 00       	call   c0100f10 <printk>
c01003dc:	e8 6f 07 00 00       	call   c0100b50 <video_mapping_write_test>
c01003e1:	e8 ea 09 00 00       	call   c0100dd0 <loader>
c01003e6:	89 c3                	mov    %eax,%ebx
c01003e8:	e8 83 07 00 00       	call   c0100b70 <video_mapping_read_test>
c01003ed:	e8 ce 07 00 00       	call   c0100bc0 <video_mapping_clear>
c01003f2:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003f7:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003fc:	83 ec 10             	sub    $0x10,%esp
c01003ff:	ff d3                	call   *%ebx
c0100401:	68 af 15 10 c0       	push   $0xc01015af
c0100406:	6a 6b                	push   $0x6b
c0100408:	68 1e 15 10 c0       	push   $0xc010151e
c010040d:	68 64 15 10 c0       	push   $0xc0101564
c0100412:	e8 f9 0a 00 00       	call   c0100f10 <printk>
c0100417:	b8 01 00 00 00       	mov    $0x1,%eax
c010041c:	d6                   	(bad)  
c010041d:	83 c4 20             	add    $0x20,%esp
c0100420:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100423:	c9                   	leave  
c0100424:	c3                   	ret    
c0100425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100430 <init>:
c0100430:	55                   	push   %ebp
c0100431:	89 e5                	mov    %esp,%ebp
c0100433:	83 ec 08             	sub    $0x8,%esp
c0100436:	e8 65 08 00 00       	call   c0100ca0 <init_page>
c010043b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100441:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100446:	ff e0                	jmp    *%eax
c0100448:	68 b9 15 10 c0       	push   $0xc01015b9
c010044d:	6a 24                	push   $0x24
c010044f:	68 1e 15 10 c0       	push   $0xc010151e
c0100454:	68 64 15 10 c0       	push   $0xc0101564
c0100459:	e8 b2 0a 00 00       	call   c0100f10 <printk>
c010045e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100463:	d6                   	(bad)  
c0100464:	83 c4 10             	add    $0x10,%esp
c0100467:	c9                   	leave  
c0100468:	c3                   	ret    
c0100469:	66 90                	xchg   %ax,%ax
c010046b:	66 90                	xchg   %ax,%ax
c010046d:	66 90                	xchg   %ax,%ax
c010046f:	90                   	nop

c0100470 <do_syscall>:
c0100470:	55                   	push   %ebp
c0100471:	89 e5                	mov    %esp,%ebp
c0100473:	53                   	push   %ebx
c0100474:	83 ec 04             	sub    $0x4,%esp
c0100477:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010047a:	8b 43 08             	mov    0x8(%ebx),%eax
c010047d:	85 c0                	test   %eax,%eax
c010047f:	74 4f                	je     c01004d0 <do_syscall+0x60>
c0100481:	83 f8 2d             	cmp    $0x2d,%eax
c0100484:	74 2a                	je     c01004b0 <do_syscall+0x40>
c0100486:	83 ec 0c             	sub    $0xc,%esp
c0100489:	50                   	push   %eax
c010048a:	68 34 16 10 c0       	push   $0xc0101634
c010048f:	6a 20                	push   $0x20
c0100491:	68 c0 15 10 c0       	push   $0xc01015c0
c0100496:	68 e0 15 10 c0       	push   $0xc01015e0
c010049b:	e8 70 0a 00 00       	call   c0100f10 <printk>
c01004a0:	b8 01 00 00 00       	mov    $0x1,%eax
c01004a5:	d6                   	(bad)  
c01004a6:	83 c4 20             	add    $0x20,%esp
c01004a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004ac:	c9                   	leave  
c01004ad:	c3                   	ret    
c01004ae:	66 90                	xchg   %ax,%ax
c01004b0:	83 ec 0c             	sub    $0xc,%esp
c01004b3:	ff 73 04             	pushl  0x4(%ebx)
c01004b6:	e8 45 07 00 00       	call   c0100c00 <mm_brk>
c01004bb:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c01004c2:	83 c4 10             	add    $0x10,%esp
c01004c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004c8:	c9                   	leave  
c01004c9:	c3                   	ret    
c01004ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004d0:	fa                   	cli    
c01004d1:	83 ec 08             	sub    $0x8,%esp
c01004d4:	ff 73 1c             	pushl  0x1c(%ebx)
c01004d7:	ff 73 04             	pushl  0x4(%ebx)
c01004da:	e8 11 00 00 00       	call   c01004f0 <add_irq_handle>
c01004df:	fb                   	sti    
c01004e0:	83 c4 10             	add    $0x10,%esp
c01004e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004e6:	c9                   	leave  
c01004e7:	c3                   	ret    
c01004e8:	66 90                	xchg   %ax,%ax
c01004ea:	66 90                	xchg   %ax,%ax
c01004ec:	66 90                	xchg   %ax,%ax
c01004ee:	66 90                	xchg   %ax,%ax

c01004f0 <add_irq_handle>:
c01004f0:	55                   	push   %ebp
c01004f1:	89 e5                	mov    %esp,%ebp
c01004f3:	53                   	push   %ebx
c01004f4:	83 ec 04             	sub    $0x4,%esp
c01004f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01004fa:	83 fb 0f             	cmp    $0xf,%ebx
c01004fd:	7f 71                	jg     c0100570 <add_irq_handle+0x80>
c01004ff:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100504:	83 f8 20             	cmp    $0x20,%eax
c0100507:	7e 2c                	jle    c0100535 <add_irq_handle+0x45>
c0100509:	83 ec 0c             	sub    $0xc,%esp
c010050c:	68 6e 16 10 c0       	push   $0xc010166e
c0100511:	68 bd 17 10 c0       	push   $0xc01017bd
c0100516:	6a 16                	push   $0x16
c0100518:	68 52 16 10 c0       	push   $0xc0101652
c010051d:	68 c4 14 10 c0       	push   $0xc01014c4
c0100522:	e8 e9 09 00 00       	call   c0100f10 <printk>
c0100527:	b8 01 00 00 00       	mov    $0x1,%eax
c010052c:	d6                   	(bad)  
c010052d:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100532:	83 c4 20             	add    $0x20,%esp
c0100535:	8d 50 01             	lea    0x1(%eax),%edx
c0100538:	89 15 00 40 12 c0    	mov    %edx,0xc0124000
c010053e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100541:	89 14 c5 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,8)
c0100548:	8b 14 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%edx
c010054f:	89 14 c5 84 40 12 c0 	mov    %edx,-0x3fedbf7c(,%eax,8)
c0100556:	8d 04 c5 80 40 12 c0 	lea    -0x3fedbf80(,%eax,8),%eax
c010055d:	89 04 9d 40 40 12 c0 	mov    %eax,-0x3fedbfc0(,%ebx,4)
c0100564:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100567:	c9                   	leave  
c0100568:	c3                   	ret    
c0100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100570:	83 ec 0c             	sub    $0xc,%esp
c0100573:	68 3f 16 10 c0       	push   $0xc010163f
c0100578:	68 bd 17 10 c0       	push   $0xc01017bd
c010057d:	6a 15                	push   $0x15
c010057f:	68 52 16 10 c0       	push   $0xc0101652
c0100584:	68 c4 14 10 c0       	push   $0xc01014c4
c0100589:	e8 82 09 00 00       	call   c0100f10 <printk>
c010058e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100593:	d6                   	(bad)  
c0100594:	83 c4 20             	add    $0x20,%esp
c0100597:	e9 63 ff ff ff       	jmp    c01004ff <add_irq_handle+0xf>
c010059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01005a0 <irq_handle>:
c01005a0:	55                   	push   %ebp
c01005a1:	89 e5                	mov    %esp,%ebp
c01005a3:	53                   	push   %ebx
c01005a4:	83 ec 04             	sub    $0x4,%esp
c01005a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01005aa:	68 b2 17 10 c0       	push   $0xc01017b2
c01005af:	6a 24                	push   $0x24
c01005b1:	68 52 16 10 c0       	push   $0xc0101652
c01005b6:	68 a4 16 10 c0       	push   $0xc01016a4
c01005bb:	e8 50 09 00 00       	call   c0100f10 <printk>
c01005c0:	b8 01 00 00 00       	mov    $0x1,%eax
c01005c5:	d6                   	(bad)  
c01005c6:	8b 43 30             	mov    0x30(%ebx),%eax
c01005c9:	83 c4 10             	add    $0x10,%esp
c01005cc:	85 c0                	test   %eax,%eax
c01005ce:	0f 88 9c 00 00 00    	js     c0100670 <irq_handle+0xd0>
c01005d4:	3d 80 00 00 00       	cmp    $0x80,%eax
c01005d9:	0f 84 b9 00 00 00    	je     c0100698 <irq_handle+0xf8>
c01005df:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01005e4:	7e 5a                	jle    c0100640 <irq_handle+0xa0>
c01005e6:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c01005ec:	83 fb 0f             	cmp    $0xf,%ebx
c01005ef:	7f 1f                	jg     c0100610 <irq_handle+0x70>
c01005f1:	8b 1c 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%ebx
c01005f8:	85 db                	test   %ebx,%ebx
c01005fa:	74 0d                	je     c0100609 <irq_handle+0x69>
c01005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100600:	ff 13                	call   *(%ebx)
c0100602:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100605:	85 db                	test   %ebx,%ebx
c0100607:	75 f7                	jne    c0100600 <irq_handle+0x60>
c0100609:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010060c:	c9                   	leave  
c010060d:	c3                   	ret    
c010060e:	66 90                	xchg   %ax,%ax
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 8c 16 10 c0       	push   $0xc010168c
c0100618:	68 b2 17 10 c0       	push   $0xc01017b2
c010061d:	6a 30                	push   $0x30
c010061f:	68 52 16 10 c0       	push   $0xc0101652
c0100624:	68 c4 14 10 c0       	push   $0xc01014c4
c0100629:	e8 e2 08 00 00       	call   c0100f10 <printk>
c010062e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100633:	d6                   	(bad)  
c0100634:	83 c4 20             	add    $0x20,%esp
c0100637:	eb b8                	jmp    c01005f1 <irq_handle+0x51>
c0100639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100640:	83 ec 08             	sub    $0x8,%esp
c0100643:	ff 73 0c             	pushl  0xc(%ebx)
c0100646:	50                   	push   %eax
c0100647:	68 b2 17 10 c0       	push   $0xc01017b2
c010064c:	6a 2d                	push   $0x2d
c010064e:	68 52 16 10 c0       	push   $0xc0101652
c0100653:	68 58 17 10 c0       	push   $0xc0101758
c0100658:	e8 b3 08 00 00       	call   c0100f10 <printk>
c010065d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100662:	d6                   	(bad)  
c0100663:	83 c4 20             	add    $0x20,%esp
c0100666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100669:	c9                   	leave  
c010066a:	c3                   	ret    
c010066b:	90                   	nop
c010066c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100670:	68 b2 17 10 c0       	push   $0xc01017b2
c0100675:	6a 29                	push   $0x29
c0100677:	68 52 16 10 c0       	push   $0xc0101652
c010067c:	68 0c 17 10 c0       	push   $0xc010170c
c0100681:	e8 8a 08 00 00       	call   c0100f10 <printk>
c0100686:	b8 01 00 00 00       	mov    $0x1,%eax
c010068b:	d6                   	(bad)  
c010068c:	83 c4 10             	add    $0x10,%esp
c010068f:	e9 75 ff ff ff       	jmp    c0100609 <irq_handle+0x69>
c0100694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100698:	89 5d 08             	mov    %ebx,0x8(%ebp)
c010069b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010069e:	c9                   	leave  
c010069f:	e9 cc fd ff ff       	jmp    c0100470 <do_syscall>
c01006a4:	66 90                	xchg   %ax,%ax
c01006a6:	66 90                	xchg   %ax,%ax
c01006a8:	66 90                	xchg   %ax,%ax
c01006aa:	66 90                	xchg   %ax,%ax
c01006ac:	66 90                	xchg   %ax,%ax
c01006ae:	66 90                	xchg   %ax,%ax

c01006b0 <init_i8259>:
c01006b0:	55                   	push   %ebp
c01006b1:	ba 21 00 00 00       	mov    $0x21,%edx
c01006b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01006bb:	89 e5                	mov    %esp,%ebp
c01006bd:	ee                   	out    %al,(%dx)
c01006be:	b2 a1                	mov    $0xa1,%dl
c01006c0:	ee                   	out    %al,(%dx)
c01006c1:	b8 11 00 00 00       	mov    $0x11,%eax
c01006c6:	b2 20                	mov    $0x20,%dl
c01006c8:	ee                   	out    %al,(%dx)
c01006c9:	b8 20 00 00 00       	mov    $0x20,%eax
c01006ce:	b2 21                	mov    $0x21,%dl
c01006d0:	ee                   	out    %al,(%dx)
c01006d1:	b8 04 00 00 00       	mov    $0x4,%eax
c01006d6:	ee                   	out    %al,(%dx)
c01006d7:	b8 03 00 00 00       	mov    $0x3,%eax
c01006dc:	ee                   	out    %al,(%dx)
c01006dd:	b8 11 00 00 00       	mov    $0x11,%eax
c01006e2:	b2 a0                	mov    $0xa0,%dl
c01006e4:	ee                   	out    %al,(%dx)
c01006e5:	b8 28 00 00 00       	mov    $0x28,%eax
c01006ea:	b2 a1                	mov    $0xa1,%dl
c01006ec:	ee                   	out    %al,(%dx)
c01006ed:	b8 02 00 00 00       	mov    $0x2,%eax
c01006f2:	ee                   	out    %al,(%dx)
c01006f3:	b8 03 00 00 00       	mov    $0x3,%eax
c01006f8:	ee                   	out    %al,(%dx)
c01006f9:	b8 68 00 00 00       	mov    $0x68,%eax
c01006fe:	b2 20                	mov    $0x20,%dl
c0100700:	ee                   	out    %al,(%dx)
c0100701:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100706:	ee                   	out    %al,(%dx)
c0100707:	b8 68 00 00 00       	mov    $0x68,%eax
c010070c:	b2 a0                	mov    $0xa0,%dl
c010070e:	ee                   	out    %al,(%dx)
c010070f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100714:	ee                   	out    %al,(%dx)
c0100715:	5d                   	pop    %ebp
c0100716:	c3                   	ret    
c0100717:	66 90                	xchg   %ax,%ax
c0100719:	66 90                	xchg   %ax,%ax
c010071b:	66 90                	xchg   %ax,%ax
c010071d:	66 90                	xchg   %ax,%ax
c010071f:	90                   	nop

c0100720 <init_idt>:
c0100720:	55                   	push   %ebp
c0100721:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100726:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c010072b:	89 d1                	mov    %edx,%ecx
c010072d:	c1 ea 10             	shr    $0x10,%edx
c0100730:	89 e5                	mov    %esp,%ebp
c0100732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100738:	66 89 08             	mov    %cx,(%eax)
c010073b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100741:	83 c0 08             	add    $0x8,%eax
c0100744:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100748:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010074c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100750:	3d c0 49 12 c0       	cmp    $0xc01249c0,%eax
c0100755:	75 e1                	jne    c0100738 <init_idt+0x18>
c0100757:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010075c:	ba 08 00 00 00       	mov    $0x8,%edx
c0100761:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100766:	66 a3 c0 41 12 c0    	mov    %ax,0xc01241c0
c010076c:	c1 e8 10             	shr    $0x10,%eax
c010076f:	66 89 15 c2 41 12 c0 	mov    %dx,0xc01241c2
c0100776:	66 a3 c6 41 12 c0    	mov    %ax,0xc01241c6
c010077c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100781:	ba 08 00 00 00       	mov    $0x8,%edx
c0100786:	66 a3 c8 41 12 c0    	mov    %ax,0xc01241c8
c010078c:	c1 e8 10             	shr    $0x10,%eax
c010078f:	66 89 0d ca 41 12 c0 	mov    %cx,0xc01241ca
c0100796:	66 a3 ce 41 12 c0    	mov    %ax,0xc01241ce
c010079c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c01007a1:	66 89 15 d2 41 12 c0 	mov    %dx,0xc01241d2
c01007a8:	66 a3 d0 41 12 c0    	mov    %ax,0xc01241d0
c01007ae:	c1 e8 10             	shr    $0x10,%eax
c01007b1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007b6:	66 a3 d6 41 12 c0    	mov    %ax,0xc01241d6
c01007bc:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c01007c1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007c6:	66 a3 d8 41 12 c0    	mov    %ax,0xc01241d8
c01007cc:	c1 e8 10             	shr    $0x10,%eax
c01007cf:	66 89 0d da 41 12 c0 	mov    %cx,0xc01241da
c01007d6:	66 a3 de 41 12 c0    	mov    %ax,0xc01241de
c01007dc:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c01007e1:	66 89 15 e2 41 12 c0 	mov    %dx,0xc01241e2
c01007e8:	66 a3 e0 41 12 c0    	mov    %ax,0xc01241e0
c01007ee:	c1 e8 10             	shr    $0x10,%eax
c01007f1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007f6:	66 a3 e6 41 12 c0    	mov    %ax,0xc01241e6
c01007fc:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100801:	ba 08 00 00 00       	mov    $0x8,%edx
c0100806:	66 a3 e8 41 12 c0    	mov    %ax,0xc01241e8
c010080c:	c1 e8 10             	shr    $0x10,%eax
c010080f:	66 89 0d ea 41 12 c0 	mov    %cx,0xc01241ea
c0100816:	66 a3 ee 41 12 c0    	mov    %ax,0xc01241ee
c010081c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100821:	66 89 15 f2 41 12 c0 	mov    %dx,0xc01241f2
c0100828:	66 a3 f0 41 12 c0    	mov    %ax,0xc01241f0
c010082e:	c1 e8 10             	shr    $0x10,%eax
c0100831:	c6 05 c4 41 12 c0 00 	movb   $0x0,0xc01241c4
c0100838:	c6 05 c5 41 12 c0 8f 	movb   $0x8f,0xc01241c5
c010083f:	c6 05 cc 41 12 c0 00 	movb   $0x0,0xc01241cc
c0100846:	b9 08 00 00 00       	mov    $0x8,%ecx
c010084b:	c6 05 cd 41 12 c0 8f 	movb   $0x8f,0xc01241cd
c0100852:	c6 05 d4 41 12 c0 00 	movb   $0x0,0xc01241d4
c0100859:	ba 08 00 00 00       	mov    $0x8,%edx
c010085e:	c6 05 d5 41 12 c0 8f 	movb   $0x8f,0xc01241d5
c0100865:	c6 05 dc 41 12 c0 00 	movb   $0x0,0xc01241dc
c010086c:	c6 05 dd 41 12 c0 8f 	movb   $0x8f,0xc01241dd
c0100873:	c6 05 e4 41 12 c0 00 	movb   $0x0,0xc01241e4
c010087a:	c6 05 e5 41 12 c0 8f 	movb   $0x8f,0xc01241e5
c0100881:	c6 05 ec 41 12 c0 00 	movb   $0x0,0xc01241ec
c0100888:	c6 05 ed 41 12 c0 8f 	movb   $0x8f,0xc01241ed
c010088f:	c6 05 f4 41 12 c0 00 	movb   $0x0,0xc01241f4
c0100896:	c6 05 f5 41 12 c0 8f 	movb   $0x8f,0xc01241f5
c010089d:	66 a3 f6 41 12 c0    	mov    %ax,0xc01241f6
c01008a3:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c01008a8:	66 a3 f8 41 12 c0    	mov    %ax,0xc01241f8
c01008ae:	c1 e8 10             	shr    $0x10,%eax
c01008b1:	66 89 0d fa 41 12 c0 	mov    %cx,0xc01241fa
c01008b8:	66 a3 fe 41 12 c0    	mov    %ax,0xc01241fe
c01008be:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c01008c3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008c8:	66 a3 00 42 12 c0    	mov    %ax,0xc0124200
c01008ce:	c1 e8 10             	shr    $0x10,%eax
c01008d1:	66 89 15 02 42 12 c0 	mov    %dx,0xc0124202
c01008d8:	66 a3 06 42 12 c0    	mov    %ax,0xc0124206
c01008de:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c01008e3:	66 89 0d 0a 42 12 c0 	mov    %cx,0xc012420a
c01008ea:	66 a3 08 42 12 c0    	mov    %ax,0xc0124208
c01008f0:	c1 e8 10             	shr    $0x10,%eax
c01008f3:	ba 08 00 00 00       	mov    $0x8,%edx
c01008f8:	66 a3 0e 42 12 c0    	mov    %ax,0xc012420e
c01008fe:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100903:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100908:	66 a3 10 42 12 c0    	mov    %ax,0xc0124210
c010090e:	c1 e8 10             	shr    $0x10,%eax
c0100911:	66 89 15 12 42 12 c0 	mov    %dx,0xc0124212
c0100918:	66 a3 16 42 12 c0    	mov    %ax,0xc0124216
c010091e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100923:	66 89 0d 1a 42 12 c0 	mov    %cx,0xc012421a
c010092a:	66 a3 18 42 12 c0    	mov    %ax,0xc0124218
c0100930:	c1 e8 10             	shr    $0x10,%eax
c0100933:	ba 08 00 00 00       	mov    $0x8,%edx
c0100938:	66 a3 1e 42 12 c0    	mov    %ax,0xc012421e
c010093e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100943:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100948:	66 a3 20 42 12 c0    	mov    %ax,0xc0124220
c010094e:	c1 e8 10             	shr    $0x10,%eax
c0100951:	66 89 15 22 42 12 c0 	mov    %dx,0xc0124222
c0100958:	66 a3 26 42 12 c0    	mov    %ax,0xc0124226
c010095e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100963:	66 89 0d 2a 42 12 c0 	mov    %cx,0xc012422a
c010096a:	66 a3 28 42 12 c0    	mov    %ax,0xc0124228
c0100970:	c1 e8 10             	shr    $0x10,%eax
c0100973:	c6 05 fc 41 12 c0 00 	movb   $0x0,0xc01241fc
c010097a:	c6 05 fd 41 12 c0 8f 	movb   $0x8f,0xc01241fd
c0100981:	c6 05 04 42 12 c0 00 	movb   $0x0,0xc0124204
c0100988:	ba 08 00 00 00       	mov    $0x8,%edx
c010098d:	c6 05 05 42 12 c0 8f 	movb   $0x8f,0xc0124205
c0100994:	c6 05 0c 42 12 c0 00 	movb   $0x0,0xc012420c
c010099b:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009a0:	c6 05 0d 42 12 c0 8f 	movb   $0x8f,0xc012420d
c01009a7:	c6 05 14 42 12 c0 00 	movb   $0x0,0xc0124214
c01009ae:	c6 05 15 42 12 c0 8f 	movb   $0x8f,0xc0124215
c01009b5:	c6 05 1c 42 12 c0 00 	movb   $0x0,0xc012421c
c01009bc:	c6 05 1d 42 12 c0 8f 	movb   $0x8f,0xc012421d
c01009c3:	c6 05 24 42 12 c0 00 	movb   $0x0,0xc0124224
c01009ca:	c6 05 25 42 12 c0 8f 	movb   $0x8f,0xc0124225
c01009d1:	c6 05 2c 42 12 c0 00 	movb   $0x0,0xc012422c
c01009d8:	66 a3 2e 42 12 c0    	mov    %ax,0xc012422e
c01009de:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c01009e3:	66 89 15 32 42 12 c0 	mov    %dx,0xc0124232
c01009ea:	66 a3 30 42 12 c0    	mov    %ax,0xc0124230
c01009f0:	c1 e8 10             	shr    $0x10,%eax
c01009f3:	66 89 0d c2 45 12 c0 	mov    %cx,0xc01245c2
c01009fa:	66 a3 36 42 12 c0    	mov    %ax,0xc0124236
c0100a00:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100a05:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a0a:	66 a3 c0 45 12 c0    	mov    %ax,0xc01245c0
c0100a10:	c1 e8 10             	shr    $0x10,%eax
c0100a13:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a18:	66 a3 c6 45 12 c0    	mov    %ax,0xc01245c6
c0100a1e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a23:	c6 05 2d 42 12 c0 8f 	movb   $0x8f,0xc012422d
c0100a2a:	66 a3 c0 42 12 c0    	mov    %ax,0xc01242c0
c0100a30:	c1 e8 10             	shr    $0x10,%eax
c0100a33:	c6 05 34 42 12 c0 00 	movb   $0x0,0xc0124234
c0100a3a:	66 a3 c6 42 12 c0    	mov    %ax,0xc01242c6
c0100a40:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a45:	c6 05 35 42 12 c0 8f 	movb   $0x8f,0xc0124235
c0100a4c:	66 a3 30 43 12 c0    	mov    %ax,0xc0124330
c0100a52:	c1 e8 10             	shr    $0x10,%eax
c0100a55:	c6 05 c4 45 12 c0 00 	movb   $0x0,0xc01245c4
c0100a5c:	66 a3 36 43 12 c0    	mov    %ax,0xc0124336
c0100a62:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100a67:	c6 05 c5 45 12 c0 ef 	movb   $0xef,0xc01245c5
c0100a6e:	66 a3 80 41 12 c0    	mov    %ax,0xc0124180
c0100a74:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c0100a79:	66 89 15 c2 42 12 c0 	mov    %dx,0xc01242c2
c0100a80:	66 a3 82 41 12 c0    	mov    %ax,0xc0124182
c0100a86:	c1 e8 10             	shr    $0x10,%eax
c0100a89:	c6 05 c4 42 12 c0 00 	movb   $0x0,0xc01242c4
c0100a90:	66 a3 84 41 12 c0    	mov    %ax,0xc0124184
c0100a96:	c6 05 c5 42 12 c0 8e 	movb   $0x8e,0xc01242c5
c0100a9d:	b8 80 41 12 c0       	mov    $0xc0124180,%eax
c0100aa2:	66 89 0d 32 43 12 c0 	mov    %cx,0xc0124332
c0100aa9:	c6 05 34 43 12 c0 00 	movb   $0x0,0xc0124334
c0100ab0:	c6 05 35 43 12 c0 8e 	movb   $0x8e,0xc0124335
c0100ab7:	0f 01 18             	lidtl  (%eax)
c0100aba:	5d                   	pop    %ebp
c0100abb:	c3                   	ret    
c0100abc:	66 90                	xchg   %ax,%ax
c0100abe:	66 90                	xchg   %ax,%ax

c0100ac0 <create_video_mapping>:
c0100ac0:	55                   	push   %ebp
c0100ac1:	89 e5                	mov    %esp,%ebp
c0100ac3:	53                   	push   %ebx
c0100ac4:	83 ec 04             	sub    $0x4,%esp
c0100ac7:	e8 14 01 00 00       	call   c0100be0 <get_updir>
c0100acc:	89 c3                	mov    %eax,%ebx
c0100ace:	e8 0d 01 00 00       	call   c0100be0 <get_updir>
c0100ad3:	39 c3                	cmp    %eax,%ebx
c0100ad5:	74 27                	je     c0100afe <create_video_mapping+0x3e>
c0100ad7:	83 ec 0c             	sub    $0xc,%esp
c0100ada:	68 cc 17 10 c0       	push   $0xc01017cc
c0100adf:	68 2f 18 10 c0       	push   $0xc010182f
c0100ae4:	6a 19                	push   $0x19
c0100ae6:	68 f2 17 10 c0       	push   $0xc01017f2
c0100aeb:	68 c4 14 10 c0       	push   $0xc01014c4
c0100af0:	e8 1b 04 00 00       	call   c0100f10 <printk>
c0100af5:	b8 01 00 00 00       	mov    $0x1,%eax
c0100afa:	d6                   	(bad)  
c0100afb:	83 c4 20             	add    $0x20,%esp
c0100afe:	ba 00 50 12 00       	mov    $0x125000,%edx
c0100b03:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100b08:	b8 80 52 12 c0       	mov    $0xc0125280,%eax
c0100b0d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b13:	83 ca 07             	or     $0x7,%edx
c0100b16:	89 13                	mov    %edx,(%ebx)
c0100b18:	90                   	nop
c0100b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b20:	89 ca                	mov    %ecx,%edx
c0100b22:	83 c0 04             	add    $0x4,%eax
c0100b25:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b2b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b31:	83 ca 07             	or     $0x7,%edx
c0100b34:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b37:	3d c0 52 12 c0       	cmp    $0xc01252c0,%eax
c0100b3c:	75 e2                	jne    c0100b20 <create_video_mapping+0x60>
c0100b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b41:	c9                   	leave  
c0100b42:	c3                   	ret    
c0100b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b50 <video_mapping_write_test>:
c0100b50:	55                   	push   %ebp
c0100b51:	31 c0                	xor    %eax,%eax
c0100b53:	89 e5                	mov    %esp,%ebp
c0100b55:	8d 76 00             	lea    0x0(%esi),%esi
c0100b58:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100b5f:	83 c0 01             	add    $0x1,%eax
c0100b62:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100b67:	75 ef                	jne    c0100b58 <video_mapping_write_test+0x8>
c0100b69:	5d                   	pop    %ebp
c0100b6a:	c3                   	ret    
c0100b6b:	90                   	nop
c0100b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100b70 <video_mapping_read_test>:
c0100b70:	55                   	push   %ebp
c0100b71:	89 e5                	mov    %esp,%ebp
c0100b73:	56                   	push   %esi
c0100b74:	be 01 00 00 00       	mov    $0x1,%esi
c0100b79:	53                   	push   %ebx
c0100b7a:	31 db                	xor    %ebx,%ebx
c0100b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b80:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100b87:	74 24                	je     c0100bad <video_mapping_read_test+0x3d>
c0100b89:	83 ec 0c             	sub    $0xc,%esp
c0100b8c:	68 0b 18 10 c0       	push   $0xc010180b
c0100b91:	68 17 18 10 c0       	push   $0xc0101817
c0100b96:	6a 30                	push   $0x30
c0100b98:	68 f2 17 10 c0       	push   $0xc01017f2
c0100b9d:	68 c4 14 10 c0       	push   $0xc01014c4
c0100ba2:	e8 69 03 00 00       	call   c0100f10 <printk>
c0100ba7:	89 f0                	mov    %esi,%eax
c0100ba9:	d6                   	(bad)  
c0100baa:	83 c4 20             	add    $0x20,%esp
c0100bad:	83 c3 01             	add    $0x1,%ebx
c0100bb0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100bb6:	75 c8                	jne    c0100b80 <video_mapping_read_test+0x10>
c0100bb8:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100bbb:	5b                   	pop    %ebx
c0100bbc:	5e                   	pop    %esi
c0100bbd:	5d                   	pop    %ebp
c0100bbe:	c3                   	ret    
c0100bbf:	90                   	nop

c0100bc0 <video_mapping_clear>:
c0100bc0:	55                   	push   %ebp
c0100bc1:	89 e5                	mov    %esp,%ebp
c0100bc3:	83 ec 0c             	sub    $0xc,%esp
c0100bc6:	68 00 fa 00 00       	push   $0xfa00
c0100bcb:	6a 00                	push   $0x0
c0100bcd:	68 00 00 0a 00       	push   $0xa0000
c0100bd2:	e8 31 08 00 00       	call   c0101408 <memset>
c0100bd7:	83 c4 10             	add    $0x10,%esp
c0100bda:	c9                   	leave  
c0100bdb:	c3                   	ret    
c0100bdc:	66 90                	xchg   %ax,%ax
c0100bde:	66 90                	xchg   %ax,%ax

c0100be0 <get_updir>:
c0100be0:	55                   	push   %ebp
c0100be1:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100be6:	89 e5                	mov    %esp,%ebp
c0100be8:	5d                   	pop    %ebp
c0100be9:	c3                   	ret    
c0100bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100bf0 <get_ucr3>:
c0100bf0:	55                   	push   %ebp
c0100bf1:	a1 04 60 12 c0       	mov    0xc0126004,%eax
c0100bf6:	89 e5                	mov    %esp,%ebp
c0100bf8:	5d                   	pop    %ebp
c0100bf9:	c3                   	ret    
c0100bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c00 <mm_brk>:
c0100c00:	55                   	push   %ebp
c0100c01:	89 e5                	mov    %esp,%ebp
c0100c03:	53                   	push   %ebx
c0100c04:	83 ec 04             	sub    $0x4,%esp
c0100c07:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100c0a:	a1 00 60 12 c0       	mov    0xc0126000,%eax
c0100c0f:	39 d8                	cmp    %ebx,%eax
c0100c11:	73 11                	jae    c0100c24 <mm_brk+0x24>
c0100c13:	89 da                	mov    %ebx,%edx
c0100c15:	83 ec 08             	sub    $0x8,%esp
c0100c18:	29 c2                	sub    %eax,%edx
c0100c1a:	52                   	push   %edx
c0100c1b:	50                   	push   %eax
c0100c1c:	e8 2f f4 ff ff       	call   c0100050 <mm_malloc>
c0100c21:	83 c4 10             	add    $0x10,%esp
c0100c24:	89 1d 00 60 12 c0    	mov    %ebx,0xc0126000
c0100c2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c2d:	c9                   	leave  
c0100c2e:	c3                   	ret    
c0100c2f:	90                   	nop

c0100c30 <init_mm>:
c0100c30:	55                   	push   %ebp
c0100c31:	89 e5                	mov    %esp,%ebp
c0100c33:	53                   	push   %ebx
c0100c34:	83 ec 04             	sub    $0x4,%esp
c0100c37:	e8 54 00 00 00       	call   c0100c90 <get_kpdir>
c0100c3c:	83 ec 04             	sub    $0x4,%esp
c0100c3f:	89 c3                	mov    %eax,%ebx
c0100c41:	68 00 10 00 00       	push   $0x1000
c0100c46:	6a 00                	push   $0x0
c0100c48:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100c4e:	68 00 70 12 c0       	push   $0xc0127000
c0100c53:	e8 b0 07 00 00       	call   c0101408 <memset>
c0100c58:	83 c4 0c             	add    $0xc,%esp
c0100c5b:	68 80 00 00 00       	push   $0x80
c0100c60:	53                   	push   %ebx
c0100c61:	68 00 7c 12 c0       	push   $0xc0127c00
c0100c66:	e8 55 07 00 00       	call   c01013c0 <memcpy>
c0100c6b:	b8 00 70 12 00       	mov    $0x127000,%eax
c0100c70:	83 c4 10             	add    $0x10,%esp
c0100c73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c76:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c7b:	a3 04 60 12 c0       	mov    %eax,0xc0126004
c0100c80:	c9                   	leave  
c0100c81:	c3                   	ret    
c0100c82:	66 90                	xchg   %ax,%ax
c0100c84:	66 90                	xchg   %ax,%ax
c0100c86:	66 90                	xchg   %ax,%ax
c0100c88:	66 90                	xchg   %ax,%ax
c0100c8a:	66 90                	xchg   %ax,%ax
c0100c8c:	66 90                	xchg   %ax,%ax
c0100c8e:	66 90                	xchg   %ax,%ax

c0100c90 <get_kpdir>:
c0100c90:	55                   	push   %ebp
c0100c91:	b8 00 90 14 c0       	mov    $0xc0149000,%eax
c0100c96:	89 e5                	mov    %esp,%ebp
c0100c98:	5d                   	pop    %ebp
c0100c99:	c3                   	ret    
c0100c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100ca0 <init_page>:
c0100ca0:	55                   	push   %ebp
c0100ca1:	89 e5                	mov    %esp,%ebp
c0100ca3:	57                   	push   %edi
c0100ca4:	83 ec 08             	sub    $0x8,%esp
c0100ca7:	68 00 10 00 00       	push   $0x1000
c0100cac:	6a 00                	push   $0x0
c0100cae:	68 00 90 14 00       	push   $0x149000
c0100cb3:	e8 50 07 00 00       	call   c0101408 <memset>
c0100cb8:	b9 00 90 14 00       	mov    $0x149000,%ecx
c0100cbd:	83 c4 10             	add    $0x10,%esp
c0100cc0:	ba 00 90 12 00       	mov    $0x129000,%edx
c0100cc5:	8d 76 00             	lea    0x0(%esi),%esi
c0100cc8:	89 d0                	mov    %edx,%eax
c0100cca:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100cd0:	83 c1 04             	add    $0x4,%ecx
c0100cd3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cd8:	83 c8 07             	or     $0x7,%eax
c0100cdb:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100cde:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100ce4:	81 fa 00 90 14 00    	cmp    $0x149000,%edx
c0100cea:	75 dc                	jne    c0100cc8 <init_page+0x28>
c0100cec:	bf fc 8f 14 00       	mov    $0x148ffc,%edi
c0100cf1:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100cf6:	fd                   	std    
c0100cf7:	ab                   	stos   %eax,%es:(%edi)
c0100cf8:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100cfd:	7d f8                	jge    c0100cf7 <init_page+0x57>
c0100cff:	b8 00 90 14 00       	mov    $0x149000,%eax
c0100d04:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d09:	0f 22 d8             	mov    %eax,%cr3
c0100d0c:	0f 20 c0             	mov    %cr0,%eax
c0100d0f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100d14:	0f 22 c0             	mov    %eax,%cr0
c0100d17:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100d1a:	c9                   	leave  
c0100d1b:	c3                   	ret    
c0100d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d20 <init_segment>:
c0100d20:	55                   	push   %ebp
c0100d21:	89 e5                	mov    %esp,%ebp
c0100d23:	83 ec 0c             	sub    $0xc,%esp
c0100d26:	6a 18                	push   $0x18
c0100d28:	6a 00                	push   $0x0
c0100d2a:	68 08 80 12 c0       	push   $0xc0128008
c0100d2f:	e8 d4 06 00 00       	call   c0101408 <memset>
c0100d34:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d39:	31 c9                	xor    %ecx,%ecx
c0100d3b:	b8 08 80 12 c0       	mov    $0xc0128008,%eax
c0100d40:	66 89 15 10 80 12 c0 	mov    %dx,0xc0128010
c0100d47:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d4c:	66 89 0d 12 80 12 c0 	mov    %cx,0xc0128012
c0100d53:	66 89 15 18 80 12 c0 	mov    %dx,0xc0128018
c0100d5a:	ba 17 00 00 00       	mov    $0x17,%edx
c0100d5f:	31 c9                	xor    %ecx,%ecx
c0100d61:	66 89 15 00 80 12 c0 	mov    %dx,0xc0128000
c0100d68:	66 a3 02 80 12 c0    	mov    %ax,0xc0128002
c0100d6e:	c1 e8 10             	shr    $0x10,%eax
c0100d71:	66 a3 04 80 12 c0    	mov    %ax,0xc0128004
c0100d77:	c6 05 14 80 12 c0 00 	movb   $0x0,0xc0128014
c0100d7e:	b8 00 80 12 c0       	mov    $0xc0128000,%eax
c0100d83:	c6 05 15 80 12 c0 9a 	movb   $0x9a,0xc0128015
c0100d8a:	c6 05 16 80 12 c0 cf 	movb   $0xcf,0xc0128016
c0100d91:	c6 05 17 80 12 c0 00 	movb   $0x0,0xc0128017
c0100d98:	66 89 0d 1a 80 12 c0 	mov    %cx,0xc012801a
c0100d9f:	c6 05 1c 80 12 c0 00 	movb   $0x0,0xc012801c
c0100da6:	c6 05 1d 80 12 c0 92 	movb   $0x92,0xc012801d
c0100dad:	c6 05 1e 80 12 c0 cf 	movb   $0xcf,0xc012801e
c0100db4:	c6 05 1f 80 12 c0 00 	movb   $0x0,0xc012801f
c0100dbb:	0f 01 10             	lgdtl  (%eax)
c0100dbe:	83 c4 10             	add    $0x10,%esp
c0100dc1:	c9                   	leave  
c0100dc2:	c3                   	ret    
c0100dc3:	66 90                	xchg   %ax,%ax
c0100dc5:	66 90                	xchg   %ax,%ax
c0100dc7:	66 90                	xchg   %ax,%ax
c0100dc9:	66 90                	xchg   %ax,%ax
c0100dcb:	66 90                	xchg   %ax,%ax
c0100dcd:	66 90                	xchg   %ax,%ax
c0100dcf:	90                   	nop

c0100dd0 <loader>:
c0100dd0:	55                   	push   %ebp
c0100dd1:	89 e5                	mov    %esp,%ebp
c0100dd3:	57                   	push   %edi
c0100dd4:	56                   	push   %esi
c0100dd5:	53                   	push   %ebx
c0100dd6:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100ddc:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100de2:	68 00 10 00 00       	push   $0x1000
c0100de7:	6a 00                	push   $0x0
c0100de9:	53                   	push   %ebx
c0100dea:	e8 91 01 00 00       	call   c0100f80 <ramdisk_read>
c0100def:	83 c4 10             	add    $0x10,%esp
c0100df2:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100df9:	45 4c 46 
c0100dfc:	74 06                	je     c0100e04 <loader+0x34>
c0100dfe:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e03:	d6                   	(bad)  
c0100e04:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100e0a:	83 fa 34             	cmp    $0x34,%edx
c0100e0d:	74 06                	je     c0100e15 <loader+0x45>
c0100e0f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e14:	d6                   	(bad)  
c0100e15:	31 f6                	xor    %esi,%esi
c0100e17:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100e1e:	00 
c0100e1f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e23:	75 1c                	jne    c0100e41 <loader+0x71>
c0100e25:	eb 79                	jmp    c0100ea0 <loader+0xd0>
c0100e27:	89 f6                	mov    %esi,%esi
c0100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e30:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e37:	83 c6 01             	add    $0x1,%esi
c0100e3a:	83 c3 20             	add    $0x20,%ebx
c0100e3d:	39 f0                	cmp    %esi,%eax
c0100e3f:	7e 5f                	jle    c0100ea0 <loader+0xd0>
c0100e41:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100e45:	75 e9                	jne    c0100e30 <loader+0x60>
c0100e47:	83 ec 08             	sub    $0x8,%esp
c0100e4a:	ff 33                	pushl  (%ebx)
c0100e4c:	ff 73 f4             	pushl  -0xc(%ebx)
c0100e4f:	e8 fc f1 ff ff       	call   c0100050 <mm_malloc>
c0100e54:	83 c4 0c             	add    $0xc,%esp
c0100e57:	ff 73 fc             	pushl  -0x4(%ebx)
c0100e5a:	ff 73 f0             	pushl  -0x10(%ebx)
c0100e5d:	50                   	push   %eax
c0100e5e:	89 c7                	mov    %eax,%edi
c0100e60:	e8 1b 01 00 00       	call   c0100f80 <ramdisk_read>
c0100e65:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100e68:	8b 13                	mov    (%ebx),%edx
c0100e6a:	83 c4 0c             	add    $0xc,%esp
c0100e6d:	29 c2                	sub    %eax,%edx
c0100e6f:	52                   	push   %edx
c0100e70:	6a 00                	push   $0x0
c0100e72:	03 43 f0             	add    -0x10(%ebx),%eax
c0100e75:	01 c7                	add    %eax,%edi
c0100e77:	57                   	push   %edi
c0100e78:	e8 8b 05 00 00       	call   c0101408 <memset>
c0100e7d:	8b 03                	mov    (%ebx),%eax
c0100e7f:	03 43 f4             	add    -0xc(%ebx),%eax
c0100e82:	83 c4 10             	add    $0x10,%esp
c0100e85:	83 e8 01             	sub    $0x1,%eax
c0100e88:	3b 05 00 60 12 c0    	cmp    0xc0126000,%eax
c0100e8e:	76 a0                	jbe    c0100e30 <loader+0x60>
c0100e90:	a3 00 60 12 c0       	mov    %eax,0xc0126000
c0100e95:	eb 99                	jmp    c0100e30 <loader+0x60>
c0100e97:	89 f6                	mov    %esi,%esi
c0100e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100ea0:	83 ec 08             	sub    $0x8,%esp
c0100ea3:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100ea9:	68 00 00 10 00       	push   $0x100000
c0100eae:	68 00 00 f0 bf       	push   $0xbff00000
c0100eb3:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100eb9:	e8 92 f1 ff ff       	call   c0100050 <mm_malloc>
c0100ebe:	e8 fd fb ff ff       	call   c0100ac0 <create_video_mapping>
c0100ec3:	e8 28 fd ff ff       	call   c0100bf0 <get_ucr3>
c0100ec8:	0f 22 d8             	mov    %eax,%cr3
c0100ecb:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100ed1:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100ed4:	5b                   	pop    %ebx
c0100ed5:	5e                   	pop    %esi
c0100ed6:	5f                   	pop    %edi
c0100ed7:	5d                   	pop    %ebp
c0100ed8:	c3                   	ret    
c0100ed9:	66 90                	xchg   %ax,%ax
c0100edb:	66 90                	xchg   %ax,%ax
c0100edd:	66 90                	xchg   %ax,%ax
c0100edf:	90                   	nop

c0100ee0 <sbrk>:
c0100ee0:	55                   	push   %ebp
c0100ee1:	89 e5                	mov    %esp,%ebp
c0100ee3:	83 ec 08             	sub    $0x8,%esp
c0100ee6:	68 5a 18 10 c0       	push   $0xc010185a
c0100eeb:	6a 08                	push   $0x8
c0100eed:	68 44 18 10 c0       	push   $0xc0101844
c0100ef2:	68 64 15 10 c0       	push   $0xc0101564
c0100ef7:	e8 14 00 00 00       	call   c0100f10 <printk>
c0100efc:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f01:	d6                   	(bad)  
c0100f02:	30 c0                	xor    %al,%al
c0100f04:	c9                   	leave  
c0100f05:	c3                   	ret    
c0100f06:	66 90                	xchg   %ax,%ax
c0100f08:	66 90                	xchg   %ax,%ax
c0100f0a:	66 90                	xchg   %ax,%ax
c0100f0c:	66 90                	xchg   %ax,%ax
c0100f0e:	66 90                	xchg   %ax,%ax

c0100f10 <printk>:
c0100f10:	55                   	push   %ebp
c0100f11:	89 e5                	mov    %esp,%ebp
c0100f13:	5d                   	pop    %ebp
c0100f14:	c3                   	ret    
c0100f15:	66 90                	xchg   %ax,%ax
c0100f17:	66 90                	xchg   %ax,%ax
c0100f19:	66 90                	xchg   %ax,%ax
c0100f1b:	66 90                	xchg   %ax,%ax
c0100f1d:	66 90                	xchg   %ax,%ax
c0100f1f:	90                   	nop

c0100f20 <init_serial>:
c0100f20:	55                   	push   %ebp
c0100f21:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100f26:	31 c0                	xor    %eax,%eax
c0100f28:	89 e5                	mov    %esp,%ebp
c0100f2a:	ee                   	out    %al,(%dx)
c0100f2b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100f30:	b2 fb                	mov    $0xfb,%dl
c0100f32:	ee                   	out    %al,(%dx)
c0100f33:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f38:	b2 f8                	mov    $0xf8,%dl
c0100f3a:	ee                   	out    %al,(%dx)
c0100f3b:	31 c0                	xor    %eax,%eax
c0100f3d:	b2 f9                	mov    $0xf9,%dl
c0100f3f:	ee                   	out    %al,(%dx)
c0100f40:	b8 03 00 00 00       	mov    $0x3,%eax
c0100f45:	b2 fb                	mov    $0xfb,%dl
c0100f47:	ee                   	out    %al,(%dx)
c0100f48:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100f4d:	b2 fa                	mov    $0xfa,%dl
c0100f4f:	ee                   	out    %al,(%dx)
c0100f50:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100f55:	b2 fc                	mov    $0xfc,%dl
c0100f57:	ee                   	out    %al,(%dx)
c0100f58:	5d                   	pop    %ebp
c0100f59:	c3                   	ret    
c0100f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100f60 <serial_printc>:
c0100f60:	55                   	push   %ebp
c0100f61:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100f66:	89 e5                	mov    %esp,%ebp
c0100f68:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f6b:	90                   	nop
c0100f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f70:	ec                   	in     (%dx),%al
c0100f71:	a8 20                	test   $0x20,%al
c0100f73:	74 fb                	je     c0100f70 <serial_printc+0x10>
c0100f75:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100f7a:	89 c8                	mov    %ecx,%eax
c0100f7c:	ee                   	out    %al,(%dx)
c0100f7d:	5d                   	pop    %ebp
c0100f7e:	c3                   	ret    
c0100f7f:	90                   	nop

c0100f80 <ramdisk_read>:
c0100f80:	55                   	push   %ebp
c0100f81:	89 e5                	mov    %esp,%ebp
c0100f83:	53                   	push   %ebx
c0100f84:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f87:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f8a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f8d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f90:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f95:	76 06                	jbe    c0100f9d <ramdisk_read+0x1d>
c0100f97:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f9c:	d6                   	(bad)  
c0100f9d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100fa0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100fa3:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100fa6:	5b                   	pop    %ebx
c0100fa7:	5d                   	pop    %ebp
c0100fa8:	e9 13 04 00 00       	jmp    c01013c0 <memcpy>
c0100fad:	8d 76 00             	lea    0x0(%esi),%esi

c0100fb0 <ramdisk_write>:
c0100fb0:	55                   	push   %ebp
c0100fb1:	89 e5                	mov    %esp,%ebp
c0100fb3:	53                   	push   %ebx
c0100fb4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100fb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100fba:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100fbd:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100fc0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100fc5:	76 06                	jbe    c0100fcd <ramdisk_write+0x1d>
c0100fc7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fcc:	d6                   	(bad)  
c0100fcd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0100fd0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100fd3:	89 55 08             	mov    %edx,0x8(%ebp)
c0100fd6:	5b                   	pop    %ebx
c0100fd7:	5d                   	pop    %ebp
c0100fd8:	e9 e3 03 00 00       	jmp    c01013c0 <memcpy>
c0100fdd:	66 90                	xchg   %ax,%ax
c0100fdf:	90                   	nop

c0100fe0 <ide_intr>:
c0100fe0:	55                   	push   %ebp
c0100fe1:	c7 05 04 a0 14 c0 01 	movl   $0x1,0xc014a004
c0100fe8:	00 00 00 
c0100feb:	89 e5                	mov    %esp,%ebp
c0100fed:	5d                   	pop    %ebp
c0100fee:	c3                   	ret    
c0100fef:	90                   	nop

c0100ff0 <ide_writeback>:
c0100ff0:	a1 00 a0 14 c0       	mov    0xc014a000,%eax
c0100ff5:	83 c0 01             	add    $0x1,%eax
c0100ff8:	83 f8 64             	cmp    $0x64,%eax
c0100ffb:	a3 00 a0 14 c0       	mov    %eax,0xc014a000
c0101000:	74 06                	je     c0101008 <ide_writeback+0x18>
c0101002:	c3                   	ret    
c0101003:	90                   	nop
c0101004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101008:	55                   	push   %ebp
c0101009:	89 e5                	mov    %esp,%ebp
c010100b:	83 ec 08             	sub    $0x8,%esp
c010100e:	e8 dd 01 00 00       	call   c01011f0 <buf_writeback>
c0101013:	c7 05 00 a0 14 c0 00 	movl   $0x0,0xc014a000
c010101a:	00 00 00 
c010101d:	c9                   	leave  
c010101e:	c3                   	ret    
c010101f:	90                   	nop

c0101020 <ide_read>:
c0101020:	55                   	push   %ebp
c0101021:	89 e5                	mov    %esp,%ebp
c0101023:	57                   	push   %edi
c0101024:	56                   	push   %esi
c0101025:	53                   	push   %ebx
c0101026:	83 ec 0c             	sub    $0xc,%esp
c0101029:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010102c:	8b 45 10             	mov    0x10(%ebp),%eax
c010102f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101032:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101035:	29 df                	sub    %ebx,%edi
c0101037:	85 c0                	test   %eax,%eax
c0101039:	74 1b                	je     c0101056 <ide_read+0x36>
c010103b:	90                   	nop
c010103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101040:	83 ec 0c             	sub    $0xc,%esp
c0101043:	53                   	push   %ebx
c0101044:	e8 07 02 00 00       	call   c0101250 <read_byte>
c0101049:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010104c:	83 c3 01             	add    $0x1,%ebx
c010104f:	83 c4 10             	add    $0x10,%esp
c0101052:	39 f3                	cmp    %esi,%ebx
c0101054:	75 ea                	jne    c0101040 <ide_read+0x20>
c0101056:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101059:	5b                   	pop    %ebx
c010105a:	5e                   	pop    %esi
c010105b:	5f                   	pop    %edi
c010105c:	5d                   	pop    %ebp
c010105d:	c3                   	ret    
c010105e:	66 90                	xchg   %ax,%ax

c0101060 <ide_write>:
c0101060:	55                   	push   %ebp
c0101061:	89 e5                	mov    %esp,%ebp
c0101063:	57                   	push   %edi
c0101064:	56                   	push   %esi
c0101065:	53                   	push   %ebx
c0101066:	83 ec 0c             	sub    $0xc,%esp
c0101069:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010106c:	8b 45 10             	mov    0x10(%ebp),%eax
c010106f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101072:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101075:	29 df                	sub    %ebx,%edi
c0101077:	85 c0                	test   %eax,%eax
c0101079:	74 1d                	je     c0101098 <ide_write+0x38>
c010107b:	90                   	nop
c010107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101080:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101084:	83 ec 08             	sub    $0x8,%esp
c0101087:	50                   	push   %eax
c0101088:	53                   	push   %ebx
c0101089:	83 c3 01             	add    $0x1,%ebx
c010108c:	e8 ef 01 00 00       	call   c0101280 <write_byte>
c0101091:	83 c4 10             	add    $0x10,%esp
c0101094:	39 f3                	cmp    %esi,%ebx
c0101096:	75 e8                	jne    c0101080 <ide_write+0x20>
c0101098:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010109b:	5b                   	pop    %ebx
c010109c:	5e                   	pop    %esi
c010109d:	5f                   	pop    %edi
c010109e:	5d                   	pop    %ebp
c010109f:	c3                   	ret    

c01010a0 <clear_ide_intr>:
c01010a0:	55                   	push   %ebp
c01010a1:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c01010a8:	00 00 00 
c01010ab:	89 e5                	mov    %esp,%ebp
c01010ad:	5d                   	pop    %ebp
c01010ae:	c3                   	ret    
c01010af:	90                   	nop

c01010b0 <wait_ide_intr>:
c01010b0:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010b5:	55                   	push   %ebp
c01010b6:	89 e5                	mov    %esp,%ebp
c01010b8:	85 c0                	test   %eax,%eax
c01010ba:	75 0e                	jne    c01010ca <wait_ide_intr+0x1a>
c01010bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010c0:	f4                   	hlt    
c01010c1:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010c6:	85 c0                	test   %eax,%eax
c01010c8:	74 f6                	je     c01010c0 <wait_ide_intr+0x10>
c01010ca:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c01010d1:	00 00 00 
c01010d4:	5d                   	pop    %ebp
c01010d5:	c3                   	ret    
c01010d6:	8d 76 00             	lea    0x0(%esi),%esi
c01010d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01010e0 <init_ide>:
c01010e0:	55                   	push   %ebp
c01010e1:	89 e5                	mov    %esp,%ebp
c01010e3:	83 ec 08             	sub    $0x8,%esp
c01010e6:	e8 d5 00 00 00       	call   c01011c0 <buf_init>
c01010eb:	83 ec 08             	sub    $0x8,%esp
c01010ee:	68 f0 0f 10 c0       	push   $0xc0100ff0
c01010f3:	6a 00                	push   $0x0
c01010f5:	e8 f6 f3 ff ff       	call   c01004f0 <add_irq_handle>
c01010fa:	58                   	pop    %eax
c01010fb:	5a                   	pop    %edx
c01010fc:	68 e0 0f 10 c0       	push   $0xc0100fe0
c0101101:	6a 0e                	push   $0xe
c0101103:	e8 e8 f3 ff ff       	call   c01004f0 <add_irq_handle>
c0101108:	83 c4 10             	add    $0x10,%esp
c010110b:	c9                   	leave  
c010110c:	c3                   	ret    
c010110d:	66 90                	xchg   %ax,%ax
c010110f:	90                   	nop

c0101110 <buf_fetch>:
c0101110:	55                   	push   %ebp
c0101111:	89 c2                	mov    %eax,%edx
c0101113:	89 e5                	mov    %esp,%ebp
c0101115:	57                   	push   %edi
c0101116:	56                   	push   %esi
c0101117:	53                   	push   %ebx
c0101118:	89 c3                	mov    %eax,%ebx
c010111a:	83 e3 7f             	and    $0x7f,%ebx
c010111d:	89 d8                	mov    %ebx,%eax
c010111f:	83 ec 1c             	sub    $0x1c,%esp
c0101122:	c1 e0 09             	shl    $0x9,%eax
c0101125:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101128:	8d 81 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%eax
c010112e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101132:	74 5c                	je     c0101190 <buf_fetch+0x80>
c0101134:	89 d7                	mov    %edx,%edi
c0101136:	89 da                	mov    %ebx,%edx
c0101138:	c1 e2 09             	shl    $0x9,%edx
c010113b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010113e:	8d 91 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%edx
c0101144:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010114a:	74 54                	je     c01011a0 <buf_fetch+0x90>
c010114c:	8d 72 06             	lea    0x6(%edx),%esi
c010114f:	83 ec 08             	sub    $0x8,%esp
c0101152:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101155:	57                   	push   %edi
c0101156:	56                   	push   %esi
c0101157:	e8 a4 01 00 00       	call   c0101300 <disk_do_read>
c010115c:	89 da                	mov    %ebx,%edx
c010115e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101161:	83 c4 10             	add    $0x10,%esp
c0101164:	c1 e2 09             	shl    $0x9,%edx
c0101167:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010116a:	c6 81 44 a0 14 c0 01 	movb   $0x1,-0x3feb5fbc(%ecx)
c0101171:	89 b9 40 a0 14 c0    	mov    %edi,-0x3feb5fc0(%ecx)
c0101177:	c6 81 45 a0 14 c0 00 	movb   $0x0,-0x3feb5fbb(%ecx)
c010117e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101181:	5b                   	pop    %ebx
c0101182:	5e                   	pop    %esi
c0101183:	5f                   	pop    %edi
c0101184:	5d                   	pop    %ebp
c0101185:	c3                   	ret    
c0101186:	8d 76 00             	lea    0x0(%esi),%esi
c0101189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101190:	39 91 40 a0 14 c0    	cmp    %edx,-0x3feb5fc0(%ecx)
c0101196:	75 9c                	jne    c0101134 <buf_fetch+0x24>
c0101198:	eb e4                	jmp    c010117e <buf_fetch+0x6e>
c010119a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01011a0:	8d 72 06             	lea    0x6(%edx),%esi
c01011a3:	83 ec 08             	sub    $0x8,%esp
c01011a6:	ff b1 40 a0 14 c0    	pushl  -0x3feb5fc0(%ecx)
c01011ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01011af:	56                   	push   %esi
c01011b0:	e8 8b 01 00 00       	call   c0101340 <disk_do_write>
c01011b5:	83 c4 10             	add    $0x10,%esp
c01011b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011bb:	eb 92                	jmp    c010114f <buf_fetch+0x3f>
c01011bd:	8d 76 00             	lea    0x0(%esi),%esi

c01011c0 <buf_init>:
c01011c0:	55                   	push   %ebp
c01011c1:	b8 44 a0 14 c0       	mov    $0xc014a044,%eax
c01011c6:	89 e5                	mov    %esp,%ebp
c01011c8:	90                   	nop
c01011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011d0:	c6 00 00             	movb   $0x0,(%eax)
c01011d3:	05 08 02 00 00       	add    $0x208,%eax
c01011d8:	3d 44 a4 15 c0       	cmp    $0xc015a444,%eax
c01011dd:	75 f1                	jne    c01011d0 <buf_init+0x10>
c01011df:	5d                   	pop    %ebp
c01011e0:	c3                   	ret    
c01011e1:	eb 0d                	jmp    c01011f0 <buf_writeback>
c01011e3:	90                   	nop
c01011e4:	90                   	nop
c01011e5:	90                   	nop
c01011e6:	90                   	nop
c01011e7:	90                   	nop
c01011e8:	90                   	nop
c01011e9:	90                   	nop
c01011ea:	90                   	nop
c01011eb:	90                   	nop
c01011ec:	90                   	nop
c01011ed:	90                   	nop
c01011ee:	90                   	nop
c01011ef:	90                   	nop

c01011f0 <buf_writeback>:
c01011f0:	55                   	push   %ebp
c01011f1:	89 e5                	mov    %esp,%ebp
c01011f3:	53                   	push   %ebx
c01011f4:	bb 46 a0 14 c0       	mov    $0xc014a046,%ebx
c01011f9:	83 ec 04             	sub    $0x4,%esp
c01011fc:	eb 10                	jmp    c010120e <buf_writeback+0x1e>
c01011fe:	66 90                	xchg   %ax,%ax
c0101200:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101206:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c010120c:	74 32                	je     c0101240 <buf_writeback+0x50>
c010120e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101212:	75 ec                	jne    c0101200 <buf_writeback+0x10>
c0101214:	83 ec 08             	sub    $0x8,%esp
c0101217:	ff 73 fa             	pushl  -0x6(%ebx)
c010121a:	53                   	push   %ebx
c010121b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101221:	e8 1a 01 00 00       	call   c0101340 <disk_do_write>
c0101226:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010122d:	83 c4 10             	add    $0x10,%esp
c0101230:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c0101236:	75 d6                	jne    c010120e <buf_writeback+0x1e>
c0101238:	90                   	nop
c0101239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101240:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101243:	c9                   	leave  
c0101244:	c3                   	ret    
c0101245:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101250 <read_byte>:
c0101250:	55                   	push   %ebp
c0101251:	89 e5                	mov    %esp,%ebp
c0101253:	53                   	push   %ebx
c0101254:	83 ec 04             	sub    $0x4,%esp
c0101257:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010125a:	89 d8                	mov    %ebx,%eax
c010125c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101262:	c1 e8 09             	shr    $0x9,%eax
c0101265:	e8 a6 fe ff ff       	call   c0101110 <buf_fetch>
c010126a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010126f:	83 c4 04             	add    $0x4,%esp
c0101272:	5b                   	pop    %ebx
c0101273:	5d                   	pop    %ebp
c0101274:	c3                   	ret    
c0101275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101280 <write_byte>:
c0101280:	55                   	push   %ebp
c0101281:	89 e5                	mov    %esp,%ebp
c0101283:	56                   	push   %esi
c0101284:	53                   	push   %ebx
c0101285:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101288:	8b 75 0c             	mov    0xc(%ebp),%esi
c010128b:	89 d8                	mov    %ebx,%eax
c010128d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101293:	c1 e8 09             	shr    $0x9,%eax
c0101296:	e8 75 fe ff ff       	call   c0101110 <buf_fetch>
c010129b:	89 f2                	mov    %esi,%edx
c010129d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c01012a1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c01012a5:	5b                   	pop    %ebx
c01012a6:	5e                   	pop    %esi
c01012a7:	5d                   	pop    %ebp
c01012a8:	c3                   	ret    
c01012a9:	66 90                	xchg   %ax,%ax
c01012ab:	66 90                	xchg   %ax,%ax
c01012ad:	66 90                	xchg   %ax,%ax
c01012af:	90                   	nop

c01012b0 <ide_prepare>:
c01012b0:	55                   	push   %ebp
c01012b1:	89 c1                	mov    %eax,%ecx
c01012b3:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012b8:	89 e5                	mov    %esp,%ebp
c01012ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012c0:	ec                   	in     (%dx),%al
c01012c1:	83 e0 c0             	and    $0xffffffc0,%eax
c01012c4:	3c 40                	cmp    $0x40,%al
c01012c6:	75 f8                	jne    c01012c0 <ide_prepare+0x10>
c01012c8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01012cd:	31 c0                	xor    %eax,%eax
c01012cf:	ee                   	out    %al,(%dx)
c01012d0:	b8 01 00 00 00       	mov    $0x1,%eax
c01012d5:	b2 f2                	mov    $0xf2,%dl
c01012d7:	ee                   	out    %al,(%dx)
c01012d8:	b2 f3                	mov    $0xf3,%dl
c01012da:	89 c8                	mov    %ecx,%eax
c01012dc:	ee                   	out    %al,(%dx)
c01012dd:	89 c8                	mov    %ecx,%eax
c01012df:	b2 f4                	mov    $0xf4,%dl
c01012e1:	c1 e8 08             	shr    $0x8,%eax
c01012e4:	ee                   	out    %al,(%dx)
c01012e5:	89 c8                	mov    %ecx,%eax
c01012e7:	b2 f5                	mov    $0xf5,%dl
c01012e9:	c1 e8 10             	shr    $0x10,%eax
c01012ec:	ee                   	out    %al,(%dx)
c01012ed:	89 c8                	mov    %ecx,%eax
c01012ef:	b2 f6                	mov    $0xf6,%dl
c01012f1:	c1 e8 18             	shr    $0x18,%eax
c01012f4:	83 c8 e0             	or     $0xffffffe0,%eax
c01012f7:	ee                   	out    %al,(%dx)
c01012f8:	5d                   	pop    %ebp
c01012f9:	c3                   	ret    
c01012fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101300 <disk_do_read>:
c0101300:	55                   	push   %ebp
c0101301:	89 e5                	mov    %esp,%ebp
c0101303:	53                   	push   %ebx
c0101304:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101307:	e8 a4 ff ff ff       	call   c01012b0 <ide_prepare>
c010130c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101311:	b8 20 00 00 00       	mov    $0x20,%eax
c0101316:	ee                   	out    %al,(%dx)
c0101317:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010131a:	b2 f0                	mov    $0xf0,%dl
c010131c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101328:	ed                   	in     (%dx),%eax
c0101329:	89 01                	mov    %eax,(%ecx)
c010132b:	83 c1 04             	add    $0x4,%ecx
c010132e:	39 d9                	cmp    %ebx,%ecx
c0101330:	75 f6                	jne    c0101328 <disk_do_read+0x28>
c0101332:	5b                   	pop    %ebx
c0101333:	5d                   	pop    %ebp
c0101334:	c3                   	ret    
c0101335:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101340 <disk_do_write>:
c0101340:	55                   	push   %ebp
c0101341:	89 e5                	mov    %esp,%ebp
c0101343:	53                   	push   %ebx
c0101344:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101347:	e8 64 ff ff ff       	call   c01012b0 <ide_prepare>
c010134c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101351:	b8 30 00 00 00       	mov    $0x30,%eax
c0101356:	ee                   	out    %al,(%dx)
c0101357:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010135a:	b2 f0                	mov    $0xf0,%dl
c010135c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101368:	8b 01                	mov    (%ecx),%eax
c010136a:	ef                   	out    %eax,(%dx)
c010136b:	83 c1 04             	add    $0x4,%ecx
c010136e:	39 d9                	cmp    %ebx,%ecx
c0101370:	75 f6                	jne    c0101368 <disk_do_write+0x28>
c0101372:	5b                   	pop    %ebx
c0101373:	5d                   	pop    %ebp
c0101374:	c3                   	ret    
c0101375:	66 90                	xchg   %ax,%ax
c0101377:	66 90                	xchg   %ax,%ax
c0101379:	66 90                	xchg   %ax,%ax
c010137b:	66 90                	xchg   %ax,%ax
c010137d:	66 90                	xchg   %ax,%ax
c010137f:	90                   	nop

c0101380 <dma_prepare>:
c0101380:	55                   	push   %ebp
c0101381:	89 e5                	mov    %esp,%ebp
c0101383:	83 ec 08             	sub    $0x8,%esp
c0101386:	68 c8 18 10 c0       	push   $0xc01018c8
c010138b:	6a 1d                	push   $0x1d
c010138d:	68 5f 18 10 c0       	push   $0xc010185f
c0101392:	68 7c 18 10 c0       	push   $0xc010187c
c0101397:	e8 74 fb ff ff       	call   c0100f10 <printk>
c010139c:	b8 01 00 00 00       	mov    $0x1,%eax
c01013a1:	d6                   	(bad)  
c01013a2:	83 c4 10             	add    $0x10,%esp
c01013a5:	c9                   	leave  
c01013a6:	c3                   	ret    
c01013a7:	89 f6                	mov    %esi,%esi
c01013a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01013b0 <dma_issue_read>:
c01013b0:	55                   	push   %ebp
c01013b1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c01013b6:	89 e5                	mov    %esp,%ebp
c01013b8:	ec                   	in     (%dx),%al
c01013b9:	83 c8 09             	or     $0x9,%eax
c01013bc:	ee                   	out    %al,(%dx)
c01013bd:	5d                   	pop    %ebp
c01013be:	c3                   	ret    
c01013bf:	90                   	nop

c01013c0 <memcpy>:
c01013c0:	55                   	push   %ebp
c01013c1:	89 e5                	mov    %esp,%ebp
c01013c3:	56                   	push   %esi
c01013c4:	57                   	push   %edi
c01013c5:	53                   	push   %ebx
c01013c6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013cc:	8b 75 0c             	mov    0xc(%ebp),%esi
c01013cf:	fc                   	cld    
c01013d0:	83 f9 08             	cmp    $0x8,%ecx
c01013d3:	76 26                	jbe    c01013fb <memcpy+0x3b>
c01013d5:	89 fa                	mov    %edi,%edx
c01013d7:	89 cb                	mov    %ecx,%ebx
c01013d9:	83 e2 03             	and    $0x3,%edx
c01013dc:	74 10                	je     c01013ee <memcpy+0x2e>
c01013de:	b9 04 00 00 00       	mov    $0x4,%ecx
c01013e3:	29 d1                	sub    %edx,%ecx
c01013e5:	83 e1 03             	and    $0x3,%ecx
c01013e8:	29 cb                	sub    %ecx,%ebx
c01013ea:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013ec:	89 d9                	mov    %ebx,%ecx
c01013ee:	c1 e9 02             	shr    $0x2,%ecx
c01013f1:	8d 76 00             	lea    0x0(%esi),%esi
c01013f4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01013f6:	89 d9                	mov    %ebx,%ecx
c01013f8:	83 e1 03             	and    $0x3,%ecx
c01013fb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101400:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101403:	5b                   	pop    %ebx
c0101404:	5f                   	pop    %edi
c0101405:	5e                   	pop    %esi
c0101406:	c9                   	leave  
c0101407:	c3                   	ret    

c0101408 <memset>:
c0101408:	55                   	push   %ebp
c0101409:	89 e5                	mov    %esp,%ebp
c010140b:	57                   	push   %edi
c010140c:	8b 7d 08             	mov    0x8(%ebp),%edi
c010140f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101413:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101416:	fc                   	cld    
c0101417:	83 f9 10             	cmp    $0x10,%ecx
c010141a:	76 69                	jbe    c0101485 <memset+0x7d>
c010141c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101422:	74 4c                	je     c0101470 <memset+0x68>
c0101424:	88 07                	mov    %al,(%edi)
c0101426:	47                   	inc    %edi
c0101427:	49                   	dec    %ecx
c0101428:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010142e:	74 40                	je     c0101470 <memset+0x68>
c0101430:	88 07                	mov    %al,(%edi)
c0101432:	47                   	inc    %edi
c0101433:	49                   	dec    %ecx
c0101434:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010143a:	74 34                	je     c0101470 <memset+0x68>
c010143c:	88 07                	mov    %al,(%edi)
c010143e:	47                   	inc    %edi
c010143f:	49                   	dec    %ecx
c0101440:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101446:	74 28                	je     c0101470 <memset+0x68>
c0101448:	88 07                	mov    %al,(%edi)
c010144a:	47                   	inc    %edi
c010144b:	49                   	dec    %ecx
c010144c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101452:	74 1c                	je     c0101470 <memset+0x68>
c0101454:	88 07                	mov    %al,(%edi)
c0101456:	47                   	inc    %edi
c0101457:	49                   	dec    %ecx
c0101458:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010145e:	74 10                	je     c0101470 <memset+0x68>
c0101460:	88 07                	mov    %al,(%edi)
c0101462:	47                   	inc    %edi
c0101463:	49                   	dec    %ecx
c0101464:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010146a:	74 04                	je     c0101470 <memset+0x68>
c010146c:	88 07                	mov    %al,(%edi)
c010146e:	47                   	inc    %edi
c010146f:	49                   	dec    %ecx
c0101470:	88 c4                	mov    %al,%ah
c0101472:	89 c2                	mov    %eax,%edx
c0101474:	c1 e2 10             	shl    $0x10,%edx
c0101477:	09 d0                	or     %edx,%eax
c0101479:	89 ca                	mov    %ecx,%edx
c010147b:	c1 e9 02             	shr    $0x2,%ecx
c010147e:	83 e2 03             	and    $0x3,%edx
c0101481:	f3 ab                	rep stos %eax,%es:(%edi)
c0101483:	89 d1                	mov    %edx,%ecx
c0101485:	f3 aa                	rep stos %al,%es:(%edi)
c0101487:	8b 45 08             	mov    0x8(%ebp),%eax
c010148a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010148d:	5f                   	pop    %edi
c010148e:	c9                   	leave  
c010148f:	c3                   	ret    
