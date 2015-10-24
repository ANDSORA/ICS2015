
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
  10010c:	e8 b7 11 00 00       	call   1012c8 <memset>
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
  100138:	c7 44 24 10 74 13 10 	movl   $0x101374,0x10(%esp)
  10013f:	00 
  100140:	c7 44 24 0c d8 13 10 	movl   $0x1013d8,0xc(%esp)
  100147:	00 
  100148:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  10014f:	00 
  100150:	c7 44 24 04 63 13 10 	movl   $0x101363,0x4(%esp)
  100157:	00 
  100158:	c7 04 24 84 13 10 00 	movl   $0x101384,(%esp)
  10015f:	e8 9c 0c 00 00       	call   100e00 <printk>
  100164:	b8 01 00 00 00       	mov    $0x1,%eax
  100169:	d6                   	(bad)  
  10016a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10016d:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
  100173:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100178:	c1 ea 0c             	shr    $0xc,%edx
  10017b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100181:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
  100185:	75 32                	jne    1001b9 <mm_malloc+0x1a9>
  100187:	c7 44 24 10 7c 13 10 	movl   $0x10137c,0x10(%esp)
  10018e:	00 
  10018f:	c7 44 24 0c d8 13 10 	movl   $0x1013d8,0xc(%esp)
  100196:	00 
  100197:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10019e:	00 
  10019f:	c7 44 24 04 63 13 10 	movl   $0x101363,0x4(%esp)
  1001a6:	00 
  1001a7:	c7 04 24 84 13 10 00 	movl   $0x101384,(%esp)
  1001ae:	e8 4d 0c 00 00       	call   100e00 <printk>
  1001b3:	b8 01 00 00 00       	mov    $0x1,%eax
  1001b8:	d6                   	(bad)  
  1001b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1001bc:	c1 e8 16             	shr    $0x16,%eax
  1001bf:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
  1001c2:	f6 c3 01             	test   $0x1,%bl
  1001c5:	75 32                	jne    1001f9 <mm_malloc+0x1e9>
  1001c7:	c7 44 24 10 74 13 10 	movl   $0x101374,0x10(%esp)
  1001ce:	00 
  1001cf:	c7 44 24 0c d8 13 10 	movl   $0x1013d8,0xc(%esp)
  1001d6:	00 
  1001d7:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
  1001de:	00 
  1001df:	c7 44 24 04 63 13 10 	movl   $0x101363,0x4(%esp)
  1001e6:	00 
  1001e7:	c7 04 24 84 13 10 00 	movl   $0x101384,(%esp)
  1001ee:	e8 0d 0c 00 00       	call   100e00 <printk>
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
  100218:	c7 44 24 10 7c 13 10 	movl   $0x10137c,0x10(%esp)
  10021f:	00 
  100220:	c7 44 24 0c d8 13 10 	movl   $0x1013d8,0xc(%esp)
  100227:	00 
  100228:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
  10022f:	00 
  100230:	c7 44 24 04 63 13 10 	movl   $0x101363,0x4(%esp)
  100237:	00 
  100238:	c7 04 24 84 13 10 00 	movl   $0x101384,(%esp)
  10023f:	e8 bc 0b 00 00       	call   100e00 <printk>
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
  100268:	c7 44 24 10 50 13 10 	movl   $0x101350,0x10(%esp)
  10026f:	00 
  100270:	c7 44 24 0c ce 13 10 	movl   $0x1013ce,0xc(%esp)
  100277:	00 
  100278:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
  10027f:	00 
  100280:	c7 44 24 04 63 13 10 	movl   $0x101363,0x4(%esp)
  100287:	00 
  100288:	c7 04 24 84 13 10 00 	movl   $0x101384,(%esp)
  10028f:	e8 6c 0b 00 00       	call   100e00 <printk>
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
  100376:	68 6f 14 10 00       	push   $0x10146f
  10037b:	6a 4a                	push   $0x4a
  10037d:	68 de 13 10 00       	push   $0x1013de
  100382:	68 f0 13 10 00       	push   $0x1013f0
  100387:	e8 74 0a 00 00       	call   100e00 <printk>
  10038c:	e8 2f 09 00 00       	call   100cc0 <loader>
  100391:	bd 00 00 00 00       	mov    $0x0,%ebp
  100396:	83 ec 10             	sub    $0x10,%esp
  100399:	ff d0                	call   *%eax
  10039b:	68 6f 14 10 00       	push   $0x10146f
  1003a0:	6a 6b                	push   $0x6b
  1003a2:	68 de 13 10 00       	push   $0x1013de
  1003a7:	68 24 14 10 00       	push   $0x101424
  1003ac:	e8 4f 0a 00 00       	call   100e00 <printk>
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
  1003cd:	68 79 14 10 00       	push   $0x101479
  1003d2:	6a 24                	push   $0x24
  1003d4:	68 de 13 10 00       	push   $0x1013de
  1003d9:	68 24 14 10 00       	push   $0x101424
  1003de:	e8 1d 0a 00 00       	call   100e00 <printk>
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
  100414:	68 f4 14 10 00       	push   $0x1014f4
  100419:	6a 20                	push   $0x20
  10041b:	68 80 14 10 00       	push   $0x101480
  100420:	68 a0 14 10 00       	push   $0x1014a0
  100425:	e8 d6 09 00 00       	call   100e00 <printk>
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
  10046c:	68 2e 15 10 00       	push   $0x10152e
  100471:	68 7d 16 10 00       	push   $0x10167d
  100476:	6a 16                	push   $0x16
  100478:	68 12 15 10 00       	push   $0x101512
  10047d:	68 84 13 10 00       	push   $0x101384
  100482:	e8 79 09 00 00       	call   100e00 <printk>
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
  1004d3:	68 ff 14 10 00       	push   $0x1014ff
  1004d8:	68 7d 16 10 00       	push   $0x10167d
  1004dd:	6a 15                	push   $0x15
  1004df:	68 12 15 10 00       	push   $0x101512
  1004e4:	68 84 13 10 00       	push   $0x101384
  1004e9:	e8 12 09 00 00       	call   100e00 <printk>
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
  10050a:	68 72 16 10 00       	push   $0x101672
  10050f:	6a 24                	push   $0x24
  100511:	68 12 15 10 00       	push   $0x101512
  100516:	68 64 15 10 00       	push   $0x101564
  10051b:	e8 e0 08 00 00       	call   100e00 <printk>
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
  100573:	68 4c 15 10 00       	push   $0x10154c
  100578:	68 72 16 10 00       	push   $0x101672
  10057d:	6a 30                	push   $0x30
  10057f:	68 12 15 10 00       	push   $0x101512
  100584:	68 84 13 10 00       	push   $0x101384
  100589:	e8 72 08 00 00       	call   100e00 <printk>
  10058e:	b8 01 00 00 00       	mov    $0x1,%eax
  100593:	d6                   	(bad)  
  100594:	83 c4 20             	add    $0x20,%esp
  100597:	eb b8                	jmp    100551 <irq_handle+0x51>
  100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1005a0:	83 ec 08             	sub    $0x8,%esp
  1005a3:	ff 73 0c             	pushl  0xc(%ebx)
  1005a6:	50                   	push   %eax
  1005a7:	68 72 16 10 00       	push   $0x101672
  1005ac:	6a 2d                	push   $0x2d
  1005ae:	68 12 15 10 00       	push   $0x101512
  1005b3:	68 18 16 10 00       	push   $0x101618
  1005b8:	e8 43 08 00 00       	call   100e00 <printk>
  1005bd:	b8 01 00 00 00       	mov    $0x1,%eax
  1005c2:	d6                   	(bad)  
  1005c3:	83 c4 20             	add    $0x20,%esp
  1005c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005c9:	c9                   	leave  
  1005ca:	c3                   	ret    
  1005cb:	90                   	nop
  1005cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005d0:	68 72 16 10 00       	push   $0x101672
  1005d5:	6a 29                	push   $0x29
  1005d7:	68 12 15 10 00       	push   $0x101512
  1005dc:	68 cc 15 10 00       	push   $0x1015cc
  1005e1:	e8 1a 08 00 00       	call   100e00 <printk>
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
  100a26:	68 18 17 10 00       	push   $0x101718
  100a2b:	6a 11                	push   $0x11
  100a2d:	68 8c 16 10 00       	push   $0x10168c
  100a32:	68 b4 16 10 00       	push   $0x1016b4
  100a37:	e8 c4 03 00 00       	call   100e00 <printk>
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
  100a8c:	68 a5 16 10 00       	push   $0x1016a5
  100a91:	68 00 17 10 00       	push   $0x101700
  100a96:	6a 20                	push   $0x20
  100a98:	68 8c 16 10 00       	push   $0x10168c
  100a9d:	68 84 13 10 00       	push   $0x101384
  100aa2:	e8 59 03 00 00       	call   100e00 <printk>
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
  100ad2:	e8 f1 07 00 00       	call   1012c8 <memset>
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
  100b4d:	e8 76 07 00 00       	call   1012c8 <memset>
  100b52:	83 c4 0c             	add    $0xc,%esp
  100b55:	68 80 00 00 00       	push   $0x80
  100b5a:	53                   	push   %ebx
  100b5b:	68 00 60 12 00       	push   $0x126000
  100b60:	e8 1b 07 00 00       	call   101280 <memcpy>
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
  100ba3:	e8 20 07 00 00       	call   1012c8 <memset>
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
  100c1f:	e8 a4 06 00 00       	call   1012c8 <memset>
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
  100cc3:	57                   	push   %edi
  100cc4:	56                   	push   %esi
  100cc5:	53                   	push   %ebx
  100cc6:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
  100ccc:	81 ec 30 10 00 00    	sub    $0x1030,%esp
  100cd2:	89 95 d4 ef ff ff    	mov    %edx,-0x102c(%ebp)
  100cd8:	68 00 10 00 00       	push   $0x1000
  100cdd:	6a 00                	push   $0x0
  100cdf:	52                   	push   %edx
  100ce0:	e8 8b 01 00 00       	call   100e70 <ramdisk_read>
  100ce5:	83 c4 10             	add    $0x10,%esp
  100ce8:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
  100cef:	45 4c 46 
  100cf2:	8b 95 d4 ef ff ff    	mov    -0x102c(%ebp),%edx
  100cf8:	74 06                	je     100d00 <loader+0x40>
  100cfa:	b8 01 00 00 00       	mov    $0x1,%eax
  100cff:	d6                   	(bad)  
  100d00:	8b bd 04 f0 ff ff    	mov    -0xffc(%ebp),%edi
  100d06:	83 ff 34             	cmp    $0x34,%edi
  100d09:	74 06                	je     100d11 <loader+0x51>
  100d0b:	b8 01 00 00 00       	mov    $0x1,%eax
  100d10:	d6                   	(bad)  
  100d11:	0f b7 8d 14 f0 ff ff 	movzwl -0xfec(%ebp),%ecx
  100d18:	66 83 f9 02          	cmp    $0x2,%cx
  100d1c:	0f 84 a6 00 00 00    	je     100dc8 <loader+0x108>
  100d22:	b8 01 00 00 00       	mov    $0x1,%eax
  100d27:	d6                   	(bad)  
  100d28:	31 f6                	xor    %esi,%esi
  100d2a:	66 85 c9             	test   %cx,%cx
  100d2d:	75 17                	jne    100d46 <loader+0x86>
  100d2f:	eb 77                	jmp    100da8 <loader+0xe8>
  100d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100d38:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
  100d3f:	83 c6 01             	add    $0x1,%esi
  100d42:	39 f0                	cmp    %esi,%eax
  100d44:	7e 62                	jle    100da8 <loader+0xe8>
  100d46:	0f b7 9d 12 f0 ff ff 	movzwl -0xfee(%ebp),%ebx
  100d4d:	0f af de             	imul   %esi,%ebx
  100d50:	c1 e3 05             	shl    $0x5,%ebx
  100d53:	01 fb                	add    %edi,%ebx
  100d55:	01 d3                	add    %edx,%ebx
  100d57:	83 3b 01             	cmpl   $0x1,(%ebx)
  100d5a:	75 dc                	jne    100d38 <loader+0x78>
  100d5c:	83 ec 04             	sub    $0x4,%esp
  100d5f:	ff 73 10             	pushl  0x10(%ebx)
  100d62:	ff 73 08             	pushl  0x8(%ebx)
  100d65:	ff 73 04             	pushl  0x4(%ebx)
  100d68:	89 95 d4 ef ff ff    	mov    %edx,-0x102c(%ebp)
  100d6e:	83 c6 01             	add    $0x1,%esi
  100d71:	e8 0a 01 00 00       	call   100e80 <ramdisk_write>
  100d76:	8b 43 10             	mov    0x10(%ebx),%eax
  100d79:	8b 4b 14             	mov    0x14(%ebx),%ecx
  100d7c:	83 c4 0c             	add    $0xc,%esp
  100d7f:	29 c1                	sub    %eax,%ecx
  100d81:	51                   	push   %ecx
  100d82:	6a 00                	push   $0x0
  100d84:	03 43 04             	add    0x4(%ebx),%eax
  100d87:	03 43 08             	add    0x8(%ebx),%eax
  100d8a:	50                   	push   %eax
  100d8b:	e8 38 05 00 00       	call   1012c8 <memset>
  100d90:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
  100d97:	83 c4 10             	add    $0x10,%esp
  100d9a:	8b 95 d4 ef ff ff    	mov    -0x102c(%ebp),%edx
  100da0:	39 f0                	cmp    %esi,%eax
  100da2:	7f a2                	jg     100d46 <loader+0x86>
  100da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100da8:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
  100dae:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
  100db4:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
  100dba:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100dbd:	5b                   	pop    %ebx
  100dbe:	5e                   	pop    %esi
  100dbf:	5f                   	pop    %edi
  100dc0:	5d                   	pop    %ebp
  100dc1:	c3                   	ret    
  100dc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100dc8:	31 f6                	xor    %esi,%esi
  100dca:	e9 77 ff ff ff       	jmp    100d46 <loader+0x86>
  100dcf:	90                   	nop

00100dd0 <sbrk>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	83 ec 08             	sub    $0x8,%esp
  100dd6:	68 43 17 10 00       	push   $0x101743
  100ddb:	6a 08                	push   $0x8
  100ddd:	68 2d 17 10 00       	push   $0x10172d
  100de2:	68 24 14 10 00       	push   $0x101424
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
  100e73:	5d                   	pop    %ebp
  100e74:	e9 07 04 00 00       	jmp    101280 <memcpy>
  100e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100e80 <ramdisk_write>:
  100e80:	55                   	push   %ebp
  100e81:	89 e5                	mov    %esp,%ebp
  100e83:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e86:	8b 55 08             	mov    0x8(%ebp),%edx
  100e89:	89 45 08             	mov    %eax,0x8(%ebp)
  100e8c:	89 55 0c             	mov    %edx,0xc(%ebp)
  100e8f:	5d                   	pop    %ebp
  100e90:	e9 eb 03 00 00       	jmp    101280 <memcpy>
  100e95:	66 90                	xchg   %ax,%ax
  100e97:	66 90                	xchg   %ax,%ax
  100e99:	66 90                	xchg   %ax,%ax
  100e9b:	66 90                	xchg   %ax,%ax
  100e9d:	66 90                	xchg   %ax,%ax
  100e9f:	90                   	nop

00100ea0 <ide_intr>:
  100ea0:	55                   	push   %ebp
  100ea1:	c7 05 04 90 14 00 01 	movl   $0x1,0x149004
  100ea8:	00 00 00 
  100eab:	89 e5                	mov    %esp,%ebp
  100ead:	5d                   	pop    %ebp
  100eae:	c3                   	ret    
  100eaf:	90                   	nop

00100eb0 <ide_writeback>:
  100eb0:	a1 00 90 14 00       	mov    0x149000,%eax
  100eb5:	83 c0 01             	add    $0x1,%eax
  100eb8:	83 f8 64             	cmp    $0x64,%eax
  100ebb:	a3 00 90 14 00       	mov    %eax,0x149000
  100ec0:	74 06                	je     100ec8 <ide_writeback+0x18>
  100ec2:	c3                   	ret    
  100ec3:	90                   	nop
  100ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ec8:	55                   	push   %ebp
  100ec9:	89 e5                	mov    %esp,%ebp
  100ecb:	83 ec 08             	sub    $0x8,%esp
  100ece:	e8 dd 01 00 00       	call   1010b0 <buf_writeback>
  100ed3:	c7 05 00 90 14 00 00 	movl   $0x0,0x149000
  100eda:	00 00 00 
  100edd:	c9                   	leave  
  100ede:	c3                   	ret    
  100edf:	90                   	nop

00100ee0 <ide_read>:
  100ee0:	55                   	push   %ebp
  100ee1:	89 e5                	mov    %esp,%ebp
  100ee3:	57                   	push   %edi
  100ee4:	56                   	push   %esi
  100ee5:	53                   	push   %ebx
  100ee6:	83 ec 0c             	sub    $0xc,%esp
  100ee9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100eec:	8b 45 10             	mov    0x10(%ebp),%eax
  100eef:	8b 7d 08             	mov    0x8(%ebp),%edi
  100ef2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  100ef5:	29 df                	sub    %ebx,%edi
  100ef7:	85 c0                	test   %eax,%eax
  100ef9:	74 1b                	je     100f16 <ide_read+0x36>
  100efb:	90                   	nop
  100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f00:	83 ec 0c             	sub    $0xc,%esp
  100f03:	53                   	push   %ebx
  100f04:	e8 07 02 00 00       	call   101110 <read_byte>
  100f09:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  100f0c:	83 c3 01             	add    $0x1,%ebx
  100f0f:	83 c4 10             	add    $0x10,%esp
  100f12:	39 f3                	cmp    %esi,%ebx
  100f14:	75 ea                	jne    100f00 <ide_read+0x20>
  100f16:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f19:	5b                   	pop    %ebx
  100f1a:	5e                   	pop    %esi
  100f1b:	5f                   	pop    %edi
  100f1c:	5d                   	pop    %ebp
  100f1d:	c3                   	ret    
  100f1e:	66 90                	xchg   %ax,%ax

00100f20 <ide_write>:
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
  100f39:	74 1d                	je     100f58 <ide_write+0x38>
  100f3b:	90                   	nop
  100f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f40:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  100f44:	83 ec 08             	sub    $0x8,%esp
  100f47:	50                   	push   %eax
  100f48:	53                   	push   %ebx
  100f49:	83 c3 01             	add    $0x1,%ebx
  100f4c:	e8 ef 01 00 00       	call   101140 <write_byte>
  100f51:	83 c4 10             	add    $0x10,%esp
  100f54:	39 f3                	cmp    %esi,%ebx
  100f56:	75 e8                	jne    100f40 <ide_write+0x20>
  100f58:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f5b:	5b                   	pop    %ebx
  100f5c:	5e                   	pop    %esi
  100f5d:	5f                   	pop    %edi
  100f5e:	5d                   	pop    %ebp
  100f5f:	c3                   	ret    

00100f60 <clear_ide_intr>:
  100f60:	55                   	push   %ebp
  100f61:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100f68:	00 00 00 
  100f6b:	89 e5                	mov    %esp,%ebp
  100f6d:	5d                   	pop    %ebp
  100f6e:	c3                   	ret    
  100f6f:	90                   	nop

00100f70 <wait_ide_intr>:
  100f70:	a1 04 90 14 00       	mov    0x149004,%eax
  100f75:	55                   	push   %ebp
  100f76:	89 e5                	mov    %esp,%ebp
  100f78:	85 c0                	test   %eax,%eax
  100f7a:	75 0e                	jne    100f8a <wait_ide_intr+0x1a>
  100f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f80:	f4                   	hlt    
  100f81:	a1 04 90 14 00       	mov    0x149004,%eax
  100f86:	85 c0                	test   %eax,%eax
  100f88:	74 f6                	je     100f80 <wait_ide_intr+0x10>
  100f8a:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  100f91:	00 00 00 
  100f94:	5d                   	pop    %ebp
  100f95:	c3                   	ret    
  100f96:	8d 76 00             	lea    0x0(%esi),%esi
  100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100fa0 <init_ide>:
  100fa0:	55                   	push   %ebp
  100fa1:	89 e5                	mov    %esp,%ebp
  100fa3:	83 ec 08             	sub    $0x8,%esp
  100fa6:	e8 d5 00 00 00       	call   101080 <buf_init>
  100fab:	83 ec 08             	sub    $0x8,%esp
  100fae:	68 b0 0e 10 00       	push   $0x100eb0
  100fb3:	6a 00                	push   $0x0
  100fb5:	e8 96 f4 ff ff       	call   100450 <add_irq_handle>
  100fba:	58                   	pop    %eax
  100fbb:	5a                   	pop    %edx
  100fbc:	68 a0 0e 10 00       	push   $0x100ea0
  100fc1:	6a 0e                	push   $0xe
  100fc3:	e8 88 f4 ff ff       	call   100450 <add_irq_handle>
  100fc8:	83 c4 10             	add    $0x10,%esp
  100fcb:	c9                   	leave  
  100fcc:	c3                   	ret    
  100fcd:	66 90                	xchg   %ax,%ax
  100fcf:	90                   	nop

00100fd0 <buf_fetch>:
  100fd0:	55                   	push   %ebp
  100fd1:	89 c2                	mov    %eax,%edx
  100fd3:	89 e5                	mov    %esp,%ebp
  100fd5:	57                   	push   %edi
  100fd6:	56                   	push   %esi
  100fd7:	53                   	push   %ebx
  100fd8:	89 c3                	mov    %eax,%ebx
  100fda:	83 e3 7f             	and    $0x7f,%ebx
  100fdd:	89 d8                	mov    %ebx,%eax
  100fdf:	83 ec 1c             	sub    $0x1c,%esp
  100fe2:	c1 e0 09             	shl    $0x9,%eax
  100fe5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
  100fe8:	8d 81 40 90 14 00    	lea    0x149040(%ecx),%eax
  100fee:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
  100ff2:	74 5c                	je     101050 <buf_fetch+0x80>
  100ff4:	89 d7                	mov    %edx,%edi
  100ff6:	89 da                	mov    %ebx,%edx
  100ff8:	c1 e2 09             	shl    $0x9,%edx
  100ffb:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  100ffe:	8d 91 40 90 14 00    	lea    0x149040(%ecx),%edx
  101004:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
  10100a:	74 54                	je     101060 <buf_fetch+0x90>
  10100c:	8d 72 06             	lea    0x6(%edx),%esi
  10100f:	83 ec 08             	sub    $0x8,%esp
  101012:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101015:	57                   	push   %edi
  101016:	56                   	push   %esi
  101017:	e8 a4 01 00 00       	call   1011c0 <disk_do_read>
  10101c:	89 da                	mov    %ebx,%edx
  10101e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101021:	83 c4 10             	add    $0x10,%esp
  101024:	c1 e2 09             	shl    $0x9,%edx
  101027:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
  10102a:	c6 81 44 90 14 00 01 	movb   $0x1,0x149044(%ecx)
  101031:	89 b9 40 90 14 00    	mov    %edi,0x149040(%ecx)
  101037:	c6 81 45 90 14 00 00 	movb   $0x0,0x149045(%ecx)
  10103e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101041:	5b                   	pop    %ebx
  101042:	5e                   	pop    %esi
  101043:	5f                   	pop    %edi
  101044:	5d                   	pop    %ebp
  101045:	c3                   	ret    
  101046:	8d 76 00             	lea    0x0(%esi),%esi
  101049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  101050:	39 91 40 90 14 00    	cmp    %edx,0x149040(%ecx)
  101056:	75 9c                	jne    100ff4 <buf_fetch+0x24>
  101058:	eb e4                	jmp    10103e <buf_fetch+0x6e>
  10105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101060:	8d 72 06             	lea    0x6(%edx),%esi
  101063:	83 ec 08             	sub    $0x8,%esp
  101066:	ff b1 40 90 14 00    	pushl  0x149040(%ecx)
  10106c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10106f:	56                   	push   %esi
  101070:	e8 8b 01 00 00       	call   101200 <disk_do_write>
  101075:	83 c4 10             	add    $0x10,%esp
  101078:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10107b:	eb 92                	jmp    10100f <buf_fetch+0x3f>
  10107d:	8d 76 00             	lea    0x0(%esi),%esi

00101080 <buf_init>:
  101080:	55                   	push   %ebp
  101081:	b8 44 90 14 00       	mov    $0x149044,%eax
  101086:	89 e5                	mov    %esp,%ebp
  101088:	90                   	nop
  101089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101090:	c6 00 00             	movb   $0x0,(%eax)
  101093:	05 08 02 00 00       	add    $0x208,%eax
  101098:	3d 44 94 15 00       	cmp    $0x159444,%eax
  10109d:	75 f1                	jne    101090 <buf_init+0x10>
  10109f:	5d                   	pop    %ebp
  1010a0:	c3                   	ret    
  1010a1:	eb 0d                	jmp    1010b0 <buf_writeback>
  1010a3:	90                   	nop
  1010a4:	90                   	nop
  1010a5:	90                   	nop
  1010a6:	90                   	nop
  1010a7:	90                   	nop
  1010a8:	90                   	nop
  1010a9:	90                   	nop
  1010aa:	90                   	nop
  1010ab:	90                   	nop
  1010ac:	90                   	nop
  1010ad:	90                   	nop
  1010ae:	90                   	nop
  1010af:	90                   	nop

001010b0 <buf_writeback>:
  1010b0:	55                   	push   %ebp
  1010b1:	89 e5                	mov    %esp,%ebp
  1010b3:	53                   	push   %ebx
  1010b4:	bb 46 90 14 00       	mov    $0x149046,%ebx
  1010b9:	83 ec 04             	sub    $0x4,%esp
  1010bc:	eb 10                	jmp    1010ce <buf_writeback+0x1e>
  1010be:	66 90                	xchg   %ax,%ax
  1010c0:	81 c3 08 02 00 00    	add    $0x208,%ebx
  1010c6:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  1010cc:	74 32                	je     101100 <buf_writeback+0x50>
  1010ce:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
  1010d2:	75 ec                	jne    1010c0 <buf_writeback+0x10>
  1010d4:	83 ec 08             	sub    $0x8,%esp
  1010d7:	ff 73 fa             	pushl  -0x6(%ebx)
  1010da:	53                   	push   %ebx
  1010db:	81 c3 08 02 00 00    	add    $0x208,%ebx
  1010e1:	e8 1a 01 00 00       	call   101200 <disk_do_write>
  1010e6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
  1010ed:	83 c4 10             	add    $0x10,%esp
  1010f0:	81 fb 46 94 15 00    	cmp    $0x159446,%ebx
  1010f6:	75 d6                	jne    1010ce <buf_writeback+0x1e>
  1010f8:	90                   	nop
  1010f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101100:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101103:	c9                   	leave  
  101104:	c3                   	ret    
  101105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101110 <read_byte>:
  101110:	55                   	push   %ebp
  101111:	89 e5                	mov    %esp,%ebp
  101113:	53                   	push   %ebx
  101114:	83 ec 04             	sub    $0x4,%esp
  101117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10111a:	89 d8                	mov    %ebx,%eax
  10111c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101122:	c1 e8 09             	shr    $0x9,%eax
  101125:	e8 a6 fe ff ff       	call   100fd0 <buf_fetch>
  10112a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
  10112f:	83 c4 04             	add    $0x4,%esp
  101132:	5b                   	pop    %ebx
  101133:	5d                   	pop    %ebp
  101134:	c3                   	ret    
  101135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101140 <write_byte>:
  101140:	55                   	push   %ebp
  101141:	89 e5                	mov    %esp,%ebp
  101143:	56                   	push   %esi
  101144:	53                   	push   %ebx
  101145:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101148:	8b 75 0c             	mov    0xc(%ebp),%esi
  10114b:	89 d8                	mov    %ebx,%eax
  10114d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  101153:	c1 e8 09             	shr    $0x9,%eax
  101156:	e8 75 fe ff ff       	call   100fd0 <buf_fetch>
  10115b:	89 f2                	mov    %esi,%edx
  10115d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
  101161:	c6 40 05 01          	movb   $0x1,0x5(%eax)
  101165:	5b                   	pop    %ebx
  101166:	5e                   	pop    %esi
  101167:	5d                   	pop    %ebp
  101168:	c3                   	ret    
  101169:	66 90                	xchg   %ax,%ax
  10116b:	66 90                	xchg   %ax,%ax
  10116d:	66 90                	xchg   %ax,%ax
  10116f:	90                   	nop

00101170 <ide_prepare>:
  101170:	55                   	push   %ebp
  101171:	89 c1                	mov    %eax,%ecx
  101173:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101178:	89 e5                	mov    %esp,%ebp
  10117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101180:	ec                   	in     (%dx),%al
  101181:	83 e0 c0             	and    $0xffffffc0,%eax
  101184:	3c 40                	cmp    $0x40,%al
  101186:	75 f8                	jne    101180 <ide_prepare+0x10>
  101188:	ba f1 01 00 00       	mov    $0x1f1,%edx
  10118d:	31 c0                	xor    %eax,%eax
  10118f:	ee                   	out    %al,(%dx)
  101190:	b8 01 00 00 00       	mov    $0x1,%eax
  101195:	b2 f2                	mov    $0xf2,%dl
  101197:	ee                   	out    %al,(%dx)
  101198:	b2 f3                	mov    $0xf3,%dl
  10119a:	89 c8                	mov    %ecx,%eax
  10119c:	ee                   	out    %al,(%dx)
  10119d:	89 c8                	mov    %ecx,%eax
  10119f:	b2 f4                	mov    $0xf4,%dl
  1011a1:	c1 e8 08             	shr    $0x8,%eax
  1011a4:	ee                   	out    %al,(%dx)
  1011a5:	89 c8                	mov    %ecx,%eax
  1011a7:	b2 f5                	mov    $0xf5,%dl
  1011a9:	c1 e8 10             	shr    $0x10,%eax
  1011ac:	ee                   	out    %al,(%dx)
  1011ad:	89 c8                	mov    %ecx,%eax
  1011af:	b2 f6                	mov    $0xf6,%dl
  1011b1:	c1 e8 18             	shr    $0x18,%eax
  1011b4:	83 c8 e0             	or     $0xffffffe0,%eax
  1011b7:	ee                   	out    %al,(%dx)
  1011b8:	5d                   	pop    %ebp
  1011b9:	c3                   	ret    
  1011ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001011c0 <disk_do_read>:
  1011c0:	55                   	push   %ebp
  1011c1:	89 e5                	mov    %esp,%ebp
  1011c3:	53                   	push   %ebx
  1011c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1011c7:	e8 a4 ff ff ff       	call   101170 <ide_prepare>
  1011cc:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1011d1:	b8 20 00 00 00       	mov    $0x20,%eax
  1011d6:	ee                   	out    %al,(%dx)
  1011d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1011da:	b2 f0                	mov    $0xf0,%dl
  1011dc:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1011e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1011e8:	ed                   	in     (%dx),%eax
  1011e9:	89 01                	mov    %eax,(%ecx)
  1011eb:	83 c1 04             	add    $0x4,%ecx
  1011ee:	39 d9                	cmp    %ebx,%ecx
  1011f0:	75 f6                	jne    1011e8 <disk_do_read+0x28>
  1011f2:	5b                   	pop    %ebx
  1011f3:	5d                   	pop    %ebp
  1011f4:	c3                   	ret    
  1011f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1011f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101200 <disk_do_write>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	53                   	push   %ebx
  101204:	8b 45 0c             	mov    0xc(%ebp),%eax
  101207:	e8 64 ff ff ff       	call   101170 <ide_prepare>
  10120c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  101211:	b8 30 00 00 00       	mov    $0x30,%eax
  101216:	ee                   	out    %al,(%dx)
  101217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10121a:	b2 f0                	mov    $0xf0,%dl
  10121c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  101222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101228:	8b 01                	mov    (%ecx),%eax
  10122a:	ef                   	out    %eax,(%dx)
  10122b:	83 c1 04             	add    $0x4,%ecx
  10122e:	39 d9                	cmp    %ebx,%ecx
  101230:	75 f6                	jne    101228 <disk_do_write+0x28>
  101232:	5b                   	pop    %ebx
  101233:	5d                   	pop    %ebp
  101234:	c3                   	ret    
  101235:	66 90                	xchg   %ax,%ax
  101237:	66 90                	xchg   %ax,%ax
  101239:	66 90                	xchg   %ax,%ax
  10123b:	66 90                	xchg   %ax,%ax
  10123d:	66 90                	xchg   %ax,%ax
  10123f:	90                   	nop

00101240 <dma_prepare>:
  101240:	55                   	push   %ebp
  101241:	89 e5                	mov    %esp,%ebp
  101243:	83 ec 08             	sub    $0x8,%esp
  101246:	68 64 17 10 00       	push   $0x101764
  10124b:	6a 1d                	push   $0x1d
  10124d:	68 48 17 10 00       	push   $0x101748
  101252:	68 b4 16 10 00       	push   $0x1016b4
  101257:	e8 a4 fb ff ff       	call   100e00 <printk>
  10125c:	b8 01 00 00 00       	mov    $0x1,%eax
  101261:	d6                   	(bad)  
  101262:	83 c4 10             	add    $0x10,%esp
  101265:	c9                   	leave  
  101266:	c3                   	ret    
  101267:	89 f6                	mov    %esi,%esi
  101269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101270 <dma_issue_read>:
  101270:	55                   	push   %ebp
  101271:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
  101276:	89 e5                	mov    %esp,%ebp
  101278:	ec                   	in     (%dx),%al
  101279:	83 c8 09             	or     $0x9,%eax
  10127c:	ee                   	out    %al,(%dx)
  10127d:	5d                   	pop    %ebp
  10127e:	c3                   	ret    
  10127f:	90                   	nop

00101280 <memcpy>:
  101280:	55                   	push   %ebp
  101281:	89 e5                	mov    %esp,%ebp
  101283:	56                   	push   %esi
  101284:	57                   	push   %edi
  101285:	53                   	push   %ebx
  101286:	8b 7d 08             	mov    0x8(%ebp),%edi
  101289:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10128c:	8b 75 0c             	mov    0xc(%ebp),%esi
  10128f:	fc                   	cld    
  101290:	83 f9 08             	cmp    $0x8,%ecx
  101293:	76 26                	jbe    1012bb <memcpy+0x3b>
  101295:	89 fa                	mov    %edi,%edx
  101297:	89 cb                	mov    %ecx,%ebx
  101299:	83 e2 03             	and    $0x3,%edx
  10129c:	74 10                	je     1012ae <memcpy+0x2e>
  10129e:	b9 04 00 00 00       	mov    $0x4,%ecx
  1012a3:	29 d1                	sub    %edx,%ecx
  1012a5:	83 e1 03             	and    $0x3,%ecx
  1012a8:	29 cb                	sub    %ecx,%ebx
  1012aa:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012ac:	89 d9                	mov    %ebx,%ecx
  1012ae:	c1 e9 02             	shr    $0x2,%ecx
  1012b1:	8d 76 00             	lea    0x0(%esi),%esi
  1012b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1012b6:	89 d9                	mov    %ebx,%ecx
  1012b8:	83 e1 03             	and    $0x3,%ecx
  1012bb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1012bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1012c3:	5b                   	pop    %ebx
  1012c4:	5f                   	pop    %edi
  1012c5:	5e                   	pop    %esi
  1012c6:	c9                   	leave  
  1012c7:	c3                   	ret    

001012c8 <memset>:
  1012c8:	55                   	push   %ebp
  1012c9:	89 e5                	mov    %esp,%ebp
  1012cb:	57                   	push   %edi
  1012cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012cf:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  1012d3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1012d6:	fc                   	cld    
  1012d7:	83 f9 10             	cmp    $0x10,%ecx
  1012da:	76 69                	jbe    101345 <memset+0x7d>
  1012dc:	f7 c7 07 00 00 00    	test   $0x7,%edi
  1012e2:	74 4c                	je     101330 <memset+0x68>
  1012e4:	88 07                	mov    %al,(%edi)
  1012e6:	47                   	inc    %edi
  1012e7:	49                   	dec    %ecx
  1012e8:	f7 c7 07 00 00 00    	test   $0x7,%edi
  1012ee:	74 40                	je     101330 <memset+0x68>
  1012f0:	88 07                	mov    %al,(%edi)
  1012f2:	47                   	inc    %edi
  1012f3:	49                   	dec    %ecx
  1012f4:	f7 c7 07 00 00 00    	test   $0x7,%edi
  1012fa:	74 34                	je     101330 <memset+0x68>
  1012fc:	88 07                	mov    %al,(%edi)
  1012fe:	47                   	inc    %edi
  1012ff:	49                   	dec    %ecx
  101300:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101306:	74 28                	je     101330 <memset+0x68>
  101308:	88 07                	mov    %al,(%edi)
  10130a:	47                   	inc    %edi
  10130b:	49                   	dec    %ecx
  10130c:	f7 c7 07 00 00 00    	test   $0x7,%edi
  101312:	74 1c                	je     101330 <memset+0x68>
  101314:	88 07                	mov    %al,(%edi)
  101316:	47                   	inc    %edi
  101317:	49                   	dec    %ecx
  101318:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10131e:	74 10                	je     101330 <memset+0x68>
  101320:	88 07                	mov    %al,(%edi)
  101322:	47                   	inc    %edi
  101323:	49                   	dec    %ecx
  101324:	f7 c7 07 00 00 00    	test   $0x7,%edi
  10132a:	74 04                	je     101330 <memset+0x68>
  10132c:	88 07                	mov    %al,(%edi)
  10132e:	47                   	inc    %edi
  10132f:	49                   	dec    %ecx
  101330:	88 c4                	mov    %al,%ah
  101332:	89 c2                	mov    %eax,%edx
  101334:	c1 e2 10             	shl    $0x10,%edx
  101337:	09 d0                	or     %edx,%eax
  101339:	89 ca                	mov    %ecx,%edx
  10133b:	c1 e9 02             	shr    $0x2,%ecx
  10133e:	83 e2 03             	and    $0x3,%edx
  101341:	f3 ab                	rep stos %eax,%es:(%edi)
  101343:	89 d1                	mov    %edx,%ecx
  101345:	f3 aa                	rep stos %al,%es:(%edi)
  101347:	8b 45 08             	mov    0x8(%ebp),%eax
  10134a:	8d 65 fc             	lea    -0x4(%ebp),%esp
  10134d:	5f                   	pop    %edi
  10134e:	c9                   	leave  
  10134f:	c3                   	ret    
