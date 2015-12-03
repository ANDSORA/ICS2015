
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
c010002b:	e9 e0 03 00 00       	jmp    c0100410 <init>

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
c0100066:	e8 05 0b 00 00       	call   c0100b70 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 0e 0b 00 00       	call   c0100b80 <get_ucr3>
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
c010014c:	e8 47 12 00 00       	call   c0101398 <memset>
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
c0100178:	c7 44 24 10 44 14 10 	movl   $0xc0101444,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c a8 14 10 	movl   $0xc01014a8,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 33 14 10 	movl   $0xc0101433,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 54 14 10 c0 	movl   $0xc0101454,(%esp)
c010019f:	e8 fc 0c 00 00       	call   c0100ea0 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 4c 14 10 	movl   $0xc010144c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c a8 14 10 	movl   $0xc01014a8,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 33 14 10 	movl   $0xc0101433,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 54 14 10 c0 	movl   $0xc0101454,(%esp)
c01001ee:	e8 ad 0c 00 00       	call   c0100ea0 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 44 14 10 	movl   $0xc0101444,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c a8 14 10 	movl   $0xc01014a8,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 33 14 10 	movl   $0xc0101433,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 54 14 10 c0 	movl   $0xc0101454,(%esp)
c010022e:	e8 6d 0c 00 00       	call   c0100ea0 <printk>
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
c0100258:	c7 44 24 10 4c 14 10 	movl   $0xc010144c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c a8 14 10 	movl   $0xc01014a8,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 33 14 10 	movl   $0xc0101433,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 54 14 10 c0 	movl   $0xc0101454,(%esp)
c010027f:	e8 1c 0c 00 00       	call   c0100ea0 <printk>
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
c01002a8:	c7 44 24 10 20 14 10 	movl   $0xc0101420,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 9e 14 10 	movl   $0xc010149e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 33 14 10 	movl   $0xc0101433,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 54 14 10 c0 	movl   $0xc0101454,(%esp)
c01002cf:	e8 cc 0b 00 00       	call   c0100ea0 <printk>
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
c01003b3:	83 ec 08             	sub    $0x8,%esp
c01003b6:	e8 05 08 00 00       	call   c0100bc0 <init_mm>
c01003bb:	68 3f 15 10 c0       	push   $0xc010153f
c01003c0:	6a 4d                	push   $0x4d
c01003c2:	68 ae 14 10 c0       	push   $0xc01014ae
c01003c7:	68 c0 14 10 c0       	push   $0xc01014c0
c01003cc:	e8 cf 0a 00 00       	call   c0100ea0 <printk>
c01003d1:	e8 8a 09 00 00       	call   c0100d60 <loader>
c01003d6:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003db:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003e0:	83 ec 10             	sub    $0x10,%esp
c01003e3:	ff d0                	call   *%eax
c01003e5:	68 3f 15 10 c0       	push   $0xc010153f
c01003ea:	6a 6e                	push   $0x6e
c01003ec:	68 ae 14 10 c0       	push   $0xc01014ae
c01003f1:	68 f4 14 10 c0       	push   $0xc01014f4
c01003f6:	e8 a5 0a 00 00       	call   c0100ea0 <printk>
c01003fb:	b8 01 00 00 00       	mov    $0x1,%eax
c0100400:	d6                   	(bad)  
c0100401:	83 c4 20             	add    $0x20,%esp
c0100404:	c9                   	leave  
c0100405:	c3                   	ret    
c0100406:	8d 76 00             	lea    0x0(%esi),%esi
c0100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100410 <init>:
c0100410:	55                   	push   %ebp
c0100411:	89 e5                	mov    %esp,%ebp
c0100413:	83 ec 08             	sub    $0x8,%esp
c0100416:	c7 05 00 40 12 c0 01 	movl   $0x1,0xc0124000
c010041d:	00 00 00 
c0100420:	e8 0b 08 00 00       	call   c0100c30 <init_page>
c0100425:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c010042b:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100430:	ff e0                	jmp    *%eax
c0100432:	68 49 15 10 c0       	push   $0xc0101549
c0100437:	6a 27                	push   $0x27
c0100439:	68 ae 14 10 c0       	push   $0xc01014ae
c010043e:	68 f4 14 10 c0       	push   $0xc01014f4
c0100443:	e8 58 0a 00 00       	call   c0100ea0 <printk>
c0100448:	b8 01 00 00 00       	mov    $0x1,%eax
c010044d:	d6                   	(bad)  
c010044e:	83 c4 10             	add    $0x10,%esp
c0100451:	c9                   	leave  
c0100452:	c3                   	ret    
c0100453:	66 90                	xchg   %ax,%ax
c0100455:	66 90                	xchg   %ax,%ax
c0100457:	66 90                	xchg   %ax,%ax
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
c010047a:	68 c4 15 10 c0       	push   $0xc01015c4
c010047f:	6a 20                	push   $0x20
c0100481:	68 50 15 10 c0       	push   $0xc0101550
c0100486:	68 70 15 10 c0       	push   $0xc0101570
c010048b:	e8 10 0a 00 00       	call   c0100ea0 <printk>
c0100490:	b8 01 00 00 00       	mov    $0x1,%eax
c0100495:	d6                   	(bad)  
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010049c:	c9                   	leave  
c010049d:	c3                   	ret    
c010049e:	66 90                	xchg   %ax,%ax
c01004a0:	83 ec 0c             	sub    $0xc,%esp
c01004a3:	ff 73 04             	pushl  0x4(%ebx)
c01004a6:	e8 e5 06 00 00       	call   c0100b90 <mm_brk>
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
c01004ef:	a1 40 40 12 c0       	mov    0xc0124040,%eax
c01004f4:	83 f8 20             	cmp    $0x20,%eax
c01004f7:	7e 2c                	jle    c0100525 <add_irq_handle+0x45>
c01004f9:	83 ec 0c             	sub    $0xc,%esp
c01004fc:	68 fe 15 10 c0       	push   $0xc01015fe
c0100501:	68 4d 17 10 c0       	push   $0xc010174d
c0100506:	6a 16                	push   $0x16
c0100508:	68 e2 15 10 c0       	push   $0xc01015e2
c010050d:	68 54 14 10 c0       	push   $0xc0101454
c0100512:	e8 89 09 00 00       	call   c0100ea0 <printk>
c0100517:	b8 01 00 00 00       	mov    $0x1,%eax
c010051c:	d6                   	(bad)  
c010051d:	a1 40 40 12 c0       	mov    0xc0124040,%eax
c0100522:	83 c4 20             	add    $0x20,%esp
c0100525:	8d 50 01             	lea    0x1(%eax),%edx
c0100528:	89 15 40 40 12 c0    	mov    %edx,0xc0124040
c010052e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100531:	89 14 c5 c0 40 12 c0 	mov    %edx,-0x3fedbf40(,%eax,8)
c0100538:	8b 14 9d 80 40 12 c0 	mov    -0x3fedbf80(,%ebx,4),%edx
c010053f:	89 14 c5 c4 40 12 c0 	mov    %edx,-0x3fedbf3c(,%eax,8)
c0100546:	8d 04 c5 c0 40 12 c0 	lea    -0x3fedbf40(,%eax,8),%eax
c010054d:	89 04 9d 80 40 12 c0 	mov    %eax,-0x3fedbf80(,%ebx,4)
c0100554:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100557:	c9                   	leave  
c0100558:	c3                   	ret    
c0100559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	68 cf 15 10 c0       	push   $0xc01015cf
c0100568:	68 4d 17 10 c0       	push   $0xc010174d
c010056d:	6a 15                	push   $0x15
c010056f:	68 e2 15 10 c0       	push   $0xc01015e2
c0100574:	68 54 14 10 c0       	push   $0xc0101454
c0100579:	e8 22 09 00 00       	call   c0100ea0 <printk>
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
c010059a:	68 42 17 10 c0       	push   $0xc0101742
c010059f:	6a 24                	push   $0x24
c01005a1:	68 e2 15 10 c0       	push   $0xc01015e2
c01005a6:	68 34 16 10 c0       	push   $0xc0101634
c01005ab:	e8 f0 08 00 00       	call   c0100ea0 <printk>
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
c01005e1:	8b 1c 9d 80 40 12 c0 	mov    -0x3fedbf80(,%ebx,4),%ebx
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
c0100603:	68 1c 16 10 c0       	push   $0xc010161c
c0100608:	68 42 17 10 c0       	push   $0xc0101742
c010060d:	6a 30                	push   $0x30
c010060f:	68 e2 15 10 c0       	push   $0xc01015e2
c0100614:	68 54 14 10 c0       	push   $0xc0101454
c0100619:	e8 82 08 00 00       	call   c0100ea0 <printk>
c010061e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100623:	d6                   	(bad)  
c0100624:	83 c4 20             	add    $0x20,%esp
c0100627:	eb b8                	jmp    c01005e1 <irq_handle+0x51>
c0100629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100630:	83 ec 08             	sub    $0x8,%esp
c0100633:	ff 73 0c             	pushl  0xc(%ebx)
c0100636:	50                   	push   %eax
c0100637:	68 42 17 10 c0       	push   $0xc0101742
c010063c:	6a 2d                	push   $0x2d
c010063e:	68 e2 15 10 c0       	push   $0xc01015e2
c0100643:	68 e8 16 10 c0       	push   $0xc01016e8
c0100648:	e8 53 08 00 00       	call   c0100ea0 <printk>
c010064d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100652:	d6                   	(bad)  
c0100653:	83 c4 20             	add    $0x20,%esp
c0100656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100659:	c9                   	leave  
c010065a:	c3                   	ret    
c010065b:	90                   	nop
c010065c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100660:	68 42 17 10 c0       	push   $0xc0101742
c0100665:	6a 29                	push   $0x29
c0100667:	68 e2 15 10 c0       	push   $0xc01015e2
c010066c:	68 9c 16 10 c0       	push   $0xc010169c
c0100671:	e8 2a 08 00 00       	call   c0100ea0 <printk>
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
c0100716:	b8 00 42 12 c0       	mov    $0xc0124200,%eax
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
c0100740:	3d 00 4a 12 c0       	cmp    $0xc0124a00,%eax
c0100745:	75 e1                	jne    c0100728 <init_idt+0x18>
c0100747:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010074c:	ba 08 00 00 00       	mov    $0x8,%edx
c0100751:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100756:	66 a3 00 42 12 c0    	mov    %ax,0xc0124200
c010075c:	c1 e8 10             	shr    $0x10,%eax
c010075f:	66 89 15 02 42 12 c0 	mov    %dx,0xc0124202
c0100766:	66 a3 06 42 12 c0    	mov    %ax,0xc0124206
c010076c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100771:	ba 08 00 00 00       	mov    $0x8,%edx
c0100776:	66 a3 08 42 12 c0    	mov    %ax,0xc0124208
c010077c:	c1 e8 10             	shr    $0x10,%eax
c010077f:	66 89 0d 0a 42 12 c0 	mov    %cx,0xc012420a
c0100786:	66 a3 0e 42 12 c0    	mov    %ax,0xc012420e
c010078c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100791:	66 89 15 12 42 12 c0 	mov    %dx,0xc0124212
c0100798:	66 a3 10 42 12 c0    	mov    %ax,0xc0124210
c010079e:	c1 e8 10             	shr    $0x10,%eax
c01007a1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007a6:	66 a3 16 42 12 c0    	mov    %ax,0xc0124216
c01007ac:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c01007b1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007b6:	66 a3 18 42 12 c0    	mov    %ax,0xc0124218
c01007bc:	c1 e8 10             	shr    $0x10,%eax
c01007bf:	66 89 0d 1a 42 12 c0 	mov    %cx,0xc012421a
c01007c6:	66 a3 1e 42 12 c0    	mov    %ax,0xc012421e
c01007cc:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c01007d1:	66 89 15 22 42 12 c0 	mov    %dx,0xc0124222
c01007d8:	66 a3 20 42 12 c0    	mov    %ax,0xc0124220
c01007de:	c1 e8 10             	shr    $0x10,%eax
c01007e1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007e6:	66 a3 26 42 12 c0    	mov    %ax,0xc0124226
c01007ec:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c01007f1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007f6:	66 a3 28 42 12 c0    	mov    %ax,0xc0124228
c01007fc:	c1 e8 10             	shr    $0x10,%eax
c01007ff:	66 89 0d 2a 42 12 c0 	mov    %cx,0xc012422a
c0100806:	66 a3 2e 42 12 c0    	mov    %ax,0xc012422e
c010080c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100811:	66 89 15 32 42 12 c0 	mov    %dx,0xc0124232
c0100818:	66 a3 30 42 12 c0    	mov    %ax,0xc0124230
c010081e:	c1 e8 10             	shr    $0x10,%eax
c0100821:	c6 05 04 42 12 c0 00 	movb   $0x0,0xc0124204
c0100828:	c6 05 05 42 12 c0 8f 	movb   $0x8f,0xc0124205
c010082f:	c6 05 0c 42 12 c0 00 	movb   $0x0,0xc012420c
c0100836:	b9 08 00 00 00       	mov    $0x8,%ecx
c010083b:	c6 05 0d 42 12 c0 8f 	movb   $0x8f,0xc012420d
c0100842:	c6 05 14 42 12 c0 00 	movb   $0x0,0xc0124214
c0100849:	ba 08 00 00 00       	mov    $0x8,%edx
c010084e:	c6 05 15 42 12 c0 8f 	movb   $0x8f,0xc0124215
c0100855:	c6 05 1c 42 12 c0 00 	movb   $0x0,0xc012421c
c010085c:	c6 05 1d 42 12 c0 8f 	movb   $0x8f,0xc012421d
c0100863:	c6 05 24 42 12 c0 00 	movb   $0x0,0xc0124224
c010086a:	c6 05 25 42 12 c0 8f 	movb   $0x8f,0xc0124225
c0100871:	c6 05 2c 42 12 c0 00 	movb   $0x0,0xc012422c
c0100878:	c6 05 2d 42 12 c0 8f 	movb   $0x8f,0xc012422d
c010087f:	c6 05 34 42 12 c0 00 	movb   $0x0,0xc0124234
c0100886:	c6 05 35 42 12 c0 8f 	movb   $0x8f,0xc0124235
c010088d:	66 a3 36 42 12 c0    	mov    %ax,0xc0124236
c0100893:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100898:	66 a3 38 42 12 c0    	mov    %ax,0xc0124238
c010089e:	c1 e8 10             	shr    $0x10,%eax
c01008a1:	66 89 0d 3a 42 12 c0 	mov    %cx,0xc012423a
c01008a8:	66 a3 3e 42 12 c0    	mov    %ax,0xc012423e
c01008ae:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c01008b3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008b8:	66 a3 40 42 12 c0    	mov    %ax,0xc0124240
c01008be:	c1 e8 10             	shr    $0x10,%eax
c01008c1:	66 89 15 42 42 12 c0 	mov    %dx,0xc0124242
c01008c8:	66 a3 46 42 12 c0    	mov    %ax,0xc0124246
c01008ce:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c01008d3:	66 89 0d 4a 42 12 c0 	mov    %cx,0xc012424a
c01008da:	66 a3 48 42 12 c0    	mov    %ax,0xc0124248
c01008e0:	c1 e8 10             	shr    $0x10,%eax
c01008e3:	ba 08 00 00 00       	mov    $0x8,%edx
c01008e8:	66 a3 4e 42 12 c0    	mov    %ax,0xc012424e
c01008ee:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c01008f3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008f8:	66 a3 50 42 12 c0    	mov    %ax,0xc0124250
c01008fe:	c1 e8 10             	shr    $0x10,%eax
c0100901:	66 89 15 52 42 12 c0 	mov    %dx,0xc0124252
c0100908:	66 a3 56 42 12 c0    	mov    %ax,0xc0124256
c010090e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100913:	66 89 0d 5a 42 12 c0 	mov    %cx,0xc012425a
c010091a:	66 a3 58 42 12 c0    	mov    %ax,0xc0124258
c0100920:	c1 e8 10             	shr    $0x10,%eax
c0100923:	ba 08 00 00 00       	mov    $0x8,%edx
c0100928:	66 a3 5e 42 12 c0    	mov    %ax,0xc012425e
c010092e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100933:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100938:	66 a3 60 42 12 c0    	mov    %ax,0xc0124260
c010093e:	c1 e8 10             	shr    $0x10,%eax
c0100941:	66 89 15 62 42 12 c0 	mov    %dx,0xc0124262
c0100948:	66 a3 66 42 12 c0    	mov    %ax,0xc0124266
c010094e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100953:	66 89 0d 6a 42 12 c0 	mov    %cx,0xc012426a
c010095a:	66 a3 68 42 12 c0    	mov    %ax,0xc0124268
c0100960:	c1 e8 10             	shr    $0x10,%eax
c0100963:	c6 05 3c 42 12 c0 00 	movb   $0x0,0xc012423c
c010096a:	c6 05 3d 42 12 c0 8f 	movb   $0x8f,0xc012423d
c0100971:	c6 05 44 42 12 c0 00 	movb   $0x0,0xc0124244
c0100978:	ba 08 00 00 00       	mov    $0x8,%edx
c010097d:	c6 05 45 42 12 c0 8f 	movb   $0x8f,0xc0124245
c0100984:	c6 05 4c 42 12 c0 00 	movb   $0x0,0xc012424c
c010098b:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100990:	c6 05 4d 42 12 c0 8f 	movb   $0x8f,0xc012424d
c0100997:	c6 05 54 42 12 c0 00 	movb   $0x0,0xc0124254
c010099e:	c6 05 55 42 12 c0 8f 	movb   $0x8f,0xc0124255
c01009a5:	c6 05 5c 42 12 c0 00 	movb   $0x0,0xc012425c
c01009ac:	c6 05 5d 42 12 c0 8f 	movb   $0x8f,0xc012425d
c01009b3:	c6 05 64 42 12 c0 00 	movb   $0x0,0xc0124264
c01009ba:	c6 05 65 42 12 c0 8f 	movb   $0x8f,0xc0124265
c01009c1:	c6 05 6c 42 12 c0 00 	movb   $0x0,0xc012426c
c01009c8:	66 a3 6e 42 12 c0    	mov    %ax,0xc012426e
c01009ce:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c01009d3:	66 89 15 72 42 12 c0 	mov    %dx,0xc0124272
c01009da:	66 a3 70 42 12 c0    	mov    %ax,0xc0124270
c01009e0:	c1 e8 10             	shr    $0x10,%eax
c01009e3:	66 89 0d 02 46 12 c0 	mov    %cx,0xc0124602
c01009ea:	66 a3 76 42 12 c0    	mov    %ax,0xc0124276
c01009f0:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c01009f5:	ba 08 00 00 00       	mov    $0x8,%edx
c01009fa:	66 a3 00 46 12 c0    	mov    %ax,0xc0124600
c0100a00:	c1 e8 10             	shr    $0x10,%eax
c0100a03:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a08:	66 a3 06 46 12 c0    	mov    %ax,0xc0124606
c0100a0e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a13:	c6 05 6d 42 12 c0 8f 	movb   $0x8f,0xc012426d
c0100a1a:	66 a3 00 43 12 c0    	mov    %ax,0xc0124300
c0100a20:	c1 e8 10             	shr    $0x10,%eax
c0100a23:	c6 05 74 42 12 c0 00 	movb   $0x0,0xc0124274
c0100a2a:	66 a3 06 43 12 c0    	mov    %ax,0xc0124306
c0100a30:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a35:	c6 05 75 42 12 c0 8f 	movb   $0x8f,0xc0124275
c0100a3c:	66 a3 70 43 12 c0    	mov    %ax,0xc0124370
c0100a42:	c1 e8 10             	shr    $0x10,%eax
c0100a45:	c6 05 04 46 12 c0 00 	movb   $0x0,0xc0124604
c0100a4c:	66 a3 76 43 12 c0    	mov    %ax,0xc0124376
c0100a52:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100a57:	c6 05 05 46 12 c0 ef 	movb   $0xef,0xc0124605
c0100a5e:	66 a3 c0 41 12 c0    	mov    %ax,0xc01241c0
c0100a64:	b8 00 42 12 c0       	mov    $0xc0124200,%eax
c0100a69:	66 89 15 02 43 12 c0 	mov    %dx,0xc0124302
c0100a70:	66 a3 c2 41 12 c0    	mov    %ax,0xc01241c2
c0100a76:	c1 e8 10             	shr    $0x10,%eax
c0100a79:	c6 05 04 43 12 c0 00 	movb   $0x0,0xc0124304
c0100a80:	66 a3 c4 41 12 c0    	mov    %ax,0xc01241c4
c0100a86:	c6 05 05 43 12 c0 8e 	movb   $0x8e,0xc0124305
c0100a8d:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c0100a92:	66 89 0d 72 43 12 c0 	mov    %cx,0xc0124372
c0100a99:	c6 05 74 43 12 c0 00 	movb   $0x0,0xc0124374
c0100aa0:	c6 05 75 43 12 c0 8e 	movb   $0x8e,0xc0124375
c0100aa7:	0f 01 18             	lidtl  (%eax)
c0100aaa:	5d                   	pop    %ebp
c0100aab:	c3                   	ret    
c0100aac:	66 90                	xchg   %ax,%ax
c0100aae:	66 90                	xchg   %ax,%ax

c0100ab0 <create_video_mapping>:
c0100ab0:	55                   	push   %ebp
c0100ab1:	89 e5                	mov    %esp,%ebp
c0100ab3:	83 ec 08             	sub    $0x8,%esp
c0100ab6:	68 e8 17 10 c0       	push   $0xc01017e8
c0100abb:	6a 11                	push   $0x11
c0100abd:	68 5c 17 10 c0       	push   $0xc010175c
c0100ac2:	68 84 17 10 c0       	push   $0xc0101784
c0100ac7:	e8 d4 03 00 00       	call   c0100ea0 <printk>
c0100acc:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ad1:	d6                   	(bad)  
c0100ad2:	83 c4 10             	add    $0x10,%esp
c0100ad5:	c9                   	leave  
c0100ad6:	c3                   	ret    
c0100ad7:	89 f6                	mov    %esi,%esi
c0100ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100ae0 <video_mapping_write_test>:
c0100ae0:	55                   	push   %ebp
c0100ae1:	31 c0                	xor    %eax,%eax
c0100ae3:	89 e5                	mov    %esp,%ebp
c0100ae5:	8d 76 00             	lea    0x0(%esi),%esi
c0100ae8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100aef:	83 c0 01             	add    $0x1,%eax
c0100af2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100af7:	75 ef                	jne    c0100ae8 <video_mapping_write_test+0x8>
c0100af9:	5d                   	pop    %ebp
c0100afa:	c3                   	ret    
c0100afb:	90                   	nop
c0100afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100b00 <video_mapping_read_test>:
c0100b00:	55                   	push   %ebp
c0100b01:	89 e5                	mov    %esp,%ebp
c0100b03:	56                   	push   %esi
c0100b04:	be 01 00 00 00       	mov    $0x1,%esi
c0100b09:	53                   	push   %ebx
c0100b0a:	31 db                	xor    %ebx,%ebx
c0100b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b10:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100b17:	74 24                	je     c0100b3d <video_mapping_read_test+0x3d>
c0100b19:	83 ec 0c             	sub    $0xc,%esp
c0100b1c:	68 75 17 10 c0       	push   $0xc0101775
c0100b21:	68 d0 17 10 c0       	push   $0xc01017d0
c0100b26:	6a 20                	push   $0x20
c0100b28:	68 5c 17 10 c0       	push   $0xc010175c
c0100b2d:	68 54 14 10 c0       	push   $0xc0101454
c0100b32:	e8 69 03 00 00       	call   c0100ea0 <printk>
c0100b37:	89 f0                	mov    %esi,%eax
c0100b39:	d6                   	(bad)  
c0100b3a:	83 c4 20             	add    $0x20,%esp
c0100b3d:	83 c3 01             	add    $0x1,%ebx
c0100b40:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100b46:	75 c8                	jne    c0100b10 <video_mapping_read_test+0x10>
c0100b48:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100b4b:	5b                   	pop    %ebx
c0100b4c:	5e                   	pop    %esi
c0100b4d:	5d                   	pop    %ebp
c0100b4e:	c3                   	ret    
c0100b4f:	90                   	nop

c0100b50 <video_mapping_clear>:
c0100b50:	55                   	push   %ebp
c0100b51:	89 e5                	mov    %esp,%ebp
c0100b53:	83 ec 0c             	sub    $0xc,%esp
c0100b56:	68 00 fa 00 00       	push   $0xfa00
c0100b5b:	6a 00                	push   $0x0
c0100b5d:	68 00 00 0a 00       	push   $0xa0000
c0100b62:	e8 31 08 00 00       	call   c0101398 <memset>
c0100b67:	83 c4 10             	add    $0x10,%esp
c0100b6a:	c9                   	leave  
c0100b6b:	c3                   	ret    
c0100b6c:	66 90                	xchg   %ax,%ax
c0100b6e:	66 90                	xchg   %ax,%ax

c0100b70 <get_updir>:
c0100b70:	55                   	push   %ebp
c0100b71:	b8 00 60 12 c0       	mov    $0xc0126000,%eax
c0100b76:	89 e5                	mov    %esp,%ebp
c0100b78:	5d                   	pop    %ebp
c0100b79:	c3                   	ret    
c0100b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100b80 <get_ucr3>:
c0100b80:	55                   	push   %ebp
c0100b81:	a1 04 50 12 c0       	mov    0xc0125004,%eax
c0100b86:	89 e5                	mov    %esp,%ebp
c0100b88:	5d                   	pop    %ebp
c0100b89:	c3                   	ret    
c0100b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100b90 <mm_brk>:
c0100b90:	55                   	push   %ebp
c0100b91:	89 e5                	mov    %esp,%ebp
c0100b93:	53                   	push   %ebx
c0100b94:	83 ec 04             	sub    $0x4,%esp
c0100b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100b9a:	a1 00 50 12 c0       	mov    0xc0125000,%eax
c0100b9f:	39 d8                	cmp    %ebx,%eax
c0100ba1:	73 11                	jae    c0100bb4 <mm_brk+0x24>
c0100ba3:	89 da                	mov    %ebx,%edx
c0100ba5:	83 ec 08             	sub    $0x8,%esp
c0100ba8:	29 c2                	sub    %eax,%edx
c0100baa:	52                   	push   %edx
c0100bab:	50                   	push   %eax
c0100bac:	e8 9f f4 ff ff       	call   c0100050 <mm_malloc>
c0100bb1:	83 c4 10             	add    $0x10,%esp
c0100bb4:	89 1d 00 50 12 c0    	mov    %ebx,0xc0125000
c0100bba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bbd:	c9                   	leave  
c0100bbe:	c3                   	ret    
c0100bbf:	90                   	nop

c0100bc0 <init_mm>:
c0100bc0:	55                   	push   %ebp
c0100bc1:	89 e5                	mov    %esp,%ebp
c0100bc3:	53                   	push   %ebx
c0100bc4:	83 ec 04             	sub    $0x4,%esp
c0100bc7:	e8 54 00 00 00       	call   c0100c20 <get_kpdir>
c0100bcc:	83 ec 04             	sub    $0x4,%esp
c0100bcf:	89 c3                	mov    %eax,%ebx
c0100bd1:	68 00 10 00 00       	push   $0x1000
c0100bd6:	6a 00                	push   $0x0
c0100bd8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100bde:	68 00 60 12 c0       	push   $0xc0126000
c0100be3:	e8 b0 07 00 00       	call   c0101398 <memset>
c0100be8:	83 c4 0c             	add    $0xc,%esp
c0100beb:	68 80 00 00 00       	push   $0x80
c0100bf0:	53                   	push   %ebx
c0100bf1:	68 00 6c 12 c0       	push   $0xc0126c00
c0100bf6:	e8 55 07 00 00       	call   c0101350 <memcpy>
c0100bfb:	b8 00 60 12 00       	mov    $0x126000,%eax
c0100c00:	83 c4 10             	add    $0x10,%esp
c0100c03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c06:	25 00 fc ff ff       	and    $0xfffffc00,%eax
c0100c0b:	a3 04 50 12 c0       	mov    %eax,0xc0125004
c0100c10:	c9                   	leave  
c0100c11:	c3                   	ret    
c0100c12:	66 90                	xchg   %ax,%ax
c0100c14:	66 90                	xchg   %ax,%ax
c0100c16:	66 90                	xchg   %ax,%ax
c0100c18:	66 90                	xchg   %ax,%ax
c0100c1a:	66 90                	xchg   %ax,%ax
c0100c1c:	66 90                	xchg   %ax,%ax
c0100c1e:	66 90                	xchg   %ax,%ax

c0100c20 <get_kpdir>:
c0100c20:	55                   	push   %ebp
c0100c21:	b8 00 80 14 c0       	mov    $0xc0148000,%eax
c0100c26:	89 e5                	mov    %esp,%ebp
c0100c28:	5d                   	pop    %ebp
c0100c29:	c3                   	ret    
c0100c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c30 <init_page>:
c0100c30:	55                   	push   %ebp
c0100c31:	89 e5                	mov    %esp,%ebp
c0100c33:	57                   	push   %edi
c0100c34:	83 ec 08             	sub    $0x8,%esp
c0100c37:	68 00 10 00 00       	push   $0x1000
c0100c3c:	6a 00                	push   $0x0
c0100c3e:	68 00 80 14 00       	push   $0x148000
c0100c43:	e8 50 07 00 00       	call   c0101398 <memset>
c0100c48:	b9 00 80 14 00       	mov    $0x148000,%ecx
c0100c4d:	83 c4 10             	add    $0x10,%esp
c0100c50:	ba 00 80 12 00       	mov    $0x128000,%edx
c0100c55:	8d 76 00             	lea    0x0(%esi),%esi
c0100c58:	89 d0                	mov    %edx,%eax
c0100c5a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100c60:	83 c1 04             	add    $0x4,%ecx
c0100c63:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c68:	83 c8 07             	or     $0x7,%eax
c0100c6b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100c6e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100c74:	81 fa 00 80 14 00    	cmp    $0x148000,%edx
c0100c7a:	75 dc                	jne    c0100c58 <init_page+0x28>
c0100c7c:	bf fc 7f 14 00       	mov    $0x147ffc,%edi
c0100c81:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100c86:	fd                   	std    
c0100c87:	ab                   	stos   %eax,%es:(%edi)
c0100c88:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100c8d:	7d f8                	jge    c0100c87 <init_page+0x57>
c0100c8f:	b8 00 80 14 00       	mov    $0x148000,%eax
c0100c94:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c99:	0f 22 d8             	mov    %eax,%cr3
c0100c9c:	0f 20 c0             	mov    %cr0,%eax
c0100c9f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100ca4:	0f 22 c0             	mov    %eax,%cr0
c0100ca7:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100caa:	c9                   	leave  
c0100cab:	c3                   	ret    
c0100cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100cb0 <init_segment>:
c0100cb0:	55                   	push   %ebp
c0100cb1:	89 e5                	mov    %esp,%ebp
c0100cb3:	83 ec 0c             	sub    $0xc,%esp
c0100cb6:	6a 18                	push   $0x18
c0100cb8:	6a 00                	push   $0x0
c0100cba:	68 08 70 12 c0       	push   $0xc0127008
c0100cbf:	e8 d4 06 00 00       	call   c0101398 <memset>
c0100cc4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100cc9:	31 c9                	xor    %ecx,%ecx
c0100ccb:	b8 08 70 12 c0       	mov    $0xc0127008,%eax
c0100cd0:	66 89 15 10 70 12 c0 	mov    %dx,0xc0127010
c0100cd7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100cdc:	66 89 0d 12 70 12 c0 	mov    %cx,0xc0127012
c0100ce3:	66 89 15 18 70 12 c0 	mov    %dx,0xc0127018
c0100cea:	ba 17 00 00 00       	mov    $0x17,%edx
c0100cef:	31 c9                	xor    %ecx,%ecx
c0100cf1:	66 89 15 00 70 12 c0 	mov    %dx,0xc0127000
c0100cf8:	66 a3 02 70 12 c0    	mov    %ax,0xc0127002
c0100cfe:	c1 e8 10             	shr    $0x10,%eax
c0100d01:	66 a3 04 70 12 c0    	mov    %ax,0xc0127004
c0100d07:	c6 05 14 70 12 c0 00 	movb   $0x0,0xc0127014
c0100d0e:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100d13:	c6 05 15 70 12 c0 9a 	movb   $0x9a,0xc0127015
c0100d1a:	c6 05 16 70 12 c0 cf 	movb   $0xcf,0xc0127016
c0100d21:	c6 05 17 70 12 c0 00 	movb   $0x0,0xc0127017
c0100d28:	66 89 0d 1a 70 12 c0 	mov    %cx,0xc012701a
c0100d2f:	c6 05 1c 70 12 c0 00 	movb   $0x0,0xc012701c
c0100d36:	c6 05 1d 70 12 c0 92 	movb   $0x92,0xc012701d
c0100d3d:	c6 05 1e 70 12 c0 cf 	movb   $0xcf,0xc012701e
c0100d44:	c6 05 1f 70 12 c0 00 	movb   $0x0,0xc012701f
c0100d4b:	0f 01 10             	lgdtl  (%eax)
c0100d4e:	83 c4 10             	add    $0x10,%esp
c0100d51:	c9                   	leave  
c0100d52:	c3                   	ret    
c0100d53:	66 90                	xchg   %ax,%ax
c0100d55:	66 90                	xchg   %ax,%ax
c0100d57:	66 90                	xchg   %ax,%ax
c0100d59:	66 90                	xchg   %ax,%ax
c0100d5b:	66 90                	xchg   %ax,%ax
c0100d5d:	66 90                	xchg   %ax,%ax
c0100d5f:	90                   	nop

c0100d60 <loader>:
c0100d60:	55                   	push   %ebp
c0100d61:	89 e5                	mov    %esp,%ebp
c0100d63:	57                   	push   %edi
c0100d64:	56                   	push   %esi
c0100d65:	53                   	push   %ebx
c0100d66:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100d6c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100d72:	68 00 10 00 00       	push   $0x1000
c0100d77:	6a 00                	push   $0x0
c0100d79:	53                   	push   %ebx
c0100d7a:	e8 91 01 00 00       	call   c0100f10 <ramdisk_read>
c0100d7f:	83 c4 10             	add    $0x10,%esp
c0100d82:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100d89:	45 4c 46 
c0100d8c:	74 06                	je     c0100d94 <loader+0x34>
c0100d8e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100d93:	d6                   	(bad)  
c0100d94:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100d9a:	83 fa 34             	cmp    $0x34,%edx
c0100d9d:	74 06                	je     c0100da5 <loader+0x45>
c0100d9f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100da4:	d6                   	(bad)  
c0100da5:	31 f6                	xor    %esi,%esi
c0100da7:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100dae:	00 
c0100daf:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100db3:	75 1c                	jne    c0100dd1 <loader+0x71>
c0100db5:	eb 79                	jmp    c0100e30 <loader+0xd0>
c0100db7:	89 f6                	mov    %esi,%esi
c0100db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100dc0:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100dc7:	83 c6 01             	add    $0x1,%esi
c0100dca:	83 c3 20             	add    $0x20,%ebx
c0100dcd:	39 f0                	cmp    %esi,%eax
c0100dcf:	7e 5f                	jle    c0100e30 <loader+0xd0>
c0100dd1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100dd5:	75 e9                	jne    c0100dc0 <loader+0x60>
c0100dd7:	83 ec 08             	sub    $0x8,%esp
c0100dda:	ff 33                	pushl  (%ebx)
c0100ddc:	ff 73 f4             	pushl  -0xc(%ebx)
c0100ddf:	e8 6c f2 ff ff       	call   c0100050 <mm_malloc>
c0100de4:	83 c4 0c             	add    $0xc,%esp
c0100de7:	ff 73 fc             	pushl  -0x4(%ebx)
c0100dea:	ff 73 f0             	pushl  -0x10(%ebx)
c0100ded:	50                   	push   %eax
c0100dee:	89 c7                	mov    %eax,%edi
c0100df0:	e8 1b 01 00 00       	call   c0100f10 <ramdisk_read>
c0100df5:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100df8:	8b 13                	mov    (%ebx),%edx
c0100dfa:	83 c4 0c             	add    $0xc,%esp
c0100dfd:	29 c2                	sub    %eax,%edx
c0100dff:	52                   	push   %edx
c0100e00:	6a 00                	push   $0x0
c0100e02:	03 43 f0             	add    -0x10(%ebx),%eax
c0100e05:	01 c7                	add    %eax,%edi
c0100e07:	57                   	push   %edi
c0100e08:	e8 8b 05 00 00       	call   c0101398 <memset>
c0100e0d:	8b 03                	mov    (%ebx),%eax
c0100e0f:	03 43 f4             	add    -0xc(%ebx),%eax
c0100e12:	83 c4 10             	add    $0x10,%esp
c0100e15:	83 e8 01             	sub    $0x1,%eax
c0100e18:	3b 05 00 50 12 c0    	cmp    0xc0125000,%eax
c0100e1e:	76 a0                	jbe    c0100dc0 <loader+0x60>
c0100e20:	a3 00 50 12 c0       	mov    %eax,0xc0125000
c0100e25:	eb 99                	jmp    c0100dc0 <loader+0x60>
c0100e27:	89 f6                	mov    %esi,%esi
c0100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e30:	83 ec 08             	sub    $0x8,%esp
c0100e33:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100e39:	68 00 00 10 00       	push   $0x100000
c0100e3e:	68 00 00 f0 bf       	push   $0xbff00000
c0100e43:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100e49:	e8 02 f2 ff ff       	call   c0100050 <mm_malloc>
c0100e4e:	e8 2d fd ff ff       	call   c0100b80 <get_ucr3>
c0100e53:	0f 22 d8             	mov    %eax,%cr3
c0100e56:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100e5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100e5f:	5b                   	pop    %ebx
c0100e60:	5e                   	pop    %esi
c0100e61:	5f                   	pop    %edi
c0100e62:	5d                   	pop    %ebp
c0100e63:	c3                   	ret    
c0100e64:	66 90                	xchg   %ax,%ax
c0100e66:	66 90                	xchg   %ax,%ax
c0100e68:	66 90                	xchg   %ax,%ax
c0100e6a:	66 90                	xchg   %ax,%ax
c0100e6c:	66 90                	xchg   %ax,%ax
c0100e6e:	66 90                	xchg   %ax,%ax

c0100e70 <sbrk>:
c0100e70:	55                   	push   %ebp
c0100e71:	89 e5                	mov    %esp,%ebp
c0100e73:	83 ec 08             	sub    $0x8,%esp
c0100e76:	68 13 18 10 c0       	push   $0xc0101813
c0100e7b:	6a 08                	push   $0x8
c0100e7d:	68 fd 17 10 c0       	push   $0xc01017fd
c0100e82:	68 f4 14 10 c0       	push   $0xc01014f4
c0100e87:	e8 14 00 00 00       	call   c0100ea0 <printk>
c0100e8c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e91:	d6                   	(bad)  
c0100e92:	30 c0                	xor    %al,%al
c0100e94:	c9                   	leave  
c0100e95:	c3                   	ret    
c0100e96:	66 90                	xchg   %ax,%ax
c0100e98:	66 90                	xchg   %ax,%ax
c0100e9a:	66 90                	xchg   %ax,%ax
c0100e9c:	66 90                	xchg   %ax,%ax
c0100e9e:	66 90                	xchg   %ax,%ax

c0100ea0 <printk>:
c0100ea0:	55                   	push   %ebp
c0100ea1:	89 e5                	mov    %esp,%ebp
c0100ea3:	5d                   	pop    %ebp
c0100ea4:	c3                   	ret    
c0100ea5:	66 90                	xchg   %ax,%ax
c0100ea7:	66 90                	xchg   %ax,%ax
c0100ea9:	66 90                	xchg   %ax,%ax
c0100eab:	66 90                	xchg   %ax,%ax
c0100ead:	66 90                	xchg   %ax,%ax
c0100eaf:	90                   	nop

c0100eb0 <init_serial>:
c0100eb0:	55                   	push   %ebp
c0100eb1:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100eb6:	31 c0                	xor    %eax,%eax
c0100eb8:	89 e5                	mov    %esp,%ebp
c0100eba:	ee                   	out    %al,(%dx)
c0100ebb:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100ec0:	b2 fb                	mov    $0xfb,%dl
c0100ec2:	ee                   	out    %al,(%dx)
c0100ec3:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ec8:	b2 f8                	mov    $0xf8,%dl
c0100eca:	ee                   	out    %al,(%dx)
c0100ecb:	31 c0                	xor    %eax,%eax
c0100ecd:	b2 f9                	mov    $0xf9,%dl
c0100ecf:	ee                   	out    %al,(%dx)
c0100ed0:	b8 03 00 00 00       	mov    $0x3,%eax
c0100ed5:	b2 fb                	mov    $0xfb,%dl
c0100ed7:	ee                   	out    %al,(%dx)
c0100ed8:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100edd:	b2 fa                	mov    $0xfa,%dl
c0100edf:	ee                   	out    %al,(%dx)
c0100ee0:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100ee5:	b2 fc                	mov    $0xfc,%dl
c0100ee7:	ee                   	out    %al,(%dx)
c0100ee8:	5d                   	pop    %ebp
c0100ee9:	c3                   	ret    
c0100eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100ef0 <serial_printc>:
c0100ef0:	55                   	push   %ebp
c0100ef1:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100ef6:	89 e5                	mov    %esp,%ebp
c0100ef8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100efb:	90                   	nop
c0100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f00:	ec                   	in     (%dx),%al
c0100f01:	a8 20                	test   $0x20,%al
c0100f03:	74 fb                	je     c0100f00 <serial_printc+0x10>
c0100f05:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100f0a:	89 c8                	mov    %ecx,%eax
c0100f0c:	ee                   	out    %al,(%dx)
c0100f0d:	5d                   	pop    %ebp
c0100f0e:	c3                   	ret    
c0100f0f:	90                   	nop

c0100f10 <ramdisk_read>:
c0100f10:	55                   	push   %ebp
c0100f11:	89 e5                	mov    %esp,%ebp
c0100f13:	53                   	push   %ebx
c0100f14:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f17:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f1a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f1d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f20:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f25:	76 06                	jbe    c0100f2d <ramdisk_read+0x1d>
c0100f27:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f2c:	d6                   	(bad)  
c0100f2d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100f30:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f33:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100f36:	5b                   	pop    %ebx
c0100f37:	5d                   	pop    %ebp
c0100f38:	e9 13 04 00 00       	jmp    c0101350 <memcpy>
c0100f3d:	8d 76 00             	lea    0x0(%esi),%esi

c0100f40 <ramdisk_write>:
c0100f40:	55                   	push   %ebp
c0100f41:	89 e5                	mov    %esp,%ebp
c0100f43:	53                   	push   %ebx
c0100f44:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f47:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f4a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f4d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f50:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f55:	76 06                	jbe    c0100f5d <ramdisk_write+0x1d>
c0100f57:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f5c:	d6                   	(bad)  
c0100f5d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0100f60:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f63:	89 55 08             	mov    %edx,0x8(%ebp)
c0100f66:	5b                   	pop    %ebx
c0100f67:	5d                   	pop    %ebp
c0100f68:	e9 e3 03 00 00       	jmp    c0101350 <memcpy>
c0100f6d:	66 90                	xchg   %ax,%ax
c0100f6f:	90                   	nop

c0100f70 <ide_intr>:
c0100f70:	55                   	push   %ebp
c0100f71:	c7 05 04 90 14 c0 01 	movl   $0x1,0xc0149004
c0100f78:	00 00 00 
c0100f7b:	89 e5                	mov    %esp,%ebp
c0100f7d:	5d                   	pop    %ebp
c0100f7e:	c3                   	ret    
c0100f7f:	90                   	nop

c0100f80 <ide_writeback>:
c0100f80:	a1 00 90 14 c0       	mov    0xc0149000,%eax
c0100f85:	83 c0 01             	add    $0x1,%eax
c0100f88:	83 f8 64             	cmp    $0x64,%eax
c0100f8b:	a3 00 90 14 c0       	mov    %eax,0xc0149000
c0100f90:	74 06                	je     c0100f98 <ide_writeback+0x18>
c0100f92:	c3                   	ret    
c0100f93:	90                   	nop
c0100f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f98:	55                   	push   %ebp
c0100f99:	89 e5                	mov    %esp,%ebp
c0100f9b:	83 ec 08             	sub    $0x8,%esp
c0100f9e:	e8 dd 01 00 00       	call   c0101180 <buf_writeback>
c0100fa3:	c7 05 00 90 14 c0 00 	movl   $0x0,0xc0149000
c0100faa:	00 00 00 
c0100fad:	c9                   	leave  
c0100fae:	c3                   	ret    
c0100faf:	90                   	nop

c0100fb0 <ide_read>:
c0100fb0:	55                   	push   %ebp
c0100fb1:	89 e5                	mov    %esp,%ebp
c0100fb3:	57                   	push   %edi
c0100fb4:	56                   	push   %esi
c0100fb5:	53                   	push   %ebx
c0100fb6:	83 ec 0c             	sub    $0xc,%esp
c0100fb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100fbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0100fbf:	8b 7d 08             	mov    0x8(%ebp),%edi
c0100fc2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0100fc5:	29 df                	sub    %ebx,%edi
c0100fc7:	85 c0                	test   %eax,%eax
c0100fc9:	74 1b                	je     c0100fe6 <ide_read+0x36>
c0100fcb:	90                   	nop
c0100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100fd0:	83 ec 0c             	sub    $0xc,%esp
c0100fd3:	53                   	push   %ebx
c0100fd4:	e8 07 02 00 00       	call   c01011e0 <read_byte>
c0100fd9:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c0100fdc:	83 c3 01             	add    $0x1,%ebx
c0100fdf:	83 c4 10             	add    $0x10,%esp
c0100fe2:	39 f3                	cmp    %esi,%ebx
c0100fe4:	75 ea                	jne    c0100fd0 <ide_read+0x20>
c0100fe6:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100fe9:	5b                   	pop    %ebx
c0100fea:	5e                   	pop    %esi
c0100feb:	5f                   	pop    %edi
c0100fec:	5d                   	pop    %ebp
c0100fed:	c3                   	ret    
c0100fee:	66 90                	xchg   %ax,%ax

c0100ff0 <ide_write>:
c0100ff0:	55                   	push   %ebp
c0100ff1:	89 e5                	mov    %esp,%ebp
c0100ff3:	57                   	push   %edi
c0100ff4:	56                   	push   %esi
c0100ff5:	53                   	push   %ebx
c0100ff6:	83 ec 0c             	sub    $0xc,%esp
c0100ff9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100ffc:	8b 45 10             	mov    0x10(%ebp),%eax
c0100fff:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101002:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101005:	29 df                	sub    %ebx,%edi
c0101007:	85 c0                	test   %eax,%eax
c0101009:	74 1d                	je     c0101028 <ide_write+0x38>
c010100b:	90                   	nop
c010100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101010:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101014:	83 ec 08             	sub    $0x8,%esp
c0101017:	50                   	push   %eax
c0101018:	53                   	push   %ebx
c0101019:	83 c3 01             	add    $0x1,%ebx
c010101c:	e8 ef 01 00 00       	call   c0101210 <write_byte>
c0101021:	83 c4 10             	add    $0x10,%esp
c0101024:	39 f3                	cmp    %esi,%ebx
c0101026:	75 e8                	jne    c0101010 <ide_write+0x20>
c0101028:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010102b:	5b                   	pop    %ebx
c010102c:	5e                   	pop    %esi
c010102d:	5f                   	pop    %edi
c010102e:	5d                   	pop    %ebp
c010102f:	c3                   	ret    

c0101030 <clear_ide_intr>:
c0101030:	55                   	push   %ebp
c0101031:	c7 05 04 90 14 c0 00 	movl   $0x0,0xc0149004
c0101038:	00 00 00 
c010103b:	89 e5                	mov    %esp,%ebp
c010103d:	5d                   	pop    %ebp
c010103e:	c3                   	ret    
c010103f:	90                   	nop

c0101040 <wait_ide_intr>:
c0101040:	a1 04 90 14 c0       	mov    0xc0149004,%eax
c0101045:	55                   	push   %ebp
c0101046:	89 e5                	mov    %esp,%ebp
c0101048:	85 c0                	test   %eax,%eax
c010104a:	75 0e                	jne    c010105a <wait_ide_intr+0x1a>
c010104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101050:	f4                   	hlt    
c0101051:	a1 04 90 14 c0       	mov    0xc0149004,%eax
c0101056:	85 c0                	test   %eax,%eax
c0101058:	74 f6                	je     c0101050 <wait_ide_intr+0x10>
c010105a:	c7 05 04 90 14 c0 00 	movl   $0x0,0xc0149004
c0101061:	00 00 00 
c0101064:	5d                   	pop    %ebp
c0101065:	c3                   	ret    
c0101066:	8d 76 00             	lea    0x0(%esi),%esi
c0101069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101070 <init_ide>:
c0101070:	55                   	push   %ebp
c0101071:	89 e5                	mov    %esp,%ebp
c0101073:	83 ec 08             	sub    $0x8,%esp
c0101076:	e8 d5 00 00 00       	call   c0101150 <buf_init>
c010107b:	83 ec 08             	sub    $0x8,%esp
c010107e:	68 80 0f 10 c0       	push   $0xc0100f80
c0101083:	6a 00                	push   $0x0
c0101085:	e8 56 f4 ff ff       	call   c01004e0 <add_irq_handle>
c010108a:	58                   	pop    %eax
c010108b:	5a                   	pop    %edx
c010108c:	68 70 0f 10 c0       	push   $0xc0100f70
c0101091:	6a 0e                	push   $0xe
c0101093:	e8 48 f4 ff ff       	call   c01004e0 <add_irq_handle>
c0101098:	83 c4 10             	add    $0x10,%esp
c010109b:	c9                   	leave  
c010109c:	c3                   	ret    
c010109d:	66 90                	xchg   %ax,%ax
c010109f:	90                   	nop

c01010a0 <buf_fetch>:
c01010a0:	55                   	push   %ebp
c01010a1:	89 c2                	mov    %eax,%edx
c01010a3:	89 e5                	mov    %esp,%ebp
c01010a5:	57                   	push   %edi
c01010a6:	56                   	push   %esi
c01010a7:	53                   	push   %ebx
c01010a8:	89 c3                	mov    %eax,%ebx
c01010aa:	83 e3 7f             	and    $0x7f,%ebx
c01010ad:	89 d8                	mov    %ebx,%eax
c01010af:	83 ec 1c             	sub    $0x1c,%esp
c01010b2:	c1 e0 09             	shl    $0x9,%eax
c01010b5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c01010b8:	8d 81 40 90 14 c0    	lea    -0x3feb6fc0(%ecx),%eax
c01010be:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c01010c2:	74 5c                	je     c0101120 <buf_fetch+0x80>
c01010c4:	89 d7                	mov    %edx,%edi
c01010c6:	89 da                	mov    %ebx,%edx
c01010c8:	c1 e2 09             	shl    $0x9,%edx
c01010cb:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01010ce:	8d 91 40 90 14 c0    	lea    -0x3feb6fc0(%ecx),%edx
c01010d4:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c01010da:	74 54                	je     c0101130 <buf_fetch+0x90>
c01010dc:	8d 72 06             	lea    0x6(%edx),%esi
c01010df:	83 ec 08             	sub    $0x8,%esp
c01010e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01010e5:	57                   	push   %edi
c01010e6:	56                   	push   %esi
c01010e7:	e8 a4 01 00 00       	call   c0101290 <disk_do_read>
c01010ec:	89 da                	mov    %ebx,%edx
c01010ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01010f1:	83 c4 10             	add    $0x10,%esp
c01010f4:	c1 e2 09             	shl    $0x9,%edx
c01010f7:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01010fa:	c6 81 44 90 14 c0 01 	movb   $0x1,-0x3feb6fbc(%ecx)
c0101101:	89 b9 40 90 14 c0    	mov    %edi,-0x3feb6fc0(%ecx)
c0101107:	c6 81 45 90 14 c0 00 	movb   $0x0,-0x3feb6fbb(%ecx)
c010110e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101111:	5b                   	pop    %ebx
c0101112:	5e                   	pop    %esi
c0101113:	5f                   	pop    %edi
c0101114:	5d                   	pop    %ebp
c0101115:	c3                   	ret    
c0101116:	8d 76 00             	lea    0x0(%esi),%esi
c0101119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101120:	39 91 40 90 14 c0    	cmp    %edx,-0x3feb6fc0(%ecx)
c0101126:	75 9c                	jne    c01010c4 <buf_fetch+0x24>
c0101128:	eb e4                	jmp    c010110e <buf_fetch+0x6e>
c010112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101130:	8d 72 06             	lea    0x6(%edx),%esi
c0101133:	83 ec 08             	sub    $0x8,%esp
c0101136:	ff b1 40 90 14 c0    	pushl  -0x3feb6fc0(%ecx)
c010113c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010113f:	56                   	push   %esi
c0101140:	e8 8b 01 00 00       	call   c01012d0 <disk_do_write>
c0101145:	83 c4 10             	add    $0x10,%esp
c0101148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010114b:	eb 92                	jmp    c01010df <buf_fetch+0x3f>
c010114d:	8d 76 00             	lea    0x0(%esi),%esi

c0101150 <buf_init>:
c0101150:	55                   	push   %ebp
c0101151:	b8 44 90 14 c0       	mov    $0xc0149044,%eax
c0101156:	89 e5                	mov    %esp,%ebp
c0101158:	90                   	nop
c0101159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101160:	c6 00 00             	movb   $0x0,(%eax)
c0101163:	05 08 02 00 00       	add    $0x208,%eax
c0101168:	3d 44 94 15 c0       	cmp    $0xc0159444,%eax
c010116d:	75 f1                	jne    c0101160 <buf_init+0x10>
c010116f:	5d                   	pop    %ebp
c0101170:	c3                   	ret    
c0101171:	eb 0d                	jmp    c0101180 <buf_writeback>
c0101173:	90                   	nop
c0101174:	90                   	nop
c0101175:	90                   	nop
c0101176:	90                   	nop
c0101177:	90                   	nop
c0101178:	90                   	nop
c0101179:	90                   	nop
c010117a:	90                   	nop
c010117b:	90                   	nop
c010117c:	90                   	nop
c010117d:	90                   	nop
c010117e:	90                   	nop
c010117f:	90                   	nop

c0101180 <buf_writeback>:
c0101180:	55                   	push   %ebp
c0101181:	89 e5                	mov    %esp,%ebp
c0101183:	53                   	push   %ebx
c0101184:	bb 46 90 14 c0       	mov    $0xc0149046,%ebx
c0101189:	83 ec 04             	sub    $0x4,%esp
c010118c:	eb 10                	jmp    c010119e <buf_writeback+0x1e>
c010118e:	66 90                	xchg   %ax,%ax
c0101190:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101196:	81 fb 46 94 15 c0    	cmp    $0xc0159446,%ebx
c010119c:	74 32                	je     c01011d0 <buf_writeback+0x50>
c010119e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01011a2:	75 ec                	jne    c0101190 <buf_writeback+0x10>
c01011a4:	83 ec 08             	sub    $0x8,%esp
c01011a7:	ff 73 fa             	pushl  -0x6(%ebx)
c01011aa:	53                   	push   %ebx
c01011ab:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01011b1:	e8 1a 01 00 00       	call   c01012d0 <disk_do_write>
c01011b6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c01011bd:	83 c4 10             	add    $0x10,%esp
c01011c0:	81 fb 46 94 15 c0    	cmp    $0xc0159446,%ebx
c01011c6:	75 d6                	jne    c010119e <buf_writeback+0x1e>
c01011c8:	90                   	nop
c01011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01011d3:	c9                   	leave  
c01011d4:	c3                   	ret    
c01011d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01011d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01011e0 <read_byte>:
c01011e0:	55                   	push   %ebp
c01011e1:	89 e5                	mov    %esp,%ebp
c01011e3:	53                   	push   %ebx
c01011e4:	83 ec 04             	sub    $0x4,%esp
c01011e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01011ea:	89 d8                	mov    %ebx,%eax
c01011ec:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c01011f2:	c1 e8 09             	shr    $0x9,%eax
c01011f5:	e8 a6 fe ff ff       	call   c01010a0 <buf_fetch>
c01011fa:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c01011ff:	83 c4 04             	add    $0x4,%esp
c0101202:	5b                   	pop    %ebx
c0101203:	5d                   	pop    %ebp
c0101204:	c3                   	ret    
c0101205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101210 <write_byte>:
c0101210:	55                   	push   %ebp
c0101211:	89 e5                	mov    %esp,%ebp
c0101213:	56                   	push   %esi
c0101214:	53                   	push   %ebx
c0101215:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101218:	8b 75 0c             	mov    0xc(%ebp),%esi
c010121b:	89 d8                	mov    %ebx,%eax
c010121d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101223:	c1 e8 09             	shr    $0x9,%eax
c0101226:	e8 75 fe ff ff       	call   c01010a0 <buf_fetch>
c010122b:	89 f2                	mov    %esi,%edx
c010122d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101231:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101235:	5b                   	pop    %ebx
c0101236:	5e                   	pop    %esi
c0101237:	5d                   	pop    %ebp
c0101238:	c3                   	ret    
c0101239:	66 90                	xchg   %ax,%ax
c010123b:	66 90                	xchg   %ax,%ax
c010123d:	66 90                	xchg   %ax,%ax
c010123f:	90                   	nop

c0101240 <ide_prepare>:
c0101240:	55                   	push   %ebp
c0101241:	89 c1                	mov    %eax,%ecx
c0101243:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101248:	89 e5                	mov    %esp,%ebp
c010124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101250:	ec                   	in     (%dx),%al
c0101251:	83 e0 c0             	and    $0xffffffc0,%eax
c0101254:	3c 40                	cmp    $0x40,%al
c0101256:	75 f8                	jne    c0101250 <ide_prepare+0x10>
c0101258:	ba f1 01 00 00       	mov    $0x1f1,%edx
c010125d:	31 c0                	xor    %eax,%eax
c010125f:	ee                   	out    %al,(%dx)
c0101260:	b8 01 00 00 00       	mov    $0x1,%eax
c0101265:	b2 f2                	mov    $0xf2,%dl
c0101267:	ee                   	out    %al,(%dx)
c0101268:	b2 f3                	mov    $0xf3,%dl
c010126a:	89 c8                	mov    %ecx,%eax
c010126c:	ee                   	out    %al,(%dx)
c010126d:	89 c8                	mov    %ecx,%eax
c010126f:	b2 f4                	mov    $0xf4,%dl
c0101271:	c1 e8 08             	shr    $0x8,%eax
c0101274:	ee                   	out    %al,(%dx)
c0101275:	89 c8                	mov    %ecx,%eax
c0101277:	b2 f5                	mov    $0xf5,%dl
c0101279:	c1 e8 10             	shr    $0x10,%eax
c010127c:	ee                   	out    %al,(%dx)
c010127d:	89 c8                	mov    %ecx,%eax
c010127f:	b2 f6                	mov    $0xf6,%dl
c0101281:	c1 e8 18             	shr    $0x18,%eax
c0101284:	83 c8 e0             	or     $0xffffffe0,%eax
c0101287:	ee                   	out    %al,(%dx)
c0101288:	5d                   	pop    %ebp
c0101289:	c3                   	ret    
c010128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101290 <disk_do_read>:
c0101290:	55                   	push   %ebp
c0101291:	89 e5                	mov    %esp,%ebp
c0101293:	53                   	push   %ebx
c0101294:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101297:	e8 a4 ff ff ff       	call   c0101240 <ide_prepare>
c010129c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012a1:	b8 20 00 00 00       	mov    $0x20,%eax
c01012a6:	ee                   	out    %al,(%dx)
c01012a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01012aa:	b2 f0                	mov    $0xf0,%dl
c01012ac:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01012b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012b8:	ed                   	in     (%dx),%eax
c01012b9:	89 01                	mov    %eax,(%ecx)
c01012bb:	83 c1 04             	add    $0x4,%ecx
c01012be:	39 d9                	cmp    %ebx,%ecx
c01012c0:	75 f6                	jne    c01012b8 <disk_do_read+0x28>
c01012c2:	5b                   	pop    %ebx
c01012c3:	5d                   	pop    %ebp
c01012c4:	c3                   	ret    
c01012c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01012c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01012d0 <disk_do_write>:
c01012d0:	55                   	push   %ebp
c01012d1:	89 e5                	mov    %esp,%ebp
c01012d3:	53                   	push   %ebx
c01012d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012d7:	e8 64 ff ff ff       	call   c0101240 <ide_prepare>
c01012dc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012e1:	b8 30 00 00 00       	mov    $0x30,%eax
c01012e6:	ee                   	out    %al,(%dx)
c01012e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01012ea:	b2 f0                	mov    $0xf0,%dl
c01012ec:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012f8:	8b 01                	mov    (%ecx),%eax
c01012fa:	ef                   	out    %eax,(%dx)
c01012fb:	83 c1 04             	add    $0x4,%ecx
c01012fe:	39 d9                	cmp    %ebx,%ecx
c0101300:	75 f6                	jne    c01012f8 <disk_do_write+0x28>
c0101302:	5b                   	pop    %ebx
c0101303:	5d                   	pop    %ebp
c0101304:	c3                   	ret    
c0101305:	66 90                	xchg   %ax,%ax
c0101307:	66 90                	xchg   %ax,%ax
c0101309:	66 90                	xchg   %ax,%ax
c010130b:	66 90                	xchg   %ax,%ax
c010130d:	66 90                	xchg   %ax,%ax
c010130f:	90                   	nop

c0101310 <dma_prepare>:
c0101310:	55                   	push   %ebp
c0101311:	89 e5                	mov    %esp,%ebp
c0101313:	83 ec 08             	sub    $0x8,%esp
c0101316:	68 34 18 10 c0       	push   $0xc0101834
c010131b:	6a 1d                	push   $0x1d
c010131d:	68 18 18 10 c0       	push   $0xc0101818
c0101322:	68 84 17 10 c0       	push   $0xc0101784
c0101327:	e8 74 fb ff ff       	call   c0100ea0 <printk>
c010132c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101331:	d6                   	(bad)  
c0101332:	83 c4 10             	add    $0x10,%esp
c0101335:	c9                   	leave  
c0101336:	c3                   	ret    
c0101337:	89 f6                	mov    %esi,%esi
c0101339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101340 <dma_issue_read>:
c0101340:	55                   	push   %ebp
c0101341:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101346:	89 e5                	mov    %esp,%ebp
c0101348:	ec                   	in     (%dx),%al
c0101349:	83 c8 09             	or     $0x9,%eax
c010134c:	ee                   	out    %al,(%dx)
c010134d:	5d                   	pop    %ebp
c010134e:	c3                   	ret    
c010134f:	90                   	nop

c0101350 <memcpy>:
c0101350:	55                   	push   %ebp
c0101351:	89 e5                	mov    %esp,%ebp
c0101353:	56                   	push   %esi
c0101354:	57                   	push   %edi
c0101355:	53                   	push   %ebx
c0101356:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101359:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010135c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010135f:	fc                   	cld    
c0101360:	83 f9 08             	cmp    $0x8,%ecx
c0101363:	76 26                	jbe    c010138b <memcpy+0x3b>
c0101365:	89 fa                	mov    %edi,%edx
c0101367:	89 cb                	mov    %ecx,%ebx
c0101369:	83 e2 03             	and    $0x3,%edx
c010136c:	74 10                	je     c010137e <memcpy+0x2e>
c010136e:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101373:	29 d1                	sub    %edx,%ecx
c0101375:	83 e1 03             	and    $0x3,%ecx
c0101378:	29 cb                	sub    %ecx,%ebx
c010137a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010137c:	89 d9                	mov    %ebx,%ecx
c010137e:	c1 e9 02             	shr    $0x2,%ecx
c0101381:	8d 76 00             	lea    0x0(%esi),%esi
c0101384:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101386:	89 d9                	mov    %ebx,%ecx
c0101388:	83 e1 03             	and    $0x3,%ecx
c010138b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010138d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101390:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101393:	5b                   	pop    %ebx
c0101394:	5f                   	pop    %edi
c0101395:	5e                   	pop    %esi
c0101396:	c9                   	leave  
c0101397:	c3                   	ret    

c0101398 <memset>:
c0101398:	55                   	push   %ebp
c0101399:	89 e5                	mov    %esp,%ebp
c010139b:	57                   	push   %edi
c010139c:	8b 7d 08             	mov    0x8(%ebp),%edi
c010139f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01013a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013a6:	fc                   	cld    
c01013a7:	83 f9 10             	cmp    $0x10,%ecx
c01013aa:	76 69                	jbe    c0101415 <memset+0x7d>
c01013ac:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013b2:	74 4c                	je     c0101400 <memset+0x68>
c01013b4:	88 07                	mov    %al,(%edi)
c01013b6:	47                   	inc    %edi
c01013b7:	49                   	dec    %ecx
c01013b8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013be:	74 40                	je     c0101400 <memset+0x68>
c01013c0:	88 07                	mov    %al,(%edi)
c01013c2:	47                   	inc    %edi
c01013c3:	49                   	dec    %ecx
c01013c4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013ca:	74 34                	je     c0101400 <memset+0x68>
c01013cc:	88 07                	mov    %al,(%edi)
c01013ce:	47                   	inc    %edi
c01013cf:	49                   	dec    %ecx
c01013d0:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013d6:	74 28                	je     c0101400 <memset+0x68>
c01013d8:	88 07                	mov    %al,(%edi)
c01013da:	47                   	inc    %edi
c01013db:	49                   	dec    %ecx
c01013dc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013e2:	74 1c                	je     c0101400 <memset+0x68>
c01013e4:	88 07                	mov    %al,(%edi)
c01013e6:	47                   	inc    %edi
c01013e7:	49                   	dec    %ecx
c01013e8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013ee:	74 10                	je     c0101400 <memset+0x68>
c01013f0:	88 07                	mov    %al,(%edi)
c01013f2:	47                   	inc    %edi
c01013f3:	49                   	dec    %ecx
c01013f4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013fa:	74 04                	je     c0101400 <memset+0x68>
c01013fc:	88 07                	mov    %al,(%edi)
c01013fe:	47                   	inc    %edi
c01013ff:	49                   	dec    %ecx
c0101400:	88 c4                	mov    %al,%ah
c0101402:	89 c2                	mov    %eax,%edx
c0101404:	c1 e2 10             	shl    $0x10,%edx
c0101407:	09 d0                	or     %edx,%eax
c0101409:	89 ca                	mov    %ecx,%edx
c010140b:	c1 e9 02             	shr    $0x2,%ecx
c010140e:	83 e2 03             	and    $0x3,%edx
c0101411:	f3 ab                	rep stos %eax,%es:(%edi)
c0101413:	89 d1                	mov    %edx,%ecx
c0101415:	f3 aa                	rep stos %al,%es:(%edi)
c0101417:	8b 45 08             	mov    0x8(%ebp),%eax
c010141a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010141d:	5f                   	pop    %edi
c010141e:	c9                   	leave  
c010141f:	c3                   	ret    
