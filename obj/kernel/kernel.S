
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
c0100066:	e8 f5 0a 00 00       	call   c0100b60 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 fe 0a 00 00       	call   c0100b70 <get_ucr3>
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
c010014c:	e8 37 12 00 00       	call   c0101388 <memset>
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
c0100178:	c7 44 24 10 34 14 10 	movl   $0xc0101434,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 98 14 10 	movl   $0xc0101498,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 23 14 10 	movl   $0xc0101423,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 44 14 10 c0 	movl   $0xc0101444,(%esp)
c010019f:	e8 ec 0c 00 00       	call   c0100e90 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 3c 14 10 	movl   $0xc010143c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 98 14 10 	movl   $0xc0101498,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 23 14 10 	movl   $0xc0101423,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 44 14 10 c0 	movl   $0xc0101444,(%esp)
c01001ee:	e8 9d 0c 00 00       	call   c0100e90 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 34 14 10 	movl   $0xc0101434,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 98 14 10 	movl   $0xc0101498,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 23 14 10 	movl   $0xc0101423,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 44 14 10 c0 	movl   $0xc0101444,(%esp)
c010022e:	e8 5d 0c 00 00       	call   c0100e90 <printk>
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
c0100258:	c7 44 24 10 3c 14 10 	movl   $0xc010143c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 98 14 10 	movl   $0xc0101498,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 23 14 10 	movl   $0xc0101423,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 44 14 10 c0 	movl   $0xc0101444,(%esp)
c010027f:	e8 0c 0c 00 00       	call   c0100e90 <printk>
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
c01002a8:	c7 44 24 10 10 14 10 	movl   $0xc0101410,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 8e 14 10 	movl   $0xc010148e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 23 14 10 	movl   $0xc0101423,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 44 14 10 c0 	movl   $0xc0101444,(%esp)
c01002cf:	e8 bc 0b 00 00       	call   c0100e90 <printk>
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
c010039a:	e8 e1 01 00 00       	call   c0100580 <irq_handle>
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
c01003b6:	e8 f5 07 00 00       	call   c0100bb0 <init_mm>
c01003bb:	68 2f 15 10 c0       	push   $0xc010152f
c01003c0:	6a 4a                	push   $0x4a
c01003c2:	68 9e 14 10 c0       	push   $0xc010149e
c01003c7:	68 b0 14 10 c0       	push   $0xc01014b0
c01003cc:	e8 bf 0a 00 00       	call   c0100e90 <printk>
c01003d1:	e8 7a 09 00 00       	call   c0100d50 <loader>
c01003d6:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003db:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003e0:	83 ec 10             	sub    $0x10,%esp
c01003e3:	ff d0                	call   *%eax
c01003e5:	68 2f 15 10 c0       	push   $0xc010152f
c01003ea:	6a 6b                	push   $0x6b
c01003ec:	68 9e 14 10 c0       	push   $0xc010149e
c01003f1:	68 e4 14 10 c0       	push   $0xc01014e4
c01003f6:	e8 95 0a 00 00       	call   c0100e90 <printk>
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
c0100416:	e8 05 08 00 00       	call   c0100c20 <init_page>
c010041b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100421:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100426:	ff e0                	jmp    *%eax
c0100428:	68 39 15 10 c0       	push   $0xc0101539
c010042d:	6a 24                	push   $0x24
c010042f:	68 9e 14 10 c0       	push   $0xc010149e
c0100434:	68 e4 14 10 c0       	push   $0xc01014e4
c0100439:	e8 52 0a 00 00       	call   c0100e90 <printk>
c010043e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100443:	d6                   	(bad)  
c0100444:	83 c4 10             	add    $0x10,%esp
c0100447:	c9                   	leave  
c0100448:	c3                   	ret    
c0100449:	66 90                	xchg   %ax,%ax
c010044b:	66 90                	xchg   %ax,%ax
c010044d:	66 90                	xchg   %ax,%ax
c010044f:	90                   	nop

c0100450 <do_syscall>:
c0100450:	55                   	push   %ebp
c0100451:	89 e5                	mov    %esp,%ebp
c0100453:	53                   	push   %ebx
c0100454:	83 ec 04             	sub    $0x4,%esp
c0100457:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010045a:	8b 43 08             	mov    0x8(%ebx),%eax
c010045d:	85 c0                	test   %eax,%eax
c010045f:	74 4f                	je     c01004b0 <do_syscall+0x60>
c0100461:	83 f8 2d             	cmp    $0x2d,%eax
c0100464:	74 2a                	je     c0100490 <do_syscall+0x40>
c0100466:	83 ec 0c             	sub    $0xc,%esp
c0100469:	50                   	push   %eax
c010046a:	68 b4 15 10 c0       	push   $0xc01015b4
c010046f:	6a 20                	push   $0x20
c0100471:	68 40 15 10 c0       	push   $0xc0101540
c0100476:	68 60 15 10 c0       	push   $0xc0101560
c010047b:	e8 10 0a 00 00       	call   c0100e90 <printk>
c0100480:	b8 01 00 00 00       	mov    $0x1,%eax
c0100485:	d6                   	(bad)  
c0100486:	83 c4 20             	add    $0x20,%esp
c0100489:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010048c:	c9                   	leave  
c010048d:	c3                   	ret    
c010048e:	66 90                	xchg   %ax,%ax
c0100490:	83 ec 0c             	sub    $0xc,%esp
c0100493:	ff 73 04             	pushl  0x4(%ebx)
c0100496:	e8 e5 06 00 00       	call   c0100b80 <mm_brk>
c010049b:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c01004a2:	83 c4 10             	add    $0x10,%esp
c01004a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004a8:	c9                   	leave  
c01004a9:	c3                   	ret    
c01004aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004b0:	fa                   	cli    
c01004b1:	83 ec 08             	sub    $0x8,%esp
c01004b4:	ff 73 1c             	pushl  0x1c(%ebx)
c01004b7:	ff 73 04             	pushl  0x4(%ebx)
c01004ba:	e8 11 00 00 00       	call   c01004d0 <add_irq_handle>
c01004bf:	fb                   	sti    
c01004c0:	83 c4 10             	add    $0x10,%esp
c01004c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004c6:	c9                   	leave  
c01004c7:	c3                   	ret    
c01004c8:	66 90                	xchg   %ax,%ax
c01004ca:	66 90                	xchg   %ax,%ax
c01004cc:	66 90                	xchg   %ax,%ax
c01004ce:	66 90                	xchg   %ax,%ax

c01004d0 <add_irq_handle>:
c01004d0:	55                   	push   %ebp
c01004d1:	89 e5                	mov    %esp,%ebp
c01004d3:	53                   	push   %ebx
c01004d4:	83 ec 04             	sub    $0x4,%esp
c01004d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01004da:	83 fb 0f             	cmp    $0xf,%ebx
c01004dd:	7f 71                	jg     c0100550 <add_irq_handle+0x80>
c01004df:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c01004e4:	83 f8 20             	cmp    $0x20,%eax
c01004e7:	7e 2c                	jle    c0100515 <add_irq_handle+0x45>
c01004e9:	83 ec 0c             	sub    $0xc,%esp
c01004ec:	68 ee 15 10 c0       	push   $0xc01015ee
c01004f1:	68 3d 17 10 c0       	push   $0xc010173d
c01004f6:	6a 16                	push   $0x16
c01004f8:	68 d2 15 10 c0       	push   $0xc01015d2
c01004fd:	68 44 14 10 c0       	push   $0xc0101444
c0100502:	e8 89 09 00 00       	call   c0100e90 <printk>
c0100507:	b8 01 00 00 00       	mov    $0x1,%eax
c010050c:	d6                   	(bad)  
c010050d:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100512:	83 c4 20             	add    $0x20,%esp
c0100515:	8d 50 01             	lea    0x1(%eax),%edx
c0100518:	89 15 00 40 12 c0    	mov    %edx,0xc0124000
c010051e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100521:	89 14 c5 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,8)
c0100528:	8b 14 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%edx
c010052f:	89 14 c5 84 40 12 c0 	mov    %edx,-0x3fedbf7c(,%eax,8)
c0100536:	8d 04 c5 80 40 12 c0 	lea    -0x3fedbf80(,%eax,8),%eax
c010053d:	89 04 9d 40 40 12 c0 	mov    %eax,-0x3fedbfc0(,%ebx,4)
c0100544:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100547:	c9                   	leave  
c0100548:	c3                   	ret    
c0100549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100550:	83 ec 0c             	sub    $0xc,%esp
c0100553:	68 bf 15 10 c0       	push   $0xc01015bf
c0100558:	68 3d 17 10 c0       	push   $0xc010173d
c010055d:	6a 15                	push   $0x15
c010055f:	68 d2 15 10 c0       	push   $0xc01015d2
c0100564:	68 44 14 10 c0       	push   $0xc0101444
c0100569:	e8 22 09 00 00       	call   c0100e90 <printk>
c010056e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100573:	d6                   	(bad)  
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	e9 63 ff ff ff       	jmp    c01004df <add_irq_handle+0xf>
c010057c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100580 <irq_handle>:
c0100580:	55                   	push   %ebp
c0100581:	89 e5                	mov    %esp,%ebp
c0100583:	53                   	push   %ebx
c0100584:	83 ec 04             	sub    $0x4,%esp
c0100587:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010058a:	68 32 17 10 c0       	push   $0xc0101732
c010058f:	6a 24                	push   $0x24
c0100591:	68 d2 15 10 c0       	push   $0xc01015d2
c0100596:	68 24 16 10 c0       	push   $0xc0101624
c010059b:	e8 f0 08 00 00       	call   c0100e90 <printk>
c01005a0:	b8 01 00 00 00       	mov    $0x1,%eax
c01005a5:	d6                   	(bad)  
c01005a6:	8b 43 30             	mov    0x30(%ebx),%eax
c01005a9:	83 c4 10             	add    $0x10,%esp
c01005ac:	85 c0                	test   %eax,%eax
c01005ae:	0f 88 9c 00 00 00    	js     c0100650 <irq_handle+0xd0>
c01005b4:	3d 80 00 00 00       	cmp    $0x80,%eax
c01005b9:	0f 84 b9 00 00 00    	je     c0100678 <irq_handle+0xf8>
c01005bf:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01005c4:	7e 5a                	jle    c0100620 <irq_handle+0xa0>
c01005c6:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c01005cc:	83 fb 0f             	cmp    $0xf,%ebx
c01005cf:	7f 1f                	jg     c01005f0 <irq_handle+0x70>
c01005d1:	8b 1c 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%ebx
c01005d8:	85 db                	test   %ebx,%ebx
c01005da:	74 0d                	je     c01005e9 <irq_handle+0x69>
c01005dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005e0:	ff 13                	call   *(%ebx)
c01005e2:	8b 5b 04             	mov    0x4(%ebx),%ebx
c01005e5:	85 db                	test   %ebx,%ebx
c01005e7:	75 f7                	jne    c01005e0 <irq_handle+0x60>
c01005e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005ec:	c9                   	leave  
c01005ed:	c3                   	ret    
c01005ee:	66 90                	xchg   %ax,%ax
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 0c 16 10 c0       	push   $0xc010160c
c01005f8:	68 32 17 10 c0       	push   $0xc0101732
c01005fd:	6a 30                	push   $0x30
c01005ff:	68 d2 15 10 c0       	push   $0xc01015d2
c0100604:	68 44 14 10 c0       	push   $0xc0101444
c0100609:	e8 82 08 00 00       	call   c0100e90 <printk>
c010060e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100613:	d6                   	(bad)  
c0100614:	83 c4 20             	add    $0x20,%esp
c0100617:	eb b8                	jmp    c01005d1 <irq_handle+0x51>
c0100619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100620:	83 ec 08             	sub    $0x8,%esp
c0100623:	ff 73 0c             	pushl  0xc(%ebx)
c0100626:	50                   	push   %eax
c0100627:	68 32 17 10 c0       	push   $0xc0101732
c010062c:	6a 2d                	push   $0x2d
c010062e:	68 d2 15 10 c0       	push   $0xc01015d2
c0100633:	68 d8 16 10 c0       	push   $0xc01016d8
c0100638:	e8 53 08 00 00       	call   c0100e90 <printk>
c010063d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100642:	d6                   	(bad)  
c0100643:	83 c4 20             	add    $0x20,%esp
c0100646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100649:	c9                   	leave  
c010064a:	c3                   	ret    
c010064b:	90                   	nop
c010064c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100650:	68 32 17 10 c0       	push   $0xc0101732
c0100655:	6a 29                	push   $0x29
c0100657:	68 d2 15 10 c0       	push   $0xc01015d2
c010065c:	68 8c 16 10 c0       	push   $0xc010168c
c0100661:	e8 2a 08 00 00       	call   c0100e90 <printk>
c0100666:	b8 01 00 00 00       	mov    $0x1,%eax
c010066b:	d6                   	(bad)  
c010066c:	83 c4 10             	add    $0x10,%esp
c010066f:	e9 75 ff ff ff       	jmp    c01005e9 <irq_handle+0x69>
c0100674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100678:	89 5d 08             	mov    %ebx,0x8(%ebp)
c010067b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010067e:	c9                   	leave  
c010067f:	e9 cc fd ff ff       	jmp    c0100450 <do_syscall>
c0100684:	66 90                	xchg   %ax,%ax
c0100686:	66 90                	xchg   %ax,%ax
c0100688:	66 90                	xchg   %ax,%ax
c010068a:	66 90                	xchg   %ax,%ax
c010068c:	66 90                	xchg   %ax,%ax
c010068e:	66 90                	xchg   %ax,%ax

c0100690 <init_i8259>:
c0100690:	55                   	push   %ebp
c0100691:	ba 21 00 00 00       	mov    $0x21,%edx
c0100696:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010069b:	89 e5                	mov    %esp,%ebp
c010069d:	ee                   	out    %al,(%dx)
c010069e:	b2 a1                	mov    $0xa1,%dl
c01006a0:	ee                   	out    %al,(%dx)
c01006a1:	b8 11 00 00 00       	mov    $0x11,%eax
c01006a6:	b2 20                	mov    $0x20,%dl
c01006a8:	ee                   	out    %al,(%dx)
c01006a9:	b8 20 00 00 00       	mov    $0x20,%eax
c01006ae:	b2 21                	mov    $0x21,%dl
c01006b0:	ee                   	out    %al,(%dx)
c01006b1:	b8 04 00 00 00       	mov    $0x4,%eax
c01006b6:	ee                   	out    %al,(%dx)
c01006b7:	b8 03 00 00 00       	mov    $0x3,%eax
c01006bc:	ee                   	out    %al,(%dx)
c01006bd:	b8 11 00 00 00       	mov    $0x11,%eax
c01006c2:	b2 a0                	mov    $0xa0,%dl
c01006c4:	ee                   	out    %al,(%dx)
c01006c5:	b8 28 00 00 00       	mov    $0x28,%eax
c01006ca:	b2 a1                	mov    $0xa1,%dl
c01006cc:	ee                   	out    %al,(%dx)
c01006cd:	b8 02 00 00 00       	mov    $0x2,%eax
c01006d2:	ee                   	out    %al,(%dx)
c01006d3:	b8 03 00 00 00       	mov    $0x3,%eax
c01006d8:	ee                   	out    %al,(%dx)
c01006d9:	b8 68 00 00 00       	mov    $0x68,%eax
c01006de:	b2 20                	mov    $0x20,%dl
c01006e0:	ee                   	out    %al,(%dx)
c01006e1:	b8 0a 00 00 00       	mov    $0xa,%eax
c01006e6:	ee                   	out    %al,(%dx)
c01006e7:	b8 68 00 00 00       	mov    $0x68,%eax
c01006ec:	b2 a0                	mov    $0xa0,%dl
c01006ee:	ee                   	out    %al,(%dx)
c01006ef:	b8 0a 00 00 00       	mov    $0xa,%eax
c01006f4:	ee                   	out    %al,(%dx)
c01006f5:	5d                   	pop    %ebp
c01006f6:	c3                   	ret    
c01006f7:	66 90                	xchg   %ax,%ax
c01006f9:	66 90                	xchg   %ax,%ax
c01006fb:	66 90                	xchg   %ax,%ax
c01006fd:	66 90                	xchg   %ax,%ax
c01006ff:	90                   	nop

c0100700 <init_idt>:
c0100700:	55                   	push   %ebp
c0100701:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100706:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c010070b:	89 d1                	mov    %edx,%ecx
c010070d:	c1 ea 10             	shr    $0x10,%edx
c0100710:	89 e5                	mov    %esp,%ebp
c0100712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100718:	66 89 08             	mov    %cx,(%eax)
c010071b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100721:	83 c0 08             	add    $0x8,%eax
c0100724:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100728:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010072c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100730:	3d c0 49 12 c0       	cmp    $0xc01249c0,%eax
c0100735:	75 e1                	jne    c0100718 <init_idt+0x18>
c0100737:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010073c:	ba 08 00 00 00       	mov    $0x8,%edx
c0100741:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100746:	66 a3 c0 41 12 c0    	mov    %ax,0xc01241c0
c010074c:	c1 e8 10             	shr    $0x10,%eax
c010074f:	66 89 15 c2 41 12 c0 	mov    %dx,0xc01241c2
c0100756:	66 a3 c6 41 12 c0    	mov    %ax,0xc01241c6
c010075c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100761:	ba 08 00 00 00       	mov    $0x8,%edx
c0100766:	66 a3 c8 41 12 c0    	mov    %ax,0xc01241c8
c010076c:	c1 e8 10             	shr    $0x10,%eax
c010076f:	66 89 0d ca 41 12 c0 	mov    %cx,0xc01241ca
c0100776:	66 a3 ce 41 12 c0    	mov    %ax,0xc01241ce
c010077c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100781:	66 89 15 d2 41 12 c0 	mov    %dx,0xc01241d2
c0100788:	66 a3 d0 41 12 c0    	mov    %ax,0xc01241d0
c010078e:	c1 e8 10             	shr    $0x10,%eax
c0100791:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100796:	66 a3 d6 41 12 c0    	mov    %ax,0xc01241d6
c010079c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c01007a1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007a6:	66 a3 d8 41 12 c0    	mov    %ax,0xc01241d8
c01007ac:	c1 e8 10             	shr    $0x10,%eax
c01007af:	66 89 0d da 41 12 c0 	mov    %cx,0xc01241da
c01007b6:	66 a3 de 41 12 c0    	mov    %ax,0xc01241de
c01007bc:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c01007c1:	66 89 15 e2 41 12 c0 	mov    %dx,0xc01241e2
c01007c8:	66 a3 e0 41 12 c0    	mov    %ax,0xc01241e0
c01007ce:	c1 e8 10             	shr    $0x10,%eax
c01007d1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007d6:	66 a3 e6 41 12 c0    	mov    %ax,0xc01241e6
c01007dc:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c01007e1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007e6:	66 a3 e8 41 12 c0    	mov    %ax,0xc01241e8
c01007ec:	c1 e8 10             	shr    $0x10,%eax
c01007ef:	66 89 0d ea 41 12 c0 	mov    %cx,0xc01241ea
c01007f6:	66 a3 ee 41 12 c0    	mov    %ax,0xc01241ee
c01007fc:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100801:	66 89 15 f2 41 12 c0 	mov    %dx,0xc01241f2
c0100808:	66 a3 f0 41 12 c0    	mov    %ax,0xc01241f0
c010080e:	c1 e8 10             	shr    $0x10,%eax
c0100811:	c6 05 c4 41 12 c0 00 	movb   $0x0,0xc01241c4
c0100818:	c6 05 c5 41 12 c0 8f 	movb   $0x8f,0xc01241c5
c010081f:	c6 05 cc 41 12 c0 00 	movb   $0x0,0xc01241cc
c0100826:	b9 08 00 00 00       	mov    $0x8,%ecx
c010082b:	c6 05 cd 41 12 c0 8f 	movb   $0x8f,0xc01241cd
c0100832:	c6 05 d4 41 12 c0 00 	movb   $0x0,0xc01241d4
c0100839:	ba 08 00 00 00       	mov    $0x8,%edx
c010083e:	c6 05 d5 41 12 c0 8f 	movb   $0x8f,0xc01241d5
c0100845:	c6 05 dc 41 12 c0 00 	movb   $0x0,0xc01241dc
c010084c:	c6 05 dd 41 12 c0 8f 	movb   $0x8f,0xc01241dd
c0100853:	c6 05 e4 41 12 c0 00 	movb   $0x0,0xc01241e4
c010085a:	c6 05 e5 41 12 c0 8f 	movb   $0x8f,0xc01241e5
c0100861:	c6 05 ec 41 12 c0 00 	movb   $0x0,0xc01241ec
c0100868:	c6 05 ed 41 12 c0 8f 	movb   $0x8f,0xc01241ed
c010086f:	c6 05 f4 41 12 c0 00 	movb   $0x0,0xc01241f4
c0100876:	c6 05 f5 41 12 c0 8f 	movb   $0x8f,0xc01241f5
c010087d:	66 a3 f6 41 12 c0    	mov    %ax,0xc01241f6
c0100883:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0100888:	66 a3 f8 41 12 c0    	mov    %ax,0xc01241f8
c010088e:	c1 e8 10             	shr    $0x10,%eax
c0100891:	66 89 0d fa 41 12 c0 	mov    %cx,0xc01241fa
c0100898:	66 a3 fe 41 12 c0    	mov    %ax,0xc01241fe
c010089e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c01008a3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008a8:	66 a3 00 42 12 c0    	mov    %ax,0xc0124200
c01008ae:	c1 e8 10             	shr    $0x10,%eax
c01008b1:	66 89 15 02 42 12 c0 	mov    %dx,0xc0124202
c01008b8:	66 a3 06 42 12 c0    	mov    %ax,0xc0124206
c01008be:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c01008c3:	66 89 0d 0a 42 12 c0 	mov    %cx,0xc012420a
c01008ca:	66 a3 08 42 12 c0    	mov    %ax,0xc0124208
c01008d0:	c1 e8 10             	shr    $0x10,%eax
c01008d3:	ba 08 00 00 00       	mov    $0x8,%edx
c01008d8:	66 a3 0e 42 12 c0    	mov    %ax,0xc012420e
c01008de:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c01008e3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008e8:	66 a3 10 42 12 c0    	mov    %ax,0xc0124210
c01008ee:	c1 e8 10             	shr    $0x10,%eax
c01008f1:	66 89 15 12 42 12 c0 	mov    %dx,0xc0124212
c01008f8:	66 a3 16 42 12 c0    	mov    %ax,0xc0124216
c01008fe:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100903:	66 89 0d 1a 42 12 c0 	mov    %cx,0xc012421a
c010090a:	66 a3 18 42 12 c0    	mov    %ax,0xc0124218
c0100910:	c1 e8 10             	shr    $0x10,%eax
c0100913:	ba 08 00 00 00       	mov    $0x8,%edx
c0100918:	66 a3 1e 42 12 c0    	mov    %ax,0xc012421e
c010091e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100923:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100928:	66 a3 20 42 12 c0    	mov    %ax,0xc0124220
c010092e:	c1 e8 10             	shr    $0x10,%eax
c0100931:	66 89 15 22 42 12 c0 	mov    %dx,0xc0124222
c0100938:	66 a3 26 42 12 c0    	mov    %ax,0xc0124226
c010093e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100943:	66 89 0d 2a 42 12 c0 	mov    %cx,0xc012422a
c010094a:	66 a3 28 42 12 c0    	mov    %ax,0xc0124228
c0100950:	c1 e8 10             	shr    $0x10,%eax
c0100953:	c6 05 fc 41 12 c0 00 	movb   $0x0,0xc01241fc
c010095a:	c6 05 fd 41 12 c0 8f 	movb   $0x8f,0xc01241fd
c0100961:	c6 05 04 42 12 c0 00 	movb   $0x0,0xc0124204
c0100968:	ba 08 00 00 00       	mov    $0x8,%edx
c010096d:	c6 05 05 42 12 c0 8f 	movb   $0x8f,0xc0124205
c0100974:	c6 05 0c 42 12 c0 00 	movb   $0x0,0xc012420c
c010097b:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100980:	c6 05 0d 42 12 c0 8f 	movb   $0x8f,0xc012420d
c0100987:	c6 05 14 42 12 c0 00 	movb   $0x0,0xc0124214
c010098e:	c6 05 15 42 12 c0 8f 	movb   $0x8f,0xc0124215
c0100995:	c6 05 1c 42 12 c0 00 	movb   $0x0,0xc012421c
c010099c:	c6 05 1d 42 12 c0 8f 	movb   $0x8f,0xc012421d
c01009a3:	c6 05 24 42 12 c0 00 	movb   $0x0,0xc0124224
c01009aa:	c6 05 25 42 12 c0 8f 	movb   $0x8f,0xc0124225
c01009b1:	c6 05 2c 42 12 c0 00 	movb   $0x0,0xc012422c
c01009b8:	66 a3 2e 42 12 c0    	mov    %ax,0xc012422e
c01009be:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c01009c3:	66 89 15 32 42 12 c0 	mov    %dx,0xc0124232
c01009ca:	66 a3 30 42 12 c0    	mov    %ax,0xc0124230
c01009d0:	c1 e8 10             	shr    $0x10,%eax
c01009d3:	66 89 0d c2 45 12 c0 	mov    %cx,0xc01245c2
c01009da:	66 a3 36 42 12 c0    	mov    %ax,0xc0124236
c01009e0:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c01009e5:	ba 08 00 00 00       	mov    $0x8,%edx
c01009ea:	66 a3 c0 45 12 c0    	mov    %ax,0xc01245c0
c01009f0:	c1 e8 10             	shr    $0x10,%eax
c01009f3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009f8:	66 a3 c6 45 12 c0    	mov    %ax,0xc01245c6
c01009fe:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a03:	c6 05 2d 42 12 c0 8f 	movb   $0x8f,0xc012422d
c0100a0a:	66 a3 c0 42 12 c0    	mov    %ax,0xc01242c0
c0100a10:	c1 e8 10             	shr    $0x10,%eax
c0100a13:	c6 05 34 42 12 c0 00 	movb   $0x0,0xc0124234
c0100a1a:	66 a3 c6 42 12 c0    	mov    %ax,0xc01242c6
c0100a20:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a25:	c6 05 35 42 12 c0 8f 	movb   $0x8f,0xc0124235
c0100a2c:	66 a3 30 43 12 c0    	mov    %ax,0xc0124330
c0100a32:	c1 e8 10             	shr    $0x10,%eax
c0100a35:	c6 05 c4 45 12 c0 00 	movb   $0x0,0xc01245c4
c0100a3c:	66 a3 36 43 12 c0    	mov    %ax,0xc0124336
c0100a42:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100a47:	c6 05 c5 45 12 c0 ef 	movb   $0xef,0xc01245c5
c0100a4e:	66 a3 80 41 12 c0    	mov    %ax,0xc0124180
c0100a54:	b8 c0 41 12 c0       	mov    $0xc01241c0,%eax
c0100a59:	66 89 15 c2 42 12 c0 	mov    %dx,0xc01242c2
c0100a60:	66 a3 82 41 12 c0    	mov    %ax,0xc0124182
c0100a66:	c1 e8 10             	shr    $0x10,%eax
c0100a69:	c6 05 c4 42 12 c0 00 	movb   $0x0,0xc01242c4
c0100a70:	66 a3 84 41 12 c0    	mov    %ax,0xc0124184
c0100a76:	c6 05 c5 42 12 c0 8e 	movb   $0x8e,0xc01242c5
c0100a7d:	b8 80 41 12 c0       	mov    $0xc0124180,%eax
c0100a82:	66 89 0d 32 43 12 c0 	mov    %cx,0xc0124332
c0100a89:	c6 05 34 43 12 c0 00 	movb   $0x0,0xc0124334
c0100a90:	c6 05 35 43 12 c0 8e 	movb   $0x8e,0xc0124335
c0100a97:	0f 01 18             	lidtl  (%eax)
c0100a9a:	5d                   	pop    %ebp
c0100a9b:	c3                   	ret    
c0100a9c:	66 90                	xchg   %ax,%ax
c0100a9e:	66 90                	xchg   %ax,%ax

c0100aa0 <create_video_mapping>:
c0100aa0:	55                   	push   %ebp
c0100aa1:	89 e5                	mov    %esp,%ebp
c0100aa3:	83 ec 08             	sub    $0x8,%esp
c0100aa6:	68 d8 17 10 c0       	push   $0xc01017d8
c0100aab:	6a 11                	push   $0x11
c0100aad:	68 4c 17 10 c0       	push   $0xc010174c
c0100ab2:	68 74 17 10 c0       	push   $0xc0101774
c0100ab7:	e8 d4 03 00 00       	call   c0100e90 <printk>
c0100abc:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ac1:	d6                   	(bad)  
c0100ac2:	83 c4 10             	add    $0x10,%esp
c0100ac5:	c9                   	leave  
c0100ac6:	c3                   	ret    
c0100ac7:	89 f6                	mov    %esi,%esi
c0100ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100ad0 <video_mapping_write_test>:
c0100ad0:	55                   	push   %ebp
c0100ad1:	31 c0                	xor    %eax,%eax
c0100ad3:	89 e5                	mov    %esp,%ebp
c0100ad5:	8d 76 00             	lea    0x0(%esi),%esi
c0100ad8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100adf:	83 c0 01             	add    $0x1,%eax
c0100ae2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100ae7:	75 ef                	jne    c0100ad8 <video_mapping_write_test+0x8>
c0100ae9:	5d                   	pop    %ebp
c0100aea:	c3                   	ret    
c0100aeb:	90                   	nop
c0100aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100af0 <video_mapping_read_test>:
c0100af0:	55                   	push   %ebp
c0100af1:	89 e5                	mov    %esp,%ebp
c0100af3:	56                   	push   %esi
c0100af4:	be 01 00 00 00       	mov    $0x1,%esi
c0100af9:	53                   	push   %ebx
c0100afa:	31 db                	xor    %ebx,%ebx
c0100afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b00:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100b07:	74 24                	je     c0100b2d <video_mapping_read_test+0x3d>
c0100b09:	83 ec 0c             	sub    $0xc,%esp
c0100b0c:	68 65 17 10 c0       	push   $0xc0101765
c0100b11:	68 c0 17 10 c0       	push   $0xc01017c0
c0100b16:	6a 20                	push   $0x20
c0100b18:	68 4c 17 10 c0       	push   $0xc010174c
c0100b1d:	68 44 14 10 c0       	push   $0xc0101444
c0100b22:	e8 69 03 00 00       	call   c0100e90 <printk>
c0100b27:	89 f0                	mov    %esi,%eax
c0100b29:	d6                   	(bad)  
c0100b2a:	83 c4 20             	add    $0x20,%esp
c0100b2d:	83 c3 01             	add    $0x1,%ebx
c0100b30:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100b36:	75 c8                	jne    c0100b00 <video_mapping_read_test+0x10>
c0100b38:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100b3b:	5b                   	pop    %ebx
c0100b3c:	5e                   	pop    %esi
c0100b3d:	5d                   	pop    %ebp
c0100b3e:	c3                   	ret    
c0100b3f:	90                   	nop

c0100b40 <video_mapping_clear>:
c0100b40:	55                   	push   %ebp
c0100b41:	89 e5                	mov    %esp,%ebp
c0100b43:	83 ec 0c             	sub    $0xc,%esp
c0100b46:	68 00 fa 00 00       	push   $0xfa00
c0100b4b:	6a 00                	push   $0x0
c0100b4d:	68 00 00 0a 00       	push   $0xa0000
c0100b52:	e8 31 08 00 00       	call   c0101388 <memset>
c0100b57:	83 c4 10             	add    $0x10,%esp
c0100b5a:	c9                   	leave  
c0100b5b:	c3                   	ret    
c0100b5c:	66 90                	xchg   %ax,%ax
c0100b5e:	66 90                	xchg   %ax,%ax

c0100b60 <get_updir>:
c0100b60:	55                   	push   %ebp
c0100b61:	b8 00 60 12 c0       	mov    $0xc0126000,%eax
c0100b66:	89 e5                	mov    %esp,%ebp
c0100b68:	5d                   	pop    %ebp
c0100b69:	c3                   	ret    
c0100b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100b70 <get_ucr3>:
c0100b70:	55                   	push   %ebp
c0100b71:	a1 04 50 12 c0       	mov    0xc0125004,%eax
c0100b76:	89 e5                	mov    %esp,%ebp
c0100b78:	5d                   	pop    %ebp
c0100b79:	c3                   	ret    
c0100b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100b80 <mm_brk>:
c0100b80:	55                   	push   %ebp
c0100b81:	89 e5                	mov    %esp,%ebp
c0100b83:	53                   	push   %ebx
c0100b84:	83 ec 04             	sub    $0x4,%esp
c0100b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100b8a:	a1 00 50 12 c0       	mov    0xc0125000,%eax
c0100b8f:	39 d8                	cmp    %ebx,%eax
c0100b91:	73 11                	jae    c0100ba4 <mm_brk+0x24>
c0100b93:	89 da                	mov    %ebx,%edx
c0100b95:	83 ec 08             	sub    $0x8,%esp
c0100b98:	29 c2                	sub    %eax,%edx
c0100b9a:	52                   	push   %edx
c0100b9b:	50                   	push   %eax
c0100b9c:	e8 af f4 ff ff       	call   c0100050 <mm_malloc>
c0100ba1:	83 c4 10             	add    $0x10,%esp
c0100ba4:	89 1d 00 50 12 c0    	mov    %ebx,0xc0125000
c0100baa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bad:	c9                   	leave  
c0100bae:	c3                   	ret    
c0100baf:	90                   	nop

c0100bb0 <init_mm>:
c0100bb0:	55                   	push   %ebp
c0100bb1:	89 e5                	mov    %esp,%ebp
c0100bb3:	53                   	push   %ebx
c0100bb4:	83 ec 04             	sub    $0x4,%esp
c0100bb7:	e8 54 00 00 00       	call   c0100c10 <get_kpdir>
c0100bbc:	83 ec 04             	sub    $0x4,%esp
c0100bbf:	89 c3                	mov    %eax,%ebx
c0100bc1:	68 00 10 00 00       	push   $0x1000
c0100bc6:	6a 00                	push   $0x0
c0100bc8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100bce:	68 00 60 12 c0       	push   $0xc0126000
c0100bd3:	e8 b0 07 00 00       	call   c0101388 <memset>
c0100bd8:	83 c4 0c             	add    $0xc,%esp
c0100bdb:	68 80 00 00 00       	push   $0x80
c0100be0:	53                   	push   %ebx
c0100be1:	68 00 6c 12 c0       	push   $0xc0126c00
c0100be6:	e8 55 07 00 00       	call   c0101340 <memcpy>
c0100beb:	b8 00 60 12 00       	mov    $0x126000,%eax
c0100bf0:	83 c4 10             	add    $0x10,%esp
c0100bf3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bf6:	25 00 fc ff ff       	and    $0xfffffc00,%eax
c0100bfb:	a3 04 50 12 c0       	mov    %eax,0xc0125004
c0100c00:	c9                   	leave  
c0100c01:	c3                   	ret    
c0100c02:	66 90                	xchg   %ax,%ax
c0100c04:	66 90                	xchg   %ax,%ax
c0100c06:	66 90                	xchg   %ax,%ax
c0100c08:	66 90                	xchg   %ax,%ax
c0100c0a:	66 90                	xchg   %ax,%ax
c0100c0c:	66 90                	xchg   %ax,%ax
c0100c0e:	66 90                	xchg   %ax,%ax

c0100c10 <get_kpdir>:
c0100c10:	55                   	push   %ebp
c0100c11:	b8 00 80 14 c0       	mov    $0xc0148000,%eax
c0100c16:	89 e5                	mov    %esp,%ebp
c0100c18:	5d                   	pop    %ebp
c0100c19:	c3                   	ret    
c0100c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c20 <init_page>:
c0100c20:	55                   	push   %ebp
c0100c21:	89 e5                	mov    %esp,%ebp
c0100c23:	57                   	push   %edi
c0100c24:	83 ec 08             	sub    $0x8,%esp
c0100c27:	68 00 10 00 00       	push   $0x1000
c0100c2c:	6a 00                	push   $0x0
c0100c2e:	68 00 80 14 00       	push   $0x148000
c0100c33:	e8 50 07 00 00       	call   c0101388 <memset>
c0100c38:	b9 00 80 14 00       	mov    $0x148000,%ecx
c0100c3d:	83 c4 10             	add    $0x10,%esp
c0100c40:	b8 00 80 12 00       	mov    $0x128000,%eax
c0100c45:	8d 76 00             	lea    0x0(%esi),%esi
c0100c48:	89 c2                	mov    %eax,%edx
c0100c4a:	05 00 10 00 00       	add    $0x1000,%eax
c0100c4f:	83 c1 04             	add    $0x4,%ecx
c0100c52:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100c58:	83 ca 07             	or     $0x7,%edx
c0100c5b:	89 51 fc             	mov    %edx,-0x4(%ecx)
c0100c5e:	3d 00 80 14 00       	cmp    $0x148000,%eax
c0100c63:	75 e3                	jne    c0100c48 <init_page+0x28>
c0100c65:	bf fc 7f 14 00       	mov    $0x147ffc,%edi
c0100c6a:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100c6f:	fd                   	std    
c0100c70:	ab                   	stos   %eax,%es:(%edi)
c0100c71:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100c76:	7d f8                	jge    c0100c70 <init_page+0x50>
c0100c78:	b8 00 80 14 00       	mov    $0x148000,%eax
c0100c7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c82:	0f 22 d8             	mov    %eax,%cr3
c0100c85:	0f 20 c0             	mov    %cr0,%eax
c0100c88:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100c8d:	0f 22 c0             	mov    %eax,%cr0
c0100c90:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100c93:	c9                   	leave  
c0100c94:	c3                   	ret    
c0100c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100ca0 <init_segment>:
c0100ca0:	55                   	push   %ebp
c0100ca1:	89 e5                	mov    %esp,%ebp
c0100ca3:	83 ec 0c             	sub    $0xc,%esp
c0100ca6:	6a 18                	push   $0x18
c0100ca8:	6a 00                	push   $0x0
c0100caa:	68 08 70 12 c0       	push   $0xc0127008
c0100caf:	e8 d4 06 00 00       	call   c0101388 <memset>
c0100cb4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100cb9:	31 c9                	xor    %ecx,%ecx
c0100cbb:	b8 08 70 12 c0       	mov    $0xc0127008,%eax
c0100cc0:	66 89 15 10 70 12 c0 	mov    %dx,0xc0127010
c0100cc7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100ccc:	66 89 0d 12 70 12 c0 	mov    %cx,0xc0127012
c0100cd3:	66 89 15 18 70 12 c0 	mov    %dx,0xc0127018
c0100cda:	ba 17 00 00 00       	mov    $0x17,%edx
c0100cdf:	31 c9                	xor    %ecx,%ecx
c0100ce1:	66 89 15 00 70 12 c0 	mov    %dx,0xc0127000
c0100ce8:	66 a3 02 70 12 c0    	mov    %ax,0xc0127002
c0100cee:	c1 e8 10             	shr    $0x10,%eax
c0100cf1:	66 a3 04 70 12 c0    	mov    %ax,0xc0127004
c0100cf7:	c6 05 14 70 12 c0 00 	movb   $0x0,0xc0127014
c0100cfe:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100d03:	c6 05 15 70 12 c0 9a 	movb   $0x9a,0xc0127015
c0100d0a:	c6 05 16 70 12 c0 cf 	movb   $0xcf,0xc0127016
c0100d11:	c6 05 17 70 12 c0 00 	movb   $0x0,0xc0127017
c0100d18:	66 89 0d 1a 70 12 c0 	mov    %cx,0xc012701a
c0100d1f:	c6 05 1c 70 12 c0 00 	movb   $0x0,0xc012701c
c0100d26:	c6 05 1d 70 12 c0 92 	movb   $0x92,0xc012701d
c0100d2d:	c6 05 1e 70 12 c0 cf 	movb   $0xcf,0xc012701e
c0100d34:	c6 05 1f 70 12 c0 00 	movb   $0x0,0xc012701f
c0100d3b:	0f 01 10             	lgdtl  (%eax)
c0100d3e:	83 c4 10             	add    $0x10,%esp
c0100d41:	c9                   	leave  
c0100d42:	c3                   	ret    
c0100d43:	66 90                	xchg   %ax,%ax
c0100d45:	66 90                	xchg   %ax,%ax
c0100d47:	66 90                	xchg   %ax,%ax
c0100d49:	66 90                	xchg   %ax,%ax
c0100d4b:	66 90                	xchg   %ax,%ax
c0100d4d:	66 90                	xchg   %ax,%ax
c0100d4f:	90                   	nop

c0100d50 <loader>:
c0100d50:	55                   	push   %ebp
c0100d51:	89 e5                	mov    %esp,%ebp
c0100d53:	57                   	push   %edi
c0100d54:	56                   	push   %esi
c0100d55:	53                   	push   %ebx
c0100d56:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100d5c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100d62:	68 00 10 00 00       	push   $0x1000
c0100d67:	6a 00                	push   $0x0
c0100d69:	53                   	push   %ebx
c0100d6a:	e8 91 01 00 00       	call   c0100f00 <ramdisk_read>
c0100d6f:	83 c4 10             	add    $0x10,%esp
c0100d72:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100d79:	45 4c 46 
c0100d7c:	74 06                	je     c0100d84 <loader+0x34>
c0100d7e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100d83:	d6                   	(bad)  
c0100d84:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100d8a:	83 fa 34             	cmp    $0x34,%edx
c0100d8d:	74 06                	je     c0100d95 <loader+0x45>
c0100d8f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100d94:	d6                   	(bad)  
c0100d95:	31 f6                	xor    %esi,%esi
c0100d97:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100d9e:	00 
c0100d9f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100da3:	75 1c                	jne    c0100dc1 <loader+0x71>
c0100da5:	eb 79                	jmp    c0100e20 <loader+0xd0>
c0100da7:	89 f6                	mov    %esi,%esi
c0100da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100db0:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100db7:	83 c6 01             	add    $0x1,%esi
c0100dba:	83 c3 20             	add    $0x20,%ebx
c0100dbd:	39 f0                	cmp    %esi,%eax
c0100dbf:	7e 5f                	jle    c0100e20 <loader+0xd0>
c0100dc1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100dc5:	75 e9                	jne    c0100db0 <loader+0x60>
c0100dc7:	83 ec 08             	sub    $0x8,%esp
c0100dca:	ff 33                	pushl  (%ebx)
c0100dcc:	ff 73 f4             	pushl  -0xc(%ebx)
c0100dcf:	e8 7c f2 ff ff       	call   c0100050 <mm_malloc>
c0100dd4:	83 c4 0c             	add    $0xc,%esp
c0100dd7:	ff 73 fc             	pushl  -0x4(%ebx)
c0100dda:	ff 73 f0             	pushl  -0x10(%ebx)
c0100ddd:	50                   	push   %eax
c0100dde:	89 c7                	mov    %eax,%edi
c0100de0:	e8 1b 01 00 00       	call   c0100f00 <ramdisk_read>
c0100de5:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100de8:	8b 13                	mov    (%ebx),%edx
c0100dea:	83 c4 0c             	add    $0xc,%esp
c0100ded:	29 c2                	sub    %eax,%edx
c0100def:	52                   	push   %edx
c0100df0:	6a 00                	push   $0x0
c0100df2:	03 43 f0             	add    -0x10(%ebx),%eax
c0100df5:	01 c7                	add    %eax,%edi
c0100df7:	57                   	push   %edi
c0100df8:	e8 8b 05 00 00       	call   c0101388 <memset>
c0100dfd:	8b 03                	mov    (%ebx),%eax
c0100dff:	03 43 f4             	add    -0xc(%ebx),%eax
c0100e02:	83 c4 10             	add    $0x10,%esp
c0100e05:	83 e8 01             	sub    $0x1,%eax
c0100e08:	3b 05 00 50 12 c0    	cmp    0xc0125000,%eax
c0100e0e:	76 a0                	jbe    c0100db0 <loader+0x60>
c0100e10:	a3 00 50 12 c0       	mov    %eax,0xc0125000
c0100e15:	eb 99                	jmp    c0100db0 <loader+0x60>
c0100e17:	89 f6                	mov    %esi,%esi
c0100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e20:	83 ec 08             	sub    $0x8,%esp
c0100e23:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100e29:	68 00 00 10 00       	push   $0x100000
c0100e2e:	68 00 00 f0 bf       	push   $0xbff00000
c0100e33:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100e39:	e8 12 f2 ff ff       	call   c0100050 <mm_malloc>
c0100e3e:	e8 2d fd ff ff       	call   c0100b70 <get_ucr3>
c0100e43:	0f 22 d8             	mov    %eax,%cr3
c0100e46:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100e4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100e4f:	5b                   	pop    %ebx
c0100e50:	5e                   	pop    %esi
c0100e51:	5f                   	pop    %edi
c0100e52:	5d                   	pop    %ebp
c0100e53:	c3                   	ret    
c0100e54:	66 90                	xchg   %ax,%ax
c0100e56:	66 90                	xchg   %ax,%ax
c0100e58:	66 90                	xchg   %ax,%ax
c0100e5a:	66 90                	xchg   %ax,%ax
c0100e5c:	66 90                	xchg   %ax,%ax
c0100e5e:	66 90                	xchg   %ax,%ax

c0100e60 <sbrk>:
c0100e60:	55                   	push   %ebp
c0100e61:	89 e5                	mov    %esp,%ebp
c0100e63:	83 ec 08             	sub    $0x8,%esp
c0100e66:	68 03 18 10 c0       	push   $0xc0101803
c0100e6b:	6a 08                	push   $0x8
c0100e6d:	68 ed 17 10 c0       	push   $0xc01017ed
c0100e72:	68 e4 14 10 c0       	push   $0xc01014e4
c0100e77:	e8 14 00 00 00       	call   c0100e90 <printk>
c0100e7c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e81:	d6                   	(bad)  
c0100e82:	30 c0                	xor    %al,%al
c0100e84:	c9                   	leave  
c0100e85:	c3                   	ret    
c0100e86:	66 90                	xchg   %ax,%ax
c0100e88:	66 90                	xchg   %ax,%ax
c0100e8a:	66 90                	xchg   %ax,%ax
c0100e8c:	66 90                	xchg   %ax,%ax
c0100e8e:	66 90                	xchg   %ax,%ax

c0100e90 <printk>:
c0100e90:	55                   	push   %ebp
c0100e91:	89 e5                	mov    %esp,%ebp
c0100e93:	5d                   	pop    %ebp
c0100e94:	c3                   	ret    
c0100e95:	66 90                	xchg   %ax,%ax
c0100e97:	66 90                	xchg   %ax,%ax
c0100e99:	66 90                	xchg   %ax,%ax
c0100e9b:	66 90                	xchg   %ax,%ax
c0100e9d:	66 90                	xchg   %ax,%ax
c0100e9f:	90                   	nop

c0100ea0 <init_serial>:
c0100ea0:	55                   	push   %ebp
c0100ea1:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100ea6:	31 c0                	xor    %eax,%eax
c0100ea8:	89 e5                	mov    %esp,%ebp
c0100eaa:	ee                   	out    %al,(%dx)
c0100eab:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100eb0:	b2 fb                	mov    $0xfb,%dl
c0100eb2:	ee                   	out    %al,(%dx)
c0100eb3:	b8 01 00 00 00       	mov    $0x1,%eax
c0100eb8:	b2 f8                	mov    $0xf8,%dl
c0100eba:	ee                   	out    %al,(%dx)
c0100ebb:	31 c0                	xor    %eax,%eax
c0100ebd:	b2 f9                	mov    $0xf9,%dl
c0100ebf:	ee                   	out    %al,(%dx)
c0100ec0:	b8 03 00 00 00       	mov    $0x3,%eax
c0100ec5:	b2 fb                	mov    $0xfb,%dl
c0100ec7:	ee                   	out    %al,(%dx)
c0100ec8:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100ecd:	b2 fa                	mov    $0xfa,%dl
c0100ecf:	ee                   	out    %al,(%dx)
c0100ed0:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100ed5:	b2 fc                	mov    $0xfc,%dl
c0100ed7:	ee                   	out    %al,(%dx)
c0100ed8:	5d                   	pop    %ebp
c0100ed9:	c3                   	ret    
c0100eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100ee0 <serial_printc>:
c0100ee0:	55                   	push   %ebp
c0100ee1:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100ee6:	89 e5                	mov    %esp,%ebp
c0100ee8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100eeb:	90                   	nop
c0100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ef0:	ec                   	in     (%dx),%al
c0100ef1:	a8 20                	test   $0x20,%al
c0100ef3:	74 fb                	je     c0100ef0 <serial_printc+0x10>
c0100ef5:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100efa:	89 c8                	mov    %ecx,%eax
c0100efc:	ee                   	out    %al,(%dx)
c0100efd:	5d                   	pop    %ebp
c0100efe:	c3                   	ret    
c0100eff:	90                   	nop

c0100f00 <ramdisk_read>:
c0100f00:	55                   	push   %ebp
c0100f01:	89 e5                	mov    %esp,%ebp
c0100f03:	53                   	push   %ebx
c0100f04:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f07:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f0a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f0d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f10:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f15:	76 06                	jbe    c0100f1d <ramdisk_read+0x1d>
c0100f17:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f1c:	d6                   	(bad)  
c0100f1d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100f20:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f23:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100f26:	5b                   	pop    %ebx
c0100f27:	5d                   	pop    %ebp
c0100f28:	e9 13 04 00 00       	jmp    c0101340 <memcpy>
c0100f2d:	8d 76 00             	lea    0x0(%esi),%esi

c0100f30 <ramdisk_write>:
c0100f30:	55                   	push   %ebp
c0100f31:	89 e5                	mov    %esp,%ebp
c0100f33:	53                   	push   %ebx
c0100f34:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f37:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f3a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f3d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f40:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f45:	76 06                	jbe    c0100f4d <ramdisk_write+0x1d>
c0100f47:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f4c:	d6                   	(bad)  
c0100f4d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0100f50:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f53:	89 55 08             	mov    %edx,0x8(%ebp)
c0100f56:	5b                   	pop    %ebx
c0100f57:	5d                   	pop    %ebp
c0100f58:	e9 e3 03 00 00       	jmp    c0101340 <memcpy>
c0100f5d:	66 90                	xchg   %ax,%ax
c0100f5f:	90                   	nop

c0100f60 <ide_intr>:
c0100f60:	55                   	push   %ebp
c0100f61:	c7 05 04 90 14 c0 01 	movl   $0x1,0xc0149004
c0100f68:	00 00 00 
c0100f6b:	89 e5                	mov    %esp,%ebp
c0100f6d:	5d                   	pop    %ebp
c0100f6e:	c3                   	ret    
c0100f6f:	90                   	nop

c0100f70 <ide_writeback>:
c0100f70:	a1 00 90 14 c0       	mov    0xc0149000,%eax
c0100f75:	83 c0 01             	add    $0x1,%eax
c0100f78:	83 f8 64             	cmp    $0x64,%eax
c0100f7b:	a3 00 90 14 c0       	mov    %eax,0xc0149000
c0100f80:	74 06                	je     c0100f88 <ide_writeback+0x18>
c0100f82:	c3                   	ret    
c0100f83:	90                   	nop
c0100f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f88:	55                   	push   %ebp
c0100f89:	89 e5                	mov    %esp,%ebp
c0100f8b:	83 ec 08             	sub    $0x8,%esp
c0100f8e:	e8 dd 01 00 00       	call   c0101170 <buf_writeback>
c0100f93:	c7 05 00 90 14 c0 00 	movl   $0x0,0xc0149000
c0100f9a:	00 00 00 
c0100f9d:	c9                   	leave  
c0100f9e:	c3                   	ret    
c0100f9f:	90                   	nop

c0100fa0 <ide_read>:
c0100fa0:	55                   	push   %ebp
c0100fa1:	89 e5                	mov    %esp,%ebp
c0100fa3:	57                   	push   %edi
c0100fa4:	56                   	push   %esi
c0100fa5:	53                   	push   %ebx
c0100fa6:	83 ec 0c             	sub    $0xc,%esp
c0100fa9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100fac:	8b 45 10             	mov    0x10(%ebp),%eax
c0100faf:	8b 7d 08             	mov    0x8(%ebp),%edi
c0100fb2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0100fb5:	29 df                	sub    %ebx,%edi
c0100fb7:	85 c0                	test   %eax,%eax
c0100fb9:	74 1b                	je     c0100fd6 <ide_read+0x36>
c0100fbb:	90                   	nop
c0100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100fc0:	83 ec 0c             	sub    $0xc,%esp
c0100fc3:	53                   	push   %ebx
c0100fc4:	e8 07 02 00 00       	call   c01011d0 <read_byte>
c0100fc9:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c0100fcc:	83 c3 01             	add    $0x1,%ebx
c0100fcf:	83 c4 10             	add    $0x10,%esp
c0100fd2:	39 f3                	cmp    %esi,%ebx
c0100fd4:	75 ea                	jne    c0100fc0 <ide_read+0x20>
c0100fd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100fd9:	5b                   	pop    %ebx
c0100fda:	5e                   	pop    %esi
c0100fdb:	5f                   	pop    %edi
c0100fdc:	5d                   	pop    %ebp
c0100fdd:	c3                   	ret    
c0100fde:	66 90                	xchg   %ax,%ax

c0100fe0 <ide_write>:
c0100fe0:	55                   	push   %ebp
c0100fe1:	89 e5                	mov    %esp,%ebp
c0100fe3:	57                   	push   %edi
c0100fe4:	56                   	push   %esi
c0100fe5:	53                   	push   %ebx
c0100fe6:	83 ec 0c             	sub    $0xc,%esp
c0100fe9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0100fec:	8b 45 10             	mov    0x10(%ebp),%eax
c0100fef:	8b 7d 08             	mov    0x8(%ebp),%edi
c0100ff2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0100ff5:	29 df                	sub    %ebx,%edi
c0100ff7:	85 c0                	test   %eax,%eax
c0100ff9:	74 1d                	je     c0101018 <ide_write+0x38>
c0100ffb:	90                   	nop
c0100ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101000:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101004:	83 ec 08             	sub    $0x8,%esp
c0101007:	50                   	push   %eax
c0101008:	53                   	push   %ebx
c0101009:	83 c3 01             	add    $0x1,%ebx
c010100c:	e8 ef 01 00 00       	call   c0101200 <write_byte>
c0101011:	83 c4 10             	add    $0x10,%esp
c0101014:	39 f3                	cmp    %esi,%ebx
c0101016:	75 e8                	jne    c0101000 <ide_write+0x20>
c0101018:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010101b:	5b                   	pop    %ebx
c010101c:	5e                   	pop    %esi
c010101d:	5f                   	pop    %edi
c010101e:	5d                   	pop    %ebp
c010101f:	c3                   	ret    

c0101020 <clear_ide_intr>:
c0101020:	55                   	push   %ebp
c0101021:	c7 05 04 90 14 c0 00 	movl   $0x0,0xc0149004
c0101028:	00 00 00 
c010102b:	89 e5                	mov    %esp,%ebp
c010102d:	5d                   	pop    %ebp
c010102e:	c3                   	ret    
c010102f:	90                   	nop

c0101030 <wait_ide_intr>:
c0101030:	a1 04 90 14 c0       	mov    0xc0149004,%eax
c0101035:	55                   	push   %ebp
c0101036:	89 e5                	mov    %esp,%ebp
c0101038:	85 c0                	test   %eax,%eax
c010103a:	75 0e                	jne    c010104a <wait_ide_intr+0x1a>
c010103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101040:	f4                   	hlt    
c0101041:	a1 04 90 14 c0       	mov    0xc0149004,%eax
c0101046:	85 c0                	test   %eax,%eax
c0101048:	74 f6                	je     c0101040 <wait_ide_intr+0x10>
c010104a:	c7 05 04 90 14 c0 00 	movl   $0x0,0xc0149004
c0101051:	00 00 00 
c0101054:	5d                   	pop    %ebp
c0101055:	c3                   	ret    
c0101056:	8d 76 00             	lea    0x0(%esi),%esi
c0101059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101060 <init_ide>:
c0101060:	55                   	push   %ebp
c0101061:	89 e5                	mov    %esp,%ebp
c0101063:	83 ec 08             	sub    $0x8,%esp
c0101066:	e8 d5 00 00 00       	call   c0101140 <buf_init>
c010106b:	83 ec 08             	sub    $0x8,%esp
c010106e:	68 70 0f 10 c0       	push   $0xc0100f70
c0101073:	6a 00                	push   $0x0
c0101075:	e8 56 f4 ff ff       	call   c01004d0 <add_irq_handle>
c010107a:	58                   	pop    %eax
c010107b:	5a                   	pop    %edx
c010107c:	68 60 0f 10 c0       	push   $0xc0100f60
c0101081:	6a 0e                	push   $0xe
c0101083:	e8 48 f4 ff ff       	call   c01004d0 <add_irq_handle>
c0101088:	83 c4 10             	add    $0x10,%esp
c010108b:	c9                   	leave  
c010108c:	c3                   	ret    
c010108d:	66 90                	xchg   %ax,%ax
c010108f:	90                   	nop

c0101090 <buf_fetch>:
c0101090:	55                   	push   %ebp
c0101091:	89 c2                	mov    %eax,%edx
c0101093:	89 e5                	mov    %esp,%ebp
c0101095:	57                   	push   %edi
c0101096:	56                   	push   %esi
c0101097:	53                   	push   %ebx
c0101098:	89 c3                	mov    %eax,%ebx
c010109a:	83 e3 7f             	and    $0x7f,%ebx
c010109d:	89 d8                	mov    %ebx,%eax
c010109f:	83 ec 1c             	sub    $0x1c,%esp
c01010a2:	c1 e0 09             	shl    $0x9,%eax
c01010a5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c01010a8:	8d 81 40 90 14 c0    	lea    -0x3feb6fc0(%ecx),%eax
c01010ae:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c01010b2:	74 5c                	je     c0101110 <buf_fetch+0x80>
c01010b4:	89 d7                	mov    %edx,%edi
c01010b6:	89 da                	mov    %ebx,%edx
c01010b8:	c1 e2 09             	shl    $0x9,%edx
c01010bb:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01010be:	8d 91 40 90 14 c0    	lea    -0x3feb6fc0(%ecx),%edx
c01010c4:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c01010ca:	74 54                	je     c0101120 <buf_fetch+0x90>
c01010cc:	8d 72 06             	lea    0x6(%edx),%esi
c01010cf:	83 ec 08             	sub    $0x8,%esp
c01010d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01010d5:	57                   	push   %edi
c01010d6:	56                   	push   %esi
c01010d7:	e8 a4 01 00 00       	call   c0101280 <disk_do_read>
c01010dc:	89 da                	mov    %ebx,%edx
c01010de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01010e1:	83 c4 10             	add    $0x10,%esp
c01010e4:	c1 e2 09             	shl    $0x9,%edx
c01010e7:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01010ea:	c6 81 44 90 14 c0 01 	movb   $0x1,-0x3feb6fbc(%ecx)
c01010f1:	89 b9 40 90 14 c0    	mov    %edi,-0x3feb6fc0(%ecx)
c01010f7:	c6 81 45 90 14 c0 00 	movb   $0x0,-0x3feb6fbb(%ecx)
c01010fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101101:	5b                   	pop    %ebx
c0101102:	5e                   	pop    %esi
c0101103:	5f                   	pop    %edi
c0101104:	5d                   	pop    %ebp
c0101105:	c3                   	ret    
c0101106:	8d 76 00             	lea    0x0(%esi),%esi
c0101109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101110:	39 91 40 90 14 c0    	cmp    %edx,-0x3feb6fc0(%ecx)
c0101116:	75 9c                	jne    c01010b4 <buf_fetch+0x24>
c0101118:	eb e4                	jmp    c01010fe <buf_fetch+0x6e>
c010111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101120:	8d 72 06             	lea    0x6(%edx),%esi
c0101123:	83 ec 08             	sub    $0x8,%esp
c0101126:	ff b1 40 90 14 c0    	pushl  -0x3feb6fc0(%ecx)
c010112c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010112f:	56                   	push   %esi
c0101130:	e8 8b 01 00 00       	call   c01012c0 <disk_do_write>
c0101135:	83 c4 10             	add    $0x10,%esp
c0101138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010113b:	eb 92                	jmp    c01010cf <buf_fetch+0x3f>
c010113d:	8d 76 00             	lea    0x0(%esi),%esi

c0101140 <buf_init>:
c0101140:	55                   	push   %ebp
c0101141:	b8 44 90 14 c0       	mov    $0xc0149044,%eax
c0101146:	89 e5                	mov    %esp,%ebp
c0101148:	90                   	nop
c0101149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101150:	c6 00 00             	movb   $0x0,(%eax)
c0101153:	05 08 02 00 00       	add    $0x208,%eax
c0101158:	3d 44 94 15 c0       	cmp    $0xc0159444,%eax
c010115d:	75 f1                	jne    c0101150 <buf_init+0x10>
c010115f:	5d                   	pop    %ebp
c0101160:	c3                   	ret    
c0101161:	eb 0d                	jmp    c0101170 <buf_writeback>
c0101163:	90                   	nop
c0101164:	90                   	nop
c0101165:	90                   	nop
c0101166:	90                   	nop
c0101167:	90                   	nop
c0101168:	90                   	nop
c0101169:	90                   	nop
c010116a:	90                   	nop
c010116b:	90                   	nop
c010116c:	90                   	nop
c010116d:	90                   	nop
c010116e:	90                   	nop
c010116f:	90                   	nop

c0101170 <buf_writeback>:
c0101170:	55                   	push   %ebp
c0101171:	89 e5                	mov    %esp,%ebp
c0101173:	53                   	push   %ebx
c0101174:	bb 46 90 14 c0       	mov    $0xc0149046,%ebx
c0101179:	83 ec 04             	sub    $0x4,%esp
c010117c:	eb 10                	jmp    c010118e <buf_writeback+0x1e>
c010117e:	66 90                	xchg   %ax,%ax
c0101180:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101186:	81 fb 46 94 15 c0    	cmp    $0xc0159446,%ebx
c010118c:	74 32                	je     c01011c0 <buf_writeback+0x50>
c010118e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101192:	75 ec                	jne    c0101180 <buf_writeback+0x10>
c0101194:	83 ec 08             	sub    $0x8,%esp
c0101197:	ff 73 fa             	pushl  -0x6(%ebx)
c010119a:	53                   	push   %ebx
c010119b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01011a1:	e8 1a 01 00 00       	call   c01012c0 <disk_do_write>
c01011a6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c01011ad:	83 c4 10             	add    $0x10,%esp
c01011b0:	81 fb 46 94 15 c0    	cmp    $0xc0159446,%ebx
c01011b6:	75 d6                	jne    c010118e <buf_writeback+0x1e>
c01011b8:	90                   	nop
c01011b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01011c3:	c9                   	leave  
c01011c4:	c3                   	ret    
c01011c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01011c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01011d0 <read_byte>:
c01011d0:	55                   	push   %ebp
c01011d1:	89 e5                	mov    %esp,%ebp
c01011d3:	53                   	push   %ebx
c01011d4:	83 ec 04             	sub    $0x4,%esp
c01011d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01011da:	89 d8                	mov    %ebx,%eax
c01011dc:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c01011e2:	c1 e8 09             	shr    $0x9,%eax
c01011e5:	e8 a6 fe ff ff       	call   c0101090 <buf_fetch>
c01011ea:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c01011ef:	83 c4 04             	add    $0x4,%esp
c01011f2:	5b                   	pop    %ebx
c01011f3:	5d                   	pop    %ebp
c01011f4:	c3                   	ret    
c01011f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01011f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101200 <write_byte>:
c0101200:	55                   	push   %ebp
c0101201:	89 e5                	mov    %esp,%ebp
c0101203:	56                   	push   %esi
c0101204:	53                   	push   %ebx
c0101205:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101208:	8b 75 0c             	mov    0xc(%ebp),%esi
c010120b:	89 d8                	mov    %ebx,%eax
c010120d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101213:	c1 e8 09             	shr    $0x9,%eax
c0101216:	e8 75 fe ff ff       	call   c0101090 <buf_fetch>
c010121b:	89 f2                	mov    %esi,%edx
c010121d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101221:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101225:	5b                   	pop    %ebx
c0101226:	5e                   	pop    %esi
c0101227:	5d                   	pop    %ebp
c0101228:	c3                   	ret    
c0101229:	66 90                	xchg   %ax,%ax
c010122b:	66 90                	xchg   %ax,%ax
c010122d:	66 90                	xchg   %ax,%ax
c010122f:	90                   	nop

c0101230 <ide_prepare>:
c0101230:	55                   	push   %ebp
c0101231:	89 c1                	mov    %eax,%ecx
c0101233:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101238:	89 e5                	mov    %esp,%ebp
c010123a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101240:	ec                   	in     (%dx),%al
c0101241:	83 e0 c0             	and    $0xffffffc0,%eax
c0101244:	3c 40                	cmp    $0x40,%al
c0101246:	75 f8                	jne    c0101240 <ide_prepare+0x10>
c0101248:	ba f1 01 00 00       	mov    $0x1f1,%edx
c010124d:	31 c0                	xor    %eax,%eax
c010124f:	ee                   	out    %al,(%dx)
c0101250:	b8 01 00 00 00       	mov    $0x1,%eax
c0101255:	b2 f2                	mov    $0xf2,%dl
c0101257:	ee                   	out    %al,(%dx)
c0101258:	b2 f3                	mov    $0xf3,%dl
c010125a:	89 c8                	mov    %ecx,%eax
c010125c:	ee                   	out    %al,(%dx)
c010125d:	89 c8                	mov    %ecx,%eax
c010125f:	b2 f4                	mov    $0xf4,%dl
c0101261:	c1 e8 08             	shr    $0x8,%eax
c0101264:	ee                   	out    %al,(%dx)
c0101265:	89 c8                	mov    %ecx,%eax
c0101267:	b2 f5                	mov    $0xf5,%dl
c0101269:	c1 e8 10             	shr    $0x10,%eax
c010126c:	ee                   	out    %al,(%dx)
c010126d:	89 c8                	mov    %ecx,%eax
c010126f:	b2 f6                	mov    $0xf6,%dl
c0101271:	c1 e8 18             	shr    $0x18,%eax
c0101274:	83 c8 e0             	or     $0xffffffe0,%eax
c0101277:	ee                   	out    %al,(%dx)
c0101278:	5d                   	pop    %ebp
c0101279:	c3                   	ret    
c010127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101280 <disk_do_read>:
c0101280:	55                   	push   %ebp
c0101281:	89 e5                	mov    %esp,%ebp
c0101283:	53                   	push   %ebx
c0101284:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101287:	e8 a4 ff ff ff       	call   c0101230 <ide_prepare>
c010128c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101291:	b8 20 00 00 00       	mov    $0x20,%eax
c0101296:	ee                   	out    %al,(%dx)
c0101297:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010129a:	b2 f0                	mov    $0xf0,%dl
c010129c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01012a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012a8:	ed                   	in     (%dx),%eax
c01012a9:	89 01                	mov    %eax,(%ecx)
c01012ab:	83 c1 04             	add    $0x4,%ecx
c01012ae:	39 d9                	cmp    %ebx,%ecx
c01012b0:	75 f6                	jne    c01012a8 <disk_do_read+0x28>
c01012b2:	5b                   	pop    %ebx
c01012b3:	5d                   	pop    %ebp
c01012b4:	c3                   	ret    
c01012b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01012b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01012c0 <disk_do_write>:
c01012c0:	55                   	push   %ebp
c01012c1:	89 e5                	mov    %esp,%ebp
c01012c3:	53                   	push   %ebx
c01012c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012c7:	e8 64 ff ff ff       	call   c0101230 <ide_prepare>
c01012cc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012d1:	b8 30 00 00 00       	mov    $0x30,%eax
c01012d6:	ee                   	out    %al,(%dx)
c01012d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01012da:	b2 f0                	mov    $0xf0,%dl
c01012dc:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01012e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012e8:	8b 01                	mov    (%ecx),%eax
c01012ea:	ef                   	out    %eax,(%dx)
c01012eb:	83 c1 04             	add    $0x4,%ecx
c01012ee:	39 d9                	cmp    %ebx,%ecx
c01012f0:	75 f6                	jne    c01012e8 <disk_do_write+0x28>
c01012f2:	5b                   	pop    %ebx
c01012f3:	5d                   	pop    %ebp
c01012f4:	c3                   	ret    
c01012f5:	66 90                	xchg   %ax,%ax
c01012f7:	66 90                	xchg   %ax,%ax
c01012f9:	66 90                	xchg   %ax,%ax
c01012fb:	66 90                	xchg   %ax,%ax
c01012fd:	66 90                	xchg   %ax,%ax
c01012ff:	90                   	nop

c0101300 <dma_prepare>:
c0101300:	55                   	push   %ebp
c0101301:	89 e5                	mov    %esp,%ebp
c0101303:	83 ec 08             	sub    $0x8,%esp
c0101306:	68 24 18 10 c0       	push   $0xc0101824
c010130b:	6a 1d                	push   $0x1d
c010130d:	68 08 18 10 c0       	push   $0xc0101808
c0101312:	68 74 17 10 c0       	push   $0xc0101774
c0101317:	e8 74 fb ff ff       	call   c0100e90 <printk>
c010131c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101321:	d6                   	(bad)  
c0101322:	83 c4 10             	add    $0x10,%esp
c0101325:	c9                   	leave  
c0101326:	c3                   	ret    
c0101327:	89 f6                	mov    %esi,%esi
c0101329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101330 <dma_issue_read>:
c0101330:	55                   	push   %ebp
c0101331:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101336:	89 e5                	mov    %esp,%ebp
c0101338:	ec                   	in     (%dx),%al
c0101339:	83 c8 09             	or     $0x9,%eax
c010133c:	ee                   	out    %al,(%dx)
c010133d:	5d                   	pop    %ebp
c010133e:	c3                   	ret    
c010133f:	90                   	nop

c0101340 <memcpy>:
c0101340:	55                   	push   %ebp
c0101341:	89 e5                	mov    %esp,%ebp
c0101343:	56                   	push   %esi
c0101344:	57                   	push   %edi
c0101345:	53                   	push   %ebx
c0101346:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101349:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010134c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010134f:	fc                   	cld    
c0101350:	83 f9 08             	cmp    $0x8,%ecx
c0101353:	76 26                	jbe    c010137b <memcpy+0x3b>
c0101355:	89 fa                	mov    %edi,%edx
c0101357:	89 cb                	mov    %ecx,%ebx
c0101359:	83 e2 03             	and    $0x3,%edx
c010135c:	74 10                	je     c010136e <memcpy+0x2e>
c010135e:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101363:	29 d1                	sub    %edx,%ecx
c0101365:	83 e1 03             	and    $0x3,%ecx
c0101368:	29 cb                	sub    %ecx,%ebx
c010136a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010136c:	89 d9                	mov    %ebx,%ecx
c010136e:	c1 e9 02             	shr    $0x2,%ecx
c0101371:	8d 76 00             	lea    0x0(%esi),%esi
c0101374:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101376:	89 d9                	mov    %ebx,%ecx
c0101378:	83 e1 03             	and    $0x3,%ecx
c010137b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010137d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101380:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101383:	5b                   	pop    %ebx
c0101384:	5f                   	pop    %edi
c0101385:	5e                   	pop    %esi
c0101386:	c9                   	leave  
c0101387:	c3                   	ret    

c0101388 <memset>:
c0101388:	55                   	push   %ebp
c0101389:	89 e5                	mov    %esp,%ebp
c010138b:	57                   	push   %edi
c010138c:	8b 7d 08             	mov    0x8(%ebp),%edi
c010138f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101393:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101396:	fc                   	cld    
c0101397:	83 f9 10             	cmp    $0x10,%ecx
c010139a:	76 69                	jbe    c0101405 <memset+0x7d>
c010139c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013a2:	74 4c                	je     c01013f0 <memset+0x68>
c01013a4:	88 07                	mov    %al,(%edi)
c01013a6:	47                   	inc    %edi
c01013a7:	49                   	dec    %ecx
c01013a8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013ae:	74 40                	je     c01013f0 <memset+0x68>
c01013b0:	88 07                	mov    %al,(%edi)
c01013b2:	47                   	inc    %edi
c01013b3:	49                   	dec    %ecx
c01013b4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013ba:	74 34                	je     c01013f0 <memset+0x68>
c01013bc:	88 07                	mov    %al,(%edi)
c01013be:	47                   	inc    %edi
c01013bf:	49                   	dec    %ecx
c01013c0:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013c6:	74 28                	je     c01013f0 <memset+0x68>
c01013c8:	88 07                	mov    %al,(%edi)
c01013ca:	47                   	inc    %edi
c01013cb:	49                   	dec    %ecx
c01013cc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013d2:	74 1c                	je     c01013f0 <memset+0x68>
c01013d4:	88 07                	mov    %al,(%edi)
c01013d6:	47                   	inc    %edi
c01013d7:	49                   	dec    %ecx
c01013d8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013de:	74 10                	je     c01013f0 <memset+0x68>
c01013e0:	88 07                	mov    %al,(%edi)
c01013e2:	47                   	inc    %edi
c01013e3:	49                   	dec    %ecx
c01013e4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01013ea:	74 04                	je     c01013f0 <memset+0x68>
c01013ec:	88 07                	mov    %al,(%edi)
c01013ee:	47                   	inc    %edi
c01013ef:	49                   	dec    %ecx
c01013f0:	88 c4                	mov    %al,%ah
c01013f2:	89 c2                	mov    %eax,%edx
c01013f4:	c1 e2 10             	shl    $0x10,%edx
c01013f7:	09 d0                	or     %edx,%eax
c01013f9:	89 ca                	mov    %ecx,%edx
c01013fb:	c1 e9 02             	shr    $0x2,%ecx
c01013fe:	83 e2 03             	and    $0x3,%edx
c0101401:	f3 ab                	rep stos %eax,%es:(%edi)
c0101403:	89 d1                	mov    %edx,%ecx
c0101405:	f3 aa                	rep stos %al,%es:(%edi)
c0101407:	8b 45 08             	mov    0x8(%ebp),%eax
c010140a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010140d:	5f                   	pop    %edi
c010140e:	c9                   	leave  
c010140f:	c3                   	ret    
