
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <start>:
  100000:	0f 01 15 54 00 10 00 	lgdtl  0x100054
  100007:	0f 20 c0             	mov    %cr0,%eax
  10000a:	83 c8 01             	or     $0x1,%eax
  10000d:	0f 22 c0             	mov    %eax,%cr0
  100010:	ea 17 00 10 00 08 00 	ljmp   $0x8,$0x100017

00100017 <start_cond>:
  100017:	66 b8 10 00          	mov    $0x10,%ax
  10001b:	8e d8                	mov    %eax,%ds
  10001d:	8e c0                	mov    %eax,%es
  10001f:	66 b8 18 00          	mov    $0x18,%ax
  100023:	8e d0                	mov    %eax,%ss
  100025:	bd 00 00 00 00       	mov    $0x0,%ebp
  10002a:	bc 00 00 00 04       	mov    $0x4000000,%esp
  10002f:	e9 dc 03 00 00       	jmp    100410 <init>

00100034 <gdt>:
	...
  10003c:	ff                   	(bad)  
  10003d:	ff 00                	incl   (%eax)
  10003f:	00 00                	add    %al,(%eax)
  100041:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
  100048:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
  10004e:	00 00                	add    %al,(%eax)
  100050:	00 92 cf 04 1f 00    	add    %dl,0x1f04cf(%edx)

00100054 <gdtdesc>:
  100054:	1f                   	pop    %ds
  100055:	00 34 00             	add    %dh,(%eax,%eax,1)
  100058:	10 00                	adc    %al,(%eax)
  10005a:	66 90                	xchg   %ax,%ax
  10005c:	66 90                	xchg   %ax,%ax
  10005e:	66 90                	xchg   %ax,%ax

00100060 <mm_malloc>:
  100060:	55                   	push   %ebp
  100061:	31 c0                	xor    %eax,%eax
  100063:	89 e5                	mov    %esp,%ebp
  100065:	57                   	push   %edi
  100066:	56                   	push   %esi
  100067:	53                   	push   %ebx
  100068:	83 ec 3c             	sub    $0x3c,%esp
  10006b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10006e:	85 db                	test   %ebx,%ebx
  100070:	0f 8e 36 02 00 00    	jle    1002ac <mm_malloc+0x24c>
  100076:	e8 b5 0a 00 00       	call   100b30 <get_updir>
  10007b:	89 c6                	mov    %eax,%esi
  10007d:	e8 be 0a 00 00       	call   100b40 <get_ucr3>
  100082:	8b 55 08             	mov    0x8(%ebp),%edx
  100085:	8d 5c 1a ff          	lea    -0x1(%edx,%ebx,1),%ebx
  100089:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  10008c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10008f:	b8 00 10 00 00       	mov    $0x1000,%eax
  100094:	29 d0                	sub    %edx,%eax
  100096:	89 da                	mov    %ebx,%edx
  100098:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  10009e:	01 d0                	add    %edx,%eax
  1000a0:	85 c0                	test   %eax,%eax
  1000a2:	0f 8e c0 00 00 00    	jle    100168 <mm_malloc+0x108>
  1000a8:	8b 55 08             	mov    0x8(%ebp),%edx
  1000ab:	83 e8 01             	sub    $0x1,%eax
  1000ae:	89 f7                	mov    %esi,%edi
  1000b0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1000b5:	8d 84 02 00 10 00 00 	lea    0x1000(%edx,%eax,1),%eax
  1000bc:	89 d3                	mov    %edx,%ebx
  1000be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1000c1:	eb 51                	jmp    100114 <mm_malloc+0xb4>
  1000c3:	90                   	nop
  1000c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1000c8:	8b 31                	mov    (%ecx),%esi
  1000ca:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  1000d0:	81 ee 00 00 00 40    	sub    $0x40000000,%esi
  1000d6:	89 d8                	mov    %ebx,%eax
  1000d8:	c1 e8 0a             	shr    $0xa,%eax
  1000db:	25 fc 0f 00 00       	and    $0xffc,%eax
  1000e0:	01 c6                	add    %eax,%esi
  1000e2:	f6 06 01             	testb  $0x1,(%esi)
  1000e5:	75 22                	jne    100109 <mm_malloc+0xa9>
  1000e7:	a1 00 20 10 00       	mov    0x102000,%eax
  1000ec:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
  1000f1:	0f 8f c1 01 00 00    	jg     1002b8 <mm_malloc+0x258>
  1000f7:	89 c1                	mov    %eax,%ecx
  1000f9:	83 c0 01             	add    $0x1,%eax
  1000fc:	c1 e1 0c             	shl    $0xc,%ecx
  1000ff:	83 c9 07             	or     $0x7,%ecx
  100102:	89 0e                	mov    %ecx,(%esi)
  100104:	a3 00 20 10 00       	mov    %eax,0x102000
  100109:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  10010f:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  100112:	74 54                	je     100168 <mm_malloc+0x108>
  100114:	89 d8                	mov    %ebx,%eax
  100116:	c1 e8 16             	shr    $0x16,%eax
  100119:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
  10011c:	f6 01 01             	testb  $0x1,(%ecx)
  10011f:	75 a7                	jne    1000c8 <mm_malloc+0x68>
  100121:	a1 00 30 10 00       	mov    0x103000,%eax
  100126:	89 c6                	mov    %eax,%esi
  100128:	83 c0 01             	add    $0x1,%eax
  10012b:	c1 e6 0c             	shl    $0xc,%esi
  10012e:	81 c6 00 40 10 00    	add    $0x104000,%esi
  100134:	a3 00 30 10 00       	mov    %eax,0x103000
  100139:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
  10013f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100144:	83 c8 07             	or     $0x7,%eax
  100147:	89 01                	mov    %eax,(%ecx)
  100149:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  100150:	00 
  100151:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100158:	00 
  100159:	89 34 24             	mov    %esi,(%esp)
  10015c:	e8 a7 11 00 00       	call   101308 <memset>
  100161:	e9 70 ff ff ff       	jmp    1000d6 <mm_malloc+0x76>
  100166:	66 90                	xchg   %ax,%ax
  100168:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  10016b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10016e:	81 eb 00 00 00 40    	sub    $0x40000000,%ebx
  100174:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  10017a:	c1 e8 16             	shr    $0x16,%eax
  10017d:	8b 34 83             	mov    (%ebx,%eax,4),%esi
  100180:	f7 c6 01 00 00 00    	test   $0x1,%esi
  100186:	75 32                	jne    1001ba <mm_malloc+0x15a>
  100188:	c7 44 24 10 b4 13 10 	movl   $0x1013b4,0x10(%esp)
  10018f:	00 
  100190:	c7 44 24 0c 18 14 10 	movl   $0x101418,0xc(%esp)
  100197:	00 
  100198:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10019f:	00 
  1001a0:	c7 44 24 04 a3 13 10 	movl   $0x1013a3,0x4(%esp)
  1001a7:	00 
  1001a8:	c7 04 24 c4 13 10 00 	movl   $0x1013c4,(%esp)
  1001af:	e8 5c 0c 00 00       	call   100e10 <printk>
  1001b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1001b9:	d6                   	(bad)  
  1001ba:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1001bd:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
  1001c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1001c8:	c1 ea 0c             	shr    $0xc,%edx
  1001cb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  1001d1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
  1001d5:	75 32                	jne    100209 <mm_malloc+0x1a9>
  1001d7:	c7 44 24 10 bc 13 10 	movl   $0x1013bc,0x10(%esp)
  1001de:	00 
  1001df:	c7 44 24 0c 18 14 10 	movl   $0x101418,0xc(%esp)
  1001e6:	00 
  1001e7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  1001ee:	00 
  1001ef:	c7 44 24 04 a3 13 10 	movl   $0x1013a3,0x4(%esp)
  1001f6:	00 
  1001f7:	c7 04 24 c4 13 10 00 	movl   $0x1013c4,(%esp)
  1001fe:	e8 0d 0c 00 00       	call   100e10 <printk>
  100203:	b8 01 00 00 00       	mov    $0x1,%eax
  100208:	d6                   	(bad)  
  100209:	8b 45 08             	mov    0x8(%ebp),%eax
  10020c:	c1 e8 16             	shr    $0x16,%eax
  10020f:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
  100212:	f6 c3 01             	test   $0x1,%bl
  100215:	75 32                	jne    100249 <mm_malloc+0x1e9>
  100217:	c7 44 24 10 b4 13 10 	movl   $0x1013b4,0x10(%esp)
  10021e:	00 
  10021f:	c7 44 24 0c 18 14 10 	movl   $0x101418,0xc(%esp)
  100226:	00 
  100227:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10022e:	00 
  10022f:	c7 44 24 04 a3 13 10 	movl   $0x1013a3,0x4(%esp)
  100236:	00 
  100237:	c7 04 24 c4 13 10 00 	movl   $0x1013c4,(%esp)
  10023e:	e8 cd 0b 00 00       	call   100e10 <printk>
  100243:	b8 01 00 00 00       	mov    $0x1,%eax
  100248:	d6                   	(bad)  
  100249:	8b 55 08             	mov    0x8(%ebp),%edx
  10024c:	8d 83 00 00 00 c0    	lea    -0x40000000(%ebx),%eax
  100252:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100257:	c1 ea 0c             	shr    $0xc,%edx
  10025a:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100260:	8b 1c 90             	mov    (%eax,%edx,4),%ebx
  100263:	f6 c3 01             	test   $0x1,%bl
  100266:	75 32                	jne    10029a <mm_malloc+0x23a>
  100268:	c7 44 24 10 bc 13 10 	movl   $0x1013bc,0x10(%esp)
  10026f:	00 
  100270:	c7 44 24 0c 18 14 10 	movl   $0x101418,0xc(%esp)
  100277:	00 
  100278:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10027f:	00 
  100280:	c7 44 24 04 a3 13 10 	movl   $0x1013a3,0x4(%esp)
  100287:	00 
  100288:	c7 04 24 c4 13 10 00 	movl   $0x1013c4,(%esp)
  10028f:	e8 7c 0b 00 00       	call   100e10 <printk>
  100294:	b8 01 00 00 00       	mov    $0x1,%eax
  100299:	d6                   	(bad)  
  10029a:	8b 55 08             	mov    0x8(%ebp),%edx
  10029d:	89 d8                	mov    %ebx,%eax
  10029f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1002a4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  1002aa:	09 d0                	or     %edx,%eax
  1002ac:	83 c4 3c             	add    $0x3c,%esp
  1002af:	5b                   	pop    %ebx
  1002b0:	5e                   	pop    %esi
  1002b1:	5f                   	pop    %edi
  1002b2:	5d                   	pop    %ebp
  1002b3:	c3                   	ret    
  1002b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1002b8:	c7 44 24 10 90 13 10 	movl   $0x101390,0x10(%esp)
  1002bf:	00 
  1002c0:	c7 44 24 0c 0e 14 10 	movl   $0x10140e,0xc(%esp)
  1002c7:	00 
  1002c8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
  1002cf:	00 
  1002d0:	c7 44 24 04 a3 13 10 	movl   $0x1013a3,0x4(%esp)
  1002d7:	00 
  1002d8:	c7 04 24 c4 13 10 00 	movl   $0x1013c4,(%esp)
  1002df:	e8 2c 0b 00 00       	call   100e10 <printk>
  1002e4:	b8 01 00 00 00       	mov    $0x1,%eax
  1002e9:	d6                   	(bad)  
  1002ea:	a1 00 20 10 00       	mov    0x102000,%eax
  1002ef:	e9 03 fe ff ff       	jmp    1000f7 <mm_malloc+0x97>

001002f4 <vec0>:
  1002f4:	6a 00                	push   $0x0
  1002f6:	6a 00                	push   $0x0
  1002f8:	e9 ab 00 00 00       	jmp    1003a8 <asm_do_irq>

001002fd <vec1>:
  1002fd:	6a 00                	push   $0x0
  1002ff:	6a 01                	push   $0x1
  100301:	e9 a2 00 00 00       	jmp    1003a8 <asm_do_irq>

00100306 <vec2>:
  100306:	6a 00                	push   $0x0
  100308:	6a 02                	push   $0x2
  10030a:	e9 99 00 00 00       	jmp    1003a8 <asm_do_irq>

0010030f <vec3>:
  10030f:	6a 00                	push   $0x0
  100311:	6a 03                	push   $0x3
  100313:	e9 90 00 00 00       	jmp    1003a8 <asm_do_irq>

00100318 <vec4>:
  100318:	6a 00                	push   $0x0
  10031a:	6a 04                	push   $0x4
  10031c:	e9 87 00 00 00       	jmp    1003a8 <asm_do_irq>

00100321 <vec5>:
  100321:	6a 00                	push   $0x0
  100323:	6a 05                	push   $0x5
  100325:	e9 7e 00 00 00       	jmp    1003a8 <asm_do_irq>

0010032a <vec6>:
  10032a:	6a 00                	push   $0x0
  10032c:	6a 06                	push   $0x6
  10032e:	e9 75 00 00 00       	jmp    1003a8 <asm_do_irq>

00100333 <vec7>:
  100333:	6a 00                	push   $0x0
  100335:	6a 07                	push   $0x7
  100337:	e9 6c 00 00 00       	jmp    1003a8 <asm_do_irq>

0010033c <vec8>:
  10033c:	6a 08                	push   $0x8
  10033e:	e9 65 00 00 00       	jmp    1003a8 <asm_do_irq>

00100343 <vec9>:
  100343:	6a 00                	push   $0x0
  100345:	6a 09                	push   $0x9
  100347:	e9 5c 00 00 00       	jmp    1003a8 <asm_do_irq>

0010034c <vec10>:
  10034c:	6a 0a                	push   $0xa
  10034e:	e9 55 00 00 00       	jmp    1003a8 <asm_do_irq>

00100353 <vec11>:
  100353:	6a 0b                	push   $0xb
  100355:	e9 4e 00 00 00       	jmp    1003a8 <asm_do_irq>

0010035a <vec12>:
  10035a:	6a 0c                	push   $0xc
  10035c:	e9 47 00 00 00       	jmp    1003a8 <asm_do_irq>

00100361 <vec13>:
  100361:	6a 0d                	push   $0xd
  100363:	e9 40 00 00 00       	jmp    1003a8 <asm_do_irq>

00100368 <vec14>:
  100368:	6a 0e                	push   $0xe
  10036a:	e9 39 00 00 00       	jmp    1003a8 <asm_do_irq>

0010036f <vecsys>:
  10036f:	6a 00                	push   $0x0
  100371:	68 80 00 00 00       	push   $0x80
  100376:	e9 2d 00 00 00       	jmp    1003a8 <asm_do_irq>

0010037b <irq0>:
  10037b:	6a 00                	push   $0x0
  10037d:	68 e8 03 00 00       	push   $0x3e8
  100382:	e9 21 00 00 00       	jmp    1003a8 <asm_do_irq>

00100387 <irq1>:
  100387:	6a 00                	push   $0x0
  100389:	68 e9 03 00 00       	push   $0x3e9
  10038e:	e9 15 00 00 00       	jmp    1003a8 <asm_do_irq>

00100393 <irq14>:
  100393:	6a 00                	push   $0x0
  100395:	68 f6 03 00 00       	push   $0x3f6
  10039a:	e9 09 00 00 00       	jmp    1003a8 <asm_do_irq>

0010039f <irq_empty>:
  10039f:	6a 00                	push   $0x0
  1003a1:	6a ff                	push   $0xffffffff
  1003a3:	e9 00 00 00 00       	jmp    1003a8 <asm_do_irq>

001003a8 <asm_do_irq>:
  1003a8:	60                   	pusha  
  1003a9:	54                   	push   %esp
  1003aa:	e8 a1 01 00 00       	call   100550 <irq_handle>
  1003af:	83 c4 04             	add    $0x4,%esp
  1003b2:	61                   	popa   
  1003b3:	83 c4 08             	add    $0x8,%esp
  1003b6:	cf                   	iret   
  1003b7:	66 90                	xchg   %ax,%ax
  1003b9:	66 90                	xchg   %ax,%ax
  1003bb:	66 90                	xchg   %ax,%ax
  1003bd:	66 90                	xchg   %ax,%ax
  1003bf:	90                   	nop

001003c0 <init_cond>:
  1003c0:	55                   	push   %ebp
  1003c1:	89 e5                	mov    %esp,%ebp
  1003c3:	83 ec 08             	sub    $0x8,%esp
  1003c6:	68 af 14 10 00       	push   $0x1014af
  1003cb:	6a 4a                	push   $0x4a
  1003cd:	68 1e 14 10 00       	push   $0x10141e
  1003d2:	68 30 14 10 00       	push   $0x101430
  1003d7:	e8 34 0a 00 00       	call   100e10 <printk>
  1003dc:	e8 2f 09 00 00       	call   100d10 <loader>
  1003e1:	bd 00 00 00 00       	mov    $0x0,%ebp
  1003e6:	83 ec 10             	sub    $0x10,%esp
  1003e9:	ff d0                	call   *%eax
  1003eb:	68 af 14 10 00       	push   $0x1014af
  1003f0:	6a 6b                	push   $0x6b
  1003f2:	68 1e 14 10 00       	push   $0x10141e
  1003f7:	68 64 14 10 00       	push   $0x101464
  1003fc:	e8 0f 0a 00 00       	call   100e10 <printk>
  100401:	b8 01 00 00 00       	mov    $0x1,%eax
  100406:	d6                   	(bad)  
  100407:	83 c4 20             	add    $0x20,%esp
  10040a:	c9                   	leave  
  10040b:	c3                   	ret    
  10040c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100410 <init>:
  100410:	55                   	push   %ebp
  100411:	b8 c0 03 10 00       	mov    $0x1003c0,%eax
  100416:	89 e5                	mov    %esp,%ebp
  100418:	83 ec 08             	sub    $0x8,%esp
  10041b:	ff e0                	jmp    *%eax
  10041d:	68 b9 14 10 00       	push   $0x1014b9
  100422:	6a 24                	push   $0x24
  100424:	68 1e 14 10 00       	push   $0x10141e
  100429:	68 64 14 10 00       	push   $0x101464
  10042e:	e8 dd 09 00 00       	call   100e10 <printk>
  100433:	b8 01 00 00 00       	mov    $0x1,%eax
  100438:	d6                   	(bad)  
  100439:	83 c4 10             	add    $0x10,%esp
  10043c:	c9                   	leave  
  10043d:	c3                   	ret    
  10043e:	66 90                	xchg   %ax,%ax

00100440 <do_syscall>:
  100440:	55                   	push   %ebp
  100441:	89 e5                	mov    %esp,%ebp
  100443:	83 ec 08             	sub    $0x8,%esp
  100446:	8b 55 08             	mov    0x8(%ebp),%edx
  100449:	8b 42 08             	mov    0x8(%edx),%eax
  10044c:	85 c0                	test   %eax,%eax
  10044e:	74 38                	je     100488 <do_syscall+0x48>
  100450:	83 f8 2d             	cmp    $0x2d,%eax
  100453:	75 0b                	jne    100460 <do_syscall+0x20>
  100455:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  10045c:	c9                   	leave  
  10045d:	c3                   	ret    
  10045e:	66 90                	xchg   %ax,%ax
  100460:	83 ec 0c             	sub    $0xc,%esp
  100463:	50                   	push   %eax
  100464:	68 34 15 10 00       	push   $0x101534
  100469:	6a 20                	push   $0x20
  10046b:	68 c0 14 10 00       	push   $0x1014c0
  100470:	68 e0 14 10 00       	push   $0x1014e0
  100475:	e8 96 09 00 00       	call   100e10 <printk>
  10047a:	b8 01 00 00 00       	mov    $0x1,%eax
  10047f:	d6                   	(bad)  
  100480:	83 c4 20             	add    $0x20,%esp
  100483:	c9                   	leave  
  100484:	c3                   	ret    
  100485:	8d 76 00             	lea    0x0(%esi),%esi
  100488:	fa                   	cli    
  100489:	83 ec 08             	sub    $0x8,%esp
  10048c:	ff 72 1c             	pushl  0x1c(%edx)
  10048f:	ff 72 04             	pushl  0x4(%edx)
  100492:	e8 09 00 00 00       	call   1004a0 <add_irq_handle>
  100497:	fb                   	sti    
  100498:	83 c4 10             	add    $0x10,%esp
  10049b:	c9                   	leave  
  10049c:	c3                   	ret    
  10049d:	66 90                	xchg   %ax,%ax
  10049f:	90                   	nop

001004a0 <add_irq_handle>:
  1004a0:	55                   	push   %ebp
  1004a1:	89 e5                	mov    %esp,%ebp
  1004a3:	53                   	push   %ebx
  1004a4:	83 ec 04             	sub    $0x4,%esp
  1004a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004aa:	83 fb 0f             	cmp    $0xf,%ebx
  1004ad:	7f 71                	jg     100520 <add_irq_handle+0x80>
  1004af:	a1 00 40 12 00       	mov    0x124000,%eax
  1004b4:	83 f8 20             	cmp    $0x20,%eax
  1004b7:	7e 2c                	jle    1004e5 <add_irq_handle+0x45>
  1004b9:	83 ec 0c             	sub    $0xc,%esp
  1004bc:	68 6e 15 10 00       	push   $0x10156e
  1004c1:	68 bd 16 10 00       	push   $0x1016bd
  1004c6:	6a 16                	push   $0x16
  1004c8:	68 52 15 10 00       	push   $0x101552
  1004cd:	68 c4 13 10 00       	push   $0x1013c4
  1004d2:	e8 39 09 00 00       	call   100e10 <printk>
  1004d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1004dc:	d6                   	(bad)  
  1004dd:	a1 00 40 12 00       	mov    0x124000,%eax
  1004e2:	83 c4 20             	add    $0x20,%esp
  1004e5:	8d 50 01             	lea    0x1(%eax),%edx
  1004e8:	89 15 00 40 12 00    	mov    %edx,0x124000
  1004ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004f1:	89 14 c5 80 40 12 00 	mov    %edx,0x124080(,%eax,8)
  1004f8:	8b 14 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%edx
  1004ff:	89 14 c5 84 40 12 00 	mov    %edx,0x124084(,%eax,8)
  100506:	8d 04 c5 80 40 12 00 	lea    0x124080(,%eax,8),%eax
  10050d:	89 04 9d 40 40 12 00 	mov    %eax,0x124040(,%ebx,4)
  100514:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100517:	c9                   	leave  
  100518:	c3                   	ret    
  100519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100520:	83 ec 0c             	sub    $0xc,%esp
  100523:	68 3f 15 10 00       	push   $0x10153f
  100528:	68 bd 16 10 00       	push   $0x1016bd
  10052d:	6a 15                	push   $0x15
  10052f:	68 52 15 10 00       	push   $0x101552
  100534:	68 c4 13 10 00       	push   $0x1013c4
  100539:	e8 d2 08 00 00       	call   100e10 <printk>
  10053e:	b8 01 00 00 00       	mov    $0x1,%eax
  100543:	d6                   	(bad)  
  100544:	83 c4 20             	add    $0x20,%esp
  100547:	e9 63 ff ff ff       	jmp    1004af <add_irq_handle+0xf>
  10054c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100550 <irq_handle>:
  100550:	55                   	push   %ebp
  100551:	89 e5                	mov    %esp,%ebp
  100553:	53                   	push   %ebx
  100554:	83 ec 04             	sub    $0x4,%esp
  100557:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10055a:	68 b2 16 10 00       	push   $0x1016b2
  10055f:	6a 24                	push   $0x24
  100561:	68 52 15 10 00       	push   $0x101552
  100566:	68 a4 15 10 00       	push   $0x1015a4
  10056b:	e8 a0 08 00 00       	call   100e10 <printk>
  100570:	b8 01 00 00 00       	mov    $0x1,%eax
  100575:	d6                   	(bad)  
  100576:	8b 43 30             	mov    0x30(%ebx),%eax
  100579:	83 c4 10             	add    $0x10,%esp
  10057c:	85 c0                	test   %eax,%eax
  10057e:	0f 88 9c 00 00 00    	js     100620 <irq_handle+0xd0>
  100584:	3d 80 00 00 00       	cmp    $0x80,%eax
  100589:	0f 84 b9 00 00 00    	je     100648 <irq_handle+0xf8>
  10058f:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  100594:	7e 5a                	jle    1005f0 <irq_handle+0xa0>
  100596:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
  10059c:	83 fb 0f             	cmp    $0xf,%ebx
  10059f:	7f 1f                	jg     1005c0 <irq_handle+0x70>
  1005a1:	8b 1c 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%ebx
  1005a8:	85 db                	test   %ebx,%ebx
  1005aa:	74 0d                	je     1005b9 <irq_handle+0x69>
  1005ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005b0:	ff 13                	call   *(%ebx)
  1005b2:	8b 5b 04             	mov    0x4(%ebx),%ebx
  1005b5:	85 db                	test   %ebx,%ebx
  1005b7:	75 f7                	jne    1005b0 <irq_handle+0x60>
  1005b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005bc:	c9                   	leave  
  1005bd:	c3                   	ret    
  1005be:	66 90                	xchg   %ax,%ax
  1005c0:	83 ec 0c             	sub    $0xc,%esp
  1005c3:	68 8c 15 10 00       	push   $0x10158c
  1005c8:	68 b2 16 10 00       	push   $0x1016b2
  1005cd:	6a 30                	push   $0x30
  1005cf:	68 52 15 10 00       	push   $0x101552
  1005d4:	68 c4 13 10 00       	push   $0x1013c4
  1005d9:	e8 32 08 00 00       	call   100e10 <printk>
  1005de:	b8 01 00 00 00       	mov    $0x1,%eax
  1005e3:	d6                   	(bad)  
  1005e4:	83 c4 20             	add    $0x20,%esp
  1005e7:	eb b8                	jmp    1005a1 <irq_handle+0x51>
  1005e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1005f0:	83 ec 08             	sub    $0x8,%esp
  1005f3:	ff 73 0c             	pushl  0xc(%ebx)
  1005f6:	50                   	push   %eax
  1005f7:	68 b2 16 10 00       	push   $0x1016b2
  1005fc:	6a 2d                	push   $0x2d
  1005fe:	68 52 15 10 00       	push   $0x101552
  100603:	68 58 16 10 00       	push   $0x101658
  100608:	e8 03 08 00 00       	call   100e10 <printk>
  10060d:	b8 01 00 00 00       	mov    $0x1,%eax
  100612:	d6                   	(bad)  
  100613:	83 c4 20             	add    $0x20,%esp
  100616:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100619:	c9                   	leave  
  10061a:	c3                   	ret    
  10061b:	90                   	nop
  10061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100620:	68 b2 16 10 00       	push   $0x1016b2
  100625:	6a 29                	push   $0x29
  100627:	68 52 15 10 00       	push   $0x101552
  10062c:	68 0c 16 10 00       	push   $0x10160c
  100631:	e8 da 07 00 00       	call   100e10 <printk>
  100636:	b8 01 00 00 00       	mov    $0x1,%eax
  10063b:	d6                   	(bad)  
  10063c:	83 c4 10             	add    $0x10,%esp
  10063f:	e9 75 ff ff ff       	jmp    1005b9 <irq_handle+0x69>
  100644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100648:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10064b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10064e:	c9                   	leave  
  10064f:	e9 ec fd ff ff       	jmp    100440 <do_syscall>
  100654:	66 90                	xchg   %ax,%ax
  100656:	66 90                	xchg   %ax,%ax
  100658:	66 90                	xchg   %ax,%ax
  10065a:	66 90                	xchg   %ax,%ax
  10065c:	66 90                	xchg   %ax,%ax
  10065e:	66 90                	xchg   %ax,%ax

00100660 <init_i8259>:
  100660:	55                   	push   %ebp
  100661:	ba 21 00 00 00       	mov    $0x21,%edx
  100666:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10066b:	89 e5                	mov    %esp,%ebp
  10066d:	ee                   	out    %al,(%dx)
  10066e:	b2 a1                	mov    $0xa1,%dl
  100670:	ee                   	out    %al,(%dx)
  100671:	b8 11 00 00 00       	mov    $0x11,%eax
  100676:	b2 20                	mov    $0x20,%dl
  100678:	ee                   	out    %al,(%dx)
  100679:	b8 20 00 00 00       	mov    $0x20,%eax
  10067e:	b2 21                	mov    $0x21,%dl
  100680:	ee                   	out    %al,(%dx)
  100681:	b8 04 00 00 00       	mov    $0x4,%eax
  100686:	ee                   	out    %al,(%dx)
  100687:	b8 03 00 00 00       	mov    $0x3,%eax
  10068c:	ee                   	out    %al,(%dx)
  10068d:	b8 11 00 00 00       	mov    $0x11,%eax
  100692:	b2 a0                	mov    $0xa0,%dl
  100694:	ee                   	out    %al,(%dx)
  100695:	b8 28 00 00 00       	mov    $0x28,%eax
  10069a:	b2 a1                	mov    $0xa1,%dl
  10069c:	ee                   	out    %al,(%dx)
  10069d:	b8 02 00 00 00       	mov    $0x2,%eax
  1006a2:	ee                   	out    %al,(%dx)
  1006a3:	b8 03 00 00 00       	mov    $0x3,%eax
  1006a8:	ee                   	out    %al,(%dx)
  1006a9:	b8 68 00 00 00       	mov    $0x68,%eax
  1006ae:	b2 20                	mov    $0x20,%dl
  1006b0:	ee                   	out    %al,(%dx)
  1006b1:	b8 0a 00 00 00       	mov    $0xa,%eax
  1006b6:	ee                   	out    %al,(%dx)
  1006b7:	b8 68 00 00 00       	mov    $0x68,%eax
  1006bc:	b2 a0                	mov    $0xa0,%dl
  1006be:	ee                   	out    %al,(%dx)
  1006bf:	b8 0a 00 00 00       	mov    $0xa,%eax
  1006c4:	ee                   	out    %al,(%dx)
  1006c5:	5d                   	pop    %ebp
  1006c6:	c3                   	ret    
  1006c7:	66 90                	xchg   %ax,%ax
  1006c9:	66 90                	xchg   %ax,%ax
  1006cb:	66 90                	xchg   %ax,%ax
  1006cd:	66 90                	xchg   %ax,%ax
  1006cf:	90                   	nop

001006d0 <init_idt>:
  1006d0:	55                   	push   %ebp
  1006d1:	ba 9f 03 10 00       	mov    $0x10039f,%edx
  1006d6:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  1006db:	89 d1                	mov    %edx,%ecx
  1006dd:	c1 ea 10             	shr    $0x10,%edx
  1006e0:	89 e5                	mov    %esp,%ebp
  1006e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1006e8:	66 89 08             	mov    %cx,(%eax)
  1006eb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1006f1:	83 c0 08             	add    $0x8,%eax
  1006f4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
  1006f8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
  1006fc:	66 89 50 fe          	mov    %dx,-0x2(%eax)
  100700:	3d c0 49 12 00       	cmp    $0x1249c0,%eax
  100705:	75 e1                	jne    1006e8 <init_idt+0x18>
  100707:	b8 f4 02 10 00       	mov    $0x1002f4,%eax
  10070c:	ba 08 00 00 00       	mov    $0x8,%edx
  100711:	b9 08 00 00 00       	mov    $0x8,%ecx
  100716:	66 a3 c0 41 12 00    	mov    %ax,0x1241c0
  10071c:	c1 e8 10             	shr    $0x10,%eax
  10071f:	66 89 15 c2 41 12 00 	mov    %dx,0x1241c2
  100726:	66 a3 c6 41 12 00    	mov    %ax,0x1241c6
  10072c:	b8 fd 02 10 00       	mov    $0x1002fd,%eax
  100731:	ba 08 00 00 00       	mov    $0x8,%edx
  100736:	66 a3 c8 41 12 00    	mov    %ax,0x1241c8
  10073c:	c1 e8 10             	shr    $0x10,%eax
  10073f:	66 89 0d ca 41 12 00 	mov    %cx,0x1241ca
  100746:	66 a3 ce 41 12 00    	mov    %ax,0x1241ce
  10074c:	b8 06 03 10 00       	mov    $0x100306,%eax
  100751:	66 89 15 d2 41 12 00 	mov    %dx,0x1241d2
  100758:	66 a3 d0 41 12 00    	mov    %ax,0x1241d0
  10075e:	c1 e8 10             	shr    $0x10,%eax
  100761:	b9 08 00 00 00       	mov    $0x8,%ecx
  100766:	66 a3 d6 41 12 00    	mov    %ax,0x1241d6
  10076c:	b8 0f 03 10 00       	mov    $0x10030f,%eax
  100771:	ba 08 00 00 00       	mov    $0x8,%edx
  100776:	66 a3 d8 41 12 00    	mov    %ax,0x1241d8
  10077c:	c1 e8 10             	shr    $0x10,%eax
  10077f:	66 89 0d da 41 12 00 	mov    %cx,0x1241da
  100786:	66 a3 de 41 12 00    	mov    %ax,0x1241de
  10078c:	b8 18 03 10 00       	mov    $0x100318,%eax
  100791:	66 89 15 e2 41 12 00 	mov    %dx,0x1241e2
  100798:	66 a3 e0 41 12 00    	mov    %ax,0x1241e0
  10079e:	c1 e8 10             	shr    $0x10,%eax
  1007a1:	b9 08 00 00 00       	mov    $0x8,%ecx
  1007a6:	66 a3 e6 41 12 00    	mov    %ax,0x1241e6
  1007ac:	b8 21 03 10 00       	mov    $0x100321,%eax
  1007b1:	ba 08 00 00 00       	mov    $0x8,%edx
  1007b6:	66 a3 e8 41 12 00    	mov    %ax,0x1241e8
  1007bc:	c1 e8 10             	shr    $0x10,%eax
  1007bf:	66 89 0d ea 41 12 00 	mov    %cx,0x1241ea
  1007c6:	66 a3 ee 41 12 00    	mov    %ax,0x1241ee
  1007cc:	b8 2a 03 10 00       	mov    $0x10032a,%eax
  1007d1:	66 89 15 f2 41 12 00 	mov    %dx,0x1241f2
  1007d8:	66 a3 f0 41 12 00    	mov    %ax,0x1241f0
  1007de:	c1 e8 10             	shr    $0x10,%eax
  1007e1:	c6 05 c4 41 12 00 00 	movb   $0x0,0x1241c4
  1007e8:	c6 05 c5 41 12 00 8f 	movb   $0x8f,0x1241c5
  1007ef:	c6 05 cc 41 12 00 00 	movb   $0x0,0x1241cc
  1007f6:	b9 08 00 00 00       	mov    $0x8,%ecx
  1007fb:	c6 05 cd 41 12 00 8f 	movb   $0x8f,0x1241cd
  100802:	c6 05 d4 41 12 00 00 	movb   $0x0,0x1241d4
  100809:	ba 08 00 00 00       	mov    $0x8,%edx
  10080e:	c6 05 d5 41 12 00 8f 	movb   $0x8f,0x1241d5
  100815:	c6 05 dc 41 12 00 00 	movb   $0x0,0x1241dc
  10081c:	c6 05 dd 41 12 00 8f 	movb   $0x8f,0x1241dd
  100823:	c6 05 e4 41 12 00 00 	movb   $0x0,0x1241e4
  10082a:	c6 05 e5 41 12 00 8f 	movb   $0x8f,0x1241e5
  100831:	c6 05 ec 41 12 00 00 	movb   $0x0,0x1241ec
  100838:	c6 05 ed 41 12 00 8f 	movb   $0x8f,0x1241ed
  10083f:	c6 05 f4 41 12 00 00 	movb   $0x0,0x1241f4
  100846:	c6 05 f5 41 12 00 8f 	movb   $0x8f,0x1241f5
  10084d:	66 a3 f6 41 12 00    	mov    %ax,0x1241f6
  100853:	b8 33 03 10 00       	mov    $0x100333,%eax
  100858:	66 a3 f8 41 12 00    	mov    %ax,0x1241f8
  10085e:	c1 e8 10             	shr    $0x10,%eax
  100861:	66 89 0d fa 41 12 00 	mov    %cx,0x1241fa
  100868:	66 a3 fe 41 12 00    	mov    %ax,0x1241fe
  10086e:	b8 3c 03 10 00       	mov    $0x10033c,%eax
  100873:	b9 08 00 00 00       	mov    $0x8,%ecx
  100878:	66 a3 00 42 12 00    	mov    %ax,0x124200
  10087e:	c1 e8 10             	shr    $0x10,%eax
  100881:	66 89 15 02 42 12 00 	mov    %dx,0x124202
  100888:	66 a3 06 42 12 00    	mov    %ax,0x124206
  10088e:	b8 43 03 10 00       	mov    $0x100343,%eax
  100893:	66 89 0d 0a 42 12 00 	mov    %cx,0x12420a
  10089a:	66 a3 08 42 12 00    	mov    %ax,0x124208
  1008a0:	c1 e8 10             	shr    $0x10,%eax
  1008a3:	ba 08 00 00 00       	mov    $0x8,%edx
  1008a8:	66 a3 0e 42 12 00    	mov    %ax,0x12420e
  1008ae:	b8 4c 03 10 00       	mov    $0x10034c,%eax
  1008b3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008b8:	66 a3 10 42 12 00    	mov    %ax,0x124210
  1008be:	c1 e8 10             	shr    $0x10,%eax
  1008c1:	66 89 15 12 42 12 00 	mov    %dx,0x124212
  1008c8:	66 a3 16 42 12 00    	mov    %ax,0x124216
  1008ce:	b8 53 03 10 00       	mov    $0x100353,%eax
  1008d3:	66 89 0d 1a 42 12 00 	mov    %cx,0x12421a
  1008da:	66 a3 18 42 12 00    	mov    %ax,0x124218
  1008e0:	c1 e8 10             	shr    $0x10,%eax
  1008e3:	ba 08 00 00 00       	mov    $0x8,%edx
  1008e8:	66 a3 1e 42 12 00    	mov    %ax,0x12421e
  1008ee:	b8 5a 03 10 00       	mov    $0x10035a,%eax
  1008f3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008f8:	66 a3 20 42 12 00    	mov    %ax,0x124220
  1008fe:	c1 e8 10             	shr    $0x10,%eax
  100901:	66 89 15 22 42 12 00 	mov    %dx,0x124222
  100908:	66 a3 26 42 12 00    	mov    %ax,0x124226
  10090e:	b8 61 03 10 00       	mov    $0x100361,%eax
  100913:	66 89 0d 2a 42 12 00 	mov    %cx,0x12422a
  10091a:	66 a3 28 42 12 00    	mov    %ax,0x124228
  100920:	c1 e8 10             	shr    $0x10,%eax
  100923:	c6 05 fc 41 12 00 00 	movb   $0x0,0x1241fc
  10092a:	c6 05 fd 41 12 00 8f 	movb   $0x8f,0x1241fd
  100931:	c6 05 04 42 12 00 00 	movb   $0x0,0x124204
  100938:	ba 08 00 00 00       	mov    $0x8,%edx
  10093d:	c6 05 05 42 12 00 8f 	movb   $0x8f,0x124205
  100944:	c6 05 0c 42 12 00 00 	movb   $0x0,0x12420c
  10094b:	b9 08 00 00 00       	mov    $0x8,%ecx
  100950:	c6 05 0d 42 12 00 8f 	movb   $0x8f,0x12420d
  100957:	c6 05 14 42 12 00 00 	movb   $0x0,0x124214
  10095e:	c6 05 15 42 12 00 8f 	movb   $0x8f,0x124215
  100965:	c6 05 1c 42 12 00 00 	movb   $0x0,0x12421c
  10096c:	c6 05 1d 42 12 00 8f 	movb   $0x8f,0x12421d
  100973:	c6 05 24 42 12 00 00 	movb   $0x0,0x124224
  10097a:	c6 05 25 42 12 00 8f 	movb   $0x8f,0x124225
  100981:	c6 05 2c 42 12 00 00 	movb   $0x0,0x12422c
  100988:	66 a3 2e 42 12 00    	mov    %ax,0x12422e
  10098e:	b8 68 03 10 00       	mov    $0x100368,%eax
  100993:	66 89 15 32 42 12 00 	mov    %dx,0x124232
  10099a:	66 a3 30 42 12 00    	mov    %ax,0x124230
  1009a0:	c1 e8 10             	shr    $0x10,%eax
  1009a3:	66 89 0d c2 45 12 00 	mov    %cx,0x1245c2
  1009aa:	66 a3 36 42 12 00    	mov    %ax,0x124236
  1009b0:	b8 6f 03 10 00       	mov    $0x10036f,%eax
  1009b5:	ba 08 00 00 00       	mov    $0x8,%edx
  1009ba:	66 a3 c0 45 12 00    	mov    %ax,0x1245c0
  1009c0:	c1 e8 10             	shr    $0x10,%eax
  1009c3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1009c8:	66 a3 c6 45 12 00    	mov    %ax,0x1245c6
  1009ce:	b8 7b 03 10 00       	mov    $0x10037b,%eax
  1009d3:	c6 05 2d 42 12 00 8f 	movb   $0x8f,0x12422d
  1009da:	66 a3 c0 42 12 00    	mov    %ax,0x1242c0
  1009e0:	c1 e8 10             	shr    $0x10,%eax
  1009e3:	c6 05 34 42 12 00 00 	movb   $0x0,0x124234
  1009ea:	66 a3 c6 42 12 00    	mov    %ax,0x1242c6
  1009f0:	b8 93 03 10 00       	mov    $0x100393,%eax
  1009f5:	c6 05 35 42 12 00 8f 	movb   $0x8f,0x124235
  1009fc:	66 a3 30 43 12 00    	mov    %ax,0x124330
  100a02:	c1 e8 10             	shr    $0x10,%eax
  100a05:	c6 05 c4 45 12 00 00 	movb   $0x0,0x1245c4
  100a0c:	66 a3 36 43 12 00    	mov    %ax,0x124336
  100a12:	b8 ff 07 00 00       	mov    $0x7ff,%eax
  100a17:	c6 05 c5 45 12 00 ef 	movb   $0xef,0x1245c5
  100a1e:	66 a3 80 41 12 00    	mov    %ax,0x124180
  100a24:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  100a29:	66 89 15 c2 42 12 00 	mov    %dx,0x1242c2
  100a30:	66 a3 82 41 12 00    	mov    %ax,0x124182
  100a36:	c1 e8 10             	shr    $0x10,%eax
  100a39:	c6 05 c4 42 12 00 00 	movb   $0x0,0x1242c4
  100a40:	66 a3 84 41 12 00    	mov    %ax,0x124184
  100a46:	c6 05 c5 42 12 00 8e 	movb   $0x8e,0x1242c5
  100a4d:	b8 80 41 12 00       	mov    $0x124180,%eax
  100a52:	66 89 0d 32 43 12 00 	mov    %cx,0x124332
  100a59:	c6 05 34 43 12 00 00 	movb   $0x0,0x124334
  100a60:	c6 05 35 43 12 00 8e 	movb   $0x8e,0x124335
  100a67:	0f 01 18             	lidtl  (%eax)
  100a6a:	5d                   	pop    %ebp
  100a6b:	c3                   	ret    
  100a6c:	66 90                	xchg   %ax,%ax
  100a6e:	66 90                	xchg   %ax,%ax

00100a70 <create_video_mapping>:
  100a70:	55                   	push   %ebp
  100a71:	89 e5                	mov    %esp,%ebp
  100a73:	83 ec 08             	sub    $0x8,%esp
  100a76:	68 58 17 10 00       	push   $0x101758
  100a7b:	6a 11                	push   $0x11
  100a7d:	68 cc 16 10 00       	push   $0x1016cc
  100a82:	68 f4 16 10 00       	push   $0x1016f4
  100a87:	e8 84 03 00 00       	call   100e10 <printk>
  100a8c:	b8 01 00 00 00       	mov    $0x1,%eax
  100a91:	d6                   	(bad)  
  100a92:	83 c4 10             	add    $0x10,%esp
  100a95:	c9                   	leave  
  100a96:	c3                   	ret    
  100a97:	89 f6                	mov    %esi,%esi
  100a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100aa0 <video_mapping_write_test>:
  100aa0:	55                   	push   %ebp
  100aa1:	31 c0                	xor    %eax,%eax
  100aa3:	89 e5                	mov    %esp,%ebp
  100aa5:	8d 76 00             	lea    0x0(%esi),%esi
  100aa8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
  100aaf:	83 c0 01             	add    $0x1,%eax
  100ab2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
  100ab7:	75 ef                	jne    100aa8 <video_mapping_write_test+0x8>
  100ab9:	5d                   	pop    %ebp
  100aba:	c3                   	ret    
  100abb:	90                   	nop
  100abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100ac0 <video_mapping_read_test>:
  100ac0:	55                   	push   %ebp
  100ac1:	89 e5                	mov    %esp,%ebp
  100ac3:	56                   	push   %esi
  100ac4:	be 01 00 00 00       	mov    $0x1,%esi
  100ac9:	53                   	push   %ebx
  100aca:	31 db                	xor    %ebx,%ebx
  100acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ad0:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
  100ad7:	74 24                	je     100afd <video_mapping_read_test+0x3d>
  100ad9:	83 ec 0c             	sub    $0xc,%esp
  100adc:	68 e5 16 10 00       	push   $0x1016e5
  100ae1:	68 40 17 10 00       	push   $0x101740
  100ae6:	6a 20                	push   $0x20
  100ae8:	68 cc 16 10 00       	push   $0x1016cc
  100aed:	68 c4 13 10 00       	push   $0x1013c4
  100af2:	e8 19 03 00 00       	call   100e10 <printk>
  100af7:	89 f0                	mov    %esi,%eax
  100af9:	d6                   	(bad)  
  100afa:	83 c4 20             	add    $0x20,%esp
  100afd:	83 c3 01             	add    $0x1,%ebx
  100b00:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
  100b06:	75 c8                	jne    100ad0 <video_mapping_read_test+0x10>
  100b08:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b0b:	5b                   	pop    %ebx
  100b0c:	5e                   	pop    %esi
  100b0d:	5d                   	pop    %ebp
  100b0e:	c3                   	ret    
  100b0f:	90                   	nop

00100b10 <video_mapping_clear>:
  100b10:	55                   	push   %ebp
  100b11:	89 e5                	mov    %esp,%ebp
  100b13:	83 ec 0c             	sub    $0xc,%esp
  100b16:	68 00 fa 00 00       	push   $0xfa00
  100b1b:	6a 00                	push   $0x0
  100b1d:	68 00 00 0a 00       	push   $0xa0000
  100b22:	e8 e1 07 00 00       	call   101308 <memset>
  100b27:	83 c4 10             	add    $0x10,%esp
  100b2a:	c9                   	leave  
  100b2b:	c3                   	ret    
  100b2c:	66 90                	xchg   %ax,%ax
  100b2e:	66 90                	xchg   %ax,%ax

00100b30 <get_updir>:
  100b30:	55                   	push   %ebp
  100b31:	b8 00 60 12 00       	mov    $0x126000,%eax
  100b36:	89 e5                	mov    %esp,%ebp
  100b38:	5d                   	pop    %ebp
  100b39:	c3                   	ret    
  100b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b40 <get_ucr3>:
  100b40:	55                   	push   %ebp
  100b41:	a1 04 50 12 00       	mov    0x125004,%eax
  100b46:	89 e5                	mov    %esp,%ebp
  100b48:	5d                   	pop    %ebp
  100b49:	c3                   	ret    
  100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b50 <mm_brk>:
  100b50:	55                   	push   %ebp
  100b51:	89 e5                	mov    %esp,%ebp
  100b53:	53                   	push   %ebx
  100b54:	83 ec 04             	sub    $0x4,%esp
  100b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b5a:	a1 00 50 12 00       	mov    0x125000,%eax
  100b5f:	39 d8                	cmp    %ebx,%eax
  100b61:	73 11                	jae    100b74 <mm_brk+0x24>
  100b63:	89 da                	mov    %ebx,%edx
  100b65:	83 ec 08             	sub    $0x8,%esp
  100b68:	29 c2                	sub    %eax,%edx
  100b6a:	52                   	push   %edx
  100b6b:	50                   	push   %eax
  100b6c:	e8 ef f4 ff ff       	call   100060 <mm_malloc>
  100b71:	83 c4 10             	add    $0x10,%esp
  100b74:	89 1d 00 50 12 00    	mov    %ebx,0x125000
  100b7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b7d:	c9                   	leave  
  100b7e:	c3                   	ret    
  100b7f:	90                   	nop

00100b80 <init_mm>:
  100b80:	55                   	push   %ebp
  100b81:	89 e5                	mov    %esp,%ebp
  100b83:	53                   	push   %ebx
  100b84:	83 ec 04             	sub    $0x4,%esp
  100b87:	e8 44 00 00 00       	call   100bd0 <get_kpdir>
  100b8c:	83 ec 04             	sub    $0x4,%esp
  100b8f:	89 c3                	mov    %eax,%ebx
  100b91:	68 00 10 00 00       	push   $0x1000
  100b96:	6a 00                	push   $0x0
  100b98:	68 00 60 12 00       	push   $0x126000
  100b9d:	e8 66 07 00 00       	call   101308 <memset>
  100ba2:	83 c4 0c             	add    $0xc,%esp
  100ba5:	68 80 00 00 00       	push   $0x80
  100baa:	53                   	push   %ebx
  100bab:	68 00 60 12 00       	push   $0x126000
  100bb0:	e8 0b 07 00 00       	call   1012c0 <memcpy>
  100bb5:	b8 00 60 12 00       	mov    $0x126000,%eax
  100bba:	83 c4 10             	add    $0x10,%esp
  100bbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bc0:	25 00 fc ff ff       	and    $0xfffffc00,%eax
  100bc5:	a3 04 50 12 00       	mov    %eax,0x125004
  100bca:	c9                   	leave  
  100bcb:	c3                   	ret    
  100bcc:	66 90                	xchg   %ax,%ax
  100bce:	66 90                	xchg   %ax,%ax

00100bd0 <get_kpdir>:
  100bd0:	55                   	push   %ebp
  100bd1:	b8 00 80 14 00       	mov    $0x148000,%eax
  100bd6:	89 e5                	mov    %esp,%ebp
  100bd8:	5d                   	pop    %ebp
  100bd9:	c3                   	ret    
  100bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100be0 <init_page>:
  100be0:	55                   	push   %ebp
  100be1:	89 e5                	mov    %esp,%ebp
  100be3:	57                   	push   %edi
  100be4:	83 ec 08             	sub    $0x8,%esp
  100be7:	68 00 10 00 00       	push   $0x1000
  100bec:	6a 00                	push   $0x0
  100bee:	68 00 80 14 00       	push   $0x148000
  100bf3:	e8 10 07 00 00       	call   101308 <memset>
  100bf8:	83 c4 10             	add    $0x10,%esp
  100bfb:	b9 00 80 14 00       	mov    $0x148000,%ecx
  100c00:	b8 00 80 12 00       	mov    $0x128000,%eax
  100c05:	8d 76 00             	lea    0x0(%esi),%esi
  100c08:	89 c2                	mov    %eax,%edx
  100c0a:	05 00 10 00 00       	add    $0x1000,%eax
  100c0f:	83 c1 04             	add    $0x4,%ecx
  100c12:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  100c18:	83 ca 07             	or     $0x7,%edx
  100c1b:	89 51 fc             	mov    %edx,-0x4(%ecx)
  100c1e:	3d 00 80 14 00       	cmp    $0x148000,%eax
  100c23:	75 e3                	jne    100c08 <init_page+0x28>
  100c25:	bf fc 7f 14 00       	mov    $0x147ffc,%edi
  100c2a:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
  100c2f:	fd                   	std    
  100c30:	ab                   	stos   %eax,%es:(%edi)
  100c31:	2d 00 10 00 00       	sub    $0x1000,%eax
  100c36:	7d f8                	jge    100c30 <init_page+0x50>
  100c38:	b8 00 80 14 00       	mov    $0x148000,%eax
  100c3d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100c42:	0f 22 d8             	mov    %eax,%cr3
  100c45:	0f 20 c0             	mov    %cr0,%eax
  100c48:	0d 00 00 00 80       	or     $0x80000000,%eax
  100c4d:	0f 22 c0             	mov    %eax,%cr0
  100c50:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100c53:	c9                   	leave  
  100c54:	c3                   	ret    
  100c55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100c60 <init_segment>:
  100c60:	55                   	push   %ebp
  100c61:	89 e5                	mov    %esp,%ebp
  100c63:	83 ec 0c             	sub    $0xc,%esp
  100c66:	6a 18                	push   $0x18
  100c68:	6a 00                	push   $0x0
  100c6a:	68 08 70 12 00       	push   $0x127008
  100c6f:	e8 94 06 00 00       	call   101308 <memset>
  100c74:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c79:	31 c9                	xor    %ecx,%ecx
  100c7b:	b8 08 70 12 00       	mov    $0x127008,%eax
  100c80:	66 89 15 10 70 12 00 	mov    %dx,0x127010
  100c87:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c8c:	66 89 0d 12 70 12 00 	mov    %cx,0x127012
  100c93:	66 89 15 18 70 12 00 	mov    %dx,0x127018
  100c9a:	ba 17 00 00 00       	mov    $0x17,%edx
  100c9f:	31 c9                	xor    %ecx,%ecx
  100ca1:	66 89 15 00 70 12 00 	mov    %dx,0x127000
  100ca8:	66 a3 02 70 12 00    	mov    %ax,0x127002
  100cae:	c1 e8 10             	shr    $0x10,%eax
  100cb1:	66 a3 04 70 12 00    	mov    %ax,0x127004
  100cb7:	c6 05 14 70 12 00 00 	movb   $0x0,0x127014
  100cbe:	b8 00 70 12 00       	mov    $0x127000,%eax
  100cc3:	c6 05 15 70 12 00 9a 	movb   $0x9a,0x127015
  100cca:	c6 05 16 70 12 00 cf 	movb   $0xcf,0x127016
  100cd1:	c6 05 17 70 12 00 00 	movb   $0x0,0x127017
  100cd8:	66 89 0d 1a 70 12 00 	mov    %cx,0x12701a
  100cdf:	c6 05 1c 70 12 00 00 	movb   $0x0,0x12701c
  100ce6:	c6 05 1d 70 12 00 92 	movb   $0x92,0x12701d
  100ced:	c6 05 1e 70 12 00 cf 	movb   $0xcf,0x12701e
  100cf4:	c6 05 1f 70 12 00 00 	movb   $0x0,0x12701f
  100cfb:	0f 01 10             	lgdtl  (%eax)
  100cfe:	83 c4 10             	add    $0x10,%esp
  100d01:	c9                   	leave  
  100d02:	c3                   	ret    
  100d03:	66 90                	xchg   %ax,%ax
  100d05:	66 90                	xchg   %ax,%ax
  100d07:	66 90                	xchg   %ax,%ax
  100d09:	66 90                	xchg   %ax,%ax
  100d0b:	66 90                	xchg   %ax,%ax
  100d0d:	66 90                	xchg   %ax,%ax
  100d0f:	90                   	nop

00100d10 <loader>:
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
  100d13:	56                   	push   %esi
  100d14:	53                   	push   %ebx
  100d15:	8d 9d f8 ef ff ff    	lea    -0x1008(%ebp),%ebx
  100d1b:	81 ec 14 10 00 00    	sub    $0x1014,%esp
  100d21:	68 00 10 00 00       	push   $0x1000
  100d26:	6a 00                	push   $0x0
  100d28:	53                   	push   %ebx
  100d29:	e8 52 01 00 00       	call   100e80 <ramdisk_read>
  100d2e:	83 c4 10             	add    $0x10,%esp
  100d31:	81 bd f8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1008(%ebp)
  100d38:	45 4c 46 
  100d3b:	74 06                	je     100d43 <loader+0x33>
  100d3d:	b8 01 00 00 00       	mov    $0x1,%eax
  100d42:	d6                   	(bad)  
  100d43:	8b 95 14 f0 ff ff    	mov    -0xfec(%ebp),%edx
  100d49:	83 fa 34             	cmp    $0x34,%edx
  100d4c:	74 06                	je     100d54 <loader+0x44>
  100d4e:	b8 01 00 00 00       	mov    $0x1,%eax
  100d53:	d6                   	(bad)  
  100d54:	31 f6                	xor    %esi,%esi
  100d56:	66 83 bd 24 f0 ff ff 	cmpw   $0x0,-0xfdc(%ebp)
  100d5d:	00 
  100d5e:	8d 5c 13 10          	lea    0x10(%ebx,%edx,1),%ebx
  100d62:	75 1d                	jne    100d81 <loader+0x71>
  100d64:	eb 52                	jmp    100db8 <loader+0xa8>
  100d66:	8d 76 00             	lea    0x0(%esi),%esi
  100d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100d70:	0f b7 85 24 f0 ff ff 	movzwl -0xfdc(%ebp),%eax
  100d77:	83 c6 01             	add    $0x1,%esi
  100d7a:	83 c3 20             	add    $0x20,%ebx
  100d7d:	39 f0                	cmp    %esi,%eax
  100d7f:	7e 37                	jle    100db8 <loader+0xa8>
  100d81:	83 7b f0 01          	cmpl   $0x1,-0x10(%ebx)
  100d85:	75 e9                	jne    100d70 <loader+0x60>
  100d87:	83 ec 04             	sub    $0x4,%esp
  100d8a:	ff 33                	pushl  (%ebx)
  100d8c:	ff 73 f4             	pushl  -0xc(%ebx)
  100d8f:	ff 73 f8             	pushl  -0x8(%ebx)
  100d92:	e8 e9 00 00 00       	call   100e80 <ramdisk_read>
  100d97:	8b 03                	mov    (%ebx),%eax
  100d99:	8b 53 04             	mov    0x4(%ebx),%edx
  100d9c:	83 c4 0c             	add    $0xc,%esp
  100d9f:	29 c2                	sub    %eax,%edx
  100da1:	52                   	push   %edx
  100da2:	6a 00                	push   $0x0
  100da4:	03 43 f4             	add    -0xc(%ebx),%eax
  100da7:	03 43 f8             	add    -0x8(%ebx),%eax
  100daa:	50                   	push   %eax
  100dab:	e8 58 05 00 00       	call   101308 <memset>
  100db0:	83 c4 10             	add    $0x10,%esp
  100db3:	eb bb                	jmp    100d70 <loader+0x60>
  100db5:	8d 76 00             	lea    0x0(%esi),%esi
  100db8:	8b 85 10 f0 ff ff    	mov    -0xff0(%ebp),%eax
  100dbe:	89 85 f4 ef ff ff    	mov    %eax,-0x100c(%ebp)
  100dc4:	8b 85 f4 ef ff ff    	mov    -0x100c(%ebp),%eax
  100dca:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dcd:	5b                   	pop    %ebx
  100dce:	5e                   	pop    %esi
  100dcf:	5d                   	pop    %ebp
  100dd0:	c3                   	ret    
  100dd1:	66 90                	xchg   %ax,%ax
  100dd3:	66 90                	xchg   %ax,%ax
  100dd5:	66 90                	xchg   %ax,%ax
  100dd7:	66 90                	xchg   %ax,%ax
  100dd9:	66 90                	xchg   %ax,%ax
  100ddb:	66 90                	xchg   %ax,%ax
  100ddd:	66 90                	xchg   %ax,%ax
  100ddf:	90                   	nop

00100de0 <sbrk>:
  100de0:	55                   	push   %ebp
  100de1:	89 e5                	mov    %esp,%ebp
  100de3:	83 ec 08             	sub    $0x8,%esp
  100de6:	68 83 17 10 00       	push   $0x101783
  100deb:	6a 08                	push   $0x8
  100ded:	68 6d 17 10 00       	push   $0x10176d
  100df2:	68 64 14 10 00       	push   $0x101464
  100df7:	e8 14 00 00 00       	call   100e10 <printk>
  100dfc:	b8 01 00 00 00       	mov    $0x1,%eax
  100e01:	d6                   	(bad)  
  100e02:	30 c0                	xor    %al,%al
  100e04:	c9                   	leave  
  100e05:	c3                   	ret    
  100e06:	66 90                	xchg   %ax,%ax
  100e08:	66 90                	xchg   %ax,%ax
  100e0a:	66 90                	xchg   %ax,%ax
  100e0c:	66 90                	xchg   %ax,%ax
  100e0e:	66 90                	xchg   %ax,%ax

00100e10 <printk>:
  100e10:	55                   	push   %ebp
  100e11:	89 e5                	mov    %esp,%ebp
  100e13:	5d                   	pop    %ebp
  100e14:	c3                   	ret    
  100e15:	66 90                	xchg   %ax,%ax
  100e17:	66 90                	xchg   %ax,%ax
  100e19:	66 90                	xchg   %ax,%ax
  100e1b:	66 90                	xchg   %ax,%ax
  100e1d:	66 90                	xchg   %ax,%ax
  100e1f:	90                   	nop

00100e20 <init_serial>:
  100e20:	55                   	push   %ebp
  100e21:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100e26:	31 c0                	xor    %eax,%eax
  100e28:	89 e5                	mov    %esp,%ebp
  100e2a:	ee                   	out    %al,(%dx)
  100e2b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  100e30:	b2 fb                	mov    $0xfb,%dl
  100e32:	ee                   	out    %al,(%dx)
  100e33:	b8 01 00 00 00       	mov    $0x1,%eax
  100e38:	b2 f8                	mov    $0xf8,%dl
  100e3a:	ee                   	out    %al,(%dx)
  100e3b:	31 c0                	xor    %eax,%eax
  100e3d:	b2 f9                	mov    $0xf9,%dl
  100e3f:	ee                   	out    %al,(%dx)
  100e40:	b8 03 00 00 00       	mov    $0x3,%eax
  100e45:	b2 fb                	mov    $0xfb,%dl
  100e47:	ee                   	out    %al,(%dx)
  100e48:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  100e4d:	b2 fa                	mov    $0xfa,%dl
  100e4f:	ee                   	out    %al,(%dx)
  100e50:	b8 0b 00 00 00       	mov    $0xb,%eax
  100e55:	b2 fc                	mov    $0xfc,%dl
  100e57:	ee                   	out    %al,(%dx)
  100e58:	5d                   	pop    %ebp
  100e59:	c3                   	ret    
  100e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100e60 <serial_printc>:
  100e60:	55                   	push   %ebp
  100e61:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100e66:	89 e5                	mov    %esp,%ebp
  100e68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e6b:	90                   	nop
  100e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100e70:	ec                   	in     (%dx),%al
  100e71:	a8 20                	test   $0x20,%al
  100e73:	74 fb                	je     100e70 <serial_printc+0x10>
  100e75:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100e7a:	89 c8                	mov    %ecx,%eax
  100e7c:	ee                   	out    %al,(%dx)
  100e7d:	5d                   	pop    %ebp
  100e7e:	c3                   	ret    
  100e7f:	90                   	nop

00100e80 <ramdisk_read>:
  100e80:	55                   	push   %ebp
  100e81:	89 e5                	mov    %esp,%ebp
  100e83:	53                   	push   %ebx
  100e84:	8b 55 0c             	mov    0xc(%ebp),%edx
  100e87:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100e8a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100e8d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  100e90:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
  100e95:	76 06                	jbe    100e9d <ramdisk_read+0x1d>
  100e97:	b8 01 00 00 00       	mov    $0x1,%eax
  100e9c:	d6                   	(bad)  
  100e9d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ea0:	89 4d 10             	mov    %ecx,0x10(%ebp)
  100ea3:	89 55 0c             	mov    %edx,0xc(%ebp)
  100ea6:	5b                   	pop    %ebx
  100ea7:	5d                   	pop    %ebp
  100ea8:	e9 13 04 00 00       	jmp    1012c0 <memcpy>
  100ead:	8d 76 00             	lea    0x0(%esi),%esi

00100eb0 <ramdisk_write>:
  100eb0:	55                   	push   %ebp
  100eb1:	89 e5                	mov    %esp,%ebp
  100eb3:	53                   	push   %ebx
  100eb4:	8b 55 0c             	mov    0xc(%ebp),%edx
  100eb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100eba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ebd:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  100ec0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
  100ec5:	76 06                	jbe    100ecd <ramdisk_write+0x1d>
  100ec7:	b8 01 00 00 00       	mov    $0x1,%eax
  100ecc:	d6                   	(bad)  
  100ecd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100ed0:	89 4d 10             	mov    %ecx,0x10(%ebp)
  100ed3:	89 55 08             	mov    %edx,0x8(%ebp)
  100ed6:	5b                   	pop    %ebx
  100ed7:	5d                   	pop    %ebp
  100ed8:	e9 e3 03 00 00       	jmp    1012c0 <memcpy>
  100edd:	66 90                	xchg   %ax,%ax
  100edf:	90                   	nop

00100ee0 <ide_intr>:
  100ee0:	55                   	push   %ebp
  100ee1:	c7 05 04 90 14 00 01 	movl   $0x1,0x149004
  100ee8:	00 00 00 
  100eeb:	89 e5                	mov    %esp,%ebp
  100eed:	5d                   	pop    %ebp
  100eee:	c3                   	ret    
  100eef:	90                   	nop

00100ef0 <ide_writeback>:
  100ef0:	a1 00 90 14 00       	mov    0x149000,%eax
  100ef5:	83 c0 01             	add    $0x1,%eax
  100ef8:	83 f8 64             	cmp    $0x64,%eax
  100efb:	a3 00 90 14 00       	mov    %eax,0x149000
  100f00:	74 06                	je     100f08 <ide_writeback+0x18>
  100f02:	c3                   	ret    
  100f03:	90                   	nop
  100f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f08:	55                   	push   %ebp
  100f09:	89 e5                	mov    %esp,%ebp
  100f0b:	83 ec 08             	sub    $0x8,%esp
  100f0e:	e8 dd 01 00 00       	call   1010f0 <buf_writeback>
  100f13:	c7 05 00 90 14 00 00 	movl   $0x0,0x149000
  100f1a:	00 00 00 
  100f1d:	c9                   	leave  
  100f1e:	c3                   	ret    
  100f1f:	90                   	nop

00100f20 <ide_read>:
  100f20:	55                   	push   %ebp
  100f21:	89 e5                	mov    %esp,%ebp
  100f23:	57                   	push   %edi
  100f24:	56                   	push   %esi
  100f25:	53                   	push   %ebx
  100f26:	83 ec 0c             	sub    $0xc,%esp
  100f29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f2c:	8b 45 10             	mov    0x10(%ebp),%eax
  100f2f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100f32:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100f35:	29 df                	sub    %ebx,%edi
  100f37:	85 c0                	test   %eax,%eax
  100f39:	74 1b                	je     100f56 <ide_read+0x36>
  100f3b:	90                   	nop
  100f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f40:	83 ec 0c             	sub    $0xc,%esp
  100f43:	53                   	push   %ebx
  100f44:	e8 07 02 00 00       	call   101150 <read_byte>
  100f49:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  100f4c:	83 c3 01             	add    $0x1,%ebx
  100f4f:	83 c4 10             	add    $0x10,%esp
  100f52:	39 f3                	cmp    %esi,%ebx
  100f54:	75 ea                	jne    100f40 <ide_read+0x20>
  100f56:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f59:	5b                   	pop    %ebx
  100f5a:	5e                   	pop    %esi
  100f5b:	5f                   	pop    %edi
  100f5c:	5d                   	pop    %ebp
  100f5d:	c3                   	ret    
  100f5e:	66 90                	xchg   %ax,%ax

00100f60 <ide_write>:
  100f60:	55                   	push   %ebp
  100f61:	89 e5                	mov    %esp,%ebp
  100f63:	57                   	push   %edi
  100f64:	56                   	push   %esi
  100f65:	53                   	push   %ebx
  100f66:	83 ec 0c             	sub    $0xc,%esp
  100f69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f6c:	8b 45 10             	mov    0x10(%ebp),%eax
  100f6f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100f72:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100f75:	29 df                	sub    %ebx,%edi
  100f77:	85 c0                	test   %eax,%eax
  100f79:	74 1d                	je     100f98 <ide_write+0x38>
  100f7b:	90                   	nop
  100f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f80:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  100f84:	83 ec 08             	sub    $0x8,%esp
  100f87:	50                   	push   %eax
  100f88:	53                   	push   %ebx
  100f89:	83 c3 01             	add    $0x1,%ebx
  100f8c:	e8 ef 01 00 00       	call   101180 <write_byte>
  100f91:	83 c4 10             	add    $0x10,%esp
  100f94:	39 f3                	cmp    %esi,%ebx
  100f96:	75 e8                	jne    100f80 <ide_write+0x20>
  100f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f9b:	5b                   	pop    %ebx
  100f9c:	5e                   	pop    %esi
  100f9d:	5f                   	pop    %edi
  100f9e:	5d                   	pop    %ebp
  100f9f:	c3                   	ret    

00100fa0 <clear_ide_intr>:
  100fa0:	55                   	push   %ebp
  100fa1:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100fa8:	00 00 00 
  100fab:	89 e5                	mov    %esp,%ebp
  100fad:	5d                   	pop    %ebp
  100fae:	c3                   	ret    
  100faf:	90                   	nop

00100fb0 <wait_ide_intr>:
  100fb0:	a1 04 90 14 00       	mov    0x149004,%eax
  100fb5:	55                   	push   %ebp
  100fb6:	89 e5                	mov    %esp,%ebp
  100fb8:	85 c0                	test   %eax,%eax
  100fba:	75 0e                	jne    100fca <wait_ide_intr+0x1a>
  100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100fc0:	f4                   	hlt    
  100fc1:	a1 04 90 14 00       	mov    0x149004,%eax
  100fc6:	85 c0                	test   %eax,%eax
  100fc8:	74 f6                	je     100fc0 <wait_ide_intr+0x10>
  100fca:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100fd1:	00 00 00 
  100fd4:	5d                   	pop    %ebp
  100fd5:	c3                   	ret    
  100fd6:	8d 76 00             	lea    0x0(%esi),%esi
  100fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100fe0 <init_ide>:
  100fe0:	55                   	push   %ebp
  100fe1:	89 e5                	mov    %esp,%ebp
  100fe3:	83 ec 08             	sub    $0x8,%esp
  100fe6:	e8 d5 00 00 00       	call   1010c0 <buf_init>
  100feb:	83 ec 08             	sub    $0x8,%esp
  100fee:	68 f0 0e 10 00       	push   $0x100ef0
  100ff3:	6a 00                	push   $0x0
  100ff5:	e8 a6 f4 ff ff       	call   1004a0 <add_irq_handle>
  100ffa:	58                   	pop    %eax
  100ffb:	5a                   	pop    %edx
  100ffc:	68 e0 0e 10 00       	push   $0x100ee0
  101001:	6a 0e                	push   $0xe
  101003:	e8 98 f4 ff ff       	call   1004a0 <add_irq_handle>
  101008:	83 c4 10             	add    $0x10,%esp
  10100b:	c9                   	leave  
  10100c:	c3                   	ret    
  10100d:	66 90                	xchg   %ax,%ax
  10100f:	90                   	nop

00101010 <buf_fetch>:
  101010:	55                   	push   %ebp
  101011:	89 c2                	mov    %eax,%edx
  101013:	89 e5                	mov    %esp,%ebp
  101015:	57                   	push   %edi
  101016:	56                   	push   %esi
  101017:	53                   	push   %ebx
  101018:	89 c3                	mov    %eax,%ebx
  10101a:	83 e3 7f             	and    $0x7f,%ebx
  10101d:	89 d8                	mov    %ebx,%eax
  10101f:	83 ec 1c             	sub    $0x1c,%esp
  101022:	c1 e0 09             	shl    $0x9,%eax
  101025:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
  101028:	8d 81 40 90 14 00    	lea    0x149040(%ecx),%eax
  10102e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
  101032:	74 5c                	je     101090 <buf_fetch+0x80>
  101034:	89 d7                	mov    %edx,%edi
  101036:	89 da                	mov    %ebx,%edx
  101038:	c1 e2 09             	shl    $0x9,%edx
  10103b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  10103e:	8d 91 40 90 14 00    	lea    0x149040(%ecx),%edx
  101044:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
  10104a:	74 54                	je     1010a0 <buf_fetch+0x90>
  10104c:	8d 72 06             	lea    0x6(%edx),%esi
  10104f:	83 ec 08             	sub    $0x8,%esp
  101052:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101055:	57                   	push   %edi
  101056:	56                   	push   %esi
  101057:	e8 a4 01 00 00       	call   101200 <disk_do_read>
  10105c:	89 da                	mov    %ebx,%edx
  10105e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101061:	83 c4 10             	add    $0x10,%esp
  101064:	c1 e2 09             	shl    $0x9,%edx
  101067:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  10106a:	c6 81 44 90 14 00 01 	movb   $0x1,0x149044(%ecx)
  101071:	89 b9 40 90 14 00    	mov    %edi,0x149040(%ecx)
  101077:	c6 81 45 90 14 00 00 	movb   $0x0,0x149045(%ecx)
  10107e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101081:	5b                   	pop    %ebx
  101082:	5e                   	pop    %esi
  101083:	5f                   	pop    %edi
  101084:	5d                   	pop    %ebp
  101085:	c3                   	ret    
  101086:	8d 76 00             	lea    0x0(%esi),%esi
  101089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  101090:	39 91 40 90 14 00    	cmp    %edx,0x149040(%ecx)
  101096:	75 9c                	jne    101034 <buf_fetch+0x24>
  101098:	eb e4                	jmp    10107e <buf_fetch+0x6e>
  10109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1010a0:	8d 72 06             	lea    0x6(%edx),%esi
  1010a3:	83 ec 08             	sub    $0x8,%esp
  1010a6:	ff b1 40 90 14 00    	pushl  0x149040(%ecx)
  1010ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1010af:	56                   	push   %esi
  1010b0:	e8 8b 01 00 00       	call   101240 <disk_do_write>
  1010b5:	83 c4 10             	add    $0x10,%esp
  1010b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1010bb:	eb 92                	jmp    10104f <buf_fetch+0x3f>
  1010bd:	8d 76 00             	lea    0x0(%esi),%esi

001010c0 <buf_init>:
  1010c0:	55                   	push   %ebp
  1010c1:	b8 44 90 14 00       	mov    $0x149044,%eax
  1010c6:	89 e5                	mov    %esp,%ebp
  1010c8:	90                   	nop
  1010c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1010d0:	c6 00 00             	movb   $0x0,(%eax)
  1010d3:	05 08 02 00 00       	add    $0x208,%eax
  1010d8:	3d 44 94 15 00       	cmp    $0x159444,%eax
  1010dd:	75 f1                	jne    1010d0 <buf_init+0x10>
  1010df:	5d                   	pop    %ebp
  1010e0:	c3                   	ret    
  1010e1:	eb 0d                	jmp    1010f0 <buf_writeback>
  1010e3:	90                   	nop
  1010e4:	90                   	nop
  1010e5:	90                   	nop
  1010e6:	90                   	nop
  1010e7:	90                   	nop
  1010e8:	90                   	nop
  1010e9:	90                   	nop
  1010ea:	90                   	nop
  1010eb:	90                   	nop
  1010ec:	90                   	nop
  1010ed:	90                   	nop
  1010ee:	90                   	nop
  1010ef:	90                   	nop

001010f0 <buf_writeback>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	53                   	push   %ebx
  1010f4:	bb 46 90 14 00       	mov    $0x149046,%ebx
  1010f9:	83 ec 04             	sub    $0x4,%esp
  1010fc:	eb 10                	jmp    10110e <buf_writeback+0x1e>
  1010fe:	66 90                	xchg   %ax,%ax
  101100:	81 c3 08 02 00 00    	add    $0x208,%ebx
  101106:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  10110c:	74 32                	je     101140 <buf_writeback+0x50>
  10110e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
  101112:	75 ec                	jne    101100 <buf_writeback+0x10>
  101114:	83 ec 08             	sub    $0x8,%esp
  101117:	ff 73 fa             	pushl  -0x6(%ebx)
  10111a:	53                   	push   %ebx
  10111b:	81 c3 08 02 00 00    	add    $0x208,%ebx
  101121:	e8 1a 01 00 00       	call   101240 <disk_do_write>
  101126:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
  10112d:	83 c4 10             	add    $0x10,%esp
  101130:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  101136:	75 d6                	jne    10110e <buf_writeback+0x1e>
  101138:	90                   	nop
  101139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101140:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101143:	c9                   	leave  
  101144:	c3                   	ret    
  101145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101150 <read_byte>:
  101150:	55                   	push   %ebp
  101151:	89 e5                	mov    %esp,%ebp
  101153:	53                   	push   %ebx
  101154:	83 ec 04             	sub    $0x4,%esp
  101157:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10115a:	89 d8                	mov    %ebx,%eax
  10115c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101162:	c1 e8 09             	shr    $0x9,%eax
  101165:	e8 a6 fe ff ff       	call   101010 <buf_fetch>
  10116a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
  10116f:	83 c4 04             	add    $0x4,%esp
  101172:	5b                   	pop    %ebx
  101173:	5d                   	pop    %ebp
  101174:	c3                   	ret    
  101175:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101180 <write_byte>:
  101180:	55                   	push   %ebp
  101181:	89 e5                	mov    %esp,%ebp
  101183:	56                   	push   %esi
  101184:	53                   	push   %ebx
  101185:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101188:	8b 75 0c             	mov    0xc(%ebp),%esi
  10118b:	89 d8                	mov    %ebx,%eax
  10118d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101193:	c1 e8 09             	shr    $0x9,%eax
  101196:	e8 75 fe ff ff       	call   101010 <buf_fetch>
  10119b:	89 f2                	mov    %esi,%edx
  10119d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
  1011a1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
  1011a5:	5b                   	pop    %ebx
  1011a6:	5e                   	pop    %esi
  1011a7:	5d                   	pop    %ebp
  1011a8:	c3                   	ret    
  1011a9:	66 90                	xchg   %ax,%ax
  1011ab:	66 90                	xchg   %ax,%ax
  1011ad:	66 90                	xchg   %ax,%ax
  1011af:	90                   	nop

001011b0 <ide_prepare>:
  1011b0:	55                   	push   %ebp
  1011b1:	89 c1                	mov    %eax,%ecx
  1011b3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1011b8:	89 e5                	mov    %esp,%ebp
  1011ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1011c0:	ec                   	in     (%dx),%al
  1011c1:	83 e0 c0             	and    $0xffffffc0,%eax
  1011c4:	3c 40                	cmp    $0x40,%al
  1011c6:	75 f8                	jne    1011c0 <ide_prepare+0x10>
  1011c8:	ba f1 01 00 00       	mov    $0x1f1,%edx
  1011cd:	31 c0                	xor    %eax,%eax
  1011cf:	ee                   	out    %al,(%dx)
  1011d0:	b8 01 00 00 00       	mov    $0x1,%eax
  1011d5:	b2 f2                	mov    $0xf2,%dl
  1011d7:	ee                   	out    %al,(%dx)
  1011d8:	b2 f3                	mov    $0xf3,%dl
  1011da:	89 c8                	mov    %ecx,%eax
  1011dc:	ee                   	out    %al,(%dx)
  1011dd:	89 c8                	mov    %ecx,%eax
  1011df:	b2 f4                	mov    $0xf4,%dl
  1011e1:	c1 e8 08             	shr    $0x8,%eax
  1011e4:	ee                   	out    %al,(%dx)
  1011e5:	89 c8                	mov    %ecx,%eax
  1011e7:	b2 f5                	mov    $0xf5,%dl
  1011e9:	c1 e8 10             	shr    $0x10,%eax
  1011ec:	ee                   	out    %al,(%dx)
  1011ed:	89 c8                	mov    %ecx,%eax
  1011ef:	b2 f6                	mov    $0xf6,%dl
  1011f1:	c1 e8 18             	shr    $0x18,%eax
  1011f4:	83 c8 e0             	or     $0xffffffe0,%eax
  1011f7:	ee                   	out    %al,(%dx)
  1011f8:	5d                   	pop    %ebp
  1011f9:	c3                   	ret    
  1011fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101200 <disk_do_read>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	53                   	push   %ebx
  101204:	8b 45 0c             	mov    0xc(%ebp),%eax
  101207:	e8 a4 ff ff ff       	call   1011b0 <ide_prepare>
  10120c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101211:	b8 20 00 00 00       	mov    $0x20,%eax
  101216:	ee                   	out    %al,(%dx)
  101217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10121a:	b2 f0                	mov    $0xf0,%dl
  10121c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101228:	ed                   	in     (%dx),%eax
  101229:	89 01                	mov    %eax,(%ecx)
  10122b:	83 c1 04             	add    $0x4,%ecx
  10122e:	39 d9                	cmp    %ebx,%ecx
  101230:	75 f6                	jne    101228 <disk_do_read+0x28>
  101232:	5b                   	pop    %ebx
  101233:	5d                   	pop    %ebp
  101234:	c3                   	ret    
  101235:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101240 <disk_do_write>:
  101240:	55                   	push   %ebp
  101241:	89 e5                	mov    %esp,%ebp
  101243:	53                   	push   %ebx
  101244:	8b 45 0c             	mov    0xc(%ebp),%eax
  101247:	e8 64 ff ff ff       	call   1011b0 <ide_prepare>
  10124c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101251:	b8 30 00 00 00       	mov    $0x30,%eax
  101256:	ee                   	out    %al,(%dx)
  101257:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10125a:	b2 f0                	mov    $0xf0,%dl
  10125c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101268:	8b 01                	mov    (%ecx),%eax
  10126a:	ef                   	out    %eax,(%dx)
  10126b:	83 c1 04             	add    $0x4,%ecx
  10126e:	39 d9                	cmp    %ebx,%ecx
  101270:	75 f6                	jne    101268 <disk_do_write+0x28>
  101272:	5b                   	pop    %ebx
  101273:	5d                   	pop    %ebp
  101274:	c3                   	ret    
  101275:	66 90                	xchg   %ax,%ax
  101277:	66 90                	xchg   %ax,%ax
  101279:	66 90                	xchg   %ax,%ax
  10127b:	66 90                	xchg   %ax,%ax
  10127d:	66 90                	xchg   %ax,%ax
  10127f:	90                   	nop

00101280 <dma_prepare>:
  101280:	55                   	push   %ebp
  101281:	89 e5                	mov    %esp,%ebp
  101283:	83 ec 08             	sub    $0x8,%esp
  101286:	68 a4 17 10 00       	push   $0x1017a4
  10128b:	6a 1d                	push   $0x1d
  10128d:	68 88 17 10 00       	push   $0x101788
  101292:	68 f4 16 10 00       	push   $0x1016f4
  101297:	e8 74 fb ff ff       	call   100e10 <printk>
  10129c:	b8 01 00 00 00       	mov    $0x1,%eax
  1012a1:	d6                   	(bad)  
  1012a2:	83 c4 10             	add    $0x10,%esp
  1012a5:	c9                   	leave  
  1012a6:	c3                   	ret    
  1012a7:	89 f6                	mov    %esi,%esi
  1012a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001012b0 <dma_issue_read>:
  1012b0:	55                   	push   %ebp
  1012b1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
  1012b6:	89 e5                	mov    %esp,%ebp
  1012b8:	ec                   	in     (%dx),%al
  1012b9:	83 c8 09             	or     $0x9,%eax
  1012bc:	ee                   	out    %al,(%dx)
  1012bd:	5d                   	pop    %ebp
  1012be:	c3                   	ret    
  1012bf:	90                   	nop

001012c0 <memcpy>:
  1012c0:	55                   	push   %ebp
  1012c1:	89 e5                	mov    %esp,%ebp
  1012c3:	56                   	push   %esi
  1012c4:	57                   	push   %edi
  1012c5:	53                   	push   %ebx
  1012c6:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1012cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  1012cf:	fc                   	cld    
  1012d0:	83 f9 08             	cmp    $0x8,%ecx
  1012d3:	76 26                	jbe    1012fb <memcpy+0x3b>
  1012d5:	89 fa                	mov    %edi,%edx
  1012d7:	89 cb                	mov    %ecx,%ebx
  1012d9:	83 e2 03             	and    $0x3,%edx
  1012dc:	74 10                	je     1012ee <memcpy+0x2e>
  1012de:	b9 04 00 00 00       	mov    $0x4,%ecx
  1012e3:	29 d1                	sub    %edx,%ecx
  1012e5:	83 e1 03             	and    $0x3,%ecx
  1012e8:	29 cb                	sub    %ecx,%ebx
  1012ea:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012ec:	89 d9                	mov    %ebx,%ecx
  1012ee:	c1 e9 02             	shr    $0x2,%ecx
  1012f1:	8d 76 00             	lea    0x0(%esi),%esi
  1012f4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1012f6:	89 d9                	mov    %ebx,%ecx
  1012f8:	83 e1 03             	and    $0x3,%ecx
  1012fb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101300:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101303:	5b                   	pop    %ebx
  101304:	5f                   	pop    %edi
  101305:	5e                   	pop    %esi
  101306:	c9                   	leave  
  101307:	c3                   	ret    

00101308 <memset>:
  101308:	55                   	push   %ebp
  101309:	89 e5                	mov    %esp,%ebp
  10130b:	57                   	push   %edi
  10130c:	8b 7d 08             	mov    0x8(%ebp),%edi
  10130f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  101313:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101316:	fc                   	cld    
  101317:	83 f9 10             	cmp    $0x10,%ecx
  10131a:	76 69                	jbe    101385 <memset+0x7d>
  10131c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101322:	74 4c                	je     101370 <memset+0x68>
  101324:	88 07                	mov    %al,(%edi)
  101326:	47                   	inc    %edi
  101327:	49                   	dec    %ecx
  101328:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10132e:	74 40                	je     101370 <memset+0x68>
  101330:	88 07                	mov    %al,(%edi)
  101332:	47                   	inc    %edi
  101333:	49                   	dec    %ecx
  101334:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10133a:	74 34                	je     101370 <memset+0x68>
  10133c:	88 07                	mov    %al,(%edi)
  10133e:	47                   	inc    %edi
  10133f:	49                   	dec    %ecx
  101340:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101346:	74 28                	je     101370 <memset+0x68>
  101348:	88 07                	mov    %al,(%edi)
  10134a:	47                   	inc    %edi
  10134b:	49                   	dec    %ecx
  10134c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101352:	74 1c                	je     101370 <memset+0x68>
  101354:	88 07                	mov    %al,(%edi)
  101356:	47                   	inc    %edi
  101357:	49                   	dec    %ecx
  101358:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10135e:	74 10                	je     101370 <memset+0x68>
  101360:	88 07                	mov    %al,(%edi)
  101362:	47                   	inc    %edi
  101363:	49                   	dec    %ecx
  101364:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10136a:	74 04                	je     101370 <memset+0x68>
  10136c:	88 07                	mov    %al,(%edi)
  10136e:	47                   	inc    %edi
  10136f:	49                   	dec    %ecx
  101370:	88 c4                	mov    %al,%ah
  101372:	89 c2                	mov    %eax,%edx
  101374:	c1 e2 10             	shl    $0x10,%edx
  101377:	09 d0                	or     %edx,%eax
  101379:	89 ca                	mov    %ecx,%edx
  10137b:	c1 e9 02             	shr    $0x2,%ecx
  10137e:	83 e2 03             	and    $0x3,%edx
  101381:	f3 ab                	rep stos %eax,%es:(%edi)
  101383:	89 d1                	mov    %edx,%ecx
  101385:	f3 aa                	rep stos %al,%es:(%edi)
  101387:	8b 45 08             	mov    0x8(%ebp),%eax
  10138a:	8d 65 fc             	lea    -0x4(%ebp),%esp
  10138d:	5f                   	pop    %edi
  10138e:	c9                   	leave  
  10138f:	c3                   	ret    
