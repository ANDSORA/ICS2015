
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <start>:
  100000:	0f 01 15 48 00 10 00 	lgdtl  0x100048
  100007:	0f 20 c0             	mov    %cr0,%eax
  10000a:	83 c8 01             	or     $0x1,%eax
  10000d:	0f 22 c0             	mov    %eax,%cr0
  100010:	ea 17 00 10 00 08 00 	ljmp   $0x8,$0x100017

00100017 <start_cond>:
  100017:	66 b8 10 00          	mov    $0x10,%ax
  10001b:	8e d8                	mov    %eax,%ds
  10001d:	8e c0                	mov    %eax,%es
  10001f:	8e d0                	mov    %eax,%ss
  100021:	bd 00 00 00 00       	mov    $0x0,%ebp
  100026:	bc 00 00 00 08       	mov    $0x8000000,%esp
  10002b:	e9 d0 03 00 00       	jmp    100400 <init>

00100030 <gdt>:
	...
  100038:	ff                   	(bad)  
  100039:	ff 00                	incl   (%eax)
  10003b:	00 00                	add    %al,(%eax)
  10003d:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
  100044:	00 92 cf 00 17 00    	add    %dl,0x1700cf(%edx)

00100048 <gdtdesc>:
  100048:	17                   	pop    %ss
  100049:	00 30                	add    %dh,(%eax)
  10004b:	00 10                	add    %dl,(%eax)
  10004d:	00 66 90             	add    %ah,-0x70(%esi)

00100050 <mm_malloc>:
  100050:	55                   	push   %ebp
  100051:	31 c0                	xor    %eax,%eax
  100053:	89 e5                	mov    %esp,%ebp
  100055:	57                   	push   %edi
  100056:	56                   	push   %esi
  100057:	53                   	push   %ebx
  100058:	83 ec 3c             	sub    $0x3c,%esp
  10005b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10005e:	85 db                	test   %ebx,%ebx
  100060:	0f 8e 36 02 00 00    	jle    10029c <mm_malloc+0x24c>
  100066:	e8 b5 0a 00 00       	call   100b20 <get_updir>
  10006b:	89 c6                	mov    %eax,%esi
  10006d:	e8 be 0a 00 00       	call   100b30 <get_ucr3>
  100072:	8b 55 08             	mov    0x8(%ebp),%edx
  100075:	8d 5c 1a ff          	lea    -0x1(%edx,%ebx,1),%ebx
  100079:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  10007c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10007f:	b8 00 10 00 00       	mov    $0x1000,%eax
  100084:	29 d0                	sub    %edx,%eax
  100086:	89 da                	mov    %ebx,%edx
  100088:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  10008e:	01 d0                	add    %edx,%eax
  100090:	85 c0                	test   %eax,%eax
  100092:	0f 8e c0 00 00 00    	jle    100158 <mm_malloc+0x108>
  100098:	8b 55 08             	mov    0x8(%ebp),%edx
  10009b:	83 e8 01             	sub    $0x1,%eax
  10009e:	89 f7                	mov    %esi,%edi
  1000a0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1000a5:	8d 84 02 00 10 00 00 	lea    0x1000(%edx,%eax,1),%eax
  1000ac:	89 d3                	mov    %edx,%ebx
  1000ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1000b1:	eb 51                	jmp    100104 <mm_malloc+0xb4>
  1000b3:	90                   	nop
  1000b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1000b8:	8b 31                	mov    (%ecx),%esi
  1000ba:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  1000c0:	81 ee 00 00 00 40    	sub    $0x40000000,%esi
  1000c6:	89 d8                	mov    %ebx,%eax
  1000c8:	c1 e8 0a             	shr    $0xa,%eax
  1000cb:	25 fc 0f 00 00       	and    $0xffc,%eax
  1000d0:	01 c6                	add    %eax,%esi
  1000d2:	f6 06 01             	testb  $0x1,(%esi)
  1000d5:	75 22                	jne    1000f9 <mm_malloc+0xa9>
  1000d7:	a1 00 20 10 00       	mov    0x102000,%eax
  1000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
  1000e1:	0f 8f c1 01 00 00    	jg     1002a8 <mm_malloc+0x258>
  1000e7:	89 c1                	mov    %eax,%ecx
  1000e9:	83 c0 01             	add    $0x1,%eax
  1000ec:	c1 e1 0c             	shl    $0xc,%ecx
  1000ef:	83 c9 07             	or     $0x7,%ecx
  1000f2:	89 0e                	mov    %ecx,(%esi)
  1000f4:	a3 00 20 10 00       	mov    %eax,0x102000
  1000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  1000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  100102:	74 54                	je     100158 <mm_malloc+0x108>
  100104:	89 d8                	mov    %ebx,%eax
  100106:	c1 e8 16             	shr    $0x16,%eax
  100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
  10010c:	f6 01 01             	testb  $0x1,(%ecx)
  10010f:	75 a7                	jne    1000b8 <mm_malloc+0x68>
  100111:	a1 00 30 10 00       	mov    0x103000,%eax
  100116:	89 c6                	mov    %eax,%esi
  100118:	83 c0 01             	add    $0x1,%eax
  10011b:	c1 e6 0c             	shl    $0xc,%esi
  10011e:	81 c6 00 40 10 00    	add    $0x104000,%esi
  100124:	a3 00 30 10 00       	mov    %eax,0x103000
  100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
  10012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100134:	83 c8 07             	or     $0x7,%eax
  100137:	89 01                	mov    %eax,(%ecx)
  100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  100140:	00 
  100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100148:	00 
  100149:	89 34 24             	mov    %esi,(%esp)
  10014c:	e8 a7 11 00 00       	call   1012f8 <memset>
  100151:	e9 70 ff ff ff       	jmp    1000c6 <mm_malloc+0x76>
  100156:	66 90                	xchg   %ax,%ax
  100158:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  10015b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10015e:	81 eb 00 00 00 40    	sub    $0x40000000,%ebx
  100164:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  10016a:	c1 e8 16             	shr    $0x16,%eax
  10016d:	8b 34 83             	mov    (%ebx,%eax,4),%esi
  100170:	f7 c6 01 00 00 00    	test   $0x1,%esi
  100176:	75 32                	jne    1001aa <mm_malloc+0x15a>
  100178:	c7 44 24 10 a4 13 10 	movl   $0x1013a4,0x10(%esp)
  10017f:	00 
  100180:	c7 44 24 0c 08 14 10 	movl   $0x101408,0xc(%esp)
  100187:	00 
  100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10018f:	00 
  100190:	c7 44 24 04 93 13 10 	movl   $0x101393,0x4(%esp)
  100197:	00 
  100198:	c7 04 24 b4 13 10 00 	movl   $0x1013b4,(%esp)
  10019f:	e8 5c 0c 00 00       	call   100e00 <printk>
  1001a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1001a9:	d6                   	(bad)  
  1001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
  1001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1001b8:	c1 ea 0c             	shr    $0xc,%edx
  1001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  1001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
  1001c5:	75 32                	jne    1001f9 <mm_malloc+0x1a9>
  1001c7:	c7 44 24 10 ac 13 10 	movl   $0x1013ac,0x10(%esp)
  1001ce:	00 
  1001cf:	c7 44 24 0c 08 14 10 	movl   $0x101408,0xc(%esp)
  1001d6:	00 
  1001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  1001de:	00 
  1001df:	c7 44 24 04 93 13 10 	movl   $0x101393,0x4(%esp)
  1001e6:	00 
  1001e7:	c7 04 24 b4 13 10 00 	movl   $0x1013b4,(%esp)
  1001ee:	e8 0d 0c 00 00       	call   100e00 <printk>
  1001f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1001f8:	d6                   	(bad)  
  1001f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1001fc:	c1 e8 16             	shr    $0x16,%eax
  1001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
  100202:	f6 c3 01             	test   $0x1,%bl
  100205:	75 32                	jne    100239 <mm_malloc+0x1e9>
  100207:	c7 44 24 10 a4 13 10 	movl   $0x1013a4,0x10(%esp)
  10020e:	00 
  10020f:	c7 44 24 0c 08 14 10 	movl   $0x101408,0xc(%esp)
  100216:	00 
  100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10021e:	00 
  10021f:	c7 44 24 04 93 13 10 	movl   $0x101393,0x4(%esp)
  100226:	00 
  100227:	c7 04 24 b4 13 10 00 	movl   $0x1013b4,(%esp)
  10022e:	e8 cd 0b 00 00       	call   100e00 <printk>
  100233:	b8 01 00 00 00       	mov    $0x1,%eax
  100238:	d6                   	(bad)  
  100239:	8b 55 08             	mov    0x8(%ebp),%edx
  10023c:	8d 83 00 00 00 c0    	lea    -0x40000000(%ebx),%eax
  100242:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100247:	c1 ea 0c             	shr    $0xc,%edx
  10024a:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100250:	8b 1c 90             	mov    (%eax,%edx,4),%ebx
  100253:	f6 c3 01             	test   $0x1,%bl
  100256:	75 32                	jne    10028a <mm_malloc+0x23a>
  100258:	c7 44 24 10 ac 13 10 	movl   $0x1013ac,0x10(%esp)
  10025f:	00 
  100260:	c7 44 24 0c 08 14 10 	movl   $0x101408,0xc(%esp)
  100267:	00 
  100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10026f:	00 
  100270:	c7 44 24 04 93 13 10 	movl   $0x101393,0x4(%esp)
  100277:	00 
  100278:	c7 04 24 b4 13 10 00 	movl   $0x1013b4,(%esp)
  10027f:	e8 7c 0b 00 00       	call   100e00 <printk>
  100284:	b8 01 00 00 00       	mov    $0x1,%eax
  100289:	d6                   	(bad)  
  10028a:	8b 55 08             	mov    0x8(%ebp),%edx
  10028d:	89 d8                	mov    %ebx,%eax
  10028f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100294:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  10029a:	09 d0                	or     %edx,%eax
  10029c:	83 c4 3c             	add    $0x3c,%esp
  10029f:	5b                   	pop    %ebx
  1002a0:	5e                   	pop    %esi
  1002a1:	5f                   	pop    %edi
  1002a2:	5d                   	pop    %ebp
  1002a3:	c3                   	ret    
  1002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1002a8:	c7 44 24 10 80 13 10 	movl   $0x101380,0x10(%esp)
  1002af:	00 
  1002b0:	c7 44 24 0c fe 13 10 	movl   $0x1013fe,0xc(%esp)
  1002b7:	00 
  1002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
  1002bf:	00 
  1002c0:	c7 44 24 04 93 13 10 	movl   $0x101393,0x4(%esp)
  1002c7:	00 
  1002c8:	c7 04 24 b4 13 10 00 	movl   $0x1013b4,(%esp)
  1002cf:	e8 2c 0b 00 00       	call   100e00 <printk>
  1002d4:	b8 01 00 00 00       	mov    $0x1,%eax
  1002d9:	d6                   	(bad)  
  1002da:	a1 00 20 10 00       	mov    0x102000,%eax
  1002df:	e9 03 fe ff ff       	jmp    1000e7 <mm_malloc+0x97>

001002e4 <vec0>:
  1002e4:	6a 00                	push   $0x0
  1002e6:	6a 00                	push   $0x0
  1002e8:	e9 ab 00 00 00       	jmp    100398 <asm_do_irq>

001002ed <vec1>:
  1002ed:	6a 00                	push   $0x0
  1002ef:	6a 01                	push   $0x1
  1002f1:	e9 a2 00 00 00       	jmp    100398 <asm_do_irq>

001002f6 <vec2>:
  1002f6:	6a 00                	push   $0x0
  1002f8:	6a 02                	push   $0x2
  1002fa:	e9 99 00 00 00       	jmp    100398 <asm_do_irq>

001002ff <vec3>:
  1002ff:	6a 00                	push   $0x0
  100301:	6a 03                	push   $0x3
  100303:	e9 90 00 00 00       	jmp    100398 <asm_do_irq>

00100308 <vec4>:
  100308:	6a 00                	push   $0x0
  10030a:	6a 04                	push   $0x4
  10030c:	e9 87 00 00 00       	jmp    100398 <asm_do_irq>

00100311 <vec5>:
  100311:	6a 00                	push   $0x0
  100313:	6a 05                	push   $0x5
  100315:	e9 7e 00 00 00       	jmp    100398 <asm_do_irq>

0010031a <vec6>:
  10031a:	6a 00                	push   $0x0
  10031c:	6a 06                	push   $0x6
  10031e:	e9 75 00 00 00       	jmp    100398 <asm_do_irq>

00100323 <vec7>:
  100323:	6a 00                	push   $0x0
  100325:	6a 07                	push   $0x7
  100327:	e9 6c 00 00 00       	jmp    100398 <asm_do_irq>

0010032c <vec8>:
  10032c:	6a 08                	push   $0x8
  10032e:	e9 65 00 00 00       	jmp    100398 <asm_do_irq>

00100333 <vec9>:
  100333:	6a 00                	push   $0x0
  100335:	6a 09                	push   $0x9
  100337:	e9 5c 00 00 00       	jmp    100398 <asm_do_irq>

0010033c <vec10>:
  10033c:	6a 0a                	push   $0xa
  10033e:	e9 55 00 00 00       	jmp    100398 <asm_do_irq>

00100343 <vec11>:
  100343:	6a 0b                	push   $0xb
  100345:	e9 4e 00 00 00       	jmp    100398 <asm_do_irq>

0010034a <vec12>:
  10034a:	6a 0c                	push   $0xc
  10034c:	e9 47 00 00 00       	jmp    100398 <asm_do_irq>

00100351 <vec13>:
  100351:	6a 0d                	push   $0xd
  100353:	e9 40 00 00 00       	jmp    100398 <asm_do_irq>

00100358 <vec14>:
  100358:	6a 0e                	push   $0xe
  10035a:	e9 39 00 00 00       	jmp    100398 <asm_do_irq>

0010035f <vecsys>:
  10035f:	6a 00                	push   $0x0
  100361:	68 80 00 00 00       	push   $0x80
  100366:	e9 2d 00 00 00       	jmp    100398 <asm_do_irq>

0010036b <irq0>:
  10036b:	6a 00                	push   $0x0
  10036d:	68 e8 03 00 00       	push   $0x3e8
  100372:	e9 21 00 00 00       	jmp    100398 <asm_do_irq>

00100377 <irq1>:
  100377:	6a 00                	push   $0x0
  100379:	68 e9 03 00 00       	push   $0x3e9
  10037e:	e9 15 00 00 00       	jmp    100398 <asm_do_irq>

00100383 <irq14>:
  100383:	6a 00                	push   $0x0
  100385:	68 f6 03 00 00       	push   $0x3f6
  10038a:	e9 09 00 00 00       	jmp    100398 <asm_do_irq>

0010038f <irq_empty>:
  10038f:	6a 00                	push   $0x0
  100391:	6a ff                	push   $0xffffffff
  100393:	e9 00 00 00 00       	jmp    100398 <asm_do_irq>

00100398 <asm_do_irq>:
  100398:	60                   	pusha  
  100399:	54                   	push   %esp
  10039a:	e8 a1 01 00 00       	call   100540 <irq_handle>
  10039f:	83 c4 04             	add    $0x4,%esp
  1003a2:	61                   	popa   
  1003a3:	83 c4 08             	add    $0x8,%esp
  1003a6:	cf                   	iret   
  1003a7:	66 90                	xchg   %ax,%ax
  1003a9:	66 90                	xchg   %ax,%ax
  1003ab:	66 90                	xchg   %ax,%ax
  1003ad:	66 90                	xchg   %ax,%ax
  1003af:	90                   	nop

001003b0 <init_cond>:
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	83 ec 08             	sub    $0x8,%esp
  1003b6:	68 9f 14 10 00       	push   $0x10149f
  1003bb:	6a 4a                	push   $0x4a
  1003bd:	68 0e 14 10 00       	push   $0x10140e
  1003c2:	68 20 14 10 00       	push   $0x101420
  1003c7:	e8 34 0a 00 00       	call   100e00 <printk>
  1003cc:	e8 2f 09 00 00       	call   100d00 <loader>
  1003d1:	bd 00 00 00 00       	mov    $0x0,%ebp
  1003d6:	83 ec 10             	sub    $0x10,%esp
  1003d9:	ff d0                	call   *%eax
  1003db:	68 9f 14 10 00       	push   $0x10149f
  1003e0:	6a 6b                	push   $0x6b
  1003e2:	68 0e 14 10 00       	push   $0x10140e
  1003e7:	68 54 14 10 00       	push   $0x101454
  1003ec:	e8 0f 0a 00 00       	call   100e00 <printk>
  1003f1:	b8 01 00 00 00       	mov    $0x1,%eax
  1003f6:	d6                   	(bad)  
  1003f7:	83 c4 20             	add    $0x20,%esp
  1003fa:	c9                   	leave  
  1003fb:	c3                   	ret    
  1003fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100400 <init>:
  100400:	55                   	push   %ebp
  100401:	b8 b0 03 10 00       	mov    $0x1003b0,%eax
  100406:	89 e5                	mov    %esp,%ebp
  100408:	83 ec 08             	sub    $0x8,%esp
  10040b:	ff e0                	jmp    *%eax
  10040d:	68 a9 14 10 00       	push   $0x1014a9
  100412:	6a 24                	push   $0x24
  100414:	68 0e 14 10 00       	push   $0x10140e
  100419:	68 54 14 10 00       	push   $0x101454
  10041e:	e8 dd 09 00 00       	call   100e00 <printk>
  100423:	b8 01 00 00 00       	mov    $0x1,%eax
  100428:	d6                   	(bad)  
  100429:	83 c4 10             	add    $0x10,%esp
  10042c:	c9                   	leave  
  10042d:	c3                   	ret    
  10042e:	66 90                	xchg   %ax,%ax

00100430 <do_syscall>:
  100430:	55                   	push   %ebp
  100431:	89 e5                	mov    %esp,%ebp
  100433:	83 ec 08             	sub    $0x8,%esp
  100436:	8b 55 08             	mov    0x8(%ebp),%edx
  100439:	8b 42 08             	mov    0x8(%edx),%eax
  10043c:	85 c0                	test   %eax,%eax
  10043e:	74 38                	je     100478 <do_syscall+0x48>
  100440:	83 f8 2d             	cmp    $0x2d,%eax
  100443:	75 0b                	jne    100450 <do_syscall+0x20>
  100445:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  10044c:	c9                   	leave  
  10044d:	c3                   	ret    
  10044e:	66 90                	xchg   %ax,%ax
  100450:	83 ec 0c             	sub    $0xc,%esp
  100453:	50                   	push   %eax
  100454:	68 24 15 10 00       	push   $0x101524
  100459:	6a 20                	push   $0x20
  10045b:	68 b0 14 10 00       	push   $0x1014b0
  100460:	68 d0 14 10 00       	push   $0x1014d0
  100465:	e8 96 09 00 00       	call   100e00 <printk>
  10046a:	b8 01 00 00 00       	mov    $0x1,%eax
  10046f:	d6                   	(bad)  
  100470:	83 c4 20             	add    $0x20,%esp
  100473:	c9                   	leave  
  100474:	c3                   	ret    
  100475:	8d 76 00             	lea    0x0(%esi),%esi
  100478:	fa                   	cli    
  100479:	83 ec 08             	sub    $0x8,%esp
  10047c:	ff 72 1c             	pushl  0x1c(%edx)
  10047f:	ff 72 04             	pushl  0x4(%edx)
  100482:	e8 09 00 00 00       	call   100490 <add_irq_handle>
  100487:	fb                   	sti    
  100488:	83 c4 10             	add    $0x10,%esp
  10048b:	c9                   	leave  
  10048c:	c3                   	ret    
  10048d:	66 90                	xchg   %ax,%ax
  10048f:	90                   	nop

00100490 <add_irq_handle>:
  100490:	55                   	push   %ebp
  100491:	89 e5                	mov    %esp,%ebp
  100493:	53                   	push   %ebx
  100494:	83 ec 04             	sub    $0x4,%esp
  100497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10049a:	83 fb 0f             	cmp    $0xf,%ebx
  10049d:	7f 71                	jg     100510 <add_irq_handle+0x80>
  10049f:	a1 00 40 12 00       	mov    0x124000,%eax
  1004a4:	83 f8 20             	cmp    $0x20,%eax
  1004a7:	7e 2c                	jle    1004d5 <add_irq_handle+0x45>
  1004a9:	83 ec 0c             	sub    $0xc,%esp
  1004ac:	68 5e 15 10 00       	push   $0x10155e
  1004b1:	68 ad 16 10 00       	push   $0x1016ad
  1004b6:	6a 16                	push   $0x16
  1004b8:	68 42 15 10 00       	push   $0x101542
  1004bd:	68 b4 13 10 00       	push   $0x1013b4
  1004c2:	e8 39 09 00 00       	call   100e00 <printk>
  1004c7:	b8 01 00 00 00       	mov    $0x1,%eax
  1004cc:	d6                   	(bad)  
  1004cd:	a1 00 40 12 00       	mov    0x124000,%eax
  1004d2:	83 c4 20             	add    $0x20,%esp
  1004d5:	8d 50 01             	lea    0x1(%eax),%edx
  1004d8:	89 15 00 40 12 00    	mov    %edx,0x124000
  1004de:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004e1:	89 14 c5 80 40 12 00 	mov    %edx,0x124080(,%eax,8)
  1004e8:	8b 14 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%edx
  1004ef:	89 14 c5 84 40 12 00 	mov    %edx,0x124084(,%eax,8)
  1004f6:	8d 04 c5 80 40 12 00 	lea    0x124080(,%eax,8),%eax
  1004fd:	89 04 9d 40 40 12 00 	mov    %eax,0x124040(,%ebx,4)
  100504:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100507:	c9                   	leave  
  100508:	c3                   	ret    
  100509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100510:	83 ec 0c             	sub    $0xc,%esp
  100513:	68 2f 15 10 00       	push   $0x10152f
  100518:	68 ad 16 10 00       	push   $0x1016ad
  10051d:	6a 15                	push   $0x15
  10051f:	68 42 15 10 00       	push   $0x101542
  100524:	68 b4 13 10 00       	push   $0x1013b4
  100529:	e8 d2 08 00 00       	call   100e00 <printk>
  10052e:	b8 01 00 00 00       	mov    $0x1,%eax
  100533:	d6                   	(bad)  
  100534:	83 c4 20             	add    $0x20,%esp
  100537:	e9 63 ff ff ff       	jmp    10049f <add_irq_handle+0xf>
  10053c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100540 <irq_handle>:
  100540:	55                   	push   %ebp
  100541:	89 e5                	mov    %esp,%ebp
  100543:	53                   	push   %ebx
  100544:	83 ec 04             	sub    $0x4,%esp
  100547:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10054a:	68 a2 16 10 00       	push   $0x1016a2
  10054f:	6a 24                	push   $0x24
  100551:	68 42 15 10 00       	push   $0x101542
  100556:	68 94 15 10 00       	push   $0x101594
  10055b:	e8 a0 08 00 00       	call   100e00 <printk>
  100560:	b8 01 00 00 00       	mov    $0x1,%eax
  100565:	d6                   	(bad)  
  100566:	8b 43 30             	mov    0x30(%ebx),%eax
  100569:	83 c4 10             	add    $0x10,%esp
  10056c:	85 c0                	test   %eax,%eax
  10056e:	0f 88 9c 00 00 00    	js     100610 <irq_handle+0xd0>
  100574:	3d 80 00 00 00       	cmp    $0x80,%eax
  100579:	0f 84 b9 00 00 00    	je     100638 <irq_handle+0xf8>
  10057f:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  100584:	7e 5a                	jle    1005e0 <irq_handle+0xa0>
  100586:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
  10058c:	83 fb 0f             	cmp    $0xf,%ebx
  10058f:	7f 1f                	jg     1005b0 <irq_handle+0x70>
  100591:	8b 1c 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%ebx
  100598:	85 db                	test   %ebx,%ebx
  10059a:	74 0d                	je     1005a9 <irq_handle+0x69>
  10059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005a0:	ff 13                	call   *(%ebx)
  1005a2:	8b 5b 04             	mov    0x4(%ebx),%ebx
  1005a5:	85 db                	test   %ebx,%ebx
  1005a7:	75 f7                	jne    1005a0 <irq_handle+0x60>
  1005a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ac:	c9                   	leave  
  1005ad:	c3                   	ret    
  1005ae:	66 90                	xchg   %ax,%ax
  1005b0:	83 ec 0c             	sub    $0xc,%esp
  1005b3:	68 7c 15 10 00       	push   $0x10157c
  1005b8:	68 a2 16 10 00       	push   $0x1016a2
  1005bd:	6a 30                	push   $0x30
  1005bf:	68 42 15 10 00       	push   $0x101542
  1005c4:	68 b4 13 10 00       	push   $0x1013b4
  1005c9:	e8 32 08 00 00       	call   100e00 <printk>
  1005ce:	b8 01 00 00 00       	mov    $0x1,%eax
  1005d3:	d6                   	(bad)  
  1005d4:	83 c4 20             	add    $0x20,%esp
  1005d7:	eb b8                	jmp    100591 <irq_handle+0x51>
  1005d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1005e0:	83 ec 08             	sub    $0x8,%esp
  1005e3:	ff 73 0c             	pushl  0xc(%ebx)
  1005e6:	50                   	push   %eax
  1005e7:	68 a2 16 10 00       	push   $0x1016a2
  1005ec:	6a 2d                	push   $0x2d
  1005ee:	68 42 15 10 00       	push   $0x101542
  1005f3:	68 48 16 10 00       	push   $0x101648
  1005f8:	e8 03 08 00 00       	call   100e00 <printk>
  1005fd:	b8 01 00 00 00       	mov    $0x1,%eax
  100602:	d6                   	(bad)  
  100603:	83 c4 20             	add    $0x20,%esp
  100606:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100609:	c9                   	leave  
  10060a:	c3                   	ret    
  10060b:	90                   	nop
  10060c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100610:	68 a2 16 10 00       	push   $0x1016a2
  100615:	6a 29                	push   $0x29
  100617:	68 42 15 10 00       	push   $0x101542
  10061c:	68 fc 15 10 00       	push   $0x1015fc
  100621:	e8 da 07 00 00       	call   100e00 <printk>
  100626:	b8 01 00 00 00       	mov    $0x1,%eax
  10062b:	d6                   	(bad)  
  10062c:	83 c4 10             	add    $0x10,%esp
  10062f:	e9 75 ff ff ff       	jmp    1005a9 <irq_handle+0x69>
  100634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100638:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10063b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10063e:	c9                   	leave  
  10063f:	e9 ec fd ff ff       	jmp    100430 <do_syscall>
  100644:	66 90                	xchg   %ax,%ax
  100646:	66 90                	xchg   %ax,%ax
  100648:	66 90                	xchg   %ax,%ax
  10064a:	66 90                	xchg   %ax,%ax
  10064c:	66 90                	xchg   %ax,%ax
  10064e:	66 90                	xchg   %ax,%ax

00100650 <init_i8259>:
  100650:	55                   	push   %ebp
  100651:	ba 21 00 00 00       	mov    $0x21,%edx
  100656:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10065b:	89 e5                	mov    %esp,%ebp
  10065d:	ee                   	out    %al,(%dx)
  10065e:	b2 a1                	mov    $0xa1,%dl
  100660:	ee                   	out    %al,(%dx)
  100661:	b8 11 00 00 00       	mov    $0x11,%eax
  100666:	b2 20                	mov    $0x20,%dl
  100668:	ee                   	out    %al,(%dx)
  100669:	b8 20 00 00 00       	mov    $0x20,%eax
  10066e:	b2 21                	mov    $0x21,%dl
  100670:	ee                   	out    %al,(%dx)
  100671:	b8 04 00 00 00       	mov    $0x4,%eax
  100676:	ee                   	out    %al,(%dx)
  100677:	b8 03 00 00 00       	mov    $0x3,%eax
  10067c:	ee                   	out    %al,(%dx)
  10067d:	b8 11 00 00 00       	mov    $0x11,%eax
  100682:	b2 a0                	mov    $0xa0,%dl
  100684:	ee                   	out    %al,(%dx)
  100685:	b8 28 00 00 00       	mov    $0x28,%eax
  10068a:	b2 a1                	mov    $0xa1,%dl
  10068c:	ee                   	out    %al,(%dx)
  10068d:	b8 02 00 00 00       	mov    $0x2,%eax
  100692:	ee                   	out    %al,(%dx)
  100693:	b8 03 00 00 00       	mov    $0x3,%eax
  100698:	ee                   	out    %al,(%dx)
  100699:	b8 68 00 00 00       	mov    $0x68,%eax
  10069e:	b2 20                	mov    $0x20,%dl
  1006a0:	ee                   	out    %al,(%dx)
  1006a1:	b8 0a 00 00 00       	mov    $0xa,%eax
  1006a6:	ee                   	out    %al,(%dx)
  1006a7:	b8 68 00 00 00       	mov    $0x68,%eax
  1006ac:	b2 a0                	mov    $0xa0,%dl
  1006ae:	ee                   	out    %al,(%dx)
  1006af:	b8 0a 00 00 00       	mov    $0xa,%eax
  1006b4:	ee                   	out    %al,(%dx)
  1006b5:	5d                   	pop    %ebp
  1006b6:	c3                   	ret    
  1006b7:	66 90                	xchg   %ax,%ax
  1006b9:	66 90                	xchg   %ax,%ax
  1006bb:	66 90                	xchg   %ax,%ax
  1006bd:	66 90                	xchg   %ax,%ax
  1006bf:	90                   	nop

001006c0 <init_idt>:
  1006c0:	55                   	push   %ebp
  1006c1:	ba 8f 03 10 00       	mov    $0x10038f,%edx
  1006c6:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  1006cb:	89 d1                	mov    %edx,%ecx
  1006cd:	c1 ea 10             	shr    $0x10,%edx
  1006d0:	89 e5                	mov    %esp,%ebp
  1006d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1006d8:	66 89 08             	mov    %cx,(%eax)
  1006db:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1006e1:	83 c0 08             	add    $0x8,%eax
  1006e4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
  1006e8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
  1006ec:	66 89 50 fe          	mov    %dx,-0x2(%eax)
  1006f0:	3d c0 49 12 00       	cmp    $0x1249c0,%eax
  1006f5:	75 e1                	jne    1006d8 <init_idt+0x18>
  1006f7:	b8 e4 02 10 00       	mov    $0x1002e4,%eax
  1006fc:	ba 08 00 00 00       	mov    $0x8,%edx
  100701:	b9 08 00 00 00       	mov    $0x8,%ecx
  100706:	66 a3 c0 41 12 00    	mov    %ax,0x1241c0
  10070c:	c1 e8 10             	shr    $0x10,%eax
  10070f:	66 89 15 c2 41 12 00 	mov    %dx,0x1241c2
  100716:	66 a3 c6 41 12 00    	mov    %ax,0x1241c6
  10071c:	b8 ed 02 10 00       	mov    $0x1002ed,%eax
  100721:	ba 08 00 00 00       	mov    $0x8,%edx
  100726:	66 a3 c8 41 12 00    	mov    %ax,0x1241c8
  10072c:	c1 e8 10             	shr    $0x10,%eax
  10072f:	66 89 0d ca 41 12 00 	mov    %cx,0x1241ca
  100736:	66 a3 ce 41 12 00    	mov    %ax,0x1241ce
  10073c:	b8 f6 02 10 00       	mov    $0x1002f6,%eax
  100741:	66 89 15 d2 41 12 00 	mov    %dx,0x1241d2
  100748:	66 a3 d0 41 12 00    	mov    %ax,0x1241d0
  10074e:	c1 e8 10             	shr    $0x10,%eax
  100751:	b9 08 00 00 00       	mov    $0x8,%ecx
  100756:	66 a3 d6 41 12 00    	mov    %ax,0x1241d6
  10075c:	b8 ff 02 10 00       	mov    $0x1002ff,%eax
  100761:	ba 08 00 00 00       	mov    $0x8,%edx
  100766:	66 a3 d8 41 12 00    	mov    %ax,0x1241d8
  10076c:	c1 e8 10             	shr    $0x10,%eax
  10076f:	66 89 0d da 41 12 00 	mov    %cx,0x1241da
  100776:	66 a3 de 41 12 00    	mov    %ax,0x1241de
  10077c:	b8 08 03 10 00       	mov    $0x100308,%eax
  100781:	66 89 15 e2 41 12 00 	mov    %dx,0x1241e2
  100788:	66 a3 e0 41 12 00    	mov    %ax,0x1241e0
  10078e:	c1 e8 10             	shr    $0x10,%eax
  100791:	b9 08 00 00 00       	mov    $0x8,%ecx
  100796:	66 a3 e6 41 12 00    	mov    %ax,0x1241e6
  10079c:	b8 11 03 10 00       	mov    $0x100311,%eax
  1007a1:	ba 08 00 00 00       	mov    $0x8,%edx
  1007a6:	66 a3 e8 41 12 00    	mov    %ax,0x1241e8
  1007ac:	c1 e8 10             	shr    $0x10,%eax
  1007af:	66 89 0d ea 41 12 00 	mov    %cx,0x1241ea
  1007b6:	66 a3 ee 41 12 00    	mov    %ax,0x1241ee
  1007bc:	b8 1a 03 10 00       	mov    $0x10031a,%eax
  1007c1:	66 89 15 f2 41 12 00 	mov    %dx,0x1241f2
  1007c8:	66 a3 f0 41 12 00    	mov    %ax,0x1241f0
  1007ce:	c1 e8 10             	shr    $0x10,%eax
  1007d1:	c6 05 c4 41 12 00 00 	movb   $0x0,0x1241c4
  1007d8:	c6 05 c5 41 12 00 8f 	movb   $0x8f,0x1241c5
  1007df:	c6 05 cc 41 12 00 00 	movb   $0x0,0x1241cc
  1007e6:	b9 08 00 00 00       	mov    $0x8,%ecx
  1007eb:	c6 05 cd 41 12 00 8f 	movb   $0x8f,0x1241cd
  1007f2:	c6 05 d4 41 12 00 00 	movb   $0x0,0x1241d4
  1007f9:	ba 08 00 00 00       	mov    $0x8,%edx
  1007fe:	c6 05 d5 41 12 00 8f 	movb   $0x8f,0x1241d5
  100805:	c6 05 dc 41 12 00 00 	movb   $0x0,0x1241dc
  10080c:	c6 05 dd 41 12 00 8f 	movb   $0x8f,0x1241dd
  100813:	c6 05 e4 41 12 00 00 	movb   $0x0,0x1241e4
  10081a:	c6 05 e5 41 12 00 8f 	movb   $0x8f,0x1241e5
  100821:	c6 05 ec 41 12 00 00 	movb   $0x0,0x1241ec
  100828:	c6 05 ed 41 12 00 8f 	movb   $0x8f,0x1241ed
  10082f:	c6 05 f4 41 12 00 00 	movb   $0x0,0x1241f4
  100836:	c6 05 f5 41 12 00 8f 	movb   $0x8f,0x1241f5
  10083d:	66 a3 f6 41 12 00    	mov    %ax,0x1241f6
  100843:	b8 23 03 10 00       	mov    $0x100323,%eax
  100848:	66 a3 f8 41 12 00    	mov    %ax,0x1241f8
  10084e:	c1 e8 10             	shr    $0x10,%eax
  100851:	66 89 0d fa 41 12 00 	mov    %cx,0x1241fa
  100858:	66 a3 fe 41 12 00    	mov    %ax,0x1241fe
  10085e:	b8 2c 03 10 00       	mov    $0x10032c,%eax
  100863:	b9 08 00 00 00       	mov    $0x8,%ecx
  100868:	66 a3 00 42 12 00    	mov    %ax,0x124200
  10086e:	c1 e8 10             	shr    $0x10,%eax
  100871:	66 89 15 02 42 12 00 	mov    %dx,0x124202
  100878:	66 a3 06 42 12 00    	mov    %ax,0x124206
  10087e:	b8 33 03 10 00       	mov    $0x100333,%eax
  100883:	66 89 0d 0a 42 12 00 	mov    %cx,0x12420a
  10088a:	66 a3 08 42 12 00    	mov    %ax,0x124208
  100890:	c1 e8 10             	shr    $0x10,%eax
  100893:	ba 08 00 00 00       	mov    $0x8,%edx
  100898:	66 a3 0e 42 12 00    	mov    %ax,0x12420e
  10089e:	b8 3c 03 10 00       	mov    $0x10033c,%eax
  1008a3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008a8:	66 a3 10 42 12 00    	mov    %ax,0x124210
  1008ae:	c1 e8 10             	shr    $0x10,%eax
  1008b1:	66 89 15 12 42 12 00 	mov    %dx,0x124212
  1008b8:	66 a3 16 42 12 00    	mov    %ax,0x124216
  1008be:	b8 43 03 10 00       	mov    $0x100343,%eax
  1008c3:	66 89 0d 1a 42 12 00 	mov    %cx,0x12421a
  1008ca:	66 a3 18 42 12 00    	mov    %ax,0x124218
  1008d0:	c1 e8 10             	shr    $0x10,%eax
  1008d3:	ba 08 00 00 00       	mov    $0x8,%edx
  1008d8:	66 a3 1e 42 12 00    	mov    %ax,0x12421e
  1008de:	b8 4a 03 10 00       	mov    $0x10034a,%eax
  1008e3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008e8:	66 a3 20 42 12 00    	mov    %ax,0x124220
  1008ee:	c1 e8 10             	shr    $0x10,%eax
  1008f1:	66 89 15 22 42 12 00 	mov    %dx,0x124222
  1008f8:	66 a3 26 42 12 00    	mov    %ax,0x124226
  1008fe:	b8 51 03 10 00       	mov    $0x100351,%eax
  100903:	66 89 0d 2a 42 12 00 	mov    %cx,0x12422a
  10090a:	66 a3 28 42 12 00    	mov    %ax,0x124228
  100910:	c1 e8 10             	shr    $0x10,%eax
  100913:	c6 05 fc 41 12 00 00 	movb   $0x0,0x1241fc
  10091a:	c6 05 fd 41 12 00 8f 	movb   $0x8f,0x1241fd
  100921:	c6 05 04 42 12 00 00 	movb   $0x0,0x124204
  100928:	ba 08 00 00 00       	mov    $0x8,%edx
  10092d:	c6 05 05 42 12 00 8f 	movb   $0x8f,0x124205
  100934:	c6 05 0c 42 12 00 00 	movb   $0x0,0x12420c
  10093b:	b9 08 00 00 00       	mov    $0x8,%ecx
  100940:	c6 05 0d 42 12 00 8f 	movb   $0x8f,0x12420d
  100947:	c6 05 14 42 12 00 00 	movb   $0x0,0x124214
  10094e:	c6 05 15 42 12 00 8f 	movb   $0x8f,0x124215
  100955:	c6 05 1c 42 12 00 00 	movb   $0x0,0x12421c
  10095c:	c6 05 1d 42 12 00 8f 	movb   $0x8f,0x12421d
  100963:	c6 05 24 42 12 00 00 	movb   $0x0,0x124224
  10096a:	c6 05 25 42 12 00 8f 	movb   $0x8f,0x124225
  100971:	c6 05 2c 42 12 00 00 	movb   $0x0,0x12422c
  100978:	66 a3 2e 42 12 00    	mov    %ax,0x12422e
  10097e:	b8 58 03 10 00       	mov    $0x100358,%eax
  100983:	66 89 15 32 42 12 00 	mov    %dx,0x124232
  10098a:	66 a3 30 42 12 00    	mov    %ax,0x124230
  100990:	c1 e8 10             	shr    $0x10,%eax
  100993:	66 89 0d c2 45 12 00 	mov    %cx,0x1245c2
  10099a:	66 a3 36 42 12 00    	mov    %ax,0x124236
  1009a0:	b8 5f 03 10 00       	mov    $0x10035f,%eax
  1009a5:	ba 08 00 00 00       	mov    $0x8,%edx
  1009aa:	66 a3 c0 45 12 00    	mov    %ax,0x1245c0
  1009b0:	c1 e8 10             	shr    $0x10,%eax
  1009b3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1009b8:	66 a3 c6 45 12 00    	mov    %ax,0x1245c6
  1009be:	b8 6b 03 10 00       	mov    $0x10036b,%eax
  1009c3:	c6 05 2d 42 12 00 8f 	movb   $0x8f,0x12422d
  1009ca:	66 a3 c0 42 12 00    	mov    %ax,0x1242c0
  1009d0:	c1 e8 10             	shr    $0x10,%eax
  1009d3:	c6 05 34 42 12 00 00 	movb   $0x0,0x124234
  1009da:	66 a3 c6 42 12 00    	mov    %ax,0x1242c6
  1009e0:	b8 83 03 10 00       	mov    $0x100383,%eax
  1009e5:	c6 05 35 42 12 00 8f 	movb   $0x8f,0x124235
  1009ec:	66 a3 30 43 12 00    	mov    %ax,0x124330
  1009f2:	c1 e8 10             	shr    $0x10,%eax
  1009f5:	c6 05 c4 45 12 00 00 	movb   $0x0,0x1245c4
  1009fc:	66 a3 36 43 12 00    	mov    %ax,0x124336
  100a02:	b8 ff 07 00 00       	mov    $0x7ff,%eax
  100a07:	c6 05 c5 45 12 00 ef 	movb   $0xef,0x1245c5
  100a0e:	66 a3 80 41 12 00    	mov    %ax,0x124180
  100a14:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  100a19:	66 89 15 c2 42 12 00 	mov    %dx,0x1242c2
  100a20:	66 a3 82 41 12 00    	mov    %ax,0x124182
  100a26:	c1 e8 10             	shr    $0x10,%eax
  100a29:	c6 05 c4 42 12 00 00 	movb   $0x0,0x1242c4
  100a30:	66 a3 84 41 12 00    	mov    %ax,0x124184
  100a36:	c6 05 c5 42 12 00 8e 	movb   $0x8e,0x1242c5
  100a3d:	b8 80 41 12 00       	mov    $0x124180,%eax
  100a42:	66 89 0d 32 43 12 00 	mov    %cx,0x124332
  100a49:	c6 05 34 43 12 00 00 	movb   $0x0,0x124334
  100a50:	c6 05 35 43 12 00 8e 	movb   $0x8e,0x124335
  100a57:	0f 01 18             	lidtl  (%eax)
  100a5a:	5d                   	pop    %ebp
  100a5b:	c3                   	ret    
  100a5c:	66 90                	xchg   %ax,%ax
  100a5e:	66 90                	xchg   %ax,%ax

00100a60 <create_video_mapping>:
  100a60:	55                   	push   %ebp
  100a61:	89 e5                	mov    %esp,%ebp
  100a63:	83 ec 08             	sub    $0x8,%esp
  100a66:	68 48 17 10 00       	push   $0x101748
  100a6b:	6a 11                	push   $0x11
  100a6d:	68 bc 16 10 00       	push   $0x1016bc
  100a72:	68 e4 16 10 00       	push   $0x1016e4
  100a77:	e8 84 03 00 00       	call   100e00 <printk>
  100a7c:	b8 01 00 00 00       	mov    $0x1,%eax
  100a81:	d6                   	(bad)  
  100a82:	83 c4 10             	add    $0x10,%esp
  100a85:	c9                   	leave  
  100a86:	c3                   	ret    
  100a87:	89 f6                	mov    %esi,%esi
  100a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100a90 <video_mapping_write_test>:
  100a90:	55                   	push   %ebp
  100a91:	31 c0                	xor    %eax,%eax
  100a93:	89 e5                	mov    %esp,%ebp
  100a95:	8d 76 00             	lea    0x0(%esi),%esi
  100a98:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
  100a9f:	83 c0 01             	add    $0x1,%eax
  100aa2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
  100aa7:	75 ef                	jne    100a98 <video_mapping_write_test+0x8>
  100aa9:	5d                   	pop    %ebp
  100aaa:	c3                   	ret    
  100aab:	90                   	nop
  100aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100ab0 <video_mapping_read_test>:
  100ab0:	55                   	push   %ebp
  100ab1:	89 e5                	mov    %esp,%ebp
  100ab3:	56                   	push   %esi
  100ab4:	be 01 00 00 00       	mov    $0x1,%esi
  100ab9:	53                   	push   %ebx
  100aba:	31 db                	xor    %ebx,%ebx
  100abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ac0:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
  100ac7:	74 24                	je     100aed <video_mapping_read_test+0x3d>
  100ac9:	83 ec 0c             	sub    $0xc,%esp
  100acc:	68 d5 16 10 00       	push   $0x1016d5
  100ad1:	68 30 17 10 00       	push   $0x101730
  100ad6:	6a 20                	push   $0x20
  100ad8:	68 bc 16 10 00       	push   $0x1016bc
  100add:	68 b4 13 10 00       	push   $0x1013b4
  100ae2:	e8 19 03 00 00       	call   100e00 <printk>
  100ae7:	89 f0                	mov    %esi,%eax
  100ae9:	d6                   	(bad)  
  100aea:	83 c4 20             	add    $0x20,%esp
  100aed:	83 c3 01             	add    $0x1,%ebx
  100af0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
  100af6:	75 c8                	jne    100ac0 <video_mapping_read_test+0x10>
  100af8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100afb:	5b                   	pop    %ebx
  100afc:	5e                   	pop    %esi
  100afd:	5d                   	pop    %ebp
  100afe:	c3                   	ret    
  100aff:	90                   	nop

00100b00 <video_mapping_clear>:
  100b00:	55                   	push   %ebp
  100b01:	89 e5                	mov    %esp,%ebp
  100b03:	83 ec 0c             	sub    $0xc,%esp
  100b06:	68 00 fa 00 00       	push   $0xfa00
  100b0b:	6a 00                	push   $0x0
  100b0d:	68 00 00 0a 00       	push   $0xa0000
  100b12:	e8 e1 07 00 00       	call   1012f8 <memset>
  100b17:	83 c4 10             	add    $0x10,%esp
  100b1a:	c9                   	leave  
  100b1b:	c3                   	ret    
  100b1c:	66 90                	xchg   %ax,%ax
  100b1e:	66 90                	xchg   %ax,%ax

00100b20 <get_updir>:
  100b20:	55                   	push   %ebp
  100b21:	b8 00 60 12 00       	mov    $0x126000,%eax
  100b26:	89 e5                	mov    %esp,%ebp
  100b28:	5d                   	pop    %ebp
  100b29:	c3                   	ret    
  100b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b30 <get_ucr3>:
  100b30:	55                   	push   %ebp
  100b31:	a1 04 50 12 00       	mov    0x125004,%eax
  100b36:	89 e5                	mov    %esp,%ebp
  100b38:	5d                   	pop    %ebp
  100b39:	c3                   	ret    
  100b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b40 <mm_brk>:
  100b40:	55                   	push   %ebp
  100b41:	89 e5                	mov    %esp,%ebp
  100b43:	53                   	push   %ebx
  100b44:	83 ec 04             	sub    $0x4,%esp
  100b47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b4a:	a1 00 50 12 00       	mov    0x125000,%eax
  100b4f:	39 d8                	cmp    %ebx,%eax
  100b51:	73 11                	jae    100b64 <mm_brk+0x24>
  100b53:	89 da                	mov    %ebx,%edx
  100b55:	83 ec 08             	sub    $0x8,%esp
  100b58:	29 c2                	sub    %eax,%edx
  100b5a:	52                   	push   %edx
  100b5b:	50                   	push   %eax
  100b5c:	e8 ef f4 ff ff       	call   100050 <mm_malloc>
  100b61:	83 c4 10             	add    $0x10,%esp
  100b64:	89 1d 00 50 12 00    	mov    %ebx,0x125000
  100b6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b6d:	c9                   	leave  
  100b6e:	c3                   	ret    
  100b6f:	90                   	nop

00100b70 <init_mm>:
  100b70:	55                   	push   %ebp
  100b71:	89 e5                	mov    %esp,%ebp
  100b73:	53                   	push   %ebx
  100b74:	83 ec 04             	sub    $0x4,%esp
  100b77:	e8 44 00 00 00       	call   100bc0 <get_kpdir>
  100b7c:	83 ec 04             	sub    $0x4,%esp
  100b7f:	89 c3                	mov    %eax,%ebx
  100b81:	68 00 10 00 00       	push   $0x1000
  100b86:	6a 00                	push   $0x0
  100b88:	68 00 60 12 00       	push   $0x126000
  100b8d:	e8 66 07 00 00       	call   1012f8 <memset>
  100b92:	83 c4 0c             	add    $0xc,%esp
  100b95:	68 80 00 00 00       	push   $0x80
  100b9a:	53                   	push   %ebx
  100b9b:	68 00 60 12 00       	push   $0x126000
  100ba0:	e8 0b 07 00 00       	call   1012b0 <memcpy>
  100ba5:	b8 00 60 12 00       	mov    $0x126000,%eax
  100baa:	83 c4 10             	add    $0x10,%esp
  100bad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bb0:	25 00 fc ff ff       	and    $0xfffffc00,%eax
  100bb5:	a3 04 50 12 00       	mov    %eax,0x125004
  100bba:	c9                   	leave  
  100bbb:	c3                   	ret    
  100bbc:	66 90                	xchg   %ax,%ax
  100bbe:	66 90                	xchg   %ax,%ax

00100bc0 <get_kpdir>:
  100bc0:	55                   	push   %ebp
  100bc1:	b8 00 80 14 00       	mov    $0x148000,%eax
  100bc6:	89 e5                	mov    %esp,%ebp
  100bc8:	5d                   	pop    %ebp
  100bc9:	c3                   	ret    
  100bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100bd0 <init_page>:
  100bd0:	55                   	push   %ebp
  100bd1:	89 e5                	mov    %esp,%ebp
  100bd3:	57                   	push   %edi
  100bd4:	83 ec 08             	sub    $0x8,%esp
  100bd7:	68 00 10 00 00       	push   $0x1000
  100bdc:	6a 00                	push   $0x0
  100bde:	68 00 80 14 00       	push   $0x148000
  100be3:	e8 10 07 00 00       	call   1012f8 <memset>
  100be8:	83 c4 10             	add    $0x10,%esp
  100beb:	b9 00 80 14 00       	mov    $0x148000,%ecx
  100bf0:	b8 00 80 12 00       	mov    $0x128000,%eax
  100bf5:	8d 76 00             	lea    0x0(%esi),%esi
  100bf8:	89 c2                	mov    %eax,%edx
  100bfa:	05 00 10 00 00       	add    $0x1000,%eax
  100bff:	83 c1 04             	add    $0x4,%ecx
  100c02:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  100c08:	83 ca 07             	or     $0x7,%edx
  100c0b:	89 51 fc             	mov    %edx,-0x4(%ecx)
  100c0e:	3d 00 80 14 00       	cmp    $0x148000,%eax
  100c13:	75 e3                	jne    100bf8 <init_page+0x28>
  100c15:	bf fc 7f 14 00       	mov    $0x147ffc,%edi
  100c1a:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
  100c1f:	fd                   	std    
  100c20:	ab                   	stos   %eax,%es:(%edi)
  100c21:	2d 00 10 00 00       	sub    $0x1000,%eax
  100c26:	7d f8                	jge    100c20 <init_page+0x50>
  100c28:	b8 00 80 14 00       	mov    $0x148000,%eax
  100c2d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100c32:	0f 22 d8             	mov    %eax,%cr3
  100c35:	0f 20 c0             	mov    %cr0,%eax
  100c38:	0d 00 00 00 80       	or     $0x80000000,%eax
  100c3d:	0f 22 c0             	mov    %eax,%cr0
  100c40:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100c43:	c9                   	leave  
  100c44:	c3                   	ret    
  100c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100c50 <init_segment>:
  100c50:	55                   	push   %ebp
  100c51:	89 e5                	mov    %esp,%ebp
  100c53:	83 ec 0c             	sub    $0xc,%esp
  100c56:	6a 18                	push   $0x18
  100c58:	6a 00                	push   $0x0
  100c5a:	68 08 70 12 00       	push   $0x127008
  100c5f:	e8 94 06 00 00       	call   1012f8 <memset>
  100c64:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c69:	31 c9                	xor    %ecx,%ecx
  100c6b:	b8 08 70 12 00       	mov    $0x127008,%eax
  100c70:	66 89 15 10 70 12 00 	mov    %dx,0x127010
  100c77:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c7c:	66 89 0d 12 70 12 00 	mov    %cx,0x127012
  100c83:	66 89 15 18 70 12 00 	mov    %dx,0x127018
  100c8a:	ba 17 00 00 00       	mov    $0x17,%edx
  100c8f:	31 c9                	xor    %ecx,%ecx
  100c91:	66 89 15 00 70 12 00 	mov    %dx,0x127000
  100c98:	66 a3 02 70 12 00    	mov    %ax,0x127002
  100c9e:	c1 e8 10             	shr    $0x10,%eax
  100ca1:	66 a3 04 70 12 00    	mov    %ax,0x127004
  100ca7:	c6 05 14 70 12 00 00 	movb   $0x0,0x127014
  100cae:	b8 00 70 12 00       	mov    $0x127000,%eax
  100cb3:	c6 05 15 70 12 00 9a 	movb   $0x9a,0x127015
  100cba:	c6 05 16 70 12 00 cf 	movb   $0xcf,0x127016
  100cc1:	c6 05 17 70 12 00 00 	movb   $0x0,0x127017
  100cc8:	66 89 0d 1a 70 12 00 	mov    %cx,0x12701a
  100ccf:	c6 05 1c 70 12 00 00 	movb   $0x0,0x12701c
  100cd6:	c6 05 1d 70 12 00 92 	movb   $0x92,0x12701d
  100cdd:	c6 05 1e 70 12 00 cf 	movb   $0xcf,0x12701e
  100ce4:	c6 05 1f 70 12 00 00 	movb   $0x0,0x12701f
  100ceb:	0f 01 10             	lgdtl  (%eax)
  100cee:	83 c4 10             	add    $0x10,%esp
  100cf1:	c9                   	leave  
  100cf2:	c3                   	ret    
  100cf3:	66 90                	xchg   %ax,%ax
  100cf5:	66 90                	xchg   %ax,%ax
  100cf7:	66 90                	xchg   %ax,%ax
  100cf9:	66 90                	xchg   %ax,%ax
  100cfb:	66 90                	xchg   %ax,%ax
  100cfd:	66 90                	xchg   %ax,%ax
  100cff:	90                   	nop

00100d00 <loader>:
  100d00:	55                   	push   %ebp
  100d01:	89 e5                	mov    %esp,%ebp
  100d03:	56                   	push   %esi
  100d04:	53                   	push   %ebx
  100d05:	8d 9d f8 ef ff ff    	lea    -0x1008(%ebp),%ebx
  100d0b:	81 ec 14 10 00 00    	sub    $0x1014,%esp
  100d11:	68 00 10 00 00       	push   $0x1000
  100d16:	6a 00                	push   $0x0
  100d18:	53                   	push   %ebx
  100d19:	e8 52 01 00 00       	call   100e70 <ramdisk_read>
  100d1e:	83 c4 10             	add    $0x10,%esp
  100d21:	81 bd f8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1008(%ebp)
  100d28:	45 4c 46 
  100d2b:	74 06                	je     100d33 <loader+0x33>
  100d2d:	b8 01 00 00 00       	mov    $0x1,%eax
  100d32:	d6                   	(bad)  
  100d33:	8b 95 14 f0 ff ff    	mov    -0xfec(%ebp),%edx
  100d39:	83 fa 34             	cmp    $0x34,%edx
  100d3c:	74 06                	je     100d44 <loader+0x44>
  100d3e:	b8 01 00 00 00       	mov    $0x1,%eax
  100d43:	d6                   	(bad)  
  100d44:	31 f6                	xor    %esi,%esi
  100d46:	66 83 bd 24 f0 ff ff 	cmpw   $0x0,-0xfdc(%ebp)
  100d4d:	00 
  100d4e:	8d 5c 13 10          	lea    0x10(%ebx,%edx,1),%ebx
  100d52:	75 1d                	jne    100d71 <loader+0x71>
  100d54:	eb 52                	jmp    100da8 <loader+0xa8>
  100d56:	8d 76 00             	lea    0x0(%esi),%esi
  100d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100d60:	0f b7 85 24 f0 ff ff 	movzwl -0xfdc(%ebp),%eax
  100d67:	83 c6 01             	add    $0x1,%esi
  100d6a:	83 c3 20             	add    $0x20,%ebx
  100d6d:	39 f0                	cmp    %esi,%eax
  100d6f:	7e 37                	jle    100da8 <loader+0xa8>
  100d71:	83 7b f0 01          	cmpl   $0x1,-0x10(%ebx)
  100d75:	75 e9                	jne    100d60 <loader+0x60>
  100d77:	83 ec 04             	sub    $0x4,%esp
  100d7a:	ff 33                	pushl  (%ebx)
  100d7c:	ff 73 f4             	pushl  -0xc(%ebx)
  100d7f:	ff 73 f8             	pushl  -0x8(%ebx)
  100d82:	e8 e9 00 00 00       	call   100e70 <ramdisk_read>
  100d87:	8b 03                	mov    (%ebx),%eax
  100d89:	8b 53 04             	mov    0x4(%ebx),%edx
  100d8c:	83 c4 0c             	add    $0xc,%esp
  100d8f:	29 c2                	sub    %eax,%edx
  100d91:	52                   	push   %edx
  100d92:	6a 00                	push   $0x0
  100d94:	03 43 f4             	add    -0xc(%ebx),%eax
  100d97:	03 43 f8             	add    -0x8(%ebx),%eax
  100d9a:	50                   	push   %eax
  100d9b:	e8 58 05 00 00       	call   1012f8 <memset>
  100da0:	83 c4 10             	add    $0x10,%esp
  100da3:	eb bb                	jmp    100d60 <loader+0x60>
  100da5:	8d 76 00             	lea    0x0(%esi),%esi
  100da8:	8b 85 10 f0 ff ff    	mov    -0xff0(%ebp),%eax
  100dae:	89 85 f4 ef ff ff    	mov    %eax,-0x100c(%ebp)
  100db4:	8b 85 f4 ef ff ff    	mov    -0x100c(%ebp),%eax
  100dba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dbd:	5b                   	pop    %ebx
  100dbe:	5e                   	pop    %esi
  100dbf:	5d                   	pop    %ebp
  100dc0:	c3                   	ret    
  100dc1:	66 90                	xchg   %ax,%ax
  100dc3:	66 90                	xchg   %ax,%ax
  100dc5:	66 90                	xchg   %ax,%ax
  100dc7:	66 90                	xchg   %ax,%ax
  100dc9:	66 90                	xchg   %ax,%ax
  100dcb:	66 90                	xchg   %ax,%ax
  100dcd:	66 90                	xchg   %ax,%ax
  100dcf:	90                   	nop

00100dd0 <sbrk>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	83 ec 08             	sub    $0x8,%esp
  100dd6:	68 73 17 10 00       	push   $0x101773
  100ddb:	6a 08                	push   $0x8
  100ddd:	68 5d 17 10 00       	push   $0x10175d
  100de2:	68 54 14 10 00       	push   $0x101454
  100de7:	e8 14 00 00 00       	call   100e00 <printk>
  100dec:	b8 01 00 00 00       	mov    $0x1,%eax
  100df1:	d6                   	(bad)  
  100df2:	30 c0                	xor    %al,%al
  100df4:	c9                   	leave  
  100df5:	c3                   	ret    
  100df6:	66 90                	xchg   %ax,%ax
  100df8:	66 90                	xchg   %ax,%ax
  100dfa:	66 90                	xchg   %ax,%ax
  100dfc:	66 90                	xchg   %ax,%ax
  100dfe:	66 90                	xchg   %ax,%ax

00100e00 <printk>:
  100e00:	55                   	push   %ebp
  100e01:	89 e5                	mov    %esp,%ebp
  100e03:	5d                   	pop    %ebp
  100e04:	c3                   	ret    
  100e05:	66 90                	xchg   %ax,%ax
  100e07:	66 90                	xchg   %ax,%ax
  100e09:	66 90                	xchg   %ax,%ax
  100e0b:	66 90                	xchg   %ax,%ax
  100e0d:	66 90                	xchg   %ax,%ax
  100e0f:	90                   	nop

00100e10 <init_serial>:
  100e10:	55                   	push   %ebp
  100e11:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100e16:	31 c0                	xor    %eax,%eax
  100e18:	89 e5                	mov    %esp,%ebp
  100e1a:	ee                   	out    %al,(%dx)
  100e1b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  100e20:	b2 fb                	mov    $0xfb,%dl
  100e22:	ee                   	out    %al,(%dx)
  100e23:	b8 01 00 00 00       	mov    $0x1,%eax
  100e28:	b2 f8                	mov    $0xf8,%dl
  100e2a:	ee                   	out    %al,(%dx)
  100e2b:	31 c0                	xor    %eax,%eax
  100e2d:	b2 f9                	mov    $0xf9,%dl
  100e2f:	ee                   	out    %al,(%dx)
  100e30:	b8 03 00 00 00       	mov    $0x3,%eax
  100e35:	b2 fb                	mov    $0xfb,%dl
  100e37:	ee                   	out    %al,(%dx)
  100e38:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  100e3d:	b2 fa                	mov    $0xfa,%dl
  100e3f:	ee                   	out    %al,(%dx)
  100e40:	b8 0b 00 00 00       	mov    $0xb,%eax
  100e45:	b2 fc                	mov    $0xfc,%dl
  100e47:	ee                   	out    %al,(%dx)
  100e48:	5d                   	pop    %ebp
  100e49:	c3                   	ret    
  100e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100e50 <serial_printc>:
  100e50:	55                   	push   %ebp
  100e51:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100e56:	89 e5                	mov    %esp,%ebp
  100e58:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e5b:	90                   	nop
  100e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100e60:	ec                   	in     (%dx),%al
  100e61:	a8 20                	test   $0x20,%al
  100e63:	74 fb                	je     100e60 <serial_printc+0x10>
  100e65:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100e6a:	89 c8                	mov    %ecx,%eax
  100e6c:	ee                   	out    %al,(%dx)
  100e6d:	5d                   	pop    %ebp
  100e6e:	c3                   	ret    
  100e6f:	90                   	nop

00100e70 <ramdisk_read>:
  100e70:	55                   	push   %ebp
  100e71:	89 e5                	mov    %esp,%ebp
  100e73:	53                   	push   %ebx
  100e74:	8b 55 0c             	mov    0xc(%ebp),%edx
  100e77:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100e7a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100e7d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  100e80:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
  100e85:	76 06                	jbe    100e8d <ramdisk_read+0x1d>
  100e87:	b8 01 00 00 00       	mov    $0x1,%eax
  100e8c:	d6                   	(bad)  
  100e8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100e90:	89 4d 10             	mov    %ecx,0x10(%ebp)
  100e93:	89 55 0c             	mov    %edx,0xc(%ebp)
  100e96:	5b                   	pop    %ebx
  100e97:	5d                   	pop    %ebp
  100e98:	e9 13 04 00 00       	jmp    1012b0 <memcpy>
  100e9d:	8d 76 00             	lea    0x0(%esi),%esi

00100ea0 <ramdisk_write>:
  100ea0:	55                   	push   %ebp
  100ea1:	89 e5                	mov    %esp,%ebp
  100ea3:	53                   	push   %ebx
  100ea4:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ea7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100eaa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ead:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  100eb0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
  100eb5:	76 06                	jbe    100ebd <ramdisk_write+0x1d>
  100eb7:	b8 01 00 00 00       	mov    $0x1,%eax
  100ebc:	d6                   	(bad)  
  100ebd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100ec0:	89 4d 10             	mov    %ecx,0x10(%ebp)
  100ec3:	89 55 08             	mov    %edx,0x8(%ebp)
  100ec6:	5b                   	pop    %ebx
  100ec7:	5d                   	pop    %ebp
  100ec8:	e9 e3 03 00 00       	jmp    1012b0 <memcpy>
  100ecd:	66 90                	xchg   %ax,%ax
  100ecf:	90                   	nop

00100ed0 <ide_intr>:
  100ed0:	55                   	push   %ebp
  100ed1:	c7 05 04 90 14 00 01 	movl   $0x1,0x149004
  100ed8:	00 00 00 
  100edb:	89 e5                	mov    %esp,%ebp
  100edd:	5d                   	pop    %ebp
  100ede:	c3                   	ret    
  100edf:	90                   	nop

00100ee0 <ide_writeback>:
  100ee0:	a1 00 90 14 00       	mov    0x149000,%eax
  100ee5:	83 c0 01             	add    $0x1,%eax
  100ee8:	83 f8 64             	cmp    $0x64,%eax
  100eeb:	a3 00 90 14 00       	mov    %eax,0x149000
  100ef0:	74 06                	je     100ef8 <ide_writeback+0x18>
  100ef2:	c3                   	ret    
  100ef3:	90                   	nop
  100ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ef8:	55                   	push   %ebp
  100ef9:	89 e5                	mov    %esp,%ebp
  100efb:	83 ec 08             	sub    $0x8,%esp
  100efe:	e8 dd 01 00 00       	call   1010e0 <buf_writeback>
  100f03:	c7 05 00 90 14 00 00 	movl   $0x0,0x149000
  100f0a:	00 00 00 
  100f0d:	c9                   	leave  
  100f0e:	c3                   	ret    
  100f0f:	90                   	nop

00100f10 <ide_read>:
  100f10:	55                   	push   %ebp
  100f11:	89 e5                	mov    %esp,%ebp
  100f13:	57                   	push   %edi
  100f14:	56                   	push   %esi
  100f15:	53                   	push   %ebx
  100f16:	83 ec 0c             	sub    $0xc,%esp
  100f19:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f1c:	8b 45 10             	mov    0x10(%ebp),%eax
  100f1f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100f22:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100f25:	29 df                	sub    %ebx,%edi
  100f27:	85 c0                	test   %eax,%eax
  100f29:	74 1b                	je     100f46 <ide_read+0x36>
  100f2b:	90                   	nop
  100f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f30:	83 ec 0c             	sub    $0xc,%esp
  100f33:	53                   	push   %ebx
  100f34:	e8 07 02 00 00       	call   101140 <read_byte>
  100f39:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  100f3c:	83 c3 01             	add    $0x1,%ebx
  100f3f:	83 c4 10             	add    $0x10,%esp
  100f42:	39 f3                	cmp    %esi,%ebx
  100f44:	75 ea                	jne    100f30 <ide_read+0x20>
  100f46:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f49:	5b                   	pop    %ebx
  100f4a:	5e                   	pop    %esi
  100f4b:	5f                   	pop    %edi
  100f4c:	5d                   	pop    %ebp
  100f4d:	c3                   	ret    
  100f4e:	66 90                	xchg   %ax,%ax

00100f50 <ide_write>:
  100f50:	55                   	push   %ebp
  100f51:	89 e5                	mov    %esp,%ebp
  100f53:	57                   	push   %edi
  100f54:	56                   	push   %esi
  100f55:	53                   	push   %ebx
  100f56:	83 ec 0c             	sub    $0xc,%esp
  100f59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f5c:	8b 45 10             	mov    0x10(%ebp),%eax
  100f5f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100f62:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100f65:	29 df                	sub    %ebx,%edi
  100f67:	85 c0                	test   %eax,%eax
  100f69:	74 1d                	je     100f88 <ide_write+0x38>
  100f6b:	90                   	nop
  100f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f70:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  100f74:	83 ec 08             	sub    $0x8,%esp
  100f77:	50                   	push   %eax
  100f78:	53                   	push   %ebx
  100f79:	83 c3 01             	add    $0x1,%ebx
  100f7c:	e8 ef 01 00 00       	call   101170 <write_byte>
  100f81:	83 c4 10             	add    $0x10,%esp
  100f84:	39 f3                	cmp    %esi,%ebx
  100f86:	75 e8                	jne    100f70 <ide_write+0x20>
  100f88:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f8b:	5b                   	pop    %ebx
  100f8c:	5e                   	pop    %esi
  100f8d:	5f                   	pop    %edi
  100f8e:	5d                   	pop    %ebp
  100f8f:	c3                   	ret    

00100f90 <clear_ide_intr>:
  100f90:	55                   	push   %ebp
  100f91:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100f98:	00 00 00 
  100f9b:	89 e5                	mov    %esp,%ebp
  100f9d:	5d                   	pop    %ebp
  100f9e:	c3                   	ret    
  100f9f:	90                   	nop

00100fa0 <wait_ide_intr>:
  100fa0:	a1 04 90 14 00       	mov    0x149004,%eax
  100fa5:	55                   	push   %ebp
  100fa6:	89 e5                	mov    %esp,%ebp
  100fa8:	85 c0                	test   %eax,%eax
  100faa:	75 0e                	jne    100fba <wait_ide_intr+0x1a>
  100fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100fb0:	f4                   	hlt    
  100fb1:	a1 04 90 14 00       	mov    0x149004,%eax
  100fb6:	85 c0                	test   %eax,%eax
  100fb8:	74 f6                	je     100fb0 <wait_ide_intr+0x10>
  100fba:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100fc1:	00 00 00 
  100fc4:	5d                   	pop    %ebp
  100fc5:	c3                   	ret    
  100fc6:	8d 76 00             	lea    0x0(%esi),%esi
  100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100fd0 <init_ide>:
  100fd0:	55                   	push   %ebp
  100fd1:	89 e5                	mov    %esp,%ebp
  100fd3:	83 ec 08             	sub    $0x8,%esp
  100fd6:	e8 d5 00 00 00       	call   1010b0 <buf_init>
  100fdb:	83 ec 08             	sub    $0x8,%esp
  100fde:	68 e0 0e 10 00       	push   $0x100ee0
  100fe3:	6a 00                	push   $0x0
  100fe5:	e8 a6 f4 ff ff       	call   100490 <add_irq_handle>
  100fea:	58                   	pop    %eax
  100feb:	5a                   	pop    %edx
  100fec:	68 d0 0e 10 00       	push   $0x100ed0
  100ff1:	6a 0e                	push   $0xe
  100ff3:	e8 98 f4 ff ff       	call   100490 <add_irq_handle>
  100ff8:	83 c4 10             	add    $0x10,%esp
  100ffb:	c9                   	leave  
  100ffc:	c3                   	ret    
  100ffd:	66 90                	xchg   %ax,%ax
  100fff:	90                   	nop

00101000 <buf_fetch>:
  101000:	55                   	push   %ebp
  101001:	89 c2                	mov    %eax,%edx
  101003:	89 e5                	mov    %esp,%ebp
  101005:	57                   	push   %edi
  101006:	56                   	push   %esi
  101007:	53                   	push   %ebx
  101008:	89 c3                	mov    %eax,%ebx
  10100a:	83 e3 7f             	and    $0x7f,%ebx
  10100d:	89 d8                	mov    %ebx,%eax
  10100f:	83 ec 1c             	sub    $0x1c,%esp
  101012:	c1 e0 09             	shl    $0x9,%eax
  101015:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
  101018:	8d 81 40 90 14 00    	lea    0x149040(%ecx),%eax
  10101e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
  101022:	74 5c                	je     101080 <buf_fetch+0x80>
  101024:	89 d7                	mov    %edx,%edi
  101026:	89 da                	mov    %ebx,%edx
  101028:	c1 e2 09             	shl    $0x9,%edx
  10102b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  10102e:	8d 91 40 90 14 00    	lea    0x149040(%ecx),%edx
  101034:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
  10103a:	74 54                	je     101090 <buf_fetch+0x90>
  10103c:	8d 72 06             	lea    0x6(%edx),%esi
  10103f:	83 ec 08             	sub    $0x8,%esp
  101042:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101045:	57                   	push   %edi
  101046:	56                   	push   %esi
  101047:	e8 a4 01 00 00       	call   1011f0 <disk_do_read>
  10104c:	89 da                	mov    %ebx,%edx
  10104e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101051:	83 c4 10             	add    $0x10,%esp
  101054:	c1 e2 09             	shl    $0x9,%edx
  101057:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  10105a:	c6 81 44 90 14 00 01 	movb   $0x1,0x149044(%ecx)
  101061:	89 b9 40 90 14 00    	mov    %edi,0x149040(%ecx)
  101067:	c6 81 45 90 14 00 00 	movb   $0x0,0x149045(%ecx)
  10106e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101071:	5b                   	pop    %ebx
  101072:	5e                   	pop    %esi
  101073:	5f                   	pop    %edi
  101074:	5d                   	pop    %ebp
  101075:	c3                   	ret    
  101076:	8d 76 00             	lea    0x0(%esi),%esi
  101079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  101080:	39 91 40 90 14 00    	cmp    %edx,0x149040(%ecx)
  101086:	75 9c                	jne    101024 <buf_fetch+0x24>
  101088:	eb e4                	jmp    10106e <buf_fetch+0x6e>
  10108a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101090:	8d 72 06             	lea    0x6(%edx),%esi
  101093:	83 ec 08             	sub    $0x8,%esp
  101096:	ff b1 40 90 14 00    	pushl  0x149040(%ecx)
  10109c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10109f:	56                   	push   %esi
  1010a0:	e8 8b 01 00 00       	call   101230 <disk_do_write>
  1010a5:	83 c4 10             	add    $0x10,%esp
  1010a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1010ab:	eb 92                	jmp    10103f <buf_fetch+0x3f>
  1010ad:	8d 76 00             	lea    0x0(%esi),%esi

001010b0 <buf_init>:
  1010b0:	55                   	push   %ebp
  1010b1:	b8 44 90 14 00       	mov    $0x149044,%eax
  1010b6:	89 e5                	mov    %esp,%ebp
  1010b8:	90                   	nop
  1010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1010c0:	c6 00 00             	movb   $0x0,(%eax)
  1010c3:	05 08 02 00 00       	add    $0x208,%eax
  1010c8:	3d 44 94 15 00       	cmp    $0x159444,%eax
  1010cd:	75 f1                	jne    1010c0 <buf_init+0x10>
  1010cf:	5d                   	pop    %ebp
  1010d0:	c3                   	ret    
  1010d1:	eb 0d                	jmp    1010e0 <buf_writeback>
  1010d3:	90                   	nop
  1010d4:	90                   	nop
  1010d5:	90                   	nop
  1010d6:	90                   	nop
  1010d7:	90                   	nop
  1010d8:	90                   	nop
  1010d9:	90                   	nop
  1010da:	90                   	nop
  1010db:	90                   	nop
  1010dc:	90                   	nop
  1010dd:	90                   	nop
  1010de:	90                   	nop
  1010df:	90                   	nop

001010e0 <buf_writeback>:
  1010e0:	55                   	push   %ebp
  1010e1:	89 e5                	mov    %esp,%ebp
  1010e3:	53                   	push   %ebx
  1010e4:	bb 46 90 14 00       	mov    $0x149046,%ebx
  1010e9:	83 ec 04             	sub    $0x4,%esp
  1010ec:	eb 10                	jmp    1010fe <buf_writeback+0x1e>
  1010ee:	66 90                	xchg   %ax,%ax
  1010f0:	81 c3 08 02 00 00    	add    $0x208,%ebx
  1010f6:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  1010fc:	74 32                	je     101130 <buf_writeback+0x50>
  1010fe:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
  101102:	75 ec                	jne    1010f0 <buf_writeback+0x10>
  101104:	83 ec 08             	sub    $0x8,%esp
  101107:	ff 73 fa             	pushl  -0x6(%ebx)
  10110a:	53                   	push   %ebx
  10110b:	81 c3 08 02 00 00    	add    $0x208,%ebx
  101111:	e8 1a 01 00 00       	call   101230 <disk_do_write>
  101116:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
  10111d:	83 c4 10             	add    $0x10,%esp
  101120:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  101126:	75 d6                	jne    1010fe <buf_writeback+0x1e>
  101128:	90                   	nop
  101129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101130:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101133:	c9                   	leave  
  101134:	c3                   	ret    
  101135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101140 <read_byte>:
  101140:	55                   	push   %ebp
  101141:	89 e5                	mov    %esp,%ebp
  101143:	53                   	push   %ebx
  101144:	83 ec 04             	sub    $0x4,%esp
  101147:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10114a:	89 d8                	mov    %ebx,%eax
  10114c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101152:	c1 e8 09             	shr    $0x9,%eax
  101155:	e8 a6 fe ff ff       	call   101000 <buf_fetch>
  10115a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
  10115f:	83 c4 04             	add    $0x4,%esp
  101162:	5b                   	pop    %ebx
  101163:	5d                   	pop    %ebp
  101164:	c3                   	ret    
  101165:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101170 <write_byte>:
  101170:	55                   	push   %ebp
  101171:	89 e5                	mov    %esp,%ebp
  101173:	56                   	push   %esi
  101174:	53                   	push   %ebx
  101175:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101178:	8b 75 0c             	mov    0xc(%ebp),%esi
  10117b:	89 d8                	mov    %ebx,%eax
  10117d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101183:	c1 e8 09             	shr    $0x9,%eax
  101186:	e8 75 fe ff ff       	call   101000 <buf_fetch>
  10118b:	89 f2                	mov    %esi,%edx
  10118d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
  101191:	c6 40 05 01          	movb   $0x1,0x5(%eax)
  101195:	5b                   	pop    %ebx
  101196:	5e                   	pop    %esi
  101197:	5d                   	pop    %ebp
  101198:	c3                   	ret    
  101199:	66 90                	xchg   %ax,%ax
  10119b:	66 90                	xchg   %ax,%ax
  10119d:	66 90                	xchg   %ax,%ax
  10119f:	90                   	nop

001011a0 <ide_prepare>:
  1011a0:	55                   	push   %ebp
  1011a1:	89 c1                	mov    %eax,%ecx
  1011a3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1011a8:	89 e5                	mov    %esp,%ebp
  1011aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1011b0:	ec                   	in     (%dx),%al
  1011b1:	83 e0 c0             	and    $0xffffffc0,%eax
  1011b4:	3c 40                	cmp    $0x40,%al
  1011b6:	75 f8                	jne    1011b0 <ide_prepare+0x10>
  1011b8:	ba f1 01 00 00       	mov    $0x1f1,%edx
  1011bd:	31 c0                	xor    %eax,%eax
  1011bf:	ee                   	out    %al,(%dx)
  1011c0:	b8 01 00 00 00       	mov    $0x1,%eax
  1011c5:	b2 f2                	mov    $0xf2,%dl
  1011c7:	ee                   	out    %al,(%dx)
  1011c8:	b2 f3                	mov    $0xf3,%dl
  1011ca:	89 c8                	mov    %ecx,%eax
  1011cc:	ee                   	out    %al,(%dx)
  1011cd:	89 c8                	mov    %ecx,%eax
  1011cf:	b2 f4                	mov    $0xf4,%dl
  1011d1:	c1 e8 08             	shr    $0x8,%eax
  1011d4:	ee                   	out    %al,(%dx)
  1011d5:	89 c8                	mov    %ecx,%eax
  1011d7:	b2 f5                	mov    $0xf5,%dl
  1011d9:	c1 e8 10             	shr    $0x10,%eax
  1011dc:	ee                   	out    %al,(%dx)
  1011dd:	89 c8                	mov    %ecx,%eax
  1011df:	b2 f6                	mov    $0xf6,%dl
  1011e1:	c1 e8 18             	shr    $0x18,%eax
  1011e4:	83 c8 e0             	or     $0xffffffe0,%eax
  1011e7:	ee                   	out    %al,(%dx)
  1011e8:	5d                   	pop    %ebp
  1011e9:	c3                   	ret    
  1011ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001011f0 <disk_do_read>:
  1011f0:	55                   	push   %ebp
  1011f1:	89 e5                	mov    %esp,%ebp
  1011f3:	53                   	push   %ebx
  1011f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1011f7:	e8 a4 ff ff ff       	call   1011a0 <ide_prepare>
  1011fc:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101201:	b8 20 00 00 00       	mov    $0x20,%eax
  101206:	ee                   	out    %al,(%dx)
  101207:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10120a:	b2 f0                	mov    $0xf0,%dl
  10120c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101218:	ed                   	in     (%dx),%eax
  101219:	89 01                	mov    %eax,(%ecx)
  10121b:	83 c1 04             	add    $0x4,%ecx
  10121e:	39 d9                	cmp    %ebx,%ecx
  101220:	75 f6                	jne    101218 <disk_do_read+0x28>
  101222:	5b                   	pop    %ebx
  101223:	5d                   	pop    %ebp
  101224:	c3                   	ret    
  101225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101230 <disk_do_write>:
  101230:	55                   	push   %ebp
  101231:	89 e5                	mov    %esp,%ebp
  101233:	53                   	push   %ebx
  101234:	8b 45 0c             	mov    0xc(%ebp),%eax
  101237:	e8 64 ff ff ff       	call   1011a0 <ide_prepare>
  10123c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101241:	b8 30 00 00 00       	mov    $0x30,%eax
  101246:	ee                   	out    %al,(%dx)
  101247:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10124a:	b2 f0                	mov    $0xf0,%dl
  10124c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101258:	8b 01                	mov    (%ecx),%eax
  10125a:	ef                   	out    %eax,(%dx)
  10125b:	83 c1 04             	add    $0x4,%ecx
  10125e:	39 d9                	cmp    %ebx,%ecx
  101260:	75 f6                	jne    101258 <disk_do_write+0x28>
  101262:	5b                   	pop    %ebx
  101263:	5d                   	pop    %ebp
  101264:	c3                   	ret    
  101265:	66 90                	xchg   %ax,%ax
  101267:	66 90                	xchg   %ax,%ax
  101269:	66 90                	xchg   %ax,%ax
  10126b:	66 90                	xchg   %ax,%ax
  10126d:	66 90                	xchg   %ax,%ax
  10126f:	90                   	nop

00101270 <dma_prepare>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	83 ec 08             	sub    $0x8,%esp
  101276:	68 94 17 10 00       	push   $0x101794
  10127b:	6a 1d                	push   $0x1d
  10127d:	68 78 17 10 00       	push   $0x101778
  101282:	68 e4 16 10 00       	push   $0x1016e4
  101287:	e8 74 fb ff ff       	call   100e00 <printk>
  10128c:	b8 01 00 00 00       	mov    $0x1,%eax
  101291:	d6                   	(bad)  
  101292:	83 c4 10             	add    $0x10,%esp
  101295:	c9                   	leave  
  101296:	c3                   	ret    
  101297:	89 f6                	mov    %esi,%esi
  101299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001012a0 <dma_issue_read>:
  1012a0:	55                   	push   %ebp
  1012a1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
  1012a6:	89 e5                	mov    %esp,%ebp
  1012a8:	ec                   	in     (%dx),%al
  1012a9:	83 c8 09             	or     $0x9,%eax
  1012ac:	ee                   	out    %al,(%dx)
  1012ad:	5d                   	pop    %ebp
  1012ae:	c3                   	ret    
  1012af:	90                   	nop

001012b0 <memcpy>:
  1012b0:	55                   	push   %ebp
  1012b1:	89 e5                	mov    %esp,%ebp
  1012b3:	56                   	push   %esi
  1012b4:	57                   	push   %edi
  1012b5:	53                   	push   %ebx
  1012b6:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012b9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1012bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  1012bf:	fc                   	cld    
  1012c0:	83 f9 08             	cmp    $0x8,%ecx
  1012c3:	76 26                	jbe    1012eb <memcpy+0x3b>
  1012c5:	89 fa                	mov    %edi,%edx
  1012c7:	89 cb                	mov    %ecx,%ebx
  1012c9:	83 e2 03             	and    $0x3,%edx
  1012cc:	74 10                	je     1012de <memcpy+0x2e>
  1012ce:	b9 04 00 00 00       	mov    $0x4,%ecx
  1012d3:	29 d1                	sub    %edx,%ecx
  1012d5:	83 e1 03             	and    $0x3,%ecx
  1012d8:	29 cb                	sub    %ecx,%ebx
  1012da:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012dc:	89 d9                	mov    %ebx,%ecx
  1012de:	c1 e9 02             	shr    $0x2,%ecx
  1012e1:	8d 76 00             	lea    0x0(%esi),%esi
  1012e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1012e6:	89 d9                	mov    %ebx,%ecx
  1012e8:	83 e1 03             	and    $0x3,%ecx
  1012eb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1012f3:	5b                   	pop    %ebx
  1012f4:	5f                   	pop    %edi
  1012f5:	5e                   	pop    %esi
  1012f6:	c9                   	leave  
  1012f7:	c3                   	ret    

001012f8 <memset>:
  1012f8:	55                   	push   %ebp
  1012f9:	89 e5                	mov    %esp,%ebp
  1012fb:	57                   	push   %edi
  1012fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012ff:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  101303:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101306:	fc                   	cld    
  101307:	83 f9 10             	cmp    $0x10,%ecx
  10130a:	76 69                	jbe    101375 <memset+0x7d>
  10130c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101312:	74 4c                	je     101360 <memset+0x68>
  101314:	88 07                	mov    %al,(%edi)
  101316:	47                   	inc    %edi
  101317:	49                   	dec    %ecx
  101318:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10131e:	74 40                	je     101360 <memset+0x68>
  101320:	88 07                	mov    %al,(%edi)
  101322:	47                   	inc    %edi
  101323:	49                   	dec    %ecx
  101324:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10132a:	74 34                	je     101360 <memset+0x68>
  10132c:	88 07                	mov    %al,(%edi)
  10132e:	47                   	inc    %edi
  10132f:	49                   	dec    %ecx
  101330:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101336:	74 28                	je     101360 <memset+0x68>
  101338:	88 07                	mov    %al,(%edi)
  10133a:	47                   	inc    %edi
  10133b:	49                   	dec    %ecx
  10133c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101342:	74 1c                	je     101360 <memset+0x68>
  101344:	88 07                	mov    %al,(%edi)
  101346:	47                   	inc    %edi
  101347:	49                   	dec    %ecx
  101348:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10134e:	74 10                	je     101360 <memset+0x68>
  101350:	88 07                	mov    %al,(%edi)
  101352:	47                   	inc    %edi
  101353:	49                   	dec    %ecx
  101354:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10135a:	74 04                	je     101360 <memset+0x68>
  10135c:	88 07                	mov    %al,(%edi)
  10135e:	47                   	inc    %edi
  10135f:	49                   	dec    %ecx
  101360:	88 c4                	mov    %al,%ah
  101362:	89 c2                	mov    %eax,%edx
  101364:	c1 e2 10             	shl    $0x10,%edx
  101367:	09 d0                	or     %edx,%eax
  101369:	89 ca                	mov    %ecx,%edx
  10136b:	c1 e9 02             	shr    $0x2,%ecx
  10136e:	83 e2 03             	and    $0x3,%edx
  101371:	f3 ab                	rep stos %eax,%es:(%edi)
  101373:	89 d1                	mov    %edx,%ecx
  101375:	f3 aa                	rep stos %al,%es:(%edi)
  101377:	8b 45 08             	mov    0x8(%ebp),%eax
  10137a:	8d 65 fc             	lea    -0x4(%ebp),%esp
  10137d:	5f                   	pop    %edi
  10137e:	c9                   	leave  
  10137f:	c3                   	ret    
