
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
c010002b:	e9 f0 03 00 00       	jmp    c0100420 <init>

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
c0100066:	e8 65 0b 00 00       	call   c0100bd0 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 6e 0b 00 00       	call   c0100be0 <get_ucr3>
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
c010014c:	e8 a7 12 00 00       	call   c01013f8 <memset>
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
c0100178:	c7 44 24 10 a4 14 10 	movl   $0xc01014a4,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 08 15 10 	movl   $0xc0101508,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 93 14 10 	movl   $0xc0101493,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 b4 14 10 c0 	movl   $0xc01014b4,(%esp)
c010019f:	e8 5c 0d 00 00       	call   c0100f00 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 ac 14 10 	movl   $0xc01014ac,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 08 15 10 	movl   $0xc0101508,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 93 14 10 	movl   $0xc0101493,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 b4 14 10 c0 	movl   $0xc01014b4,(%esp)
c01001ee:	e8 0d 0d 00 00       	call   c0100f00 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 a4 14 10 	movl   $0xc01014a4,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 08 15 10 	movl   $0xc0101508,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 93 14 10 	movl   $0xc0101493,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 b4 14 10 c0 	movl   $0xc01014b4,(%esp)
c010022e:	e8 cd 0c 00 00       	call   c0100f00 <printk>
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
c0100258:	c7 44 24 10 ac 14 10 	movl   $0xc01014ac,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 08 15 10 	movl   $0xc0101508,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 93 14 10 	movl   $0xc0101493,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 b4 14 10 c0 	movl   $0xc01014b4,(%esp)
c010027f:	e8 7c 0c 00 00       	call   c0100f00 <printk>
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
c01002a8:	c7 44 24 10 80 14 10 	movl   $0xc0101480,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c fe 14 10 	movl   $0xc01014fe,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 93 14 10 	movl   $0xc0101493,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 b4 14 10 c0 	movl   $0xc01014b4,(%esp)
c01002cf:	e8 2c 0c 00 00       	call   c0100f00 <printk>
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
c010039a:	e8 f1 01 00 00       	call   c0100590 <irq_handle>
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
c01003b7:	e8 64 08 00 00       	call   c0100c20 <init_mm>
c01003bc:	68 9f 15 10 c0       	push   $0xc010159f
c01003c1:	6a 4a                	push   $0x4a
c01003c3:	68 0e 15 10 c0       	push   $0xc010150e
c01003c8:	68 20 15 10 c0       	push   $0xc0101520
c01003cd:	e8 2e 0b 00 00       	call   c0100f00 <printk>
c01003d2:	e8 69 07 00 00       	call   c0100b40 <video_mapping_write_test>
c01003d7:	e8 e4 09 00 00       	call   c0100dc0 <loader>
c01003dc:	89 c3                	mov    %eax,%ebx
c01003de:	e8 7d 07 00 00       	call   c0100b60 <video_mapping_read_test>
c01003e3:	e8 c8 07 00 00       	call   c0100bb0 <video_mapping_clear>
c01003e8:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003ed:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003f2:	83 ec 10             	sub    $0x10,%esp
c01003f5:	ff d3                	call   *%ebx
c01003f7:	68 9f 15 10 c0       	push   $0xc010159f
c01003fc:	6a 6b                	push   $0x6b
c01003fe:	68 0e 15 10 c0       	push   $0xc010150e
c0100403:	68 54 15 10 c0       	push   $0xc0101554
c0100408:	e8 f3 0a 00 00       	call   c0100f00 <printk>
c010040d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100412:	d6                   	(bad)  
c0100413:	83 c4 20             	add    $0x20,%esp
c0100416:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100419:	c9                   	leave  
c010041a:	c3                   	ret    
c010041b:	90                   	nop
c010041c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100420 <init>:
c0100420:	55                   	push   %ebp
c0100421:	89 e5                	mov    %esp,%ebp
c0100423:	83 ec 08             	sub    $0x8,%esp
c0100426:	e8 65 08 00 00       	call   c0100c90 <init_page>
c010042b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100431:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100436:	ff e0                	jmp    *%eax
c0100438:	68 a9 15 10 c0       	push   $0xc01015a9
c010043d:	6a 24                	push   $0x24
c010043f:	68 0e 15 10 c0       	push   $0xc010150e
c0100444:	68 54 15 10 c0       	push   $0xc0101554
c0100449:	e8 b2 0a 00 00       	call   c0100f00 <printk>
c010044e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100453:	d6                   	(bad)  
c0100454:	83 c4 10             	add    $0x10,%esp
c0100457:	c9                   	leave  
c0100458:	c3                   	ret    
c0100459:	66 90                	xchg   %ax,%ax
c010045b:	66 90                	xchg   %ax,%ax
c010045d:	66 90                	xchg   %ax,%ax
c010045f:	90                   	nop

c0100460 <do_syscall>:
c0100460:	55                   	push   %ebp
c0100461:	89 e5                	mov    %esp,%ebp
c0100463:	53                   	push   %ebx
c0100464:	83 ec 04             	sub    $0x4,%esp
c0100467:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010046a:	8b 43 08             	mov    0x8(%ebx),%eax
c010046d:	85 c0                	test   %eax,%eax
c010046f:	74 4f                	je     c01004c0 <do_syscall+0x60>
c0100471:	83 f8 2d             	cmp    $0x2d,%eax
c0100474:	74 2a                	je     c01004a0 <do_syscall+0x40>
c0100476:	83 ec 0c             	sub    $0xc,%esp
c0100479:	50                   	push   %eax
c010047a:	68 24 16 10 c0       	push   $0xc0101624
c010047f:	6a 20                	push   $0x20
c0100481:	68 b0 15 10 c0       	push   $0xc01015b0
c0100486:	68 d0 15 10 c0       	push   $0xc01015d0
c010048b:	e8 70 0a 00 00       	call   c0100f00 <printk>
c0100490:	b8 01 00 00 00       	mov    $0x1,%eax
c0100495:	d6                   	(bad)  
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010049c:	c9                   	leave  
c010049d:	c3                   	ret    
c010049e:	66 90                	xchg   %ax,%ax
c01004a0:	83 ec 0c             	sub    $0xc,%esp
c01004a3:	ff 73 04             	pushl  0x4(%ebx)
c01004a6:	e8 45 07 00 00       	call   c0100bf0 <mm_brk>
c01004ab:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c01004b2:	83 c4 10             	add    $0x10,%esp
c01004b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004b8:	c9                   	leave  
c01004b9:	c3                   	ret    
c01004ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004c0:	fa                   	cli    
c01004c1:	83 ec 08             	sub    $0x8,%esp
c01004c4:	ff 73 1c             	pushl  0x1c(%ebx)
c01004c7:	ff 73 04             	pushl  0x4(%ebx)
c01004ca:	e8 11 00 00 00       	call   c01004e0 <add_irq_handle>
c01004cf:	fb                   	sti    
c01004d0:	83 c4 10             	add    $0x10,%esp
c01004d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004d6:	c9                   	leave  
c01004d7:	c3                   	ret    
c01004d8:	66 90                	xchg   %ax,%ax
c01004da:	66 90                	xchg   %ax,%ax
c01004dc:	66 90                	xchg   %ax,%ax
c01004de:	66 90                	xchg   %ax,%ax

c01004e0 <add_irq_handle>:
c01004e0:	55                   	push   %ebp
c01004e1:	89 e5                	mov    %esp,%ebp
c01004e3:	53                   	push   %ebx
c01004e4:	83 ec 04             	sub    $0x4,%esp
c01004e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01004ea:	83 fb 0f             	cmp    $0xf,%ebx
c01004ed:	7f 71                	jg     c0100560 <add_irq_handle+0x80>
c01004ef:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c01004f4:	83 f8 20             	cmp    $0x20,%eax
c01004f7:	7e 2c                	jle    c0100525 <add_irq_handle+0x45>
c01004f9:	83 ec 0c             	sub    $0xc,%esp
c01004fc:	68 5e 16 10 c0       	push   $0xc010165e
c0100501:	68 ad 17 10 c0       	push   $0xc01017ad
c0100506:	6a 16                	push   $0x16
c0100508:	68 42 16 10 c0       	push   $0xc0101642
c010050d:	68 b4 14 10 c0       	push   $0xc01014b4
c0100512:	e8 e9 09 00 00       	call   c0100f00 <printk>
c0100517:	b8 01 00 00 00       	mov    $0x1,%eax
c010051c:	d6                   	(bad)  
c010051d:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100522:	83 c4 20             	add    $0x20,%esp
c0100525:	8d 50 01             	lea    0x1(%eax),%edx
c0100528:	89 15 00 40 12 c0    	mov    %edx,0xc0124000
c010052e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100531:	89 14 c5 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,8)
c0100538:	8b 14 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%edx
c010053f:	89 14 c5 84 40 12 c0 	mov    %edx,-0x3fedbf7c(,%eax,8)
c0100546:	8d 04 c5 80 40 12 c0 	lea    -0x3fedbf80(,%eax,8),%eax
c010054d:	89 04 9d 40 40 12 c0 	mov    %eax,-0x3fedbfc0(,%ebx,4)
c0100554:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100557:	c9                   	leave  
c0100558:	c3                   	ret    
c0100559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	68 2f 16 10 c0       	push   $0xc010162f
c0100568:	68 ad 17 10 c0       	push   $0xc01017ad
c010056d:	6a 15                	push   $0x15
c010056f:	68 42 16 10 c0       	push   $0xc0101642
c0100574:	68 b4 14 10 c0       	push   $0xc01014b4
c0100579:	e8 82 09 00 00       	call   c0100f00 <printk>
c010057e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100583:	d6                   	(bad)  
c0100584:	83 c4 20             	add    $0x20,%esp
c0100587:	e9 63 ff ff ff       	jmp    c01004ef <add_irq_handle+0xf>
c010058c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100590 <irq_handle>:
c0100590:	55                   	push   %ebp
c0100591:	89 e5                	mov    %esp,%ebp
c0100593:	53                   	push   %ebx
c0100594:	83 ec 04             	sub    $0x4,%esp
c0100597:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010059a:	68 a2 17 10 c0       	push   $0xc01017a2
c010059f:	6a 24                	push   $0x24
c01005a1:	68 42 16 10 c0       	push   $0xc0101642
c01005a6:	68 94 16 10 c0       	push   $0xc0101694
c01005ab:	e8 50 09 00 00       	call   c0100f00 <printk>
c01005b0:	b8 01 00 00 00       	mov    $0x1,%eax
c01005b5:	d6                   	(bad)  
c01005b6:	8b 43 30             	mov    0x30(%ebx),%eax
c01005b9:	83 c4 10             	add    $0x10,%esp
c01005bc:	85 c0                	test   %eax,%eax
c01005be:	0f 88 9c 00 00 00    	js     c0100660 <irq_handle+0xd0>
c01005c4:	3d 80 00 00 00       	cmp    $0x80,%eax
c01005c9:	0f 84 b9 00 00 00    	je     c0100688 <irq_handle+0xf8>
c01005cf:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01005d4:	7e 5a                	jle    c0100630 <irq_handle+0xa0>
c01005d6:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c01005dc:	83 fb 0f             	cmp    $0xf,%ebx
c01005df:	7f 1f                	jg     c0100600 <irq_handle+0x70>
c01005e1:	8b 1c 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%ebx
c01005e8:	85 db                	test   %ebx,%ebx
c01005ea:	74 0d                	je     c01005f9 <irq_handle+0x69>
c01005ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005f0:	ff 13                	call   *(%ebx)
c01005f2:	8b 5b 04             	mov    0x4(%ebx),%ebx
c01005f5:	85 db                	test   %ebx,%ebx
c01005f7:	75 f7                	jne    c01005f0 <irq_handle+0x60>
c01005f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005fc:	c9                   	leave  
c01005fd:	c3                   	ret    
c01005fe:	66 90                	xchg   %ax,%ax
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 7c 16 10 c0       	push   $0xc010167c
c0100608:	68 a2 17 10 c0       	push   $0xc01017a2
c010060d:	6a 30                	push   $0x30
c010060f:	68 42 16 10 c0       	push   $0xc0101642
c0100614:	68 b4 14 10 c0       	push   $0xc01014b4
c0100619:	e8 e2 08 00 00       	call   c0100f00 <printk>
c010061e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100623:	d6                   	(bad)  
c0100624:	83 c4 20             	add    $0x20,%esp
c0100627:	eb b8                	jmp    c01005e1 <irq_handle+0x51>
c0100629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100630:	83 ec 08             	sub    $0x8,%esp
c0100633:	ff 73 0c             	pushl  0xc(%ebx)
c0100636:	50                   	push   %eax
c0100637:	68 a2 17 10 c0       	push   $0xc01017a2
c010063c:	6a 2d                	push   $0x2d
c010063e:	68 42 16 10 c0       	push   $0xc0101642
c0100643:	68 48 17 10 c0       	push   $0xc0101748
c0100648:	e8 b3 08 00 00       	call   c0100f00 <printk>
c010064d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100652:	d6                   	(bad)  
c0100653:	83 c4 20             	add    $0x20,%esp
c0100656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100659:	c9                   	leave  
c010065a:	c3                   	ret    
c010065b:	90                   	nop
c010065c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100660:	68 a2 17 10 c0       	push   $0xc01017a2
c0100665:	6a 29                	push   $0x29
c0100667:	68 42 16 10 c0       	push   $0xc0101642
c010066c:	68 fc 16 10 c0       	push   $0xc01016fc
c0100671:	e8 8a 08 00 00       	call   c0100f00 <printk>
c0100676:	b8 01 00 00 00       	mov    $0x1,%eax
c010067b:	d6                   	(bad)  
c010067c:	83 c4 10             	add    $0x10,%esp
c010067f:	e9 75 ff ff ff       	jmp    c01005f9 <irq_handle+0x69>
c0100684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100688:	89 5d 08             	mov    %ebx,0x8(%ebp)
c010068b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010068e:	c9                   	leave  
c010068f:	e9 cc fd ff ff       	jmp    c0100460 <do_syscall>
c0100694:	66 90                	xchg   %ax,%ax
c0100696:	66 90                	xchg   %ax,%ax
c0100698:	66 90                	xchg   %ax,%ax
c010069a:	66 90                	xchg   %ax,%ax
c010069c:	66 90                	xchg   %ax,%ax
c010069e:	66 90                	xchg   %ax,%ax

c01006a0 <init_i8259>:
c01006a0:	55                   	push   %ebp
c01006a1:	ba 21 00 00 00       	mov    $0x21,%edx
c01006a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01006ab:	89 e5                	mov    %esp,%ebp
c01006ad:	ee                   	out    %al,(%dx)
c01006ae:	b2 a1                	mov    $0xa1,%dl
c01006b0:	ee                   	out    %al,(%dx)
c01006b1:	b8 11 00 00 00       	mov    $0x11,%eax
c01006b6:	b2 20                	mov    $0x20,%dl
c01006b8:	ee                   	out    %al,(%dx)
c01006b9:	b8 20 00 00 00       	mov    $0x20,%eax
c01006be:	b2 21                	mov    $0x21,%dl
c01006c0:	ee                   	out    %al,(%dx)
c01006c1:	b8 04 00 00 00       	mov    $0x4,%eax
c01006c6:	ee                   	out    %al,(%dx)
c01006c7:	b8 03 00 00 00       	mov    $0x3,%eax
c01006cc:	ee                   	out    %al,(%dx)
c01006cd:	b8 11 00 00 00       	mov    $0x11,%eax
c01006d2:	b2 a0                	mov    $0xa0,%dl
c01006d4:	ee                   	out    %al,(%dx)
c01006d5:	b8 28 00 00 00       	mov    $0x28,%eax
c01006da:	b2 a1                	mov    $0xa1,%dl
c01006dc:	ee                   	out    %al,(%dx)
c01006dd:	b8 02 00 00 00       	mov    $0x2,%eax
c01006e2:	ee                   	out    %al,(%dx)
c01006e3:	b8 03 00 00 00       	mov    $0x3,%eax
c01006e8:	ee                   	out    %al,(%dx)
c01006e9:	b8 68 00 00 00       	mov    $0x68,%eax
c01006ee:	b2 20                	mov    $0x20,%dl
c01006f0:	ee                   	out    %al,(%dx)
c01006f1:	b8 0a 00 00 00       	mov    $0xa,%eax
c01006f6:	ee                   	out    %al,(%dx)
c01006f7:	b8 68 00 00 00       	mov    $0x68,%eax
c01006fc:	b2 a0                	mov    $0xa0,%dl
c01006fe:	ee                   	out    %al,(%dx)
c01006ff:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100704:	ee                   	out    %al,(%dx)
c0100705:	5d                   	pop    %ebp
c0100706:	c3                   	ret    
c0100707:	66 90                	xchg   %ax,%ax
c0100709:	66 90                	xchg   %ax,%ax
c010070b:	66 90                	xchg   %ax,%ax
c010070d:	66 90                	xchg   %ax,%ax
c010070f:	90                   	nop

c0100710 <init_idt>:
c0100710:	55                   	push   %ebp
c0100711:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100716:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c010071b:	89 d1                	mov    %edx,%ecx
c010071d:	c1 ea 10             	shr    $0x10,%edx
c0100720:	89 e5                	mov    %esp,%ebp
c0100722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100728:	66 89 08             	mov    %cx,(%eax)
c010072b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100731:	83 c0 08             	add    $0x8,%eax
c0100734:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100738:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010073c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100740:	3d c0 49 12 c0       	cmp    $0xc01249c0,%eax
c0100745:	75 e1                	jne    c0100728 <init_idt+0x18>
c0100747:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010074c:	ba 08 00 00 00       	mov    $0x8,%edx
c0100751:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100756:	66 a3 c0 41 12 c0    	mov    %ax,0xc01241c0
c010075c:	c1 e8 10             	shr    $0x10,%eax
c010075f:	66 89 15 c2 41 12 c0 	mov    %dx,0xc01241c2
c0100766:	66 a3 c6 41 12 c0    	mov    %ax,0xc01241c6
c010076c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100771:	ba 08 00 00 00       	mov    $0x8,%edx
c0100776:	66 a3 c8 41 12 c0    	mov    %ax,0xc01241c8
c010077c:	c1 e8 10             	shr    $0x10,%eax
c010077f:	66 89 0d ca 41 12 c0 	mov    %cx,0xc01241ca
c0100786:	66 a3 ce 41 12 c0    	mov    %ax,0xc01241ce
c010078c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100791:	66 89 15 d2 41 12 c0 	mov    %dx,0xc01241d2
c0100798:	66 a3 d0 41 12 c0    	mov    %ax,0xc01241d0
c010079e:	c1 e8 10             	shr    $0x10,%eax
c01007a1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007a6:	66 a3 d6 41 12 c0    	mov    %ax,0xc01241d6
c01007ac:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c01007b1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007b6:	66 a3 d8 41 12 c0    	mov    %ax,0xc01241d8
c01007bc:	c1 e8 10             	shr    $0x10,%eax
c01007bf:	66 89 0d da 41 12 c0 	mov    %cx,0xc01241da
c01007c6:	66 a3 de 41 12 c0    	mov    %ax,0xc01241de
c01007cc:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c01007d1:	66 89 15 e2 41 12 c0 	mov    %dx,0xc01241e2
c01007d8:	66 a3 e0 41 12 c0    	mov    %ax,0xc01241e0
c01007de:	c1 e8 10             	shr    $0x10,%eax
c01007e1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007e6:	66 a3 e6 41 12 c0    	mov    %ax,0xc01241e6
c01007ec:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c01007f1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007f6:	66 a3 e8 41 12 c0    	mov    %ax,0xc01241e8
c01007fc:	c1 e8 10             	shr    $0x10,%eax
c01007ff:	66 89 0d ea 41 12 c0 	mov    %cx,0xc01241ea
c0100806:	66 a3 ee 41 12 c0    	mov    %ax,0xc01241ee
c010080c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100811:	66 89 15 f2 41 12 c0 	mov    %dx,0xc01241f2
c0100818:	66 a3 f0 41 12 c0    	mov    %ax,0xc01241f0
c010081e:	c1 e8 10             	shr    $0x10,%eax
c0100821:	c6 05 c4 41 12 c0 00 	movb   $0x0,0xc01241c4
c0100828:	c6 05 c5 41 12 c0 8f 	movb   $0x8f,0xc01241c5
c010082f:	c6 05 cc 41 12 c0 00 	movb   $0x0,0xc01241cc
c0100836:	b9 08 00 00 00       	mov    $0x8,%ecx
c010083b:	c6 05 cd 41 12 c0 8f 	movb   $0x8f,0xc01241cd
c0100842:	c6 05 d4 41 12 c0 00 	movb   $0x0,0xc01241d4
c0100849:	ba 08 00 00 00       	mov    $0x8,%edx
c010084e:	c6 05 d5 41 12 c0 8f 	movb   $0x8f,0xc01241d5
c0100855:	c6 05 dc 41 12 c0 00 	movb   $0x0,0xc01241dc
c010085c:	c6 05 dd 41 12 c0 8f 	movb   $0x8f,0xc01241dd
c0100863:	c6 05 e4 41 12 c0 00 	movb   $0x0,0xc01241e4
c010086a:	c6 05 e5 41 12 c0 8f 	movb   $0x8f,0xc01241e5
c0100871:	c6 05 ec 41 12 c0 00 	movb   $0x0,0xc01241ec
c0100878:	c6 05 ed 41 12 c0 8f 	movb   $0x8f,0xc01241ed
c010087f:	c6 05 f4 41 12 c0 00 	movb   $0x0,0xc01241f4
c0100886:	c6 05 f5 41 12 c0 8f 	movb   $0x8f,0xc01241f5
c010088d:	66 a3 f6 41 12 c0    	mov    %ax,0xc01241f6
c0100893:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100898:	66 a3 f8 41 12 c0    	mov    %ax,0xc01241f8
c010089e:	c1 e8 10             	shr    $0x10,%eax
c01008a1:	66 89 0d fa 41 12 c0 	mov    %cx,0xc01241fa
c01008a8:	66 a3 fe 41 12 c0    	mov    %ax,0xc01241fe
c01008ae:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c01008b3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008b8:	66 a3 00 42 12 c0    	mov    %ax,0xc0124200
c01008be:	c1 e8 10             	shr    $0x10,%eax
c01008c1:	66 89 15 02 42 12 c0 	mov    %dx,0xc0124202
c01008c8:	66 a3 06 42 12 c0    	mov    %ax,0xc0124206
c01008ce:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c01008d3:	66 89 0d 0a 42 12 c0 	mov    %cx,0xc012420a
c01008da:	66 a3 08 42 12 c0    	mov    %ax,0xc0124208
c01008e0:	c1 e8 10             	shr    $0x10,%eax
c01008e3:	ba 08 00 00 00       	mov    $0x8,%edx
c01008e8:	66 a3 0e 42 12 c0    	mov    %ax,0xc012420e
c01008ee:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c01008f3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008f8:	66 a3 10 42 12 c0    	mov    %ax,0xc0124210
c01008fe:	c1 e8 10             	shr    $0x10,%eax
c0100901:	66 89 15 12 42 12 c0 	mov    %dx,0xc0124212
c0100908:	66 a3 16 42 12 c0    	mov    %ax,0xc0124216
c010090e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100913:	66 89 0d 1a 42 12 c0 	mov    %cx,0xc012421a
c010091a:	66 a3 18 42 12 c0    	mov    %ax,0xc0124218
c0100920:	c1 e8 10             	shr    $0x10,%eax
c0100923:	ba 08 00 00 00       	mov    $0x8,%edx
c0100928:	66 a3 1e 42 12 c0    	mov    %ax,0xc012421e
c010092e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100933:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100938:	66 a3 20 42 12 c0    	mov    %ax,0xc0124220
c010093e:	c1 e8 10             	shr    $0x10,%eax
c0100941:	66 89 15 22 42 12 c0 	mov    %dx,0xc0124222
c0100948:	66 a3 26 42 12 c0    	mov    %ax,0xc0124226
c010094e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100953:	66 89 0d 2a 42 12 c0 	mov    %cx,0xc012422a
c010095a:	66 a3 28 42 12 c0    	mov    %ax,0xc0124228
c0100960:	c1 e8 10             	shr    $0x10,%eax
c0100963:	c6 05 fc 41 12 c0 00 	movb   $0x0,0xc01241fc
c010096a:	c6 05 fd 41 12 c0 8f 	movb   $0x8f,0xc01241fd
c0100971:	c6 05 04 42 12 c0 00 	movb   $0x0,0xc0124204
c0100978:	ba 08 00 00 00       	mov    $0x8,%edx
c010097d:	c6 05 05 42 12 c0 8f 	movb   $0x8f,0xc0124205
c0100984:	c6 05 0c 42 12 c0 00 	movb   $0x0,0xc012420c
c010098b:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100990:	c6 05 0d 42 12 c0 8f 	movb   $0x8f,0xc012420d
c0100997:	c6 05 14 42 12 c0 00 	movb   $0x0,0xc0124214
c010099e:	c6 05 15 42 12 c0 8f 	movb   $0x8f,0xc0124215
c01009a5:	c6 05 1c 42 12 c0 00 	movb   $0x0,0xc012421c
c01009ac:	c6 05 1d 42 12 c0 8f 	movb   $0x8f,0xc012421d
c01009b3:	c6 05 24 42 12 c0 00 	movb   $0x0,0xc0124224
c01009ba:	c6 05 25 42 12 c0 8f 	movb   $0x8f,0xc0124225
c01009c1:	c6 05 2c 42 12 c0 00 	movb   $0x0,0xc012422c
c01009c8:	66 a3 2e 42 12 c0    	mov    %ax,0xc012422e
c01009ce:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c01009d3:	66 89 15 32 42 12 c0 	mov    %dx,0xc0124232
c01009da:	66 a3 30 42 12 c0    	mov    %ax,0xc0124230
c01009e0:	c1 e8 10             	shr    $0x10,%eax
c01009e3:	66 89 0d c2 45 12 c0 	mov    %cx,0xc01245c2
c01009ea:	66 a3 36 42 12 c0    	mov    %ax,0xc0124236
c01009f0:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c01009f5:	ba 08 00 00 00       	mov    $0x8,%edx
c01009fa:	66 a3 c0 45 12 c0    	mov    %ax,0xc01245c0
c0100a00:	c1 e8 10             	shr    $0x10,%eax
c0100a03:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a08:	66 a3 c6 45 12 c0    	mov    %ax,0xc01245c6
c0100a0e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a13:	c6 05 2d 42 12 c0 8f 	movb   $0x8f,0xc012422d
c0100a1a:	66 a3 c0 42 12 c0    	mov    %ax,0xc01242c0
c0100a20:	c1 e8 10             	shr    $0x10,%eax
c0100a23:	c6 05 34 42 12 c0 00 	movb   $0x0,0xc0124234
c0100a2a:	66 a3 c6 42 12 c0    	mov    %ax,0xc01242c6
c0100a30:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a35:	c6 05 35 42 12 c0 8f 	movb   $0x8f,0xc0124235
c0100a3c:	66 a3 30 43 12 c0    	mov    %ax,0xc0124330
c0100a42:	c1 e8 10             	shr    $0x10,%eax
c0100a45:	c6 05 c4 45 12 c0 00 	movb   $0x0,0xc01245c4
c0100a4c:	66 a3 36 43 12 c0    	mov    %ax,0xc0124336
c0100a52:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100a57:	c6 05 c5 45 12 c0 ef 	movb   $0xef,0xc01245c5
c0100a5e:	66 a3 80 41 12 c0    	mov    %ax,0xc0124180
c0100a64:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c0100a69:	66 89 15 c2 42 12 c0 	mov    %dx,0xc01242c2
c0100a70:	66 a3 82 41 12 c0    	mov    %ax,0xc0124182
c0100a76:	c1 e8 10             	shr    $0x10,%eax
c0100a79:	c6 05 c4 42 12 c0 00 	movb   $0x0,0xc01242c4
c0100a80:	66 a3 84 41 12 c0    	mov    %ax,0xc0124184
c0100a86:	c6 05 c5 42 12 c0 8e 	movb   $0x8e,0xc01242c5
c0100a8d:	b8 80 41 12 c0       	mov    $0xc0124180,%eax
c0100a92:	66 89 0d 32 43 12 c0 	mov    %cx,0xc0124332
c0100a99:	c6 05 34 43 12 c0 00 	movb   $0x0,0xc0124334
c0100aa0:	c6 05 35 43 12 c0 8e 	movb   $0x8e,0xc0124335
c0100aa7:	0f 01 18             	lidtl  (%eax)
c0100aaa:	5d                   	pop    %ebp
c0100aab:	c3                   	ret    
c0100aac:	66 90                	xchg   %ax,%ax
c0100aae:	66 90                	xchg   %ax,%ax

c0100ab0 <create_video_mapping>:
c0100ab0:	55                   	push   %ebp
c0100ab1:	89 e5                	mov    %esp,%ebp
c0100ab3:	53                   	push   %ebx
c0100ab4:	83 ec 04             	sub    $0x4,%esp
c0100ab7:	e8 14 01 00 00       	call   c0100bd0 <get_updir>
c0100abc:	89 c3                	mov    %eax,%ebx
c0100abe:	e8 0d 01 00 00       	call   c0100bd0 <get_updir>
c0100ac3:	39 c3                	cmp    %eax,%ebx
c0100ac5:	74 27                	je     c0100aee <create_video_mapping+0x3e>
c0100ac7:	83 ec 0c             	sub    $0xc,%esp
c0100aca:	68 bc 17 10 c0       	push   $0xc01017bc
c0100acf:	68 1f 18 10 c0       	push   $0xc010181f
c0100ad4:	6a 19                	push   $0x19
c0100ad6:	68 e2 17 10 c0       	push   $0xc01017e2
c0100adb:	68 b4 14 10 c0       	push   $0xc01014b4
c0100ae0:	e8 1b 04 00 00       	call   c0100f00 <printk>
c0100ae5:	b8 01 00 00 00       	mov    $0x1,%eax
c0100aea:	d6                   	(bad)  
c0100aeb:	83 c4 20             	add    $0x20,%esp
c0100aee:	ba 00 50 12 00       	mov    $0x125000,%edx
c0100af3:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100af8:	b8 80 52 12 c0       	mov    $0xc0125280,%eax
c0100afd:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b03:	83 ca 07             	or     $0x7,%edx
c0100b06:	89 13                	mov    %edx,(%ebx)
c0100b08:	90                   	nop
c0100b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b10:	89 ca                	mov    %ecx,%edx
c0100b12:	83 c0 04             	add    $0x4,%eax
c0100b15:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b1b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b21:	83 ca 07             	or     $0x7,%edx
c0100b24:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b27:	3d c0 52 12 c0       	cmp    $0xc01252c0,%eax
c0100b2c:	75 e2                	jne    c0100b10 <create_video_mapping+0x60>
c0100b2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b31:	c9                   	leave  
c0100b32:	c3                   	ret    
c0100b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b40 <video_mapping_write_test>:
c0100b40:	55                   	push   %ebp
c0100b41:	31 c0                	xor    %eax,%eax
c0100b43:	89 e5                	mov    %esp,%ebp
c0100b45:	8d 76 00             	lea    0x0(%esi),%esi
c0100b48:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100b4f:	83 c0 01             	add    $0x1,%eax
c0100b52:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100b57:	75 ef                	jne    c0100b48 <video_mapping_write_test+0x8>
c0100b59:	5d                   	pop    %ebp
c0100b5a:	c3                   	ret    
c0100b5b:	90                   	nop
c0100b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100b60 <video_mapping_read_test>:
c0100b60:	55                   	push   %ebp
c0100b61:	89 e5                	mov    %esp,%ebp
c0100b63:	56                   	push   %esi
c0100b64:	be 01 00 00 00       	mov    $0x1,%esi
c0100b69:	53                   	push   %ebx
c0100b6a:	31 db                	xor    %ebx,%ebx
c0100b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b70:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100b77:	74 24                	je     c0100b9d <video_mapping_read_test+0x3d>
c0100b79:	83 ec 0c             	sub    $0xc,%esp
c0100b7c:	68 fb 17 10 c0       	push   $0xc01017fb
c0100b81:	68 07 18 10 c0       	push   $0xc0101807
c0100b86:	6a 30                	push   $0x30
c0100b88:	68 e2 17 10 c0       	push   $0xc01017e2
c0100b8d:	68 b4 14 10 c0       	push   $0xc01014b4
c0100b92:	e8 69 03 00 00       	call   c0100f00 <printk>
c0100b97:	89 f0                	mov    %esi,%eax
c0100b99:	d6                   	(bad)  
c0100b9a:	83 c4 20             	add    $0x20,%esp
c0100b9d:	83 c3 01             	add    $0x1,%ebx
c0100ba0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100ba6:	75 c8                	jne    c0100b70 <video_mapping_read_test+0x10>
c0100ba8:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100bab:	5b                   	pop    %ebx
c0100bac:	5e                   	pop    %esi
c0100bad:	5d                   	pop    %ebp
c0100bae:	c3                   	ret    
c0100baf:	90                   	nop

c0100bb0 <video_mapping_clear>:
c0100bb0:	55                   	push   %ebp
c0100bb1:	89 e5                	mov    %esp,%ebp
c0100bb3:	83 ec 0c             	sub    $0xc,%esp
c0100bb6:	68 00 fa 00 00       	push   $0xfa00
c0100bbb:	6a 00                	push   $0x0
c0100bbd:	68 00 00 0a 00       	push   $0xa0000
c0100bc2:	e8 31 08 00 00       	call   c01013f8 <memset>
c0100bc7:	83 c4 10             	add    $0x10,%esp
c0100bca:	c9                   	leave  
c0100bcb:	c3                   	ret    
c0100bcc:	66 90                	xchg   %ax,%ax
c0100bce:	66 90                	xchg   %ax,%ax

c0100bd0 <get_updir>:
c0100bd0:	55                   	push   %ebp
c0100bd1:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100bd6:	89 e5                	mov    %esp,%ebp
c0100bd8:	5d                   	pop    %ebp
c0100bd9:	c3                   	ret    
c0100bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100be0 <get_ucr3>:
c0100be0:	55                   	push   %ebp
c0100be1:	a1 04 60 12 c0       	mov    0xc0126004,%eax
c0100be6:	89 e5                	mov    %esp,%ebp
c0100be8:	5d                   	pop    %ebp
c0100be9:	c3                   	ret    
c0100bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100bf0 <mm_brk>:
c0100bf0:	55                   	push   %ebp
c0100bf1:	89 e5                	mov    %esp,%ebp
c0100bf3:	53                   	push   %ebx
c0100bf4:	83 ec 04             	sub    $0x4,%esp
c0100bf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100bfa:	a1 00 60 12 c0       	mov    0xc0126000,%eax
c0100bff:	39 d8                	cmp    %ebx,%eax
c0100c01:	73 11                	jae    c0100c14 <mm_brk+0x24>
c0100c03:	89 da                	mov    %ebx,%edx
c0100c05:	83 ec 08             	sub    $0x8,%esp
c0100c08:	29 c2                	sub    %eax,%edx
c0100c0a:	52                   	push   %edx
c0100c0b:	50                   	push   %eax
c0100c0c:	e8 3f f4 ff ff       	call   c0100050 <mm_malloc>
c0100c11:	83 c4 10             	add    $0x10,%esp
c0100c14:	89 1d 00 60 12 c0    	mov    %ebx,0xc0126000
c0100c1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c1d:	c9                   	leave  
c0100c1e:	c3                   	ret    
c0100c1f:	90                   	nop

c0100c20 <init_mm>:
c0100c20:	55                   	push   %ebp
c0100c21:	89 e5                	mov    %esp,%ebp
c0100c23:	53                   	push   %ebx
c0100c24:	83 ec 04             	sub    $0x4,%esp
c0100c27:	e8 54 00 00 00       	call   c0100c80 <get_kpdir>
c0100c2c:	83 ec 04             	sub    $0x4,%esp
c0100c2f:	89 c3                	mov    %eax,%ebx
c0100c31:	68 00 10 00 00       	push   $0x1000
c0100c36:	6a 00                	push   $0x0
c0100c38:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100c3e:	68 00 70 12 c0       	push   $0xc0127000
c0100c43:	e8 b0 07 00 00       	call   c01013f8 <memset>
c0100c48:	83 c4 0c             	add    $0xc,%esp
c0100c4b:	68 80 00 00 00       	push   $0x80
c0100c50:	53                   	push   %ebx
c0100c51:	68 00 7c 12 c0       	push   $0xc0127c00
c0100c56:	e8 55 07 00 00       	call   c01013b0 <memcpy>
c0100c5b:	b8 00 70 12 00       	mov    $0x127000,%eax
c0100c60:	83 c4 10             	add    $0x10,%esp
c0100c63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c66:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c6b:	a3 04 60 12 c0       	mov    %eax,0xc0126004
c0100c70:	c9                   	leave  
c0100c71:	c3                   	ret    
c0100c72:	66 90                	xchg   %ax,%ax
c0100c74:	66 90                	xchg   %ax,%ax
c0100c76:	66 90                	xchg   %ax,%ax
c0100c78:	66 90                	xchg   %ax,%ax
c0100c7a:	66 90                	xchg   %ax,%ax
c0100c7c:	66 90                	xchg   %ax,%ax
c0100c7e:	66 90                	xchg   %ax,%ax

c0100c80 <get_kpdir>:
c0100c80:	55                   	push   %ebp
c0100c81:	b8 00 90 14 c0       	mov    $0xc0149000,%eax
c0100c86:	89 e5                	mov    %esp,%ebp
c0100c88:	5d                   	pop    %ebp
c0100c89:	c3                   	ret    
c0100c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c90 <init_page>:
c0100c90:	55                   	push   %ebp
c0100c91:	89 e5                	mov    %esp,%ebp
c0100c93:	57                   	push   %edi
c0100c94:	83 ec 08             	sub    $0x8,%esp
c0100c97:	68 00 10 00 00       	push   $0x1000
c0100c9c:	6a 00                	push   $0x0
c0100c9e:	68 00 90 14 00       	push   $0x149000
c0100ca3:	e8 50 07 00 00       	call   c01013f8 <memset>
c0100ca8:	b9 00 90 14 00       	mov    $0x149000,%ecx
c0100cad:	83 c4 10             	add    $0x10,%esp
c0100cb0:	ba 00 90 12 00       	mov    $0x129000,%edx
c0100cb5:	8d 76 00             	lea    0x0(%esi),%esi
c0100cb8:	89 d0                	mov    %edx,%eax
c0100cba:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100cc0:	83 c1 04             	add    $0x4,%ecx
c0100cc3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cc8:	83 c8 07             	or     $0x7,%eax
c0100ccb:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100cce:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100cd4:	81 fa 00 90 14 00    	cmp    $0x149000,%edx
c0100cda:	75 dc                	jne    c0100cb8 <init_page+0x28>
c0100cdc:	bf fc 8f 14 00       	mov    $0x148ffc,%edi
c0100ce1:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100ce6:	fd                   	std    
c0100ce7:	ab                   	stos   %eax,%es:(%edi)
c0100ce8:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100ced:	7d f8                	jge    c0100ce7 <init_page+0x57>
c0100cef:	b8 00 90 14 00       	mov    $0x149000,%eax
c0100cf4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cf9:	0f 22 d8             	mov    %eax,%cr3
c0100cfc:	0f 20 c0             	mov    %cr0,%eax
c0100cff:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100d04:	0f 22 c0             	mov    %eax,%cr0
c0100d07:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100d0a:	c9                   	leave  
c0100d0b:	c3                   	ret    
c0100d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d10 <init_segment>:
c0100d10:	55                   	push   %ebp
c0100d11:	89 e5                	mov    %esp,%ebp
c0100d13:	83 ec 0c             	sub    $0xc,%esp
c0100d16:	6a 18                	push   $0x18
c0100d18:	6a 00                	push   $0x0
c0100d1a:	68 08 80 12 c0       	push   $0xc0128008
c0100d1f:	e8 d4 06 00 00       	call   c01013f8 <memset>
c0100d24:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d29:	31 c9                	xor    %ecx,%ecx
c0100d2b:	b8 08 80 12 c0       	mov    $0xc0128008,%eax
c0100d30:	66 89 15 10 80 12 c0 	mov    %dx,0xc0128010
c0100d37:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d3c:	66 89 0d 12 80 12 c0 	mov    %cx,0xc0128012
c0100d43:	66 89 15 18 80 12 c0 	mov    %dx,0xc0128018
c0100d4a:	ba 17 00 00 00       	mov    $0x17,%edx
c0100d4f:	31 c9                	xor    %ecx,%ecx
c0100d51:	66 89 15 00 80 12 c0 	mov    %dx,0xc0128000
c0100d58:	66 a3 02 80 12 c0    	mov    %ax,0xc0128002
c0100d5e:	c1 e8 10             	shr    $0x10,%eax
c0100d61:	66 a3 04 80 12 c0    	mov    %ax,0xc0128004
c0100d67:	c6 05 14 80 12 c0 00 	movb   $0x0,0xc0128014
c0100d6e:	b8 00 80 12 c0       	mov    $0xc0128000,%eax
c0100d73:	c6 05 15 80 12 c0 9a 	movb   $0x9a,0xc0128015
c0100d7a:	c6 05 16 80 12 c0 cf 	movb   $0xcf,0xc0128016
c0100d81:	c6 05 17 80 12 c0 00 	movb   $0x0,0xc0128017
c0100d88:	66 89 0d 1a 80 12 c0 	mov    %cx,0xc012801a
c0100d8f:	c6 05 1c 80 12 c0 00 	movb   $0x0,0xc012801c
c0100d96:	c6 05 1d 80 12 c0 92 	movb   $0x92,0xc012801d
c0100d9d:	c6 05 1e 80 12 c0 cf 	movb   $0xcf,0xc012801e
c0100da4:	c6 05 1f 80 12 c0 00 	movb   $0x0,0xc012801f
c0100dab:	0f 01 10             	lgdtl  (%eax)
c0100dae:	83 c4 10             	add    $0x10,%esp
c0100db1:	c9                   	leave  
c0100db2:	c3                   	ret    
c0100db3:	66 90                	xchg   %ax,%ax
c0100db5:	66 90                	xchg   %ax,%ax
c0100db7:	66 90                	xchg   %ax,%ax
c0100db9:	66 90                	xchg   %ax,%ax
c0100dbb:	66 90                	xchg   %ax,%ax
c0100dbd:	66 90                	xchg   %ax,%ax
c0100dbf:	90                   	nop

c0100dc0 <loader>:
c0100dc0:	55                   	push   %ebp
c0100dc1:	89 e5                	mov    %esp,%ebp
c0100dc3:	57                   	push   %edi
c0100dc4:	56                   	push   %esi
c0100dc5:	53                   	push   %ebx
c0100dc6:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100dcc:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100dd2:	68 00 10 00 00       	push   $0x1000
c0100dd7:	6a 00                	push   $0x0
c0100dd9:	53                   	push   %ebx
c0100dda:	e8 91 01 00 00       	call   c0100f70 <ramdisk_read>
c0100ddf:	83 c4 10             	add    $0x10,%esp
c0100de2:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100de9:	45 4c 46 
c0100dec:	74 06                	je     c0100df4 <loader+0x34>
c0100dee:	b8 01 00 00 00       	mov    $0x1,%eax
c0100df3:	d6                   	(bad)  
c0100df4:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100dfa:	83 fa 34             	cmp    $0x34,%edx
c0100dfd:	74 06                	je     c0100e05 <loader+0x45>
c0100dff:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e04:	d6                   	(bad)  
c0100e05:	31 f6                	xor    %esi,%esi
c0100e07:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100e0e:	00 
c0100e0f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e13:	75 1c                	jne    c0100e31 <loader+0x71>
c0100e15:	eb 79                	jmp    c0100e90 <loader+0xd0>
c0100e17:	89 f6                	mov    %esi,%esi
c0100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e20:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e27:	83 c6 01             	add    $0x1,%esi
c0100e2a:	83 c3 20             	add    $0x20,%ebx
c0100e2d:	39 f0                	cmp    %esi,%eax
c0100e2f:	7e 5f                	jle    c0100e90 <loader+0xd0>
c0100e31:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100e35:	75 e9                	jne    c0100e20 <loader+0x60>
c0100e37:	83 ec 08             	sub    $0x8,%esp
c0100e3a:	ff 33                	pushl  (%ebx)
c0100e3c:	ff 73 f4             	pushl  -0xc(%ebx)
c0100e3f:	e8 0c f2 ff ff       	call   c0100050 <mm_malloc>
c0100e44:	83 c4 0c             	add    $0xc,%esp
c0100e47:	ff 73 fc             	pushl  -0x4(%ebx)
c0100e4a:	ff 73 f0             	pushl  -0x10(%ebx)
c0100e4d:	50                   	push   %eax
c0100e4e:	89 c7                	mov    %eax,%edi
c0100e50:	e8 1b 01 00 00       	call   c0100f70 <ramdisk_read>
c0100e55:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100e58:	8b 13                	mov    (%ebx),%edx
c0100e5a:	83 c4 0c             	add    $0xc,%esp
c0100e5d:	29 c2                	sub    %eax,%edx
c0100e5f:	52                   	push   %edx
c0100e60:	6a 00                	push   $0x0
c0100e62:	03 43 f0             	add    -0x10(%ebx),%eax
c0100e65:	01 c7                	add    %eax,%edi
c0100e67:	57                   	push   %edi
c0100e68:	e8 8b 05 00 00       	call   c01013f8 <memset>
c0100e6d:	8b 03                	mov    (%ebx),%eax
c0100e6f:	03 43 f4             	add    -0xc(%ebx),%eax
c0100e72:	83 c4 10             	add    $0x10,%esp
c0100e75:	83 e8 01             	sub    $0x1,%eax
c0100e78:	3b 05 00 60 12 c0    	cmp    0xc0126000,%eax
c0100e7e:	76 a0                	jbe    c0100e20 <loader+0x60>
c0100e80:	a3 00 60 12 c0       	mov    %eax,0xc0126000
c0100e85:	eb 99                	jmp    c0100e20 <loader+0x60>
c0100e87:	89 f6                	mov    %esi,%esi
c0100e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e90:	83 ec 08             	sub    $0x8,%esp
c0100e93:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100e99:	68 00 00 10 00       	push   $0x100000
c0100e9e:	68 00 00 f0 bf       	push   $0xbff00000
c0100ea3:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100ea9:	e8 a2 f1 ff ff       	call   c0100050 <mm_malloc>
c0100eae:	e8 fd fb ff ff       	call   c0100ab0 <create_video_mapping>
c0100eb3:	e8 28 fd ff ff       	call   c0100be0 <get_ucr3>
c0100eb8:	0f 22 d8             	mov    %eax,%cr3
c0100ebb:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100ec1:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100ec4:	5b                   	pop    %ebx
c0100ec5:	5e                   	pop    %esi
c0100ec6:	5f                   	pop    %edi
c0100ec7:	5d                   	pop    %ebp
c0100ec8:	c3                   	ret    
c0100ec9:	66 90                	xchg   %ax,%ax
c0100ecb:	66 90                	xchg   %ax,%ax
c0100ecd:	66 90                	xchg   %ax,%ax
c0100ecf:	90                   	nop

c0100ed0 <sbrk>:
c0100ed0:	55                   	push   %ebp
c0100ed1:	89 e5                	mov    %esp,%ebp
c0100ed3:	83 ec 08             	sub    $0x8,%esp
c0100ed6:	68 4a 18 10 c0       	push   $0xc010184a
c0100edb:	6a 08                	push   $0x8
c0100edd:	68 34 18 10 c0       	push   $0xc0101834
c0100ee2:	68 54 15 10 c0       	push   $0xc0101554
c0100ee7:	e8 14 00 00 00       	call   c0100f00 <printk>
c0100eec:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ef1:	d6                   	(bad)  
c0100ef2:	30 c0                	xor    %al,%al
c0100ef4:	c9                   	leave  
c0100ef5:	c3                   	ret    
c0100ef6:	66 90                	xchg   %ax,%ax
c0100ef8:	66 90                	xchg   %ax,%ax
c0100efa:	66 90                	xchg   %ax,%ax
c0100efc:	66 90                	xchg   %ax,%ax
c0100efe:	66 90                	xchg   %ax,%ax

c0100f00 <printk>:
c0100f00:	55                   	push   %ebp
c0100f01:	89 e5                	mov    %esp,%ebp
c0100f03:	5d                   	pop    %ebp
c0100f04:	c3                   	ret    
c0100f05:	66 90                	xchg   %ax,%ax
c0100f07:	66 90                	xchg   %ax,%ax
c0100f09:	66 90                	xchg   %ax,%ax
c0100f0b:	66 90                	xchg   %ax,%ax
c0100f0d:	66 90                	xchg   %ax,%ax
c0100f0f:	90                   	nop

c0100f10 <init_serial>:
c0100f10:	55                   	push   %ebp
c0100f11:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100f16:	31 c0                	xor    %eax,%eax
c0100f18:	89 e5                	mov    %esp,%ebp
c0100f1a:	ee                   	out    %al,(%dx)
c0100f1b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100f20:	b2 fb                	mov    $0xfb,%dl
c0100f22:	ee                   	out    %al,(%dx)
c0100f23:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f28:	b2 f8                	mov    $0xf8,%dl
c0100f2a:	ee                   	out    %al,(%dx)
c0100f2b:	31 c0                	xor    %eax,%eax
c0100f2d:	b2 f9                	mov    $0xf9,%dl
c0100f2f:	ee                   	out    %al,(%dx)
c0100f30:	b8 03 00 00 00       	mov    $0x3,%eax
c0100f35:	b2 fb                	mov    $0xfb,%dl
c0100f37:	ee                   	out    %al,(%dx)
c0100f38:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100f3d:	b2 fa                	mov    $0xfa,%dl
c0100f3f:	ee                   	out    %al,(%dx)
c0100f40:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100f45:	b2 fc                	mov    $0xfc,%dl
c0100f47:	ee                   	out    %al,(%dx)
c0100f48:	5d                   	pop    %ebp
c0100f49:	c3                   	ret    
c0100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100f50 <serial_printc>:
c0100f50:	55                   	push   %ebp
c0100f51:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100f56:	89 e5                	mov    %esp,%ebp
c0100f58:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f5b:	90                   	nop
c0100f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f60:	ec                   	in     (%dx),%al
c0100f61:	a8 20                	test   $0x20,%al
c0100f63:	74 fb                	je     c0100f60 <serial_printc+0x10>
c0100f65:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100f6a:	89 c8                	mov    %ecx,%eax
c0100f6c:	ee                   	out    %al,(%dx)
c0100f6d:	5d                   	pop    %ebp
c0100f6e:	c3                   	ret    
c0100f6f:	90                   	nop

c0100f70 <ramdisk_read>:
c0100f70:	55                   	push   %ebp
c0100f71:	89 e5                	mov    %esp,%ebp
c0100f73:	53                   	push   %ebx
c0100f74:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f77:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f7a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f7d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f80:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f85:	76 06                	jbe    c0100f8d <ramdisk_read+0x1d>
c0100f87:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f8c:	d6                   	(bad)  
c0100f8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100f90:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f93:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100f96:	5b                   	pop    %ebx
c0100f97:	5d                   	pop    %ebp
c0100f98:	e9 13 04 00 00       	jmp    c01013b0 <memcpy>
c0100f9d:	8d 76 00             	lea    0x0(%esi),%esi

c0100fa0 <ramdisk_write>:
c0100fa0:	55                   	push   %ebp
c0100fa1:	89 e5                	mov    %esp,%ebp
c0100fa3:	53                   	push   %ebx
c0100fa4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100fa7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100faa:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100fad:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100fb0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100fb5:	76 06                	jbe    c0100fbd <ramdisk_write+0x1d>
c0100fb7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fbc:	d6                   	(bad)  
c0100fbd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0100fc0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100fc3:	89 55 08             	mov    %edx,0x8(%ebp)
c0100fc6:	5b                   	pop    %ebx
c0100fc7:	5d                   	pop    %ebp
c0100fc8:	e9 e3 03 00 00       	jmp    c01013b0 <memcpy>
c0100fcd:	66 90                	xchg   %ax,%ax
c0100fcf:	90                   	nop

c0100fd0 <ide_intr>:
c0100fd0:	55                   	push   %ebp
c0100fd1:	c7 05 04 a0 14 c0 01 	movl   $0x1,0xc014a004
c0100fd8:	00 00 00 
c0100fdb:	89 e5                	mov    %esp,%ebp
c0100fdd:	5d                   	pop    %ebp
c0100fde:	c3                   	ret    
c0100fdf:	90                   	nop

c0100fe0 <ide_writeback>:
c0100fe0:	a1 00 a0 14 c0       	mov    0xc014a000,%eax
c0100fe5:	83 c0 01             	add    $0x1,%eax
c0100fe8:	83 f8 64             	cmp    $0x64,%eax
c0100feb:	a3 00 a0 14 c0       	mov    %eax,0xc014a000
c0100ff0:	74 06                	je     c0100ff8 <ide_writeback+0x18>
c0100ff2:	c3                   	ret    
c0100ff3:	90                   	nop
c0100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ff8:	55                   	push   %ebp
c0100ff9:	89 e5                	mov    %esp,%ebp
c0100ffb:	83 ec 08             	sub    $0x8,%esp
c0100ffe:	e8 dd 01 00 00       	call   c01011e0 <buf_writeback>
c0101003:	c7 05 00 a0 14 c0 00 	movl   $0x0,0xc014a000
c010100a:	00 00 00 
c010100d:	c9                   	leave  
c010100e:	c3                   	ret    
c010100f:	90                   	nop

c0101010 <ide_read>:
c0101010:	55                   	push   %ebp
c0101011:	89 e5                	mov    %esp,%ebp
c0101013:	57                   	push   %edi
c0101014:	56                   	push   %esi
c0101015:	53                   	push   %ebx
c0101016:	83 ec 0c             	sub    $0xc,%esp
c0101019:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010101c:	8b 45 10             	mov    0x10(%ebp),%eax
c010101f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101022:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101025:	29 df                	sub    %ebx,%edi
c0101027:	85 c0                	test   %eax,%eax
c0101029:	74 1b                	je     c0101046 <ide_read+0x36>
c010102b:	90                   	nop
c010102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101030:	83 ec 0c             	sub    $0xc,%esp
c0101033:	53                   	push   %ebx
c0101034:	e8 07 02 00 00       	call   c0101240 <read_byte>
c0101039:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010103c:	83 c3 01             	add    $0x1,%ebx
c010103f:	83 c4 10             	add    $0x10,%esp
c0101042:	39 f3                	cmp    %esi,%ebx
c0101044:	75 ea                	jne    c0101030 <ide_read+0x20>
c0101046:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101049:	5b                   	pop    %ebx
c010104a:	5e                   	pop    %esi
c010104b:	5f                   	pop    %edi
c010104c:	5d                   	pop    %ebp
c010104d:	c3                   	ret    
c010104e:	66 90                	xchg   %ax,%ax

c0101050 <ide_write>:
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
c0101069:	74 1d                	je     c0101088 <ide_write+0x38>
c010106b:	90                   	nop
c010106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101070:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101074:	83 ec 08             	sub    $0x8,%esp
c0101077:	50                   	push   %eax
c0101078:	53                   	push   %ebx
c0101079:	83 c3 01             	add    $0x1,%ebx
c010107c:	e8 ef 01 00 00       	call   c0101270 <write_byte>
c0101081:	83 c4 10             	add    $0x10,%esp
c0101084:	39 f3                	cmp    %esi,%ebx
c0101086:	75 e8                	jne    c0101070 <ide_write+0x20>
c0101088:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010108b:	5b                   	pop    %ebx
c010108c:	5e                   	pop    %esi
c010108d:	5f                   	pop    %edi
c010108e:	5d                   	pop    %ebp
c010108f:	c3                   	ret    

c0101090 <clear_ide_intr>:
c0101090:	55                   	push   %ebp
c0101091:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c0101098:	00 00 00 
c010109b:	89 e5                	mov    %esp,%ebp
c010109d:	5d                   	pop    %ebp
c010109e:	c3                   	ret    
c010109f:	90                   	nop

c01010a0 <wait_ide_intr>:
c01010a0:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010a5:	55                   	push   %ebp
c01010a6:	89 e5                	mov    %esp,%ebp
c01010a8:	85 c0                	test   %eax,%eax
c01010aa:	75 0e                	jne    c01010ba <wait_ide_intr+0x1a>
c01010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010b0:	f4                   	hlt    
c01010b1:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010b6:	85 c0                	test   %eax,%eax
c01010b8:	74 f6                	je     c01010b0 <wait_ide_intr+0x10>
c01010ba:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c01010c1:	00 00 00 
c01010c4:	5d                   	pop    %ebp
c01010c5:	c3                   	ret    
c01010c6:	8d 76 00             	lea    0x0(%esi),%esi
c01010c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01010d0 <init_ide>:
c01010d0:	55                   	push   %ebp
c01010d1:	89 e5                	mov    %esp,%ebp
c01010d3:	83 ec 08             	sub    $0x8,%esp
c01010d6:	e8 d5 00 00 00       	call   c01011b0 <buf_init>
c01010db:	83 ec 08             	sub    $0x8,%esp
c01010de:	68 e0 0f 10 c0       	push   $0xc0100fe0
c01010e3:	6a 00                	push   $0x0
c01010e5:	e8 f6 f3 ff ff       	call   c01004e0 <add_irq_handle>
c01010ea:	58                   	pop    %eax
c01010eb:	5a                   	pop    %edx
c01010ec:	68 d0 0f 10 c0       	push   $0xc0100fd0
c01010f1:	6a 0e                	push   $0xe
c01010f3:	e8 e8 f3 ff ff       	call   c01004e0 <add_irq_handle>
c01010f8:	83 c4 10             	add    $0x10,%esp
c01010fb:	c9                   	leave  
c01010fc:	c3                   	ret    
c01010fd:	66 90                	xchg   %ax,%ax
c01010ff:	90                   	nop

c0101100 <buf_fetch>:
c0101100:	55                   	push   %ebp
c0101101:	89 c2                	mov    %eax,%edx
c0101103:	89 e5                	mov    %esp,%ebp
c0101105:	57                   	push   %edi
c0101106:	56                   	push   %esi
c0101107:	53                   	push   %ebx
c0101108:	89 c3                	mov    %eax,%ebx
c010110a:	83 e3 7f             	and    $0x7f,%ebx
c010110d:	89 d8                	mov    %ebx,%eax
c010110f:	83 ec 1c             	sub    $0x1c,%esp
c0101112:	c1 e0 09             	shl    $0x9,%eax
c0101115:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101118:	8d 81 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%eax
c010111e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101122:	74 5c                	je     c0101180 <buf_fetch+0x80>
c0101124:	89 d7                	mov    %edx,%edi
c0101126:	89 da                	mov    %ebx,%edx
c0101128:	c1 e2 09             	shl    $0x9,%edx
c010112b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010112e:	8d 91 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%edx
c0101134:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010113a:	74 54                	je     c0101190 <buf_fetch+0x90>
c010113c:	8d 72 06             	lea    0x6(%edx),%esi
c010113f:	83 ec 08             	sub    $0x8,%esp
c0101142:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101145:	57                   	push   %edi
c0101146:	56                   	push   %esi
c0101147:	e8 a4 01 00 00       	call   c01012f0 <disk_do_read>
c010114c:	89 da                	mov    %ebx,%edx
c010114e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101151:	83 c4 10             	add    $0x10,%esp
c0101154:	c1 e2 09             	shl    $0x9,%edx
c0101157:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010115a:	c6 81 44 a0 14 c0 01 	movb   $0x1,-0x3feb5fbc(%ecx)
c0101161:	89 b9 40 a0 14 c0    	mov    %edi,-0x3feb5fc0(%ecx)
c0101167:	c6 81 45 a0 14 c0 00 	movb   $0x0,-0x3feb5fbb(%ecx)
c010116e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101171:	5b                   	pop    %ebx
c0101172:	5e                   	pop    %esi
c0101173:	5f                   	pop    %edi
c0101174:	5d                   	pop    %ebp
c0101175:	c3                   	ret    
c0101176:	8d 76 00             	lea    0x0(%esi),%esi
c0101179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101180:	39 91 40 a0 14 c0    	cmp    %edx,-0x3feb5fc0(%ecx)
c0101186:	75 9c                	jne    c0101124 <buf_fetch+0x24>
c0101188:	eb e4                	jmp    c010116e <buf_fetch+0x6e>
c010118a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101190:	8d 72 06             	lea    0x6(%edx),%esi
c0101193:	83 ec 08             	sub    $0x8,%esp
c0101196:	ff b1 40 a0 14 c0    	pushl  -0x3feb5fc0(%ecx)
c010119c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010119f:	56                   	push   %esi
c01011a0:	e8 8b 01 00 00       	call   c0101330 <disk_do_write>
c01011a5:	83 c4 10             	add    $0x10,%esp
c01011a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011ab:	eb 92                	jmp    c010113f <buf_fetch+0x3f>
c01011ad:	8d 76 00             	lea    0x0(%esi),%esi

c01011b0 <buf_init>:
c01011b0:	55                   	push   %ebp
c01011b1:	b8 44 a0 14 c0       	mov    $0xc014a044,%eax
c01011b6:	89 e5                	mov    %esp,%ebp
c01011b8:	90                   	nop
c01011b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011c0:	c6 00 00             	movb   $0x0,(%eax)
c01011c3:	05 08 02 00 00       	add    $0x208,%eax
c01011c8:	3d 44 a4 15 c0       	cmp    $0xc015a444,%eax
c01011cd:	75 f1                	jne    c01011c0 <buf_init+0x10>
c01011cf:	5d                   	pop    %ebp
c01011d0:	c3                   	ret    
c01011d1:	eb 0d                	jmp    c01011e0 <buf_writeback>
c01011d3:	90                   	nop
c01011d4:	90                   	nop
c01011d5:	90                   	nop
c01011d6:	90                   	nop
c01011d7:	90                   	nop
c01011d8:	90                   	nop
c01011d9:	90                   	nop
c01011da:	90                   	nop
c01011db:	90                   	nop
c01011dc:	90                   	nop
c01011dd:	90                   	nop
c01011de:	90                   	nop
c01011df:	90                   	nop

c01011e0 <buf_writeback>:
c01011e0:	55                   	push   %ebp
c01011e1:	89 e5                	mov    %esp,%ebp
c01011e3:	53                   	push   %ebx
c01011e4:	bb 46 a0 14 c0       	mov    $0xc014a046,%ebx
c01011e9:	83 ec 04             	sub    $0x4,%esp
c01011ec:	eb 10                	jmp    c01011fe <buf_writeback+0x1e>
c01011ee:	66 90                	xchg   %ax,%ax
c01011f0:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01011f6:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c01011fc:	74 32                	je     c0101230 <buf_writeback+0x50>
c01011fe:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101202:	75 ec                	jne    c01011f0 <buf_writeback+0x10>
c0101204:	83 ec 08             	sub    $0x8,%esp
c0101207:	ff 73 fa             	pushl  -0x6(%ebx)
c010120a:	53                   	push   %ebx
c010120b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101211:	e8 1a 01 00 00       	call   c0101330 <disk_do_write>
c0101216:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010121d:	83 c4 10             	add    $0x10,%esp
c0101220:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c0101226:	75 d6                	jne    c01011fe <buf_writeback+0x1e>
c0101228:	90                   	nop
c0101229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101230:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101233:	c9                   	leave  
c0101234:	c3                   	ret    
c0101235:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101240 <read_byte>:
c0101240:	55                   	push   %ebp
c0101241:	89 e5                	mov    %esp,%ebp
c0101243:	53                   	push   %ebx
c0101244:	83 ec 04             	sub    $0x4,%esp
c0101247:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010124a:	89 d8                	mov    %ebx,%eax
c010124c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101252:	c1 e8 09             	shr    $0x9,%eax
c0101255:	e8 a6 fe ff ff       	call   c0101100 <buf_fetch>
c010125a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010125f:	83 c4 04             	add    $0x4,%esp
c0101262:	5b                   	pop    %ebx
c0101263:	5d                   	pop    %ebp
c0101264:	c3                   	ret    
c0101265:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101270 <write_byte>:
c0101270:	55                   	push   %ebp
c0101271:	89 e5                	mov    %esp,%ebp
c0101273:	56                   	push   %esi
c0101274:	53                   	push   %ebx
c0101275:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101278:	8b 75 0c             	mov    0xc(%ebp),%esi
c010127b:	89 d8                	mov    %ebx,%eax
c010127d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101283:	c1 e8 09             	shr    $0x9,%eax
c0101286:	e8 75 fe ff ff       	call   c0101100 <buf_fetch>
c010128b:	89 f2                	mov    %esi,%edx
c010128d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101291:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101295:	5b                   	pop    %ebx
c0101296:	5e                   	pop    %esi
c0101297:	5d                   	pop    %ebp
c0101298:	c3                   	ret    
c0101299:	66 90                	xchg   %ax,%ax
c010129b:	66 90                	xchg   %ax,%ax
c010129d:	66 90                	xchg   %ax,%ax
c010129f:	90                   	nop

c01012a0 <ide_prepare>:
c01012a0:	55                   	push   %ebp
c01012a1:	89 c1                	mov    %eax,%ecx
c01012a3:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012a8:	89 e5                	mov    %esp,%ebp
c01012aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012b0:	ec                   	in     (%dx),%al
c01012b1:	83 e0 c0             	and    $0xffffffc0,%eax
c01012b4:	3c 40                	cmp    $0x40,%al
c01012b6:	75 f8                	jne    c01012b0 <ide_prepare+0x10>
c01012b8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01012bd:	31 c0                	xor    %eax,%eax
c01012bf:	ee                   	out    %al,(%dx)
c01012c0:	b8 01 00 00 00       	mov    $0x1,%eax
c01012c5:	b2 f2                	mov    $0xf2,%dl
c01012c7:	ee                   	out    %al,(%dx)
c01012c8:	b2 f3                	mov    $0xf3,%dl
c01012ca:	89 c8                	mov    %ecx,%eax
c01012cc:	ee                   	out    %al,(%dx)
c01012cd:	89 c8                	mov    %ecx,%eax
c01012cf:	b2 f4                	mov    $0xf4,%dl
c01012d1:	c1 e8 08             	shr    $0x8,%eax
c01012d4:	ee                   	out    %al,(%dx)
c01012d5:	89 c8                	mov    %ecx,%eax
c01012d7:	b2 f5                	mov    $0xf5,%dl
c01012d9:	c1 e8 10             	shr    $0x10,%eax
c01012dc:	ee                   	out    %al,(%dx)
c01012dd:	89 c8                	mov    %ecx,%eax
c01012df:	b2 f6                	mov    $0xf6,%dl
c01012e1:	c1 e8 18             	shr    $0x18,%eax
c01012e4:	83 c8 e0             	or     $0xffffffe0,%eax
c01012e7:	ee                   	out    %al,(%dx)
c01012e8:	5d                   	pop    %ebp
c01012e9:	c3                   	ret    
c01012ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01012f0 <disk_do_read>:
c01012f0:	55                   	push   %ebp
c01012f1:	89 e5                	mov    %esp,%ebp
c01012f3:	53                   	push   %ebx
c01012f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012f7:	e8 a4 ff ff ff       	call   c01012a0 <ide_prepare>
c01012fc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101301:	b8 20 00 00 00       	mov    $0x20,%eax
c0101306:	ee                   	out    %al,(%dx)
c0101307:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010130a:	b2 f0                	mov    $0xf0,%dl
c010130c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101318:	ed                   	in     (%dx),%eax
c0101319:	89 01                	mov    %eax,(%ecx)
c010131b:	83 c1 04             	add    $0x4,%ecx
c010131e:	39 d9                	cmp    %ebx,%ecx
c0101320:	75 f6                	jne    c0101318 <disk_do_read+0x28>
c0101322:	5b                   	pop    %ebx
c0101323:	5d                   	pop    %ebp
c0101324:	c3                   	ret    
c0101325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101330 <disk_do_write>:
c0101330:	55                   	push   %ebp
c0101331:	89 e5                	mov    %esp,%ebp
c0101333:	53                   	push   %ebx
c0101334:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101337:	e8 64 ff ff ff       	call   c01012a0 <ide_prepare>
c010133c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101341:	b8 30 00 00 00       	mov    $0x30,%eax
c0101346:	ee                   	out    %al,(%dx)
c0101347:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010134a:	b2 f0                	mov    $0xf0,%dl
c010134c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101358:	8b 01                	mov    (%ecx),%eax
c010135a:	ef                   	out    %eax,(%dx)
c010135b:	83 c1 04             	add    $0x4,%ecx
c010135e:	39 d9                	cmp    %ebx,%ecx
c0101360:	75 f6                	jne    c0101358 <disk_do_write+0x28>
c0101362:	5b                   	pop    %ebx
c0101363:	5d                   	pop    %ebp
c0101364:	c3                   	ret    
c0101365:	66 90                	xchg   %ax,%ax
c0101367:	66 90                	xchg   %ax,%ax
c0101369:	66 90                	xchg   %ax,%ax
c010136b:	66 90                	xchg   %ax,%ax
c010136d:	66 90                	xchg   %ax,%ax
c010136f:	90                   	nop

c0101370 <dma_prepare>:
c0101370:	55                   	push   %ebp
c0101371:	89 e5                	mov    %esp,%ebp
c0101373:	83 ec 08             	sub    $0x8,%esp
c0101376:	68 b8 18 10 c0       	push   $0xc01018b8
c010137b:	6a 1d                	push   $0x1d
c010137d:	68 4f 18 10 c0       	push   $0xc010184f
c0101382:	68 6c 18 10 c0       	push   $0xc010186c
c0101387:	e8 74 fb ff ff       	call   c0100f00 <printk>
c010138c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101391:	d6                   	(bad)  
c0101392:	83 c4 10             	add    $0x10,%esp
c0101395:	c9                   	leave  
c0101396:	c3                   	ret    
c0101397:	89 f6                	mov    %esi,%esi
c0101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01013a0 <dma_issue_read>:
c01013a0:	55                   	push   %ebp
c01013a1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c01013a6:	89 e5                	mov    %esp,%ebp
c01013a8:	ec                   	in     (%dx),%al
c01013a9:	83 c8 09             	or     $0x9,%eax
c01013ac:	ee                   	out    %al,(%dx)
c01013ad:	5d                   	pop    %ebp
c01013ae:	c3                   	ret    
c01013af:	90                   	nop

c01013b0 <memcpy>:
c01013b0:	55                   	push   %ebp
c01013b1:	89 e5                	mov    %esp,%ebp
c01013b3:	56                   	push   %esi
c01013b4:	57                   	push   %edi
c01013b5:	53                   	push   %ebx
c01013b6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013b9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013bc:	8b 75 0c             	mov    0xc(%ebp),%esi
c01013bf:	fc                   	cld    
c01013c0:	83 f9 08             	cmp    $0x8,%ecx
c01013c3:	76 26                	jbe    c01013eb <memcpy+0x3b>
c01013c5:	89 fa                	mov    %edi,%edx
c01013c7:	89 cb                	mov    %ecx,%ebx
c01013c9:	83 e2 03             	and    $0x3,%edx
c01013cc:	74 10                	je     c01013de <memcpy+0x2e>
c01013ce:	b9 04 00 00 00       	mov    $0x4,%ecx
c01013d3:	29 d1                	sub    %edx,%ecx
c01013d5:	83 e1 03             	and    $0x3,%ecx
c01013d8:	29 cb                	sub    %ecx,%ebx
c01013da:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013dc:	89 d9                	mov    %ebx,%ecx
c01013de:	c1 e9 02             	shr    $0x2,%ecx
c01013e1:	8d 76 00             	lea    0x0(%esi),%esi
c01013e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01013e6:	89 d9                	mov    %ebx,%ecx
c01013e8:	83 e1 03             	and    $0x3,%ecx
c01013eb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01013f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01013f3:	5b                   	pop    %ebx
c01013f4:	5f                   	pop    %edi
c01013f5:	5e                   	pop    %esi
c01013f6:	c9                   	leave  
c01013f7:	c3                   	ret    

c01013f8 <memset>:
c01013f8:	55                   	push   %ebp
c01013f9:	89 e5                	mov    %esp,%ebp
c01013fb:	57                   	push   %edi
c01013fc:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013ff:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101403:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101406:	fc                   	cld    
c0101407:	83 f9 10             	cmp    $0x10,%ecx
c010140a:	76 69                	jbe    c0101475 <memset+0x7d>
c010140c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101412:	74 4c                	je     c0101460 <memset+0x68>
c0101414:	88 07                	mov    %al,(%edi)
c0101416:	47                   	inc    %edi
c0101417:	49                   	dec    %ecx
c0101418:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010141e:	74 40                	je     c0101460 <memset+0x68>
c0101420:	88 07                	mov    %al,(%edi)
c0101422:	47                   	inc    %edi
c0101423:	49                   	dec    %ecx
c0101424:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010142a:	74 34                	je     c0101460 <memset+0x68>
c010142c:	88 07                	mov    %al,(%edi)
c010142e:	47                   	inc    %edi
c010142f:	49                   	dec    %ecx
c0101430:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101436:	74 28                	je     c0101460 <memset+0x68>
c0101438:	88 07                	mov    %al,(%edi)
c010143a:	47                   	inc    %edi
c010143b:	49                   	dec    %ecx
c010143c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101442:	74 1c                	je     c0101460 <memset+0x68>
c0101444:	88 07                	mov    %al,(%edi)
c0101446:	47                   	inc    %edi
c0101447:	49                   	dec    %ecx
c0101448:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010144e:	74 10                	je     c0101460 <memset+0x68>
c0101450:	88 07                	mov    %al,(%edi)
c0101452:	47                   	inc    %edi
c0101453:	49                   	dec    %ecx
c0101454:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010145a:	74 04                	je     c0101460 <memset+0x68>
c010145c:	88 07                	mov    %al,(%edi)
c010145e:	47                   	inc    %edi
c010145f:	49                   	dec    %ecx
c0101460:	88 c4                	mov    %al,%ah
c0101462:	89 c2                	mov    %eax,%edx
c0101464:	c1 e2 10             	shl    $0x10,%edx
c0101467:	09 d0                	or     %edx,%eax
c0101469:	89 ca                	mov    %ecx,%edx
c010146b:	c1 e9 02             	shr    $0x2,%ecx
c010146e:	83 e2 03             	and    $0x3,%edx
c0101471:	f3 ab                	rep stos %eax,%es:(%edi)
c0101473:	89 d1                	mov    %edx,%ecx
c0101475:	f3 aa                	rep stos %al,%es:(%edi)
c0101477:	8b 45 08             	mov    0x8(%ebp),%eax
c010147a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010147d:	5f                   	pop    %edi
c010147e:	c9                   	leave  
c010147f:	c3                   	ret    
