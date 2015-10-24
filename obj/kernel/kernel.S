
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <start>:
  100000:	bd 00 00 00 00       	mov    $0x0,%ebp
  100005:	bc 00 00 00 08       	mov    $0x8000000,%esp
  10000a:	e9 b1 03 00 00       	jmp    1003c0 <init>
  10000f:	90                   	nop

00100010 <mm_malloc>:
  100010:	55                   	push   %ebp
  100011:	31 c0                	xor    %eax,%eax
  100013:	89 e5                	mov    %esp,%ebp
  100015:	57                   	push   %edi
  100016:	56                   	push   %esi
  100017:	53                   	push   %ebx
  100018:	83 ec 3c             	sub    $0x3c,%esp
  10001b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10001e:	85 db                	test   %ebx,%ebx
  100020:	0f 8e 36 02 00 00    	jle    10025c <mm_malloc+0x24c>
  100026:	e8 b5 0a 00 00       	call   100ae0 <get_updir>
  10002b:	89 c6                	mov    %eax,%esi
  10002d:	e8 be 0a 00 00       	call   100af0 <get_ucr3>
  100032:	8b 55 08             	mov    0x8(%ebp),%edx
  100035:	8d 5c 1a ff          	lea    -0x1(%edx,%ebx,1),%ebx
  100039:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  10003c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10003f:	b8 00 10 00 00       	mov    $0x1000,%eax
  100044:	29 d0                	sub    %edx,%eax
  100046:	89 da                	mov    %ebx,%edx
  100048:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  10004e:	01 d0                	add    %edx,%eax
  100050:	85 c0                	test   %eax,%eax
  100052:	0f 8e c0 00 00 00    	jle    100118 <mm_malloc+0x108>
  100058:	8b 55 08             	mov    0x8(%ebp),%edx
  10005b:	83 e8 01             	sub    $0x1,%eax
  10005e:	89 f7                	mov    %esi,%edi
  100060:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100065:	8d 84 02 00 10 00 00 	lea    0x1000(%edx,%eax,1),%eax
  10006c:	89 d3                	mov    %edx,%ebx
  10006e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100071:	eb 51                	jmp    1000c4 <mm_malloc+0xb4>
  100073:	90                   	nop
  100074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100078:	8b 31                	mov    (%ecx),%esi
  10007a:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  100080:	81 ee 00 00 00 40    	sub    $0x40000000,%esi
  100086:	89 d8                	mov    %ebx,%eax
  100088:	c1 e8 0a             	shr    $0xa,%eax
  10008b:	25 fc 0f 00 00       	and    $0xffc,%eax
  100090:	01 c6                	add    %eax,%esi
  100092:	f6 06 01             	testb  $0x1,(%esi)
  100095:	75 22                	jne    1000b9 <mm_malloc+0xa9>
  100097:	a1 00 20 10 00       	mov    0x102000,%eax
  10009c:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
  1000a1:	0f 8f c1 01 00 00    	jg     100268 <mm_malloc+0x258>
  1000a7:	89 c1                	mov    %eax,%ecx
  1000a9:	83 c0 01             	add    $0x1,%eax
  1000ac:	c1 e1 0c             	shl    $0xc,%ecx
  1000af:	83 c9 07             	or     $0x7,%ecx
  1000b2:	89 0e                	mov    %ecx,(%esi)
  1000b4:	a3 00 20 10 00       	mov    %eax,0x102000
  1000b9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  1000bf:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  1000c2:	74 54                	je     100118 <mm_malloc+0x108>
  1000c4:	89 d8                	mov    %ebx,%eax
  1000c6:	c1 e8 16             	shr    $0x16,%eax
  1000c9:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
  1000cc:	f6 01 01             	testb  $0x1,(%ecx)
  1000cf:	75 a7                	jne    100078 <mm_malloc+0x68>
  1000d1:	a1 00 30 10 00       	mov    0x103000,%eax
  1000d6:	89 c6                	mov    %eax,%esi
  1000d8:	83 c0 01             	add    $0x1,%eax
  1000db:	c1 e6 0c             	shl    $0xc,%esi
  1000de:	81 c6 00 40 10 00    	add    $0x104000,%esi
  1000e4:	a3 00 30 10 00       	mov    %eax,0x103000
  1000e9:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
  1000ef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1000f4:	83 c8 07             	or     $0x7,%eax
  1000f7:	89 01                	mov    %eax,(%ecx)
  1000f9:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  100100:	00 
  100101:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100108:	00 
  100109:	89 34 24             	mov    %esi,(%esp)
  10010c:	e8 07 11 00 00       	call   101218 <memset>
  100111:	e9 70 ff ff ff       	jmp    100086 <mm_malloc+0x76>
  100116:	66 90                	xchg   %ax,%ax
  100118:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  10011b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10011e:	81 eb 00 00 00 40    	sub    $0x40000000,%ebx
  100124:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  10012a:	c1 e8 16             	shr    $0x16,%eax
  10012d:	8b 34 83             	mov    (%ebx,%eax,4),%esi
  100130:	f7 c6 01 00 00 00    	test   $0x1,%esi
  100136:	75 32                	jne    10016a <mm_malloc+0x15a>
  100138:	c7 44 24 10 c4 12 10 	movl   $0x1012c4,0x10(%esp)
  10013f:	00 
  100140:	c7 44 24 0c 28 13 10 	movl   $0x101328,0xc(%esp)
  100147:	00 
  100148:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10014f:	00 
  100150:	c7 44 24 04 b3 12 10 	movl   $0x1012b3,0x4(%esp)
  100157:	00 
  100158:	c7 04 24 d4 12 10 00 	movl   $0x1012d4,(%esp)
  10015f:	e8 ec 0b 00 00       	call   100d50 <printk>
  100164:	b8 01 00 00 00       	mov    $0x1,%eax
  100169:	d6                   	(bad)  
  10016a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10016d:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
  100173:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100178:	c1 ea 0c             	shr    $0xc,%edx
  10017b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100181:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
  100185:	75 32                	jne    1001b9 <mm_malloc+0x1a9>
  100187:	c7 44 24 10 cc 12 10 	movl   $0x1012cc,0x10(%esp)
  10018e:	00 
  10018f:	c7 44 24 0c 28 13 10 	movl   $0x101328,0xc(%esp)
  100196:	00 
  100197:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10019e:	00 
  10019f:	c7 44 24 04 b3 12 10 	movl   $0x1012b3,0x4(%esp)
  1001a6:	00 
  1001a7:	c7 04 24 d4 12 10 00 	movl   $0x1012d4,(%esp)
  1001ae:	e8 9d 0b 00 00       	call   100d50 <printk>
  1001b3:	b8 01 00 00 00       	mov    $0x1,%eax
  1001b8:	d6                   	(bad)  
  1001b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1001bc:	c1 e8 16             	shr    $0x16,%eax
  1001bf:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
  1001c2:	f6 c3 01             	test   $0x1,%bl
  1001c5:	75 32                	jne    1001f9 <mm_malloc+0x1e9>
  1001c7:	c7 44 24 10 c4 12 10 	movl   $0x1012c4,0x10(%esp)
  1001ce:	00 
  1001cf:	c7 44 24 0c 28 13 10 	movl   $0x101328,0xc(%esp)
  1001d6:	00 
  1001d7:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  1001de:	00 
  1001df:	c7 44 24 04 b3 12 10 	movl   $0x1012b3,0x4(%esp)
  1001e6:	00 
  1001e7:	c7 04 24 d4 12 10 00 	movl   $0x1012d4,(%esp)
  1001ee:	e8 5d 0b 00 00       	call   100d50 <printk>
  1001f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1001f8:	d6                   	(bad)  
  1001f9:	8b 55 08             	mov    0x8(%ebp),%edx
  1001fc:	8d 83 00 00 00 c0    	lea    -0x40000000(%ebx),%eax
  100202:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100207:	c1 ea 0c             	shr    $0xc,%edx
  10020a:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100210:	8b 1c 90             	mov    (%eax,%edx,4),%ebx
  100213:	f6 c3 01             	test   $0x1,%bl
  100216:	75 32                	jne    10024a <mm_malloc+0x23a>
  100218:	c7 44 24 10 cc 12 10 	movl   $0x1012cc,0x10(%esp)
  10021f:	00 
  100220:	c7 44 24 0c 28 13 10 	movl   $0x101328,0xc(%esp)
  100227:	00 
  100228:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10022f:	00 
  100230:	c7 44 24 04 b3 12 10 	movl   $0x1012b3,0x4(%esp)
  100237:	00 
  100238:	c7 04 24 d4 12 10 00 	movl   $0x1012d4,(%esp)
  10023f:	e8 0c 0b 00 00       	call   100d50 <printk>
  100244:	b8 01 00 00 00       	mov    $0x1,%eax
  100249:	d6                   	(bad)  
  10024a:	8b 55 08             	mov    0x8(%ebp),%edx
  10024d:	89 d8                	mov    %ebx,%eax
  10024f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100254:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  10025a:	09 d0                	or     %edx,%eax
  10025c:	83 c4 3c             	add    $0x3c,%esp
  10025f:	5b                   	pop    %ebx
  100260:	5e                   	pop    %esi
  100261:	5f                   	pop    %edi
  100262:	5d                   	pop    %ebp
  100263:	c3                   	ret    
  100264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100268:	c7 44 24 10 a0 12 10 	movl   $0x1012a0,0x10(%esp)
  10026f:	00 
  100270:	c7 44 24 0c 1e 13 10 	movl   $0x10131e,0xc(%esp)
  100277:	00 
  100278:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
  10027f:	00 
  100280:	c7 44 24 04 b3 12 10 	movl   $0x1012b3,0x4(%esp)
  100287:	00 
  100288:	c7 04 24 d4 12 10 00 	movl   $0x1012d4,(%esp)
  10028f:	e8 bc 0a 00 00       	call   100d50 <printk>
  100294:	b8 01 00 00 00       	mov    $0x1,%eax
  100299:	d6                   	(bad)  
  10029a:	a1 00 20 10 00       	mov    0x102000,%eax
  10029f:	e9 03 fe ff ff       	jmp    1000a7 <mm_malloc+0x97>

001002a4 <vec0>:
  1002a4:	6a 00                	push   $0x0
  1002a6:	6a 00                	push   $0x0
  1002a8:	e9 ab 00 00 00       	jmp    100358 <asm_do_irq>

001002ad <vec1>:
  1002ad:	6a 00                	push   $0x0
  1002af:	6a 01                	push   $0x1
  1002b1:	e9 a2 00 00 00       	jmp    100358 <asm_do_irq>

001002b6 <vec2>:
  1002b6:	6a 00                	push   $0x0
  1002b8:	6a 02                	push   $0x2
  1002ba:	e9 99 00 00 00       	jmp    100358 <asm_do_irq>

001002bf <vec3>:
  1002bf:	6a 00                	push   $0x0
  1002c1:	6a 03                	push   $0x3
  1002c3:	e9 90 00 00 00       	jmp    100358 <asm_do_irq>

001002c8 <vec4>:
  1002c8:	6a 00                	push   $0x0
  1002ca:	6a 04                	push   $0x4
  1002cc:	e9 87 00 00 00       	jmp    100358 <asm_do_irq>

001002d1 <vec5>:
  1002d1:	6a 00                	push   $0x0
  1002d3:	6a 05                	push   $0x5
  1002d5:	e9 7e 00 00 00       	jmp    100358 <asm_do_irq>

001002da <vec6>:
  1002da:	6a 00                	push   $0x0
  1002dc:	6a 06                	push   $0x6
  1002de:	e9 75 00 00 00       	jmp    100358 <asm_do_irq>

001002e3 <vec7>:
  1002e3:	6a 00                	push   $0x0
  1002e5:	6a 07                	push   $0x7
  1002e7:	e9 6c 00 00 00       	jmp    100358 <asm_do_irq>

001002ec <vec8>:
  1002ec:	6a 08                	push   $0x8
  1002ee:	e9 65 00 00 00       	jmp    100358 <asm_do_irq>

001002f3 <vec9>:
  1002f3:	6a 00                	push   $0x0
  1002f5:	6a 09                	push   $0x9
  1002f7:	e9 5c 00 00 00       	jmp    100358 <asm_do_irq>

001002fc <vec10>:
  1002fc:	6a 0a                	push   $0xa
  1002fe:	e9 55 00 00 00       	jmp    100358 <asm_do_irq>

00100303 <vec11>:
  100303:	6a 0b                	push   $0xb
  100305:	e9 4e 00 00 00       	jmp    100358 <asm_do_irq>

0010030a <vec12>:
  10030a:	6a 0c                	push   $0xc
  10030c:	e9 47 00 00 00       	jmp    100358 <asm_do_irq>

00100311 <vec13>:
  100311:	6a 0d                	push   $0xd
  100313:	e9 40 00 00 00       	jmp    100358 <asm_do_irq>

00100318 <vec14>:
  100318:	6a 0e                	push   $0xe
  10031a:	e9 39 00 00 00       	jmp    100358 <asm_do_irq>

0010031f <vecsys>:
  10031f:	6a 00                	push   $0x0
  100321:	68 80 00 00 00       	push   $0x80
  100326:	e9 2d 00 00 00       	jmp    100358 <asm_do_irq>

0010032b <irq0>:
  10032b:	6a 00                	push   $0x0
  10032d:	68 e8 03 00 00       	push   $0x3e8
  100332:	e9 21 00 00 00       	jmp    100358 <asm_do_irq>

00100337 <irq1>:
  100337:	6a 00                	push   $0x0
  100339:	68 e9 03 00 00       	push   $0x3e9
  10033e:	e9 15 00 00 00       	jmp    100358 <asm_do_irq>

00100343 <irq14>:
  100343:	6a 00                	push   $0x0
  100345:	68 f6 03 00 00       	push   $0x3f6
  10034a:	e9 09 00 00 00       	jmp    100358 <asm_do_irq>

0010034f <irq_empty>:
  10034f:	6a 00                	push   $0x0
  100351:	6a ff                	push   $0xffffffff
  100353:	e9 00 00 00 00       	jmp    100358 <asm_do_irq>

00100358 <asm_do_irq>:
  100358:	60                   	pusha  
  100359:	54                   	push   %esp
  10035a:	e8 a1 01 00 00       	call   100500 <irq_handle>
  10035f:	83 c4 04             	add    $0x4,%esp
  100362:	61                   	popa   
  100363:	83 c4 08             	add    $0x8,%esp
  100366:	cf                   	iret   
  100367:	66 90                	xchg   %ax,%ax
  100369:	66 90                	xchg   %ax,%ax
  10036b:	66 90                	xchg   %ax,%ax
  10036d:	66 90                	xchg   %ax,%ax
  10036f:	90                   	nop

00100370 <init_cond>:
  100370:	55                   	push   %ebp
  100371:	89 e5                	mov    %esp,%ebp
  100373:	83 ec 08             	sub    $0x8,%esp
  100376:	68 bf 13 10 00       	push   $0x1013bf
  10037b:	6a 4a                	push   $0x4a
  10037d:	68 2e 13 10 00       	push   $0x10132e
  100382:	68 40 13 10 00       	push   $0x101340
  100387:	e8 c4 09 00 00       	call   100d50 <printk>
  10038c:	e8 2f 09 00 00       	call   100cc0 <loader>
  100391:	bd 00 00 00 00       	mov    $0x0,%ebp
  100396:	83 ec 10             	sub    $0x10,%esp
  100399:	ff d0                	call   *%eax
  10039b:	68 bf 13 10 00       	push   $0x1013bf
  1003a0:	6a 6b                	push   $0x6b
  1003a2:	68 2e 13 10 00       	push   $0x10132e
  1003a7:	68 74 13 10 00       	push   $0x101374
  1003ac:	e8 9f 09 00 00       	call   100d50 <printk>
  1003b1:	b8 01 00 00 00       	mov    $0x1,%eax
  1003b6:	d6                   	(bad)  
  1003b7:	83 c4 20             	add    $0x20,%esp
  1003ba:	c9                   	leave  
  1003bb:	c3                   	ret    
  1003bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001003c0 <init>:
  1003c0:	55                   	push   %ebp
  1003c1:	b8 70 03 10 00       	mov    $0x100370,%eax
  1003c6:	89 e5                	mov    %esp,%ebp
  1003c8:	83 ec 08             	sub    $0x8,%esp
  1003cb:	ff e0                	jmp    *%eax
  1003cd:	68 c9 13 10 00       	push   $0x1013c9
  1003d2:	6a 24                	push   $0x24
  1003d4:	68 2e 13 10 00       	push   $0x10132e
  1003d9:	68 74 13 10 00       	push   $0x101374
  1003de:	e8 6d 09 00 00       	call   100d50 <printk>
  1003e3:	b8 01 00 00 00       	mov    $0x1,%eax
  1003e8:	d6                   	(bad)  
  1003e9:	83 c4 10             	add    $0x10,%esp
  1003ec:	c9                   	leave  
  1003ed:	c3                   	ret    
  1003ee:	66 90                	xchg   %ax,%ax

001003f0 <do_syscall>:
  1003f0:	55                   	push   %ebp
  1003f1:	89 e5                	mov    %esp,%ebp
  1003f3:	83 ec 08             	sub    $0x8,%esp
  1003f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1003f9:	8b 42 08             	mov    0x8(%edx),%eax
  1003fc:	85 c0                	test   %eax,%eax
  1003fe:	74 38                	je     100438 <do_syscall+0x48>
  100400:	83 f8 2d             	cmp    $0x2d,%eax
  100403:	75 0b                	jne    100410 <do_syscall+0x20>
  100405:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  10040c:	c9                   	leave  
  10040d:	c3                   	ret    
  10040e:	66 90                	xchg   %ax,%ax
  100410:	83 ec 0c             	sub    $0xc,%esp
  100413:	50                   	push   %eax
  100414:	68 44 14 10 00       	push   $0x101444
  100419:	6a 20                	push   $0x20
  10041b:	68 d0 13 10 00       	push   $0x1013d0
  100420:	68 f0 13 10 00       	push   $0x1013f0
  100425:	e8 26 09 00 00       	call   100d50 <printk>
  10042a:	b8 01 00 00 00       	mov    $0x1,%eax
  10042f:	d6                   	(bad)  
  100430:	83 c4 20             	add    $0x20,%esp
  100433:	c9                   	leave  
  100434:	c3                   	ret    
  100435:	8d 76 00             	lea    0x0(%esi),%esi
  100438:	fa                   	cli    
  100439:	83 ec 08             	sub    $0x8,%esp
  10043c:	ff 72 1c             	pushl  0x1c(%edx)
  10043f:	ff 72 04             	pushl  0x4(%edx)
  100442:	e8 09 00 00 00       	call   100450 <add_irq_handle>
  100447:	fb                   	sti    
  100448:	83 c4 10             	add    $0x10,%esp
  10044b:	c9                   	leave  
  10044c:	c3                   	ret    
  10044d:	66 90                	xchg   %ax,%ax
  10044f:	90                   	nop

00100450 <add_irq_handle>:
  100450:	55                   	push   %ebp
  100451:	89 e5                	mov    %esp,%ebp
  100453:	53                   	push   %ebx
  100454:	83 ec 04             	sub    $0x4,%esp
  100457:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10045a:	83 fb 0f             	cmp    $0xf,%ebx
  10045d:	7f 71                	jg     1004d0 <add_irq_handle+0x80>
  10045f:	a1 00 40 12 00       	mov    0x124000,%eax
  100464:	83 f8 20             	cmp    $0x20,%eax
  100467:	7e 2c                	jle    100495 <add_irq_handle+0x45>
  100469:	83 ec 0c             	sub    $0xc,%esp
  10046c:	68 7e 14 10 00       	push   $0x10147e
  100471:	68 cd 15 10 00       	push   $0x1015cd
  100476:	6a 16                	push   $0x16
  100478:	68 62 14 10 00       	push   $0x101462
  10047d:	68 d4 12 10 00       	push   $0x1012d4
  100482:	e8 c9 08 00 00       	call   100d50 <printk>
  100487:	b8 01 00 00 00       	mov    $0x1,%eax
  10048c:	d6                   	(bad)  
  10048d:	a1 00 40 12 00       	mov    0x124000,%eax
  100492:	83 c4 20             	add    $0x20,%esp
  100495:	8d 50 01             	lea    0x1(%eax),%edx
  100498:	89 15 00 40 12 00    	mov    %edx,0x124000
  10049e:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004a1:	89 14 c5 80 40 12 00 	mov    %edx,0x124080(,%eax,8)
  1004a8:	8b 14 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%edx
  1004af:	89 14 c5 84 40 12 00 	mov    %edx,0x124084(,%eax,8)
  1004b6:	8d 04 c5 80 40 12 00 	lea    0x124080(,%eax,8),%eax
  1004bd:	89 04 9d 40 40 12 00 	mov    %eax,0x124040(,%ebx,4)
  1004c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004c7:	c9                   	leave  
  1004c8:	c3                   	ret    
  1004c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1004d0:	83 ec 0c             	sub    $0xc,%esp
  1004d3:	68 4f 14 10 00       	push   $0x10144f
  1004d8:	68 cd 15 10 00       	push   $0x1015cd
  1004dd:	6a 15                	push   $0x15
  1004df:	68 62 14 10 00       	push   $0x101462
  1004e4:	68 d4 12 10 00       	push   $0x1012d4
  1004e9:	e8 62 08 00 00       	call   100d50 <printk>
  1004ee:	b8 01 00 00 00       	mov    $0x1,%eax
  1004f3:	d6                   	(bad)  
  1004f4:	83 c4 20             	add    $0x20,%esp
  1004f7:	e9 63 ff ff ff       	jmp    10045f <add_irq_handle+0xf>
  1004fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100500 <irq_handle>:
  100500:	55                   	push   %ebp
  100501:	89 e5                	mov    %esp,%ebp
  100503:	53                   	push   %ebx
  100504:	83 ec 04             	sub    $0x4,%esp
  100507:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10050a:	68 c2 15 10 00       	push   $0x1015c2
  10050f:	6a 24                	push   $0x24
  100511:	68 62 14 10 00       	push   $0x101462
  100516:	68 b4 14 10 00       	push   $0x1014b4
  10051b:	e8 30 08 00 00       	call   100d50 <printk>
  100520:	b8 01 00 00 00       	mov    $0x1,%eax
  100525:	d6                   	(bad)  
  100526:	8b 43 30             	mov    0x30(%ebx),%eax
  100529:	83 c4 10             	add    $0x10,%esp
  10052c:	85 c0                	test   %eax,%eax
  10052e:	0f 88 9c 00 00 00    	js     1005d0 <irq_handle+0xd0>
  100534:	3d 80 00 00 00       	cmp    $0x80,%eax
  100539:	0f 84 b9 00 00 00    	je     1005f8 <irq_handle+0xf8>
  10053f:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  100544:	7e 5a                	jle    1005a0 <irq_handle+0xa0>
  100546:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
  10054c:	83 fb 0f             	cmp    $0xf,%ebx
  10054f:	7f 1f                	jg     100570 <irq_handle+0x70>
  100551:	8b 1c 9d 40 40 12 00 	mov    0x124040(,%ebx,4),%ebx
  100558:	85 db                	test   %ebx,%ebx
  10055a:	74 0d                	je     100569 <irq_handle+0x69>
  10055c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100560:	ff 13                	call   *(%ebx)
  100562:	8b 5b 04             	mov    0x4(%ebx),%ebx
  100565:	85 db                	test   %ebx,%ebx
  100567:	75 f7                	jne    100560 <irq_handle+0x60>
  100569:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10056c:	c9                   	leave  
  10056d:	c3                   	ret    
  10056e:	66 90                	xchg   %ax,%ax
  100570:	83 ec 0c             	sub    $0xc,%esp
  100573:	68 9c 14 10 00       	push   $0x10149c
  100578:	68 c2 15 10 00       	push   $0x1015c2
  10057d:	6a 30                	push   $0x30
  10057f:	68 62 14 10 00       	push   $0x101462
  100584:	68 d4 12 10 00       	push   $0x1012d4
  100589:	e8 c2 07 00 00       	call   100d50 <printk>
  10058e:	b8 01 00 00 00       	mov    $0x1,%eax
  100593:	d6                   	(bad)  
  100594:	83 c4 20             	add    $0x20,%esp
  100597:	eb b8                	jmp    100551 <irq_handle+0x51>
  100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1005a0:	83 ec 08             	sub    $0x8,%esp
  1005a3:	ff 73 0c             	pushl  0xc(%ebx)
  1005a6:	50                   	push   %eax
  1005a7:	68 c2 15 10 00       	push   $0x1015c2
  1005ac:	6a 2d                	push   $0x2d
  1005ae:	68 62 14 10 00       	push   $0x101462
  1005b3:	68 68 15 10 00       	push   $0x101568
  1005b8:	e8 93 07 00 00       	call   100d50 <printk>
  1005bd:	b8 01 00 00 00       	mov    $0x1,%eax
  1005c2:	d6                   	(bad)  
  1005c3:	83 c4 20             	add    $0x20,%esp
  1005c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005c9:	c9                   	leave  
  1005ca:	c3                   	ret    
  1005cb:	90                   	nop
  1005cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005d0:	68 c2 15 10 00       	push   $0x1015c2
  1005d5:	6a 29                	push   $0x29
  1005d7:	68 62 14 10 00       	push   $0x101462
  1005dc:	68 1c 15 10 00       	push   $0x10151c
  1005e1:	e8 6a 07 00 00       	call   100d50 <printk>
  1005e6:	b8 01 00 00 00       	mov    $0x1,%eax
  1005eb:	d6                   	(bad)  
  1005ec:	83 c4 10             	add    $0x10,%esp
  1005ef:	e9 75 ff ff ff       	jmp    100569 <irq_handle+0x69>
  1005f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005f8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1005fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005fe:	c9                   	leave  
  1005ff:	e9 ec fd ff ff       	jmp    1003f0 <do_syscall>
  100604:	66 90                	xchg   %ax,%ax
  100606:	66 90                	xchg   %ax,%ax
  100608:	66 90                	xchg   %ax,%ax
  10060a:	66 90                	xchg   %ax,%ax
  10060c:	66 90                	xchg   %ax,%ax
  10060e:	66 90                	xchg   %ax,%ax

00100610 <init_i8259>:
  100610:	55                   	push   %ebp
  100611:	ba 21 00 00 00       	mov    $0x21,%edx
  100616:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10061b:	89 e5                	mov    %esp,%ebp
  10061d:	ee                   	out    %al,(%dx)
  10061e:	b2 a1                	mov    $0xa1,%dl
  100620:	ee                   	out    %al,(%dx)
  100621:	b8 11 00 00 00       	mov    $0x11,%eax
  100626:	b2 20                	mov    $0x20,%dl
  100628:	ee                   	out    %al,(%dx)
  100629:	b8 20 00 00 00       	mov    $0x20,%eax
  10062e:	b2 21                	mov    $0x21,%dl
  100630:	ee                   	out    %al,(%dx)
  100631:	b8 04 00 00 00       	mov    $0x4,%eax
  100636:	ee                   	out    %al,(%dx)
  100637:	b8 03 00 00 00       	mov    $0x3,%eax
  10063c:	ee                   	out    %al,(%dx)
  10063d:	b8 11 00 00 00       	mov    $0x11,%eax
  100642:	b2 a0                	mov    $0xa0,%dl
  100644:	ee                   	out    %al,(%dx)
  100645:	b8 28 00 00 00       	mov    $0x28,%eax
  10064a:	b2 a1                	mov    $0xa1,%dl
  10064c:	ee                   	out    %al,(%dx)
  10064d:	b8 02 00 00 00       	mov    $0x2,%eax
  100652:	ee                   	out    %al,(%dx)
  100653:	b8 03 00 00 00       	mov    $0x3,%eax
  100658:	ee                   	out    %al,(%dx)
  100659:	b8 68 00 00 00       	mov    $0x68,%eax
  10065e:	b2 20                	mov    $0x20,%dl
  100660:	ee                   	out    %al,(%dx)
  100661:	b8 0a 00 00 00       	mov    $0xa,%eax
  100666:	ee                   	out    %al,(%dx)
  100667:	b8 68 00 00 00       	mov    $0x68,%eax
  10066c:	b2 a0                	mov    $0xa0,%dl
  10066e:	ee                   	out    %al,(%dx)
  10066f:	b8 0a 00 00 00       	mov    $0xa,%eax
  100674:	ee                   	out    %al,(%dx)
  100675:	5d                   	pop    %ebp
  100676:	c3                   	ret    
  100677:	66 90                	xchg   %ax,%ax
  100679:	66 90                	xchg   %ax,%ax
  10067b:	66 90                	xchg   %ax,%ax
  10067d:	66 90                	xchg   %ax,%ax
  10067f:	90                   	nop

00100680 <init_idt>:
  100680:	55                   	push   %ebp
  100681:	ba 4f 03 10 00       	mov    $0x10034f,%edx
  100686:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  10068b:	89 d1                	mov    %edx,%ecx
  10068d:	c1 ea 10             	shr    $0x10,%edx
  100690:	89 e5                	mov    %esp,%ebp
  100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100698:	66 89 08             	mov    %cx,(%eax)
  10069b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1006a1:	83 c0 08             	add    $0x8,%eax
  1006a4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
  1006a8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
  1006ac:	66 89 50 fe          	mov    %dx,-0x2(%eax)
  1006b0:	3d c0 49 12 00       	cmp    $0x1249c0,%eax
  1006b5:	75 e1                	jne    100698 <init_idt+0x18>
  1006b7:	b8 a4 02 10 00       	mov    $0x1002a4,%eax
  1006bc:	ba 08 00 00 00       	mov    $0x8,%edx
  1006c1:	b9 08 00 00 00       	mov    $0x8,%ecx
  1006c6:	66 a3 c0 41 12 00    	mov    %ax,0x1241c0
  1006cc:	c1 e8 10             	shr    $0x10,%eax
  1006cf:	66 89 15 c2 41 12 00 	mov    %dx,0x1241c2
  1006d6:	66 a3 c6 41 12 00    	mov    %ax,0x1241c6
  1006dc:	b8 ad 02 10 00       	mov    $0x1002ad,%eax
  1006e1:	ba 08 00 00 00       	mov    $0x8,%edx
  1006e6:	66 a3 c8 41 12 00    	mov    %ax,0x1241c8
  1006ec:	c1 e8 10             	shr    $0x10,%eax
  1006ef:	66 89 0d ca 41 12 00 	mov    %cx,0x1241ca
  1006f6:	66 a3 ce 41 12 00    	mov    %ax,0x1241ce
  1006fc:	b8 b6 02 10 00       	mov    $0x1002b6,%eax
  100701:	66 89 15 d2 41 12 00 	mov    %dx,0x1241d2
  100708:	66 a3 d0 41 12 00    	mov    %ax,0x1241d0
  10070e:	c1 e8 10             	shr    $0x10,%eax
  100711:	b9 08 00 00 00       	mov    $0x8,%ecx
  100716:	66 a3 d6 41 12 00    	mov    %ax,0x1241d6
  10071c:	b8 bf 02 10 00       	mov    $0x1002bf,%eax
  100721:	ba 08 00 00 00       	mov    $0x8,%edx
  100726:	66 a3 d8 41 12 00    	mov    %ax,0x1241d8
  10072c:	c1 e8 10             	shr    $0x10,%eax
  10072f:	66 89 0d da 41 12 00 	mov    %cx,0x1241da
  100736:	66 a3 de 41 12 00    	mov    %ax,0x1241de
  10073c:	b8 c8 02 10 00       	mov    $0x1002c8,%eax
  100741:	66 89 15 e2 41 12 00 	mov    %dx,0x1241e2
  100748:	66 a3 e0 41 12 00    	mov    %ax,0x1241e0
  10074e:	c1 e8 10             	shr    $0x10,%eax
  100751:	b9 08 00 00 00       	mov    $0x8,%ecx
  100756:	66 a3 e6 41 12 00    	mov    %ax,0x1241e6
  10075c:	b8 d1 02 10 00       	mov    $0x1002d1,%eax
  100761:	ba 08 00 00 00       	mov    $0x8,%edx
  100766:	66 a3 e8 41 12 00    	mov    %ax,0x1241e8
  10076c:	c1 e8 10             	shr    $0x10,%eax
  10076f:	66 89 0d ea 41 12 00 	mov    %cx,0x1241ea
  100776:	66 a3 ee 41 12 00    	mov    %ax,0x1241ee
  10077c:	b8 da 02 10 00       	mov    $0x1002da,%eax
  100781:	66 89 15 f2 41 12 00 	mov    %dx,0x1241f2
  100788:	66 a3 f0 41 12 00    	mov    %ax,0x1241f0
  10078e:	c1 e8 10             	shr    $0x10,%eax
  100791:	c6 05 c4 41 12 00 00 	movb   $0x0,0x1241c4
  100798:	c6 05 c5 41 12 00 8f 	movb   $0x8f,0x1241c5
  10079f:	c6 05 cc 41 12 00 00 	movb   $0x0,0x1241cc
  1007a6:	b9 08 00 00 00       	mov    $0x8,%ecx
  1007ab:	c6 05 cd 41 12 00 8f 	movb   $0x8f,0x1241cd
  1007b2:	c6 05 d4 41 12 00 00 	movb   $0x0,0x1241d4
  1007b9:	ba 08 00 00 00       	mov    $0x8,%edx
  1007be:	c6 05 d5 41 12 00 8f 	movb   $0x8f,0x1241d5
  1007c5:	c6 05 dc 41 12 00 00 	movb   $0x0,0x1241dc
  1007cc:	c6 05 dd 41 12 00 8f 	movb   $0x8f,0x1241dd
  1007d3:	c6 05 e4 41 12 00 00 	movb   $0x0,0x1241e4
  1007da:	c6 05 e5 41 12 00 8f 	movb   $0x8f,0x1241e5
  1007e1:	c6 05 ec 41 12 00 00 	movb   $0x0,0x1241ec
  1007e8:	c6 05 ed 41 12 00 8f 	movb   $0x8f,0x1241ed
  1007ef:	c6 05 f4 41 12 00 00 	movb   $0x0,0x1241f4
  1007f6:	c6 05 f5 41 12 00 8f 	movb   $0x8f,0x1241f5
  1007fd:	66 a3 f6 41 12 00    	mov    %ax,0x1241f6
  100803:	b8 e3 02 10 00       	mov    $0x1002e3,%eax
  100808:	66 a3 f8 41 12 00    	mov    %ax,0x1241f8
  10080e:	c1 e8 10             	shr    $0x10,%eax
  100811:	66 89 0d fa 41 12 00 	mov    %cx,0x1241fa
  100818:	66 a3 fe 41 12 00    	mov    %ax,0x1241fe
  10081e:	b8 ec 02 10 00       	mov    $0x1002ec,%eax
  100823:	b9 08 00 00 00       	mov    $0x8,%ecx
  100828:	66 a3 00 42 12 00    	mov    %ax,0x124200
  10082e:	c1 e8 10             	shr    $0x10,%eax
  100831:	66 89 15 02 42 12 00 	mov    %dx,0x124202
  100838:	66 a3 06 42 12 00    	mov    %ax,0x124206
  10083e:	b8 f3 02 10 00       	mov    $0x1002f3,%eax
  100843:	66 89 0d 0a 42 12 00 	mov    %cx,0x12420a
  10084a:	66 a3 08 42 12 00    	mov    %ax,0x124208
  100850:	c1 e8 10             	shr    $0x10,%eax
  100853:	ba 08 00 00 00       	mov    $0x8,%edx
  100858:	66 a3 0e 42 12 00    	mov    %ax,0x12420e
  10085e:	b8 fc 02 10 00       	mov    $0x1002fc,%eax
  100863:	b9 08 00 00 00       	mov    $0x8,%ecx
  100868:	66 a3 10 42 12 00    	mov    %ax,0x124210
  10086e:	c1 e8 10             	shr    $0x10,%eax
  100871:	66 89 15 12 42 12 00 	mov    %dx,0x124212
  100878:	66 a3 16 42 12 00    	mov    %ax,0x124216
  10087e:	b8 03 03 10 00       	mov    $0x100303,%eax
  100883:	66 89 0d 1a 42 12 00 	mov    %cx,0x12421a
  10088a:	66 a3 18 42 12 00    	mov    %ax,0x124218
  100890:	c1 e8 10             	shr    $0x10,%eax
  100893:	ba 08 00 00 00       	mov    $0x8,%edx
  100898:	66 a3 1e 42 12 00    	mov    %ax,0x12421e
  10089e:	b8 0a 03 10 00       	mov    $0x10030a,%eax
  1008a3:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008a8:	66 a3 20 42 12 00    	mov    %ax,0x124220
  1008ae:	c1 e8 10             	shr    $0x10,%eax
  1008b1:	66 89 15 22 42 12 00 	mov    %dx,0x124222
  1008b8:	66 a3 26 42 12 00    	mov    %ax,0x124226
  1008be:	b8 11 03 10 00       	mov    $0x100311,%eax
  1008c3:	66 89 0d 2a 42 12 00 	mov    %cx,0x12422a
  1008ca:	66 a3 28 42 12 00    	mov    %ax,0x124228
  1008d0:	c1 e8 10             	shr    $0x10,%eax
  1008d3:	c6 05 fc 41 12 00 00 	movb   $0x0,0x1241fc
  1008da:	c6 05 fd 41 12 00 8f 	movb   $0x8f,0x1241fd
  1008e1:	c6 05 04 42 12 00 00 	movb   $0x0,0x124204
  1008e8:	ba 08 00 00 00       	mov    $0x8,%edx
  1008ed:	c6 05 05 42 12 00 8f 	movb   $0x8f,0x124205
  1008f4:	c6 05 0c 42 12 00 00 	movb   $0x0,0x12420c
  1008fb:	b9 08 00 00 00       	mov    $0x8,%ecx
  100900:	c6 05 0d 42 12 00 8f 	movb   $0x8f,0x12420d
  100907:	c6 05 14 42 12 00 00 	movb   $0x0,0x124214
  10090e:	c6 05 15 42 12 00 8f 	movb   $0x8f,0x124215
  100915:	c6 05 1c 42 12 00 00 	movb   $0x0,0x12421c
  10091c:	c6 05 1d 42 12 00 8f 	movb   $0x8f,0x12421d
  100923:	c6 05 24 42 12 00 00 	movb   $0x0,0x124224
  10092a:	c6 05 25 42 12 00 8f 	movb   $0x8f,0x124225
  100931:	c6 05 2c 42 12 00 00 	movb   $0x0,0x12422c
  100938:	66 a3 2e 42 12 00    	mov    %ax,0x12422e
  10093e:	b8 18 03 10 00       	mov    $0x100318,%eax
  100943:	66 89 15 32 42 12 00 	mov    %dx,0x124232
  10094a:	66 a3 30 42 12 00    	mov    %ax,0x124230
  100950:	c1 e8 10             	shr    $0x10,%eax
  100953:	66 89 0d c2 45 12 00 	mov    %cx,0x1245c2
  10095a:	66 a3 36 42 12 00    	mov    %ax,0x124236
  100960:	b8 1f 03 10 00       	mov    $0x10031f,%eax
  100965:	ba 08 00 00 00       	mov    $0x8,%edx
  10096a:	66 a3 c0 45 12 00    	mov    %ax,0x1245c0
  100970:	c1 e8 10             	shr    $0x10,%eax
  100973:	b9 08 00 00 00       	mov    $0x8,%ecx
  100978:	66 a3 c6 45 12 00    	mov    %ax,0x1245c6
  10097e:	b8 2b 03 10 00       	mov    $0x10032b,%eax
  100983:	c6 05 2d 42 12 00 8f 	movb   $0x8f,0x12422d
  10098a:	66 a3 c0 42 12 00    	mov    %ax,0x1242c0
  100990:	c1 e8 10             	shr    $0x10,%eax
  100993:	c6 05 34 42 12 00 00 	movb   $0x0,0x124234
  10099a:	66 a3 c6 42 12 00    	mov    %ax,0x1242c6
  1009a0:	b8 43 03 10 00       	mov    $0x100343,%eax
  1009a5:	c6 05 35 42 12 00 8f 	movb   $0x8f,0x124235
  1009ac:	66 a3 30 43 12 00    	mov    %ax,0x124330
  1009b2:	c1 e8 10             	shr    $0x10,%eax
  1009b5:	c6 05 c4 45 12 00 00 	movb   $0x0,0x1245c4
  1009bc:	66 a3 36 43 12 00    	mov    %ax,0x124336
  1009c2:	b8 ff 07 00 00       	mov    $0x7ff,%eax
  1009c7:	c6 05 c5 45 12 00 ef 	movb   $0xef,0x1245c5
  1009ce:	66 a3 80 41 12 00    	mov    %ax,0x124180
  1009d4:	b8 c0 41 12 00       	mov    $0x1241c0,%eax
  1009d9:	66 89 15 c2 42 12 00 	mov    %dx,0x1242c2
  1009e0:	66 a3 82 41 12 00    	mov    %ax,0x124182
  1009e6:	c1 e8 10             	shr    $0x10,%eax
  1009e9:	c6 05 c4 42 12 00 00 	movb   $0x0,0x1242c4
  1009f0:	66 a3 84 41 12 00    	mov    %ax,0x124184
  1009f6:	c6 05 c5 42 12 00 8e 	movb   $0x8e,0x1242c5
  1009fd:	b8 80 41 12 00       	mov    $0x124180,%eax
  100a02:	66 89 0d 32 43 12 00 	mov    %cx,0x124332
  100a09:	c6 05 34 43 12 00 00 	movb   $0x0,0x124334
  100a10:	c6 05 35 43 12 00 8e 	movb   $0x8e,0x124335
  100a17:	0f 01 18             	lidtl  (%eax)
  100a1a:	5d                   	pop    %ebp
  100a1b:	c3                   	ret    
  100a1c:	66 90                	xchg   %ax,%ax
  100a1e:	66 90                	xchg   %ax,%ax

00100a20 <create_video_mapping>:
  100a20:	55                   	push   %ebp
  100a21:	89 e5                	mov    %esp,%ebp
  100a23:	83 ec 08             	sub    $0x8,%esp
  100a26:	68 68 16 10 00       	push   $0x101668
  100a2b:	6a 11                	push   $0x11
  100a2d:	68 dc 15 10 00       	push   $0x1015dc
  100a32:	68 04 16 10 00       	push   $0x101604
  100a37:	e8 14 03 00 00       	call   100d50 <printk>
  100a3c:	b8 01 00 00 00       	mov    $0x1,%eax
  100a41:	d6                   	(bad)  
  100a42:	83 c4 10             	add    $0x10,%esp
  100a45:	c9                   	leave  
  100a46:	c3                   	ret    
  100a47:	89 f6                	mov    %esi,%esi
  100a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100a50 <video_mapping_write_test>:
  100a50:	55                   	push   %ebp
  100a51:	31 c0                	xor    %eax,%eax
  100a53:	89 e5                	mov    %esp,%ebp
  100a55:	8d 76 00             	lea    0x0(%esi),%esi
  100a58:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
  100a5f:	83 c0 01             	add    $0x1,%eax
  100a62:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
  100a67:	75 ef                	jne    100a58 <video_mapping_write_test+0x8>
  100a69:	5d                   	pop    %ebp
  100a6a:	c3                   	ret    
  100a6b:	90                   	nop
  100a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100a70 <video_mapping_read_test>:
  100a70:	55                   	push   %ebp
  100a71:	89 e5                	mov    %esp,%ebp
  100a73:	56                   	push   %esi
  100a74:	be 01 00 00 00       	mov    $0x1,%esi
  100a79:	53                   	push   %ebx
  100a7a:	31 db                	xor    %ebx,%ebx
  100a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100a80:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
  100a87:	74 24                	je     100aad <video_mapping_read_test+0x3d>
  100a89:	83 ec 0c             	sub    $0xc,%esp
  100a8c:	68 f5 15 10 00       	push   $0x1015f5
  100a91:	68 50 16 10 00       	push   $0x101650
  100a96:	6a 20                	push   $0x20
  100a98:	68 dc 15 10 00       	push   $0x1015dc
  100a9d:	68 d4 12 10 00       	push   $0x1012d4
  100aa2:	e8 a9 02 00 00       	call   100d50 <printk>
  100aa7:	89 f0                	mov    %esi,%eax
  100aa9:	d6                   	(bad)  
  100aaa:	83 c4 20             	add    $0x20,%esp
  100aad:	83 c3 01             	add    $0x1,%ebx
  100ab0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
  100ab6:	75 c8                	jne    100a80 <video_mapping_read_test+0x10>
  100ab8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100abb:	5b                   	pop    %ebx
  100abc:	5e                   	pop    %esi
  100abd:	5d                   	pop    %ebp
  100abe:	c3                   	ret    
  100abf:	90                   	nop

00100ac0 <video_mapping_clear>:
  100ac0:	55                   	push   %ebp
  100ac1:	89 e5                	mov    %esp,%ebp
  100ac3:	83 ec 0c             	sub    $0xc,%esp
  100ac6:	68 00 fa 00 00       	push   $0xfa00
  100acb:	6a 00                	push   $0x0
  100acd:	68 00 00 0a 00       	push   $0xa0000
  100ad2:	e8 41 07 00 00       	call   101218 <memset>
  100ad7:	83 c4 10             	add    $0x10,%esp
  100ada:	c9                   	leave  
  100adb:	c3                   	ret    
  100adc:	66 90                	xchg   %ax,%ax
  100ade:	66 90                	xchg   %ax,%ax

00100ae0 <get_updir>:
  100ae0:	55                   	push   %ebp
  100ae1:	b8 00 60 12 00       	mov    $0x126000,%eax
  100ae6:	89 e5                	mov    %esp,%ebp
  100ae8:	5d                   	pop    %ebp
  100ae9:	c3                   	ret    
  100aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100af0 <get_ucr3>:
  100af0:	55                   	push   %ebp
  100af1:	a1 04 50 12 00       	mov    0x125004,%eax
  100af6:	89 e5                	mov    %esp,%ebp
  100af8:	5d                   	pop    %ebp
  100af9:	c3                   	ret    
  100afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b00 <mm_brk>:
  100b00:	55                   	push   %ebp
  100b01:	89 e5                	mov    %esp,%ebp
  100b03:	53                   	push   %ebx
  100b04:	83 ec 04             	sub    $0x4,%esp
  100b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b0a:	a1 00 50 12 00       	mov    0x125000,%eax
  100b0f:	39 d8                	cmp    %ebx,%eax
  100b11:	73 11                	jae    100b24 <mm_brk+0x24>
  100b13:	89 da                	mov    %ebx,%edx
  100b15:	83 ec 08             	sub    $0x8,%esp
  100b18:	29 c2                	sub    %eax,%edx
  100b1a:	52                   	push   %edx
  100b1b:	50                   	push   %eax
  100b1c:	e8 ef f4 ff ff       	call   100010 <mm_malloc>
  100b21:	83 c4 10             	add    $0x10,%esp
  100b24:	89 1d 00 50 12 00    	mov    %ebx,0x125000
  100b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b2d:	c9                   	leave  
  100b2e:	c3                   	ret    
  100b2f:	90                   	nop

00100b30 <init_mm>:
  100b30:	55                   	push   %ebp
  100b31:	89 e5                	mov    %esp,%ebp
  100b33:	53                   	push   %ebx
  100b34:	83 ec 04             	sub    $0x4,%esp
  100b37:	e8 44 00 00 00       	call   100b80 <get_kpdir>
  100b3c:	83 ec 04             	sub    $0x4,%esp
  100b3f:	89 c3                	mov    %eax,%ebx
  100b41:	68 00 10 00 00       	push   $0x1000
  100b46:	6a 00                	push   $0x0
  100b48:	68 00 60 12 00       	push   $0x126000
  100b4d:	e8 c6 06 00 00       	call   101218 <memset>
  100b52:	83 c4 0c             	add    $0xc,%esp
  100b55:	68 80 00 00 00       	push   $0x80
  100b5a:	53                   	push   %ebx
  100b5b:	68 00 60 12 00       	push   $0x126000
  100b60:	e8 6b 06 00 00       	call   1011d0 <memcpy>
  100b65:	b8 00 60 12 00       	mov    $0x126000,%eax
  100b6a:	83 c4 10             	add    $0x10,%esp
  100b6d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b70:	25 00 fc ff ff       	and    $0xfffffc00,%eax
  100b75:	a3 04 50 12 00       	mov    %eax,0x125004
  100b7a:	c9                   	leave  
  100b7b:	c3                   	ret    
  100b7c:	66 90                	xchg   %ax,%ax
  100b7e:	66 90                	xchg   %ax,%ax

00100b80 <get_kpdir>:
  100b80:	55                   	push   %ebp
  100b81:	b8 00 80 14 00       	mov    $0x148000,%eax
  100b86:	89 e5                	mov    %esp,%ebp
  100b88:	5d                   	pop    %ebp
  100b89:	c3                   	ret    
  100b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100b90 <init_page>:
  100b90:	55                   	push   %ebp
  100b91:	89 e5                	mov    %esp,%ebp
  100b93:	57                   	push   %edi
  100b94:	83 ec 08             	sub    $0x8,%esp
  100b97:	68 00 10 00 00       	push   $0x1000
  100b9c:	6a 00                	push   $0x0
  100b9e:	68 00 80 14 00       	push   $0x148000
  100ba3:	e8 70 06 00 00       	call   101218 <memset>
  100ba8:	83 c4 10             	add    $0x10,%esp
  100bab:	b9 00 80 14 00       	mov    $0x148000,%ecx
  100bb0:	b8 00 80 12 00       	mov    $0x128000,%eax
  100bb5:	8d 76 00             	lea    0x0(%esi),%esi
  100bb8:	89 c2                	mov    %eax,%edx
  100bba:	05 00 10 00 00       	add    $0x1000,%eax
  100bbf:	83 c1 04             	add    $0x4,%ecx
  100bc2:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  100bc8:	83 ca 07             	or     $0x7,%edx
  100bcb:	89 51 fc             	mov    %edx,-0x4(%ecx)
  100bce:	3d 00 80 14 00       	cmp    $0x148000,%eax
  100bd3:	75 e3                	jne    100bb8 <init_page+0x28>
  100bd5:	bf fc 7f 14 00       	mov    $0x147ffc,%edi
  100bda:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
  100bdf:	fd                   	std    
  100be0:	ab                   	stos   %eax,%es:(%edi)
  100be1:	2d 00 10 00 00       	sub    $0x1000,%eax
  100be6:	7d f8                	jge    100be0 <init_page+0x50>
  100be8:	b8 00 80 14 00       	mov    $0x148000,%eax
  100bed:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100bf2:	0f 22 d8             	mov    %eax,%cr3
  100bf5:	0f 20 c0             	mov    %cr0,%eax
  100bf8:	0d 00 00 00 80       	or     $0x80000000,%eax
  100bfd:	0f 22 c0             	mov    %eax,%cr0
  100c00:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100c03:	c9                   	leave  
  100c04:	c3                   	ret    
  100c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100c10 <init_segment>:
  100c10:	55                   	push   %ebp
  100c11:	89 e5                	mov    %esp,%ebp
  100c13:	83 ec 0c             	sub    $0xc,%esp
  100c16:	6a 18                	push   $0x18
  100c18:	6a 00                	push   $0x0
  100c1a:	68 08 70 12 00       	push   $0x127008
  100c1f:	e8 f4 05 00 00       	call   101218 <memset>
  100c24:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c29:	31 c9                	xor    %ecx,%ecx
  100c2b:	b8 08 70 12 00       	mov    $0x127008,%eax
  100c30:	66 89 15 10 70 12 00 	mov    %dx,0x127010
  100c37:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c3c:	66 89 0d 12 70 12 00 	mov    %cx,0x127012
  100c43:	66 89 15 18 70 12 00 	mov    %dx,0x127018
  100c4a:	ba 17 00 00 00       	mov    $0x17,%edx
  100c4f:	31 c9                	xor    %ecx,%ecx
  100c51:	66 89 15 00 70 12 00 	mov    %dx,0x127000
  100c58:	66 a3 02 70 12 00    	mov    %ax,0x127002
  100c5e:	c1 e8 10             	shr    $0x10,%eax
  100c61:	66 a3 04 70 12 00    	mov    %ax,0x127004
  100c67:	c6 05 14 70 12 00 00 	movb   $0x0,0x127014
  100c6e:	b8 00 70 12 00       	mov    $0x127000,%eax
  100c73:	c6 05 15 70 12 00 9a 	movb   $0x9a,0x127015
  100c7a:	c6 05 16 70 12 00 cf 	movb   $0xcf,0x127016
  100c81:	c6 05 17 70 12 00 00 	movb   $0x0,0x127017
  100c88:	66 89 0d 1a 70 12 00 	mov    %cx,0x12701a
  100c8f:	c6 05 1c 70 12 00 00 	movb   $0x0,0x12701c
  100c96:	c6 05 1d 70 12 00 92 	movb   $0x92,0x12701d
  100c9d:	c6 05 1e 70 12 00 cf 	movb   $0xcf,0x12701e
  100ca4:	c6 05 1f 70 12 00 00 	movb   $0x0,0x12701f
  100cab:	0f 01 10             	lgdtl  (%eax)
  100cae:	83 c4 10             	add    $0x10,%esp
  100cb1:	c9                   	leave  
  100cb2:	c3                   	ret    
  100cb3:	66 90                	xchg   %ax,%ax
  100cb5:	66 90                	xchg   %ax,%ax
  100cb7:	66 90                	xchg   %ax,%ax
  100cb9:	66 90                	xchg   %ax,%ax
  100cbb:	66 90                	xchg   %ax,%ax
  100cbd:	66 90                	xchg   %ax,%ax
  100cbf:	90                   	nop

00100cc0 <loader>:
  100cc0:	55                   	push   %ebp
  100cc1:	89 e5                	mov    %esp,%ebp
  100cc3:	81 ec 0c 10 00 00    	sub    $0x100c,%esp
  100cc9:	8d 85 f8 ef ff ff    	lea    -0x1008(%ebp),%eax
  100ccf:	68 00 10 00 00       	push   $0x1000
  100cd4:	6a 00                	push   $0x0
  100cd6:	50                   	push   %eax
  100cd7:	e8 e4 00 00 00       	call   100dc0 <ramdisk_read>
  100cdc:	83 c4 10             	add    $0x10,%esp
  100cdf:	81 bd f8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1008(%ebp)
  100ce6:	45 4c 46 
  100ce9:	74 06                	je     100cf1 <loader+0x31>
  100ceb:	b8 01 00 00 00       	mov    $0x1,%eax
  100cf0:	d6                   	(bad)  
  100cf1:	68 92 16 10 00       	push   $0x101692
  100cf6:	6a 27                	push   $0x27
  100cf8:	68 7d 16 10 00       	push   $0x10167d
  100cfd:	68 04 16 10 00       	push   $0x101604
  100d02:	e8 49 00 00 00       	call   100d50 <printk>
  100d07:	b8 01 00 00 00       	mov    $0x1,%eax
  100d0c:	d6                   	(bad)  
  100d0d:	83 c4 10             	add    $0x10,%esp
  100d10:	eb fe                	jmp    100d10 <loader+0x50>
  100d12:	66 90                	xchg   %ax,%ax
  100d14:	66 90                	xchg   %ax,%ax
  100d16:	66 90                	xchg   %ax,%ax
  100d18:	66 90                	xchg   %ax,%ax
  100d1a:	66 90                	xchg   %ax,%ax
  100d1c:	66 90                	xchg   %ax,%ax
  100d1e:	66 90                	xchg   %ax,%ax

00100d20 <sbrk>:
  100d20:	55                   	push   %ebp
  100d21:	89 e5                	mov    %esp,%ebp
  100d23:	83 ec 08             	sub    $0x8,%esp
  100d26:	68 af 16 10 00       	push   $0x1016af
  100d2b:	6a 08                	push   $0x8
  100d2d:	68 99 16 10 00       	push   $0x101699
  100d32:	68 74 13 10 00       	push   $0x101374
  100d37:	e8 14 00 00 00       	call   100d50 <printk>
  100d3c:	b8 01 00 00 00       	mov    $0x1,%eax
  100d41:	d6                   	(bad)  
  100d42:	30 c0                	xor    %al,%al
  100d44:	c9                   	leave  
  100d45:	c3                   	ret    
  100d46:	66 90                	xchg   %ax,%ax
  100d48:	66 90                	xchg   %ax,%ax
  100d4a:	66 90                	xchg   %ax,%ax
  100d4c:	66 90                	xchg   %ax,%ax
  100d4e:	66 90                	xchg   %ax,%ax

00100d50 <printk>:
  100d50:	55                   	push   %ebp
  100d51:	89 e5                	mov    %esp,%ebp
  100d53:	5d                   	pop    %ebp
  100d54:	c3                   	ret    
  100d55:	66 90                	xchg   %ax,%ax
  100d57:	66 90                	xchg   %ax,%ax
  100d59:	66 90                	xchg   %ax,%ax
  100d5b:	66 90                	xchg   %ax,%ax
  100d5d:	66 90                	xchg   %ax,%ax
  100d5f:	90                   	nop

00100d60 <init_serial>:
  100d60:	55                   	push   %ebp
  100d61:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100d66:	31 c0                	xor    %eax,%eax
  100d68:	89 e5                	mov    %esp,%ebp
  100d6a:	ee                   	out    %al,(%dx)
  100d6b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  100d70:	b2 fb                	mov    $0xfb,%dl
  100d72:	ee                   	out    %al,(%dx)
  100d73:	b8 01 00 00 00       	mov    $0x1,%eax
  100d78:	b2 f8                	mov    $0xf8,%dl
  100d7a:	ee                   	out    %al,(%dx)
  100d7b:	31 c0                	xor    %eax,%eax
  100d7d:	b2 f9                	mov    $0xf9,%dl
  100d7f:	ee                   	out    %al,(%dx)
  100d80:	b8 03 00 00 00       	mov    $0x3,%eax
  100d85:	b2 fb                	mov    $0xfb,%dl
  100d87:	ee                   	out    %al,(%dx)
  100d88:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  100d8d:	b2 fa                	mov    $0xfa,%dl
  100d8f:	ee                   	out    %al,(%dx)
  100d90:	b8 0b 00 00 00       	mov    $0xb,%eax
  100d95:	b2 fc                	mov    $0xfc,%dl
  100d97:	ee                   	out    %al,(%dx)
  100d98:	5d                   	pop    %ebp
  100d99:	c3                   	ret    
  100d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100da0 <serial_printc>:
  100da0:	55                   	push   %ebp
  100da1:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100da6:	89 e5                	mov    %esp,%ebp
  100da8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100dab:	90                   	nop
  100dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100db0:	ec                   	in     (%dx),%al
  100db1:	a8 20                	test   $0x20,%al
  100db3:	74 fb                	je     100db0 <serial_printc+0x10>
  100db5:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100dba:	89 c8                	mov    %ecx,%eax
  100dbc:	ee                   	out    %al,(%dx)
  100dbd:	5d                   	pop    %ebp
  100dbe:	c3                   	ret    
  100dbf:	90                   	nop

00100dc0 <ramdisk_read>:
  100dc0:	55                   	push   %ebp
  100dc1:	89 e5                	mov    %esp,%ebp
  100dc3:	5d                   	pop    %ebp
  100dc4:	e9 07 04 00 00       	jmp    1011d0 <memcpy>
  100dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100dd0 <ramdisk_write>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100dd6:	8b 55 08             	mov    0x8(%ebp),%edx
  100dd9:	89 45 08             	mov    %eax,0x8(%ebp)
  100ddc:	89 55 0c             	mov    %edx,0xc(%ebp)
  100ddf:	5d                   	pop    %ebp
  100de0:	e9 eb 03 00 00       	jmp    1011d0 <memcpy>
  100de5:	66 90                	xchg   %ax,%ax
  100de7:	66 90                	xchg   %ax,%ax
  100de9:	66 90                	xchg   %ax,%ax
  100deb:	66 90                	xchg   %ax,%ax
  100ded:	66 90                	xchg   %ax,%ax
  100def:	90                   	nop

00100df0 <ide_intr>:
  100df0:	55                   	push   %ebp
  100df1:	c7 05 04 90 14 00 01 	movl   $0x1,0x149004
  100df8:	00 00 00 
  100dfb:	89 e5                	mov    %esp,%ebp
  100dfd:	5d                   	pop    %ebp
  100dfe:	c3                   	ret    
  100dff:	90                   	nop

00100e00 <ide_writeback>:
  100e00:	a1 00 90 14 00       	mov    0x149000,%eax
  100e05:	83 c0 01             	add    $0x1,%eax
  100e08:	83 f8 64             	cmp    $0x64,%eax
  100e0b:	a3 00 90 14 00       	mov    %eax,0x149000
  100e10:	74 06                	je     100e18 <ide_writeback+0x18>
  100e12:	c3                   	ret    
  100e13:	90                   	nop
  100e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100e18:	55                   	push   %ebp
  100e19:	89 e5                	mov    %esp,%ebp
  100e1b:	83 ec 08             	sub    $0x8,%esp
  100e1e:	e8 dd 01 00 00       	call   101000 <buf_writeback>
  100e23:	c7 05 00 90 14 00 00 	movl   $0x0,0x149000
  100e2a:	00 00 00 
  100e2d:	c9                   	leave  
  100e2e:	c3                   	ret    
  100e2f:	90                   	nop

00100e30 <ide_read>:
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	57                   	push   %edi
  100e34:	56                   	push   %esi
  100e35:	53                   	push   %ebx
  100e36:	83 ec 0c             	sub    $0xc,%esp
  100e39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100e3c:	8b 45 10             	mov    0x10(%ebp),%eax
  100e3f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100e42:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100e45:	29 df                	sub    %ebx,%edi
  100e47:	85 c0                	test   %eax,%eax
  100e49:	74 1b                	je     100e66 <ide_read+0x36>
  100e4b:	90                   	nop
  100e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100e50:	83 ec 0c             	sub    $0xc,%esp
  100e53:	53                   	push   %ebx
  100e54:	e8 07 02 00 00       	call   101060 <read_byte>
  100e59:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  100e5c:	83 c3 01             	add    $0x1,%ebx
  100e5f:	83 c4 10             	add    $0x10,%esp
  100e62:	39 f3                	cmp    %esi,%ebx
  100e64:	75 ea                	jne    100e50 <ide_read+0x20>
  100e66:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e69:	5b                   	pop    %ebx
  100e6a:	5e                   	pop    %esi
  100e6b:	5f                   	pop    %edi
  100e6c:	5d                   	pop    %ebp
  100e6d:	c3                   	ret    
  100e6e:	66 90                	xchg   %ax,%ax

00100e70 <ide_write>:
  100e70:	55                   	push   %ebp
  100e71:	89 e5                	mov    %esp,%ebp
  100e73:	57                   	push   %edi
  100e74:	56                   	push   %esi
  100e75:	53                   	push   %ebx
  100e76:	83 ec 0c             	sub    $0xc,%esp
  100e79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100e7c:	8b 45 10             	mov    0x10(%ebp),%eax
  100e7f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100e82:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100e85:	29 df                	sub    %ebx,%edi
  100e87:	85 c0                	test   %eax,%eax
  100e89:	74 1d                	je     100ea8 <ide_write+0x38>
  100e8b:	90                   	nop
  100e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100e90:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  100e94:	83 ec 08             	sub    $0x8,%esp
  100e97:	50                   	push   %eax
  100e98:	53                   	push   %ebx
  100e99:	83 c3 01             	add    $0x1,%ebx
  100e9c:	e8 ef 01 00 00       	call   101090 <write_byte>
  100ea1:	83 c4 10             	add    $0x10,%esp
  100ea4:	39 f3                	cmp    %esi,%ebx
  100ea6:	75 e8                	jne    100e90 <ide_write+0x20>
  100ea8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100eab:	5b                   	pop    %ebx
  100eac:	5e                   	pop    %esi
  100ead:	5f                   	pop    %edi
  100eae:	5d                   	pop    %ebp
  100eaf:	c3                   	ret    

00100eb0 <clear_ide_intr>:
  100eb0:	55                   	push   %ebp
  100eb1:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100eb8:	00 00 00 
  100ebb:	89 e5                	mov    %esp,%ebp
  100ebd:	5d                   	pop    %ebp
  100ebe:	c3                   	ret    
  100ebf:	90                   	nop

00100ec0 <wait_ide_intr>:
  100ec0:	a1 04 90 14 00       	mov    0x149004,%eax
  100ec5:	55                   	push   %ebp
  100ec6:	89 e5                	mov    %esp,%ebp
  100ec8:	85 c0                	test   %eax,%eax
  100eca:	75 0e                	jne    100eda <wait_ide_intr+0x1a>
  100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ed0:	f4                   	hlt    
  100ed1:	a1 04 90 14 00       	mov    0x149004,%eax
  100ed6:	85 c0                	test   %eax,%eax
  100ed8:	74 f6                	je     100ed0 <wait_ide_intr+0x10>
  100eda:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100ee1:	00 00 00 
  100ee4:	5d                   	pop    %ebp
  100ee5:	c3                   	ret    
  100ee6:	8d 76 00             	lea    0x0(%esi),%esi
  100ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100ef0 <init_ide>:
  100ef0:	55                   	push   %ebp
  100ef1:	89 e5                	mov    %esp,%ebp
  100ef3:	83 ec 08             	sub    $0x8,%esp
  100ef6:	e8 d5 00 00 00       	call   100fd0 <buf_init>
  100efb:	83 ec 08             	sub    $0x8,%esp
  100efe:	68 00 0e 10 00       	push   $0x100e00
  100f03:	6a 00                	push   $0x0
  100f05:	e8 46 f5 ff ff       	call   100450 <add_irq_handle>
  100f0a:	58                   	pop    %eax
  100f0b:	5a                   	pop    %edx
  100f0c:	68 f0 0d 10 00       	push   $0x100df0
  100f11:	6a 0e                	push   $0xe
  100f13:	e8 38 f5 ff ff       	call   100450 <add_irq_handle>
  100f18:	83 c4 10             	add    $0x10,%esp
  100f1b:	c9                   	leave  
  100f1c:	c3                   	ret    
  100f1d:	66 90                	xchg   %ax,%ax
  100f1f:	90                   	nop

00100f20 <buf_fetch>:
  100f20:	55                   	push   %ebp
  100f21:	89 c2                	mov    %eax,%edx
  100f23:	89 e5                	mov    %esp,%ebp
  100f25:	57                   	push   %edi
  100f26:	56                   	push   %esi
  100f27:	53                   	push   %ebx
  100f28:	89 c3                	mov    %eax,%ebx
  100f2a:	83 e3 7f             	and    $0x7f,%ebx
  100f2d:	89 d8                	mov    %ebx,%eax
  100f2f:	83 ec 1c             	sub    $0x1c,%esp
  100f32:	c1 e0 09             	shl    $0x9,%eax
  100f35:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
  100f38:	8d 81 40 90 14 00    	lea    0x149040(%ecx),%eax
  100f3e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
  100f42:	74 5c                	je     100fa0 <buf_fetch+0x80>
  100f44:	89 d7                	mov    %edx,%edi
  100f46:	89 da                	mov    %ebx,%edx
  100f48:	c1 e2 09             	shl    $0x9,%edx
  100f4b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  100f4e:	8d 91 40 90 14 00    	lea    0x149040(%ecx),%edx
  100f54:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
  100f5a:	74 54                	je     100fb0 <buf_fetch+0x90>
  100f5c:	8d 72 06             	lea    0x6(%edx),%esi
  100f5f:	83 ec 08             	sub    $0x8,%esp
  100f62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100f65:	57                   	push   %edi
  100f66:	56                   	push   %esi
  100f67:	e8 a4 01 00 00       	call   101110 <disk_do_read>
  100f6c:	89 da                	mov    %ebx,%edx
  100f6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100f71:	83 c4 10             	add    $0x10,%esp
  100f74:	c1 e2 09             	shl    $0x9,%edx
  100f77:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  100f7a:	c6 81 44 90 14 00 01 	movb   $0x1,0x149044(%ecx)
  100f81:	89 b9 40 90 14 00    	mov    %edi,0x149040(%ecx)
  100f87:	c6 81 45 90 14 00 00 	movb   $0x0,0x149045(%ecx)
  100f8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f91:	5b                   	pop    %ebx
  100f92:	5e                   	pop    %esi
  100f93:	5f                   	pop    %edi
  100f94:	5d                   	pop    %ebp
  100f95:	c3                   	ret    
  100f96:	8d 76 00             	lea    0x0(%esi),%esi
  100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100fa0:	39 91 40 90 14 00    	cmp    %edx,0x149040(%ecx)
  100fa6:	75 9c                	jne    100f44 <buf_fetch+0x24>
  100fa8:	eb e4                	jmp    100f8e <buf_fetch+0x6e>
  100faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100fb0:	8d 72 06             	lea    0x6(%edx),%esi
  100fb3:	83 ec 08             	sub    $0x8,%esp
  100fb6:	ff b1 40 90 14 00    	pushl  0x149040(%ecx)
  100fbc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100fbf:	56                   	push   %esi
  100fc0:	e8 8b 01 00 00       	call   101150 <disk_do_write>
  100fc5:	83 c4 10             	add    $0x10,%esp
  100fc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100fcb:	eb 92                	jmp    100f5f <buf_fetch+0x3f>
  100fcd:	8d 76 00             	lea    0x0(%esi),%esi

00100fd0 <buf_init>:
  100fd0:	55                   	push   %ebp
  100fd1:	b8 44 90 14 00       	mov    $0x149044,%eax
  100fd6:	89 e5                	mov    %esp,%ebp
  100fd8:	90                   	nop
  100fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100fe0:	c6 00 00             	movb   $0x0,(%eax)
  100fe3:	05 08 02 00 00       	add    $0x208,%eax
  100fe8:	3d 44 94 15 00       	cmp    $0x159444,%eax
  100fed:	75 f1                	jne    100fe0 <buf_init+0x10>
  100fef:	5d                   	pop    %ebp
  100ff0:	c3                   	ret    
  100ff1:	eb 0d                	jmp    101000 <buf_writeback>
  100ff3:	90                   	nop
  100ff4:	90                   	nop
  100ff5:	90                   	nop
  100ff6:	90                   	nop
  100ff7:	90                   	nop
  100ff8:	90                   	nop
  100ff9:	90                   	nop
  100ffa:	90                   	nop
  100ffb:	90                   	nop
  100ffc:	90                   	nop
  100ffd:	90                   	nop
  100ffe:	90                   	nop
  100fff:	90                   	nop

00101000 <buf_writeback>:
  101000:	55                   	push   %ebp
  101001:	89 e5                	mov    %esp,%ebp
  101003:	53                   	push   %ebx
  101004:	bb 46 90 14 00       	mov    $0x149046,%ebx
  101009:	83 ec 04             	sub    $0x4,%esp
  10100c:	eb 10                	jmp    10101e <buf_writeback+0x1e>
  10100e:	66 90                	xchg   %ax,%ax
  101010:	81 c3 08 02 00 00    	add    $0x208,%ebx
  101016:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  10101c:	74 32                	je     101050 <buf_writeback+0x50>
  10101e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
  101022:	75 ec                	jne    101010 <buf_writeback+0x10>
  101024:	83 ec 08             	sub    $0x8,%esp
  101027:	ff 73 fa             	pushl  -0x6(%ebx)
  10102a:	53                   	push   %ebx
  10102b:	81 c3 08 02 00 00    	add    $0x208,%ebx
  101031:	e8 1a 01 00 00       	call   101150 <disk_do_write>
  101036:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
  10103d:	83 c4 10             	add    $0x10,%esp
  101040:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  101046:	75 d6                	jne    10101e <buf_writeback+0x1e>
  101048:	90                   	nop
  101049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101050:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101053:	c9                   	leave  
  101054:	c3                   	ret    
  101055:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101060 <read_byte>:
  101060:	55                   	push   %ebp
  101061:	89 e5                	mov    %esp,%ebp
  101063:	53                   	push   %ebx
  101064:	83 ec 04             	sub    $0x4,%esp
  101067:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10106a:	89 d8                	mov    %ebx,%eax
  10106c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101072:	c1 e8 09             	shr    $0x9,%eax
  101075:	e8 a6 fe ff ff       	call   100f20 <buf_fetch>
  10107a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
  10107f:	83 c4 04             	add    $0x4,%esp
  101082:	5b                   	pop    %ebx
  101083:	5d                   	pop    %ebp
  101084:	c3                   	ret    
  101085:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101090 <write_byte>:
  101090:	55                   	push   %ebp
  101091:	89 e5                	mov    %esp,%ebp
  101093:	56                   	push   %esi
  101094:	53                   	push   %ebx
  101095:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101098:	8b 75 0c             	mov    0xc(%ebp),%esi
  10109b:	89 d8                	mov    %ebx,%eax
  10109d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  1010a3:	c1 e8 09             	shr    $0x9,%eax
  1010a6:	e8 75 fe ff ff       	call   100f20 <buf_fetch>
  1010ab:	89 f2                	mov    %esi,%edx
  1010ad:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
  1010b1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
  1010b5:	5b                   	pop    %ebx
  1010b6:	5e                   	pop    %esi
  1010b7:	5d                   	pop    %ebp
  1010b8:	c3                   	ret    
  1010b9:	66 90                	xchg   %ax,%ax
  1010bb:	66 90                	xchg   %ax,%ax
  1010bd:	66 90                	xchg   %ax,%ax
  1010bf:	90                   	nop

001010c0 <ide_prepare>:
  1010c0:	55                   	push   %ebp
  1010c1:	89 c1                	mov    %eax,%ecx
  1010c3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1010c8:	89 e5                	mov    %esp,%ebp
  1010ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1010d0:	ec                   	in     (%dx),%al
  1010d1:	83 e0 c0             	and    $0xffffffc0,%eax
  1010d4:	3c 40                	cmp    $0x40,%al
  1010d6:	75 f8                	jne    1010d0 <ide_prepare+0x10>
  1010d8:	ba f1 01 00 00       	mov    $0x1f1,%edx
  1010dd:	31 c0                	xor    %eax,%eax
  1010df:	ee                   	out    %al,(%dx)
  1010e0:	b8 01 00 00 00       	mov    $0x1,%eax
  1010e5:	b2 f2                	mov    $0xf2,%dl
  1010e7:	ee                   	out    %al,(%dx)
  1010e8:	b2 f3                	mov    $0xf3,%dl
  1010ea:	89 c8                	mov    %ecx,%eax
  1010ec:	ee                   	out    %al,(%dx)
  1010ed:	89 c8                	mov    %ecx,%eax
  1010ef:	b2 f4                	mov    $0xf4,%dl
  1010f1:	c1 e8 08             	shr    $0x8,%eax
  1010f4:	ee                   	out    %al,(%dx)
  1010f5:	89 c8                	mov    %ecx,%eax
  1010f7:	b2 f5                	mov    $0xf5,%dl
  1010f9:	c1 e8 10             	shr    $0x10,%eax
  1010fc:	ee                   	out    %al,(%dx)
  1010fd:	89 c8                	mov    %ecx,%eax
  1010ff:	b2 f6                	mov    $0xf6,%dl
  101101:	c1 e8 18             	shr    $0x18,%eax
  101104:	83 c8 e0             	or     $0xffffffe0,%eax
  101107:	ee                   	out    %al,(%dx)
  101108:	5d                   	pop    %ebp
  101109:	c3                   	ret    
  10110a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101110 <disk_do_read>:
  101110:	55                   	push   %ebp
  101111:	89 e5                	mov    %esp,%ebp
  101113:	53                   	push   %ebx
  101114:	8b 45 0c             	mov    0xc(%ebp),%eax
  101117:	e8 a4 ff ff ff       	call   1010c0 <ide_prepare>
  10111c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101121:	b8 20 00 00 00       	mov    $0x20,%eax
  101126:	ee                   	out    %al,(%dx)
  101127:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10112a:	b2 f0                	mov    $0xf0,%dl
  10112c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101138:	ed                   	in     (%dx),%eax
  101139:	89 01                	mov    %eax,(%ecx)
  10113b:	83 c1 04             	add    $0x4,%ecx
  10113e:	39 d9                	cmp    %ebx,%ecx
  101140:	75 f6                	jne    101138 <disk_do_read+0x28>
  101142:	5b                   	pop    %ebx
  101143:	5d                   	pop    %ebp
  101144:	c3                   	ret    
  101145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101150 <disk_do_write>:
  101150:	55                   	push   %ebp
  101151:	89 e5                	mov    %esp,%ebp
  101153:	53                   	push   %ebx
  101154:	8b 45 0c             	mov    0xc(%ebp),%eax
  101157:	e8 64 ff ff ff       	call   1010c0 <ide_prepare>
  10115c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101161:	b8 30 00 00 00       	mov    $0x30,%eax
  101166:	ee                   	out    %al,(%dx)
  101167:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10116a:	b2 f0                	mov    $0xf0,%dl
  10116c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101178:	8b 01                	mov    (%ecx),%eax
  10117a:	ef                   	out    %eax,(%dx)
  10117b:	83 c1 04             	add    $0x4,%ecx
  10117e:	39 d9                	cmp    %ebx,%ecx
  101180:	75 f6                	jne    101178 <disk_do_write+0x28>
  101182:	5b                   	pop    %ebx
  101183:	5d                   	pop    %ebp
  101184:	c3                   	ret    
  101185:	66 90                	xchg   %ax,%ax
  101187:	66 90                	xchg   %ax,%ax
  101189:	66 90                	xchg   %ax,%ax
  10118b:	66 90                	xchg   %ax,%ax
  10118d:	66 90                	xchg   %ax,%ax
  10118f:	90                   	nop

00101190 <dma_prepare>:
  101190:	55                   	push   %ebp
  101191:	89 e5                	mov    %esp,%ebp
  101193:	83 ec 08             	sub    $0x8,%esp
  101196:	68 d0 16 10 00       	push   $0x1016d0
  10119b:	6a 1d                	push   $0x1d
  10119d:	68 b4 16 10 00       	push   $0x1016b4
  1011a2:	68 04 16 10 00       	push   $0x101604
  1011a7:	e8 a4 fb ff ff       	call   100d50 <printk>
  1011ac:	b8 01 00 00 00       	mov    $0x1,%eax
  1011b1:	d6                   	(bad)  
  1011b2:	83 c4 10             	add    $0x10,%esp
  1011b5:	c9                   	leave  
  1011b6:	c3                   	ret    
  1011b7:	89 f6                	mov    %esi,%esi
  1011b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001011c0 <dma_issue_read>:
  1011c0:	55                   	push   %ebp
  1011c1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
  1011c6:	89 e5                	mov    %esp,%ebp
  1011c8:	ec                   	in     (%dx),%al
  1011c9:	83 c8 09             	or     $0x9,%eax
  1011cc:	ee                   	out    %al,(%dx)
  1011cd:	5d                   	pop    %ebp
  1011ce:	c3                   	ret    
  1011cf:	90                   	nop

001011d0 <memcpy>:
  1011d0:	55                   	push   %ebp
  1011d1:	89 e5                	mov    %esp,%ebp
  1011d3:	56                   	push   %esi
  1011d4:	57                   	push   %edi
  1011d5:	53                   	push   %ebx
  1011d6:	8b 7d 08             	mov    0x8(%ebp),%edi
  1011d9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1011dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  1011df:	fc                   	cld    
  1011e0:	83 f9 08             	cmp    $0x8,%ecx
  1011e3:	76 26                	jbe    10120b <memcpy+0x3b>
  1011e5:	89 fa                	mov    %edi,%edx
  1011e7:	89 cb                	mov    %ecx,%ebx
  1011e9:	83 e2 03             	and    $0x3,%edx
  1011ec:	74 10                	je     1011fe <memcpy+0x2e>
  1011ee:	b9 04 00 00 00       	mov    $0x4,%ecx
  1011f3:	29 d1                	sub    %edx,%ecx
  1011f5:	83 e1 03             	and    $0x3,%ecx
  1011f8:	29 cb                	sub    %ecx,%ebx
  1011fa:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1011fc:	89 d9                	mov    %ebx,%ecx
  1011fe:	c1 e9 02             	shr    $0x2,%ecx
  101201:	8d 76 00             	lea    0x0(%esi),%esi
  101204:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101206:	89 d9                	mov    %ebx,%ecx
  101208:	83 e1 03             	and    $0x3,%ecx
  10120b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10120d:	8b 45 08             	mov    0x8(%ebp),%eax
  101210:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101213:	5b                   	pop    %ebx
  101214:	5f                   	pop    %edi
  101215:	5e                   	pop    %esi
  101216:	c9                   	leave  
  101217:	c3                   	ret    

00101218 <memset>:
  101218:	55                   	push   %ebp
  101219:	89 e5                	mov    %esp,%ebp
  10121b:	57                   	push   %edi
  10121c:	8b 7d 08             	mov    0x8(%ebp),%edi
  10121f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  101223:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101226:	fc                   	cld    
  101227:	83 f9 10             	cmp    $0x10,%ecx
  10122a:	76 69                	jbe    101295 <memset+0x7d>
  10122c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101232:	74 4c                	je     101280 <memset+0x68>
  101234:	88 07                	mov    %al,(%edi)
  101236:	47                   	inc    %edi
  101237:	49                   	dec    %ecx
  101238:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10123e:	74 40                	je     101280 <memset+0x68>
  101240:	88 07                	mov    %al,(%edi)
  101242:	47                   	inc    %edi
  101243:	49                   	dec    %ecx
  101244:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10124a:	74 34                	je     101280 <memset+0x68>
  10124c:	88 07                	mov    %al,(%edi)
  10124e:	47                   	inc    %edi
  10124f:	49                   	dec    %ecx
  101250:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101256:	74 28                	je     101280 <memset+0x68>
  101258:	88 07                	mov    %al,(%edi)
  10125a:	47                   	inc    %edi
  10125b:	49                   	dec    %ecx
  10125c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101262:	74 1c                	je     101280 <memset+0x68>
  101264:	88 07                	mov    %al,(%edi)
  101266:	47                   	inc    %edi
  101267:	49                   	dec    %ecx
  101268:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10126e:	74 10                	je     101280 <memset+0x68>
  101270:	88 07                	mov    %al,(%edi)
  101272:	47                   	inc    %edi
  101273:	49                   	dec    %ecx
  101274:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10127a:	74 04                	je     101280 <memset+0x68>
  10127c:	88 07                	mov    %al,(%edi)
  10127e:	47                   	inc    %edi
  10127f:	49                   	dec    %ecx
  101280:	88 c4                	mov    %al,%ah
  101282:	89 c2                	mov    %eax,%edx
  101284:	c1 e2 10             	shl    $0x10,%edx
  101287:	09 d0                	or     %edx,%eax
  101289:	89 ca                	mov    %ecx,%edx
  10128b:	c1 e9 02             	shr    $0x2,%ecx
  10128e:	83 e2 03             	and    $0x3,%edx
  101291:	f3 ab                	rep stos %eax,%es:(%edi)
  101293:	89 d1                	mov    %edx,%ecx
  101295:	f3 aa                	rep stos %al,%es:(%edi)
  101297:	8b 45 08             	mov    0x8(%ebp),%eax
  10129a:	8d 65 fc             	lea    -0x4(%ebp),%esp
  10129d:	5f                   	pop    %edi
  10129e:	c9                   	leave  
  10129f:	c3                   	ret    
