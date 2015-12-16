
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
c0100066:	e8 a5 0b 00 00       	call   c0100c10 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 ae 0b 00 00       	call   c0100c20 <get_ucr3>
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
c010014c:	e8 e7 12 00 00       	call   c0101438 <memset>
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
c0100178:	c7 44 24 10 e4 14 10 	movl   $0xc01014e4,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 48 15 10 	movl   $0xc0101548,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 d3 14 10 	movl   $0xc01014d3,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 f4 14 10 c0 	movl   $0xc01014f4,(%esp)
c010019f:	e8 9c 0d 00 00       	call   c0100f40 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 ec 14 10 	movl   $0xc01014ec,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 48 15 10 	movl   $0xc0101548,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 d3 14 10 	movl   $0xc01014d3,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 f4 14 10 c0 	movl   $0xc01014f4,(%esp)
c01001ee:	e8 4d 0d 00 00       	call   c0100f40 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 e4 14 10 	movl   $0xc01014e4,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 48 15 10 	movl   $0xc0101548,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 d3 14 10 	movl   $0xc01014d3,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 f4 14 10 c0 	movl   $0xc01014f4,(%esp)
c010022e:	e8 0d 0d 00 00       	call   c0100f40 <printk>
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
c0100258:	c7 44 24 10 ec 14 10 	movl   $0xc01014ec,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 48 15 10 	movl   $0xc0101548,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 d3 14 10 	movl   $0xc01014d3,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 f4 14 10 c0 	movl   $0xc01014f4,(%esp)
c010027f:	e8 bc 0c 00 00       	call   c0100f40 <printk>
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
c01002a8:	c7 44 24 10 c0 14 10 	movl   $0xc01014c0,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 3e 15 10 	movl   $0xc010153e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 d3 14 10 	movl   $0xc01014d3,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 f4 14 10 c0 	movl   $0xc01014f4,(%esp)
c01002cf:	e8 6c 0c 00 00       	call   c0100f40 <printk>
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
c010039a:	e8 51 02 00 00       	call   c01005f0 <irq_handle>
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
c01003b7:	e8 94 09 00 00       	call   c0100d50 <init_segment>
c01003bc:	e8 8f 03 00 00       	call   c0100750 <init_idt>
c01003c1:	e8 9a 08 00 00       	call   c0100c60 <init_mm>
c01003c6:	68 df 15 10 c0       	push   $0xc01015df
c01003cb:	6a 4a                	push   $0x4a
c01003cd:	68 4e 15 10 c0       	push   $0xc010154e
c01003d2:	68 60 15 10 c0       	push   $0xc0101560
c01003d7:	e8 64 0b 00 00       	call   c0100f40 <printk>
c01003dc:	e8 9f 07 00 00       	call   c0100b80 <video_mapping_write_test>
c01003e1:	e8 1a 0a 00 00       	call   c0100e00 <loader>
c01003e6:	89 c3                	mov    %eax,%ebx
c01003e8:	e8 b3 07 00 00       	call   c0100ba0 <video_mapping_read_test>
c01003ed:	e8 fe 07 00 00       	call   c0100bf0 <video_mapping_clear>
c01003f2:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003f7:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003fc:	83 ec 10             	sub    $0x10,%esp
c01003ff:	ff d3                	call   *%ebx
c0100401:	68 df 15 10 c0       	push   $0xc01015df
c0100406:	6a 6b                	push   $0x6b
c0100408:	68 4e 15 10 c0       	push   $0xc010154e
c010040d:	68 94 15 10 c0       	push   $0xc0101594
c0100412:	e8 29 0b 00 00       	call   c0100f40 <printk>
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
c0100436:	e8 95 08 00 00       	call   c0100cd0 <init_page>
c010043b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100441:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100446:	ff e0                	jmp    *%eax
c0100448:	68 e9 15 10 c0       	push   $0xc01015e9
c010044d:	6a 24                	push   $0x24
c010044f:	68 4e 15 10 c0       	push   $0xc010154e
c0100454:	68 94 15 10 c0       	push   $0xc0101594
c0100459:	e8 e2 0a 00 00       	call   c0100f40 <printk>
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
c010047a:	8b 43 1c             	mov    0x1c(%ebx),%eax
c010047d:	83 f8 04             	cmp    $0x4,%eax
c0100480:	74 6e                	je     c01004f0 <do_syscall+0x80>
c0100482:	83 f8 2d             	cmp    $0x2d,%eax
c0100485:	74 49                	je     c01004d0 <do_syscall+0x60>
c0100487:	85 c0                	test   %eax,%eax
c0100489:	74 2d                	je     c01004b8 <do_syscall+0x48>
c010048b:	83 ec 0c             	sub    $0xc,%esp
c010048e:	50                   	push   %eax
c010048f:	68 80 16 10 c0       	push   $0xc0101680
c0100494:	6a 26                	push   $0x26
c0100496:	68 0c 16 10 c0       	push   $0xc010160c
c010049b:	68 2c 16 10 c0       	push   $0xc010162c
c01004a0:	e8 9b 0a 00 00       	call   c0100f40 <printk>
c01004a5:	b8 01 00 00 00       	mov    $0x1,%eax
c01004aa:	d6                   	(bad)  
c01004ab:	83 c4 20             	add    $0x20,%esp
c01004ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004b1:	c9                   	leave  
c01004b2:	c3                   	ret    
c01004b3:	90                   	nop
c01004b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01004b8:	fa                   	cli    
c01004b9:	83 ec 08             	sub    $0x8,%esp
c01004bc:	ff 73 18             	pushl  0x18(%ebx)
c01004bf:	ff 73 10             	pushl  0x10(%ebx)
c01004c2:	e8 79 00 00 00       	call   c0100540 <add_irq_handle>
c01004c7:	fb                   	sti    
c01004c8:	83 c4 10             	add    $0x10,%esp
c01004cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004ce:	c9                   	leave  
c01004cf:	c3                   	ret    
c01004d0:	83 ec 0c             	sub    $0xc,%esp
c01004d3:	ff 73 10             	pushl  0x10(%ebx)
c01004d6:	e8 55 07 00 00       	call   c0100c30 <mm_brk>
c01004db:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
c01004e2:	83 c4 10             	add    $0x10,%esp
c01004e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004e8:	c9                   	leave  
c01004e9:	c3                   	ret    
c01004ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004f0:	8b 43 10             	mov    0x10(%ebx),%eax
c01004f3:	83 e8 01             	sub    $0x1,%eax
c01004f6:	83 f8 01             	cmp    $0x1,%eax
c01004f9:	76 27                	jbe    c0100522 <do_syscall+0xb2>
c01004fb:	83 ec 0c             	sub    $0xc,%esp
c01004fe:	68 ee 15 10 c0       	push   $0xc01015ee
c0100503:	68 80 16 10 c0       	push   $0xc0101680
c0100508:	6a 21                	push   $0x21
c010050a:	68 0c 16 10 c0       	push   $0xc010160c
c010050f:	68 f4 14 10 c0       	push   $0xc01014f4
c0100514:	e8 27 0a 00 00       	call   c0100f40 <printk>
c0100519:	b8 01 00 00 00       	mov    $0x1,%eax
c010051e:	d6                   	(bad)  
c010051f:	83 c4 20             	add    $0x20,%esp
c0100522:	8b 53 14             	mov    0x14(%ebx),%edx
c0100525:	8b 4b 18             	mov    0x18(%ebx),%ecx
c0100528:	b8 02 00 00 00       	mov    $0x2,%eax
c010052d:	d6                   	(bad)  
c010052e:	89 53 1c             	mov    %edx,0x1c(%ebx)
c0100531:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100534:	c9                   	leave  
c0100535:	c3                   	ret    
c0100536:	66 90                	xchg   %ax,%ax
c0100538:	66 90                	xchg   %ax,%ax
c010053a:	66 90                	xchg   %ax,%ax
c010053c:	66 90                	xchg   %ax,%ax
c010053e:	66 90                	xchg   %ax,%ax

c0100540 <add_irq_handle>:
c0100540:	55                   	push   %ebp
c0100541:	89 e5                	mov    %esp,%ebp
c0100543:	53                   	push   %ebx
c0100544:	83 ec 04             	sub    $0x4,%esp
c0100547:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010054a:	83 fb 0f             	cmp    $0xf,%ebx
c010054d:	7f 71                	jg     c01005c0 <add_irq_handle+0x80>
c010054f:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100554:	83 f8 20             	cmp    $0x20,%eax
c0100557:	7e 2c                	jle    c0100585 <add_irq_handle+0x45>
c0100559:	83 ec 0c             	sub    $0xc,%esp
c010055c:	68 ba 16 10 c0       	push   $0xc01016ba
c0100561:	68 a1 17 10 c0       	push   $0xc01017a1
c0100566:	6a 16                	push   $0x16
c0100568:	68 9e 16 10 c0       	push   $0xc010169e
c010056d:	68 f4 14 10 c0       	push   $0xc01014f4
c0100572:	e8 c9 09 00 00       	call   c0100f40 <printk>
c0100577:	b8 01 00 00 00       	mov    $0x1,%eax
c010057c:	d6                   	(bad)  
c010057d:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100582:	83 c4 20             	add    $0x20,%esp
c0100585:	8d 50 01             	lea    0x1(%eax),%edx
c0100588:	89 15 00 40 12 c0    	mov    %edx,0xc0124000
c010058e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100591:	89 14 c5 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,8)
c0100598:	8b 14 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%edx
c010059f:	89 14 c5 84 40 12 c0 	mov    %edx,-0x3fedbf7c(,%eax,8)
c01005a6:	8d 04 c5 80 40 12 c0 	lea    -0x3fedbf80(,%eax,8),%eax
c01005ad:	89 04 9d 40 40 12 c0 	mov    %eax,-0x3fedbfc0(,%ebx,4)
c01005b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005b7:	c9                   	leave  
c01005b8:	c3                   	ret    
c01005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01005c0:	83 ec 0c             	sub    $0xc,%esp
c01005c3:	68 8b 16 10 c0       	push   $0xc010168b
c01005c8:	68 a1 17 10 c0       	push   $0xc01017a1
c01005cd:	6a 15                	push   $0x15
c01005cf:	68 9e 16 10 c0       	push   $0xc010169e
c01005d4:	68 f4 14 10 c0       	push   $0xc01014f4
c01005d9:	e8 62 09 00 00       	call   c0100f40 <printk>
c01005de:	b8 01 00 00 00       	mov    $0x1,%eax
c01005e3:	d6                   	(bad)  
c01005e4:	83 c4 20             	add    $0x20,%esp
c01005e7:	e9 63 ff ff ff       	jmp    c010054f <add_irq_handle+0xf>
c01005ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01005f0 <irq_handle>:
c01005f0:	55                   	push   %ebp
c01005f1:	89 e5                	mov    %esp,%ebp
c01005f3:	53                   	push   %ebx
c01005f4:	83 ec 04             	sub    $0x4,%esp
c01005f7:	8b 55 08             	mov    0x8(%ebp),%edx
c01005fa:	8b 42 20             	mov    0x20(%edx),%eax
c01005fd:	85 c0                	test   %eax,%eax
c01005ff:	0f 88 9b 00 00 00    	js     c01006a0 <irq_handle+0xb0>
c0100605:	3d 80 00 00 00       	cmp    $0x80,%eax
c010060a:	0f 84 b8 00 00 00    	je     c01006c8 <irq_handle+0xd8>
c0100610:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100615:	7e 59                	jle    c0100670 <irq_handle+0x80>
c0100617:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c010061d:	83 fb 0f             	cmp    $0xf,%ebx
c0100620:	7f 1e                	jg     c0100640 <irq_handle+0x50>
c0100622:	8b 1c 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%ebx
c0100629:	85 db                	test   %ebx,%ebx
c010062b:	74 0c                	je     c0100639 <irq_handle+0x49>
c010062d:	8d 76 00             	lea    0x0(%esi),%esi
c0100630:	ff 13                	call   *(%ebx)
c0100632:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100635:	85 db                	test   %ebx,%ebx
c0100637:	75 f7                	jne    c0100630 <irq_handle+0x40>
c0100639:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010063c:	c9                   	leave  
c010063d:	c3                   	ret    
c010063e:	66 90                	xchg   %ax,%ax
c0100640:	83 ec 0c             	sub    $0xc,%esp
c0100643:	68 d8 16 10 c0       	push   $0xc01016d8
c0100648:	68 96 17 10 c0       	push   $0xc0101796
c010064d:	6a 30                	push   $0x30
c010064f:	68 9e 16 10 c0       	push   $0xc010169e
c0100654:	68 f4 14 10 c0       	push   $0xc01014f4
c0100659:	e8 e2 08 00 00       	call   c0100f40 <printk>
c010065e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100663:	d6                   	(bad)  
c0100664:	83 c4 20             	add    $0x20,%esp
c0100667:	eb b9                	jmp    c0100622 <irq_handle+0x32>
c0100669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100670:	83 ec 08             	sub    $0x8,%esp
c0100673:	ff 72 28             	pushl  0x28(%edx)
c0100676:	50                   	push   %eax
c0100677:	68 96 17 10 c0       	push   $0xc0101796
c010067c:	6a 2d                	push   $0x2d
c010067e:	68 9e 16 10 c0       	push   $0xc010169e
c0100683:	68 3c 17 10 c0       	push   $0xc010173c
c0100688:	e8 b3 08 00 00       	call   c0100f40 <printk>
c010068d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100692:	d6                   	(bad)  
c0100693:	83 c4 20             	add    $0x20,%esp
c0100696:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100699:	c9                   	leave  
c010069a:	c3                   	ret    
c010069b:	90                   	nop
c010069c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006a0:	68 96 17 10 c0       	push   $0xc0101796
c01006a5:	6a 29                	push   $0x29
c01006a7:	68 9e 16 10 c0       	push   $0xc010169e
c01006ac:	68 f0 16 10 c0       	push   $0xc01016f0
c01006b1:	e8 8a 08 00 00       	call   c0100f40 <printk>
c01006b6:	b8 01 00 00 00       	mov    $0x1,%eax
c01006bb:	d6                   	(bad)  
c01006bc:	83 c4 10             	add    $0x10,%esp
c01006bf:	e9 75 ff ff ff       	jmp    c0100639 <irq_handle+0x49>
c01006c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006c8:	89 55 08             	mov    %edx,0x8(%ebp)
c01006cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006ce:	c9                   	leave  
c01006cf:	e9 9c fd ff ff       	jmp    c0100470 <do_syscall>
c01006d4:	66 90                	xchg   %ax,%ax
c01006d6:	66 90                	xchg   %ax,%ax
c01006d8:	66 90                	xchg   %ax,%ax
c01006da:	66 90                	xchg   %ax,%ax
c01006dc:	66 90                	xchg   %ax,%ax
c01006de:	66 90                	xchg   %ax,%ax

c01006e0 <init_i8259>:
c01006e0:	55                   	push   %ebp
c01006e1:	ba 21 00 00 00       	mov    $0x21,%edx
c01006e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01006eb:	89 e5                	mov    %esp,%ebp
c01006ed:	ee                   	out    %al,(%dx)
c01006ee:	b2 a1                	mov    $0xa1,%dl
c01006f0:	ee                   	out    %al,(%dx)
c01006f1:	b8 11 00 00 00       	mov    $0x11,%eax
c01006f6:	b2 20                	mov    $0x20,%dl
c01006f8:	ee                   	out    %al,(%dx)
c01006f9:	b8 20 00 00 00       	mov    $0x20,%eax
c01006fe:	b2 21                	mov    $0x21,%dl
c0100700:	ee                   	out    %al,(%dx)
c0100701:	b8 04 00 00 00       	mov    $0x4,%eax
c0100706:	ee                   	out    %al,(%dx)
c0100707:	b8 03 00 00 00       	mov    $0x3,%eax
c010070c:	ee                   	out    %al,(%dx)
c010070d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100712:	b2 a0                	mov    $0xa0,%dl
c0100714:	ee                   	out    %al,(%dx)
c0100715:	b8 28 00 00 00       	mov    $0x28,%eax
c010071a:	b2 a1                	mov    $0xa1,%dl
c010071c:	ee                   	out    %al,(%dx)
c010071d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100722:	ee                   	out    %al,(%dx)
c0100723:	b8 03 00 00 00       	mov    $0x3,%eax
c0100728:	ee                   	out    %al,(%dx)
c0100729:	b8 68 00 00 00       	mov    $0x68,%eax
c010072e:	b2 20                	mov    $0x20,%dl
c0100730:	ee                   	out    %al,(%dx)
c0100731:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100736:	ee                   	out    %al,(%dx)
c0100737:	b8 68 00 00 00       	mov    $0x68,%eax
c010073c:	b2 a0                	mov    $0xa0,%dl
c010073e:	ee                   	out    %al,(%dx)
c010073f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100744:	ee                   	out    %al,(%dx)
c0100745:	5d                   	pop    %ebp
c0100746:	c3                   	ret    
c0100747:	66 90                	xchg   %ax,%ax
c0100749:	66 90                	xchg   %ax,%ax
c010074b:	66 90                	xchg   %ax,%ax
c010074d:	66 90                	xchg   %ax,%ax
c010074f:	90                   	nop

c0100750 <init_idt>:
c0100750:	55                   	push   %ebp
c0100751:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100756:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c010075b:	89 d1                	mov    %edx,%ecx
c010075d:	c1 ea 10             	shr    $0x10,%edx
c0100760:	89 e5                	mov    %esp,%ebp
c0100762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100768:	66 89 08             	mov    %cx,(%eax)
c010076b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100771:	83 c0 08             	add    $0x8,%eax
c0100774:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100778:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010077c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100780:	3d c0 49 12 c0       	cmp    $0xc01249c0,%eax
c0100785:	75 e1                	jne    c0100768 <init_idt+0x18>
c0100787:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010078c:	ba 08 00 00 00       	mov    $0x8,%edx
c0100791:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100796:	66 a3 c0 41 12 c0    	mov    %ax,0xc01241c0
c010079c:	c1 e8 10             	shr    $0x10,%eax
c010079f:	66 89 15 c2 41 12 c0 	mov    %dx,0xc01241c2
c01007a6:	66 a3 c6 41 12 c0    	mov    %ax,0xc01241c6
c01007ac:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c01007b1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007b6:	66 a3 c8 41 12 c0    	mov    %ax,0xc01241c8
c01007bc:	c1 e8 10             	shr    $0x10,%eax
c01007bf:	66 89 0d ca 41 12 c0 	mov    %cx,0xc01241ca
c01007c6:	66 a3 ce 41 12 c0    	mov    %ax,0xc01241ce
c01007cc:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c01007d1:	66 89 15 d2 41 12 c0 	mov    %dx,0xc01241d2
c01007d8:	66 a3 d0 41 12 c0    	mov    %ax,0xc01241d0
c01007de:	c1 e8 10             	shr    $0x10,%eax
c01007e1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007e6:	66 a3 d6 41 12 c0    	mov    %ax,0xc01241d6
c01007ec:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c01007f1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007f6:	66 a3 d8 41 12 c0    	mov    %ax,0xc01241d8
c01007fc:	c1 e8 10             	shr    $0x10,%eax
c01007ff:	66 89 0d da 41 12 c0 	mov    %cx,0xc01241da
c0100806:	66 a3 de 41 12 c0    	mov    %ax,0xc01241de
c010080c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100811:	66 89 15 e2 41 12 c0 	mov    %dx,0xc01241e2
c0100818:	66 a3 e0 41 12 c0    	mov    %ax,0xc01241e0
c010081e:	c1 e8 10             	shr    $0x10,%eax
c0100821:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100826:	66 a3 e6 41 12 c0    	mov    %ax,0xc01241e6
c010082c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100831:	ba 08 00 00 00       	mov    $0x8,%edx
c0100836:	66 a3 e8 41 12 c0    	mov    %ax,0xc01241e8
c010083c:	c1 e8 10             	shr    $0x10,%eax
c010083f:	66 89 0d ea 41 12 c0 	mov    %cx,0xc01241ea
c0100846:	66 a3 ee 41 12 c0    	mov    %ax,0xc01241ee
c010084c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100851:	66 89 15 f2 41 12 c0 	mov    %dx,0xc01241f2
c0100858:	66 a3 f0 41 12 c0    	mov    %ax,0xc01241f0
c010085e:	c1 e8 10             	shr    $0x10,%eax
c0100861:	c6 05 c4 41 12 c0 00 	movb   $0x0,0xc01241c4
c0100868:	c6 05 c5 41 12 c0 8f 	movb   $0x8f,0xc01241c5
c010086f:	c6 05 cc 41 12 c0 00 	movb   $0x0,0xc01241cc
c0100876:	b9 08 00 00 00       	mov    $0x8,%ecx
c010087b:	c6 05 cd 41 12 c0 8f 	movb   $0x8f,0xc01241cd
c0100882:	c6 05 d4 41 12 c0 00 	movb   $0x0,0xc01241d4
c0100889:	ba 08 00 00 00       	mov    $0x8,%edx
c010088e:	c6 05 d5 41 12 c0 8f 	movb   $0x8f,0xc01241d5
c0100895:	c6 05 dc 41 12 c0 00 	movb   $0x0,0xc01241dc
c010089c:	c6 05 dd 41 12 c0 8f 	movb   $0x8f,0xc01241dd
c01008a3:	c6 05 e4 41 12 c0 00 	movb   $0x0,0xc01241e4
c01008aa:	c6 05 e5 41 12 c0 8f 	movb   $0x8f,0xc01241e5
c01008b1:	c6 05 ec 41 12 c0 00 	movb   $0x0,0xc01241ec
c01008b8:	c6 05 ed 41 12 c0 8f 	movb   $0x8f,0xc01241ed
c01008bf:	c6 05 f4 41 12 c0 00 	movb   $0x0,0xc01241f4
c01008c6:	c6 05 f5 41 12 c0 8f 	movb   $0x8f,0xc01241f5
c01008cd:	66 a3 f6 41 12 c0    	mov    %ax,0xc01241f6
c01008d3:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c01008d8:	66 a3 f8 41 12 c0    	mov    %ax,0xc01241f8
c01008de:	c1 e8 10             	shr    $0x10,%eax
c01008e1:	66 89 0d fa 41 12 c0 	mov    %cx,0xc01241fa
c01008e8:	66 a3 fe 41 12 c0    	mov    %ax,0xc01241fe
c01008ee:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c01008f3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008f8:	66 a3 00 42 12 c0    	mov    %ax,0xc0124200
c01008fe:	c1 e8 10             	shr    $0x10,%eax
c0100901:	66 89 15 02 42 12 c0 	mov    %dx,0xc0124202
c0100908:	66 a3 06 42 12 c0    	mov    %ax,0xc0124206
c010090e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100913:	66 89 0d 0a 42 12 c0 	mov    %cx,0xc012420a
c010091a:	66 a3 08 42 12 c0    	mov    %ax,0xc0124208
c0100920:	c1 e8 10             	shr    $0x10,%eax
c0100923:	ba 08 00 00 00       	mov    $0x8,%edx
c0100928:	66 a3 0e 42 12 c0    	mov    %ax,0xc012420e
c010092e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100933:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100938:	66 a3 10 42 12 c0    	mov    %ax,0xc0124210
c010093e:	c1 e8 10             	shr    $0x10,%eax
c0100941:	66 89 15 12 42 12 c0 	mov    %dx,0xc0124212
c0100948:	66 a3 16 42 12 c0    	mov    %ax,0xc0124216
c010094e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100953:	66 89 0d 1a 42 12 c0 	mov    %cx,0xc012421a
c010095a:	66 a3 18 42 12 c0    	mov    %ax,0xc0124218
c0100960:	c1 e8 10             	shr    $0x10,%eax
c0100963:	ba 08 00 00 00       	mov    $0x8,%edx
c0100968:	66 a3 1e 42 12 c0    	mov    %ax,0xc012421e
c010096e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100973:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100978:	66 a3 20 42 12 c0    	mov    %ax,0xc0124220
c010097e:	c1 e8 10             	shr    $0x10,%eax
c0100981:	66 89 15 22 42 12 c0 	mov    %dx,0xc0124222
c0100988:	66 a3 26 42 12 c0    	mov    %ax,0xc0124226
c010098e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100993:	66 89 0d 2a 42 12 c0 	mov    %cx,0xc012422a
c010099a:	66 a3 28 42 12 c0    	mov    %ax,0xc0124228
c01009a0:	c1 e8 10             	shr    $0x10,%eax
c01009a3:	c6 05 fc 41 12 c0 00 	movb   $0x0,0xc01241fc
c01009aa:	c6 05 fd 41 12 c0 8f 	movb   $0x8f,0xc01241fd
c01009b1:	c6 05 04 42 12 c0 00 	movb   $0x0,0xc0124204
c01009b8:	ba 08 00 00 00       	mov    $0x8,%edx
c01009bd:	c6 05 05 42 12 c0 8f 	movb   $0x8f,0xc0124205
c01009c4:	c6 05 0c 42 12 c0 00 	movb   $0x0,0xc012420c
c01009cb:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009d0:	c6 05 0d 42 12 c0 8f 	movb   $0x8f,0xc012420d
c01009d7:	c6 05 14 42 12 c0 00 	movb   $0x0,0xc0124214
c01009de:	c6 05 15 42 12 c0 8f 	movb   $0x8f,0xc0124215
c01009e5:	c6 05 1c 42 12 c0 00 	movb   $0x0,0xc012421c
c01009ec:	c6 05 1d 42 12 c0 8f 	movb   $0x8f,0xc012421d
c01009f3:	c6 05 24 42 12 c0 00 	movb   $0x0,0xc0124224
c01009fa:	c6 05 25 42 12 c0 8f 	movb   $0x8f,0xc0124225
c0100a01:	c6 05 2c 42 12 c0 00 	movb   $0x0,0xc012422c
c0100a08:	66 a3 2e 42 12 c0    	mov    %ax,0xc012422e
c0100a0e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0100a13:	66 89 15 32 42 12 c0 	mov    %dx,0xc0124232
c0100a1a:	66 a3 30 42 12 c0    	mov    %ax,0xc0124230
c0100a20:	c1 e8 10             	shr    $0x10,%eax
c0100a23:	66 89 0d c2 45 12 c0 	mov    %cx,0xc01245c2
c0100a2a:	66 a3 36 42 12 c0    	mov    %ax,0xc0124236
c0100a30:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100a35:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a3a:	66 a3 c0 45 12 c0    	mov    %ax,0xc01245c0
c0100a40:	c1 e8 10             	shr    $0x10,%eax
c0100a43:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a48:	66 a3 c6 45 12 c0    	mov    %ax,0xc01245c6
c0100a4e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a53:	c6 05 2d 42 12 c0 8f 	movb   $0x8f,0xc012422d
c0100a5a:	66 a3 c0 42 12 c0    	mov    %ax,0xc01242c0
c0100a60:	c1 e8 10             	shr    $0x10,%eax
c0100a63:	c6 05 34 42 12 c0 00 	movb   $0x0,0xc0124234
c0100a6a:	66 a3 c6 42 12 c0    	mov    %ax,0xc01242c6
c0100a70:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a75:	c6 05 35 42 12 c0 8f 	movb   $0x8f,0xc0124235
c0100a7c:	66 a3 30 43 12 c0    	mov    %ax,0xc0124330
c0100a82:	c1 e8 10             	shr    $0x10,%eax
c0100a85:	c6 05 c4 45 12 c0 00 	movb   $0x0,0xc01245c4
c0100a8c:	66 a3 36 43 12 c0    	mov    %ax,0xc0124336
c0100a92:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100a97:	c6 05 c5 45 12 c0 ef 	movb   $0xef,0xc01245c5
c0100a9e:	66 a3 80 41 12 c0    	mov    %ax,0xc0124180
c0100aa4:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c0100aa9:	66 89 15 c2 42 12 c0 	mov    %dx,0xc01242c2
c0100ab0:	66 a3 82 41 12 c0    	mov    %ax,0xc0124182
c0100ab6:	c1 e8 10             	shr    $0x10,%eax
c0100ab9:	c6 05 c4 42 12 c0 00 	movb   $0x0,0xc01242c4
c0100ac0:	66 a3 84 41 12 c0    	mov    %ax,0xc0124184
c0100ac6:	c6 05 c5 42 12 c0 8e 	movb   $0x8e,0xc01242c5
c0100acd:	b8 80 41 12 c0       	mov    $0xc0124180,%eax
c0100ad2:	66 89 0d 32 43 12 c0 	mov    %cx,0xc0124332
c0100ad9:	c6 05 34 43 12 c0 00 	movb   $0x0,0xc0124334
c0100ae0:	c6 05 35 43 12 c0 8e 	movb   $0x8e,0xc0124335
c0100ae7:	0f 01 18             	lidtl  (%eax)
c0100aea:	5d                   	pop    %ebp
c0100aeb:	c3                   	ret    
c0100aec:	66 90                	xchg   %ax,%ax
c0100aee:	66 90                	xchg   %ax,%ax

c0100af0 <create_video_mapping>:
c0100af0:	55                   	push   %ebp
c0100af1:	89 e5                	mov    %esp,%ebp
c0100af3:	53                   	push   %ebx
c0100af4:	83 ec 04             	sub    $0x4,%esp
c0100af7:	e8 14 01 00 00       	call   c0100c10 <get_updir>
c0100afc:	89 c3                	mov    %eax,%ebx
c0100afe:	e8 0d 01 00 00       	call   c0100c10 <get_updir>
c0100b03:	39 c3                	cmp    %eax,%ebx
c0100b05:	74 27                	je     c0100b2e <create_video_mapping+0x3e>
c0100b07:	83 ec 0c             	sub    $0xc,%esp
c0100b0a:	68 b0 17 10 c0       	push   $0xc01017b0
c0100b0f:	68 13 18 10 c0       	push   $0xc0101813
c0100b14:	6a 19                	push   $0x19
c0100b16:	68 d6 17 10 c0       	push   $0xc01017d6
c0100b1b:	68 f4 14 10 c0       	push   $0xc01014f4
c0100b20:	e8 1b 04 00 00       	call   c0100f40 <printk>
c0100b25:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b2a:	d6                   	(bad)  
c0100b2b:	83 c4 20             	add    $0x20,%esp
c0100b2e:	ba 00 50 12 00       	mov    $0x125000,%edx
c0100b33:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100b38:	b8 80 52 12 c0       	mov    $0xc0125280,%eax
c0100b3d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b43:	83 ca 07             	or     $0x7,%edx
c0100b46:	89 13                	mov    %edx,(%ebx)
c0100b48:	90                   	nop
c0100b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b50:	89 ca                	mov    %ecx,%edx
c0100b52:	83 c0 04             	add    $0x4,%eax
c0100b55:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b5b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b61:	83 ca 07             	or     $0x7,%edx
c0100b64:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b67:	3d c0 52 12 c0       	cmp    $0xc01252c0,%eax
c0100b6c:	75 e2                	jne    c0100b50 <create_video_mapping+0x60>
c0100b6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b71:	c9                   	leave  
c0100b72:	c3                   	ret    
c0100b73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b80 <video_mapping_write_test>:
c0100b80:	55                   	push   %ebp
c0100b81:	31 c0                	xor    %eax,%eax
c0100b83:	89 e5                	mov    %esp,%ebp
c0100b85:	8d 76 00             	lea    0x0(%esi),%esi
c0100b88:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100b8f:	83 c0 01             	add    $0x1,%eax
c0100b92:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100b97:	75 ef                	jne    c0100b88 <video_mapping_write_test+0x8>
c0100b99:	5d                   	pop    %ebp
c0100b9a:	c3                   	ret    
c0100b9b:	90                   	nop
c0100b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100ba0 <video_mapping_read_test>:
c0100ba0:	55                   	push   %ebp
c0100ba1:	89 e5                	mov    %esp,%ebp
c0100ba3:	56                   	push   %esi
c0100ba4:	be 01 00 00 00       	mov    $0x1,%esi
c0100ba9:	53                   	push   %ebx
c0100baa:	31 db                	xor    %ebx,%ebx
c0100bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100bb0:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100bb7:	74 24                	je     c0100bdd <video_mapping_read_test+0x3d>
c0100bb9:	83 ec 0c             	sub    $0xc,%esp
c0100bbc:	68 ef 17 10 c0       	push   $0xc01017ef
c0100bc1:	68 fb 17 10 c0       	push   $0xc01017fb
c0100bc6:	6a 30                	push   $0x30
c0100bc8:	68 d6 17 10 c0       	push   $0xc01017d6
c0100bcd:	68 f4 14 10 c0       	push   $0xc01014f4
c0100bd2:	e8 69 03 00 00       	call   c0100f40 <printk>
c0100bd7:	89 f0                	mov    %esi,%eax
c0100bd9:	d6                   	(bad)  
c0100bda:	83 c4 20             	add    $0x20,%esp
c0100bdd:	83 c3 01             	add    $0x1,%ebx
c0100be0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100be6:	75 c8                	jne    c0100bb0 <video_mapping_read_test+0x10>
c0100be8:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100beb:	5b                   	pop    %ebx
c0100bec:	5e                   	pop    %esi
c0100bed:	5d                   	pop    %ebp
c0100bee:	c3                   	ret    
c0100bef:	90                   	nop

c0100bf0 <video_mapping_clear>:
c0100bf0:	55                   	push   %ebp
c0100bf1:	89 e5                	mov    %esp,%ebp
c0100bf3:	83 ec 0c             	sub    $0xc,%esp
c0100bf6:	68 00 fa 00 00       	push   $0xfa00
c0100bfb:	6a 00                	push   $0x0
c0100bfd:	68 00 00 0a 00       	push   $0xa0000
c0100c02:	e8 31 08 00 00       	call   c0101438 <memset>
c0100c07:	83 c4 10             	add    $0x10,%esp
c0100c0a:	c9                   	leave  
c0100c0b:	c3                   	ret    
c0100c0c:	66 90                	xchg   %ax,%ax
c0100c0e:	66 90                	xchg   %ax,%ax

c0100c10 <get_updir>:
c0100c10:	55                   	push   %ebp
c0100c11:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100c16:	89 e5                	mov    %esp,%ebp
c0100c18:	5d                   	pop    %ebp
c0100c19:	c3                   	ret    
c0100c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c20 <get_ucr3>:
c0100c20:	55                   	push   %ebp
c0100c21:	a1 04 60 12 c0       	mov    0xc0126004,%eax
c0100c26:	89 e5                	mov    %esp,%ebp
c0100c28:	5d                   	pop    %ebp
c0100c29:	c3                   	ret    
c0100c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c30 <mm_brk>:
c0100c30:	55                   	push   %ebp
c0100c31:	89 e5                	mov    %esp,%ebp
c0100c33:	53                   	push   %ebx
c0100c34:	83 ec 04             	sub    $0x4,%esp
c0100c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100c3a:	a1 00 60 12 c0       	mov    0xc0126000,%eax
c0100c3f:	39 d8                	cmp    %ebx,%eax
c0100c41:	73 11                	jae    c0100c54 <mm_brk+0x24>
c0100c43:	89 da                	mov    %ebx,%edx
c0100c45:	83 ec 08             	sub    $0x8,%esp
c0100c48:	29 c2                	sub    %eax,%edx
c0100c4a:	52                   	push   %edx
c0100c4b:	50                   	push   %eax
c0100c4c:	e8 ff f3 ff ff       	call   c0100050 <mm_malloc>
c0100c51:	83 c4 10             	add    $0x10,%esp
c0100c54:	89 1d 00 60 12 c0    	mov    %ebx,0xc0126000
c0100c5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c5d:	c9                   	leave  
c0100c5e:	c3                   	ret    
c0100c5f:	90                   	nop

c0100c60 <init_mm>:
c0100c60:	55                   	push   %ebp
c0100c61:	89 e5                	mov    %esp,%ebp
c0100c63:	53                   	push   %ebx
c0100c64:	83 ec 04             	sub    $0x4,%esp
c0100c67:	e8 54 00 00 00       	call   c0100cc0 <get_kpdir>
c0100c6c:	83 ec 04             	sub    $0x4,%esp
c0100c6f:	89 c3                	mov    %eax,%ebx
c0100c71:	68 00 10 00 00       	push   $0x1000
c0100c76:	6a 00                	push   $0x0
c0100c78:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100c7e:	68 00 70 12 c0       	push   $0xc0127000
c0100c83:	e8 b0 07 00 00       	call   c0101438 <memset>
c0100c88:	83 c4 0c             	add    $0xc,%esp
c0100c8b:	68 80 00 00 00       	push   $0x80
c0100c90:	53                   	push   %ebx
c0100c91:	68 00 7c 12 c0       	push   $0xc0127c00
c0100c96:	e8 55 07 00 00       	call   c01013f0 <memcpy>
c0100c9b:	b8 00 70 12 00       	mov    $0x127000,%eax
c0100ca0:	83 c4 10             	add    $0x10,%esp
c0100ca3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ca6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cab:	a3 04 60 12 c0       	mov    %eax,0xc0126004
c0100cb0:	c9                   	leave  
c0100cb1:	c3                   	ret    
c0100cb2:	66 90                	xchg   %ax,%ax
c0100cb4:	66 90                	xchg   %ax,%ax
c0100cb6:	66 90                	xchg   %ax,%ax
c0100cb8:	66 90                	xchg   %ax,%ax
c0100cba:	66 90                	xchg   %ax,%ax
c0100cbc:	66 90                	xchg   %ax,%ax
c0100cbe:	66 90                	xchg   %ax,%ax

c0100cc0 <get_kpdir>:
c0100cc0:	55                   	push   %ebp
c0100cc1:	b8 00 90 14 c0       	mov    $0xc0149000,%eax
c0100cc6:	89 e5                	mov    %esp,%ebp
c0100cc8:	5d                   	pop    %ebp
c0100cc9:	c3                   	ret    
c0100cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100cd0 <init_page>:
c0100cd0:	55                   	push   %ebp
c0100cd1:	89 e5                	mov    %esp,%ebp
c0100cd3:	57                   	push   %edi
c0100cd4:	83 ec 08             	sub    $0x8,%esp
c0100cd7:	68 00 10 00 00       	push   $0x1000
c0100cdc:	6a 00                	push   $0x0
c0100cde:	68 00 90 14 00       	push   $0x149000
c0100ce3:	e8 50 07 00 00       	call   c0101438 <memset>
c0100ce8:	b9 00 90 14 00       	mov    $0x149000,%ecx
c0100ced:	83 c4 10             	add    $0x10,%esp
c0100cf0:	ba 00 90 12 00       	mov    $0x129000,%edx
c0100cf5:	8d 76 00             	lea    0x0(%esi),%esi
c0100cf8:	89 d0                	mov    %edx,%eax
c0100cfa:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100d00:	83 c1 04             	add    $0x4,%ecx
c0100d03:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d08:	83 c8 07             	or     $0x7,%eax
c0100d0b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100d0e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100d14:	81 fa 00 90 14 00    	cmp    $0x149000,%edx
c0100d1a:	75 dc                	jne    c0100cf8 <init_page+0x28>
c0100d1c:	bf fc 8f 14 00       	mov    $0x148ffc,%edi
c0100d21:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100d26:	fd                   	std    
c0100d27:	ab                   	stos   %eax,%es:(%edi)
c0100d28:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100d2d:	7d f8                	jge    c0100d27 <init_page+0x57>
c0100d2f:	b8 00 90 14 00       	mov    $0x149000,%eax
c0100d34:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d39:	0f 22 d8             	mov    %eax,%cr3
c0100d3c:	0f 20 c0             	mov    %cr0,%eax
c0100d3f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100d44:	0f 22 c0             	mov    %eax,%cr0
c0100d47:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100d4a:	c9                   	leave  
c0100d4b:	c3                   	ret    
c0100d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d50 <init_segment>:
c0100d50:	55                   	push   %ebp
c0100d51:	89 e5                	mov    %esp,%ebp
c0100d53:	83 ec 0c             	sub    $0xc,%esp
c0100d56:	6a 18                	push   $0x18
c0100d58:	6a 00                	push   $0x0
c0100d5a:	68 08 80 12 c0       	push   $0xc0128008
c0100d5f:	e8 d4 06 00 00       	call   c0101438 <memset>
c0100d64:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d69:	31 c9                	xor    %ecx,%ecx
c0100d6b:	b8 08 80 12 c0       	mov    $0xc0128008,%eax
c0100d70:	66 89 15 10 80 12 c0 	mov    %dx,0xc0128010
c0100d77:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d7c:	66 89 0d 12 80 12 c0 	mov    %cx,0xc0128012
c0100d83:	66 89 15 18 80 12 c0 	mov    %dx,0xc0128018
c0100d8a:	ba 17 00 00 00       	mov    $0x17,%edx
c0100d8f:	31 c9                	xor    %ecx,%ecx
c0100d91:	66 89 15 00 80 12 c0 	mov    %dx,0xc0128000
c0100d98:	66 a3 02 80 12 c0    	mov    %ax,0xc0128002
c0100d9e:	c1 e8 10             	shr    $0x10,%eax
c0100da1:	66 a3 04 80 12 c0    	mov    %ax,0xc0128004
c0100da7:	c6 05 14 80 12 c0 00 	movb   $0x0,0xc0128014
c0100dae:	b8 00 80 12 c0       	mov    $0xc0128000,%eax
c0100db3:	c6 05 15 80 12 c0 9a 	movb   $0x9a,0xc0128015
c0100dba:	c6 05 16 80 12 c0 cf 	movb   $0xcf,0xc0128016
c0100dc1:	c6 05 17 80 12 c0 00 	movb   $0x0,0xc0128017
c0100dc8:	66 89 0d 1a 80 12 c0 	mov    %cx,0xc012801a
c0100dcf:	c6 05 1c 80 12 c0 00 	movb   $0x0,0xc012801c
c0100dd6:	c6 05 1d 80 12 c0 92 	movb   $0x92,0xc012801d
c0100ddd:	c6 05 1e 80 12 c0 cf 	movb   $0xcf,0xc012801e
c0100de4:	c6 05 1f 80 12 c0 00 	movb   $0x0,0xc012801f
c0100deb:	0f 01 10             	lgdtl  (%eax)
c0100dee:	83 c4 10             	add    $0x10,%esp
c0100df1:	c9                   	leave  
c0100df2:	c3                   	ret    
c0100df3:	66 90                	xchg   %ax,%ax
c0100df5:	66 90                	xchg   %ax,%ax
c0100df7:	66 90                	xchg   %ax,%ax
c0100df9:	66 90                	xchg   %ax,%ax
c0100dfb:	66 90                	xchg   %ax,%ax
c0100dfd:	66 90                	xchg   %ax,%ax
c0100dff:	90                   	nop

c0100e00 <loader>:
c0100e00:	55                   	push   %ebp
c0100e01:	89 e5                	mov    %esp,%ebp
c0100e03:	57                   	push   %edi
c0100e04:	56                   	push   %esi
c0100e05:	53                   	push   %ebx
c0100e06:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100e0c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100e12:	68 00 10 00 00       	push   $0x1000
c0100e17:	6a 00                	push   $0x0
c0100e19:	53                   	push   %ebx
c0100e1a:	e8 91 01 00 00       	call   c0100fb0 <ramdisk_read>
c0100e1f:	83 c4 10             	add    $0x10,%esp
c0100e22:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100e29:	45 4c 46 
c0100e2c:	74 06                	je     c0100e34 <loader+0x34>
c0100e2e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e33:	d6                   	(bad)  
c0100e34:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100e3a:	83 fa 34             	cmp    $0x34,%edx
c0100e3d:	74 06                	je     c0100e45 <loader+0x45>
c0100e3f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e44:	d6                   	(bad)  
c0100e45:	31 f6                	xor    %esi,%esi
c0100e47:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100e4e:	00 
c0100e4f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e53:	75 1c                	jne    c0100e71 <loader+0x71>
c0100e55:	eb 79                	jmp    c0100ed0 <loader+0xd0>
c0100e57:	89 f6                	mov    %esi,%esi
c0100e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e60:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e67:	83 c6 01             	add    $0x1,%esi
c0100e6a:	83 c3 20             	add    $0x20,%ebx
c0100e6d:	39 f0                	cmp    %esi,%eax
c0100e6f:	7e 5f                	jle    c0100ed0 <loader+0xd0>
c0100e71:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100e75:	75 e9                	jne    c0100e60 <loader+0x60>
c0100e77:	83 ec 08             	sub    $0x8,%esp
c0100e7a:	ff 33                	pushl  (%ebx)
c0100e7c:	ff 73 f4             	pushl  -0xc(%ebx)
c0100e7f:	e8 cc f1 ff ff       	call   c0100050 <mm_malloc>
c0100e84:	83 c4 0c             	add    $0xc,%esp
c0100e87:	ff 73 fc             	pushl  -0x4(%ebx)
c0100e8a:	ff 73 f0             	pushl  -0x10(%ebx)
c0100e8d:	50                   	push   %eax
c0100e8e:	89 c7                	mov    %eax,%edi
c0100e90:	e8 1b 01 00 00       	call   c0100fb0 <ramdisk_read>
c0100e95:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100e98:	8b 13                	mov    (%ebx),%edx
c0100e9a:	83 c4 0c             	add    $0xc,%esp
c0100e9d:	29 c2                	sub    %eax,%edx
c0100e9f:	52                   	push   %edx
c0100ea0:	6a 00                	push   $0x0
c0100ea2:	03 43 f0             	add    -0x10(%ebx),%eax
c0100ea5:	01 c7                	add    %eax,%edi
c0100ea7:	57                   	push   %edi
c0100ea8:	e8 8b 05 00 00       	call   c0101438 <memset>
c0100ead:	8b 03                	mov    (%ebx),%eax
c0100eaf:	03 43 f4             	add    -0xc(%ebx),%eax
c0100eb2:	83 c4 10             	add    $0x10,%esp
c0100eb5:	83 e8 01             	sub    $0x1,%eax
c0100eb8:	3b 05 00 60 12 c0    	cmp    0xc0126000,%eax
c0100ebe:	76 a0                	jbe    c0100e60 <loader+0x60>
c0100ec0:	a3 00 60 12 c0       	mov    %eax,0xc0126000
c0100ec5:	eb 99                	jmp    c0100e60 <loader+0x60>
c0100ec7:	89 f6                	mov    %esi,%esi
c0100ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100ed0:	83 ec 08             	sub    $0x8,%esp
c0100ed3:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100ed9:	68 00 00 10 00       	push   $0x100000
c0100ede:	68 00 00 f0 bf       	push   $0xbff00000
c0100ee3:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100ee9:	e8 62 f1 ff ff       	call   c0100050 <mm_malloc>
c0100eee:	e8 fd fb ff ff       	call   c0100af0 <create_video_mapping>
c0100ef3:	e8 28 fd ff ff       	call   c0100c20 <get_ucr3>
c0100ef8:	0f 22 d8             	mov    %eax,%cr3
c0100efb:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100f01:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100f04:	5b                   	pop    %ebx
c0100f05:	5e                   	pop    %esi
c0100f06:	5f                   	pop    %edi
c0100f07:	5d                   	pop    %ebp
c0100f08:	c3                   	ret    
c0100f09:	66 90                	xchg   %ax,%ax
c0100f0b:	66 90                	xchg   %ax,%ax
c0100f0d:	66 90                	xchg   %ax,%ax
c0100f0f:	90                   	nop

c0100f10 <sbrk>:
c0100f10:	55                   	push   %ebp
c0100f11:	89 e5                	mov    %esp,%ebp
c0100f13:	83 ec 08             	sub    $0x8,%esp
c0100f16:	68 3e 18 10 c0       	push   $0xc010183e
c0100f1b:	6a 08                	push   $0x8
c0100f1d:	68 28 18 10 c0       	push   $0xc0101828
c0100f22:	68 94 15 10 c0       	push   $0xc0101594
c0100f27:	e8 14 00 00 00       	call   c0100f40 <printk>
c0100f2c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f31:	d6                   	(bad)  
c0100f32:	30 c0                	xor    %al,%al
c0100f34:	c9                   	leave  
c0100f35:	c3                   	ret    
c0100f36:	66 90                	xchg   %ax,%ax
c0100f38:	66 90                	xchg   %ax,%ax
c0100f3a:	66 90                	xchg   %ax,%ax
c0100f3c:	66 90                	xchg   %ax,%ax
c0100f3e:	66 90                	xchg   %ax,%ax

c0100f40 <printk>:
c0100f40:	55                   	push   %ebp
c0100f41:	89 e5                	mov    %esp,%ebp
c0100f43:	5d                   	pop    %ebp
c0100f44:	c3                   	ret    
c0100f45:	66 90                	xchg   %ax,%ax
c0100f47:	66 90                	xchg   %ax,%ax
c0100f49:	66 90                	xchg   %ax,%ax
c0100f4b:	66 90                	xchg   %ax,%ax
c0100f4d:	66 90                	xchg   %ax,%ax
c0100f4f:	90                   	nop

c0100f50 <init_serial>:
c0100f50:	55                   	push   %ebp
c0100f51:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100f56:	31 c0                	xor    %eax,%eax
c0100f58:	89 e5                	mov    %esp,%ebp
c0100f5a:	ee                   	out    %al,(%dx)
c0100f5b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100f60:	b2 fb                	mov    $0xfb,%dl
c0100f62:	ee                   	out    %al,(%dx)
c0100f63:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f68:	b2 f8                	mov    $0xf8,%dl
c0100f6a:	ee                   	out    %al,(%dx)
c0100f6b:	31 c0                	xor    %eax,%eax
c0100f6d:	b2 f9                	mov    $0xf9,%dl
c0100f6f:	ee                   	out    %al,(%dx)
c0100f70:	b8 03 00 00 00       	mov    $0x3,%eax
c0100f75:	b2 fb                	mov    $0xfb,%dl
c0100f77:	ee                   	out    %al,(%dx)
c0100f78:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100f7d:	b2 fa                	mov    $0xfa,%dl
c0100f7f:	ee                   	out    %al,(%dx)
c0100f80:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100f85:	b2 fc                	mov    $0xfc,%dl
c0100f87:	ee                   	out    %al,(%dx)
c0100f88:	5d                   	pop    %ebp
c0100f89:	c3                   	ret    
c0100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100f90 <serial_printc>:
c0100f90:	55                   	push   %ebp
c0100f91:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100f96:	89 e5                	mov    %esp,%ebp
c0100f98:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f9b:	90                   	nop
c0100f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100fa0:	ec                   	in     (%dx),%al
c0100fa1:	a8 20                	test   $0x20,%al
c0100fa3:	74 fb                	je     c0100fa0 <serial_printc+0x10>
c0100fa5:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100faa:	89 c8                	mov    %ecx,%eax
c0100fac:	ee                   	out    %al,(%dx)
c0100fad:	5d                   	pop    %ebp
c0100fae:	c3                   	ret    
c0100faf:	90                   	nop

c0100fb0 <ramdisk_read>:
c0100fb0:	55                   	push   %ebp
c0100fb1:	89 e5                	mov    %esp,%ebp
c0100fb3:	53                   	push   %ebx
c0100fb4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100fb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100fba:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100fbd:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100fc0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100fc5:	76 06                	jbe    c0100fcd <ramdisk_read+0x1d>
c0100fc7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fcc:	d6                   	(bad)  
c0100fcd:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100fd0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100fd3:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100fd6:	5b                   	pop    %ebx
c0100fd7:	5d                   	pop    %ebp
c0100fd8:	e9 13 04 00 00       	jmp    c01013f0 <memcpy>
c0100fdd:	8d 76 00             	lea    0x0(%esi),%esi

c0100fe0 <ramdisk_write>:
c0100fe0:	55                   	push   %ebp
c0100fe1:	89 e5                	mov    %esp,%ebp
c0100fe3:	53                   	push   %ebx
c0100fe4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100fe7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100fea:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100fed:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100ff0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100ff5:	76 06                	jbe    c0100ffd <ramdisk_write+0x1d>
c0100ff7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ffc:	d6                   	(bad)  
c0100ffd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0101000:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101003:	89 55 08             	mov    %edx,0x8(%ebp)
c0101006:	5b                   	pop    %ebx
c0101007:	5d                   	pop    %ebp
c0101008:	e9 e3 03 00 00       	jmp    c01013f0 <memcpy>
c010100d:	66 90                	xchg   %ax,%ax
c010100f:	90                   	nop

c0101010 <ide_intr>:
c0101010:	55                   	push   %ebp
c0101011:	c7 05 04 a0 14 c0 01 	movl   $0x1,0xc014a004
c0101018:	00 00 00 
c010101b:	89 e5                	mov    %esp,%ebp
c010101d:	5d                   	pop    %ebp
c010101e:	c3                   	ret    
c010101f:	90                   	nop

c0101020 <ide_writeback>:
c0101020:	a1 00 a0 14 c0       	mov    0xc014a000,%eax
c0101025:	83 c0 01             	add    $0x1,%eax
c0101028:	83 f8 64             	cmp    $0x64,%eax
c010102b:	a3 00 a0 14 c0       	mov    %eax,0xc014a000
c0101030:	74 06                	je     c0101038 <ide_writeback+0x18>
c0101032:	c3                   	ret    
c0101033:	90                   	nop
c0101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101038:	55                   	push   %ebp
c0101039:	89 e5                	mov    %esp,%ebp
c010103b:	83 ec 08             	sub    $0x8,%esp
c010103e:	e8 dd 01 00 00       	call   c0101220 <buf_writeback>
c0101043:	c7 05 00 a0 14 c0 00 	movl   $0x0,0xc014a000
c010104a:	00 00 00 
c010104d:	c9                   	leave  
c010104e:	c3                   	ret    
c010104f:	90                   	nop

c0101050 <ide_read>:
c0101050:	55                   	push   %ebp
c0101051:	89 e5                	mov    %esp,%ebp
c0101053:	57                   	push   %edi
c0101054:	56                   	push   %esi
c0101055:	53                   	push   %ebx
c0101056:	83 ec 0c             	sub    $0xc,%esp
c0101059:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010105c:	8b 45 10             	mov    0x10(%ebp),%eax
c010105f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101062:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101065:	29 df                	sub    %ebx,%edi
c0101067:	85 c0                	test   %eax,%eax
c0101069:	74 1b                	je     c0101086 <ide_read+0x36>
c010106b:	90                   	nop
c010106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101070:	83 ec 0c             	sub    $0xc,%esp
c0101073:	53                   	push   %ebx
c0101074:	e8 07 02 00 00       	call   c0101280 <read_byte>
c0101079:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010107c:	83 c3 01             	add    $0x1,%ebx
c010107f:	83 c4 10             	add    $0x10,%esp
c0101082:	39 f3                	cmp    %esi,%ebx
c0101084:	75 ea                	jne    c0101070 <ide_read+0x20>
c0101086:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101089:	5b                   	pop    %ebx
c010108a:	5e                   	pop    %esi
c010108b:	5f                   	pop    %edi
c010108c:	5d                   	pop    %ebp
c010108d:	c3                   	ret    
c010108e:	66 90                	xchg   %ax,%ax

c0101090 <ide_write>:
c0101090:	55                   	push   %ebp
c0101091:	89 e5                	mov    %esp,%ebp
c0101093:	57                   	push   %edi
c0101094:	56                   	push   %esi
c0101095:	53                   	push   %ebx
c0101096:	83 ec 0c             	sub    $0xc,%esp
c0101099:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010109c:	8b 45 10             	mov    0x10(%ebp),%eax
c010109f:	8b 7d 08             	mov    0x8(%ebp),%edi
c01010a2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c01010a5:	29 df                	sub    %ebx,%edi
c01010a7:	85 c0                	test   %eax,%eax
c01010a9:	74 1d                	je     c01010c8 <ide_write+0x38>
c01010ab:	90                   	nop
c01010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010b0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c01010b4:	83 ec 08             	sub    $0x8,%esp
c01010b7:	50                   	push   %eax
c01010b8:	53                   	push   %ebx
c01010b9:	83 c3 01             	add    $0x1,%ebx
c01010bc:	e8 ef 01 00 00       	call   c01012b0 <write_byte>
c01010c1:	83 c4 10             	add    $0x10,%esp
c01010c4:	39 f3                	cmp    %esi,%ebx
c01010c6:	75 e8                	jne    c01010b0 <ide_write+0x20>
c01010c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01010cb:	5b                   	pop    %ebx
c01010cc:	5e                   	pop    %esi
c01010cd:	5f                   	pop    %edi
c01010ce:	5d                   	pop    %ebp
c01010cf:	c3                   	ret    

c01010d0 <clear_ide_intr>:
c01010d0:	55                   	push   %ebp
c01010d1:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c01010d8:	00 00 00 
c01010db:	89 e5                	mov    %esp,%ebp
c01010dd:	5d                   	pop    %ebp
c01010de:	c3                   	ret    
c01010df:	90                   	nop

c01010e0 <wait_ide_intr>:
c01010e0:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010e5:	55                   	push   %ebp
c01010e6:	89 e5                	mov    %esp,%ebp
c01010e8:	85 c0                	test   %eax,%eax
c01010ea:	75 0e                	jne    c01010fa <wait_ide_intr+0x1a>
c01010ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010f0:	f4                   	hlt    
c01010f1:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010f6:	85 c0                	test   %eax,%eax
c01010f8:	74 f6                	je     c01010f0 <wait_ide_intr+0x10>
c01010fa:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c0101101:	00 00 00 
c0101104:	5d                   	pop    %ebp
c0101105:	c3                   	ret    
c0101106:	8d 76 00             	lea    0x0(%esi),%esi
c0101109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101110 <init_ide>:
c0101110:	55                   	push   %ebp
c0101111:	89 e5                	mov    %esp,%ebp
c0101113:	83 ec 08             	sub    $0x8,%esp
c0101116:	e8 d5 00 00 00       	call   c01011f0 <buf_init>
c010111b:	83 ec 08             	sub    $0x8,%esp
c010111e:	68 20 10 10 c0       	push   $0xc0101020
c0101123:	6a 00                	push   $0x0
c0101125:	e8 16 f4 ff ff       	call   c0100540 <add_irq_handle>
c010112a:	58                   	pop    %eax
c010112b:	5a                   	pop    %edx
c010112c:	68 10 10 10 c0       	push   $0xc0101010
c0101131:	6a 0e                	push   $0xe
c0101133:	e8 08 f4 ff ff       	call   c0100540 <add_irq_handle>
c0101138:	83 c4 10             	add    $0x10,%esp
c010113b:	c9                   	leave  
c010113c:	c3                   	ret    
c010113d:	66 90                	xchg   %ax,%ax
c010113f:	90                   	nop

c0101140 <buf_fetch>:
c0101140:	55                   	push   %ebp
c0101141:	89 c2                	mov    %eax,%edx
c0101143:	89 e5                	mov    %esp,%ebp
c0101145:	57                   	push   %edi
c0101146:	56                   	push   %esi
c0101147:	53                   	push   %ebx
c0101148:	89 c3                	mov    %eax,%ebx
c010114a:	83 e3 7f             	and    $0x7f,%ebx
c010114d:	89 d8                	mov    %ebx,%eax
c010114f:	83 ec 1c             	sub    $0x1c,%esp
c0101152:	c1 e0 09             	shl    $0x9,%eax
c0101155:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101158:	8d 81 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%eax
c010115e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101162:	74 5c                	je     c01011c0 <buf_fetch+0x80>
c0101164:	89 d7                	mov    %edx,%edi
c0101166:	89 da                	mov    %ebx,%edx
c0101168:	c1 e2 09             	shl    $0x9,%edx
c010116b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010116e:	8d 91 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%edx
c0101174:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010117a:	74 54                	je     c01011d0 <buf_fetch+0x90>
c010117c:	8d 72 06             	lea    0x6(%edx),%esi
c010117f:	83 ec 08             	sub    $0x8,%esp
c0101182:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101185:	57                   	push   %edi
c0101186:	56                   	push   %esi
c0101187:	e8 a4 01 00 00       	call   c0101330 <disk_do_read>
c010118c:	89 da                	mov    %ebx,%edx
c010118e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101191:	83 c4 10             	add    $0x10,%esp
c0101194:	c1 e2 09             	shl    $0x9,%edx
c0101197:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010119a:	c6 81 44 a0 14 c0 01 	movb   $0x1,-0x3feb5fbc(%ecx)
c01011a1:	89 b9 40 a0 14 c0    	mov    %edi,-0x3feb5fc0(%ecx)
c01011a7:	c6 81 45 a0 14 c0 00 	movb   $0x0,-0x3feb5fbb(%ecx)
c01011ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01011b1:	5b                   	pop    %ebx
c01011b2:	5e                   	pop    %esi
c01011b3:	5f                   	pop    %edi
c01011b4:	5d                   	pop    %ebp
c01011b5:	c3                   	ret    
c01011b6:	8d 76 00             	lea    0x0(%esi),%esi
c01011b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01011c0:	39 91 40 a0 14 c0    	cmp    %edx,-0x3feb5fc0(%ecx)
c01011c6:	75 9c                	jne    c0101164 <buf_fetch+0x24>
c01011c8:	eb e4                	jmp    c01011ae <buf_fetch+0x6e>
c01011ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01011d0:	8d 72 06             	lea    0x6(%edx),%esi
c01011d3:	83 ec 08             	sub    $0x8,%esp
c01011d6:	ff b1 40 a0 14 c0    	pushl  -0x3feb5fc0(%ecx)
c01011dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01011df:	56                   	push   %esi
c01011e0:	e8 8b 01 00 00       	call   c0101370 <disk_do_write>
c01011e5:	83 c4 10             	add    $0x10,%esp
c01011e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011eb:	eb 92                	jmp    c010117f <buf_fetch+0x3f>
c01011ed:	8d 76 00             	lea    0x0(%esi),%esi

c01011f0 <buf_init>:
c01011f0:	55                   	push   %ebp
c01011f1:	b8 44 a0 14 c0       	mov    $0xc014a044,%eax
c01011f6:	89 e5                	mov    %esp,%ebp
c01011f8:	90                   	nop
c01011f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101200:	c6 00 00             	movb   $0x0,(%eax)
c0101203:	05 08 02 00 00       	add    $0x208,%eax
c0101208:	3d 44 a4 15 c0       	cmp    $0xc015a444,%eax
c010120d:	75 f1                	jne    c0101200 <buf_init+0x10>
c010120f:	5d                   	pop    %ebp
c0101210:	c3                   	ret    
c0101211:	eb 0d                	jmp    c0101220 <buf_writeback>
c0101213:	90                   	nop
c0101214:	90                   	nop
c0101215:	90                   	nop
c0101216:	90                   	nop
c0101217:	90                   	nop
c0101218:	90                   	nop
c0101219:	90                   	nop
c010121a:	90                   	nop
c010121b:	90                   	nop
c010121c:	90                   	nop
c010121d:	90                   	nop
c010121e:	90                   	nop
c010121f:	90                   	nop

c0101220 <buf_writeback>:
c0101220:	55                   	push   %ebp
c0101221:	89 e5                	mov    %esp,%ebp
c0101223:	53                   	push   %ebx
c0101224:	bb 46 a0 14 c0       	mov    $0xc014a046,%ebx
c0101229:	83 ec 04             	sub    $0x4,%esp
c010122c:	eb 10                	jmp    c010123e <buf_writeback+0x1e>
c010122e:	66 90                	xchg   %ax,%ax
c0101230:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101236:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c010123c:	74 32                	je     c0101270 <buf_writeback+0x50>
c010123e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101242:	75 ec                	jne    c0101230 <buf_writeback+0x10>
c0101244:	83 ec 08             	sub    $0x8,%esp
c0101247:	ff 73 fa             	pushl  -0x6(%ebx)
c010124a:	53                   	push   %ebx
c010124b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101251:	e8 1a 01 00 00       	call   c0101370 <disk_do_write>
c0101256:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010125d:	83 c4 10             	add    $0x10,%esp
c0101260:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c0101266:	75 d6                	jne    c010123e <buf_writeback+0x1e>
c0101268:	90                   	nop
c0101269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101270:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101273:	c9                   	leave  
c0101274:	c3                   	ret    
c0101275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101280 <read_byte>:
c0101280:	55                   	push   %ebp
c0101281:	89 e5                	mov    %esp,%ebp
c0101283:	53                   	push   %ebx
c0101284:	83 ec 04             	sub    $0x4,%esp
c0101287:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010128a:	89 d8                	mov    %ebx,%eax
c010128c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101292:	c1 e8 09             	shr    $0x9,%eax
c0101295:	e8 a6 fe ff ff       	call   c0101140 <buf_fetch>
c010129a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010129f:	83 c4 04             	add    $0x4,%esp
c01012a2:	5b                   	pop    %ebx
c01012a3:	5d                   	pop    %ebp
c01012a4:	c3                   	ret    
c01012a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01012a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01012b0 <write_byte>:
c01012b0:	55                   	push   %ebp
c01012b1:	89 e5                	mov    %esp,%ebp
c01012b3:	56                   	push   %esi
c01012b4:	53                   	push   %ebx
c01012b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01012b8:	8b 75 0c             	mov    0xc(%ebp),%esi
c01012bb:	89 d8                	mov    %ebx,%eax
c01012bd:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c01012c3:	c1 e8 09             	shr    $0x9,%eax
c01012c6:	e8 75 fe ff ff       	call   c0101140 <buf_fetch>
c01012cb:	89 f2                	mov    %esi,%edx
c01012cd:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c01012d1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c01012d5:	5b                   	pop    %ebx
c01012d6:	5e                   	pop    %esi
c01012d7:	5d                   	pop    %ebp
c01012d8:	c3                   	ret    
c01012d9:	66 90                	xchg   %ax,%ax
c01012db:	66 90                	xchg   %ax,%ax
c01012dd:	66 90                	xchg   %ax,%ax
c01012df:	90                   	nop

c01012e0 <ide_prepare>:
c01012e0:	55                   	push   %ebp
c01012e1:	89 c1                	mov    %eax,%ecx
c01012e3:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012e8:	89 e5                	mov    %esp,%ebp
c01012ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012f0:	ec                   	in     (%dx),%al
c01012f1:	83 e0 c0             	and    $0xffffffc0,%eax
c01012f4:	3c 40                	cmp    $0x40,%al
c01012f6:	75 f8                	jne    c01012f0 <ide_prepare+0x10>
c01012f8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01012fd:	31 c0                	xor    %eax,%eax
c01012ff:	ee                   	out    %al,(%dx)
c0101300:	b8 01 00 00 00       	mov    $0x1,%eax
c0101305:	b2 f2                	mov    $0xf2,%dl
c0101307:	ee                   	out    %al,(%dx)
c0101308:	b2 f3                	mov    $0xf3,%dl
c010130a:	89 c8                	mov    %ecx,%eax
c010130c:	ee                   	out    %al,(%dx)
c010130d:	89 c8                	mov    %ecx,%eax
c010130f:	b2 f4                	mov    $0xf4,%dl
c0101311:	c1 e8 08             	shr    $0x8,%eax
c0101314:	ee                   	out    %al,(%dx)
c0101315:	89 c8                	mov    %ecx,%eax
c0101317:	b2 f5                	mov    $0xf5,%dl
c0101319:	c1 e8 10             	shr    $0x10,%eax
c010131c:	ee                   	out    %al,(%dx)
c010131d:	89 c8                	mov    %ecx,%eax
c010131f:	b2 f6                	mov    $0xf6,%dl
c0101321:	c1 e8 18             	shr    $0x18,%eax
c0101324:	83 c8 e0             	or     $0xffffffe0,%eax
c0101327:	ee                   	out    %al,(%dx)
c0101328:	5d                   	pop    %ebp
c0101329:	c3                   	ret    
c010132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101330 <disk_do_read>:
c0101330:	55                   	push   %ebp
c0101331:	89 e5                	mov    %esp,%ebp
c0101333:	53                   	push   %ebx
c0101334:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101337:	e8 a4 ff ff ff       	call   c01012e0 <ide_prepare>
c010133c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101341:	b8 20 00 00 00       	mov    $0x20,%eax
c0101346:	ee                   	out    %al,(%dx)
c0101347:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010134a:	b2 f0                	mov    $0xf0,%dl
c010134c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101358:	ed                   	in     (%dx),%eax
c0101359:	89 01                	mov    %eax,(%ecx)
c010135b:	83 c1 04             	add    $0x4,%ecx
c010135e:	39 d9                	cmp    %ebx,%ecx
c0101360:	75 f6                	jne    c0101358 <disk_do_read+0x28>
c0101362:	5b                   	pop    %ebx
c0101363:	5d                   	pop    %ebp
c0101364:	c3                   	ret    
c0101365:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101370 <disk_do_write>:
c0101370:	55                   	push   %ebp
c0101371:	89 e5                	mov    %esp,%ebp
c0101373:	53                   	push   %ebx
c0101374:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101377:	e8 64 ff ff ff       	call   c01012e0 <ide_prepare>
c010137c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101381:	b8 30 00 00 00       	mov    $0x30,%eax
c0101386:	ee                   	out    %al,(%dx)
c0101387:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010138a:	b2 f0                	mov    $0xf0,%dl
c010138c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101398:	8b 01                	mov    (%ecx),%eax
c010139a:	ef                   	out    %eax,(%dx)
c010139b:	83 c1 04             	add    $0x4,%ecx
c010139e:	39 d9                	cmp    %ebx,%ecx
c01013a0:	75 f6                	jne    c0101398 <disk_do_write+0x28>
c01013a2:	5b                   	pop    %ebx
c01013a3:	5d                   	pop    %ebp
c01013a4:	c3                   	ret    
c01013a5:	66 90                	xchg   %ax,%ax
c01013a7:	66 90                	xchg   %ax,%ax
c01013a9:	66 90                	xchg   %ax,%ax
c01013ab:	66 90                	xchg   %ax,%ax
c01013ad:	66 90                	xchg   %ax,%ax
c01013af:	90                   	nop

c01013b0 <dma_prepare>:
c01013b0:	55                   	push   %ebp
c01013b1:	89 e5                	mov    %esp,%ebp
c01013b3:	83 ec 08             	sub    $0x8,%esp
c01013b6:	68 ac 18 10 c0       	push   $0xc01018ac
c01013bb:	6a 1d                	push   $0x1d
c01013bd:	68 43 18 10 c0       	push   $0xc0101843
c01013c2:	68 60 18 10 c0       	push   $0xc0101860
c01013c7:	e8 74 fb ff ff       	call   c0100f40 <printk>
c01013cc:	b8 01 00 00 00       	mov    $0x1,%eax
c01013d1:	d6                   	(bad)  
c01013d2:	83 c4 10             	add    $0x10,%esp
c01013d5:	c9                   	leave  
c01013d6:	c3                   	ret    
c01013d7:	89 f6                	mov    %esi,%esi
c01013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01013e0 <dma_issue_read>:
c01013e0:	55                   	push   %ebp
c01013e1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c01013e6:	89 e5                	mov    %esp,%ebp
c01013e8:	ec                   	in     (%dx),%al
c01013e9:	83 c8 09             	or     $0x9,%eax
c01013ec:	ee                   	out    %al,(%dx)
c01013ed:	5d                   	pop    %ebp
c01013ee:	c3                   	ret    
c01013ef:	90                   	nop

c01013f0 <memcpy>:
c01013f0:	55                   	push   %ebp
c01013f1:	89 e5                	mov    %esp,%ebp
c01013f3:	56                   	push   %esi
c01013f4:	57                   	push   %edi
c01013f5:	53                   	push   %ebx
c01013f6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013f9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013fc:	8b 75 0c             	mov    0xc(%ebp),%esi
c01013ff:	fc                   	cld    
c0101400:	83 f9 08             	cmp    $0x8,%ecx
c0101403:	76 26                	jbe    c010142b <memcpy+0x3b>
c0101405:	89 fa                	mov    %edi,%edx
c0101407:	89 cb                	mov    %ecx,%ebx
c0101409:	83 e2 03             	and    $0x3,%edx
c010140c:	74 10                	je     c010141e <memcpy+0x2e>
c010140e:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101413:	29 d1                	sub    %edx,%ecx
c0101415:	83 e1 03             	and    $0x3,%ecx
c0101418:	29 cb                	sub    %ecx,%ebx
c010141a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010141c:	89 d9                	mov    %ebx,%ecx
c010141e:	c1 e9 02             	shr    $0x2,%ecx
c0101421:	8d 76 00             	lea    0x0(%esi),%esi
c0101424:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101426:	89 d9                	mov    %ebx,%ecx
c0101428:	83 e1 03             	and    $0x3,%ecx
c010142b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010142d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101430:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101433:	5b                   	pop    %ebx
c0101434:	5f                   	pop    %edi
c0101435:	5e                   	pop    %esi
c0101436:	c9                   	leave  
c0101437:	c3                   	ret    

c0101438 <memset>:
c0101438:	55                   	push   %ebp
c0101439:	89 e5                	mov    %esp,%ebp
c010143b:	57                   	push   %edi
c010143c:	8b 7d 08             	mov    0x8(%ebp),%edi
c010143f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101443:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101446:	fc                   	cld    
c0101447:	83 f9 10             	cmp    $0x10,%ecx
c010144a:	76 69                	jbe    c01014b5 <memset+0x7d>
c010144c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101452:	74 4c                	je     c01014a0 <memset+0x68>
c0101454:	88 07                	mov    %al,(%edi)
c0101456:	47                   	inc    %edi
c0101457:	49                   	dec    %ecx
c0101458:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010145e:	74 40                	je     c01014a0 <memset+0x68>
c0101460:	88 07                	mov    %al,(%edi)
c0101462:	47                   	inc    %edi
c0101463:	49                   	dec    %ecx
c0101464:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010146a:	74 34                	je     c01014a0 <memset+0x68>
c010146c:	88 07                	mov    %al,(%edi)
c010146e:	47                   	inc    %edi
c010146f:	49                   	dec    %ecx
c0101470:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101476:	74 28                	je     c01014a0 <memset+0x68>
c0101478:	88 07                	mov    %al,(%edi)
c010147a:	47                   	inc    %edi
c010147b:	49                   	dec    %ecx
c010147c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101482:	74 1c                	je     c01014a0 <memset+0x68>
c0101484:	88 07                	mov    %al,(%edi)
c0101486:	47                   	inc    %edi
c0101487:	49                   	dec    %ecx
c0101488:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010148e:	74 10                	je     c01014a0 <memset+0x68>
c0101490:	88 07                	mov    %al,(%edi)
c0101492:	47                   	inc    %edi
c0101493:	49                   	dec    %ecx
c0101494:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010149a:	74 04                	je     c01014a0 <memset+0x68>
c010149c:	88 07                	mov    %al,(%edi)
c010149e:	47                   	inc    %edi
c010149f:	49                   	dec    %ecx
c01014a0:	88 c4                	mov    %al,%ah
c01014a2:	89 c2                	mov    %eax,%edx
c01014a4:	c1 e2 10             	shl    $0x10,%edx
c01014a7:	09 d0                	or     %edx,%eax
c01014a9:	89 ca                	mov    %ecx,%edx
c01014ab:	c1 e9 02             	shr    $0x2,%ecx
c01014ae:	83 e2 03             	and    $0x3,%edx
c01014b1:	f3 ab                	rep stos %eax,%es:(%edi)
c01014b3:	89 d1                	mov    %edx,%ecx
c01014b5:	f3 aa                	rep stos %al,%es:(%edi)
c01014b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01014ba:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01014bd:	5f                   	pop    %edi
c01014be:	c9                   	leave  
c01014bf:	c3                   	ret    
