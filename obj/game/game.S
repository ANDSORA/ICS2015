
game:     file format elf32-i386


Disassembly of section .text:

080480a0 <init_timer>:
 80480a0:	55                   	push   %ebp
 80480a1:	ba 43 00 00 00       	mov    $0x43,%edx
 80480a6:	b8 34 00 00 00       	mov    $0x34,%eax
 80480ab:	89 e5                	mov    %esp,%ebp
 80480ad:	ee                   	out    %al,(%dx)
 80480ae:	b8 9b ff ff ff       	mov    $0xffffff9b,%eax
 80480b3:	b2 40                	mov    $0x40,%dl
 80480b5:	ee                   	out    %al,(%dx)
 80480b6:	b8 2e 00 00 00       	mov    $0x2e,%eax
 80480bb:	ee                   	out    %al,(%dx)
 80480bc:	5d                   	pop    %ebp
 80480bd:	c3                   	ret    
 80480be:	66 90                	xchg   %ax,%ax

080480c0 <write_palette>:
 80480c0:	55                   	push   %ebp
 80480c1:	ba c8 03 00 00       	mov    $0x3c8,%edx
 80480c6:	31 c0                	xor    %eax,%eax
 80480c8:	89 e5                	mov    %esp,%ebp
 80480ca:	53                   	push   %ebx
 80480cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80480ce:	ee                   	out    %al,(%dx)
 80480cf:	85 db                	test   %ebx,%ebx
 80480d1:	7e 2b                	jle    80480fe <write_palette+0x3e>
 80480d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80480d6:	b2 c9                	mov    $0xc9,%dl
 80480d8:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
 80480db:	90                   	nop
 80480dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80480e0:	0f b6 01             	movzbl (%ecx),%eax
 80480e3:	c0 e8 02             	shr    $0x2,%al
 80480e6:	ee                   	out    %al,(%dx)
 80480e7:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 80480eb:	c0 e8 02             	shr    $0x2,%al
 80480ee:	ee                   	out    %al,(%dx)
 80480ef:	0f b6 41 02          	movzbl 0x2(%ecx),%eax
 80480f3:	c0 e8 02             	shr    $0x2,%al
 80480f6:	ee                   	out    %al,(%dx)
 80480f7:	83 c1 04             	add    $0x4,%ecx
 80480fa:	39 d9                	cmp    %ebx,%ecx
 80480fc:	75 e2                	jne    80480e0 <write_palette+0x20>
 80480fe:	5b                   	pop    %ebx
 80480ff:	5d                   	pop    %ebp
 8048100:	c3                   	ret    
 8048101:	eb 0d                	jmp    8048110 <read_palette>
 8048103:	90                   	nop
 8048104:	90                   	nop
 8048105:	90                   	nop
 8048106:	90                   	nop
 8048107:	90                   	nop
 8048108:	90                   	nop
 8048109:	90                   	nop
 804810a:	90                   	nop
 804810b:	90                   	nop
 804810c:	90                   	nop
 804810d:	90                   	nop
 804810e:	90                   	nop
 804810f:	90                   	nop

08048110 <read_palette>:
 8048110:	55                   	push   %ebp
 8048111:	ba c7 03 00 00       	mov    $0x3c7,%edx
 8048116:	31 c0                	xor    %eax,%eax
 8048118:	89 e5                	mov    %esp,%ebp
 804811a:	57                   	push   %edi
 804811b:	56                   	push   %esi
 804811c:	53                   	push   %ebx
 804811d:	83 ec 0c             	sub    $0xc,%esp
 8048120:	ee                   	out    %al,(%dx)
 8048121:	bb 00 01 00 00       	mov    $0x100,%ebx
 8048126:	be c9 03 00 00       	mov    $0x3c9,%esi
 804812b:	90                   	nop
 804812c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048130:	89 f2                	mov    %esi,%edx
 8048132:	ec                   	in     (%dx),%al
 8048133:	0f b6 c8             	movzbl %al,%ecx
 8048136:	ec                   	in     (%dx),%al
 8048137:	89 c7                	mov    %eax,%edi
 8048139:	ec                   	in     (%dx),%al
 804813a:	0f b6 c0             	movzbl %al,%eax
 804813d:	50                   	push   %eax
 804813e:	89 f8                	mov    %edi,%eax
 8048140:	0f b6 f8             	movzbl %al,%edi
 8048143:	57                   	push   %edi
 8048144:	51                   	push   %ecx
 8048145:	68 00 43 05 08       	push   $0x8054300
 804814a:	e8 b1 0e 00 00       	call   8049000 <printf>
 804814f:	83 c4 10             	add    $0x10,%esp
 8048152:	83 eb 01             	sub    $0x1,%ebx
 8048155:	75 d9                	jne    8048130 <read_palette+0x20>
 8048157:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804815a:	5b                   	pop    %ebx
 804815b:	5e                   	pop    %esi
 804815c:	5f                   	pop    %edi
 804815d:	5d                   	pop    %ebp
 804815e:	c3                   	ret    
 804815f:	90                   	nop

08048160 <prepare_buffer>:
 8048160:	55                   	push   %ebp
 8048161:	89 e5                	mov    %esp,%ebp
 8048163:	83 ec 0c             	sub    $0xc,%esp
 8048166:	68 00 fa 00 00       	push   $0xfa00
 804816b:	6a 00                	push   $0x0
 804816d:	ff 35 40 77 05 08    	pushl  0x8057740
 8048173:	e8 cc 0d 00 00       	call   8048f44 <memset>
 8048178:	83 c4 10             	add    $0x10,%esp
 804817b:	c9                   	leave  
 804817c:	c3                   	ret    
 804817d:	8d 76 00             	lea    0x0(%esi),%esi

08048180 <display_buffer>:
 8048180:	55                   	push   %ebp
 8048181:	b9 80 3e 00 00       	mov    $0x3e80,%ecx
 8048186:	89 e5                	mov    %esp,%ebp
 8048188:	57                   	push   %edi
 8048189:	bf 00 00 0a 00       	mov    $0xa0000,%edi
 804818e:	56                   	push   %esi
 804818f:	8b 35 40 77 05 08    	mov    0x8057740,%esi
 8048195:	fc                   	cld    
 8048196:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8048198:	5e                   	pop    %esi
 8048199:	5f                   	pop    %edi
 804819a:	5d                   	pop    %ebp
 804819b:	c3                   	ret    
 804819c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080481a0 <draw_string>:
 80481a0:	55                   	push   %ebp
 80481a1:	89 e5                	mov    %esp,%ebp
 80481a3:	57                   	push   %edi
 80481a4:	56                   	push   %esi
 80481a5:	53                   	push   %ebx
 80481a6:	83 ec 1c             	sub    $0x1c,%esp
 80481a9:	8b 7d 10             	mov    0x10(%ebp),%edi
 80481ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80481af:	0f be 18             	movsbl (%eax),%ebx
 80481b2:	84 db                	test   %bl,%bl
 80481b4:	0f 84 9d 00 00 00    	je     8048257 <draw_string+0xb7>
 80481ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 80481be:	84 db                	test   %bl,%bl
 80481c0:	0f 88 d2 00 00 00    	js     8048298 <draw_string+0xf8>
 80481c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 80481cc:	8d 14 dd 80 77 05 08 	lea    0x8057780(,%ebx,8),%edx
 80481d3:	83 c0 08             	add    $0x8,%eax
 80481d6:	29 f2                	sub    %esi,%edx
 80481d8:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80481db:	90                   	nop
 80481dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80481e0:	69 c6 40 01 00 00    	imul   $0x140,%esi,%eax
 80481e6:	31 db                	xor    %ebx,%ebx
 80481e8:	89 7d 10             	mov    %edi,0x10(%ebp)
 80481eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80481ee:	eb 08                	jmp    80481f8 <draw_string+0x58>
 80481f0:	83 c3 01             	add    $0x1,%ebx
 80481f3:	83 fb 08             	cmp    $0x8,%ebx
 80481f6:	74 39                	je     8048231 <draw_string+0x91>
 80481f8:	0f be 04 32          	movsbl (%edx,%esi,1),%eax
 80481fc:	0f a3 d8             	bt     %ebx,%eax
 80481ff:	73 ef                	jae    80481f0 <draw_string+0x50>
 8048201:	8b 45 10             	mov    0x10(%ebp),%eax
 8048204:	01 d8                	add    %ebx,%eax
 8048206:	3d 3f 01 00 00       	cmp    $0x13f,%eax
 804820b:	77 53                	ja     8048260 <draw_string+0xc0>
 804820d:	81 fe c7 00 00 00    	cmp    $0xc7,%esi
 8048213:	77 4b                	ja     8048260 <draw_string+0xc0>
 8048215:	a1 40 77 05 08       	mov    0x8057740,%eax
 804821a:	0f b6 4d 14          	movzbl 0x14(%ebp),%ecx
 804821e:	8b 7d e0             	mov    -0x20(%ebp),%edi
 8048221:	01 d8                	add    %ebx,%eax
 8048223:	03 45 10             	add    0x10(%ebp),%eax
 8048226:	83 c3 01             	add    $0x1,%ebx
 8048229:	83 fb 08             	cmp    $0x8,%ebx
 804822c:	88 0c 38             	mov    %cl,(%eax,%edi,1)
 804822f:	75 c7                	jne    80481f8 <draw_string+0x58>
 8048231:	83 c6 01             	add    $0x1,%esi
 8048234:	3b 75 dc             	cmp    -0x24(%ebp),%esi
 8048237:	8b 7d 10             	mov    0x10(%ebp),%edi
 804823a:	75 a4                	jne    80481e0 <draw_string+0x40>
 804823c:	81 ff 37 01 00 00    	cmp    $0x137,%edi
 8048242:	7e 4c                	jle    8048290 <draw_string+0xf0>
 8048244:	8b 45 08             	mov    0x8(%ebp),%eax
 8048247:	31 ff                	xor    %edi,%edi
 8048249:	89 75 0c             	mov    %esi,0xc(%ebp)
 804824c:	0f be 18             	movsbl (%eax),%ebx
 804824f:	84 db                	test   %bl,%bl
 8048251:	0f 85 63 ff ff ff    	jne    80481ba <draw_string+0x1a>
 8048257:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804825a:	5b                   	pop    %ebx
 804825b:	5e                   	pop    %esi
 804825c:	5f                   	pop    %edi
 804825d:	5d                   	pop    %ebp
 804825e:	c3                   	ret    
 804825f:	90                   	nop
 8048260:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048263:	fa                   	cli    
 8048264:	83 ec 0c             	sub    $0xc,%esp
 8048267:	68 b0 43 05 08       	push   $0x80543b0
 804826c:	68 e4 43 05 08       	push   $0x80543e4
 8048271:	6a 0f                	push   $0xf
 8048273:	68 29 43 05 08       	push   $0x8054329
 8048278:	68 68 43 05 08       	push   $0x8054368
 804827d:	e8 7e 0d 00 00       	call   8049000 <printf>
 8048282:	b8 01 00 00 00       	mov    $0x1,%eax
 8048287:	d6                   	(bad)  
 8048288:	83 c4 20             	add    $0x20,%esp
 804828b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804828e:	eb 85                	jmp    8048215 <draw_string+0x75>
 8048290:	83 c7 08             	add    $0x8,%edi
 8048293:	e9 14 ff ff ff       	jmp    80481ac <draw_string+0xc>
 8048298:	fa                   	cli    
 8048299:	83 ec 0c             	sub    $0xc,%esp
 804829c:	68 18 43 05 08       	push   $0x8054318
 80482a1:	68 ef 43 05 08       	push   $0x80543ef
 80482a6:	6a 18                	push   $0x18
 80482a8:	68 48 43 05 08       	push   $0x8054348
 80482ad:	68 68 43 05 08       	push   $0x8054368
 80482b2:	e8 49 0d 00 00       	call   8049000 <printf>
 80482b7:	b8 01 00 00 00       	mov    $0x1,%eax
 80482bc:	d6                   	(bad)  
 80482bd:	83 c4 20             	add    $0x20,%esp
 80482c0:	e9 01 ff ff ff       	jmp    80481c6 <draw_string+0x26>
 80482c5:	66 90                	xchg   %ax,%ax
 80482c7:	66 90                	xchg   %ax,%ax
 80482c9:	66 90                	xchg   %ax,%ax
 80482cb:	66 90                	xchg   %ax,%ax
 80482cd:	66 90                	xchg   %ax,%ax
 80482cf:	90                   	nop

080482d0 <add_irq_handle>:
 80482d0:	55                   	push   %ebp
 80482d1:	89 e5                	mov    %esp,%ebp
 80482d3:	83 ec 0c             	sub    $0xc,%esp
 80482d6:	ff 75 0c             	pushl  0xc(%ebp)
 80482d9:	ff 75 08             	pushl  0x8(%ebp)
 80482dc:	6a 00                	push   $0x0
 80482de:	e8 8d 00 00 00       	call   8048370 <syscall>
 80482e3:	83 c4 10             	add    $0x10,%esp
 80482e6:	c9                   	leave  
 80482e7:	c3                   	ret    
 80482e8:	90                   	nop
 80482e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

080482f0 <game_init>:
 80482f0:	55                   	push   %ebp
 80482f1:	89 e5                	mov    %esp,%ebp
 80482f3:	83 ec 08             	sub    $0x8,%esp
 80482f6:	e8 a5 fd ff ff       	call   80480a0 <init_timer>
 80482fb:	83 ec 04             	sub    $0x4,%esp
 80482fe:	68 00 86 04 08       	push   $0x8048600
 8048303:	6a 00                	push   $0x0
 8048305:	6a 00                	push   $0x0
 8048307:	e8 64 00 00 00       	call   8048370 <syscall>
 804830c:	83 c4 0c             	add    $0xc,%esp
 804830f:	68 00 8d 04 08       	push   $0x8048d00
 8048314:	6a 01                	push   $0x1
 8048316:	6a 00                	push   $0x0
 8048318:	e8 53 00 00 00       	call   8048370 <syscall>
 804831d:	68 42 44 05 08       	push   $0x8054442
 8048322:	6a 12                	push   $0x12
 8048324:	68 fe 43 05 08       	push   $0x80543fe
 8048329:	68 18 44 05 08       	push   $0x8054418
 804832e:	e8 cd 0c 00 00       	call   8049000 <printf>
 8048333:	83 c4 20             	add    $0x20,%esp
 8048336:	e8 05 03 00 00       	call   8048640 <main_loop>
 804833b:	fa                   	cli    
 804833c:	83 ec 0c             	sub    $0xc,%esp
 804833f:	68 27 43 05 08       	push   $0x8054327
 8048344:	68 42 44 05 08       	push   $0x8054442
 8048349:	6a 16                	push   $0x16
 804834b:	68 fe 43 05 08       	push   $0x80543fe
 8048350:	68 68 43 05 08       	push   $0x8054368
 8048355:	e8 a6 0c 00 00       	call   8049000 <printf>
 804835a:	b8 01 00 00 00       	mov    $0x1,%eax
 804835f:	d6                   	(bad)  
 8048360:	83 c4 20             	add    $0x20,%esp
 8048363:	c9                   	leave  
 8048364:	c3                   	ret    
 8048365:	66 90                	xchg   %ax,%ax
 8048367:	66 90                	xchg   %ax,%ax
 8048369:	66 90                	xchg   %ax,%ax
 804836b:	66 90                	xchg   %ax,%ax
 804836d:	66 90                	xchg   %ax,%ax
 804836f:	90                   	nop

08048370 <syscall>:
 8048370:	55                   	push   %ebp
 8048371:	89 e5                	mov    %esp,%ebp
 8048373:	53                   	push   %ebx
 8048374:	8b 55 14             	mov    0x14(%ebp),%edx
 8048377:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804837a:	8b 45 08             	mov    0x8(%ebp),%eax
 804837d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048380:	cd 80                	int    $0x80
 8048382:	5b                   	pop    %ebx
 8048383:	5d                   	pop    %ebp
 8048384:	c3                   	ret    
 8048385:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048390 <_exit>:
 8048390:	55                   	push   %ebp
 8048391:	89 e5                	mov    %esp,%ebp
 8048393:	8b 45 08             	mov    0x8(%ebp),%eax
 8048396:	85 c0                	test   %eax,%eax
 8048398:	74 06                	je     80483a0 <_exit+0x10>
 804839a:	b8 01 00 00 00       	mov    $0x1,%eax
 804839f:	d6                   	(bad)  
 80483a0:	5d                   	pop    %ebp
 80483a1:	c3                   	ret    
 80483a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80483a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483b0 <open>:
 80483b0:	55                   	push   %ebp
 80483b1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483b6:	89 e5                	mov    %esp,%ebp
 80483b8:	d6                   	(bad)  
 80483b9:	30 c0                	xor    %al,%al
 80483bb:	5d                   	pop    %ebp
 80483bc:	c3                   	ret    
 80483bd:	8d 76 00             	lea    0x0(%esi),%esi

080483c0 <read>:
 80483c0:	55                   	push   %ebp
 80483c1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483c6:	89 e5                	mov    %esp,%ebp
 80483c8:	d6                   	(bad)  
 80483c9:	30 c0                	xor    %al,%al
 80483cb:	5d                   	pop    %ebp
 80483cc:	c3                   	ret    
 80483cd:	8d 76 00             	lea    0x0(%esi),%esi

080483d0 <write>:
 80483d0:	55                   	push   %ebp
 80483d1:	89 e5                	mov    %esp,%ebp
 80483d3:	ff 75 10             	pushl  0x10(%ebp)
 80483d6:	ff 75 0c             	pushl  0xc(%ebp)
 80483d9:	ff 75 08             	pushl  0x8(%ebp)
 80483dc:	6a 04                	push   $0x4
 80483de:	e8 8d ff ff ff       	call   8048370 <syscall>
 80483e3:	c9                   	leave  
 80483e4:	c3                   	ret    
 80483e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483f0 <lseek>:
 80483f0:	55                   	push   %ebp
 80483f1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483f6:	89 e5                	mov    %esp,%ebp
 80483f8:	d6                   	(bad)  
 80483f9:	30 c0                	xor    %al,%al
 80483fb:	5d                   	pop    %ebp
 80483fc:	c3                   	ret    
 80483fd:	8d 76 00             	lea    0x0(%esi),%esi

08048400 <sbrk>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	56                   	push   %esi
 8048404:	53                   	push   %ebx
 8048405:	8b 1d c0 7e 06 08    	mov    0x8067ec0,%ebx
 804840b:	85 db                	test   %ebx,%ebx
 804840d:	74 31                	je     8048440 <sbrk+0x40>
 804840f:	8b 75 08             	mov    0x8(%ebp),%esi
 8048412:	01 de                	add    %ebx,%esi
 8048414:	56                   	push   %esi
 8048415:	6a 2d                	push   $0x2d
 8048417:	e8 54 ff ff ff       	call   8048370 <syscall>
 804841c:	85 c0                	test   %eax,%eax
 804841e:	5a                   	pop    %edx
 804841f:	59                   	pop    %ecx
 8048420:	74 06                	je     8048428 <sbrk+0x28>
 8048422:	b8 01 00 00 00       	mov    $0x1,%eax
 8048427:	d6                   	(bad)  
 8048428:	89 35 c0 7e 06 08    	mov    %esi,0x8067ec0
 804842e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048431:	89 d8                	mov    %ebx,%eax
 8048433:	5b                   	pop    %ebx
 8048434:	5e                   	pop    %esi
 8048435:	5d                   	pop    %ebp
 8048436:	c3                   	ret    
 8048437:	89 f6                	mov    %esi,%esi
 8048439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048440:	bb 98 dd 06 08       	mov    $0x806dd98,%ebx
 8048445:	eb c8                	jmp    804840f <sbrk+0xf>
 8048447:	89 f6                	mov    %esi,%esi
 8048449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048450 <close>:
 8048450:	55                   	push   %ebp
 8048451:	b8 01 00 00 00       	mov    $0x1,%eax
 8048456:	89 e5                	mov    %esp,%ebp
 8048458:	d6                   	(bad)  
 8048459:	30 c0                	xor    %al,%al
 804845b:	5d                   	pop    %ebp
 804845c:	c3                   	ret    
 804845d:	8d 76 00             	lea    0x0(%esi),%esi

08048460 <fstat>:
 8048460:	55                   	push   %ebp
 8048461:	89 e5                	mov    %esp,%ebp
 8048463:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048466:	c7 40 04 00 20 00 00 	movl   $0x2000,0x4(%eax)
 804846d:	31 c0                	xor    %eax,%eax
 804846f:	5d                   	pop    %ebp
 8048470:	c3                   	ret    
 8048471:	eb 0d                	jmp    8048480 <isatty>
 8048473:	90                   	nop
 8048474:	90                   	nop
 8048475:	90                   	nop
 8048476:	90                   	nop
 8048477:	90                   	nop
 8048478:	90                   	nop
 8048479:	90                   	nop
 804847a:	90                   	nop
 804847b:	90                   	nop
 804847c:	90                   	nop
 804847d:	90                   	nop
 804847e:	90                   	nop
 804847f:	90                   	nop

08048480 <isatty>:
 8048480:	55                   	push   %ebp
 8048481:	31 c0                	xor    %eax,%eax
 8048483:	89 e5                	mov    %esp,%ebp
 8048485:	5d                   	pop    %ebp
 8048486:	c3                   	ret    
 8048487:	66 90                	xchg   %ax,%ax
 8048489:	66 90                	xchg   %ax,%ax
 804848b:	66 90                	xchg   %ax,%ax
 804848d:	66 90                	xchg   %ax,%ax
 804848f:	90                   	nop

08048490 <redraw_screen>:
 8048490:	55                   	push   %ebp
 8048491:	89 e5                	mov    %esp,%ebp
 8048493:	53                   	push   %ebx
 8048494:	83 ec 04             	sub    $0x4,%esp
 8048497:	e8 c4 fc ff ff       	call   8048160 <prepare_buffer>
 804849c:	e8 df 04 00 00       	call   8048980 <characters>
 80484a1:	85 c0                	test   %eax,%eax
 80484a3:	89 c3                	mov    %eax,%ebx
 80484a5:	74 3b                	je     80484e2 <redraw_screen+0x52>
 80484a7:	89 f6                	mov    %esi,%esi
 80484a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 80484b0:	0f b6 43 08          	movzbl 0x8(%ebx),%eax
 80484b4:	c6 05 e3 7e 06 08 00 	movb   $0x0,0x8067ee3
 80484bb:	6a 0f                	push   $0xf
 80484bd:	ff 73 04             	pushl  0x4(%ebx)
 80484c0:	83 c0 41             	add    $0x41,%eax
 80484c3:	a2 e2 7e 06 08       	mov    %al,0x8067ee2
 80484c8:	8b 03                	mov    (%ebx),%eax
 80484ca:	c1 f8 10             	sar    $0x10,%eax
 80484cd:	50                   	push   %eax
 80484ce:	68 e2 7e 06 08       	push   $0x8067ee2
 80484d3:	e8 c8 fc ff ff       	call   80481a0 <draw_string>
 80484d8:	8b 5b 14             	mov    0x14(%ebx),%ebx
 80484db:	83 c4 10             	add    $0x10,%esp
 80484de:	85 db                	test   %ebx,%ebx
 80484e0:	75 ce                	jne    80484b0 <redraw_screen+0x20>
 80484e2:	e8 09 08 00 00       	call   8048cf0 <last_key_code>
 80484e7:	50                   	push   %eax
 80484e8:	68 4c 44 05 08       	push   $0x805444c
 80484ed:	6a 1e                	push   $0x1e
 80484ef:	68 c4 7e 06 08       	push   $0x8067ec4
 80484f4:	e8 47 0c 00 00       	call   8049140 <snprintf>
 80484f9:	6a 30                	push   $0x30
 80484fb:	6a 00                	push   $0x0
 80484fd:	68 c0 00 00 00       	push   $0xc0
 8048502:	68 c4 7e 06 08       	push   $0x8067ec4
 8048507:	e8 94 fc ff ff       	call   80481a0 <draw_string>
 804850c:	83 c4 20             	add    $0x20,%esp
 804850f:	e8 4c 04 00 00       	call   8048960 <get_hit>
 8048514:	50                   	push   %eax
 8048515:	68 4c 44 05 08       	push   $0x805444c
 804851a:	6a 1e                	push   $0x1e
 804851c:	68 c4 7e 06 08       	push   $0x8067ec4
 8048521:	e8 1a 0c 00 00       	call   8049140 <snprintf>
 8048526:	c7 04 24 c4 7e 06 08 	movl   $0x8067ec4,(%esp)
 804852d:	e8 ae 0c 00 00       	call   80491e0 <strlen>
 8048532:	f7 d8                	neg    %eax
 8048534:	6a 0a                	push   $0xa
 8048536:	8d 04 c5 40 01 00 00 	lea    0x140(,%eax,8),%eax
 804853d:	50                   	push   %eax
 804853e:	6a 00                	push   $0x0
 8048540:	68 c4 7e 06 08       	push   $0x8067ec4
 8048545:	e8 56 fc ff ff       	call   80481a0 <draw_string>
 804854a:	83 c4 20             	add    $0x20,%esp
 804854d:	e8 1e 04 00 00       	call   8048970 <get_miss>
 8048552:	50                   	push   %eax
 8048553:	68 4c 44 05 08       	push   $0x805444c
 8048558:	6a 1e                	push   $0x1e
 804855a:	68 c4 7e 06 08       	push   $0x8067ec4
 804855f:	e8 dc 0b 00 00       	call   8049140 <snprintf>
 8048564:	c7 04 24 c4 7e 06 08 	movl   $0x8067ec4,(%esp)
 804856b:	e8 70 0c 00 00       	call   80491e0 <strlen>
 8048570:	f7 d8                	neg    %eax
 8048572:	6a 0c                	push   $0xc
 8048574:	8d 04 c5 40 01 00 00 	lea    0x140(,%eax,8),%eax
 804857b:	50                   	push   %eax
 804857c:	68 c0 00 00 00       	push   $0xc0
 8048581:	68 c4 7e 06 08       	push   $0x8067ec4
 8048586:	e8 15 fc ff ff       	call   80481a0 <draw_string>
 804858b:	83 c4 20             	add    $0x20,%esp
 804858e:	e8 9d 00 00 00       	call   8048630 <get_fps>
 8048593:	50                   	push   %eax
 8048594:	68 4c 44 05 08       	push   $0x805444c
 8048599:	6a 1e                	push   $0x1e
 804859b:	68 c4 7e 06 08       	push   $0x8067ec4
 80485a0:	e8 9b 0b 00 00       	call   8049140 <snprintf>
 80485a5:	6a 0e                	push   $0xe
 80485a7:	6a 00                	push   $0x0
 80485a9:	6a 00                	push   $0x0
 80485ab:	68 c4 7e 06 08       	push   $0x8067ec4
 80485b0:	e8 eb fb ff ff       	call   80481a0 <draw_string>
 80485b5:	83 c4 20             	add    $0x20,%esp
 80485b8:	e8 73 00 00 00       	call   8048630 <get_fps>
 80485bd:	50                   	push   %eax
 80485be:	68 4c 44 05 08       	push   $0x805444c
 80485c3:	6a 1e                	push   $0x1e
 80485c5:	68 c4 7e 06 08       	push   $0x8067ec4
 80485ca:	e8 71 0b 00 00       	call   8049140 <snprintf>
 80485cf:	c7 04 24 c4 7e 06 08 	movl   $0x8067ec4,(%esp)
 80485d6:	e8 05 0c 00 00       	call   80491e0 <strlen>
 80485db:	c1 e0 03             	shl    $0x3,%eax
 80485de:	6a 0e                	push   $0xe
 80485e0:	50                   	push   %eax
 80485e1:	6a 00                	push   $0x0
 80485e3:	68 4f 44 05 08       	push   $0x805444f
 80485e8:	e8 b3 fb ff ff       	call   80481a0 <draw_string>
 80485ed:	83 c4 20             	add    $0x20,%esp
 80485f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80485f3:	c9                   	leave  
 80485f4:	e9 87 fb ff ff       	jmp    8048180 <display_buffer>
 80485f9:	66 90                	xchg   %ax,%ax
 80485fb:	66 90                	xchg   %ax,%ax
 80485fd:	66 90                	xchg   %ax,%ax
 80485ff:	90                   	nop

08048600 <timer_event>:
 8048600:	a1 e4 7e 06 08       	mov    0x8067ee4,%eax
 8048605:	55                   	push   %ebp
 8048606:	89 e5                	mov    %esp,%ebp
 8048608:	83 c0 01             	add    $0x1,%eax
 804860b:	a3 e4 7e 06 08       	mov    %eax,0x8067ee4
 8048610:	5d                   	pop    %ebp
 8048611:	c3                   	ret    
 8048612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048620 <set_fps>:
 8048620:	55                   	push   %ebp
 8048621:	89 e5                	mov    %esp,%ebp
 8048623:	8b 45 08             	mov    0x8(%ebp),%eax
 8048626:	5d                   	pop    %ebp
 8048627:	a3 e8 7e 06 08       	mov    %eax,0x8067ee8
 804862c:	c3                   	ret    
 804862d:	8d 76 00             	lea    0x0(%esi),%esi

08048630 <get_fps>:
 8048630:	55                   	push   %ebp
 8048631:	a1 e8 7e 06 08       	mov    0x8067ee8,%eax
 8048636:	89 e5                	mov    %esp,%ebp
 8048638:	5d                   	pop    %ebp
 8048639:	c3                   	ret    
 804863a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048640 <main_loop>:
 8048640:	55                   	push   %ebp
 8048641:	89 e5                	mov    %esp,%ebp
 8048643:	57                   	push   %edi
 8048644:	56                   	push   %esi
 8048645:	53                   	push   %ebx
 8048646:	31 ff                	xor    %edi,%edi
 8048648:	31 db                	xor    %ebx,%ebx
 804864a:	83 ec 1c             	sub    $0x1c,%esp
 804864d:	8d 76 00             	lea    0x0(%esi),%esi
 8048650:	f4                   	hlt    
 8048651:	fa                   	cli    
 8048652:	a1 e4 7e 06 08       	mov    0x8067ee4,%eax
 8048657:	39 c3                	cmp    %eax,%ebx
 8048659:	0f 84 d1 00 00 00    	je     8048730 <main_loop+0xf0>
 804865f:	a1 e4 7e 06 08       	mov    0x8067ee4,%eax
 8048664:	39 c3                	cmp    %eax,%ebx
 8048666:	0f 8d d4 00 00 00    	jge    8048740 <main_loop+0x100>
 804866c:	8b 35 e4 7e 06 08    	mov    0x8067ee4,%esi
 8048672:	fb                   	sti    
 8048673:	90                   	nop
 8048674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048678:	e8 c3 04 00 00       	call   8048b40 <update_keypress>
 804867d:	84 c0                	test   %al,%al
 804867f:	75 f7                	jne    8048678 <main_loop+0x38>
 8048681:	39 f3                	cmp    %esi,%ebx
 8048683:	7d cb                	jge    8048650 <main_loop+0x10>
 8048685:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 8048689:	eb 59                	jmp    80486e4 <main_loop+0xa4>
 804868b:	90                   	nop
 804868c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048690:	e8 0b 04 00 00       	call   8048aa0 <update_letter_pos>
 8048695:	b8 56 55 55 55       	mov    $0x55555556,%eax
 804869a:	f7 eb                	imul   %ebx
 804869c:	89 d8                	mov    %ebx,%eax
 804869e:	c1 f8 1f             	sar    $0x1f,%eax
 80486a1:	29 c2                	sub    %eax,%edx
 80486a3:	8d 04 52             	lea    (%edx,%edx,2),%eax
 80486a6:	39 c3                	cmp    %eax,%ebx
 80486a8:	75 04                	jne    80486ae <main_loop+0x6e>
 80486aa:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
 80486ae:	89 d8                	mov    %ebx,%eax
 80486b0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80486b5:	f7 ea                	imul   %edx
 80486b7:	89 d8                	mov    %ebx,%eax
 80486b9:	c1 f8 1f             	sar    $0x1f,%eax
 80486bc:	c1 fa 04             	sar    $0x4,%edx
 80486bf:	29 c2                	sub    %eax,%edx
 80486c1:	6b d2 32             	imul   $0x32,%edx,%edx
 80486c4:	39 d3                	cmp    %edx,%ebx
 80486c6:	75 15                	jne    80486dd <main_loop+0x9d>
 80486c8:	8d 44 3f 01          	lea    0x1(%edi,%edi,1),%eax
 80486cc:	83 f8 1e             	cmp    $0x1e,%eax
 80486cf:	7e 05                	jle    80486d6 <main_loop+0x96>
 80486d1:	b8 1e 00 00 00       	mov    $0x1e,%eax
 80486d6:	a3 e8 7e 06 08       	mov    %eax,0x8067ee8
 80486db:	31 ff                	xor    %edi,%edi
 80486dd:	83 c3 01             	add    $0x1,%ebx
 80486e0:	39 f3                	cmp    %esi,%ebx
 80486e2:	74 2c                	je     8048710 <main_loop+0xd0>
 80486e4:	b8 e1 83 0f 3e       	mov    $0x3e0f83e1,%eax
 80486e9:	f7 eb                	imul   %ebx
 80486eb:	89 d8                	mov    %ebx,%eax
 80486ed:	c1 f8 1f             	sar    $0x1f,%eax
 80486f0:	c1 fa 03             	sar    $0x3,%edx
 80486f3:	29 c2                	sub    %eax,%edx
 80486f5:	89 d0                	mov    %edx,%eax
 80486f7:	c1 e0 05             	shl    $0x5,%eax
 80486fa:	01 c2                	add    %eax,%edx
 80486fc:	39 d3                	cmp    %edx,%ebx
 80486fe:	75 90                	jne    8048690 <main_loop+0x50>
 8048700:	e8 8b 02 00 00       	call   8048990 <create_new_letter>
 8048705:	eb 89                	jmp    8048690 <main_loop+0x50>
 8048707:	89 f6                	mov    %esi,%esi
 8048709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048710:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 8048714:	0f 84 36 ff ff ff    	je     8048650 <main_loop+0x10>
 804871a:	83 c7 01             	add    $0x1,%edi
 804871d:	e8 6e fd ff ff       	call   8048490 <redraw_screen>
 8048722:	e9 29 ff ff ff       	jmp    8048650 <main_loop+0x10>
 8048727:	89 f6                	mov    %esi,%esi
 8048729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048730:	fb                   	sti    
 8048731:	e9 1a ff ff ff       	jmp    8048650 <main_loop+0x10>
 8048736:	8d 76 00             	lea    0x0(%esi),%esi
 8048739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048740:	fa                   	cli    
 8048741:	83 ec 0c             	sub    $0xc,%esp
 8048744:	68 53 44 05 08       	push   $0x8054453
 8048749:	68 75 44 05 08       	push   $0x8054475
 804874e:	6a 31                	push   $0x31
 8048750:	68 5e 44 05 08       	push   $0x805445e
 8048755:	68 68 43 05 08       	push   $0x8054368
 804875a:	e8 a1 08 00 00       	call   8049000 <printf>
 804875f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048764:	d6                   	(bad)  
 8048765:	83 c4 20             	add    $0x20,%esp
 8048768:	e9 ff fe ff ff       	jmp    804866c <main_loop+0x2c>
 804876d:	66 90                	xchg   %ax,%ax
 804876f:	90                   	nop

08048770 <fly_new>:
 8048770:	55                   	push   %ebp
 8048771:	89 e5                	mov    %esp,%ebp
 8048773:	53                   	push   %ebx
 8048774:	83 ec 04             	sub    $0x4,%esp
 8048777:	8b 1d 0c 7f 06 08    	mov    0x8067f0c,%ebx
 804877d:	85 db                	test   %ebx,%ebx
 804877f:	74 27                	je     80487a8 <fly_new+0x38>
 8048781:	8b 43 14             	mov    0x14(%ebx),%eax
 8048784:	85 c0                	test   %eax,%eax
 8048786:	74 41                	je     80487c9 <fly_new+0x59>
 8048788:	a3 0c 7f 06 08       	mov    %eax,0x8067f0c
 804878d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 8048794:	89 d8                	mov    %ebx,%eax
 8048796:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804879d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80487a0:	c9                   	leave  
 80487a1:	c3                   	ret    
 80487a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80487a8:	b8 58 7f 06 08       	mov    $0x8067f58,%eax
 80487ad:	8d 76 00             	lea    0x0(%esi),%esi
 80487b0:	89 40 fc             	mov    %eax,-0x4(%eax)
 80487b3:	83 c0 18             	add    $0x18,%eax
 80487b6:	3d 18 dd 06 08       	cmp    $0x806dd18,%eax
 80487bb:	75 f3                	jne    80487b0 <fly_new+0x40>
 80487bd:	bb 40 7f 06 08       	mov    $0x8067f40,%ebx
 80487c2:	8b 43 14             	mov    0x14(%ebx),%eax
 80487c5:	85 c0                	test   %eax,%eax
 80487c7:	75 bf                	jne    8048788 <fly_new+0x18>
 80487c9:	fa                   	cli    
 80487ca:	83 ec 0c             	sub    $0xc,%esp
 80487cd:	68 7f 44 05 08       	push   $0x805447f
 80487d2:	68 29 45 05 08       	push   $0x8054529
 80487d7:	6a 0b                	push   $0xb
 80487d9:	68 98 44 05 08       	push   $0x8054498
 80487de:	68 68 43 05 08       	push   $0x8054368
 80487e3:	e8 18 08 00 00       	call   8049000 <printf>
 80487e8:	b8 01 00 00 00       	mov    $0x1,%eax
 80487ed:	d6                   	(bad)  
 80487ee:	8b 43 14             	mov    0x14(%ebx),%eax
 80487f1:	83 c4 20             	add    $0x20,%esp
 80487f4:	eb 92                	jmp    8048788 <fly_new+0x18>
 80487f6:	8d 76 00             	lea    0x0(%esi),%esi
 80487f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048800 <fly_prev>:
 8048800:	55                   	push   %ebp
 8048801:	89 e5                	mov    %esp,%ebp
 8048803:	53                   	push   %ebx
 8048804:	83 ec 04             	sub    $0x4,%esp
 8048807:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804880a:	85 db                	test   %ebx,%ebx
 804880c:	74 12                	je     8048820 <fly_prev+0x20>
 804880e:	8b 43 10             	mov    0x10(%ebx),%eax
 8048811:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048814:	c9                   	leave  
 8048815:	c3                   	ret    
 8048816:	8d 76 00             	lea    0x0(%esi),%esi
 8048819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048820:	fa                   	cli    
 8048821:	83 ec 0c             	sub    $0xc,%esp
 8048824:	68 b1 44 05 08       	push   $0x80544b1
 8048829:	68 20 45 05 08       	push   $0x8054520
 804882e:	6a 0b                	push   $0xb
 8048830:	68 98 44 05 08       	push   $0x8054498
 8048835:	68 68 43 05 08       	push   $0x8054368
 804883a:	e8 c1 07 00 00       	call   8049000 <printf>
 804883f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048844:	d6                   	(bad)  
 8048845:	8b 43 10             	mov    0x10(%ebx),%eax
 8048848:	83 c4 20             	add    $0x20,%esp
 804884b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804884e:	c9                   	leave  
 804884f:	c3                   	ret    

08048850 <fly_next>:
 8048850:	55                   	push   %ebp
 8048851:	89 e5                	mov    %esp,%ebp
 8048853:	53                   	push   %ebx
 8048854:	83 ec 04             	sub    $0x4,%esp
 8048857:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804885a:	85 db                	test   %ebx,%ebx
 804885c:	74 12                	je     8048870 <fly_next+0x20>
 804885e:	8b 43 14             	mov    0x14(%ebx),%eax
 8048861:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048864:	c9                   	leave  
 8048865:	c3                   	ret    
 8048866:	8d 76 00             	lea    0x0(%esi),%esi
 8048869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048870:	fa                   	cli    
 8048871:	83 ec 0c             	sub    $0xc,%esp
 8048874:	68 b1 44 05 08       	push   $0x80544b1
 8048879:	68 17 45 05 08       	push   $0x8054517
 804887e:	6a 0b                	push   $0xb
 8048880:	68 98 44 05 08       	push   $0x8054498
 8048885:	68 68 43 05 08       	push   $0x8054368
 804888a:	e8 71 07 00 00       	call   8049000 <printf>
 804888f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048894:	d6                   	(bad)  
 8048895:	8b 43 14             	mov    0x14(%ebx),%eax
 8048898:	83 c4 20             	add    $0x20,%esp
 804889b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804889e:	c9                   	leave  
 804889f:	c3                   	ret    

080488a0 <fly_insert>:
 80488a0:	55                   	push   %ebp
 80488a1:	89 e5                	mov    %esp,%ebp
 80488a3:	53                   	push   %ebx
 80488a4:	83 ec 04             	sub    $0x4,%esp
 80488a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80488aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 80488ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80488b0:	85 c0                	test   %eax,%eax
 80488b2:	75 04                	jne    80488b8 <fly_insert+0x18>
 80488b4:	85 d2                	test   %edx,%edx
 80488b6:	74 20                	je     80488d8 <fly_insert+0x38>
 80488b8:	85 c0                	test   %eax,%eax
 80488ba:	89 43 10             	mov    %eax,0x10(%ebx)
 80488bd:	89 53 14             	mov    %edx,0x14(%ebx)
 80488c0:	74 03                	je     80488c5 <fly_insert+0x25>
 80488c2:	89 58 14             	mov    %ebx,0x14(%eax)
 80488c5:	85 d2                	test   %edx,%edx
 80488c7:	74 03                	je     80488cc <fly_insert+0x2c>
 80488c9:	89 5a 10             	mov    %ebx,0x10(%edx)
 80488cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80488cf:	c9                   	leave  
 80488d0:	c3                   	ret    
 80488d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80488d8:	fa                   	cli    
 80488d9:	83 ec 0c             	sub    $0xc,%esp
 80488dc:	68 be 44 05 08       	push   $0x80544be
 80488e1:	68 0c 45 05 08       	push   $0x805450c
 80488e6:	6a 0b                	push   $0xb
 80488e8:	68 98 44 05 08       	push   $0x8054498
 80488ed:	68 68 43 05 08       	push   $0x8054368
 80488f2:	e8 09 07 00 00       	call   8049000 <printf>
 80488f7:	b8 01 00 00 00       	mov    $0x1,%eax
 80488fc:	d6                   	(bad)  
 80488fd:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 8048904:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804890b:	83 c4 20             	add    $0x20,%esp
 804890e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048911:	c9                   	leave  
 8048912:	c3                   	ret    
 8048913:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048920 <fly_remove>:
 8048920:	55                   	push   %ebp
 8048921:	89 e5                	mov    %esp,%ebp
 8048923:	8b 45 08             	mov    0x8(%ebp),%eax
 8048926:	8b 50 10             	mov    0x10(%eax),%edx
 8048929:	8b 40 14             	mov    0x14(%eax),%eax
 804892c:	85 d2                	test   %edx,%edx
 804892e:	74 03                	je     8048933 <fly_remove+0x13>
 8048930:	89 42 14             	mov    %eax,0x14(%edx)
 8048933:	85 c0                	test   %eax,%eax
 8048935:	74 03                	je     804893a <fly_remove+0x1a>
 8048937:	89 50 10             	mov    %edx,0x10(%eax)
 804893a:	5d                   	pop    %ebp
 804893b:	c3                   	ret    
 804893c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048940 <fly_free>:
 8048940:	55                   	push   %ebp
 8048941:	8b 15 0c 7f 06 08    	mov    0x8067f0c,%edx
 8048947:	89 e5                	mov    %esp,%ebp
 8048949:	8b 45 08             	mov    0x8(%ebp),%eax
 804894c:	89 50 14             	mov    %edx,0x14(%eax)
 804894f:	a3 0c 7f 06 08       	mov    %eax,0x8067f0c
 8048954:	5d                   	pop    %ebp
 8048955:	c3                   	ret    
 8048956:	8d 76 00             	lea    0x0(%esi),%esi
 8048959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048960 <get_hit>:
 8048960:	55                   	push   %ebp
 8048961:	a1 04 7f 06 08       	mov    0x8067f04,%eax
 8048966:	89 e5                	mov    %esp,%ebp
 8048968:	5d                   	pop    %ebp
 8048969:	c3                   	ret    
 804896a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048970 <get_miss>:
 8048970:	55                   	push   %ebp
 8048971:	a1 00 7f 06 08       	mov    0x8067f00,%eax
 8048976:	89 e5                	mov    %esp,%ebp
 8048978:	5d                   	pop    %ebp
 8048979:	c3                   	ret    
 804897a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048980 <characters>:
 8048980:	55                   	push   %ebp
 8048981:	a1 08 7f 06 08       	mov    0x8067f08,%eax
 8048986:	89 e5                	mov    %esp,%ebp
 8048988:	5d                   	pop    %ebp
 8048989:	c3                   	ret    
 804898a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048990 <create_new_letter>:
 8048990:	8b 15 08 7f 06 08    	mov    0x8067f08,%edx
 8048996:	55                   	push   %ebp
 8048997:	89 e5                	mov    %esp,%ebp
 8048999:	56                   	push   %esi
 804899a:	53                   	push   %ebx
 804899b:	85 d2                	test   %edx,%edx
 804899d:	0f 84 dd 00 00 00    	je     8048a80 <create_new_letter+0xf0>
 80489a3:	e8 c8 fd ff ff       	call   8048770 <fly_new>
 80489a8:	83 ec 04             	sub    $0x4,%esp
 80489ab:	89 c3                	mov    %eax,%ebx
 80489ad:	50                   	push   %eax
 80489ae:	ff 35 08 7f 06 08    	pushl  0x8067f08
 80489b4:	6a 00                	push   $0x0
 80489b6:	e8 e5 fe ff ff       	call   80488a0 <fly_insert>
 80489bb:	89 1d 08 7f 06 08    	mov    %ebx,0x8067f08
 80489c1:	83 c4 10             	add    $0x10,%esp
 80489c4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 80489ca:	e8 81 06 00 00       	call   8049050 <rand>
 80489cf:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 80489d4:	89 c1                	mov    %eax,%ecx
 80489d6:	f7 ea                	imul   %edx
 80489d8:	89 c8                	mov    %ecx,%eax
 80489da:	c1 f8 1f             	sar    $0x1f,%eax
 80489dd:	c1 fa 04             	sar    $0x4,%edx
 80489e0:	29 c2                	sub    %eax,%edx
 80489e2:	6b d2 26             	imul   $0x26,%edx,%edx
 80489e5:	29 d1                	sub    %edx,%ecx
 80489e7:	8d 04 cd 08 00 00 00 	lea    0x8(,%ecx,8),%eax
 80489ee:	89 43 04             	mov    %eax,0x4(%ebx)
 80489f1:	8b 1d 08 7f 06 08    	mov    0x8067f08,%ebx
 80489f7:	e8 54 06 00 00       	call   8049050 <rand>
 80489fc:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 8048a01:	89 c1                	mov    %eax,%ecx
 8048a03:	83 ec 08             	sub    $0x8,%esp
 8048a06:	f7 ea                	imul   %edx
 8048a08:	89 c8                	mov    %ecx,%eax
 8048a0a:	68 00 00 d0 07       	push   $0x7d00000
 8048a0f:	c1 f8 1f             	sar    $0x1f,%eax
 8048a12:	c1 fa 06             	sar    $0x6,%edx
 8048a15:	29 c2                	sub    %eax,%edx
 8048a17:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
 8048a1d:	29 d1                	sub    %edx,%ecx
 8048a1f:	c1 e1 10             	shl    $0x10,%ecx
 8048a22:	51                   	push   %ecx
 8048a23:	e8 45 03 00 00       	call   8048d6d <F_div_F>
 8048a28:	89 c6                	mov    %eax,%esi
 8048a2a:	c7 04 24 00 00 00 3f 	movl   $0x3f000000,(%esp)
 8048a31:	e8 4b 03 00 00       	call   8048d81 <f2F>
 8048a36:	01 f0                	add    %esi,%eax
 8048a38:	89 43 0c             	mov    %eax,0xc(%ebx)
 8048a3b:	8b 1d 08 7f 06 08    	mov    0x8067f08,%ebx
 8048a41:	e8 0a 06 00 00       	call   8049050 <rand>
 8048a46:	ba 4f ec c4 4e       	mov    $0x4ec4ec4f,%edx
 8048a4b:	89 c1                	mov    %eax,%ecx
 8048a4d:	f7 ea                	imul   %edx
 8048a4f:	89 c8                	mov    %ecx,%eax
 8048a51:	c1 f8 1f             	sar    $0x1f,%eax
 8048a54:	c1 fa 03             	sar    $0x3,%edx
 8048a57:	29 c2                	sub    %eax,%edx
 8048a59:	6b d2 1a             	imul   $0x1a,%edx,%edx
 8048a5c:	29 d1                	sub    %edx,%ecx
 8048a5e:	89 4b 08             	mov    %ecx,0x8(%ebx)
 8048a61:	58                   	pop    %eax
 8048a62:	a1 08 7f 06 08       	mov    0x8067f08,%eax
 8048a67:	ff 70 08             	pushl  0x8(%eax)
 8048a6a:	e8 e1 01 00 00       	call   8048c50 <release_key>
 8048a6f:	83 c4 10             	add    $0x10,%esp
 8048a72:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048a75:	5b                   	pop    %ebx
 8048a76:	5e                   	pop    %esi
 8048a77:	5d                   	pop    %ebp
 8048a78:	c3                   	ret    
 8048a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048a80:	e8 eb fc ff ff       	call   8048770 <fly_new>
 8048a85:	89 c3                	mov    %eax,%ebx
 8048a87:	a3 08 7f 06 08       	mov    %eax,0x8067f08
 8048a8c:	e9 33 ff ff ff       	jmp    80489c4 <create_new_letter+0x34>
 8048a91:	eb 0d                	jmp    8048aa0 <update_letter_pos>
 8048a93:	90                   	nop
 8048a94:	90                   	nop
 8048a95:	90                   	nop
 8048a96:	90                   	nop
 8048a97:	90                   	nop
 8048a98:	90                   	nop
 8048a99:	90                   	nop
 8048a9a:	90                   	nop
 8048a9b:	90                   	nop
 8048a9c:	90                   	nop
 8048a9d:	90                   	nop
 8048a9e:	90                   	nop
 8048a9f:	90                   	nop

08048aa0 <update_letter_pos>:
 8048aa0:	55                   	push   %ebp
 8048aa1:	89 e5                	mov    %esp,%ebp
 8048aa3:	57                   	push   %edi
 8048aa4:	56                   	push   %esi
 8048aa5:	53                   	push   %ebx
 8048aa6:	83 ec 0c             	sub    $0xc,%esp
 8048aa9:	8b 1d 08 7f 06 08    	mov    0x8067f08,%ebx
 8048aaf:	85 db                	test   %ebx,%ebx
 8048ab1:	75 54                	jne    8048b07 <update_letter_pos+0x67>
 8048ab3:	eb 7b                	jmp    8048b30 <update_letter_pos+0x90>
 8048ab5:	8d 76 00             	lea    0x0(%esi),%esi
 8048ab8:	83 ec 0c             	sub    $0xc,%esp
 8048abb:	68 cd cc fc 40       	push   $0x40fccccd
 8048ac0:	e8 bc 02 00 00       	call   8048d81 <f2F>
 8048ac5:	01 c6                	add    %eax,%esi
 8048ac7:	83 c4 10             	add    $0x10,%esp
 8048aca:	81 fe 00 00 c8 00    	cmp    $0xc80000,%esi
 8048ad0:	7e 2f                	jle    8048b01 <update_letter_pos+0x61>
 8048ad2:	8b 03                	mov    (%ebx),%eax
 8048ad4:	85 c0                	test   %eax,%eax
 8048ad6:	78 3d                	js     8048b15 <update_letter_pos+0x75>
 8048ad8:	83 05 00 7f 06 08 01 	addl   $0x1,0x8067f00
 8048adf:	83 ec 0c             	sub    $0xc,%esp
 8048ae2:	53                   	push   %ebx
 8048ae3:	e8 38 fe ff ff       	call   8048920 <fly_remove>
 8048ae8:	83 c4 10             	add    $0x10,%esp
 8048aeb:	3b 1d 08 7f 06 08    	cmp    0x8067f08,%ebx
 8048af1:	a1 0c 7f 06 08       	mov    0x8067f0c,%eax
 8048af6:	89 1d 0c 7f 06 08    	mov    %ebx,0x8067f0c
 8048afc:	89 43 14             	mov    %eax,0x14(%ebx)
 8048aff:	74 1f                	je     8048b20 <update_letter_pos+0x80>
 8048b01:	85 ff                	test   %edi,%edi
 8048b03:	89 fb                	mov    %edi,%ebx
 8048b05:	74 29                	je     8048b30 <update_letter_pos+0x90>
 8048b07:	8b 73 0c             	mov    0xc(%ebx),%esi
 8048b0a:	03 33                	add    (%ebx),%esi
 8048b0c:	8b 7b 14             	mov    0x14(%ebx),%edi
 8048b0f:	85 f6                	test   %esi,%esi
 8048b11:	89 33                	mov    %esi,(%ebx)
 8048b13:	79 a3                	jns    8048ab8 <update_letter_pos+0x18>
 8048b15:	83 05 04 7f 06 08 01 	addl   $0x1,0x8067f04
 8048b1c:	eb c1                	jmp    8048adf <update_letter_pos+0x3f>
 8048b1e:	66 90                	xchg   %ax,%ax
 8048b20:	85 ff                	test   %edi,%edi
 8048b22:	89 3d 08 7f 06 08    	mov    %edi,0x8067f08
 8048b28:	89 fb                	mov    %edi,%ebx
 8048b2a:	75 db                	jne    8048b07 <update_letter_pos+0x67>
 8048b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048b30:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048b33:	5b                   	pop    %ebx
 8048b34:	5e                   	pop    %esi
 8048b35:	5f                   	pop    %edi
 8048b36:	5d                   	pop    %ebp
 8048b37:	c3                   	ret    
 8048b38:	90                   	nop
 8048b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08048b40 <update_keypress>:
 8048b40:	55                   	push   %ebp
 8048b41:	89 e5                	mov    %esp,%ebp
 8048b43:	57                   	push   %edi
 8048b44:	56                   	push   %esi
 8048b45:	53                   	push   %ebx
 8048b46:	83 ec 0c             	sub    $0xc,%esp
 8048b49:	fa                   	cli    
 8048b4a:	8b 3d 08 7f 06 08    	mov    0x8067f08,%edi
 8048b50:	85 ff                	test   %edi,%edi
 8048b52:	0f 84 a8 00 00 00    	je     8048c00 <update_keypress+0xc0>
 8048b58:	bb 00 00 9c ff       	mov    $0xff9c0000,%ebx
 8048b5d:	31 f6                	xor    %esi,%esi
 8048b5f:	eb 19                	jmp    8048b7a <update_keypress+0x3a>
 8048b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048b68:	8b 47 0c             	mov    0xc(%edi),%eax
 8048b6b:	85 c0                	test   %eax,%eax
 8048b6d:	7e 04                	jle    8048b73 <update_keypress+0x33>
 8048b6f:	39 1f                	cmp    %ebx,(%edi)
 8048b71:	7f 3d                	jg     8048bb0 <update_keypress+0x70>
 8048b73:	8b 7f 14             	mov    0x14(%edi),%edi
 8048b76:	85 ff                	test   %edi,%edi
 8048b78:	74 56                	je     8048bd0 <update_keypress+0x90>
 8048b7a:	83 7f 08 19          	cmpl   $0x19,0x8(%edi)
 8048b7e:	76 e8                	jbe    8048b68 <update_keypress+0x28>
 8048b80:	fa                   	cli    
 8048b81:	83 ec 0c             	sub    $0xc,%esp
 8048b84:	68 dc 44 05 08       	push   $0x80544dc
 8048b89:	68 fc 44 05 08       	push   $0x80544fc
 8048b8e:	6a 4c                	push   $0x4c
 8048b90:	68 98 44 05 08       	push   $0x8054498
 8048b95:	68 68 43 05 08       	push   $0x8054368
 8048b9a:	e8 61 04 00 00       	call   8049000 <printf>
 8048b9f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ba4:	d6                   	(bad)  
 8048ba5:	83 c4 20             	add    $0x20,%esp
 8048ba8:	eb be                	jmp    8048b68 <update_keypress+0x28>
 8048baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048bb0:	83 ec 0c             	sub    $0xc,%esp
 8048bb3:	ff 77 08             	pushl  0x8(%edi)
 8048bb6:	e8 e5 00 00 00       	call   8048ca0 <query_key>
 8048bbb:	83 c4 10             	add    $0x10,%esp
 8048bbe:	84 c0                	test   %al,%al
 8048bc0:	74 b1                	je     8048b73 <update_keypress+0x33>
 8048bc2:	8b 1f                	mov    (%edi),%ebx
 8048bc4:	89 fe                	mov    %edi,%esi
 8048bc6:	8b 7f 14             	mov    0x14(%edi),%edi
 8048bc9:	85 ff                	test   %edi,%edi
 8048bcb:	75 ad                	jne    8048b7a <update_keypress+0x3a>
 8048bcd:	8d 76 00             	lea    0x0(%esi),%esi
 8048bd0:	85 f6                	test   %esi,%esi
 8048bd2:	74 2c                	je     8048c00 <update_keypress+0xc0>
 8048bd4:	83 ec 0c             	sub    $0xc,%esp
 8048bd7:	ff 76 08             	pushl  0x8(%esi)
 8048bda:	e8 71 00 00 00       	call   8048c50 <release_key>
 8048bdf:	c7 46 0c 00 00 fd ff 	movl   $0xfffd0000,0xc(%esi)
 8048be6:	83 c4 10             	add    $0x10,%esp
 8048be9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048bec:	b8 01 00 00 00       	mov    $0x1,%eax
 8048bf1:	5b                   	pop    %ebx
 8048bf2:	5e                   	pop    %esi
 8048bf3:	5f                   	pop    %edi
 8048bf4:	5d                   	pop    %ebp
 8048bf5:	c3                   	ret    
 8048bf6:	8d 76 00             	lea    0x0(%esi),%esi
 8048bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048c00:	fb                   	sti    
 8048c01:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048c04:	31 c0                	xor    %eax,%eax
 8048c06:	5b                   	pop    %ebx
 8048c07:	5e                   	pop    %esi
 8048c08:	5f                   	pop    %edi
 8048c09:	5d                   	pop    %ebp
 8048c0a:	c3                   	ret    
 8048c0b:	66 90                	xchg   %ax,%ax
 8048c0d:	66 90                	xchg   %ax,%ax
 8048c0f:	90                   	nop

08048c10 <press_key>:
 8048c10:	55                   	push   %ebp
 8048c11:	31 c0                	xor    %eax,%eax
 8048c13:	89 e5                	mov    %esp,%ebp
 8048c15:	8b 55 08             	mov    0x8(%ebp),%edx
 8048c18:	eb 0e                	jmp    8048c28 <press_key+0x18>
 8048c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048c20:	83 c0 01             	add    $0x1,%eax
 8048c23:	83 f8 1a             	cmp    $0x1a,%eax
 8048c26:	74 18                	je     8048c40 <press_key+0x30>
 8048c28:	39 14 85 c0 45 05 08 	cmp    %edx,0x80545c0(,%eax,4)
 8048c2f:	75 ef                	jne    8048c20 <press_key+0x10>
 8048c31:	c6 80 1c dd 06 08 01 	movb   $0x1,0x806dd1c(%eax)
 8048c38:	83 c0 01             	add    $0x1,%eax
 8048c3b:	83 f8 1a             	cmp    $0x1a,%eax
 8048c3e:	75 e8                	jne    8048c28 <press_key+0x18>
 8048c40:	5d                   	pop    %ebp
 8048c41:	c3                   	ret    
 8048c42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048c50 <release_key>:
 8048c50:	55                   	push   %ebp
 8048c51:	89 e5                	mov    %esp,%ebp
 8048c53:	53                   	push   %ebx
 8048c54:	83 ec 04             	sub    $0x4,%esp
 8048c57:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048c5a:	83 fb 19             	cmp    $0x19,%ebx
 8048c5d:	76 28                	jbe    8048c87 <release_key+0x37>
 8048c5f:	fa                   	cli    
 8048c60:	83 ec 0c             	sub    $0xc,%esp
 8048c63:	68 31 45 05 08       	push   $0x8054531
 8048c68:	68 8a 45 05 08       	push   $0x805458a
 8048c6d:	6a 19                	push   $0x19
 8048c6f:	68 4a 45 05 08       	push   $0x805454a
 8048c74:	68 68 43 05 08       	push   $0x8054368
 8048c79:	e8 82 03 00 00       	call   8049000 <printf>
 8048c7e:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c83:	d6                   	(bad)  
 8048c84:	83 c4 20             	add    $0x20,%esp
 8048c87:	c6 83 1c dd 06 08 00 	movb   $0x0,0x806dd1c(%ebx)
 8048c8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048c91:	c9                   	leave  
 8048c92:	c3                   	ret    
 8048c93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048ca0 <query_key>:
 8048ca0:	55                   	push   %ebp
 8048ca1:	89 e5                	mov    %esp,%ebp
 8048ca3:	53                   	push   %ebx
 8048ca4:	83 ec 04             	sub    $0x4,%esp
 8048ca7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048caa:	83 fb 19             	cmp    $0x19,%ebx
 8048cad:	76 28                	jbe    8048cd7 <query_key+0x37>
 8048caf:	fa                   	cli    
 8048cb0:	83 ec 0c             	sub    $0xc,%esp
 8048cb3:	68 31 45 05 08       	push   $0x8054531
 8048cb8:	68 80 45 05 08       	push   $0x8054580
 8048cbd:	6a 1f                	push   $0x1f
 8048cbf:	68 4a 45 05 08       	push   $0x805454a
 8048cc4:	68 68 43 05 08       	push   $0x8054368
 8048cc9:	e8 32 03 00 00       	call   8049000 <printf>
 8048cce:	b8 01 00 00 00       	mov    $0x1,%eax
 8048cd3:	d6                   	(bad)  
 8048cd4:	83 c4 20             	add    $0x20,%esp
 8048cd7:	0f b6 83 1c dd 06 08 	movzbl 0x806dd1c(%ebx),%eax
 8048cde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048ce1:	c9                   	leave  
 8048ce2:	c3                   	ret    
 8048ce3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048cf0 <last_key_code>:
 8048cf0:	55                   	push   %ebp
 8048cf1:	a1 18 dd 06 08       	mov    0x806dd18,%eax
 8048cf6:	89 e5                	mov    %esp,%ebp
 8048cf8:	5d                   	pop    %ebp
 8048cf9:	c3                   	ret    
 8048cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048d00 <keyboard_event>:
 8048d00:	55                   	push   %ebp
 8048d01:	ba 60 00 00 00       	mov    $0x60,%edx
 8048d06:	89 e5                	mov    %esp,%ebp
 8048d08:	ec                   	in     (%dx),%al
 8048d09:	0f b6 c0             	movzbl %al,%eax
 8048d0c:	a3 18 dd 06 08       	mov    %eax,0x806dd18
 8048d11:	31 c0                	xor    %eax,%eax
 8048d13:	8b 15 18 dd 06 08    	mov    0x806dd18,%edx
 8048d19:	eb 0d                	jmp    8048d28 <keyboard_event+0x28>
 8048d1b:	90                   	nop
 8048d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048d20:	83 c0 01             	add    $0x1,%eax
 8048d23:	83 f8 1a             	cmp    $0x1a,%eax
 8048d26:	74 18                	je     8048d40 <keyboard_event+0x40>
 8048d28:	3b 14 85 c0 45 05 08 	cmp    0x80545c0(,%eax,4),%edx
 8048d2f:	75 ef                	jne    8048d20 <keyboard_event+0x20>
 8048d31:	c6 80 1c dd 06 08 01 	movb   $0x1,0x806dd1c(%eax)
 8048d38:	83 c0 01             	add    $0x1,%eax
 8048d3b:	83 f8 1a             	cmp    $0x1a,%eax
 8048d3e:	75 e8                	jne    8048d28 <keyboard_event+0x28>
 8048d40:	5d                   	pop    %ebp
 8048d41:	c3                   	ret    

08048d42 <int2F>:
 8048d42:	55                   	push   %ebp
 8048d43:	89 e5                	mov    %esp,%ebp
 8048d45:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d48:	c1 e0 10             	shl    $0x10,%eax
 8048d4b:	5d                   	pop    %ebp
 8048d4c:	c3                   	ret    

08048d4d <F_div_int>:
 8048d4d:	55                   	push   %ebp
 8048d4e:	89 e5                	mov    %esp,%ebp
 8048d50:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d53:	99                   	cltd   
 8048d54:	f7 7d 0c             	idivl  0xc(%ebp)
 8048d57:	5d                   	pop    %ebp
 8048d58:	c3                   	ret    

08048d59 <F_mul_F>:
 8048d59:	55                   	push   %ebp
 8048d5a:	89 e5                	mov    %esp,%ebp
 8048d5c:	c1 7d 08 08          	sarl   $0x8,0x8(%ebp)
 8048d60:	c1 7d 0c 08          	sarl   $0x8,0xc(%ebp)
 8048d64:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d67:	0f af 45 0c          	imul   0xc(%ebp),%eax
 8048d6b:	5d                   	pop    %ebp
 8048d6c:	c3                   	ret    

08048d6d <F_div_F>:
 8048d6d:	55                   	push   %ebp
 8048d6e:	89 e5                	mov    %esp,%ebp
 8048d70:	c1 65 08 08          	shll   $0x8,0x8(%ebp)
 8048d74:	c1 7d 0c 08          	sarl   $0x8,0xc(%ebp)
 8048d78:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d7b:	99                   	cltd   
 8048d7c:	f7 7d 0c             	idivl  0xc(%ebp)
 8048d7f:	5d                   	pop    %ebp
 8048d80:	c3                   	ret    

08048d81 <f2F>:
 8048d81:	55                   	push   %ebp
 8048d82:	89 e5                	mov    %esp,%ebp
 8048d84:	83 ec 20             	sub    $0x20,%esp
 8048d87:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048d8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d90:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048d93:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d96:	c1 e8 1f             	shr    $0x1f,%eax
 8048d99:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d9f:	c1 e8 17             	shr    $0x17,%eax
 8048da2:	25 ff 00 00 00       	and    $0xff,%eax
 8048da7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048daa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048dad:	25 ff ff 7f 00       	and    $0x7fffff,%eax
 8048db2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048db5:	81 7d f0 ff 00 00 00 	cmpl   $0xff,-0x10(%ebp)
 8048dbc:	75 24                	jne    8048de2 <f2F+0x61>
 8048dbe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8048dc2:	75 16                	jne    8048dda <f2F+0x59>
 8048dc4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048dc8:	74 08                	je     8048dd2 <f2F+0x51>
 8048dca:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dcf:	d6                   	(bad)  
 8048dd0:	eb 77                	jmp    8048e49 <f2F+0xc8>
 8048dd2:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dd7:	d6                   	(bad)  
 8048dd8:	eb 6f                	jmp    8048e49 <f2F+0xc8>
 8048dda:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ddf:	d6                   	(bad)  
 8048de0:	eb 67                	jmp    8048e49 <f2F+0xc8>
 8048de2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048de6:	75 08                	jne    8048df0 <f2F+0x6f>
 8048de8:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ded:	d6                   	(bad)  
 8048dee:	eb 59                	jmp    8048e49 <f2F+0xc8>
 8048df0:	83 7d f0 6e          	cmpl   $0x6e,-0x10(%ebp)
 8048df4:	76 4d                	jbe    8048e43 <f2F+0xc2>
 8048df6:	81 7d f0 8d 00 00 00 	cmpl   $0x8d,-0x10(%ebp)
 8048dfd:	77 44                	ja     8048e43 <f2F+0xc2>
 8048dff:	81 4d ec 00 00 80 00 	orl    $0x800000,-0x14(%ebp)
 8048e06:	81 7d f0 86 00 00 00 	cmpl   $0x86,-0x10(%ebp)
 8048e0d:	76 18                	jbe    8048e27 <f2F+0xa6>
 8048e0f:	81 6d f0 86 00 00 00 	subl   $0x86,-0x10(%ebp)
 8048e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e19:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e1c:	89 c1                	mov    %eax,%ecx
 8048e1e:	d3 e2                	shl    %cl,%edx
 8048e20:	89 d0                	mov    %edx,%eax
 8048e22:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e25:	eb 22                	jmp    8048e49 <f2F+0xc8>
 8048e27:	b8 86 00 00 00       	mov    $0x86,%eax
 8048e2c:	2b 45 f0             	sub    -0x10(%ebp),%eax
 8048e2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048e32:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e35:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e38:	89 c1                	mov    %eax,%ecx
 8048e3a:	d3 ea                	shr    %cl,%edx
 8048e3c:	89 d0                	mov    %edx,%eax
 8048e3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e41:	eb 06                	jmp    8048e49 <f2F+0xc8>
 8048e43:	b8 01 00 00 00       	mov    $0x1,%eax
 8048e48:	d6                   	(bad)  
 8048e49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048e4d:	74 03                	je     8048e52 <f2F+0xd1>
 8048e4f:	f7 5d fc             	negl   -0x4(%ebp)
 8048e52:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e55:	c9                   	leave  
 8048e56:	c3                   	ret    

08048e57 <Fabs>:
 8048e57:	55                   	push   %ebp
 8048e58:	89 e5                	mov    %esp,%ebp
 8048e5a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048e5e:	79 03                	jns    8048e63 <Fabs+0xc>
 8048e60:	f7 5d 08             	negl   0x8(%ebp)
 8048e63:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e68:	5d                   	pop    %ebp
 8048e69:	c3                   	ret    

08048e6a <sqrt>:
 8048e6a:	55                   	push   %ebp
 8048e6b:	89 e5                	mov    %esp,%ebp
 8048e6d:	53                   	push   %ebx
 8048e6e:	83 ec 10             	sub    $0x10,%esp
 8048e71:	6a 02                	push   $0x2
 8048e73:	e8 ca fe ff ff       	call   8048d42 <int2F>
 8048e78:	83 c4 04             	add    $0x4,%esp
 8048e7b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e7e:	ff 75 f8             	pushl  -0x8(%ebp)
 8048e81:	ff 75 08             	pushl  0x8(%ebp)
 8048e84:	e8 e4 fe ff ff       	call   8048d6d <F_div_F>
 8048e89:	83 c4 08             	add    $0x8,%esp
 8048e8c:	2b 45 f8             	sub    -0x8(%ebp),%eax
 8048e8f:	6a 02                	push   $0x2
 8048e91:	50                   	push   %eax
 8048e92:	e8 b6 fe ff ff       	call   8048d4d <F_div_int>
 8048e97:	83 c4 08             	add    $0x8,%esp
 8048e9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ea0:	01 45 f8             	add    %eax,-0x8(%ebp)
 8048ea3:	ff 75 f4             	pushl  -0xc(%ebp)
 8048ea6:	e8 ac ff ff ff       	call   8048e57 <Fabs>
 8048eab:	83 c4 04             	add    $0x4,%esp
 8048eae:	89 c3                	mov    %eax,%ebx
 8048eb0:	a1 28 46 05 08       	mov    0x8054628,%eax
 8048eb5:	50                   	push   %eax
 8048eb6:	e8 c6 fe ff ff       	call   8048d81 <f2F>
 8048ebb:	83 c4 04             	add    $0x4,%esp
 8048ebe:	39 c3                	cmp    %eax,%ebx
 8048ec0:	7f bc                	jg     8048e7e <sqrt+0x14>
 8048ec2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ec5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048ec8:	c9                   	leave  
 8048ec9:	c3                   	ret    

08048eca <pow>:
 8048eca:	55                   	push   %ebp
 8048ecb:	89 e5                	mov    %esp,%ebp
 8048ecd:	53                   	push   %ebx
 8048ece:	83 ec 10             	sub    $0x10,%esp
 8048ed1:	6a 02                	push   $0x2
 8048ed3:	e8 6a fe ff ff       	call   8048d42 <int2F>
 8048ed8:	83 c4 04             	add    $0x4,%esp
 8048edb:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048ede:	ff 75 f8             	pushl  -0x8(%ebp)
 8048ee1:	ff 75 f8             	pushl  -0x8(%ebp)
 8048ee4:	e8 70 fe ff ff       	call   8048d59 <F_mul_F>
 8048ee9:	83 c4 08             	add    $0x8,%esp
 8048eec:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048eef:	ff 75 f4             	pushl  -0xc(%ebp)
 8048ef2:	ff 75 08             	pushl  0x8(%ebp)
 8048ef5:	e8 73 fe ff ff       	call   8048d6d <F_div_F>
 8048efa:	83 c4 08             	add    $0x8,%esp
 8048efd:	2b 45 f8             	sub    -0x8(%ebp),%eax
 8048f00:	89 c1                	mov    %eax,%ecx
 8048f02:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048f07:	89 c8                	mov    %ecx,%eax
 8048f09:	f7 ea                	imul   %edx
 8048f0b:	89 c8                	mov    %ecx,%eax
 8048f0d:	c1 f8 1f             	sar    $0x1f,%eax
 8048f10:	29 c2                	sub    %eax,%edx
 8048f12:	89 d0                	mov    %edx,%eax
 8048f14:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f1a:	01 45 f8             	add    %eax,-0x8(%ebp)
 8048f1d:	ff 75 f0             	pushl  -0x10(%ebp)
 8048f20:	e8 32 ff ff ff       	call   8048e57 <Fabs>
 8048f25:	83 c4 04             	add    $0x4,%esp
 8048f28:	89 c3                	mov    %eax,%ebx
 8048f2a:	a1 28 46 05 08       	mov    0x8054628,%eax
 8048f2f:	50                   	push   %eax
 8048f30:	e8 4c fe ff ff       	call   8048d81 <f2F>
 8048f35:	83 c4 04             	add    $0x4,%esp
 8048f38:	39 c3                	cmp    %eax,%ebx
 8048f3a:	7f a2                	jg     8048ede <pow+0x14>
 8048f3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048f42:	c9                   	leave  
 8048f43:	c3                   	ret    

08048f44 <memset>:
 8048f44:	55                   	push   %ebp
 8048f45:	89 e5                	mov    %esp,%ebp
 8048f47:	57                   	push   %edi
 8048f48:	8b 7d 08             	mov    0x8(%ebp),%edi
 8048f4b:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 8048f4f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8048f52:	fc                   	cld    
 8048f53:	83 f9 10             	cmp    $0x10,%ecx
 8048f56:	76 69                	jbe    8048fc1 <memset+0x7d>
 8048f58:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f5e:	74 4c                	je     8048fac <memset+0x68>
 8048f60:	88 07                	mov    %al,(%edi)
 8048f62:	47                   	inc    %edi
 8048f63:	49                   	dec    %ecx
 8048f64:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f6a:	74 40                	je     8048fac <memset+0x68>
 8048f6c:	88 07                	mov    %al,(%edi)
 8048f6e:	47                   	inc    %edi
 8048f6f:	49                   	dec    %ecx
 8048f70:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f76:	74 34                	je     8048fac <memset+0x68>
 8048f78:	88 07                	mov    %al,(%edi)
 8048f7a:	47                   	inc    %edi
 8048f7b:	49                   	dec    %ecx
 8048f7c:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f82:	74 28                	je     8048fac <memset+0x68>
 8048f84:	88 07                	mov    %al,(%edi)
 8048f86:	47                   	inc    %edi
 8048f87:	49                   	dec    %ecx
 8048f88:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f8e:	74 1c                	je     8048fac <memset+0x68>
 8048f90:	88 07                	mov    %al,(%edi)
 8048f92:	47                   	inc    %edi
 8048f93:	49                   	dec    %ecx
 8048f94:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f9a:	74 10                	je     8048fac <memset+0x68>
 8048f9c:	88 07                	mov    %al,(%edi)
 8048f9e:	47                   	inc    %edi
 8048f9f:	49                   	dec    %ecx
 8048fa0:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048fa6:	74 04                	je     8048fac <memset+0x68>
 8048fa8:	88 07                	mov    %al,(%edi)
 8048faa:	47                   	inc    %edi
 8048fab:	49                   	dec    %ecx
 8048fac:	88 c4                	mov    %al,%ah
 8048fae:	89 c2                	mov    %eax,%edx
 8048fb0:	c1 e2 10             	shl    $0x10,%edx
 8048fb3:	09 d0                	or     %edx,%eax
 8048fb5:	89 ca                	mov    %ecx,%edx
 8048fb7:	c1 e9 02             	shr    $0x2,%ecx
 8048fba:	83 e2 03             	and    $0x3,%edx
 8048fbd:	f3 ab                	rep stos %eax,%es:(%edi)
 8048fbf:	89 d1                	mov    %edx,%ecx
 8048fc1:	f3 aa                	rep stos %al,%es:(%edi)
 8048fc3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fc6:	8d 65 fc             	lea    -0x4(%ebp),%esp
 8048fc9:	5f                   	pop    %edi
 8048fca:	c9                   	leave  
 8048fcb:	c3                   	ret    
 8048fcc:	66 90                	xchg   %ax,%ax
 8048fce:	66 90                	xchg   %ax,%ax

08048fd0 <_printf_r>:
 8048fd0:	55                   	push   %ebp
 8048fd1:	89 e5                	mov    %esp,%ebp
 8048fd3:	83 ec 18             	sub    $0x18,%esp
 8048fd6:	8d 55 10             	lea    0x10(%ebp),%edx
 8048fd9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fdc:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048fe0:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fe3:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048fe7:	8b 50 08             	mov    0x8(%eax),%edx
 8048fea:	89 04 24             	mov    %eax,(%esp)
 8048fed:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048ff1:	e8 6a 21 00 00       	call   804b160 <_vfprintf_r>
 8048ff6:	c9                   	leave  
 8048ff7:	c3                   	ret    
 8048ff8:	90                   	nop
 8048ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08049000 <printf>:
 8049000:	55                   	push   %ebp
 8049001:	89 e5                	mov    %esp,%ebp
 8049003:	83 ec 18             	sub    $0x18,%esp
 8049006:	e8 e5 61 00 00       	call   804f1f0 <__getreent>
 804900b:	8d 55 0c             	lea    0xc(%ebp),%edx
 804900e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049012:	8b 55 08             	mov    0x8(%ebp),%edx
 8049015:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049019:	8b 50 08             	mov    0x8(%eax),%edx
 804901c:	89 04 24             	mov    %eax,(%esp)
 804901f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049023:	e8 38 21 00 00       	call   804b160 <_vfprintf_r>
 8049028:	c9                   	leave  
 8049029:	c3                   	ret    
 804902a:	66 90                	xchg   %ax,%ax
 804902c:	66 90                	xchg   %ax,%ax
 804902e:	66 90                	xchg   %ax,%ax

08049030 <srand>:
 8049030:	55                   	push   %ebp
 8049031:	89 e5                	mov    %esp,%ebp
 8049033:	83 ec 08             	sub    $0x8,%esp
 8049036:	e8 b5 61 00 00       	call   804f1f0 <__getreent>
 804903b:	8b 55 08             	mov    0x8(%ebp),%edx
 804903e:	c7 80 a8 00 00 00 00 	movl   $0x0,0xa8(%eax)
 8049045:	00 00 00 
 8049048:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
 804904e:	c9                   	leave  
 804904f:	c3                   	ret    

08049050 <rand>:
 8049050:	55                   	push   %ebp
 8049051:	89 e5                	mov    %esp,%ebp
 8049053:	56                   	push   %esi
 8049054:	53                   	push   %ebx
 8049055:	e8 96 61 00 00       	call   804f1f0 <__getreent>
 804905a:	b9 2d 7f 95 4c       	mov    $0x4c957f2d,%ecx
 804905f:	69 90 a4 00 00 00 2d 	imul   $0x5851f42d,0xa4(%eax),%edx
 8049066:	f4 51 58 
 8049069:	89 c6                	mov    %eax,%esi
 804906b:	69 98 a8 00 00 00 2d 	imul   $0x4c957f2d,0xa8(%eax),%ebx
 8049072:	7f 95 4c 
 8049075:	89 c8                	mov    %ecx,%eax
 8049077:	01 d3                	add    %edx,%ebx
 8049079:	f7 a6 a4 00 00 00    	mull   0xa4(%esi)
 804907f:	89 d1                	mov    %edx,%ecx
 8049081:	01 d9                	add    %ebx,%ecx
 8049083:	89 cb                	mov    %ecx,%ebx
 8049085:	89 c1                	mov    %eax,%ecx
 8049087:	83 c1 01             	add    $0x1,%ecx
 804908a:	83 d3 00             	adc    $0x0,%ebx
 804908d:	89 d8                	mov    %ebx,%eax
 804908f:	89 8e a4 00 00 00    	mov    %ecx,0xa4(%esi)
 8049095:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
 804909a:	89 9e a8 00 00 00    	mov    %ebx,0xa8(%esi)
 80490a0:	5b                   	pop    %ebx
 80490a1:	5e                   	pop    %esi
 80490a2:	5d                   	pop    %ebp
 80490a3:	c3                   	ret    
 80490a4:	66 90                	xchg   %ax,%ax
 80490a6:	66 90                	xchg   %ax,%ax
 80490a8:	66 90                	xchg   %ax,%ax
 80490aa:	66 90                	xchg   %ax,%ax
 80490ac:	66 90                	xchg   %ax,%ax
 80490ae:	66 90                	xchg   %ax,%ax

080490b0 <_snprintf_r>:
 80490b0:	55                   	push   %ebp
 80490b1:	89 e5                	mov    %esp,%ebp
 80490b3:	56                   	push   %esi
 80490b4:	53                   	push   %ebx
 80490b5:	83 c4 80             	add    $0xffffff80,%esp
 80490b8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80490bb:	8b 75 08             	mov    0x8(%ebp),%esi
 80490be:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490c1:	85 db                	test   %ebx,%ebx
 80490c3:	78 63                	js     8049128 <_snprintf_r+0x78>
 80490c5:	ba 08 02 00 00       	mov    $0x208,%edx
 80490ca:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80490cf:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
 80490d3:	8d 53 ff             	lea    -0x1(%ebx),%edx
 80490d6:	89 45 90             	mov    %eax,-0x70(%ebp)
 80490d9:	89 45 a0             	mov    %eax,-0x60(%ebp)
 80490dc:	31 c0                	xor    %eax,%eax
 80490de:	85 db                	test   %ebx,%ebx
 80490e0:	0f 45 c2             	cmovne %edx,%eax
 80490e3:	89 45 98             	mov    %eax,-0x68(%ebp)
 80490e6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 80490e9:	8d 45 18             	lea    0x18(%ebp),%eax
 80490ec:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80490f0:	8b 45 14             	mov    0x14(%ebp),%eax
 80490f3:	89 34 24             	mov    %esi,(%esp)
 80490f6:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
 80490fa:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490fe:	8d 45 90             	lea    -0x70(%ebp),%eax
 8049101:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049105:	e8 56 01 00 00       	call   8049260 <_svfprintf_r>
 804910a:	83 f8 ff             	cmp    $0xffffffff,%eax
 804910d:	7c 11                	jl     8049120 <_snprintf_r+0x70>
 804910f:	85 db                	test   %ebx,%ebx
 8049111:	74 06                	je     8049119 <_snprintf_r+0x69>
 8049113:	8b 55 90             	mov    -0x70(%ebp),%edx
 8049116:	c6 02 00             	movb   $0x0,(%edx)
 8049119:	83 ec 80             	sub    $0xffffff80,%esp
 804911c:	5b                   	pop    %ebx
 804911d:	5e                   	pop    %esi
 804911e:	5d                   	pop    %ebp
 804911f:	c3                   	ret    
 8049120:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
 8049126:	eb e7                	jmp    804910f <_snprintf_r+0x5f>
 8049128:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
 804912e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049133:	eb e4                	jmp    8049119 <_snprintf_r+0x69>
 8049135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08049140 <snprintf>:
 8049140:	55                   	push   %ebp
 8049141:	89 e5                	mov    %esp,%ebp
 8049143:	57                   	push   %edi
 8049144:	56                   	push   %esi
 8049145:	53                   	push   %ebx
 8049146:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 804914c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804914f:	8b 75 08             	mov    0x8(%ebp),%esi
 8049152:	e8 99 60 00 00       	call   804f1f0 <__getreent>
 8049157:	85 db                	test   %ebx,%ebx
 8049159:	89 c7                	mov    %eax,%edi
 804915b:	78 6b                	js     80491c8 <snprintf+0x88>
 804915d:	b8 08 02 00 00       	mov    $0x208,%eax
 8049162:	31 d2                	xor    %edx,%edx
 8049164:	66 89 45 8c          	mov    %ax,-0x74(%ebp)
 8049168:	85 db                	test   %ebx,%ebx
 804916a:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804916d:	0f 45 d0             	cmovne %eax,%edx
 8049170:	8d 45 14             	lea    0x14(%ebp),%eax
 8049173:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049177:	8b 45 10             	mov    0x10(%ebp),%eax
 804917a:	89 55 88             	mov    %edx,-0x78(%ebp)
 804917d:	89 55 94             	mov    %edx,-0x6c(%ebp)
 8049180:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 8049185:	89 3c 24             	mov    %edi,(%esp)
 8049188:	89 44 24 08          	mov    %eax,0x8(%esp)
 804918c:	8d 45 80             	lea    -0x80(%ebp),%eax
 804918f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049193:	89 75 80             	mov    %esi,-0x80(%ebp)
 8049196:	89 75 90             	mov    %esi,-0x70(%ebp)
 8049199:	66 89 55 8e          	mov    %dx,-0x72(%ebp)
 804919d:	e8 be 00 00 00       	call   8049260 <_svfprintf_r>
 80491a2:	83 f8 ff             	cmp    $0xffffffff,%eax
 80491a5:	7c 19                	jl     80491c0 <snprintf+0x80>
 80491a7:	85 db                	test   %ebx,%ebx
 80491a9:	74 06                	je     80491b1 <snprintf+0x71>
 80491ab:	8b 55 80             	mov    -0x80(%ebp),%edx
 80491ae:	c6 02 00             	movb   $0x0,(%edx)
 80491b1:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 80491b7:	5b                   	pop    %ebx
 80491b8:	5e                   	pop    %esi
 80491b9:	5f                   	pop    %edi
 80491ba:	5d                   	pop    %ebp
 80491bb:	c3                   	ret    
 80491bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80491c0:	c7 07 8b 00 00 00    	movl   $0x8b,(%edi)
 80491c6:	eb df                	jmp    80491a7 <snprintf+0x67>
 80491c8:	c7 00 8b 00 00 00    	movl   $0x8b,(%eax)
 80491ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80491d3:	eb dc                	jmp    80491b1 <snprintf+0x71>
 80491d5:	66 90                	xchg   %ax,%ax
 80491d7:	66 90                	xchg   %ax,%ax
 80491d9:	66 90                	xchg   %ax,%ax
 80491db:	66 90                	xchg   %ax,%ax
 80491dd:	66 90                	xchg   %ax,%ax
 80491df:	90                   	nop

080491e0 <strlen>:
 80491e0:	55                   	push   %ebp
 80491e1:	89 e5                	mov    %esp,%ebp
 80491e3:	57                   	push   %edi
 80491e4:	8b 55 08             	mov    0x8(%ebp),%edx
 80491e7:	89 d7                	mov    %edx,%edi
 80491e9:	f7 c7 03 00 00 00    	test   $0x3,%edi
 80491ef:	74 25                	je     8049216 <L5>
 80491f1:	8a 0f                	mov    (%edi),%cl
 80491f3:	47                   	inc    %edi
 80491f4:	84 c9                	test   %cl,%cl
 80491f6:	74 56                	je     804924e <L15>
 80491f8:	f7 c7 03 00 00 00    	test   $0x3,%edi
 80491fe:	74 16                	je     8049216 <L5>
 8049200:	8a 0f                	mov    (%edi),%cl
 8049202:	47                   	inc    %edi
 8049203:	84 c9                	test   %cl,%cl
 8049205:	74 47                	je     804924e <L15>
 8049207:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804920d:	74 07                	je     8049216 <L5>
 804920f:	8a 0f                	mov    (%edi),%cl
 8049211:	47                   	inc    %edi
 8049212:	84 c9                	test   %cl,%cl
 8049214:	74 38                	je     804924e <L15>

08049216 <L5>:
 8049216:	83 ef 04             	sub    $0x4,%edi
 8049219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08049220 <L10>:
 8049220:	83 c7 04             	add    $0x4,%edi
 8049223:	8b 0f                	mov    (%edi),%ecx
 8049225:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
 804922b:	f7 d1                	not    %ecx
 804922d:	21 c8                	and    %ecx,%eax
 804922f:	a9 80 80 80 80       	test   $0x80808080,%eax
 8049234:	74 ea                	je     8049220 <L10>
 8049236:	f7 d1                	not    %ecx
 8049238:	47                   	inc    %edi
 8049239:	84 c9                	test   %cl,%cl
 804923b:	74 11                	je     804924e <L15>
 804923d:	47                   	inc    %edi
 804923e:	c1 e9 08             	shr    $0x8,%ecx
 8049241:	84 c9                	test   %cl,%cl
 8049243:	74 09                	je     804924e <L15>
 8049245:	47                   	inc    %edi
 8049246:	c1 e9 08             	shr    $0x8,%ecx
 8049249:	84 c9                	test   %cl,%cl
 804924b:	74 01                	je     804924e <L15>
 804924d:	47                   	inc    %edi

0804924e <L15>:
 804924e:	29 d7                	sub    %edx,%edi
 8049250:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049253:	8d 65 fc             	lea    -0x4(%ebp),%esp
 8049256:	5f                   	pop    %edi
 8049257:	c9                   	leave  
 8049258:	c3                   	ret    
 8049259:	66 90                	xchg   %ax,%ax
 804925b:	66 90                	xchg   %ax,%ax
 804925d:	66 90                	xchg   %ax,%ax
 804925f:	90                   	nop

08049260 <_svfprintf_r>:
 8049260:	55                   	push   %ebp
 8049261:	89 e5                	mov    %esp,%ebp
 8049263:	57                   	push   %edi
 8049264:	56                   	push   %esi
 8049265:	53                   	push   %ebx
 8049266:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
 804926c:	8b 45 08             	mov    0x8(%ebp),%eax
 804926f:	89 04 24             	mov    %eax,(%esp)
 8049272:	e8 39 60 00 00       	call   804f2b0 <_localeconv_r>
 8049277:	8b 00                	mov    (%eax),%eax
 8049279:	89 04 24             	mov    %eax,(%esp)
 804927c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
 8049282:	e8 59 ff ff ff       	call   80491e0 <strlen>
 8049287:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
 804928d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049290:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
 8049294:	74 0b                	je     80492a1 <_svfprintf_r+0x41>
 8049296:	8b 40 10             	mov    0x10(%eax),%eax
 8049299:	85 c0                	test   %eax,%eax
 804929b:	0f 84 62 18 00 00    	je     804ab03 <_svfprintf_r+0x18a3>
 80492a1:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80492a4:	8d 55 a7             	lea    -0x59(%ebp),%edx
 80492a7:	89 c7                	mov    %eax,%edi
 80492a9:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 80492af:	90                   	nop
 80492b0:	90                   	nop
 80492b1:	29 d0                	sub    %edx,%eax
 80492b3:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 80492ba:	00 00 00 
 80492bd:	90                   	nop
 80492be:	90                   	nop
 80492bf:	90                   	nop
 80492c0:	90                   	nop
 80492c1:	90                   	nop
 80492c2:	90                   	nop
 80492c3:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 80492ca:	00 00 00 
 80492cd:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
 80492d4:	00 00 00 
 80492d7:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
 80492de:	00 00 00 
 80492e1:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
 80492e8:	00 00 00 
 80492eb:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
 80492f2:	00 00 00 
 80492f5:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
 80492fb:	8b 45 10             	mov    0x10(%ebp),%eax
 80492fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8049301:	0f b6 00             	movzbl (%eax),%eax
 8049304:	3c 25                	cmp    $0x25,%al
 8049306:	74 4d                	je     8049355 <_svfprintf_r+0xf5>
 8049308:	84 c0                	test   %al,%al
 804930a:	75 08                	jne    8049314 <_svfprintf_r+0xb4>
 804930c:	eb 47                	jmp    8049355 <_svfprintf_r+0xf5>
 804930e:	66 90                	xchg   %ax,%ax
 8049310:	84 c0                	test   %al,%al
 8049312:	74 0a                	je     804931e <_svfprintf_r+0xbe>
 8049314:	83 c3 01             	add    $0x1,%ebx
 8049317:	0f b6 03             	movzbl (%ebx),%eax
 804931a:	3c 25                	cmp    $0x25,%al
 804931c:	75 f2                	jne    8049310 <_svfprintf_r+0xb0>
 804931e:	89 de                	mov    %ebx,%esi
 8049320:	2b 75 10             	sub    0x10(%ebp),%esi
 8049323:	74 30                	je     8049355 <_svfprintf_r+0xf5>
 8049325:	8b 45 10             	mov    0x10(%ebp),%eax
 8049328:	83 c7 08             	add    $0x8,%edi
 804932b:	89 77 fc             	mov    %esi,-0x4(%edi)
 804932e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
 8049334:	89 47 f8             	mov    %eax,-0x8(%edi)
 8049337:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804933d:	83 c0 01             	add    $0x1,%eax
 8049340:	83 f8 07             	cmp    $0x7,%eax
 8049343:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049349:	0f 8f 91 00 00 00    	jg     80493e0 <_svfprintf_r+0x180>
 804934f:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
 8049355:	80 3b 00             	cmpb   $0x0,(%ebx)
 8049358:	0f 84 aa 00 00 00    	je     8049408 <_svfprintf_r+0x1a8>
 804935e:	8d 43 01             	lea    0x1(%ebx),%eax
 8049361:	be 20 00 00 00       	mov    $0x20,%esi
 8049366:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804936d:	31 db                	xor    %ebx,%ebx
 804936f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 8049376:	ff ff ff 
 8049379:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 8049380:	00 00 00 
 8049383:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
 804938a:	00 00 00 
 804938d:	8d 48 01             	lea    0x1(%eax),%ecx
 8049390:	0f be 00             	movsbl (%eax),%eax
 8049393:	8d 50 e0             	lea    -0x20(%eax),%edx
 8049396:	83 fa 58             	cmp    $0x58,%edx
 8049399:	0f 87 8f 07 00 00    	ja     8049b2e <_svfprintf_r+0x8ce>
 804939f:	ff 24 95 68 46 05 08 	jmp    *0x8054668(,%edx,4)
 80493a6:	66 90                	xchg   %ax,%ax
 80493a8:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 80493af:	89 c8                	mov    %ecx,%eax
 80493b1:	eb da                	jmp    804938d <_svfprintf_r+0x12d>
 80493b3:	8b 45 14             	mov    0x14(%ebp),%eax
 80493b6:	8b 55 14             	mov    0x14(%ebp),%edx
 80493b9:	8b 00                	mov    (%eax),%eax
 80493bb:	83 c2 04             	add    $0x4,%edx
 80493be:	89 55 14             	mov    %edx,0x14(%ebp)
 80493c1:	85 c0                	test   %eax,%eax
 80493c3:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
 80493c9:	79 e4                	jns    80493af <_svfprintf_r+0x14f>
 80493cb:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
 80493d1:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
 80493d8:	89 c8                	mov    %ecx,%eax
 80493da:	eb b1                	jmp    804938d <_svfprintf_r+0x12d>
 80493dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80493e0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80493e6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80493f4:	89 04 24             	mov    %eax,(%esp)
 80493f7:	e8 d4 78 00 00       	call   8050cd0 <__ssprint_r>
 80493fc:	85 c0                	test   %eax,%eax
 80493fe:	75 30                	jne    8049430 <_svfprintf_r+0x1d0>
 8049400:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049403:	e9 47 ff ff ff       	jmp    804934f <_svfprintf_r+0xef>
 8049408:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 804940e:	85 c0                	test   %eax,%eax
 8049410:	74 1e                	je     8049430 <_svfprintf_r+0x1d0>
 8049412:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049418:	89 44 24 08          	mov    %eax,0x8(%esp)
 804941c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804941f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049423:	8b 45 08             	mov    0x8(%ebp),%eax
 8049426:	89 04 24             	mov    %eax,(%esp)
 8049429:	e8 a2 78 00 00       	call   8050cd0 <__ssprint_r>
 804942e:	66 90                	xchg   %ax,%ax
 8049430:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049433:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049438:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
 804943c:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
 8049443:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 8049449:	5b                   	pop    %ebx
 804944a:	5e                   	pop    %esi
 804944b:	5f                   	pop    %edi
 804944c:	5d                   	pop    %ebp
 804944d:	c3                   	ret    
 804944e:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 8049453:	89 c8                	mov    %ecx,%eax
 8049455:	e9 33 ff ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 804945a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049460:	8b 45 14             	mov    0x14(%ebp),%eax
 8049463:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049466:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804946d:	8d 70 04             	lea    0x4(%eax),%esi
 8049470:	8b 00                	mov    (%eax),%eax
 8049472:	85 c0                	test   %eax,%eax
 8049474:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804947a:	0f 84 7f 18 00 00    	je     804acff <_svfprintf_r+0x1a9f>
 8049480:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8049486:	85 c0                	test   %eax,%eax
 8049488:	0f 88 b6 17 00 00    	js     804ac44 <_svfprintf_r+0x19e4>
 804948e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049492:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 8049498:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804949f:	00 
 80494a0:	89 04 24             	mov    %eax,(%esp)
 80494a3:	e8 e8 66 00 00       	call   804fb90 <memchr>
 80494a8:	85 c0                	test   %eax,%eax
 80494aa:	0f 84 a0 19 00 00    	je     804ae50 <_svfprintf_r+0x1bf0>
 80494b0:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 80494b6:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 80494bc:	39 d0                	cmp    %edx,%eax
 80494be:	0f 4f c2             	cmovg  %edx,%eax
 80494c1:	89 c2                	mov    %eax,%edx
 80494c3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 80494ca:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 80494d0:	31 c0                	xor    %eax,%eax
 80494d2:	85 d2                	test   %edx,%edx
 80494d4:	0f 49 c2             	cmovns %edx,%eax
 80494d7:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 80494dd:	89 75 14             	mov    %esi,0x14(%ebp)
 80494e0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 80494e7:	00 00 00 
 80494ea:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 80494f1:	00 00 00 
 80494f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80494f8:	84 db                	test   %bl,%bl
 80494fa:	74 07                	je     8049503 <_svfprintf_r+0x2a3>
 80494fc:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
 8049503:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 8049509:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804950f:	89 c8                	mov    %ecx,%eax
 8049511:	89 f2                	mov    %esi,%edx
 8049513:	83 c0 02             	add    $0x2,%eax
 8049516:	83 e2 02             	and    $0x2,%edx
 8049519:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
 804951f:	89 f2                	mov    %esi,%edx
 8049521:	0f 44 c1             	cmove  %ecx,%eax
 8049524:	81 e2 84 00 00 00    	and    $0x84,%edx
 804952a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 8049530:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
 8049536:	0f 85 1c 06 00 00    	jne    8049b58 <_svfprintf_r+0x8f8>
 804953c:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049542:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049548:	85 f6                	test   %esi,%esi
 804954a:	0f 8e 08 06 00 00    	jle    8049b58 <_svfprintf_r+0x8f8>
 8049550:	83 fe 10             	cmp    $0x10,%esi
 8049553:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049559:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804955f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049565:	7f 11                	jg     8049578 <_svfprintf_r+0x318>
 8049567:	eb 6b                	jmp    80495d4 <_svfprintf_r+0x374>
 8049569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049570:	83 ee 10             	sub    $0x10,%esi
 8049573:	83 fe 10             	cmp    $0x10,%esi
 8049576:	7e 5c                	jle    80495d4 <_svfprintf_r+0x374>
 8049578:	83 c0 01             	add    $0x1,%eax
 804957b:	83 c1 10             	add    $0x10,%ecx
 804957e:	c7 07 dc 47 05 08    	movl   $0x80547dc,(%edi)
 8049584:	83 c7 08             	add    $0x8,%edi
 8049587:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804958e:	83 f8 07             	cmp    $0x7,%eax
 8049591:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049597:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804959d:	7e d1                	jle    8049570 <_svfprintf_r+0x310>
 804959f:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495a2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80495a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495aa:	8b 45 08             	mov    0x8(%ebp),%eax
 80495ad:	89 04 24             	mov    %eax,(%esp)
 80495b0:	e8 1b 77 00 00       	call   8050cd0 <__ssprint_r>
 80495b5:	85 c0                	test   %eax,%eax
 80495b7:	0f 85 73 fe ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 80495bd:	83 ee 10             	sub    $0x10,%esi
 80495c0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 80495c6:	83 fe 10             	cmp    $0x10,%esi
 80495c9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80495cf:	8d 7d a8             	lea    -0x58(%ebp),%edi
 80495d2:	7f a4                	jg     8049578 <_svfprintf_r+0x318>
 80495d4:	83 c0 01             	add    $0x1,%eax
 80495d7:	01 f1                	add    %esi,%ecx
 80495d9:	83 f8 07             	cmp    $0x7,%eax
 80495dc:	c7 07 dc 47 05 08    	movl   $0x80547dc,(%edi)
 80495e2:	89 77 04             	mov    %esi,0x4(%edi)
 80495e5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 80495eb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80495f1:	0f 8f 16 0e 00 00    	jg     804a40d <_svfprintf_r+0x11ad>
 80495f7:	83 c7 08             	add    $0x8,%edi
 80495fa:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 8049601:	e9 58 05 00 00       	jmp    8049b5e <_svfprintf_r+0x8fe>
 8049606:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804960d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049613:	8b 45 14             	mov    0x14(%ebp),%eax
 8049616:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049619:	0f 85 fd 04 00 00    	jne    8049b1c <_svfprintf_r+0x8bc>
 804961f:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049626:	0f 84 f0 04 00 00    	je     8049b1c <_svfprintf_r+0x8bc>
 804962c:	0f b7 08             	movzwl (%eax),%ecx
 804962f:	83 c0 04             	add    $0x4,%eax
 8049632:	89 45 14             	mov    %eax,0x14(%ebp)
 8049635:	b8 01 00 00 00       	mov    $0x1,%eax
 804963a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049640:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049647:	31 db                	xor    %ebx,%ebx
 8049649:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804964f:	89 f2                	mov    %esi,%edx
 8049651:	80 e2 7f             	and    $0x7f,%dl
 8049654:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
 804965b:	0f 48 d6             	cmovs  %esi,%edx
 804965e:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
 8049664:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804966a:	85 d2                	test   %edx,%edx
 804966c:	75 08                	jne    8049676 <_svfprintf_r+0x416>
 804966e:	85 c9                	test   %ecx,%ecx
 8049670:	0f 84 ea 08 00 00    	je     8049f60 <_svfprintf_r+0xd00>
 8049676:	3c 01                	cmp    $0x1,%al
 8049678:	0f 84 6a 0d 00 00    	je     804a3e8 <_svfprintf_r+0x1188>
 804967e:	3c 02                	cmp    $0x2,%al
 8049680:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049683:	0f 85 bf 0b 00 00    	jne    804a248 <_svfprintf_r+0xfe8>
 8049689:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
 804968f:	90                   	nop
 8049690:	89 ca                	mov    %ecx,%edx
 8049692:	83 e8 01             	sub    $0x1,%eax
 8049695:	83 e2 0f             	and    $0xf,%edx
 8049698:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
 804969c:	c1 e9 04             	shr    $0x4,%ecx
 804969f:	85 c9                	test   %ecx,%ecx
 80496a1:	88 10                	mov    %dl,(%eax)
 80496a3:	75 eb                	jne    8049690 <_svfprintf_r+0x430>
 80496a5:	8d 55 a8             	lea    -0x58(%ebp),%edx
 80496a8:	29 c2                	sub    %eax,%edx
 80496aa:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 80496b0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 80496b6:	66 90                	xchg   %ax,%ax
 80496b8:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 80496be:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
 80496c4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 80496cb:	00 00 00 
 80496ce:	39 c2                	cmp    %eax,%edx
 80496d0:	0f 4d c2             	cmovge %edx,%eax
 80496d3:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 80496d9:	e9 1a fe ff ff       	jmp    80494f8 <_svfprintf_r+0x298>
 80496de:	84 db                	test   %bl,%bl
 80496e0:	89 c8                	mov    %ecx,%eax
 80496e2:	0f 44 de             	cmove  %esi,%ebx
 80496e5:	e9 a3 fc ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 80496ea:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
 80496f1:	89 c8                	mov    %ecx,%eax
 80496f3:	e9 95 fc ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 80496f8:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
 80496ff:	00 00 00 
 8049702:	89 c8                	mov    %ecx,%eax
 8049704:	e9 84 fc ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 8049709:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804970f:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049712:	31 ff                	xor    %edi,%edi
 8049714:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804971b:	00 00 00 
 804971e:	66 90                	xchg   %ax,%ax
 8049720:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 8049723:	83 c1 01             	add    $0x1,%ecx
 8049726:	8d 3c 42             	lea    (%edx,%eax,2),%edi
 8049729:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
 804972d:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049730:	83 fa 09             	cmp    $0x9,%edx
 8049733:	76 eb                	jbe    8049720 <_svfprintf_r+0x4c0>
 8049735:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
 804973b:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 8049741:	e9 4d fc ff ff       	jmp    8049393 <_svfprintf_r+0x133>
 8049746:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804974d:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049754:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804975a:	8b 45 14             	mov    0x14(%ebp),%eax
 804975d:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049760:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049766:	0f 85 61 02 00 00    	jne    80499cd <_svfprintf_r+0x76d>
 804976c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049773:	0f 84 54 02 00 00    	je     80499cd <_svfprintf_r+0x76d>
 8049779:	0f bf 08             	movswl (%eax),%ecx
 804977c:	83 c0 04             	add    $0x4,%eax
 804977f:	89 45 14             	mov    %eax,0x14(%ebp)
 8049782:	85 c9                	test   %ecx,%ecx
 8049784:	0f 88 53 02 00 00    	js     80499dd <_svfprintf_r+0x77d>
 804978a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 8049791:	b8 01 00 00 00       	mov    $0x1,%eax
 8049796:	e9 ae fe ff ff       	jmp    8049649 <_svfprintf_r+0x3e9>
 804979b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
 80497a2:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 80497a8:	8b 45 14             	mov    0x14(%ebp),%eax
 80497ab:	89 4d 10             	mov    %ecx,0x10(%ebp)
 80497ae:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 80497b4:	0f 84 15 10 00 00    	je     804a7cf <_svfprintf_r+0x156f>
 80497ba:	db 28                	fldt   (%eax)
 80497bc:	83 c0 0c             	add    $0xc,%eax
 80497bf:	89 45 14             	mov    %eax,0x14(%ebp)
 80497c2:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 80497c8:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 80497ce:	dd 1c 24             	fstpl  (%esp)
 80497d1:	e8 da 72 00 00       	call   8050ab0 <__fpclassifyd>
 80497d6:	83 f8 01             	cmp    $0x1,%eax
 80497d9:	0f 85 82 0f 00 00    	jne    804a761 <_svfprintf_r+0x1501>
 80497df:	d9 ee                	fldz   
 80497e1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 80497e7:	d9 c9                	fxch   %st(1)
 80497e9:	df e9                	fucomip %st(1),%st
 80497eb:	dd d8                	fstp   %st(0)
 80497ed:	0f 87 59 15 00 00    	ja     804ad4c <_svfprintf_r+0x1aec>
 80497f3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 80497fa:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 8049801:	ba 2c 46 05 08       	mov    $0x805462c,%edx
 8049806:	b8 30 46 05 08       	mov    $0x8054630,%eax
 804980b:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 8049812:	00 00 00 
 8049815:	0f 4e c2             	cmovle %edx,%eax
 8049818:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804981e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 8049825:	ff ff ff 
 8049828:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804982f:	00 00 00 
 8049832:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8049839:	00 00 00 
 804983c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 8049843:	00 00 00 
 8049846:	e9 ad fc ff ff       	jmp    80494f8 <_svfprintf_r+0x298>
 804984b:	8d 41 01             	lea    0x1(%ecx),%eax
 804984e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 8049854:	0f be 01             	movsbl (%ecx),%eax
 8049857:	83 f8 2a             	cmp    $0x2a,%eax
 804985a:	0f 84 84 18 00 00    	je     804b0e4 <_svfprintf_r+0x1e84>
 8049860:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049863:	31 c9                	xor    %ecx,%ecx
 8049865:	83 fa 09             	cmp    $0x9,%edx
 8049868:	0f 87 a8 16 00 00    	ja     804af16 <_svfprintf_r+0x1cb6>
 804986e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
 8049874:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804987a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049880:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 8049883:	83 c7 01             	add    $0x1,%edi
 8049886:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
 8049889:	0f be 47 ff          	movsbl -0x1(%edi),%eax
 804988d:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049890:	83 fa 09             	cmp    $0x9,%edx
 8049893:	76 eb                	jbe    8049880 <_svfprintf_r+0x620>
 8049895:	85 c9                	test   %ecx,%ecx
 8049897:	89 ca                	mov    %ecx,%edx
 8049899:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804989e:	0f 48 d1             	cmovs  %ecx,%edx
 80498a1:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 80498a7:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 80498ad:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 80498b3:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 80498b9:	e9 d5 fa ff ff       	jmp    8049393 <_svfprintf_r+0x133>
 80498be:	8b 45 14             	mov    0x14(%ebp),%eax
 80498c1:	89 4d 10             	mov    %ecx,0x10(%ebp)
 80498c4:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 80498cb:	8b 08                	mov    (%eax),%ecx
 80498cd:	83 c0 04             	add    $0x4,%eax
 80498d0:	89 45 14             	mov    %eax,0x14(%ebp)
 80498d3:	b8 02 00 00 00       	mov    $0x2,%eax
 80498d8:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 80498df:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
 80498e6:	c7 85 18 ff ff ff 4d 	movl   $0x805464d,-0xe8(%ebp)
 80498ed:	46 05 08 
 80498f0:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
 80498f7:	00 00 00 
 80498fa:	e9 41 fd ff ff       	jmp    8049640 <_svfprintf_r+0x3e0>
 80498ff:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049906:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804990c:	8b 45 14             	mov    0x14(%ebp),%eax
 804990f:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049912:	0f 85 87 00 00 00    	jne    804999f <_svfprintf_r+0x73f>
 8049918:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804991f:	74 7e                	je     804999f <_svfprintf_r+0x73f>
 8049921:	0f b7 08             	movzwl (%eax),%ecx
 8049924:	83 c0 04             	add    $0x4,%eax
 8049927:	89 45 14             	mov    %eax,0x14(%ebp)
 804992a:	31 c0                	xor    %eax,%eax
 804992c:	e9 0f fd ff ff       	jmp    8049640 <_svfprintf_r+0x3e0>
 8049931:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
 8049938:	89 c8                	mov    %ecx,%eax
 804993a:	e9 4e fa ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 804993f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049946:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049949:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804994f:	0f 85 97 0b 00 00    	jne    804a4ec <_svfprintf_r+0x128c>
 8049955:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804995c:	0f 84 8a 0b 00 00    	je     804a4ec <_svfprintf_r+0x128c>
 8049962:	8b 45 14             	mov    0x14(%ebp),%eax
 8049965:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
 804996c:	8b 00                	mov    (%eax),%eax
 804996e:	66 89 10             	mov    %dx,(%eax)
 8049971:	8b 45 14             	mov    0x14(%ebp),%eax
 8049974:	83 c0 04             	add    $0x4,%eax
 8049977:	89 45 14             	mov    %eax,0x14(%ebp)
 804997a:	e9 7c f9 ff ff       	jmp    80492fb <_svfprintf_r+0x9b>
 804997f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 8049986:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804998d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049993:	8b 45 14             	mov    0x14(%ebp),%eax
 8049996:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049999:	0f 84 79 ff ff ff    	je     8049918 <_svfprintf_r+0x6b8>
 804999f:	8b 08                	mov    (%eax),%ecx
 80499a1:	83 c0 04             	add    $0x4,%eax
 80499a4:	89 45 14             	mov    %eax,0x14(%ebp)
 80499a7:	31 c0                	xor    %eax,%eax
 80499a9:	e9 92 fc ff ff       	jmp    8049640 <_svfprintf_r+0x3e0>
 80499ae:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 80499b5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 80499bb:	8b 45 14             	mov    0x14(%ebp),%eax
 80499be:	89 4d 10             	mov    %ecx,0x10(%ebp)
 80499c1:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 80499c7:	0f 84 9f fd ff ff    	je     804976c <_svfprintf_r+0x50c>
 80499cd:	8b 08                	mov    (%eax),%ecx
 80499cf:	83 c0 04             	add    $0x4,%eax
 80499d2:	89 45 14             	mov    %eax,0x14(%ebp)
 80499d5:	85 c9                	test   %ecx,%ecx
 80499d7:	0f 89 ad fd ff ff    	jns    804978a <_svfprintf_r+0x52a>
 80499dd:	f7 d9                	neg    %ecx
 80499df:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 80499e4:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 80499eb:	b8 01 00 00 00       	mov    $0x1,%eax
 80499f0:	e9 54 fc ff ff       	jmp    8049649 <_svfprintf_r+0x3e9>
 80499f5:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
 80499fc:	89 c8                	mov    %ecx,%eax
 80499fe:	e9 8a f9 ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 8049a03:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049a0a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049a10:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a13:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049a16:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049a1c:	c7 85 18 ff ff ff 4d 	movl   $0x805464d,-0xe8(%ebp)
 8049a23:	46 05 08 
 8049a26:	75 71                	jne    8049a99 <_svfprintf_r+0x839>
 8049a28:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049a2f:	74 68                	je     8049a99 <_svfprintf_r+0x839>
 8049a31:	0f b7 08             	movzwl (%eax),%ecx
 8049a34:	83 c0 04             	add    $0x4,%eax
 8049a37:	89 45 14             	mov    %eax,0x14(%ebp)
 8049a3a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049a41:	b8 02 00 00 00       	mov    $0x2,%eax
 8049a46:	0f 84 f4 fb ff ff    	je     8049640 <_svfprintf_r+0x3e0>
 8049a4c:	85 c9                	test   %ecx,%ecx
 8049a4e:	0f 84 ec fb ff ff    	je     8049640 <_svfprintf_r+0x3e0>
 8049a54:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
 8049a5b:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 8049a62:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 8049a69:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
 8049a6f:	e9 cc fb ff ff       	jmp    8049640 <_svfprintf_r+0x3e0>
 8049a74:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049a7b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049a81:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a84:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049a87:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049a8d:	c7 85 18 ff ff ff 3c 	movl   $0x805463c,-0xe8(%ebp)
 8049a94:	46 05 08 
 8049a97:	74 8f                	je     8049a28 <_svfprintf_r+0x7c8>
 8049a99:	8b 08                	mov    (%eax),%ecx
 8049a9b:	83 c0 04             	add    $0x4,%eax
 8049a9e:	89 45 14             	mov    %eax,0x14(%ebp)
 8049aa1:	eb 97                	jmp    8049a3a <_svfprintf_r+0x7da>
 8049aa3:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049aa9:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aac:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049aaf:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049ab6:	8b 00                	mov    (%eax),%eax
 8049ab8:	88 45 80             	mov    %al,-0x80(%ebp)
 8049abb:	8b 45 14             	mov    0x14(%ebp),%eax
 8049abe:	83 c0 04             	add    $0x4,%eax
 8049ac1:	89 45 14             	mov    %eax,0x14(%ebp)
 8049ac4:	8d 45 80             	lea    -0x80(%ebp),%eax
 8049ac7:	31 db                	xor    %ebx,%ebx
 8049ac9:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
 8049ad0:	00 00 00 
 8049ad3:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 8049ada:	00 00 00 
 8049add:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8049ae4:	00 00 00 
 8049ae7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 8049aee:	00 00 00 
 8049af1:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049af7:	e9 07 fa ff ff       	jmp    8049503 <_svfprintf_r+0x2a3>
 8049afc:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 8049b03:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049b0a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049b10:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b13:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049b16:	0f 84 03 fb ff ff    	je     804961f <_svfprintf_r+0x3bf>
 8049b1c:	8b 08                	mov    (%eax),%ecx
 8049b1e:	83 c0 04             	add    $0x4,%eax
 8049b21:	89 45 14             	mov    %eax,0x14(%ebp)
 8049b24:	b8 01 00 00 00       	mov    $0x1,%eax
 8049b29:	e9 12 fb ff ff       	jmp    8049640 <_svfprintf_r+0x3e0>
 8049b2e:	85 c0                	test   %eax,%eax
 8049b30:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049b36:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049b39:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049b3f:	0f 84 c3 f8 ff ff    	je     8049408 <_svfprintf_r+0x1a8>
 8049b45:	88 45 80             	mov    %al,-0x80(%ebp)
 8049b48:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049b4f:	e9 70 ff ff ff       	jmp    8049ac4 <_svfprintf_r+0x864>
 8049b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049b58:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049b5e:	84 db                	test   %bl,%bl
 8049b60:	74 33                	je     8049b95 <_svfprintf_r+0x935>
 8049b62:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
 8049b68:	83 c1 01             	add    $0x1,%ecx
 8049b6b:	89 07                	mov    %eax,(%edi)
 8049b6d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049b73:	83 c7 08             	add    $0x8,%edi
 8049b76:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 8049b7d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049b83:	83 c0 01             	add    $0x1,%eax
 8049b86:	83 f8 07             	cmp    $0x7,%eax
 8049b89:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049b8f:	0f 8f 7b 06 00 00    	jg     804a210 <_svfprintf_r+0xfb0>
 8049b95:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
 8049b9b:	85 db                	test   %ebx,%ebx
 8049b9d:	74 33                	je     8049bd2 <_svfprintf_r+0x972>
 8049b9f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
 8049ba5:	83 c1 02             	add    $0x2,%ecx
 8049ba8:	89 07                	mov    %eax,(%edi)
 8049baa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049bb0:	83 c7 08             	add    $0x8,%edi
 8049bb3:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
 8049bba:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049bc0:	83 c0 01             	add    $0x1,%eax
 8049bc3:	83 f8 07             	cmp    $0x7,%eax
 8049bc6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049bcc:	0f 8f 06 06 00 00    	jg     804a1d8 <_svfprintf_r+0xf78>
 8049bd2:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
 8049bd9:	00 00 00 
 8049bdc:	0f 84 c6 03 00 00    	je     8049fa8 <_svfprintf_r+0xd48>
 8049be2:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 8049be8:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
 8049bee:	85 f6                	test   %esi,%esi
 8049bf0:	0f 8e d2 00 00 00    	jle    8049cc8 <_svfprintf_r+0xa68>
 8049bf6:	83 fe 10             	cmp    $0x10,%esi
 8049bf9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049bff:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049c05:	7f 11                	jg     8049c18 <_svfprintf_r+0x9b8>
 8049c07:	eb 6b                	jmp    8049c74 <_svfprintf_r+0xa14>
 8049c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049c10:	83 ee 10             	sub    $0x10,%esi
 8049c13:	83 fe 10             	cmp    $0x10,%esi
 8049c16:	7e 5c                	jle    8049c74 <_svfprintf_r+0xa14>
 8049c18:	83 c0 01             	add    $0x1,%eax
 8049c1b:	83 c1 10             	add    $0x10,%ecx
 8049c1e:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 8049c24:	83 c7 08             	add    $0x8,%edi
 8049c27:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049c2e:	83 f8 07             	cmp    $0x7,%eax
 8049c31:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049c37:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049c3d:	7e d1                	jle    8049c10 <_svfprintf_r+0x9b0>
 8049c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c42:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049c46:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c4a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c4d:	89 04 24             	mov    %eax,(%esp)
 8049c50:	e8 7b 70 00 00       	call   8050cd0 <__ssprint_r>
 8049c55:	85 c0                	test   %eax,%eax
 8049c57:	0f 85 d3 f7 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 8049c5d:	83 ee 10             	sub    $0x10,%esi
 8049c60:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049c66:	83 fe 10             	cmp    $0x10,%esi
 8049c69:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049c6f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049c72:	7f a4                	jg     8049c18 <_svfprintf_r+0x9b8>
 8049c74:	83 c0 01             	add    $0x1,%eax
 8049c77:	01 f1                	add    %esi,%ecx
 8049c79:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 8049c7f:	83 c7 08             	add    $0x8,%edi
 8049c82:	89 77 fc             	mov    %esi,-0x4(%edi)
 8049c85:	83 f8 07             	cmp    $0x7,%eax
 8049c88:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049c8e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049c94:	7e 32                	jle    8049cc8 <_svfprintf_r+0xa68>
 8049c96:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049c9c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ca3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ca7:	8b 45 08             	mov    0x8(%ebp),%eax
 8049caa:	89 04 24             	mov    %eax,(%esp)
 8049cad:	e8 1e 70 00 00       	call   8050cd0 <__ssprint_r>
 8049cb2:	85 c0                	test   %eax,%eax
 8049cb4:	0f 85 76 f7 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 8049cba:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049cc0:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049cc3:	90                   	nop
 8049cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049cc8:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
 8049ccf:	01 00 00 
 8049cd2:	0f 85 50 01 00 00    	jne    8049e28 <_svfprintf_r+0xbc8>
 8049cd8:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 8049cde:	89 07                	mov    %eax,(%edi)
 8049ce0:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
 8049ce6:	01 c1                	add    %eax,%ecx
 8049ce8:	89 47 04             	mov    %eax,0x4(%edi)
 8049ceb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049cf1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049cf7:	83 c0 01             	add    $0x1,%eax
 8049cfa:	83 f8 07             	cmp    $0x7,%eax
 8049cfd:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049d03:	0f 8f 6a 04 00 00    	jg     804a173 <_svfprintf_r+0xf13>
 8049d09:	83 c7 08             	add    $0x8,%edi
 8049d0c:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
 8049d13:	0f 84 d7 00 00 00    	je     8049df0 <_svfprintf_r+0xb90>
 8049d19:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049d1f:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049d25:	85 f6                	test   %esi,%esi
 8049d27:	0f 8e c3 00 00 00    	jle    8049df0 <_svfprintf_r+0xb90>
 8049d2d:	83 fe 10             	cmp    $0x10,%esi
 8049d30:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049d36:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049d3c:	7f 0a                	jg     8049d48 <_svfprintf_r+0xae8>
 8049d3e:	eb 64                	jmp    8049da4 <_svfprintf_r+0xb44>
 8049d40:	83 ee 10             	sub    $0x10,%esi
 8049d43:	83 fe 10             	cmp    $0x10,%esi
 8049d46:	7e 5c                	jle    8049da4 <_svfprintf_r+0xb44>
 8049d48:	83 c0 01             	add    $0x1,%eax
 8049d4b:	83 c1 10             	add    $0x10,%ecx
 8049d4e:	c7 07 dc 47 05 08    	movl   $0x80547dc,(%edi)
 8049d54:	83 c7 08             	add    $0x8,%edi
 8049d57:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049d5e:	83 f8 07             	cmp    $0x7,%eax
 8049d61:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049d67:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049d6d:	7e d1                	jle    8049d40 <_svfprintf_r+0xae0>
 8049d6f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d72:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049d76:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d7a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d7d:	89 04 24             	mov    %eax,(%esp)
 8049d80:	e8 4b 6f 00 00       	call   8050cd0 <__ssprint_r>
 8049d85:	85 c0                	test   %eax,%eax
 8049d87:	0f 85 a3 f6 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 8049d8d:	83 ee 10             	sub    $0x10,%esi
 8049d90:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049d96:	83 fe 10             	cmp    $0x10,%esi
 8049d99:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049d9f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049da2:	7f a4                	jg     8049d48 <_svfprintf_r+0xae8>
 8049da4:	83 c0 01             	add    $0x1,%eax
 8049da7:	01 f1                	add    %esi,%ecx
 8049da9:	83 f8 07             	cmp    $0x7,%eax
 8049dac:	c7 07 dc 47 05 08    	movl   $0x80547dc,(%edi)
 8049db2:	89 77 04             	mov    %esi,0x4(%edi)
 8049db5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049dbb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049dc1:	7e 2d                	jle    8049df0 <_svfprintf_r+0xb90>
 8049dc3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049dc9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049dcd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049dd0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dd4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dd7:	89 04 24             	mov    %eax,(%esp)
 8049dda:	e8 f1 6e 00 00       	call   8050cd0 <__ssprint_r>
 8049ddf:	85 c0                	test   %eax,%eax
 8049de1:	0f 85 49 f6 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 8049de7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049ded:	8d 76 00             	lea    0x0(%esi),%esi
 8049df0:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
 8049df6:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
 8049dfc:	39 c2                	cmp    %eax,%edx
 8049dfe:	0f 4d c2             	cmovge %edx,%eax
 8049e01:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
 8049e07:	85 c9                	test   %ecx,%ecx
 8049e09:	0f 85 99 03 00 00    	jne    804a1a8 <_svfprintf_r+0xf48>
 8049e0f:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8049e16:	00 00 00 
 8049e19:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049e1c:	e9 da f4 ff ff       	jmp    80492fb <_svfprintf_r+0x9b>
 8049e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049e28:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 8049e2f:	0f 8e 5b 02 00 00    	jle    804a090 <_svfprintf_r+0xe30>
 8049e35:	d9 ee                	fldz   
 8049e37:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 8049e3d:	df e9                	fucomip %st(1),%st
 8049e3f:	dd d8                	fstp   %st(0)
 8049e41:	0f 8a 59 04 00 00    	jp     804a2a0 <_svfprintf_r+0x1040>
 8049e47:	0f 85 53 04 00 00    	jne    804a2a0 <_svfprintf_r+0x1040>
 8049e4d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049e53:	83 c1 01             	add    $0x1,%ecx
 8049e56:	83 c7 08             	add    $0x8,%edi
 8049e59:	c7 47 f8 27 43 05 08 	movl   $0x8054327,-0x8(%edi)
 8049e60:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 8049e67:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049e6d:	83 c0 01             	add    $0x1,%eax
 8049e70:	83 f8 07             	cmp    $0x7,%eax
 8049e73:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049e79:	0f 8f 63 09 00 00    	jg     804a7e2 <_svfprintf_r+0x1582>
 8049e7f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 8049e85:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
 8049e8b:	7c 0d                	jl     8049e9a <_svfprintf_r+0xc3a>
 8049e8d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049e94:	0f 84 72 fe ff ff    	je     8049d0c <_svfprintf_r+0xaac>
 8049e9a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 8049ea0:	83 c7 08             	add    $0x8,%edi
 8049ea3:	89 47 f8             	mov    %eax,-0x8(%edi)
 8049ea6:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 8049eac:	89 47 fc             	mov    %eax,-0x4(%edi)
 8049eaf:	01 c1                	add    %eax,%ecx
 8049eb1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049eb7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049ebd:	83 c0 01             	add    $0x1,%eax
 8049ec0:	83 f8 07             	cmp    $0x7,%eax
 8049ec3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049ec9:	0f 8f dc 0b 00 00    	jg     804aaab <_svfprintf_r+0x184b>
 8049ecf:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 8049ed5:	8d 70 ff             	lea    -0x1(%eax),%esi
 8049ed8:	85 f6                	test   %esi,%esi
 8049eda:	0f 8e 2c fe ff ff    	jle    8049d0c <_svfprintf_r+0xaac>
 8049ee0:	83 fe 10             	cmp    $0x10,%esi
 8049ee3:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049ee9:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049eef:	7f 13                	jg     8049f04 <_svfprintf_r+0xca4>
 8049ef1:	e9 e6 05 00 00       	jmp    804a4dc <_svfprintf_r+0x127c>
 8049ef6:	66 90                	xchg   %ax,%ax
 8049ef8:	83 ee 10             	sub    $0x10,%esi
 8049efb:	83 fe 10             	cmp    $0x10,%esi
 8049efe:	0f 8e d8 05 00 00    	jle    804a4dc <_svfprintf_r+0x127c>
 8049f04:	83 c0 01             	add    $0x1,%eax
 8049f07:	83 c1 10             	add    $0x10,%ecx
 8049f0a:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 8049f10:	83 c7 08             	add    $0x8,%edi
 8049f13:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049f1a:	83 f8 07             	cmp    $0x7,%eax
 8049f1d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049f23:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049f29:	7e cd                	jle    8049ef8 <_svfprintf_r+0xc98>
 8049f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049f2e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049f32:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049f36:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f39:	89 04 24             	mov    %eax,(%esp)
 8049f3c:	e8 8f 6d 00 00       	call   8050cd0 <__ssprint_r>
 8049f41:	85 c0                	test   %eax,%eax
 8049f43:	0f 85 e7 f4 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 8049f49:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049f4f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049f52:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049f58:	eb 9e                	jmp    8049ef8 <_svfprintf_r+0xc98>
 8049f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049f60:	84 c0                	test   %al,%al
 8049f62:	75 2c                	jne    8049f90 <_svfprintf_r+0xd30>
 8049f64:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049f6b:	74 23                	je     8049f90 <_svfprintf_r+0xd30>
 8049f6d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 8049f73:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 8049f77:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 8049f7d:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8049f80:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049f86:	e9 2d f7 ff ff       	jmp    80496b8 <_svfprintf_r+0x458>
 8049f8b:	90                   	nop
 8049f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f90:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049f93:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
 8049f9a:	00 00 00 
 8049f9d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049fa3:	e9 10 f7 ff ff       	jmp    80496b8 <_svfprintf_r+0x458>
 8049fa8:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049fae:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049fb4:	85 f6                	test   %esi,%esi
 8049fb6:	0f 8e 26 fc ff ff    	jle    8049be2 <_svfprintf_r+0x982>
 8049fbc:	83 fe 10             	cmp    $0x10,%esi
 8049fbf:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049fc5:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049fcb:	7f 0b                	jg     8049fd8 <_svfprintf_r+0xd78>
 8049fcd:	eb 65                	jmp    804a034 <_svfprintf_r+0xdd4>
 8049fcf:	90                   	nop
 8049fd0:	83 ee 10             	sub    $0x10,%esi
 8049fd3:	83 fe 10             	cmp    $0x10,%esi
 8049fd6:	7e 5c                	jle    804a034 <_svfprintf_r+0xdd4>
 8049fd8:	83 c0 01             	add    $0x1,%eax
 8049fdb:	83 c1 10             	add    $0x10,%ecx
 8049fde:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 8049fe4:	83 c7 08             	add    $0x8,%edi
 8049fe7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049fee:	83 f8 07             	cmp    $0x7,%eax
 8049ff1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049ff7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049ffd:	7e d1                	jle    8049fd0 <_svfprintf_r+0xd70>
 8049fff:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a002:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a006:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a00a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a00d:	89 04 24             	mov    %eax,(%esp)
 804a010:	e8 bb 6c 00 00       	call   8050cd0 <__ssprint_r>
 804a015:	85 c0                	test   %eax,%eax
 804a017:	0f 85 13 f4 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a01d:	83 ee 10             	sub    $0x10,%esi
 804a020:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a026:	83 fe 10             	cmp    $0x10,%esi
 804a029:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a02f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a032:	7f a4                	jg     8049fd8 <_svfprintf_r+0xd78>
 804a034:	83 c0 01             	add    $0x1,%eax
 804a037:	01 f1                	add    %esi,%ecx
 804a039:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a03f:	83 c7 08             	add    $0x8,%edi
 804a042:	89 77 fc             	mov    %esi,-0x4(%edi)
 804a045:	83 f8 07             	cmp    $0x7,%eax
 804a048:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a04e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a054:	0f 8e 88 fb ff ff    	jle    8049be2 <_svfprintf_r+0x982>
 804a05a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a060:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a064:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a067:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a06b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a06e:	89 04 24             	mov    %eax,(%esp)
 804a071:	e8 5a 6c 00 00       	call   8050cd0 <__ssprint_r>
 804a076:	85 c0                	test   %eax,%eax
 804a078:	0f 85 b2 f3 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a07e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a084:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a087:	e9 56 fb ff ff       	jmp    8049be2 <_svfprintf_r+0x982>
 804a08c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a090:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
 804a097:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804a09d:	0f 8e df 05 00 00    	jle    804a682 <_svfprintf_r+0x1422>
 804a0a3:	89 07                	mov    %eax,(%edi)
 804a0a5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a0ab:	8d 51 01             	lea    0x1(%ecx),%edx
 804a0ae:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804a0b5:	83 c7 08             	add    $0x8,%edi
 804a0b8:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a0be:	83 c0 01             	add    $0x1,%eax
 804a0c1:	83 f8 07             	cmp    $0x7,%eax
 804a0c4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a0ca:	0f 8f 59 06 00 00    	jg     804a729 <_svfprintf_r+0x14c9>
 804a0d0:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
 804a0d6:	83 c0 01             	add    $0x1,%eax
 804a0d9:	83 c7 08             	add    $0x8,%edi
 804a0dc:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a0e2:	89 5f f8             	mov    %ebx,-0x8(%edi)
 804a0e5:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
 804a0eb:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804a0ee:	01 da                	add    %ebx,%edx
 804a0f0:	83 f8 07             	cmp    $0x7,%eax
 804a0f3:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a0f9:	0f 8f f2 05 00 00    	jg     804a6f1 <_svfprintf_r+0x1491>
 804a0ff:	d9 ee                	fldz   
 804a101:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a107:	df e9                	fucomip %st(1),%st
 804a109:	dd d8                	fstp   %st(0)
 804a10b:	7a 06                	jp     804a113 <_svfprintf_r+0xeb3>
 804a10d:	0f 84 33 03 00 00    	je     804a446 <_svfprintf_r+0x11e6>
 804a113:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
 804a119:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804a11f:	83 c1 01             	add    $0x1,%ecx
 804a122:	89 0f                	mov    %ecx,(%edi)
 804a124:	8d 4b ff             	lea    -0x1(%ebx),%ecx
 804a127:	89 4f 04             	mov    %ecx,0x4(%edi)
 804a12a:	01 ca                	add    %ecx,%edx
 804a12c:	83 c0 01             	add    $0x1,%eax
 804a12f:	83 f8 07             	cmp    $0x7,%eax
 804a132:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a138:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a13e:	0f 8f 75 05 00 00    	jg     804a6b9 <_svfprintf_r+0x1459>
 804a144:	83 c7 08             	add    $0x8,%edi
 804a147:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
 804a14d:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
 804a153:	89 0f                	mov    %ecx,(%edi)
 804a155:	89 5f 04             	mov    %ebx,0x4(%edi)
 804a158:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
 804a15b:	83 c0 01             	add    $0x1,%eax
 804a15e:	83 f8 07             	cmp    $0x7,%eax
 804a161:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a167:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a16d:	0f 8e 96 fb ff ff    	jle    8049d09 <_svfprintf_r+0xaa9>
 804a173:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a179:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a17d:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a180:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a184:	8b 45 08             	mov    0x8(%ebp),%eax
 804a187:	89 04 24             	mov    %eax,(%esp)
 804a18a:	e8 41 6b 00 00       	call   8050cd0 <__ssprint_r>
 804a18f:	85 c0                	test   %eax,%eax
 804a191:	0f 85 99 f2 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a197:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a19d:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a1a0:	e9 67 fb ff ff       	jmp    8049d0c <_svfprintf_r+0xaac>
 804a1a5:	8d 76 00             	lea    0x0(%esi),%esi
 804a1a8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a1ae:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a1b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a1b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1bc:	89 04 24             	mov    %eax,(%esp)
 804a1bf:	e8 0c 6b 00 00       	call   8050cd0 <__ssprint_r>
 804a1c4:	85 c0                	test   %eax,%eax
 804a1c6:	0f 84 43 fc ff ff    	je     8049e0f <_svfprintf_r+0xbaf>
 804a1cc:	e9 5f f2 ff ff       	jmp    8049430 <_svfprintf_r+0x1d0>
 804a1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804a1d8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a1de:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a1e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a1e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1ec:	89 04 24             	mov    %eax,(%esp)
 804a1ef:	e8 dc 6a 00 00       	call   8050cd0 <__ssprint_r>
 804a1f4:	85 c0                	test   %eax,%eax
 804a1f6:	0f 85 34 f2 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a1fc:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a202:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a205:	e9 c8 f9 ff ff       	jmp    8049bd2 <_svfprintf_r+0x972>
 804a20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a210:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a216:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a21d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a221:	8b 45 08             	mov    0x8(%ebp),%eax
 804a224:	89 04 24             	mov    %eax,(%esp)
 804a227:	e8 a4 6a 00 00       	call   8050cd0 <__ssprint_r>
 804a22c:	85 c0                	test   %eax,%eax
 804a22e:	0f 85 fc f1 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a234:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a23a:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a23d:	e9 53 f9 ff ff       	jmp    8049b95 <_svfprintf_r+0x935>
 804a242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a248:	89 c2                	mov    %eax,%edx
 804a24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a250:	89 c8                	mov    %ecx,%eax
 804a252:	83 ea 01             	sub    $0x1,%edx
 804a255:	83 e0 07             	and    $0x7,%eax
 804a258:	c1 e9 03             	shr    $0x3,%ecx
 804a25b:	83 c0 30             	add    $0x30,%eax
 804a25e:	85 c9                	test   %ecx,%ecx
 804a260:	88 02                	mov    %al,(%edx)
 804a262:	75 ec                	jne    804a250 <_svfprintf_r+0xff0>
 804a264:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a26b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
 804a271:	0f 84 5b 01 00 00    	je     804a3d2 <_svfprintf_r+0x1172>
 804a277:	3c 30                	cmp    $0x30,%al
 804a279:	74 0b                	je     804a286 <_svfprintf_r+0x1026>
 804a27b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
 804a282:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 804a286:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a289:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 804a28f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a295:	e9 1e f4 ff ff       	jmp    80496b8 <_svfprintf_r+0x458>
 804a29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a2a0:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804a2a6:	85 db                	test   %ebx,%ebx
 804a2a8:	0f 8e 66 05 00 00    	jle    804a814 <_svfprintf_r+0x15b4>
 804a2ae:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804a2b4:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804a2ba:	01 d0                	add    %edx,%eax
 804a2bc:	89 c3                	mov    %eax,%ebx
 804a2be:	29 d3                	sub    %edx,%ebx
 804a2c0:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804a2c6:	89 d0                	mov    %edx,%eax
 804a2c8:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804a2ce:	39 d3                	cmp    %edx,%ebx
 804a2d0:	0f 4f da             	cmovg  %edx,%ebx
 804a2d3:	85 db                	test   %ebx,%ebx
 804a2d5:	7e 28                	jle    804a2ff <_svfprintf_r+0x109f>
 804a2d7:	89 07                	mov    %eax,(%edi)
 804a2d9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a2df:	01 d9                	add    %ebx,%ecx
 804a2e1:	89 5f 04             	mov    %ebx,0x4(%edi)
 804a2e4:	83 c7 08             	add    $0x8,%edi
 804a2e7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a2ed:	83 c0 01             	add    $0x1,%eax
 804a2f0:	83 f8 07             	cmp    $0x7,%eax
 804a2f3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a2f9:	0f 8f 58 09 00 00    	jg     804ac57 <_svfprintf_r+0x19f7>
 804a2ff:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
 804a305:	31 c0                	xor    %eax,%eax
 804a307:	85 db                	test   %ebx,%ebx
 804a309:	0f 49 c3             	cmovns %ebx,%eax
 804a30c:	29 c6                	sub    %eax,%esi
 804a30e:	85 f6                	test   %esi,%esi
 804a310:	0f 8e 40 02 00 00    	jle    804a556 <_svfprintf_r+0x12f6>
 804a316:	83 fe 10             	cmp    $0x10,%esi
 804a319:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a31f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a325:	7f 15                	jg     804a33c <_svfprintf_r+0x10dc>
 804a327:	e9 db 01 00 00       	jmp    804a507 <_svfprintf_r+0x12a7>
 804a32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a330:	83 ee 10             	sub    $0x10,%esi
 804a333:	83 fe 10             	cmp    $0x10,%esi
 804a336:	0f 8e cb 01 00 00    	jle    804a507 <_svfprintf_r+0x12a7>
 804a33c:	83 c0 01             	add    $0x1,%eax
 804a33f:	83 c1 10             	add    $0x10,%ecx
 804a342:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a348:	83 c7 08             	add    $0x8,%edi
 804a34b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a352:	83 f8 07             	cmp    $0x7,%eax
 804a355:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a35b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a361:	7e cd                	jle    804a330 <_svfprintf_r+0x10d0>
 804a363:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a366:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a36a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a36e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a371:	89 04 24             	mov    %eax,(%esp)
 804a374:	e8 57 69 00 00       	call   8050cd0 <__ssprint_r>
 804a379:	85 c0                	test   %eax,%eax
 804a37b:	0f 85 af f0 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a381:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a387:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a38a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a390:	eb 9e                	jmp    804a330 <_svfprintf_r+0x10d0>
 804a392:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a395:	be cd cc cc cc       	mov    $0xcccccccd,%esi
 804a39a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804a3a0:	89 c7                	mov    %eax,%edi
 804a3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a3a8:	89 c8                	mov    %ecx,%eax
 804a3aa:	83 ef 01             	sub    $0x1,%edi
 804a3ad:	f7 e6                	mul    %esi
 804a3af:	c1 ea 03             	shr    $0x3,%edx
 804a3b2:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804a3b5:	01 c0                	add    %eax,%eax
 804a3b7:	29 c1                	sub    %eax,%ecx
 804a3b9:	83 c1 30             	add    $0x30,%ecx
 804a3bc:	85 d2                	test   %edx,%edx
 804a3be:	88 0f                	mov    %cl,(%edi)
 804a3c0:	89 d1                	mov    %edx,%ecx
 804a3c2:	75 e4                	jne    804a3a8 <_svfprintf_r+0x1148>
 804a3c4:	89 fa                	mov    %edi,%edx
 804a3c6:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
 804a3cc:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804a3d2:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a3d5:	29 d0                	sub    %edx,%eax
 804a3d7:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a3dd:	e9 d6 f2 ff ff       	jmp    80496b8 <_svfprintf_r+0x458>
 804a3e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a3e8:	83 f9 09             	cmp    $0x9,%ecx
 804a3eb:	77 a5                	ja     804a392 <_svfprintf_r+0x1132>
 804a3ed:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804a3f3:	83 c1 30             	add    $0x30,%ecx
 804a3f6:	88 4d a7             	mov    %cl,-0x59(%ebp)
 804a3f9:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a3ff:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804a402:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a408:	e9 ab f2 ff ff       	jmp    80496b8 <_svfprintf_r+0x458>
 804a40d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a413:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a417:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a41a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a41e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a421:	89 04 24             	mov    %eax,(%esp)
 804a424:	e8 a7 68 00 00       	call   8050cd0 <__ssprint_r>
 804a429:	85 c0                	test   %eax,%eax
 804a42b:	0f 85 ff ef ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a431:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804a438:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a43b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a441:	e9 18 f7 ff ff       	jmp    8049b5e <_svfprintf_r+0x8fe>
 804a446:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804a44c:	8d 73 ff             	lea    -0x1(%ebx),%esi
 804a44f:	85 f6                	test   %esi,%esi
 804a451:	0f 8e f0 fc ff ff    	jle    804a147 <_svfprintf_r+0xee7>
 804a457:	83 fe 10             	cmp    $0x10,%esi
 804a45a:	7e 70                	jle    804a4cc <_svfprintf_r+0x126c>
 804a45c:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a462:	eb 0c                	jmp    804a470 <_svfprintf_r+0x1210>
 804a464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a468:	83 ee 10             	sub    $0x10,%esi
 804a46b:	83 fe 10             	cmp    $0x10,%esi
 804a46e:	7e 5c                	jle    804a4cc <_svfprintf_r+0x126c>
 804a470:	83 c0 01             	add    $0x1,%eax
 804a473:	83 c2 10             	add    $0x10,%edx
 804a476:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a47c:	83 c7 08             	add    $0x8,%edi
 804a47f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a486:	83 f8 07             	cmp    $0x7,%eax
 804a489:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a48f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a495:	7e d1                	jle    804a468 <_svfprintf_r+0x1208>
 804a497:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a49a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a49e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a4a2:	8b 45 08             	mov    0x8(%ebp),%eax
 804a4a5:	89 04 24             	mov    %eax,(%esp)
 804a4a8:	e8 23 68 00 00       	call   8050cd0 <__ssprint_r>
 804a4ad:	85 c0                	test   %eax,%eax
 804a4af:	0f 85 7b ef ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a4b5:	83 ee 10             	sub    $0x10,%esi
 804a4b8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a4be:	83 fe 10             	cmp    $0x10,%esi
 804a4c1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a4c7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a4ca:	7f a4                	jg     804a470 <_svfprintf_r+0x1210>
 804a4cc:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a4d2:	01 f2                	add    %esi,%edx
 804a4d4:	89 77 04             	mov    %esi,0x4(%edi)
 804a4d7:	e9 50 fc ff ff       	jmp    804a12c <_svfprintf_r+0xecc>
 804a4dc:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a4e2:	01 f1                	add    %esi,%ecx
 804a4e4:	89 77 04             	mov    %esi,0x4(%edi)
 804a4e7:	e9 6f fc ff ff       	jmp    804a15b <_svfprintf_r+0xefb>
 804a4ec:	8b 45 14             	mov    0x14(%ebp),%eax
 804a4ef:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
 804a4f5:	8b 00                	mov    (%eax),%eax
 804a4f7:	89 10                	mov    %edx,(%eax)
 804a4f9:	8b 45 14             	mov    0x14(%ebp),%eax
 804a4fc:	83 c0 04             	add    $0x4,%eax
 804a4ff:	89 45 14             	mov    %eax,0x14(%ebp)
 804a502:	e9 f4 ed ff ff       	jmp    80492fb <_svfprintf_r+0x9b>
 804a507:	83 c0 01             	add    $0x1,%eax
 804a50a:	01 f1                	add    %esi,%ecx
 804a50c:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a512:	83 c7 08             	add    $0x8,%edi
 804a515:	89 77 fc             	mov    %esi,-0x4(%edi)
 804a518:	83 f8 07             	cmp    $0x7,%eax
 804a51b:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a521:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a527:	7e 2d                	jle    804a556 <_svfprintf_r+0x12f6>
 804a529:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a52f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a533:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a536:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a53a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a53d:	89 04 24             	mov    %eax,(%esp)
 804a540:	e8 8b 67 00 00       	call   8050cd0 <__ssprint_r>
 804a545:	85 c0                	test   %eax,%eax
 804a547:	0f 85 e3 ee ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a54d:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a553:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a556:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804a55c:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804a562:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
 804a568:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
 804a56e:	89 c6                	mov    %eax,%esi
 804a570:	7c 0d                	jl     804a57f <_svfprintf_r+0x131f>
 804a572:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a579:	0f 84 5e 05 00 00    	je     804aadd <_svfprintf_r+0x187d>
 804a57f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804a585:	89 07                	mov    %eax,(%edi)
 804a587:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 804a58d:	01 c1                	add    %eax,%ecx
 804a58f:	89 47 04             	mov    %eax,0x4(%edi)
 804a592:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a598:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a59e:	83 c0 01             	add    $0x1,%eax
 804a5a1:	83 f8 07             	cmp    $0x7,%eax
 804a5a4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a5aa:	0f 8f d9 06 00 00    	jg     804ac89 <_svfprintf_r+0x1a29>
 804a5b0:	83 c7 08             	add    $0x8,%edi
 804a5b3:	89 d0                	mov    %edx,%eax
 804a5b5:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804a5bb:	89 f2                	mov    %esi,%edx
 804a5bd:	29 f3                	sub    %esi,%ebx
 804a5bf:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804a5c5:	29 c6                	sub    %eax,%esi
 804a5c7:	39 de                	cmp    %ebx,%esi
 804a5c9:	0f 4e de             	cmovle %esi,%ebx
 804a5cc:	85 db                	test   %ebx,%ebx
 804a5ce:	7e 29                	jle    804a5f9 <_svfprintf_r+0x1399>
 804a5d0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a5d6:	01 d9                	add    %ebx,%ecx
 804a5d8:	83 c7 08             	add    $0x8,%edi
 804a5db:	89 57 f8             	mov    %edx,-0x8(%edi)
 804a5de:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804a5e1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a5e7:	83 c0 01             	add    $0x1,%eax
 804a5ea:	83 f8 07             	cmp    $0x7,%eax
 804a5ed:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a5f3:	0f 8f c8 06 00 00    	jg     804acc1 <_svfprintf_r+0x1a61>
 804a5f9:	31 c0                	xor    %eax,%eax
 804a5fb:	85 db                	test   %ebx,%ebx
 804a5fd:	0f 49 c3             	cmovns %ebx,%eax
 804a600:	29 c6                	sub    %eax,%esi
 804a602:	85 f6                	test   %esi,%esi
 804a604:	0f 8e 02 f7 ff ff    	jle    8049d0c <_svfprintf_r+0xaac>
 804a60a:	83 fe 10             	cmp    $0x10,%esi
 804a60d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a613:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a619:	7f 11                	jg     804a62c <_svfprintf_r+0x13cc>
 804a61b:	e9 bc fe ff ff       	jmp    804a4dc <_svfprintf_r+0x127c>
 804a620:	83 ee 10             	sub    $0x10,%esi
 804a623:	83 fe 10             	cmp    $0x10,%esi
 804a626:	0f 8e b0 fe ff ff    	jle    804a4dc <_svfprintf_r+0x127c>
 804a62c:	83 c0 01             	add    $0x1,%eax
 804a62f:	83 c1 10             	add    $0x10,%ecx
 804a632:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a638:	83 c7 08             	add    $0x8,%edi
 804a63b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a642:	83 f8 07             	cmp    $0x7,%eax
 804a645:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a64b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a651:	7e cd                	jle    804a620 <_svfprintf_r+0x13c0>
 804a653:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a656:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a65a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a65e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a661:	89 04 24             	mov    %eax,(%esp)
 804a664:	e8 67 66 00 00       	call   8050cd0 <__ssprint_r>
 804a669:	85 c0                	test   %eax,%eax
 804a66b:	0f 85 bf ed ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a671:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a677:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a67a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a680:	eb 9e                	jmp    804a620 <_svfprintf_r+0x13c0>
 804a682:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a689:	0f 85 14 fa ff ff    	jne    804a0a3 <_svfprintf_r+0xe43>
 804a68f:	89 07                	mov    %eax,(%edi)
 804a691:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a697:	8d 51 01             	lea    0x1(%ecx),%edx
 804a69a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804a6a1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a6a7:	83 c0 01             	add    $0x1,%eax
 804a6aa:	83 f8 07             	cmp    $0x7,%eax
 804a6ad:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a6b3:	0f 8e 8b fa ff ff    	jle    804a144 <_svfprintf_r+0xee4>
 804a6b9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a6bf:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a6c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6cd:	89 04 24             	mov    %eax,(%esp)
 804a6d0:	e8 fb 65 00 00       	call   8050cd0 <__ssprint_r>
 804a6d5:	85 c0                	test   %eax,%eax
 804a6d7:	0f 85 53 ed ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a6dd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a6e3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a6e6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a6ec:	e9 56 fa ff ff       	jmp    804a147 <_svfprintf_r+0xee7>
 804a6f1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a6f7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a6fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a702:	8b 45 08             	mov    0x8(%ebp),%eax
 804a705:	89 04 24             	mov    %eax,(%esp)
 804a708:	e8 c3 65 00 00       	call   8050cd0 <__ssprint_r>
 804a70d:	85 c0                	test   %eax,%eax
 804a70f:	0f 85 1b ed ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a715:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a71b:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a71e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a724:	e9 d6 f9 ff ff       	jmp    804a0ff <_svfprintf_r+0xe9f>
 804a729:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a72f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a733:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a736:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a73a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a73d:	89 04 24             	mov    %eax,(%esp)
 804a740:	e8 8b 65 00 00       	call   8050cd0 <__ssprint_r>
 804a745:	85 c0                	test   %eax,%eax
 804a747:	0f 85 e3 ec ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a74d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a753:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a756:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a75c:	e9 6f f9 ff ff       	jmp    804a0d0 <_svfprintf_r+0xe70>
 804a761:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a767:	dd 1c 24             	fstpl  (%esp)
 804a76a:	e8 41 63 00 00       	call   8050ab0 <__fpclassifyd>
 804a76f:	85 c0                	test   %eax,%eax
 804a771:	0f 85 a3 01 00 00    	jne    804a91a <_svfprintf_r+0x16ba>
 804a777:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804a77e:	ba 34 46 05 08       	mov    $0x8054634,%edx
 804a783:	b8 38 46 05 08       	mov    $0x8054638,%eax
 804a788:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804a78f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804a796:	00 00 00 
 804a799:	0f 4e c2             	cmovle %edx,%eax
 804a79c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a7a2:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804a7a9:	ff ff ff 
 804a7ac:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804a7b3:	00 00 00 
 804a7b6:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804a7bd:	00 00 00 
 804a7c0:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804a7c7:	00 00 00 
 804a7ca:	e9 29 ed ff ff       	jmp    80494f8 <_svfprintf_r+0x298>
 804a7cf:	dd 00                	fldl   (%eax)
 804a7d1:	83 c0 08             	add    $0x8,%eax
 804a7d4:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804a7da:	89 45 14             	mov    %eax,0x14(%ebp)
 804a7dd:	e9 e6 ef ff ff       	jmp    80497c8 <_svfprintf_r+0x568>
 804a7e2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a7e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a7ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a7ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a7f3:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7f6:	89 04 24             	mov    %eax,(%esp)
 804a7f9:	e8 d2 64 00 00       	call   8050cd0 <__ssprint_r>
 804a7fe:	85 c0                	test   %eax,%eax
 804a800:	0f 85 2a ec ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a806:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a80c:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a80f:	e9 6b f6 ff ff       	jmp    8049e7f <_svfprintf_r+0xc1f>
 804a814:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a81a:	83 c1 01             	add    $0x1,%ecx
 804a81d:	83 c7 08             	add    $0x8,%edi
 804a820:	c7 47 f8 27 43 05 08 	movl   $0x8054327,-0x8(%edi)
 804a827:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804a82e:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a834:	83 c0 01             	add    $0x1,%eax
 804a837:	83 f8 07             	cmp    $0x7,%eax
 804a83a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a840:	0f 8f ef 02 00 00    	jg     804ab35 <_svfprintf_r+0x18d5>
 804a846:	85 db                	test   %ebx,%ebx
 804a848:	75 17                	jne    804a861 <_svfprintf_r+0x1601>
 804a84a:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
 804a850:	85 d2                	test   %edx,%edx
 804a852:	75 0d                	jne    804a861 <_svfprintf_r+0x1601>
 804a854:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a85b:	0f 84 ab f4 ff ff    	je     8049d0c <_svfprintf_r+0xaac>
 804a861:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804a867:	83 c7 08             	add    $0x8,%edi
 804a86a:	89 47 f8             	mov    %eax,-0x8(%edi)
 804a86d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 804a873:	89 47 fc             	mov    %eax,-0x4(%edi)
 804a876:	8d 14 01             	lea    (%ecx,%eax,1),%edx
 804a879:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a87f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a885:	83 c0 01             	add    $0x1,%eax
 804a888:	83 f8 07             	cmp    $0x7,%eax
 804a88b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a891:	0f 8f 60 03 00 00    	jg     804abf7 <_svfprintf_r+0x1997>
 804a897:	f7 db                	neg    %ebx
 804a899:	85 db                	test   %ebx,%ebx
 804a89b:	0f 8e 21 03 00 00    	jle    804abc2 <_svfprintf_r+0x1962>
 804a8a1:	83 fb 10             	cmp    $0x10,%ebx
 804a8a4:	0f 8e c3 02 00 00    	jle    804ab6d <_svfprintf_r+0x190d>
 804a8aa:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
 804a8b0:	eb 12                	jmp    804a8c4 <_svfprintf_r+0x1664>
 804a8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a8b8:	83 eb 10             	sub    $0x10,%ebx
 804a8bb:	83 fb 10             	cmp    $0x10,%ebx
 804a8be:	0f 8e a9 02 00 00    	jle    804ab6d <_svfprintf_r+0x190d>
 804a8c4:	83 c0 01             	add    $0x1,%eax
 804a8c7:	83 c2 10             	add    $0x10,%edx
 804a8ca:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804a8d0:	83 c7 08             	add    $0x8,%edi
 804a8d3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a8da:	83 f8 07             	cmp    $0x7,%eax
 804a8dd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a8e3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a8e9:	7e cd                	jle    804a8b8 <_svfprintf_r+0x1658>
 804a8eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a8ee:	89 74 24 08          	mov    %esi,0x8(%esp)
 804a8f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8f9:	89 04 24             	mov    %eax,(%esp)
 804a8fc:	e8 cf 63 00 00       	call   8050cd0 <__ssprint_r>
 804a901:	85 c0                	test   %eax,%eax
 804a903:	0f 85 27 eb ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804a909:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a90f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a912:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a918:	eb 9e                	jmp    804a8b8 <_svfprintf_r+0x1658>
 804a91a:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
 804a920:	83 e3 df             	and    $0xffffffdf,%ebx
 804a923:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
 804a92a:	0f 84 05 03 00 00    	je     804ac35 <_svfprintf_r+0x19d5>
 804a930:	83 fb 47             	cmp    $0x47,%ebx
 804a933:	75 16                	jne    804a94b <_svfprintf_r+0x16eb>
 804a935:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804a93b:	b8 01 00 00 00       	mov    $0x1,%eax
 804a940:	85 d2                	test   %edx,%edx
 804a942:	0f 45 c2             	cmovne %edx,%eax
 804a945:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804a94b:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804a951:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a957:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
 804a95d:	80 cc 01             	or     $0x1,%ah
 804a960:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
 804a966:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 804a96c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
 804a973:	85 c0                	test   %eax,%eax
 804a975:	0f 88 ba 05 00 00    	js     804af35 <_svfprintf_r+0x1cd5>
 804a97b:	83 fb 46             	cmp    $0x46,%ebx
 804a97e:	0f 94 c0             	sete   %al
 804a981:	89 c6                	mov    %eax,%esi
 804a983:	0f 84 d4 03 00 00    	je     804ad5d <_svfprintf_r+0x1afd>
 804a989:	83 fb 45             	cmp    $0x45,%ebx
 804a98c:	0f 85 99 05 00 00    	jne    804af2b <_svfprintf_r+0x1ccb>
 804a992:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804a998:	dd 54 24 04          	fstl   0x4(%esp)
 804a99c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 804a9a3:	00 
 804a9a4:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804a9aa:	8d 70 01             	lea    0x1(%eax),%esi
 804a9ad:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804a9b3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804a9b7:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804a9bd:	89 44 24 18          	mov    %eax,0x18(%esp)
 804a9c1:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804a9c7:	89 44 24 14          	mov    %eax,0x14(%esp)
 804a9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9ce:	89 74 24 10          	mov    %esi,0x10(%esp)
 804a9d2:	89 04 24             	mov    %eax,(%esp)
 804a9d5:	e8 06 2b 00 00       	call   804d4e0 <_dtoa_r>
 804a9da:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a9e0:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
 804a9e3:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804a9e9:	d9 ee                	fldz   
 804a9eb:	d9 c9                	fxch   %st(1)
 804a9ed:	df e9                	fucomip %st(1),%st
 804a9ef:	dd d8                	fstp   %st(0)
 804a9f1:	0f 8a fd 00 00 00    	jp     804aaf4 <_svfprintf_r+0x1894>
 804a9f7:	89 c8                	mov    %ecx,%eax
 804a9f9:	0f 85 f5 00 00 00    	jne    804aaf4 <_svfprintf_r+0x1894>
 804a9ff:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 804aa05:	83 fb 47             	cmp    $0x47,%ebx
 804aa08:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804aa0e:	0f 84 1e 04 00 00    	je     804ae32 <_svfprintf_r+0x1bd2>
 804aa14:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804aa1b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804aa21:	0f 8e 65 04 00 00    	jle    804ae8c <_svfprintf_r+0x1c2c>
 804aa27:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
 804aa2e:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804aa34:	0f 84 3c 05 00 00    	je     804af76 <_svfprintf_r+0x1d16>
 804aa3a:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
 804aa40:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
 804aa46:	0f 8f f7 04 00 00    	jg     804af43 <_svfprintf_r+0x1ce3>
 804aa4c:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804aa52:	83 e0 01             	and    $0x1,%eax
 804aa55:	0f 85 e2 05 00 00    	jne    804b03d <_svfprintf_r+0x1ddd>
 804aa5b:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804aa61:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804aa68:	00 00 00 
 804aa6b:	85 d2                	test   %edx,%edx
 804aa6d:	0f 49 c2             	cmovns %edx,%eax
 804aa70:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804aa76:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
 804aa7d:	0f 85 68 03 00 00    	jne    804adeb <_svfprintf_r+0x1b8b>
 804aa83:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804aa89:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
 804aa8f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804aa96:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804aa9d:	00 00 00 
 804aaa0:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804aaa6:	e9 4d ea ff ff       	jmp    80494f8 <_svfprintf_r+0x298>
 804aaab:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804aab1:	89 44 24 08          	mov    %eax,0x8(%esp)
 804aab5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804aab8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aabc:	8b 45 08             	mov    0x8(%ebp),%eax
 804aabf:	89 04 24             	mov    %eax,(%esp)
 804aac2:	e8 09 62 00 00       	call   8050cd0 <__ssprint_r>
 804aac7:	85 c0                	test   %eax,%eax
 804aac9:	0f 85 61 e9 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804aacf:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804aad5:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804aad8:	e9 f2 f3 ff ff       	jmp    8049ecf <_svfprintf_r+0xc6f>
 804aadd:	89 d0                	mov    %edx,%eax
 804aadf:	e9 d1 fa ff ff       	jmp    804a5b5 <_svfprintf_r+0x1355>
 804aae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804aae8:	8d 50 01             	lea    0x1(%eax),%edx
 804aaeb:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
 804aaf1:	c6 00 30             	movb   $0x30,(%eax)
 804aaf4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804aafa:	39 c1                	cmp    %eax,%ecx
 804aafc:	77 ea                	ja     804aae8 <_svfprintf_r+0x1888>
 804aafe:	e9 fc fe ff ff       	jmp    804a9ff <_svfprintf_r+0x179f>
 804ab03:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab06:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 804ab0d:	00 
 804ab0e:	89 04 24             	mov    %eax,(%esp)
 804ab11:	e8 3a 49 00 00       	call   804f450 <_malloc_r>
 804ab16:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ab19:	85 c0                	test   %eax,%eax
 804ab1b:	89 02                	mov    %eax,(%edx)
 804ab1d:	89 42 10             	mov    %eax,0x10(%edx)
 804ab20:	0f 84 15 06 00 00    	je     804b13b <_svfprintf_r+0x1edb>
 804ab26:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab29:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
 804ab30:	e9 6c e7 ff ff       	jmp    80492a1 <_svfprintf_r+0x41>
 804ab35:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ab3b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab3f:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab42:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab46:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab49:	89 04 24             	mov    %eax,(%esp)
 804ab4c:	e8 7f 61 00 00       	call   8050cd0 <__ssprint_r>
 804ab51:	85 c0                	test   %eax,%eax
 804ab53:	0f 85 d7 e8 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804ab59:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ab5f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ab62:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804ab68:	e9 d9 fc ff ff       	jmp    804a846 <_svfprintf_r+0x15e6>
 804ab6d:	83 c0 01             	add    $0x1,%eax
 804ab70:	01 da                	add    %ebx,%edx
 804ab72:	c7 07 cc 47 05 08    	movl   $0x80547cc,(%edi)
 804ab78:	83 c7 08             	add    $0x8,%edi
 804ab7b:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804ab7e:	83 f8 07             	cmp    $0x7,%eax
 804ab81:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804ab87:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804ab8d:	7e 33                	jle    804abc2 <_svfprintf_r+0x1962>
 804ab8f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ab95:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab99:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab9c:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aba0:	8b 45 08             	mov    0x8(%ebp),%eax
 804aba3:	89 04 24             	mov    %eax,(%esp)
 804aba6:	e8 25 61 00 00       	call   8050cd0 <__ssprint_r>
 804abab:	85 c0                	test   %eax,%eax
 804abad:	0f 85 7d e8 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804abb3:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804abb9:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804abbc:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804abc2:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
 804abc8:	83 c0 01             	add    $0x1,%eax
 804abcb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804abd1:	89 1f                	mov    %ebx,(%edi)
 804abd3:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804abd9:	01 da                	add    %ebx,%edx
 804abdb:	83 f8 07             	cmp    $0x7,%eax
 804abde:	89 5f 04             	mov    %ebx,0x4(%edi)
 804abe1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804abe7:	0f 8f 86 f5 ff ff    	jg     804a173 <_svfprintf_r+0xf13>
 804abed:	83 c7 08             	add    $0x8,%edi
 804abf0:	89 d1                	mov    %edx,%ecx
 804abf2:	e9 15 f1 ff ff       	jmp    8049d0c <_svfprintf_r+0xaac>
 804abf7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804abfd:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac01:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac04:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac08:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac0b:	89 04 24             	mov    %eax,(%esp)
 804ac0e:	e8 bd 60 00 00       	call   8050cd0 <__ssprint_r>
 804ac13:	85 c0                	test   %eax,%eax
 804ac15:	0f 85 15 e8 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804ac1b:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ac21:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ac24:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804ac2a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804ac30:	e9 62 fc ff ff       	jmp    804a897 <_svfprintf_r+0x1637>
 804ac35:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
 804ac3c:	00 00 00 
 804ac3f:	e9 07 fd ff ff       	jmp    804a94b <_svfprintf_r+0x16eb>
 804ac44:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804ac4a:	89 04 24             	mov    %eax,(%esp)
 804ac4d:	e8 8e e5 ff ff       	call   80491e0 <strlen>
 804ac52:	e9 6a e8 ff ff       	jmp    80494c1 <_svfprintf_r+0x261>
 804ac57:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ac5d:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac61:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac64:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac68:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac6b:	89 04 24             	mov    %eax,(%esp)
 804ac6e:	e8 5d 60 00 00       	call   8050cd0 <__ssprint_r>
 804ac73:	85 c0                	test   %eax,%eax
 804ac75:	0f 85 b5 e7 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804ac7b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804ac81:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ac84:	e9 76 f6 ff ff       	jmp    804a2ff <_svfprintf_r+0x109f>
 804ac89:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ac8f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac93:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac96:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac9a:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac9d:	89 04 24             	mov    %eax,(%esp)
 804aca0:	e8 2b 60 00 00       	call   8050cd0 <__ssprint_r>
 804aca5:	85 c0                	test   %eax,%eax
 804aca7:	0f 85 83 e7 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804acad:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804acb3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804acb6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804acbc:	e9 f4 f8 ff ff       	jmp    804a5b5 <_svfprintf_r+0x1355>
 804acc1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804acc7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804accb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804acce:	89 44 24 04          	mov    %eax,0x4(%esp)
 804acd2:	8b 45 08             	mov    0x8(%ebp),%eax
 804acd5:	89 04 24             	mov    %eax,(%esp)
 804acd8:	e8 f3 5f 00 00       	call   8050cd0 <__ssprint_r>
 804acdd:	85 c0                	test   %eax,%eax
 804acdf:	0f 85 4b e7 ff ff    	jne    8049430 <_svfprintf_r+0x1d0>
 804ace5:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804aceb:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804acee:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
 804acf4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804acfa:	e9 fa f8 ff ff       	jmp    804a5f9 <_svfprintf_r+0x1399>
 804acff:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804ad05:	b0 06                	mov    $0x6,%al
 804ad07:	89 75 14             	mov    %esi,0x14(%ebp)
 804ad0a:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ad11:	00 00 00 
 804ad14:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ad1b:	00 00 00 
 804ad1e:	83 fa 06             	cmp    $0x6,%edx
 804ad21:	0f 46 c2             	cmovbe %edx,%eax
 804ad24:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804ad2a:	85 c0                	test   %eax,%eax
 804ad2c:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804ad32:	c7 85 28 ff ff ff 5e 	movl   $0x805465e,-0xd8(%ebp)
 804ad39:	46 05 08 
 804ad3c:	0f 49 d0             	cmovns %eax,%edx
 804ad3f:	31 db                	xor    %ebx,%ebx
 804ad41:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
 804ad47:	e9 b7 e7 ff ff       	jmp    8049503 <_svfprintf_r+0x2a3>
 804ad4c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804ad53:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804ad58:	e9 9d ea ff ff       	jmp    80497fa <_svfprintf_r+0x59a>
 804ad5d:	ba 03 00 00 00       	mov    $0x3,%edx
 804ad62:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804ad68:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804ad6c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804ad72:	89 44 24 18          	mov    %eax,0x18(%esp)
 804ad76:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804ad7c:	89 44 24 14          	mov    %eax,0x14(%esp)
 804ad80:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804ad86:	dd 54 24 04          	fstl   0x4(%esp)
 804ad8a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ad8e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804ad94:	89 44 24 10          	mov    %eax,0x10(%esp)
 804ad98:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad9b:	89 04 24             	mov    %eax,(%esp)
 804ad9e:	e8 3d 27 00 00       	call   804d4e0 <_dtoa_r>
 804ada3:	83 fb 47             	cmp    $0x47,%ebx
 804ada6:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804adac:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804adb2:	75 09                	jne    804adbd <_svfprintf_r+0x1b5d>
 804adb4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804adbb:	74 5b                	je     804ae18 <_svfprintf_r+0x1bb8>
 804adbd:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804adc3:	89 f0                	mov    %esi,%eax
 804adc5:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
 804adcb:	01 d1                	add    %edx,%ecx
 804adcd:	84 c0                	test   %al,%al
 804adcf:	0f 84 14 fc ff ff    	je     804a9e9 <_svfprintf_r+0x1789>
 804add5:	80 3a 30             	cmpb   $0x30,(%edx)
 804add8:	0f 84 37 02 00 00    	je     804b015 <_svfprintf_r+0x1db5>
 804adde:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804ade4:	01 c1                	add    %eax,%ecx
 804ade6:	e9 fe fb ff ff       	jmp    804a9e9 <_svfprintf_r+0x1789>
 804adeb:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804adf1:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
 804adf7:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804adfc:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804ae03:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ae0a:	00 00 00 
 804ae0d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804ae13:	e9 e4 e6 ff ff       	jmp    80494fc <_svfprintf_r+0x29c>
 804ae18:	dd d8                	fstp   %st(0)
 804ae1a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804ae20:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804ae26:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804ae2c:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
 804ae32:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804ae38:	83 f8 fd             	cmp    $0xfffffffd,%eax
 804ae3b:	7c 48                	jl     804ae85 <_svfprintf_r+0x1c25>
 804ae3d:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
 804ae43:	7c 40                	jl     804ae85 <_svfprintf_r+0x1c25>
 804ae45:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804ae4b:	e9 ea fb ff ff       	jmp    804aa3a <_svfprintf_r+0x17da>
 804ae50:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804ae56:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804ae5d:	89 75 14             	mov    %esi,0x14(%ebp)
 804ae60:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ae67:	00 00 00 
 804ae6a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804ae70:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804ae76:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ae7d:	00 00 00 
 804ae80:	e9 73 e6 ff ff       	jmp    80494f8 <_svfprintf_r+0x298>
 804ae85:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
 804ae8c:	8d 48 ff             	lea    -0x1(%eax),%ecx
 804ae8f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
 804ae96:	85 c9                	test   %ecx,%ecx
 804ae98:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 804ae9e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
 804aea4:	0f 88 2c 02 00 00    	js     804b0d6 <_svfprintf_r+0x1e76>
 804aeaa:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
 804aeb1:	83 f9 09             	cmp    $0x9,%ecx
 804aeb4:	0f 8f ea 00 00 00    	jg     804afa4 <_svfprintf_r+0x1d44>
 804aeba:	83 c1 30             	add    $0x30,%ecx
 804aebd:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
 804aec4:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
 804aeca:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
 804aed0:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804aed6:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
 804aedc:	29 d0                	sub    %edx,%eax
 804aede:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
 804aee4:	89 da                	mov    %ebx,%edx
 804aee6:	01 c2                	add    %eax,%edx
 804aee8:	83 fb 01             	cmp    $0x1,%ebx
 804aeeb:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804aef1:	0f 8e 21 02 00 00    	jle    804b118 <_svfprintf_r+0x1eb8>
 804aef7:	31 c0                	xor    %eax,%eax
 804aef9:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
 804af00:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
 804af07:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804af0e:	00 00 00 
 804af11:	e9 60 fb ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804af16:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804af1c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804af23:	00 00 00 
 804af26:	e9 68 e4 ff ff       	jmp    8049393 <_svfprintf_r+0x133>
 804af2b:	ba 02 00 00 00       	mov    $0x2,%edx
 804af30:	e9 2d fe ff ff       	jmp    804ad62 <_svfprintf_r+0x1b02>
 804af35:	d9 e0                	fchs   
 804af37:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
 804af3e:	e9 38 fa ff ff       	jmp    804a97b <_svfprintf_r+0x171b>
 804af43:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
 804af49:	ba 01 00 00 00       	mov    $0x1,%edx
 804af4e:	85 c9                	test   %ecx,%ecx
 804af50:	0f 8e 5a 01 00 00    	jle    804b0b0 <_svfprintf_r+0x1e50>
 804af56:	31 c0                	xor    %eax,%eax
 804af58:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
 804af5e:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804af65:	00 00 00 
 804af68:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804af6e:	0f 49 c2             	cmovns %edx,%eax
 804af71:	e9 00 fb ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804af76:	85 c0                	test   %eax,%eax
 804af78:	0f 8e 06 01 00 00    	jle    804b084 <_svfprintf_r+0x1e24>
 804af7e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804af84:	85 f6                	test   %esi,%esi
 804af86:	0f 85 d4 00 00 00    	jne    804b060 <_svfprintf_r+0x1e00>
 804af8c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804af93:	0f 85 c7 00 00 00    	jne    804b060 <_svfprintf_r+0x1e00>
 804af99:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804af9f:	e9 d2 fa ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804afa4:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
 804afaa:	89 f3                	mov    %esi,%ebx
 804afac:	b8 67 66 66 66       	mov    $0x66666667,%eax
 804afb1:	83 eb 01             	sub    $0x1,%ebx
 804afb4:	f7 e9                	imul   %ecx
 804afb6:	89 c8                	mov    %ecx,%eax
 804afb8:	c1 f8 1f             	sar    $0x1f,%eax
 804afbb:	c1 fa 02             	sar    $0x2,%edx
 804afbe:	29 c2                	sub    %eax,%edx
 804afc0:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804afc3:	01 c0                	add    %eax,%eax
 804afc5:	29 c1                	sub    %eax,%ecx
 804afc7:	83 fa 09             	cmp    $0x9,%edx
 804afca:	8d 41 30             	lea    0x30(%ecx),%eax
 804afcd:	89 d1                	mov    %edx,%ecx
 804afcf:	88 03                	mov    %al,(%ebx)
 804afd1:	7f d9                	jg     804afac <_svfprintf_r+0x1d4c>
 804afd3:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804afd6:	83 c1 30             	add    $0x30,%ecx
 804afd9:	39 f0                	cmp    %esi,%eax
 804afdb:	88 4b ff             	mov    %cl,-0x1(%ebx)
 804afde:	0f 83 6a 01 00 00    	jae    804b14e <_svfprintf_r+0x1eee>
 804afe4:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804afea:	eb 07                	jmp    804aff3 <_svfprintf_r+0x1d93>
 804afec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804aff0:	0f b6 08             	movzbl (%eax),%ecx
 804aff3:	83 c0 01             	add    $0x1,%eax
 804aff6:	83 c2 01             	add    $0x1,%edx
 804aff9:	39 f0                	cmp    %esi,%eax
 804affb:	88 4a ff             	mov    %cl,-0x1(%edx)
 804affe:	75 f0                	jne    804aff0 <_svfprintf_r+0x1d90>
 804b000:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804b006:	29 d8                	sub    %ebx,%eax
 804b008:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804b00e:	01 d0                	add    %edx,%eax
 804b010:	e9 bb fe ff ff       	jmp    804aed0 <_svfprintf_r+0x1c70>
 804b015:	d9 ee                	fldz   
 804b017:	d9 c9                	fxch   %st(1)
 804b019:	db e9                	fucomi %st(1),%st
 804b01b:	dd d9                	fstp   %st(1)
 804b01d:	7a 06                	jp     804b025 <_svfprintf_r+0x1dc5>
 804b01f:	0f 84 b9 fd ff ff    	je     804adde <_svfprintf_r+0x1b7e>
 804b025:	b8 01 00 00 00       	mov    $0x1,%eax
 804b02a:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 804b030:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
 804b036:	01 c1                	add    %eax,%ecx
 804b038:	e9 ac f9 ff ff       	jmp    804a9e9 <_svfprintf_r+0x1789>
 804b03d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804b043:	31 c0                	xor    %eax,%eax
 804b045:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804b04c:	00 00 00 
 804b04f:	83 c2 01             	add    $0x1,%edx
 804b052:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b058:	0f 49 c2             	cmovns %edx,%eax
 804b05b:	e9 16 fa ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804b060:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804b066:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b06c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
 804b070:	89 c2                	mov    %eax,%edx
 804b072:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804b078:	31 c0                	xor    %eax,%eax
 804b07a:	85 d2                	test   %edx,%edx
 804b07c:	0f 49 c2             	cmovns %edx,%eax
 804b07f:	e9 f2 f9 ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804b084:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804b08a:	85 db                	test   %ebx,%ebx
 804b08c:	75 2f                	jne    804b0bd <_svfprintf_r+0x1e5d>
 804b08e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804b095:	75 26                	jne    804b0bd <_svfprintf_r+0x1e5d>
 804b097:	b8 01 00 00 00       	mov    $0x1,%eax
 804b09c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804b0a3:	00 00 00 
 804b0a6:	e9 cb f9 ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804b0ab:	90                   	nop
 804b0ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b0b0:	b2 02                	mov    $0x2,%dl
 804b0b2:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
 804b0b8:	e9 99 fe ff ff       	jmp    804af56 <_svfprintf_r+0x1cf6>
 804b0bd:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b0c3:	31 c0                	xor    %eax,%eax
 804b0c5:	83 c2 02             	add    $0x2,%edx
 804b0c8:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b0ce:	0f 49 c2             	cmovns %edx,%eax
 804b0d1:	e9 a0 f9 ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804b0d6:	f7 d9                	neg    %ecx
 804b0d8:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
 804b0df:	e9 cd fd ff ff       	jmp    804aeb1 <_svfprintf_r+0x1c51>
 804b0e4:	8b 55 14             	mov    0x14(%ebp),%edx
 804b0e7:	8b 45 14             	mov    0x14(%ebp),%eax
 804b0ea:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b0f0:	8b 12                	mov    (%edx),%edx
 804b0f2:	83 c0 04             	add    $0x4,%eax
 804b0f5:	89 45 14             	mov    %eax,0x14(%ebp)
 804b0f8:	85 d2                	test   %edx,%edx
 804b0fa:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804b100:	0f 89 a9 e2 ff ff    	jns    80493af <_svfprintf_r+0x14f>
 804b106:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804b10d:	ff ff ff 
 804b110:	89 c8                	mov    %ecx,%eax
 804b112:	e9 76 e2 ff ff       	jmp    804938d <_svfprintf_r+0x12d>
 804b117:	90                   	nop
 804b118:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804b11e:	83 e0 01             	and    $0x1,%eax
 804b121:	0f 85 d0 fd ff ff    	jne    804aef7 <_svfprintf_r+0x1c97>
 804b127:	85 d2                	test   %edx,%edx
 804b129:	0f 49 c2             	cmovns %edx,%eax
 804b12c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b133:	00 00 00 
 804b136:	e9 3b f9 ff ff       	jmp    804aa76 <_svfprintf_r+0x1816>
 804b13b:	8b 45 08             	mov    0x8(%ebp),%eax
 804b13e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804b144:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804b149:	e9 f5 e2 ff ff       	jmp    8049443 <_svfprintf_r+0x1e3>
 804b14e:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
 804b154:	e9 77 fd ff ff       	jmp    804aed0 <_svfprintf_r+0x1c70>
 804b159:	66 90                	xchg   %ax,%ax
 804b15b:	66 90                	xchg   %ax,%ax
 804b15d:	66 90                	xchg   %ax,%ax
 804b15f:	90                   	nop

0804b160 <_vfprintf_r>:
 804b160:	55                   	push   %ebp
 804b161:	89 e5                	mov    %esp,%ebp
 804b163:	57                   	push   %edi
 804b164:	56                   	push   %esi
 804b165:	53                   	push   %ebx
 804b166:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
 804b16c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b16f:	89 04 24             	mov    %eax,(%esp)
 804b172:	e8 39 41 00 00       	call   804f2b0 <_localeconv_r>
 804b177:	8b 00                	mov    (%eax),%eax
 804b179:	89 04 24             	mov    %eax,(%esp)
 804b17c:	89 85 18 ff ff ff    	mov    %eax,-0xe8(%ebp)
 804b182:	e8 59 e0 ff ff       	call   80491e0 <strlen>
 804b187:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b18a:	85 db                	test   %ebx,%ebx
 804b18c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
 804b192:	74 0e                	je     804b1a2 <_vfprintf_r+0x42>
 804b194:	8b 45 08             	mov    0x8(%ebp),%eax
 804b197:	8b 48 38             	mov    0x38(%eax),%ecx
 804b19a:	85 c9                	test   %ecx,%ecx
 804b19c:	0f 84 56 02 00 00    	je     804b3f8 <_vfprintf_r+0x298>
 804b1a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b1a5:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b1a9:	f6 c4 20             	test   $0x20,%ah
 804b1ac:	75 11                	jne    804b1bf <_vfprintf_r+0x5f>
 804b1ae:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b1b1:	80 cc 20             	or     $0x20,%ah
 804b1b4:	81 62 64 ff df ff ff 	andl   $0xffffdfff,0x64(%edx)
 804b1bb:	66 89 42 0c          	mov    %ax,0xc(%edx)
 804b1bf:	a8 08                	test   $0x8,%al
 804b1c1:	0f 84 59 01 00 00    	je     804b320 <_vfprintf_r+0x1c0>
 804b1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b1ca:	8b 52 10             	mov    0x10(%edx),%edx
 804b1cd:	85 d2                	test   %edx,%edx
 804b1cf:	0f 84 4b 01 00 00    	je     804b320 <_vfprintf_r+0x1c0>
 804b1d5:	83 e0 1a             	and    $0x1a,%eax
 804b1d8:	66 83 f8 0a          	cmp    $0xa,%ax
 804b1dc:	0f 84 68 01 00 00    	je     804b34a <_vfprintf_r+0x1ea>
 804b1e2:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804b1e5:	8d 55 a7             	lea    -0x59(%ebp),%edx
 804b1e8:	89 c7                	mov    %eax,%edi
 804b1ea:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 804b1f0:	90                   	nop
 804b1f1:	90                   	nop
 804b1f2:	29 d0                	sub    %edx,%eax
 804b1f4:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 804b1fb:	00 00 00 
 804b1fe:	90                   	nop
 804b1ff:	90                   	nop
 804b200:	90                   	nop
 804b201:	90                   	nop
 804b202:	90                   	nop
 804b203:	90                   	nop
 804b204:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 804b20b:	00 00 00 
 804b20e:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
 804b215:	00 00 00 
 804b218:	c7 85 08 ff ff ff 00 	movl   $0x0,-0xf8(%ebp)
 804b21f:	00 00 00 
 804b222:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
 804b229:	00 00 00 
 804b22c:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
 804b233:	00 00 00 
 804b236:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
 804b23c:	8b 45 10             	mov    0x10(%ebp),%eax
 804b23f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804b242:	0f b6 00             	movzbl (%eax),%eax
 804b245:	3c 25                	cmp    $0x25,%al
 804b247:	74 4c                	je     804b295 <_vfprintf_r+0x135>
 804b249:	84 c0                	test   %al,%al
 804b24b:	75 07                	jne    804b254 <_vfprintf_r+0xf4>
 804b24d:	eb 46                	jmp    804b295 <_vfprintf_r+0x135>
 804b24f:	90                   	nop
 804b250:	84 c0                	test   %al,%al
 804b252:	74 0a                	je     804b25e <_vfprintf_r+0xfe>
 804b254:	83 c3 01             	add    $0x1,%ebx
 804b257:	0f b6 03             	movzbl (%ebx),%eax
 804b25a:	3c 25                	cmp    $0x25,%al
 804b25c:	75 f2                	jne    804b250 <_vfprintf_r+0xf0>
 804b25e:	89 de                	mov    %ebx,%esi
 804b260:	2b 75 10             	sub    0x10(%ebp),%esi
 804b263:	74 30                	je     804b295 <_vfprintf_r+0x135>
 804b265:	8b 45 10             	mov    0x10(%ebp),%eax
 804b268:	83 c7 08             	add    $0x8,%edi
 804b26b:	89 77 fc             	mov    %esi,-0x4(%edi)
 804b26e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
 804b274:	89 47 f8             	mov    %eax,-0x8(%edi)
 804b277:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b27d:	83 c0 01             	add    $0x1,%eax
 804b280:	83 f8 07             	cmp    $0x7,%eax
 804b283:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b289:	0f 8f f9 00 00 00    	jg     804b388 <_vfprintf_r+0x228>
 804b28f:	01 b5 28 ff ff ff    	add    %esi,-0xd8(%ebp)
 804b295:	80 3b 00             	cmpb   $0x0,(%ebx)
 804b298:	0f 84 12 01 00 00    	je     804b3b0 <_vfprintf_r+0x250>
 804b29e:	8d 43 01             	lea    0x1(%ebx),%eax
 804b2a1:	be 20 00 00 00       	mov    $0x20,%esi
 804b2a6:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b2ad:	31 db                	xor    %ebx,%ebx
 804b2af:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804b2b6:	ff ff ff 
 804b2b9:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804b2c0:	00 00 00 
 804b2c3:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
 804b2ca:	00 00 00 
 804b2cd:	8d 48 01             	lea    0x1(%eax),%ecx
 804b2d0:	0f be 00             	movsbl (%eax),%eax
 804b2d3:	8d 50 e0             	lea    -0x20(%eax),%edx
 804b2d6:	83 fa 58             	cmp    $0x58,%edx
 804b2d9:	0f 87 f2 07 00 00    	ja     804bad1 <_vfprintf_r+0x971>
 804b2df:	ff 24 95 ec 47 05 08 	jmp    *0x80547ec(,%edx,4)
 804b2e6:	66 90                	xchg   %ax,%ax
 804b2e8:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b2ef:	89 c8                	mov    %ecx,%eax
 804b2f1:	eb da                	jmp    804b2cd <_vfprintf_r+0x16d>
 804b2f3:	8b 45 14             	mov    0x14(%ebp),%eax
 804b2f6:	8b 55 14             	mov    0x14(%ebp),%edx
 804b2f9:	8b 00                	mov    (%eax),%eax
 804b2fb:	83 c2 04             	add    $0x4,%edx
 804b2fe:	89 55 14             	mov    %edx,0x14(%ebp)
 804b301:	85 c0                	test   %eax,%eax
 804b303:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
 804b309:	79 e4                	jns    804b2ef <_vfprintf_r+0x18f>
 804b30b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
 804b311:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
 804b318:	89 c8                	mov    %ecx,%eax
 804b31a:	eb b1                	jmp    804b2cd <_vfprintf_r+0x16d>
 804b31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b320:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b323:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b327:	8b 45 08             	mov    0x8(%ebp),%eax
 804b32a:	89 04 24             	mov    %eax,(%esp)
 804b32d:	e8 ae 1e 00 00       	call   804d1e0 <__swsetup_r>
 804b332:	85 c0                	test   %eax,%eax
 804b334:	75 42                	jne    804b378 <_vfprintf_r+0x218>
 804b336:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b339:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b33d:	83 e0 1a             	and    $0x1a,%eax
 804b340:	66 83 f8 0a          	cmp    $0xa,%ax
 804b344:	0f 85 98 fe ff ff    	jne    804b1e2 <_vfprintf_r+0x82>
 804b34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b34d:	66 83 78 0e 00       	cmpw   $0x0,0xe(%eax)
 804b352:	0f 88 8a fe ff ff    	js     804b1e2 <_vfprintf_r+0x82>
 804b358:	8b 45 14             	mov    0x14(%ebp),%eax
 804b35b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804b35e:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b361:	89 04 24             	mov    %eax,(%esp)
 804b364:	8b 45 08             	mov    0x8(%ebp),%eax
 804b367:	e8 94 1d 00 00       	call   804d100 <__sbprintf>
 804b36c:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b372:	5b                   	pop    %ebx
 804b373:	5e                   	pop    %esi
 804b374:	5f                   	pop    %edi
 804b375:	5d                   	pop    %ebp
 804b376:	c3                   	ret    
 804b377:	90                   	nop
 804b378:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b37e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804b383:	5b                   	pop    %ebx
 804b384:	5e                   	pop    %esi
 804b385:	5f                   	pop    %edi
 804b386:	5d                   	pop    %ebp
 804b387:	c3                   	ret    
 804b388:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804b38e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b392:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b395:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b399:	8b 45 08             	mov    0x8(%ebp),%eax
 804b39c:	89 04 24             	mov    %eax,(%esp)
 804b39f:	e8 1c 6a 00 00       	call   8051dc0 <__sprint_r>
 804b3a4:	85 c0                	test   %eax,%eax
 804b3a6:	75 30                	jne    804b3d8 <_vfprintf_r+0x278>
 804b3a8:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804b3ab:	e9 df fe ff ff       	jmp    804b28f <_vfprintf_r+0x12f>
 804b3b0:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 804b3b6:	85 c0                	test   %eax,%eax
 804b3b8:	74 1e                	je     804b3d8 <_vfprintf_r+0x278>
 804b3ba:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804b3c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b3c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b3c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 804b3ce:	89 04 24             	mov    %eax,(%esp)
 804b3d1:	e8 ea 69 00 00       	call   8051dc0 <__sprint_r>
 804b3d6:	66 90                	xchg   %ax,%ax
 804b3d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b3db:	f6 40 0c 40          	testb  $0x40,0xc(%eax)
 804b3df:	75 97                	jne    804b378 <_vfprintf_r+0x218>
 804b3e1:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804b3e7:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b3ed:	5b                   	pop    %ebx
 804b3ee:	5e                   	pop    %esi
 804b3ef:	5f                   	pop    %edi
 804b3f0:	5d                   	pop    %ebp
 804b3f1:	c3                   	ret    
 804b3f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b3f8:	89 04 24             	mov    %eax,(%esp)
 804b3fb:	e8 50 36 00 00       	call   804ea50 <__sinit>
 804b400:	e9 9d fd ff ff       	jmp    804b1a2 <_vfprintf_r+0x42>
 804b405:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 804b40a:	89 c8                	mov    %ecx,%eax
 804b40c:	e9 bc fe ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804b411:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b417:	8b 45 14             	mov    0x14(%ebp),%eax
 804b41a:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b41d:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b424:	8d 70 04             	lea    0x4(%eax),%esi
 804b427:	8b 00                	mov    (%eax),%eax
 804b429:	85 c0                	test   %eax,%eax
 804b42b:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b431:	0f 84 0a 18 00 00    	je     804cc41 <_vfprintf_r+0x1ae1>
 804b437:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b43d:	85 c0                	test   %eax,%eax
 804b43f:	0f 88 41 17 00 00    	js     804cb86 <_vfprintf_r+0x1a26>
 804b445:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b449:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804b44f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804b456:	00 
 804b457:	89 04 24             	mov    %eax,(%esp)
 804b45a:	e8 31 47 00 00       	call   804fb90 <memchr>
 804b45f:	85 c0                	test   %eax,%eax
 804b461:	0f 84 2b 19 00 00    	je     804cd92 <_vfprintf_r+0x1c32>
 804b467:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b46d:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804b473:	39 d0                	cmp    %edx,%eax
 804b475:	0f 4f c2             	cmovg  %edx,%eax
 804b478:	89 c2                	mov    %eax,%edx
 804b47a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b481:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804b487:	31 c0                	xor    %eax,%eax
 804b489:	85 d2                	test   %edx,%edx
 804b48b:	0f 49 c2             	cmovns %edx,%eax
 804b48e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b494:	89 75 14             	mov    %esi,0x14(%ebp)
 804b497:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804b49e:	00 00 00 
 804b4a1:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b4a8:	00 00 00 
 804b4ab:	90                   	nop
 804b4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b4b0:	84 db                	test   %bl,%bl
 804b4b2:	74 07                	je     804b4bb <_vfprintf_r+0x35b>
 804b4b4:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
 804b4bb:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b4c1:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804b4c7:	89 c8                	mov    %ecx,%eax
 804b4c9:	89 f2                	mov    %esi,%edx
 804b4cb:	83 c0 02             	add    $0x2,%eax
 804b4ce:	83 e2 02             	and    $0x2,%edx
 804b4d1:	89 95 34 ff ff ff    	mov    %edx,-0xcc(%ebp)
 804b4d7:	89 f2                	mov    %esi,%edx
 804b4d9:	0f 44 c1             	cmove  %ecx,%eax
 804b4dc:	81 e2 84 00 00 00    	and    $0x84,%edx
 804b4e2:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b4e8:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
 804b4ee:	0f 85 1c 06 00 00    	jne    804bb10 <_vfprintf_r+0x9b0>
 804b4f4:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804b4fa:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804b500:	85 f6                	test   %esi,%esi
 804b502:	0f 8e 08 06 00 00    	jle    804bb10 <_vfprintf_r+0x9b0>
 804b508:	83 fe 10             	cmp    $0x10,%esi
 804b50b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804b511:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b517:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804b51d:	7f 11                	jg     804b530 <_vfprintf_r+0x3d0>
 804b51f:	eb 6b                	jmp    804b58c <_vfprintf_r+0x42c>
 804b521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804b528:	83 ee 10             	sub    $0x10,%esi
 804b52b:	83 fe 10             	cmp    $0x10,%esi
 804b52e:	7e 5c                	jle    804b58c <_vfprintf_r+0x42c>
 804b530:	83 c0 01             	add    $0x1,%eax
 804b533:	83 c1 10             	add    $0x10,%ecx
 804b536:	c7 07 60 49 05 08    	movl   $0x8054960,(%edi)
 804b53c:	83 c7 08             	add    $0x8,%edi
 804b53f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804b546:	83 f8 07             	cmp    $0x7,%eax
 804b549:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804b54f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b555:	7e d1                	jle    804b528 <_vfprintf_r+0x3c8>
 804b557:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b55a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804b55e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b562:	8b 45 08             	mov    0x8(%ebp),%eax
 804b565:	89 04 24             	mov    %eax,(%esp)
 804b568:	e8 53 68 00 00       	call   8051dc0 <__sprint_r>
 804b56d:	85 c0                	test   %eax,%eax
 804b56f:	0f 85 63 fe ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804b575:	83 ee 10             	sub    $0x10,%esi
 804b578:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804b57e:	83 fe 10             	cmp    $0x10,%esi
 804b581:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b587:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804b58a:	7f a4                	jg     804b530 <_vfprintf_r+0x3d0>
 804b58c:	83 c0 01             	add    $0x1,%eax
 804b58f:	01 f1                	add    %esi,%ecx
 804b591:	83 f8 07             	cmp    $0x7,%eax
 804b594:	c7 07 60 49 05 08    	movl   $0x8054960,(%edi)
 804b59a:	89 77 04             	mov    %esi,0x4(%edi)
 804b59d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804b5a3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b5a9:	0f 8f 16 0e 00 00    	jg     804c3c5 <_vfprintf_r+0x1265>
 804b5af:	83 c7 08             	add    $0x8,%edi
 804b5b2:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b5b9:	e9 58 05 00 00       	jmp    804bb16 <_vfprintf_r+0x9b6>
 804b5be:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b5c5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b5cb:	8b 45 14             	mov    0x14(%ebp),%eax
 804b5ce:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b5d1:	0f 85 15 02 00 00    	jne    804b7ec <_vfprintf_r+0x68c>
 804b5d7:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b5de:	0f 84 08 02 00 00    	je     804b7ec <_vfprintf_r+0x68c>
 804b5e4:	0f b7 08             	movzwl (%eax),%ecx
 804b5e7:	83 c0 04             	add    $0x4,%eax
 804b5ea:	89 45 14             	mov    %eax,0x14(%ebp)
 804b5ed:	b8 01 00 00 00       	mov    $0x1,%eax
 804b5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b5f8:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b5ff:	31 db                	xor    %ebx,%ebx
 804b601:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804b607:	89 f2                	mov    %esi,%edx
 804b609:	80 e2 7f             	and    $0x7f,%dl
 804b60c:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
 804b613:	0f 48 d6             	cmovs  %esi,%edx
 804b616:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
 804b61c:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b622:	85 d2                	test   %edx,%edx
 804b624:	75 08                	jne    804b62e <_vfprintf_r+0x4ce>
 804b626:	85 c9                	test   %ecx,%ecx
 804b628:	0f 84 ea 08 00 00    	je     804bf18 <_vfprintf_r+0xdb8>
 804b62e:	3c 01                	cmp    $0x1,%al
 804b630:	0f 84 6a 0d 00 00    	je     804c3a0 <_vfprintf_r+0x1240>
 804b636:	3c 02                	cmp    $0x2,%al
 804b638:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804b63b:	0f 85 bf 0b 00 00    	jne    804c200 <_vfprintf_r+0x10a0>
 804b641:	8b b5 08 ff ff ff    	mov    -0xf8(%ebp),%esi
 804b647:	90                   	nop
 804b648:	89 ca                	mov    %ecx,%edx
 804b64a:	83 e8 01             	sub    $0x1,%eax
 804b64d:	83 e2 0f             	and    $0xf,%edx
 804b650:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
 804b654:	c1 e9 04             	shr    $0x4,%ecx
 804b657:	85 c9                	test   %ecx,%ecx
 804b659:	88 10                	mov    %dl,(%eax)
 804b65b:	75 eb                	jne    804b648 <_vfprintf_r+0x4e8>
 804b65d:	8d 55 a8             	lea    -0x58(%ebp),%edx
 804b660:	29 c2                	sub    %eax,%edx
 804b662:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b668:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b66e:	66 90                	xchg   %ax,%ax
 804b670:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b676:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
 804b67c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b683:	00 00 00 
 804b686:	39 c2                	cmp    %eax,%edx
 804b688:	0f 4d c2             	cmovge %edx,%eax
 804b68b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b691:	e9 1a fe ff ff       	jmp    804b4b0 <_vfprintf_r+0x350>
 804b696:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
 804b69d:	00 00 00 
 804b6a0:	89 c8                	mov    %ecx,%eax
 804b6a2:	e9 26 fc ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804b6a7:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804b6ad:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6b0:	31 ff                	xor    %edi,%edi
 804b6b2:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804b6b9:	00 00 00 
 804b6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b6c0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 804b6c3:	83 c1 01             	add    $0x1,%ecx
 804b6c6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
 804b6c9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
 804b6cd:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6d0:	83 fa 09             	cmp    $0x9,%edx
 804b6d3:	76 eb                	jbe    804b6c0 <_vfprintf_r+0x560>
 804b6d5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
 804b6db:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804b6e1:	e9 ed fb ff ff       	jmp    804b2d3 <_vfprintf_r+0x173>
 804b6e6:	8d 41 01             	lea    0x1(%ecx),%eax
 804b6e9:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b6ef:	0f be 01             	movsbl (%ecx),%eax
 804b6f2:	83 f8 2a             	cmp    $0x2a,%eax
 804b6f5:	0f 84 1e 19 00 00    	je     804d019 <_vfprintf_r+0x1eb9>
 804b6fb:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6fe:	31 c9                	xor    %ecx,%ecx
 804b700:	83 fa 09             	cmp    $0x9,%edx
 804b703:	0f 87 8d 17 00 00    	ja     804ce96 <_vfprintf_r+0x1d36>
 804b709:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
 804b70f:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804b715:	8d 76 00             	lea    0x0(%esi),%esi
 804b718:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 804b71b:	83 c7 01             	add    $0x1,%edi
 804b71e:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
 804b721:	0f be 47 ff          	movsbl -0x1(%edi),%eax
 804b725:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b728:	83 fa 09             	cmp    $0x9,%edx
 804b72b:	76 eb                	jbe    804b718 <_vfprintf_r+0x5b8>
 804b72d:	85 c9                	test   %ecx,%ecx
 804b72f:	89 ca                	mov    %ecx,%edx
 804b731:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804b736:	0f 48 d1             	cmovs  %ecx,%edx
 804b739:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804b73f:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 804b745:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b74b:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804b751:	e9 7d fb ff ff       	jmp    804b2d3 <_vfprintf_r+0x173>
 804b756:	8b 45 14             	mov    0x14(%ebp),%eax
 804b759:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b75c:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 804b763:	8b 08                	mov    (%eax),%ecx
 804b765:	83 c0 04             	add    $0x4,%eax
 804b768:	89 45 14             	mov    %eax,0x14(%ebp)
 804b76b:	b8 02 00 00 00       	mov    $0x2,%eax
 804b770:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 804b777:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
 804b77e:	c7 85 08 ff ff ff 4d 	movl   $0x805464d,-0xf8(%ebp)
 804b785:	46 05 08 
 804b788:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
 804b78f:	00 00 00 
 804b792:	e9 61 fe ff ff       	jmp    804b5f8 <_vfprintf_r+0x498>
 804b797:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b79e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b7a5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b7ab:	8b 45 14             	mov    0x14(%ebp),%eax
 804b7ae:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b7b1:	75 60                	jne    804b813 <_vfprintf_r+0x6b3>
 804b7b3:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b7ba:	74 57                	je     804b813 <_vfprintf_r+0x6b3>
 804b7bc:	0f b7 08             	movzwl (%eax),%ecx
 804b7bf:	83 c0 04             	add    $0x4,%eax
 804b7c2:	89 45 14             	mov    %eax,0x14(%ebp)
 804b7c5:	31 c0                	xor    %eax,%eax
 804b7c7:	e9 2c fe ff ff       	jmp    804b5f8 <_vfprintf_r+0x498>
 804b7cc:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b7d3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b7da:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b7e0:	8b 45 14             	mov    0x14(%ebp),%eax
 804b7e3:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b7e6:	0f 84 eb fd ff ff    	je     804b5d7 <_vfprintf_r+0x477>
 804b7ec:	8b 08                	mov    (%eax),%ecx
 804b7ee:	83 c0 04             	add    $0x4,%eax
 804b7f1:	89 45 14             	mov    %eax,0x14(%ebp)
 804b7f4:	b8 01 00 00 00       	mov    $0x1,%eax
 804b7f9:	e9 fa fd ff ff       	jmp    804b5f8 <_vfprintf_r+0x498>
 804b7fe:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b805:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b80b:	8b 45 14             	mov    0x14(%ebp),%eax
 804b80e:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b811:	74 a0                	je     804b7b3 <_vfprintf_r+0x653>
 804b813:	8b 08                	mov    (%eax),%ecx
 804b815:	83 c0 04             	add    $0x4,%eax
 804b818:	89 45 14             	mov    %eax,0x14(%ebp)
 804b81b:	31 c0                	xor    %eax,%eax
 804b81d:	e9 d6 fd ff ff       	jmp    804b5f8 <_vfprintf_r+0x498>
 804b822:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b829:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b830:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b836:	8b 45 14             	mov    0x14(%ebp),%eax
 804b839:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b83c:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b842:	0f 85 d3 01 00 00    	jne    804ba1b <_vfprintf_r+0x8bb>
 804b848:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b84f:	0f 84 c6 01 00 00    	je     804ba1b <_vfprintf_r+0x8bb>
 804b855:	0f bf 08             	movswl (%eax),%ecx
 804b858:	83 c0 04             	add    $0x4,%eax
 804b85b:	89 45 14             	mov    %eax,0x14(%ebp)
 804b85e:	85 c9                	test   %ecx,%ecx
 804b860:	0f 88 9b 0e 00 00    	js     804c701 <_vfprintf_r+0x15a1>
 804b866:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b86d:	b8 01 00 00 00       	mov    $0x1,%eax
 804b872:	e9 8a fd ff ff       	jmp    804b601 <_vfprintf_r+0x4a1>
 804b877:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
 804b87e:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b884:	8b 45 14             	mov    0x14(%ebp),%eax
 804b887:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b88a:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b890:	0f 84 2a 10 00 00    	je     804c8c0 <_vfprintf_r+0x1760>
 804b896:	db 28                	fldt   (%eax)
 804b898:	83 c0 0c             	add    $0xc,%eax
 804b89b:	89 45 14             	mov    %eax,0x14(%ebp)
 804b89e:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804b8a4:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804b8aa:	dd 1c 24             	fstpl  (%esp)
 804b8ad:	e8 fe 51 00 00       	call   8050ab0 <__fpclassifyd>
 804b8b2:	83 f8 01             	cmp    $0x1,%eax
 804b8b5:	0f 85 5e 0e 00 00    	jne    804c719 <_vfprintf_r+0x15b9>
 804b8bb:	90                   	nop
 804b8bc:	90                   	nop
 804b8bd:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804b8c3:	d9 c9                	fxch   %st(1)
 804b8c5:	df e9                	fucomip %st(1),%st
 804b8c7:	dd d8                	fstp   %st(0)
 804b8c9:	0f 87 4d 14 00 00    	ja     804cd1c <_vfprintf_r+0x1bbc>
 804b8cf:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b8d6:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804b8dd:	ba 2c 46 05 08       	mov    $0x805462c,%edx
 804b8e2:	b8 30 46 05 08       	mov    $0x8054630,%eax
 804b8e7:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804b8ee:	00 00 00 
 804b8f1:	0f 4e c2             	cmovle %edx,%eax
 804b8f4:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b8fa:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804b901:	ff ff ff 
 804b904:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804b90b:	00 00 00 
 804b90e:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804b915:	00 00 00 
 804b918:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b91f:	00 00 00 
 804b922:	e9 89 fb ff ff       	jmp    804b4b0 <_vfprintf_r+0x350>
 804b927:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
 804b92e:	89 c8                	mov    %ecx,%eax
 804b930:	e9 98 f9 ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804b935:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b93c:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b942:	8b 45 14             	mov    0x14(%ebp),%eax
 804b945:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b948:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b94e:	c7 85 08 ff ff ff 4d 	movl   $0x805464d,-0xf8(%ebp)
 804b955:	46 05 08 
 804b958:	0f 85 0d 01 00 00    	jne    804ba6b <_vfprintf_r+0x90b>
 804b95e:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b965:	0f 84 00 01 00 00    	je     804ba6b <_vfprintf_r+0x90b>
 804b96b:	0f b7 08             	movzwl (%eax),%ecx
 804b96e:	83 c0 04             	add    $0x4,%eax
 804b971:	89 45 14             	mov    %eax,0x14(%ebp)
 804b974:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804b97b:	b8 02 00 00 00       	mov    $0x2,%eax
 804b980:	0f 84 72 fc ff ff    	je     804b5f8 <_vfprintf_r+0x498>
 804b986:	85 c9                	test   %ecx,%ecx
 804b988:	0f 84 6a fc ff ff    	je     804b5f8 <_vfprintf_r+0x498>
 804b98e:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
 804b995:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 804b99c:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 804b9a3:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
 804b9a9:	e9 4a fc ff ff       	jmp    804b5f8 <_vfprintf_r+0x498>
 804b9ae:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b9b5:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b9b8:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b9be:	0f 85 30 01 00 00    	jne    804baf4 <_vfprintf_r+0x994>
 804b9c4:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b9cb:	0f 84 23 01 00 00    	je     804baf4 <_vfprintf_r+0x994>
 804b9d1:	8b 45 14             	mov    0x14(%ebp),%eax
 804b9d4:	0f b7 95 28 ff ff ff 	movzwl -0xd8(%ebp),%edx
 804b9db:	8b 00                	mov    (%eax),%eax
 804b9dd:	66 89 10             	mov    %dx,(%eax)
 804b9e0:	8b 45 14             	mov    0x14(%ebp),%eax
 804b9e3:	83 c0 04             	add    $0x4,%eax
 804b9e6:	89 45 14             	mov    %eax,0x14(%ebp)
 804b9e9:	e9 4e f8 ff ff       	jmp    804b23c <_vfprintf_r+0xdc>
 804b9ee:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
 804b9f5:	89 c8                	mov    %ecx,%eax
 804b9f7:	e9 d1 f8 ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804b9fc:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804ba03:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804ba09:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba0c:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804ba0f:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804ba15:	0f 84 2d fe ff ff    	je     804b848 <_vfprintf_r+0x6e8>
 804ba1b:	8b 08                	mov    (%eax),%ecx
 804ba1d:	83 c0 04             	add    $0x4,%eax
 804ba20:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba23:	e9 36 fe ff ff       	jmp    804b85e <_vfprintf_r+0x6fe>
 804ba28:	84 db                	test   %bl,%bl
 804ba2a:	89 c8                	mov    %ecx,%eax
 804ba2c:	0f 44 de             	cmove  %esi,%ebx
 804ba2f:	e9 99 f8 ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804ba34:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
 804ba3b:	89 c8                	mov    %ecx,%eax
 804ba3d:	e9 8b f8 ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804ba42:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804ba49:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804ba4f:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba52:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804ba55:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804ba5b:	c7 85 08 ff ff ff 3c 	movl   $0x805463c,-0xf8(%ebp)
 804ba62:	46 05 08 
 804ba65:	0f 84 f3 fe ff ff    	je     804b95e <_vfprintf_r+0x7fe>
 804ba6b:	8b 08                	mov    (%eax),%ecx
 804ba6d:	83 c0 04             	add    $0x4,%eax
 804ba70:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba73:	e9 fc fe ff ff       	jmp    804b974 <_vfprintf_r+0x814>
 804ba78:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804ba7e:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba81:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804ba84:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804ba8b:	8b 00                	mov    (%eax),%eax
 804ba8d:	88 45 80             	mov    %al,-0x80(%ebp)
 804ba90:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba93:	83 c0 04             	add    $0x4,%eax
 804ba96:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba99:	8d 45 80             	lea    -0x80(%ebp),%eax
 804ba9c:	31 db                	xor    %ebx,%ebx
 804ba9e:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
 804baa5:	00 00 00 
 804baa8:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804baaf:	00 00 00 
 804bab2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804bab9:	00 00 00 
 804babc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804bac3:	00 00 00 
 804bac6:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804bacc:	e9 ea f9 ff ff       	jmp    804b4bb <_vfprintf_r+0x35b>
 804bad1:	85 c0                	test   %eax,%eax
 804bad3:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804bad9:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804badc:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804bae2:	0f 84 c8 f8 ff ff    	je     804b3b0 <_vfprintf_r+0x250>
 804bae8:	88 45 80             	mov    %al,-0x80(%ebp)
 804baeb:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804baf2:	eb a5                	jmp    804ba99 <_vfprintf_r+0x939>
 804baf4:	8b 45 14             	mov    0x14(%ebp),%eax
 804baf7:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804bafd:	8b 00                	mov    (%eax),%eax
 804baff:	89 10                	mov    %edx,(%eax)
 804bb01:	8b 45 14             	mov    0x14(%ebp),%eax
 804bb04:	83 c0 04             	add    $0x4,%eax
 804bb07:	89 45 14             	mov    %eax,0x14(%ebp)
 804bb0a:	e9 2d f7 ff ff       	jmp    804b23c <_vfprintf_r+0xdc>
 804bb0f:	90                   	nop
 804bb10:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bb16:	84 db                	test   %bl,%bl
 804bb18:	74 33                	je     804bb4d <_vfprintf_r+0x9ed>
 804bb1a:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
 804bb20:	83 c1 01             	add    $0x1,%ecx
 804bb23:	89 07                	mov    %eax,(%edi)
 804bb25:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bb2b:	83 c7 08             	add    $0x8,%edi
 804bb2e:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804bb35:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bb3b:	83 c0 01             	add    $0x1,%eax
 804bb3e:	83 f8 07             	cmp    $0x7,%eax
 804bb41:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bb47:	0f 8f 43 06 00 00    	jg     804c190 <_vfprintf_r+0x1030>
 804bb4d:	8b 9d 34 ff ff ff    	mov    -0xcc(%ebp),%ebx
 804bb53:	85 db                	test   %ebx,%ebx
 804bb55:	74 33                	je     804bb8a <_vfprintf_r+0xa2a>
 804bb57:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
 804bb5d:	83 c1 02             	add    $0x2,%ecx
 804bb60:	89 07                	mov    %eax,(%edi)
 804bb62:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bb68:	83 c7 08             	add    $0x8,%edi
 804bb6b:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
 804bb72:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bb78:	83 c0 01             	add    $0x1,%eax
 804bb7b:	83 f8 07             	cmp    $0x7,%eax
 804bb7e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bb84:	0f 8f 3e 06 00 00    	jg     804c1c8 <_vfprintf_r+0x1068>
 804bb8a:	81 bd 30 ff ff ff 80 	cmpl   $0x80,-0xd0(%ebp)
 804bb91:	00 00 00 
 804bb94:	0f 84 c6 03 00 00    	je     804bf60 <_vfprintf_r+0xe00>
 804bb9a:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804bba0:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
 804bba6:	85 f6                	test   %esi,%esi
 804bba8:	0f 8e d2 00 00 00    	jle    804bc80 <_vfprintf_r+0xb20>
 804bbae:	83 fe 10             	cmp    $0x10,%esi
 804bbb1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bbb7:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bbbd:	7f 11                	jg     804bbd0 <_vfprintf_r+0xa70>
 804bbbf:	eb 6b                	jmp    804bc2c <_vfprintf_r+0xacc>
 804bbc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804bbc8:	83 ee 10             	sub    $0x10,%esi
 804bbcb:	83 fe 10             	cmp    $0x10,%esi
 804bbce:	7e 5c                	jle    804bc2c <_vfprintf_r+0xacc>
 804bbd0:	83 c0 01             	add    $0x1,%eax
 804bbd3:	83 c1 10             	add    $0x10,%ecx
 804bbd6:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804bbdc:	83 c7 08             	add    $0x8,%edi
 804bbdf:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bbe6:	83 f8 07             	cmp    $0x7,%eax
 804bbe9:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bbef:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bbf5:	7e d1                	jle    804bbc8 <_vfprintf_r+0xa68>
 804bbf7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bbfa:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bbfe:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bc02:	8b 45 08             	mov    0x8(%ebp),%eax
 804bc05:	89 04 24             	mov    %eax,(%esp)
 804bc08:	e8 b3 61 00 00       	call   8051dc0 <__sprint_r>
 804bc0d:	85 c0                	test   %eax,%eax
 804bc0f:	0f 85 c3 f7 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bc15:	83 ee 10             	sub    $0x10,%esi
 804bc18:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bc1e:	83 fe 10             	cmp    $0x10,%esi
 804bc21:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bc27:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bc2a:	7f a4                	jg     804bbd0 <_vfprintf_r+0xa70>
 804bc2c:	83 c0 01             	add    $0x1,%eax
 804bc2f:	01 f1                	add    %esi,%ecx
 804bc31:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804bc37:	83 c7 08             	add    $0x8,%edi
 804bc3a:	89 77 fc             	mov    %esi,-0x4(%edi)
 804bc3d:	83 f8 07             	cmp    $0x7,%eax
 804bc40:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bc46:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bc4c:	7e 32                	jle    804bc80 <_vfprintf_r+0xb20>
 804bc4e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804bc54:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bc58:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bc5b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bc5f:	8b 45 08             	mov    0x8(%ebp),%eax
 804bc62:	89 04 24             	mov    %eax,(%esp)
 804bc65:	e8 56 61 00 00       	call   8051dc0 <__sprint_r>
 804bc6a:	85 c0                	test   %eax,%eax
 804bc6c:	0f 85 66 f7 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bc72:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bc78:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bc7b:	90                   	nop
 804bc7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804bc80:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
 804bc87:	01 00 00 
 804bc8a:	0f 85 50 01 00 00    	jne    804bde0 <_vfprintf_r+0xc80>
 804bc90:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804bc96:	89 07                	mov    %eax,(%edi)
 804bc98:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
 804bc9e:	01 c1                	add    %eax,%ecx
 804bca0:	89 47 04             	mov    %eax,0x4(%edi)
 804bca3:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bca9:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bcaf:	83 c0 01             	add    $0x1,%eax
 804bcb2:	83 f8 07             	cmp    $0x7,%eax
 804bcb5:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bcbb:	0f 8f 6a 04 00 00    	jg     804c12b <_vfprintf_r+0xfcb>
 804bcc1:	83 c7 08             	add    $0x8,%edi
 804bcc4:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
 804bccb:	0f 84 d7 00 00 00    	je     804bda8 <_vfprintf_r+0xc48>
 804bcd1:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804bcd7:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804bcdd:	85 f6                	test   %esi,%esi
 804bcdf:	0f 8e c3 00 00 00    	jle    804bda8 <_vfprintf_r+0xc48>
 804bce5:	83 fe 10             	cmp    $0x10,%esi
 804bce8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bcee:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bcf4:	7f 0a                	jg     804bd00 <_vfprintf_r+0xba0>
 804bcf6:	eb 64                	jmp    804bd5c <_vfprintf_r+0xbfc>
 804bcf8:	83 ee 10             	sub    $0x10,%esi
 804bcfb:	83 fe 10             	cmp    $0x10,%esi
 804bcfe:	7e 5c                	jle    804bd5c <_vfprintf_r+0xbfc>
 804bd00:	83 c0 01             	add    $0x1,%eax
 804bd03:	83 c1 10             	add    $0x10,%ecx
 804bd06:	c7 07 60 49 05 08    	movl   $0x8054960,(%edi)
 804bd0c:	83 c7 08             	add    $0x8,%edi
 804bd0f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bd16:	83 f8 07             	cmp    $0x7,%eax
 804bd19:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bd1f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bd25:	7e d1                	jle    804bcf8 <_vfprintf_r+0xb98>
 804bd27:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bd2a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bd2e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bd32:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd35:	89 04 24             	mov    %eax,(%esp)
 804bd38:	e8 83 60 00 00       	call   8051dc0 <__sprint_r>
 804bd3d:	85 c0                	test   %eax,%eax
 804bd3f:	0f 85 93 f6 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bd45:	83 ee 10             	sub    $0x10,%esi
 804bd48:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bd4e:	83 fe 10             	cmp    $0x10,%esi
 804bd51:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bd57:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bd5a:	7f a4                	jg     804bd00 <_vfprintf_r+0xba0>
 804bd5c:	83 c0 01             	add    $0x1,%eax
 804bd5f:	01 f1                	add    %esi,%ecx
 804bd61:	83 f8 07             	cmp    $0x7,%eax
 804bd64:	c7 07 60 49 05 08    	movl   $0x8054960,(%edi)
 804bd6a:	89 77 04             	mov    %esi,0x4(%edi)
 804bd6d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bd73:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bd79:	7e 2d                	jle    804bda8 <_vfprintf_r+0xc48>
 804bd7b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804bd81:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bd85:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bd88:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bd8c:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd8f:	89 04 24             	mov    %eax,(%esp)
 804bd92:	e8 29 60 00 00       	call   8051dc0 <__sprint_r>
 804bd97:	85 c0                	test   %eax,%eax
 804bd99:	0f 85 39 f6 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bd9f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bda5:	8d 76 00             	lea    0x0(%esi),%esi
 804bda8:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
 804bdae:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
 804bdb4:	39 c2                	cmp    %eax,%edx
 804bdb6:	0f 4d c2             	cmovge %edx,%eax
 804bdb9:	01 85 28 ff ff ff    	add    %eax,-0xd8(%ebp)
 804bdbf:	85 c9                	test   %ecx,%ecx
 804bdc1:	0f 85 99 03 00 00    	jne    804c160 <_vfprintf_r+0x1000>
 804bdc7:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 804bdce:	00 00 00 
 804bdd1:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bdd4:	e9 63 f4 ff ff       	jmp    804b23c <_vfprintf_r+0xdc>
 804bdd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804bde0:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804bde7:	0f 8e 5b 02 00 00    	jle    804c048 <_vfprintf_r+0xee8>
 804bded:	90                   	nop
 804bdee:	90                   	nop
 804bdef:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804bdf5:	df e9                	fucomip %st(1),%st
 804bdf7:	dd d8                	fstp   %st(0)
 804bdf9:	0f 8a 59 04 00 00    	jp     804c258 <_vfprintf_r+0x10f8>
 804bdff:	0f 85 53 04 00 00    	jne    804c258 <_vfprintf_r+0x10f8>
 804be05:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804be0b:	83 c1 01             	add    $0x1,%ecx
 804be0e:	83 c7 08             	add    $0x8,%edi
 804be11:	c7 47 f8 27 43 05 08 	movl   $0x8054327,-0x8(%edi)
 804be18:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804be1f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804be25:	83 c0 01             	add    $0x1,%eax
 804be28:	83 f8 07             	cmp    $0x7,%eax
 804be2b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804be31:	0f 8f 9c 0a 00 00    	jg     804c8d3 <_vfprintf_r+0x1773>
 804be37:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804be3d:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
 804be43:	7c 0d                	jl     804be52 <_vfprintf_r+0xcf2>
 804be45:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804be4c:	0f 84 72 fe ff ff    	je     804bcc4 <_vfprintf_r+0xb64>
 804be52:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804be58:	83 c7 08             	add    $0x8,%edi
 804be5b:	89 47 f8             	mov    %eax,-0x8(%edi)
 804be5e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804be64:	89 47 fc             	mov    %eax,-0x4(%edi)
 804be67:	01 c1                	add    %eax,%ecx
 804be69:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804be6f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804be75:	83 c0 01             	add    $0x1,%eax
 804be78:	83 f8 07             	cmp    $0x7,%eax
 804be7b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804be81:	0f 8f 43 0c 00 00    	jg     804caca <_vfprintf_r+0x196a>
 804be87:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804be8d:	8d 70 ff             	lea    -0x1(%eax),%esi
 804be90:	85 f6                	test   %esi,%esi
 804be92:	0f 8e 2c fe ff ff    	jle    804bcc4 <_vfprintf_r+0xb64>
 804be98:	83 fe 10             	cmp    $0x10,%esi
 804be9b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bea1:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bea7:	7f 13                	jg     804bebc <_vfprintf_r+0xd5c>
 804bea9:	e9 d4 05 00 00       	jmp    804c482 <_vfprintf_r+0x1322>
 804beae:	66 90                	xchg   %ax,%ax
 804beb0:	83 ee 10             	sub    $0x10,%esi
 804beb3:	83 fe 10             	cmp    $0x10,%esi
 804beb6:	0f 8e c6 05 00 00    	jle    804c482 <_vfprintf_r+0x1322>
 804bebc:	83 c0 01             	add    $0x1,%eax
 804bebf:	83 c1 10             	add    $0x10,%ecx
 804bec2:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804bec8:	83 c7 08             	add    $0x8,%edi
 804becb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bed2:	83 f8 07             	cmp    $0x7,%eax
 804bed5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bedb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bee1:	7e cd                	jle    804beb0 <_vfprintf_r+0xd50>
 804bee3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bee6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804beea:	89 44 24 04          	mov    %eax,0x4(%esp)
 804beee:	8b 45 08             	mov    0x8(%ebp),%eax
 804bef1:	89 04 24             	mov    %eax,(%esp)
 804bef4:	e8 c7 5e 00 00       	call   8051dc0 <__sprint_r>
 804bef9:	85 c0                	test   %eax,%eax
 804befb:	0f 85 d7 f4 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bf01:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bf07:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bf0a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bf10:	eb 9e                	jmp    804beb0 <_vfprintf_r+0xd50>
 804bf12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804bf18:	84 c0                	test   %al,%al
 804bf1a:	75 2c                	jne    804bf48 <_vfprintf_r+0xde8>
 804bf1c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804bf23:	74 23                	je     804bf48 <_vfprintf_r+0xde8>
 804bf25:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804bf2b:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 804bf2f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804bf35:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804bf38:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804bf3e:	e9 2d f7 ff ff       	jmp    804b670 <_vfprintf_r+0x510>
 804bf43:	90                   	nop
 804bf44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804bf48:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804bf4b:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
 804bf52:	00 00 00 
 804bf55:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804bf5b:	e9 10 f7 ff ff       	jmp    804b670 <_vfprintf_r+0x510>
 804bf60:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804bf66:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804bf6c:	85 f6                	test   %esi,%esi
 804bf6e:	0f 8e 26 fc ff ff    	jle    804bb9a <_vfprintf_r+0xa3a>
 804bf74:	83 fe 10             	cmp    $0x10,%esi
 804bf77:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bf7d:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bf83:	7f 0b                	jg     804bf90 <_vfprintf_r+0xe30>
 804bf85:	eb 65                	jmp    804bfec <_vfprintf_r+0xe8c>
 804bf87:	90                   	nop
 804bf88:	83 ee 10             	sub    $0x10,%esi
 804bf8b:	83 fe 10             	cmp    $0x10,%esi
 804bf8e:	7e 5c                	jle    804bfec <_vfprintf_r+0xe8c>
 804bf90:	83 c0 01             	add    $0x1,%eax
 804bf93:	83 c1 10             	add    $0x10,%ecx
 804bf96:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804bf9c:	83 c7 08             	add    $0x8,%edi
 804bf9f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bfa6:	83 f8 07             	cmp    $0x7,%eax
 804bfa9:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bfaf:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bfb5:	7e d1                	jle    804bf88 <_vfprintf_r+0xe28>
 804bfb7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bfba:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bfbe:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bfc2:	8b 45 08             	mov    0x8(%ebp),%eax
 804bfc5:	89 04 24             	mov    %eax,(%esp)
 804bfc8:	e8 f3 5d 00 00       	call   8051dc0 <__sprint_r>
 804bfcd:	85 c0                	test   %eax,%eax
 804bfcf:	0f 85 03 f4 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804bfd5:	83 ee 10             	sub    $0x10,%esi
 804bfd8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bfde:	83 fe 10             	cmp    $0x10,%esi
 804bfe1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bfe7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bfea:	7f a4                	jg     804bf90 <_vfprintf_r+0xe30>
 804bfec:	83 c0 01             	add    $0x1,%eax
 804bfef:	01 f1                	add    %esi,%ecx
 804bff1:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804bff7:	83 c7 08             	add    $0x8,%edi
 804bffa:	89 77 fc             	mov    %esi,-0x4(%edi)
 804bffd:	83 f8 07             	cmp    $0x7,%eax
 804c000:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c006:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c00c:	0f 8e 88 fb ff ff    	jle    804bb9a <_vfprintf_r+0xa3a>
 804c012:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c018:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c01c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c01f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c023:	8b 45 08             	mov    0x8(%ebp),%eax
 804c026:	89 04 24             	mov    %eax,(%esp)
 804c029:	e8 92 5d 00 00       	call   8051dc0 <__sprint_r>
 804c02e:	85 c0                	test   %eax,%eax
 804c030:	0f 85 a2 f3 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c036:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c03c:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c03f:	e9 56 fb ff ff       	jmp    804bb9a <_vfprintf_r+0xa3a>
 804c044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c048:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
 804c04f:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804c055:	0f 8e b7 05 00 00    	jle    804c612 <_vfprintf_r+0x14b2>
 804c05b:	89 07                	mov    %eax,(%edi)
 804c05d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c063:	8d 51 01             	lea    0x1(%ecx),%edx
 804c066:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804c06d:	83 c7 08             	add    $0x8,%edi
 804c070:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c076:	83 c0 01             	add    $0x1,%eax
 804c079:	83 f8 07             	cmp    $0x7,%eax
 804c07c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c082:	0f 8f f9 05 00 00    	jg     804c681 <_vfprintf_r+0x1521>
 804c088:	8b 9d 18 ff ff ff    	mov    -0xe8(%ebp),%ebx
 804c08e:	83 c0 01             	add    $0x1,%eax
 804c091:	83 c7 08             	add    $0x8,%edi
 804c094:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c09a:	89 5f f8             	mov    %ebx,-0x8(%edi)
 804c09d:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
 804c0a3:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804c0a6:	01 da                	add    %ebx,%edx
 804c0a8:	83 f8 07             	cmp    $0x7,%eax
 804c0ab:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c0b1:	0f 8f 12 06 00 00    	jg     804c6c9 <_vfprintf_r+0x1569>
 804c0b7:	90                   	nop
 804c0b8:	90                   	nop
 804c0b9:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c0bf:	df e9                	fucomip %st(1),%st
 804c0c1:	dd d8                	fstp   %st(0)
 804c0c3:	7a 06                	jp     804c0cb <_vfprintf_r+0xf6b>
 804c0c5:	0f 84 33 03 00 00    	je     804c3fe <_vfprintf_r+0x129e>
 804c0cb:	8b 8d 2c ff ff ff    	mov    -0xd4(%ebp),%ecx
 804c0d1:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804c0d7:	83 c1 01             	add    $0x1,%ecx
 804c0da:	89 0f                	mov    %ecx,(%edi)
 804c0dc:	8d 4b ff             	lea    -0x1(%ebx),%ecx
 804c0df:	89 4f 04             	mov    %ecx,0x4(%edi)
 804c0e2:	01 ca                	add    %ecx,%edx
 804c0e4:	83 c0 01             	add    $0x1,%eax
 804c0e7:	83 f8 07             	cmp    $0x7,%eax
 804c0ea:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c0f0:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c0f6:	0f 8f 4d 05 00 00    	jg     804c649 <_vfprintf_r+0x14e9>
 804c0fc:	83 c7 08             	add    $0x8,%edi
 804c0ff:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
 804c105:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
 804c10b:	89 0f                	mov    %ecx,(%edi)
 804c10d:	89 5f 04             	mov    %ebx,0x4(%edi)
 804c110:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
 804c113:	83 c0 01             	add    $0x1,%eax
 804c116:	83 f8 07             	cmp    $0x7,%eax
 804c119:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c11f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c125:	0f 8e 96 fb ff ff    	jle    804bcc1 <_vfprintf_r+0xb61>
 804c12b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c131:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c135:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c138:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c13c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c13f:	89 04 24             	mov    %eax,(%esp)
 804c142:	e8 79 5c 00 00       	call   8051dc0 <__sprint_r>
 804c147:	85 c0                	test   %eax,%eax
 804c149:	0f 85 89 f2 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c14f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c155:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c158:	e9 67 fb ff ff       	jmp    804bcc4 <_vfprintf_r+0xb64>
 804c15d:	8d 76 00             	lea    0x0(%esi),%esi
 804c160:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c166:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c16d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c171:	8b 45 08             	mov    0x8(%ebp),%eax
 804c174:	89 04 24             	mov    %eax,(%esp)
 804c177:	e8 44 5c 00 00       	call   8051dc0 <__sprint_r>
 804c17c:	85 c0                	test   %eax,%eax
 804c17e:	0f 84 43 fc ff ff    	je     804bdc7 <_vfprintf_r+0xc67>
 804c184:	e9 4f f2 ff ff       	jmp    804b3d8 <_vfprintf_r+0x278>
 804c189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804c190:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c196:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c19d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c1a1:	8b 45 08             	mov    0x8(%ebp),%eax
 804c1a4:	89 04 24             	mov    %eax,(%esp)
 804c1a7:	e8 14 5c 00 00       	call   8051dc0 <__sprint_r>
 804c1ac:	85 c0                	test   %eax,%eax
 804c1ae:	0f 85 24 f2 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c1b4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c1ba:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c1bd:	e9 8b f9 ff ff       	jmp    804bb4d <_vfprintf_r+0x9ed>
 804c1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c1c8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c1ce:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c1d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 804c1dc:	89 04 24             	mov    %eax,(%esp)
 804c1df:	e8 dc 5b 00 00       	call   8051dc0 <__sprint_r>
 804c1e4:	85 c0                	test   %eax,%eax
 804c1e6:	0f 85 ec f1 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c1ec:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c1f2:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c1f5:	e9 90 f9 ff ff       	jmp    804bb8a <_vfprintf_r+0xa2a>
 804c1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c200:	89 c2                	mov    %eax,%edx
 804c202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c208:	89 c8                	mov    %ecx,%eax
 804c20a:	83 ea 01             	sub    $0x1,%edx
 804c20d:	83 e0 07             	and    $0x7,%eax
 804c210:	c1 e9 03             	shr    $0x3,%ecx
 804c213:	83 c0 30             	add    $0x30,%eax
 804c216:	85 c9                	test   %ecx,%ecx
 804c218:	88 02                	mov    %al,(%edx)
 804c21a:	75 ec                	jne    804c208 <_vfprintf_r+0x10a8>
 804c21c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c223:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
 804c229:	0f 84 5b 01 00 00    	je     804c38a <_vfprintf_r+0x122a>
 804c22f:	3c 30                	cmp    $0x30,%al
 804c231:	74 0b                	je     804c23e <_vfprintf_r+0x10de>
 804c233:	83 ad 2c ff ff ff 01 	subl   $0x1,-0xd4(%ebp)
 804c23a:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 804c23e:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c241:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804c247:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c24d:	e9 1e f4 ff ff       	jmp    804b670 <_vfprintf_r+0x510>
 804c252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c258:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804c25e:	85 db                	test   %ebx,%ebx
 804c260:	0f 8e 9f 06 00 00    	jle    804c905 <_vfprintf_r+0x17a5>
 804c266:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804c26c:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804c272:	01 d0                	add    %edx,%eax
 804c274:	89 c3                	mov    %eax,%ebx
 804c276:	29 d3                	sub    %edx,%ebx
 804c278:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804c27e:	89 d0                	mov    %edx,%eax
 804c280:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804c286:	39 d3                	cmp    %edx,%ebx
 804c288:	0f 4f da             	cmovg  %edx,%ebx
 804c28b:	85 db                	test   %ebx,%ebx
 804c28d:	7e 28                	jle    804c2b7 <_vfprintf_r+0x1157>
 804c28f:	89 07                	mov    %eax,(%edi)
 804c291:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c297:	01 d9                	add    %ebx,%ecx
 804c299:	89 5f 04             	mov    %ebx,0x4(%edi)
 804c29c:	83 c7 08             	add    $0x8,%edi
 804c29f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c2a5:	83 c0 01             	add    $0x1,%eax
 804c2a8:	83 f8 07             	cmp    $0x7,%eax
 804c2ab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c2b1:	0f 8f e2 08 00 00    	jg     804cb99 <_vfprintf_r+0x1a39>
 804c2b7:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
 804c2bd:	31 c0                	xor    %eax,%eax
 804c2bf:	85 db                	test   %ebx,%ebx
 804c2c1:	0f 49 c3             	cmovns %ebx,%eax
 804c2c4:	29 c6                	sub    %eax,%esi
 804c2c6:	85 f6                	test   %esi,%esi
 804c2c8:	0f 8e 13 02 00 00    	jle    804c4e1 <_vfprintf_r+0x1381>
 804c2ce:	83 fe 10             	cmp    $0x10,%esi
 804c2d1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c2d7:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c2dd:	7f 15                	jg     804c2f4 <_vfprintf_r+0x1194>
 804c2df:	e9 ae 01 00 00       	jmp    804c492 <_vfprintf_r+0x1332>
 804c2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c2e8:	83 ee 10             	sub    $0x10,%esi
 804c2eb:	83 fe 10             	cmp    $0x10,%esi
 804c2ee:	0f 8e 9e 01 00 00    	jle    804c492 <_vfprintf_r+0x1332>
 804c2f4:	83 c0 01             	add    $0x1,%eax
 804c2f7:	83 c1 10             	add    $0x10,%ecx
 804c2fa:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c300:	83 c7 08             	add    $0x8,%edi
 804c303:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c30a:	83 f8 07             	cmp    $0x7,%eax
 804c30d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c313:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c319:	7e cd                	jle    804c2e8 <_vfprintf_r+0x1188>
 804c31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c31e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c322:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c326:	8b 45 08             	mov    0x8(%ebp),%eax
 804c329:	89 04 24             	mov    %eax,(%esp)
 804c32c:	e8 8f 5a 00 00       	call   8051dc0 <__sprint_r>
 804c331:	85 c0                	test   %eax,%eax
 804c333:	0f 85 9f f0 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c339:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c33f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c342:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c348:	eb 9e                	jmp    804c2e8 <_vfprintf_r+0x1188>
 804c34a:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c34d:	be cd cc cc cc       	mov    $0xcccccccd,%esi
 804c352:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804c358:	89 c7                	mov    %eax,%edi
 804c35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c360:	89 c8                	mov    %ecx,%eax
 804c362:	83 ef 01             	sub    $0x1,%edi
 804c365:	f7 e6                	mul    %esi
 804c367:	c1 ea 03             	shr    $0x3,%edx
 804c36a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804c36d:	01 c0                	add    %eax,%eax
 804c36f:	29 c1                	sub    %eax,%ecx
 804c371:	83 c1 30             	add    $0x30,%ecx
 804c374:	85 d2                	test   %edx,%edx
 804c376:	88 0f                	mov    %cl,(%edi)
 804c378:	89 d1                	mov    %edx,%ecx
 804c37a:	75 e4                	jne    804c360 <_vfprintf_r+0x1200>
 804c37c:	89 fa                	mov    %edi,%edx
 804c37e:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%ebp)
 804c384:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804c38a:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c38d:	29 d0                	sub    %edx,%eax
 804c38f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c395:	e9 d6 f2 ff ff       	jmp    804b670 <_vfprintf_r+0x510>
 804c39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c3a0:	83 f9 09             	cmp    $0x9,%ecx
 804c3a3:	77 a5                	ja     804c34a <_vfprintf_r+0x11ea>
 804c3a5:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804c3ab:	83 c1 30             	add    $0x30,%ecx
 804c3ae:	88 4d a7             	mov    %cl,-0x59(%ebp)
 804c3b1:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c3b7:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804c3ba:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804c3c0:	e9 ab f2 ff ff       	jmp    804b670 <_vfprintf_r+0x510>
 804c3c5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c3cb:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c3cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c3d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 804c3d9:	89 04 24             	mov    %eax,(%esp)
 804c3dc:	e8 df 59 00 00       	call   8051dc0 <__sprint_r>
 804c3e1:	85 c0                	test   %eax,%eax
 804c3e3:	0f 85 ef ef ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c3e9:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804c3f0:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c3f3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c3f9:	e9 18 f7 ff ff       	jmp    804bb16 <_vfprintf_r+0x9b6>
 804c3fe:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804c404:	8d 73 ff             	lea    -0x1(%ebx),%esi
 804c407:	85 f6                	test   %esi,%esi
 804c409:	0f 8e f0 fc ff ff    	jle    804c0ff <_vfprintf_r+0xf9f>
 804c40f:	83 fe 10             	cmp    $0x10,%esi
 804c412:	0f 8e a1 02 00 00    	jle    804c6b9 <_vfprintf_r+0x1559>
 804c418:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c41e:	eb 0c                	jmp    804c42c <_vfprintf_r+0x12cc>
 804c420:	83 ee 10             	sub    $0x10,%esi
 804c423:	83 fe 10             	cmp    $0x10,%esi
 804c426:	0f 8e 8d 02 00 00    	jle    804c6b9 <_vfprintf_r+0x1559>
 804c42c:	83 c0 01             	add    $0x1,%eax
 804c42f:	83 c2 10             	add    $0x10,%edx
 804c432:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c438:	83 c7 08             	add    $0x8,%edi
 804c43b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c442:	83 f8 07             	cmp    $0x7,%eax
 804c445:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c44b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c451:	7e cd                	jle    804c420 <_vfprintf_r+0x12c0>
 804c453:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c456:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c45a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c45e:	8b 45 08             	mov    0x8(%ebp),%eax
 804c461:	89 04 24             	mov    %eax,(%esp)
 804c464:	e8 57 59 00 00       	call   8051dc0 <__sprint_r>
 804c469:	85 c0                	test   %eax,%eax
 804c46b:	0f 85 67 ef ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c471:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c477:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c47a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c480:	eb 9e                	jmp    804c420 <_vfprintf_r+0x12c0>
 804c482:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c488:	01 f1                	add    %esi,%ecx
 804c48a:	89 77 04             	mov    %esi,0x4(%edi)
 804c48d:	e9 81 fc ff ff       	jmp    804c113 <_vfprintf_r+0xfb3>
 804c492:	83 c0 01             	add    $0x1,%eax
 804c495:	01 f1                	add    %esi,%ecx
 804c497:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c49d:	83 c7 08             	add    $0x8,%edi
 804c4a0:	89 77 fc             	mov    %esi,-0x4(%edi)
 804c4a3:	83 f8 07             	cmp    $0x7,%eax
 804c4a6:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c4ac:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c4b2:	7e 2d                	jle    804c4e1 <_vfprintf_r+0x1381>
 804c4b4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c4ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c4be:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c4c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 804c4c8:	89 04 24             	mov    %eax,(%esp)
 804c4cb:	e8 f0 58 00 00       	call   8051dc0 <__sprint_r>
 804c4d0:	85 c0                	test   %eax,%eax
 804c4d2:	0f 85 00 ef ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c4d8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c4de:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c4e1:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804c4e7:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c4ed:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
 804c4f3:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
 804c4f9:	89 c6                	mov    %eax,%esi
 804c4fb:	7c 0d                	jl     804c50a <_vfprintf_r+0x13aa>
 804c4fd:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c504:	0f 84 61 05 00 00    	je     804ca6b <_vfprintf_r+0x190b>
 804c50a:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804c510:	89 07                	mov    %eax,(%edi)
 804c512:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804c518:	01 c1                	add    %eax,%ecx
 804c51a:	89 47 04             	mov    %eax,0x4(%edi)
 804c51d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c523:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c529:	83 c0 01             	add    $0x1,%eax
 804c52c:	83 f8 07             	cmp    $0x7,%eax
 804c52f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c535:	0f 8f 90 06 00 00    	jg     804cbcb <_vfprintf_r+0x1a6b>
 804c53b:	83 c7 08             	add    $0x8,%edi
 804c53e:	89 d0                	mov    %edx,%eax
 804c540:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804c546:	89 f2                	mov    %esi,%edx
 804c548:	29 f3                	sub    %esi,%ebx
 804c54a:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804c550:	29 c6                	sub    %eax,%esi
 804c552:	39 de                	cmp    %ebx,%esi
 804c554:	0f 4e de             	cmovle %esi,%ebx
 804c557:	85 db                	test   %ebx,%ebx
 804c559:	7e 29                	jle    804c584 <_vfprintf_r+0x1424>
 804c55b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c561:	01 d9                	add    %ebx,%ecx
 804c563:	83 c7 08             	add    $0x8,%edi
 804c566:	89 57 f8             	mov    %edx,-0x8(%edi)
 804c569:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804c56c:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c572:	83 c0 01             	add    $0x1,%eax
 804c575:	83 f8 07             	cmp    $0x7,%eax
 804c578:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c57e:	0f 8f 7f 06 00 00    	jg     804cc03 <_vfprintf_r+0x1aa3>
 804c584:	31 c0                	xor    %eax,%eax
 804c586:	85 db                	test   %ebx,%ebx
 804c588:	0f 49 c3             	cmovns %ebx,%eax
 804c58b:	29 c6                	sub    %eax,%esi
 804c58d:	85 f6                	test   %esi,%esi
 804c58f:	0f 8e 2f f7 ff ff    	jle    804bcc4 <_vfprintf_r+0xb64>
 804c595:	83 fe 10             	cmp    $0x10,%esi
 804c598:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c59e:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c5a4:	7f 16                	jg     804c5bc <_vfprintf_r+0x145c>
 804c5a6:	e9 d7 fe ff ff       	jmp    804c482 <_vfprintf_r+0x1322>
 804c5ab:	90                   	nop
 804c5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c5b0:	83 ee 10             	sub    $0x10,%esi
 804c5b3:	83 fe 10             	cmp    $0x10,%esi
 804c5b6:	0f 8e c6 fe ff ff    	jle    804c482 <_vfprintf_r+0x1322>
 804c5bc:	83 c0 01             	add    $0x1,%eax
 804c5bf:	83 c1 10             	add    $0x10,%ecx
 804c5c2:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c5c8:	83 c7 08             	add    $0x8,%edi
 804c5cb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c5d2:	83 f8 07             	cmp    $0x7,%eax
 804c5d5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c5db:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c5e1:	7e cd                	jle    804c5b0 <_vfprintf_r+0x1450>
 804c5e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c5e6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c5ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 804c5f1:	89 04 24             	mov    %eax,(%esp)
 804c5f4:	e8 c7 57 00 00       	call   8051dc0 <__sprint_r>
 804c5f9:	85 c0                	test   %eax,%eax
 804c5fb:	0f 85 d7 ed ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c601:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c607:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c60a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c610:	eb 9e                	jmp    804c5b0 <_vfprintf_r+0x1450>
 804c612:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c619:	0f 85 3c fa ff ff    	jne    804c05b <_vfprintf_r+0xefb>
 804c61f:	89 07                	mov    %eax,(%edi)
 804c621:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c627:	8d 51 01             	lea    0x1(%ecx),%edx
 804c62a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804c631:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c637:	83 c0 01             	add    $0x1,%eax
 804c63a:	83 f8 07             	cmp    $0x7,%eax
 804c63d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c643:	0f 8e b3 fa ff ff    	jle    804c0fc <_vfprintf_r+0xf9c>
 804c649:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c64f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c653:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c656:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c65a:	8b 45 08             	mov    0x8(%ebp),%eax
 804c65d:	89 04 24             	mov    %eax,(%esp)
 804c660:	e8 5b 57 00 00       	call   8051dc0 <__sprint_r>
 804c665:	85 c0                	test   %eax,%eax
 804c667:	0f 85 6b ed ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c66d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c673:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c676:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c67c:	e9 7e fa ff ff       	jmp    804c0ff <_vfprintf_r+0xf9f>
 804c681:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c687:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c68b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c68e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c692:	8b 45 08             	mov    0x8(%ebp),%eax
 804c695:	89 04 24             	mov    %eax,(%esp)
 804c698:	e8 23 57 00 00       	call   8051dc0 <__sprint_r>
 804c69d:	85 c0                	test   %eax,%eax
 804c69f:	0f 85 33 ed ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c6a5:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c6ab:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c6ae:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c6b4:	e9 cf f9 ff ff       	jmp    804c088 <_vfprintf_r+0xf28>
 804c6b9:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c6bf:	01 f2                	add    %esi,%edx
 804c6c1:	89 77 04             	mov    %esi,0x4(%edi)
 804c6c4:	e9 1b fa ff ff       	jmp    804c0e4 <_vfprintf_r+0xf84>
 804c6c9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c6cf:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c6d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c6d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c6da:	8b 45 08             	mov    0x8(%ebp),%eax
 804c6dd:	89 04 24             	mov    %eax,(%esp)
 804c6e0:	e8 db 56 00 00       	call   8051dc0 <__sprint_r>
 804c6e5:	85 c0                	test   %eax,%eax
 804c6e7:	0f 85 eb ec ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c6ed:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c6f3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c6f6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c6fc:	e9 b6 f9 ff ff       	jmp    804c0b7 <_vfprintf_r+0xf57>
 804c701:	f7 d9                	neg    %ecx
 804c703:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804c708:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804c70f:	b8 01 00 00 00       	mov    $0x1,%eax
 804c714:	e9 e8 ee ff ff       	jmp    804b601 <_vfprintf_r+0x4a1>
 804c719:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c71f:	dd 1c 24             	fstpl  (%esp)
 804c722:	e8 89 43 00 00       	call   8050ab0 <__fpclassifyd>
 804c727:	85 c0                	test   %eax,%eax
 804c729:	0f 84 e4 02 00 00    	je     804ca13 <_vfprintf_r+0x18b3>
 804c72f:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
 804c735:	83 e3 df             	and    $0xffffffdf,%ebx
 804c738:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
 804c73f:	0f 84 b1 07 00 00    	je     804cef6 <_vfprintf_r+0x1d96>
 804c745:	83 fb 47             	cmp    $0x47,%ebx
 804c748:	75 16                	jne    804c760 <_vfprintf_r+0x1600>
 804c74a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804c750:	b8 01 00 00 00       	mov    $0x1,%eax
 804c755:	85 d2                	test   %edx,%edx
 804c757:	0f 45 c2             	cmovne %edx,%eax
 804c75a:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804c760:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804c766:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c76c:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
 804c772:	80 cc 01             	or     $0x1,%ah
 804c775:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
 804c77b:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 804c781:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
 804c788:	85 c0                	test   %eax,%eax
 804c78a:	0f 88 58 07 00 00    	js     804cee8 <_vfprintf_r+0x1d88>
 804c790:	83 fb 46             	cmp    $0x46,%ebx
 804c793:	0f 94 c0             	sete   %al
 804c796:	89 c6                	mov    %eax,%esi
 804c798:	0f 84 f0 04 00 00    	je     804cc8e <_vfprintf_r+0x1b2e>
 804c79e:	83 fb 45             	cmp    $0x45,%ebx
 804c7a1:	0f 85 37 07 00 00    	jne    804cede <_vfprintf_r+0x1d7e>
 804c7a7:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804c7ad:	dd 54 24 04          	fstl   0x4(%esp)
 804c7b1:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 804c7b8:	00 
 804c7b9:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804c7bf:	8d 70 01             	lea    0x1(%eax),%esi
 804c7c2:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804c7c8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804c7cc:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804c7d2:	89 44 24 18          	mov    %eax,0x18(%esp)
 804c7d6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804c7dc:	89 44 24 14          	mov    %eax,0x14(%esp)
 804c7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 804c7e3:	89 74 24 10          	mov    %esi,0x10(%esp)
 804c7e7:	89 04 24             	mov    %eax,(%esp)
 804c7ea:	e8 f1 0c 00 00       	call   804d4e0 <_dtoa_r>
 804c7ef:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804c7f5:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
 804c7f8:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804c7fe:	90                   	nop
 804c7ff:	90                   	nop
 804c800:	d9 c9                	fxch   %st(1)
 804c802:	df e9                	fucomip %st(1),%st
 804c804:	dd d8                	fstp   %st(0)
 804c806:	0f 8a f8 01 00 00    	jp     804ca04 <_vfprintf_r+0x18a4>
 804c80c:	89 c8                	mov    %ecx,%eax
 804c80e:	0f 85 f0 01 00 00    	jne    804ca04 <_vfprintf_r+0x18a4>
 804c814:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804c81a:	83 fb 47             	cmp    $0x47,%ebx
 804c81d:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804c823:	0f 84 4b 05 00 00    	je     804cd74 <_vfprintf_r+0x1c14>
 804c829:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804c830:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804c836:	0f 8e 92 05 00 00    	jle    804cdce <_vfprintf_r+0x1c6e>
 804c83c:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
 804c843:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804c849:	0f 84 b6 06 00 00    	je     804cf05 <_vfprintf_r+0x1da5>
 804c84f:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
 804c855:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
 804c85b:	0f 8f 4a 06 00 00    	jg     804ceab <_vfprintf_r+0x1d4b>
 804c861:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804c867:	83 e0 01             	and    $0x1,%eax
 804c86a:	0f 85 79 07 00 00    	jne    804cfe9 <_vfprintf_r+0x1e89>
 804c870:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804c876:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804c87d:	00 00 00 
 804c880:	85 d2                	test   %edx,%edx
 804c882:	0f 49 c2             	cmovns %edx,%eax
 804c885:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804c88b:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
 804c892:	0f 85 95 04 00 00    	jne    804cd2d <_vfprintf_r+0x1bcd>
 804c898:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804c89e:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
 804c8a4:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804c8ab:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804c8b2:	00 00 00 
 804c8b5:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804c8bb:	e9 f0 eb ff ff       	jmp    804b4b0 <_vfprintf_r+0x350>
 804c8c0:	dd 00                	fldl   (%eax)
 804c8c2:	83 c0 08             	add    $0x8,%eax
 804c8c5:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804c8cb:	89 45 14             	mov    %eax,0x14(%ebp)
 804c8ce:	e9 d1 ef ff ff       	jmp    804b8a4 <_vfprintf_r+0x744>
 804c8d3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c8d9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c8dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c8e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c8e4:	8b 45 08             	mov    0x8(%ebp),%eax
 804c8e7:	89 04 24             	mov    %eax,(%esp)
 804c8ea:	e8 d1 54 00 00       	call   8051dc0 <__sprint_r>
 804c8ef:	85 c0                	test   %eax,%eax
 804c8f1:	0f 85 e1 ea ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c8f7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c8fd:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c900:	e9 32 f5 ff ff       	jmp    804be37 <_vfprintf_r+0xcd7>
 804c905:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c90b:	83 c1 01             	add    $0x1,%ecx
 804c90e:	83 c7 08             	add    $0x8,%edi
 804c911:	c7 47 f8 27 43 05 08 	movl   $0x8054327,-0x8(%edi)
 804c918:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804c91f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c925:	83 c0 01             	add    $0x1,%eax
 804c928:	83 f8 07             	cmp    $0x7,%eax
 804c92b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c931:	0f 8f 5b 01 00 00    	jg     804ca92 <_vfprintf_r+0x1932>
 804c937:	85 db                	test   %ebx,%ebx
 804c939:	0f 84 33 01 00 00    	je     804ca72 <_vfprintf_r+0x1912>
 804c93f:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804c945:	83 c7 08             	add    $0x8,%edi
 804c948:	89 47 f8             	mov    %eax,-0x8(%edi)
 804c94b:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804c951:	89 47 fc             	mov    %eax,-0x4(%edi)
 804c954:	8d 14 01             	lea    (%ecx,%eax,1),%edx
 804c957:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c95d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c963:	83 c0 01             	add    $0x1,%eax
 804c966:	83 f8 07             	cmp    $0x7,%eax
 804c969:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c96f:	0f 8f e3 04 00 00    	jg     804ce58 <_vfprintf_r+0x1cf8>
 804c975:	f7 db                	neg    %ebx
 804c977:	85 db                	test   %ebx,%ebx
 804c979:	0f 8e d2 01 00 00    	jle    804cb51 <_vfprintf_r+0x19f1>
 804c97f:	83 fb 10             	cmp    $0x10,%ebx
 804c982:	0f 8e 74 01 00 00    	jle    804cafc <_vfprintf_r+0x199c>
 804c988:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
 804c98e:	eb 0c                	jmp    804c99c <_vfprintf_r+0x183c>
 804c990:	83 eb 10             	sub    $0x10,%ebx
 804c993:	83 fb 10             	cmp    $0x10,%ebx
 804c996:	0f 8e 60 01 00 00    	jle    804cafc <_vfprintf_r+0x199c>
 804c99c:	83 c0 01             	add    $0x1,%eax
 804c99f:	83 c2 10             	add    $0x10,%edx
 804c9a2:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804c9a8:	83 c7 08             	add    $0x8,%edi
 804c9ab:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c9b2:	83 f8 07             	cmp    $0x7,%eax
 804c9b5:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c9bb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c9c1:	7e cd                	jle    804c990 <_vfprintf_r+0x1830>
 804c9c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c9c6:	89 74 24 08          	mov    %esi,0x8(%esp)
 804c9ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c9ce:	8b 45 08             	mov    0x8(%ebp),%eax
 804c9d1:	89 04 24             	mov    %eax,(%esp)
 804c9d4:	e8 e7 53 00 00       	call   8051dc0 <__sprint_r>
 804c9d9:	85 c0                	test   %eax,%eax
 804c9db:	0f 85 f7 e9 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804c9e1:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c9e7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c9ea:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c9f0:	eb 9e                	jmp    804c990 <_vfprintf_r+0x1830>
 804c9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c9f8:	8d 50 01             	lea    0x1(%eax),%edx
 804c9fb:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
 804ca01:	c6 00 30             	movb   $0x30,(%eax)
 804ca04:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804ca0a:	39 c1                	cmp    %eax,%ecx
 804ca0c:	77 ea                	ja     804c9f8 <_vfprintf_r+0x1898>
 804ca0e:	e9 01 fe ff ff       	jmp    804c814 <_vfprintf_r+0x16b4>
 804ca13:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804ca1a:	ba 34 46 05 08       	mov    $0x8054634,%edx
 804ca1f:	b8 38 46 05 08       	mov    $0x8054638,%eax
 804ca24:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804ca2b:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804ca32:	00 00 00 
 804ca35:	0f 4e c2             	cmovle %edx,%eax
 804ca38:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804ca3e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804ca45:	ff ff ff 
 804ca48:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804ca4f:	00 00 00 
 804ca52:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ca59:	00 00 00 
 804ca5c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ca63:	00 00 00 
 804ca66:	e9 45 ea ff ff       	jmp    804b4b0 <_vfprintf_r+0x350>
 804ca6b:	89 d0                	mov    %edx,%eax
 804ca6d:	e9 ce fa ff ff       	jmp    804c540 <_vfprintf_r+0x13e0>
 804ca72:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
 804ca78:	85 d2                	test   %edx,%edx
 804ca7a:	0f 85 bf fe ff ff    	jne    804c93f <_vfprintf_r+0x17df>
 804ca80:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804ca87:	0f 84 37 f2 ff ff    	je     804bcc4 <_vfprintf_r+0xb64>
 804ca8d:	e9 ad fe ff ff       	jmp    804c93f <_vfprintf_r+0x17df>
 804ca92:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ca98:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ca9c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ca9f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804caa3:	8b 45 08             	mov    0x8(%ebp),%eax
 804caa6:	89 04 24             	mov    %eax,(%esp)
 804caa9:	e8 12 53 00 00       	call   8051dc0 <__sprint_r>
 804caae:	85 c0                	test   %eax,%eax
 804cab0:	0f 85 22 e9 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804cab6:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804cabc:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cabf:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cac5:	e9 6d fe ff ff       	jmp    804c937 <_vfprintf_r+0x17d7>
 804caca:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cad0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cad4:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cad7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cadb:	8b 45 08             	mov    0x8(%ebp),%eax
 804cade:	89 04 24             	mov    %eax,(%esp)
 804cae1:	e8 da 52 00 00       	call   8051dc0 <__sprint_r>
 804cae6:	85 c0                	test   %eax,%eax
 804cae8:	0f 85 ea e8 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804caee:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804caf4:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804caf7:	e9 8b f3 ff ff       	jmp    804be87 <_vfprintf_r+0xd27>
 804cafc:	83 c0 01             	add    $0x1,%eax
 804caff:	01 da                	add    %ebx,%edx
 804cb01:	c7 07 50 49 05 08    	movl   $0x8054950,(%edi)
 804cb07:	83 c7 08             	add    $0x8,%edi
 804cb0a:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804cb0d:	83 f8 07             	cmp    $0x7,%eax
 804cb10:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804cb16:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804cb1c:	7e 33                	jle    804cb51 <_vfprintf_r+0x19f1>
 804cb1e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cb24:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cb28:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cb2b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cb2f:	8b 45 08             	mov    0x8(%ebp),%eax
 804cb32:	89 04 24             	mov    %eax,(%esp)
 804cb35:	e8 86 52 00 00       	call   8051dc0 <__sprint_r>
 804cb3a:	85 c0                	test   %eax,%eax
 804cb3c:	0f 85 96 e8 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804cb42:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804cb48:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cb4b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804cb51:	8b 9d 2c ff ff ff    	mov    -0xd4(%ebp),%ebx
 804cb57:	83 c0 01             	add    $0x1,%eax
 804cb5a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804cb60:	89 1f                	mov    %ebx,(%edi)
 804cb62:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804cb68:	01 da                	add    %ebx,%edx
 804cb6a:	83 f8 07             	cmp    $0x7,%eax
 804cb6d:	89 5f 04             	mov    %ebx,0x4(%edi)
 804cb70:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804cb76:	0f 8f af f5 ff ff    	jg     804c12b <_vfprintf_r+0xfcb>
 804cb7c:	83 c7 08             	add    $0x8,%edi
 804cb7f:	89 d1                	mov    %edx,%ecx
 804cb81:	e9 3e f1 ff ff       	jmp    804bcc4 <_vfprintf_r+0xb64>
 804cb86:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804cb8c:	89 04 24             	mov    %eax,(%esp)
 804cb8f:	e8 4c c6 ff ff       	call   80491e0 <strlen>
 804cb94:	e9 df e8 ff ff       	jmp    804b478 <_vfprintf_r+0x318>
 804cb99:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cb9f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cba3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cba6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cbaa:	8b 45 08             	mov    0x8(%ebp),%eax
 804cbad:	89 04 24             	mov    %eax,(%esp)
 804cbb0:	e8 0b 52 00 00       	call   8051dc0 <__sprint_r>
 804cbb5:	85 c0                	test   %eax,%eax
 804cbb7:	0f 85 1b e8 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804cbbd:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cbc3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cbc6:	e9 ec f6 ff ff       	jmp    804c2b7 <_vfprintf_r+0x1157>
 804cbcb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cbd1:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cbd5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cbd8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cbdc:	8b 45 08             	mov    0x8(%ebp),%eax
 804cbdf:	89 04 24             	mov    %eax,(%esp)
 804cbe2:	e8 d9 51 00 00       	call   8051dc0 <__sprint_r>
 804cbe7:	85 c0                	test   %eax,%eax
 804cbe9:	0f 85 e9 e7 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804cbef:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cbf5:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cbf8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cbfe:	e9 3d f9 ff ff       	jmp    804c540 <_vfprintf_r+0x13e0>
 804cc03:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cc09:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cc0d:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cc10:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cc14:	8b 45 08             	mov    0x8(%ebp),%eax
 804cc17:	89 04 24             	mov    %eax,(%esp)
 804cc1a:	e8 a1 51 00 00       	call   8051dc0 <__sprint_r>
 804cc1f:	85 c0                	test   %eax,%eax
 804cc21:	0f 85 b1 e7 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804cc27:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804cc2d:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cc30:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
 804cc36:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cc3c:	e9 43 f9 ff ff       	jmp    804c584 <_vfprintf_r+0x1424>
 804cc41:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804cc47:	b0 06                	mov    $0x6,%al
 804cc49:	89 75 14             	mov    %esi,0x14(%ebp)
 804cc4c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cc53:	00 00 00 
 804cc56:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804cc5d:	00 00 00 
 804cc60:	83 fa 06             	cmp    $0x6,%edx
 804cc63:	0f 46 c2             	cmovbe %edx,%eax
 804cc66:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804cc6c:	85 c0                	test   %eax,%eax
 804cc6e:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cc74:	c7 85 2c ff ff ff 5e 	movl   $0x805465e,-0xd4(%ebp)
 804cc7b:	46 05 08 
 804cc7e:	0f 49 d0             	cmovns %eax,%edx
 804cc81:	31 db                	xor    %ebx,%ebx
 804cc83:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
 804cc89:	e9 2d e8 ff ff       	jmp    804b4bb <_vfprintf_r+0x35b>
 804cc8e:	ba 03 00 00 00       	mov    $0x3,%edx
 804cc93:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804cc99:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804cc9d:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804cca3:	89 44 24 18          	mov    %eax,0x18(%esp)
 804cca7:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804ccad:	89 44 24 14          	mov    %eax,0x14(%esp)
 804ccb1:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804ccb7:	dd 54 24 04          	fstl   0x4(%esp)
 804ccbb:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ccbf:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804ccc5:	89 44 24 10          	mov    %eax,0x10(%esp)
 804ccc9:	8b 45 08             	mov    0x8(%ebp),%eax
 804cccc:	89 04 24             	mov    %eax,(%esp)
 804cccf:	e8 0c 08 00 00       	call   804d4e0 <_dtoa_r>
 804ccd4:	83 fb 47             	cmp    $0x47,%ebx
 804ccd7:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804ccdd:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804cce3:	75 09                	jne    804ccee <_vfprintf_r+0x1b8e>
 804cce5:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804ccec:	74 6c                	je     804cd5a <_vfprintf_r+0x1bfa>
 804ccee:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804ccf4:	89 f0                	mov    %esi,%eax
 804ccf6:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
 804ccfc:	01 d1                	add    %edx,%ecx
 804ccfe:	84 c0                	test   %al,%al
 804cd00:	0f 84 f8 fa ff ff    	je     804c7fe <_vfprintf_r+0x169e>
 804cd06:	80 3a 30             	cmpb   $0x30,(%edx)
 804cd09:	0f 84 b2 02 00 00    	je     804cfc1 <_vfprintf_r+0x1e61>
 804cd0f:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cd15:	01 c1                	add    %eax,%ecx
 804cd17:	e9 e2 fa ff ff       	jmp    804c7fe <_vfprintf_r+0x169e>
 804cd1c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804cd23:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804cd28:	e9 a9 eb ff ff       	jmp    804b8d6 <_vfprintf_r+0x776>
 804cd2d:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804cd33:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
 804cd39:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804cd3e:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804cd45:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cd4c:	00 00 00 
 804cd4f:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804cd55:	e9 5a e7 ff ff       	jmp    804b4b4 <_vfprintf_r+0x354>
 804cd5a:	dd d8                	fstp   %st(0)
 804cd5c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804cd62:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804cd68:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804cd6e:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
 804cd74:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cd7a:	83 f8 fd             	cmp    $0xfffffffd,%eax
 804cd7d:	7c 48                	jl     804cdc7 <_vfprintf_r+0x1c67>
 804cd7f:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
 804cd85:	7c 40                	jl     804cdc7 <_vfprintf_r+0x1c67>
 804cd87:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804cd8d:	e9 bd fa ff ff       	jmp    804c84f <_vfprintf_r+0x16ef>
 804cd92:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804cd98:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804cd9f:	89 75 14             	mov    %esi,0x14(%ebp)
 804cda2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cda9:	00 00 00 
 804cdac:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804cdb2:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cdb8:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804cdbf:	00 00 00 
 804cdc2:	e9 e9 e6 ff ff       	jmp    804b4b0 <_vfprintf_r+0x350>
 804cdc7:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
 804cdce:	8d 48 ff             	lea    -0x1(%eax),%ecx
 804cdd1:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
 804cdd8:	85 c9                	test   %ecx,%ecx
 804cdda:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 804cde0:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
 804cde6:	0f 88 af 02 00 00    	js     804d09b <_vfprintf_r+0x1f3b>
 804cdec:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
 804cdf3:	83 f9 09             	cmp    $0x9,%ecx
 804cdf6:	0f 8f 33 01 00 00    	jg     804cf2f <_vfprintf_r+0x1dcf>
 804cdfc:	83 c1 30             	add    $0x30,%ecx
 804cdff:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
 804ce06:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
 804ce0c:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
 804ce12:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804ce18:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
 804ce1e:	29 d0                	sub    %edx,%eax
 804ce20:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
 804ce26:	89 da                	mov    %ebx,%edx
 804ce28:	01 c2                	add    %eax,%edx
 804ce2a:	83 fb 01             	cmp    $0x1,%ebx
 804ce2d:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804ce33:	0f 8e 3f 02 00 00    	jle    804d078 <_vfprintf_r+0x1f18>
 804ce39:	31 c0                	xor    %eax,%eax
 804ce3b:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
 804ce42:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
 804ce49:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ce50:	00 00 00 
 804ce53:	e9 33 fa ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804ce58:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ce5e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ce62:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ce65:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ce69:	8b 45 08             	mov    0x8(%ebp),%eax
 804ce6c:	89 04 24             	mov    %eax,(%esp)
 804ce6f:	e8 4c 4f 00 00       	call   8051dc0 <__sprint_r>
 804ce74:	85 c0                	test   %eax,%eax
 804ce76:	0f 85 5c e5 ff ff    	jne    804b3d8 <_vfprintf_r+0x278>
 804ce7c:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ce82:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ce85:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804ce8b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804ce91:	e9 df fa ff ff       	jmp    804c975 <_vfprintf_r+0x1815>
 804ce96:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804ce9c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cea3:	00 00 00 
 804cea6:	e9 28 e4 ff ff       	jmp    804b2d3 <_vfprintf_r+0x173>
 804ceab:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
 804ceb1:	ba 01 00 00 00       	mov    $0x1,%edx
 804ceb6:	85 c9                	test   %ecx,%ecx
 804ceb8:	0f 8e 4e 01 00 00    	jle    804d00c <_vfprintf_r+0x1eac>
 804cebe:	31 c0                	xor    %eax,%eax
 804cec0:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
 804cec6:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804cecd:	00 00 00 
 804ced0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804ced6:	0f 49 c2             	cmovns %edx,%eax
 804ced9:	e9 ad f9 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804cede:	ba 02 00 00 00       	mov    $0x2,%edx
 804cee3:	e9 ab fd ff ff       	jmp    804cc93 <_vfprintf_r+0x1b33>
 804cee8:	d9 e0                	fchs   
 804ceea:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
 804cef1:	e9 9a f8 ff ff       	jmp    804c790 <_vfprintf_r+0x1630>
 804cef6:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
 804cefd:	00 00 00 
 804cf00:	e9 5b f8 ff ff       	jmp    804c760 <_vfprintf_r+0x1600>
 804cf05:	85 c0                	test   %eax,%eax
 804cf07:	0f 8e 43 01 00 00    	jle    804d050 <_vfprintf_r+0x1ef0>
 804cf0d:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804cf13:	85 f6                	test   %esi,%esi
 804cf15:	0f 85 82 00 00 00    	jne    804cf9d <_vfprintf_r+0x1e3d>
 804cf1b:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804cf22:	75 79                	jne    804cf9d <_vfprintf_r+0x1e3d>
 804cf24:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cf2a:	e9 5c f9 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804cf2f:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
 804cf35:	89 f3                	mov    %esi,%ebx
 804cf37:	b8 67 66 66 66       	mov    $0x66666667,%eax
 804cf3c:	83 eb 01             	sub    $0x1,%ebx
 804cf3f:	f7 e9                	imul   %ecx
 804cf41:	89 c8                	mov    %ecx,%eax
 804cf43:	c1 f8 1f             	sar    $0x1f,%eax
 804cf46:	c1 fa 02             	sar    $0x2,%edx
 804cf49:	29 c2                	sub    %eax,%edx
 804cf4b:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804cf4e:	01 c0                	add    %eax,%eax
 804cf50:	29 c1                	sub    %eax,%ecx
 804cf52:	83 fa 09             	cmp    $0x9,%edx
 804cf55:	8d 41 30             	lea    0x30(%ecx),%eax
 804cf58:	89 d1                	mov    %edx,%ecx
 804cf5a:	88 03                	mov    %al,(%ebx)
 804cf5c:	7f d9                	jg     804cf37 <_vfprintf_r+0x1dd7>
 804cf5e:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804cf61:	83 c1 30             	add    $0x30,%ecx
 804cf64:	39 f0                	cmp    %esi,%eax
 804cf66:	88 4b ff             	mov    %cl,-0x1(%ebx)
 804cf69:	0f 83 53 01 00 00    	jae    804d0c2 <_vfprintf_r+0x1f62>
 804cf6f:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804cf75:	eb 04                	jmp    804cf7b <_vfprintf_r+0x1e1b>
 804cf77:	90                   	nop
 804cf78:	0f b6 08             	movzbl (%eax),%ecx
 804cf7b:	83 c0 01             	add    $0x1,%eax
 804cf7e:	83 c2 01             	add    $0x1,%edx
 804cf81:	39 f0                	cmp    %esi,%eax
 804cf83:	88 4a ff             	mov    %cl,-0x1(%edx)
 804cf86:	75 f0                	jne    804cf78 <_vfprintf_r+0x1e18>
 804cf88:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cf8e:	29 d8                	sub    %ebx,%eax
 804cf90:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804cf96:	01 d0                	add    %edx,%eax
 804cf98:	e9 75 fe ff ff       	jmp    804ce12 <_vfprintf_r+0x1cb2>
 804cf9d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804cfa3:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804cfa9:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
 804cfad:	89 c2                	mov    %eax,%edx
 804cfaf:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cfb5:	31 c0                	xor    %eax,%eax
 804cfb7:	85 d2                	test   %edx,%edx
 804cfb9:	0f 49 c2             	cmovns %edx,%eax
 804cfbc:	e9 ca f8 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804cfc1:	90                   	nop
 804cfc2:	90                   	nop
 804cfc3:	d9 c9                	fxch   %st(1)
 804cfc5:	db e9                	fucomi %st(1),%st
 804cfc7:	dd d9                	fstp   %st(1)
 804cfc9:	7a 06                	jp     804cfd1 <_vfprintf_r+0x1e71>
 804cfcb:	0f 84 3e fd ff ff    	je     804cd0f <_vfprintf_r+0x1baf>
 804cfd1:	b8 01 00 00 00       	mov    $0x1,%eax
 804cfd6:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 804cfdc:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
 804cfe2:	01 c1                	add    %eax,%ecx
 804cfe4:	e9 15 f8 ff ff       	jmp    804c7fe <_vfprintf_r+0x169e>
 804cfe9:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804cfef:	31 c0                	xor    %eax,%eax
 804cff1:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804cff8:	00 00 00 
 804cffb:	83 c2 01             	add    $0x1,%edx
 804cffe:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804d004:	0f 49 c2             	cmovns %edx,%eax
 804d007:	e9 7f f8 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804d00c:	b2 02                	mov    $0x2,%dl
 804d00e:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
 804d014:	e9 a5 fe ff ff       	jmp    804cebe <_vfprintf_r+0x1d5e>
 804d019:	8b 55 14             	mov    0x14(%ebp),%edx
 804d01c:	8b 45 14             	mov    0x14(%ebp),%eax
 804d01f:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804d025:	8b 12                	mov    (%edx),%edx
 804d027:	83 c0 04             	add    $0x4,%eax
 804d02a:	89 45 14             	mov    %eax,0x14(%ebp)
 804d02d:	85 d2                	test   %edx,%edx
 804d02f:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804d035:	0f 89 b4 e2 ff ff    	jns    804b2ef <_vfprintf_r+0x18f>
 804d03b:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804d042:	ff ff ff 
 804d045:	89 c8                	mov    %ecx,%eax
 804d047:	e9 81 e2 ff ff       	jmp    804b2cd <_vfprintf_r+0x16d>
 804d04c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d050:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804d056:	85 db                	test   %ebx,%ebx
 804d058:	75 4f                	jne    804d0a9 <_vfprintf_r+0x1f49>
 804d05a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804d061:	75 46                	jne    804d0a9 <_vfprintf_r+0x1f49>
 804d063:	b8 01 00 00 00       	mov    $0x1,%eax
 804d068:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804d06f:	00 00 00 
 804d072:	e9 14 f8 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804d077:	90                   	nop
 804d078:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804d07e:	83 e0 01             	and    $0x1,%eax
 804d081:	0f 85 b2 fd ff ff    	jne    804ce39 <_vfprintf_r+0x1cd9>
 804d087:	85 d2                	test   %edx,%edx
 804d089:	0f 49 c2             	cmovns %edx,%eax
 804d08c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804d093:	00 00 00 
 804d096:	e9 f0 f7 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804d09b:	f7 d9                	neg    %ecx
 804d09d:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
 804d0a4:	e9 4a fd ff ff       	jmp    804cdf3 <_vfprintf_r+0x1c93>
 804d0a9:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804d0af:	31 c0                	xor    %eax,%eax
 804d0b1:	83 c2 02             	add    $0x2,%edx
 804d0b4:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804d0ba:	0f 49 c2             	cmovns %edx,%eax
 804d0bd:	e9 c9 f7 ff ff       	jmp    804c88b <_vfprintf_r+0x172b>
 804d0c2:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
 804d0c8:	e9 45 fd ff ff       	jmp    804ce12 <_vfprintf_r+0x1cb2>
 804d0cd:	8d 76 00             	lea    0x0(%esi),%esi

0804d0d0 <vfprintf>:
 804d0d0:	55                   	push   %ebp
 804d0d1:	89 e5                	mov    %esp,%ebp
 804d0d3:	83 ec 18             	sub    $0x18,%esp
 804d0d6:	e8 15 21 00 00       	call   804f1f0 <__getreent>
 804d0db:	8b 55 10             	mov    0x10(%ebp),%edx
 804d0de:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804d0e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 804d0e5:	89 04 24             	mov    %eax,(%esp)
 804d0e8:	89 54 24 08          	mov    %edx,0x8(%esp)
 804d0ec:	8b 55 08             	mov    0x8(%ebp),%edx
 804d0ef:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d0f3:	e8 68 e0 ff ff       	call   804b160 <_vfprintf_r>
 804d0f8:	c9                   	leave  
 804d0f9:	c3                   	ret    
 804d0fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804d100 <__sbprintf>:
 804d100:	55                   	push   %ebp
 804d101:	89 e5                	mov    %esp,%ebp
 804d103:	57                   	push   %edi
 804d104:	89 c7                	mov    %eax,%edi
 804d106:	56                   	push   %esi
 804d107:	53                   	push   %ebx
 804d108:	89 d3                	mov    %edx,%ebx
 804d10a:	81 ec 9c 04 00 00    	sub    $0x49c,%esp
 804d110:	0f b7 42 0c          	movzwl 0xc(%edx),%eax
 804d114:	c7 85 88 fb ff ff 00 	movl   $0x400,-0x478(%ebp)
 804d11b:	04 00 00 
 804d11e:	c7 85 94 fb ff ff 00 	movl   $0x400,-0x46c(%ebp)
 804d125:	04 00 00 
 804d128:	c7 85 98 fb ff ff 00 	movl   $0x0,-0x468(%ebp)
 804d12f:	00 00 00 
 804d132:	83 e0 fd             	and    $0xfffffffd,%eax
 804d135:	66 89 85 8c fb ff ff 	mov    %ax,-0x474(%ebp)
 804d13c:	8b 42 64             	mov    0x64(%edx),%eax
 804d13f:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 804d145:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
 804d149:	66 89 85 8e fb ff ff 	mov    %ax,-0x472(%ebp)
 804d150:	8b 42 1c             	mov    0x1c(%edx),%eax
 804d153:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
 804d159:	8b 42 24             	mov    0x24(%edx),%eax
 804d15c:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
 804d162:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804d166:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d16a:	89 3c 24             	mov    %edi,(%esp)
 804d16d:	89 85 a4 fb ff ff    	mov    %eax,-0x45c(%ebp)
 804d173:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 804d179:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
 804d17f:	89 85 90 fb ff ff    	mov    %eax,-0x470(%ebp)
 804d185:	8b 45 08             	mov    0x8(%ebp),%eax
 804d188:	89 95 74 fb ff ff    	mov    %edx,-0x48c(%ebp)
 804d18e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804d192:	e8 c9 df ff ff       	call   804b160 <_vfprintf_r>
 804d197:	85 c0                	test   %eax,%eax
 804d199:	89 c6                	mov    %eax,%esi
 804d19b:	78 1c                	js     804d1b9 <__sbprintf+0xb9>
 804d19d:	8b 95 74 fb ff ff    	mov    -0x48c(%ebp),%edx
 804d1a3:	89 3c 24             	mov    %edi,(%esp)
 804d1a6:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d1aa:	e8 31 17 00 00       	call   804e8e0 <_fflush_r>
 804d1af:	85 c0                	test   %eax,%eax
 804d1b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d1b6:	0f 45 f0             	cmovne %eax,%esi
 804d1b9:	f6 85 8c fb ff ff 40 	testb  $0x40,-0x474(%ebp)
 804d1c0:	74 05                	je     804d1c7 <__sbprintf+0xc7>
 804d1c2:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 804d1c7:	81 c4 9c 04 00 00    	add    $0x49c,%esp
 804d1cd:	89 f0                	mov    %esi,%eax
 804d1cf:	5b                   	pop    %ebx
 804d1d0:	5e                   	pop    %esi
 804d1d1:	5f                   	pop    %edi
 804d1d2:	5d                   	pop    %ebp
 804d1d3:	c3                   	ret    
 804d1d4:	66 90                	xchg   %ax,%ax
 804d1d6:	66 90                	xchg   %ax,%ax
 804d1d8:	66 90                	xchg   %ax,%ax
 804d1da:	66 90                	xchg   %ax,%ax
 804d1dc:	66 90                	xchg   %ax,%ax
 804d1de:	66 90                	xchg   %ax,%ax

0804d1e0 <__swsetup_r>:
 804d1e0:	55                   	push   %ebp
 804d1e1:	89 e5                	mov    %esp,%ebp
 804d1e3:	53                   	push   %ebx
 804d1e4:	83 ec 14             	sub    $0x14,%esp
 804d1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804d1ea:	e8 01 20 00 00       	call   804f1f0 <__getreent>
 804d1ef:	85 c0                	test   %eax,%eax
 804d1f1:	74 0b                	je     804d1fe <__swsetup_r+0x1e>
 804d1f3:	8b 50 38             	mov    0x38(%eax),%edx
 804d1f6:	85 d2                	test   %edx,%edx
 804d1f8:	0f 84 a2 00 00 00    	je     804d2a0 <__swsetup_r+0xc0>
 804d1fe:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d202:	a8 08                	test   $0x8,%al
 804d204:	74 2a                	je     804d230 <__swsetup_r+0x50>
 804d206:	8b 53 10             	mov    0x10(%ebx),%edx
 804d209:	85 d2                	test   %edx,%edx
 804d20b:	74 3d                	je     804d24a <__swsetup_r+0x6a>
 804d20d:	a8 01                	test   $0x1,%al
 804d20f:	75 5f                	jne    804d270 <__swsetup_r+0x90>
 804d211:	31 c9                	xor    %ecx,%ecx
 804d213:	a8 02                	test   $0x2,%al
 804d215:	75 03                	jne    804d21a <__swsetup_r+0x3a>
 804d217:	8b 4b 14             	mov    0x14(%ebx),%ecx
 804d21a:	31 c0                	xor    %eax,%eax
 804d21c:	85 d2                	test   %edx,%edx
 804d21e:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804d221:	74 62                	je     804d285 <__swsetup_r+0xa5>
 804d223:	83 c4 14             	add    $0x14,%esp
 804d226:	5b                   	pop    %ebx
 804d227:	5d                   	pop    %ebp
 804d228:	c3                   	ret    
 804d229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d230:	a8 10                	test   $0x10,%al
 804d232:	0f 84 b8 00 00 00    	je     804d2f0 <__swsetup_r+0x110>
 804d238:	a8 04                	test   $0x4,%al
 804d23a:	75 74                	jne    804d2b0 <__swsetup_r+0xd0>
 804d23c:	8b 53 10             	mov    0x10(%ebx),%edx
 804d23f:	83 c8 08             	or     $0x8,%eax
 804d242:	85 d2                	test   %edx,%edx
 804d244:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804d248:	75 c3                	jne    804d20d <__swsetup_r+0x2d>
 804d24a:	89 c1                	mov    %eax,%ecx
 804d24c:	66 81 e1 80 02       	and    $0x280,%cx
 804d251:	66 81 f9 00 02       	cmp    $0x200,%cx
 804d256:	74 b5                	je     804d20d <__swsetup_r+0x2d>
 804d258:	8b 45 08             	mov    0x8(%ebp),%eax
 804d25b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804d25f:	89 04 24             	mov    %eax,(%esp)
 804d262:	e8 a9 20 00 00       	call   804f310 <__smakebuf_r>
 804d267:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d26b:	8b 53 10             	mov    0x10(%ebx),%edx
 804d26e:	eb 9d                	jmp    804d20d <__swsetup_r+0x2d>
 804d270:	8b 43 14             	mov    0x14(%ebx),%eax
 804d273:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804d27a:	f7 d8                	neg    %eax
 804d27c:	89 43 18             	mov    %eax,0x18(%ebx)
 804d27f:	31 c0                	xor    %eax,%eax
 804d281:	85 d2                	test   %edx,%edx
 804d283:	75 9e                	jne    804d223 <__swsetup_r+0x43>
 804d285:	0f b7 53 0c          	movzwl 0xc(%ebx),%edx
 804d289:	f6 c2 80             	test   $0x80,%dl
 804d28c:	74 95                	je     804d223 <__swsetup_r+0x43>
 804d28e:	83 ca 40             	or     $0x40,%edx
 804d291:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d296:	66 89 53 0c          	mov    %dx,0xc(%ebx)
 804d29a:	eb 87                	jmp    804d223 <__swsetup_r+0x43>
 804d29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d2a0:	89 04 24             	mov    %eax,(%esp)
 804d2a3:	e8 a8 17 00 00       	call   804ea50 <__sinit>
 804d2a8:	e9 51 ff ff ff       	jmp    804d1fe <__swsetup_r+0x1e>
 804d2ad:	8d 76 00             	lea    0x0(%esi),%esi
 804d2b0:	8b 53 30             	mov    0x30(%ebx),%edx
 804d2b3:	85 d2                	test   %edx,%edx
 804d2b5:	74 21                	je     804d2d8 <__swsetup_r+0xf8>
 804d2b7:	8d 4b 40             	lea    0x40(%ebx),%ecx
 804d2ba:	39 ca                	cmp    %ecx,%edx
 804d2bc:	74 13                	je     804d2d1 <__swsetup_r+0xf1>
 804d2be:	8b 45 08             	mov    0x8(%ebp),%eax
 804d2c1:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d2c5:	89 04 24             	mov    %eax,(%esp)
 804d2c8:	e8 d3 1b 00 00       	call   804eea0 <_free_r>
 804d2cd:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d2d1:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 804d2d8:	8b 53 10             	mov    0x10(%ebx),%edx
 804d2db:	83 e0 db             	and    $0xffffffdb,%eax
 804d2de:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804d2e5:	89 13                	mov    %edx,(%ebx)
 804d2e7:	e9 53 ff ff ff       	jmp    804d23f <__swsetup_r+0x5f>
 804d2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d2f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d2f3:	83 c8 40             	or     $0x40,%eax
 804d2f6:	c7 01 09 00 00 00    	movl   $0x9,(%ecx)
 804d2fc:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804d300:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d305:	e9 19 ff ff ff       	jmp    804d223 <__swsetup_r+0x43>
 804d30a:	66 90                	xchg   %ax,%ax
 804d30c:	66 90                	xchg   %ax,%ax
 804d30e:	66 90                	xchg   %ax,%ax

0804d310 <quorem>:
 804d310:	55                   	push   %ebp
 804d311:	89 c1                	mov    %eax,%ecx
 804d313:	89 e5                	mov    %esp,%ebp
 804d315:	57                   	push   %edi
 804d316:	89 d7                	mov    %edx,%edi
 804d318:	56                   	push   %esi
 804d319:	53                   	push   %ebx
 804d31a:	83 ec 3c             	sub    $0x3c,%esp
 804d31d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804d320:	8b 42 10             	mov    0x10(%edx),%eax
 804d323:	3b 41 10             	cmp    0x10(%ecx),%eax
 804d326:	89 55 c8             	mov    %edx,-0x38(%ebp)
 804d329:	89 ca                	mov    %ecx,%edx
 804d32b:	0f 8f 9f 01 00 00    	jg     804d4d0 <quorem+0x1c0>
 804d331:	83 e8 01             	sub    $0x1,%eax
 804d334:	83 c7 14             	add    $0x14,%edi
 804d337:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d33a:	c1 e0 02             	shl    $0x2,%eax
 804d33d:	83 c2 14             	add    $0x14,%edx
 804d340:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
 804d343:	01 d0                	add    %edx,%eax
 804d345:	89 55 d8             	mov    %edx,-0x28(%ebp)
 804d348:	8b 13                	mov    (%ebx),%edx
 804d34a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804d34d:	8b 00                	mov    (%eax),%eax
 804d34f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 804d352:	8d 4a 01             	lea    0x1(%edx),%ecx
 804d355:	31 d2                	xor    %edx,%edx
 804d357:	f7 f1                	div    %ecx
 804d359:	85 c0                	test   %eax,%eax
 804d35b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804d35e:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804d361:	0f 84 b5 00 00 00    	je     804d41c <quorem+0x10c>
 804d367:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d36a:	31 f6                	xor    %esi,%esi
 804d36c:	89 fa                	mov    %edi,%edx
 804d36e:	89 7d c0             	mov    %edi,-0x40(%ebp)
 804d371:	89 f7                	mov    %esi,%edi
 804d373:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 804d37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d380:	83 c2 04             	add    $0x4,%edx
 804d383:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d386:	83 c0 04             	add    $0x4,%eax
 804d389:	0f b7 ce             	movzwl %si,%ecx
 804d38c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
 804d390:	03 4d dc             	add    -0x24(%ebp),%ecx
 804d393:	c1 ee 10             	shr    $0x10,%esi
 804d396:	0f af 75 e0          	imul   -0x20(%ebp),%esi
 804d39a:	89 cb                	mov    %ecx,%ebx
 804d39c:	0f b7 c9             	movzwl %cx,%ecx
 804d39f:	c1 eb 10             	shr    $0x10,%ebx
 804d3a2:	29 cf                	sub    %ecx,%edi
 804d3a4:	01 f3                	add    %esi,%ebx
 804d3a6:	89 de                	mov    %ebx,%esi
 804d3a8:	0f b7 db             	movzwl %bx,%ebx
 804d3ab:	c1 ee 10             	shr    $0x10,%esi
 804d3ae:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804d3b1:	8b 70 fc             	mov    -0x4(%eax),%esi
 804d3b4:	0f b7 ce             	movzwl %si,%ecx
 804d3b7:	01 f9                	add    %edi,%ecx
 804d3b9:	c1 ee 10             	shr    $0x10,%esi
 804d3bc:	29 de                	sub    %ebx,%esi
 804d3be:	89 cb                	mov    %ecx,%ebx
 804d3c0:	c1 fb 10             	sar    $0x10,%ebx
 804d3c3:	0f b7 c9             	movzwl %cx,%ecx
 804d3c6:	01 de                	add    %ebx,%esi
 804d3c8:	89 f7                	mov    %esi,%edi
 804d3ca:	c1 e6 10             	shl    $0x10,%esi
 804d3cd:	09 ce                	or     %ecx,%esi
 804d3cf:	c1 ff 10             	sar    $0x10,%edi
 804d3d2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 804d3d5:	89 70 fc             	mov    %esi,-0x4(%eax)
 804d3d8:	73 a6                	jae    804d380 <quorem+0x70>
 804d3da:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804d3dd:	8b 7d c0             	mov    -0x40(%ebp),%edi
 804d3e0:	8b 10                	mov    (%eax),%edx
 804d3e2:	85 d2                	test   %edx,%edx
 804d3e4:	75 36                	jne    804d41c <quorem+0x10c>
 804d3e6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804d3e9:	89 c2                	mov    %eax,%edx
 804d3eb:	83 e8 04             	sub    $0x4,%eax
 804d3ee:	39 c1                	cmp    %eax,%ecx
 804d3f0:	73 21                	jae    804d413 <quorem+0x103>
 804d3f2:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d3f5:	85 f6                	test   %esi,%esi
 804d3f7:	75 1a                	jne    804d413 <quorem+0x103>
 804d3f9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804d3fc:	eb 08                	jmp    804d406 <quorem+0xf6>
 804d3fe:	66 90                	xchg   %ax,%ax
 804d400:	8b 18                	mov    (%eax),%ebx
 804d402:	85 db                	test   %ebx,%ebx
 804d404:	75 0a                	jne    804d410 <quorem+0x100>
 804d406:	83 e8 04             	sub    $0x4,%eax
 804d409:	83 ea 01             	sub    $0x1,%edx
 804d40c:	39 c1                	cmp    %eax,%ecx
 804d40e:	72 f0                	jb     804d400 <quorem+0xf0>
 804d410:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804d413:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d416:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804d419:	89 50 10             	mov    %edx,0x10(%eax)
 804d41c:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804d41f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804d423:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d426:	89 04 24             	mov    %eax,(%esp)
 804d429:	e8 22 30 00 00       	call   8050450 <__mcmp>
 804d42e:	85 c0                	test   %eax,%eax
 804d430:	0f 88 8e 00 00 00    	js     804d4c4 <quorem+0x1b4>
 804d436:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804d439:	31 f6                	xor    %esi,%esi
 804d43b:	83 c0 01             	add    $0x1,%eax
 804d43e:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804d441:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d448:	83 c7 04             	add    $0x4,%edi
 804d44b:	8b 4f fc             	mov    -0x4(%edi),%ecx
 804d44e:	83 c0 04             	add    $0x4,%eax
 804d451:	8b 58 fc             	mov    -0x4(%eax),%ebx
 804d454:	0f b7 d1             	movzwl %cx,%edx
 804d457:	29 d6                	sub    %edx,%esi
 804d459:	0f b7 d3             	movzwl %bx,%edx
 804d45c:	01 f2                	add    %esi,%edx
 804d45e:	c1 e9 10             	shr    $0x10,%ecx
 804d461:	c1 eb 10             	shr    $0x10,%ebx
 804d464:	29 cb                	sub    %ecx,%ebx
 804d466:	89 d1                	mov    %edx,%ecx
 804d468:	c1 f9 10             	sar    $0x10,%ecx
 804d46b:	0f b7 d2             	movzwl %dx,%edx
 804d46e:	01 cb                	add    %ecx,%ebx
 804d470:	89 de                	mov    %ebx,%esi
 804d472:	c1 e3 10             	shl    $0x10,%ebx
 804d475:	09 d3                	or     %edx,%ebx
 804d477:	c1 fe 10             	sar    $0x10,%esi
 804d47a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 804d47d:	89 58 fc             	mov    %ebx,-0x4(%eax)
 804d480:	73 c6                	jae    804d448 <quorem+0x138>
 804d482:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d485:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 804d488:	8d 14 b8             	lea    (%eax,%edi,4),%edx
 804d48b:	8b 02                	mov    (%edx),%eax
 804d48d:	85 c0                	test   %eax,%eax
 804d48f:	75 33                	jne    804d4c4 <quorem+0x1b4>
 804d491:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804d494:	8d 42 fc             	lea    -0x4(%edx),%eax
 804d497:	39 c1                	cmp    %eax,%ecx
 804d499:	73 20                	jae    804d4bb <quorem+0x1ab>
 804d49b:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d49e:	85 f6                	test   %esi,%esi
 804d4a0:	75 19                	jne    804d4bb <quorem+0x1ab>
 804d4a2:	89 fa                	mov    %edi,%edx
 804d4a4:	eb 08                	jmp    804d4ae <quorem+0x19e>
 804d4a6:	66 90                	xchg   %ax,%ax
 804d4a8:	8b 18                	mov    (%eax),%ebx
 804d4aa:	85 db                	test   %ebx,%ebx
 804d4ac:	75 0a                	jne    804d4b8 <quorem+0x1a8>
 804d4ae:	83 e8 04             	sub    $0x4,%eax
 804d4b1:	83 ea 01             	sub    $0x1,%edx
 804d4b4:	39 c1                	cmp    %eax,%ecx
 804d4b6:	72 f0                	jb     804d4a8 <quorem+0x198>
 804d4b8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804d4bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d4be:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 804d4c1:	89 78 10             	mov    %edi,0x10(%eax)
 804d4c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804d4c7:	83 c4 3c             	add    $0x3c,%esp
 804d4ca:	5b                   	pop    %ebx
 804d4cb:	5e                   	pop    %esi
 804d4cc:	5f                   	pop    %edi
 804d4cd:	5d                   	pop    %ebp
 804d4ce:	c3                   	ret    
 804d4cf:	90                   	nop
 804d4d0:	83 c4 3c             	add    $0x3c,%esp
 804d4d3:	31 c0                	xor    %eax,%eax
 804d4d5:	5b                   	pop    %ebx
 804d4d6:	5e                   	pop    %esi
 804d4d7:	5f                   	pop    %edi
 804d4d8:	5d                   	pop    %ebp
 804d4d9:	c3                   	ret    
 804d4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804d4e0 <_dtoa_r>:
 804d4e0:	55                   	push   %ebp
 804d4e1:	89 e5                	mov    %esp,%ebp
 804d4e3:	57                   	push   %edi
 804d4e4:	56                   	push   %esi
 804d4e5:	53                   	push   %ebx
 804d4e6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 804d4ec:	8b 75 08             	mov    0x8(%ebp),%esi
 804d4ef:	dd 45 0c             	fldl   0xc(%ebp)
 804d4f2:	8b 5d 20             	mov    0x20(%ebp),%ebx
 804d4f5:	dd 5d c0             	fstpl  -0x40(%ebp)
 804d4f8:	8b 46 40             	mov    0x40(%esi),%eax
 804d4fb:	85 c0                	test   %eax,%eax
 804d4fd:	74 23                	je     804d522 <_dtoa_r+0x42>
 804d4ff:	8b 4e 44             	mov    0x44(%esi),%ecx
 804d502:	ba 01 00 00 00       	mov    $0x1,%edx
 804d507:	d3 e2                	shl    %cl,%edx
 804d509:	89 48 04             	mov    %ecx,0x4(%eax)
 804d50c:	89 50 08             	mov    %edx,0x8(%eax)
 804d50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804d513:	89 34 24             	mov    %esi,(%esp)
 804d516:	e8 15 28 00 00       	call   804fd30 <_Bfree>
 804d51b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
 804d522:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 804d525:	85 ff                	test   %edi,%edi
 804d527:	0f 88 3b 02 00 00    	js     804d768 <_dtoa_r+0x288>
 804d52d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804d533:	89 f8                	mov    %edi,%eax
 804d535:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
 804d53a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
 804d53f:	0f 84 e3 01 00 00    	je     804d728 <_dtoa_r+0x248>
 804d545:	dd 45 c0             	fldl   -0x40(%ebp)
 804d548:	d9 ee                	fldz   
 804d54a:	d9 c9                	fxch   %st(1)
 804d54c:	db e9                	fucomi %st(1),%st
 804d54e:	dd d9                	fstp   %st(1)
 804d550:	7a 36                	jp     804d588 <_dtoa_r+0xa8>
 804d552:	75 34                	jne    804d588 <_dtoa_r+0xa8>
 804d554:	dd d8                	fstp   %st(0)
 804d556:	8b 4d 24             	mov    0x24(%ebp),%ecx
 804d559:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804d55c:	85 c9                	test   %ecx,%ecx
 804d55e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804d564:	0f 84 4e 02 00 00    	je     804d7b8 <_dtoa_r+0x2d8>
 804d56a:	8b 45 24             	mov    0x24(%ebp),%eax
 804d56d:	c7 00 28 43 05 08    	movl   $0x8054328,(%eax)
 804d573:	b8 27 43 05 08       	mov    $0x8054327,%eax
 804d578:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804d57e:	5b                   	pop    %ebx
 804d57f:	5e                   	pop    %esi
 804d580:	5f                   	pop    %edi
 804d581:	5d                   	pop    %ebp
 804d582:	c3                   	ret    
 804d583:	90                   	nop
 804d584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d588:	8d 45 e0             	lea    -0x20(%ebp),%eax
 804d58b:	89 fb                	mov    %edi,%ebx
 804d58d:	89 44 24 10          	mov    %eax,0x10(%esp)
 804d591:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 804d594:	dd 54 24 04          	fstl   0x4(%esp)
 804d598:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804d59c:	dd 5d b8             	fstpl  -0x48(%ebp)
 804d59f:	89 34 24             	mov    %esi,(%esp)
 804d5a2:	c1 eb 14             	shr    $0x14,%ebx
 804d5a5:	e8 f6 31 00 00       	call   80507a0 <__d2b>
 804d5aa:	85 db                	test   %ebx,%ebx
 804d5ac:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804d5af:	0f 85 db 01 00 00    	jne    804d790 <_dtoa_r+0x2b0>
 804d5b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804d5b8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 804d5bb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804d5be:	01 c3                	add    %eax,%ebx
 804d5c0:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
 804d5c6:	0f 8c ec 07 00 00    	jl     804ddb8 <_dtoa_r+0x8d8>
 804d5cc:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804d5cf:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
 804d5d4:	89 f8                	mov    %edi,%eax
 804d5d6:	29 d9                	sub    %ebx,%ecx
 804d5d8:	d3 e0                	shl    %cl,%eax
 804d5da:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
 804d5e0:	d3 ea                	shr    %cl,%edx
 804d5e2:	09 d0                	or     %edx,%eax
 804d5e4:	31 d2                	xor    %edx,%edx
 804d5e6:	83 eb 01             	sub    $0x1,%ebx
 804d5e9:	89 55 cc             	mov    %edx,-0x34(%ebp)
 804d5ec:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804d5ef:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804d5f2:	df 6d c8             	fildll -0x38(%ebp)
 804d5f5:	dd 5d b8             	fstpl  -0x48(%ebp)
 804d5f8:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
 804d5ff:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
 804d606:	dd 45 b8             	fldl   -0x48(%ebp)
 804d609:	d8 25 80 49 05 08    	fsubs  0x8054980
 804d60f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 804d612:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804d615:	dc 0d 98 49 05 08    	fmull  0x8054998
 804d61b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804d61f:	b4 0c                	mov    $0xc,%ah
 804d621:	dc 05 a0 49 05 08    	faddl  0x80549a0
 804d627:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804d62b:	db 45 d4             	fildl  -0x2c(%ebp)
 804d62e:	dc 0d a8 49 05 08    	fmull  0x80549a8
 804d634:	de c1                	faddp  %st,%st(1)
 804d636:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d639:	db 55 b8             	fistl  -0x48(%ebp)
 804d63c:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d63f:	d9 ee                	fldz   
 804d641:	df e9                	fucomip %st(1),%st
 804d643:	0f 87 27 07 00 00    	ja     804dd70 <_dtoa_r+0x890>
 804d649:	dd d8                	fstp   %st(0)
 804d64b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
 804d64f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
 804d656:	77 24                	ja     804d67c <_dtoa_r+0x19c>
 804d658:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d65b:	dd 04 c5 60 4a 05 08 	fldl   0x8054a60(,%eax,8)
 804d662:	dd 45 c0             	fldl   -0x40(%ebp)
 804d665:	d9 c9                	fxch   %st(1)
 804d667:	df e9                	fucomip %st(1),%st
 804d669:	dd d8                	fstp   %st(0)
 804d66b:	0f 86 5f 07 00 00    	jbe    804ddd0 <_dtoa_r+0x8f0>
 804d671:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804d675:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
 804d67c:	89 d0                	mov    %edx,%eax
 804d67e:	29 d8                	sub    %ebx,%eax
 804d680:	83 e8 01             	sub    $0x1,%eax
 804d683:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
 804d68a:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804d68d:	0f 88 0d 07 00 00    	js     804dda0 <_dtoa_r+0x8c0>
 804d693:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d696:	85 c0                	test   %eax,%eax
 804d698:	0f 88 ea 06 00 00    	js     804dd88 <_dtoa_r+0x8a8>
 804d69e:	01 45 ac             	add    %eax,-0x54(%ebp)
 804d6a1:	89 45 94             	mov    %eax,-0x6c(%ebp)
 804d6a4:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804d6ab:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
 804d6af:	0f 87 0b 03 00 00    	ja     804d9c0 <_dtoa_r+0x4e0>
 804d6b5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
 804d6b9:	0f 8e 23 10 00 00    	jle    804e6e2 <_dtoa_r+0x1202>
 804d6bf:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
 804d6c3:	31 c0                	xor    %eax,%eax
 804d6c5:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
 804d6c9:	0f 84 43 0d 00 00    	je     804e412 <_dtoa_r+0xf32>
 804d6cf:	0f 8e f3 00 00 00    	jle    804d7c8 <_dtoa_r+0x2e8>
 804d6d5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
 804d6d9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
 804d6e0:	0f 84 f3 00 00 00    	je     804d7d9 <_dtoa_r+0x2f9>
 804d6e6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
 804d6ea:	0f 85 d7 02 00 00    	jne    804d9c7 <_dtoa_r+0x4e7>
 804d6f0:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804d6f3:	03 5d 18             	add    0x18(%ebp),%ebx
 804d6f6:	89 5d 90             	mov    %ebx,-0x70(%ebp)
 804d6f9:	83 c3 01             	add    $0x1,%ebx
 804d6fc:	83 fb 0e             	cmp    $0xe,%ebx
 804d6ff:	0f 96 c2             	setbe  %dl
 804d702:	85 db                	test   %ebx,%ebx
 804d704:	89 5d a8             	mov    %ebx,-0x58(%ebp)
 804d707:	0f 8e a7 08 00 00    	jle    804dfb4 <_dtoa_r+0xad4>
 804d70d:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804d710:	83 fb 0e             	cmp    $0xe,%ebx
 804d713:	89 df                	mov    %ebx,%edi
 804d715:	0f 96 45 b4          	setbe  -0x4c(%ebp)
 804d719:	20 45 b4             	and    %al,-0x4c(%ebp)
 804d71c:	e9 d6 00 00 00       	jmp    804d7f7 <_dtoa_r+0x317>
 804d721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d728:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804d72b:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804d72e:	85 d2                	test   %edx,%edx
 804d730:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
 804d736:	b8 79 49 05 08       	mov    $0x8054979,%eax
 804d73b:	74 43                	je     804d780 <_dtoa_r+0x2a0>
 804d73d:	8b 5d 24             	mov    0x24(%ebp),%ebx
 804d740:	85 db                	test   %ebx,%ebx
 804d742:	0f 84 30 fe ff ff    	je     804d578 <_dtoa_r+0x98>
 804d748:	8b 75 24             	mov    0x24(%ebp),%esi
 804d74b:	8d 50 08             	lea    0x8(%eax),%edx
 804d74e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
 804d752:	8d 48 03             	lea    0x3(%eax),%ecx
 804d755:	0f 44 d1             	cmove  %ecx,%edx
 804d758:	89 16                	mov    %edx,(%esi)
 804d75a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804d760:	5b                   	pop    %ebx
 804d761:	5e                   	pop    %esi
 804d762:	5f                   	pop    %edi
 804d763:	5d                   	pop    %ebp
 804d764:	c3                   	ret    
 804d765:	8d 76 00             	lea    0x0(%esi),%esi
 804d768:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
 804d76e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 804d774:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 804d777:	e9 b7 fd ff ff       	jmp    804d533 <_dtoa_r+0x53>
 804d77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d780:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
 804d786:	ba 70 49 05 08       	mov    $0x8054970,%edx
 804d78b:	0f 44 c2             	cmove  %edx,%eax
 804d78e:	eb ad                	jmp    804d73d <_dtoa_r+0x25d>
 804d790:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804d793:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
 804d799:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804d79c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
 804d7a3:	25 ff ff 0f 00       	and    $0xfffff,%eax
 804d7a8:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
 804d7ad:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804d7b0:	e9 51 fe ff ff       	jmp    804d606 <_dtoa_r+0x126>
 804d7b5:	8d 76 00             	lea    0x0(%esi),%esi
 804d7b8:	b8 27 43 05 08       	mov    $0x8054327,%eax
 804d7bd:	e9 b6 fd ff ff       	jmp    804d578 <_dtoa_r+0x98>
 804d7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d7c8:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804d7cc:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
 804d7d3:	0f 85 ee 01 00 00    	jne    804d9c7 <_dtoa_r+0x4e7>
 804d7d9:	8b 55 18             	mov    0x18(%ebp),%edx
 804d7dc:	85 d2                	test   %edx,%edx
 804d7de:	0f 8e b6 07 00 00    	jle    804df9a <_dtoa_r+0xaba>
 804d7e4:	8b 7d 18             	mov    0x18(%ebp),%edi
 804d7e7:	83 ff 0e             	cmp    $0xe,%edi
 804d7ea:	0f 96 45 b4          	setbe  -0x4c(%ebp)
 804d7ee:	20 45 b4             	and    %al,-0x4c(%ebp)
 804d7f1:	89 7d 90             	mov    %edi,-0x70(%ebp)
 804d7f4:	89 7d a8             	mov    %edi,-0x58(%ebp)
 804d7f7:	83 ff 17             	cmp    $0x17,%edi
 804d7fa:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804d801:	0f 86 e5 0e 00 00    	jbe    804e6ec <_dtoa_r+0x120c>
 804d807:	b9 01 00 00 00       	mov    $0x1,%ecx
 804d80c:	b8 04 00 00 00       	mov    $0x4,%eax
 804d811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d818:	01 c0                	add    %eax,%eax
 804d81a:	89 ca                	mov    %ecx,%edx
 804d81c:	8d 58 14             	lea    0x14(%eax),%ebx
 804d81f:	39 fb                	cmp    %edi,%ebx
 804d821:	8d 49 01             	lea    0x1(%ecx),%ecx
 804d824:	76 f2                	jbe    804d818 <_dtoa_r+0x338>
 804d826:	89 56 44             	mov    %edx,0x44(%esi)
 804d829:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d82d:	89 34 24             	mov    %esi,(%esp)
 804d830:	e8 5b 24 00 00       	call   804fc90 <_Balloc>
 804d835:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
 804d839:	89 c7                	mov    %eax,%edi
 804d83b:	89 46 40             	mov    %eax,0x40(%esi)
 804d83e:	0f 84 bb 01 00 00    	je     804d9ff <_dtoa_r+0x51f>
 804d844:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804d847:	dd 45 c0             	fldl   -0x40(%ebp)
 804d84a:	85 db                	test   %ebx,%ebx
 804d84c:	0f 8e de 07 00 00    	jle    804e030 <_dtoa_r+0xb50>
 804d852:	89 d8                	mov    %ebx,%eax
 804d854:	83 e0 0f             	and    $0xf,%eax
 804d857:	dd 04 c5 60 4a 05 08 	fldl   0x8054a60(,%eax,8)
 804d85e:	89 d8                	mov    %ebx,%eax
 804d860:	c1 f8 04             	sar    $0x4,%eax
 804d863:	a8 10                	test   $0x10,%al
 804d865:	0f 84 cd 05 00 00    	je     804de38 <_dtoa_r+0x958>
 804d86b:	dd 05 40 4a 05 08    	fldl   0x8054a40
 804d871:	83 e0 0f             	and    $0xf,%eax
 804d874:	b9 03 00 00 00       	mov    $0x3,%ecx
 804d879:	d8 fa                	fdivr  %st(2),%st
 804d87b:	85 c0                	test   %eax,%eax
 804d87d:	74 22                	je     804d8a1 <_dtoa_r+0x3c1>
 804d87f:	31 d2                	xor    %edx,%edx
 804d881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d888:	a8 01                	test   $0x1,%al
 804d88a:	74 0e                	je     804d89a <_dtoa_r+0x3ba>
 804d88c:	d9 c9                	fxch   %st(1)
 804d88e:	dc 0c d5 20 4a 05 08 	fmull  0x8054a20(,%edx,8)
 804d895:	d9 c9                	fxch   %st(1)
 804d897:	83 c1 01             	add    $0x1,%ecx
 804d89a:	83 c2 01             	add    $0x1,%edx
 804d89d:	d1 f8                	sar    %eax
 804d89f:	75 e7                	jne    804d888 <_dtoa_r+0x3a8>
 804d8a1:	de f1                	fdivp  %st,%st(1)
 804d8a3:	8b 45 9c             	mov    -0x64(%ebp),%eax
 804d8a6:	85 c0                	test   %eax,%eax
 804d8a8:	74 0a                	je     804d8b4 <_dtoa_r+0x3d4>
 804d8aa:	d9 e8                	fld1   
 804d8ac:	df e9                	fucomip %st(1),%st
 804d8ae:	0f 87 92 0b 00 00    	ja     804e446 <_dtoa_r+0xf66>
 804d8b4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804d8b7:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804d8ba:	db 45 d4             	fildl  -0x2c(%ebp)
 804d8bd:	d8 c9                	fmul   %st(1),%st
 804d8bf:	d8 05 8c 49 05 08    	fadds  0x805498c
 804d8c5:	dd 5d c0             	fstpl  -0x40(%ebp)
 804d8c8:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804d8cf:	85 c0                	test   %eax,%eax
 804d8d1:	0f 84 89 05 00 00    	je     804de60 <_dtoa_r+0x980>
 804d8d7:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d8da:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 804d8dd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804d8e0:	8b 45 98             	mov    -0x68(%ebp),%eax
 804d8e3:	85 c0                	test   %eax,%eax
 804d8e5:	0f 84 b5 07 00 00    	je     804e0a0 <_dtoa_r+0xbc0>
 804d8eb:	d9 05 94 49 05 08    	flds   0x8054994
 804d8f1:	8d 57 01             	lea    0x1(%edi),%edx
 804d8f4:	dc 34 cd 58 4a 05 08 	fdivl  0x8054a58(,%ecx,8)
 804d8fb:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804d8fe:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804d902:	b4 0c                	mov    $0xc,%ah
 804d904:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804d908:	dc 65 c0             	fsubl  -0x40(%ebp)
 804d90b:	d9 c9                	fxch   %st(1)
 804d90d:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d910:	db 55 d4             	fistl  -0x2c(%ebp)
 804d913:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d916:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804d919:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d91c:	83 c0 30             	add    $0x30,%eax
 804d91f:	db 45 d4             	fildl  -0x2c(%ebp)
 804d922:	de e9                	fsubrp %st,%st(1)
 804d924:	d9 c9                	fxch   %st(1)
 804d926:	88 07                	mov    %al,(%edi)
 804d928:	db e9                	fucomi %st(1),%st
 804d92a:	77 7f                	ja     804d9ab <_dtoa_r+0x4cb>
 804d92c:	d9 c1                	fld    %st(1)
 804d92e:	d8 2d 84 49 05 08    	fsubrs 0x8054984
 804d934:	d9 c9                	fxch   %st(1)
 804d936:	db e9                	fucomi %st(1),%st
 804d938:	dd d9                	fstp   %st(1)
 804d93a:	0f 87 33 0c 00 00    	ja     804e573 <_dtoa_r+0x1093>
 804d940:	83 f9 01             	cmp    $0x1,%ecx
 804d943:	0f 8e c4 06 00 00    	jle    804e00d <_dtoa_r+0xb2d>
 804d949:	01 f9                	add    %edi,%ecx
 804d94b:	d9 05 88 49 05 08    	flds   0x8054988
 804d951:	eb 25                	jmp    804d978 <_dtoa_r+0x498>
 804d953:	90                   	nop
 804d954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d958:	d9 c1                	fld    %st(1)
 804d95a:	d8 2d 84 49 05 08    	fsubrs 0x8054984
 804d960:	d9 c9                	fxch   %st(1)
 804d962:	db e9                	fucomi %st(1),%st
 804d964:	dd d9                	fstp   %st(1)
 804d966:	0f 87 14 0c 00 00    	ja     804e580 <_dtoa_r+0x10a0>
 804d96c:	39 ca                	cmp    %ecx,%edx
 804d96e:	0f 84 a4 06 00 00    	je     804e018 <_dtoa_r+0xb38>
 804d974:	d9 c9                	fxch   %st(1)
 804d976:	d9 ca                	fxch   %st(2)
 804d978:	dc c9                	fmul   %st,%st(1)
 804d97a:	83 c2 01             	add    $0x1,%edx
 804d97d:	dc ca                	fmul   %st,%st(2)
 804d97f:	d9 ca                	fxch   %st(2)
 804d981:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d984:	db 55 d4             	fistl  -0x2c(%ebp)
 804d987:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d98a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804d98d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d990:	83 c0 30             	add    $0x30,%eax
 804d993:	db 45 d4             	fildl  -0x2c(%ebp)
 804d996:	de e9                	fsubrp %st,%st(1)
 804d998:	d9 c9                	fxch   %st(1)
 804d99a:	88 42 ff             	mov    %al,-0x1(%edx)
 804d99d:	db e9                	fucomi %st(1),%st
 804d99f:	76 b7                	jbe    804d958 <_dtoa_r+0x478>
 804d9a1:	dd d8                	fstp   %st(0)
 804d9a3:	dd d8                	fstp   %st(0)
 804d9a5:	dd d8                	fstp   %st(0)
 804d9a7:	dd d8                	fstp   %st(0)
 804d9a9:	eb 06                	jmp    804d9b1 <_dtoa_r+0x4d1>
 804d9ab:	dd d8                	fstp   %st(0)
 804d9ad:	dd d8                	fstp   %st(0)
 804d9af:	dd d8                	fstp   %st(0)
 804d9b1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804d9b4:	89 fb                	mov    %edi,%ebx
 804d9b6:	89 d7                	mov    %edx,%edi
 804d9b8:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804d9bb:	e9 70 03 00 00       	jmp    804dd30 <_dtoa_r+0x850>
 804d9c0:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
 804d9c7:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804d9ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804d9d5:	00 
 804d9d6:	89 34 24             	mov    %esi,(%esp)
 804d9d9:	e8 b2 22 00 00       	call   804fc90 <_Balloc>
 804d9de:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
 804d9e5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
 804d9ec:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
 804d9f3:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
 804d9fa:	89 c7                	mov    %eax,%edi
 804d9fc:	89 46 40             	mov    %eax,0x40(%esi)
 804d9ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804da02:	85 c0                	test   %eax,%eax
 804da04:	0f 88 2e 01 00 00    	js     804db38 <_dtoa_r+0x658>
 804da0a:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
 804da0e:	0f 8f 24 01 00 00    	jg     804db38 <_dtoa_r+0x658>
 804da14:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804da17:	dd 04 c5 60 4a 05 08 	fldl   0x8054a60(,%eax,8)
 804da1e:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804da21:	85 c0                	test   %eax,%eax
 804da23:	7f 0e                	jg     804da33 <_dtoa_r+0x553>
 804da25:	8b 45 18             	mov    0x18(%ebp),%eax
 804da28:	c1 e8 1f             	shr    $0x1f,%eax
 804da2b:	84 c0                	test   %al,%al
 804da2d:	0f 85 9d 07 00 00    	jne    804e1d0 <_dtoa_r+0xcf0>
 804da33:	dd 45 c0             	fldl   -0x40(%ebp)
 804da36:	d9 c0                	fld    %st(0)
 804da38:	d8 f2                	fdiv   %st(2),%st
 804da3a:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804da3d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
 804da41:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804da45:	b4 0c                	mov    $0xc,%ah
 804da47:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804da4b:	8d 47 01             	lea    0x1(%edi),%eax
 804da4e:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804da51:	d9 6d d0             	fldcw  -0x30(%ebp)
 804da54:	db 5d d4             	fistpl -0x2c(%ebp)
 804da57:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804da5a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804da5d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804da60:	8d 42 30             	lea    0x30(%edx),%eax
 804da63:	db 45 d4             	fildl  -0x2c(%ebp)
 804da66:	d8 ca                	fmul   %st(2),%st
 804da68:	88 07                	mov    %al,(%edi)
 804da6a:	de e9                	fsubrp %st,%st(1)
 804da6c:	74 66                	je     804dad4 <_dtoa_r+0x5f4>
 804da6e:	d8 0d 88 49 05 08    	fmuls  0x8054988
 804da74:	d9 ee                	fldz   
 804da76:	d9 c9                	fxch   %st(1)
 804da78:	db e9                	fucomi %st(1),%st
 804da7a:	dd d9                	fstp   %st(1)
 804da7c:	0f 8b 33 0c 00 00    	jnp    804e6b5 <_dtoa_r+0x11d5>
 804da82:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804da85:	8d 47 02             	lea    0x2(%edi),%eax
 804da88:	d9 05 88 49 05 08    	flds   0x8054988
 804da8e:	01 fb                	add    %edi,%ebx
 804da90:	eb 19                	jmp    804daab <_dtoa_r+0x5cb>
 804da92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804da98:	dc c9                	fmul   %st,%st(1)
 804da9a:	83 c0 01             	add    $0x1,%eax
 804da9d:	d9 ee                	fldz   
 804da9f:	d9 ca                	fxch   %st(2)
 804daa1:	db ea                	fucomi %st(2),%st
 804daa3:	dd da                	fstp   %st(2)
 804daa5:	0f 8b 73 09 00 00    	jnp    804e41e <_dtoa_r+0xf3e>
 804daab:	d9 c1                	fld    %st(1)
 804daad:	39 d8                	cmp    %ebx,%eax
 804daaf:	d8 f3                	fdiv   %st(3),%st
 804dab1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804dab4:	d9 6d d0             	fldcw  -0x30(%ebp)
 804dab7:	db 5d d4             	fistpl -0x2c(%ebp)
 804daba:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804dabd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804dac0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804dac3:	8d 4a 30             	lea    0x30(%edx),%ecx
 804dac6:	db 45 d4             	fildl  -0x2c(%ebp)
 804dac9:	d8 cb                	fmul   %st(3),%st
 804dacb:	88 48 ff             	mov    %cl,-0x1(%eax)
 804dace:	de ea                	fsubrp %st,%st(2)
 804dad0:	75 c6                	jne    804da98 <_dtoa_r+0x5b8>
 804dad2:	dd d8                	fstp   %st(0)
 804dad4:	d8 c0                	fadd   %st(0),%st
 804dad6:	db e9                	fucomi %st(1),%st
 804dad8:	77 1e                	ja     804daf8 <_dtoa_r+0x618>
 804dada:	d9 c9                	fxch   %st(1)
 804dadc:	df e9                	fucomip %st(1),%st
 804dade:	dd d8                	fstp   %st(0)
 804dae0:	0f 8a 44 09 00 00    	jp     804e42a <_dtoa_r+0xf4a>
 804dae6:	0f 85 3e 09 00 00    	jne    804e42a <_dtoa_r+0xf4a>
 804daec:	83 e2 01             	and    $0x1,%edx
 804daef:	90                   	nop
 804daf0:	0f 84 34 09 00 00    	je     804e42a <_dtoa_r+0xf4a>
 804daf6:	eb 04                	jmp    804dafc <_dtoa_r+0x61c>
 804daf8:	dd d8                	fstp   %st(0)
 804dafa:	dd d8                	fstp   %st(0)
 804dafc:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804daff:	89 fb                	mov    %edi,%ebx
 804db01:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
 804db05:	89 cf                	mov    %ecx,%edi
 804db07:	8b 4d b8             	mov    -0x48(%ebp),%ecx
 804db0a:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
 804db0d:	eb 0f                	jmp    804db1e <_dtoa_r+0x63e>
 804db0f:	90                   	nop
 804db10:	39 d3                	cmp    %edx,%ebx
 804db12:	0f 84 75 09 00 00    	je     804e48d <_dtoa_r+0xfad>
 804db18:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
 804db1c:	89 d7                	mov    %edx,%edi
 804db1e:	3c 39                	cmp    $0x39,%al
 804db20:	8d 57 ff             	lea    -0x1(%edi),%edx
 804db23:	74 eb                	je     804db10 <_dtoa_r+0x630>
 804db25:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804db28:	83 c0 01             	add    $0x1,%eax
 804db2b:	88 02                	mov    %al,(%edx)
 804db2d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
 804db30:	e9 fb 01 00 00       	jmp    804dd30 <_dtoa_r+0x850>
 804db35:	8d 76 00             	lea    0x0(%esi),%esi
 804db38:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804db3b:	85 c9                	test   %ecx,%ecx
 804db3d:	0f 85 9d 02 00 00    	jne    804dde0 <_dtoa_r+0x900>
 804db43:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804db46:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804db49:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804db50:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804db53:	85 c0                	test   %eax,%eax
 804db55:	7e 14                	jle    804db6b <_dtoa_r+0x68b>
 804db57:	85 db                	test   %ebx,%ebx
 804db59:	7e 10                	jle    804db6b <_dtoa_r+0x68b>
 804db5b:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804db5e:	39 d8                	cmp    %ebx,%eax
 804db60:	0f 4f c3             	cmovg  %ebx,%eax
 804db63:	29 45 a0             	sub    %eax,-0x60(%ebp)
 804db66:	29 c3                	sub    %eax,%ebx
 804db68:	29 45 ac             	sub    %eax,-0x54(%ebp)
 804db6b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804db6e:	85 c0                	test   %eax,%eax
 804db70:	7e 61                	jle    804dbd3 <_dtoa_r+0x6f3>
 804db72:	8b 45 98             	mov    -0x68(%ebp),%eax
 804db75:	85 c0                	test   %eax,%eax
 804db77:	0f 84 72 04 00 00    	je     804dfef <_dtoa_r+0xb0f>
 804db7d:	85 d2                	test   %edx,%edx
 804db7f:	7e 47                	jle    804dbc8 <_dtoa_r+0x6e8>
 804db81:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804db84:	89 54 24 08          	mov    %edx,0x8(%esp)
 804db88:	89 34 24             	mov    %esi,(%esp)
 804db8b:	89 55 88             	mov    %edx,-0x78(%ebp)
 804db8e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804db92:	e8 79 26 00 00       	call   8050210 <__pow5mult>
 804db97:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
 804db9a:	89 34 24             	mov    %esi,(%esp)
 804db9d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804dba1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dba5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804dba8:	e8 93 24 00 00       	call   8050040 <__multiply>
 804dbad:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
 804dbb0:	89 34 24             	mov    %esi,(%esp)
 804dbb3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804dbb7:	89 45 8c             	mov    %eax,-0x74(%ebp)
 804dbba:	e8 71 21 00 00       	call   804fd30 <_Bfree>
 804dbbf:	8b 45 8c             	mov    -0x74(%ebp),%eax
 804dbc2:	8b 55 88             	mov    -0x78(%ebp),%edx
 804dbc5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804dbc8:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dbcb:	29 d0                	sub    %edx,%eax
 804dbcd:	0f 85 1f 04 00 00    	jne    804dff2 <_dtoa_r+0xb12>
 804dbd3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804dbda:	00 
 804dbdb:	89 34 24             	mov    %esi,(%esp)
 804dbde:	e8 2d 24 00 00       	call   8050010 <__i2b>
 804dbe3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
 804dbe6:	85 c9                	test   %ecx,%ecx
 804dbe8:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dbeb:	7e 13                	jle    804dc00 <_dtoa_r+0x720>
 804dbed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804dbf1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dbf5:	89 34 24             	mov    %esi,(%esp)
 804dbf8:	e8 13 26 00 00       	call   8050210 <__pow5mult>
 804dbfd:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dc00:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
 804dc04:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
 804dc0b:	0f 8e f7 05 00 00    	jle    804e208 <_dtoa_r+0xd28>
 804dc11:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804dc14:	ba 01 00 00 00       	mov    $0x1,%edx
 804dc19:	85 c0                	test   %eax,%eax
 804dc1b:	0f 85 27 05 00 00    	jne    804e148 <_dtoa_r+0xc68>
 804dc21:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804dc24:	01 d0                	add    %edx,%eax
 804dc26:	83 e0 1f             	and    $0x1f,%eax
 804dc29:	89 c2                	mov    %eax,%edx
 804dc2b:	0f 84 57 03 00 00    	je     804df88 <_dtoa_r+0xaa8>
 804dc31:	b8 20 00 00 00       	mov    $0x20,%eax
 804dc36:	29 d0                	sub    %edx,%eax
 804dc38:	83 f8 04             	cmp    $0x4,%eax
 804dc3b:	0f 8e 8c 0a 00 00    	jle    804e6cd <_dtoa_r+0x11ed>
 804dc41:	b8 1c 00 00 00       	mov    $0x1c,%eax
 804dc46:	29 d0                	sub    %edx,%eax
 804dc48:	01 45 a0             	add    %eax,-0x60(%ebp)
 804dc4b:	01 c3                	add    %eax,%ebx
 804dc4d:	01 45 ac             	add    %eax,-0x54(%ebp)
 804dc50:	8b 45 a0             	mov    -0x60(%ebp),%eax
 804dc53:	85 c0                	test   %eax,%eax
 804dc55:	7e 16                	jle    804dc6d <_dtoa_r+0x78d>
 804dc57:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dc5b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dc5e:	89 34 24             	mov    %esi,(%esp)
 804dc61:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dc65:	e8 c6 26 00 00       	call   8050330 <__lshift>
 804dc6a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804dc6d:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804dc70:	85 c0                	test   %eax,%eax
 804dc72:	7e 16                	jle    804dc8a <_dtoa_r+0x7aa>
 804dc74:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dc78:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dc7b:	89 34 24             	mov    %esi,(%esp)
 804dc7e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dc82:	e8 a9 26 00 00       	call   8050330 <__lshift>
 804dc87:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dc8a:	8b 45 9c             	mov    -0x64(%ebp),%eax
 804dc8d:	85 c0                	test   %eax,%eax
 804dc8f:	0f 85 d3 04 00 00    	jne    804e168 <_dtoa_r+0xc88>
 804dc95:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804dc99:	0f 8e 11 02 00 00    	jle    804deb0 <_dtoa_r+0x9d0>
 804dc9f:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dca2:	85 c0                	test   %eax,%eax
 804dca4:	0f 8f 06 02 00 00    	jg     804deb0 <_dtoa_r+0x9d0>
 804dcaa:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dcad:	85 c0                	test   %eax,%eax
 804dcaf:	0f 85 e0 01 00 00    	jne    804de95 <_dtoa_r+0x9b5>
 804dcb5:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dcb8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804dcbf:	00 
 804dcc0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
 804dcc7:	00 
 804dcc8:	89 34 24             	mov    %esi,(%esp)
 804dccb:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dccf:	e8 7c 20 00 00       	call   804fd50 <__multadd>
 804dcd4:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dcd7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dcdb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dcde:	89 04 24             	mov    %eax,(%esp)
 804dce1:	e8 6a 27 00 00       	call   8050450 <__mcmp>
 804dce6:	85 c0                	test   %eax,%eax
 804dce8:	0f 8e a7 01 00 00    	jle    804de95 <_dtoa_r+0x9b5>
 804dcee:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
 804dcf2:	89 fb                	mov    %edi,%ebx
 804dcf4:	83 c7 01             	add    $0x1,%edi
 804dcf7:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
 804dcfb:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804dd02:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dd05:	89 34 24             	mov    %esi,(%esp)
 804dd08:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dd0c:	e8 1f 20 00 00       	call   804fd30 <_Bfree>
 804dd11:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804dd14:	85 c0                	test   %eax,%eax
 804dd16:	74 18                	je     804dd30 <_dtoa_r+0x850>
 804dd18:	39 45 c0             	cmp    %eax,-0x40(%ebp)
 804dd1b:	0f 85 a7 02 00 00    	jne    804dfc8 <_dtoa_r+0xae8>
 804dd21:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804dd24:	89 34 24             	mov    %esi,(%esp)
 804dd27:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dd2b:	e8 00 20 00 00       	call   804fd30 <_Bfree>
 804dd30:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dd33:	89 34 24             	mov    %esi,(%esp)
 804dd36:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dd3a:	e8 f1 1f 00 00       	call   804fd30 <_Bfree>
 804dd3f:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804dd42:	8b 75 1c             	mov    0x1c(%ebp),%esi
 804dd45:	c6 07 00             	movb   $0x0,(%edi)
 804dd48:	83 c0 01             	add    $0x1,%eax
 804dd4b:	89 06                	mov    %eax,(%esi)
 804dd4d:	8b 45 24             	mov    0x24(%ebp),%eax
 804dd50:	85 c0                	test   %eax,%eax
 804dd52:	0f 84 90 02 00 00    	je     804dfe8 <_dtoa_r+0xb08>
 804dd58:	8b 45 24             	mov    0x24(%ebp),%eax
 804dd5b:	89 38                	mov    %edi,(%eax)
 804dd5d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804dd63:	89 d8                	mov    %ebx,%eax
 804dd65:	5b                   	pop    %ebx
 804dd66:	5e                   	pop    %esi
 804dd67:	5f                   	pop    %edi
 804dd68:	5d                   	pop    %ebp
 804dd69:	c3                   	ret    
 804dd6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804dd70:	db 45 b8             	fildl  -0x48(%ebp)
 804dd73:	df e9                	fucomip %st(1),%st
 804dd75:	dd d8                	fstp   %st(0)
 804dd77:	7a 06                	jp     804dd7f <_dtoa_r+0x89f>
 804dd79:	0f 84 cc f8 ff ff    	je     804d64b <_dtoa_r+0x16b>
 804dd7f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804dd83:	e9 c3 f8 ff ff       	jmp    804d64b <_dtoa_r+0x16b>
 804dd88:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804dd8b:	29 45 a0             	sub    %eax,-0x60(%ebp)
 804dd8e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
 804dd95:	f7 d8                	neg    %eax
 804dd97:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dd9a:	e9 0c f9 ff ff       	jmp    804d6ab <_dtoa_r+0x1cb>
 804dd9f:	90                   	nop
 804dda0:	f7 d8                	neg    %eax
 804dda2:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804dda5:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
 804ddac:	e9 e2 f8 ff ff       	jmp    804d693 <_dtoa_r+0x1b3>
 804ddb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804ddb8:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804ddbb:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
 804ddc0:	29 d9                	sub    %ebx,%ecx
 804ddc2:	d3 e0                	shl    %cl,%eax
 804ddc4:	e9 1b f8 ff ff       	jmp    804d5e4 <_dtoa_r+0x104>
 804ddc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804ddd0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
 804ddd7:	e9 a0 f8 ff ff       	jmp    804d67c <_dtoa_r+0x19c>
 804dddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804dde0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
 804dde4:	0f 8e fe 06 00 00    	jle    804e4e8 <_dtoa_r+0x1008>
 804ddea:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dded:	83 e8 01             	sub    $0x1,%eax
 804ddf0:	39 45 b0             	cmp    %eax,-0x50(%ebp)
 804ddf3:	0f 8c 3b 06 00 00    	jl     804e434 <_dtoa_r+0xf54>
 804ddf9:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804ddfc:	29 c2                	sub    %eax,%edx
 804ddfe:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 804de01:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804de04:	85 c9                	test   %ecx,%ecx
 804de06:	89 c8                	mov    %ecx,%eax
 804de08:	0f 88 83 07 00 00    	js     804e591 <_dtoa_r+0x10b1>
 804de0e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804de15:	00 
 804de16:	89 34 24             	mov    %esi,(%esp)
 804de19:	89 55 8c             	mov    %edx,-0x74(%ebp)
 804de1c:	01 45 a0             	add    %eax,-0x60(%ebp)
 804de1f:	01 45 ac             	add    %eax,-0x54(%ebp)
 804de22:	e8 e9 21 00 00       	call   8050010 <__i2b>
 804de27:	8b 55 8c             	mov    -0x74(%ebp),%edx
 804de2a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804de2d:	e9 1e fd ff ff       	jmp    804db50 <_dtoa_r+0x670>
 804de32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804de38:	d9 c1                	fld    %st(1)
 804de3a:	b9 02 00 00 00       	mov    $0x2,%ecx
 804de3f:	e9 37 fa ff ff       	jmp    804d87b <_dtoa_r+0x39b>
 804de44:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804de47:	db 45 d4             	fildl  -0x2c(%ebp)
 804de4a:	d8 c9                	fmul   %st(1),%st
 804de4c:	d8 05 8c 49 05 08    	fadds  0x805498c
 804de52:	dd 5d c0             	fstpl  -0x40(%ebp)
 804de55:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804de5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804de60:	d8 25 90 49 05 08    	fsubs  0x8054990
 804de66:	dd 45 c0             	fldl   -0x40(%ebp)
 804de69:	d9 c9                	fxch   %st(1)
 804de6b:	db e9                	fucomi %st(1),%st
 804de6d:	0f 87 0d 02 00 00    	ja     804e080 <_dtoa_r+0xba0>
 804de73:	d9 c9                	fxch   %st(1)
 804de75:	d9 e0                	fchs   
 804de77:	df e9                	fucomip %st(1),%st
 804de79:	dd d8                	fstp   %st(0)
 804de7b:	0f 86 a7 01 00 00    	jbe    804e028 <_dtoa_r+0xb48>
 804de81:	dd d8                	fstp   %st(0)
 804de83:	eb 02                	jmp    804de87 <_dtoa_r+0x9a7>
 804de85:	dd d8                	fstp   %st(0)
 804de87:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804de8e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804de95:	8b 45 18             	mov    0x18(%ebp),%eax
 804de98:	89 fb                	mov    %edi,%ebx
 804de9a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804dea1:	f7 d0                	not    %eax
 804dea3:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804dea6:	e9 57 fe ff ff       	jmp    804dd02 <_dtoa_r+0x822>
 804deab:	90                   	nop
 804deac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804deb0:	8b 45 98             	mov    -0x68(%ebp),%eax
 804deb3:	85 c0                	test   %eax,%eax
 804deb5:	0f 85 c5 03 00 00    	jne    804e280 <_dtoa_r+0xda0>
 804debb:	89 75 08             	mov    %esi,0x8(%ebp)
 804debe:	bb 01 00 00 00       	mov    $0x1,%ebx
 804dec3:	8b 75 a4             	mov    -0x5c(%ebp),%esi
 804dec6:	eb 24                	jmp    804deec <_dtoa_r+0xa0c>
 804dec8:	8b 45 08             	mov    0x8(%ebp),%eax
 804decb:	83 c3 01             	add    $0x1,%ebx
 804dece:	89 74 24 04          	mov    %esi,0x4(%esp)
 804ded2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804ded9:	00 
 804deda:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804dee1:	00 
 804dee2:	89 04 24             	mov    %eax,(%esp)
 804dee5:	e8 66 1e 00 00       	call   804fd50 <__multadd>
 804deea:	89 c6                	mov    %eax,%esi
 804deec:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804deef:	89 f0                	mov    %esi,%eax
 804def1:	e8 1a f4 ff ff       	call   804d310 <quorem>
 804def6:	83 c0 30             	add    $0x30,%eax
 804def9:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
 804defc:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
 804df00:	7c c6                	jl     804dec8 <_dtoa_r+0x9e8>
 804df02:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804df05:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804df08:	ba 01 00 00 00       	mov    $0x1,%edx
 804df0d:	89 75 a4             	mov    %esi,-0x5c(%ebp)
 804df10:	8b 75 08             	mov    0x8(%ebp),%esi
 804df13:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804df1a:	85 c0                	test   %eax,%eax
 804df1c:	0f 4f d0             	cmovg  %eax,%edx
 804df1f:	01 fa                	add    %edi,%edx
 804df21:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804df24:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804df2b:	00 
 804df2c:	89 34 24             	mov    %esi,(%esp)
 804df2f:	89 55 ac             	mov    %edx,-0x54(%ebp)
 804df32:	89 44 24 04          	mov    %eax,0x4(%esp)
 804df36:	e8 f5 23 00 00       	call   8050330 <__lshift>
 804df3b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
 804df3e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804df42:	89 04 24             	mov    %eax,(%esp)
 804df45:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804df48:	e8 03 25 00 00       	call   8050450 <__mcmp>
 804df4d:	8b 55 ac             	mov    -0x54(%ebp),%edx
 804df50:	83 f8 00             	cmp    $0x0,%eax
 804df53:	0f 8e 41 06 00 00    	jle    804e59a <_dtoa_r+0x10ba>
 804df59:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 804df5d:	eb 0f                	jmp    804df6e <_dtoa_r+0xa8e>
 804df5f:	90                   	nop
 804df60:	39 c7                	cmp    %eax,%edi
 804df62:	0f 84 70 05 00 00    	je     804e4d8 <_dtoa_r+0xff8>
 804df68:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
 804df6c:	89 c2                	mov    %eax,%edx
 804df6e:	80 f9 39             	cmp    $0x39,%cl
 804df71:	8d 42 ff             	lea    -0x1(%edx),%eax
 804df74:	74 ea                	je     804df60 <_dtoa_r+0xa80>
 804df76:	83 c1 01             	add    $0x1,%ecx
 804df79:	89 fb                	mov    %edi,%ebx
 804df7b:	88 08                	mov    %cl,(%eax)
 804df7d:	89 d7                	mov    %edx,%edi
 804df7f:	e9 7e fd ff ff       	jmp    804dd02 <_dtoa_r+0x822>
 804df84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804df88:	b8 1c 00 00 00       	mov    $0x1c,%eax
 804df8d:	01 45 a0             	add    %eax,-0x60(%ebp)
 804df90:	01 c3                	add    %eax,%ebx
 804df92:	01 45 ac             	add    %eax,-0x54(%ebp)
 804df95:	e9 b6 fc ff ff       	jmp    804dc50 <_dtoa_r+0x770>
 804df9a:	ba 01 00 00 00       	mov    $0x1,%edx
 804df9f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
 804dfa6:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
 804dfad:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
 804dfb4:	21 c2                	and    %eax,%edx
 804dfb6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
 804dfb9:	31 d2                	xor    %edx,%edx
 804dfbb:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804dfc2:	e9 62 f8 ff ff       	jmp    804d829 <_dtoa_r+0x349>
 804dfc7:	90                   	nop
 804dfc8:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804dfcb:	85 d2                	test   %edx,%edx
 804dfcd:	0f 84 4e fd ff ff    	je     804dd21 <_dtoa_r+0x841>
 804dfd3:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804dfd6:	89 34 24             	mov    %esi,(%esp)
 804dfd9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dfdd:	e8 4e 1d 00 00       	call   804fd30 <_Bfree>
 804dfe2:	e9 3a fd ff ff       	jmp    804dd21 <_dtoa_r+0x841>
 804dfe7:	90                   	nop
 804dfe8:	89 d8                	mov    %ebx,%eax
 804dfea:	e9 89 f5 ff ff       	jmp    804d578 <_dtoa_r+0x98>
 804dfef:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dff2:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dff6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dff9:	89 34 24             	mov    %esi,(%esp)
 804dffc:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e000:	e8 0b 22 00 00       	call   8050210 <__pow5mult>
 804e005:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804e008:	e9 c6 fb ff ff       	jmp    804dbd3 <_dtoa_r+0x6f3>
 804e00d:	dd d8                	fstp   %st(0)
 804e00f:	dd d8                	fstp   %st(0)
 804e011:	eb 15                	jmp    804e028 <_dtoa_r+0xb48>
 804e013:	90                   	nop
 804e014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e018:	dd d8                	fstp   %st(0)
 804e01a:	dd d8                	fstp   %st(0)
 804e01c:	dd d8                	fstp   %st(0)
 804e01e:	eb 08                	jmp    804e028 <_dtoa_r+0xb48>
 804e020:	dd d8                	fstp   %st(0)
 804e022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e028:	dd 5d c0             	fstpl  -0x40(%ebp)
 804e02b:	e9 cf f9 ff ff       	jmp    804d9ff <_dtoa_r+0x51f>
 804e030:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804e033:	f7 d8                	neg    %eax
 804e035:	0f 84 6a 04 00 00    	je     804e4a5 <_dtoa_r+0xfc5>
 804e03b:	89 c2                	mov    %eax,%edx
 804e03d:	b9 02 00 00 00       	mov    $0x2,%ecx
 804e042:	83 e2 0f             	and    $0xf,%edx
 804e045:	c1 f8 04             	sar    $0x4,%eax
 804e048:	dd 04 d5 60 4a 05 08 	fldl   0x8054a60(,%edx,8)
 804e04f:	85 c0                	test   %eax,%eax
 804e051:	d8 c9                	fmul   %st(1),%st
 804e053:	0f 84 4a f8 ff ff    	je     804d8a3 <_dtoa_r+0x3c3>
 804e059:	31 d2                	xor    %edx,%edx
 804e05b:	90                   	nop
 804e05c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e060:	a8 01                	test   $0x1,%al
 804e062:	74 0a                	je     804e06e <_dtoa_r+0xb8e>
 804e064:	dc 0c d5 20 4a 05 08 	fmull  0x8054a20(,%edx,8)
 804e06b:	83 c1 01             	add    $0x1,%ecx
 804e06e:	83 c2 01             	add    $0x1,%edx
 804e071:	d1 f8                	sar    %eax
 804e073:	75 eb                	jne    804e060 <_dtoa_r+0xb80>
 804e075:	e9 29 f8 ff ff       	jmp    804d8a3 <_dtoa_r+0x3c3>
 804e07a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e080:	dd d8                	fstp   %st(0)
 804e082:	dd d8                	fstp   %st(0)
 804e084:	dd d8                	fstp   %st(0)
 804e086:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804e08d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804e094:	e9 55 fc ff ff       	jmp    804dcee <_dtoa_r+0x80e>
 804e099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e0a0:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804e0a3:	8d 41 ff             	lea    -0x1(%ecx),%eax
 804e0a6:	dd 45 c0             	fldl   -0x40(%ebp)
 804e0a9:	dc 0c c5 60 4a 05 08 	fmull  0x8054a60(,%eax,8)
 804e0b0:	d9 c9                	fxch   %st(1)
 804e0b2:	89 45 88             	mov    %eax,-0x78(%ebp)
 804e0b5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804e0b9:	8d 57 01             	lea    0x1(%edi),%edx
 804e0bc:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
 804e0bf:	b4 0c                	mov    $0xc,%ah
 804e0c1:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804e0c5:	d9 6d d0             	fldcw  -0x30(%ebp)
 804e0c8:	db 55 d4             	fistl  -0x2c(%ebp)
 804e0cb:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804e0ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804e0d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804e0d4:	83 c0 30             	add    $0x30,%eax
 804e0d7:	83 f9 01             	cmp    $0x1,%ecx
 804e0da:	db 45 d4             	fildl  -0x2c(%ebp)
 804e0dd:	de e9                	fsubrp %st,%st(1)
 804e0df:	88 07                	mov    %al,(%edi)
 804e0e1:	89 d0                	mov    %edx,%eax
 804e0e3:	74 37                	je     804e11c <_dtoa_r+0xc3c>
 804e0e5:	d9 05 88 49 05 08    	flds   0x8054988
 804e0eb:	eb 05                	jmp    804e0f2 <_dtoa_r+0xc12>
 804e0ed:	8d 76 00             	lea    0x0(%esi),%esi
 804e0f0:	d9 c9                	fxch   %st(1)
 804e0f2:	dc c9                	fmul   %st,%st(1)
 804e0f4:	d9 c9                	fxch   %st(1)
 804e0f6:	83 c0 01             	add    $0x1,%eax
 804e0f9:	d9 6d d0             	fldcw  -0x30(%ebp)
 804e0fc:	db 55 d4             	fistl  -0x2c(%ebp)
 804e0ff:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804e102:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 804e105:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804e108:	83 c1 30             	add    $0x30,%ecx
 804e10b:	39 d8                	cmp    %ebx,%eax
 804e10d:	db 45 d4             	fildl  -0x2c(%ebp)
 804e110:	de e9                	fsubrp %st,%st(1)
 804e112:	88 48 ff             	mov    %cl,-0x1(%eax)
 804e115:	75 d9                	jne    804e0f0 <_dtoa_r+0xc10>
 804e117:	dd d9                	fstp   %st(1)
 804e119:	03 55 88             	add    -0x78(%ebp),%edx
 804e11c:	d9 05 94 49 05 08    	flds   0x8054994
 804e122:	d9 c2                	fld    %st(2)
 804e124:	d8 c1                	fadd   %st(1),%st
 804e126:	d9 ca                	fxch   %st(2)
 804e128:	db ea                	fucomi %st(2),%st
 804e12a:	dd da                	fstp   %st(2)
 804e12c:	0f 86 7f 03 00 00    	jbe    804e4b1 <_dtoa_r+0xfd1>
 804e132:	dd d8                	fstp   %st(0)
 804e134:	dd d8                	fstp   %st(0)
 804e136:	dd d8                	fstp   %st(0)
 804e138:	dd d8                	fstp   %st(0)
 804e13a:	89 fb                	mov    %edi,%ebx
 804e13c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
 804e140:	89 d7                	mov    %edx,%edi
 804e142:	e9 d7 f9 ff ff       	jmp    804db1e <_dtoa_r+0x63e>
 804e147:	90                   	nop
 804e148:	8b 4d b0             	mov    -0x50(%ebp),%ecx
 804e14b:	8b 41 10             	mov    0x10(%ecx),%eax
 804e14e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
 804e152:	89 04 24             	mov    %eax,(%esp)
 804e155:	e8 d6 1d 00 00       	call   804ff30 <__hi0bits>
 804e15a:	ba 20 00 00 00       	mov    $0x20,%edx
 804e15f:	29 c2                	sub    %eax,%edx
 804e161:	e9 bb fa ff ff       	jmp    804dc21 <_dtoa_r+0x741>
 804e166:	66 90                	xchg   %ax,%ax
 804e168:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804e16b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e16f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e172:	89 04 24             	mov    %eax,(%esp)
 804e175:	e8 d6 22 00 00       	call   8050450 <__mcmp>
 804e17a:	85 c0                	test   %eax,%eax
 804e17c:	0f 89 13 fb ff ff    	jns    804dc95 <_dtoa_r+0x7b5>
 804e182:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e185:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e18c:	00 
 804e18d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e194:	00 
 804e195:	89 34 24             	mov    %esi,(%esp)
 804e198:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e19c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804e1a0:	e8 ab 1b 00 00       	call   804fd50 <__multadd>
 804e1a5:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e1a8:	85 c9                	test   %ecx,%ecx
 804e1aa:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804e1ad:	0f 85 8d 00 00 00    	jne    804e240 <_dtoa_r+0xd60>
 804e1b3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
 804e1b7:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e1ba:	7f 0a                	jg     804e1c6 <_dtoa_r+0xce6>
 804e1bc:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804e1c0:	0f 8f ff 04 00 00    	jg     804e6c5 <_dtoa_r+0x11e5>
 804e1c6:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e1c9:	e9 ed fc ff ff       	jmp    804debb <_dtoa_r+0x9db>
 804e1ce:	66 90                	xchg   %ax,%ax
 804e1d0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804e1d3:	85 db                	test   %ebx,%ebx
 804e1d5:	0f 85 aa fc ff ff    	jne    804de85 <_dtoa_r+0x9a5>
 804e1db:	d8 0d 90 49 05 08    	fmuls  0x8054990
 804e1e1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804e1e8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804e1ef:	dd 45 c0             	fldl   -0x40(%ebp)
 804e1f2:	d9 c9                	fxch   %st(1)
 804e1f4:	df e9                	fucomip %st(1),%st
 804e1f6:	dd d8                	fstp   %st(0)
 804e1f8:	0f 83 97 fc ff ff    	jae    804de95 <_dtoa_r+0x9b5>
 804e1fe:	e9 eb fa ff ff       	jmp    804dcee <_dtoa_r+0x80e>
 804e203:	90                   	nop
 804e204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e208:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804e20b:	85 c0                	test   %eax,%eax
 804e20d:	0f 85 fe f9 ff ff    	jne    804dc11 <_dtoa_r+0x731>
 804e213:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804e216:	a9 ff ff 0f 00       	test   $0xfffff,%eax
 804e21b:	0f 85 f0 f9 ff ff    	jne    804dc11 <_dtoa_r+0x731>
 804e221:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
 804e226:	0f 84 e5 f9 ff ff    	je     804dc11 <_dtoa_r+0x731>
 804e22c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
 804e230:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
 804e234:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
 804e23b:	e9 d1 f9 ff ff       	jmp    804dc11 <_dtoa_r+0x731>
 804e240:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e243:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e24a:	00 
 804e24b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e252:	00 
 804e253:	89 34 24             	mov    %esi,(%esp)
 804e256:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e25a:	e8 f1 1a 00 00       	call   804fd50 <__multadd>
 804e25f:	8b 55 90             	mov    -0x70(%ebp),%edx
 804e262:	85 d2                	test   %edx,%edx
 804e264:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e267:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e26a:	7f 0a                	jg     804e276 <_dtoa_r+0xd96>
 804e26c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804e270:	0f 8f 4f 04 00 00    	jg     804e6c5 <_dtoa_r+0x11e5>
 804e276:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e280:	85 db                	test   %ebx,%ebx
 804e282:	7e 16                	jle    804e29a <_dtoa_r+0xdba>
 804e284:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e287:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804e28b:	89 34 24             	mov    %esi,(%esp)
 804e28e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e292:	e8 99 20 00 00       	call   8050330 <__lshift>
 804e297:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e29a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
 804e29d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e2a0:	85 db                	test   %ebx,%ebx
 804e2a2:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e2a5:	0f 85 11 03 00 00    	jne    804e5bc <_dtoa_r+0x10dc>
 804e2ab:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e2ae:	8d 5f 01             	lea    0x1(%edi),%ebx
 804e2b1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
 804e2b4:	01 f8                	add    %edi,%eax
 804e2b6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
 804e2b9:	89 45 90             	mov    %eax,-0x70(%ebp)
 804e2bc:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804e2bf:	83 e0 01             	and    $0x1,%eax
 804e2c2:	89 45 9c             	mov    %eax,-0x64(%ebp)
 804e2c5:	eb 2e                	jmp    804e2f5 <_dtoa_r+0xe15>
 804e2c7:	90                   	nop
 804e2c8:	e8 83 1a 00 00       	call   804fd50 <__multadd>
 804e2cd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e2d4:	00 
 804e2d5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e2dc:	00 
 804e2dd:	89 34 24             	mov    %esi,(%esp)
 804e2e0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e2e3:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e2e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e2ea:	e8 61 1a 00 00       	call   804fd50 <__multadd>
 804e2ef:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e2f2:	83 c3 01             	add    $0x1,%ebx
 804e2f5:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e2f8:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804e2fb:	89 45 98             	mov    %eax,-0x68(%ebp)
 804e2fe:	89 f8                	mov    %edi,%eax
 804e300:	e8 0b f0 ff ff       	call   804d310 <quorem>
 804e305:	89 3c 24             	mov    %edi,(%esp)
 804e308:	8d 48 30             	lea    0x30(%eax),%ecx
 804e30b:	89 4d a0             	mov    %ecx,-0x60(%ebp)
 804e30e:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804e311:	89 45 94             	mov    %eax,-0x6c(%ebp)
 804e314:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804e318:	e8 33 21 00 00       	call   8050450 <__mcmp>
 804e31d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
 804e320:	89 34 24             	mov    %esi,(%esp)
 804e323:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804e327:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e32a:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804e32d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e331:	e8 6a 21 00 00       	call   80504a0 <__mdiff>
 804e336:	8b 48 0c             	mov    0xc(%eax),%ecx
 804e339:	89 c2                	mov    %eax,%edx
 804e33b:	85 c9                	test   %ecx,%ecx
 804e33d:	0f 85 c5 00 00 00    	jne    804e408 <_dtoa_r+0xf28>
 804e343:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e347:	89 3c 24             	mov    %edi,(%esp)
 804e34a:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e34d:	e8 fe 20 00 00       	call   8050450 <__mcmp>
 804e352:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804e355:	89 54 24 04          	mov    %edx,0x4(%esp)
 804e359:	89 34 24             	mov    %esi,(%esp)
 804e35c:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e35f:	e8 cc 19 00 00       	call   804fd30 <_Bfree>
 804e364:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e367:	89 c1                	mov    %eax,%ecx
 804e369:	0b 4d 14             	or     0x14(%ebp),%ecx
 804e36c:	75 0b                	jne    804e379 <_dtoa_r+0xe99>
 804e36e:	8b 55 9c             	mov    -0x64(%ebp),%edx
 804e371:	85 d2                	test   %edx,%edx
 804e373:	0f 84 fb 02 00 00    	je     804e674 <_dtoa_r+0x1194>
 804e379:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804e37c:	85 d2                	test   %edx,%edx
 804e37e:	0f 88 7f 01 00 00    	js     804e503 <_dtoa_r+0x1023>
 804e384:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804e387:	0b 4d 14             	or     0x14(%ebp),%ecx
 804e38a:	75 0b                	jne    804e397 <_dtoa_r+0xeb7>
 804e38c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
 804e38f:	85 c9                	test   %ecx,%ecx
 804e391:	0f 84 6c 01 00 00    	je     804e503 <_dtoa_r+0x1023>
 804e397:	85 c0                	test   %eax,%eax
 804e399:	0f 8f 82 02 00 00    	jg     804e621 <_dtoa_r+0x1141>
 804e39f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e3a3:	89 da                	mov    %ebx,%edx
 804e3a5:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
 804e3a8:	88 43 ff             	mov    %al,-0x1(%ebx)
 804e3ab:	0f 84 8d 02 00 00    	je     804e63e <_dtoa_r+0x115e>
 804e3b1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 804e3b5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e3bc:	00 
 804e3bd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e3c4:	00 
 804e3c5:	89 34 24             	mov    %esi,(%esp)
 804e3c8:	e8 83 19 00 00       	call   804fd50 <__multadd>
 804e3cd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e3d4:	00 
 804e3d5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e3dc:	00 
 804e3dd:	89 34 24             	mov    %esi,(%esp)
 804e3e0:	89 c7                	mov    %eax,%edi
 804e3e2:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e3e5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
 804e3e8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e3eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e3ef:	0f 85 d3 fe ff ff    	jne    804e2c8 <_dtoa_r+0xde8>
 804e3f5:	e8 56 19 00 00       	call   804fd50 <__multadd>
 804e3fa:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e3fd:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e400:	e9 ed fe ff ff       	jmp    804e2f2 <_dtoa_r+0xe12>
 804e405:	8d 76 00             	lea    0x0(%esi),%esi
 804e408:	b8 01 00 00 00       	mov    $0x1,%eax
 804e40d:	e9 43 ff ff ff       	jmp    804e355 <_dtoa_r+0xe75>
 804e412:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
 804e419:	e9 d2 f2 ff ff       	jmp    804d6f0 <_dtoa_r+0x210>
 804e41e:	0f 85 87 f6 ff ff    	jne    804daab <_dtoa_r+0x5cb>
 804e424:	dd d8                	fstp   %st(0)
 804e426:	dd d8                	fstp   %st(0)
 804e428:	dd d8                	fstp   %st(0)
 804e42a:	89 fb                	mov    %edi,%ebx
 804e42c:	8b 7d c0             	mov    -0x40(%ebp),%edi
 804e42f:	e9 fc f8 ff ff       	jmp    804dd30 <_dtoa_r+0x850>
 804e434:	89 c2                	mov    %eax,%edx
 804e436:	2b 55 b0             	sub    -0x50(%ebp),%edx
 804e439:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804e43c:	01 55 94             	add    %edx,-0x6c(%ebp)
 804e43f:	31 d2                	xor    %edx,%edx
 804e441:	e9 b8 f9 ff ff       	jmp    804ddfe <_dtoa_r+0x91e>
 804e446:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e449:	85 c0                	test   %eax,%eax
 804e44b:	0f 84 f3 f9 ff ff    	je     804de44 <_dtoa_r+0x964>
 804e451:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e454:	85 c0                	test   %eax,%eax
 804e456:	0f 8e c4 fb ff ff    	jle    804e020 <_dtoa_r+0xb40>
 804e45c:	d8 0d 88 49 05 08    	fmuls  0x8054988
 804e462:	83 c1 01             	add    $0x1,%ecx
 804e465:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804e468:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804e46b:	89 c1                	mov    %eax,%ecx
 804e46d:	83 eb 01             	sub    $0x1,%ebx
 804e470:	db 45 d4             	fildl  -0x2c(%ebp)
 804e473:	d8 c9                	fmul   %st(1),%st
 804e475:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
 804e478:	d8 05 8c 49 05 08    	fadds  0x805498c
 804e47e:	dd 5d c0             	fstpl  -0x40(%ebp)
 804e481:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804e488:	e9 53 f4 ff ff       	jmp    804d8e0 <_dtoa_r+0x400>
 804e48d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e490:	c6 03 30             	movb   $0x30,(%ebx)
 804e493:	83 c0 01             	add    $0x1,%eax
 804e496:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804e499:	b8 31 00 00 00       	mov    $0x31,%eax
 804e49e:	88 02                	mov    %al,(%edx)
 804e4a0:	e9 8b f8 ff ff       	jmp    804dd30 <_dtoa_r+0x850>
 804e4a5:	d9 c0                	fld    %st(0)
 804e4a7:	b9 02 00 00 00       	mov    $0x2,%ecx
 804e4ac:	e9 f2 f3 ff ff       	jmp    804d8a3 <_dtoa_r+0x3c3>
 804e4b1:	de e2                	fsubp  %st,%st(2)
 804e4b3:	d9 c9                	fxch   %st(1)
 804e4b5:	df e9                	fucomip %st(1),%st
 804e4b7:	dd d8                	fstp   %st(0)
 804e4b9:	0f 86 69 fb ff ff    	jbe    804e028 <_dtoa_r+0xb48>
 804e4bf:	dd d8                	fstp   %st(0)
 804e4c1:	eb 07                	jmp    804e4ca <_dtoa_r+0xfea>
 804e4c3:	90                   	nop
 804e4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e4c8:	89 c2                	mov    %eax,%edx
 804e4ca:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
 804e4ce:	8d 42 ff             	lea    -0x1(%edx),%eax
 804e4d1:	74 f5                	je     804e4c8 <_dtoa_r+0xfe8>
 804e4d3:	e9 d9 f4 ff ff       	jmp    804d9b1 <_dtoa_r+0x4d1>
 804e4d8:	c6 07 31             	movb   $0x31,(%edi)
 804e4db:	89 fb                	mov    %edi,%ebx
 804e4dd:	89 d7                	mov    %edx,%edi
 804e4df:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
 804e4e3:	e9 1a f8 ff ff       	jmp    804dd02 <_dtoa_r+0x822>
 804e4e8:	8b 55 8c             	mov    -0x74(%ebp),%edx
 804e4eb:	85 d2                	test   %edx,%edx
 804e4ed:	0f 84 1b 01 00 00    	je     804e60e <_dtoa_r+0x112e>
 804e4f3:	05 33 04 00 00       	add    $0x433,%eax
 804e4f8:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e4fb:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e4fe:	e9 0b f9 ff ff       	jmp    804de0e <_dtoa_r+0x92e>
 804e503:	85 c0                	test   %eax,%eax
 804e505:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e508:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e50b:	7e 45                	jle    804e552 <_dtoa_r+0x1072>
 804e50d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e510:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804e517:	00 
 804e518:	89 34 24             	mov    %esi,(%esp)
 804e51b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e51f:	e8 0c 1e 00 00       	call   8050330 <__lshift>
 804e524:	8b 5d b0             	mov    -0x50(%ebp),%ebx
 804e527:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e52b:	89 04 24             	mov    %eax,(%esp)
 804e52e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804e531:	e8 1a 1f 00 00       	call   8050450 <__mcmp>
 804e536:	83 f8 00             	cmp    $0x0,%eax
 804e539:	0f 8e 5b 01 00 00    	jle    804e69a <_dtoa_r+0x11ba>
 804e53f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
 804e543:	0f 84 0c 01 00 00    	je     804e655 <_dtoa_r+0x1175>
 804e549:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804e54c:	83 c0 31             	add    $0x31,%eax
 804e54f:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804e552:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e555:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e559:	89 cb                	mov    %ecx,%ebx
 804e55b:	88 03                	mov    %al,(%ebx)
 804e55d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e560:	89 fb                	mov    %edi,%ebx
 804e562:	8d 79 01             	lea    0x1(%ecx),%edi
 804e565:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e568:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e56b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e56e:	e9 8f f7 ff ff       	jmp    804dd02 <_dtoa_r+0x822>
 804e573:	dd d8                	fstp   %st(0)
 804e575:	dd d8                	fstp   %st(0)
 804e577:	dd d8                	fstp   %st(0)
 804e579:	eb 0d                	jmp    804e588 <_dtoa_r+0x10a8>
 804e57b:	90                   	nop
 804e57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e580:	dd d8                	fstp   %st(0)
 804e582:	dd d8                	fstp   %st(0)
 804e584:	dd d8                	fstp   %st(0)
 804e586:	dd d8                	fstp   %st(0)
 804e588:	89 fb                	mov    %edi,%ebx
 804e58a:	89 d7                	mov    %edx,%edi
 804e58c:	e9 8d f5 ff ff       	jmp    804db1e <_dtoa_r+0x63e>
 804e591:	29 cb                	sub    %ecx,%ebx
 804e593:	31 c0                	xor    %eax,%eax
 804e595:	e9 74 f8 ff ff       	jmp    804de0e <_dtoa_r+0x92e>
 804e59a:	75 0e                	jne    804e5aa <_dtoa_r+0x10ca>
 804e59c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
 804e5a0:	74 08                	je     804e5aa <_dtoa_r+0x10ca>
 804e5a2:	e9 b2 f9 ff ff       	jmp    804df59 <_dtoa_r+0xa79>
 804e5a7:	90                   	nop
 804e5a8:	89 c2                	mov    %eax,%edx
 804e5aa:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
 804e5ae:	8d 42 ff             	lea    -0x1(%edx),%eax
 804e5b1:	74 f5                	je     804e5a8 <_dtoa_r+0x10c8>
 804e5b3:	89 fb                	mov    %edi,%ebx
 804e5b5:	89 d7                	mov    %edx,%edi
 804e5b7:	e9 46 f7 ff ff       	jmp    804dd02 <_dtoa_r+0x822>
 804e5bc:	8b 40 04             	mov    0x4(%eax),%eax
 804e5bf:	89 34 24             	mov    %esi,(%esp)
 804e5c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e5c6:	e8 c5 16 00 00       	call   804fc90 <_Balloc>
 804e5cb:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804e5ce:	89 c3                	mov    %eax,%ebx
 804e5d0:	8b 41 10             	mov    0x10(%ecx),%eax
 804e5d3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
 804e5da:	89 44 24 08          	mov    %eax,0x8(%esp)
 804e5de:	89 c8                	mov    %ecx,%eax
 804e5e0:	83 c0 0c             	add    $0xc,%eax
 804e5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e5e7:	8d 43 0c             	lea    0xc(%ebx),%eax
 804e5ea:	89 04 24             	mov    %eax,(%esp)
 804e5ed:	e8 36 16 00 00       	call   804fc28 <memcpy>
 804e5f2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804e5f9:	00 
 804e5fa:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e5fe:	89 34 24             	mov    %esi,(%esp)
 804e601:	e8 2a 1d 00 00       	call   8050330 <__lshift>
 804e606:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e609:	e9 9d fc ff ff       	jmp    804e2ab <_dtoa_r+0xdcb>
 804e60e:	b8 36 00 00 00       	mov    $0x36,%eax
 804e613:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e616:	2b 45 e0             	sub    -0x20(%ebp),%eax
 804e619:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e61c:	e9 ed f7 ff ff       	jmp    804de0e <_dtoa_r+0x92e>
 804e621:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
 804e625:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e628:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e62b:	74 28                	je     804e655 <_dtoa_r+0x1175>
 804e62d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e631:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e634:	83 c0 01             	add    $0x1,%eax
 804e637:	89 cb                	mov    %ecx,%ebx
 804e639:	e9 1d ff ff ff       	jmp    804e55b <_dtoa_r+0x107b>
 804e63e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e641:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e644:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e647:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e64a:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e64d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e650:	e9 cc f8 ff ff       	jmp    804df21 <_dtoa_r+0xa41>
 804e655:	8b 45 98             	mov    -0x68(%ebp),%eax
 804e658:	b9 39 00 00 00       	mov    $0x39,%ecx
 804e65d:	8d 50 01             	lea    0x1(%eax),%edx
 804e660:	c6 00 39             	movb   $0x39,(%eax)
 804e663:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e666:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e669:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e66c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e66f:	e9 fa f8 ff ff       	jmp    804df6e <_dtoa_r+0xa8e>
 804e674:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e677:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e67a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e67d:	83 fb 39             	cmp    $0x39,%ebx
 804e680:	74 d3                	je     804e655 <_dtoa_r+0x1175>
 804e682:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804e685:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804e688:	83 c0 31             	add    $0x31,%eax
 804e68b:	85 c9                	test   %ecx,%ecx
 804e68d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e690:	0f 4e c3             	cmovle %ebx,%eax
 804e693:	89 cb                	mov    %ecx,%ebx
 804e695:	e9 c1 fe ff ff       	jmp    804e55b <_dtoa_r+0x107b>
 804e69a:	0f 85 b2 fe ff ff    	jne    804e552 <_dtoa_r+0x1072>
 804e6a0:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
 804e6a4:	0f 84 a8 fe ff ff    	je     804e552 <_dtoa_r+0x1072>
 804e6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e6b0:	e9 8a fe ff ff       	jmp    804e53f <_dtoa_r+0x105f>
 804e6b5:	0f 85 c7 f3 ff ff    	jne    804da82 <_dtoa_r+0x5a2>
 804e6bb:	dd d8                	fstp   %st(0)
 804e6bd:	dd d8                	fstp   %st(0)
 804e6bf:	90                   	nop
 804e6c0:	e9 65 fd ff ff       	jmp    804e42a <_dtoa_r+0xf4a>
 804e6c5:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e6c8:	e9 dd f5 ff ff       	jmp    804dcaa <_dtoa_r+0x7ca>
 804e6cd:	8d 76 00             	lea    0x0(%esi),%esi
 804e6d0:	0f 84 7a f5 ff ff    	je     804dc50 <_dtoa_r+0x770>
 804e6d6:	b8 3c 00 00 00       	mov    $0x3c,%eax
 804e6db:	29 d0                	sub    %edx,%eax
 804e6dd:	e9 ab f8 ff ff       	jmp    804df8d <_dtoa_r+0xaad>
 804e6e2:	b8 01 00 00 00       	mov    $0x1,%eax
 804e6e7:	e9 d9 ef ff ff       	jmp    804d6c5 <_dtoa_r+0x1e5>
 804e6ec:	31 d2                	xor    %edx,%edx
 804e6ee:	e9 36 f1 ff ff       	jmp    804d829 <_dtoa_r+0x349>
 804e6f3:	66 90                	xchg   %ax,%ax
 804e6f5:	66 90                	xchg   %ax,%ax
 804e6f7:	66 90                	xchg   %ax,%ax
 804e6f9:	66 90                	xchg   %ax,%ax
 804e6fb:	66 90                	xchg   %ax,%ax
 804e6fd:	66 90                	xchg   %ax,%ax
 804e6ff:	90                   	nop

0804e700 <__sflush_r>:
 804e700:	55                   	push   %ebp
 804e701:	89 e5                	mov    %esp,%ebp
 804e703:	57                   	push   %edi
 804e704:	56                   	push   %esi
 804e705:	53                   	push   %ebx
 804e706:	83 ec 1c             	sub    $0x1c,%esp
 804e709:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804e70c:	0f b7 47 0c          	movzwl 0xc(%edi),%eax
 804e710:	a8 08                	test   $0x8,%al
 804e712:	0f 85 c8 00 00 00    	jne    804e7e0 <__sflush_r+0xe0>
 804e718:	8b 77 04             	mov    0x4(%edi),%esi
 804e71b:	89 c1                	mov    %eax,%ecx
 804e71d:	80 cd 08             	or     $0x8,%ch
 804e720:	66 89 4f 0c          	mov    %cx,0xc(%edi)
 804e724:	85 f6                	test   %esi,%esi
 804e726:	0f 8e 0c 01 00 00    	jle    804e838 <__sflush_r+0x138>
 804e72c:	8b 57 28             	mov    0x28(%edi),%edx
 804e72f:	85 d2                	test   %edx,%edx
 804e731:	0f 84 98 00 00 00    	je     804e7cf <__sflush_r+0xcf>
 804e737:	8b 75 08             	mov    0x8(%ebp),%esi
 804e73a:	f6 c4 10             	test   $0x10,%ah
 804e73d:	8b 1e                	mov    (%esi),%ebx
 804e73f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 804e745:	0f 84 fd 00 00 00    	je     804e848 <__sflush_r+0x148>
 804e74b:	8b 47 50             	mov    0x50(%edi),%eax
 804e74e:	83 e1 04             	and    $0x4,%ecx
 804e751:	74 0d                	je     804e760 <__sflush_r+0x60>
 804e753:	8b 4f 30             	mov    0x30(%edi),%ecx
 804e756:	2b 47 04             	sub    0x4(%edi),%eax
 804e759:	85 c9                	test   %ecx,%ecx
 804e75b:	74 03                	je     804e760 <__sflush_r+0x60>
 804e75d:	2b 47 3c             	sub    0x3c(%edi),%eax
 804e760:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e767:	00 
 804e768:	89 44 24 08          	mov    %eax,0x8(%esp)
 804e76c:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e76f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e773:	8b 45 08             	mov    0x8(%ebp),%eax
 804e776:	89 04 24             	mov    %eax,(%esp)
 804e779:	ff d2                	call   *%edx
 804e77b:	83 f8 ff             	cmp    $0xffffffff,%eax
 804e77e:	0f 84 f4 00 00 00    	je     804e878 <__sflush_r+0x178>
 804e784:	0f b7 57 0c          	movzwl 0xc(%edi),%edx
 804e788:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
 804e78f:	89 d1                	mov    %edx,%ecx
 804e791:	80 e5 f7             	and    $0xf7,%ch
 804e794:	80 e6 10             	and    $0x10,%dh
 804e797:	66 89 4f 0c          	mov    %cx,0xc(%edi)
 804e79b:	8b 4f 10             	mov    0x10(%edi),%ecx
 804e79e:	89 0f                	mov    %ecx,(%edi)
 804e7a0:	0f 85 25 01 00 00    	jne    804e8cb <__sflush_r+0x1cb>
 804e7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 804e7a9:	89 18                	mov    %ebx,(%eax)
 804e7ab:	8b 47 30             	mov    0x30(%edi),%eax
 804e7ae:	85 c0                	test   %eax,%eax
 804e7b0:	74 1d                	je     804e7cf <__sflush_r+0xcf>
 804e7b2:	8d 57 40             	lea    0x40(%edi),%edx
 804e7b5:	39 d0                	cmp    %edx,%eax
 804e7b7:	74 0f                	je     804e7c8 <__sflush_r+0xc8>
 804e7b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 804e7c0:	89 04 24             	mov    %eax,(%esp)
 804e7c3:	e8 d8 06 00 00       	call   804eea0 <_free_r>
 804e7c8:	c7 47 30 00 00 00 00 	movl   $0x0,0x30(%edi)
 804e7cf:	31 c0                	xor    %eax,%eax
 804e7d1:	83 c4 1c             	add    $0x1c,%esp
 804e7d4:	5b                   	pop    %ebx
 804e7d5:	5e                   	pop    %esi
 804e7d6:	5f                   	pop    %edi
 804e7d7:	5d                   	pop    %ebp
 804e7d8:	c3                   	ret    
 804e7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e7e0:	8b 77 10             	mov    0x10(%edi),%esi
 804e7e3:	85 f6                	test   %esi,%esi
 804e7e5:	74 e8                	je     804e7cf <__sflush_r+0xcf>
 804e7e7:	8b 1f                	mov    (%edi),%ebx
 804e7e9:	31 c9                	xor    %ecx,%ecx
 804e7eb:	89 37                	mov    %esi,(%edi)
 804e7ed:	29 f3                	sub    %esi,%ebx
 804e7ef:	a8 03                	test   $0x3,%al
 804e7f1:	75 03                	jne    804e7f6 <__sflush_r+0xf6>
 804e7f3:	8b 4f 14             	mov    0x14(%edi),%ecx
 804e7f6:	85 db                	test   %ebx,%ebx
 804e7f8:	89 4f 08             	mov    %ecx,0x8(%edi)
 804e7fb:	7f 0b                	jg     804e808 <__sflush_r+0x108>
 804e7fd:	eb d0                	jmp    804e7cf <__sflush_r+0xcf>
 804e7ff:	90                   	nop
 804e800:	29 c3                	sub    %eax,%ebx
 804e802:	01 c6                	add    %eax,%esi
 804e804:	85 db                	test   %ebx,%ebx
 804e806:	7e c7                	jle    804e7cf <__sflush_r+0xcf>
 804e808:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804e80c:	89 74 24 08          	mov    %esi,0x8(%esp)
 804e810:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e813:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e817:	8b 45 08             	mov    0x8(%ebp),%eax
 804e81a:	89 04 24             	mov    %eax,(%esp)
 804e81d:	ff 57 24             	call   *0x24(%edi)
 804e820:	85 c0                	test   %eax,%eax
 804e822:	7f dc                	jg     804e800 <__sflush_r+0x100>
 804e824:	66 83 4f 0c 40       	orw    $0x40,0xc(%edi)
 804e829:	83 c4 1c             	add    $0x1c,%esp
 804e82c:	5b                   	pop    %ebx
 804e82d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804e832:	5e                   	pop    %esi
 804e833:	5f                   	pop    %edi
 804e834:	5d                   	pop    %ebp
 804e835:	c3                   	ret    
 804e836:	66 90                	xchg   %ax,%ax
 804e838:	8b 5f 3c             	mov    0x3c(%edi),%ebx
 804e83b:	85 db                	test   %ebx,%ebx
 804e83d:	0f 8f e9 fe ff ff    	jg     804e72c <__sflush_r+0x2c>
 804e843:	eb 8a                	jmp    804e7cf <__sflush_r+0xcf>
 804e845:	8d 76 00             	lea    0x0(%esi),%esi
 804e848:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804e84f:	00 
 804e850:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804e857:	00 
 804e858:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e85b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e85f:	8b 45 08             	mov    0x8(%ebp),%eax
 804e862:	89 04 24             	mov    %eax,(%esp)
 804e865:	ff d2                	call   *%edx
 804e867:	83 f8 ff             	cmp    $0xffffffff,%eax
 804e86a:	74 3c                	je     804e8a8 <__sflush_r+0x1a8>
 804e86c:	0f b7 4f 0c          	movzwl 0xc(%edi),%ecx
 804e870:	8b 57 28             	mov    0x28(%edi),%edx
 804e873:	e9 d6 fe ff ff       	jmp    804e74e <__sflush_r+0x4e>
 804e878:	8b 55 08             	mov    0x8(%ebp),%edx
 804e87b:	8b 12                	mov    (%edx),%edx
 804e87d:	85 d2                	test   %edx,%edx
 804e87f:	0f 84 ff fe ff ff    	je     804e784 <__sflush_r+0x84>
 804e885:	83 fa 1d             	cmp    $0x1d,%edx
 804e888:	74 05                	je     804e88f <__sflush_r+0x18f>
 804e88a:	83 fa 16             	cmp    $0x16,%edx
 804e88d:	75 95                	jne    804e824 <__sflush_r+0x124>
 804e88f:	8b 47 10             	mov    0x10(%edi),%eax
 804e892:	66 81 67 0c ff f7    	andw   $0xf7ff,0xc(%edi)
 804e898:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
 804e89f:	89 07                	mov    %eax,(%edi)
 804e8a1:	e9 00 ff ff ff       	jmp    804e7a6 <__sflush_r+0xa6>
 804e8a6:	66 90                	xchg   %ax,%ax
 804e8a8:	8b 55 08             	mov    0x8(%ebp),%edx
 804e8ab:	8b 12                	mov    (%edx),%edx
 804e8ad:	85 d2                	test   %edx,%edx
 804e8af:	74 bb                	je     804e86c <__sflush_r+0x16c>
 804e8b1:	83 fa 16             	cmp    $0x16,%edx
 804e8b4:	74 09                	je     804e8bf <__sflush_r+0x1bf>
 804e8b6:	83 fa 1d             	cmp    $0x1d,%edx
 804e8b9:	0f 85 65 ff ff ff    	jne    804e824 <__sflush_r+0x124>
 804e8bf:	8b 45 08             	mov    0x8(%ebp),%eax
 804e8c2:	89 18                	mov    %ebx,(%eax)
 804e8c4:	31 c0                	xor    %eax,%eax
 804e8c6:	e9 06 ff ff ff       	jmp    804e7d1 <__sflush_r+0xd1>
 804e8cb:	89 47 50             	mov    %eax,0x50(%edi)
 804e8ce:	e9 d3 fe ff ff       	jmp    804e7a6 <__sflush_r+0xa6>
 804e8d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e8e0 <_fflush_r>:
 804e8e0:	55                   	push   %ebp
 804e8e1:	89 e5                	mov    %esp,%ebp
 804e8e3:	56                   	push   %esi
 804e8e4:	53                   	push   %ebx
 804e8e5:	83 ec 10             	sub    $0x10,%esp
 804e8e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804e8eb:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e8ee:	85 db                	test   %ebx,%ebx
 804e8f0:	74 07                	je     804e8f9 <_fflush_r+0x19>
 804e8f2:	8b 43 38             	mov    0x38(%ebx),%eax
 804e8f5:	85 c0                	test   %eax,%eax
 804e8f7:	74 2f                	je     804e928 <_fflush_r+0x48>
 804e8f9:	66 83 7e 0c 00       	cmpw   $0x0,0xc(%esi)
 804e8fe:	75 10                	jne    804e910 <_fflush_r+0x30>
 804e900:	83 c4 10             	add    $0x10,%esp
 804e903:	31 c0                	xor    %eax,%eax
 804e905:	5b                   	pop    %ebx
 804e906:	5e                   	pop    %esi
 804e907:	5d                   	pop    %ebp
 804e908:	c3                   	ret    
 804e909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e910:	89 75 0c             	mov    %esi,0xc(%ebp)
 804e913:	89 5d 08             	mov    %ebx,0x8(%ebp)
 804e916:	83 c4 10             	add    $0x10,%esp
 804e919:	5b                   	pop    %ebx
 804e91a:	5e                   	pop    %esi
 804e91b:	5d                   	pop    %ebp
 804e91c:	e9 df fd ff ff       	jmp    804e700 <__sflush_r>
 804e921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e928:	89 1c 24             	mov    %ebx,(%esp)
 804e92b:	e8 20 01 00 00       	call   804ea50 <__sinit>
 804e930:	eb c7                	jmp    804e8f9 <_fflush_r+0x19>
 804e932:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e940 <fflush>:
 804e940:	55                   	push   %ebp
 804e941:	89 e5                	mov    %esp,%ebp
 804e943:	53                   	push   %ebx
 804e944:	83 ec 14             	sub    $0x14,%esp
 804e947:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804e94a:	85 db                	test   %ebx,%ebx
 804e94c:	74 1a                	je     804e968 <fflush+0x28>
 804e94e:	e8 9d 08 00 00       	call   804f1f0 <__getreent>
 804e953:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e957:	89 04 24             	mov    %eax,(%esp)
 804e95a:	e8 81 ff ff ff       	call   804e8e0 <_fflush_r>
 804e95f:	83 c4 14             	add    $0x14,%esp
 804e962:	5b                   	pop    %ebx
 804e963:	5d                   	pop    %ebp
 804e964:	c3                   	ret    
 804e965:	8d 76 00             	lea    0x0(%esi),%esi
 804e968:	a1 b0 49 05 08       	mov    0x80549b0,%eax
 804e96d:	c7 44 24 04 e0 e8 04 	movl   $0x804e8e0,0x4(%esp)
 804e974:	08 
 804e975:	89 04 24             	mov    %eax,(%esp)
 804e978:	e8 f3 07 00 00       	call   804f170 <_fwalk_reent>
 804e97d:	83 c4 14             	add    $0x14,%esp
 804e980:	5b                   	pop    %ebx
 804e981:	5d                   	pop    %ebp
 804e982:	c3                   	ret    
 804e983:	66 90                	xchg   %ax,%ax
 804e985:	66 90                	xchg   %ax,%ax
 804e987:	66 90                	xchg   %ax,%ax
 804e989:	66 90                	xchg   %ax,%ax
 804e98b:	66 90                	xchg   %ax,%ax
 804e98d:	66 90                	xchg   %ax,%ax
 804e98f:	90                   	nop

0804e990 <__fp_lock>:
 804e990:	55                   	push   %ebp
 804e991:	31 c0                	xor    %eax,%eax
 804e993:	89 e5                	mov    %esp,%ebp
 804e995:	5d                   	pop    %ebp
 804e996:	c3                   	ret    
 804e997:	89 f6                	mov    %esi,%esi
 804e999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e9a0 <__fp_unlock>:
 804e9a0:	55                   	push   %ebp
 804e9a1:	31 c0                	xor    %eax,%eax
 804e9a3:	89 e5                	mov    %esp,%ebp
 804e9a5:	5d                   	pop    %ebp
 804e9a6:	c3                   	ret    
 804e9a7:	89 f6                	mov    %esi,%esi
 804e9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e9b0 <_cleanup_r>:
 804e9b0:	55                   	push   %ebp
 804e9b1:	89 e5                	mov    %esp,%ebp
 804e9b3:	83 ec 18             	sub    $0x18,%esp
 804e9b6:	8b 45 08             	mov    0x8(%ebp),%eax
 804e9b9:	c7 44 24 04 e0 30 05 	movl   $0x80530e0,0x4(%esp)
 804e9c0:	08 
 804e9c1:	89 04 24             	mov    %eax,(%esp)
 804e9c4:	e8 37 07 00 00       	call   804f100 <_fwalk>
 804e9c9:	c9                   	leave  
 804e9ca:	c3                   	ret    
 804e9cb:	90                   	nop
 804e9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0804e9d0 <__sfmoreglue>:
 804e9d0:	55                   	push   %ebp
 804e9d1:	89 e5                	mov    %esp,%ebp
 804e9d3:	57                   	push   %edi
 804e9d4:	56                   	push   %esi
 804e9d5:	53                   	push   %ebx
 804e9d6:	83 ec 1c             	sub    $0x1c,%esp
 804e9d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e9dc:	8d 7e ff             	lea    -0x1(%esi),%edi
 804e9df:	6b ff 68             	imul   $0x68,%edi,%edi
 804e9e2:	8d 47 74             	lea    0x74(%edi),%eax
 804e9e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 804e9ec:	89 04 24             	mov    %eax,(%esp)
 804e9ef:	e8 5c 0a 00 00       	call   804f450 <_malloc_r>
 804e9f4:	85 c0                	test   %eax,%eax
 804e9f6:	89 c3                	mov    %eax,%ebx
 804e9f8:	74 26                	je     804ea20 <__sfmoreglue+0x50>
 804e9fa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804ea00:	83 c7 68             	add    $0x68,%edi
 804ea03:	89 70 04             	mov    %esi,0x4(%eax)
 804ea06:	8d 40 0c             	lea    0xc(%eax),%eax
 804ea09:	89 43 08             	mov    %eax,0x8(%ebx)
 804ea0c:	89 7c 24 08          	mov    %edi,0x8(%esp)
 804ea10:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ea17:	00 
 804ea18:	89 04 24             	mov    %eax,(%esp)
 804ea1b:	e8 24 a5 ff ff       	call   8048f44 <memset>
 804ea20:	83 c4 1c             	add    $0x1c,%esp
 804ea23:	89 d8                	mov    %ebx,%eax
 804ea25:	5b                   	pop    %ebx
 804ea26:	5e                   	pop    %esi
 804ea27:	5f                   	pop    %edi
 804ea28:	5d                   	pop    %ebp
 804ea29:	c3                   	ret    
 804ea2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804ea30 <_cleanup>:
 804ea30:	55                   	push   %ebp
 804ea31:	89 e5                	mov    %esp,%ebp
 804ea33:	83 ec 18             	sub    $0x18,%esp
 804ea36:	a1 b0 49 05 08       	mov    0x80549b0,%eax
 804ea3b:	c7 44 24 04 e0 30 05 	movl   $0x80530e0,0x4(%esp)
 804ea42:	08 
 804ea43:	89 04 24             	mov    %eax,(%esp)
 804ea46:	e8 b5 06 00 00       	call   804f100 <_fwalk>
 804ea4b:	c9                   	leave  
 804ea4c:	c3                   	ret    
 804ea4d:	8d 76 00             	lea    0x0(%esi),%esi

0804ea50 <__sinit>:
 804ea50:	55                   	push   %ebp
 804ea51:	89 e5                	mov    %esp,%ebp
 804ea53:	56                   	push   %esi
 804ea54:	53                   	push   %ebx
 804ea55:	83 ec 10             	sub    $0x10,%esp
 804ea58:	8b 75 08             	mov    0x8(%ebp),%esi
 804ea5b:	8b 46 38             	mov    0x38(%esi),%eax
 804ea5e:	85 c0                	test   %eax,%eax
 804ea60:	0f 85 a8 01 00 00    	jne    804ec0e <__sinit+0x1be>
 804ea66:	8b 5e 04             	mov    0x4(%esi),%ebx
 804ea69:	8d 86 ec 02 00 00    	lea    0x2ec(%esi),%eax
 804ea6f:	31 d2                	xor    %edx,%edx
 804ea71:	89 86 e8 02 00 00    	mov    %eax,0x2e8(%esi)
 804ea77:	b8 04 00 00 00       	mov    $0x4,%eax
 804ea7c:	c7 46 3c b0 e9 04 08 	movl   $0x804e9b0,0x3c(%esi)
 804ea83:	c7 86 e0 02 00 00 00 	movl   $0x0,0x2e0(%esi)
 804ea8a:	00 00 00 
 804ea8d:	c7 86 e4 02 00 00 03 	movl   $0x3,0x2e4(%esi)
 804ea94:	00 00 00 
 804ea97:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804ea9b:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804ea9e:	66 89 53 0e          	mov    %dx,0xe(%ebx)
 804eaa2:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804eaa8:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804eaaf:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804eab6:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804eabd:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804eac4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804eacb:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804ead2:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804ead9:	00 
 804eada:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804eae1:	00 
 804eae2:	89 04 24             	mov    %eax,(%esp)
 804eae5:	e8 5a a4 ff ff       	call   8048f44 <memset>
 804eaea:	b8 01 00 00 00       	mov    $0x1,%eax
 804eaef:	b9 09 00 00 00       	mov    $0x9,%ecx
 804eaf4:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804eaf7:	c7 43 20 20 0b 05 08 	movl   $0x8050b20,0x20(%ebx)
 804eafe:	c7 43 24 80 0b 05 08 	movl   $0x8050b80,0x24(%ebx)
 804eb05:	c7 43 28 f0 0b 05 08 	movl   $0x8050bf0,0x28(%ebx)
 804eb0c:	c7 43 2c 40 0c 05 08 	movl   $0x8050c40,0x2c(%ebx)
 804eb13:	8b 5e 08             	mov    0x8(%esi),%ebx
 804eb16:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804eb1a:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804eb1d:	66 89 4b 0c          	mov    %cx,0xc(%ebx)
 804eb21:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804eb27:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804eb2e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804eb35:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804eb3c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804eb43:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804eb4a:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804eb51:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804eb58:	00 
 804eb59:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804eb60:	00 
 804eb61:	89 04 24             	mov    %eax,(%esp)
 804eb64:	e8 db a3 ff ff       	call   8048f44 <memset>
 804eb69:	b8 12 00 00 00       	mov    $0x12,%eax
 804eb6e:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804eb71:	c7 43 20 20 0b 05 08 	movl   $0x8050b20,0x20(%ebx)
 804eb78:	c7 43 24 80 0b 05 08 	movl   $0x8050b80,0x24(%ebx)
 804eb7f:	c7 43 28 f0 0b 05 08 	movl   $0x8050bf0,0x28(%ebx)
 804eb86:	c7 43 2c 40 0c 05 08 	movl   $0x8050c40,0x2c(%ebx)
 804eb8d:	8b 5e 0c             	mov    0xc(%esi),%ebx
 804eb90:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804eb94:	b8 02 00 00 00       	mov    $0x2,%eax
 804eb99:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804eb9d:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804eba0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804eba6:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804ebad:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804ebb4:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804ebbb:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804ebc2:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804ebc9:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804ebd0:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804ebd7:	00 
 804ebd8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ebdf:	00 
 804ebe0:	89 04 24             	mov    %eax,(%esp)
 804ebe3:	e8 5c a3 ff ff       	call   8048f44 <memset>
 804ebe8:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804ebeb:	c7 43 20 20 0b 05 08 	movl   $0x8050b20,0x20(%ebx)
 804ebf2:	c7 43 24 80 0b 05 08 	movl   $0x8050b80,0x24(%ebx)
 804ebf9:	c7 43 28 f0 0b 05 08 	movl   $0x8050bf0,0x28(%ebx)
 804ec00:	c7 43 2c 40 0c 05 08 	movl   $0x8050c40,0x2c(%ebx)
 804ec07:	c7 46 38 01 00 00 00 	movl   $0x1,0x38(%esi)
 804ec0e:	83 c4 10             	add    $0x10,%esp
 804ec11:	5b                   	pop    %ebx
 804ec12:	5e                   	pop    %esi
 804ec13:	5d                   	pop    %ebp
 804ec14:	c3                   	ret    
 804ec15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ec19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ec20 <__sfp>:
 804ec20:	55                   	push   %ebp
 804ec21:	89 e5                	mov    %esp,%ebp
 804ec23:	56                   	push   %esi
 804ec24:	53                   	push   %ebx
 804ec25:	83 ec 10             	sub    $0x10,%esp
 804ec28:	8b 35 b0 49 05 08    	mov    0x80549b0,%esi
 804ec2e:	8b 4e 38             	mov    0x38(%esi),%ecx
 804ec31:	85 c9                	test   %ecx,%ecx
 804ec33:	0f 84 bf 00 00 00    	je     804ecf8 <__sfp+0xd8>
 804ec39:	81 c6 e0 02 00 00    	add    $0x2e0,%esi
 804ec3f:	8b 46 04             	mov    0x4(%esi),%eax
 804ec42:	8b 5e 08             	mov    0x8(%esi),%ebx
 804ec45:	83 e8 01             	sub    $0x1,%eax
 804ec48:	79 15                	jns    804ec5f <__sfp+0x3f>
 804ec4a:	e9 99 00 00 00       	jmp    804ece8 <__sfp+0xc8>
 804ec4f:	90                   	nop
 804ec50:	83 e8 01             	sub    $0x1,%eax
 804ec53:	83 c3 68             	add    $0x68,%ebx
 804ec56:	83 f8 ff             	cmp    $0xffffffff,%eax
 804ec59:	0f 84 89 00 00 00    	je     804ece8 <__sfp+0xc8>
 804ec5f:	66 83 7b 0c 00       	cmpw   $0x0,0xc(%ebx)
 804ec64:	75 ea                	jne    804ec50 <__sfp+0x30>
 804ec66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804ec6b:	ba 01 00 00 00       	mov    $0x1,%edx
 804ec70:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804ec74:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804ec77:	66 89 53 0c          	mov    %dx,0xc(%ebx)
 804ec7b:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804ec82:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804ec88:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804ec8f:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804ec96:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804ec9d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804eca4:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804ecab:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804ecb2:	00 
 804ecb3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ecba:	00 
 804ecbb:	89 04 24             	mov    %eax,(%esp)
 804ecbe:	e8 81 a2 ff ff       	call   8048f44 <memset>
 804ecc3:	89 d8                	mov    %ebx,%eax
 804ecc5:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 804eccc:	c7 43 34 00 00 00 00 	movl   $0x0,0x34(%ebx)
 804ecd3:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
 804ecda:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
 804ece1:	83 c4 10             	add    $0x10,%esp
 804ece4:	5b                   	pop    %ebx
 804ece5:	5e                   	pop    %esi
 804ece6:	5d                   	pop    %ebp
 804ece7:	c3                   	ret    
 804ece8:	8b 06                	mov    (%esi),%eax
 804ecea:	85 c0                	test   %eax,%eax
 804ecec:	74 17                	je     804ed05 <__sfp+0xe5>
 804ecee:	89 c6                	mov    %eax,%esi
 804ecf0:	e9 4a ff ff ff       	jmp    804ec3f <__sfp+0x1f>
 804ecf5:	8d 76 00             	lea    0x0(%esi),%esi
 804ecf8:	89 34 24             	mov    %esi,(%esp)
 804ecfb:	e8 50 fd ff ff       	call   804ea50 <__sinit>
 804ed00:	e9 34 ff ff ff       	jmp    804ec39 <__sfp+0x19>
 804ed05:	8b 45 08             	mov    0x8(%ebp),%eax
 804ed08:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 804ed0f:	00 
 804ed10:	89 04 24             	mov    %eax,(%esp)
 804ed13:	e8 b8 fc ff ff       	call   804e9d0 <__sfmoreglue>
 804ed18:	85 c0                	test   %eax,%eax
 804ed1a:	89 06                	mov    %eax,(%esi)
 804ed1c:	75 d0                	jne    804ecee <__sfp+0xce>
 804ed1e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ed21:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804ed27:	31 c0                	xor    %eax,%eax
 804ed29:	eb b6                	jmp    804ece1 <__sfp+0xc1>
 804ed2b:	90                   	nop
 804ed2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0804ed30 <__sfp_lock_acquire>:
 804ed30:	55                   	push   %ebp
 804ed31:	89 e5                	mov    %esp,%ebp
 804ed33:	5d                   	pop    %ebp
 804ed34:	c3                   	ret    
 804ed35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed40 <__sfp_lock_release>:
 804ed40:	55                   	push   %ebp
 804ed41:	89 e5                	mov    %esp,%ebp
 804ed43:	5d                   	pop    %ebp
 804ed44:	c3                   	ret    
 804ed45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed50 <__sinit_lock_acquire>:
 804ed50:	55                   	push   %ebp
 804ed51:	89 e5                	mov    %esp,%ebp
 804ed53:	5d                   	pop    %ebp
 804ed54:	c3                   	ret    
 804ed55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed60 <__sinit_lock_release>:
 804ed60:	55                   	push   %ebp
 804ed61:	89 e5                	mov    %esp,%ebp
 804ed63:	5d                   	pop    %ebp
 804ed64:	c3                   	ret    
 804ed65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed70 <__fp_lock_all>:
 804ed70:	55                   	push   %ebp
 804ed71:	89 e5                	mov    %esp,%ebp
 804ed73:	83 ec 18             	sub    $0x18,%esp
 804ed76:	e8 75 04 00 00       	call   804f1f0 <__getreent>
 804ed7b:	c7 44 24 04 90 e9 04 	movl   $0x804e990,0x4(%esp)
 804ed82:	08 
 804ed83:	89 04 24             	mov    %eax,(%esp)
 804ed86:	e8 75 03 00 00       	call   804f100 <_fwalk>
 804ed8b:	c9                   	leave  
 804ed8c:	c3                   	ret    
 804ed8d:	8d 76 00             	lea    0x0(%esi),%esi

0804ed90 <__fp_unlock_all>:
 804ed90:	55                   	push   %ebp
 804ed91:	89 e5                	mov    %esp,%ebp
 804ed93:	83 ec 18             	sub    $0x18,%esp
 804ed96:	e8 55 04 00 00       	call   804f1f0 <__getreent>
 804ed9b:	c7 44 24 04 a0 e9 04 	movl   $0x804e9a0,0x4(%esp)
 804eda2:	08 
 804eda3:	89 04 24             	mov    %eax,(%esp)
 804eda6:	e8 55 03 00 00       	call   804f100 <_fwalk>
 804edab:	c9                   	leave  
 804edac:	c3                   	ret    
 804edad:	66 90                	xchg   %ax,%ax
 804edaf:	90                   	nop

0804edb0 <_malloc_trim_r>:
 804edb0:	55                   	push   %ebp
 804edb1:	89 e5                	mov    %esp,%ebp
 804edb3:	57                   	push   %edi
 804edb4:	56                   	push   %esi
 804edb5:	53                   	push   %ebx
 804edb6:	83 ec 1c             	sub    $0x1c,%esp
 804edb9:	8b 75 08             	mov    0x8(%ebp),%esi
 804edbc:	89 34 24             	mov    %esi,(%esp)
 804edbf:	e8 ac 0e 00 00       	call   804fc70 <__malloc_lock>
 804edc4:	a1 88 80 05 08       	mov    0x8058088,%eax
 804edc9:	8b 58 04             	mov    0x4(%eax),%ebx
 804edcc:	83 e3 fc             	and    $0xfffffffc,%ebx
 804edcf:	89 d8                	mov    %ebx,%eax
 804edd1:	2b 45 0c             	sub    0xc(%ebp),%eax
 804edd4:	05 ef 0f 00 00       	add    $0xfef,%eax
 804edd9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 804edde:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
 804ede4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 804edea:	7e 1c                	jle    804ee08 <_malloc_trim_r+0x58>
 804edec:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804edf3:	00 
 804edf4:	89 34 24             	mov    %esi,(%esp)
 804edf7:	e8 74 1c 00 00       	call   8050a70 <_sbrk_r>
 804edfc:	8b 15 88 80 05 08    	mov    0x8058088,%edx
 804ee02:	01 da                	add    %ebx,%edx
 804ee04:	39 d0                	cmp    %edx,%eax
 804ee06:	74 18                	je     804ee20 <_malloc_trim_r+0x70>
 804ee08:	89 34 24             	mov    %esi,(%esp)
 804ee0b:	e8 70 0e 00 00       	call   804fc80 <__malloc_unlock>
 804ee10:	83 c4 1c             	add    $0x1c,%esp
 804ee13:	31 c0                	xor    %eax,%eax
 804ee15:	5b                   	pop    %ebx
 804ee16:	5e                   	pop    %esi
 804ee17:	5f                   	pop    %edi
 804ee18:	5d                   	pop    %ebp
 804ee19:	c3                   	ret    
 804ee1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ee20:	89 f8                	mov    %edi,%eax
 804ee22:	f7 d8                	neg    %eax
 804ee24:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ee28:	89 34 24             	mov    %esi,(%esp)
 804ee2b:	e8 40 1c 00 00       	call   8050a70 <_sbrk_r>
 804ee30:	83 f8 ff             	cmp    $0xffffffff,%eax
 804ee33:	74 2b                	je     804ee60 <_malloc_trim_r+0xb0>
 804ee35:	a1 88 80 05 08       	mov    0x8058088,%eax
 804ee3a:	29 fb                	sub    %edi,%ebx
 804ee3c:	83 cb 01             	or     $0x1,%ebx
 804ee3f:	29 3d 60 dd 06 08    	sub    %edi,0x806dd60
 804ee45:	89 58 04             	mov    %ebx,0x4(%eax)
 804ee48:	89 34 24             	mov    %esi,(%esp)
 804ee4b:	e8 30 0e 00 00       	call   804fc80 <__malloc_unlock>
 804ee50:	83 c4 1c             	add    $0x1c,%esp
 804ee53:	b8 01 00 00 00       	mov    $0x1,%eax
 804ee58:	5b                   	pop    %ebx
 804ee59:	5e                   	pop    %esi
 804ee5a:	5f                   	pop    %edi
 804ee5b:	5d                   	pop    %ebp
 804ee5c:	c3                   	ret    
 804ee5d:	8d 76 00             	lea    0x0(%esi),%esi
 804ee60:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ee67:	00 
 804ee68:	89 34 24             	mov    %esi,(%esp)
 804ee6b:	e8 00 1c 00 00       	call   8050a70 <_sbrk_r>
 804ee70:	8b 15 88 80 05 08    	mov    0x8058088,%edx
 804ee76:	89 c1                	mov    %eax,%ecx
 804ee78:	29 d1                	sub    %edx,%ecx
 804ee7a:	83 f9 0f             	cmp    $0xf,%ecx
 804ee7d:	7e 89                	jle    804ee08 <_malloc_trim_r+0x58>
 804ee7f:	2b 05 60 80 05 08    	sub    0x8058060,%eax
 804ee85:	83 c9 01             	or     $0x1,%ecx
 804ee88:	89 4a 04             	mov    %ecx,0x4(%edx)
 804ee8b:	a3 60 dd 06 08       	mov    %eax,0x806dd60
 804ee90:	e9 73 ff ff ff       	jmp    804ee08 <_malloc_trim_r+0x58>
 804ee95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ee99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804eea0 <_free_r>:
 804eea0:	55                   	push   %ebp
 804eea1:	89 e5                	mov    %esp,%ebp
 804eea3:	57                   	push   %edi
 804eea4:	56                   	push   %esi
 804eea5:	53                   	push   %ebx
 804eea6:	83 ec 1c             	sub    $0x1c,%esp
 804eea9:	8b 75 0c             	mov    0xc(%ebp),%esi
 804eeac:	8b 45 08             	mov    0x8(%ebp),%eax
 804eeaf:	85 f6                	test   %esi,%esi
 804eeb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804eeb4:	0f 84 fe 00 00 00    	je     804efb8 <_free_r+0x118>
 804eeba:	89 04 24             	mov    %eax,(%esp)
 804eebd:	e8 ae 0d 00 00       	call   804fc70 <__malloc_lock>
 804eec2:	8b 7e fc             	mov    -0x4(%esi),%edi
 804eec5:	8d 56 f8             	lea    -0x8(%esi),%edx
 804eec8:	89 f8                	mov    %edi,%eax
 804eeca:	83 e0 fe             	and    $0xfffffffe,%eax
 804eecd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804eed0:	8b 59 04             	mov    0x4(%ecx),%ebx
 804eed3:	83 e3 fc             	and    $0xfffffffc,%ebx
 804eed6:	39 0d 88 80 05 08    	cmp    %ecx,0x8058088
 804eedc:	0f 84 0e 01 00 00    	je     804eff0 <_free_r+0x150>
 804eee2:	83 e7 01             	and    $0x1,%edi
 804eee5:	89 59 04             	mov    %ebx,0x4(%ecx)
 804eee8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 804eeef:	75 1f                	jne    804ef10 <_free_r+0x70>
 804eef1:	8b 76 f8             	mov    -0x8(%esi),%esi
 804eef4:	29 f2                	sub    %esi,%edx
 804eef6:	01 f0                	add    %esi,%eax
 804eef8:	8b 72 08             	mov    0x8(%edx),%esi
 804eefb:	81 fe 88 80 05 08    	cmp    $0x8058088,%esi
 804ef01:	0f 84 39 01 00 00    	je     804f040 <_free_r+0x1a0>
 804ef07:	8b 7a 0c             	mov    0xc(%edx),%edi
 804ef0a:	89 7e 0c             	mov    %edi,0xc(%esi)
 804ef0d:	89 77 08             	mov    %esi,0x8(%edi)
 804ef10:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
 804ef15:	75 21                	jne    804ef38 <_free_r+0x98>
 804ef17:	8b 75 e0             	mov    -0x20(%ebp),%esi
 804ef1a:	01 d8                	add    %ebx,%eax
 804ef1c:	8b 59 08             	mov    0x8(%ecx),%ebx
 804ef1f:	85 f6                	test   %esi,%esi
 804ef21:	75 0c                	jne    804ef2f <_free_r+0x8f>
 804ef23:	81 fb 88 80 05 08    	cmp    $0x8058088,%ebx
 804ef29:	0f 84 21 01 00 00    	je     804f050 <_free_r+0x1b0>
 804ef2f:	8b 49 0c             	mov    0xc(%ecx),%ecx
 804ef32:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804ef35:	89 59 08             	mov    %ebx,0x8(%ecx)
 804ef38:	89 c1                	mov    %eax,%ecx
 804ef3a:	83 c9 01             	or     $0x1,%ecx
 804ef3d:	89 4a 04             	mov    %ecx,0x4(%edx)
 804ef40:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 804ef43:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804ef46:	85 c9                	test   %ecx,%ecx
 804ef48:	75 56                	jne    804efa0 <_free_r+0x100>
 804ef4a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
 804ef4f:	76 6f                	jbe    804efc0 <_free_r+0x120>
 804ef51:	89 c1                	mov    %eax,%ecx
 804ef53:	c1 e9 09             	shr    $0x9,%ecx
 804ef56:	83 f9 04             	cmp    $0x4,%ecx
 804ef59:	0f 87 21 01 00 00    	ja     804f080 <_free_r+0x1e0>
 804ef5f:	89 c1                	mov    %eax,%ecx
 804ef61:	c1 e9 06             	shr    $0x6,%ecx
 804ef64:	83 c1 38             	add    $0x38,%ecx
 804ef67:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804ef6a:	8d 34 9d 80 80 05 08 	lea    0x8058080(,%ebx,4),%esi
 804ef71:	8b 5e 08             	mov    0x8(%esi),%ebx
 804ef74:	39 f3                	cmp    %esi,%ebx
 804ef76:	0f 84 14 01 00 00    	je     804f090 <_free_r+0x1f0>
 804ef7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ef80:	8b 4b 04             	mov    0x4(%ebx),%ecx
 804ef83:	83 e1 fc             	and    $0xfffffffc,%ecx
 804ef86:	39 c8                	cmp    %ecx,%eax
 804ef88:	73 07                	jae    804ef91 <_free_r+0xf1>
 804ef8a:	8b 5b 08             	mov    0x8(%ebx),%ebx
 804ef8d:	39 de                	cmp    %ebx,%esi
 804ef8f:	75 ef                	jne    804ef80 <_free_r+0xe0>
 804ef91:	8b 43 0c             	mov    0xc(%ebx),%eax
 804ef94:	89 42 0c             	mov    %eax,0xc(%edx)
 804ef97:	89 5a 08             	mov    %ebx,0x8(%edx)
 804ef9a:	89 50 08             	mov    %edx,0x8(%eax)
 804ef9d:	89 53 0c             	mov    %edx,0xc(%ebx)
 804efa0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804efa3:	89 45 08             	mov    %eax,0x8(%ebp)
 804efa6:	83 c4 1c             	add    $0x1c,%esp
 804efa9:	5b                   	pop    %ebx
 804efaa:	5e                   	pop    %esi
 804efab:	5f                   	pop    %edi
 804efac:	5d                   	pop    %ebp
 804efad:	e9 ce 0c 00 00       	jmp    804fc80 <__malloc_unlock>
 804efb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804efb8:	83 c4 1c             	add    $0x1c,%esp
 804efbb:	5b                   	pop    %ebx
 804efbc:	5e                   	pop    %esi
 804efbd:	5f                   	pop    %edi
 804efbe:	5d                   	pop    %ebp
 804efbf:	c3                   	ret    
 804efc0:	c1 e8 03             	shr    $0x3,%eax
 804efc3:	bb 01 00 00 00       	mov    $0x1,%ebx
 804efc8:	89 c1                	mov    %eax,%ecx
 804efca:	c1 f9 02             	sar    $0x2,%ecx
 804efcd:	8d 04 c5 80 80 05 08 	lea    0x8058080(,%eax,8),%eax
 804efd4:	d3 e3                	shl    %cl,%ebx
 804efd6:	8b 48 08             	mov    0x8(%eax),%ecx
 804efd9:	09 1d 84 80 05 08    	or     %ebx,0x8058084
 804efdf:	89 42 0c             	mov    %eax,0xc(%edx)
 804efe2:	89 4a 08             	mov    %ecx,0x8(%edx)
 804efe5:	89 50 08             	mov    %edx,0x8(%eax)
 804efe8:	89 51 0c             	mov    %edx,0xc(%ecx)
 804efeb:	eb b3                	jmp    804efa0 <_free_r+0x100>
 804efed:	8d 76 00             	lea    0x0(%esi),%esi
 804eff0:	01 d8                	add    %ebx,%eax
 804eff2:	83 e7 01             	and    $0x1,%edi
 804eff5:	75 13                	jne    804f00a <_free_r+0x16a>
 804eff7:	8b 4e f8             	mov    -0x8(%esi),%ecx
 804effa:	29 ca                	sub    %ecx,%edx
 804effc:	01 c8                	add    %ecx,%eax
 804effe:	8b 5a 08             	mov    0x8(%edx),%ebx
 804f001:	8b 4a 0c             	mov    0xc(%edx),%ecx
 804f004:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804f007:	89 59 08             	mov    %ebx,0x8(%ecx)
 804f00a:	89 c1                	mov    %eax,%ecx
 804f00c:	83 c9 01             	or     $0x1,%ecx
 804f00f:	3b 05 64 80 05 08    	cmp    0x8058064,%eax
 804f015:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f018:	89 15 88 80 05 08    	mov    %edx,0x8058088
 804f01e:	72 80                	jb     804efa0 <_free_r+0x100>
 804f020:	a1 90 dd 06 08       	mov    0x806dd90,%eax
 804f025:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f029:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f02c:	89 04 24             	mov    %eax,(%esp)
 804f02f:	e8 7c fd ff ff       	call   804edb0 <_malloc_trim_r>
 804f034:	e9 67 ff ff ff       	jmp    804efa0 <_free_r+0x100>
 804f039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f040:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
 804f047:	e9 c4 fe ff ff       	jmp    804ef10 <_free_r+0x70>
 804f04c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f050:	89 c1                	mov    %eax,%ecx
 804f052:	83 c9 01             	or     $0x1,%ecx
 804f055:	89 15 94 80 05 08    	mov    %edx,0x8058094
 804f05b:	89 15 90 80 05 08    	mov    %edx,0x8058090
 804f061:	c7 42 0c 88 80 05 08 	movl   $0x8058088,0xc(%edx)
 804f068:	c7 42 08 88 80 05 08 	movl   $0x8058088,0x8(%edx)
 804f06f:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f072:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804f075:	e9 26 ff ff ff       	jmp    804efa0 <_free_r+0x100>
 804f07a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f080:	83 f9 14             	cmp    $0x14,%ecx
 804f083:	77 23                	ja     804f0a8 <_free_r+0x208>
 804f085:	83 c1 5b             	add    $0x5b,%ecx
 804f088:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f08b:	e9 da fe ff ff       	jmp    804ef6a <_free_r+0xca>
 804f090:	c1 f9 02             	sar    $0x2,%ecx
 804f093:	b8 01 00 00 00       	mov    $0x1,%eax
 804f098:	d3 e0                	shl    %cl,%eax
 804f09a:	09 05 84 80 05 08    	or     %eax,0x8058084
 804f0a0:	89 d8                	mov    %ebx,%eax
 804f0a2:	e9 ed fe ff ff       	jmp    804ef94 <_free_r+0xf4>
 804f0a7:	90                   	nop
 804f0a8:	83 f9 54             	cmp    $0x54,%ecx
 804f0ab:	77 10                	ja     804f0bd <_free_r+0x21d>
 804f0ad:	89 c1                	mov    %eax,%ecx
 804f0af:	c1 e9 0c             	shr    $0xc,%ecx
 804f0b2:	83 c1 6e             	add    $0x6e,%ecx
 804f0b5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0b8:	e9 ad fe ff ff       	jmp    804ef6a <_free_r+0xca>
 804f0bd:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
 804f0c3:	77 10                	ja     804f0d5 <_free_r+0x235>
 804f0c5:	89 c1                	mov    %eax,%ecx
 804f0c7:	c1 e9 0f             	shr    $0xf,%ecx
 804f0ca:	83 c1 77             	add    $0x77,%ecx
 804f0cd:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0d0:	e9 95 fe ff ff       	jmp    804ef6a <_free_r+0xca>
 804f0d5:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
 804f0db:	77 10                	ja     804f0ed <_free_r+0x24d>
 804f0dd:	89 c1                	mov    %eax,%ecx
 804f0df:	c1 e9 12             	shr    $0x12,%ecx
 804f0e2:	83 c1 7c             	add    $0x7c,%ecx
 804f0e5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0e8:	e9 7d fe ff ff       	jmp    804ef6a <_free_r+0xca>
 804f0ed:	bb fc 00 00 00       	mov    $0xfc,%ebx
 804f0f2:	b9 7e 00 00 00       	mov    $0x7e,%ecx
 804f0f7:	e9 6e fe ff ff       	jmp    804ef6a <_free_r+0xca>
 804f0fc:	66 90                	xchg   %ax,%ax
 804f0fe:	66 90                	xchg   %ax,%ax

0804f100 <_fwalk>:
 804f100:	55                   	push   %ebp
 804f101:	89 e5                	mov    %esp,%ebp
 804f103:	57                   	push   %edi
 804f104:	56                   	push   %esi
 804f105:	53                   	push   %ebx
 804f106:	83 ec 1c             	sub    $0x1c,%esp
 804f109:	8b 75 08             	mov    0x8(%ebp),%esi
 804f10c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804f113:	81 c6 e0 02 00 00    	add    $0x2e0,%esi
 804f119:	74 3d                	je     804f158 <_fwalk+0x58>
 804f11b:	90                   	nop
 804f11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f120:	8b 7e 04             	mov    0x4(%esi),%edi
 804f123:	8b 5e 08             	mov    0x8(%esi),%ebx
 804f126:	83 ef 01             	sub    $0x1,%edi
 804f129:	78 27                	js     804f152 <_fwalk+0x52>
 804f12b:	90                   	nop
 804f12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f130:	66 83 7b 0c 01       	cmpw   $0x1,0xc(%ebx)
 804f135:	76 10                	jbe    804f147 <_fwalk+0x47>
 804f137:	66 83 7b 0e ff       	cmpw   $0xffff,0xe(%ebx)
 804f13c:	74 09                	je     804f147 <_fwalk+0x47>
 804f13e:	89 1c 24             	mov    %ebx,(%esp)
 804f141:	ff 55 0c             	call   *0xc(%ebp)
 804f144:	09 45 e4             	or     %eax,-0x1c(%ebp)
 804f147:	83 ef 01             	sub    $0x1,%edi
 804f14a:	83 c3 68             	add    $0x68,%ebx
 804f14d:	83 ff ff             	cmp    $0xffffffff,%edi
 804f150:	75 de                	jne    804f130 <_fwalk+0x30>
 804f152:	8b 36                	mov    (%esi),%esi
 804f154:	85 f6                	test   %esi,%esi
 804f156:	75 c8                	jne    804f120 <_fwalk+0x20>
 804f158:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f15b:	83 c4 1c             	add    $0x1c,%esp
 804f15e:	5b                   	pop    %ebx
 804f15f:	5e                   	pop    %esi
 804f160:	5f                   	pop    %edi
 804f161:	5d                   	pop    %ebp
 804f162:	c3                   	ret    
 804f163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f170 <_fwalk_reent>:
 804f170:	55                   	push   %ebp
 804f171:	89 e5                	mov    %esp,%ebp
 804f173:	57                   	push   %edi
 804f174:	56                   	push   %esi
 804f175:	53                   	push   %ebx
 804f176:	83 ec 1c             	sub    $0x1c,%esp
 804f179:	8b 7d 08             	mov    0x8(%ebp),%edi
 804f17c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804f183:	81 c7 e0 02 00 00    	add    $0x2e0,%edi
 804f189:	74 4c                	je     804f1d7 <_fwalk_reent+0x67>
 804f18b:	90                   	nop
 804f18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f190:	8b 77 04             	mov    0x4(%edi),%esi
 804f193:	8b 5f 08             	mov    0x8(%edi),%ebx
 804f196:	83 ee 01             	sub    $0x1,%esi
 804f199:	78 36                	js     804f1d1 <_fwalk_reent+0x61>
 804f19b:	89 d8                	mov    %ebx,%eax
 804f19d:	89 f3                	mov    %esi,%ebx
 804f19f:	89 c6                	mov    %eax,%esi
 804f1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f1a8:	66 83 7e 0c 01       	cmpw   $0x1,0xc(%esi)
 804f1ad:	76 17                	jbe    804f1c6 <_fwalk_reent+0x56>
 804f1af:	66 83 7e 0e ff       	cmpw   $0xffff,0xe(%esi)
 804f1b4:	74 10                	je     804f1c6 <_fwalk_reent+0x56>
 804f1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 804f1b9:	89 74 24 04          	mov    %esi,0x4(%esp)
 804f1bd:	89 04 24             	mov    %eax,(%esp)
 804f1c0:	ff 55 0c             	call   *0xc(%ebp)
 804f1c3:	09 45 e4             	or     %eax,-0x1c(%ebp)
 804f1c6:	83 eb 01             	sub    $0x1,%ebx
 804f1c9:	83 c6 68             	add    $0x68,%esi
 804f1cc:	83 fb ff             	cmp    $0xffffffff,%ebx
 804f1cf:	75 d7                	jne    804f1a8 <_fwalk_reent+0x38>
 804f1d1:	8b 3f                	mov    (%edi),%edi
 804f1d3:	85 ff                	test   %edi,%edi
 804f1d5:	75 b9                	jne    804f190 <_fwalk_reent+0x20>
 804f1d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f1da:	83 c4 1c             	add    $0x1c,%esp
 804f1dd:	5b                   	pop    %ebx
 804f1de:	5e                   	pop    %esi
 804f1df:	5f                   	pop    %edi
 804f1e0:	5d                   	pop    %ebp
 804f1e1:	c3                   	ret    
 804f1e2:	66 90                	xchg   %ax,%ax
 804f1e4:	66 90                	xchg   %ax,%ax
 804f1e6:	66 90                	xchg   %ax,%ax
 804f1e8:	66 90                	xchg   %ax,%ax
 804f1ea:	66 90                	xchg   %ax,%ax
 804f1ec:	66 90                	xchg   %ax,%ax
 804f1ee:	66 90                	xchg   %ax,%ax

0804f1f0 <__getreent>:
 804f1f0:	55                   	push   %ebp
 804f1f1:	a1 80 7b 05 08       	mov    0x8057b80,%eax
 804f1f6:	89 e5                	mov    %esp,%ebp
 804f1f8:	5d                   	pop    %ebp
 804f1f9:	c3                   	ret    
 804f1fa:	66 90                	xchg   %ax,%ax
 804f1fc:	66 90                	xchg   %ax,%ax
 804f1fe:	66 90                	xchg   %ax,%ax

0804f200 <_setlocale_r>:
 804f200:	55                   	push   %ebp
 804f201:	89 e5                	mov    %esp,%ebp
 804f203:	53                   	push   %ebx
 804f204:	83 ec 14             	sub    $0x14,%esp
 804f207:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804f20a:	85 db                	test   %ebx,%ebx
 804f20c:	74 14                	je     804f222 <_setlocale_r+0x22>
 804f20e:	c7 44 24 04 b6 49 05 	movl   $0x80549b6,0x4(%esp)
 804f215:	08 
 804f216:	89 1c 24             	mov    %ebx,(%esp)
 804f219:	e8 42 1a 00 00       	call   8050c60 <strcmp>
 804f21e:	85 c0                	test   %eax,%eax
 804f220:	75 0e                	jne    804f230 <_setlocale_r+0x30>
 804f222:	83 c4 14             	add    $0x14,%esp
 804f225:	b8 b4 49 05 08       	mov    $0x80549b4,%eax
 804f22a:	5b                   	pop    %ebx
 804f22b:	5d                   	pop    %ebp
 804f22c:	c3                   	ret    
 804f22d:	8d 76 00             	lea    0x0(%esi),%esi
 804f230:	c7 44 24 04 b4 49 05 	movl   $0x80549b4,0x4(%esp)
 804f237:	08 
 804f238:	89 1c 24             	mov    %ebx,(%esp)
 804f23b:	e8 20 1a 00 00       	call   8050c60 <strcmp>
 804f240:	85 c0                	test   %eax,%eax
 804f242:	74 de                	je     804f222 <_setlocale_r+0x22>
 804f244:	89 1c 24             	mov    %ebx,(%esp)
 804f247:	c7 44 24 04 17 43 05 	movl   $0x8054317,0x4(%esp)
 804f24e:	08 
 804f24f:	e8 0c 1a 00 00       	call   8050c60 <strcmp>
 804f254:	89 c2                	mov    %eax,%edx
 804f256:	31 c0                	xor    %eax,%eax
 804f258:	85 d2                	test   %edx,%edx
 804f25a:	ba b4 49 05 08       	mov    $0x80549b4,%edx
 804f25f:	0f 44 c2             	cmove  %edx,%eax
 804f262:	83 c4 14             	add    $0x14,%esp
 804f265:	5b                   	pop    %ebx
 804f266:	5d                   	pop    %ebp
 804f267:	c3                   	ret    
 804f268:	90                   	nop
 804f269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804f270 <__locale_charset>:
 804f270:	55                   	push   %ebp
 804f271:	b8 00 80 05 08       	mov    $0x8058000,%eax
 804f276:	89 e5                	mov    %esp,%ebp
 804f278:	5d                   	pop    %ebp
 804f279:	c3                   	ret    
 804f27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f280 <__locale_mb_cur_max>:
 804f280:	55                   	push   %ebp
 804f281:	a1 58 80 05 08       	mov    0x8058058,%eax
 804f286:	89 e5                	mov    %esp,%ebp
 804f288:	5d                   	pop    %ebp
 804f289:	c3                   	ret    
 804f28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f290 <__locale_msgcharset>:
 804f290:	55                   	push   %ebp
 804f291:	b8 e0 7f 05 08       	mov    $0x8057fe0,%eax
 804f296:	89 e5                	mov    %esp,%ebp
 804f298:	5d                   	pop    %ebp
 804f299:	c3                   	ret    
 804f29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f2a0 <__locale_cjk_lang>:
 804f2a0:	55                   	push   %ebp
 804f2a1:	31 c0                	xor    %eax,%eax
 804f2a3:	89 e5                	mov    %esp,%ebp
 804f2a5:	5d                   	pop    %ebp
 804f2a6:	c3                   	ret    
 804f2a7:	89 f6                	mov    %esi,%esi
 804f2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f2b0 <_localeconv_r>:
 804f2b0:	55                   	push   %ebp
 804f2b1:	b8 20 80 05 08       	mov    $0x8058020,%eax
 804f2b6:	89 e5                	mov    %esp,%ebp
 804f2b8:	5d                   	pop    %ebp
 804f2b9:	c3                   	ret    
 804f2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f2c0 <setlocale>:
 804f2c0:	55                   	push   %ebp
 804f2c1:	89 e5                	mov    %esp,%ebp
 804f2c3:	83 ec 18             	sub    $0x18,%esp
 804f2c6:	e8 25 ff ff ff       	call   804f1f0 <__getreent>
 804f2cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f2ce:	89 54 24 08          	mov    %edx,0x8(%esp)
 804f2d2:	8b 55 08             	mov    0x8(%ebp),%edx
 804f2d5:	89 04 24             	mov    %eax,(%esp)
 804f2d8:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f2dc:	e8 1f ff ff ff       	call   804f200 <_setlocale_r>
 804f2e1:	c9                   	leave  
 804f2e2:	c3                   	ret    
 804f2e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f2f0 <localeconv>:
 804f2f0:	55                   	push   %ebp
 804f2f1:	89 e5                	mov    %esp,%ebp
 804f2f3:	83 ec 08             	sub    $0x8,%esp
 804f2f6:	e8 f5 fe ff ff       	call   804f1f0 <__getreent>
 804f2fb:	b8 20 80 05 08       	mov    $0x8058020,%eax
 804f300:	c9                   	leave  
 804f301:	c3                   	ret    
 804f302:	66 90                	xchg   %ax,%ax
 804f304:	66 90                	xchg   %ax,%ax
 804f306:	66 90                	xchg   %ax,%ax
 804f308:	66 90                	xchg   %ax,%ax
 804f30a:	66 90                	xchg   %ax,%ax
 804f30c:	66 90                	xchg   %ax,%ax
 804f30e:	66 90                	xchg   %ax,%ax

0804f310 <__smakebuf_r>:
 804f310:	55                   	push   %ebp
 804f311:	89 e5                	mov    %esp,%ebp
 804f313:	57                   	push   %edi
 804f314:	56                   	push   %esi
 804f315:	53                   	push   %ebx
 804f316:	83 ec 5c             	sub    $0x5c,%esp
 804f319:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804f31c:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f320:	a8 02                	test   $0x2,%al
 804f322:	0f 85 c0 00 00 00    	jne    804f3e8 <__smakebuf_r+0xd8>
 804f328:	0f bf 53 0e          	movswl 0xe(%ebx),%edx
 804f32c:	66 85 d2             	test   %dx,%dx
 804f32f:	78 4b                	js     804f37c <__smakebuf_r+0x6c>
 804f331:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804f334:	89 44 24 08          	mov    %eax,0x8(%esp)
 804f338:	8b 45 08             	mov    0x8(%ebp),%eax
 804f33b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f33f:	89 04 24             	mov    %eax,(%esp)
 804f342:	e8 39 3f 00 00       	call   8053280 <_fstat_r>
 804f347:	85 c0                	test   %eax,%eax
 804f349:	78 2d                	js     804f378 <__smakebuf_r+0x68>
 804f34b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804f34e:	31 c9                	xor    %ecx,%ecx
 804f350:	25 00 f0 00 00       	and    $0xf000,%eax
 804f355:	3d 00 20 00 00       	cmp    $0x2000,%eax
 804f35a:	0f 94 c1             	sete   %cl
 804f35d:	3d 00 80 00 00       	cmp    $0x8000,%eax
 804f362:	89 cf                	mov    %ecx,%edi
 804f364:	0f 84 96 00 00 00    	je     804f400 <__smakebuf_r+0xf0>
 804f36a:	66 81 4b 0c 00 08    	orw    $0x800,0xc(%ebx)
 804f370:	be 00 04 00 00       	mov    $0x400,%esi
 804f375:	eb 24                	jmp    804f39b <__smakebuf_r+0x8b>
 804f377:	90                   	nop
 804f378:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f37c:	89 c2                	mov    %eax,%edx
 804f37e:	66 81 e2 80 00       	and    $0x80,%dx
 804f383:	66 83 fa 01          	cmp    $0x1,%dx
 804f387:	19 f6                	sbb    %esi,%esi
 804f389:	80 cc 08             	or     $0x8,%ah
 804f38c:	81 e6 c0 03 00 00    	and    $0x3c0,%esi
 804f392:	31 ff                	xor    %edi,%edi
 804f394:	83 c6 40             	add    $0x40,%esi
 804f397:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804f39b:	8b 45 08             	mov    0x8(%ebp),%eax
 804f39e:	89 74 24 04          	mov    %esi,0x4(%esp)
 804f3a2:	89 04 24             	mov    %eax,(%esp)
 804f3a5:	e8 a6 00 00 00       	call   804f450 <_malloc_r>
 804f3aa:	85 c0                	test   %eax,%eax
 804f3ac:	74 2a                	je     804f3d8 <__smakebuf_r+0xc8>
 804f3ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f3b1:	c7 41 3c b0 e9 04 08 	movl   $0x804e9b0,0x3c(%ecx)
 804f3b8:	66 81 4b 0c 80 00    	orw    $0x80,0xc(%ebx)
 804f3be:	85 ff                	test   %edi,%edi
 804f3c0:	89 03                	mov    %eax,(%ebx)
 804f3c2:	89 43 10             	mov    %eax,0x10(%ebx)
 804f3c5:	89 73 14             	mov    %esi,0x14(%ebx)
 804f3c8:	75 5e                	jne    804f428 <__smakebuf_r+0x118>
 804f3ca:	83 c4 5c             	add    $0x5c,%esp
 804f3cd:	5b                   	pop    %ebx
 804f3ce:	5e                   	pop    %esi
 804f3cf:	5f                   	pop    %edi
 804f3d0:	5d                   	pop    %ebp
 804f3d1:	c3                   	ret    
 804f3d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f3d8:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f3dc:	f6 c4 02             	test   $0x2,%ah
 804f3df:	75 e9                	jne    804f3ca <__smakebuf_r+0xba>
 804f3e1:	83 c8 02             	or     $0x2,%eax
 804f3e4:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804f3e8:	8d 43 43             	lea    0x43(%ebx),%eax
 804f3eb:	89 03                	mov    %eax,(%ebx)
 804f3ed:	89 43 10             	mov    %eax,0x10(%ebx)
 804f3f0:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
 804f3f7:	83 c4 5c             	add    $0x5c,%esp
 804f3fa:	5b                   	pop    %ebx
 804f3fb:	5e                   	pop    %esi
 804f3fc:	5f                   	pop    %edi
 804f3fd:	5d                   	pop    %ebp
 804f3fe:	c3                   	ret    
 804f3ff:	90                   	nop
 804f400:	81 7b 28 f0 0b 05 08 	cmpl   $0x8050bf0,0x28(%ebx)
 804f407:	0f 85 5d ff ff ff    	jne    804f36a <__smakebuf_r+0x5a>
 804f40d:	66 81 4b 0c 00 04    	orw    $0x400,0xc(%ebx)
 804f413:	be 00 04 00 00       	mov    $0x400,%esi
 804f418:	c7 43 4c 00 04 00 00 	movl   $0x400,0x4c(%ebx)
 804f41f:	e9 77 ff ff ff       	jmp    804f39b <__smakebuf_r+0x8b>
 804f424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f428:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 804f42c:	89 0c 24             	mov    %ecx,(%esp)
 804f42f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f433:	e8 68 43 00 00       	call   80537a0 <_isatty_r>
 804f438:	85 c0                	test   %eax,%eax
 804f43a:	74 8e                	je     804f3ca <__smakebuf_r+0xba>
 804f43c:	66 83 4b 0c 01       	orw    $0x1,0xc(%ebx)
 804f441:	eb 87                	jmp    804f3ca <__smakebuf_r+0xba>
 804f443:	66 90                	xchg   %ax,%ax
 804f445:	66 90                	xchg   %ax,%ax
 804f447:	66 90                	xchg   %ax,%ax
 804f449:	66 90                	xchg   %ax,%ax
 804f44b:	66 90                	xchg   %ax,%ax
 804f44d:	66 90                	xchg   %ax,%ax
 804f44f:	90                   	nop

0804f450 <_malloc_r>:
 804f450:	55                   	push   %ebp
 804f451:	89 e5                	mov    %esp,%ebp
 804f453:	57                   	push   %edi
 804f454:	56                   	push   %esi
 804f455:	53                   	push   %ebx
 804f456:	83 ec 2c             	sub    $0x2c,%esp
 804f459:	8b 45 0c             	mov    0xc(%ebp),%eax
 804f45c:	8d 50 0b             	lea    0xb(%eax),%edx
 804f45f:	83 fa 16             	cmp    $0x16,%edx
 804f462:	76 6c                	jbe    804f4d0 <_malloc_r+0x80>
 804f464:	89 d7                	mov    %edx,%edi
 804f466:	83 e7 f8             	and    $0xfffffff8,%edi
 804f469:	89 fe                	mov    %edi,%esi
 804f46b:	c1 ee 1f             	shr    $0x1f,%esi
 804f46e:	39 c7                	cmp    %eax,%edi
 804f470:	8b 45 08             	mov    0x8(%ebp),%eax
 804f473:	89 f2                	mov    %esi,%edx
 804f475:	72 67                	jb     804f4de <_malloc_r+0x8e>
 804f477:	84 d2                	test   %dl,%dl
 804f479:	75 63                	jne    804f4de <_malloc_r+0x8e>
 804f47b:	89 04 24             	mov    %eax,(%esp)
 804f47e:	e8 ed 07 00 00       	call   804fc70 <__malloc_lock>
 804f483:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
 804f489:	77 65                	ja     804f4f0 <_malloc_r+0xa0>
 804f48b:	89 fa                	mov    %edi,%edx
 804f48d:	c1 ea 03             	shr    $0x3,%edx
 804f490:	8d 04 d5 80 80 05 08 	lea    0x8058080(,%edx,8),%eax
 804f497:	8b 58 0c             	mov    0xc(%eax),%ebx
 804f49a:	39 c3                	cmp    %eax,%ebx
 804f49c:	0f 84 3e 05 00 00    	je     804f9e0 <_malloc_r+0x590>
 804f4a2:	8b 43 04             	mov    0x4(%ebx),%eax
 804f4a5:	83 e0 fc             	and    $0xfffffffc,%eax
 804f4a8:	8b 53 0c             	mov    0xc(%ebx),%edx
 804f4ab:	8b 4b 08             	mov    0x8(%ebx),%ecx
 804f4ae:	89 51 0c             	mov    %edx,0xc(%ecx)
 804f4b1:	89 4a 08             	mov    %ecx,0x8(%edx)
 804f4b4:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
 804f4b9:	8b 45 08             	mov    0x8(%ebp),%eax
 804f4bc:	89 04 24             	mov    %eax,(%esp)
 804f4bf:	e8 bc 07 00 00       	call   804fc80 <__malloc_unlock>
 804f4c4:	8d 43 08             	lea    0x8(%ebx),%eax
 804f4c7:	83 c4 2c             	add    $0x2c,%esp
 804f4ca:	5b                   	pop    %ebx
 804f4cb:	5e                   	pop    %esi
 804f4cc:	5f                   	pop    %edi
 804f4cd:	5d                   	pop    %ebp
 804f4ce:	c3                   	ret    
 804f4cf:	90                   	nop
 804f4d0:	bf 10 00 00 00       	mov    $0x10,%edi
 804f4d5:	31 d2                	xor    %edx,%edx
 804f4d7:	39 c7                	cmp    %eax,%edi
 804f4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 804f4dc:	73 99                	jae    804f477 <_malloc_r+0x27>
 804f4de:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804f4e4:	83 c4 2c             	add    $0x2c,%esp
 804f4e7:	31 c0                	xor    %eax,%eax
 804f4e9:	5b                   	pop    %ebx
 804f4ea:	5e                   	pop    %esi
 804f4eb:	5f                   	pop    %edi
 804f4ec:	5d                   	pop    %ebp
 804f4ed:	c3                   	ret    
 804f4ee:	66 90                	xchg   %ax,%ax
 804f4f0:	89 fe                	mov    %edi,%esi
 804f4f2:	c1 ee 09             	shr    $0x9,%esi
 804f4f5:	85 f6                	test   %esi,%esi
 804f4f7:	0f 84 ab 01 00 00    	je     804f6a8 <_malloc_r+0x258>
 804f4fd:	83 fe 04             	cmp    $0x4,%esi
 804f500:	0f 87 8a 03 00 00    	ja     804f890 <_malloc_r+0x440>
 804f506:	89 fe                	mov    %edi,%esi
 804f508:	c1 ee 06             	shr    $0x6,%esi
 804f50b:	83 c6 38             	add    $0x38,%esi
 804f50e:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804f511:	8d 0c 85 80 80 05 08 	lea    0x8058080(,%eax,4),%ecx
 804f518:	8b 59 0c             	mov    0xc(%ecx),%ebx
 804f51b:	39 d9                	cmp    %ebx,%ecx
 804f51d:	75 18                	jne    804f537 <_malloc_r+0xe7>
 804f51f:	eb 28                	jmp    804f549 <_malloc_r+0xf9>
 804f521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f528:	85 d2                	test   %edx,%edx
 804f52a:	0f 89 78 ff ff ff    	jns    804f4a8 <_malloc_r+0x58>
 804f530:	8b 5b 0c             	mov    0xc(%ebx),%ebx
 804f533:	39 d9                	cmp    %ebx,%ecx
 804f535:	74 12                	je     804f549 <_malloc_r+0xf9>
 804f537:	8b 43 04             	mov    0x4(%ebx),%eax
 804f53a:	83 e0 fc             	and    $0xfffffffc,%eax
 804f53d:	89 c2                	mov    %eax,%edx
 804f53f:	29 fa                	sub    %edi,%edx
 804f541:	83 fa 0f             	cmp    $0xf,%edx
 804f544:	7e e2                	jle    804f528 <_malloc_r+0xd8>
 804f546:	83 ee 01             	sub    $0x1,%esi
 804f549:	8d 46 01             	lea    0x1(%esi),%eax
 804f54c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f54f:	8b 1d 90 80 05 08    	mov    0x8058090,%ebx
 804f555:	a1 84 80 05 08       	mov    0x8058084,%eax
 804f55a:	81 fb 88 80 05 08    	cmp    $0x8058088,%ebx
 804f560:	74 6b                	je     804f5cd <_malloc_r+0x17d>
 804f562:	8b 73 04             	mov    0x4(%ebx),%esi
 804f565:	83 e6 fc             	and    $0xfffffffc,%esi
 804f568:	89 f0                	mov    %esi,%eax
 804f56a:	29 f8                	sub    %edi,%eax
 804f56c:	83 f8 0f             	cmp    $0xf,%eax
 804f56f:	0f 8f a3 03 00 00    	jg     804f918 <_malloc_r+0x4c8>
 804f575:	85 c0                	test   %eax,%eax
 804f577:	c7 05 94 80 05 08 88 	movl   $0x8058088,0x8058094
 804f57e:	80 05 08 
 804f581:	c7 05 90 80 05 08 88 	movl   $0x8058088,0x8058090
 804f588:	80 05 08 
 804f58b:	0f 89 27 01 00 00    	jns    804f6b8 <_malloc_r+0x268>
 804f591:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
 804f597:	0f 87 1b 03 00 00    	ja     804f8b8 <_malloc_r+0x468>
 804f59d:	c1 ee 03             	shr    $0x3,%esi
 804f5a0:	b8 01 00 00 00       	mov    $0x1,%eax
 804f5a5:	89 f1                	mov    %esi,%ecx
 804f5a7:	8d 14 f5 80 80 05 08 	lea    0x8058080(,%esi,8),%edx
 804f5ae:	c1 f9 02             	sar    $0x2,%ecx
 804f5b1:	d3 e0                	shl    %cl,%eax
 804f5b3:	8b 4a 08             	mov    0x8(%edx),%ecx
 804f5b6:	0b 05 84 80 05 08    	or     0x8058084,%eax
 804f5bc:	89 53 0c             	mov    %edx,0xc(%ebx)
 804f5bf:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804f5c2:	a3 84 80 05 08       	mov    %eax,0x8058084
 804f5c7:	89 5a 08             	mov    %ebx,0x8(%edx)
 804f5ca:	89 59 0c             	mov    %ebx,0xc(%ecx)
 804f5cd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804f5d0:	be 01 00 00 00       	mov    $0x1,%esi
 804f5d5:	c1 f9 02             	sar    $0x2,%ecx
 804f5d8:	d3 e6                	shl    %cl,%esi
 804f5da:	39 c6                	cmp    %eax,%esi
 804f5dc:	0f 87 f6 00 00 00    	ja     804f6d8 <_malloc_r+0x288>
 804f5e2:	85 f0                	test   %esi,%eax
 804f5e4:	0f 85 76 03 00 00    	jne    804f960 <_malloc_r+0x510>
 804f5ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804f5ed:	01 f6                	add    %esi,%esi
 804f5ef:	83 e2 fc             	and    $0xfffffffc,%edx
 804f5f2:	85 f0                	test   %esi,%eax
 804f5f4:	8d 4a 04             	lea    0x4(%edx),%ecx
 804f5f7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f5fa:	0f 85 60 03 00 00    	jne    804f960 <_malloc_r+0x510>
 804f600:	89 ca                	mov    %ecx,%edx
 804f602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f608:	01 f6                	add    %esi,%esi
 804f60a:	83 c2 04             	add    $0x4,%edx
 804f60d:	85 f0                	test   %esi,%eax
 804f60f:	74 f7                	je     804f608 <_malloc_r+0x1b8>
 804f611:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 804f614:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804f617:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f61a:	8d 34 c5 80 80 05 08 	lea    0x8058080(,%eax,8),%esi
 804f621:	89 f1                	mov    %esi,%ecx
 804f623:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804f626:	8b 59 0c             	mov    0xc(%ecx),%ebx
 804f629:	39 d9                	cmp    %ebx,%ecx
 804f62b:	75 1e                	jne    804f64b <_malloc_r+0x1fb>
 804f62d:	e9 36 03 00 00       	jmp    804f968 <_malloc_r+0x518>
 804f632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f638:	85 d2                	test   %edx,%edx
 804f63a:	0f 89 c0 03 00 00    	jns    804fa00 <_malloc_r+0x5b0>
 804f640:	8b 5b 0c             	mov    0xc(%ebx),%ebx
 804f643:	39 d9                	cmp    %ebx,%ecx
 804f645:	0f 84 1d 03 00 00    	je     804f968 <_malloc_r+0x518>
 804f64b:	8b 43 04             	mov    0x4(%ebx),%eax
 804f64e:	83 e0 fc             	and    $0xfffffffc,%eax
 804f651:	89 c2                	mov    %eax,%edx
 804f653:	29 fa                	sub    %edi,%edx
 804f655:	83 fa 0f             	cmp    $0xf,%edx
 804f658:	7e de                	jle    804f638 <_malloc_r+0x1e8>
 804f65a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
 804f65d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
 804f660:	83 cf 01             	or     $0x1,%edi
 804f663:	8b 73 08             	mov    0x8(%ebx),%esi
 804f666:	89 7b 04             	mov    %edi,0x4(%ebx)
 804f669:	89 4e 0c             	mov    %ecx,0xc(%esi)
 804f66c:	89 71 08             	mov    %esi,0x8(%ecx)
 804f66f:	89 d1                	mov    %edx,%ecx
 804f671:	83 c9 01             	or     $0x1,%ecx
 804f674:	a3 94 80 05 08       	mov    %eax,0x8058094
 804f679:	a3 90 80 05 08       	mov    %eax,0x8058090
 804f67e:	c7 40 0c 88 80 05 08 	movl   $0x8058088,0xc(%eax)
 804f685:	c7 40 08 88 80 05 08 	movl   $0x8058088,0x8(%eax)
 804f68c:	89 48 04             	mov    %ecx,0x4(%eax)
 804f68f:	89 14 10             	mov    %edx,(%eax,%edx,1)
 804f692:	8b 45 08             	mov    0x8(%ebp),%eax
 804f695:	89 04 24             	mov    %eax,(%esp)
 804f698:	e8 e3 05 00 00       	call   804fc80 <__malloc_unlock>
 804f69d:	8d 43 08             	lea    0x8(%ebx),%eax
 804f6a0:	e9 22 fe ff ff       	jmp    804f4c7 <_malloc_r+0x77>
 804f6a5:	8d 76 00             	lea    0x0(%esi),%esi
 804f6a8:	b8 7e 00 00 00       	mov    $0x7e,%eax
 804f6ad:	be 3f 00 00 00       	mov    $0x3f,%esi
 804f6b2:	e9 5a fe ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804f6b7:	90                   	nop
 804f6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 804f6bb:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
 804f6c0:	89 04 24             	mov    %eax,(%esp)
 804f6c3:	e8 b8 05 00 00       	call   804fc80 <__malloc_unlock>
 804f6c8:	83 c4 2c             	add    $0x2c,%esp
 804f6cb:	8d 43 08             	lea    0x8(%ebx),%eax
 804f6ce:	5b                   	pop    %ebx
 804f6cf:	5e                   	pop    %esi
 804f6d0:	5f                   	pop    %edi
 804f6d1:	5d                   	pop    %ebp
 804f6d2:	c3                   	ret    
 804f6d3:	90                   	nop
 804f6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f6d8:	8b 1d 88 80 05 08    	mov    0x8058088,%ebx
 804f6de:	8b 73 04             	mov    0x4(%ebx),%esi
 804f6e1:	83 e6 fc             	and    $0xfffffffc,%esi
 804f6e4:	39 f7                	cmp    %esi,%edi
 804f6e6:	77 0d                	ja     804f6f5 <_malloc_r+0x2a5>
 804f6e8:	89 f0                	mov    %esi,%eax
 804f6ea:	29 f8                	sub    %edi,%eax
 804f6ec:	83 f8 0f             	cmp    $0xf,%eax
 804f6ef:	0f 8f 6b 01 00 00    	jg     804f860 <_malloc_r+0x410>
 804f6f5:	8b 0d 90 dd 06 08    	mov    0x806dd90,%ecx
 804f6fb:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 804f6fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f701:	01 f9                	add    %edi,%ecx
 804f703:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
 804f709:	83 c1 10             	add    $0x10,%ecx
 804f70c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 804f711:	83 3d 60 80 05 08 ff 	cmpl   $0xffffffff,0x8058060
 804f718:	0f 44 c1             	cmove  %ecx,%eax
 804f71b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804f71e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f722:	8b 45 08             	mov    0x8(%ebp),%eax
 804f725:	89 04 24             	mov    %eax,(%esp)
 804f728:	e8 43 13 00 00       	call   8050a70 <_sbrk_r>
 804f72d:	83 f8 ff             	cmp    $0xffffffff,%eax
 804f730:	89 c1                	mov    %eax,%ecx
 804f732:	0f 84 17 03 00 00    	je     804fa4f <_malloc_r+0x5ff>
 804f738:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 804f73b:	0f 87 02 03 00 00    	ja     804fa43 <_malloc_r+0x5f3>
 804f741:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804f744:	03 15 60 dd 06 08    	add    0x806dd60,%edx
 804f74a:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
 804f74d:	89 15 60 dd 06 08    	mov    %edx,0x806dd60
 804f753:	0f 84 a9 03 00 00    	je     804fb02 <_malloc_r+0x6b2>
 804f759:	83 3d 60 80 05 08 ff 	cmpl   $0xffffffff,0x8058060
 804f760:	0f 84 ca 03 00 00    	je     804fb30 <_malloc_r+0x6e0>
 804f766:	89 c8                	mov    %ecx,%eax
 804f768:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 804f76b:	01 d0                	add    %edx,%eax
 804f76d:	a3 60 dd 06 08       	mov    %eax,0x806dd60
 804f772:	89 c8                	mov    %ecx,%eax
 804f774:	ba 00 10 00 00       	mov    $0x1000,%edx
 804f779:	83 e0 07             	and    $0x7,%eax
 804f77c:	74 0c                	je     804f78a <_malloc_r+0x33a>
 804f77e:	29 c1                	sub    %eax,%ecx
 804f780:	ba 08 10 00 00       	mov    $0x1008,%edx
 804f785:	8d 49 08             	lea    0x8(%ecx),%ecx
 804f788:	29 c2                	sub    %eax,%edx
 804f78a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804f78d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f790:	01 c8                	add    %ecx,%eax
 804f792:	25 ff 0f 00 00       	and    $0xfff,%eax
 804f797:	29 c2                	sub    %eax,%edx
 804f799:	8b 45 08             	mov    0x8(%ebp),%eax
 804f79c:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f7a0:	89 55 e0             	mov    %edx,-0x20(%ebp)
 804f7a3:	89 04 24             	mov    %eax,(%esp)
 804f7a6:	e8 c5 12 00 00       	call   8050a70 <_sbrk_r>
 804f7ab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804f7ae:	83 f8 ff             	cmp    $0xffffffff,%eax
 804f7b1:	0f 84 6d 03 00 00    	je     804fb24 <_malloc_r+0x6d4>
 804f7b7:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804f7ba:	29 c8                	sub    %ecx,%eax
 804f7bc:	01 d0                	add    %edx,%eax
 804f7be:	83 c8 01             	or     $0x1,%eax
 804f7c1:	03 15 60 dd 06 08    	add    0x806dd60,%edx
 804f7c7:	81 fb 80 80 05 08    	cmp    $0x8058080,%ebx
 804f7cd:	89 0d 88 80 05 08    	mov    %ecx,0x8058088
 804f7d3:	89 41 04             	mov    %eax,0x4(%ecx)
 804f7d6:	89 15 60 dd 06 08    	mov    %edx,0x806dd60
 804f7dc:	0f 84 f2 02 00 00    	je     804fad4 <_malloc_r+0x684>
 804f7e2:	83 fe 0f             	cmp    $0xf,%esi
 804f7e5:	0f 86 8d 02 00 00    	jbe    804fa78 <_malloc_r+0x628>
 804f7eb:	8b 43 04             	mov    0x4(%ebx),%eax
 804f7ee:	83 ee 0c             	sub    $0xc,%esi
 804f7f1:	83 e6 f8             	and    $0xfffffff8,%esi
 804f7f4:	83 e0 01             	and    $0x1,%eax
 804f7f7:	09 f0                	or     %esi,%eax
 804f7f9:	83 fe 0f             	cmp    $0xf,%esi
 804f7fc:	89 43 04             	mov    %eax,0x4(%ebx)
 804f7ff:	a1 88 80 05 08       	mov    0x8058088,%eax
 804f804:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
 804f80b:	00 
 804f80c:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
 804f813:	00 
 804f814:	0f 87 a2 02 00 00    	ja     804fabc <_malloc_r+0x66c>
 804f81a:	3b 15 8c dd 06 08    	cmp    0x806dd8c,%edx
 804f820:	76 06                	jbe    804f828 <_malloc_r+0x3d8>
 804f822:	89 15 8c dd 06 08    	mov    %edx,0x806dd8c
 804f828:	3b 15 88 dd 06 08    	cmp    0x806dd88,%edx
 804f82e:	76 06                	jbe    804f836 <_malloc_r+0x3e6>
 804f830:	89 15 88 dd 06 08    	mov    %edx,0x806dd88
 804f836:	8b 50 04             	mov    0x4(%eax),%edx
 804f839:	89 c3                	mov    %eax,%ebx
 804f83b:	83 e2 fc             	and    $0xfffffffc,%edx
 804f83e:	89 d0                	mov    %edx,%eax
 804f840:	29 f8                	sub    %edi,%eax
 804f842:	39 d7                	cmp    %edx,%edi
 804f844:	77 05                	ja     804f84b <_malloc_r+0x3fb>
 804f846:	83 f8 0f             	cmp    $0xf,%eax
 804f849:	7f 15                	jg     804f860 <_malloc_r+0x410>
 804f84b:	8b 45 08             	mov    0x8(%ebp),%eax
 804f84e:	89 04 24             	mov    %eax,(%esp)
 804f851:	e8 2a 04 00 00       	call   804fc80 <__malloc_unlock>
 804f856:	31 c0                	xor    %eax,%eax
 804f858:	e9 6a fc ff ff       	jmp    804f4c7 <_malloc_r+0x77>
 804f85d:	8d 76 00             	lea    0x0(%esi),%esi
 804f860:	89 fa                	mov    %edi,%edx
 804f862:	83 c8 01             	or     $0x1,%eax
 804f865:	83 ca 01             	or     $0x1,%edx
 804f868:	89 53 04             	mov    %edx,0x4(%ebx)
 804f86b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
 804f86e:	89 15 88 80 05 08    	mov    %edx,0x8058088
 804f874:	89 42 04             	mov    %eax,0x4(%edx)
 804f877:	8b 45 08             	mov    0x8(%ebp),%eax
 804f87a:	89 04 24             	mov    %eax,(%esp)
 804f87d:	e8 fe 03 00 00       	call   804fc80 <__malloc_unlock>
 804f882:	83 c4 2c             	add    $0x2c,%esp
 804f885:	8d 43 08             	lea    0x8(%ebx),%eax
 804f888:	5b                   	pop    %ebx
 804f889:	5e                   	pop    %esi
 804f88a:	5f                   	pop    %edi
 804f88b:	5d                   	pop    %ebp
 804f88c:	c3                   	ret    
 804f88d:	8d 76 00             	lea    0x0(%esi),%esi
 804f890:	83 fe 14             	cmp    $0x14,%esi
 804f893:	0f 86 8f 01 00 00    	jbe    804fa28 <_malloc_r+0x5d8>
 804f899:	83 fe 54             	cmp    $0x54,%esi
 804f89c:	0f 87 be 01 00 00    	ja     804fa60 <_malloc_r+0x610>
 804f8a2:	89 fe                	mov    %edi,%esi
 804f8a4:	c1 ee 0c             	shr    $0xc,%esi
 804f8a7:	83 c6 6e             	add    $0x6e,%esi
 804f8aa:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804f8ad:	e9 5f fc ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804f8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f8b8:	89 f1                	mov    %esi,%ecx
 804f8ba:	c1 e9 09             	shr    $0x9,%ecx
 804f8bd:	83 f9 04             	cmp    $0x4,%ecx
 804f8c0:	0f 86 6d 01 00 00    	jbe    804fa33 <_malloc_r+0x5e3>
 804f8c6:	83 f9 14             	cmp    $0x14,%ecx
 804f8c9:	0f 87 0f 02 00 00    	ja     804fade <_malloc_r+0x68e>
 804f8cf:	83 c1 5b             	add    $0x5b,%ecx
 804f8d2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804f8d5:	8d 04 85 80 80 05 08 	lea    0x8058080(,%eax,4),%eax
 804f8dc:	8b 50 08             	mov    0x8(%eax),%edx
 804f8df:	39 c2                	cmp    %eax,%edx
 804f8e1:	0f 84 a1 01 00 00    	je     804fa88 <_malloc_r+0x638>
 804f8e7:	90                   	nop
 804f8e8:	8b 4a 04             	mov    0x4(%edx),%ecx
 804f8eb:	83 e1 fc             	and    $0xfffffffc,%ecx
 804f8ee:	39 ce                	cmp    %ecx,%esi
 804f8f0:	73 07                	jae    804f8f9 <_malloc_r+0x4a9>
 804f8f2:	8b 52 08             	mov    0x8(%edx),%edx
 804f8f5:	39 d0                	cmp    %edx,%eax
 804f8f7:	75 ef                	jne    804f8e8 <_malloc_r+0x498>
 804f8f9:	8b 4a 0c             	mov    0xc(%edx),%ecx
 804f8fc:	a1 84 80 05 08       	mov    0x8058084,%eax
 804f901:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804f904:	89 53 08             	mov    %edx,0x8(%ebx)
 804f907:	89 59 08             	mov    %ebx,0x8(%ecx)
 804f90a:	89 5a 0c             	mov    %ebx,0xc(%edx)
 804f90d:	e9 bb fc ff ff       	jmp    804f5cd <_malloc_r+0x17d>
 804f912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f918:	89 c1                	mov    %eax,%ecx
 804f91a:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
 804f91d:	83 c9 01             	or     $0x1,%ecx
 804f920:	83 cf 01             	or     $0x1,%edi
 804f923:	89 7b 04             	mov    %edi,0x4(%ebx)
 804f926:	89 15 94 80 05 08    	mov    %edx,0x8058094
 804f92c:	89 15 90 80 05 08    	mov    %edx,0x8058090
 804f932:	c7 42 0c 88 80 05 08 	movl   $0x8058088,0xc(%edx)
 804f939:	c7 42 08 88 80 05 08 	movl   $0x8058088,0x8(%edx)
 804f940:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f943:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804f946:	8b 45 08             	mov    0x8(%ebp),%eax
 804f949:	89 04 24             	mov    %eax,(%esp)
 804f94c:	e8 2f 03 00 00       	call   804fc80 <__malloc_unlock>
 804f951:	8d 43 08             	lea    0x8(%ebx),%eax
 804f954:	e9 6e fb ff ff       	jmp    804f4c7 <_malloc_r+0x77>
 804f959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f960:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804f963:	e9 af fc ff ff       	jmp    804f617 <_malloc_r+0x1c7>
 804f968:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
 804f96c:	83 c1 08             	add    $0x8,%ecx
 804f96f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
 804f973:	0f 85 ad fc ff ff    	jne    804f626 <_malloc_r+0x1d6>
 804f979:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f97c:	eb 12                	jmp    804f990 <_malloc_r+0x540>
 804f97e:	66 90                	xchg   %ax,%ax
 804f980:	8d 56 f8             	lea    -0x8(%esi),%edx
 804f983:	8b 36                	mov    (%esi),%esi
 804f985:	83 e8 01             	sub    $0x1,%eax
 804f988:	39 d6                	cmp    %edx,%esi
 804f98a:	0f 85 ea 01 00 00    	jne    804fb7a <_malloc_r+0x72a>
 804f990:	a8 03                	test   $0x3,%al
 804f992:	75 ec                	jne    804f980 <_malloc_r+0x530>
 804f994:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804f997:	f7 d0                	not    %eax
 804f999:	23 05 84 80 05 08    	and    0x8058084,%eax
 804f99f:	a3 84 80 05 08       	mov    %eax,0x8058084
 804f9a4:	d1 65 dc             	shll   -0x24(%ebp)
 804f9a7:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804f9aa:	39 c2                	cmp    %eax,%edx
 804f9ac:	0f 87 26 fd ff ff    	ja     804f6d8 <_malloc_r+0x288>
 804f9b2:	85 d2                	test   %edx,%edx
 804f9b4:	0f 84 1e fd ff ff    	je     804f6d8 <_malloc_r+0x288>
 804f9ba:	85 c2                	test   %eax,%edx
 804f9bc:	0f 85 c2 01 00 00    	jne    804fb84 <_malloc_r+0x734>
 804f9c2:	8b 75 e0             	mov    -0x20(%ebp),%esi
 804f9c5:	89 f1                	mov    %esi,%ecx
 804f9c7:	01 d2                	add    %edx,%edx
 804f9c9:	83 c1 04             	add    $0x4,%ecx
 804f9cc:	85 d0                	test   %edx,%eax
 804f9ce:	74 f7                	je     804f9c7 <_malloc_r+0x577>
 804f9d0:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f9d3:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804f9d6:	e9 3c fc ff ff       	jmp    804f617 <_malloc_r+0x1c7>
 804f9db:	90                   	nop
 804f9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f9e0:	8d 43 08             	lea    0x8(%ebx),%eax
 804f9e3:	8b 5b 14             	mov    0x14(%ebx),%ebx
 804f9e6:	39 d8                	cmp    %ebx,%eax
 804f9e8:	0f 85 b4 fa ff ff    	jne    804f4a2 <_malloc_r+0x52>
 804f9ee:	8d 42 02             	lea    0x2(%edx),%eax
 804f9f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f9f4:	e9 56 fb ff ff       	jmp    804f54f <_malloc_r+0xff>
 804f9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804fa00:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
 804fa05:	8b 53 08             	mov    0x8(%ebx),%edx
 804fa08:	8b 43 0c             	mov    0xc(%ebx),%eax
 804fa0b:	89 42 0c             	mov    %eax,0xc(%edx)
 804fa0e:	89 50 08             	mov    %edx,0x8(%eax)
 804fa11:	8b 45 08             	mov    0x8(%ebp),%eax
 804fa14:	89 04 24             	mov    %eax,(%esp)
 804fa17:	e8 64 02 00 00       	call   804fc80 <__malloc_unlock>
 804fa1c:	8d 43 08             	lea    0x8(%ebx),%eax
 804fa1f:	e9 a3 fa ff ff       	jmp    804f4c7 <_malloc_r+0x77>
 804fa24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fa28:	83 c6 5b             	add    $0x5b,%esi
 804fa2b:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804fa2e:	e9 de fa ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804fa33:	89 f1                	mov    %esi,%ecx
 804fa35:	c1 e9 06             	shr    $0x6,%ecx
 804fa38:	83 c1 38             	add    $0x38,%ecx
 804fa3b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fa3e:	e9 92 fe ff ff       	jmp    804f8d5 <_malloc_r+0x485>
 804fa43:	81 fb 80 80 05 08    	cmp    $0x8058080,%ebx
 804fa49:	0f 84 f2 fc ff ff    	je     804f741 <_malloc_r+0x2f1>
 804fa4f:	8b 1d 88 80 05 08    	mov    0x8058088,%ebx
 804fa55:	8b 53 04             	mov    0x4(%ebx),%edx
 804fa58:	83 e2 fc             	and    $0xfffffffc,%edx
 804fa5b:	e9 de fd ff ff       	jmp    804f83e <_malloc_r+0x3ee>
 804fa60:	81 fe 54 01 00 00    	cmp    $0x154,%esi
 804fa66:	77 3c                	ja     804faa4 <_malloc_r+0x654>
 804fa68:	89 fe                	mov    %edi,%esi
 804fa6a:	c1 ee 0f             	shr    $0xf,%esi
 804fa6d:	83 c6 77             	add    $0x77,%esi
 804fa70:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804fa73:	e9 99 fa ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804fa78:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
 804fa7f:	89 cb                	mov    %ecx,%ebx
 804fa81:	31 d2                	xor    %edx,%edx
 804fa83:	e9 b6 fd ff ff       	jmp    804f83e <_malloc_r+0x3ee>
 804fa88:	c1 f9 02             	sar    $0x2,%ecx
 804fa8b:	b8 01 00 00 00       	mov    $0x1,%eax
 804fa90:	d3 e0                	shl    %cl,%eax
 804fa92:	89 d1                	mov    %edx,%ecx
 804fa94:	0b 05 84 80 05 08    	or     0x8058084,%eax
 804fa9a:	a3 84 80 05 08       	mov    %eax,0x8058084
 804fa9f:	e9 5d fe ff ff       	jmp    804f901 <_malloc_r+0x4b1>
 804faa4:	81 fe 54 05 00 00    	cmp    $0x554,%esi
 804faaa:	77 47                	ja     804faf3 <_malloc_r+0x6a3>
 804faac:	89 fe                	mov    %edi,%esi
 804faae:	c1 ee 12             	shr    $0x12,%esi
 804fab1:	83 c6 7c             	add    $0x7c,%esi
 804fab4:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804fab7:	e9 55 fa ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804fabc:	8b 45 08             	mov    0x8(%ebp),%eax
 804fabf:	83 c3 08             	add    $0x8,%ebx
 804fac2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804fac6:	89 04 24             	mov    %eax,(%esp)
 804fac9:	e8 d2 f3 ff ff       	call   804eea0 <_free_r>
 804face:	8b 15 60 dd 06 08    	mov    0x806dd60,%edx
 804fad4:	a1 88 80 05 08       	mov    0x8058088,%eax
 804fad9:	e9 3c fd ff ff       	jmp    804f81a <_malloc_r+0x3ca>
 804fade:	83 f9 54             	cmp    $0x54,%ecx
 804fae1:	77 58                	ja     804fb3b <_malloc_r+0x6eb>
 804fae3:	89 f1                	mov    %esi,%ecx
 804fae5:	c1 e9 0c             	shr    $0xc,%ecx
 804fae8:	83 c1 6e             	add    $0x6e,%ecx
 804faeb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804faee:	e9 e2 fd ff ff       	jmp    804f8d5 <_malloc_r+0x485>
 804faf3:	b8 fc 00 00 00       	mov    $0xfc,%eax
 804faf8:	be 7e 00 00 00       	mov    $0x7e,%esi
 804fafd:	e9 0f fa ff ff       	jmp    804f511 <_malloc_r+0xc1>
 804fb02:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
 804fb09:	0f 85 4a fc ff ff    	jne    804f759 <_malloc_r+0x309>
 804fb0f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 804fb12:	a1 88 80 05 08       	mov    0x8058088,%eax
 804fb17:	01 f1                	add    %esi,%ecx
 804fb19:	83 c9 01             	or     $0x1,%ecx
 804fb1c:	89 48 04             	mov    %ecx,0x4(%eax)
 804fb1f:	e9 f6 fc ff ff       	jmp    804f81a <_malloc_r+0x3ca>
 804fb24:	b8 01 00 00 00       	mov    $0x1,%eax
 804fb29:	31 d2                	xor    %edx,%edx
 804fb2b:	e9 91 fc ff ff       	jmp    804f7c1 <_malloc_r+0x371>
 804fb30:	89 0d 60 80 05 08    	mov    %ecx,0x8058060
 804fb36:	e9 37 fc ff ff       	jmp    804f772 <_malloc_r+0x322>
 804fb3b:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
 804fb41:	77 10                	ja     804fb53 <_malloc_r+0x703>
 804fb43:	89 f1                	mov    %esi,%ecx
 804fb45:	c1 e9 0f             	shr    $0xf,%ecx
 804fb48:	83 c1 77             	add    $0x77,%ecx
 804fb4b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fb4e:	e9 82 fd ff ff       	jmp    804f8d5 <_malloc_r+0x485>
 804fb53:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
 804fb59:	77 10                	ja     804fb6b <_malloc_r+0x71b>
 804fb5b:	89 f1                	mov    %esi,%ecx
 804fb5d:	c1 e9 12             	shr    $0x12,%ecx
 804fb60:	83 c1 7c             	add    $0x7c,%ecx
 804fb63:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fb66:	e9 6a fd ff ff       	jmp    804f8d5 <_malloc_r+0x485>
 804fb6b:	b8 fc 00 00 00       	mov    $0xfc,%eax
 804fb70:	b9 7e 00 00 00       	mov    $0x7e,%ecx
 804fb75:	e9 5b fd ff ff       	jmp    804f8d5 <_malloc_r+0x485>
 804fb7a:	a1 84 80 05 08       	mov    0x8058084,%eax
 804fb7f:	e9 20 fe ff ff       	jmp    804f9a4 <_malloc_r+0x554>
 804fb84:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804fb87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804fb8a:	e9 88 fa ff ff       	jmp    804f617 <_malloc_r+0x1c7>
 804fb8f:	90                   	nop

0804fb90 <memchr>:
 804fb90:	55                   	push   %ebp
 804fb91:	89 e5                	mov    %esp,%ebp
 804fb93:	57                   	push   %edi
 804fb94:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 804fb98:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fb9b:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fb9e:	31 d2                	xor    %edx,%edx
 804fba0:	85 c9                	test   %ecx,%ecx
 804fba2:	74 79                	je     804fc1d <L20>
 804fba4:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fbaa:	74 28                	je     804fbd4 <L5>
 804fbac:	3a 07                	cmp    (%edi),%al
 804fbae:	74 6a                	je     804fc1a <L15>
 804fbb0:	47                   	inc    %edi
 804fbb1:	49                   	dec    %ecx
 804fbb2:	74 69                	je     804fc1d <L20>
 804fbb4:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fbba:	74 18                	je     804fbd4 <L5>
 804fbbc:	3a 07                	cmp    (%edi),%al
 804fbbe:	74 5a                	je     804fc1a <L15>
 804fbc0:	47                   	inc    %edi
 804fbc1:	49                   	dec    %ecx
 804fbc2:	74 59                	je     804fc1d <L20>
 804fbc4:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fbca:	74 08                	je     804fbd4 <L5>
 804fbcc:	3a 07                	cmp    (%edi),%al
 804fbce:	74 4a                	je     804fc1a <L15>
 804fbd0:	47                   	inc    %edi
 804fbd1:	49                   	dec    %ecx
 804fbd2:	74 49                	je     804fc1d <L20>

0804fbd4 <L5>:
 804fbd4:	88 c4                	mov    %al,%ah
 804fbd6:	89 c2                	mov    %eax,%edx
 804fbd8:	c1 e2 10             	shl    $0x10,%edx
 804fbdb:	09 d0                	or     %edx,%eax
 804fbdd:	53                   	push   %ebx
 804fbde:	66 90                	xchg   %ax,%ax

0804fbe0 <L8>:
 804fbe0:	83 e9 04             	sub    $0x4,%ecx
 804fbe3:	72 1c                	jb     804fc01 <L9>
 804fbe5:	8b 17                	mov    (%edi),%edx
 804fbe7:	83 c7 04             	add    $0x4,%edi
 804fbea:	31 c2                	xor    %eax,%edx
 804fbec:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
 804fbf2:	f7 d2                	not    %edx
 804fbf4:	21 d3                	and    %edx,%ebx
 804fbf6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
 804fbfc:	74 e2                	je     804fbe0 <L8>
 804fbfe:	83 ef 04             	sub    $0x4,%edi

0804fc01 <L9>:
 804fc01:	5b                   	pop    %ebx
 804fc02:	31 d2                	xor    %edx,%edx
 804fc04:	83 c1 04             	add    $0x4,%ecx
 804fc07:	74 14                	je     804fc1d <L20>
 804fc09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804fc10 <L10>:
 804fc10:	3a 07                	cmp    (%edi),%al
 804fc12:	74 06                	je     804fc1a <L15>
 804fc14:	47                   	inc    %edi
 804fc15:	49                   	dec    %ecx
 804fc16:	75 f8                	jne    804fc10 <L10>
 804fc18:	31 ff                	xor    %edi,%edi

0804fc1a <L15>:
 804fc1a:	4a                   	dec    %edx
 804fc1b:	21 fa                	and    %edi,%edx

0804fc1d <L20>:
 804fc1d:	89 d0                	mov    %edx,%eax
 804fc1f:	8d 65 fc             	lea    -0x4(%ebp),%esp
 804fc22:	5f                   	pop    %edi
 804fc23:	c9                   	leave  
 804fc24:	c3                   	ret    
 804fc25:	66 90                	xchg   %ax,%ax
 804fc27:	90                   	nop

0804fc28 <memcpy>:
 804fc28:	55                   	push   %ebp
 804fc29:	89 e5                	mov    %esp,%ebp
 804fc2b:	56                   	push   %esi
 804fc2c:	57                   	push   %edi
 804fc2d:	53                   	push   %ebx
 804fc2e:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fc31:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fc34:	8b 75 0c             	mov    0xc(%ebp),%esi
 804fc37:	fc                   	cld    
 804fc38:	83 f9 08             	cmp    $0x8,%ecx
 804fc3b:	76 26                	jbe    804fc63 <memcpy+0x3b>
 804fc3d:	89 fa                	mov    %edi,%edx
 804fc3f:	89 cb                	mov    %ecx,%ebx
 804fc41:	83 e2 03             	and    $0x3,%edx
 804fc44:	74 10                	je     804fc56 <memcpy+0x2e>
 804fc46:	b9 04 00 00 00       	mov    $0x4,%ecx
 804fc4b:	29 d1                	sub    %edx,%ecx
 804fc4d:	83 e1 03             	and    $0x3,%ecx
 804fc50:	29 cb                	sub    %ecx,%ebx
 804fc52:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 804fc54:	89 d9                	mov    %ebx,%ecx
 804fc56:	c1 e9 02             	shr    $0x2,%ecx
 804fc59:	8d 76 00             	lea    0x0(%esi),%esi
 804fc5c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 804fc5e:	89 d9                	mov    %ebx,%ecx
 804fc60:	83 e1 03             	and    $0x3,%ecx
 804fc63:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 804fc65:	8b 45 08             	mov    0x8(%ebp),%eax
 804fc68:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804fc6b:	5b                   	pop    %ebx
 804fc6c:	5f                   	pop    %edi
 804fc6d:	5e                   	pop    %esi
 804fc6e:	c9                   	leave  
 804fc6f:	c3                   	ret    

0804fc70 <__malloc_lock>:
 804fc70:	55                   	push   %ebp
 804fc71:	89 e5                	mov    %esp,%ebp
 804fc73:	5d                   	pop    %ebp
 804fc74:	c3                   	ret    
 804fc75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fc79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804fc80 <__malloc_unlock>:
 804fc80:	55                   	push   %ebp
 804fc81:	89 e5                	mov    %esp,%ebp
 804fc83:	5d                   	pop    %ebp
 804fc84:	c3                   	ret    
 804fc85:	66 90                	xchg   %ax,%ax
 804fc87:	66 90                	xchg   %ax,%ax
 804fc89:	66 90                	xchg   %ax,%ax
 804fc8b:	66 90                	xchg   %ax,%ax
 804fc8d:	66 90                	xchg   %ax,%ax
 804fc8f:	90                   	nop

0804fc90 <_Balloc>:
 804fc90:	55                   	push   %ebp
 804fc91:	89 e5                	mov    %esp,%ebp
 804fc93:	57                   	push   %edi
 804fc94:	56                   	push   %esi
 804fc95:	53                   	push   %ebx
 804fc96:	83 ec 1c             	sub    $0x1c,%esp
 804fc99:	8b 75 08             	mov    0x8(%ebp),%esi
 804fc9c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804fc9f:	8b 46 4c             	mov    0x4c(%esi),%eax
 804fca2:	85 c0                	test   %eax,%eax
 804fca4:	74 2a                	je     804fcd0 <_Balloc+0x40>
 804fca6:	8d 14 98             	lea    (%eax,%ebx,4),%edx
 804fca9:	8b 02                	mov    (%edx),%eax
 804fcab:	85 c0                	test   %eax,%eax
 804fcad:	74 49                	je     804fcf8 <_Balloc+0x68>
 804fcaf:	8b 08                	mov    (%eax),%ecx
 804fcb1:	89 0a                	mov    %ecx,(%edx)
 804fcb3:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
 804fcba:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 804fcc1:	83 c4 1c             	add    $0x1c,%esp
 804fcc4:	5b                   	pop    %ebx
 804fcc5:	5e                   	pop    %esi
 804fcc6:	5f                   	pop    %edi
 804fcc7:	5d                   	pop    %ebp
 804fcc8:	c3                   	ret    
 804fcc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804fcd0:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
 804fcd7:	00 
 804fcd8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 804fcdf:	00 
 804fce0:	89 34 24             	mov    %esi,(%esp)
 804fce3:	e8 08 32 00 00       	call   8052ef0 <_calloc_r>
 804fce8:	85 c0                	test   %eax,%eax
 804fcea:	89 46 4c             	mov    %eax,0x4c(%esi)
 804fced:	75 b7                	jne    804fca6 <_Balloc+0x16>
 804fcef:	31 c0                	xor    %eax,%eax
 804fcf1:	eb ce                	jmp    804fcc1 <_Balloc+0x31>
 804fcf3:	90                   	nop
 804fcf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fcf8:	89 d9                	mov    %ebx,%ecx
 804fcfa:	bf 01 00 00 00       	mov    $0x1,%edi
 804fcff:	d3 e7                	shl    %cl,%edi
 804fd01:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
 804fd08:	89 44 24 08          	mov    %eax,0x8(%esp)
 804fd0c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804fd13:	00 
 804fd14:	89 34 24             	mov    %esi,(%esp)
 804fd17:	e8 d4 31 00 00       	call   8052ef0 <_calloc_r>
 804fd1c:	85 c0                	test   %eax,%eax
 804fd1e:	74 cf                	je     804fcef <_Balloc+0x5f>
 804fd20:	89 58 04             	mov    %ebx,0x4(%eax)
 804fd23:	89 78 08             	mov    %edi,0x8(%eax)
 804fd26:	eb 8b                	jmp    804fcb3 <_Balloc+0x23>
 804fd28:	90                   	nop
 804fd29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804fd30 <_Bfree>:
 804fd30:	55                   	push   %ebp
 804fd31:	89 e5                	mov    %esp,%ebp
 804fd33:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd36:	85 c0                	test   %eax,%eax
 804fd38:	74 12                	je     804fd4c <_Bfree+0x1c>
 804fd3a:	8b 55 08             	mov    0x8(%ebp),%edx
 804fd3d:	8b 48 04             	mov    0x4(%eax),%ecx
 804fd40:	8b 52 4c             	mov    0x4c(%edx),%edx
 804fd43:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
 804fd46:	8b 0a                	mov    (%edx),%ecx
 804fd48:	89 08                	mov    %ecx,(%eax)
 804fd4a:	89 02                	mov    %eax,(%edx)
 804fd4c:	5d                   	pop    %ebp
 804fd4d:	c3                   	ret    
 804fd4e:	66 90                	xchg   %ax,%ax

0804fd50 <__multadd>:
 804fd50:	55                   	push   %ebp
 804fd51:	89 e5                	mov    %esp,%ebp
 804fd53:	57                   	push   %edi
 804fd54:	56                   	push   %esi
 804fd55:	53                   	push   %ebx
 804fd56:	83 ec 2c             	sub    $0x2c,%esp
 804fd59:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd5c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 804fd5f:	8b 40 10             	mov    0x10(%eax),%eax
 804fd62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804fd65:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd68:	8d 78 14             	lea    0x14(%eax),%edi
 804fd6b:	31 c0                	xor    %eax,%eax
 804fd6d:	8d 76 00             	lea    0x0(%esi),%esi
 804fd70:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
 804fd73:	0f b7 d1             	movzwl %cx,%edx
 804fd76:	0f af 55 10          	imul   0x10(%ebp),%edx
 804fd7a:	c1 e9 10             	shr    $0x10,%ecx
 804fd7d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
 804fd81:	01 da                	add    %ebx,%edx
 804fd83:	89 d3                	mov    %edx,%ebx
 804fd85:	0f b7 d2             	movzwl %dx,%edx
 804fd88:	c1 eb 10             	shr    $0x10,%ebx
 804fd8b:	01 d9                	add    %ebx,%ecx
 804fd8d:	89 ce                	mov    %ecx,%esi
 804fd8f:	c1 e1 10             	shl    $0x10,%ecx
 804fd92:	01 d1                	add    %edx,%ecx
 804fd94:	c1 ee 10             	shr    $0x10,%esi
 804fd97:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
 804fd9a:	83 c0 01             	add    $0x1,%eax
 804fd9d:	89 f3                	mov    %esi,%ebx
 804fd9f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 804fda2:	7f cc                	jg     804fd70 <__multadd+0x20>
 804fda4:	85 f6                	test   %esi,%esi
 804fda6:	74 1b                	je     804fdc3 <__multadd+0x73>
 804fda8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fdab:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 804fdae:	3b 78 08             	cmp    0x8(%eax),%edi
 804fdb1:	7d 1d                	jge    804fdd0 <__multadd+0x80>
 804fdb3:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fdb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804fdb9:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
 804fdbd:	83 c0 01             	add    $0x1,%eax
 804fdc0:	89 47 10             	mov    %eax,0x10(%edi)
 804fdc3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fdc6:	83 c4 2c             	add    $0x2c,%esp
 804fdc9:	5b                   	pop    %ebx
 804fdca:	5e                   	pop    %esi
 804fdcb:	5f                   	pop    %edi
 804fdcc:	5d                   	pop    %ebp
 804fdcd:	c3                   	ret    
 804fdce:	66 90                	xchg   %ax,%ax
 804fdd0:	8b 40 04             	mov    0x4(%eax),%eax
 804fdd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804fdd6:	83 c0 01             	add    $0x1,%eax
 804fdd9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fddd:	8b 45 08             	mov    0x8(%ebp),%eax
 804fde0:	89 04 24             	mov    %eax,(%esp)
 804fde3:	e8 a8 fe ff ff       	call   804fc90 <_Balloc>
 804fde8:	89 c3                	mov    %eax,%ebx
 804fdea:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fded:	8b 40 10             	mov    0x10(%eax),%eax
 804fdf0:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
 804fdf7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804fdfb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fdfe:	83 c0 0c             	add    $0xc,%eax
 804fe01:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fe05:	8d 43 0c             	lea    0xc(%ebx),%eax
 804fe08:	89 04 24             	mov    %eax,(%esp)
 804fe0b:	e8 18 fe ff ff       	call   804fc28 <memcpy>
 804fe10:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fe13:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fe16:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 804fe19:	8b 50 04             	mov    0x4(%eax),%edx
 804fe1c:	8b 45 08             	mov    0x8(%ebp),%eax
 804fe1f:	8b 40 4c             	mov    0x4c(%eax),%eax
 804fe22:	8d 04 90             	lea    (%eax,%edx,4),%eax
 804fe25:	8b 10                	mov    (%eax),%edx
 804fe27:	89 17                	mov    %edx,(%edi)
 804fe29:	89 38                	mov    %edi,(%eax)
 804fe2b:	eb 86                	jmp    804fdb3 <__multadd+0x63>
 804fe2d:	8d 76 00             	lea    0x0(%esi),%esi

0804fe30 <__s2b>:
 804fe30:	55                   	push   %ebp
 804fe31:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
 804fe36:	89 e5                	mov    %esp,%ebp
 804fe38:	57                   	push   %edi
 804fe39:	56                   	push   %esi
 804fe3a:	53                   	push   %ebx
 804fe3b:	83 ec 2c             	sub    $0x2c,%esp
 804fe3e:	8b 45 14             	mov    0x14(%ebp),%eax
 804fe41:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804fe44:	8b 75 0c             	mov    0xc(%ebp),%esi
 804fe47:	8d 48 08             	lea    0x8(%eax),%ecx
 804fe4a:	89 c8                	mov    %ecx,%eax
 804fe4c:	f7 ea                	imul   %edx
 804fe4e:	c1 f9 1f             	sar    $0x1f,%ecx
 804fe51:	d1 fa                	sar    %edx
 804fe53:	29 ca                	sub    %ecx,%edx
 804fe55:	83 fa 01             	cmp    $0x1,%edx
 804fe58:	0f 8e be 00 00 00    	jle    804ff1c <__s2b+0xec>
 804fe5e:	b8 01 00 00 00       	mov    $0x1,%eax
 804fe63:	31 c9                	xor    %ecx,%ecx
 804fe65:	8d 76 00             	lea    0x0(%esi),%esi
 804fe68:	01 c0                	add    %eax,%eax
 804fe6a:	83 c1 01             	add    $0x1,%ecx
 804fe6d:	39 c2                	cmp    %eax,%edx
 804fe6f:	7f f7                	jg     804fe68 <__s2b+0x38>
 804fe71:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804fe75:	89 1c 24             	mov    %ebx,(%esp)
 804fe78:	e8 13 fe ff ff       	call   804fc90 <_Balloc>
 804fe7d:	8b 55 18             	mov    0x18(%ebp),%edx
 804fe80:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
 804fe84:	89 50 14             	mov    %edx,0x14(%eax)
 804fe87:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 804fe8e:	0f 8e 7c 00 00 00    	jle    804ff10 <__s2b+0xe0>
 804fe94:	8d 4e 09             	lea    0x9(%esi),%ecx
 804fe97:	03 75 10             	add    0x10(%ebp),%esi
 804fe9a:	89 cf                	mov    %ecx,%edi
 804fe9c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804fe9f:	90                   	nop
 804fea0:	83 c7 01             	add    $0x1,%edi
 804fea3:	0f be 57 ff          	movsbl -0x1(%edi),%edx
 804fea7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804feae:	00 
 804feaf:	89 44 24 04          	mov    %eax,0x4(%esp)
 804feb3:	89 1c 24             	mov    %ebx,(%esp)
 804feb6:	83 ea 30             	sub    $0x30,%edx
 804feb9:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804febd:	e8 8e fe ff ff       	call   804fd50 <__multadd>
 804fec2:	39 f7                	cmp    %esi,%edi
 804fec4:	75 da                	jne    804fea0 <__s2b+0x70>
 804fec6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804fec9:	8b 7d 10             	mov    0x10(%ebp),%edi
 804fecc:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
 804fed0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fed3:	39 4d 14             	cmp    %ecx,0x14(%ebp)
 804fed6:	7e 2e                	jle    804ff06 <__s2b+0xd6>
 804fed8:	8b 7d 14             	mov    0x14(%ebp),%edi
 804fedb:	29 cf                	sub    %ecx,%edi
 804fedd:	01 f7                	add    %esi,%edi
 804fedf:	90                   	nop
 804fee0:	83 c6 01             	add    $0x1,%esi
 804fee3:	0f be 56 ff          	movsbl -0x1(%esi),%edx
 804fee7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804feee:	00 
 804feef:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fef3:	89 1c 24             	mov    %ebx,(%esp)
 804fef6:	83 ea 30             	sub    $0x30,%edx
 804fef9:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804fefd:	e8 4e fe ff ff       	call   804fd50 <__multadd>
 804ff02:	39 fe                	cmp    %edi,%esi
 804ff04:	75 da                	jne    804fee0 <__s2b+0xb0>
 804ff06:	83 c4 2c             	add    $0x2c,%esp
 804ff09:	5b                   	pop    %ebx
 804ff0a:	5e                   	pop    %esi
 804ff0b:	5f                   	pop    %edi
 804ff0c:	5d                   	pop    %ebp
 804ff0d:	c3                   	ret    
 804ff0e:	66 90                	xchg   %ax,%ax
 804ff10:	83 c6 0a             	add    $0xa,%esi
 804ff13:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
 804ff1a:	eb b4                	jmp    804fed0 <__s2b+0xa0>
 804ff1c:	31 c9                	xor    %ecx,%ecx
 804ff1e:	e9 4e ff ff ff       	jmp    804fe71 <__s2b+0x41>
 804ff23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ff29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ff30 <__hi0bits>:
 804ff30:	55                   	push   %ebp
 804ff31:	31 c9                	xor    %ecx,%ecx
 804ff33:	89 e5                	mov    %esp,%ebp
 804ff35:	8b 55 08             	mov    0x8(%ebp),%edx
 804ff38:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
 804ff3e:	75 05                	jne    804ff45 <__hi0bits+0x15>
 804ff40:	c1 e2 10             	shl    $0x10,%edx
 804ff43:	b1 10                	mov    $0x10,%cl
 804ff45:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804ff4b:	75 06                	jne    804ff53 <__hi0bits+0x23>
 804ff4d:	83 c1 08             	add    $0x8,%ecx
 804ff50:	c1 e2 08             	shl    $0x8,%edx
 804ff53:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
 804ff59:	75 06                	jne    804ff61 <__hi0bits+0x31>
 804ff5b:	83 c1 04             	add    $0x4,%ecx
 804ff5e:	c1 e2 04             	shl    $0x4,%edx
 804ff61:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
 804ff67:	75 06                	jne    804ff6f <__hi0bits+0x3f>
 804ff69:	83 c1 02             	add    $0x2,%ecx
 804ff6c:	c1 e2 02             	shl    $0x2,%edx
 804ff6f:	85 d2                	test   %edx,%edx
 804ff71:	89 c8                	mov    %ecx,%eax
 804ff73:	78 0d                	js     804ff82 <__hi0bits+0x52>
 804ff75:	81 e2 00 00 00 40    	and    $0x40000000,%edx
 804ff7b:	b8 20 00 00 00       	mov    $0x20,%eax
 804ff80:	75 06                	jne    804ff88 <__hi0bits+0x58>
 804ff82:	5d                   	pop    %ebp
 804ff83:	c3                   	ret    
 804ff84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ff88:	8d 41 01             	lea    0x1(%ecx),%eax
 804ff8b:	5d                   	pop    %ebp
 804ff8c:	c3                   	ret    
 804ff8d:	8d 76 00             	lea    0x0(%esi),%esi

0804ff90 <__lo0bits>:
 804ff90:	55                   	push   %ebp
 804ff91:	89 e5                	mov    %esp,%ebp
 804ff93:	53                   	push   %ebx
 804ff94:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804ff97:	8b 13                	mov    (%ebx),%edx
 804ff99:	f6 c2 07             	test   $0x7,%dl
 804ff9c:	74 1a                	je     804ffb8 <__lo0bits+0x28>
 804ff9e:	31 c0                	xor    %eax,%eax
 804ffa0:	f6 c2 01             	test   $0x1,%dl
 804ffa3:	75 0f                	jne    804ffb4 <__lo0bits+0x24>
 804ffa5:	f6 c2 02             	test   $0x2,%dl
 804ffa8:	75 56                	jne    8050000 <__lo0bits+0x70>
 804ffaa:	c1 ea 02             	shr    $0x2,%edx
 804ffad:	b8 02 00 00 00       	mov    $0x2,%eax
 804ffb2:	89 13                	mov    %edx,(%ebx)
 804ffb4:	5b                   	pop    %ebx
 804ffb5:	5d                   	pop    %ebp
 804ffb6:	c3                   	ret    
 804ffb7:	90                   	nop
 804ffb8:	31 c9                	xor    %ecx,%ecx
 804ffba:	66 85 d2             	test   %dx,%dx
 804ffbd:	75 05                	jne    804ffc4 <__lo0bits+0x34>
 804ffbf:	c1 ea 10             	shr    $0x10,%edx
 804ffc2:	b1 10                	mov    $0x10,%cl
 804ffc4:	84 d2                	test   %dl,%dl
 804ffc6:	75 06                	jne    804ffce <__lo0bits+0x3e>
 804ffc8:	83 c1 08             	add    $0x8,%ecx
 804ffcb:	c1 ea 08             	shr    $0x8,%edx
 804ffce:	f6 c2 0f             	test   $0xf,%dl
 804ffd1:	75 06                	jne    804ffd9 <__lo0bits+0x49>
 804ffd3:	83 c1 04             	add    $0x4,%ecx
 804ffd6:	c1 ea 04             	shr    $0x4,%edx
 804ffd9:	f6 c2 03             	test   $0x3,%dl
 804ffdc:	75 06                	jne    804ffe4 <__lo0bits+0x54>
 804ffde:	83 c1 02             	add    $0x2,%ecx
 804ffe1:	c1 ea 02             	shr    $0x2,%edx
 804ffe4:	f6 c2 01             	test   $0x1,%dl
 804ffe7:	75 0c                	jne    804fff5 <__lo0bits+0x65>
 804ffe9:	d1 ea                	shr    %edx
 804ffeb:	b8 20 00 00 00       	mov    $0x20,%eax
 804fff0:	74 c2                	je     804ffb4 <__lo0bits+0x24>
 804fff2:	83 c1 01             	add    $0x1,%ecx
 804fff5:	89 13                	mov    %edx,(%ebx)
 804fff7:	89 c8                	mov    %ecx,%eax
 804fff9:	5b                   	pop    %ebx
 804fffa:	5d                   	pop    %ebp
 804fffb:	c3                   	ret    
 804fffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050000:	d1 ea                	shr    %edx
 8050002:	b0 01                	mov    $0x1,%al
 8050004:	89 13                	mov    %edx,(%ebx)
 8050006:	5b                   	pop    %ebx
 8050007:	5d                   	pop    %ebp
 8050008:	c3                   	ret    
 8050009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08050010 <__i2b>:
 8050010:	55                   	push   %ebp
 8050011:	89 e5                	mov    %esp,%ebp
 8050013:	83 ec 18             	sub    $0x18,%esp
 8050016:	8b 45 08             	mov    0x8(%ebp),%eax
 8050019:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8050020:	00 
 8050021:	89 04 24             	mov    %eax,(%esp)
 8050024:	e8 67 fc ff ff       	call   804fc90 <_Balloc>
 8050029:	8b 55 0c             	mov    0xc(%ebp),%edx
 805002c:	89 50 14             	mov    %edx,0x14(%eax)
 805002f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 8050036:	c9                   	leave  
 8050037:	c3                   	ret    
 8050038:	90                   	nop
 8050039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08050040 <__multiply>:
 8050040:	55                   	push   %ebp
 8050041:	89 e5                	mov    %esp,%ebp
 8050043:	57                   	push   %edi
 8050044:	56                   	push   %esi
 8050045:	53                   	push   %ebx
 8050046:	83 ec 3c             	sub    $0x3c,%esp
 8050049:	8b 75 0c             	mov    0xc(%ebp),%esi
 805004c:	8b 45 10             	mov    0x10(%ebp),%eax
 805004f:	8b 7e 10             	mov    0x10(%esi),%edi
 8050052:	8b 58 10             	mov    0x10(%eax),%ebx
 8050055:	39 df                	cmp    %ebx,%edi
 8050057:	7d 0e                	jge    8050067 <__multiply+0x27>
 8050059:	89 f8                	mov    %edi,%eax
 805005b:	89 df                	mov    %ebx,%edi
 805005d:	89 c3                	mov    %eax,%ebx
 805005f:	89 f0                	mov    %esi,%eax
 8050061:	8b 75 10             	mov    0x10(%ebp),%esi
 8050064:	89 45 10             	mov    %eax,0x10(%ebp)
 8050067:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
 805006a:	3b 46 08             	cmp    0x8(%esi),%eax
 805006d:	89 45 c8             	mov    %eax,-0x38(%ebp)
 8050070:	0f 9f c0             	setg   %al
 8050073:	0f b6 c0             	movzbl %al,%eax
 8050076:	03 46 04             	add    0x4(%esi),%eax
 8050079:	89 44 24 04          	mov    %eax,0x4(%esp)
 805007d:	8b 45 08             	mov    0x8(%ebp),%eax
 8050080:	89 04 24             	mov    %eax,(%esp)
 8050083:	e8 08 fc ff ff       	call   804fc90 <_Balloc>
 8050088:	8b 55 c8             	mov    -0x38(%ebp),%edx
 805008b:	89 45 c0             	mov    %eax,-0x40(%ebp)
 805008e:	8d 40 14             	lea    0x14(%eax),%eax
 8050091:	8d 14 90             	lea    (%eax,%edx,4),%edx
 8050094:	89 d1                	mov    %edx,%ecx
 8050096:	39 c8                	cmp    %ecx,%eax
 8050098:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 805009b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 805009e:	73 15                	jae    80500b5 <__multiply+0x75>
 80500a0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 80500a3:	90                   	nop
 80500a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80500a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 80500ae:	83 c0 04             	add    $0x4,%eax
 80500b1:	39 c2                	cmp    %eax,%edx
 80500b3:	77 f3                	ja     80500a8 <__multiply+0x68>
 80500b5:	8d 46 14             	lea    0x14(%esi),%eax
 80500b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 80500bb:	8d 04 b8             	lea    (%eax,%edi,4),%eax
 80500be:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80500c1:	8b 45 10             	mov    0x10(%ebp),%eax
 80500c4:	83 c0 14             	add    $0x14,%eax
 80500c7:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
 80500ca:	39 f8                	cmp    %edi,%eax
 80500cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80500cf:	89 7d cc             	mov    %edi,-0x34(%ebp)
 80500d2:	0f 83 e8 00 00 00    	jae    80501c0 <__multiply+0x180>
 80500d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80500db:	8b 00                	mov    (%eax),%eax
 80500dd:	0f b7 f8             	movzwl %ax,%edi
 80500e0:	85 ff                	test   %edi,%edi
 80500e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80500e5:	74 5a                	je     8050141 <__multiply+0x101>
 80500e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80500ea:	31 db                	xor    %ebx,%ebx
 80500ec:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80500ef:	eb 09                	jmp    80500fa <__multiply+0xba>
 80500f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80500f8:	89 fa                	mov    %edi,%edx
 80500fa:	8b 0e                	mov    (%esi),%ecx
 80500fc:	83 c6 04             	add    $0x4,%esi
 80500ff:	0f b7 3a             	movzwl (%edx),%edi
 8050102:	0f b7 c1             	movzwl %cx,%eax
 8050105:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
 8050109:	c1 e9 10             	shr    $0x10,%ecx
 805010c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
 8050110:	01 f8                	add    %edi,%eax
 8050112:	01 d8                	add    %ebx,%eax
 8050114:	8b 1a                	mov    (%edx),%ebx
 8050116:	8d 7a 04             	lea    0x4(%edx),%edi
 8050119:	c1 eb 10             	shr    $0x10,%ebx
 805011c:	01 d9                	add    %ebx,%ecx
 805011e:	89 c3                	mov    %eax,%ebx
 8050120:	c1 eb 10             	shr    $0x10,%ebx
 8050123:	0f b7 c0             	movzwl %ax,%eax
 8050126:	01 d9                	add    %ebx,%ecx
 8050128:	89 cb                	mov    %ecx,%ebx
 805012a:	c1 e1 10             	shl    $0x10,%ecx
 805012d:	09 c1                	or     %eax,%ecx
 805012f:	c1 eb 10             	shr    $0x10,%ebx
 8050132:	39 75 dc             	cmp    %esi,-0x24(%ebp)
 8050135:	89 0a                	mov    %ecx,(%edx)
 8050137:	77 bf                	ja     80500f8 <__multiply+0xb8>
 8050139:	8b 45 d8             	mov    -0x28(%ebp),%eax
 805013c:	89 5a 04             	mov    %ebx,0x4(%edx)
 805013f:	8b 00                	mov    (%eax),%eax
 8050141:	c1 e8 10             	shr    $0x10,%eax
 8050144:	85 c0                	test   %eax,%eax
 8050146:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8050149:	74 61                	je     80501ac <__multiply+0x16c>
 805014b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 805014e:	31 ff                	xor    %edi,%edi
 8050150:	89 fe                	mov    %edi,%esi
 8050152:	8b 10                	mov    (%eax),%edx
 8050154:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050157:	8b 45 d0             	mov    -0x30(%ebp),%eax
 805015a:	89 d3                	mov    %edx,%ebx
 805015c:	eb 05                	jmp    8050163 <__multiply+0x123>
 805015e:	66 90                	xchg   %ax,%ax
 8050160:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8050163:	0f b7 08             	movzwl (%eax),%ecx
 8050166:	c1 eb 10             	shr    $0x10,%ebx
 8050169:	0f b7 d2             	movzwl %dx,%edx
 805016c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
 8050170:	83 c0 04             	add    $0x4,%eax
 8050173:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
 8050176:	01 f7                	add    %esi,%edi
 8050178:	8b 75 e0             	mov    -0x20(%ebp),%esi
 805017b:	89 fb                	mov    %edi,%ebx
 805017d:	c1 e3 10             	shl    $0x10,%ebx
 8050180:	09 d3                	or     %edx,%ebx
 8050182:	89 1e                	mov    %ebx,(%esi)
 8050184:	8b 5e 04             	mov    0x4(%esi),%ebx
 8050187:	8d 4e 04             	lea    0x4(%esi),%ecx
 805018a:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
 805018e:	c1 ef 10             	shr    $0x10,%edi
 8050191:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
 8050195:	0f b7 f3             	movzwl %bx,%esi
 8050198:	01 f2                	add    %esi,%edx
 805019a:	01 fa                	add    %edi,%edx
 805019c:	89 d6                	mov    %edx,%esi
 805019e:	c1 ee 10             	shr    $0x10,%esi
 80501a1:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 80501a4:	77 ba                	ja     8050160 <__multiply+0x120>
 80501a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80501a9:	89 50 04             	mov    %edx,0x4(%eax)
 80501ac:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
 80501b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80501b3:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 80501b7:	39 45 cc             	cmp    %eax,-0x34(%ebp)
 80501ba:	0f 87 18 ff ff ff    	ja     80500d8 <__multiply+0x98>
 80501c0:	8b 75 c8             	mov    -0x38(%ebp),%esi
 80501c3:	85 f6                	test   %esi,%esi
 80501c5:	7e 29                	jle    80501f0 <__multiply+0x1b0>
 80501c7:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 80501ca:	8b 5f fc             	mov    -0x4(%edi),%ebx
 80501cd:	85 db                	test   %ebx,%ebx
 80501cf:	75 1f                	jne    80501f0 <__multiply+0x1b0>
 80501d1:	8b 55 c8             	mov    -0x38(%ebp),%edx
 80501d4:	89 d0                	mov    %edx,%eax
 80501d6:	c1 e0 02             	shl    $0x2,%eax
 80501d9:	29 c7                	sub    %eax,%edi
 80501db:	89 f8                	mov    %edi,%eax
 80501dd:	eb 09                	jmp    80501e8 <__multiply+0x1a8>
 80501df:	90                   	nop
 80501e0:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
 80501e4:	85 c9                	test   %ecx,%ecx
 80501e6:	75 05                	jne    80501ed <__multiply+0x1ad>
 80501e8:	83 ea 01             	sub    $0x1,%edx
 80501eb:	75 f3                	jne    80501e0 <__multiply+0x1a0>
 80501ed:	89 55 c8             	mov    %edx,-0x38(%ebp)
 80501f0:	8b 45 c0             	mov    -0x40(%ebp),%eax
 80501f3:	8b 7d c8             	mov    -0x38(%ebp),%edi
 80501f6:	89 78 10             	mov    %edi,0x10(%eax)
 80501f9:	83 c4 3c             	add    $0x3c,%esp
 80501fc:	5b                   	pop    %ebx
 80501fd:	5e                   	pop    %esi
 80501fe:	5f                   	pop    %edi
 80501ff:	5d                   	pop    %ebp
 8050200:	c3                   	ret    
 8050201:	eb 0d                	jmp    8050210 <__pow5mult>
 8050203:	90                   	nop
 8050204:	90                   	nop
 8050205:	90                   	nop
 8050206:	90                   	nop
 8050207:	90                   	nop
 8050208:	90                   	nop
 8050209:	90                   	nop
 805020a:	90                   	nop
 805020b:	90                   	nop
 805020c:	90                   	nop
 805020d:	90                   	nop
 805020e:	90                   	nop
 805020f:	90                   	nop

08050210 <__pow5mult>:
 8050210:	55                   	push   %ebp
 8050211:	89 e5                	mov    %esp,%ebp
 8050213:	57                   	push   %edi
 8050214:	56                   	push   %esi
 8050215:	53                   	push   %ebx
 8050216:	83 ec 2c             	sub    $0x2c,%esp
 8050219:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805021c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805021f:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8050222:	89 d8                	mov    %ebx,%eax
 8050224:	83 e0 03             	and    $0x3,%eax
 8050227:	0f 85 a3 00 00 00    	jne    80502d0 <__pow5mult+0xc0>
 805022d:	c1 fb 02             	sar    $0x2,%ebx
 8050230:	85 db                	test   %ebx,%ebx
 8050232:	74 5c                	je     8050290 <__pow5mult+0x80>
 8050234:	8b 71 48             	mov    0x48(%ecx),%esi
 8050237:	85 f6                	test   %esi,%esi
 8050239:	0f 84 bd 00 00 00    	je     80502fc <__pow5mult+0xec>
 805023f:	f6 c3 01             	test   $0x1,%bl
 8050242:	75 15                	jne    8050259 <__pow5mult+0x49>
 8050244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050248:	d1 fb                	sar    %ebx
 805024a:	74 44                	je     8050290 <__pow5mult+0x80>
 805024c:	8b 06                	mov    (%esi),%eax
 805024e:	85 c0                	test   %eax,%eax
 8050250:	74 4e                	je     80502a0 <__pow5mult+0x90>
 8050252:	89 c6                	mov    %eax,%esi
 8050254:	f6 c3 01             	test   $0x1,%bl
 8050257:	74 ef                	je     8050248 <__pow5mult+0x38>
 8050259:	89 0c 24             	mov    %ecx,(%esp)
 805025c:	89 74 24 08          	mov    %esi,0x8(%esp)
 8050260:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8050264:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050267:	e8 d4 fd ff ff       	call   8050040 <__multiply>
 805026c:	85 ff                	test   %edi,%edi
 805026e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050271:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050274:	74 52                	je     80502c8 <__pow5mult+0xb8>
 8050276:	8b 57 04             	mov    0x4(%edi),%edx
 8050279:	d1 fb                	sar    %ebx
 805027b:	8b 41 4c             	mov    0x4c(%ecx),%eax
 805027e:	8d 04 90             	lea    (%eax,%edx,4),%eax
 8050281:	8b 10                	mov    (%eax),%edx
 8050283:	89 17                	mov    %edx,(%edi)
 8050285:	89 38                	mov    %edi,(%eax)
 8050287:	8b 7d e0             	mov    -0x20(%ebp),%edi
 805028a:	75 c0                	jne    805024c <__pow5mult+0x3c>
 805028c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050290:	83 c4 2c             	add    $0x2c,%esp
 8050293:	89 f8                	mov    %edi,%eax
 8050295:	5b                   	pop    %ebx
 8050296:	5e                   	pop    %esi
 8050297:	5f                   	pop    %edi
 8050298:	5d                   	pop    %ebp
 8050299:	c3                   	ret    
 805029a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80502a0:	89 74 24 08          	mov    %esi,0x8(%esp)
 80502a4:	89 74 24 04          	mov    %esi,0x4(%esp)
 80502a8:	89 0c 24             	mov    %ecx,(%esp)
 80502ab:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 80502ae:	e8 8d fd ff ff       	call   8050040 <__multiply>
 80502b3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80502b6:	89 06                	mov    %eax,(%esi)
 80502b8:	89 c6                	mov    %eax,%esi
 80502ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 80502c0:	eb 92                	jmp    8050254 <__pow5mult+0x44>
 80502c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80502c8:	8b 7d e0             	mov    -0x20(%ebp),%edi
 80502cb:	e9 78 ff ff ff       	jmp    8050248 <__pow5mult+0x38>
 80502d0:	8b 04 85 bc 49 05 08 	mov    0x80549bc(,%eax,4),%eax
 80502d7:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80502db:	89 0c 24             	mov    %ecx,(%esp)
 80502de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 80502e5:	00 
 80502e6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80502ea:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 80502ed:	e8 5e fa ff ff       	call   804fd50 <__multadd>
 80502f2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80502f5:	89 c7                	mov    %eax,%edi
 80502f7:	e9 31 ff ff ff       	jmp    805022d <__pow5mult+0x1d>
 80502fc:	89 0c 24             	mov    %ecx,(%esp)
 80502ff:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8050306:	00 
 8050307:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 805030a:	e8 81 f9 ff ff       	call   804fc90 <_Balloc>
 805030f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050312:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
 8050319:	89 c6                	mov    %eax,%esi
 805031b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 8050322:	89 41 48             	mov    %eax,0x48(%ecx)
 8050325:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 805032b:	e9 0f ff ff ff       	jmp    805023f <__pow5mult+0x2f>

08050330 <__lshift>:
 8050330:	55                   	push   %ebp
 8050331:	89 e5                	mov    %esp,%ebp
 8050333:	57                   	push   %edi
 8050334:	56                   	push   %esi
 8050335:	53                   	push   %ebx
 8050336:	83 ec 2c             	sub    $0x2c,%esp
 8050339:	8b 45 0c             	mov    0xc(%ebp),%eax
 805033c:	8b 75 10             	mov    0x10(%ebp),%esi
 805033f:	89 c7                	mov    %eax,%edi
 8050341:	8b 50 04             	mov    0x4(%eax),%edx
 8050344:	8b 40 10             	mov    0x10(%eax),%eax
 8050347:	89 f3                	mov    %esi,%ebx
 8050349:	c1 fb 05             	sar    $0x5,%ebx
 805034c:	01 d8                	add    %ebx,%eax
 805034e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8050351:	83 c0 01             	add    $0x1,%eax
 8050354:	89 c1                	mov    %eax,%ecx
 8050356:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8050359:	8b 47 08             	mov    0x8(%edi),%eax
 805035c:	39 c1                	cmp    %eax,%ecx
 805035e:	7e 09                	jle    8050369 <__lshift+0x39>
 8050360:	01 c0                	add    %eax,%eax
 8050362:	83 c2 01             	add    $0x1,%edx
 8050365:	39 c1                	cmp    %eax,%ecx
 8050367:	7f f7                	jg     8050360 <__lshift+0x30>
 8050369:	8b 45 08             	mov    0x8(%ebp),%eax
 805036c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8050370:	89 04 24             	mov    %eax,(%esp)
 8050373:	e8 18 f9 ff ff       	call   804fc90 <_Balloc>
 8050378:	85 db                	test   %ebx,%ebx
 805037a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 805037d:	8d 50 14             	lea    0x14(%eax),%edx
 8050380:	7e 17                	jle    8050399 <__lshift+0x69>
 8050382:	31 c0                	xor    %eax,%eax
 8050384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050388:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
 805038f:	83 c0 01             	add    $0x1,%eax
 8050392:	39 d8                	cmp    %ebx,%eax
 8050394:	75 f2                	jne    8050388 <__lshift+0x58>
 8050396:	8d 14 82             	lea    (%edx,%eax,4),%edx
 8050399:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805039c:	8b 45 0c             	mov    0xc(%ebp),%eax
 805039f:	8b 4f 10             	mov    0x10(%edi),%ecx
 80503a2:	83 c0 14             	add    $0x14,%eax
 80503a5:	83 e6 1f             	and    $0x1f,%esi
 80503a8:	89 75 e0             	mov    %esi,-0x20(%ebp)
 80503ab:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
 80503ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80503b1:	74 7d                	je     8050430 <__lshift+0x100>
 80503b3:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
 80503ba:	29 75 dc             	sub    %esi,-0x24(%ebp)
 80503bd:	31 f6                	xor    %esi,%esi
 80503bf:	eb 09                	jmp    80503ca <__lshift+0x9a>
 80503c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80503c8:	89 fa                	mov    %edi,%edx
 80503ca:	8b 18                	mov    (%eax),%ebx
 80503cc:	83 c0 04             	add    $0x4,%eax
 80503cf:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 80503d3:	8d 7a 04             	lea    0x4(%edx),%edi
 80503d6:	d3 e3                	shl    %cl,%ebx
 80503d8:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
 80503dc:	09 f3                	or     %esi,%ebx
 80503de:	89 1a                	mov    %ebx,(%edx)
 80503e0:	8b 70 fc             	mov    -0x4(%eax),%esi
 80503e3:	d3 ee                	shr    %cl,%esi
 80503e5:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 80503e8:	77 de                	ja     80503c8 <__lshift+0x98>
 80503ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80503ed:	89 72 04             	mov    %esi,0x4(%edx)
 80503f0:	83 c0 02             	add    $0x2,%eax
 80503f3:	85 f6                	test   %esi,%esi
 80503f5:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
 80503f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80503fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80503ff:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8050402:	8b 75 0c             	mov    0xc(%ebp),%esi
 8050405:	83 e8 01             	sub    $0x1,%eax
 8050408:	89 47 10             	mov    %eax,0x10(%edi)
 805040b:	8b 45 0c             	mov    0xc(%ebp),%eax
 805040e:	8b 50 04             	mov    0x4(%eax),%edx
 8050411:	8b 45 08             	mov    0x8(%ebp),%eax
 8050414:	8b 40 4c             	mov    0x4c(%eax),%eax
 8050417:	8d 04 90             	lea    (%eax,%edx,4),%eax
 805041a:	8b 10                	mov    (%eax),%edx
 805041c:	89 16                	mov    %edx,(%esi)
 805041e:	89 30                	mov    %esi,(%eax)
 8050420:	83 c4 2c             	add    $0x2c,%esp
 8050423:	89 f8                	mov    %edi,%eax
 8050425:	5b                   	pop    %ebx
 8050426:	5e                   	pop    %esi
 8050427:	5f                   	pop    %edi
 8050428:	5d                   	pop    %ebp
 8050429:	c3                   	ret    
 805042a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050430:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 8050433:	90                   	nop
 8050434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050438:	83 c0 04             	add    $0x4,%eax
 805043b:	8b 48 fc             	mov    -0x4(%eax),%ecx
 805043e:	83 c2 04             	add    $0x4,%edx
 8050441:	39 c3                	cmp    %eax,%ebx
 8050443:	89 4a fc             	mov    %ecx,-0x4(%edx)
 8050446:	77 f0                	ja     8050438 <__lshift+0x108>
 8050448:	eb b2                	jmp    80503fc <__lshift+0xcc>
 805044a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08050450 <__mcmp>:
 8050450:	55                   	push   %ebp
 8050451:	89 e5                	mov    %esp,%ebp
 8050453:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8050456:	8b 55 0c             	mov    0xc(%ebp),%edx
 8050459:	53                   	push   %ebx
 805045a:	8b 41 10             	mov    0x10(%ecx),%eax
 805045d:	8b 5a 10             	mov    0x10(%edx),%ebx
 8050460:	29 d8                	sub    %ebx,%eax
 8050462:	85 c0                	test   %eax,%eax
 8050464:	75 27                	jne    805048d <__mcmp+0x3d>
 8050466:	c1 e3 02             	shl    $0x2,%ebx
 8050469:	83 c1 14             	add    $0x14,%ecx
 805046c:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
 805046f:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
 8050473:	eb 07                	jmp    805047c <__mcmp+0x2c>
 8050475:	8d 76 00             	lea    0x0(%esi),%esi
 8050478:	39 c1                	cmp    %eax,%ecx
 805047a:	73 14                	jae    8050490 <__mcmp+0x40>
 805047c:	83 ea 04             	sub    $0x4,%edx
 805047f:	83 e8 04             	sub    $0x4,%eax
 8050482:	8b 1a                	mov    (%edx),%ebx
 8050484:	39 18                	cmp    %ebx,(%eax)
 8050486:	74 f0                	je     8050478 <__mcmp+0x28>
 8050488:	19 c0                	sbb    %eax,%eax
 805048a:	83 c8 01             	or     $0x1,%eax
 805048d:	5b                   	pop    %ebx
 805048e:	5d                   	pop    %ebp
 805048f:	c3                   	ret    
 8050490:	31 c0                	xor    %eax,%eax
 8050492:	5b                   	pop    %ebx
 8050493:	5d                   	pop    %ebp
 8050494:	c3                   	ret    
 8050495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080504a0 <__mdiff>:
 80504a0:	55                   	push   %ebp
 80504a1:	89 e5                	mov    %esp,%ebp
 80504a3:	57                   	push   %edi
 80504a4:	56                   	push   %esi
 80504a5:	53                   	push   %ebx
 80504a6:	83 ec 2c             	sub    $0x2c,%esp
 80504a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 80504ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80504af:	89 34 24             	mov    %esi,(%esp)
 80504b2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80504b6:	e8 95 ff ff ff       	call   8050450 <__mcmp>
 80504bb:	85 c0                	test   %eax,%eax
 80504bd:	0f 84 25 01 00 00    	je     80505e8 <__mdiff+0x148>
 80504c3:	0f 88 0f 01 00 00    	js     80505d8 <__mdiff+0x138>
 80504c9:	31 ff                	xor    %edi,%edi
 80504cb:	8b 46 04             	mov    0x4(%esi),%eax
 80504ce:	83 c6 14             	add    $0x14,%esi
 80504d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80504d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80504d8:	89 04 24             	mov    %eax,(%esp)
 80504db:	e8 b0 f7 ff ff       	call   804fc90 <_Balloc>
 80504e0:	8d 4b 14             	lea    0x14(%ebx),%ecx
 80504e3:	89 c2                	mov    %eax,%edx
 80504e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80504e8:	89 78 0c             	mov    %edi,0xc(%eax)
 80504eb:	8b 46 fc             	mov    -0x4(%esi),%eax
 80504ee:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 80504f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80504f4:	8d 04 86             	lea    (%esi,%eax,4),%eax
 80504f7:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80504fa:	8b 43 10             	mov    0x10(%ebx),%eax
 80504fd:	31 db                	xor    %ebx,%ebx
 80504ff:	8d 04 81             	lea    (%ecx,%eax,4),%eax
 8050502:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050505:	89 d0                	mov    %edx,%eax
 8050507:	83 c0 14             	add    $0x14,%eax
 805050a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050510:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8050513:	83 c0 04             	add    $0x4,%eax
 8050516:	83 c1 04             	add    $0x4,%ecx
 8050519:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 805051d:	8b 3e                	mov    (%esi),%edi
 805051f:	8b 71 fc             	mov    -0x4(%ecx),%esi
 8050522:	0f b7 d7             	movzwl %di,%edx
 8050525:	01 da                	add    %ebx,%edx
 8050527:	0f b7 de             	movzwl %si,%ebx
 805052a:	29 da                	sub    %ebx,%edx
 805052c:	c1 ef 10             	shr    $0x10,%edi
 805052f:	89 d3                	mov    %edx,%ebx
 8050531:	c1 ee 10             	shr    $0x10,%esi
 8050534:	0f b7 d2             	movzwl %dx,%edx
 8050537:	c1 fb 10             	sar    $0x10,%ebx
 805053a:	29 f7                	sub    %esi,%edi
 805053c:	01 df                	add    %ebx,%edi
 805053e:	89 fb                	mov    %edi,%ebx
 8050540:	c1 e7 10             	shl    $0x10,%edi
 8050543:	09 d7                	or     %edx,%edi
 8050545:	c1 fb 10             	sar    $0x10,%ebx
 8050548:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
 805054b:	89 78 fc             	mov    %edi,-0x4(%eax)
 805054e:	77 c0                	ja     8050510 <__mdiff+0x70>
 8050550:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8050553:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 8050556:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8050559:	89 75 e0             	mov    %esi,-0x20(%ebp)
 805055c:	39 f1                	cmp    %esi,%ecx
 805055e:	76 3f                	jbe    805059f <__mdiff+0xff>
 8050560:	8b 3e                	mov    (%esi),%edi
 8050562:	83 c6 04             	add    $0x4,%esi
 8050565:	83 c0 04             	add    $0x4,%eax
 8050568:	0f b7 d7             	movzwl %di,%edx
 805056b:	01 da                	add    %ebx,%edx
 805056d:	89 d3                	mov    %edx,%ebx
 805056f:	0f b7 d2             	movzwl %dx,%edx
 8050572:	c1 fb 10             	sar    $0x10,%ebx
 8050575:	c1 ef 10             	shr    $0x10,%edi
 8050578:	01 df                	add    %ebx,%edi
 805057a:	89 fb                	mov    %edi,%ebx
 805057c:	c1 e7 10             	shl    $0x10,%edi
 805057f:	09 d7                	or     %edx,%edi
 8050581:	c1 fb 10             	sar    $0x10,%ebx
 8050584:	39 f1                	cmp    %esi,%ecx
 8050586:	89 78 fc             	mov    %edi,-0x4(%eax)
 8050589:	77 d5                	ja     8050560 <__mdiff+0xc0>
 805058b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 805058e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 8050591:	f7 d0                	not    %eax
 8050593:	01 c8                	add    %ecx,%eax
 8050595:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050598:	c1 e8 02             	shr    $0x2,%eax
 805059b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
 805059f:	85 ff                	test   %edi,%edi
 80505a1:	75 23                	jne    80505c6 <__mdiff+0x126>
 80505a3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 80505a6:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
 80505ad:	29 d0                	sub    %edx,%eax
 80505af:	89 ca                	mov    %ecx,%edx
 80505b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80505b8:	83 ea 01             	sub    $0x1,%edx
 80505bb:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
 80505bf:	85 c9                	test   %ecx,%ecx
 80505c1:	74 f5                	je     80505b8 <__mdiff+0x118>
 80505c3:	89 55 dc             	mov    %edx,-0x24(%ebp)
 80505c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80505c9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 80505cc:	89 48 10             	mov    %ecx,0x10(%eax)
 80505cf:	83 c4 2c             	add    $0x2c,%esp
 80505d2:	5b                   	pop    %ebx
 80505d3:	5e                   	pop    %esi
 80505d4:	5f                   	pop    %edi
 80505d5:	5d                   	pop    %ebp
 80505d6:	c3                   	ret    
 80505d7:	90                   	nop
 80505d8:	89 f0                	mov    %esi,%eax
 80505da:	bf 01 00 00 00       	mov    $0x1,%edi
 80505df:	89 de                	mov    %ebx,%esi
 80505e1:	89 c3                	mov    %eax,%ebx
 80505e3:	e9 e3 fe ff ff       	jmp    80504cb <__mdiff+0x2b>
 80505e8:	8b 45 08             	mov    0x8(%ebp),%eax
 80505eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80505f2:	00 
 80505f3:	89 04 24             	mov    %eax,(%esp)
 80505f6:	e8 95 f6 ff ff       	call   804fc90 <_Balloc>
 80505fb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 8050602:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 8050609:	83 c4 2c             	add    $0x2c,%esp
 805060c:	5b                   	pop    %ebx
 805060d:	5e                   	pop    %esi
 805060e:	5f                   	pop    %edi
 805060f:	5d                   	pop    %ebp
 8050610:	c3                   	ret    
 8050611:	eb 0d                	jmp    8050620 <__ulp>
 8050613:	90                   	nop
 8050614:	90                   	nop
 8050615:	90                   	nop
 8050616:	90                   	nop
 8050617:	90                   	nop
 8050618:	90                   	nop
 8050619:	90                   	nop
 805061a:	90                   	nop
 805061b:	90                   	nop
 805061c:	90                   	nop
 805061d:	90                   	nop
 805061e:	90                   	nop
 805061f:	90                   	nop

08050620 <__ulp>:
 8050620:	55                   	push   %ebp
 8050621:	89 e5                	mov    %esp,%ebp
 8050623:	83 ec 08             	sub    $0x8,%esp
 8050626:	dd 45 08             	fldl   0x8(%ebp)
 8050629:	dd 5d f8             	fstpl  -0x8(%ebp)
 805062c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 805062f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
 8050635:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
 805063b:	85 c9                	test   %ecx,%ecx
 805063d:	7e 11                	jle    8050650 <__ulp+0x30>
 805063f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8050642:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8050649:	dd 45 f8             	fldl   -0x8(%ebp)
 805064c:	c9                   	leave  
 805064d:	c3                   	ret    
 805064e:	66 90                	xchg   %ax,%ax
 8050650:	f7 d9                	neg    %ecx
 8050652:	c1 f9 14             	sar    $0x14,%ecx
 8050655:	83 f9 13             	cmp    $0x13,%ecx
 8050658:	7e 26                	jle    8050680 <__ulp+0x60>
 805065a:	83 f9 32             	cmp    $0x32,%ecx
 805065d:	b8 01 00 00 00       	mov    $0x1,%eax
 8050662:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8050669:	7f 0b                	jg     8050676 <__ulp+0x56>
 805066b:	ba 33 00 00 00       	mov    $0x33,%edx
 8050670:	29 ca                	sub    %ecx,%edx
 8050672:	89 d1                	mov    %edx,%ecx
 8050674:	d3 e0                	shl    %cl,%eax
 8050676:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8050679:	dd 45 f8             	fldl   -0x8(%ebp)
 805067c:	c9                   	leave  
 805067d:	c3                   	ret    
 805067e:	66 90                	xchg   %ax,%ax
 8050680:	b8 00 00 08 00       	mov    $0x80000,%eax
 8050685:	d3 f8                	sar    %cl,%eax
 8050687:	89 45 fc             	mov    %eax,-0x4(%ebp)
 805068a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8050691:	dd 45 f8             	fldl   -0x8(%ebp)
 8050694:	c9                   	leave  
 8050695:	c3                   	ret    
 8050696:	8d 76 00             	lea    0x0(%esi),%esi
 8050699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080506a0 <__b2d>:
 80506a0:	55                   	push   %ebp
 80506a1:	89 e5                	mov    %esp,%ebp
 80506a3:	57                   	push   %edi
 80506a4:	56                   	push   %esi
 80506a5:	53                   	push   %ebx
 80506a6:	83 ec 18             	sub    $0x18,%esp
 80506a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80506ac:	8d 78 14             	lea    0x14(%eax),%edi
 80506af:	8b 40 10             	mov    0x10(%eax),%eax
 80506b2:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
 80506b5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80506b8:	8d 43 fc             	lea    -0x4(%ebx),%eax
 80506bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80506be:	89 34 24             	mov    %esi,(%esp)
 80506c1:	e8 6a f8 ff ff       	call   804ff30 <__hi0bits>
 80506c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80506c9:	ba 20 00 00 00       	mov    $0x20,%edx
 80506ce:	29 c2                	sub    %eax,%edx
 80506d0:	83 f8 0a             	cmp    $0xa,%eax
 80506d3:	89 11                	mov    %edx,(%ecx)
 80506d5:	7f 41                	jg     8050718 <__b2d+0x78>
 80506d7:	b9 0b 00 00 00       	mov    $0xb,%ecx
 80506dc:	89 f2                	mov    %esi,%edx
 80506de:	29 c1                	sub    %eax,%ecx
 80506e0:	d3 ea                	shr    %cl,%edx
 80506e2:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
 80506e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
 80506eb:	31 d2                	xor    %edx,%edx
 80506ed:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
 80506f0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 80506f7:	73 05                	jae    80506fe <__b2d+0x5e>
 80506f9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80506fc:	d3 ea                	shr    %cl,%edx
 80506fe:	8d 48 15             	lea    0x15(%eax),%ecx
 8050701:	d3 e6                	shl    %cl,%esi
 8050703:	09 f2                	or     %esi,%edx
 8050705:	89 55 e8             	mov    %edx,-0x18(%ebp)
 8050708:	dd 45 e8             	fldl   -0x18(%ebp)
 805070b:	83 c4 18             	add    $0x18,%esp
 805070e:	5b                   	pop    %ebx
 805070f:	5e                   	pop    %esi
 8050710:	5f                   	pop    %edi
 8050711:	5d                   	pop    %ebp
 8050712:	c3                   	ret    
 8050713:	90                   	nop
 8050714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050718:	31 d2                	xor    %edx,%edx
 805071a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
 805071d:	73 09                	jae    8050728 <__b2d+0x88>
 805071f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8050722:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8050725:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050728:	89 c3                	mov    %eax,%ebx
 805072a:	83 eb 0b             	sub    $0xb,%ebx
 805072d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
 8050730:	74 4e                	je     8050780 <__b2d+0xe0>
 8050732:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 8050736:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 805073b:	29 c3                	sub    %eax,%ebx
 805073d:	89 d0                	mov    %edx,%eax
 805073f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 8050746:	d3 e6                	shl    %cl,%esi
 8050748:	89 d9                	mov    %ebx,%ecx
 805074a:	d3 e8                	shr    %cl,%eax
 805074c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 805074f:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
 8050755:	09 c6                	or     %eax,%esi
 8050757:	31 c0                	xor    %eax,%eax
 8050759:	89 75 ec             	mov    %esi,-0x14(%ebp)
 805075c:	39 f9                	cmp    %edi,%ecx
 805075e:	76 07                	jbe    8050767 <__b2d+0xc7>
 8050760:	8b 41 fc             	mov    -0x4(%ecx),%eax
 8050763:	89 d9                	mov    %ebx,%ecx
 8050765:	d3 e8                	shr    %cl,%eax
 8050767:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 805076b:	d3 e2                	shl    %cl,%edx
 805076d:	09 d0                	or     %edx,%eax
 805076f:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8050772:	dd 45 e8             	fldl   -0x18(%ebp)
 8050775:	83 c4 18             	add    $0x18,%esp
 8050778:	5b                   	pop    %ebx
 8050779:	5e                   	pop    %esi
 805077a:	5f                   	pop    %edi
 805077b:	5d                   	pop    %ebp
 805077c:	c3                   	ret    
 805077d:	8d 76 00             	lea    0x0(%esi),%esi
 8050780:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
 8050786:	89 75 ec             	mov    %esi,-0x14(%ebp)
 8050789:	89 55 e8             	mov    %edx,-0x18(%ebp)
 805078c:	dd 45 e8             	fldl   -0x18(%ebp)
 805078f:	83 c4 18             	add    $0x18,%esp
 8050792:	5b                   	pop    %ebx
 8050793:	5e                   	pop    %esi
 8050794:	5f                   	pop    %edi
 8050795:	5d                   	pop    %ebp
 8050796:	c3                   	ret    
 8050797:	89 f6                	mov    %esi,%esi
 8050799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080507a0 <__d2b>:
 80507a0:	55                   	push   %ebp
 80507a1:	89 e5                	mov    %esp,%ebp
 80507a3:	57                   	push   %edi
 80507a4:	56                   	push   %esi
 80507a5:	53                   	push   %ebx
 80507a6:	83 ec 2c             	sub    $0x2c,%esp
 80507a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80507ac:	dd 45 0c             	fldl   0xc(%ebp)
 80507af:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80507b6:	00 
 80507b7:	dd 5d d0             	fstpl  -0x30(%ebp)
 80507ba:	89 04 24             	mov    %eax,(%esp)
 80507bd:	e8 ce f4 ff ff       	call   804fc90 <_Balloc>
 80507c2:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 80507c5:	89 c6                	mov    %eax,%esi
 80507c7:	89 d8                	mov    %ebx,%eax
 80507c9:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
 80507cf:	25 ff ff 0f 00       	and    $0xfffff,%eax
 80507d4:	c1 eb 14             	shr    $0x14,%ebx
 80507d7:	85 db                	test   %ebx,%ebx
 80507d9:	74 05                	je     80507e0 <__d2b+0x40>
 80507db:	0d 00 00 10 00       	or     $0x100000,%eax
 80507e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80507e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80507e6:	85 c0                	test   %eax,%eax
 80507e8:	74 56                	je     8050840 <__d2b+0xa0>
 80507ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80507ed:	8d 45 e0             	lea    -0x20(%ebp),%eax
 80507f0:	89 04 24             	mov    %eax,(%esp)
 80507f3:	e8 98 f7 ff ff       	call   804ff90 <__lo0bits>
 80507f8:	85 c0                	test   %eax,%eax
 80507fa:	0f 85 90 00 00 00    	jne    8050890 <__d2b+0xf0>
 8050800:	8b 55 e0             	mov    -0x20(%ebp),%edx
 8050803:	89 56 14             	mov    %edx,0x14(%esi)
 8050806:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050809:	83 fa 01             	cmp    $0x1,%edx
 805080c:	19 ff                	sbb    %edi,%edi
 805080e:	83 c7 02             	add    $0x2,%edi
 8050811:	85 db                	test   %ebx,%ebx
 8050813:	89 56 18             	mov    %edx,0x18(%esi)
 8050816:	89 7e 10             	mov    %edi,0x10(%esi)
 8050819:	74 49                	je     8050864 <__d2b+0xc4>
 805081b:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805081e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
 8050825:	89 11                	mov    %edx,(%ecx)
 8050827:	ba 35 00 00 00       	mov    $0x35,%edx
 805082c:	29 c2                	sub    %eax,%edx
 805082e:	8b 45 18             	mov    0x18(%ebp),%eax
 8050831:	89 10                	mov    %edx,(%eax)
 8050833:	83 c4 2c             	add    $0x2c,%esp
 8050836:	89 f0                	mov    %esi,%eax
 8050838:	5b                   	pop    %ebx
 8050839:	5e                   	pop    %esi
 805083a:	5f                   	pop    %edi
 805083b:	5d                   	pop    %ebp
 805083c:	c3                   	ret    
 805083d:	8d 76 00             	lea    0x0(%esi),%esi
 8050840:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8050843:	bf 01 00 00 00       	mov    $0x1,%edi
 8050848:	89 04 24             	mov    %eax,(%esp)
 805084b:	e8 40 f7 ff ff       	call   804ff90 <__lo0bits>
 8050850:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050853:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
 805085a:	89 56 14             	mov    %edx,0x14(%esi)
 805085d:	83 c0 20             	add    $0x20,%eax
 8050860:	85 db                	test   %ebx,%ebx
 8050862:	75 b7                	jne    805081b <__d2b+0x7b>
 8050864:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8050867:	2d 32 04 00 00       	sub    $0x432,%eax
 805086c:	89 01                	mov    %eax,(%ecx)
 805086e:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
 8050872:	c1 e7 05             	shl    $0x5,%edi
 8050875:	89 04 24             	mov    %eax,(%esp)
 8050878:	e8 b3 f6 ff ff       	call   804ff30 <__hi0bits>
 805087d:	29 c7                	sub    %eax,%edi
 805087f:	8b 45 18             	mov    0x18(%ebp),%eax
 8050882:	89 38                	mov    %edi,(%eax)
 8050884:	83 c4 2c             	add    $0x2c,%esp
 8050887:	89 f0                	mov    %esi,%eax
 8050889:	5b                   	pop    %ebx
 805088a:	5e                   	pop    %esi
 805088b:	5f                   	pop    %edi
 805088c:	5d                   	pop    %ebp
 805088d:	c3                   	ret    
 805088e:	66 90                	xchg   %ax,%ax
 8050890:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050893:	b9 20 00 00 00       	mov    $0x20,%ecx
 8050898:	29 c1                	sub    %eax,%ecx
 805089a:	89 d7                	mov    %edx,%edi
 805089c:	d3 e7                	shl    %cl,%edi
 805089e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 80508a1:	09 f9                	or     %edi,%ecx
 80508a3:	89 4e 14             	mov    %ecx,0x14(%esi)
 80508a6:	89 c1                	mov    %eax,%ecx
 80508a8:	d3 ea                	shr    %cl,%edx
 80508aa:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 80508ad:	e9 57 ff ff ff       	jmp    8050809 <__d2b+0x69>
 80508b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80508b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080508c0 <__ratio>:
 80508c0:	55                   	push   %ebp
 80508c1:	89 e5                	mov    %esp,%ebp
 80508c3:	56                   	push   %esi
 80508c4:	53                   	push   %ebx
 80508c5:	83 ec 30             	sub    $0x30,%esp
 80508c8:	8b 75 08             	mov    0x8(%ebp),%esi
 80508cb:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80508ce:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80508d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80508d5:	89 34 24             	mov    %esi,(%esp)
 80508d8:	e8 c3 fd ff ff       	call   80506a0 <__b2d>
 80508dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 80508e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80508e4:	89 1c 24             	mov    %ebx,(%esp)
 80508e7:	dd 55 e0             	fstl   -0x20(%ebp)
 80508ea:	dd 5d d8             	fstpl  -0x28(%ebp)
 80508ed:	e8 ae fd ff ff       	call   80506a0 <__b2d>
 80508f2:	8b 46 10             	mov    0x10(%esi),%eax
 80508f5:	2b 43 10             	sub    0x10(%ebx),%eax
 80508f8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80508fb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 80508fe:	c1 e0 05             	shl    $0x5,%eax
 8050901:	01 d0                	add    %edx,%eax
 8050903:	dd 55 d0             	fstl   -0x30(%ebp)
 8050906:	85 c0                	test   %eax,%eax
 8050908:	dd 45 d8             	fldl   -0x28(%ebp)
 805090b:	7e 1b                	jle    8050928 <__ratio+0x68>
 805090d:	dd d8                	fstp   %st(0)
 805090f:	c1 e0 14             	shl    $0x14,%eax
 8050912:	01 45 e4             	add    %eax,-0x1c(%ebp)
 8050915:	dd 45 e0             	fldl   -0x20(%ebp)
 8050918:	83 c4 30             	add    $0x30,%esp
 805091b:	5b                   	pop    %ebx
 805091c:	de f1                	fdivp  %st,%st(1)
 805091e:	5e                   	pop    %esi
 805091f:	5d                   	pop    %ebp
 8050920:	c3                   	ret    
 8050921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050928:	dd d9                	fstp   %st(1)
 805092a:	c1 e0 14             	shl    $0x14,%eax
 805092d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
 8050930:	dd 45 d0             	fldl   -0x30(%ebp)
 8050933:	83 c4 30             	add    $0x30,%esp
 8050936:	5b                   	pop    %ebx
 8050937:	de f9                	fdivrp %st,%st(1)
 8050939:	5e                   	pop    %esi
 805093a:	5d                   	pop    %ebp
 805093b:	c3                   	ret    
 805093c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050940 <_mprec_log10>:
 8050940:	55                   	push   %ebp
 8050941:	89 e5                	mov    %esp,%ebp
 8050943:	8b 45 08             	mov    0x8(%ebp),%eax
 8050946:	83 f8 17             	cmp    $0x17,%eax
 8050949:	7e 1d                	jle    8050968 <_mprec_log10+0x28>
 805094b:	d9 e8                	fld1   
 805094d:	d9 05 88 49 05 08    	flds   0x8054988
 8050953:	90                   	nop
 8050954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050958:	83 e8 01             	sub    $0x1,%eax
 805095b:	dc c9                	fmul   %st,%st(1)
 805095d:	75 f9                	jne    8050958 <_mprec_log10+0x18>
 805095f:	dd d8                	fstp   %st(0)
 8050961:	5d                   	pop    %ebp
 8050962:	c3                   	ret    
 8050963:	90                   	nop
 8050964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050968:	dd 04 c5 60 4a 05 08 	fldl   0x8054a60(,%eax,8)
 805096f:	5d                   	pop    %ebp
 8050970:	c3                   	ret    
 8050971:	eb 0d                	jmp    8050980 <__copybits>
 8050973:	90                   	nop
 8050974:	90                   	nop
 8050975:	90                   	nop
 8050976:	90                   	nop
 8050977:	90                   	nop
 8050978:	90                   	nop
 8050979:	90                   	nop
 805097a:	90                   	nop
 805097b:	90                   	nop
 805097c:	90                   	nop
 805097d:	90                   	nop
 805097e:	90                   	nop
 805097f:	90                   	nop

08050980 <__copybits>:
 8050980:	55                   	push   %ebp
 8050981:	89 e5                	mov    %esp,%ebp
 8050983:	57                   	push   %edi
 8050984:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050987:	56                   	push   %esi
 8050988:	8b 75 0c             	mov    0xc(%ebp),%esi
 805098b:	8b 45 08             	mov    0x8(%ebp),%eax
 805098e:	53                   	push   %ebx
 805098f:	8b 4f 10             	mov    0x10(%edi),%ecx
 8050992:	8d 56 ff             	lea    -0x1(%esi),%edx
 8050995:	c1 fa 05             	sar    $0x5,%edx
 8050998:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
 805099c:	8d 57 14             	lea    0x14(%edi),%edx
 805099f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
 80509a2:	39 da                	cmp    %ebx,%edx
 80509a4:	73 34                	jae    80509da <__copybits+0x5a>
 80509a6:	89 c1                	mov    %eax,%ecx
 80509a8:	83 c2 04             	add    $0x4,%edx
 80509ab:	8b 42 fc             	mov    -0x4(%edx),%eax
 80509ae:	83 c1 04             	add    $0x4,%ecx
 80509b1:	39 d3                	cmp    %edx,%ebx
 80509b3:	89 41 fc             	mov    %eax,-0x4(%ecx)
 80509b6:	77 f0                	ja     80509a8 <__copybits+0x28>
 80509b8:	8b 45 08             	mov    0x8(%ebp),%eax
 80509bb:	29 fb                	sub    %edi,%ebx
 80509bd:	8d 53 eb             	lea    -0x15(%ebx),%edx
 80509c0:	c1 ea 02             	shr    $0x2,%edx
 80509c3:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
 80509c7:	39 c6                	cmp    %eax,%esi
 80509c9:	76 13                	jbe    80509de <__copybits+0x5e>
 80509cb:	90                   	nop
 80509cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80509d0:	83 c0 04             	add    $0x4,%eax
 80509d3:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
 80509da:	39 c6                	cmp    %eax,%esi
 80509dc:	77 f2                	ja     80509d0 <__copybits+0x50>
 80509de:	5b                   	pop    %ebx
 80509df:	5e                   	pop    %esi
 80509e0:	5f                   	pop    %edi
 80509e1:	5d                   	pop    %ebp
 80509e2:	c3                   	ret    
 80509e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80509e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080509f0 <__any_on>:
 80509f0:	55                   	push   %ebp
 80509f1:	89 e5                	mov    %esp,%ebp
 80509f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80509f6:	57                   	push   %edi
 80509f7:	56                   	push   %esi
 80509f8:	53                   	push   %ebx
 80509f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80509fc:	8d 50 14             	lea    0x14(%eax),%edx
 80509ff:	8b 40 10             	mov    0x10(%eax),%eax
 8050a02:	c1 fb 05             	sar    $0x5,%ebx
 8050a05:	39 d8                	cmp    %ebx,%eax
 8050a07:	7d 2f                	jge    8050a38 <__any_on+0x48>
 8050a09:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
 8050a0c:	39 da                	cmp    %ebx,%edx
 8050a0e:	73 1d                	jae    8050a2d <__any_on+0x3d>
 8050a10:	8d 43 fc             	lea    -0x4(%ebx),%eax
 8050a13:	8b 5b fc             	mov    -0x4(%ebx),%ebx
 8050a16:	85 db                	test   %ebx,%ebx
 8050a18:	74 0f                	je     8050a29 <__any_on+0x39>
 8050a1a:	eb 44                	jmp    8050a60 <__any_on+0x70>
 8050a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050a20:	83 e8 04             	sub    $0x4,%eax
 8050a23:	8b 08                	mov    (%eax),%ecx
 8050a25:	85 c9                	test   %ecx,%ecx
 8050a27:	75 37                	jne    8050a60 <__any_on+0x70>
 8050a29:	39 c2                	cmp    %eax,%edx
 8050a2b:	72 f3                	jb     8050a20 <__any_on+0x30>
 8050a2d:	31 c0                	xor    %eax,%eax
 8050a2f:	5b                   	pop    %ebx
 8050a30:	5e                   	pop    %esi
 8050a31:	5f                   	pop    %edi
 8050a32:	5d                   	pop    %ebp
 8050a33:	c3                   	ret    
 8050a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050a38:	7e 1e                	jle    8050a58 <__any_on+0x68>
 8050a3a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8050a3d:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
 8050a40:	83 e1 1f             	and    $0x1f,%ecx
 8050a43:	74 c7                	je     8050a0c <__any_on+0x1c>
 8050a45:	8b 3b                	mov    (%ebx),%edi
 8050a47:	b8 01 00 00 00       	mov    $0x1,%eax
 8050a4c:	89 fe                	mov    %edi,%esi
 8050a4e:	d3 ee                	shr    %cl,%esi
 8050a50:	d3 e6                	shl    %cl,%esi
 8050a52:	39 fe                	cmp    %edi,%esi
 8050a54:	75 d9                	jne    8050a2f <__any_on+0x3f>
 8050a56:	eb b4                	jmp    8050a0c <__any_on+0x1c>
 8050a58:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
 8050a5b:	eb af                	jmp    8050a0c <__any_on+0x1c>
 8050a5d:	8d 76 00             	lea    0x0(%esi),%esi
 8050a60:	5b                   	pop    %ebx
 8050a61:	b8 01 00 00 00       	mov    $0x1,%eax
 8050a66:	5e                   	pop    %esi
 8050a67:	5f                   	pop    %edi
 8050a68:	5d                   	pop    %ebp
 8050a69:	c3                   	ret    
 8050a6a:	66 90                	xchg   %ax,%ax
 8050a6c:	66 90                	xchg   %ax,%ax
 8050a6e:	66 90                	xchg   %ax,%ax

08050a70 <_sbrk_r>:
 8050a70:	55                   	push   %ebp
 8050a71:	89 e5                	mov    %esp,%ebp
 8050a73:	83 ec 18             	sub    $0x18,%esp
 8050a76:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050a79:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 8050a80:	00 00 00 
 8050a83:	89 04 24             	mov    %eax,(%esp)
 8050a86:	e8 75 79 ff ff       	call   8048400 <sbrk>
 8050a8b:	83 f8 ff             	cmp    $0xffffffff,%eax
 8050a8e:	74 08                	je     8050a98 <_sbrk_r+0x28>
 8050a90:	c9                   	leave  
 8050a91:	c3                   	ret    
 8050a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050a98:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 8050a9e:	85 d2                	test   %edx,%edx
 8050aa0:	74 ee                	je     8050a90 <_sbrk_r+0x20>
 8050aa2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8050aa5:	89 11                	mov    %edx,(%ecx)
 8050aa7:	c9                   	leave  
 8050aa8:	c3                   	ret    
 8050aa9:	66 90                	xchg   %ax,%ax
 8050aab:	66 90                	xchg   %ax,%ax
 8050aad:	66 90                	xchg   %ax,%ax
 8050aaf:	90                   	nop

08050ab0 <__fpclassifyd>:
 8050ab0:	55                   	push   %ebp
 8050ab1:	b8 02 00 00 00       	mov    $0x2,%eax
 8050ab6:	89 e5                	mov    %esp,%ebp
 8050ab8:	53                   	push   %ebx
 8050ab9:	83 ec 0c             	sub    $0xc,%esp
 8050abc:	dd 45 08             	fldl   0x8(%ebp)
 8050abf:	dd 5d f0             	fstpl  -0x10(%ebp)
 8050ac2:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8050ac5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8050ac8:	89 d3                	mov    %edx,%ebx
 8050aca:	09 cb                	or     %ecx,%ebx
 8050acc:	75 0a                	jne    8050ad8 <__fpclassifyd+0x28>
 8050ace:	83 c4 0c             	add    $0xc,%esp
 8050ad1:	5b                   	pop    %ebx
 8050ad2:	5d                   	pop    %ebp
 8050ad3:	c3                   	ret    
 8050ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050ad8:	85 d2                	test   %edx,%edx
 8050ada:	0f 94 c2             	sete   %dl
 8050add:	75 08                	jne    8050ae7 <__fpclassifyd+0x37>
 8050adf:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
 8050ae5:	74 e7                	je     8050ace <__fpclassifyd+0x1e>
 8050ae7:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
 8050aed:	b8 04 00 00 00       	mov    $0x4,%eax
 8050af2:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
 8050af8:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
 8050afe:	76 ce                	jbe    8050ace <__fpclassifyd+0x1e>
 8050b00:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
 8050b06:	b0 03                	mov    $0x3,%al
 8050b08:	76 c4                	jbe    8050ace <__fpclassifyd+0x1e>
 8050b0a:	31 c0                	xor    %eax,%eax
 8050b0c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
 8050b12:	0f 94 c0             	sete   %al
 8050b15:	21 d0                	and    %edx,%eax
 8050b17:	eb b5                	jmp    8050ace <__fpclassifyd+0x1e>
 8050b19:	66 90                	xchg   %ax,%ax
 8050b1b:	66 90                	xchg   %ax,%ax
 8050b1d:	66 90                	xchg   %ax,%ax
 8050b1f:	90                   	nop

08050b20 <__sread>:
 8050b20:	55                   	push   %ebp
 8050b21:	89 e5                	mov    %esp,%ebp
 8050b23:	53                   	push   %ebx
 8050b24:	83 ec 14             	sub    $0x14,%esp
 8050b27:	8b 45 14             	mov    0x14(%ebp),%eax
 8050b2a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050b2d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8050b31:	8b 45 10             	mov    0x10(%ebp),%eax
 8050b34:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050b38:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050b40:	8b 45 08             	mov    0x8(%ebp),%eax
 8050b43:	89 04 24             	mov    %eax,(%esp)
 8050b46:	e8 75 2d 00 00       	call   80538c0 <_read_r>
 8050b4b:	85 c0                	test   %eax,%eax
 8050b4d:	78 09                	js     8050b58 <__sread+0x38>
 8050b4f:	01 43 50             	add    %eax,0x50(%ebx)
 8050b52:	83 c4 14             	add    $0x14,%esp
 8050b55:	5b                   	pop    %ebx
 8050b56:	5d                   	pop    %ebp
 8050b57:	c3                   	ret    
 8050b58:	66 81 63 0c ff ef    	andw   $0xefff,0xc(%ebx)
 8050b5e:	83 c4 14             	add    $0x14,%esp
 8050b61:	5b                   	pop    %ebx
 8050b62:	5d                   	pop    %ebp
 8050b63:	c3                   	ret    
 8050b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

08050b70 <__seofread>:
 8050b70:	55                   	push   %ebp
 8050b71:	31 c0                	xor    %eax,%eax
 8050b73:	89 e5                	mov    %esp,%ebp
 8050b75:	5d                   	pop    %ebp
 8050b76:	c3                   	ret    
 8050b77:	89 f6                	mov    %esi,%esi
 8050b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08050b80 <__swrite>:
 8050b80:	55                   	push   %ebp
 8050b81:	89 e5                	mov    %esp,%ebp
 8050b83:	57                   	push   %edi
 8050b84:	56                   	push   %esi
 8050b85:	53                   	push   %ebx
 8050b86:	83 ec 2c             	sub    $0x2c,%esp
 8050b89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050b8c:	8b 75 08             	mov    0x8(%ebp),%esi
 8050b8f:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050b92:	8b 55 14             	mov    0x14(%ebp),%edx
 8050b95:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050b99:	f6 c4 01             	test   $0x1,%ah
 8050b9c:	74 2a                	je     8050bc8 <__swrite+0x48>
 8050b9e:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8050ba5:	00 
 8050ba6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8050bad:	00 
 8050bae:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050bb2:	89 34 24             	mov    %esi,(%esp)
 8050bb5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8050bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050bbc:	e8 1f 2c 00 00       	call   80537e0 <_lseek_r>
 8050bc1:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050bc5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050bc8:	80 e4 ef             	and    $0xef,%ah
 8050bcb:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8050bcf:	89 7d 10             	mov    %edi,0x10(%ebp)
 8050bd2:	89 55 14             	mov    %edx,0x14(%ebp)
 8050bd5:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050bd9:	89 75 08             	mov    %esi,0x8(%ebp)
 8050bdc:	89 45 0c             	mov    %eax,0xc(%ebp)
 8050bdf:	83 c4 2c             	add    $0x2c,%esp
 8050be2:	5b                   	pop    %ebx
 8050be3:	5e                   	pop    %esi
 8050be4:	5f                   	pop    %edi
 8050be5:	5d                   	pop    %ebp
 8050be6:	e9 b5 22 00 00       	jmp    8052ea0 <_write_r>
 8050beb:	90                   	nop
 8050bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050bf0 <__sseek>:
 8050bf0:	55                   	push   %ebp
 8050bf1:	89 e5                	mov    %esp,%ebp
 8050bf3:	53                   	push   %ebx
 8050bf4:	83 ec 14             	sub    $0x14,%esp
 8050bf7:	8b 45 14             	mov    0x14(%ebp),%eax
 8050bfa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050bfd:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8050c01:	8b 45 10             	mov    0x10(%ebp),%eax
 8050c04:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050c08:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050c0c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050c10:	8b 45 08             	mov    0x8(%ebp),%eax
 8050c13:	89 04 24             	mov    %eax,(%esp)
 8050c16:	e8 c5 2b 00 00       	call   80537e0 <_lseek_r>
 8050c1b:	83 f8 ff             	cmp    $0xffffffff,%eax
 8050c1e:	74 10                	je     8050c30 <__sseek+0x40>
 8050c20:	66 81 4b 0c 00 10    	orw    $0x1000,0xc(%ebx)
 8050c26:	89 43 50             	mov    %eax,0x50(%ebx)
 8050c29:	83 c4 14             	add    $0x14,%esp
 8050c2c:	5b                   	pop    %ebx
 8050c2d:	5d                   	pop    %ebp
 8050c2e:	c3                   	ret    
 8050c2f:	90                   	nop
 8050c30:	66 81 63 0c ff ef    	andw   $0xefff,0xc(%ebx)
 8050c36:	83 c4 14             	add    $0x14,%esp
 8050c39:	5b                   	pop    %ebx
 8050c3a:	5d                   	pop    %ebp
 8050c3b:	c3                   	ret    
 8050c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050c40 <__sclose>:
 8050c40:	55                   	push   %ebp
 8050c41:	89 e5                	mov    %esp,%ebp
 8050c43:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050c46:	0f bf 40 0e          	movswl 0xe(%eax),%eax
 8050c4a:	89 45 0c             	mov    %eax,0xc(%ebp)
 8050c4d:	5d                   	pop    %ebp
 8050c4e:	e9 5d 23 00 00       	jmp    8052fb0 <_close_r>
 8050c53:	66 90                	xchg   %ax,%ax
 8050c55:	66 90                	xchg   %ax,%ax
 8050c57:	66 90                	xchg   %ax,%ax
 8050c59:	66 90                	xchg   %ax,%ax
 8050c5b:	66 90                	xchg   %ax,%ax
 8050c5d:	66 90                	xchg   %ax,%ax
 8050c5f:	90                   	nop

08050c60 <strcmp>:
 8050c60:	55                   	push   %ebp
 8050c61:	89 e5                	mov    %esp,%ebp
 8050c63:	8b 45 08             	mov    0x8(%ebp),%eax
 8050c66:	8b 55 0c             	mov    0xc(%ebp),%edx
 8050c69:	53                   	push   %ebx
 8050c6a:	89 c1                	mov    %eax,%ecx
 8050c6c:	09 d1                	or     %edx,%ecx
 8050c6e:	83 e1 03             	and    $0x3,%ecx
 8050c71:	75 17                	jne    8050c8a <strcmp+0x2a>
 8050c73:	8b 08                	mov    (%eax),%ecx
 8050c75:	3b 0a                	cmp    (%edx),%ecx
 8050c77:	74 33                	je     8050cac <strcmp+0x4c>
 8050c79:	eb 0f                	jmp    8050c8a <strcmp+0x2a>
 8050c7b:	90                   	nop
 8050c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050c80:	3a 0a                	cmp    (%edx),%cl
 8050c82:	75 0d                	jne    8050c91 <strcmp+0x31>
 8050c84:	83 c0 01             	add    $0x1,%eax
 8050c87:	83 c2 01             	add    $0x1,%edx
 8050c8a:	0f b6 08             	movzbl (%eax),%ecx
 8050c8d:	84 c9                	test   %cl,%cl
 8050c8f:	75 ef                	jne    8050c80 <strcmp+0x20>
 8050c91:	0f b6 00             	movzbl (%eax),%eax
 8050c94:	0f b6 12             	movzbl (%edx),%edx
 8050c97:	5b                   	pop    %ebx
 8050c98:	5d                   	pop    %ebp
 8050c99:	29 d0                	sub    %edx,%eax
 8050c9b:	c3                   	ret    
 8050c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050ca0:	83 c0 04             	add    $0x4,%eax
 8050ca3:	83 c2 04             	add    $0x4,%edx
 8050ca6:	8b 08                	mov    (%eax),%ecx
 8050ca8:	3b 0a                	cmp    (%edx),%ecx
 8050caa:	75 de                	jne    8050c8a <strcmp+0x2a>
 8050cac:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
 8050cb2:	f7 d1                	not    %ecx
 8050cb4:	21 cb                	and    %ecx,%ebx
 8050cb6:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
 8050cbc:	74 e2                	je     8050ca0 <strcmp+0x40>
 8050cbe:	31 c0                	xor    %eax,%eax
 8050cc0:	5b                   	pop    %ebx
 8050cc1:	5d                   	pop    %ebp
 8050cc2:	c3                   	ret    
 8050cc3:	66 90                	xchg   %ax,%ax
 8050cc5:	66 90                	xchg   %ax,%ax
 8050cc7:	66 90                	xchg   %ax,%ax
 8050cc9:	66 90                	xchg   %ax,%ax
 8050ccb:	66 90                	xchg   %ax,%ax
 8050ccd:	66 90                	xchg   %ax,%ax
 8050ccf:	90                   	nop

08050cd0 <__ssprint_r>:
 8050cd0:	55                   	push   %ebp
 8050cd1:	89 e5                	mov    %esp,%ebp
 8050cd3:	57                   	push   %edi
 8050cd4:	56                   	push   %esi
 8050cd5:	53                   	push   %ebx
 8050cd6:	83 ec 2c             	sub    $0x2c,%esp
 8050cd9:	8b 45 10             	mov    0x10(%ebp),%eax
 8050cdc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050cdf:	8b 00                	mov    (%eax),%eax
 8050ce1:	89 c7                	mov    %eax,%edi
 8050ce3:	8b 45 10             	mov    0x10(%ebp),%eax
 8050ce6:	8b 40 08             	mov    0x8(%eax),%eax
 8050ce9:	85 c0                	test   %eax,%eax
 8050ceb:	0f 84 af 01 00 00    	je     8050ea0 <__ssprint_r+0x1d0>
 8050cf1:	31 c9                	xor    %ecx,%ecx
 8050cf3:	31 d2                	xor    %edx,%edx
 8050cf5:	8b 03                	mov    (%ebx),%eax
 8050cf7:	89 ce                	mov    %ecx,%esi
 8050cf9:	85 f6                	test   %esi,%esi
 8050cfb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8050cfe:	0f 84 ec 00 00 00    	je     8050df0 <__ssprint_r+0x120>
 8050d04:	8b 53 08             	mov    0x8(%ebx),%edx
 8050d07:	39 d6                	cmp    %edx,%esi
 8050d09:	0f 82 fc 00 00 00    	jb     8050e0b <__ssprint_r+0x13b>
 8050d0f:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
 8050d13:	66 f7 c1 80 04       	test   $0x480,%cx
 8050d18:	0f 84 fa 00 00 00    	je     8050e18 <__ssprint_r+0x148>
 8050d1e:	8b 53 10             	mov    0x10(%ebx),%edx
 8050d21:	29 d0                	sub    %edx,%eax
 8050d23:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8050d26:	8b 43 14             	mov    0x14(%ebx),%eax
 8050d29:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8050d2c:	8d 04 40             	lea    (%eax,%eax,2),%eax
 8050d2f:	89 c2                	mov    %eax,%edx
 8050d31:	c1 ea 1f             	shr    $0x1f,%edx
 8050d34:	01 d0                	add    %edx,%eax
 8050d36:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050d39:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050d3c:	d1 7d e0             	sarl   -0x20(%ebp)
 8050d3f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
 8050d43:	39 45 e0             	cmp    %eax,-0x20(%ebp)
 8050d46:	0f 83 34 01 00 00    	jae    8050e80 <__ssprint_r+0x1b0>
 8050d4c:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050d4f:	80 e5 04             	and    $0x4,%ch
 8050d52:	0f 84 c8 00 00 00    	je     8050e20 <__ssprint_r+0x150>
 8050d58:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050d5c:	8b 45 08             	mov    0x8(%ebp),%eax
 8050d5f:	89 04 24             	mov    %eax,(%esp)
 8050d62:	e8 e9 e6 ff ff       	call   804f450 <_malloc_r>
 8050d67:	85 c0                	test   %eax,%eax
 8050d69:	89 c2                	mov    %eax,%edx
 8050d6b:	0f 84 e1 00 00 00    	je     8050e52 <__ssprint_r+0x182>
 8050d71:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050d74:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8050d77:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050d7b:	8b 43 10             	mov    0x10(%ebx),%eax
 8050d7e:	89 14 24             	mov    %edx,(%esp)
 8050d81:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050d85:	e8 9e ee ff ff       	call   804fc28 <memcpy>
 8050d8a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050d8e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8050d91:	66 25 7f fb          	and    $0xfb7f,%ax
 8050d95:	0c 80                	or     $0x80,%al
 8050d97:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8050d9b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8050d9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050da1:	89 53 10             	mov    %edx,0x10(%ebx)
 8050da4:	89 4b 14             	mov    %ecx,0x14(%ebx)
 8050da7:	2b 4d dc             	sub    -0x24(%ebp),%ecx
 8050daa:	01 d0                	add    %edx,%eax
 8050dac:	89 03                	mov    %eax,(%ebx)
 8050dae:	89 f2                	mov    %esi,%edx
 8050db0:	89 4b 08             	mov    %ecx,0x8(%ebx)
 8050db3:	89 f1                	mov    %esi,%ecx
 8050db5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8050db9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8050dbc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050dbf:	89 04 24             	mov    %eax,(%esp)
 8050dc2:	89 55 dc             	mov    %edx,-0x24(%ebp)
 8050dc5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8050dc9:	e8 62 2a 00 00       	call   8053830 <memmove>
 8050dce:	8b 03                	mov    (%ebx),%eax
 8050dd0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8050dd3:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8050dd6:	29 53 08             	sub    %edx,0x8(%ebx)
 8050dd9:	01 c8                	add    %ecx,%eax
 8050ddb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8050dde:	89 03                	mov    %eax,(%ebx)
 8050de0:	8b 51 08             	mov    0x8(%ecx),%edx
 8050de3:	29 f2                	sub    %esi,%edx
 8050de5:	85 d2                	test   %edx,%edx
 8050de7:	89 51 08             	mov    %edx,0x8(%ecx)
 8050dea:	0f 84 98 00 00 00    	je     8050e88 <__ssprint_r+0x1b8>
 8050df0:	8b 77 04             	mov    0x4(%edi),%esi
 8050df3:	83 c7 08             	add    $0x8,%edi
 8050df6:	8b 4f f8             	mov    -0x8(%edi),%ecx
 8050df9:	85 f6                	test   %esi,%esi
 8050dfb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050dfe:	74 f0                	je     8050df0 <__ssprint_r+0x120>
 8050e00:	8b 53 08             	mov    0x8(%ebx),%edx
 8050e03:	39 d6                	cmp    %edx,%esi
 8050e05:	0f 83 04 ff ff ff    	jae    8050d0f <__ssprint_r+0x3f>
 8050e0b:	89 f2                	mov    %esi,%edx
 8050e0d:	89 f1                	mov    %esi,%ecx
 8050e0f:	eb a4                	jmp    8050db5 <__ssprint_r+0xe5>
 8050e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050e18:	89 d1                	mov    %edx,%ecx
 8050e1a:	eb 99                	jmp    8050db5 <__ssprint_r+0xe5>
 8050e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050e20:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050e24:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8050e27:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050e2b:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e2e:	89 04 24             	mov    %eax,(%esp)
 8050e31:	e8 da 2a 00 00       	call   8053910 <_realloc_r>
 8050e36:	85 c0                	test   %eax,%eax
 8050e38:	89 c2                	mov    %eax,%edx
 8050e3a:	0f 85 5b ff ff ff    	jne    8050d9b <__ssprint_r+0xcb>
 8050e40:	8b 43 10             	mov    0x10(%ebx),%eax
 8050e43:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050e47:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e4a:	89 04 24             	mov    %eax,(%esp)
 8050e4d:	e8 4e e0 ff ff       	call   804eea0 <_free_r>
 8050e52:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e55:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8050e5b:	8b 45 10             	mov    0x10(%ebp),%eax
 8050e5e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 8050e63:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8050e6a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050e71:	83 c4 2c             	add    $0x2c,%esp
 8050e74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8050e79:	5b                   	pop    %ebx
 8050e7a:	5e                   	pop    %esi
 8050e7b:	5f                   	pop    %edi
 8050e7c:	5d                   	pop    %ebp
 8050e7d:	c3                   	ret    
 8050e7e:	66 90                	xchg   %ax,%ax
 8050e80:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8050e83:	e9 c7 fe ff ff       	jmp    8050d4f <__ssprint_r+0x7f>
 8050e88:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
 8050e8f:	83 c4 2c             	add    $0x2c,%esp
 8050e92:	31 c0                	xor    %eax,%eax
 8050e94:	5b                   	pop    %ebx
 8050e95:	5e                   	pop    %esi
 8050e96:	5f                   	pop    %edi
 8050e97:	5d                   	pop    %ebp
 8050e98:	c3                   	ret    
 8050e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050ea0:	8b 45 10             	mov    0x10(%ebp),%eax
 8050ea3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050eaa:	83 c4 2c             	add    $0x2c,%esp
 8050ead:	31 c0                	xor    %eax,%eax
 8050eaf:	5b                   	pop    %ebx
 8050eb0:	5e                   	pop    %esi
 8050eb1:	5f                   	pop    %edi
 8050eb2:	5d                   	pop    %ebp
 8050eb3:	c3                   	ret    
 8050eb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050eba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

08050ec0 <_svfiprintf_r>:
 8050ec0:	55                   	push   %ebp
 8050ec1:	89 e5                	mov    %esp,%ebp
 8050ec3:	57                   	push   %edi
 8050ec4:	56                   	push   %esi
 8050ec5:	53                   	push   %ebx
 8050ec6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
 8050ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050ecf:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
 8050ed3:	74 0b                	je     8050ee0 <_svfiprintf_r+0x20>
 8050ed5:	8b 50 10             	mov    0x10(%eax),%edx
 8050ed8:	85 d2                	test   %edx,%edx
 8050eda:	0f 84 1c 0d 00 00    	je     8051bfc <_svfiprintf_r+0xd3c>
 8050ee0:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8050ee3:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 8050ee6:	89 c6                	mov    %eax,%esi
 8050ee8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8050eee:	29 d8                	sub    %ebx,%eax
 8050ef0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 8050ef7:	00 00 00 
 8050efa:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8050f01:	00 00 00 
 8050f04:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8050f0b:	00 00 00 
 8050f0e:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
 8050f15:	00 00 00 
 8050f18:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
 8050f1e:	8b 45 10             	mov    0x10(%ebp),%eax
 8050f21:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8050f24:	0f b6 00             	movzbl (%eax),%eax
 8050f27:	84 c0                	test   %al,%al
 8050f29:	74 58                	je     8050f83 <_svfiprintf_r+0xc3>
 8050f2b:	3c 25                	cmp    $0x25,%al
 8050f2d:	75 13                	jne    8050f42 <_svfiprintf_r+0x82>
 8050f2f:	eb 52                	jmp    8050f83 <_svfiprintf_r+0xc3>
 8050f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050f38:	84 c0                	test   %al,%al
 8050f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050f40:	74 0a                	je     8050f4c <_svfiprintf_r+0x8c>
 8050f42:	83 c3 01             	add    $0x1,%ebx
 8050f45:	0f b6 03             	movzbl (%ebx),%eax
 8050f48:	3c 25                	cmp    $0x25,%al
 8050f4a:	75 ec                	jne    8050f38 <_svfiprintf_r+0x78>
 8050f4c:	89 df                	mov    %ebx,%edi
 8050f4e:	2b 7d 10             	sub    0x10(%ebp),%edi
 8050f51:	74 30                	je     8050f83 <_svfiprintf_r+0xc3>
 8050f53:	8b 45 10             	mov    0x10(%ebp),%eax
 8050f56:	83 c6 08             	add    $0x8,%esi
 8050f59:	89 7e fc             	mov    %edi,-0x4(%esi)
 8050f5c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
 8050f62:	89 46 f8             	mov    %eax,-0x8(%esi)
 8050f65:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8050f6b:	83 c0 01             	add    $0x1,%eax
 8050f6e:	83 f8 07             	cmp    $0x7,%eax
 8050f71:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8050f77:	0f 8f eb 0a 00 00    	jg     8051a68 <_svfiprintf_r+0xba8>
 8050f7d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
 8050f83:	80 3b 00             	cmpb   $0x0,(%ebx)
 8050f86:	0f 84 11 09 00 00    	je     805189d <_svfiprintf_r+0x9dd>
 8050f8c:	8d 43 01             	lea    0x1(%ebx),%eax
 8050f8f:	31 ff                	xor    %edi,%edi
 8050f91:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8050f98:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8050f9f:	ff ff ff 
 8050fa2:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
 8050fa9:	00 00 00 
 8050fac:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
 8050fb3:	00 00 00 
 8050fb6:	8d 50 01             	lea    0x1(%eax),%edx
 8050fb9:	0f be 00             	movsbl (%eax),%eax
 8050fbc:	8d 48 e0             	lea    -0x20(%eax),%ecx
 8050fbf:	83 f9 58             	cmp    $0x58,%ecx
 8050fc2:	0f 87 63 03 00 00    	ja     805132b <_svfiprintf_r+0x46b>
 8050fc8:	ff 24 8d 28 4b 05 08 	jmp    *0x8054b28(,%ecx,4)
 8050fcf:	90                   	nop
 8050fd0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8050fd7:	89 d0                	mov    %edx,%eax
 8050fd9:	eb db                	jmp    8050fb6 <_svfiprintf_r+0xf6>
 8050fdb:	8b 45 14             	mov    0x14(%ebp),%eax
 8050fde:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8050fe1:	8b 00                	mov    (%eax),%eax
 8050fe3:	83 c3 04             	add    $0x4,%ebx
 8050fe6:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8050fe9:	85 c0                	test   %eax,%eax
 8050feb:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
 8050ff1:	79 e4                	jns    8050fd7 <_svfiprintf_r+0x117>
 8050ff3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
 8050ff9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
 8051000:	89 d0                	mov    %edx,%eax
 8051002:	eb b2                	jmp    8050fb6 <_svfiprintf_r+0xf6>
 8051004:	bf 2b 00 00 00       	mov    $0x2b,%edi
 8051009:	89 d0                	mov    %edx,%eax
 805100b:	eb a9                	jmp    8050fb6 <_svfiprintf_r+0xf6>
 805100d:	8b 45 14             	mov    0x14(%ebp),%eax
 8051010:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 8051017:	89 55 10             	mov    %edx,0x10(%ebp)
 805101a:	ba 02 00 00 00       	mov    $0x2,%edx
 805101f:	8b 08                	mov    (%eax),%ecx
 8051021:	83 c0 04             	add    $0x4,%eax
 8051024:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805102b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
 8051032:	89 45 14             	mov    %eax,0x14(%ebp)
 8051035:	c7 85 44 ff ff ff 4d 	movl   $0x805464d,-0xbc(%ebp)
 805103c:	46 05 08 
 805103f:	90                   	nop
 8051040:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051047:	31 ff                	xor    %edi,%edi
 8051049:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
 805104f:	89 d8                	mov    %ebx,%eax
 8051051:	24 7f                	and    $0x7f,%al
 8051053:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
 805105a:	0f 48 c3             	cmovs  %ebx,%eax
 805105d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
 8051063:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8051069:	85 c0                	test   %eax,%eax
 805106b:	75 08                	jne    8051075 <_svfiprintf_r+0x1b5>
 805106d:	85 c9                	test   %ecx,%ecx
 805106f:	0f 84 03 08 00 00    	je     8051878 <_svfiprintf_r+0x9b8>
 8051075:	80 fa 01             	cmp    $0x1,%dl
 8051078:	0f 84 8a 0a 00 00    	je     8051b08 <_svfiprintf_r+0xc48>
 805107e:	80 fa 02             	cmp    $0x2,%dl
 8051081:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 8051084:	0f 85 86 01 00 00    	jne    8051210 <_svfiprintf_r+0x350>
 805108a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 8051090:	89 c8                	mov    %ecx,%eax
 8051092:	83 eb 01             	sub    $0x1,%ebx
 8051095:	83 e0 0f             	and    $0xf,%eax
 8051098:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
 805109c:	c1 e9 04             	shr    $0x4,%ecx
 805109f:	85 c9                	test   %ecx,%ecx
 80510a1:	88 03                	mov    %al,(%ebx)
 80510a3:	75 eb                	jne    8051090 <_svfiprintf_r+0x1d0>
 80510a5:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80510a8:	29 d8                	sub    %ebx,%eax
 80510aa:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 80510b0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 80510b6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
 80510bc:	39 c1                	cmp    %eax,%ecx
 80510be:	0f 4d c1             	cmovge %ecx,%eax
 80510c1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80510c7:	89 f8                	mov    %edi,%eax
 80510c9:	3c 01                	cmp    $0x1,%al
 80510cb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
 80510d2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 80510d8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
 80510de:	89 d0                	mov    %edx,%eax
 80510e0:	89 cf                	mov    %ecx,%edi
 80510e2:	83 c0 02             	add    $0x2,%eax
 80510e5:	83 e7 02             	and    $0x2,%edi
 80510e8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
 80510ee:	89 cf                	mov    %ecx,%edi
 80510f0:	0f 44 c2             	cmove  %edx,%eax
 80510f3:	81 e7 84 00 00 00    	and    $0x84,%edi
 80510f9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80510ff:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 8051105:	0f 85 cd 04 00 00    	jne    80515d8 <_svfiprintf_r+0x718>
 805110b:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 8051111:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 8051117:	85 ff                	test   %edi,%edi
 8051119:	0f 8e b9 04 00 00    	jle    80515d8 <_svfiprintf_r+0x718>
 805111f:	83 ff 10             	cmp    $0x10,%edi
 8051122:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051128:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805112e:	7e 7c                	jle    80511ac <_svfiprintf_r+0x2ec>
 8051130:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
 8051136:	89 f1                	mov    %esi,%ecx
 8051138:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805113b:	8b 75 0c             	mov    0xc(%ebp),%esi
 805113e:	eb 08                	jmp    8051148 <_svfiprintf_r+0x288>
 8051140:	83 ef 10             	sub    $0x10,%edi
 8051143:	83 ff 10             	cmp    $0x10,%edi
 8051146:	7e 5c                	jle    80511a4 <_svfiprintf_r+0x2e4>
 8051148:	83 c0 01             	add    $0x1,%eax
 805114b:	83 c2 10             	add    $0x10,%edx
 805114e:	c7 01 9c 4c 05 08    	movl   $0x8054c9c,(%ecx)
 8051154:	83 c1 08             	add    $0x8,%ecx
 8051157:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 805115e:	83 f8 07             	cmp    $0x7,%eax
 8051161:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051167:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805116d:	7e d1                	jle    8051140 <_svfiprintf_r+0x280>
 805116f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051175:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051179:	89 74 24 04          	mov    %esi,0x4(%esp)
 805117d:	89 1c 24             	mov    %ebx,(%esp)
 8051180:	e8 4b fb ff ff       	call   8050cd0 <__ssprint_r>
 8051185:	85 c0                	test   %eax,%eax
 8051187:	0f 85 3b 07 00 00    	jne    80518c8 <_svfiprintf_r+0xa08>
 805118d:	83 ef 10             	sub    $0x10,%edi
 8051190:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051196:	83 ff 10             	cmp    $0x10,%edi
 8051199:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805119f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 80511a2:	7f a4                	jg     8051148 <_svfiprintf_r+0x288>
 80511a4:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
 80511aa:	89 ce                	mov    %ecx,%esi
 80511ac:	83 c0 01             	add    $0x1,%eax
 80511af:	01 fa                	add    %edi,%edx
 80511b1:	c7 06 9c 4c 05 08    	movl   $0x8054c9c,(%esi)
 80511b7:	83 c6 08             	add    $0x8,%esi
 80511ba:	89 7e fc             	mov    %edi,-0x4(%esi)
 80511bd:	83 f8 07             	cmp    $0x7,%eax
 80511c0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80511c6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80511cc:	0f 8e 12 04 00 00    	jle    80515e4 <_svfiprintf_r+0x724>
 80511d2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80511d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80511dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80511df:	89 44 24 04          	mov    %eax,0x4(%esp)
 80511e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80511e6:	89 04 24             	mov    %eax,(%esp)
 80511e9:	e8 e2 fa ff ff       	call   8050cd0 <__ssprint_r>
 80511ee:	85 c0                	test   %eax,%eax
 80511f0:	0f 85 d2 06 00 00    	jne    80518c8 <_svfiprintf_r+0xa08>
 80511f6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80511fc:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80511ff:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051205:	e9 da 03 00 00       	jmp    80515e4 <_svfiprintf_r+0x724>
 805120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051210:	89 c8                	mov    %ecx,%eax
 8051212:	83 eb 01             	sub    $0x1,%ebx
 8051215:	83 e0 07             	and    $0x7,%eax
 8051218:	c1 e9 03             	shr    $0x3,%ecx
 805121b:	83 c0 30             	add    $0x30,%eax
 805121e:	85 c9                	test   %ecx,%ecx
 8051220:	88 03                	mov    %al,(%ebx)
 8051222:	75 ec                	jne    8051210 <_svfiprintf_r+0x350>
 8051224:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 805122b:	89 da                	mov    %ebx,%edx
 805122d:	0f 84 72 fe ff ff    	je     80510a5 <_svfiprintf_r+0x1e5>
 8051233:	3c 30                	cmp    $0x30,%al
 8051235:	0f 84 6a fe ff ff    	je     80510a5 <_svfiprintf_r+0x1e5>
 805123b:	83 eb 01             	sub    $0x1,%ebx
 805123e:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8051241:	29 d8                	sub    %ebx,%eax
 8051243:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 8051247:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 805124d:	e9 5e fe ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 8051252:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051259:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051260:	89 55 10             	mov    %edx,0x10(%ebp)
 8051263:	8b 45 14             	mov    0x14(%ebp),%eax
 8051266:	0f 85 48 01 00 00    	jne    80513b4 <_svfiprintf_r+0x4f4>
 805126c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8051273:	0f 84 3b 01 00 00    	je     80513b4 <_svfiprintf_r+0x4f4>
 8051279:	0f b7 08             	movzwl (%eax),%ecx
 805127c:	83 c0 04             	add    $0x4,%eax
 805127f:	31 d2                	xor    %edx,%edx
 8051281:	89 45 14             	mov    %eax,0x14(%ebp)
 8051284:	e9 b7 fd ff ff       	jmp    8051040 <_svfiprintf_r+0x180>
 8051289:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051290:	89 f8                	mov    %edi,%eax
 8051292:	89 55 10             	mov    %edx,0x10(%ebp)
 8051295:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 805129b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80512a2:	8b 45 14             	mov    0x14(%ebp),%eax
 80512a5:	75 0d                	jne    80512b4 <_svfiprintf_r+0x3f4>
 80512a7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80512ae:	0f 85 f2 08 00 00    	jne    8051ba6 <_svfiprintf_r+0xce6>
 80512b4:	8b 08                	mov    (%eax),%ecx
 80512b6:	83 c0 04             	add    $0x4,%eax
 80512b9:	89 45 14             	mov    %eax,0x14(%ebp)
 80512bc:	85 c9                	test   %ecx,%ecx
 80512be:	0f 88 f3 08 00 00    	js     8051bb7 <_svfiprintf_r+0xcf7>
 80512c4:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 80512cb:	ba 01 00 00 00       	mov    $0x1,%edx
 80512d0:	e9 74 fd ff ff       	jmp    8051049 <_svfiprintf_r+0x189>
 80512d5:	0f be 02             	movsbl (%edx),%eax
 80512d8:	8d 5a 01             	lea    0x1(%edx),%ebx
 80512db:	83 f8 2a             	cmp    $0x2a,%eax
 80512de:	0f 84 af 09 00 00    	je     8051c93 <_svfiprintf_r+0xdd3>
 80512e4:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80512e7:	31 d2                	xor    %edx,%edx
 80512e9:	83 f9 09             	cmp    $0x9,%ecx
 80512ec:	0f 87 90 09 00 00    	ja     8051c82 <_svfiprintf_r+0xdc2>
 80512f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80512f8:	8d 04 92             	lea    (%edx,%edx,4),%eax
 80512fb:	83 c3 01             	add    $0x1,%ebx
 80512fe:	8d 14 41             	lea    (%ecx,%eax,2),%edx
 8051301:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
 8051305:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8051308:	83 f9 09             	cmp    $0x9,%ecx
 805130b:	76 eb                	jbe    80512f8 <_svfiprintf_r+0x438>
 805130d:	85 d2                	test   %edx,%edx
 805130f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8051314:	0f 48 d1             	cmovs  %ecx,%edx
 8051317:	8d 48 e0             	lea    -0x20(%eax),%ecx
 805131a:	83 f9 58             	cmp    $0x58,%ecx
 805131d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
 8051323:	89 da                	mov    %ebx,%edx
 8051325:	0f 86 9d fc ff ff    	jbe    8050fc8 <_svfiprintf_r+0x108>
 805132b:	89 fb                	mov    %edi,%ebx
 805132d:	85 c0                	test   %eax,%eax
 805132f:	89 55 10             	mov    %edx,0x10(%ebp)
 8051332:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 8051338:	0f 84 5f 05 00 00    	je     805189d <_svfiprintf_r+0x9dd>
 805133e:	88 45 80             	mov    %al,-0x80(%ebp)
 8051341:	8d 5d 80             	lea    -0x80(%ebp),%ebx
 8051344:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805134b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 8051352:	00 00 00 
 8051355:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 805135c:	00 00 00 
 805135f:	e9 5a 01 00 00       	jmp    80514be <_svfiprintf_r+0x5fe>
 8051364:	31 db                	xor    %ebx,%ebx
 8051366:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8051369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051370:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
 8051373:	83 c2 01             	add    $0x1,%edx
 8051376:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
 8051379:	0f be 42 ff          	movsbl -0x1(%edx),%eax
 805137d:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8051380:	83 f9 09             	cmp    $0x9,%ecx
 8051383:	76 eb                	jbe    8051370 <_svfiprintf_r+0x4b0>
 8051385:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
 805138b:	e9 2c fc ff ff       	jmp    8050fbc <_svfiprintf_r+0xfc>
 8051390:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
 8051397:	00 00 00 
 805139a:	89 d0                	mov    %edx,%eax
 805139c:	e9 15 fc ff ff       	jmp    8050fb6 <_svfiprintf_r+0xf6>
 80513a1:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80513a8:	89 55 10             	mov    %edx,0x10(%ebp)
 80513ab:	8b 45 14             	mov    0x14(%ebp),%eax
 80513ae:	0f 84 b8 fe ff ff    	je     805126c <_svfiprintf_r+0x3ac>
 80513b4:	8b 08                	mov    (%eax),%ecx
 80513b6:	83 c0 04             	add    $0x4,%eax
 80513b9:	31 d2                	xor    %edx,%edx
 80513bb:	89 45 14             	mov    %eax,0x14(%ebp)
 80513be:	e9 7d fc ff ff       	jmp    8051040 <_svfiprintf_r+0x180>
 80513c3:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80513ca:	89 f8                	mov    %edi,%eax
 80513cc:	89 55 10             	mov    %edx,0x10(%ebp)
 80513cf:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80513d5:	0f 85 a2 07 00 00    	jne    8051b7d <_svfiprintf_r+0xcbd>
 80513db:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80513e2:	0f 84 95 07 00 00    	je     8051b7d <_svfiprintf_r+0xcbd>
 80513e8:	8b 45 14             	mov    0x14(%ebp),%eax
 80513eb:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
 80513f2:	8b 00                	mov    (%eax),%eax
 80513f4:	66 89 18             	mov    %bx,(%eax)
 80513f7:	8b 45 14             	mov    0x14(%ebp),%eax
 80513fa:	83 c0 04             	add    $0x4,%eax
 80513fd:	89 45 14             	mov    %eax,0x14(%ebp)
 8051400:	e9 19 fb ff ff       	jmp    8050f1e <_svfiprintf_r+0x5e>
 8051405:	89 fb                	mov    %edi,%ebx
 8051407:	89 55 10             	mov    %edx,0x10(%ebp)
 805140a:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 8051410:	c7 85 44 ff ff ff 4d 	movl   $0x805464d,-0xbc(%ebp)
 8051417:	46 05 08 
 805141a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051421:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051424:	75 0d                	jne    8051433 <_svfiprintf_r+0x573>
 8051426:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 805142d:	0f 85 65 07 00 00    	jne    8051b98 <_svfiprintf_r+0xcd8>
 8051433:	8b 0b                	mov    (%ebx),%ecx
 8051435:	83 c3 04             	add    $0x4,%ebx
 8051438:	89 5d 14             	mov    %ebx,0x14(%ebp)
 805143b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8051442:	ba 02 00 00 00       	mov    $0x2,%edx
 8051447:	0f 84 f3 fb ff ff    	je     8051040 <_svfiprintf_r+0x180>
 805144d:	85 c9                	test   %ecx,%ecx
 805144f:	0f 84 eb fb ff ff    	je     8051040 <_svfiprintf_r+0x180>
 8051455:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805145c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
 8051462:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 8051469:	e9 d2 fb ff ff       	jmp    8051040 <_svfiprintf_r+0x180>
 805146e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
 8051475:	89 d0                	mov    %edx,%eax
 8051477:	e9 3a fb ff ff       	jmp    8050fb6 <_svfiprintf_r+0xf6>
 805147c:	89 f8                	mov    %edi,%eax
 805147e:	89 55 10             	mov    %edx,0x10(%ebp)
 8051481:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 8051487:	e9 0f fe ff ff       	jmp    805129b <_svfiprintf_r+0x3db>
 805148c:	8b 45 14             	mov    0x14(%ebp),%eax
 805148f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
 8051492:	89 55 10             	mov    %edx,0x10(%ebp)
 8051495:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805149c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 80514a3:	00 00 00 
 80514a6:	8b 00                	mov    (%eax),%eax
 80514a8:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 80514af:	00 00 00 
 80514b2:	88 45 80             	mov    %al,-0x80(%ebp)
 80514b5:	8b 45 14             	mov    0x14(%ebp),%eax
 80514b8:	83 c0 04             	add    $0x4,%eax
 80514bb:	89 45 14             	mov    %eax,0x14(%ebp)
 80514be:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 80514c5:	00 00 00 
 80514c8:	e9 05 fc ff ff       	jmp    80510d2 <_svfiprintf_r+0x212>
 80514cd:	89 fb                	mov    %edi,%ebx
 80514cf:	89 55 10             	mov    %edx,0x10(%ebp)
 80514d2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 80514d8:	c7 85 44 ff ff ff 3c 	movl   $0x805463c,-0xbc(%ebp)
 80514df:	46 05 08 
 80514e2:	e9 33 ff ff ff       	jmp    805141a <_svfiprintf_r+0x55a>
 80514e7:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 80514ee:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80514f5:	89 55 10             	mov    %edx,0x10(%ebp)
 80514f8:	8b 45 14             	mov    0x14(%ebp),%eax
 80514fb:	75 39                	jne    8051536 <_svfiprintf_r+0x676>
 80514fd:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8051504:	74 30                	je     8051536 <_svfiprintf_r+0x676>
 8051506:	0f b7 08             	movzwl (%eax),%ecx
 8051509:	83 c0 04             	add    $0x4,%eax
 805150c:	ba 01 00 00 00       	mov    $0x1,%edx
 8051511:	89 45 14             	mov    %eax,0x14(%ebp)
 8051514:	e9 27 fb ff ff       	jmp    8051040 <_svfiprintf_r+0x180>
 8051519:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
 8051520:	89 d0                	mov    %edx,%eax
 8051522:	e9 8f fa ff ff       	jmp    8050fb6 <_svfiprintf_r+0xf6>
 8051527:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 805152e:	89 55 10             	mov    %edx,0x10(%ebp)
 8051531:	8b 45 14             	mov    0x14(%ebp),%eax
 8051534:	74 c7                	je     80514fd <_svfiprintf_r+0x63d>
 8051536:	8b 08                	mov    (%eax),%ecx
 8051538:	83 c0 04             	add    $0x4,%eax
 805153b:	ba 01 00 00 00       	mov    $0x1,%edx
 8051540:	89 45 14             	mov    %eax,0x14(%ebp)
 8051543:	e9 f8 fa ff ff       	jmp    8051040 <_svfiprintf_r+0x180>
 8051548:	8b 45 14             	mov    0x14(%ebp),%eax
 805154b:	89 55 10             	mov    %edx,0x10(%ebp)
 805154e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051555:	8b 18                	mov    (%eax),%ebx
 8051557:	8d 50 04             	lea    0x4(%eax),%edx
 805155a:	85 db                	test   %ebx,%ebx
 805155c:	0f 84 cc 06 00 00    	je     8051c2e <_svfiprintf_r+0xd6e>
 8051562:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051568:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
 805156e:	85 ff                	test   %edi,%edi
 8051570:	0f 88 59 06 00 00    	js     8051bcf <_svfiprintf_r+0xd0f>
 8051576:	89 7c 24 08          	mov    %edi,0x8(%esp)
 805157a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8051581:	00 
 8051582:	89 1c 24             	mov    %ebx,(%esp)
 8051585:	e8 06 e6 ff ff       	call   804fb90 <memchr>
 805158a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 8051590:	85 c0                	test   %eax,%eax
 8051592:	0f 84 c5 06 00 00    	je     8051c5d <_svfiprintf_r+0xd9d>
 8051598:	29 d8                	sub    %ebx,%eax
 805159a:	39 f8                	cmp    %edi,%eax
 805159c:	0f 4f c7             	cmovg  %edi,%eax
 805159f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 80515a6:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 80515ac:	89 55 14             	mov    %edx,0x14(%ebp)
 80515af:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 80515b6:	00 00 00 
 80515b9:	e9 f2 fa ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 80515be:	89 f8                	mov    %edi,%eax
 80515c0:	84 c0                	test   %al,%al
 80515c2:	b8 20 00 00 00       	mov    $0x20,%eax
 80515c7:	0f 44 f8             	cmove  %eax,%edi
 80515ca:	89 d0                	mov    %edx,%eax
 80515cc:	e9 e5 f9 ff ff       	jmp    8050fb6 <_svfiprintf_r+0xf6>
 80515d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80515d8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80515de:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80515e4:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
 80515eb:	74 2e                	je     805161b <_svfiprintf_r+0x75b>
 80515ed:	83 c0 01             	add    $0x1,%eax
 80515f0:	83 c2 01             	add    $0x1,%edx
 80515f3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
 80515f9:	83 c6 08             	add    $0x8,%esi
 80515fc:	89 4e f8             	mov    %ecx,-0x8(%esi)
 80515ff:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
 8051606:	83 f8 07             	cmp    $0x7,%eax
 8051609:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805160f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051615:	0f 8f b5 04 00 00    	jg     8051ad0 <_svfiprintf_r+0xc10>
 805161b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
 8051621:	85 c9                	test   %ecx,%ecx
 8051623:	74 2e                	je     8051653 <_svfiprintf_r+0x793>
 8051625:	83 c0 01             	add    $0x1,%eax
 8051628:	83 c2 02             	add    $0x2,%edx
 805162b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
 8051631:	83 c6 08             	add    $0x8,%esi
 8051634:	89 4e f8             	mov    %ecx,-0x8(%esi)
 8051637:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
 805163e:	83 f8 07             	cmp    $0x7,%eax
 8051641:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051647:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805164d:	0f 8f 45 04 00 00    	jg     8051a98 <_svfiprintf_r+0xbd8>
 8051653:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
 805165a:	00 00 00 
 805165d:	0f 84 9d 02 00 00    	je     8051900 <_svfiprintf_r+0xa40>
 8051663:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051669:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
 805166f:	85 ff                	test   %edi,%edi
 8051671:	0f 8e e1 00 00 00    	jle    8051758 <_svfiprintf_r+0x898>
 8051677:	83 ff 10             	cmp    $0x10,%edi
 805167a:	0f 8e 7c 00 00 00    	jle    80516fc <_svfiprintf_r+0x83c>
 8051680:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
 8051686:	89 f1                	mov    %esi,%ecx
 8051688:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805168b:	8b 75 0c             	mov    0xc(%ebp),%esi
 805168e:	eb 08                	jmp    8051698 <_svfiprintf_r+0x7d8>
 8051690:	83 ef 10             	sub    $0x10,%edi
 8051693:	83 ff 10             	cmp    $0x10,%edi
 8051696:	7e 5c                	jle    80516f4 <_svfiprintf_r+0x834>
 8051698:	83 c0 01             	add    $0x1,%eax
 805169b:	83 c2 10             	add    $0x10,%edx
 805169e:	c7 01 8c 4c 05 08    	movl   $0x8054c8c,(%ecx)
 80516a4:	83 c1 08             	add    $0x8,%ecx
 80516a7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 80516ae:	83 f8 07             	cmp    $0x7,%eax
 80516b1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80516b7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80516bd:	7e d1                	jle    8051690 <_svfiprintf_r+0x7d0>
 80516bf:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80516c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 80516c9:	89 74 24 04          	mov    %esi,0x4(%esp)
 80516cd:	89 1c 24             	mov    %ebx,(%esp)
 80516d0:	e8 fb f5 ff ff       	call   8050cd0 <__ssprint_r>
 80516d5:	85 c0                	test   %eax,%eax
 80516d7:	0f 85 eb 01 00 00    	jne    80518c8 <_svfiprintf_r+0xa08>
 80516dd:	83 ef 10             	sub    $0x10,%edi
 80516e0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80516e6:	83 ff 10             	cmp    $0x10,%edi
 80516e9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80516ef:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 80516f2:	7f a4                	jg     8051698 <_svfiprintf_r+0x7d8>
 80516f4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 80516fa:	89 ce                	mov    %ecx,%esi
 80516fc:	83 c0 01             	add    $0x1,%eax
 80516ff:	01 fa                	add    %edi,%edx
 8051701:	c7 06 8c 4c 05 08    	movl   $0x8054c8c,(%esi)
 8051707:	83 c6 08             	add    $0x8,%esi
 805170a:	89 7e fc             	mov    %edi,-0x4(%esi)
 805170d:	83 f8 07             	cmp    $0x7,%eax
 8051710:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051716:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805171c:	7e 3a                	jle    8051758 <_svfiprintf_r+0x898>
 805171e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051724:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051728:	8b 45 0c             	mov    0xc(%ebp),%eax
 805172b:	89 44 24 04          	mov    %eax,0x4(%esp)
 805172f:	8b 45 08             	mov    0x8(%ebp),%eax
 8051732:	89 04 24             	mov    %eax,(%esp)
 8051735:	e8 96 f5 ff ff       	call   8050cd0 <__ssprint_r>
 805173a:	85 c0                	test   %eax,%eax
 805173c:	0f 85 86 01 00 00    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051742:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051748:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805174b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051758:	89 1e                	mov    %ebx,(%esi)
 805175a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
 8051760:	83 c0 01             	add    $0x1,%eax
 8051763:	83 c6 08             	add    $0x8,%esi
 8051766:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805176c:	89 5e fc             	mov    %ebx,-0x4(%esi)
 805176f:	01 da                	add    %ebx,%edx
 8051771:	83 f8 07             	cmp    $0x7,%eax
 8051774:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805177a:	0f 8f 80 02 00 00    	jg     8051a00 <_svfiprintf_r+0xb40>
 8051780:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
 8051787:	0f 84 b9 00 00 00    	je     8051846 <_svfiprintf_r+0x986>
 805178d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 8051793:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 8051799:	85 ff                	test   %edi,%edi
 805179b:	0f 8e a5 00 00 00    	jle    8051846 <_svfiprintf_r+0x986>
 80517a1:	83 ff 10             	cmp    $0x10,%edi
 80517a4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80517aa:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 80517b0:	7e 71                	jle    8051823 <_svfiprintf_r+0x963>
 80517b2:	89 f1                	mov    %esi,%ecx
 80517b4:	8b 75 08             	mov    0x8(%ebp),%esi
 80517b7:	eb 0f                	jmp    80517c8 <_svfiprintf_r+0x908>
 80517b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80517c0:	83 ef 10             	sub    $0x10,%edi
 80517c3:	83 ff 10             	cmp    $0x10,%edi
 80517c6:	7e 59                	jle    8051821 <_svfiprintf_r+0x961>
 80517c8:	83 c0 01             	add    $0x1,%eax
 80517cb:	83 c2 10             	add    $0x10,%edx
 80517ce:	c7 01 9c 4c 05 08    	movl   $0x8054c9c,(%ecx)
 80517d4:	83 c1 08             	add    $0x8,%ecx
 80517d7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 80517de:	83 f8 07             	cmp    $0x7,%eax
 80517e1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80517e7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80517ed:	7e d1                	jle    80517c0 <_svfiprintf_r+0x900>
 80517ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 80517f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80517f6:	89 34 24             	mov    %esi,(%esp)
 80517f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80517fd:	e8 ce f4 ff ff       	call   8050cd0 <__ssprint_r>
 8051802:	85 c0                	test   %eax,%eax
 8051804:	0f 85 be 00 00 00    	jne    80518c8 <_svfiprintf_r+0xa08>
 805180a:	83 ef 10             	sub    $0x10,%edi
 805180d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051813:	83 ff 10             	cmp    $0x10,%edi
 8051816:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805181c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 805181f:	7f a7                	jg     80517c8 <_svfiprintf_r+0x908>
 8051821:	89 ce                	mov    %ecx,%esi
 8051823:	83 c0 01             	add    $0x1,%eax
 8051826:	01 fa                	add    %edi,%edx
 8051828:	83 f8 07             	cmp    $0x7,%eax
 805182b:	c7 06 9c 4c 05 08    	movl   $0x8054c9c,(%esi)
 8051831:	89 7e 04             	mov    %edi,0x4(%esi)
 8051834:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805183a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051840:	0f 8f ee 02 00 00    	jg     8051b34 <_svfiprintf_r+0xc74>
 8051846:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 805184c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
 8051852:	39 c6                	cmp    %eax,%esi
 8051854:	0f 4d c6             	cmovge %esi,%eax
 8051857:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 805185d:	85 d2                	test   %edx,%edx
 805185f:	0f 85 d3 01 00 00    	jne    8051a38 <_svfiprintf_r+0xb78>
 8051865:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 805186c:	00 00 00 
 805186f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051872:	e9 a7 f6 ff ff       	jmp    8050f1e <_svfiprintf_r+0x5e>
 8051877:	90                   	nop
 8051878:	84 d2                	test   %dl,%dl
 805187a:	75 6c                	jne    80518e8 <_svfiprintf_r+0xa28>
 805187c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8051883:	74 63                	je     80518e8 <_svfiprintf_r+0xa28>
 8051885:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 805188b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 805188e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 8051892:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051898:	e9 13 f8 ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 805189d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 80518a3:	85 c0                	test   %eax,%eax
 80518a5:	74 21                	je     80518c8 <_svfiprintf_r+0xa08>
 80518a7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80518ad:	89 44 24 08          	mov    %eax,0x8(%esp)
 80518b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80518b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80518b8:	8b 45 08             	mov    0x8(%ebp),%eax
 80518bb:	89 04 24             	mov    %eax,(%esp)
 80518be:	e8 0d f4 ff ff       	call   8050cd0 <__ssprint_r>
 80518c3:	90                   	nop
 80518c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80518c8:	8b 75 0c             	mov    0xc(%ebp),%esi
 80518cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80518d0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
 80518d4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
 80518db:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 80518e1:	5b                   	pop    %ebx
 80518e2:	5e                   	pop    %esi
 80518e3:	5f                   	pop    %edi
 80518e4:	5d                   	pop    %ebp
 80518e5:	c3                   	ret    
 80518e6:	66 90                	xchg   %ax,%ax
 80518e8:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
 80518ef:	00 00 00 
 80518f2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 80518f5:	e9 b6 f7 ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 80518fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051900:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 8051906:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 805190c:	85 ff                	test   %edi,%edi
 805190e:	0f 8e 4f fd ff ff    	jle    8051663 <_svfiprintf_r+0x7a3>
 8051914:	83 ff 10             	cmp    $0x10,%edi
 8051917:	0f 8e 7f 00 00 00    	jle    805199c <_svfiprintf_r+0xadc>
 805191d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
 8051923:	89 f1                	mov    %esi,%ecx
 8051925:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8051928:	8b 75 0c             	mov    0xc(%ebp),%esi
 805192b:	eb 0b                	jmp    8051938 <_svfiprintf_r+0xa78>
 805192d:	8d 76 00             	lea    0x0(%esi),%esi
 8051930:	83 ef 10             	sub    $0x10,%edi
 8051933:	83 ff 10             	cmp    $0x10,%edi
 8051936:	7e 5c                	jle    8051994 <_svfiprintf_r+0xad4>
 8051938:	83 c0 01             	add    $0x1,%eax
 805193b:	83 c2 10             	add    $0x10,%edx
 805193e:	c7 01 8c 4c 05 08    	movl   $0x8054c8c,(%ecx)
 8051944:	83 c1 08             	add    $0x8,%ecx
 8051947:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 805194e:	83 f8 07             	cmp    $0x7,%eax
 8051951:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051957:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805195d:	7e d1                	jle    8051930 <_svfiprintf_r+0xa70>
 805195f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051965:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051969:	89 74 24 04          	mov    %esi,0x4(%esp)
 805196d:	89 1c 24             	mov    %ebx,(%esp)
 8051970:	e8 5b f3 ff ff       	call   8050cd0 <__ssprint_r>
 8051975:	85 c0                	test   %eax,%eax
 8051977:	0f 85 4b ff ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 805197d:	83 ef 10             	sub    $0x10,%edi
 8051980:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051986:	83 ff 10             	cmp    $0x10,%edi
 8051989:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805198f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 8051992:	7f a4                	jg     8051938 <_svfiprintf_r+0xa78>
 8051994:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
 805199a:	89 ce                	mov    %ecx,%esi
 805199c:	83 c0 01             	add    $0x1,%eax
 805199f:	01 fa                	add    %edi,%edx
 80519a1:	c7 06 8c 4c 05 08    	movl   $0x8054c8c,(%esi)
 80519a7:	83 c6 08             	add    $0x8,%esi
 80519aa:	89 7e fc             	mov    %edi,-0x4(%esi)
 80519ad:	83 f8 07             	cmp    $0x7,%eax
 80519b0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80519b6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80519bc:	0f 8e a1 fc ff ff    	jle    8051663 <_svfiprintf_r+0x7a3>
 80519c2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80519c8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80519cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80519cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 80519d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80519d6:	89 04 24             	mov    %eax,(%esp)
 80519d9:	e8 f2 f2 ff ff       	call   8050cd0 <__ssprint_r>
 80519de:	85 c0                	test   %eax,%eax
 80519e0:	0f 85 e2 fe ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 80519e6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80519ec:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80519ef:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80519f5:	e9 69 fc ff ff       	jmp    8051663 <_svfiprintf_r+0x7a3>
 80519fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051a00:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a06:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a0a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a11:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a14:	89 04 24             	mov    %eax,(%esp)
 8051a17:	e8 b4 f2 ff ff       	call   8050cd0 <__ssprint_r>
 8051a1c:	85 c0                	test   %eax,%eax
 8051a1e:	0f 85 a4 fe ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051a24:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051a2a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051a2d:	e9 4e fd ff ff       	jmp    8051780 <_svfiprintf_r+0x8c0>
 8051a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051a38:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a3e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a42:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a45:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a49:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a4c:	89 04 24             	mov    %eax,(%esp)
 8051a4f:	e8 7c f2 ff ff       	call   8050cd0 <__ssprint_r>
 8051a54:	85 c0                	test   %eax,%eax
 8051a56:	0f 84 09 fe ff ff    	je     8051865 <_svfiprintf_r+0x9a5>
 8051a5c:	e9 67 fe ff ff       	jmp    80518c8 <_svfiprintf_r+0xa08>
 8051a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051a68:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a6e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a72:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a75:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a79:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a7c:	89 04 24             	mov    %eax,(%esp)
 8051a7f:	e8 4c f2 ff ff       	call   8050cd0 <__ssprint_r>
 8051a84:	85 c0                	test   %eax,%eax
 8051a86:	0f 85 3c fe ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051a8c:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051a8f:	e9 e9 f4 ff ff       	jmp    8050f7d <_svfiprintf_r+0xbd>
 8051a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051a98:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a9e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051aa2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051aa5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051aa9:	8b 45 08             	mov    0x8(%ebp),%eax
 8051aac:	89 04 24             	mov    %eax,(%esp)
 8051aaf:	e8 1c f2 ff ff       	call   8050cd0 <__ssprint_r>
 8051ab4:	85 c0                	test   %eax,%eax
 8051ab6:	0f 85 0c fe ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051abc:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051ac2:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051ac5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051acb:	e9 83 fb ff ff       	jmp    8051653 <_svfiprintf_r+0x793>
 8051ad0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051ad6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051ada:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051add:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051ae1:	8b 45 08             	mov    0x8(%ebp),%eax
 8051ae4:	89 04 24             	mov    %eax,(%esp)
 8051ae7:	e8 e4 f1 ff ff       	call   8050cd0 <__ssprint_r>
 8051aec:	85 c0                	test   %eax,%eax
 8051aee:	0f 85 d4 fd ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051af4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051afa:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051afd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051b03:	e9 13 fb ff ff       	jmp    805161b <_svfiprintf_r+0x75b>
 8051b08:	83 f9 09             	cmp    $0x9,%ecx
 8051b0b:	76 56                	jbe    8051b63 <_svfiprintf_r+0xca3>
 8051b0d:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 8051b10:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
 8051b15:	83 eb 01             	sub    $0x1,%ebx
 8051b18:	f7 e1                	mul    %ecx
 8051b1a:	c1 ea 03             	shr    $0x3,%edx
 8051b1d:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8051b20:	01 c0                	add    %eax,%eax
 8051b22:	29 c1                	sub    %eax,%ecx
 8051b24:	83 c1 30             	add    $0x30,%ecx
 8051b27:	85 d2                	test   %edx,%edx
 8051b29:	88 0b                	mov    %cl,(%ebx)
 8051b2b:	89 d1                	mov    %edx,%ecx
 8051b2d:	75 e1                	jne    8051b10 <_svfiprintf_r+0xc50>
 8051b2f:	e9 71 f5 ff ff       	jmp    80510a5 <_svfiprintf_r+0x1e5>
 8051b34:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051b3a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051b3e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051b41:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051b45:	8b 45 08             	mov    0x8(%ebp),%eax
 8051b48:	89 04 24             	mov    %eax,(%esp)
 8051b4b:	e8 80 f1 ff ff       	call   8050cd0 <__ssprint_r>
 8051b50:	85 c0                	test   %eax,%eax
 8051b52:	0f 85 70 fd ff ff    	jne    80518c8 <_svfiprintf_r+0xa08>
 8051b58:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051b5e:	e9 e3 fc ff ff       	jmp    8051846 <_svfiprintf_r+0x986>
 8051b63:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 8051b69:	83 c1 30             	add    $0x30,%ecx
 8051b6c:	88 4d a7             	mov    %cl,-0x59(%ebp)
 8051b6f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 8051b72:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051b78:	e9 33 f5 ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 8051b7d:	8b 45 14             	mov    0x14(%ebp),%eax
 8051b80:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
 8051b86:	8b 00                	mov    (%eax),%eax
 8051b88:	89 18                	mov    %ebx,(%eax)
 8051b8a:	8b 45 14             	mov    0x14(%ebp),%eax
 8051b8d:	83 c0 04             	add    $0x4,%eax
 8051b90:	89 45 14             	mov    %eax,0x14(%ebp)
 8051b93:	e9 86 f3 ff ff       	jmp    8050f1e <_svfiprintf_r+0x5e>
 8051b98:	0f b7 0b             	movzwl (%ebx),%ecx
 8051b9b:	83 c3 04             	add    $0x4,%ebx
 8051b9e:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8051ba1:	e9 95 f8 ff ff       	jmp    805143b <_svfiprintf_r+0x57b>
 8051ba6:	0f bf 08             	movswl (%eax),%ecx
 8051ba9:	83 c0 04             	add    $0x4,%eax
 8051bac:	89 45 14             	mov    %eax,0x14(%ebp)
 8051baf:	85 c9                	test   %ecx,%ecx
 8051bb1:	0f 89 0d f7 ff ff    	jns    80512c4 <_svfiprintf_r+0x404>
 8051bb7:	f7 d9                	neg    %ecx
 8051bb9:	bf 2d 00 00 00       	mov    $0x2d,%edi
 8051bbe:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
 8051bc5:	ba 01 00 00 00       	mov    $0x1,%edx
 8051bca:	e9 7a f4 ff ff       	jmp    8051049 <_svfiprintf_r+0x189>
 8051bcf:	89 1c 24             	mov    %ebx,(%esp)
 8051bd2:	e8 09 76 ff ff       	call   80491e0 <strlen>
 8051bd7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 8051bdd:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8051be4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051beb:	00 00 00 
 8051bee:	89 55 14             	mov    %edx,0x14(%ebp)
 8051bf1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051bf7:	e9 b4 f4 ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 8051bfc:	8b 45 08             	mov    0x8(%ebp),%eax
 8051bff:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 8051c06:	00 
 8051c07:	89 04 24             	mov    %eax,(%esp)
 8051c0a:	e8 41 d8 ff ff       	call   804f450 <_malloc_r>
 8051c0f:	8b 75 0c             	mov    0xc(%ebp),%esi
 8051c12:	85 c0                	test   %eax,%eax
 8051c14:	89 06                	mov    %eax,(%esi)
 8051c16:	89 46 10             	mov    %eax,0x10(%esi)
 8051c19:	0f 84 a3 00 00 00    	je     8051cc2 <_svfiprintf_r+0xe02>
 8051c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051c22:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
 8051c29:	e9 b2 f2 ff ff       	jmp    8050ee0 <_svfiprintf_r+0x20>
 8051c2e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051c34:	b8 06 00 00 00       	mov    $0x6,%eax
 8051c39:	89 55 14             	mov    %edx,0x14(%ebp)
 8051c3c:	83 ff 06             	cmp    $0x6,%edi
 8051c3f:	0f 46 c7             	cmovbe %edi,%eax
 8051c42:	85 c0                	test   %eax,%eax
 8051c44:	0f 49 d8             	cmovns %eax,%ebx
 8051c47:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
 8051c4d:	bb 5e 46 05 08       	mov    $0x805465e,%ebx
 8051c52:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051c58:	e9 61 f8 ff ff       	jmp    80514be <_svfiprintf_r+0x5fe>
 8051c5d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8051c63:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8051c6a:	89 55 14             	mov    %edx,0x14(%ebp)
 8051c6d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051c74:	00 00 00 
 8051c77:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051c7d:	e9 2e f4 ff ff       	jmp    80510b0 <_svfiprintf_r+0x1f0>
 8051c82:	89 da                	mov    %ebx,%edx
 8051c84:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051c8b:	00 00 00 
 8051c8e:	e9 29 f3 ff ff       	jmp    8050fbc <_svfiprintf_r+0xfc>
 8051c93:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051c96:	89 da                	mov    %ebx,%edx
 8051c98:	8b 45 14             	mov    0x14(%ebp),%eax
 8051c9b:	8b 09                	mov    (%ecx),%ecx
 8051c9d:	83 c0 04             	add    $0x4,%eax
 8051ca0:	89 45 14             	mov    %eax,0x14(%ebp)
 8051ca3:	85 c9                	test   %ecx,%ecx
 8051ca5:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 8051cab:	0f 89 26 f3 ff ff    	jns    8050fd7 <_svfiprintf_r+0x117>
 8051cb1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8051cb8:	ff ff ff 
 8051cbb:	89 d0                	mov    %edx,%eax
 8051cbd:	e9 f4 f2 ff ff       	jmp    8050fb6 <_svfiprintf_r+0xf6>
 8051cc2:	8b 45 08             	mov    0x8(%ebp),%eax
 8051cc5:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8051ccb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051cd0:	e9 06 fc ff ff       	jmp    80518db <_svfiprintf_r+0xa1b>
 8051cd5:	66 90                	xchg   %ax,%ax
 8051cd7:	66 90                	xchg   %ax,%ax
 8051cd9:	66 90                	xchg   %ax,%ax
 8051cdb:	66 90                	xchg   %ax,%ax
 8051cdd:	66 90                	xchg   %ax,%ax
 8051cdf:	90                   	nop

08051ce0 <__sprint_r.part.0>:
 8051ce0:	55                   	push   %ebp
 8051ce1:	89 e5                	mov    %esp,%ebp
 8051ce3:	57                   	push   %edi
 8051ce4:	56                   	push   %esi
 8051ce5:	53                   	push   %ebx
 8051ce6:	83 ec 2c             	sub    $0x2c,%esp
 8051ce9:	f6 42 65 20          	testb  $0x20,0x65(%edx)
 8051ced:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8051cf0:	89 c8                	mov    %ecx,%eax
 8051cf2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 8051cf5:	0f 84 a5 00 00 00    	je     8051da0 <__sprint_r.part.0+0xc0>
 8051cfb:	8b 40 08             	mov    0x8(%eax),%eax
 8051cfe:	8b 09                	mov    (%ecx),%ecx
 8051d00:	85 c0                	test   %eax,%eax
 8051d02:	89 4d d8             	mov    %ecx,-0x28(%ebp)
 8051d05:	0f 84 8a 00 00 00    	je     8051d95 <__sprint_r.part.0+0xb5>
 8051d0b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 8051d0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8051d11:	31 ff                	xor    %edi,%edi
 8051d13:	8b 58 04             	mov    0x4(%eax),%ebx
 8051d16:	8b 30                	mov    (%eax),%esi
 8051d18:	c1 eb 02             	shr    $0x2,%ebx
 8051d1b:	85 db                	test   %ebx,%ebx
 8051d1d:	7e 5c                	jle    8051d7b <__sprint_r.part.0+0x9b>
 8051d1f:	89 5d e0             	mov    %ebx,-0x20(%ebp)
 8051d22:	89 f3                	mov    %esi,%ebx
 8051d24:	89 fe                	mov    %edi,%esi
 8051d26:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8051d29:	eb 0d                	jmp    8051d38 <__sprint_r.part.0+0x58>
 8051d2b:	90                   	nop
 8051d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051d30:	83 c6 01             	add    $0x1,%esi
 8051d33:	39 75 e0             	cmp    %esi,-0x20(%ebp)
 8051d36:	74 40                	je     8051d78 <__sprint_r.part.0+0x98>
 8051d38:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8051d3c:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 8051d3f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051d43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8051d46:	89 04 24             	mov    %eax,(%esp)
 8051d49:	e8 b2 13 00 00       	call   8053100 <_fputwc_r>
 8051d4e:	83 f8 ff             	cmp    $0xffffffff,%eax
 8051d51:	75 dd                	jne    8051d30 <__sprint_r.part.0+0x50>
 8051d53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051d58:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8051d5b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8051d62:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
 8051d69:	83 c4 2c             	add    $0x2c,%esp
 8051d6c:	5b                   	pop    %ebx
 8051d6d:	5e                   	pop    %esi
 8051d6e:	5f                   	pop    %edi
 8051d6f:	5d                   	pop    %ebp
 8051d70:	c3                   	ret    
 8051d71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051d78:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8051d7b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8051d7e:	c1 e3 02             	shl    $0x2,%ebx
 8051d81:	83 45 d8 08          	addl   $0x8,-0x28(%ebp)
 8051d85:	8b 41 08             	mov    0x8(%ecx),%eax
 8051d88:	29 d8                	sub    %ebx,%eax
 8051d8a:	85 c0                	test   %eax,%eax
 8051d8c:	89 41 08             	mov    %eax,0x8(%ecx)
 8051d8f:	0f 85 79 ff ff ff    	jne    8051d0e <__sprint_r.part.0+0x2e>
 8051d95:	31 c0                	xor    %eax,%eax
 8051d97:	eb bf                	jmp    8051d58 <__sprint_r.part.0+0x78>
 8051d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051da0:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8051da3:	89 54 24 04          	mov    %edx,0x4(%esp)
 8051da7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051dab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8051dae:	89 04 24             	mov    %eax,(%esp)
 8051db1:	e8 1a 15 00 00       	call   80532d0 <__sfvwrite_r>
 8051db6:	eb a0                	jmp    8051d58 <__sprint_r.part.0+0x78>
 8051db8:	90                   	nop
 8051db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08051dc0 <__sprint_r>:
 8051dc0:	55                   	push   %ebp
 8051dc1:	89 e5                	mov    %esp,%ebp
 8051dc3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8051dc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8051dc9:	8b 55 0c             	mov    0xc(%ebp),%edx
 8051dcc:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 8051dd0:	74 06                	je     8051dd8 <__sprint_r+0x18>
 8051dd2:	5d                   	pop    %ebp
 8051dd3:	e9 08 ff ff ff       	jmp    8051ce0 <__sprint_r.part.0>
 8051dd8:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
 8051ddf:	31 c0                	xor    %eax,%eax
 8051de1:	5d                   	pop    %ebp
 8051de2:	c3                   	ret    
 8051de3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08051df0 <_vfiprintf_r>:
 8051df0:	55                   	push   %ebp
 8051df1:	89 e5                	mov    %esp,%ebp
 8051df3:	57                   	push   %edi
 8051df4:	56                   	push   %esi
 8051df5:	53                   	push   %ebx
 8051df6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
 8051dfc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8051dff:	85 db                	test   %ebx,%ebx
 8051e01:	74 0e                	je     8051e11 <_vfiprintf_r+0x21>
 8051e03:	8b 45 08             	mov    0x8(%ebp),%eax
 8051e06:	8b 48 38             	mov    0x38(%eax),%ecx
 8051e09:	85 c9                	test   %ecx,%ecx
 8051e0b:	0f 84 c7 01 00 00    	je     8051fd8 <_vfiprintf_r+0x1e8>
 8051e11:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051e14:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 8051e18:	f6 c4 20             	test   $0x20,%ah
 8051e1b:	75 11                	jne    8051e2e <_vfiprintf_r+0x3e>
 8051e1d:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8051e20:	80 cc 20             	or     $0x20,%ah
 8051e23:	81 67 64 ff df ff ff 	andl   $0xffffdfff,0x64(%edi)
 8051e2a:	66 89 47 0c          	mov    %ax,0xc(%edi)
 8051e2e:	a8 08                	test   $0x8,%al
 8051e30:	0f 84 3a 01 00 00    	je     8051f70 <_vfiprintf_r+0x180>
 8051e36:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8051e39:	8b 57 10             	mov    0x10(%edi),%edx
 8051e3c:	85 d2                	test   %edx,%edx
 8051e3e:	0f 84 2c 01 00 00    	je     8051f70 <_vfiprintf_r+0x180>
 8051e44:	83 e0 1a             	and    $0x1a,%eax
 8051e47:	66 83 f8 0a          	cmp    $0xa,%ax
 8051e4b:	0f 84 49 01 00 00    	je     8051f9a <_vfiprintf_r+0x1aa>
 8051e51:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8051e54:	8d 7d a7             	lea    -0x59(%ebp),%edi
 8051e57:	89 c6                	mov    %eax,%esi
 8051e59:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8051e5f:	29 f8                	sub    %edi,%eax
 8051e61:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 8051e68:	00 00 00 
 8051e6b:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8051e72:	00 00 00 
 8051e75:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 8051e7c:	00 00 00 
 8051e7f:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
 8051e86:	00 00 00 
 8051e89:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
 8051e8f:	8b 45 10             	mov    0x10(%ebp),%eax
 8051e92:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8051e95:	0f b6 00             	movzbl (%eax),%eax
 8051e98:	84 c0                	test   %al,%al
 8051e9a:	74 5b                	je     8051ef7 <_vfiprintf_r+0x107>
 8051e9c:	3c 25                	cmp    $0x25,%al
 8051e9e:	75 12                	jne    8051eb2 <_vfiprintf_r+0xc2>
 8051ea0:	eb 55                	jmp    8051ef7 <_vfiprintf_r+0x107>
 8051ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051ea8:	84 c0                	test   %al,%al
 8051eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051eb0:	74 0a                	je     8051ebc <_vfiprintf_r+0xcc>
 8051eb2:	83 c3 01             	add    $0x1,%ebx
 8051eb5:	0f b6 03             	movzbl (%ebx),%eax
 8051eb8:	3c 25                	cmp    $0x25,%al
 8051eba:	75 ec                	jne    8051ea8 <_vfiprintf_r+0xb8>
 8051ebc:	89 df                	mov    %ebx,%edi
 8051ebe:	2b 7d 10             	sub    0x10(%ebp),%edi
 8051ec1:	74 34                	je     8051ef7 <_vfiprintf_r+0x107>
 8051ec3:	8b 45 10             	mov    0x10(%ebp),%eax
 8051ec6:	83 c6 08             	add    $0x8,%esi
 8051ec9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051ecf:	89 7e fc             	mov    %edi,-0x4(%esi)
 8051ed2:	89 46 f8             	mov    %eax,-0x8(%esi)
 8051ed5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051edb:	01 fa                	add    %edi,%edx
 8051edd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051ee3:	83 c0 01             	add    $0x1,%eax
 8051ee6:	83 f8 07             	cmp    $0x7,%eax
 8051ee9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051eef:	7f 57                	jg     8051f48 <_vfiprintf_r+0x158>
 8051ef1:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
 8051ef7:	80 3b 00             	cmpb   $0x0,(%ebx)
 8051efa:	0f 84 f9 07 00 00    	je     80526f9 <_vfiprintf_r+0x909>
 8051f00:	83 c3 01             	add    $0x1,%ebx
 8051f03:	31 ff                	xor    %edi,%edi
 8051f05:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051f0c:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8051f13:	ff ff ff 
 8051f16:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
 8051f1d:	00 00 00 
 8051f20:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
 8051f27:	00 00 00 
 8051f2a:	0f be 03             	movsbl (%ebx),%eax
 8051f2d:	8d 53 01             	lea    0x1(%ebx),%edx
 8051f30:	8d 48 e0             	lea    -0x20(%eax),%ecx
 8051f33:	83 f9 58             	cmp    $0x58,%ecx
 8051f36:	0f 87 15 06 00 00    	ja     8052551 <_vfiprintf_r+0x761>
 8051f3c:	ff 24 8d ac 4c 05 08 	jmp    *0x8054cac(,%ecx,4)
 8051f43:	90                   	nop
 8051f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051f48:	85 d2                	test   %edx,%edx
 8051f4a:	0f 85 e8 0b 00 00    	jne    8052b38 <_vfiprintf_r+0xd48>
 8051f50:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8051f57:	00 00 00 
 8051f5a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051f5d:	eb 92                	jmp    8051ef1 <_vfiprintf_r+0x101>
 8051f5f:	90                   	nop
 8051f60:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051f67:	89 d3                	mov    %edx,%ebx
 8051f69:	eb bf                	jmp    8051f2a <_vfiprintf_r+0x13a>
 8051f6b:	90                   	nop
 8051f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051f70:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f73:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051f77:	8b 45 08             	mov    0x8(%ebp),%eax
 8051f7a:	89 04 24             	mov    %eax,(%esp)
 8051f7d:	e8 5e b2 ff ff       	call   804d1e0 <__swsetup_r>
 8051f82:	85 c0                	test   %eax,%eax
 8051f84:	75 42                	jne    8051fc8 <_vfiprintf_r+0x1d8>
 8051f86:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f89:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 8051f8d:	83 e0 1a             	and    $0x1a,%eax
 8051f90:	66 83 f8 0a          	cmp    $0xa,%ax
 8051f94:	0f 85 b7 fe ff ff    	jne    8051e51 <_vfiprintf_r+0x61>
 8051f9a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f9d:	66 83 78 0e 00       	cmpw   $0x0,0xe(%eax)
 8051fa2:	0f 88 a9 fe ff ff    	js     8051e51 <_vfiprintf_r+0x61>
 8051fa8:	8b 45 14             	mov    0x14(%ebp),%eax
 8051fab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8051fae:	8b 55 0c             	mov    0xc(%ebp),%edx
 8051fb1:	89 04 24             	mov    %eax,(%esp)
 8051fb4:	8b 45 08             	mov    0x8(%ebp),%eax
 8051fb7:	e8 04 0e 00 00       	call   8052dc0 <__sbprintf>
 8051fbc:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8051fc2:	5b                   	pop    %ebx
 8051fc3:	5e                   	pop    %esi
 8051fc4:	5f                   	pop    %edi
 8051fc5:	5d                   	pop    %ebp
 8051fc6:	c3                   	ret    
 8051fc7:	90                   	nop
 8051fc8:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8051fce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051fd3:	5b                   	pop    %ebx
 8051fd4:	5e                   	pop    %esi
 8051fd5:	5f                   	pop    %edi
 8051fd6:	5d                   	pop    %ebp
 8051fd7:	c3                   	ret    
 8051fd8:	89 04 24             	mov    %eax,(%esp)
 8051fdb:	e8 70 ca ff ff       	call   804ea50 <__sinit>
 8051fe0:	e9 2c fe ff ff       	jmp    8051e11 <_vfiprintf_r+0x21>
 8051fe5:	8b 45 14             	mov    0x14(%ebp),%eax
 8051fe8:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051feb:	8b 00                	mov    (%eax),%eax
 8051fed:	83 c1 04             	add    $0x4,%ecx
 8051ff0:	89 4d 14             	mov    %ecx,0x14(%ebp)
 8051ff3:	85 c0                	test   %eax,%eax
 8051ff5:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
 8051ffb:	0f 89 66 ff ff ff    	jns    8051f67 <_vfiprintf_r+0x177>
 8052001:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
 8052007:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
 805200e:	89 d3                	mov    %edx,%ebx
 8052010:	e9 15 ff ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 8052015:	bf 2b 00 00 00       	mov    $0x2b,%edi
 805201a:	89 d3                	mov    %edx,%ebx
 805201c:	e9 09 ff ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 8052021:	8b 45 14             	mov    0x14(%ebp),%eax
 8052024:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 805202b:	89 55 10             	mov    %edx,0x10(%ebp)
 805202e:	ba 02 00 00 00       	mov    $0x2,%edx
 8052033:	8b 08                	mov    (%eax),%ecx
 8052035:	83 c0 04             	add    $0x4,%eax
 8052038:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805203f:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
 8052046:	89 45 14             	mov    %eax,0x14(%ebp)
 8052049:	c7 85 40 ff ff ff 4d 	movl   $0x805464d,-0xc0(%ebp)
 8052050:	46 05 08 
 8052053:	90                   	nop
 8052054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052058:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805205f:	31 ff                	xor    %edi,%edi
 8052061:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
 8052067:	89 d8                	mov    %ebx,%eax
 8052069:	24 7f                	and    $0x7f,%al
 805206b:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
 8052072:	0f 48 c3             	cmovs  %ebx,%eax
 8052075:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
 805207b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8052081:	85 c0                	test   %eax,%eax
 8052083:	75 08                	jne    805208d <_vfiprintf_r+0x29d>
 8052085:	85 c9                	test   %ecx,%ecx
 8052087:	0f 84 8b 08 00 00    	je     8052918 <_vfiprintf_r+0xb28>
 805208d:	80 fa 01             	cmp    $0x1,%dl
 8052090:	0f 84 52 0a 00 00    	je     8052ae8 <_vfiprintf_r+0xcf8>
 8052096:	80 fa 02             	cmp    $0x2,%dl
 8052099:	8d 45 a8             	lea    -0x58(%ebp),%eax
 805209c:	0f 85 ee 09 00 00    	jne    8052a90 <_vfiprintf_r+0xca0>
 80520a2:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
 80520a8:	89 ca                	mov    %ecx,%edx
 80520aa:	83 e8 01             	sub    $0x1,%eax
 80520ad:	83 e2 0f             	and    $0xf,%edx
 80520b0:	0f b6 14 13          	movzbl (%ebx,%edx,1),%edx
 80520b4:	c1 e9 04             	shr    $0x4,%ecx
 80520b7:	85 c9                	test   %ecx,%ecx
 80520b9:	88 10                	mov    %dl,(%eax)
 80520bb:	75 eb                	jne    80520a8 <_vfiprintf_r+0x2b8>
 80520bd:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 80520c0:	29 c1                	sub    %eax,%ecx
 80520c2:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 80520c8:	89 8d 58 ff ff ff    	mov    %ecx,-0xa8(%ebp)
 80520ce:	66 90                	xchg   %ax,%ax
 80520d0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 80520d6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
 80520dc:	39 c1                	cmp    %eax,%ecx
 80520de:	0f 4d c1             	cmovge %ecx,%eax
 80520e1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80520e7:	89 f8                	mov    %edi,%eax
 80520e9:	3c 01                	cmp    $0x1,%al
 80520eb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
 80520f2:	8b 9d 60 ff ff ff    	mov    -0xa0(%ebp),%ebx
 80520f8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
 80520fe:	89 d8                	mov    %ebx,%eax
 8052100:	89 cf                	mov    %ecx,%edi
 8052102:	83 c0 02             	add    $0x2,%eax
 8052105:	83 e7 02             	and    $0x2,%edi
 8052108:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
 805210e:	89 cf                	mov    %ecx,%edi
 8052110:	0f 44 c3             	cmove  %ebx,%eax
 8052113:	81 e7 84 00 00 00    	and    $0x84,%edi
 8052119:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 805211f:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 8052125:	0f 85 b5 04 00 00    	jne    80525e0 <_vfiprintf_r+0x7f0>
 805212b:	8b 9d 54 ff ff ff    	mov    -0xac(%ebp),%ebx
 8052131:	2b 9d 60 ff ff ff    	sub    -0xa0(%ebp),%ebx
 8052137:	85 db                	test   %ebx,%ebx
 8052139:	0f 8e a1 04 00 00    	jle    80525e0 <_vfiprintf_r+0x7f0>
 805213f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052145:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 805214b:	83 c0 01             	add    $0x1,%eax
 805214e:	83 fb 10             	cmp    $0x10,%ebx
 8052151:	7e 5b                	jle    80521ae <_vfiprintf_r+0x3be>
 8052153:	8b bd 78 ff ff ff    	mov    -0x88(%ebp),%edi
 8052159:	eb 15                	jmp    8052170 <_vfiprintf_r+0x380>
 805215b:	90                   	nop
 805215c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052160:	8d 47 02             	lea    0x2(%edi),%eax
 8052163:	83 c6 08             	add    $0x8,%esi
 8052166:	89 cf                	mov    %ecx,%edi
 8052168:	83 eb 10             	sub    $0x10,%ebx
 805216b:	83 fb 10             	cmp    $0x10,%ebx
 805216e:	7e 3e                	jle    80521ae <_vfiprintf_r+0x3be>
 8052170:	8d 4f 01             	lea    0x1(%edi),%ecx
 8052173:	83 c2 10             	add    $0x10,%edx
 8052176:	83 f9 07             	cmp    $0x7,%ecx
 8052179:	c7 06 20 4e 05 08    	movl   $0x8054e20,(%esi)
 805217f:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 8052186:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805218c:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052192:	7e cc                	jle    8052160 <_vfiprintf_r+0x370>
 8052194:	85 d2                	test   %edx,%edx
 8052196:	0f 85 14 04 00 00    	jne    80525b0 <_vfiprintf_r+0x7c0>
 805219c:	83 eb 10             	sub    $0x10,%ebx
 805219f:	31 ff                	xor    %edi,%edi
 80521a1:	83 fb 10             	cmp    $0x10,%ebx
 80521a4:	b8 01 00 00 00       	mov    $0x1,%eax
 80521a9:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80521ac:	7f c2                	jg     8052170 <_vfiprintf_r+0x380>
 80521ae:	01 da                	add    %ebx,%edx
 80521b0:	83 f8 07             	cmp    $0x7,%eax
 80521b3:	c7 06 20 4e 05 08    	movl   $0x8054e20,(%esi)
 80521b9:	89 5e 04             	mov    %ebx,0x4(%esi)
 80521bc:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80521c2:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80521c8:	0f 8f 02 09 00 00    	jg     8052ad0 <_vfiprintf_r+0xce0>
 80521ce:	83 c6 08             	add    $0x8,%esi
 80521d1:	8d 48 01             	lea    0x1(%eax),%ecx
 80521d4:	e9 16 04 00 00       	jmp    80525ef <_vfiprintf_r+0x7ff>
 80521d9:	8b 45 14             	mov    0x14(%ebp),%eax
 80521dc:	89 55 10             	mov    %edx,0x10(%ebp)
 80521df:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 80521e6:	8d 58 04             	lea    0x4(%eax),%ebx
 80521e9:	8b 00                	mov    (%eax),%eax
 80521eb:	85 c0                	test   %eax,%eax
 80521ed:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 80521f3:	0f 84 e9 0a 00 00    	je     8052ce2 <_vfiprintf_r+0xef2>
 80521f9:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 80521ff:	85 ff                	test   %edi,%edi
 8052201:	0f 88 7e 0a 00 00    	js     8052c85 <_vfiprintf_r+0xe95>
 8052207:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 805220d:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8052211:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8052218:	00 
 8052219:	89 04 24             	mov    %eax,(%esp)
 805221c:	e8 6f d9 ff ff       	call   804fb90 <memchr>
 8052221:	85 c0                	test   %eax,%eax
 8052223:	0f 84 f0 0a 00 00    	je     8052d19 <_vfiprintf_r+0xf29>
 8052229:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 805222f:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052232:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052239:	00 00 00 
 805223c:	39 f8                	cmp    %edi,%eax
 805223e:	0f 4f c7             	cmovg  %edi,%eax
 8052241:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052248:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 805224e:	e9 7d fe ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052253:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
 805225a:	89 d3                	mov    %edx,%ebx
 805225c:	e9 c9 fc ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 8052261:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052268:	89 f9                	mov    %edi,%ecx
 805226a:	89 55 10             	mov    %edx,0x10(%ebp)
 805226d:	8b 7d 14             	mov    0x14(%ebp),%edi
 8052270:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 8052276:	c7 85 40 ff ff ff 4d 	movl   $0x805464d,-0xc0(%ebp)
 805227d:	46 05 08 
 8052280:	0f 85 44 01 00 00    	jne    80523ca <_vfiprintf_r+0x5da>
 8052286:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 805228d:	0f 84 37 01 00 00    	je     80523ca <_vfiprintf_r+0x5da>
 8052293:	0f b7 0f             	movzwl (%edi),%ecx
 8052296:	83 c7 04             	add    $0x4,%edi
 8052299:	89 7d 14             	mov    %edi,0x14(%ebp)
 805229c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 80522a3:	ba 02 00 00 00       	mov    $0x2,%edx
 80522a8:	0f 84 aa fd ff ff    	je     8052058 <_vfiprintf_r+0x268>
 80522ae:	85 c9                	test   %ecx,%ecx
 80522b0:	0f 84 a2 fd ff ff    	je     8052058 <_vfiprintf_r+0x268>
 80522b6:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 80522bd:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
 80522c3:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 80522ca:	e9 89 fd ff ff       	jmp    8052058 <_vfiprintf_r+0x268>
 80522cf:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80522d6:	89 f8                	mov    %edi,%eax
 80522d8:	89 55 10             	mov    %edx,0x10(%ebp)
 80522db:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80522e1:	0f 85 a9 02 00 00    	jne    8052590 <_vfiprintf_r+0x7a0>
 80522e7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80522ee:	0f 84 9c 02 00 00    	je     8052590 <_vfiprintf_r+0x7a0>
 80522f4:	8b 45 14             	mov    0x14(%ebp),%eax
 80522f7:	0f b7 bd 50 ff ff ff 	movzwl -0xb0(%ebp),%edi
 80522fe:	8b 00                	mov    (%eax),%eax
 8052300:	66 89 38             	mov    %di,(%eax)
 8052303:	8b 45 14             	mov    0x14(%ebp),%eax
 8052306:	83 c0 04             	add    $0x4,%eax
 8052309:	89 45 14             	mov    %eax,0x14(%ebp)
 805230c:	e9 7e fb ff ff       	jmp    8051e8f <_vfiprintf_r+0x9f>
 8052311:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052318:	89 55 10             	mov    %edx,0x10(%ebp)
 805231b:	8b 45 14             	mov    0x14(%ebp),%eax
 805231e:	75 73                	jne    8052393 <_vfiprintf_r+0x5a3>
 8052320:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052327:	74 6a                	je     8052393 <_vfiprintf_r+0x5a3>
 8052329:	0f b7 08             	movzwl (%eax),%ecx
 805232c:	83 c0 04             	add    $0x4,%eax
 805232f:	ba 01 00 00 00       	mov    $0x1,%edx
 8052334:	89 45 14             	mov    %eax,0x14(%ebp)
 8052337:	e9 1c fd ff ff       	jmp    8052058 <_vfiprintf_r+0x268>
 805233c:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052343:	89 55 10             	mov    %edx,0x10(%ebp)
 8052346:	8b 45 14             	mov    0x14(%ebp),%eax
 8052349:	0f 85 f3 01 00 00    	jne    8052542 <_vfiprintf_r+0x752>
 805234f:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052356:	0f 84 e6 01 00 00    	je     8052542 <_vfiprintf_r+0x752>
 805235c:	0f b7 08             	movzwl (%eax),%ecx
 805235f:	83 c0 04             	add    $0x4,%eax
 8052362:	31 d2                	xor    %edx,%edx
 8052364:	89 45 14             	mov    %eax,0x14(%ebp)
 8052367:	e9 ec fc ff ff       	jmp    8052058 <_vfiprintf_r+0x268>
 805236c:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
 8052373:	00 00 00 
 8052376:	89 d3                	mov    %edx,%ebx
 8052378:	e9 ad fb ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 805237d:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8052384:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 805238b:	89 55 10             	mov    %edx,0x10(%ebp)
 805238e:	8b 45 14             	mov    0x14(%ebp),%eax
 8052391:	74 8d                	je     8052320 <_vfiprintf_r+0x530>
 8052393:	8b 08                	mov    (%eax),%ecx
 8052395:	83 c0 04             	add    $0x4,%eax
 8052398:	ba 01 00 00 00       	mov    $0x1,%edx
 805239d:	89 45 14             	mov    %eax,0x14(%ebp)
 80523a0:	e9 b3 fc ff ff       	jmp    8052058 <_vfiprintf_r+0x268>
 80523a5:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80523ac:	89 f9                	mov    %edi,%ecx
 80523ae:	89 55 10             	mov    %edx,0x10(%ebp)
 80523b1:	8b 7d 14             	mov    0x14(%ebp),%edi
 80523b4:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 80523ba:	c7 85 40 ff ff ff 3c 	movl   $0x805463c,-0xc0(%ebp)
 80523c1:	46 05 08 
 80523c4:	0f 84 bc fe ff ff    	je     8052286 <_vfiprintf_r+0x496>
 80523ca:	8b 0f                	mov    (%edi),%ecx
 80523cc:	83 c7 04             	add    $0x4,%edi
 80523cf:	89 7d 14             	mov    %edi,0x14(%ebp)
 80523d2:	e9 c5 fe ff ff       	jmp    805229c <_vfiprintf_r+0x4ac>
 80523d7:	8b 45 14             	mov    0x14(%ebp),%eax
 80523da:	89 55 10             	mov    %edx,0x10(%ebp)
 80523dd:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 80523e4:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 80523eb:	00 00 00 
 80523ee:	8b 00                	mov    (%eax),%eax
 80523f0:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 80523f7:	00 00 00 
 80523fa:	88 45 80             	mov    %al,-0x80(%ebp)
 80523fd:	8b 45 14             	mov    0x14(%ebp),%eax
 8052400:	83 c0 04             	add    $0x4,%eax
 8052403:	89 45 14             	mov    %eax,0x14(%ebp)
 8052406:	8d 45 80             	lea    -0x80(%ebp),%eax
 8052409:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 805240f:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052416:	00 00 00 
 8052419:	e9 d4 fc ff ff       	jmp    80520f2 <_vfiprintf_r+0x302>
 805241e:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052425:	89 f8                	mov    %edi,%eax
 8052427:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 805242d:	8b 45 14             	mov    0x14(%ebp),%eax
 8052430:	89 55 10             	mov    %edx,0x10(%ebp)
 8052433:	0f 85 bd 00 00 00    	jne    80524f6 <_vfiprintf_r+0x706>
 8052439:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052440:	0f 84 b0 00 00 00    	je     80524f6 <_vfiprintf_r+0x706>
 8052446:	0f bf 08             	movswl (%eax),%ecx
 8052449:	83 c0 04             	add    $0x4,%eax
 805244c:	89 45 14             	mov    %eax,0x14(%ebp)
 805244f:	85 c9                	test   %ecx,%ecx
 8052451:	0f 88 e6 07 00 00    	js     8052c3d <_vfiprintf_r+0xe4d>
 8052457:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 805245e:	ba 01 00 00 00       	mov    $0x1,%edx
 8052463:	e9 f9 fb ff ff       	jmp    8052061 <_vfiprintf_r+0x271>
 8052468:	89 f8                	mov    %edi,%eax
 805246a:	89 d3                	mov    %edx,%ebx
 805246c:	84 c0                	test   %al,%al
 805246e:	b8 20 00 00 00       	mov    $0x20,%eax
 8052473:	0f 44 f8             	cmove  %eax,%edi
 8052476:	e9 af fa ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 805247b:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
 8052482:	89 d3                	mov    %edx,%ebx
 8052484:	e9 a1 fa ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 8052489:	0f be 02             	movsbl (%edx),%eax
 805248c:	8d 5a 01             	lea    0x1(%edx),%ebx
 805248f:	83 f8 2a             	cmp    $0x2a,%eax
 8052492:	0f 84 be 08 00 00    	je     8052d56 <_vfiprintf_r+0xf66>
 8052498:	8d 48 d0             	lea    -0x30(%eax),%ecx
 805249b:	31 d2                	xor    %edx,%edx
 805249d:	83 f9 09             	cmp    $0x9,%ecx
 80524a0:	0f 87 9f 08 00 00    	ja     8052d45 <_vfiprintf_r+0xf55>
 80524a6:	66 90                	xchg   %ax,%ax
 80524a8:	8d 04 92             	lea    (%edx,%edx,4),%eax
 80524ab:	83 c3 01             	add    $0x1,%ebx
 80524ae:	8d 14 41             	lea    (%ecx,%eax,2),%edx
 80524b1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
 80524b5:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80524b8:	83 f9 09             	cmp    $0x9,%ecx
 80524bb:	76 eb                	jbe    80524a8 <_vfiprintf_r+0x6b8>
 80524bd:	85 d2                	test   %edx,%edx
 80524bf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80524c4:	0f 48 d1             	cmovs  %ecx,%edx
 80524c7:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
 80524cd:	89 da                	mov    %ebx,%edx
 80524cf:	e9 5c fa ff ff       	jmp    8051f30 <_vfiprintf_r+0x140>
 80524d4:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 80524db:	89 f8                	mov    %edi,%eax
 80524dd:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80524e4:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80524ea:	8b 45 14             	mov    0x14(%ebp),%eax
 80524ed:	89 55 10             	mov    %edx,0x10(%ebp)
 80524f0:	0f 84 43 ff ff ff    	je     8052439 <_vfiprintf_r+0x649>
 80524f6:	8b 08                	mov    (%eax),%ecx
 80524f8:	83 c0 04             	add    $0x4,%eax
 80524fb:	89 45 14             	mov    %eax,0x14(%ebp)
 80524fe:	e9 4c ff ff ff       	jmp    805244f <_vfiprintf_r+0x65f>
 8052503:	31 db                	xor    %ebx,%ebx
 8052505:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8052508:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
 805250b:	83 c2 01             	add    $0x1,%edx
 805250e:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
 8052511:	0f be 42 ff          	movsbl -0x1(%edx),%eax
 8052515:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8052518:	83 f9 09             	cmp    $0x9,%ecx
 805251b:	76 eb                	jbe    8052508 <_vfiprintf_r+0x718>
 805251d:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
 8052523:	e9 08 fa ff ff       	jmp    8051f30 <_vfiprintf_r+0x140>
 8052528:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 805252f:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052536:	89 55 10             	mov    %edx,0x10(%ebp)
 8052539:	8b 45 14             	mov    0x14(%ebp),%eax
 805253c:	0f 84 0d fe ff ff    	je     805234f <_vfiprintf_r+0x55f>
 8052542:	8b 08                	mov    (%eax),%ecx
 8052544:	83 c0 04             	add    $0x4,%eax
 8052547:	31 d2                	xor    %edx,%edx
 8052549:	89 45 14             	mov    %eax,0x14(%ebp)
 805254c:	e9 07 fb ff ff       	jmp    8052058 <_vfiprintf_r+0x268>
 8052551:	89 f9                	mov    %edi,%ecx
 8052553:	85 c0                	test   %eax,%eax
 8052555:	89 55 10             	mov    %edx,0x10(%ebp)
 8052558:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 805255e:	0f 84 95 01 00 00    	je     80526f9 <_vfiprintf_r+0x909>
 8052564:	88 45 80             	mov    %al,-0x80(%ebp)
 8052567:	8d 45 80             	lea    -0x80(%ebp),%eax
 805256a:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8052571:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 8052578:	00 00 00 
 805257b:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 8052582:	00 00 00 
 8052585:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 805258b:	e9 7f fe ff ff       	jmp    805240f <_vfiprintf_r+0x61f>
 8052590:	8b 45 14             	mov    0x14(%ebp),%eax
 8052593:	8b bd 50 ff ff ff    	mov    -0xb0(%ebp),%edi
 8052599:	8b 00                	mov    (%eax),%eax
 805259b:	89 38                	mov    %edi,(%eax)
 805259d:	8b 45 14             	mov    0x14(%ebp),%eax
 80525a0:	83 c0 04             	add    $0x4,%eax
 80525a3:	89 45 14             	mov    %eax,0x14(%ebp)
 80525a6:	e9 e4 f8 ff ff       	jmp    8051e8f <_vfiprintf_r+0x9f>
 80525ab:	90                   	nop
 80525ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80525b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80525b3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80525b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80525bc:	e8 1f f7 ff ff       	call   8051ce0 <__sprint_r.part.0>
 80525c1:	85 c0                	test   %eax,%eax
 80525c3:	0f 85 4f 01 00 00    	jne    8052718 <_vfiprintf_r+0x928>
 80525c9:	8b bd 78 ff ff ff    	mov    -0x88(%ebp),%edi
 80525cf:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80525d2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80525d8:	8d 47 01             	lea    0x1(%edi),%eax
 80525db:	e9 88 fb ff ff       	jmp    8052168 <_vfiprintf_r+0x378>
 80525e0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80525e6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80525ec:	8d 48 01             	lea    0x1(%eax),%ecx
 80525ef:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
 80525f6:	74 2f                	je     8052627 <_vfiprintf_r+0x837>
 80525f8:	83 c2 01             	add    $0x1,%edx
 80525fb:	83 f9 07             	cmp    $0x7,%ecx
 80525fe:	8d 85 71 ff ff ff    	lea    -0x8f(%ebp),%eax
 8052604:	89 06                	mov    %eax,(%esi)
 8052606:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
 805260d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052613:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052619:	0f 8f 41 04 00 00    	jg     8052a60 <_vfiprintf_r+0xc70>
 805261f:	89 c8                	mov    %ecx,%eax
 8052621:	83 c6 08             	add    $0x8,%esi
 8052624:	83 c1 01             	add    $0x1,%ecx
 8052627:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
 805262d:	85 db                	test   %ebx,%ebx
 805262f:	74 2f                	je     8052660 <_vfiprintf_r+0x870>
 8052631:	83 c2 02             	add    $0x2,%edx
 8052634:	83 f9 07             	cmp    $0x7,%ecx
 8052637:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
 805263d:	89 06                	mov    %eax,(%esi)
 805263f:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
 8052646:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805264c:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052652:	0f 8f 20 04 00 00    	jg     8052a78 <_vfiprintf_r+0xc88>
 8052658:	89 c8                	mov    %ecx,%eax
 805265a:	83 c6 08             	add    $0x8,%esi
 805265d:	83 c1 01             	add    $0x1,%ecx
 8052660:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
 8052667:	00 00 00 
 805266a:	0f 84 28 03 00 00    	je     8052998 <_vfiprintf_r+0xba8>
 8052670:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 8052676:	2b 9d 58 ff ff ff    	sub    -0xa8(%ebp),%ebx
 805267c:	85 db                	test   %ebx,%ebx
 805267e:	7f 13                	jg     8052693 <_vfiprintf_r+0x8a3>
 8052680:	e9 db 00 00 00       	jmp    8052760 <_vfiprintf_r+0x970>
 8052685:	8d 76 00             	lea    0x0(%esi),%esi
 8052688:	8d 48 02             	lea    0x2(%eax),%ecx
 805268b:	83 c6 08             	add    $0x8,%esi
 805268e:	89 f8                	mov    %edi,%eax
 8052690:	83 eb 10             	sub    $0x10,%ebx
 8052693:	83 fb 10             	cmp    $0x10,%ebx
 8052696:	c7 06 10 4e 05 08    	movl   $0x8054e10,(%esi)
 805269c:	0f 8e 4e 02 00 00    	jle    80528f0 <_vfiprintf_r+0xb00>
 80526a2:	8d 78 01             	lea    0x1(%eax),%edi
 80526a5:	83 c2 10             	add    $0x10,%edx
 80526a8:	83 ff 07             	cmp    $0x7,%edi
 80526ab:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80526b2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80526b8:	89 bd 78 ff ff ff    	mov    %edi,-0x88(%ebp)
 80526be:	7e c8                	jle    8052688 <_vfiprintf_r+0x898>
 80526c0:	85 d2                	test   %edx,%edx
 80526c2:	75 0c                	jne    80526d0 <_vfiprintf_r+0x8e0>
 80526c4:	b9 01 00 00 00       	mov    $0x1,%ecx
 80526c9:	31 c0                	xor    %eax,%eax
 80526cb:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80526ce:	eb c0                	jmp    8052690 <_vfiprintf_r+0x8a0>
 80526d0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80526d3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80526d9:	8b 45 08             	mov    0x8(%ebp),%eax
 80526dc:	e8 ff f5 ff ff       	call   8051ce0 <__sprint_r.part.0>
 80526e1:	85 c0                	test   %eax,%eax
 80526e3:	75 33                	jne    8052718 <_vfiprintf_r+0x928>
 80526e5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80526eb:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80526ee:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80526f4:	8d 48 01             	lea    0x1(%eax),%ecx
 80526f7:	eb 97                	jmp    8052690 <_vfiprintf_r+0x8a0>
 80526f9:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 80526ff:	85 c0                	test   %eax,%eax
 8052701:	74 15                	je     8052718 <_vfiprintf_r+0x928>
 8052703:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052706:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 805270c:	8b 45 08             	mov    0x8(%ebp),%eax
 805270f:	e8 cc f5 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052718:	8b 45 0c             	mov    0xc(%ebp),%eax
 805271b:	f6 40 0c 40          	testb  $0x40,0xc(%eax)
 805271f:	0f 85 a3 f8 ff ff    	jne    8051fc8 <_vfiprintf_r+0x1d8>
 8052725:	8b 85 50 ff ff ff    	mov    -0xb0(%ebp),%eax
 805272b:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8052731:	5b                   	pop    %ebx
 8052732:	5e                   	pop    %esi
 8052733:	5f                   	pop    %edi
 8052734:	5d                   	pop    %ebp
 8052735:	c3                   	ret    
 8052736:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052739:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 805273f:	8b 45 08             	mov    0x8(%ebp),%eax
 8052742:	e8 99 f5 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052747:	85 c0                	test   %eax,%eax
 8052749:	75 cd                	jne    8052718 <_vfiprintf_r+0x928>
 805274b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052751:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052754:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 805275a:	8d 48 01             	lea    0x1(%eax),%ecx
 805275d:	8d 76 00             	lea    0x0(%esi),%esi
 8052760:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052766:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 805276c:	89 06                	mov    %eax,(%esi)
 805276e:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 8052774:	01 c2                	add    %eax,%edx
 8052776:	83 f9 07             	cmp    $0x7,%ecx
 8052779:	89 46 04             	mov    %eax,0x4(%esi)
 805277c:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052782:	0f 8e ef 01 00 00    	jle    8052977 <_vfiprintf_r+0xb87>
 8052788:	85 d2                	test   %edx,%edx
 805278a:	0f 85 81 03 00 00    	jne    8052b11 <_vfiprintf_r+0xd21>
 8052790:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8052797:	00 00 00 
 805279a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805279d:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
 80527a4:	0f 84 ce 00 00 00    	je     8052878 <_vfiprintf_r+0xa88>
 80527aa:	8b 9d 54 ff ff ff    	mov    -0xac(%ebp),%ebx
 80527b0:	2b 9d 60 ff ff ff    	sub    -0xa0(%ebp),%ebx
 80527b6:	85 db                	test   %ebx,%ebx
 80527b8:	0f 8e ba 00 00 00    	jle    8052878 <_vfiprintf_r+0xa88>
 80527be:	8b 8d 78 ff ff ff    	mov    -0x88(%ebp),%ecx
 80527c4:	83 fb 10             	cmp    $0x10,%ebx
 80527c7:	8d 79 01             	lea    0x1(%ecx),%edi
 80527ca:	7f 14                	jg     80527e0 <_vfiprintf_r+0x9f0>
 80527cc:	eb 50                	jmp    805281e <_vfiprintf_r+0xa2e>
 80527ce:	66 90                	xchg   %ax,%ax
 80527d0:	8d 79 02             	lea    0x2(%ecx),%edi
 80527d3:	83 c6 08             	add    $0x8,%esi
 80527d6:	89 c1                	mov    %eax,%ecx
 80527d8:	83 eb 10             	sub    $0x10,%ebx
 80527db:	83 fb 10             	cmp    $0x10,%ebx
 80527de:	7e 3e                	jle    805281e <_vfiprintf_r+0xa2e>
 80527e0:	8d 41 01             	lea    0x1(%ecx),%eax
 80527e3:	83 c2 10             	add    $0x10,%edx
 80527e6:	83 f8 07             	cmp    $0x7,%eax
 80527e9:	c7 06 20 4e 05 08    	movl   $0x8054e20,(%esi)
 80527ef:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80527f6:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80527fc:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8052802:	7e cc                	jle    80527d0 <_vfiprintf_r+0x9e0>
 8052804:	85 d2                	test   %edx,%edx
 8052806:	0f 85 b4 00 00 00    	jne    80528c0 <_vfiprintf_r+0xad0>
 805280c:	83 eb 10             	sub    $0x10,%ebx
 805280f:	31 c9                	xor    %ecx,%ecx
 8052811:	83 fb 10             	cmp    $0x10,%ebx
 8052814:	bf 01 00 00 00       	mov    $0x1,%edi
 8052819:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805281c:	7f c2                	jg     80527e0 <_vfiprintf_r+0x9f0>
 805281e:	01 da                	add    %ebx,%edx
 8052820:	83 ff 07             	cmp    $0x7,%edi
 8052823:	c7 06 20 4e 05 08    	movl   $0x8054e20,(%esi)
 8052829:	89 5e 04             	mov    %ebx,0x4(%esi)
 805282c:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052832:	89 bd 78 ff ff ff    	mov    %edi,-0x88(%ebp)
 8052838:	7e 3e                	jle    8052878 <_vfiprintf_r+0xa88>
 805283a:	85 d2                	test   %edx,%edx
 805283c:	75 19                	jne    8052857 <_vfiprintf_r+0xa67>
 805283e:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 8052844:	8b bd 60 ff ff ff    	mov    -0xa0(%ebp),%edi
 805284a:	39 c7                	cmp    %eax,%edi
 805284c:	0f 4d c7             	cmovge %edi,%eax
 805284f:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 8052855:	eb 55                	jmp    80528ac <_vfiprintf_r+0xabc>
 8052857:	8b 55 0c             	mov    0xc(%ebp),%edx
 805285a:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052860:	8b 45 08             	mov    0x8(%ebp),%eax
 8052863:	e8 78 f4 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052868:	85 c0                	test   %eax,%eax
 805286a:	0f 85 a8 fe ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052870:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052876:	66 90                	xchg   %ax,%ax
 8052878:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 805287e:	8b bd 60 ff ff ff    	mov    -0xa0(%ebp),%edi
 8052884:	39 c7                	cmp    %eax,%edi
 8052886:	0f 4d c7             	cmovge %edi,%eax
 8052889:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 805288f:	85 d2                	test   %edx,%edx
 8052891:	74 19                	je     80528ac <_vfiprintf_r+0xabc>
 8052893:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052896:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 805289c:	8b 45 08             	mov    0x8(%ebp),%eax
 805289f:	e8 3c f4 ff ff       	call   8051ce0 <__sprint_r.part.0>
 80528a4:	85 c0                	test   %eax,%eax
 80528a6:	0f 85 6c fe ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 80528ac:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 80528b3:	00 00 00 
 80528b6:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80528b9:	e9 d1 f5 ff ff       	jmp    8051e8f <_vfiprintf_r+0x9f>
 80528be:	66 90                	xchg   %ax,%ax
 80528c0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80528c3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80528c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80528cc:	e8 0f f4 ff ff       	call   8051ce0 <__sprint_r.part.0>
 80528d1:	85 c0                	test   %eax,%eax
 80528d3:	0f 85 3f fe ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 80528d9:	8b 8d 78 ff ff ff    	mov    -0x88(%ebp),%ecx
 80528df:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80528e2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80528e8:	8d 79 01             	lea    0x1(%ecx),%edi
 80528eb:	e9 e8 fe ff ff       	jmp    80527d8 <_vfiprintf_r+0x9e8>
 80528f0:	01 da                	add    %ebx,%edx
 80528f2:	83 f9 07             	cmp    $0x7,%ecx
 80528f5:	89 5e 04             	mov    %ebx,0x4(%esi)
 80528f8:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80528fe:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052904:	7f 42                	jg     8052948 <_vfiprintf_r+0xb58>
 8052906:	83 c6 08             	add    $0x8,%esi
 8052909:	83 c1 01             	add    $0x1,%ecx
 805290c:	e9 4f fe ff ff       	jmp    8052760 <_vfiprintf_r+0x970>
 8052911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8052918:	84 d2                	test   %dl,%dl
 805291a:	75 64                	jne    8052980 <_vfiprintf_r+0xb90>
 805291c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8052923:	74 5b                	je     8052980 <_vfiprintf_r+0xb90>
 8052925:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 805292b:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 805292f:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052935:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8052938:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 805293e:	e9 8d f7 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052943:	90                   	nop
 8052944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052948:	85 d2                	test   %edx,%edx
 805294a:	0f 85 e6 fd ff ff    	jne    8052736 <_vfiprintf_r+0x946>
 8052950:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052956:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052959:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
 8052960:	00 00 00 
 8052963:	89 45 a8             	mov    %eax,-0x58(%ebp)
 8052966:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 805296c:	89 45 ac             	mov    %eax,-0x54(%ebp)
 805296f:	89 c2                	mov    %eax,%edx
 8052971:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
 8052977:	83 c6 08             	add    $0x8,%esi
 805297a:	e9 1e fe ff ff       	jmp    805279d <_vfiprintf_r+0x9ad>
 805297f:	90                   	nop
 8052980:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052983:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
 805298a:	00 00 00 
 805298d:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 8052993:	e9 38 f7 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052998:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 805299e:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 80529a4:	85 ff                	test   %edi,%edi
 80529a6:	0f 8e c4 fc ff ff    	jle    8052670 <_vfiprintf_r+0x880>
 80529ac:	83 ff 10             	cmp    $0x10,%edi
 80529af:	7f 17                	jg     80529c8 <_vfiprintf_r+0xbd8>
 80529b1:	e9 88 03 00 00       	jmp    8052d3e <_vfiprintf_r+0xf4e>
 80529b6:	66 90                	xchg   %ax,%ax
 80529b8:	8d 58 02             	lea    0x2(%eax),%ebx
 80529bb:	83 c6 08             	add    $0x8,%esi
 80529be:	89 c8                	mov    %ecx,%eax
 80529c0:	83 ef 10             	sub    $0x10,%edi
 80529c3:	83 ff 10             	cmp    $0x10,%edi
 80529c6:	7e 3a                	jle    8052a02 <_vfiprintf_r+0xc12>
 80529c8:	8d 48 01             	lea    0x1(%eax),%ecx
 80529cb:	83 c2 10             	add    $0x10,%edx
 80529ce:	83 f9 07             	cmp    $0x7,%ecx
 80529d1:	c7 06 10 4e 05 08    	movl   $0x8054e10,(%esi)
 80529d7:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80529de:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80529e4:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 80529ea:	7e cc                	jle    80529b8 <_vfiprintf_r+0xbc8>
 80529ec:	85 d2                	test   %edx,%edx
 80529ee:	75 40                	jne    8052a30 <_vfiprintf_r+0xc40>
 80529f0:	83 ef 10             	sub    $0x10,%edi
 80529f3:	31 c0                	xor    %eax,%eax
 80529f5:	83 ff 10             	cmp    $0x10,%edi
 80529f8:	bb 01 00 00 00       	mov    $0x1,%ebx
 80529fd:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a00:	7f c6                	jg     80529c8 <_vfiprintf_r+0xbd8>
 8052a02:	01 fa                	add    %edi,%edx
 8052a04:	83 fb 07             	cmp    $0x7,%ebx
 8052a07:	c7 06 10 4e 05 08    	movl   $0x8054e10,(%esi)
 8052a0d:	89 7e 04             	mov    %edi,0x4(%esi)
 8052a10:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052a16:	89 9d 78 ff ff ff    	mov    %ebx,-0x88(%ebp)
 8052a1c:	0f 8f 97 01 00 00    	jg     8052bb9 <_vfiprintf_r+0xdc9>
 8052a22:	83 c6 08             	add    $0x8,%esi
 8052a25:	89 d8                	mov    %ebx,%eax
 8052a27:	8d 4b 01             	lea    0x1(%ebx),%ecx
 8052a2a:	e9 41 fc ff ff       	jmp    8052670 <_vfiprintf_r+0x880>
 8052a2f:	90                   	nop
 8052a30:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052a33:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052a39:	8b 45 08             	mov    0x8(%ebp),%eax
 8052a3c:	e8 9f f2 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052a41:	85 c0                	test   %eax,%eax
 8052a43:	0f 85 cf fc ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052a49:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052a4f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a52:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052a58:	8d 58 01             	lea    0x1(%eax),%ebx
 8052a5b:	e9 60 ff ff ff       	jmp    80529c0 <_vfiprintf_r+0xbd0>
 8052a60:	85 d2                	test   %edx,%edx
 8052a62:	0f 85 f1 00 00 00    	jne    8052b59 <_vfiprintf_r+0xd69>
 8052a68:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052a6d:	31 c0                	xor    %eax,%eax
 8052a6f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a72:	e9 b0 fb ff ff       	jmp    8052627 <_vfiprintf_r+0x837>
 8052a77:	90                   	nop
 8052a78:	85 d2                	test   %edx,%edx
 8052a7a:	0f 85 09 01 00 00    	jne    8052b89 <_vfiprintf_r+0xd99>
 8052a80:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052a85:	31 c0                	xor    %eax,%eax
 8052a87:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a8a:	e9 d1 fb ff ff       	jmp    8052660 <_vfiprintf_r+0x870>
 8052a8f:	90                   	nop
 8052a90:	89 c2                	mov    %eax,%edx
 8052a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8052a98:	89 c8                	mov    %ecx,%eax
 8052a9a:	83 ea 01             	sub    $0x1,%edx
 8052a9d:	83 e0 07             	and    $0x7,%eax
 8052aa0:	c1 e9 03             	shr    $0x3,%ecx
 8052aa3:	83 c0 30             	add    $0x30,%eax
 8052aa6:	85 c9                	test   %ecx,%ecx
 8052aa8:	88 02                	mov    %al,(%edx)
 8052aaa:	75 ec                	jne    8052a98 <_vfiprintf_r+0xca8>
 8052aac:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8052ab3:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 8052ab9:	0f 85 5b 01 00 00    	jne    8052c1a <_vfiprintf_r+0xe2a>
 8052abf:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052ac2:	29 d0                	sub    %edx,%eax
 8052ac4:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052aca:	e9 01 f6 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052acf:	90                   	nop
 8052ad0:	85 d2                	test   %edx,%edx
 8052ad2:	0f 85 7d 01 00 00    	jne    8052c55 <_vfiprintf_r+0xe65>
 8052ad8:	31 c0                	xor    %eax,%eax
 8052ada:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052adf:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052ae2:	e9 08 fb ff ff       	jmp    80525ef <_vfiprintf_r+0x7ff>
 8052ae7:	90                   	nop
 8052ae8:	83 f9 09             	cmp    $0x9,%ecx
 8052aeb:	0f 87 df 00 00 00    	ja     8052bd0 <_vfiprintf_r+0xde0>
 8052af1:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 8052af7:	83 c1 30             	add    $0x30,%ecx
 8052afa:	88 4d a7             	mov    %cl,-0x59(%ebp)
 8052afd:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052b03:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8052b06:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 8052b0c:	e9 bf f5 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052b11:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b14:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b1a:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b1d:	e8 be f1 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052b22:	85 c0                	test   %eax,%eax
 8052b24:	0f 85 ee fb ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052b2a:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052b30:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b33:	e9 65 fc ff ff       	jmp    805279d <_vfiprintf_r+0x9ad>
 8052b38:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b3b:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b41:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b44:	e8 97 f1 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052b49:	85 c0                	test   %eax,%eax
 8052b4b:	0f 85 c7 fb ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052b51:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b54:	e9 98 f3 ff ff       	jmp    8051ef1 <_vfiprintf_r+0x101>
 8052b59:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b5c:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b62:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b65:	e8 76 f1 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052b6a:	85 c0                	test   %eax,%eax
 8052b6c:	0f 85 a6 fb ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052b72:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052b78:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b7b:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052b81:	8d 48 01             	lea    0x1(%eax),%ecx
 8052b84:	e9 9e fa ff ff       	jmp    8052627 <_vfiprintf_r+0x837>
 8052b89:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b8c:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b92:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b95:	e8 46 f1 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052b9a:	85 c0                	test   %eax,%eax
 8052b9c:	0f 85 76 fb ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052ba2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052ba8:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052bab:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052bb1:	8d 48 01             	lea    0x1(%eax),%ecx
 8052bb4:	e9 a7 fa ff ff       	jmp    8052660 <_vfiprintf_r+0x870>
 8052bb9:	85 d2                	test   %edx,%edx
 8052bbb:	0f 85 f1 00 00 00    	jne    8052cb2 <_vfiprintf_r+0xec2>
 8052bc1:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052bc6:	31 c0                	xor    %eax,%eax
 8052bc8:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052bcb:	e9 a0 fa ff ff       	jmp    8052670 <_vfiprintf_r+0x880>
 8052bd0:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052bd3:	bb cd cc cc cc       	mov    $0xcccccccd,%ebx
 8052bd8:	89 b5 60 ff ff ff    	mov    %esi,-0xa0(%ebp)
 8052bde:	89 c6                	mov    %eax,%esi
 8052be0:	89 c8                	mov    %ecx,%eax
 8052be2:	83 ee 01             	sub    $0x1,%esi
 8052be5:	f7 e3                	mul    %ebx
 8052be7:	c1 ea 03             	shr    $0x3,%edx
 8052bea:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8052bed:	01 c0                	add    %eax,%eax
 8052bef:	29 c1                	sub    %eax,%ecx
 8052bf1:	83 c1 30             	add    $0x30,%ecx
 8052bf4:	85 d2                	test   %edx,%edx
 8052bf6:	88 0e                	mov    %cl,(%esi)
 8052bf8:	89 d1                	mov    %edx,%ecx
 8052bfa:	75 e4                	jne    8052be0 <_vfiprintf_r+0xdf0>
 8052bfc:	89 f1                	mov    %esi,%ecx
 8052bfe:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052c01:	29 c8                	sub    %ecx,%eax
 8052c03:	89 b5 44 ff ff ff    	mov    %esi,-0xbc(%ebp)
 8052c09:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
 8052c0f:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052c15:	e9 b6 f4 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052c1a:	3c 30                	cmp    $0x30,%al
 8052c1c:	74 0b                	je     8052c29 <_vfiprintf_r+0xe39>
 8052c1e:	83 ad 44 ff ff ff 01 	subl   $0x1,-0xbc(%ebp)
 8052c25:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 8052c29:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052c2c:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 8052c32:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052c38:	e9 93 f4 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052c3d:	f7 d9                	neg    %ecx
 8052c3f:	bf 2d 00 00 00       	mov    $0x2d,%edi
 8052c44:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
 8052c4b:	ba 01 00 00 00       	mov    $0x1,%edx
 8052c50:	e9 0c f4 ff ff       	jmp    8052061 <_vfiprintf_r+0x271>
 8052c55:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052c58:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052c5e:	8b 45 08             	mov    0x8(%ebp),%eax
 8052c61:	e8 7a f0 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052c66:	85 c0                	test   %eax,%eax
 8052c68:	0f 85 aa fa ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052c6e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052c74:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052c77:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052c7d:	8d 48 01             	lea    0x1(%eax),%ecx
 8052c80:	e9 6a f9 ff ff       	jmp    80525ef <_vfiprintf_r+0x7ff>
 8052c85:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052c8b:	89 04 24             	mov    %eax,(%esp)
 8052c8e:	e8 4d 65 ff ff       	call   80491e0 <strlen>
 8052c93:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052c9a:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052c9d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052ca4:	00 00 00 
 8052ca7:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052cad:	e9 1e f4 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052cb2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052cb5:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052cbb:	8b 45 08             	mov    0x8(%ebp),%eax
 8052cbe:	e8 1d f0 ff ff       	call   8051ce0 <__sprint_r.part.0>
 8052cc3:	85 c0                	test   %eax,%eax
 8052cc5:	0f 85 4d fa ff ff    	jne    8052718 <_vfiprintf_r+0x928>
 8052ccb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052cd1:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052cd4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052cda:	8d 48 01             	lea    0x1(%eax),%ecx
 8052cdd:	e9 8e f9 ff ff       	jmp    8052670 <_vfiprintf_r+0x880>
 8052ce2:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8052ce8:	b0 06                	mov    $0x6,%al
 8052cea:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052ced:	83 ff 06             	cmp    $0x6,%edi
 8052cf0:	0f 46 c7             	cmovbe %edi,%eax
 8052cf3:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 8052cf9:	85 c0                	test   %eax,%eax
 8052cfb:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052d01:	c7 85 44 ff ff ff 5e 	movl   $0x805465e,-0xbc(%ebp)
 8052d08:	46 05 08 
 8052d0b:	0f 49 f8             	cmovns %eax,%edi
 8052d0e:	89 bd 60 ff ff ff    	mov    %edi,-0xa0(%ebp)
 8052d14:	e9 f6 f6 ff ff       	jmp    805240f <_vfiprintf_r+0x61f>
 8052d19:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8052d1f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052d26:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052d29:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052d30:	00 00 00 
 8052d33:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052d39:	e9 92 f3 ff ff       	jmp    80520d0 <_vfiprintf_r+0x2e0>
 8052d3e:	89 cb                	mov    %ecx,%ebx
 8052d40:	e9 bd fc ff ff       	jmp    8052a02 <_vfiprintf_r+0xc12>
 8052d45:	89 da                	mov    %ebx,%edx
 8052d47:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052d4e:	00 00 00 
 8052d51:	e9 da f1 ff ff       	jmp    8051f30 <_vfiprintf_r+0x140>
 8052d56:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052d59:	89 da                	mov    %ebx,%edx
 8052d5b:	8b 45 14             	mov    0x14(%ebp),%eax
 8052d5e:	8b 09                	mov    (%ecx),%ecx
 8052d60:	83 c0 04             	add    $0x4,%eax
 8052d63:	89 45 14             	mov    %eax,0x14(%ebp)
 8052d66:	85 c9                	test   %ecx,%ecx
 8052d68:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 8052d6e:	0f 89 f3 f1 ff ff    	jns    8051f67 <_vfiprintf_r+0x177>
 8052d74:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8052d7b:	ff ff ff 
 8052d7e:	89 d3                	mov    %edx,%ebx
 8052d80:	e9 a5 f1 ff ff       	jmp    8051f2a <_vfiprintf_r+0x13a>
 8052d85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08052d90 <vfiprintf>:
 8052d90:	55                   	push   %ebp
 8052d91:	89 e5                	mov    %esp,%ebp
 8052d93:	83 ec 18             	sub    $0x18,%esp
 8052d96:	e8 55 c4 ff ff       	call   804f1f0 <__getreent>
 8052d9b:	8b 55 10             	mov    0x10(%ebp),%edx
 8052d9e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8052da2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052da5:	89 04 24             	mov    %eax,(%esp)
 8052da8:	89 54 24 08          	mov    %edx,0x8(%esp)
 8052dac:	8b 55 08             	mov    0x8(%ebp),%edx
 8052daf:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052db3:	e8 38 f0 ff ff       	call   8051df0 <_vfiprintf_r>
 8052db8:	c9                   	leave  
 8052db9:	c3                   	ret    
 8052dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08052dc0 <__sbprintf>:
 8052dc0:	55                   	push   %ebp
 8052dc1:	89 e5                	mov    %esp,%ebp
 8052dc3:	57                   	push   %edi
 8052dc4:	89 c7                	mov    %eax,%edi
 8052dc6:	56                   	push   %esi
 8052dc7:	53                   	push   %ebx
 8052dc8:	89 d3                	mov    %edx,%ebx
 8052dca:	81 ec 9c 04 00 00    	sub    $0x49c,%esp
 8052dd0:	0f b7 42 0c          	movzwl 0xc(%edx),%eax
 8052dd4:	c7 85 88 fb ff ff 00 	movl   $0x400,-0x478(%ebp)
 8052ddb:	04 00 00 
 8052dde:	c7 85 94 fb ff ff 00 	movl   $0x400,-0x46c(%ebp)
 8052de5:	04 00 00 
 8052de8:	c7 85 98 fb ff ff 00 	movl   $0x0,-0x468(%ebp)
 8052def:	00 00 00 
 8052df2:	83 e0 fd             	and    $0xfffffffd,%eax
 8052df5:	66 89 85 8c fb ff ff 	mov    %ax,-0x474(%ebp)
 8052dfc:	8b 42 64             	mov    0x64(%edx),%eax
 8052dff:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 8052e05:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
 8052e09:	66 89 85 8e fb ff ff 	mov    %ax,-0x472(%ebp)
 8052e10:	8b 42 1c             	mov    0x1c(%edx),%eax
 8052e13:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
 8052e19:	8b 42 24             	mov    0x24(%edx),%eax
 8052e1c:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
 8052e22:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8052e26:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052e2a:	89 3c 24             	mov    %edi,(%esp)
 8052e2d:	89 85 a4 fb ff ff    	mov    %eax,-0x45c(%ebp)
 8052e33:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 8052e39:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
 8052e3f:	89 85 90 fb ff ff    	mov    %eax,-0x470(%ebp)
 8052e45:	8b 45 08             	mov    0x8(%ebp),%eax
 8052e48:	89 95 74 fb ff ff    	mov    %edx,-0x48c(%ebp)
 8052e4e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8052e52:	e8 99 ef ff ff       	call   8051df0 <_vfiprintf_r>
 8052e57:	85 c0                	test   %eax,%eax
 8052e59:	89 c6                	mov    %eax,%esi
 8052e5b:	78 1c                	js     8052e79 <__sbprintf+0xb9>
 8052e5d:	8b 95 74 fb ff ff    	mov    -0x48c(%ebp),%edx
 8052e63:	89 3c 24             	mov    %edi,(%esp)
 8052e66:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052e6a:	e8 71 ba ff ff       	call   804e8e0 <_fflush_r>
 8052e6f:	85 c0                	test   %eax,%eax
 8052e71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8052e76:	0f 45 f0             	cmovne %eax,%esi
 8052e79:	f6 85 8c fb ff ff 40 	testb  $0x40,-0x474(%ebp)
 8052e80:	74 05                	je     8052e87 <__sbprintf+0xc7>
 8052e82:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 8052e87:	81 c4 9c 04 00 00    	add    $0x49c,%esp
 8052e8d:	89 f0                	mov    %esi,%eax
 8052e8f:	5b                   	pop    %ebx
 8052e90:	5e                   	pop    %esi
 8052e91:	5f                   	pop    %edi
 8052e92:	5d                   	pop    %ebp
 8052e93:	c3                   	ret    
 8052e94:	66 90                	xchg   %ax,%ax
 8052e96:	66 90                	xchg   %ax,%ax
 8052e98:	66 90                	xchg   %ax,%ax
 8052e9a:	66 90                	xchg   %ax,%ax
 8052e9c:	66 90                	xchg   %ax,%ax
 8052e9e:	66 90                	xchg   %ax,%ax

08052ea0 <_write_r>:
 8052ea0:	55                   	push   %ebp
 8052ea1:	89 e5                	mov    %esp,%ebp
 8052ea3:	83 ec 18             	sub    $0x18,%esp
 8052ea6:	8b 45 14             	mov    0x14(%ebp),%eax
 8052ea9:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 8052eb0:	00 00 00 
 8052eb3:	89 44 24 08          	mov    %eax,0x8(%esp)
 8052eb7:	8b 45 10             	mov    0x10(%ebp),%eax
 8052eba:	89 44 24 04          	mov    %eax,0x4(%esp)
 8052ebe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8052ec1:	89 04 24             	mov    %eax,(%esp)
 8052ec4:	e8 07 55 ff ff       	call   80483d0 <write>
 8052ec9:	83 f8 ff             	cmp    $0xffffffff,%eax
 8052ecc:	74 02                	je     8052ed0 <_write_r+0x30>
 8052ece:	c9                   	leave  
 8052ecf:	c3                   	ret    
 8052ed0:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 8052ed6:	85 d2                	test   %edx,%edx
 8052ed8:	74 f4                	je     8052ece <_write_r+0x2e>
 8052eda:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8052edd:	89 11                	mov    %edx,(%ecx)
 8052edf:	c9                   	leave  
 8052ee0:	c3                   	ret    
 8052ee1:	66 90                	xchg   %ax,%ax
 8052ee3:	66 90                	xchg   %ax,%ax
 8052ee5:	66 90                	xchg   %ax,%ax
 8052ee7:	66 90                	xchg   %ax,%ax
 8052ee9:	66 90                	xchg   %ax,%ax
 8052eeb:	66 90                	xchg   %ax,%ax
 8052eed:	66 90                	xchg   %ax,%ax
 8052eef:	90                   	nop

08052ef0 <_calloc_r>:
 8052ef0:	55                   	push   %ebp
 8052ef1:	89 e5                	mov    %esp,%ebp
 8052ef3:	53                   	push   %ebx
 8052ef4:	83 ec 14             	sub    $0x14,%esp
 8052ef7:	8b 45 10             	mov    0x10(%ebp),%eax
 8052efa:	0f af 45 0c          	imul   0xc(%ebp),%eax
 8052efe:	89 44 24 04          	mov    %eax,0x4(%esp)
 8052f02:	8b 45 08             	mov    0x8(%ebp),%eax
 8052f05:	89 04 24             	mov    %eax,(%esp)
 8052f08:	e8 43 c5 ff ff       	call   804f450 <_malloc_r>
 8052f0d:	85 c0                	test   %eax,%eax
 8052f0f:	89 c3                	mov    %eax,%ebx
 8052f11:	0f 84 91 00 00 00    	je     8052fa8 <_calloc_r+0xb8>
 8052f17:	8b 40 fc             	mov    -0x4(%eax),%eax
 8052f1a:	83 e0 fc             	and    $0xfffffffc,%eax
 8052f1d:	83 e8 04             	sub    $0x4,%eax
 8052f20:	83 f8 24             	cmp    $0x24,%eax
 8052f23:	77 63                	ja     8052f88 <_calloc_r+0x98>
 8052f25:	83 f8 13             	cmp    $0x13,%eax
 8052f28:	89 da                	mov    %ebx,%edx
 8052f2a:	77 1c                	ja     8052f48 <_calloc_r+0x58>
 8052f2c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
 8052f32:	89 d8                	mov    %ebx,%eax
 8052f34:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
 8052f3b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8052f42:	83 c4 14             	add    $0x14,%esp
 8052f45:	5b                   	pop    %ebx
 8052f46:	5d                   	pop    %ebp
 8052f47:	c3                   	ret    
 8052f48:	83 f8 1b             	cmp    $0x1b,%eax
 8052f4b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 8052f51:	8d 53 08             	lea    0x8(%ebx),%edx
 8052f54:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 8052f5b:	76 cf                	jbe    8052f2c <_calloc_r+0x3c>
 8052f5d:	83 f8 24             	cmp    $0x24,%eax
 8052f60:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8052f67:	8d 53 10             	lea    0x10(%ebx),%edx
 8052f6a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
 8052f71:	75 b9                	jne    8052f2c <_calloc_r+0x3c>
 8052f73:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 8052f7a:	8d 53 18             	lea    0x18(%ebx),%edx
 8052f7d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 8052f84:	eb a6                	jmp    8052f2c <_calloc_r+0x3c>
 8052f86:	66 90                	xchg   %ax,%ax
 8052f88:	89 1c 24             	mov    %ebx,(%esp)
 8052f8b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8052f8f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8052f96:	00 
 8052f97:	e8 a8 5f ff ff       	call   8048f44 <memset>
 8052f9c:	83 c4 14             	add    $0x14,%esp
 8052f9f:	89 d8                	mov    %ebx,%eax
 8052fa1:	5b                   	pop    %ebx
 8052fa2:	5d                   	pop    %ebp
 8052fa3:	c3                   	ret    
 8052fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052fa8:	31 c0                	xor    %eax,%eax
 8052faa:	eb 96                	jmp    8052f42 <_calloc_r+0x52>
 8052fac:	66 90                	xchg   %ax,%ax
 8052fae:	66 90                	xchg   %ax,%ax

08052fb0 <_close_r>:
 8052fb0:	55                   	push   %ebp
 8052fb1:	89 e5                	mov    %esp,%ebp
 8052fb3:	83 ec 18             	sub    $0x18,%esp
 8052fb6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8052fb9:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 8052fc0:	00 00 00 
 8052fc3:	89 04 24             	mov    %eax,(%esp)
 8052fc6:	e8 85 54 ff ff       	call   8048450 <close>
 8052fcb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8052fce:	74 08                	je     8052fd8 <_close_r+0x28>
 8052fd0:	c9                   	leave  
 8052fd1:	c3                   	ret    
 8052fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8052fd8:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 8052fde:	85 d2                	test   %edx,%edx
 8052fe0:	74 ee                	je     8052fd0 <_close_r+0x20>
 8052fe2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8052fe5:	89 11                	mov    %edx,(%ecx)
 8052fe7:	c9                   	leave  
 8052fe8:	c3                   	ret    
 8052fe9:	66 90                	xchg   %ax,%ax
 8052feb:	66 90                	xchg   %ax,%ax
 8052fed:	66 90                	xchg   %ax,%ax
 8052fef:	90                   	nop

08052ff0 <_fclose_r>:
 8052ff0:	55                   	push   %ebp
 8052ff1:	89 e5                	mov    %esp,%ebp
 8052ff3:	57                   	push   %edi
 8052ff4:	56                   	push   %esi
 8052ff5:	53                   	push   %ebx
 8052ff6:	83 ec 1c             	sub    $0x1c,%esp
 8052ff9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8052ffc:	8b 75 08             	mov    0x8(%ebp),%esi
 8052fff:	85 db                	test   %ebx,%ebx
 8053001:	74 16                	je     8053019 <_fclose_r+0x29>
 8053003:	85 f6                	test   %esi,%esi
 8053005:	74 0b                	je     8053012 <_fclose_r+0x22>
 8053007:	8b 56 38             	mov    0x38(%esi),%edx
 805300a:	85 d2                	test   %edx,%edx
 805300c:	0f 84 9e 00 00 00    	je     80530b0 <_fclose_r+0xc0>
 8053012:	66 83 7b 0c 00       	cmpw   $0x0,0xc(%ebx)
 8053017:	75 0f                	jne    8053028 <_fclose_r+0x38>
 8053019:	83 c4 1c             	add    $0x1c,%esp
 805301c:	31 c0                	xor    %eax,%eax
 805301e:	5b                   	pop    %ebx
 805301f:	5e                   	pop    %esi
 8053020:	5f                   	pop    %edi
 8053021:	5d                   	pop    %ebp
 8053022:	c3                   	ret    
 8053023:	90                   	nop
 8053024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053028:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805302c:	89 34 24             	mov    %esi,(%esp)
 805302f:	e8 ac b8 ff ff       	call   804e8e0 <_fflush_r>
 8053034:	89 c7                	mov    %eax,%edi
 8053036:	8b 43 2c             	mov    0x2c(%ebx),%eax
 8053039:	85 c0                	test   %eax,%eax
 805303b:	74 16                	je     8053053 <_fclose_r+0x63>
 805303d:	8b 53 1c             	mov    0x1c(%ebx),%edx
 8053040:	89 34 24             	mov    %esi,(%esp)
 8053043:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053047:	ff d0                	call   *%eax
 8053049:	85 c0                	test   %eax,%eax
 805304b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8053050:	0f 48 f8             	cmovs  %eax,%edi
 8053053:	f6 43 0c 80          	testb  $0x80,0xc(%ebx)
 8053057:	75 67                	jne    80530c0 <_fclose_r+0xd0>
 8053059:	8b 43 30             	mov    0x30(%ebx),%eax
 805305c:	85 c0                	test   %eax,%eax
 805305e:	74 1a                	je     805307a <_fclose_r+0x8a>
 8053060:	8d 53 40             	lea    0x40(%ebx),%edx
 8053063:	39 d0                	cmp    %edx,%eax
 8053065:	74 0c                	je     8053073 <_fclose_r+0x83>
 8053067:	89 44 24 04          	mov    %eax,0x4(%esp)
 805306b:	89 34 24             	mov    %esi,(%esp)
 805306e:	e8 2d be ff ff       	call   804eea0 <_free_r>
 8053073:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 805307a:	8b 43 44             	mov    0x44(%ebx),%eax
 805307d:	85 c0                	test   %eax,%eax
 805307f:	74 13                	je     8053094 <_fclose_r+0xa4>
 8053081:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053085:	89 34 24             	mov    %esi,(%esp)
 8053088:	e8 13 be ff ff       	call   804eea0 <_free_r>
 805308d:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
 8053094:	e8 97 bc ff ff       	call   804ed30 <__sfp_lock_acquire>
 8053099:	31 c0                	xor    %eax,%eax
 805309b:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 805309f:	e8 9c bc ff ff       	call   804ed40 <__sfp_lock_release>
 80530a4:	83 c4 1c             	add    $0x1c,%esp
 80530a7:	89 f8                	mov    %edi,%eax
 80530a9:	5b                   	pop    %ebx
 80530aa:	5e                   	pop    %esi
 80530ab:	5f                   	pop    %edi
 80530ac:	5d                   	pop    %ebp
 80530ad:	c3                   	ret    
 80530ae:	66 90                	xchg   %ax,%ax
 80530b0:	89 34 24             	mov    %esi,(%esp)
 80530b3:	e8 98 b9 ff ff       	call   804ea50 <__sinit>
 80530b8:	e9 55 ff ff ff       	jmp    8053012 <_fclose_r+0x22>
 80530bd:	8d 76 00             	lea    0x0(%esi),%esi
 80530c0:	8b 43 10             	mov    0x10(%ebx),%eax
 80530c3:	89 34 24             	mov    %esi,(%esp)
 80530c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80530ca:	e8 d1 bd ff ff       	call   804eea0 <_free_r>
 80530cf:	eb 88                	jmp    8053059 <_fclose_r+0x69>
 80530d1:	eb 0d                	jmp    80530e0 <fclose>
 80530d3:	90                   	nop
 80530d4:	90                   	nop
 80530d5:	90                   	nop
 80530d6:	90                   	nop
 80530d7:	90                   	nop
 80530d8:	90                   	nop
 80530d9:	90                   	nop
 80530da:	90                   	nop
 80530db:	90                   	nop
 80530dc:	90                   	nop
 80530dd:	90                   	nop
 80530de:	90                   	nop
 80530df:	90                   	nop

080530e0 <fclose>:
 80530e0:	55                   	push   %ebp
 80530e1:	89 e5                	mov    %esp,%ebp
 80530e3:	83 ec 18             	sub    $0x18,%esp
 80530e6:	e8 05 c1 ff ff       	call   804f1f0 <__getreent>
 80530eb:	8b 55 08             	mov    0x8(%ebp),%edx
 80530ee:	89 54 24 04          	mov    %edx,0x4(%esp)
 80530f2:	89 04 24             	mov    %eax,(%esp)
 80530f5:	e8 f6 fe ff ff       	call   8052ff0 <_fclose_r>
 80530fa:	c9                   	leave  
 80530fb:	c3                   	ret    
 80530fc:	66 90                	xchg   %ax,%ax
 80530fe:	66 90                	xchg   %ax,%ax

08053100 <_fputwc_r>:
 8053100:	55                   	push   %ebp
 8053101:	89 e5                	mov    %esp,%ebp
 8053103:	57                   	push   %edi
 8053104:	56                   	push   %esi
 8053105:	53                   	push   %ebx
 8053106:	83 ec 2c             	sub    $0x2c,%esp
 8053109:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805310c:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053110:	f6 c4 20             	test   $0x20,%ah
 8053113:	75 0e                	jne    8053123 <_fputwc_r+0x23>
 8053115:	81 4b 64 00 20 00 00 	orl    $0x2000,0x64(%ebx)
 805311c:	80 cc 20             	or     $0x20,%ah
 805311f:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053123:	e8 58 c1 ff ff       	call   804f280 <__locale_mb_cur_max>
 8053128:	83 f8 01             	cmp    $0x1,%eax
 805312b:	0f 84 cf 00 00 00    	je     8053200 <_fputwc_r+0x100>
 8053131:	8d 43 5c             	lea    0x5c(%ebx),%eax
 8053134:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8053138:	8b 45 0c             	mov    0xc(%ebp),%eax
 805313b:	89 44 24 08          	mov    %eax,0x8(%esp)
 805313f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8053142:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053146:	8b 45 08             	mov    0x8(%ebp),%eax
 8053149:	89 04 24             	mov    %eax,(%esp)
 805314c:	e8 df 0f 00 00       	call   8054130 <_wcrtomb_r>
 8053151:	83 f8 ff             	cmp    $0xffffffff,%eax
 8053154:	89 c7                	mov    %eax,%edi
 8053156:	74 60                	je     80531b8 <_fputwc_r+0xb8>
 8053158:	85 ff                	test   %edi,%edi
 805315a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 805315e:	74 48                	je     80531a8 <_fputwc_r+0xa8>
 8053160:	31 f6                	xor    %esi,%esi
 8053162:	eb 17                	jmp    805317b <_fputwc_r+0x7b>
 8053164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053168:	8b 13                	mov    (%ebx),%edx
 805316a:	88 02                	mov    %al,(%edx)
 805316c:	83 03 01             	addl   $0x1,(%ebx)
 805316f:	83 c6 01             	add    $0x1,%esi
 8053172:	39 fe                	cmp    %edi,%esi
 8053174:	73 32                	jae    80531a8 <_fputwc_r+0xa8>
 8053176:	0f b6 44 35 e7       	movzbl -0x19(%ebp,%esi,1),%eax
 805317b:	8b 4b 08             	mov    0x8(%ebx),%ecx
 805317e:	8d 51 ff             	lea    -0x1(%ecx),%edx
 8053181:	85 d2                	test   %edx,%edx
 8053183:	89 53 08             	mov    %edx,0x8(%ebx)
 8053186:	79 e0                	jns    8053168 <_fputwc_r+0x68>
 8053188:	3b 53 18             	cmp    0x18(%ebx),%edx
 805318b:	7c 43                	jl     80531d0 <_fputwc_r+0xd0>
 805318d:	8b 13                	mov    (%ebx),%edx
 805318f:	88 02                	mov    %al,(%edx)
 8053191:	8b 03                	mov    (%ebx),%eax
 8053193:	80 38 0a             	cmpb   $0xa,(%eax)
 8053196:	0f 84 8c 00 00 00    	je     8053228 <_fputwc_r+0x128>
 805319c:	83 c6 01             	add    $0x1,%esi
 805319f:	83 c0 01             	add    $0x1,%eax
 80531a2:	39 fe                	cmp    %edi,%esi
 80531a4:	89 03                	mov    %eax,(%ebx)
 80531a6:	72 ce                	jb     8053176 <_fputwc_r+0x76>
 80531a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80531ab:	83 c4 2c             	add    $0x2c,%esp
 80531ae:	5b                   	pop    %ebx
 80531af:	5e                   	pop    %esi
 80531b0:	5f                   	pop    %edi
 80531b1:	5d                   	pop    %ebp
 80531b2:	c3                   	ret    
 80531b3:	90                   	nop
 80531b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80531b8:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 80531bd:	83 c4 2c             	add    $0x2c,%esp
 80531c0:	5b                   	pop    %ebx
 80531c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80531c6:	5e                   	pop    %esi
 80531c7:	5f                   	pop    %edi
 80531c8:	5d                   	pop    %ebp
 80531c9:	c3                   	ret    
 80531ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80531d0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80531d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80531d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80531db:	89 04 24             	mov    %eax,(%esp)
 80531de:	e8 fd 0d 00 00       	call   8053fe0 <__swbuf_r>
 80531e3:	83 f8 ff             	cmp    $0xffffffff,%eax
 80531e6:	0f 94 c0             	sete   %al
 80531e9:	84 c0                	test   %al,%al
 80531eb:	74 82                	je     805316f <_fputwc_r+0x6f>
 80531ed:	83 c4 2c             	add    $0x2c,%esp
 80531f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80531f5:	5b                   	pop    %ebx
 80531f6:	5e                   	pop    %esi
 80531f7:	5f                   	pop    %edi
 80531f8:	5d                   	pop    %ebp
 80531f9:	c3                   	ret    
 80531fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053200:	8b 45 0c             	mov    0xc(%ebp),%eax
 8053203:	83 e8 01             	sub    $0x1,%eax
 8053206:	3d fe 00 00 00       	cmp    $0xfe,%eax
 805320b:	0f 87 20 ff ff ff    	ja     8053131 <_fputwc_r+0x31>
 8053211:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 8053215:	bf 01 00 00 00       	mov    $0x1,%edi
 805321a:	88 45 e7             	mov    %al,-0x19(%ebp)
 805321d:	e9 3e ff ff ff       	jmp    8053160 <_fputwc_r+0x60>
 8053222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053228:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 805322c:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 8053233:	00 
 8053234:	eb a2                	jmp    80531d8 <_fputwc_r+0xd8>
 8053236:	8d 76 00             	lea    0x0(%esi),%esi
 8053239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08053240 <fputwc>:
 8053240:	55                   	push   %ebp
 8053241:	89 e5                	mov    %esp,%ebp
 8053243:	83 ec 18             	sub    $0x18,%esp
 8053246:	e8 a5 bf ff ff       	call   804f1f0 <__getreent>
 805324b:	85 c0                	test   %eax,%eax
 805324d:	74 15                	je     8053264 <fputwc+0x24>
 805324f:	8b 50 38             	mov    0x38(%eax),%edx
 8053252:	85 d2                	test   %edx,%edx
 8053254:	75 0e                	jne    8053264 <fputwc+0x24>
 8053256:	89 04 24             	mov    %eax,(%esp)
 8053259:	89 45 f4             	mov    %eax,-0xc(%ebp)
 805325c:	e8 ef b7 ff ff       	call   804ea50 <__sinit>
 8053261:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8053264:	8b 55 0c             	mov    0xc(%ebp),%edx
 8053267:	89 04 24             	mov    %eax,(%esp)
 805326a:	89 54 24 08          	mov    %edx,0x8(%esp)
 805326e:	8b 55 08             	mov    0x8(%ebp),%edx
 8053271:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053275:	e8 86 fe ff ff       	call   8053100 <_fputwc_r>
 805327a:	c9                   	leave  
 805327b:	c3                   	ret    
 805327c:	66 90                	xchg   %ax,%ax
 805327e:	66 90                	xchg   %ax,%ax

08053280 <_fstat_r>:
 8053280:	55                   	push   %ebp
 8053281:	89 e5                	mov    %esp,%ebp
 8053283:	83 ec 18             	sub    $0x18,%esp
 8053286:	8b 45 10             	mov    0x10(%ebp),%eax
 8053289:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 8053290:	00 00 00 
 8053293:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053297:	8b 45 0c             	mov    0xc(%ebp),%eax
 805329a:	89 04 24             	mov    %eax,(%esp)
 805329d:	e8 be 51 ff ff       	call   8048460 <fstat>
 80532a2:	83 f8 ff             	cmp    $0xffffffff,%eax
 80532a5:	74 09                	je     80532b0 <_fstat_r+0x30>
 80532a7:	c9                   	leave  
 80532a8:	c3                   	ret    
 80532a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80532b0:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 80532b6:	85 d2                	test   %edx,%edx
 80532b8:	74 ed                	je     80532a7 <_fstat_r+0x27>
 80532ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80532bd:	89 11                	mov    %edx,(%ecx)
 80532bf:	c9                   	leave  
 80532c0:	c3                   	ret    
 80532c1:	66 90                	xchg   %ax,%ax
 80532c3:	66 90                	xchg   %ax,%ax
 80532c5:	66 90                	xchg   %ax,%ax
 80532c7:	66 90                	xchg   %ax,%ax
 80532c9:	66 90                	xchg   %ax,%ax
 80532cb:	66 90                	xchg   %ax,%ax
 80532cd:	66 90                	xchg   %ax,%ax
 80532cf:	90                   	nop

080532d0 <__sfvwrite_r>:
 80532d0:	55                   	push   %ebp
 80532d1:	89 e5                	mov    %esp,%ebp
 80532d3:	57                   	push   %edi
 80532d4:	56                   	push   %esi
 80532d5:	53                   	push   %ebx
 80532d6:	83 ec 3c             	sub    $0x3c,%esp
 80532d9:	8b 45 10             	mov    0x10(%ebp),%eax
 80532dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80532df:	8b 48 08             	mov    0x8(%eax),%ecx
 80532e2:	85 c9                	test   %ecx,%ecx
 80532e4:	74 7e                	je     8053364 <__sfvwrite_r+0x94>
 80532e6:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 80532ea:	a8 08                	test   $0x8,%al
 80532ec:	0f 84 7e 00 00 00    	je     8053370 <__sfvwrite_r+0xa0>
 80532f2:	8b 53 10             	mov    0x10(%ebx),%edx
 80532f5:	85 d2                	test   %edx,%edx
 80532f7:	74 77                	je     8053370 <__sfvwrite_r+0xa0>
 80532f9:	8b 7d 10             	mov    0x10(%ebp),%edi
 80532fc:	a8 02                	test   $0x2,%al
 80532fe:	8b 3f                	mov    (%edi),%edi
 8053300:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8053303:	0f 84 92 00 00 00    	je     805339b <__sfvwrite_r+0xcb>
 8053309:	31 ff                	xor    %edi,%edi
 805330b:	31 f6                	xor    %esi,%esi
 805330d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 8053310:	89 fb                	mov    %edi,%ebx
 8053312:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8053315:	8d 76 00             	lea    0x0(%esi),%esi
 8053318:	85 f6                	test   %esi,%esi
 805331a:	0f 84 00 01 00 00    	je     8053420 <__sfvwrite_r+0x150>
 8053320:	81 fe 00 fc ff 7f    	cmp    $0x7ffffc00,%esi
 8053326:	b8 00 fc ff 7f       	mov    $0x7ffffc00,%eax
 805332b:	0f 46 c6             	cmovbe %esi,%eax
 805332e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8053332:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053336:	8b 47 1c             	mov    0x1c(%edi),%eax
 8053339:	89 44 24 04          	mov    %eax,0x4(%esp)
 805333d:	8b 45 08             	mov    0x8(%ebp),%eax
 8053340:	89 04 24             	mov    %eax,(%esp)
 8053343:	ff 57 24             	call   *0x24(%edi)
 8053346:	85 c0                	test   %eax,%eax
 8053348:	0f 8e 2a 04 00 00    	jle    8053778 <__sfvwrite_r+0x4a8>
 805334e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053351:	01 c3                	add    %eax,%ebx
 8053353:	29 c6                	sub    %eax,%esi
 8053355:	8b 49 08             	mov    0x8(%ecx),%ecx
 8053358:	29 c1                	sub    %eax,%ecx
 805335a:	8b 45 10             	mov    0x10(%ebp),%eax
 805335d:	85 c9                	test   %ecx,%ecx
 805335f:	89 48 08             	mov    %ecx,0x8(%eax)
 8053362:	75 b4                	jne    8053318 <__sfvwrite_r+0x48>
 8053364:	31 c0                	xor    %eax,%eax
 8053366:	83 c4 3c             	add    $0x3c,%esp
 8053369:	5b                   	pop    %ebx
 805336a:	5e                   	pop    %esi
 805336b:	5f                   	pop    %edi
 805336c:	5d                   	pop    %ebp
 805336d:	c3                   	ret    
 805336e:	66 90                	xchg   %ax,%ax
 8053370:	8b 45 08             	mov    0x8(%ebp),%eax
 8053373:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053377:	89 04 24             	mov    %eax,(%esp)
 805337a:	e8 61 9e ff ff       	call   804d1e0 <__swsetup_r>
 805337f:	85 c0                	test   %eax,%eax
 8053381:	0f 85 f8 03 00 00    	jne    805377f <__sfvwrite_r+0x4af>
 8053387:	8b 7d 10             	mov    0x10(%ebp),%edi
 805338a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805338e:	8b 3f                	mov    (%edi),%edi
 8053390:	a8 02                	test   $0x2,%al
 8053392:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8053395:	0f 85 6e ff ff ff    	jne    8053309 <__sfvwrite_r+0x39>
 805339b:	a8 01                	test   $0x1,%al
 805339d:	0f 85 95 00 00 00    	jne    8053438 <__sfvwrite_r+0x168>
 80533a3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 80533aa:	31 ff                	xor    %edi,%edi
 80533ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80533b0:	85 ff                	test   %edi,%edi
 80533b2:	74 5b                	je     805340f <__sfvwrite_r+0x13f>
 80533b4:	f6 c4 02             	test   $0x2,%ah
 80533b7:	8b 73 08             	mov    0x8(%ebx),%esi
 80533ba:	0f 84 30 01 00 00    	je     80534f0 <__sfvwrite_r+0x220>
 80533c0:	39 f7                	cmp    %esi,%edi
 80533c2:	0f 82 d8 01 00 00    	jb     80535a0 <__sfvwrite_r+0x2d0>
 80533c8:	66 a9 80 04          	test   $0x480,%ax
 80533cc:	0f 85 16 02 00 00    	jne    80535e8 <__sfvwrite_r+0x318>
 80533d2:	8b 03                	mov    (%ebx),%eax
 80533d4:	89 f2                	mov    %esi,%edx
 80533d6:	89 54 24 08          	mov    %edx,0x8(%esp)
 80533da:	89 55 dc             	mov    %edx,-0x24(%ebp)
 80533dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80533e0:	89 04 24             	mov    %eax,(%esp)
 80533e3:	89 54 24 04          	mov    %edx,0x4(%esp)
 80533e7:	e8 44 04 00 00       	call   8053830 <memmove>
 80533ec:	8b 55 dc             	mov    -0x24(%ebp),%edx
 80533ef:	01 13                	add    %edx,(%ebx)
 80533f1:	29 73 08             	sub    %esi,0x8(%ebx)
 80533f4:	89 fe                	mov    %edi,%esi
 80533f6:	8b 45 10             	mov    0x10(%ebp),%eax
 80533f9:	29 f7                	sub    %esi,%edi
 80533fb:	01 75 e0             	add    %esi,-0x20(%ebp)
 80533fe:	29 70 08             	sub    %esi,0x8(%eax)
 8053401:	0f 84 5d ff ff ff    	je     8053364 <__sfvwrite_r+0x94>
 8053407:	85 ff                	test   %edi,%edi
 8053409:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805340d:	75 a5                	jne    80533b4 <__sfvwrite_r+0xe4>
 805340f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8053412:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 8053416:	8b 11                	mov    (%ecx),%edx
 8053418:	8b 79 04             	mov    0x4(%ecx),%edi
 805341b:	89 55 e0             	mov    %edx,-0x20(%ebp)
 805341e:	eb 90                	jmp    80533b0 <__sfvwrite_r+0xe0>
 8053420:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053423:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 8053427:	8b 18                	mov    (%eax),%ebx
 8053429:	8b 70 04             	mov    0x4(%eax),%esi
 805342c:	e9 e7 fe ff ff       	jmp    8053318 <__sfvwrite_r+0x48>
 8053431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053438:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 805343f:	31 ff                	xor    %edi,%edi
 8053441:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8053448:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 805344f:	90                   	nop
 8053450:	85 ff                	test   %edi,%edi
 8053452:	74 7f                	je     80534d3 <__sfvwrite_r+0x203>
 8053454:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8053457:	85 c0                	test   %eax,%eax
 8053459:	0f 84 51 01 00 00    	je     80535b0 <__sfvwrite_r+0x2e0>
 805345f:	8b 75 d8             	mov    -0x28(%ebp),%esi
 8053462:	8b 0b                	mov    (%ebx),%ecx
 8053464:	8b 53 08             	mov    0x8(%ebx),%edx
 8053467:	8b 43 14             	mov    0x14(%ebx),%eax
 805346a:	39 fe                	cmp    %edi,%esi
 805346c:	0f 47 f7             	cmova  %edi,%esi
 805346f:	3b 4b 10             	cmp    0x10(%ebx),%ecx
 8053472:	76 0a                	jbe    805347e <__sfvwrite_r+0x1ae>
 8053474:	01 c2                	add    %eax,%edx
 8053476:	39 d6                	cmp    %edx,%esi
 8053478:	0f 8f 4a 02 00 00    	jg     80536c8 <__sfvwrite_r+0x3f8>
 805347e:	39 c6                	cmp    %eax,%esi
 8053480:	0f 8c da 00 00 00    	jl     8053560 <__sfvwrite_r+0x290>
 8053486:	89 44 24 0c          	mov    %eax,0xc(%esp)
 805348a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 805348d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8053491:	8b 43 1c             	mov    0x1c(%ebx),%eax
 8053494:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053498:	8b 45 08             	mov    0x8(%ebp),%eax
 805349b:	89 04 24             	mov    %eax,(%esp)
 805349e:	ff 53 24             	call   *0x24(%ebx)
 80534a1:	85 c0                	test   %eax,%eax
 80534a3:	89 c6                	mov    %eax,%esi
 80534a5:	0f 8e 9d 00 00 00    	jle    8053548 <__sfvwrite_r+0x278>
 80534ab:	29 75 d8             	sub    %esi,-0x28(%ebp)
 80534ae:	0f 84 cd 00 00 00    	je     8053581 <__sfvwrite_r+0x2b1>
 80534b4:	8b 45 10             	mov    0x10(%ebp),%eax
 80534b7:	29 f7                	sub    %esi,%edi
 80534b9:	8b 55 10             	mov    0x10(%ebp),%edx
 80534bc:	01 75 e0             	add    %esi,-0x20(%ebp)
 80534bf:	8b 40 08             	mov    0x8(%eax),%eax
 80534c2:	29 f0                	sub    %esi,%eax
 80534c4:	85 c0                	test   %eax,%eax
 80534c6:	89 42 08             	mov    %eax,0x8(%edx)
 80534c9:	0f 84 95 fe ff ff    	je     8053364 <__sfvwrite_r+0x94>
 80534cf:	85 ff                	test   %edi,%edi
 80534d1:	75 81                	jne    8053454 <__sfvwrite_r+0x184>
 80534d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80534d6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 80534dd:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 80534e1:	8b 08                	mov    (%eax),%ecx
 80534e3:	8b 78 04             	mov    0x4(%eax),%edi
 80534e6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 80534e9:	e9 62 ff ff ff       	jmp    8053450 <__sfvwrite_r+0x180>
 80534ee:	66 90                	xchg   %ax,%ax
 80534f0:	8b 03                	mov    (%ebx),%eax
 80534f2:	3b 43 10             	cmp    0x10(%ebx),%eax
 80534f5:	77 0b                	ja     8053502 <__sfvwrite_r+0x232>
 80534f7:	8b 4b 14             	mov    0x14(%ebx),%ecx
 80534fa:	39 cf                	cmp    %ecx,%edi
 80534fc:	0f 83 86 01 00 00    	jae    8053688 <__sfvwrite_r+0x3b8>
 8053502:	8b 55 e0             	mov    -0x20(%ebp),%edx
 8053505:	39 f7                	cmp    %esi,%edi
 8053507:	0f 46 f7             	cmovbe %edi,%esi
 805350a:	89 74 24 08          	mov    %esi,0x8(%esp)
 805350e:	89 04 24             	mov    %eax,(%esp)
 8053511:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053515:	e8 16 03 00 00       	call   8053830 <memmove>
 805351a:	8b 43 08             	mov    0x8(%ebx),%eax
 805351d:	01 33                	add    %esi,(%ebx)
 805351f:	29 f0                	sub    %esi,%eax
 8053521:	85 c0                	test   %eax,%eax
 8053523:	89 43 08             	mov    %eax,0x8(%ebx)
 8053526:	0f 85 ca fe ff ff    	jne    80533f6 <__sfvwrite_r+0x126>
 805352c:	8b 45 08             	mov    0x8(%ebp),%eax
 805352f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053533:	89 04 24             	mov    %eax,(%esp)
 8053536:	e8 a5 b3 ff ff       	call   804e8e0 <_fflush_r>
 805353b:	85 c0                	test   %eax,%eax
 805353d:	0f 84 b3 fe ff ff    	je     80533f6 <__sfvwrite_r+0x126>
 8053543:	90                   	nop
 8053544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053548:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805354c:	83 c8 40             	or     $0x40,%eax
 805354f:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053553:	83 c4 3c             	add    $0x3c,%esp
 8053556:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 805355b:	5b                   	pop    %ebx
 805355c:	5e                   	pop    %esi
 805355d:	5f                   	pop    %edi
 805355e:	5d                   	pop    %ebp
 805355f:	c3                   	ret    
 8053560:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8053563:	89 74 24 08          	mov    %esi,0x8(%esp)
 8053567:	89 0c 24             	mov    %ecx,(%esp)
 805356a:	89 44 24 04          	mov    %eax,0x4(%esp)
 805356e:	e8 bd 02 00 00       	call   8053830 <memmove>
 8053573:	29 73 08             	sub    %esi,0x8(%ebx)
 8053576:	01 33                	add    %esi,(%ebx)
 8053578:	29 75 d8             	sub    %esi,-0x28(%ebp)
 805357b:	0f 85 33 ff ff ff    	jne    80534b4 <__sfvwrite_r+0x1e4>
 8053581:	8b 45 08             	mov    0x8(%ebp),%eax
 8053584:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053588:	89 04 24             	mov    %eax,(%esp)
 805358b:	e8 50 b3 ff ff       	call   804e8e0 <_fflush_r>
 8053590:	85 c0                	test   %eax,%eax
 8053592:	75 b4                	jne    8053548 <__sfvwrite_r+0x278>
 8053594:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 805359b:	e9 14 ff ff ff       	jmp    80534b4 <__sfvwrite_r+0x1e4>
 80535a0:	89 fe                	mov    %edi,%esi
 80535a2:	8b 03                	mov    (%ebx),%eax
 80535a4:	89 fa                	mov    %edi,%edx
 80535a6:	e9 2b fe ff ff       	jmp    80533d6 <__sfvwrite_r+0x106>
 80535ab:	90                   	nop
 80535ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80535b0:	8b 75 e0             	mov    -0x20(%ebp),%esi
 80535b3:	89 7c 24 08          	mov    %edi,0x8(%esp)
 80535b7:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 80535be:	00 
 80535bf:	89 34 24             	mov    %esi,(%esp)
 80535c2:	e8 c9 c5 ff ff       	call   804fb90 <memchr>
 80535c7:	85 c0                	test   %eax,%eax
 80535c9:	0f 84 91 01 00 00    	je     8053760 <__sfvwrite_r+0x490>
 80535cf:	83 c0 01             	add    $0x1,%eax
 80535d2:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80535d5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 80535dc:	29 75 d8             	sub    %esi,-0x28(%ebp)
 80535df:	e9 7b fe ff ff       	jmp    805345f <__sfvwrite_r+0x18f>
 80535e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80535e8:	8b 53 14             	mov    0x14(%ebx),%edx
 80535eb:	8b 0b                	mov    (%ebx),%ecx
 80535ed:	8b 73 10             	mov    0x10(%ebx),%esi
 80535f0:	8d 14 52             	lea    (%edx,%edx,2),%edx
 80535f3:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 80535f6:	89 d1                	mov    %edx,%ecx
 80535f8:	c1 e9 1f             	shr    $0x1f,%ecx
 80535fb:	29 75 dc             	sub    %esi,-0x24(%ebp)
 80535fe:	01 ca                	add    %ecx,%edx
 8053600:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8053603:	d1 fa                	sar    %edx
 8053605:	8d 4c 0f 01          	lea    0x1(%edi,%ecx,1),%ecx
 8053609:	39 ca                	cmp    %ecx,%edx
 805360b:	0f 83 f7 00 00 00    	jae    8053708 <__sfvwrite_r+0x438>
 8053611:	89 ca                	mov    %ecx,%edx
 8053613:	f6 c4 04             	test   $0x4,%ah
 8053616:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053619:	0f 84 f7 00 00 00    	je     8053716 <__sfvwrite_r+0x446>
 805361f:	8b 45 08             	mov    0x8(%ebp),%eax
 8053622:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8053626:	89 04 24             	mov    %eax,(%esp)
 8053629:	e8 22 be ff ff       	call   804f450 <_malloc_r>
 805362e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8053631:	85 c0                	test   %eax,%eax
 8053633:	89 c6                	mov    %eax,%esi
 8053635:	0f 84 4e 01 00 00    	je     8053789 <__sfvwrite_r+0x4b9>
 805363b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 805363e:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053641:	89 44 24 08          	mov    %eax,0x8(%esp)
 8053645:	8b 43 10             	mov    0x10(%ebx),%eax
 8053648:	89 34 24             	mov    %esi,(%esp)
 805364b:	89 44 24 04          	mov    %eax,0x4(%esp)
 805364f:	e8 d4 c5 ff ff       	call   804fc28 <memcpy>
 8053654:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053658:	8b 55 d8             	mov    -0x28(%ebp),%edx
 805365b:	66 25 7f fb          	and    $0xfb7f,%ax
 805365f:	0c 80                	or     $0x80,%al
 8053661:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053665:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8053668:	89 53 14             	mov    %edx,0x14(%ebx)
 805366b:	89 73 10             	mov    %esi,0x10(%ebx)
 805366e:	89 c8                	mov    %ecx,%eax
 8053670:	29 ca                	sub    %ecx,%edx
 8053672:	01 f0                	add    %esi,%eax
 8053674:	89 fe                	mov    %edi,%esi
 8053676:	89 53 08             	mov    %edx,0x8(%ebx)
 8053679:	89 fa                	mov    %edi,%edx
 805367b:	89 03                	mov    %eax,(%ebx)
 805367d:	e9 54 fd ff ff       	jmp    80533d6 <__sfvwrite_r+0x106>
 8053682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053688:	81 ff ff ff ff 7f    	cmp    $0x7fffffff,%edi
 805368e:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
 8053693:	0f 46 c7             	cmovbe %edi,%eax
 8053696:	99                   	cltd   
 8053697:	f7 f9                	idiv   %ecx
 8053699:	0f af c1             	imul   %ecx,%eax
 805369c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80536a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80536a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80536a7:	8b 43 1c             	mov    0x1c(%ebx),%eax
 80536aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 80536ae:	8b 45 08             	mov    0x8(%ebp),%eax
 80536b1:	89 04 24             	mov    %eax,(%esp)
 80536b4:	ff 53 24             	call   *0x24(%ebx)
 80536b7:	85 c0                	test   %eax,%eax
 80536b9:	0f 8e 89 fe ff ff    	jle    8053548 <__sfvwrite_r+0x278>
 80536bf:	89 c6                	mov    %eax,%esi
 80536c1:	e9 30 fd ff ff       	jmp    80533f6 <__sfvwrite_r+0x126>
 80536c6:	66 90                	xchg   %ax,%ax
 80536c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80536cb:	89 54 24 08          	mov    %edx,0x8(%esp)
 80536cf:	89 0c 24             	mov    %ecx,(%esp)
 80536d2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 80536d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80536d9:	e8 52 01 00 00       	call   8053830 <memmove>
 80536de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80536e1:	8b 45 08             	mov    0x8(%ebp),%eax
 80536e4:	01 13                	add    %edx,(%ebx)
 80536e6:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80536ea:	89 04 24             	mov    %eax,(%esp)
 80536ed:	e8 ee b1 ff ff       	call   804e8e0 <_fflush_r>
 80536f2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80536f5:	85 c0                	test   %eax,%eax
 80536f7:	0f 85 4b fe ff ff    	jne    8053548 <__sfvwrite_r+0x278>
 80536fd:	89 d6                	mov    %edx,%esi
 80536ff:	e9 a7 fd ff ff       	jmp    80534ab <__sfvwrite_r+0x1db>
 8053704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053708:	f6 c4 04             	test   $0x4,%ah
 805370b:	89 d1                	mov    %edx,%ecx
 805370d:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053710:	0f 85 09 ff ff ff    	jne    805361f <__sfvwrite_r+0x34f>
 8053716:	8b 45 08             	mov    0x8(%ebp),%eax
 8053719:	89 74 24 04          	mov    %esi,0x4(%esp)
 805371d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8053721:	89 04 24             	mov    %eax,(%esp)
 8053724:	e8 e7 01 00 00       	call   8053910 <_realloc_r>
 8053729:	8b 55 d8             	mov    -0x28(%ebp),%edx
 805372c:	85 c0                	test   %eax,%eax
 805372e:	89 c6                	mov    %eax,%esi
 8053730:	0f 85 2f ff ff ff    	jne    8053665 <__sfvwrite_r+0x395>
 8053736:	8b 43 10             	mov    0x10(%ebx),%eax
 8053739:	89 44 24 04          	mov    %eax,0x4(%esp)
 805373d:	8b 45 08             	mov    0x8(%ebp),%eax
 8053740:	89 04 24             	mov    %eax,(%esp)
 8053743:	e8 58 b7 ff ff       	call   804eea0 <_free_r>
 8053748:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805374c:	8b 7d 08             	mov    0x8(%ebp),%edi
 805374f:	24 7f                	and    $0x7f,%al
 8053751:	c7 07 0c 00 00 00    	movl   $0xc,(%edi)
 8053757:	e9 f0 fd ff ff       	jmp    805354c <__sfvwrite_r+0x27c>
 805375c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053760:	8d 47 01             	lea    0x1(%edi),%eax
 8053763:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8053766:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 805376d:	e9 ed fc ff ff       	jmp    805345f <__sfvwrite_r+0x18f>
 8053772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053778:	89 fb                	mov    %edi,%ebx
 805377a:	e9 c9 fd ff ff       	jmp    8053548 <__sfvwrite_r+0x278>
 805377f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8053784:	e9 dd fb ff ff       	jmp    8053366 <__sfvwrite_r+0x96>
 8053789:	8b 45 08             	mov    0x8(%ebp),%eax
 805378c:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8053792:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053796:	e9 b1 fd ff ff       	jmp    805354c <__sfvwrite_r+0x27c>
 805379b:	66 90                	xchg   %ax,%ax
 805379d:	66 90                	xchg   %ax,%ax
 805379f:	90                   	nop

080537a0 <_isatty_r>:
 80537a0:	55                   	push   %ebp
 80537a1:	89 e5                	mov    %esp,%ebp
 80537a3:	83 ec 18             	sub    $0x18,%esp
 80537a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80537a9:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 80537b0:	00 00 00 
 80537b3:	89 04 24             	mov    %eax,(%esp)
 80537b6:	e8 c5 4c ff ff       	call   8048480 <isatty>
 80537bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 80537be:	74 08                	je     80537c8 <_isatty_r+0x28>
 80537c0:	c9                   	leave  
 80537c1:	c3                   	ret    
 80537c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80537c8:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 80537ce:	85 d2                	test   %edx,%edx
 80537d0:	74 ee                	je     80537c0 <_isatty_r+0x20>
 80537d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80537d5:	89 11                	mov    %edx,(%ecx)
 80537d7:	c9                   	leave  
 80537d8:	c3                   	ret    
 80537d9:	66 90                	xchg   %ax,%ax
 80537db:	66 90                	xchg   %ax,%ax
 80537dd:	66 90                	xchg   %ax,%ax
 80537df:	90                   	nop

080537e0 <_lseek_r>:
 80537e0:	55                   	push   %ebp
 80537e1:	89 e5                	mov    %esp,%ebp
 80537e3:	83 ec 18             	sub    $0x18,%esp
 80537e6:	8b 45 14             	mov    0x14(%ebp),%eax
 80537e9:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 80537f0:	00 00 00 
 80537f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80537f7:	8b 45 10             	mov    0x10(%ebp),%eax
 80537fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 80537fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8053801:	89 04 24             	mov    %eax,(%esp)
 8053804:	e8 e7 4b ff ff       	call   80483f0 <lseek>
 8053809:	83 f8 ff             	cmp    $0xffffffff,%eax
 805380c:	74 02                	je     8053810 <_lseek_r+0x30>
 805380e:	c9                   	leave  
 805380f:	c3                   	ret    
 8053810:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 8053816:	85 d2                	test   %edx,%edx
 8053818:	74 f4                	je     805380e <_lseek_r+0x2e>
 805381a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805381d:	89 11                	mov    %edx,(%ecx)
 805381f:	c9                   	leave  
 8053820:	c3                   	ret    
 8053821:	66 90                	xchg   %ax,%ax
 8053823:	66 90                	xchg   %ax,%ax
 8053825:	66 90                	xchg   %ax,%ax
 8053827:	66 90                	xchg   %ax,%ax
 8053829:	66 90                	xchg   %ax,%ax
 805382b:	66 90                	xchg   %ax,%ax
 805382d:	66 90                	xchg   %ax,%ax
 805382f:	90                   	nop

08053830 <memmove>:
 8053830:	55                   	push   %ebp
 8053831:	89 e5                	mov    %esp,%ebp
 8053833:	56                   	push   %esi
 8053834:	57                   	push   %edi
 8053835:	53                   	push   %ebx
 8053836:	8b 7d 08             	mov    0x8(%ebp),%edi
 8053839:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805383c:	8b 75 0c             	mov    0xc(%ebp),%esi
 805383f:	fc                   	cld    
 8053840:	39 fe                	cmp    %edi,%esi
 8053842:	73 43                	jae    8053887 <memmove+0x57>
 8053844:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
 8053848:	39 df                	cmp    %ebx,%edi
 805384a:	77 3b                	ja     8053887 <memmove+0x57>
 805384c:	01 ce                	add    %ecx,%esi
 805384e:	01 cf                	add    %ecx,%edi
 8053850:	fd                   	std    
 8053851:	83 f9 08             	cmp    $0x8,%ecx
 8053854:	76 2b                	jbe    8053881 <memmove+0x51>
 8053856:	89 fa                	mov    %edi,%edx
 8053858:	89 cb                	mov    %ecx,%ebx
 805385a:	83 e2 03             	and    $0x3,%edx
 805385d:	74 0c                	je     805386b <memmove+0x3b>
 805385f:	89 d1                	mov    %edx,%ecx
 8053861:	4e                   	dec    %esi
 8053862:	4f                   	dec    %edi
 8053863:	29 cb                	sub    %ecx,%ebx
 8053865:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8053867:	89 d9                	mov    %ebx,%ecx
 8053869:	46                   	inc    %esi
 805386a:	47                   	inc    %edi
 805386b:	c1 e9 02             	shr    $0x2,%ecx
 805386e:	83 ee 04             	sub    $0x4,%esi
 8053871:	83 ef 04             	sub    $0x4,%edi
 8053874:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8053876:	83 c6 04             	add    $0x4,%esi
 8053879:	83 c7 04             	add    $0x4,%edi
 805387c:	89 d9                	mov    %ebx,%ecx
 805387e:	83 e1 03             	and    $0x3,%ecx
 8053881:	4e                   	dec    %esi
 8053882:	4f                   	dec    %edi
 8053883:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8053885:	eb 2a                	jmp    80538b1 <memmove+0x81>
 8053887:	83 f9 08             	cmp    $0x8,%ecx
 805388a:	76 23                	jbe    80538af <memmove+0x7f>
 805388c:	89 fa                	mov    %edi,%edx
 805388e:	89 cb                	mov    %ecx,%ebx
 8053890:	83 e2 03             	and    $0x3,%edx
 8053893:	74 10                	je     80538a5 <memmove+0x75>
 8053895:	b9 04 00 00 00       	mov    $0x4,%ecx
 805389a:	29 d1                	sub    %edx,%ecx
 805389c:	83 e1 03             	and    $0x3,%ecx
 805389f:	29 cb                	sub    %ecx,%ebx
 80538a1:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 80538a3:	89 d9                	mov    %ebx,%ecx
 80538a5:	c1 e9 02             	shr    $0x2,%ecx
 80538a8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 80538aa:	89 d9                	mov    %ebx,%ecx
 80538ac:	83 e1 03             	and    $0x3,%ecx
 80538af:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 80538b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80538b4:	fc                   	cld    
 80538b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80538b8:	5b                   	pop    %ebx
 80538b9:	5f                   	pop    %edi
 80538ba:	5e                   	pop    %esi
 80538bb:	c9                   	leave  
 80538bc:	c3                   	ret    
 80538bd:	66 90                	xchg   %ax,%ax
 80538bf:	90                   	nop

080538c0 <_read_r>:
 80538c0:	55                   	push   %ebp
 80538c1:	89 e5                	mov    %esp,%ebp
 80538c3:	83 ec 18             	sub    $0x18,%esp
 80538c6:	8b 45 14             	mov    0x14(%ebp),%eax
 80538c9:	c7 05 94 dd 06 08 00 	movl   $0x0,0x806dd94
 80538d0:	00 00 00 
 80538d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80538d7:	8b 45 10             	mov    0x10(%ebp),%eax
 80538da:	89 44 24 04          	mov    %eax,0x4(%esp)
 80538de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80538e1:	89 04 24             	mov    %eax,(%esp)
 80538e4:	e8 d7 4a ff ff       	call   80483c0 <read>
 80538e9:	83 f8 ff             	cmp    $0xffffffff,%eax
 80538ec:	74 02                	je     80538f0 <_read_r+0x30>
 80538ee:	c9                   	leave  
 80538ef:	c3                   	ret    
 80538f0:	8b 15 94 dd 06 08    	mov    0x806dd94,%edx
 80538f6:	85 d2                	test   %edx,%edx
 80538f8:	74 f4                	je     80538ee <_read_r+0x2e>
 80538fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80538fd:	89 11                	mov    %edx,(%ecx)
 80538ff:	c9                   	leave  
 8053900:	c3                   	ret    
 8053901:	66 90                	xchg   %ax,%ax
 8053903:	66 90                	xchg   %ax,%ax
 8053905:	66 90                	xchg   %ax,%ax
 8053907:	66 90                	xchg   %ax,%ax
 8053909:	66 90                	xchg   %ax,%ax
 805390b:	66 90                	xchg   %ax,%ax
 805390d:	66 90                	xchg   %ax,%ax
 805390f:	90                   	nop

08053910 <_realloc_r>:
 8053910:	55                   	push   %ebp
 8053911:	89 e5                	mov    %esp,%ebp
 8053913:	57                   	push   %edi
 8053914:	56                   	push   %esi
 8053915:	53                   	push   %ebx
 8053916:	83 ec 3c             	sub    $0x3c,%esp
 8053919:	8b 45 08             	mov    0x8(%ebp),%eax
 805391c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805391f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8053922:	8b 45 10             	mov    0x10(%ebp),%eax
 8053925:	85 ff                	test   %edi,%edi
 8053927:	89 45 e0             	mov    %eax,-0x20(%ebp)
 805392a:	0f 84 50 02 00 00    	je     8053b80 <_realloc_r+0x270>
 8053930:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053933:	8d 77 f8             	lea    -0x8(%edi),%esi
 8053936:	89 04 24             	mov    %eax,(%esp)
 8053939:	e8 32 c3 ff ff       	call   804fc70 <__malloc_lock>
 805393e:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053941:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053944:	89 c3                	mov    %eax,%ebx
 8053946:	8d 51 0b             	lea    0xb(%ecx),%edx
 8053949:	83 e3 fc             	and    $0xfffffffc,%ebx
 805394c:	83 fa 16             	cmp    $0x16,%edx
 805394f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8053952:	0f 87 00 01 00 00    	ja     8053a58 <_realloc_r+0x148>
 8053958:	31 d2                	xor    %edx,%edx
 805395a:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
 8053961:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
 8053968:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 805396b:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
 805396e:	0f 82 1c 02 00 00    	jb     8053b90 <_realloc_r+0x280>
 8053974:	84 d2                	test   %dl,%dl
 8053976:	0f 85 14 02 00 00    	jne    8053b90 <_realloc_r+0x280>
 805397c:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
 805397f:	0f 8d eb 00 00 00    	jge    8053a70 <_realloc_r+0x160>
 8053985:	8b 0d 88 80 05 08    	mov    0x8058088,%ecx
 805398b:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
 805398e:	39 d1                	cmp    %edx,%ecx
 8053990:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 8053993:	0f 84 6f 02 00 00    	je     8053c08 <_realloc_r+0x2f8>
 8053999:	8b 4a 04             	mov    0x4(%edx),%ecx
 805399c:	89 c8                	mov    %ecx,%eax
 805399e:	83 e0 fe             	and    $0xfffffffe,%eax
 80539a1:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
 80539a6:	0f 84 f4 00 00 00    	je     8053aa0 <_realloc_r+0x190>
 80539ac:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 80539b3:	31 d2                	xor    %edx,%edx
 80539b5:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
 80539b9:	0f 85 39 01 00 00    	jne    8053af8 <_realloc_r+0x1e8>
 80539bf:	89 f1                	mov    %esi,%ecx
 80539c1:	2b 4f f8             	sub    -0x8(%edi),%ecx
 80539c4:	8b 41 04             	mov    0x4(%ecx),%eax
 80539c7:	83 e0 fc             	and    $0xfffffffc,%eax
 80539ca:	85 d2                	test   %edx,%edx
 80539cc:	0f 84 f6 02 00 00    	je     8053cc8 <_realloc_r+0x3b8>
 80539d2:	3b 55 cc             	cmp    -0x34(%ebp),%edx
 80539d5:	0f 84 f5 02 00 00    	je     8053cd0 <_realloc_r+0x3c0>
 80539db:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 80539de:	8b 55 d0             	mov    -0x30(%ebp),%edx
 80539e1:	01 d8                	add    %ebx,%eax
 80539e3:	01 c2                	add    %eax,%edx
 80539e5:	3b 55 d8             	cmp    -0x28(%ebp),%edx
 80539e8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 80539eb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80539ee:	0f 8c ac 01 00 00    	jl     8053ba0 <_realloc_r+0x290>
 80539f4:	8b 42 0c             	mov    0xc(%edx),%eax
 80539f7:	83 eb 04             	sub    $0x4,%ebx
 80539fa:	8b 52 08             	mov    0x8(%edx),%edx
 80539fd:	83 fb 24             	cmp    $0x24,%ebx
 8053a00:	8d 71 08             	lea    0x8(%ecx),%esi
 8053a03:	89 42 0c             	mov    %eax,0xc(%edx)
 8053a06:	89 50 08             	mov    %edx,0x8(%eax)
 8053a09:	8b 41 0c             	mov    0xc(%ecx),%eax
 8053a0c:	8b 51 08             	mov    0x8(%ecx),%edx
 8053a0f:	89 42 0c             	mov    %eax,0xc(%edx)
 8053a12:	89 50 08             	mov    %edx,0x8(%eax)
 8053a15:	0f 87 85 03 00 00    	ja     8053da0 <_realloc_r+0x490>
 8053a1b:	83 fb 13             	cmp    $0x13,%ebx
 8053a1e:	89 f0                	mov    %esi,%eax
 8053a20:	76 1a                	jbe    8053a3c <_realloc_r+0x12c>
 8053a22:	8b 07                	mov    (%edi),%eax
 8053a24:	83 fb 1b             	cmp    $0x1b,%ebx
 8053a27:	89 41 08             	mov    %eax,0x8(%ecx)
 8053a2a:	8b 47 04             	mov    0x4(%edi),%eax
 8053a2d:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053a30:	0f 87 8f 03 00 00    	ja     8053dc5 <_realloc_r+0x4b5>
 8053a36:	8d 41 10             	lea    0x10(%ecx),%eax
 8053a39:	83 c7 08             	add    $0x8,%edi
 8053a3c:	8b 17                	mov    (%edi),%edx
 8053a3e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8053a41:	89 10                	mov    %edx,(%eax)
 8053a43:	8b 57 04             	mov    0x4(%edi),%edx
 8053a46:	89 50 04             	mov    %edx,0x4(%eax)
 8053a49:	8b 57 08             	mov    0x8(%edi),%edx
 8053a4c:	89 f7                	mov    %esi,%edi
 8053a4e:	89 ce                	mov    %ecx,%esi
 8053a50:	89 50 08             	mov    %edx,0x8(%eax)
 8053a53:	8b 41 04             	mov    0x4(%ecx),%eax
 8053a56:	eb 1b                	jmp    8053a73 <_realloc_r+0x163>
 8053a58:	83 e2 f8             	and    $0xfffffff8,%edx
 8053a5b:	89 55 dc             	mov    %edx,-0x24(%ebp)
 8053a5e:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053a61:	c1 ea 1f             	shr    $0x1f,%edx
 8053a64:	e9 ff fe ff ff       	jmp    8053968 <_realloc_r+0x58>
 8053a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053a70:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8053a73:	89 da                	mov    %ebx,%edx
 8053a75:	2b 55 dc             	sub    -0x24(%ebp),%edx
 8053a78:	83 fa 0f             	cmp    $0xf,%edx
 8053a7b:	77 4b                	ja     8053ac8 <_realloc_r+0x1b8>
 8053a7d:	83 e0 01             	and    $0x1,%eax
 8053a80:	09 d8                	or     %ebx,%eax
 8053a82:	89 46 04             	mov    %eax,0x4(%esi)
 8053a85:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
 8053a8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053a8d:	89 04 24             	mov    %eax,(%esp)
 8053a90:	e8 eb c1 ff ff       	call   804fc80 <__malloc_unlock>
 8053a95:	89 f8                	mov    %edi,%eax
 8053a97:	83 c4 3c             	add    $0x3c,%esp
 8053a9a:	5b                   	pop    %ebx
 8053a9b:	5e                   	pop    %esi
 8053a9c:	5f                   	pop    %edi
 8053a9d:	5d                   	pop    %ebp
 8053a9e:	c3                   	ret    
 8053a9f:	90                   	nop
 8053aa0:	83 e1 fc             	and    $0xfffffffc,%ecx
 8053aa3:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 8053aa6:	01 d9                	add    %ebx,%ecx
 8053aa8:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
 8053aab:	0f 8c 04 ff ff ff    	jl     80539b5 <_realloc_r+0xa5>
 8053ab1:	8b 5a 0c             	mov    0xc(%edx),%ebx
 8053ab4:	8b 52 08             	mov    0x8(%edx),%edx
 8053ab7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8053aba:	89 5a 0c             	mov    %ebx,0xc(%edx)
 8053abd:	89 53 08             	mov    %edx,0x8(%ebx)
 8053ac0:	89 cb                	mov    %ecx,%ebx
 8053ac2:	eb af                	jmp    8053a73 <_realloc_r+0x163>
 8053ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053ac8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053acb:	83 e0 01             	and    $0x1,%eax
 8053ace:	09 d8                	or     %ebx,%eax
 8053ad0:	89 46 04             	mov    %eax,0x4(%esi)
 8053ad3:	89 d0                	mov    %edx,%eax
 8053ad5:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
 8053ad8:	83 c8 01             	or     $0x1,%eax
 8053adb:	89 41 04             	mov    %eax,0x4(%ecx)
 8053ade:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053ae1:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
 8053ae6:	83 c1 08             	add    $0x8,%ecx
 8053ae9:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8053aed:	89 04 24             	mov    %eax,(%esp)
 8053af0:	e8 ab b3 ff ff       	call   804eea0 <_free_r>
 8053af5:	eb 93                	jmp    8053a8a <_realloc_r+0x17a>
 8053af7:	90                   	nop
 8053af8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8053afb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053aff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053b02:	89 04 24             	mov    %eax,(%esp)
 8053b05:	e8 46 b9 ff ff       	call   804f450 <_malloc_r>
 8053b0a:	85 c0                	test   %eax,%eax
 8053b0c:	89 c1                	mov    %eax,%ecx
 8053b0e:	0f 84 65 03 00 00    	je     8053e79 <_realloc_r+0x569>
 8053b14:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053b17:	8d 51 f8             	lea    -0x8(%ecx),%edx
 8053b1a:	89 55 e0             	mov    %edx,-0x20(%ebp)
 8053b1d:	89 c2                	mov    %eax,%edx
 8053b1f:	83 e2 fe             	and    $0xfffffffe,%edx
 8053b22:	01 f2                	add    %esi,%edx
 8053b24:	39 55 e0             	cmp    %edx,-0x20(%ebp)
 8053b27:	0f 84 63 02 00 00    	je     8053d90 <_realloc_r+0x480>
 8053b2d:	83 eb 04             	sub    $0x4,%ebx
 8053b30:	83 fb 24             	cmp    $0x24,%ebx
 8053b33:	0f 87 6f 01 00 00    	ja     8053ca8 <_realloc_r+0x398>
 8053b39:	83 fb 13             	cmp    $0x13,%ebx
 8053b3c:	0f 87 ee 00 00 00    	ja     8053c30 <_realloc_r+0x320>
 8053b42:	89 c8                	mov    %ecx,%eax
 8053b44:	89 fa                	mov    %edi,%edx
 8053b46:	8b 1a                	mov    (%edx),%ebx
 8053b48:	89 18                	mov    %ebx,(%eax)
 8053b4a:	8b 5a 04             	mov    0x4(%edx),%ebx
 8053b4d:	89 58 04             	mov    %ebx,0x4(%eax)
 8053b50:	8b 52 08             	mov    0x8(%edx),%edx
 8053b53:	89 50 08             	mov    %edx,0x8(%eax)
 8053b56:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8053b59:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053b5d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053b60:	89 34 24             	mov    %esi,(%esp)
 8053b63:	e8 38 b3 ff ff       	call   804eea0 <_free_r>
 8053b68:	89 34 24             	mov    %esi,(%esp)
 8053b6b:	e8 10 c1 ff ff       	call   804fc80 <__malloc_unlock>
 8053b70:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053b73:	83 c4 3c             	add    $0x3c,%esp
 8053b76:	5b                   	pop    %ebx
 8053b77:	5e                   	pop    %esi
 8053b78:	5f                   	pop    %edi
 8053b79:	89 c8                	mov    %ecx,%eax
 8053b7b:	5d                   	pop    %ebp
 8053b7c:	c3                   	ret    
 8053b7d:	8d 76 00             	lea    0x0(%esi),%esi
 8053b80:	89 45 0c             	mov    %eax,0xc(%ebp)
 8053b83:	83 c4 3c             	add    $0x3c,%esp
 8053b86:	5b                   	pop    %ebx
 8053b87:	5e                   	pop    %esi
 8053b88:	5f                   	pop    %edi
 8053b89:	5d                   	pop    %ebp
 8053b8a:	e9 c1 b8 ff ff       	jmp    804f450 <_malloc_r>
 8053b8f:	90                   	nop
 8053b90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053b93:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8053b99:	31 c0                	xor    %eax,%eax
 8053b9b:	e9 f7 fe ff ff       	jmp    8053a97 <_realloc_r+0x187>
 8053ba0:	89 c2                	mov    %eax,%edx
 8053ba2:	3b 55 d8             	cmp    -0x28(%ebp),%edx
 8053ba5:	0f 8c 4d ff ff ff    	jl     8053af8 <_realloc_r+0x1e8>
 8053bab:	8b 71 08             	mov    0x8(%ecx),%esi
 8053bae:	83 eb 04             	sub    $0x4,%ebx
 8053bb1:	8b 41 0c             	mov    0xc(%ecx),%eax
 8053bb4:	83 fb 24             	cmp    $0x24,%ebx
 8053bb7:	89 46 0c             	mov    %eax,0xc(%esi)
 8053bba:	89 70 08             	mov    %esi,0x8(%eax)
 8053bbd:	8d 71 08             	lea    0x8(%ecx),%esi
 8053bc0:	0f 87 88 00 00 00    	ja     8053c4e <_realloc_r+0x33e>
 8053bc6:	83 fb 13             	cmp    $0x13,%ebx
 8053bc9:	89 f0                	mov    %esi,%eax
 8053bcb:	76 1a                	jbe    8053be7 <_realloc_r+0x2d7>
 8053bcd:	8b 07                	mov    (%edi),%eax
 8053bcf:	83 fb 1b             	cmp    $0x1b,%ebx
 8053bd2:	89 41 08             	mov    %eax,0x8(%ecx)
 8053bd5:	8b 47 04             	mov    0x4(%edi),%eax
 8053bd8:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053bdb:	0f 87 17 02 00 00    	ja     8053df8 <_realloc_r+0x4e8>
 8053be1:	8d 41 10             	lea    0x10(%ecx),%eax
 8053be4:	83 c7 08             	add    $0x8,%edi
 8053be7:	8b 1f                	mov    (%edi),%ebx
 8053be9:	89 18                	mov    %ebx,(%eax)
 8053beb:	8b 5f 04             	mov    0x4(%edi),%ebx
 8053bee:	89 58 04             	mov    %ebx,0x4(%eax)
 8053bf1:	8b 5f 08             	mov    0x8(%edi),%ebx
 8053bf4:	89 f7                	mov    %esi,%edi
 8053bf6:	89 ce                	mov    %ecx,%esi
 8053bf8:	89 58 08             	mov    %ebx,0x8(%eax)
 8053bfb:	89 d3                	mov    %edx,%ebx
 8053bfd:	8b 41 04             	mov    0x4(%ecx),%eax
 8053c00:	e9 6e fe ff ff       	jmp    8053a73 <_realloc_r+0x163>
 8053c05:	8d 76 00             	lea    0x0(%esi),%esi
 8053c08:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8053c0b:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8053c0e:	8b 48 04             	mov    0x4(%eax),%ecx
 8053c11:	83 c2 10             	add    $0x10,%edx
 8053c14:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 8053c17:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
 8053c1b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 8053c1e:	01 d9                	add    %ebx,%ecx
 8053c20:	39 d1                	cmp    %edx,%ecx
 8053c22:	7d 54                	jge    8053c78 <_realloc_r+0x368>
 8053c24:	89 c2                	mov    %eax,%edx
 8053c26:	e9 8a fd ff ff       	jmp    80539b5 <_realloc_r+0xa5>
 8053c2b:	90                   	nop
 8053c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053c30:	8b 07                	mov    (%edi),%eax
 8053c32:	83 fb 1b             	cmp    $0x1b,%ebx
 8053c35:	89 01                	mov    %eax,(%ecx)
 8053c37:	8b 47 04             	mov    0x4(%edi),%eax
 8053c3a:	89 41 04             	mov    %eax,0x4(%ecx)
 8053c3d:	0f 87 2d 01 00 00    	ja     8053d70 <_realloc_r+0x460>
 8053c43:	8d 41 08             	lea    0x8(%ecx),%eax
 8053c46:	8d 57 08             	lea    0x8(%edi),%edx
 8053c49:	e9 f8 fe ff ff       	jmp    8053b46 <_realloc_r+0x236>
 8053c4e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053c52:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053c56:	89 f7                	mov    %esi,%edi
 8053c58:	89 34 24             	mov    %esi,(%esp)
 8053c5b:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053c5e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053c61:	e8 ca fb ff ff       	call   8053830 <memmove>
 8053c66:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053c69:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8053c6c:	8b 41 04             	mov    0x4(%ecx),%eax
 8053c6f:	89 ce                	mov    %ecx,%esi
 8053c71:	89 d3                	mov    %edx,%ebx
 8053c73:	e9 fb fd ff ff       	jmp    8053a73 <_realloc_r+0x163>
 8053c78:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053c7b:	29 d9                	sub    %ebx,%ecx
 8053c7d:	01 de                	add    %ebx,%esi
 8053c7f:	83 c9 01             	or     $0x1,%ecx
 8053c82:	89 35 88 80 05 08    	mov    %esi,0x8058088
 8053c88:	89 4e 04             	mov    %ecx,0x4(%esi)
 8053c8b:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053c8e:	83 e0 01             	and    $0x1,%eax
 8053c91:	09 d8                	or     %ebx,%eax
 8053c93:	89 47 fc             	mov    %eax,-0x4(%edi)
 8053c96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053c99:	89 04 24             	mov    %eax,(%esp)
 8053c9c:	e8 df bf ff ff       	call   804fc80 <__malloc_unlock>
 8053ca1:	89 f8                	mov    %edi,%eax
 8053ca3:	e9 ef fd ff ff       	jmp    8053a97 <_realloc_r+0x187>
 8053ca8:	89 0c 24             	mov    %ecx,(%esp)
 8053cab:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053caf:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053cb3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053cb6:	e8 75 fb ff ff       	call   8053830 <memmove>
 8053cbb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053cbe:	e9 93 fe ff ff       	jmp    8053b56 <_realloc_r+0x246>
 8053cc3:	90                   	nop
 8053cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053cc8:	8d 14 18             	lea    (%eax,%ebx,1),%edx
 8053ccb:	e9 d2 fe ff ff       	jmp    8053ba2 <_realloc_r+0x292>
 8053cd0:	8d 14 18             	lea    (%eax,%ebx,1),%edx
 8053cd3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8053cd6:	01 d0                	add    %edx,%eax
 8053cd8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8053cdb:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8053cde:	83 c0 10             	add    $0x10,%eax
 8053ce1:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
 8053ce4:	0f 8c b8 fe ff ff    	jl     8053ba2 <_realloc_r+0x292>
 8053cea:	8b 41 0c             	mov    0xc(%ecx),%eax
 8053ced:	83 eb 04             	sub    $0x4,%ebx
 8053cf0:	8b 51 08             	mov    0x8(%ecx),%edx
 8053cf3:	83 fb 24             	cmp    $0x24,%ebx
 8053cf6:	8d 71 08             	lea    0x8(%ecx),%esi
 8053cf9:	89 42 0c             	mov    %eax,0xc(%edx)
 8053cfc:	89 50 08             	mov    %edx,0x8(%eax)
 8053cff:	0f 87 3d 01 00 00    	ja     8053e42 <_realloc_r+0x532>
 8053d05:	83 fb 13             	cmp    $0x13,%ebx
 8053d08:	89 f0                	mov    %esi,%eax
 8053d0a:	76 1a                	jbe    8053d26 <_realloc_r+0x416>
 8053d0c:	8b 07                	mov    (%edi),%eax
 8053d0e:	83 fb 1b             	cmp    $0x1b,%ebx
 8053d11:	89 41 08             	mov    %eax,0x8(%ecx)
 8053d14:	8b 47 04             	mov    0x4(%edi),%eax
 8053d17:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053d1a:	0f 87 3d 01 00 00    	ja     8053e5d <_realloc_r+0x54d>
 8053d20:	8d 41 10             	lea    0x10(%ecx),%eax
 8053d23:	83 c7 08             	add    $0x8,%edi
 8053d26:	8b 17                	mov    (%edi),%edx
 8053d28:	89 10                	mov    %edx,(%eax)
 8053d2a:	8b 57 04             	mov    0x4(%edi),%edx
 8053d2d:	89 50 04             	mov    %edx,0x4(%eax)
 8053d30:	8b 57 08             	mov    0x8(%edi),%edx
 8053d33:	89 50 08             	mov    %edx,0x8(%eax)
 8053d36:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053d39:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8053d3c:	89 d8                	mov    %ebx,%eax
 8053d3e:	29 df                	sub    %ebx,%edi
 8053d40:	01 c8                	add    %ecx,%eax
 8053d42:	83 cf 01             	or     $0x1,%edi
 8053d45:	a3 88 80 05 08       	mov    %eax,0x8058088
 8053d4a:	89 78 04             	mov    %edi,0x4(%eax)
 8053d4d:	8b 41 04             	mov    0x4(%ecx),%eax
 8053d50:	83 e0 01             	and    $0x1,%eax
 8053d53:	09 d8                	or     %ebx,%eax
 8053d55:	89 41 04             	mov    %eax,0x4(%ecx)
 8053d58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053d5b:	89 04 24             	mov    %eax,(%esp)
 8053d5e:	e8 1d bf ff ff       	call   804fc80 <__malloc_unlock>
 8053d63:	89 f0                	mov    %esi,%eax
 8053d65:	e9 2d fd ff ff       	jmp    8053a97 <_realloc_r+0x187>
 8053d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053d70:	8b 47 08             	mov    0x8(%edi),%eax
 8053d73:	83 fb 24             	cmp    $0x24,%ebx
 8053d76:	89 41 08             	mov    %eax,0x8(%ecx)
 8053d79:	8b 47 0c             	mov    0xc(%edi),%eax
 8053d7c:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053d7f:	74 60                	je     8053de1 <_realloc_r+0x4d1>
 8053d81:	8d 41 10             	lea    0x10(%ecx),%eax
 8053d84:	8d 57 10             	lea    0x10(%edi),%edx
 8053d87:	e9 ba fd ff ff       	jmp    8053b46 <_realloc_r+0x236>
 8053d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053d90:	8b 51 fc             	mov    -0x4(%ecx),%edx
 8053d93:	83 e2 fc             	and    $0xfffffffc,%edx
 8053d96:	01 d3                	add    %edx,%ebx
 8053d98:	e9 d6 fc ff ff       	jmp    8053a73 <_realloc_r+0x163>
 8053d9d:	8d 76 00             	lea    0x0(%esi),%esi
 8053da0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053da4:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053da8:	89 f7                	mov    %esi,%edi
 8053daa:	89 34 24             	mov    %esi,(%esp)
 8053dad:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053db0:	e8 7b fa ff ff       	call   8053830 <memmove>
 8053db5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053db8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8053dbb:	8b 41 04             	mov    0x4(%ecx),%eax
 8053dbe:	89 ce                	mov    %ecx,%esi
 8053dc0:	e9 ae fc ff ff       	jmp    8053a73 <_realloc_r+0x163>
 8053dc5:	8b 47 08             	mov    0x8(%edi),%eax
 8053dc8:	83 fb 24             	cmp    $0x24,%ebx
 8053dcb:	89 41 10             	mov    %eax,0x10(%ecx)
 8053dce:	8b 47 0c             	mov    0xc(%edi),%eax
 8053dd1:	89 41 14             	mov    %eax,0x14(%ecx)
 8053dd4:	74 3e                	je     8053e14 <_realloc_r+0x504>
 8053dd6:	8d 41 18             	lea    0x18(%ecx),%eax
 8053dd9:	83 c7 10             	add    $0x10,%edi
 8053ddc:	e9 5b fc ff ff       	jmp    8053a3c <_realloc_r+0x12c>
 8053de1:	8b 47 10             	mov    0x10(%edi),%eax
 8053de4:	8d 57 18             	lea    0x18(%edi),%edx
 8053de7:	89 41 10             	mov    %eax,0x10(%ecx)
 8053dea:	8b 5f 14             	mov    0x14(%edi),%ebx
 8053ded:	8d 41 18             	lea    0x18(%ecx),%eax
 8053df0:	89 59 14             	mov    %ebx,0x14(%ecx)
 8053df3:	e9 4e fd ff ff       	jmp    8053b46 <_realloc_r+0x236>
 8053df8:	8b 47 08             	mov    0x8(%edi),%eax
 8053dfb:	83 fb 24             	cmp    $0x24,%ebx
 8053dfe:	89 41 10             	mov    %eax,0x10(%ecx)
 8053e01:	8b 47 0c             	mov    0xc(%edi),%eax
 8053e04:	89 41 14             	mov    %eax,0x14(%ecx)
 8053e07:	74 22                	je     8053e2b <_realloc_r+0x51b>
 8053e09:	8d 41 18             	lea    0x18(%ecx),%eax
 8053e0c:	83 c7 10             	add    $0x10,%edi
 8053e0f:	e9 d3 fd ff ff       	jmp    8053be7 <_realloc_r+0x2d7>
 8053e14:	8b 47 10             	mov    0x10(%edi),%eax
 8053e17:	83 c7 18             	add    $0x18,%edi
 8053e1a:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e1d:	8b 57 fc             	mov    -0x4(%edi),%edx
 8053e20:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e23:	89 51 1c             	mov    %edx,0x1c(%ecx)
 8053e26:	e9 11 fc ff ff       	jmp    8053a3c <_realloc_r+0x12c>
 8053e2b:	8b 47 10             	mov    0x10(%edi),%eax
 8053e2e:	83 c7 18             	add    $0x18,%edi
 8053e31:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e34:	8b 5f fc             	mov    -0x4(%edi),%ebx
 8053e37:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e3a:	89 59 1c             	mov    %ebx,0x1c(%ecx)
 8053e3d:	e9 a5 fd ff ff       	jmp    8053be7 <_realloc_r+0x2d7>
 8053e42:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053e46:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053e4a:	89 34 24             	mov    %esi,(%esp)
 8053e4d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053e50:	e8 db f9 ff ff       	call   8053830 <memmove>
 8053e55:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053e58:	e9 d9 fe ff ff       	jmp    8053d36 <_realloc_r+0x426>
 8053e5d:	8b 47 08             	mov    0x8(%edi),%eax
 8053e60:	83 fb 24             	cmp    $0x24,%ebx
 8053e63:	89 41 10             	mov    %eax,0x10(%ecx)
 8053e66:	8b 47 0c             	mov    0xc(%edi),%eax
 8053e69:	89 41 14             	mov    %eax,0x14(%ecx)
 8053e6c:	74 1d                	je     8053e8b <_realloc_r+0x57b>
 8053e6e:	8d 41 18             	lea    0x18(%ecx),%eax
 8053e71:	83 c7 10             	add    $0x10,%edi
 8053e74:	e9 ad fe ff ff       	jmp    8053d26 <_realloc_r+0x416>
 8053e79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053e7c:	89 04 24             	mov    %eax,(%esp)
 8053e7f:	e8 fc bd ff ff       	call   804fc80 <__malloc_unlock>
 8053e84:	31 c0                	xor    %eax,%eax
 8053e86:	e9 0c fc ff ff       	jmp    8053a97 <_realloc_r+0x187>
 8053e8b:	8b 47 10             	mov    0x10(%edi),%eax
 8053e8e:	83 c7 18             	add    $0x18,%edi
 8053e91:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e94:	8b 57 fc             	mov    -0x4(%edi),%edx
 8053e97:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e9a:	89 51 1c             	mov    %edx,0x1c(%ecx)
 8053e9d:	e9 84 fe ff ff       	jmp    8053d26 <_realloc_r+0x416>
 8053ea2:	66 90                	xchg   %ax,%ax
 8053ea4:	66 90                	xchg   %ax,%ax
 8053ea6:	66 90                	xchg   %ax,%ax
 8053ea8:	66 90                	xchg   %ax,%ax
 8053eaa:	66 90                	xchg   %ax,%ax
 8053eac:	66 90                	xchg   %ax,%ax
 8053eae:	66 90                	xchg   %ax,%ax

08053eb0 <cleanup_glue>:
 8053eb0:	55                   	push   %ebp
 8053eb1:	89 e5                	mov    %esp,%ebp
 8053eb3:	56                   	push   %esi
 8053eb4:	53                   	push   %ebx
 8053eb5:	83 ec 10             	sub    $0x10,%esp
 8053eb8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8053ebb:	8b 75 08             	mov    0x8(%ebp),%esi
 8053ebe:	8b 03                	mov    (%ebx),%eax
 8053ec0:	85 c0                	test   %eax,%eax
 8053ec2:	74 0c                	je     8053ed0 <cleanup_glue+0x20>
 8053ec4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053ec8:	89 34 24             	mov    %esi,(%esp)
 8053ecb:	e8 e0 ff ff ff       	call   8053eb0 <cleanup_glue>
 8053ed0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 8053ed3:	89 75 08             	mov    %esi,0x8(%ebp)
 8053ed6:	83 c4 10             	add    $0x10,%esp
 8053ed9:	5b                   	pop    %ebx
 8053eda:	5e                   	pop    %esi
 8053edb:	5d                   	pop    %ebp
 8053edc:	e9 bf af ff ff       	jmp    804eea0 <_free_r>
 8053ee1:	eb 0d                	jmp    8053ef0 <_reclaim_reent>
 8053ee3:	90                   	nop
 8053ee4:	90                   	nop
 8053ee5:	90                   	nop
 8053ee6:	90                   	nop
 8053ee7:	90                   	nop
 8053ee8:	90                   	nop
 8053ee9:	90                   	nop
 8053eea:	90                   	nop
 8053eeb:	90                   	nop
 8053eec:	90                   	nop
 8053eed:	90                   	nop
 8053eee:	90                   	nop
 8053eef:	90                   	nop

08053ef0 <_reclaim_reent>:
 8053ef0:	55                   	push   %ebp
 8053ef1:	89 e5                	mov    %esp,%ebp
 8053ef3:	57                   	push   %edi
 8053ef4:	56                   	push   %esi
 8053ef5:	53                   	push   %ebx
 8053ef6:	83 ec 1c             	sub    $0x1c,%esp
 8053ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8053efc:	3b 1d 80 7b 05 08    	cmp    0x8057b80,%ebx
 8053f02:	0f 84 a6 00 00 00    	je     8053fae <_reclaim_reent+0xbe>
 8053f08:	8b 53 4c             	mov    0x4c(%ebx),%edx
 8053f0b:	85 d2                	test   %edx,%edx
 8053f0d:	74 46                	je     8053f55 <_reclaim_reent+0x65>
 8053f0f:	31 c0                	xor    %eax,%eax
 8053f11:	31 f6                	xor    %esi,%esi
 8053f13:	90                   	nop
 8053f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053f18:	8b 04 82             	mov    (%edx,%eax,4),%eax
 8053f1b:	85 c0                	test   %eax,%eax
 8053f1d:	75 0b                	jne    8053f2a <_reclaim_reent+0x3a>
 8053f1f:	eb 1e                	jmp    8053f3f <_reclaim_reent+0x4f>
 8053f21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053f28:	89 f8                	mov    %edi,%eax
 8053f2a:	8b 38                	mov    (%eax),%edi
 8053f2c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f30:	89 1c 24             	mov    %ebx,(%esp)
 8053f33:	e8 68 af ff ff       	call   804eea0 <_free_r>
 8053f38:	85 ff                	test   %edi,%edi
 8053f3a:	75 ec                	jne    8053f28 <_reclaim_reent+0x38>
 8053f3c:	8b 53 4c             	mov    0x4c(%ebx),%edx
 8053f3f:	83 c6 01             	add    $0x1,%esi
 8053f42:	83 fe 20             	cmp    $0x20,%esi
 8053f45:	89 f0                	mov    %esi,%eax
 8053f47:	75 cf                	jne    8053f18 <_reclaim_reent+0x28>
 8053f49:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053f4d:	89 1c 24             	mov    %ebx,(%esp)
 8053f50:	e8 4b af ff ff       	call   804eea0 <_free_r>
 8053f55:	8b 43 40             	mov    0x40(%ebx),%eax
 8053f58:	85 c0                	test   %eax,%eax
 8053f5a:	74 0c                	je     8053f68 <_reclaim_reent+0x78>
 8053f5c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f60:	89 1c 24             	mov    %ebx,(%esp)
 8053f63:	e8 38 af ff ff       	call   804eea0 <_free_r>
 8053f68:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
 8053f6e:	85 c0                	test   %eax,%eax
 8053f70:	74 22                	je     8053f94 <_reclaim_reent+0xa4>
 8053f72:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
 8053f78:	39 f0                	cmp    %esi,%eax
 8053f7a:	75 06                	jne    8053f82 <_reclaim_reent+0x92>
 8053f7c:	eb 16                	jmp    8053f94 <_reclaim_reent+0xa4>
 8053f7e:	66 90                	xchg   %ax,%ax
 8053f80:	89 f8                	mov    %edi,%eax
 8053f82:	8b 38                	mov    (%eax),%edi
 8053f84:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f88:	89 1c 24             	mov    %ebx,(%esp)
 8053f8b:	e8 10 af ff ff       	call   804eea0 <_free_r>
 8053f90:	39 fe                	cmp    %edi,%esi
 8053f92:	75 ec                	jne    8053f80 <_reclaim_reent+0x90>
 8053f94:	8b 43 54             	mov    0x54(%ebx),%eax
 8053f97:	85 c0                	test   %eax,%eax
 8053f99:	74 0c                	je     8053fa7 <_reclaim_reent+0xb7>
 8053f9b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f9f:	89 1c 24             	mov    %ebx,(%esp)
 8053fa2:	e8 f9 ae ff ff       	call   804eea0 <_free_r>
 8053fa7:	8b 43 38             	mov    0x38(%ebx),%eax
 8053faa:	85 c0                	test   %eax,%eax
 8053fac:	75 08                	jne    8053fb6 <_reclaim_reent+0xc6>
 8053fae:	83 c4 1c             	add    $0x1c,%esp
 8053fb1:	5b                   	pop    %ebx
 8053fb2:	5e                   	pop    %esi
 8053fb3:	5f                   	pop    %edi
 8053fb4:	5d                   	pop    %ebp
 8053fb5:	c3                   	ret    
 8053fb6:	89 1c 24             	mov    %ebx,(%esp)
 8053fb9:	ff 53 3c             	call   *0x3c(%ebx)
 8053fbc:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
 8053fc2:	85 c0                	test   %eax,%eax
 8053fc4:	74 e8                	je     8053fae <_reclaim_reent+0xbe>
 8053fc6:	89 1c 24             	mov    %ebx,(%esp)
 8053fc9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053fcd:	e8 de fe ff ff       	call   8053eb0 <cleanup_glue>
 8053fd2:	83 c4 1c             	add    $0x1c,%esp
 8053fd5:	5b                   	pop    %ebx
 8053fd6:	5e                   	pop    %esi
 8053fd7:	5f                   	pop    %edi
 8053fd8:	5d                   	pop    %ebp
 8053fd9:	c3                   	ret    
 8053fda:	66 90                	xchg   %ax,%ax
 8053fdc:	66 90                	xchg   %ax,%ax
 8053fde:	66 90                	xchg   %ax,%ax

08053fe0 <__swbuf_r>:
 8053fe0:	55                   	push   %ebp
 8053fe1:	89 e5                	mov    %esp,%ebp
 8053fe3:	57                   	push   %edi
 8053fe4:	56                   	push   %esi
 8053fe5:	53                   	push   %ebx
 8053fe6:	83 ec 1c             	sub    $0x1c,%esp
 8053fe9:	8b 75 08             	mov    0x8(%ebp),%esi
 8053fec:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8053fef:	85 f6                	test   %esi,%esi
 8053ff1:	74 0b                	je     8053ffe <__swbuf_r+0x1e>
 8053ff3:	8b 46 38             	mov    0x38(%esi),%eax
 8053ff6:	85 c0                	test   %eax,%eax
 8053ff8:	0f 84 da 00 00 00    	je     80540d8 <__swbuf_r+0xf8>
 8053ffe:	8b 43 18             	mov    0x18(%ebx),%eax
 8054001:	89 43 08             	mov    %eax,0x8(%ebx)
 8054004:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8054008:	a8 08                	test   $0x8,%al
 805400a:	0f 84 a8 00 00 00    	je     80540b8 <__swbuf_r+0xd8>
 8054010:	8b 53 10             	mov    0x10(%ebx),%edx
 8054013:	85 d2                	test   %edx,%edx
 8054015:	0f 84 9d 00 00 00    	je     80540b8 <__swbuf_r+0xd8>
 805401b:	f6 c4 20             	test   $0x20,%ah
 805401e:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
 8054022:	74 3c                	je     8054060 <__swbuf_r+0x80>
 8054024:	8b 03                	mov    (%ebx),%eax
 8054026:	89 c1                	mov    %eax,%ecx
 8054028:	29 d1                	sub    %edx,%ecx
 805402a:	3b 4b 14             	cmp    0x14(%ebx),%ecx
 805402d:	89 ca                	mov    %ecx,%edx
 805402f:	7d 4a                	jge    805407b <__swbuf_r+0x9b>
 8054031:	83 c2 01             	add    $0x1,%edx
 8054034:	8d 48 01             	lea    0x1(%eax),%ecx
 8054037:	89 0b                	mov    %ecx,(%ebx)
 8054039:	89 f9                	mov    %edi,%ecx
 805403b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
 805403f:	88 08                	mov    %cl,(%eax)
 8054041:	39 53 14             	cmp    %edx,0x14(%ebx)
 8054044:	74 52                	je     8054098 <__swbuf_r+0xb8>
 8054046:	f6 43 0c 01          	testb  $0x1,0xc(%ebx)
 805404a:	89 f8                	mov    %edi,%eax
 805404c:	74 05                	je     8054053 <__swbuf_r+0x73>
 805404e:	83 ff 0a             	cmp    $0xa,%edi
 8054051:	74 45                	je     8054098 <__swbuf_r+0xb8>
 8054053:	83 c4 1c             	add    $0x1c,%esp
 8054056:	5b                   	pop    %ebx
 8054057:	5e                   	pop    %esi
 8054058:	5f                   	pop    %edi
 8054059:	5d                   	pop    %ebp
 805405a:	c3                   	ret    
 805405b:	90                   	nop
 805405c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054060:	80 cc 20             	or     $0x20,%ah
 8054063:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8054067:	8b 03                	mov    (%ebx),%eax
 8054069:	81 63 64 ff df ff ff 	andl   $0xffffdfff,0x64(%ebx)
 8054070:	89 c1                	mov    %eax,%ecx
 8054072:	29 d1                	sub    %edx,%ecx
 8054074:	3b 4b 14             	cmp    0x14(%ebx),%ecx
 8054077:	89 ca                	mov    %ecx,%edx
 8054079:	7c b6                	jl     8054031 <__swbuf_r+0x51>
 805407b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805407f:	89 34 24             	mov    %esi,(%esp)
 8054082:	e8 59 a8 ff ff       	call   804e8e0 <_fflush_r>
 8054087:	85 c0                	test   %eax,%eax
 8054089:	75 5d                	jne    80540e8 <__swbuf_r+0x108>
 805408b:	8b 03                	mov    (%ebx),%eax
 805408d:	ba 01 00 00 00       	mov    $0x1,%edx
 8054092:	eb a0                	jmp    8054034 <__swbuf_r+0x54>
 8054094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054098:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805409c:	89 34 24             	mov    %esi,(%esp)
 805409f:	e8 3c a8 ff ff       	call   804e8e0 <_fflush_r>
 80540a4:	85 c0                	test   %eax,%eax
 80540a6:	75 40                	jne    80540e8 <__swbuf_r+0x108>
 80540a8:	83 c4 1c             	add    $0x1c,%esp
 80540ab:	89 f8                	mov    %edi,%eax
 80540ad:	5b                   	pop    %ebx
 80540ae:	5e                   	pop    %esi
 80540af:	5f                   	pop    %edi
 80540b0:	5d                   	pop    %ebp
 80540b1:	c3                   	ret    
 80540b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80540b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80540bc:	89 34 24             	mov    %esi,(%esp)
 80540bf:	e8 1c 91 ff ff       	call   804d1e0 <__swsetup_r>
 80540c4:	85 c0                	test   %eax,%eax
 80540c6:	75 20                	jne    80540e8 <__swbuf_r+0x108>
 80540c8:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 80540cc:	8b 53 10             	mov    0x10(%ebx),%edx
 80540cf:	e9 47 ff ff ff       	jmp    805401b <__swbuf_r+0x3b>
 80540d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80540d8:	89 34 24             	mov    %esi,(%esp)
 80540db:	e8 70 a9 ff ff       	call   804ea50 <__sinit>
 80540e0:	e9 19 ff ff ff       	jmp    8053ffe <__swbuf_r+0x1e>
 80540e5:	8d 76 00             	lea    0x0(%esi),%esi
 80540e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80540ed:	e9 61 ff ff ff       	jmp    8054053 <__swbuf_r+0x73>
 80540f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80540f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08054100 <__swbuf>:
 8054100:	55                   	push   %ebp
 8054101:	89 e5                	mov    %esp,%ebp
 8054103:	83 ec 18             	sub    $0x18,%esp
 8054106:	e8 e5 b0 ff ff       	call   804f1f0 <__getreent>
 805410b:	8b 55 0c             	mov    0xc(%ebp),%edx
 805410e:	89 54 24 08          	mov    %edx,0x8(%esp)
 8054112:	8b 55 08             	mov    0x8(%ebp),%edx
 8054115:	89 04 24             	mov    %eax,(%esp)
 8054118:	89 54 24 04          	mov    %edx,0x4(%esp)
 805411c:	e8 bf fe ff ff       	call   8053fe0 <__swbuf_r>
 8054121:	c9                   	leave  
 8054122:	c3                   	ret    
 8054123:	66 90                	xchg   %ax,%ax
 8054125:	66 90                	xchg   %ax,%ax
 8054127:	66 90                	xchg   %ax,%ax
 8054129:	66 90                	xchg   %ax,%ax
 805412b:	66 90                	xchg   %ax,%ax
 805412d:	66 90                	xchg   %ax,%ax
 805412f:	90                   	nop

08054130 <_wcrtomb_r>:
 8054130:	55                   	push   %ebp
 8054131:	89 e5                	mov    %esp,%ebp
 8054133:	57                   	push   %edi
 8054134:	56                   	push   %esi
 8054135:	53                   	push   %ebx
 8054136:	83 ec 3c             	sub    $0x3c,%esp
 8054139:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805413c:	8b 75 14             	mov    0x14(%ebp),%esi
 805413f:	85 ff                	test   %edi,%edi
 8054141:	74 45                	je     8054188 <_wcrtomb_r+0x58>
 8054143:	8b 1d 88 84 05 08    	mov    0x8058488,%ebx
 8054149:	e8 22 b1 ff ff       	call   804f270 <__locale_charset>
 805414e:	89 74 24 10          	mov    %esi,0x10(%esp)
 8054152:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8054156:	89 44 24 0c          	mov    %eax,0xc(%esp)
 805415a:	8b 45 10             	mov    0x10(%ebp),%eax
 805415d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8054161:	8b 45 08             	mov    0x8(%ebp),%eax
 8054164:	89 04 24             	mov    %eax,(%esp)
 8054167:	ff d3                	call   *%ebx
 8054169:	83 f8 ff             	cmp    $0xffffffff,%eax
 805416c:	75 0f                	jne    805417d <_wcrtomb_r+0x4d>
 805416e:	8b 55 08             	mov    0x8(%ebp),%edx
 8054171:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8054177:	c7 02 8a 00 00 00    	movl   $0x8a,(%edx)
 805417d:	83 c4 3c             	add    $0x3c,%esp
 8054180:	5b                   	pop    %ebx
 8054181:	5e                   	pop    %esi
 8054182:	5f                   	pop    %edi
 8054183:	5d                   	pop    %ebp
 8054184:	c3                   	ret    
 8054185:	8d 76 00             	lea    0x0(%esi),%esi
 8054188:	8b 3d 88 84 05 08    	mov    0x8058488,%edi
 805418e:	e8 dd b0 ff ff       	call   804f270 <__locale_charset>
 8054193:	89 74 24 10          	mov    %esi,0x10(%esp)
 8054197:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 805419e:	00 
 805419f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80541a3:	8d 45 de             	lea    -0x22(%ebp),%eax
 80541a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80541aa:	8b 45 08             	mov    0x8(%ebp),%eax
 80541ad:	89 04 24             	mov    %eax,(%esp)
 80541b0:	ff d7                	call   *%edi
 80541b2:	eb b5                	jmp    8054169 <_wcrtomb_r+0x39>
 80541b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80541ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

080541c0 <wcrtomb>:
 80541c0:	55                   	push   %ebp
 80541c1:	89 e5                	mov    %esp,%ebp
 80541c3:	57                   	push   %edi
 80541c4:	56                   	push   %esi
 80541c5:	53                   	push   %ebx
 80541c6:	83 ec 3c             	sub    $0x3c,%esp
 80541c9:	8b 7d 08             	mov    0x8(%ebp),%edi
 80541cc:	e8 1f b0 ff ff       	call   804f1f0 <__getreent>
 80541d1:	85 ff                	test   %edi,%edi
 80541d3:	89 c3                	mov    %eax,%ebx
 80541d5:	74 49                	je     8054220 <wcrtomb+0x60>
 80541d7:	8b 35 88 84 05 08    	mov    0x8058488,%esi
 80541dd:	e8 8e b0 ff ff       	call   804f270 <__locale_charset>
 80541e2:	8b 55 10             	mov    0x10(%ebp),%edx
 80541e5:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80541e9:	89 1c 24             	mov    %ebx,(%esp)
 80541ec:	89 54 24 10          	mov    %edx,0x10(%esp)
 80541f0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80541f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80541f7:	89 44 24 08          	mov    %eax,0x8(%esp)
 80541fb:	ff d6                	call   *%esi
 80541fd:	83 f8 ff             	cmp    $0xffffffff,%eax
 8054200:	75 0f                	jne    8054211 <wcrtomb+0x51>
 8054202:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054205:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
 805420b:	c7 03 8a 00 00 00    	movl   $0x8a,(%ebx)
 8054211:	83 c4 3c             	add    $0x3c,%esp
 8054214:	5b                   	pop    %ebx
 8054215:	5e                   	pop    %esi
 8054216:	5f                   	pop    %edi
 8054217:	5d                   	pop    %ebp
 8054218:	c3                   	ret    
 8054219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8054220:	8b 3d 88 84 05 08    	mov    0x8058488,%edi
 8054226:	e8 45 b0 ff ff       	call   804f270 <__locale_charset>
 805422b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805422e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8054235:	00 
 8054236:	89 1c 24             	mov    %ebx,(%esp)
 8054239:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 805423d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8054241:	8d 45 de             	lea    -0x22(%ebp),%eax
 8054244:	89 44 24 04          	mov    %eax,0x4(%esp)
 8054248:	ff d7                	call   *%edi
 805424a:	eb b1                	jmp    80541fd <wcrtomb+0x3d>
 805424c:	66 90                	xchg   %ax,%ax
 805424e:	66 90                	xchg   %ax,%ax

08054250 <__ascii_wctomb>:
 8054250:	55                   	push   %ebp
 8054251:	89 e5                	mov    %esp,%ebp
 8054253:	8b 45 0c             	mov    0xc(%ebp),%eax
 8054256:	8b 55 10             	mov    0x10(%ebp),%edx
 8054259:	85 c0                	test   %eax,%eax
 805425b:	74 13                	je     8054270 <__ascii_wctomb+0x20>
 805425d:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 8054263:	77 13                	ja     8054278 <__ascii_wctomb+0x28>
 8054265:	88 10                	mov    %dl,(%eax)
 8054267:	b8 01 00 00 00       	mov    $0x1,%eax
 805426c:	5d                   	pop    %ebp
 805426d:	c3                   	ret    
 805426e:	66 90                	xchg   %ax,%ax
 8054270:	31 c0                	xor    %eax,%eax
 8054272:	5d                   	pop    %ebp
 8054273:	c3                   	ret    
 8054274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054278:	8b 45 08             	mov    0x8(%ebp),%eax
 805427b:	c7 00 8a 00 00 00    	movl   $0x8a,(%eax)
 8054281:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8054286:	5d                   	pop    %ebp
 8054287:	c3                   	ret    
 8054288:	90                   	nop
 8054289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08054290 <_wctomb_r>:
 8054290:	55                   	push   %ebp
 8054291:	89 e5                	mov    %esp,%ebp
 8054293:	53                   	push   %ebx
 8054294:	83 ec 24             	sub    $0x24,%esp
 8054297:	8b 1d 88 84 05 08    	mov    0x8058488,%ebx
 805429d:	e8 ce af ff ff       	call   804f270 <__locale_charset>
 80542a2:	8b 55 14             	mov    0x14(%ebp),%edx
 80542a5:	89 54 24 10          	mov    %edx,0x10(%esp)
 80542a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80542ad:	8b 45 10             	mov    0x10(%ebp),%eax
 80542b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80542b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80542b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80542bb:	8b 45 08             	mov    0x8(%ebp),%eax
 80542be:	89 04 24             	mov    %eax,(%esp)
 80542c1:	ff d3                	call   *%ebx
 80542c3:	83 c4 24             	add    $0x24,%esp
 80542c6:	5b                   	pop    %ebx
 80542c7:	5d                   	pop    %ebp
 80542c8:	c3                   	ret    
