
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
 8048145:	68 c0 42 05 08       	push   $0x80542c0
 804814a:	e8 a1 0e 00 00       	call   8048ff0 <printf>
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
 804816d:	ff 35 00 77 05 08    	pushl  0x8057700
 8048173:	e8 bc 0d 00 00       	call   8048f34 <memset>
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
 804818f:	8b 35 00 77 05 08    	mov    0x8057700,%esi
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
 80481cc:	8d 14 dd 40 77 05 08 	lea    0x8057740(,%ebx,8),%edx
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
 8048215:	a1 00 77 05 08       	mov    0x8057700,%eax
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
 8048267:	68 70 43 05 08       	push   $0x8054370
 804826c:	68 a4 43 05 08       	push   $0x80543a4
 8048271:	6a 0f                	push   $0xf
 8048273:	68 e9 42 05 08       	push   $0x80542e9
 8048278:	68 28 43 05 08       	push   $0x8054328
 804827d:	e8 6e 0d 00 00       	call   8048ff0 <printf>
 8048282:	b8 01 00 00 00       	mov    $0x1,%eax
 8048287:	d6                   	(bad)  
 8048288:	83 c4 20             	add    $0x20,%esp
 804828b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804828e:	eb 85                	jmp    8048215 <draw_string+0x75>
 8048290:	83 c7 08             	add    $0x8,%edi
 8048293:	e9 14 ff ff ff       	jmp    80481ac <draw_string+0xc>
 8048298:	fa                   	cli    
 8048299:	83 ec 0c             	sub    $0xc,%esp
 804829c:	68 d8 42 05 08       	push   $0x80542d8
 80482a1:	68 af 43 05 08       	push   $0x80543af
 80482a6:	6a 18                	push   $0x18
 80482a8:	68 08 43 05 08       	push   $0x8054308
 80482ad:	68 28 43 05 08       	push   $0x8054328
 80482b2:	e8 39 0d 00 00       	call   8048ff0 <printf>
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
 80482de:	e8 7d 00 00 00       	call   8048360 <syscall>
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
 80482fe:	68 f0 85 04 08       	push   $0x80485f0
 8048303:	6a 00                	push   $0x0
 8048305:	6a 00                	push   $0x0
 8048307:	e8 54 00 00 00       	call   8048360 <syscall>
 804830c:	68 02 44 05 08       	push   $0x8054402
 8048311:	6a 11                	push   $0x11
 8048313:	68 be 43 05 08       	push   $0x80543be
 8048318:	68 d8 43 05 08       	push   $0x80543d8
 804831d:	e8 ce 0c 00 00       	call   8048ff0 <printf>
 8048322:	83 c4 20             	add    $0x20,%esp
 8048325:	e8 06 03 00 00       	call   8048630 <main_loop>
 804832a:	fa                   	cli    
 804832b:	83 ec 0c             	sub    $0xc,%esp
 804832e:	68 e7 42 05 08       	push   $0x80542e7
 8048333:	68 02 44 05 08       	push   $0x8054402
 8048338:	6a 15                	push   $0x15
 804833a:	68 be 43 05 08       	push   $0x80543be
 804833f:	68 28 43 05 08       	push   $0x8054328
 8048344:	e8 a7 0c 00 00       	call   8048ff0 <printf>
 8048349:	b8 01 00 00 00       	mov    $0x1,%eax
 804834e:	d6                   	(bad)  
 804834f:	83 c4 20             	add    $0x20,%esp
 8048352:	c9                   	leave  
 8048353:	c3                   	ret    
 8048354:	66 90                	xchg   %ax,%ax
 8048356:	66 90                	xchg   %ax,%ax
 8048358:	66 90                	xchg   %ax,%ax
 804835a:	66 90                	xchg   %ax,%ax
 804835c:	66 90                	xchg   %ax,%ax
 804835e:	66 90                	xchg   %ax,%ax

08048360 <syscall>:
 8048360:	55                   	push   %ebp
 8048361:	89 e5                	mov    %esp,%ebp
 8048363:	53                   	push   %ebx
 8048364:	8b 55 14             	mov    0x14(%ebp),%edx
 8048367:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804836a:	8b 45 08             	mov    0x8(%ebp),%eax
 804836d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048370:	cd 80                	int    $0x80
 8048372:	5b                   	pop    %ebx
 8048373:	5d                   	pop    %ebp
 8048374:	c3                   	ret    
 8048375:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048380 <_exit>:
 8048380:	55                   	push   %ebp
 8048381:	89 e5                	mov    %esp,%ebp
 8048383:	8b 45 08             	mov    0x8(%ebp),%eax
 8048386:	85 c0                	test   %eax,%eax
 8048388:	74 06                	je     8048390 <_exit+0x10>
 804838a:	b8 01 00 00 00       	mov    $0x1,%eax
 804838f:	d6                   	(bad)  
 8048390:	5d                   	pop    %ebp
 8048391:	c3                   	ret    
 8048392:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483a0 <open>:
 80483a0:	55                   	push   %ebp
 80483a1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483a6:	89 e5                	mov    %esp,%ebp
 80483a8:	d6                   	(bad)  
 80483a9:	30 c0                	xor    %al,%al
 80483ab:	5d                   	pop    %ebp
 80483ac:	c3                   	ret    
 80483ad:	8d 76 00             	lea    0x0(%esi),%esi

080483b0 <read>:
 80483b0:	55                   	push   %ebp
 80483b1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483b6:	89 e5                	mov    %esp,%ebp
 80483b8:	d6                   	(bad)  
 80483b9:	30 c0                	xor    %al,%al
 80483bb:	5d                   	pop    %ebp
 80483bc:	c3                   	ret    
 80483bd:	8d 76 00             	lea    0x0(%esi),%esi

080483c0 <write>:
 80483c0:	55                   	push   %ebp
 80483c1:	89 e5                	mov    %esp,%ebp
 80483c3:	ff 75 10             	pushl  0x10(%ebp)
 80483c6:	ff 75 0c             	pushl  0xc(%ebp)
 80483c9:	ff 75 08             	pushl  0x8(%ebp)
 80483cc:	6a 04                	push   $0x4
 80483ce:	e8 8d ff ff ff       	call   8048360 <syscall>
 80483d3:	c9                   	leave  
 80483d4:	c3                   	ret    
 80483d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483e0 <lseek>:
 80483e0:	55                   	push   %ebp
 80483e1:	b8 01 00 00 00       	mov    $0x1,%eax
 80483e6:	89 e5                	mov    %esp,%ebp
 80483e8:	d6                   	(bad)  
 80483e9:	30 c0                	xor    %al,%al
 80483eb:	5d                   	pop    %ebp
 80483ec:	c3                   	ret    
 80483ed:	8d 76 00             	lea    0x0(%esi),%esi

080483f0 <sbrk>:
 80483f0:	55                   	push   %ebp
 80483f1:	89 e5                	mov    %esp,%ebp
 80483f3:	56                   	push   %esi
 80483f4:	53                   	push   %ebx
 80483f5:	8b 1d 80 7e 06 08    	mov    0x8067e80,%ebx
 80483fb:	85 db                	test   %ebx,%ebx
 80483fd:	74 31                	je     8048430 <sbrk+0x40>
 80483ff:	8b 75 08             	mov    0x8(%ebp),%esi
 8048402:	01 de                	add    %ebx,%esi
 8048404:	56                   	push   %esi
 8048405:	6a 2d                	push   $0x2d
 8048407:	e8 54 ff ff ff       	call   8048360 <syscall>
 804840c:	85 c0                	test   %eax,%eax
 804840e:	5a                   	pop    %edx
 804840f:	59                   	pop    %ecx
 8048410:	74 06                	je     8048418 <sbrk+0x28>
 8048412:	b8 01 00 00 00       	mov    $0x1,%eax
 8048417:	d6                   	(bad)  
 8048418:	89 35 80 7e 06 08    	mov    %esi,0x8067e80
 804841e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048421:	89 d8                	mov    %ebx,%eax
 8048423:	5b                   	pop    %ebx
 8048424:	5e                   	pop    %esi
 8048425:	5d                   	pop    %ebp
 8048426:	c3                   	ret    
 8048427:	89 f6                	mov    %esi,%esi
 8048429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048430:	bb 58 dd 06 08       	mov    $0x806dd58,%ebx
 8048435:	eb c8                	jmp    80483ff <sbrk+0xf>
 8048437:	89 f6                	mov    %esi,%esi
 8048439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048440 <close>:
 8048440:	55                   	push   %ebp
 8048441:	b8 01 00 00 00       	mov    $0x1,%eax
 8048446:	89 e5                	mov    %esp,%ebp
 8048448:	d6                   	(bad)  
 8048449:	30 c0                	xor    %al,%al
 804844b:	5d                   	pop    %ebp
 804844c:	c3                   	ret    
 804844d:	8d 76 00             	lea    0x0(%esi),%esi

08048450 <fstat>:
 8048450:	55                   	push   %ebp
 8048451:	89 e5                	mov    %esp,%ebp
 8048453:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048456:	c7 40 04 00 20 00 00 	movl   $0x2000,0x4(%eax)
 804845d:	31 c0                	xor    %eax,%eax
 804845f:	5d                   	pop    %ebp
 8048460:	c3                   	ret    
 8048461:	eb 0d                	jmp    8048470 <isatty>
 8048463:	90                   	nop
 8048464:	90                   	nop
 8048465:	90                   	nop
 8048466:	90                   	nop
 8048467:	90                   	nop
 8048468:	90                   	nop
 8048469:	90                   	nop
 804846a:	90                   	nop
 804846b:	90                   	nop
 804846c:	90                   	nop
 804846d:	90                   	nop
 804846e:	90                   	nop
 804846f:	90                   	nop

08048470 <isatty>:
 8048470:	55                   	push   %ebp
 8048471:	31 c0                	xor    %eax,%eax
 8048473:	89 e5                	mov    %esp,%ebp
 8048475:	5d                   	pop    %ebp
 8048476:	c3                   	ret    
 8048477:	66 90                	xchg   %ax,%ax
 8048479:	66 90                	xchg   %ax,%ax
 804847b:	66 90                	xchg   %ax,%ax
 804847d:	66 90                	xchg   %ax,%ax
 804847f:	90                   	nop

08048480 <redraw_screen>:
 8048480:	55                   	push   %ebp
 8048481:	89 e5                	mov    %esp,%ebp
 8048483:	53                   	push   %ebx
 8048484:	83 ec 04             	sub    $0x4,%esp
 8048487:	e8 d4 fc ff ff       	call   8048160 <prepare_buffer>
 804848c:	e8 df 04 00 00       	call   8048970 <characters>
 8048491:	85 c0                	test   %eax,%eax
 8048493:	89 c3                	mov    %eax,%ebx
 8048495:	74 3b                	je     80484d2 <redraw_screen+0x52>
 8048497:	89 f6                	mov    %esi,%esi
 8048499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 80484a0:	0f b6 43 08          	movzbl 0x8(%ebx),%eax
 80484a4:	c6 05 a3 7e 06 08 00 	movb   $0x0,0x8067ea3
 80484ab:	6a 0f                	push   $0xf
 80484ad:	ff 73 04             	pushl  0x4(%ebx)
 80484b0:	83 c0 41             	add    $0x41,%eax
 80484b3:	a2 a2 7e 06 08       	mov    %al,0x8067ea2
 80484b8:	8b 03                	mov    (%ebx),%eax
 80484ba:	c1 f8 10             	sar    $0x10,%eax
 80484bd:	50                   	push   %eax
 80484be:	68 a2 7e 06 08       	push   $0x8067ea2
 80484c3:	e8 d8 fc ff ff       	call   80481a0 <draw_string>
 80484c8:	8b 5b 14             	mov    0x14(%ebx),%ebx
 80484cb:	83 c4 10             	add    $0x10,%esp
 80484ce:	85 db                	test   %ebx,%ebx
 80484d0:	75 ce                	jne    80484a0 <redraw_screen+0x20>
 80484d2:	e8 09 08 00 00       	call   8048ce0 <last_key_code>
 80484d7:	50                   	push   %eax
 80484d8:	68 0c 44 05 08       	push   $0x805440c
 80484dd:	6a 1e                	push   $0x1e
 80484df:	68 84 7e 06 08       	push   $0x8067e84
 80484e4:	e8 47 0c 00 00       	call   8049130 <snprintf>
 80484e9:	6a 30                	push   $0x30
 80484eb:	6a 00                	push   $0x0
 80484ed:	68 c0 00 00 00       	push   $0xc0
 80484f2:	68 84 7e 06 08       	push   $0x8067e84
 80484f7:	e8 a4 fc ff ff       	call   80481a0 <draw_string>
 80484fc:	83 c4 20             	add    $0x20,%esp
 80484ff:	e8 4c 04 00 00       	call   8048950 <get_hit>
 8048504:	50                   	push   %eax
 8048505:	68 0c 44 05 08       	push   $0x805440c
 804850a:	6a 1e                	push   $0x1e
 804850c:	68 84 7e 06 08       	push   $0x8067e84
 8048511:	e8 1a 0c 00 00       	call   8049130 <snprintf>
 8048516:	c7 04 24 84 7e 06 08 	movl   $0x8067e84,(%esp)
 804851d:	e8 ae 0c 00 00       	call   80491d0 <strlen>
 8048522:	f7 d8                	neg    %eax
 8048524:	6a 0a                	push   $0xa
 8048526:	8d 04 c5 40 01 00 00 	lea    0x140(,%eax,8),%eax
 804852d:	50                   	push   %eax
 804852e:	6a 00                	push   $0x0
 8048530:	68 84 7e 06 08       	push   $0x8067e84
 8048535:	e8 66 fc ff ff       	call   80481a0 <draw_string>
 804853a:	83 c4 20             	add    $0x20,%esp
 804853d:	e8 1e 04 00 00       	call   8048960 <get_miss>
 8048542:	50                   	push   %eax
 8048543:	68 0c 44 05 08       	push   $0x805440c
 8048548:	6a 1e                	push   $0x1e
 804854a:	68 84 7e 06 08       	push   $0x8067e84
 804854f:	e8 dc 0b 00 00       	call   8049130 <snprintf>
 8048554:	c7 04 24 84 7e 06 08 	movl   $0x8067e84,(%esp)
 804855b:	e8 70 0c 00 00       	call   80491d0 <strlen>
 8048560:	f7 d8                	neg    %eax
 8048562:	6a 0c                	push   $0xc
 8048564:	8d 04 c5 40 01 00 00 	lea    0x140(,%eax,8),%eax
 804856b:	50                   	push   %eax
 804856c:	68 c0 00 00 00       	push   $0xc0
 8048571:	68 84 7e 06 08       	push   $0x8067e84
 8048576:	e8 25 fc ff ff       	call   80481a0 <draw_string>
 804857b:	83 c4 20             	add    $0x20,%esp
 804857e:	e8 9d 00 00 00       	call   8048620 <get_fps>
 8048583:	50                   	push   %eax
 8048584:	68 0c 44 05 08       	push   $0x805440c
 8048589:	6a 1e                	push   $0x1e
 804858b:	68 84 7e 06 08       	push   $0x8067e84
 8048590:	e8 9b 0b 00 00       	call   8049130 <snprintf>
 8048595:	6a 0e                	push   $0xe
 8048597:	6a 00                	push   $0x0
 8048599:	6a 00                	push   $0x0
 804859b:	68 84 7e 06 08       	push   $0x8067e84
 80485a0:	e8 fb fb ff ff       	call   80481a0 <draw_string>
 80485a5:	83 c4 20             	add    $0x20,%esp
 80485a8:	e8 73 00 00 00       	call   8048620 <get_fps>
 80485ad:	50                   	push   %eax
 80485ae:	68 0c 44 05 08       	push   $0x805440c
 80485b3:	6a 1e                	push   $0x1e
 80485b5:	68 84 7e 06 08       	push   $0x8067e84
 80485ba:	e8 71 0b 00 00       	call   8049130 <snprintf>
 80485bf:	c7 04 24 84 7e 06 08 	movl   $0x8067e84,(%esp)
 80485c6:	e8 05 0c 00 00       	call   80491d0 <strlen>
 80485cb:	c1 e0 03             	shl    $0x3,%eax
 80485ce:	6a 0e                	push   $0xe
 80485d0:	50                   	push   %eax
 80485d1:	6a 00                	push   $0x0
 80485d3:	68 0f 44 05 08       	push   $0x805440f
 80485d8:	e8 c3 fb ff ff       	call   80481a0 <draw_string>
 80485dd:	83 c4 20             	add    $0x20,%esp
 80485e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80485e3:	c9                   	leave  
 80485e4:	e9 97 fb ff ff       	jmp    8048180 <display_buffer>
 80485e9:	66 90                	xchg   %ax,%ax
 80485eb:	66 90                	xchg   %ax,%ax
 80485ed:	66 90                	xchg   %ax,%ax
 80485ef:	90                   	nop

080485f0 <timer_event>:
 80485f0:	a1 a4 7e 06 08       	mov    0x8067ea4,%eax
 80485f5:	55                   	push   %ebp
 80485f6:	89 e5                	mov    %esp,%ebp
 80485f8:	83 c0 01             	add    $0x1,%eax
 80485fb:	a3 a4 7e 06 08       	mov    %eax,0x8067ea4
 8048600:	5d                   	pop    %ebp
 8048601:	c3                   	ret    
 8048602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048610 <set_fps>:
 8048610:	55                   	push   %ebp
 8048611:	89 e5                	mov    %esp,%ebp
 8048613:	8b 45 08             	mov    0x8(%ebp),%eax
 8048616:	5d                   	pop    %ebp
 8048617:	a3 a8 7e 06 08       	mov    %eax,0x8067ea8
 804861c:	c3                   	ret    
 804861d:	8d 76 00             	lea    0x0(%esi),%esi

08048620 <get_fps>:
 8048620:	55                   	push   %ebp
 8048621:	a1 a8 7e 06 08       	mov    0x8067ea8,%eax
 8048626:	89 e5                	mov    %esp,%ebp
 8048628:	5d                   	pop    %ebp
 8048629:	c3                   	ret    
 804862a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048630 <main_loop>:
 8048630:	55                   	push   %ebp
 8048631:	89 e5                	mov    %esp,%ebp
 8048633:	57                   	push   %edi
 8048634:	56                   	push   %esi
 8048635:	53                   	push   %ebx
 8048636:	31 ff                	xor    %edi,%edi
 8048638:	31 db                	xor    %ebx,%ebx
 804863a:	83 ec 1c             	sub    $0x1c,%esp
 804863d:	8d 76 00             	lea    0x0(%esi),%esi
 8048640:	f4                   	hlt    
 8048641:	fa                   	cli    
 8048642:	a1 a4 7e 06 08       	mov    0x8067ea4,%eax
 8048647:	39 c3                	cmp    %eax,%ebx
 8048649:	0f 84 d1 00 00 00    	je     8048720 <main_loop+0xf0>
 804864f:	a1 a4 7e 06 08       	mov    0x8067ea4,%eax
 8048654:	39 c3                	cmp    %eax,%ebx
 8048656:	0f 8d d4 00 00 00    	jge    8048730 <main_loop+0x100>
 804865c:	8b 35 a4 7e 06 08    	mov    0x8067ea4,%esi
 8048662:	fb                   	sti    
 8048663:	90                   	nop
 8048664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048668:	e8 c3 04 00 00       	call   8048b30 <update_keypress>
 804866d:	84 c0                	test   %al,%al
 804866f:	75 f7                	jne    8048668 <main_loop+0x38>
 8048671:	39 f3                	cmp    %esi,%ebx
 8048673:	7d cb                	jge    8048640 <main_loop+0x10>
 8048675:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 8048679:	eb 59                	jmp    80486d4 <main_loop+0xa4>
 804867b:	90                   	nop
 804867c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048680:	e8 0b 04 00 00       	call   8048a90 <update_letter_pos>
 8048685:	b8 56 55 55 55       	mov    $0x55555556,%eax
 804868a:	f7 eb                	imul   %ebx
 804868c:	89 d8                	mov    %ebx,%eax
 804868e:	c1 f8 1f             	sar    $0x1f,%eax
 8048691:	29 c2                	sub    %eax,%edx
 8048693:	8d 04 52             	lea    (%edx,%edx,2),%eax
 8048696:	39 c3                	cmp    %eax,%ebx
 8048698:	75 04                	jne    804869e <main_loop+0x6e>
 804869a:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
 804869e:	89 d8                	mov    %ebx,%eax
 80486a0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 80486a5:	f7 ea                	imul   %edx
 80486a7:	89 d8                	mov    %ebx,%eax
 80486a9:	c1 f8 1f             	sar    $0x1f,%eax
 80486ac:	c1 fa 04             	sar    $0x4,%edx
 80486af:	29 c2                	sub    %eax,%edx
 80486b1:	6b d2 32             	imul   $0x32,%edx,%edx
 80486b4:	39 d3                	cmp    %edx,%ebx
 80486b6:	75 15                	jne    80486cd <main_loop+0x9d>
 80486b8:	8d 44 3f 01          	lea    0x1(%edi,%edi,1),%eax
 80486bc:	83 f8 1e             	cmp    $0x1e,%eax
 80486bf:	7e 05                	jle    80486c6 <main_loop+0x96>
 80486c1:	b8 1e 00 00 00       	mov    $0x1e,%eax
 80486c6:	a3 a8 7e 06 08       	mov    %eax,0x8067ea8
 80486cb:	31 ff                	xor    %edi,%edi
 80486cd:	83 c3 01             	add    $0x1,%ebx
 80486d0:	39 f3                	cmp    %esi,%ebx
 80486d2:	74 2c                	je     8048700 <main_loop+0xd0>
 80486d4:	b8 e1 83 0f 3e       	mov    $0x3e0f83e1,%eax
 80486d9:	f7 eb                	imul   %ebx
 80486db:	89 d8                	mov    %ebx,%eax
 80486dd:	c1 f8 1f             	sar    $0x1f,%eax
 80486e0:	c1 fa 03             	sar    $0x3,%edx
 80486e3:	29 c2                	sub    %eax,%edx
 80486e5:	89 d0                	mov    %edx,%eax
 80486e7:	c1 e0 05             	shl    $0x5,%eax
 80486ea:	01 c2                	add    %eax,%edx
 80486ec:	39 d3                	cmp    %edx,%ebx
 80486ee:	75 90                	jne    8048680 <main_loop+0x50>
 80486f0:	e8 8b 02 00 00       	call   8048980 <create_new_letter>
 80486f5:	eb 89                	jmp    8048680 <main_loop+0x50>
 80486f7:	89 f6                	mov    %esi,%esi
 80486f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048700:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 8048704:	0f 84 36 ff ff ff    	je     8048640 <main_loop+0x10>
 804870a:	83 c7 01             	add    $0x1,%edi
 804870d:	e8 6e fd ff ff       	call   8048480 <redraw_screen>
 8048712:	e9 29 ff ff ff       	jmp    8048640 <main_loop+0x10>
 8048717:	89 f6                	mov    %esi,%esi
 8048719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048720:	fb                   	sti    
 8048721:	e9 1a ff ff ff       	jmp    8048640 <main_loop+0x10>
 8048726:	8d 76 00             	lea    0x0(%esi),%esi
 8048729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048730:	fa                   	cli    
 8048731:	83 ec 0c             	sub    $0xc,%esp
 8048734:	68 13 44 05 08       	push   $0x8054413
 8048739:	68 35 44 05 08       	push   $0x8054435
 804873e:	6a 31                	push   $0x31
 8048740:	68 1e 44 05 08       	push   $0x805441e
 8048745:	68 28 43 05 08       	push   $0x8054328
 804874a:	e8 a1 08 00 00       	call   8048ff0 <printf>
 804874f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048754:	d6                   	(bad)  
 8048755:	83 c4 20             	add    $0x20,%esp
 8048758:	e9 ff fe ff ff       	jmp    804865c <main_loop+0x2c>
 804875d:	66 90                	xchg   %ax,%ax
 804875f:	90                   	nop

08048760 <fly_new>:
 8048760:	55                   	push   %ebp
 8048761:	89 e5                	mov    %esp,%ebp
 8048763:	53                   	push   %ebx
 8048764:	83 ec 04             	sub    $0x4,%esp
 8048767:	8b 1d cc 7e 06 08    	mov    0x8067ecc,%ebx
 804876d:	85 db                	test   %ebx,%ebx
 804876f:	74 27                	je     8048798 <fly_new+0x38>
 8048771:	8b 43 14             	mov    0x14(%ebx),%eax
 8048774:	85 c0                	test   %eax,%eax
 8048776:	74 41                	je     80487b9 <fly_new+0x59>
 8048778:	a3 cc 7e 06 08       	mov    %eax,0x8067ecc
 804877d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 8048784:	89 d8                	mov    %ebx,%eax
 8048786:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804878d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048790:	c9                   	leave  
 8048791:	c3                   	ret    
 8048792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048798:	b8 18 7f 06 08       	mov    $0x8067f18,%eax
 804879d:	8d 76 00             	lea    0x0(%esi),%esi
 80487a0:	89 40 fc             	mov    %eax,-0x4(%eax)
 80487a3:	83 c0 18             	add    $0x18,%eax
 80487a6:	3d d8 dc 06 08       	cmp    $0x806dcd8,%eax
 80487ab:	75 f3                	jne    80487a0 <fly_new+0x40>
 80487ad:	bb 00 7f 06 08       	mov    $0x8067f00,%ebx
 80487b2:	8b 43 14             	mov    0x14(%ebx),%eax
 80487b5:	85 c0                	test   %eax,%eax
 80487b7:	75 bf                	jne    8048778 <fly_new+0x18>
 80487b9:	fa                   	cli    
 80487ba:	83 ec 0c             	sub    $0xc,%esp
 80487bd:	68 3f 44 05 08       	push   $0x805443f
 80487c2:	68 e9 44 05 08       	push   $0x80544e9
 80487c7:	6a 0b                	push   $0xb
 80487c9:	68 58 44 05 08       	push   $0x8054458
 80487ce:	68 28 43 05 08       	push   $0x8054328
 80487d3:	e8 18 08 00 00       	call   8048ff0 <printf>
 80487d8:	b8 01 00 00 00       	mov    $0x1,%eax
 80487dd:	d6                   	(bad)  
 80487de:	8b 43 14             	mov    0x14(%ebx),%eax
 80487e1:	83 c4 20             	add    $0x20,%esp
 80487e4:	eb 92                	jmp    8048778 <fly_new+0x18>
 80487e6:	8d 76 00             	lea    0x0(%esi),%esi
 80487e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080487f0 <fly_prev>:
 80487f0:	55                   	push   %ebp
 80487f1:	89 e5                	mov    %esp,%ebp
 80487f3:	53                   	push   %ebx
 80487f4:	83 ec 04             	sub    $0x4,%esp
 80487f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80487fa:	85 db                	test   %ebx,%ebx
 80487fc:	74 12                	je     8048810 <fly_prev+0x20>
 80487fe:	8b 43 10             	mov    0x10(%ebx),%eax
 8048801:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048804:	c9                   	leave  
 8048805:	c3                   	ret    
 8048806:	8d 76 00             	lea    0x0(%esi),%esi
 8048809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048810:	fa                   	cli    
 8048811:	83 ec 0c             	sub    $0xc,%esp
 8048814:	68 71 44 05 08       	push   $0x8054471
 8048819:	68 e0 44 05 08       	push   $0x80544e0
 804881e:	6a 0b                	push   $0xb
 8048820:	68 58 44 05 08       	push   $0x8054458
 8048825:	68 28 43 05 08       	push   $0x8054328
 804882a:	e8 c1 07 00 00       	call   8048ff0 <printf>
 804882f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048834:	d6                   	(bad)  
 8048835:	8b 43 10             	mov    0x10(%ebx),%eax
 8048838:	83 c4 20             	add    $0x20,%esp
 804883b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804883e:	c9                   	leave  
 804883f:	c3                   	ret    

08048840 <fly_next>:
 8048840:	55                   	push   %ebp
 8048841:	89 e5                	mov    %esp,%ebp
 8048843:	53                   	push   %ebx
 8048844:	83 ec 04             	sub    $0x4,%esp
 8048847:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804884a:	85 db                	test   %ebx,%ebx
 804884c:	74 12                	je     8048860 <fly_next+0x20>
 804884e:	8b 43 14             	mov    0x14(%ebx),%eax
 8048851:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048854:	c9                   	leave  
 8048855:	c3                   	ret    
 8048856:	8d 76 00             	lea    0x0(%esi),%esi
 8048859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048860:	fa                   	cli    
 8048861:	83 ec 0c             	sub    $0xc,%esp
 8048864:	68 71 44 05 08       	push   $0x8054471
 8048869:	68 d7 44 05 08       	push   $0x80544d7
 804886e:	6a 0b                	push   $0xb
 8048870:	68 58 44 05 08       	push   $0x8054458
 8048875:	68 28 43 05 08       	push   $0x8054328
 804887a:	e8 71 07 00 00       	call   8048ff0 <printf>
 804887f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048884:	d6                   	(bad)  
 8048885:	8b 43 14             	mov    0x14(%ebx),%eax
 8048888:	83 c4 20             	add    $0x20,%esp
 804888b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804888e:	c9                   	leave  
 804888f:	c3                   	ret    

08048890 <fly_insert>:
 8048890:	55                   	push   %ebp
 8048891:	89 e5                	mov    %esp,%ebp
 8048893:	53                   	push   %ebx
 8048894:	83 ec 04             	sub    $0x4,%esp
 8048897:	8b 45 08             	mov    0x8(%ebp),%eax
 804889a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804889d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80488a0:	85 c0                	test   %eax,%eax
 80488a2:	75 04                	jne    80488a8 <fly_insert+0x18>
 80488a4:	85 d2                	test   %edx,%edx
 80488a6:	74 20                	je     80488c8 <fly_insert+0x38>
 80488a8:	85 c0                	test   %eax,%eax
 80488aa:	89 43 10             	mov    %eax,0x10(%ebx)
 80488ad:	89 53 14             	mov    %edx,0x14(%ebx)
 80488b0:	74 03                	je     80488b5 <fly_insert+0x25>
 80488b2:	89 58 14             	mov    %ebx,0x14(%eax)
 80488b5:	85 d2                	test   %edx,%edx
 80488b7:	74 03                	je     80488bc <fly_insert+0x2c>
 80488b9:	89 5a 10             	mov    %ebx,0x10(%edx)
 80488bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80488bf:	c9                   	leave  
 80488c0:	c3                   	ret    
 80488c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80488c8:	fa                   	cli    
 80488c9:	83 ec 0c             	sub    $0xc,%esp
 80488cc:	68 7e 44 05 08       	push   $0x805447e
 80488d1:	68 cc 44 05 08       	push   $0x80544cc
 80488d6:	6a 0b                	push   $0xb
 80488d8:	68 58 44 05 08       	push   $0x8054458
 80488dd:	68 28 43 05 08       	push   $0x8054328
 80488e2:	e8 09 07 00 00       	call   8048ff0 <printf>
 80488e7:	b8 01 00 00 00       	mov    $0x1,%eax
 80488ec:	d6                   	(bad)  
 80488ed:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 80488f4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 80488fb:	83 c4 20             	add    $0x20,%esp
 80488fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048901:	c9                   	leave  
 8048902:	c3                   	ret    
 8048903:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048910 <fly_remove>:
 8048910:	55                   	push   %ebp
 8048911:	89 e5                	mov    %esp,%ebp
 8048913:	8b 45 08             	mov    0x8(%ebp),%eax
 8048916:	8b 50 10             	mov    0x10(%eax),%edx
 8048919:	8b 40 14             	mov    0x14(%eax),%eax
 804891c:	85 d2                	test   %edx,%edx
 804891e:	74 03                	je     8048923 <fly_remove+0x13>
 8048920:	89 42 14             	mov    %eax,0x14(%edx)
 8048923:	85 c0                	test   %eax,%eax
 8048925:	74 03                	je     804892a <fly_remove+0x1a>
 8048927:	89 50 10             	mov    %edx,0x10(%eax)
 804892a:	5d                   	pop    %ebp
 804892b:	c3                   	ret    
 804892c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048930 <fly_free>:
 8048930:	55                   	push   %ebp
 8048931:	8b 15 cc 7e 06 08    	mov    0x8067ecc,%edx
 8048937:	89 e5                	mov    %esp,%ebp
 8048939:	8b 45 08             	mov    0x8(%ebp),%eax
 804893c:	89 50 14             	mov    %edx,0x14(%eax)
 804893f:	a3 cc 7e 06 08       	mov    %eax,0x8067ecc
 8048944:	5d                   	pop    %ebp
 8048945:	c3                   	ret    
 8048946:	8d 76 00             	lea    0x0(%esi),%esi
 8048949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048950 <get_hit>:
 8048950:	55                   	push   %ebp
 8048951:	a1 c4 7e 06 08       	mov    0x8067ec4,%eax
 8048956:	89 e5                	mov    %esp,%ebp
 8048958:	5d                   	pop    %ebp
 8048959:	c3                   	ret    
 804895a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048960 <get_miss>:
 8048960:	55                   	push   %ebp
 8048961:	a1 c0 7e 06 08       	mov    0x8067ec0,%eax
 8048966:	89 e5                	mov    %esp,%ebp
 8048968:	5d                   	pop    %ebp
 8048969:	c3                   	ret    
 804896a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048970 <characters>:
 8048970:	55                   	push   %ebp
 8048971:	a1 c8 7e 06 08       	mov    0x8067ec8,%eax
 8048976:	89 e5                	mov    %esp,%ebp
 8048978:	5d                   	pop    %ebp
 8048979:	c3                   	ret    
 804897a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048980 <create_new_letter>:
 8048980:	8b 15 c8 7e 06 08    	mov    0x8067ec8,%edx
 8048986:	55                   	push   %ebp
 8048987:	89 e5                	mov    %esp,%ebp
 8048989:	56                   	push   %esi
 804898a:	53                   	push   %ebx
 804898b:	85 d2                	test   %edx,%edx
 804898d:	0f 84 dd 00 00 00    	je     8048a70 <create_new_letter+0xf0>
 8048993:	e8 c8 fd ff ff       	call   8048760 <fly_new>
 8048998:	83 ec 04             	sub    $0x4,%esp
 804899b:	89 c3                	mov    %eax,%ebx
 804899d:	50                   	push   %eax
 804899e:	ff 35 c8 7e 06 08    	pushl  0x8067ec8
 80489a4:	6a 00                	push   $0x0
 80489a6:	e8 e5 fe ff ff       	call   8048890 <fly_insert>
 80489ab:	89 1d c8 7e 06 08    	mov    %ebx,0x8067ec8
 80489b1:	83 c4 10             	add    $0x10,%esp
 80489b4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 80489ba:	e8 81 06 00 00       	call   8049040 <rand>
 80489bf:	ba f3 1a ca 6b       	mov    $0x6bca1af3,%edx
 80489c4:	89 c1                	mov    %eax,%ecx
 80489c6:	f7 ea                	imul   %edx
 80489c8:	89 c8                	mov    %ecx,%eax
 80489ca:	c1 f8 1f             	sar    $0x1f,%eax
 80489cd:	c1 fa 04             	sar    $0x4,%edx
 80489d0:	29 c2                	sub    %eax,%edx
 80489d2:	6b d2 26             	imul   $0x26,%edx,%edx
 80489d5:	29 d1                	sub    %edx,%ecx
 80489d7:	8d 04 cd 08 00 00 00 	lea    0x8(,%ecx,8),%eax
 80489de:	89 43 04             	mov    %eax,0x4(%ebx)
 80489e1:	8b 1d c8 7e 06 08    	mov    0x8067ec8,%ebx
 80489e7:	e8 54 06 00 00       	call   8049040 <rand>
 80489ec:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 80489f1:	89 c1                	mov    %eax,%ecx
 80489f3:	83 ec 08             	sub    $0x8,%esp
 80489f6:	f7 ea                	imul   %edx
 80489f8:	89 c8                	mov    %ecx,%eax
 80489fa:	68 00 00 d0 07       	push   $0x7d00000
 80489ff:	c1 f8 1f             	sar    $0x1f,%eax
 8048a02:	c1 fa 06             	sar    $0x6,%edx
 8048a05:	29 c2                	sub    %eax,%edx
 8048a07:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
 8048a0d:	29 d1                	sub    %edx,%ecx
 8048a0f:	c1 e1 10             	shl    $0x10,%ecx
 8048a12:	51                   	push   %ecx
 8048a13:	e8 45 03 00 00       	call   8048d5d <F_div_F>
 8048a18:	89 c6                	mov    %eax,%esi
 8048a1a:	c7 04 24 00 00 00 3f 	movl   $0x3f000000,(%esp)
 8048a21:	e8 4b 03 00 00       	call   8048d71 <f2F>
 8048a26:	01 f0                	add    %esi,%eax
 8048a28:	89 43 0c             	mov    %eax,0xc(%ebx)
 8048a2b:	8b 1d c8 7e 06 08    	mov    0x8067ec8,%ebx
 8048a31:	e8 0a 06 00 00       	call   8049040 <rand>
 8048a36:	ba 4f ec c4 4e       	mov    $0x4ec4ec4f,%edx
 8048a3b:	89 c1                	mov    %eax,%ecx
 8048a3d:	f7 ea                	imul   %edx
 8048a3f:	89 c8                	mov    %ecx,%eax
 8048a41:	c1 f8 1f             	sar    $0x1f,%eax
 8048a44:	c1 fa 03             	sar    $0x3,%edx
 8048a47:	29 c2                	sub    %eax,%edx
 8048a49:	6b d2 1a             	imul   $0x1a,%edx,%edx
 8048a4c:	29 d1                	sub    %edx,%ecx
 8048a4e:	89 4b 08             	mov    %ecx,0x8(%ebx)
 8048a51:	58                   	pop    %eax
 8048a52:	a1 c8 7e 06 08       	mov    0x8067ec8,%eax
 8048a57:	ff 70 08             	pushl  0x8(%eax)
 8048a5a:	e8 e1 01 00 00       	call   8048c40 <release_key>
 8048a5f:	83 c4 10             	add    $0x10,%esp
 8048a62:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048a65:	5b                   	pop    %ebx
 8048a66:	5e                   	pop    %esi
 8048a67:	5d                   	pop    %ebp
 8048a68:	c3                   	ret    
 8048a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048a70:	e8 eb fc ff ff       	call   8048760 <fly_new>
 8048a75:	89 c3                	mov    %eax,%ebx
 8048a77:	a3 c8 7e 06 08       	mov    %eax,0x8067ec8
 8048a7c:	e9 33 ff ff ff       	jmp    80489b4 <create_new_letter+0x34>
 8048a81:	eb 0d                	jmp    8048a90 <update_letter_pos>
 8048a83:	90                   	nop
 8048a84:	90                   	nop
 8048a85:	90                   	nop
 8048a86:	90                   	nop
 8048a87:	90                   	nop
 8048a88:	90                   	nop
 8048a89:	90                   	nop
 8048a8a:	90                   	nop
 8048a8b:	90                   	nop
 8048a8c:	90                   	nop
 8048a8d:	90                   	nop
 8048a8e:	90                   	nop
 8048a8f:	90                   	nop

08048a90 <update_letter_pos>:
 8048a90:	55                   	push   %ebp
 8048a91:	89 e5                	mov    %esp,%ebp
 8048a93:	57                   	push   %edi
 8048a94:	56                   	push   %esi
 8048a95:	53                   	push   %ebx
 8048a96:	83 ec 0c             	sub    $0xc,%esp
 8048a99:	8b 1d c8 7e 06 08    	mov    0x8067ec8,%ebx
 8048a9f:	85 db                	test   %ebx,%ebx
 8048aa1:	75 54                	jne    8048af7 <update_letter_pos+0x67>
 8048aa3:	eb 7b                	jmp    8048b20 <update_letter_pos+0x90>
 8048aa5:	8d 76 00             	lea    0x0(%esi),%esi
 8048aa8:	83 ec 0c             	sub    $0xc,%esp
 8048aab:	68 cd cc fc 40       	push   $0x40fccccd
 8048ab0:	e8 bc 02 00 00       	call   8048d71 <f2F>
 8048ab5:	01 c6                	add    %eax,%esi
 8048ab7:	83 c4 10             	add    $0x10,%esp
 8048aba:	81 fe 00 00 c8 00    	cmp    $0xc80000,%esi
 8048ac0:	7e 2f                	jle    8048af1 <update_letter_pos+0x61>
 8048ac2:	8b 03                	mov    (%ebx),%eax
 8048ac4:	85 c0                	test   %eax,%eax
 8048ac6:	78 3d                	js     8048b05 <update_letter_pos+0x75>
 8048ac8:	83 05 c0 7e 06 08 01 	addl   $0x1,0x8067ec0
 8048acf:	83 ec 0c             	sub    $0xc,%esp
 8048ad2:	53                   	push   %ebx
 8048ad3:	e8 38 fe ff ff       	call   8048910 <fly_remove>
 8048ad8:	83 c4 10             	add    $0x10,%esp
 8048adb:	3b 1d c8 7e 06 08    	cmp    0x8067ec8,%ebx
 8048ae1:	a1 cc 7e 06 08       	mov    0x8067ecc,%eax
 8048ae6:	89 1d cc 7e 06 08    	mov    %ebx,0x8067ecc
 8048aec:	89 43 14             	mov    %eax,0x14(%ebx)
 8048aef:	74 1f                	je     8048b10 <update_letter_pos+0x80>
 8048af1:	85 ff                	test   %edi,%edi
 8048af3:	89 fb                	mov    %edi,%ebx
 8048af5:	74 29                	je     8048b20 <update_letter_pos+0x90>
 8048af7:	8b 73 0c             	mov    0xc(%ebx),%esi
 8048afa:	03 33                	add    (%ebx),%esi
 8048afc:	8b 7b 14             	mov    0x14(%ebx),%edi
 8048aff:	85 f6                	test   %esi,%esi
 8048b01:	89 33                	mov    %esi,(%ebx)
 8048b03:	79 a3                	jns    8048aa8 <update_letter_pos+0x18>
 8048b05:	83 05 c4 7e 06 08 01 	addl   $0x1,0x8067ec4
 8048b0c:	eb c1                	jmp    8048acf <update_letter_pos+0x3f>
 8048b0e:	66 90                	xchg   %ax,%ax
 8048b10:	85 ff                	test   %edi,%edi
 8048b12:	89 3d c8 7e 06 08    	mov    %edi,0x8067ec8
 8048b18:	89 fb                	mov    %edi,%ebx
 8048b1a:	75 db                	jne    8048af7 <update_letter_pos+0x67>
 8048b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048b20:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048b23:	5b                   	pop    %ebx
 8048b24:	5e                   	pop    %esi
 8048b25:	5f                   	pop    %edi
 8048b26:	5d                   	pop    %ebp
 8048b27:	c3                   	ret    
 8048b28:	90                   	nop
 8048b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08048b30 <update_keypress>:
 8048b30:	55                   	push   %ebp
 8048b31:	89 e5                	mov    %esp,%ebp
 8048b33:	57                   	push   %edi
 8048b34:	56                   	push   %esi
 8048b35:	53                   	push   %ebx
 8048b36:	83 ec 0c             	sub    $0xc,%esp
 8048b39:	fa                   	cli    
 8048b3a:	8b 3d c8 7e 06 08    	mov    0x8067ec8,%edi
 8048b40:	85 ff                	test   %edi,%edi
 8048b42:	0f 84 a8 00 00 00    	je     8048bf0 <update_keypress+0xc0>
 8048b48:	bb 00 00 9c ff       	mov    $0xff9c0000,%ebx
 8048b4d:	31 f6                	xor    %esi,%esi
 8048b4f:	eb 19                	jmp    8048b6a <update_keypress+0x3a>
 8048b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048b58:	8b 47 0c             	mov    0xc(%edi),%eax
 8048b5b:	85 c0                	test   %eax,%eax
 8048b5d:	7e 04                	jle    8048b63 <update_keypress+0x33>
 8048b5f:	39 1f                	cmp    %ebx,(%edi)
 8048b61:	7f 3d                	jg     8048ba0 <update_keypress+0x70>
 8048b63:	8b 7f 14             	mov    0x14(%edi),%edi
 8048b66:	85 ff                	test   %edi,%edi
 8048b68:	74 56                	je     8048bc0 <update_keypress+0x90>
 8048b6a:	83 7f 08 19          	cmpl   $0x19,0x8(%edi)
 8048b6e:	76 e8                	jbe    8048b58 <update_keypress+0x28>
 8048b70:	fa                   	cli    
 8048b71:	83 ec 0c             	sub    $0xc,%esp
 8048b74:	68 9c 44 05 08       	push   $0x805449c
 8048b79:	68 bc 44 05 08       	push   $0x80544bc
 8048b7e:	6a 4c                	push   $0x4c
 8048b80:	68 58 44 05 08       	push   $0x8054458
 8048b85:	68 28 43 05 08       	push   $0x8054328
 8048b8a:	e8 61 04 00 00       	call   8048ff0 <printf>
 8048b8f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048b94:	d6                   	(bad)  
 8048b95:	83 c4 20             	add    $0x20,%esp
 8048b98:	eb be                	jmp    8048b58 <update_keypress+0x28>
 8048b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048ba0:	83 ec 0c             	sub    $0xc,%esp
 8048ba3:	ff 77 08             	pushl  0x8(%edi)
 8048ba6:	e8 e5 00 00 00       	call   8048c90 <query_key>
 8048bab:	83 c4 10             	add    $0x10,%esp
 8048bae:	84 c0                	test   %al,%al
 8048bb0:	74 b1                	je     8048b63 <update_keypress+0x33>
 8048bb2:	8b 1f                	mov    (%edi),%ebx
 8048bb4:	89 fe                	mov    %edi,%esi
 8048bb6:	8b 7f 14             	mov    0x14(%edi),%edi
 8048bb9:	85 ff                	test   %edi,%edi
 8048bbb:	75 ad                	jne    8048b6a <update_keypress+0x3a>
 8048bbd:	8d 76 00             	lea    0x0(%esi),%esi
 8048bc0:	85 f6                	test   %esi,%esi
 8048bc2:	74 2c                	je     8048bf0 <update_keypress+0xc0>
 8048bc4:	83 ec 0c             	sub    $0xc,%esp
 8048bc7:	ff 76 08             	pushl  0x8(%esi)
 8048bca:	e8 71 00 00 00       	call   8048c40 <release_key>
 8048bcf:	c7 46 0c 00 00 fd ff 	movl   $0xfffd0000,0xc(%esi)
 8048bd6:	83 c4 10             	add    $0x10,%esp
 8048bd9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048bdc:	b8 01 00 00 00       	mov    $0x1,%eax
 8048be1:	5b                   	pop    %ebx
 8048be2:	5e                   	pop    %esi
 8048be3:	5f                   	pop    %edi
 8048be4:	5d                   	pop    %ebp
 8048be5:	c3                   	ret    
 8048be6:	8d 76 00             	lea    0x0(%esi),%esi
 8048be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048bf0:	fb                   	sti    
 8048bf1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048bf4:	31 c0                	xor    %eax,%eax
 8048bf6:	5b                   	pop    %ebx
 8048bf7:	5e                   	pop    %esi
 8048bf8:	5f                   	pop    %edi
 8048bf9:	5d                   	pop    %ebp
 8048bfa:	c3                   	ret    
 8048bfb:	66 90                	xchg   %ax,%ax
 8048bfd:	66 90                	xchg   %ax,%ax
 8048bff:	90                   	nop

08048c00 <press_key>:
 8048c00:	55                   	push   %ebp
 8048c01:	31 c0                	xor    %eax,%eax
 8048c03:	89 e5                	mov    %esp,%ebp
 8048c05:	8b 55 08             	mov    0x8(%ebp),%edx
 8048c08:	eb 0e                	jmp    8048c18 <press_key+0x18>
 8048c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048c10:	83 c0 01             	add    $0x1,%eax
 8048c13:	83 f8 1a             	cmp    $0x1a,%eax
 8048c16:	74 18                	je     8048c30 <press_key+0x30>
 8048c18:	39 14 85 80 45 05 08 	cmp    %edx,0x8054580(,%eax,4)
 8048c1f:	75 ef                	jne    8048c10 <press_key+0x10>
 8048c21:	c6 80 dc dc 06 08 01 	movb   $0x1,0x806dcdc(%eax)
 8048c28:	83 c0 01             	add    $0x1,%eax
 8048c2b:	83 f8 1a             	cmp    $0x1a,%eax
 8048c2e:	75 e8                	jne    8048c18 <press_key+0x18>
 8048c30:	5d                   	pop    %ebp
 8048c31:	c3                   	ret    
 8048c32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048c40 <release_key>:
 8048c40:	55                   	push   %ebp
 8048c41:	89 e5                	mov    %esp,%ebp
 8048c43:	53                   	push   %ebx
 8048c44:	83 ec 04             	sub    $0x4,%esp
 8048c47:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048c4a:	83 fb 19             	cmp    $0x19,%ebx
 8048c4d:	76 28                	jbe    8048c77 <release_key+0x37>
 8048c4f:	fa                   	cli    
 8048c50:	83 ec 0c             	sub    $0xc,%esp
 8048c53:	68 f1 44 05 08       	push   $0x80544f1
 8048c58:	68 4a 45 05 08       	push   $0x805454a
 8048c5d:	6a 19                	push   $0x19
 8048c5f:	68 0a 45 05 08       	push   $0x805450a
 8048c64:	68 28 43 05 08       	push   $0x8054328
 8048c69:	e8 82 03 00 00       	call   8048ff0 <printf>
 8048c6e:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c73:	d6                   	(bad)  
 8048c74:	83 c4 20             	add    $0x20,%esp
 8048c77:	c6 83 dc dc 06 08 00 	movb   $0x0,0x806dcdc(%ebx)
 8048c7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048c81:	c9                   	leave  
 8048c82:	c3                   	ret    
 8048c83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048c90 <query_key>:
 8048c90:	55                   	push   %ebp
 8048c91:	89 e5                	mov    %esp,%ebp
 8048c93:	53                   	push   %ebx
 8048c94:	83 ec 04             	sub    $0x4,%esp
 8048c97:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048c9a:	83 fb 19             	cmp    $0x19,%ebx
 8048c9d:	76 28                	jbe    8048cc7 <query_key+0x37>
 8048c9f:	fa                   	cli    
 8048ca0:	83 ec 0c             	sub    $0xc,%esp
 8048ca3:	68 f1 44 05 08       	push   $0x80544f1
 8048ca8:	68 40 45 05 08       	push   $0x8054540
 8048cad:	6a 1f                	push   $0x1f
 8048caf:	68 0a 45 05 08       	push   $0x805450a
 8048cb4:	68 28 43 05 08       	push   $0x8054328
 8048cb9:	e8 32 03 00 00       	call   8048ff0 <printf>
 8048cbe:	b8 01 00 00 00       	mov    $0x1,%eax
 8048cc3:	d6                   	(bad)  
 8048cc4:	83 c4 20             	add    $0x20,%esp
 8048cc7:	0f b6 83 dc dc 06 08 	movzbl 0x806dcdc(%ebx),%eax
 8048cce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048cd1:	c9                   	leave  
 8048cd2:	c3                   	ret    
 8048cd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048ce0 <last_key_code>:
 8048ce0:	55                   	push   %ebp
 8048ce1:	a1 d8 dc 06 08       	mov    0x806dcd8,%eax
 8048ce6:	89 e5                	mov    %esp,%ebp
 8048ce8:	5d                   	pop    %ebp
 8048ce9:	c3                   	ret    
 8048cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048cf0 <keyboard_event>:
 8048cf0:	55                   	push   %ebp
 8048cf1:	ba 60 00 00 00       	mov    $0x60,%edx
 8048cf6:	89 e5                	mov    %esp,%ebp
 8048cf8:	ec                   	in     (%dx),%al
 8048cf9:	0f b6 c0             	movzbl %al,%eax
 8048cfc:	a3 d8 dc 06 08       	mov    %eax,0x806dcd8
 8048d01:	31 c0                	xor    %eax,%eax
 8048d03:	8b 15 d8 dc 06 08    	mov    0x806dcd8,%edx
 8048d09:	eb 0d                	jmp    8048d18 <keyboard_event+0x28>
 8048d0b:	90                   	nop
 8048d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048d10:	83 c0 01             	add    $0x1,%eax
 8048d13:	83 f8 1a             	cmp    $0x1a,%eax
 8048d16:	74 18                	je     8048d30 <keyboard_event+0x40>
 8048d18:	3b 14 85 80 45 05 08 	cmp    0x8054580(,%eax,4),%edx
 8048d1f:	75 ef                	jne    8048d10 <keyboard_event+0x20>
 8048d21:	c6 80 dc dc 06 08 01 	movb   $0x1,0x806dcdc(%eax)
 8048d28:	83 c0 01             	add    $0x1,%eax
 8048d2b:	83 f8 1a             	cmp    $0x1a,%eax
 8048d2e:	75 e8                	jne    8048d18 <keyboard_event+0x28>
 8048d30:	5d                   	pop    %ebp
 8048d31:	c3                   	ret    

08048d32 <int2F>:
 8048d32:	55                   	push   %ebp
 8048d33:	89 e5                	mov    %esp,%ebp
 8048d35:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d38:	c1 e0 10             	shl    $0x10,%eax
 8048d3b:	5d                   	pop    %ebp
 8048d3c:	c3                   	ret    

08048d3d <F_div_int>:
 8048d3d:	55                   	push   %ebp
 8048d3e:	89 e5                	mov    %esp,%ebp
 8048d40:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d43:	99                   	cltd   
 8048d44:	f7 7d 0c             	idivl  0xc(%ebp)
 8048d47:	5d                   	pop    %ebp
 8048d48:	c3                   	ret    

08048d49 <F_mul_F>:
 8048d49:	55                   	push   %ebp
 8048d4a:	89 e5                	mov    %esp,%ebp
 8048d4c:	c1 7d 08 08          	sarl   $0x8,0x8(%ebp)
 8048d50:	c1 7d 0c 08          	sarl   $0x8,0xc(%ebp)
 8048d54:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d57:	0f af 45 0c          	imul   0xc(%ebp),%eax
 8048d5b:	5d                   	pop    %ebp
 8048d5c:	c3                   	ret    

08048d5d <F_div_F>:
 8048d5d:	55                   	push   %ebp
 8048d5e:	89 e5                	mov    %esp,%ebp
 8048d60:	c1 65 08 08          	shll   $0x8,0x8(%ebp)
 8048d64:	c1 7d 0c 08          	sarl   $0x8,0xc(%ebp)
 8048d68:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d6b:	99                   	cltd   
 8048d6c:	f7 7d 0c             	idivl  0xc(%ebp)
 8048d6f:	5d                   	pop    %ebp
 8048d70:	c3                   	ret    

08048d71 <f2F>:
 8048d71:	55                   	push   %ebp
 8048d72:	89 e5                	mov    %esp,%ebp
 8048d74:	83 ec 20             	sub    $0x20,%esp
 8048d77:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048d7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d80:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048d83:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d86:	c1 e8 1f             	shr    $0x1f,%eax
 8048d89:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d8c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d8f:	c1 e8 17             	shr    $0x17,%eax
 8048d92:	25 ff 00 00 00       	and    $0xff,%eax
 8048d97:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048d9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d9d:	25 ff ff 7f 00       	and    $0x7fffff,%eax
 8048da2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048da5:	81 7d f0 ff 00 00 00 	cmpl   $0xff,-0x10(%ebp)
 8048dac:	75 24                	jne    8048dd2 <f2F+0x61>
 8048dae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8048db2:	75 16                	jne    8048dca <f2F+0x59>
 8048db4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048db8:	74 08                	je     8048dc2 <f2F+0x51>
 8048dba:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dbf:	d6                   	(bad)  
 8048dc0:	eb 77                	jmp    8048e39 <f2F+0xc8>
 8048dc2:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dc7:	d6                   	(bad)  
 8048dc8:	eb 6f                	jmp    8048e39 <f2F+0xc8>
 8048dca:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dcf:	d6                   	(bad)  
 8048dd0:	eb 67                	jmp    8048e39 <f2F+0xc8>
 8048dd2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048dd6:	75 08                	jne    8048de0 <f2F+0x6f>
 8048dd8:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ddd:	d6                   	(bad)  
 8048dde:	eb 59                	jmp    8048e39 <f2F+0xc8>
 8048de0:	83 7d f0 6e          	cmpl   $0x6e,-0x10(%ebp)
 8048de4:	76 4d                	jbe    8048e33 <f2F+0xc2>
 8048de6:	81 7d f0 8d 00 00 00 	cmpl   $0x8d,-0x10(%ebp)
 8048ded:	77 44                	ja     8048e33 <f2F+0xc2>
 8048def:	81 4d ec 00 00 80 00 	orl    $0x800000,-0x14(%ebp)
 8048df6:	81 7d f0 86 00 00 00 	cmpl   $0x86,-0x10(%ebp)
 8048dfd:	76 18                	jbe    8048e17 <f2F+0xa6>
 8048dff:	81 6d f0 86 00 00 00 	subl   $0x86,-0x10(%ebp)
 8048e06:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e09:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e0c:	89 c1                	mov    %eax,%ecx
 8048e0e:	d3 e2                	shl    %cl,%edx
 8048e10:	89 d0                	mov    %edx,%eax
 8048e12:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e15:	eb 22                	jmp    8048e39 <f2F+0xc8>
 8048e17:	b8 86 00 00 00       	mov    $0x86,%eax
 8048e1c:	2b 45 f0             	sub    -0x10(%ebp),%eax
 8048e1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048e22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e25:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048e28:	89 c1                	mov    %eax,%ecx
 8048e2a:	d3 ea                	shr    %cl,%edx
 8048e2c:	89 d0                	mov    %edx,%eax
 8048e2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e31:	eb 06                	jmp    8048e39 <f2F+0xc8>
 8048e33:	b8 01 00 00 00       	mov    $0x1,%eax
 8048e38:	d6                   	(bad)  
 8048e39:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048e3d:	74 03                	je     8048e42 <f2F+0xd1>
 8048e3f:	f7 5d fc             	negl   -0x4(%ebp)
 8048e42:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e45:	c9                   	leave  
 8048e46:	c3                   	ret    

08048e47 <Fabs>:
 8048e47:	55                   	push   %ebp
 8048e48:	89 e5                	mov    %esp,%ebp
 8048e4a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048e4e:	79 03                	jns    8048e53 <Fabs+0xc>
 8048e50:	f7 5d 08             	negl   0x8(%ebp)
 8048e53:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e58:	5d                   	pop    %ebp
 8048e59:	c3                   	ret    

08048e5a <sqrt>:
 8048e5a:	55                   	push   %ebp
 8048e5b:	89 e5                	mov    %esp,%ebp
 8048e5d:	53                   	push   %ebx
 8048e5e:	83 ec 10             	sub    $0x10,%esp
 8048e61:	6a 02                	push   $0x2
 8048e63:	e8 ca fe ff ff       	call   8048d32 <int2F>
 8048e68:	83 c4 04             	add    $0x4,%esp
 8048e6b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e6e:	ff 75 f8             	pushl  -0x8(%ebp)
 8048e71:	ff 75 08             	pushl  0x8(%ebp)
 8048e74:	e8 e4 fe ff ff       	call   8048d5d <F_div_F>
 8048e79:	83 c4 08             	add    $0x8,%esp
 8048e7c:	2b 45 f8             	sub    -0x8(%ebp),%eax
 8048e7f:	6a 02                	push   $0x2
 8048e81:	50                   	push   %eax
 8048e82:	e8 b6 fe ff ff       	call   8048d3d <F_div_int>
 8048e87:	83 c4 08             	add    $0x8,%esp
 8048e8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e90:	01 45 f8             	add    %eax,-0x8(%ebp)
 8048e93:	ff 75 f4             	pushl  -0xc(%ebp)
 8048e96:	e8 ac ff ff ff       	call   8048e47 <Fabs>
 8048e9b:	83 c4 04             	add    $0x4,%esp
 8048e9e:	89 c3                	mov    %eax,%ebx
 8048ea0:	a1 e8 45 05 08       	mov    0x80545e8,%eax
 8048ea5:	50                   	push   %eax
 8048ea6:	e8 c6 fe ff ff       	call   8048d71 <f2F>
 8048eab:	83 c4 04             	add    $0x4,%esp
 8048eae:	39 c3                	cmp    %eax,%ebx
 8048eb0:	7f bc                	jg     8048e6e <sqrt+0x14>
 8048eb2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048eb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048eb8:	c9                   	leave  
 8048eb9:	c3                   	ret    

08048eba <pow>:
 8048eba:	55                   	push   %ebp
 8048ebb:	89 e5                	mov    %esp,%ebp
 8048ebd:	53                   	push   %ebx
 8048ebe:	83 ec 10             	sub    $0x10,%esp
 8048ec1:	6a 02                	push   $0x2
 8048ec3:	e8 6a fe ff ff       	call   8048d32 <int2F>
 8048ec8:	83 c4 04             	add    $0x4,%esp
 8048ecb:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048ece:	ff 75 f8             	pushl  -0x8(%ebp)
 8048ed1:	ff 75 f8             	pushl  -0x8(%ebp)
 8048ed4:	e8 70 fe ff ff       	call   8048d49 <F_mul_F>
 8048ed9:	83 c4 08             	add    $0x8,%esp
 8048edc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048edf:	ff 75 f4             	pushl  -0xc(%ebp)
 8048ee2:	ff 75 08             	pushl  0x8(%ebp)
 8048ee5:	e8 73 fe ff ff       	call   8048d5d <F_div_F>
 8048eea:	83 c4 08             	add    $0x8,%esp
 8048eed:	2b 45 f8             	sub    -0x8(%ebp),%eax
 8048ef0:	89 c1                	mov    %eax,%ecx
 8048ef2:	ba 56 55 55 55       	mov    $0x55555556,%edx
 8048ef7:	89 c8                	mov    %ecx,%eax
 8048ef9:	f7 ea                	imul   %edx
 8048efb:	89 c8                	mov    %ecx,%eax
 8048efd:	c1 f8 1f             	sar    $0x1f,%eax
 8048f00:	29 c2                	sub    %eax,%edx
 8048f02:	89 d0                	mov    %edx,%eax
 8048f04:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048f07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f0a:	01 45 f8             	add    %eax,-0x8(%ebp)
 8048f0d:	ff 75 f0             	pushl  -0x10(%ebp)
 8048f10:	e8 32 ff ff ff       	call   8048e47 <Fabs>
 8048f15:	83 c4 04             	add    $0x4,%esp
 8048f18:	89 c3                	mov    %eax,%ebx
 8048f1a:	a1 e8 45 05 08       	mov    0x80545e8,%eax
 8048f1f:	50                   	push   %eax
 8048f20:	e8 4c fe ff ff       	call   8048d71 <f2F>
 8048f25:	83 c4 04             	add    $0x4,%esp
 8048f28:	39 c3                	cmp    %eax,%ebx
 8048f2a:	7f a2                	jg     8048ece <pow+0x14>
 8048f2c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048f32:	c9                   	leave  
 8048f33:	c3                   	ret    

08048f34 <memset>:
 8048f34:	55                   	push   %ebp
 8048f35:	89 e5                	mov    %esp,%ebp
 8048f37:	57                   	push   %edi
 8048f38:	8b 7d 08             	mov    0x8(%ebp),%edi
 8048f3b:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 8048f3f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8048f42:	fc                   	cld    
 8048f43:	83 f9 10             	cmp    $0x10,%ecx
 8048f46:	76 69                	jbe    8048fb1 <memset+0x7d>
 8048f48:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f4e:	74 4c                	je     8048f9c <memset+0x68>
 8048f50:	88 07                	mov    %al,(%edi)
 8048f52:	47                   	inc    %edi
 8048f53:	49                   	dec    %ecx
 8048f54:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f5a:	74 40                	je     8048f9c <memset+0x68>
 8048f5c:	88 07                	mov    %al,(%edi)
 8048f5e:	47                   	inc    %edi
 8048f5f:	49                   	dec    %ecx
 8048f60:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f66:	74 34                	je     8048f9c <memset+0x68>
 8048f68:	88 07                	mov    %al,(%edi)
 8048f6a:	47                   	inc    %edi
 8048f6b:	49                   	dec    %ecx
 8048f6c:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f72:	74 28                	je     8048f9c <memset+0x68>
 8048f74:	88 07                	mov    %al,(%edi)
 8048f76:	47                   	inc    %edi
 8048f77:	49                   	dec    %ecx
 8048f78:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f7e:	74 1c                	je     8048f9c <memset+0x68>
 8048f80:	88 07                	mov    %al,(%edi)
 8048f82:	47                   	inc    %edi
 8048f83:	49                   	dec    %ecx
 8048f84:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f8a:	74 10                	je     8048f9c <memset+0x68>
 8048f8c:	88 07                	mov    %al,(%edi)
 8048f8e:	47                   	inc    %edi
 8048f8f:	49                   	dec    %ecx
 8048f90:	f7 c7 07 00 00 00    	test   $0x7,%edi
 8048f96:	74 04                	je     8048f9c <memset+0x68>
 8048f98:	88 07                	mov    %al,(%edi)
 8048f9a:	47                   	inc    %edi
 8048f9b:	49                   	dec    %ecx
 8048f9c:	88 c4                	mov    %al,%ah
 8048f9e:	89 c2                	mov    %eax,%edx
 8048fa0:	c1 e2 10             	shl    $0x10,%edx
 8048fa3:	09 d0                	or     %edx,%eax
 8048fa5:	89 ca                	mov    %ecx,%edx
 8048fa7:	c1 e9 02             	shr    $0x2,%ecx
 8048faa:	83 e2 03             	and    $0x3,%edx
 8048fad:	f3 ab                	rep stos %eax,%es:(%edi)
 8048faf:	89 d1                	mov    %edx,%ecx
 8048fb1:	f3 aa                	rep stos %al,%es:(%edi)
 8048fb3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fb6:	8d 65 fc             	lea    -0x4(%ebp),%esp
 8048fb9:	5f                   	pop    %edi
 8048fba:	c9                   	leave  
 8048fbb:	c3                   	ret    
 8048fbc:	66 90                	xchg   %ax,%ax
 8048fbe:	66 90                	xchg   %ax,%ax

08048fc0 <_printf_r>:
 8048fc0:	55                   	push   %ebp
 8048fc1:	89 e5                	mov    %esp,%ebp
 8048fc3:	83 ec 18             	sub    $0x18,%esp
 8048fc6:	8d 55 10             	lea    0x10(%ebp),%edx
 8048fc9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fcc:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048fd0:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fd3:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048fd7:	8b 50 08             	mov    0x8(%eax),%edx
 8048fda:	89 04 24             	mov    %eax,(%esp)
 8048fdd:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048fe1:	e8 6a 21 00 00       	call   804b150 <_vfprintf_r>
 8048fe6:	c9                   	leave  
 8048fe7:	c3                   	ret    
 8048fe8:	90                   	nop
 8048fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08048ff0 <printf>:
 8048ff0:	55                   	push   %ebp
 8048ff1:	89 e5                	mov    %esp,%ebp
 8048ff3:	83 ec 18             	sub    $0x18,%esp
 8048ff6:	e8 e5 61 00 00       	call   804f1e0 <__getreent>
 8048ffb:	8d 55 0c             	lea    0xc(%ebp),%edx
 8048ffe:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049002:	8b 55 08             	mov    0x8(%ebp),%edx
 8049005:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049009:	8b 50 08             	mov    0x8(%eax),%edx
 804900c:	89 04 24             	mov    %eax,(%esp)
 804900f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049013:	e8 38 21 00 00       	call   804b150 <_vfprintf_r>
 8049018:	c9                   	leave  
 8049019:	c3                   	ret    
 804901a:	66 90                	xchg   %ax,%ax
 804901c:	66 90                	xchg   %ax,%ax
 804901e:	66 90                	xchg   %ax,%ax

08049020 <srand>:
 8049020:	55                   	push   %ebp
 8049021:	89 e5                	mov    %esp,%ebp
 8049023:	83 ec 08             	sub    $0x8,%esp
 8049026:	e8 b5 61 00 00       	call   804f1e0 <__getreent>
 804902b:	8b 55 08             	mov    0x8(%ebp),%edx
 804902e:	c7 80 a8 00 00 00 00 	movl   $0x0,0xa8(%eax)
 8049035:	00 00 00 
 8049038:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
 804903e:	c9                   	leave  
 804903f:	c3                   	ret    

08049040 <rand>:
 8049040:	55                   	push   %ebp
 8049041:	89 e5                	mov    %esp,%ebp
 8049043:	56                   	push   %esi
 8049044:	53                   	push   %ebx
 8049045:	e8 96 61 00 00       	call   804f1e0 <__getreent>
 804904a:	b9 2d 7f 95 4c       	mov    $0x4c957f2d,%ecx
 804904f:	69 90 a4 00 00 00 2d 	imul   $0x5851f42d,0xa4(%eax),%edx
 8049056:	f4 51 58 
 8049059:	89 c6                	mov    %eax,%esi
 804905b:	69 98 a8 00 00 00 2d 	imul   $0x4c957f2d,0xa8(%eax),%ebx
 8049062:	7f 95 4c 
 8049065:	89 c8                	mov    %ecx,%eax
 8049067:	01 d3                	add    %edx,%ebx
 8049069:	f7 a6 a4 00 00 00    	mull   0xa4(%esi)
 804906f:	89 d1                	mov    %edx,%ecx
 8049071:	01 d9                	add    %ebx,%ecx
 8049073:	89 cb                	mov    %ecx,%ebx
 8049075:	89 c1                	mov    %eax,%ecx
 8049077:	83 c1 01             	add    $0x1,%ecx
 804907a:	83 d3 00             	adc    $0x0,%ebx
 804907d:	89 d8                	mov    %ebx,%eax
 804907f:	89 8e a4 00 00 00    	mov    %ecx,0xa4(%esi)
 8049085:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
 804908a:	89 9e a8 00 00 00    	mov    %ebx,0xa8(%esi)
 8049090:	5b                   	pop    %ebx
 8049091:	5e                   	pop    %esi
 8049092:	5d                   	pop    %ebp
 8049093:	c3                   	ret    
 8049094:	66 90                	xchg   %ax,%ax
 8049096:	66 90                	xchg   %ax,%ax
 8049098:	66 90                	xchg   %ax,%ax
 804909a:	66 90                	xchg   %ax,%ax
 804909c:	66 90                	xchg   %ax,%ax
 804909e:	66 90                	xchg   %ax,%ax

080490a0 <_snprintf_r>:
 80490a0:	55                   	push   %ebp
 80490a1:	89 e5                	mov    %esp,%ebp
 80490a3:	56                   	push   %esi
 80490a4:	53                   	push   %ebx
 80490a5:	83 c4 80             	add    $0xffffff80,%esp
 80490a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80490ab:	8b 75 08             	mov    0x8(%ebp),%esi
 80490ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490b1:	85 db                	test   %ebx,%ebx
 80490b3:	78 63                	js     8049118 <_snprintf_r+0x78>
 80490b5:	ba 08 02 00 00       	mov    $0x208,%edx
 80490ba:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80490bf:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
 80490c3:	8d 53 ff             	lea    -0x1(%ebx),%edx
 80490c6:	89 45 90             	mov    %eax,-0x70(%ebp)
 80490c9:	89 45 a0             	mov    %eax,-0x60(%ebp)
 80490cc:	31 c0                	xor    %eax,%eax
 80490ce:	85 db                	test   %ebx,%ebx
 80490d0:	0f 45 c2             	cmovne %edx,%eax
 80490d3:	89 45 98             	mov    %eax,-0x68(%ebp)
 80490d6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 80490d9:	8d 45 18             	lea    0x18(%ebp),%eax
 80490dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80490e0:	8b 45 14             	mov    0x14(%ebp),%eax
 80490e3:	89 34 24             	mov    %esi,(%esp)
 80490e6:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
 80490ea:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490ee:	8d 45 90             	lea    -0x70(%ebp),%eax
 80490f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80490f5:	e8 56 01 00 00       	call   8049250 <_svfprintf_r>
 80490fa:	83 f8 ff             	cmp    $0xffffffff,%eax
 80490fd:	7c 11                	jl     8049110 <_snprintf_r+0x70>
 80490ff:	85 db                	test   %ebx,%ebx
 8049101:	74 06                	je     8049109 <_snprintf_r+0x69>
 8049103:	8b 55 90             	mov    -0x70(%ebp),%edx
 8049106:	c6 02 00             	movb   $0x0,(%edx)
 8049109:	83 ec 80             	sub    $0xffffff80,%esp
 804910c:	5b                   	pop    %ebx
 804910d:	5e                   	pop    %esi
 804910e:	5d                   	pop    %ebp
 804910f:	c3                   	ret    
 8049110:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
 8049116:	eb e7                	jmp    80490ff <_snprintf_r+0x5f>
 8049118:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
 804911e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049123:	eb e4                	jmp    8049109 <_snprintf_r+0x69>
 8049125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08049130 <snprintf>:
 8049130:	55                   	push   %ebp
 8049131:	89 e5                	mov    %esp,%ebp
 8049133:	57                   	push   %edi
 8049134:	56                   	push   %esi
 8049135:	53                   	push   %ebx
 8049136:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 804913c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804913f:	8b 75 08             	mov    0x8(%ebp),%esi
 8049142:	e8 99 60 00 00       	call   804f1e0 <__getreent>
 8049147:	85 db                	test   %ebx,%ebx
 8049149:	89 c7                	mov    %eax,%edi
 804914b:	78 6b                	js     80491b8 <snprintf+0x88>
 804914d:	b8 08 02 00 00       	mov    $0x208,%eax
 8049152:	31 d2                	xor    %edx,%edx
 8049154:	66 89 45 8c          	mov    %ax,-0x74(%ebp)
 8049158:	85 db                	test   %ebx,%ebx
 804915a:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804915d:	0f 45 d0             	cmovne %eax,%edx
 8049160:	8d 45 14             	lea    0x14(%ebp),%eax
 8049163:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049167:	8b 45 10             	mov    0x10(%ebp),%eax
 804916a:	89 55 88             	mov    %edx,-0x78(%ebp)
 804916d:	89 55 94             	mov    %edx,-0x6c(%ebp)
 8049170:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 8049175:	89 3c 24             	mov    %edi,(%esp)
 8049178:	89 44 24 08          	mov    %eax,0x8(%esp)
 804917c:	8d 45 80             	lea    -0x80(%ebp),%eax
 804917f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049183:	89 75 80             	mov    %esi,-0x80(%ebp)
 8049186:	89 75 90             	mov    %esi,-0x70(%ebp)
 8049189:	66 89 55 8e          	mov    %dx,-0x72(%ebp)
 804918d:	e8 be 00 00 00       	call   8049250 <_svfprintf_r>
 8049192:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049195:	7c 19                	jl     80491b0 <snprintf+0x80>
 8049197:	85 db                	test   %ebx,%ebx
 8049199:	74 06                	je     80491a1 <snprintf+0x71>
 804919b:	8b 55 80             	mov    -0x80(%ebp),%edx
 804919e:	c6 02 00             	movb   $0x0,(%edx)
 80491a1:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 80491a7:	5b                   	pop    %ebx
 80491a8:	5e                   	pop    %esi
 80491a9:	5f                   	pop    %edi
 80491aa:	5d                   	pop    %ebp
 80491ab:	c3                   	ret    
 80491ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80491b0:	c7 07 8b 00 00 00    	movl   $0x8b,(%edi)
 80491b6:	eb df                	jmp    8049197 <snprintf+0x67>
 80491b8:	c7 00 8b 00 00 00    	movl   $0x8b,(%eax)
 80491be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80491c3:	eb dc                	jmp    80491a1 <snprintf+0x71>
 80491c5:	66 90                	xchg   %ax,%ax
 80491c7:	66 90                	xchg   %ax,%ax
 80491c9:	66 90                	xchg   %ax,%ax
 80491cb:	66 90                	xchg   %ax,%ax
 80491cd:	66 90                	xchg   %ax,%ax
 80491cf:	90                   	nop

080491d0 <strlen>:
 80491d0:	55                   	push   %ebp
 80491d1:	89 e5                	mov    %esp,%ebp
 80491d3:	57                   	push   %edi
 80491d4:	8b 55 08             	mov    0x8(%ebp),%edx
 80491d7:	89 d7                	mov    %edx,%edi
 80491d9:	f7 c7 03 00 00 00    	test   $0x3,%edi
 80491df:	74 25                	je     8049206 <L5>
 80491e1:	8a 0f                	mov    (%edi),%cl
 80491e3:	47                   	inc    %edi
 80491e4:	84 c9                	test   %cl,%cl
 80491e6:	74 56                	je     804923e <L15>
 80491e8:	f7 c7 03 00 00 00    	test   $0x3,%edi
 80491ee:	74 16                	je     8049206 <L5>
 80491f0:	8a 0f                	mov    (%edi),%cl
 80491f2:	47                   	inc    %edi
 80491f3:	84 c9                	test   %cl,%cl
 80491f5:	74 47                	je     804923e <L15>
 80491f7:	f7 c7 03 00 00 00    	test   $0x3,%edi
 80491fd:	74 07                	je     8049206 <L5>
 80491ff:	8a 0f                	mov    (%edi),%cl
 8049201:	47                   	inc    %edi
 8049202:	84 c9                	test   %cl,%cl
 8049204:	74 38                	je     804923e <L15>

08049206 <L5>:
 8049206:	83 ef 04             	sub    $0x4,%edi
 8049209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08049210 <L10>:
 8049210:	83 c7 04             	add    $0x4,%edi
 8049213:	8b 0f                	mov    (%edi),%ecx
 8049215:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
 804921b:	f7 d1                	not    %ecx
 804921d:	21 c8                	and    %ecx,%eax
 804921f:	a9 80 80 80 80       	test   $0x80808080,%eax
 8049224:	74 ea                	je     8049210 <L10>
 8049226:	f7 d1                	not    %ecx
 8049228:	47                   	inc    %edi
 8049229:	84 c9                	test   %cl,%cl
 804922b:	74 11                	je     804923e <L15>
 804922d:	47                   	inc    %edi
 804922e:	c1 e9 08             	shr    $0x8,%ecx
 8049231:	84 c9                	test   %cl,%cl
 8049233:	74 09                	je     804923e <L15>
 8049235:	47                   	inc    %edi
 8049236:	c1 e9 08             	shr    $0x8,%ecx
 8049239:	84 c9                	test   %cl,%cl
 804923b:	74 01                	je     804923e <L15>
 804923d:	47                   	inc    %edi

0804923e <L15>:
 804923e:	29 d7                	sub    %edx,%edi
 8049240:	8d 47 ff             	lea    -0x1(%edi),%eax
 8049243:	8d 65 fc             	lea    -0x4(%ebp),%esp
 8049246:	5f                   	pop    %edi
 8049247:	c9                   	leave  
 8049248:	c3                   	ret    
 8049249:	66 90                	xchg   %ax,%ax
 804924b:	66 90                	xchg   %ax,%ax
 804924d:	66 90                	xchg   %ax,%ax
 804924f:	90                   	nop

08049250 <_svfprintf_r>:
 8049250:	55                   	push   %ebp
 8049251:	89 e5                	mov    %esp,%ebp
 8049253:	57                   	push   %edi
 8049254:	56                   	push   %esi
 8049255:	53                   	push   %ebx
 8049256:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
 804925c:	8b 45 08             	mov    0x8(%ebp),%eax
 804925f:	89 04 24             	mov    %eax,(%esp)
 8049262:	e8 39 60 00 00       	call   804f2a0 <_localeconv_r>
 8049267:	8b 00                	mov    (%eax),%eax
 8049269:	89 04 24             	mov    %eax,(%esp)
 804926c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
 8049272:	e8 59 ff ff ff       	call   80491d0 <strlen>
 8049277:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
 804927d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049280:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
 8049284:	74 0b                	je     8049291 <_svfprintf_r+0x41>
 8049286:	8b 40 10             	mov    0x10(%eax),%eax
 8049289:	85 c0                	test   %eax,%eax
 804928b:	0f 84 62 18 00 00    	je     804aaf3 <_svfprintf_r+0x18a3>
 8049291:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049294:	8d 55 a7             	lea    -0x59(%ebp),%edx
 8049297:	89 c7                	mov    %eax,%edi
 8049299:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 804929f:	90                   	nop
 80492a0:	90                   	nop
 80492a1:	29 d0                	sub    %edx,%eax
 80492a3:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 80492aa:	00 00 00 
 80492ad:	90                   	nop
 80492ae:	90                   	nop
 80492af:	90                   	nop
 80492b0:	90                   	nop
 80492b1:	90                   	nop
 80492b2:	90                   	nop
 80492b3:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 80492ba:	00 00 00 
 80492bd:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
 80492c4:	00 00 00 
 80492c7:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
 80492ce:	00 00 00 
 80492d1:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
 80492d8:	00 00 00 
 80492db:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
 80492e2:	00 00 00 
 80492e5:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
 80492eb:	8b 45 10             	mov    0x10(%ebp),%eax
 80492ee:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80492f1:	0f b6 00             	movzbl (%eax),%eax
 80492f4:	3c 25                	cmp    $0x25,%al
 80492f6:	74 4d                	je     8049345 <_svfprintf_r+0xf5>
 80492f8:	84 c0                	test   %al,%al
 80492fa:	75 08                	jne    8049304 <_svfprintf_r+0xb4>
 80492fc:	eb 47                	jmp    8049345 <_svfprintf_r+0xf5>
 80492fe:	66 90                	xchg   %ax,%ax
 8049300:	84 c0                	test   %al,%al
 8049302:	74 0a                	je     804930e <_svfprintf_r+0xbe>
 8049304:	83 c3 01             	add    $0x1,%ebx
 8049307:	0f b6 03             	movzbl (%ebx),%eax
 804930a:	3c 25                	cmp    $0x25,%al
 804930c:	75 f2                	jne    8049300 <_svfprintf_r+0xb0>
 804930e:	89 de                	mov    %ebx,%esi
 8049310:	2b 75 10             	sub    0x10(%ebp),%esi
 8049313:	74 30                	je     8049345 <_svfprintf_r+0xf5>
 8049315:	8b 45 10             	mov    0x10(%ebp),%eax
 8049318:	83 c7 08             	add    $0x8,%edi
 804931b:	89 77 fc             	mov    %esi,-0x4(%edi)
 804931e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
 8049324:	89 47 f8             	mov    %eax,-0x8(%edi)
 8049327:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804932d:	83 c0 01             	add    $0x1,%eax
 8049330:	83 f8 07             	cmp    $0x7,%eax
 8049333:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049339:	0f 8f 91 00 00 00    	jg     80493d0 <_svfprintf_r+0x180>
 804933f:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
 8049345:	80 3b 00             	cmpb   $0x0,(%ebx)
 8049348:	0f 84 aa 00 00 00    	je     80493f8 <_svfprintf_r+0x1a8>
 804934e:	8d 43 01             	lea    0x1(%ebx),%eax
 8049351:	be 20 00 00 00       	mov    $0x20,%esi
 8049356:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804935d:	31 db                	xor    %ebx,%ebx
 804935f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 8049366:	ff ff ff 
 8049369:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 8049370:	00 00 00 
 8049373:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
 804937a:	00 00 00 
 804937d:	8d 48 01             	lea    0x1(%eax),%ecx
 8049380:	0f be 00             	movsbl (%eax),%eax
 8049383:	8d 50 e0             	lea    -0x20(%eax),%edx
 8049386:	83 fa 58             	cmp    $0x58,%edx
 8049389:	0f 87 8f 07 00 00    	ja     8049b1e <_svfprintf_r+0x8ce>
 804938f:	ff 24 95 28 46 05 08 	jmp    *0x8054628(,%edx,4)
 8049396:	66 90                	xchg   %ax,%ax
 8049398:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804939f:	89 c8                	mov    %ecx,%eax
 80493a1:	eb da                	jmp    804937d <_svfprintf_r+0x12d>
 80493a3:	8b 45 14             	mov    0x14(%ebp),%eax
 80493a6:	8b 55 14             	mov    0x14(%ebp),%edx
 80493a9:	8b 00                	mov    (%eax),%eax
 80493ab:	83 c2 04             	add    $0x4,%edx
 80493ae:	89 55 14             	mov    %edx,0x14(%ebp)
 80493b1:	85 c0                	test   %eax,%eax
 80493b3:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
 80493b9:	79 e4                	jns    804939f <_svfprintf_r+0x14f>
 80493bb:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
 80493c1:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
 80493c8:	89 c8                	mov    %ecx,%eax
 80493ca:	eb b1                	jmp    804937d <_svfprintf_r+0x12d>
 80493cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80493d0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80493d6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493da:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493e1:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e4:	89 04 24             	mov    %eax,(%esp)
 80493e7:	e8 d4 78 00 00       	call   8050cc0 <__ssprint_r>
 80493ec:	85 c0                	test   %eax,%eax
 80493ee:	75 30                	jne    8049420 <_svfprintf_r+0x1d0>
 80493f0:	8d 7d a8             	lea    -0x58(%ebp),%edi
 80493f3:	e9 47 ff ff ff       	jmp    804933f <_svfprintf_r+0xef>
 80493f8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 80493fe:	85 c0                	test   %eax,%eax
 8049400:	74 1e                	je     8049420 <_svfprintf_r+0x1d0>
 8049402:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049408:	89 44 24 08          	mov    %eax,0x8(%esp)
 804940c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804940f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049413:	8b 45 08             	mov    0x8(%ebp),%eax
 8049416:	89 04 24             	mov    %eax,(%esp)
 8049419:	e8 a2 78 00 00       	call   8050cc0 <__ssprint_r>
 804941e:	66 90                	xchg   %ax,%ax
 8049420:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049423:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049428:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
 804942c:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
 8049433:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 8049439:	5b                   	pop    %ebx
 804943a:	5e                   	pop    %esi
 804943b:	5f                   	pop    %edi
 804943c:	5d                   	pop    %ebp
 804943d:	c3                   	ret    
 804943e:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 8049443:	89 c8                	mov    %ecx,%eax
 8049445:	e9 33 ff ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 804944a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049450:	8b 45 14             	mov    0x14(%ebp),%eax
 8049453:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049456:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804945d:	8d 70 04             	lea    0x4(%eax),%esi
 8049460:	8b 00                	mov    (%eax),%eax
 8049462:	85 c0                	test   %eax,%eax
 8049464:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804946a:	0f 84 7f 18 00 00    	je     804acef <_svfprintf_r+0x1a9f>
 8049470:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8049476:	85 c0                	test   %eax,%eax
 8049478:	0f 88 b6 17 00 00    	js     804ac34 <_svfprintf_r+0x19e4>
 804947e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049482:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 8049488:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804948f:	00 
 8049490:	89 04 24             	mov    %eax,(%esp)
 8049493:	e8 e8 66 00 00       	call   804fb80 <memchr>
 8049498:	85 c0                	test   %eax,%eax
 804949a:	0f 84 a0 19 00 00    	je     804ae40 <_svfprintf_r+0x1bf0>
 80494a0:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 80494a6:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 80494ac:	39 d0                	cmp    %edx,%eax
 80494ae:	0f 4f c2             	cmovg  %edx,%eax
 80494b1:	89 c2                	mov    %eax,%edx
 80494b3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 80494ba:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 80494c0:	31 c0                	xor    %eax,%eax
 80494c2:	85 d2                	test   %edx,%edx
 80494c4:	0f 49 c2             	cmovns %edx,%eax
 80494c7:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 80494cd:	89 75 14             	mov    %esi,0x14(%ebp)
 80494d0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 80494d7:	00 00 00 
 80494da:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 80494e1:	00 00 00 
 80494e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80494e8:	84 db                	test   %bl,%bl
 80494ea:	74 07                	je     80494f3 <_svfprintf_r+0x2a3>
 80494ec:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
 80494f3:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 80494f9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 80494ff:	89 c8                	mov    %ecx,%eax
 8049501:	89 f2                	mov    %esi,%edx
 8049503:	83 c0 02             	add    $0x2,%eax
 8049506:	83 e2 02             	and    $0x2,%edx
 8049509:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
 804950f:	89 f2                	mov    %esi,%edx
 8049511:	0f 44 c1             	cmove  %ecx,%eax
 8049514:	81 e2 84 00 00 00    	and    $0x84,%edx
 804951a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 8049520:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
 8049526:	0f 85 1c 06 00 00    	jne    8049b48 <_svfprintf_r+0x8f8>
 804952c:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049532:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049538:	85 f6                	test   %esi,%esi
 804953a:	0f 8e 08 06 00 00    	jle    8049b48 <_svfprintf_r+0x8f8>
 8049540:	83 fe 10             	cmp    $0x10,%esi
 8049543:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049549:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804954f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049555:	7f 11                	jg     8049568 <_svfprintf_r+0x318>
 8049557:	eb 6b                	jmp    80495c4 <_svfprintf_r+0x374>
 8049559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049560:	83 ee 10             	sub    $0x10,%esi
 8049563:	83 fe 10             	cmp    $0x10,%esi
 8049566:	7e 5c                	jle    80495c4 <_svfprintf_r+0x374>
 8049568:	83 c0 01             	add    $0x1,%eax
 804956b:	83 c1 10             	add    $0x10,%ecx
 804956e:	c7 07 9c 47 05 08    	movl   $0x805479c,(%edi)
 8049574:	83 c7 08             	add    $0x8,%edi
 8049577:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804957e:	83 f8 07             	cmp    $0x7,%eax
 8049581:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049587:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804958d:	7e d1                	jle    8049560 <_svfprintf_r+0x310>
 804958f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049592:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049596:	89 44 24 04          	mov    %eax,0x4(%esp)
 804959a:	8b 45 08             	mov    0x8(%ebp),%eax
 804959d:	89 04 24             	mov    %eax,(%esp)
 80495a0:	e8 1b 77 00 00       	call   8050cc0 <__ssprint_r>
 80495a5:	85 c0                	test   %eax,%eax
 80495a7:	0f 85 73 fe ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 80495ad:	83 ee 10             	sub    $0x10,%esi
 80495b0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 80495b6:	83 fe 10             	cmp    $0x10,%esi
 80495b9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80495bf:	8d 7d a8             	lea    -0x58(%ebp),%edi
 80495c2:	7f a4                	jg     8049568 <_svfprintf_r+0x318>
 80495c4:	83 c0 01             	add    $0x1,%eax
 80495c7:	01 f1                	add    %esi,%ecx
 80495c9:	83 f8 07             	cmp    $0x7,%eax
 80495cc:	c7 07 9c 47 05 08    	movl   $0x805479c,(%edi)
 80495d2:	89 77 04             	mov    %esi,0x4(%edi)
 80495d5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 80495db:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80495e1:	0f 8f 16 0e 00 00    	jg     804a3fd <_svfprintf_r+0x11ad>
 80495e7:	83 c7 08             	add    $0x8,%edi
 80495ea:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 80495f1:	e9 58 05 00 00       	jmp    8049b4e <_svfprintf_r+0x8fe>
 80495f6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 80495fd:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049603:	8b 45 14             	mov    0x14(%ebp),%eax
 8049606:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049609:	0f 85 fd 04 00 00    	jne    8049b0c <_svfprintf_r+0x8bc>
 804960f:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049616:	0f 84 f0 04 00 00    	je     8049b0c <_svfprintf_r+0x8bc>
 804961c:	0f b7 08             	movzwl (%eax),%ecx
 804961f:	83 c0 04             	add    $0x4,%eax
 8049622:	89 45 14             	mov    %eax,0x14(%ebp)
 8049625:	b8 01 00 00 00       	mov    $0x1,%eax
 804962a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049630:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049637:	31 db                	xor    %ebx,%ebx
 8049639:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804963f:	89 f2                	mov    %esi,%edx
 8049641:	80 e2 7f             	and    $0x7f,%dl
 8049644:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
 804964b:	0f 48 d6             	cmovs  %esi,%edx
 804964e:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
 8049654:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804965a:	85 d2                	test   %edx,%edx
 804965c:	75 08                	jne    8049666 <_svfprintf_r+0x416>
 804965e:	85 c9                	test   %ecx,%ecx
 8049660:	0f 84 ea 08 00 00    	je     8049f50 <_svfprintf_r+0xd00>
 8049666:	3c 01                	cmp    $0x1,%al
 8049668:	0f 84 6a 0d 00 00    	je     804a3d8 <_svfprintf_r+0x1188>
 804966e:	3c 02                	cmp    $0x2,%al
 8049670:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049673:	0f 85 bf 0b 00 00    	jne    804a238 <_svfprintf_r+0xfe8>
 8049679:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
 804967f:	90                   	nop
 8049680:	89 ca                	mov    %ecx,%edx
 8049682:	83 e8 01             	sub    $0x1,%eax
 8049685:	83 e2 0f             	and    $0xf,%edx
 8049688:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
 804968c:	c1 e9 04             	shr    $0x4,%ecx
 804968f:	85 c9                	test   %ecx,%ecx
 8049691:	88 10                	mov    %dl,(%eax)
 8049693:	75 eb                	jne    8049680 <_svfprintf_r+0x430>
 8049695:	8d 55 a8             	lea    -0x58(%ebp),%edx
 8049698:	29 c2                	sub    %eax,%edx
 804969a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 80496a0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 80496a6:	66 90                	xchg   %ax,%ax
 80496a8:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 80496ae:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
 80496b4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 80496bb:	00 00 00 
 80496be:	39 c2                	cmp    %eax,%edx
 80496c0:	0f 4d c2             	cmovge %edx,%eax
 80496c3:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 80496c9:	e9 1a fe ff ff       	jmp    80494e8 <_svfprintf_r+0x298>
 80496ce:	84 db                	test   %bl,%bl
 80496d0:	89 c8                	mov    %ecx,%eax
 80496d2:	0f 44 de             	cmove  %esi,%ebx
 80496d5:	e9 a3 fc ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 80496da:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
 80496e1:	89 c8                	mov    %ecx,%eax
 80496e3:	e9 95 fc ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 80496e8:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
 80496ef:	00 00 00 
 80496f2:	89 c8                	mov    %ecx,%eax
 80496f4:	e9 84 fc ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 80496f9:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 80496ff:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049702:	31 ff                	xor    %edi,%edi
 8049704:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804970b:	00 00 00 
 804970e:	66 90                	xchg   %ax,%ax
 8049710:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 8049713:	83 c1 01             	add    $0x1,%ecx
 8049716:	8d 3c 42             	lea    (%edx,%eax,2),%edi
 8049719:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
 804971d:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049720:	83 fa 09             	cmp    $0x9,%edx
 8049723:	76 eb                	jbe    8049710 <_svfprintf_r+0x4c0>
 8049725:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
 804972b:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 8049731:	e9 4d fc ff ff       	jmp    8049383 <_svfprintf_r+0x133>
 8049736:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804973d:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049744:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804974a:	8b 45 14             	mov    0x14(%ebp),%eax
 804974d:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049750:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049756:	0f 85 61 02 00 00    	jne    80499bd <_svfprintf_r+0x76d>
 804975c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049763:	0f 84 54 02 00 00    	je     80499bd <_svfprintf_r+0x76d>
 8049769:	0f bf 08             	movswl (%eax),%ecx
 804976c:	83 c0 04             	add    $0x4,%eax
 804976f:	89 45 14             	mov    %eax,0x14(%ebp)
 8049772:	85 c9                	test   %ecx,%ecx
 8049774:	0f 88 53 02 00 00    	js     80499cd <_svfprintf_r+0x77d>
 804977a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 8049781:	b8 01 00 00 00       	mov    $0x1,%eax
 8049786:	e9 ae fe ff ff       	jmp    8049639 <_svfprintf_r+0x3e9>
 804978b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
 8049792:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049798:	8b 45 14             	mov    0x14(%ebp),%eax
 804979b:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804979e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 80497a4:	0f 84 15 10 00 00    	je     804a7bf <_svfprintf_r+0x156f>
 80497aa:	db 28                	fldt   (%eax)
 80497ac:	83 c0 0c             	add    $0xc,%eax
 80497af:	89 45 14             	mov    %eax,0x14(%ebp)
 80497b2:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 80497b8:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 80497be:	dd 1c 24             	fstpl  (%esp)
 80497c1:	e8 da 72 00 00       	call   8050aa0 <__fpclassifyd>
 80497c6:	83 f8 01             	cmp    $0x1,%eax
 80497c9:	0f 85 82 0f 00 00    	jne    804a751 <_svfprintf_r+0x1501>
 80497cf:	d9 ee                	fldz   
 80497d1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 80497d7:	d9 c9                	fxch   %st(1)
 80497d9:	df e9                	fucomip %st(1),%st
 80497db:	dd d8                	fstp   %st(0)
 80497dd:	0f 87 59 15 00 00    	ja     804ad3c <_svfprintf_r+0x1aec>
 80497e3:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 80497ea:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 80497f1:	ba ec 45 05 08       	mov    $0x80545ec,%edx
 80497f6:	b8 f0 45 05 08       	mov    $0x80545f0,%eax
 80497fb:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 8049802:	00 00 00 
 8049805:	0f 4e c2             	cmovle %edx,%eax
 8049808:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804980e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 8049815:	ff ff ff 
 8049818:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804981f:	00 00 00 
 8049822:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8049829:	00 00 00 
 804982c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 8049833:	00 00 00 
 8049836:	e9 ad fc ff ff       	jmp    80494e8 <_svfprintf_r+0x298>
 804983b:	8d 41 01             	lea    0x1(%ecx),%eax
 804983e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 8049844:	0f be 01             	movsbl (%ecx),%eax
 8049847:	83 f8 2a             	cmp    $0x2a,%eax
 804984a:	0f 84 84 18 00 00    	je     804b0d4 <_svfprintf_r+0x1e84>
 8049850:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049853:	31 c9                	xor    %ecx,%ecx
 8049855:	83 fa 09             	cmp    $0x9,%edx
 8049858:	0f 87 a8 16 00 00    	ja     804af06 <_svfprintf_r+0x1cb6>
 804985e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
 8049864:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804986a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049870:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 8049873:	83 c7 01             	add    $0x1,%edi
 8049876:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
 8049879:	0f be 47 ff          	movsbl -0x1(%edi),%eax
 804987d:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049880:	83 fa 09             	cmp    $0x9,%edx
 8049883:	76 eb                	jbe    8049870 <_svfprintf_r+0x620>
 8049885:	85 c9                	test   %ecx,%ecx
 8049887:	89 ca                	mov    %ecx,%edx
 8049889:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804988e:	0f 48 d1             	cmovs  %ecx,%edx
 8049891:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 8049897:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 804989d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 80498a3:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 80498a9:	e9 d5 fa ff ff       	jmp    8049383 <_svfprintf_r+0x133>
 80498ae:	8b 45 14             	mov    0x14(%ebp),%eax
 80498b1:	89 4d 10             	mov    %ecx,0x10(%ebp)
 80498b4:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 80498bb:	8b 08                	mov    (%eax),%ecx
 80498bd:	83 c0 04             	add    $0x4,%eax
 80498c0:	89 45 14             	mov    %eax,0x14(%ebp)
 80498c3:	b8 02 00 00 00       	mov    $0x2,%eax
 80498c8:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 80498cf:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
 80498d6:	c7 85 18 ff ff ff 0d 	movl   $0x805460d,-0xe8(%ebp)
 80498dd:	46 05 08 
 80498e0:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
 80498e7:	00 00 00 
 80498ea:	e9 41 fd ff ff       	jmp    8049630 <_svfprintf_r+0x3e0>
 80498ef:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 80498f6:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 80498fc:	8b 45 14             	mov    0x14(%ebp),%eax
 80498ff:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049902:	0f 85 87 00 00 00    	jne    804998f <_svfprintf_r+0x73f>
 8049908:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804990f:	74 7e                	je     804998f <_svfprintf_r+0x73f>
 8049911:	0f b7 08             	movzwl (%eax),%ecx
 8049914:	83 c0 04             	add    $0x4,%eax
 8049917:	89 45 14             	mov    %eax,0x14(%ebp)
 804991a:	31 c0                	xor    %eax,%eax
 804991c:	e9 0f fd ff ff       	jmp    8049630 <_svfprintf_r+0x3e0>
 8049921:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
 8049928:	89 c8                	mov    %ecx,%eax
 804992a:	e9 4e fa ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 804992f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049936:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049939:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804993f:	0f 85 97 0b 00 00    	jne    804a4dc <_svfprintf_r+0x128c>
 8049945:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804994c:	0f 84 8a 0b 00 00    	je     804a4dc <_svfprintf_r+0x128c>
 8049952:	8b 45 14             	mov    0x14(%ebp),%eax
 8049955:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
 804995c:	8b 00                	mov    (%eax),%eax
 804995e:	66 89 10             	mov    %dx,(%eax)
 8049961:	8b 45 14             	mov    0x14(%ebp),%eax
 8049964:	83 c0 04             	add    $0x4,%eax
 8049967:	89 45 14             	mov    %eax,0x14(%ebp)
 804996a:	e9 7c f9 ff ff       	jmp    80492eb <_svfprintf_r+0x9b>
 804996f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 8049976:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804997d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049983:	8b 45 14             	mov    0x14(%ebp),%eax
 8049986:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049989:	0f 84 79 ff ff ff    	je     8049908 <_svfprintf_r+0x6b8>
 804998f:	8b 08                	mov    (%eax),%ecx
 8049991:	83 c0 04             	add    $0x4,%eax
 8049994:	89 45 14             	mov    %eax,0x14(%ebp)
 8049997:	31 c0                	xor    %eax,%eax
 8049999:	e9 92 fc ff ff       	jmp    8049630 <_svfprintf_r+0x3e0>
 804999e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 80499a5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 80499ab:	8b 45 14             	mov    0x14(%ebp),%eax
 80499ae:	89 4d 10             	mov    %ecx,0x10(%ebp)
 80499b1:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 80499b7:	0f 84 9f fd ff ff    	je     804975c <_svfprintf_r+0x50c>
 80499bd:	8b 08                	mov    (%eax),%ecx
 80499bf:	83 c0 04             	add    $0x4,%eax
 80499c2:	89 45 14             	mov    %eax,0x14(%ebp)
 80499c5:	85 c9                	test   %ecx,%ecx
 80499c7:	0f 89 ad fd ff ff    	jns    804977a <_svfprintf_r+0x52a>
 80499cd:	f7 d9                	neg    %ecx
 80499cf:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 80499d4:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 80499db:	b8 01 00 00 00       	mov    $0x1,%eax
 80499e0:	e9 54 fc ff ff       	jmp    8049639 <_svfprintf_r+0x3e9>
 80499e5:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
 80499ec:	89 c8                	mov    %ecx,%eax
 80499ee:	e9 8a f9 ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 80499f3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 80499fa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049a00:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a03:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049a06:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049a0c:	c7 85 18 ff ff ff 0d 	movl   $0x805460d,-0xe8(%ebp)
 8049a13:	46 05 08 
 8049a16:	75 71                	jne    8049a89 <_svfprintf_r+0x839>
 8049a18:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 8049a1f:	74 68                	je     8049a89 <_svfprintf_r+0x839>
 8049a21:	0f b7 08             	movzwl (%eax),%ecx
 8049a24:	83 c0 04             	add    $0x4,%eax
 8049a27:	89 45 14             	mov    %eax,0x14(%ebp)
 8049a2a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049a31:	b8 02 00 00 00       	mov    $0x2,%eax
 8049a36:	0f 84 f4 fb ff ff    	je     8049630 <_svfprintf_r+0x3e0>
 8049a3c:	85 c9                	test   %ecx,%ecx
 8049a3e:	0f 84 ec fb ff ff    	je     8049630 <_svfprintf_r+0x3e0>
 8049a44:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
 8049a4b:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 8049a52:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 8049a59:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
 8049a5f:	e9 cc fb ff ff       	jmp    8049630 <_svfprintf_r+0x3e0>
 8049a64:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049a6b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049a71:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a74:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049a77:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049a7d:	c7 85 18 ff ff ff fc 	movl   $0x80545fc,-0xe8(%ebp)
 8049a84:	45 05 08 
 8049a87:	74 8f                	je     8049a18 <_svfprintf_r+0x7c8>
 8049a89:	8b 08                	mov    (%eax),%ecx
 8049a8b:	83 c0 04             	add    $0x4,%eax
 8049a8e:	89 45 14             	mov    %eax,0x14(%ebp)
 8049a91:	eb 97                	jmp    8049a2a <_svfprintf_r+0x7da>
 8049a93:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049a99:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a9c:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049a9f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049aa6:	8b 00                	mov    (%eax),%eax
 8049aa8:	88 45 80             	mov    %al,-0x80(%ebp)
 8049aab:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aae:	83 c0 04             	add    $0x4,%eax
 8049ab1:	89 45 14             	mov    %eax,0x14(%ebp)
 8049ab4:	8d 45 80             	lea    -0x80(%ebp),%eax
 8049ab7:	31 db                	xor    %ebx,%ebx
 8049ab9:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
 8049ac0:	00 00 00 
 8049ac3:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 8049aca:	00 00 00 
 8049acd:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8049ad4:	00 00 00 
 8049ad7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 8049ade:	00 00 00 
 8049ae1:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049ae7:	e9 07 fa ff ff       	jmp    80494f3 <_svfprintf_r+0x2a3>
 8049aec:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 8049af3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 8049afa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049b00:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b03:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049b06:	0f 84 03 fb ff ff    	je     804960f <_svfprintf_r+0x3bf>
 8049b0c:	8b 08                	mov    (%eax),%ecx
 8049b0e:	83 c0 04             	add    $0x4,%eax
 8049b11:	89 45 14             	mov    %eax,0x14(%ebp)
 8049b14:	b8 01 00 00 00       	mov    $0x1,%eax
 8049b19:	e9 12 fb ff ff       	jmp    8049630 <_svfprintf_r+0x3e0>
 8049b1e:	85 c0                	test   %eax,%eax
 8049b20:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 8049b26:	89 4d 10             	mov    %ecx,0x10(%ebp)
 8049b29:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 8049b2f:	0f 84 c3 f8 ff ff    	je     80493f8 <_svfprintf_r+0x1a8>
 8049b35:	88 45 80             	mov    %al,-0x80(%ebp)
 8049b38:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 8049b3f:	e9 70 ff ff ff       	jmp    8049ab4 <_svfprintf_r+0x864>
 8049b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049b48:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049b4e:	84 db                	test   %bl,%bl
 8049b50:	74 33                	je     8049b85 <_svfprintf_r+0x935>
 8049b52:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
 8049b58:	83 c1 01             	add    $0x1,%ecx
 8049b5b:	89 07                	mov    %eax,(%edi)
 8049b5d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049b63:	83 c7 08             	add    $0x8,%edi
 8049b66:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 8049b6d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049b73:	83 c0 01             	add    $0x1,%eax
 8049b76:	83 f8 07             	cmp    $0x7,%eax
 8049b79:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049b7f:	0f 8f 7b 06 00 00    	jg     804a200 <_svfprintf_r+0xfb0>
 8049b85:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
 8049b8b:	85 db                	test   %ebx,%ebx
 8049b8d:	74 33                	je     8049bc2 <_svfprintf_r+0x972>
 8049b8f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
 8049b95:	83 c1 02             	add    $0x2,%ecx
 8049b98:	89 07                	mov    %eax,(%edi)
 8049b9a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049ba0:	83 c7 08             	add    $0x8,%edi
 8049ba3:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
 8049baa:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049bb0:	83 c0 01             	add    $0x1,%eax
 8049bb3:	83 f8 07             	cmp    $0x7,%eax
 8049bb6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049bbc:	0f 8f 06 06 00 00    	jg     804a1c8 <_svfprintf_r+0xf78>
 8049bc2:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
 8049bc9:	00 00 00 
 8049bcc:	0f 84 c6 03 00 00    	je     8049f98 <_svfprintf_r+0xd48>
 8049bd2:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 8049bd8:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
 8049bde:	85 f6                	test   %esi,%esi
 8049be0:	0f 8e d2 00 00 00    	jle    8049cb8 <_svfprintf_r+0xa68>
 8049be6:	83 fe 10             	cmp    $0x10,%esi
 8049be9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049bef:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049bf5:	7f 11                	jg     8049c08 <_svfprintf_r+0x9b8>
 8049bf7:	eb 6b                	jmp    8049c64 <_svfprintf_r+0xa14>
 8049bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049c00:	83 ee 10             	sub    $0x10,%esi
 8049c03:	83 fe 10             	cmp    $0x10,%esi
 8049c06:	7e 5c                	jle    8049c64 <_svfprintf_r+0xa14>
 8049c08:	83 c0 01             	add    $0x1,%eax
 8049c0b:	83 c1 10             	add    $0x10,%ecx
 8049c0e:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 8049c14:	83 c7 08             	add    $0x8,%edi
 8049c17:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049c1e:	83 f8 07             	cmp    $0x7,%eax
 8049c21:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049c27:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049c2d:	7e d1                	jle    8049c00 <_svfprintf_r+0x9b0>
 8049c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c32:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049c36:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c3a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c3d:	89 04 24             	mov    %eax,(%esp)
 8049c40:	e8 7b 70 00 00       	call   8050cc0 <__ssprint_r>
 8049c45:	85 c0                	test   %eax,%eax
 8049c47:	0f 85 d3 f7 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 8049c4d:	83 ee 10             	sub    $0x10,%esi
 8049c50:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049c56:	83 fe 10             	cmp    $0x10,%esi
 8049c59:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049c5f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049c62:	7f a4                	jg     8049c08 <_svfprintf_r+0x9b8>
 8049c64:	83 c0 01             	add    $0x1,%eax
 8049c67:	01 f1                	add    %esi,%ecx
 8049c69:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 8049c6f:	83 c7 08             	add    $0x8,%edi
 8049c72:	89 77 fc             	mov    %esi,-0x4(%edi)
 8049c75:	83 f8 07             	cmp    $0x7,%eax
 8049c78:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049c7e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049c84:	7e 32                	jle    8049cb8 <_svfprintf_r+0xa68>
 8049c86:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049c8c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c90:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c93:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c97:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c9a:	89 04 24             	mov    %eax,(%esp)
 8049c9d:	e8 1e 70 00 00       	call   8050cc0 <__ssprint_r>
 8049ca2:	85 c0                	test   %eax,%eax
 8049ca4:	0f 85 76 f7 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 8049caa:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049cb0:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049cb3:	90                   	nop
 8049cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049cb8:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
 8049cbf:	01 00 00 
 8049cc2:	0f 85 50 01 00 00    	jne    8049e18 <_svfprintf_r+0xbc8>
 8049cc8:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 8049cce:	89 07                	mov    %eax,(%edi)
 8049cd0:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
 8049cd6:	01 c1                	add    %eax,%ecx
 8049cd8:	89 47 04             	mov    %eax,0x4(%edi)
 8049cdb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049ce1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049ce7:	83 c0 01             	add    $0x1,%eax
 8049cea:	83 f8 07             	cmp    $0x7,%eax
 8049ced:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049cf3:	0f 8f 6a 04 00 00    	jg     804a163 <_svfprintf_r+0xf13>
 8049cf9:	83 c7 08             	add    $0x8,%edi
 8049cfc:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
 8049d03:	0f 84 d7 00 00 00    	je     8049de0 <_svfprintf_r+0xb90>
 8049d09:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049d0f:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049d15:	85 f6                	test   %esi,%esi
 8049d17:	0f 8e c3 00 00 00    	jle    8049de0 <_svfprintf_r+0xb90>
 8049d1d:	83 fe 10             	cmp    $0x10,%esi
 8049d20:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049d26:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049d2c:	7f 0a                	jg     8049d38 <_svfprintf_r+0xae8>
 8049d2e:	eb 64                	jmp    8049d94 <_svfprintf_r+0xb44>
 8049d30:	83 ee 10             	sub    $0x10,%esi
 8049d33:	83 fe 10             	cmp    $0x10,%esi
 8049d36:	7e 5c                	jle    8049d94 <_svfprintf_r+0xb44>
 8049d38:	83 c0 01             	add    $0x1,%eax
 8049d3b:	83 c1 10             	add    $0x10,%ecx
 8049d3e:	c7 07 9c 47 05 08    	movl   $0x805479c,(%edi)
 8049d44:	83 c7 08             	add    $0x8,%edi
 8049d47:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049d4e:	83 f8 07             	cmp    $0x7,%eax
 8049d51:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049d57:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049d5d:	7e d1                	jle    8049d30 <_svfprintf_r+0xae0>
 8049d5f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049d62:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049d66:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049d6a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d6d:	89 04 24             	mov    %eax,(%esp)
 8049d70:	e8 4b 6f 00 00       	call   8050cc0 <__ssprint_r>
 8049d75:	85 c0                	test   %eax,%eax
 8049d77:	0f 85 a3 f6 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 8049d7d:	83 ee 10             	sub    $0x10,%esi
 8049d80:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049d86:	83 fe 10             	cmp    $0x10,%esi
 8049d89:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049d8f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049d92:	7f a4                	jg     8049d38 <_svfprintf_r+0xae8>
 8049d94:	83 c0 01             	add    $0x1,%eax
 8049d97:	01 f1                	add    %esi,%ecx
 8049d99:	83 f8 07             	cmp    $0x7,%eax
 8049d9c:	c7 07 9c 47 05 08    	movl   $0x805479c,(%edi)
 8049da2:	89 77 04             	mov    %esi,0x4(%edi)
 8049da5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049dab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049db1:	7e 2d                	jle    8049de0 <_svfprintf_r+0xb90>
 8049db3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8049db9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049dbd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049dc0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dc4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dc7:	89 04 24             	mov    %eax,(%esp)
 8049dca:	e8 f1 6e 00 00       	call   8050cc0 <__ssprint_r>
 8049dcf:	85 c0                	test   %eax,%eax
 8049dd1:	0f 85 49 f6 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 8049dd7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049ddd:	8d 76 00             	lea    0x0(%esi),%esi
 8049de0:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
 8049de6:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
 8049dec:	39 c2                	cmp    %eax,%edx
 8049dee:	0f 4d c2             	cmovge %edx,%eax
 8049df1:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
 8049df7:	85 c9                	test   %ecx,%ecx
 8049df9:	0f 85 99 03 00 00    	jne    804a198 <_svfprintf_r+0xf48>
 8049dff:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8049e06:	00 00 00 
 8049e09:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049e0c:	e9 da f4 ff ff       	jmp    80492eb <_svfprintf_r+0x9b>
 8049e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049e18:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 8049e1f:	0f 8e 5b 02 00 00    	jle    804a080 <_svfprintf_r+0xe30>
 8049e25:	d9 ee                	fldz   
 8049e27:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 8049e2d:	df e9                	fucomip %st(1),%st
 8049e2f:	dd d8                	fstp   %st(0)
 8049e31:	0f 8a 59 04 00 00    	jp     804a290 <_svfprintf_r+0x1040>
 8049e37:	0f 85 53 04 00 00    	jne    804a290 <_svfprintf_r+0x1040>
 8049e3d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049e43:	83 c1 01             	add    $0x1,%ecx
 8049e46:	83 c7 08             	add    $0x8,%edi
 8049e49:	c7 47 f8 e7 42 05 08 	movl   $0x80542e7,-0x8(%edi)
 8049e50:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 8049e57:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049e5d:	83 c0 01             	add    $0x1,%eax
 8049e60:	83 f8 07             	cmp    $0x7,%eax
 8049e63:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049e69:	0f 8f 63 09 00 00    	jg     804a7d2 <_svfprintf_r+0x1582>
 8049e6f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 8049e75:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
 8049e7b:	7c 0d                	jl     8049e8a <_svfprintf_r+0xc3a>
 8049e7d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049e84:	0f 84 72 fe ff ff    	je     8049cfc <_svfprintf_r+0xaac>
 8049e8a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 8049e90:	83 c7 08             	add    $0x8,%edi
 8049e93:	89 47 f8             	mov    %eax,-0x8(%edi)
 8049e96:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 8049e9c:	89 47 fc             	mov    %eax,-0x4(%edi)
 8049e9f:	01 c1                	add    %eax,%ecx
 8049ea1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049ea7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049ead:	83 c0 01             	add    $0x1,%eax
 8049eb0:	83 f8 07             	cmp    $0x7,%eax
 8049eb3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049eb9:	0f 8f dc 0b 00 00    	jg     804aa9b <_svfprintf_r+0x184b>
 8049ebf:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 8049ec5:	8d 70 ff             	lea    -0x1(%eax),%esi
 8049ec8:	85 f6                	test   %esi,%esi
 8049eca:	0f 8e 2c fe ff ff    	jle    8049cfc <_svfprintf_r+0xaac>
 8049ed0:	83 fe 10             	cmp    $0x10,%esi
 8049ed3:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049ed9:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049edf:	7f 13                	jg     8049ef4 <_svfprintf_r+0xca4>
 8049ee1:	e9 e6 05 00 00       	jmp    804a4cc <_svfprintf_r+0x127c>
 8049ee6:	66 90                	xchg   %ax,%ax
 8049ee8:	83 ee 10             	sub    $0x10,%esi
 8049eeb:	83 fe 10             	cmp    $0x10,%esi
 8049eee:	0f 8e d8 05 00 00    	jle    804a4cc <_svfprintf_r+0x127c>
 8049ef4:	83 c0 01             	add    $0x1,%eax
 8049ef7:	83 c1 10             	add    $0x10,%ecx
 8049efa:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 8049f00:	83 c7 08             	add    $0x8,%edi
 8049f03:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049f0a:	83 f8 07             	cmp    $0x7,%eax
 8049f0d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049f13:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049f19:	7e cd                	jle    8049ee8 <_svfprintf_r+0xc98>
 8049f1b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049f1e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049f22:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049f26:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f29:	89 04 24             	mov    %eax,(%esp)
 8049f2c:	e8 8f 6d 00 00       	call   8050cc0 <__ssprint_r>
 8049f31:	85 c0                	test   %eax,%eax
 8049f33:	0f 85 e7 f4 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 8049f39:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 8049f3f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 8049f42:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049f48:	eb 9e                	jmp    8049ee8 <_svfprintf_r+0xc98>
 8049f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049f50:	84 c0                	test   %al,%al
 8049f52:	75 2c                	jne    8049f80 <_svfprintf_r+0xd30>
 8049f54:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 8049f5b:	74 23                	je     8049f80 <_svfprintf_r+0xd30>
 8049f5d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 8049f63:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 8049f67:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 8049f6d:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8049f70:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049f76:	e9 2d f7 ff ff       	jmp    80496a8 <_svfprintf_r+0x458>
 8049f7b:	90                   	nop
 8049f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049f80:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049f83:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
 8049f8a:	00 00 00 
 8049f8d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 8049f93:	e9 10 f7 ff ff       	jmp    80496a8 <_svfprintf_r+0x458>
 8049f98:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 8049f9e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 8049fa4:	85 f6                	test   %esi,%esi
 8049fa6:	0f 8e 26 fc ff ff    	jle    8049bd2 <_svfprintf_r+0x982>
 8049fac:	83 fe 10             	cmp    $0x10,%esi
 8049faf:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8049fb5:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 8049fbb:	7f 0b                	jg     8049fc8 <_svfprintf_r+0xd78>
 8049fbd:	eb 65                	jmp    804a024 <_svfprintf_r+0xdd4>
 8049fbf:	90                   	nop
 8049fc0:	83 ee 10             	sub    $0x10,%esi
 8049fc3:	83 fe 10             	cmp    $0x10,%esi
 8049fc6:	7e 5c                	jle    804a024 <_svfprintf_r+0xdd4>
 8049fc8:	83 c0 01             	add    $0x1,%eax
 8049fcb:	83 c1 10             	add    $0x10,%ecx
 8049fce:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 8049fd4:	83 c7 08             	add    $0x8,%edi
 8049fd7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 8049fde:	83 f8 07             	cmp    $0x7,%eax
 8049fe1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 8049fe7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8049fed:	7e d1                	jle    8049fc0 <_svfprintf_r+0xd70>
 8049fef:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ff2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049ff6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ffa:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ffd:	89 04 24             	mov    %eax,(%esp)
 804a000:	e8 bb 6c 00 00       	call   8050cc0 <__ssprint_r>
 804a005:	85 c0                	test   %eax,%eax
 804a007:	0f 85 13 f4 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a00d:	83 ee 10             	sub    $0x10,%esi
 804a010:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a016:	83 fe 10             	cmp    $0x10,%esi
 804a019:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a01f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a022:	7f a4                	jg     8049fc8 <_svfprintf_r+0xd78>
 804a024:	83 c0 01             	add    $0x1,%eax
 804a027:	01 f1                	add    %esi,%ecx
 804a029:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a02f:	83 c7 08             	add    $0x8,%edi
 804a032:	89 77 fc             	mov    %esi,-0x4(%edi)
 804a035:	83 f8 07             	cmp    $0x7,%eax
 804a038:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a03e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a044:	0f 8e 88 fb ff ff    	jle    8049bd2 <_svfprintf_r+0x982>
 804a04a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a050:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a054:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a057:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a05b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a05e:	89 04 24             	mov    %eax,(%esp)
 804a061:	e8 5a 6c 00 00       	call   8050cc0 <__ssprint_r>
 804a066:	85 c0                	test   %eax,%eax
 804a068:	0f 85 b2 f3 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a06e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a074:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a077:	e9 56 fb ff ff       	jmp    8049bd2 <_svfprintf_r+0x982>
 804a07c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a080:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
 804a087:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804a08d:	0f 8e df 05 00 00    	jle    804a672 <_svfprintf_r+0x1422>
 804a093:	89 07                	mov    %eax,(%edi)
 804a095:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a09b:	8d 51 01             	lea    0x1(%ecx),%edx
 804a09e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804a0a5:	83 c7 08             	add    $0x8,%edi
 804a0a8:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a0ae:	83 c0 01             	add    $0x1,%eax
 804a0b1:	83 f8 07             	cmp    $0x7,%eax
 804a0b4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a0ba:	0f 8f 59 06 00 00    	jg     804a719 <_svfprintf_r+0x14c9>
 804a0c0:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
 804a0c6:	83 c0 01             	add    $0x1,%eax
 804a0c9:	83 c7 08             	add    $0x8,%edi
 804a0cc:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a0d2:	89 5f f8             	mov    %ebx,-0x8(%edi)
 804a0d5:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
 804a0db:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804a0de:	01 da                	add    %ebx,%edx
 804a0e0:	83 f8 07             	cmp    $0x7,%eax
 804a0e3:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a0e9:	0f 8f f2 05 00 00    	jg     804a6e1 <_svfprintf_r+0x1491>
 804a0ef:	d9 ee                	fldz   
 804a0f1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a0f7:	df e9                	fucomip %st(1),%st
 804a0f9:	dd d8                	fstp   %st(0)
 804a0fb:	7a 06                	jp     804a103 <_svfprintf_r+0xeb3>
 804a0fd:	0f 84 33 03 00 00    	je     804a436 <_svfprintf_r+0x11e6>
 804a103:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
 804a109:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804a10f:	83 c1 01             	add    $0x1,%ecx
 804a112:	89 0f                	mov    %ecx,(%edi)
 804a114:	8d 4b ff             	lea    -0x1(%ebx),%ecx
 804a117:	89 4f 04             	mov    %ecx,0x4(%edi)
 804a11a:	01 ca                	add    %ecx,%edx
 804a11c:	83 c0 01             	add    $0x1,%eax
 804a11f:	83 f8 07             	cmp    $0x7,%eax
 804a122:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a128:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a12e:	0f 8f 75 05 00 00    	jg     804a6a9 <_svfprintf_r+0x1459>
 804a134:	83 c7 08             	add    $0x8,%edi
 804a137:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
 804a13d:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
 804a143:	89 0f                	mov    %ecx,(%edi)
 804a145:	89 5f 04             	mov    %ebx,0x4(%edi)
 804a148:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
 804a14b:	83 c0 01             	add    $0x1,%eax
 804a14e:	83 f8 07             	cmp    $0x7,%eax
 804a151:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a157:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a15d:	0f 8e 96 fb ff ff    	jle    8049cf9 <_svfprintf_r+0xaa9>
 804a163:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a169:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a16d:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a170:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a174:	8b 45 08             	mov    0x8(%ebp),%eax
 804a177:	89 04 24             	mov    %eax,(%esp)
 804a17a:	e8 41 6b 00 00       	call   8050cc0 <__ssprint_r>
 804a17f:	85 c0                	test   %eax,%eax
 804a181:	0f 85 99 f2 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a187:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a18d:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a190:	e9 67 fb ff ff       	jmp    8049cfc <_svfprintf_r+0xaac>
 804a195:	8d 76 00             	lea    0x0(%esi),%esi
 804a198:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a19e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a1a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1ac:	89 04 24             	mov    %eax,(%esp)
 804a1af:	e8 0c 6b 00 00       	call   8050cc0 <__ssprint_r>
 804a1b4:	85 c0                	test   %eax,%eax
 804a1b6:	0f 84 43 fc ff ff    	je     8049dff <_svfprintf_r+0xbaf>
 804a1bc:	e9 5f f2 ff ff       	jmp    8049420 <_svfprintf_r+0x1d0>
 804a1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804a1c8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a1ce:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a1d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1dc:	89 04 24             	mov    %eax,(%esp)
 804a1df:	e8 dc 6a 00 00       	call   8050cc0 <__ssprint_r>
 804a1e4:	85 c0                	test   %eax,%eax
 804a1e6:	0f 85 34 f2 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a1ec:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a1f2:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a1f5:	e9 c8 f9 ff ff       	jmp    8049bc2 <_svfprintf_r+0x972>
 804a1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a200:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a206:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a20d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a211:	8b 45 08             	mov    0x8(%ebp),%eax
 804a214:	89 04 24             	mov    %eax,(%esp)
 804a217:	e8 a4 6a 00 00       	call   8050cc0 <__ssprint_r>
 804a21c:	85 c0                	test   %eax,%eax
 804a21e:	0f 85 fc f1 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a224:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a22a:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a22d:	e9 53 f9 ff ff       	jmp    8049b85 <_svfprintf_r+0x935>
 804a232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a238:	89 c2                	mov    %eax,%edx
 804a23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a240:	89 c8                	mov    %ecx,%eax
 804a242:	83 ea 01             	sub    $0x1,%edx
 804a245:	83 e0 07             	and    $0x7,%eax
 804a248:	c1 e9 03             	shr    $0x3,%ecx
 804a24b:	83 c0 30             	add    $0x30,%eax
 804a24e:	85 c9                	test   %ecx,%ecx
 804a250:	88 02                	mov    %al,(%edx)
 804a252:	75 ec                	jne    804a240 <_svfprintf_r+0xff0>
 804a254:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a25b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
 804a261:	0f 84 5b 01 00 00    	je     804a3c2 <_svfprintf_r+0x1172>
 804a267:	3c 30                	cmp    $0x30,%al
 804a269:	74 0b                	je     804a276 <_svfprintf_r+0x1026>
 804a26b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
 804a272:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 804a276:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a279:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 804a27f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a285:	e9 1e f4 ff ff       	jmp    80496a8 <_svfprintf_r+0x458>
 804a28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a290:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804a296:	85 db                	test   %ebx,%ebx
 804a298:	0f 8e 66 05 00 00    	jle    804a804 <_svfprintf_r+0x15b4>
 804a29e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804a2a4:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804a2aa:	01 d0                	add    %edx,%eax
 804a2ac:	89 c3                	mov    %eax,%ebx
 804a2ae:	29 d3                	sub    %edx,%ebx
 804a2b0:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804a2b6:	89 d0                	mov    %edx,%eax
 804a2b8:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804a2be:	39 d3                	cmp    %edx,%ebx
 804a2c0:	0f 4f da             	cmovg  %edx,%ebx
 804a2c3:	85 db                	test   %ebx,%ebx
 804a2c5:	7e 28                	jle    804a2ef <_svfprintf_r+0x109f>
 804a2c7:	89 07                	mov    %eax,(%edi)
 804a2c9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a2cf:	01 d9                	add    %ebx,%ecx
 804a2d1:	89 5f 04             	mov    %ebx,0x4(%edi)
 804a2d4:	83 c7 08             	add    $0x8,%edi
 804a2d7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a2dd:	83 c0 01             	add    $0x1,%eax
 804a2e0:	83 f8 07             	cmp    $0x7,%eax
 804a2e3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a2e9:	0f 8f 58 09 00 00    	jg     804ac47 <_svfprintf_r+0x19f7>
 804a2ef:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
 804a2f5:	31 c0                	xor    %eax,%eax
 804a2f7:	85 db                	test   %ebx,%ebx
 804a2f9:	0f 49 c3             	cmovns %ebx,%eax
 804a2fc:	29 c6                	sub    %eax,%esi
 804a2fe:	85 f6                	test   %esi,%esi
 804a300:	0f 8e 40 02 00 00    	jle    804a546 <_svfprintf_r+0x12f6>
 804a306:	83 fe 10             	cmp    $0x10,%esi
 804a309:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a30f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a315:	7f 15                	jg     804a32c <_svfprintf_r+0x10dc>
 804a317:	e9 db 01 00 00       	jmp    804a4f7 <_svfprintf_r+0x12a7>
 804a31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a320:	83 ee 10             	sub    $0x10,%esi
 804a323:	83 fe 10             	cmp    $0x10,%esi
 804a326:	0f 8e cb 01 00 00    	jle    804a4f7 <_svfprintf_r+0x12a7>
 804a32c:	83 c0 01             	add    $0x1,%eax
 804a32f:	83 c1 10             	add    $0x10,%ecx
 804a332:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a338:	83 c7 08             	add    $0x8,%edi
 804a33b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a342:	83 f8 07             	cmp    $0x7,%eax
 804a345:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a34b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a351:	7e cd                	jle    804a320 <_svfprintf_r+0x10d0>
 804a353:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a356:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a35a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a35e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a361:	89 04 24             	mov    %eax,(%esp)
 804a364:	e8 57 69 00 00       	call   8050cc0 <__ssprint_r>
 804a369:	85 c0                	test   %eax,%eax
 804a36b:	0f 85 af f0 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a371:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a377:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a37a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a380:	eb 9e                	jmp    804a320 <_svfprintf_r+0x10d0>
 804a382:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a385:	be cd cc cc cc       	mov    $0xcccccccd,%esi
 804a38a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804a390:	89 c7                	mov    %eax,%edi
 804a392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a398:	89 c8                	mov    %ecx,%eax
 804a39a:	83 ef 01             	sub    $0x1,%edi
 804a39d:	f7 e6                	mul    %esi
 804a39f:	c1 ea 03             	shr    $0x3,%edx
 804a3a2:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804a3a5:	01 c0                	add    %eax,%eax
 804a3a7:	29 c1                	sub    %eax,%ecx
 804a3a9:	83 c1 30             	add    $0x30,%ecx
 804a3ac:	85 d2                	test   %edx,%edx
 804a3ae:	88 0f                	mov    %cl,(%edi)
 804a3b0:	89 d1                	mov    %edx,%ecx
 804a3b2:	75 e4                	jne    804a398 <_svfprintf_r+0x1148>
 804a3b4:	89 fa                	mov    %edi,%edx
 804a3b6:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
 804a3bc:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804a3c2:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804a3c5:	29 d0                	sub    %edx,%eax
 804a3c7:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a3cd:	e9 d6 f2 ff ff       	jmp    80496a8 <_svfprintf_r+0x458>
 804a3d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a3d8:	83 f9 09             	cmp    $0x9,%ecx
 804a3db:	77 a5                	ja     804a382 <_svfprintf_r+0x1132>
 804a3dd:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804a3e3:	83 c1 30             	add    $0x30,%ecx
 804a3e6:	88 4d a7             	mov    %cl,-0x59(%ebp)
 804a3e9:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804a3ef:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804a3f2:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a3f8:	e9 ab f2 ff ff       	jmp    80496a8 <_svfprintf_r+0x458>
 804a3fd:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a403:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a407:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a40a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a40e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a411:	89 04 24             	mov    %eax,(%esp)
 804a414:	e8 a7 68 00 00       	call   8050cc0 <__ssprint_r>
 804a419:	85 c0                	test   %eax,%eax
 804a41b:	0f 85 ff ef ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a421:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804a428:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a42b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a431:	e9 18 f7 ff ff       	jmp    8049b4e <_svfprintf_r+0x8fe>
 804a436:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804a43c:	8d 73 ff             	lea    -0x1(%ebx),%esi
 804a43f:	85 f6                	test   %esi,%esi
 804a441:	0f 8e f0 fc ff ff    	jle    804a137 <_svfprintf_r+0xee7>
 804a447:	83 fe 10             	cmp    $0x10,%esi
 804a44a:	7e 70                	jle    804a4bc <_svfprintf_r+0x126c>
 804a44c:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a452:	eb 0c                	jmp    804a460 <_svfprintf_r+0x1210>
 804a454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804a458:	83 ee 10             	sub    $0x10,%esi
 804a45b:	83 fe 10             	cmp    $0x10,%esi
 804a45e:	7e 5c                	jle    804a4bc <_svfprintf_r+0x126c>
 804a460:	83 c0 01             	add    $0x1,%eax
 804a463:	83 c2 10             	add    $0x10,%edx
 804a466:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a46c:	83 c7 08             	add    $0x8,%edi
 804a46f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a476:	83 f8 07             	cmp    $0x7,%eax
 804a479:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a47f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a485:	7e d1                	jle    804a458 <_svfprintf_r+0x1208>
 804a487:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a48a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a48e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a492:	8b 45 08             	mov    0x8(%ebp),%eax
 804a495:	89 04 24             	mov    %eax,(%esp)
 804a498:	e8 23 68 00 00       	call   8050cc0 <__ssprint_r>
 804a49d:	85 c0                	test   %eax,%eax
 804a49f:	0f 85 7b ef ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a4a5:	83 ee 10             	sub    $0x10,%esi
 804a4a8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a4ae:	83 fe 10             	cmp    $0x10,%esi
 804a4b1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a4b7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a4ba:	7f a4                	jg     804a460 <_svfprintf_r+0x1210>
 804a4bc:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a4c2:	01 f2                	add    %esi,%edx
 804a4c4:	89 77 04             	mov    %esi,0x4(%edi)
 804a4c7:	e9 50 fc ff ff       	jmp    804a11c <_svfprintf_r+0xecc>
 804a4cc:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a4d2:	01 f1                	add    %esi,%ecx
 804a4d4:	89 77 04             	mov    %esi,0x4(%edi)
 804a4d7:	e9 6f fc ff ff       	jmp    804a14b <_svfprintf_r+0xefb>
 804a4dc:	8b 45 14             	mov    0x14(%ebp),%eax
 804a4df:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
 804a4e5:	8b 00                	mov    (%eax),%eax
 804a4e7:	89 10                	mov    %edx,(%eax)
 804a4e9:	8b 45 14             	mov    0x14(%ebp),%eax
 804a4ec:	83 c0 04             	add    $0x4,%eax
 804a4ef:	89 45 14             	mov    %eax,0x14(%ebp)
 804a4f2:	e9 f4 ed ff ff       	jmp    80492eb <_svfprintf_r+0x9b>
 804a4f7:	83 c0 01             	add    $0x1,%eax
 804a4fa:	01 f1                	add    %esi,%ecx
 804a4fc:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a502:	83 c7 08             	add    $0x8,%edi
 804a505:	89 77 fc             	mov    %esi,-0x4(%edi)
 804a508:	83 f8 07             	cmp    $0x7,%eax
 804a50b:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a511:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a517:	7e 2d                	jle    804a546 <_svfprintf_r+0x12f6>
 804a519:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a51f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a523:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a526:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a52a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a52d:	89 04 24             	mov    %eax,(%esp)
 804a530:	e8 8b 67 00 00       	call   8050cc0 <__ssprint_r>
 804a535:	85 c0                	test   %eax,%eax
 804a537:	0f 85 e3 ee ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a53d:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a543:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a546:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804a54c:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804a552:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
 804a558:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
 804a55e:	89 c6                	mov    %eax,%esi
 804a560:	7c 0d                	jl     804a56f <_svfprintf_r+0x131f>
 804a562:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a569:	0f 84 5e 05 00 00    	je     804aacd <_svfprintf_r+0x187d>
 804a56f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804a575:	89 07                	mov    %eax,(%edi)
 804a577:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 804a57d:	01 c1                	add    %eax,%ecx
 804a57f:	89 47 04             	mov    %eax,0x4(%edi)
 804a582:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a588:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a58e:	83 c0 01             	add    $0x1,%eax
 804a591:	83 f8 07             	cmp    $0x7,%eax
 804a594:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a59a:	0f 8f d9 06 00 00    	jg     804ac79 <_svfprintf_r+0x1a29>
 804a5a0:	83 c7 08             	add    $0x8,%edi
 804a5a3:	89 d0                	mov    %edx,%eax
 804a5a5:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804a5ab:	89 f2                	mov    %esi,%edx
 804a5ad:	29 f3                	sub    %esi,%ebx
 804a5af:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804a5b5:	29 c6                	sub    %eax,%esi
 804a5b7:	39 de                	cmp    %ebx,%esi
 804a5b9:	0f 4e de             	cmovle %esi,%ebx
 804a5bc:	85 db                	test   %ebx,%ebx
 804a5be:	7e 29                	jle    804a5e9 <_svfprintf_r+0x1399>
 804a5c0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a5c6:	01 d9                	add    %ebx,%ecx
 804a5c8:	83 c7 08             	add    $0x8,%edi
 804a5cb:	89 57 f8             	mov    %edx,-0x8(%edi)
 804a5ce:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804a5d1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a5d7:	83 c0 01             	add    $0x1,%eax
 804a5da:	83 f8 07             	cmp    $0x7,%eax
 804a5dd:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a5e3:	0f 8f c8 06 00 00    	jg     804acb1 <_svfprintf_r+0x1a61>
 804a5e9:	31 c0                	xor    %eax,%eax
 804a5eb:	85 db                	test   %ebx,%ebx
 804a5ed:	0f 49 c3             	cmovns %ebx,%eax
 804a5f0:	29 c6                	sub    %eax,%esi
 804a5f2:	85 f6                	test   %esi,%esi
 804a5f4:	0f 8e 02 f7 ff ff    	jle    8049cfc <_svfprintf_r+0xaac>
 804a5fa:	83 fe 10             	cmp    $0x10,%esi
 804a5fd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a603:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804a609:	7f 11                	jg     804a61c <_svfprintf_r+0x13cc>
 804a60b:	e9 bc fe ff ff       	jmp    804a4cc <_svfprintf_r+0x127c>
 804a610:	83 ee 10             	sub    $0x10,%esi
 804a613:	83 fe 10             	cmp    $0x10,%esi
 804a616:	0f 8e b0 fe ff ff    	jle    804a4cc <_svfprintf_r+0x127c>
 804a61c:	83 c0 01             	add    $0x1,%eax
 804a61f:	83 c1 10             	add    $0x10,%ecx
 804a622:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a628:	83 c7 08             	add    $0x8,%edi
 804a62b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a632:	83 f8 07             	cmp    $0x7,%eax
 804a635:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a63b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a641:	7e cd                	jle    804a610 <_svfprintf_r+0x13c0>
 804a643:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a646:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804a64a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a64e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a651:	89 04 24             	mov    %eax,(%esp)
 804a654:	e8 67 66 00 00       	call   8050cc0 <__ssprint_r>
 804a659:	85 c0                	test   %eax,%eax
 804a65b:	0f 85 bf ed ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a661:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a667:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a66a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a670:	eb 9e                	jmp    804a610 <_svfprintf_r+0x13c0>
 804a672:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a679:	0f 85 14 fa ff ff    	jne    804a093 <_svfprintf_r+0xe43>
 804a67f:	89 07                	mov    %eax,(%edi)
 804a681:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a687:	8d 51 01             	lea    0x1(%ecx),%edx
 804a68a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804a691:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a697:	83 c0 01             	add    $0x1,%eax
 804a69a:	83 f8 07             	cmp    $0x7,%eax
 804a69d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a6a3:	0f 8e 8b fa ff ff    	jle    804a134 <_svfprintf_r+0xee4>
 804a6a9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a6af:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a6b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a6ba:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6bd:	89 04 24             	mov    %eax,(%esp)
 804a6c0:	e8 fb 65 00 00       	call   8050cc0 <__ssprint_r>
 804a6c5:	85 c0                	test   %eax,%eax
 804a6c7:	0f 85 53 ed ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a6cd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a6d3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a6d6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a6dc:	e9 56 fa ff ff       	jmp    804a137 <_svfprintf_r+0xee7>
 804a6e1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a6e7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a6eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6f5:	89 04 24             	mov    %eax,(%esp)
 804a6f8:	e8 c3 65 00 00       	call   8050cc0 <__ssprint_r>
 804a6fd:	85 c0                	test   %eax,%eax
 804a6ff:	0f 85 1b ed ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a705:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a70b:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a70e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a714:	e9 d6 f9 ff ff       	jmp    804a0ef <_svfprintf_r+0xe9f>
 804a719:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a71f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a723:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a726:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a72a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a72d:	89 04 24             	mov    %eax,(%esp)
 804a730:	e8 8b 65 00 00       	call   8050cc0 <__ssprint_r>
 804a735:	85 c0                	test   %eax,%eax
 804a737:	0f 85 e3 ec ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a73d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a743:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a746:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a74c:	e9 6f f9 ff ff       	jmp    804a0c0 <_svfprintf_r+0xe70>
 804a751:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a757:	dd 1c 24             	fstpl  (%esp)
 804a75a:	e8 41 63 00 00       	call   8050aa0 <__fpclassifyd>
 804a75f:	85 c0                	test   %eax,%eax
 804a761:	0f 85 a3 01 00 00    	jne    804a90a <_svfprintf_r+0x16ba>
 804a767:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804a76e:	ba f4 45 05 08       	mov    $0x80545f4,%edx
 804a773:	b8 f8 45 05 08       	mov    $0x80545f8,%eax
 804a778:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804a77f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804a786:	00 00 00 
 804a789:	0f 4e c2             	cmovle %edx,%eax
 804a78c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a792:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804a799:	ff ff ff 
 804a79c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804a7a3:	00 00 00 
 804a7a6:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804a7ad:	00 00 00 
 804a7b0:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804a7b7:	00 00 00 
 804a7ba:	e9 29 ed ff ff       	jmp    80494e8 <_svfprintf_r+0x298>
 804a7bf:	dd 00                	fldl   (%eax)
 804a7c1:	83 c0 08             	add    $0x8,%eax
 804a7c4:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804a7ca:	89 45 14             	mov    %eax,0x14(%ebp)
 804a7cd:	e9 e6 ef ff ff       	jmp    80497b8 <_svfprintf_r+0x568>
 804a7d2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804a7d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a7dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a7df:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7e6:	89 04 24             	mov    %eax,(%esp)
 804a7e9:	e8 d2 64 00 00       	call   8050cc0 <__ssprint_r>
 804a7ee:	85 c0                	test   %eax,%eax
 804a7f0:	0f 85 2a ec ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a7f6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804a7fc:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a7ff:	e9 6b f6 ff ff       	jmp    8049e6f <_svfprintf_r+0xc1f>
 804a804:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a80a:	83 c1 01             	add    $0x1,%ecx
 804a80d:	83 c7 08             	add    $0x8,%edi
 804a810:	c7 47 f8 e7 42 05 08 	movl   $0x80542e7,-0x8(%edi)
 804a817:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804a81e:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804a824:	83 c0 01             	add    $0x1,%eax
 804a827:	83 f8 07             	cmp    $0x7,%eax
 804a82a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a830:	0f 8f ef 02 00 00    	jg     804ab25 <_svfprintf_r+0x18d5>
 804a836:	85 db                	test   %ebx,%ebx
 804a838:	75 17                	jne    804a851 <_svfprintf_r+0x1601>
 804a83a:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
 804a840:	85 d2                	test   %edx,%edx
 804a842:	75 0d                	jne    804a851 <_svfprintf_r+0x1601>
 804a844:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804a84b:	0f 84 ab f4 ff ff    	je     8049cfc <_svfprintf_r+0xaac>
 804a851:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804a857:	83 c7 08             	add    $0x8,%edi
 804a85a:	89 47 f8             	mov    %eax,-0x8(%edi)
 804a85d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
 804a863:	89 47 fc             	mov    %eax,-0x4(%edi)
 804a866:	8d 14 01             	lea    (%ecx,%eax,1),%edx
 804a869:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a86f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a875:	83 c0 01             	add    $0x1,%eax
 804a878:	83 f8 07             	cmp    $0x7,%eax
 804a87b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a881:	0f 8f 60 03 00 00    	jg     804abe7 <_svfprintf_r+0x1997>
 804a887:	f7 db                	neg    %ebx
 804a889:	85 db                	test   %ebx,%ebx
 804a88b:	0f 8e 21 03 00 00    	jle    804abb2 <_svfprintf_r+0x1962>
 804a891:	83 fb 10             	cmp    $0x10,%ebx
 804a894:	0f 8e c3 02 00 00    	jle    804ab5d <_svfprintf_r+0x190d>
 804a89a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
 804a8a0:	eb 12                	jmp    804a8b4 <_svfprintf_r+0x1664>
 804a8a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a8a8:	83 eb 10             	sub    $0x10,%ebx
 804a8ab:	83 fb 10             	cmp    $0x10,%ebx
 804a8ae:	0f 8e a9 02 00 00    	jle    804ab5d <_svfprintf_r+0x190d>
 804a8b4:	83 c0 01             	add    $0x1,%eax
 804a8b7:	83 c2 10             	add    $0x10,%edx
 804a8ba:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804a8c0:	83 c7 08             	add    $0x8,%edi
 804a8c3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804a8ca:	83 f8 07             	cmp    $0x7,%eax
 804a8cd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804a8d3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804a8d9:	7e cd                	jle    804a8a8 <_svfprintf_r+0x1658>
 804a8db:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a8de:	89 74 24 08          	mov    %esi,0x8(%esp)
 804a8e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a8e6:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8e9:	89 04 24             	mov    %eax,(%esp)
 804a8ec:	e8 cf 63 00 00       	call   8050cc0 <__ssprint_r>
 804a8f1:	85 c0                	test   %eax,%eax
 804a8f3:	0f 85 27 eb ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804a8f9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804a8ff:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804a902:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804a908:	eb 9e                	jmp    804a8a8 <_svfprintf_r+0x1658>
 804a90a:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
 804a910:	83 e3 df             	and    $0xffffffdf,%ebx
 804a913:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
 804a91a:	0f 84 05 03 00 00    	je     804ac25 <_svfprintf_r+0x19d5>
 804a920:	83 fb 47             	cmp    $0x47,%ebx
 804a923:	75 16                	jne    804a93b <_svfprintf_r+0x16eb>
 804a925:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804a92b:	b8 01 00 00 00       	mov    $0x1,%eax
 804a930:	85 d2                	test   %edx,%edx
 804a932:	0f 45 c2             	cmovne %edx,%eax
 804a935:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804a93b:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804a941:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804a947:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
 804a94d:	80 cc 01             	or     $0x1,%ah
 804a950:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
 804a956:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 804a95c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
 804a963:	85 c0                	test   %eax,%eax
 804a965:	0f 88 ba 05 00 00    	js     804af25 <_svfprintf_r+0x1cd5>
 804a96b:	83 fb 46             	cmp    $0x46,%ebx
 804a96e:	0f 94 c0             	sete   %al
 804a971:	89 c6                	mov    %eax,%esi
 804a973:	0f 84 d4 03 00 00    	je     804ad4d <_svfprintf_r+0x1afd>
 804a979:	83 fb 45             	cmp    $0x45,%ebx
 804a97c:	0f 85 99 05 00 00    	jne    804af1b <_svfprintf_r+0x1ccb>
 804a982:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804a988:	dd 54 24 04          	fstl   0x4(%esp)
 804a98c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 804a993:	00 
 804a994:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804a99a:	8d 70 01             	lea    0x1(%eax),%esi
 804a99d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804a9a3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804a9a7:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804a9ad:	89 44 24 18          	mov    %eax,0x18(%esp)
 804a9b1:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804a9b7:	89 44 24 14          	mov    %eax,0x14(%esp)
 804a9bb:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9be:	89 74 24 10          	mov    %esi,0x10(%esp)
 804a9c2:	89 04 24             	mov    %eax,(%esp)
 804a9c5:	e8 06 2b 00 00       	call   804d4d0 <_dtoa_r>
 804a9ca:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804a9d0:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
 804a9d3:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804a9d9:	d9 ee                	fldz   
 804a9db:	d9 c9                	fxch   %st(1)
 804a9dd:	df e9                	fucomip %st(1),%st
 804a9df:	dd d8                	fstp   %st(0)
 804a9e1:	0f 8a fd 00 00 00    	jp     804aae4 <_svfprintf_r+0x1894>
 804a9e7:	89 c8                	mov    %ecx,%eax
 804a9e9:	0f 85 f5 00 00 00    	jne    804aae4 <_svfprintf_r+0x1894>
 804a9ef:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
 804a9f5:	83 fb 47             	cmp    $0x47,%ebx
 804a9f8:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804a9fe:	0f 84 1e 04 00 00    	je     804ae22 <_svfprintf_r+0x1bd2>
 804aa04:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804aa0b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804aa11:	0f 8e 65 04 00 00    	jle    804ae7c <_svfprintf_r+0x1c2c>
 804aa17:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
 804aa1e:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804aa24:	0f 84 3c 05 00 00    	je     804af66 <_svfprintf_r+0x1d16>
 804aa2a:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
 804aa30:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
 804aa36:	0f 8f f7 04 00 00    	jg     804af33 <_svfprintf_r+0x1ce3>
 804aa3c:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804aa42:	83 e0 01             	and    $0x1,%eax
 804aa45:	0f 85 e2 05 00 00    	jne    804b02d <_svfprintf_r+0x1ddd>
 804aa4b:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804aa51:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804aa58:	00 00 00 
 804aa5b:	85 d2                	test   %edx,%edx
 804aa5d:	0f 49 c2             	cmovns %edx,%eax
 804aa60:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804aa66:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
 804aa6d:	0f 85 68 03 00 00    	jne    804addb <_svfprintf_r+0x1b8b>
 804aa73:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804aa79:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
 804aa7f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804aa86:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804aa8d:	00 00 00 
 804aa90:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804aa96:	e9 4d ea ff ff       	jmp    80494e8 <_svfprintf_r+0x298>
 804aa9b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804aaa1:	89 44 24 08          	mov    %eax,0x8(%esp)
 804aaa5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804aaa8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aaac:	8b 45 08             	mov    0x8(%ebp),%eax
 804aaaf:	89 04 24             	mov    %eax,(%esp)
 804aab2:	e8 09 62 00 00       	call   8050cc0 <__ssprint_r>
 804aab7:	85 c0                	test   %eax,%eax
 804aab9:	0f 85 61 e9 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804aabf:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804aac5:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804aac8:	e9 f2 f3 ff ff       	jmp    8049ebf <_svfprintf_r+0xc6f>
 804aacd:	89 d0                	mov    %edx,%eax
 804aacf:	e9 d1 fa ff ff       	jmp    804a5a5 <_svfprintf_r+0x1355>
 804aad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804aad8:	8d 50 01             	lea    0x1(%eax),%edx
 804aadb:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
 804aae1:	c6 00 30             	movb   $0x30,(%eax)
 804aae4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804aaea:	39 c1                	cmp    %eax,%ecx
 804aaec:	77 ea                	ja     804aad8 <_svfprintf_r+0x1888>
 804aaee:	e9 fc fe ff ff       	jmp    804a9ef <_svfprintf_r+0x179f>
 804aaf3:	8b 45 08             	mov    0x8(%ebp),%eax
 804aaf6:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 804aafd:	00 
 804aafe:	89 04 24             	mov    %eax,(%esp)
 804ab01:	e8 3a 49 00 00       	call   804f440 <_malloc_r>
 804ab06:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ab09:	85 c0                	test   %eax,%eax
 804ab0b:	89 02                	mov    %eax,(%edx)
 804ab0d:	89 42 10             	mov    %eax,0x10(%edx)
 804ab10:	0f 84 15 06 00 00    	je     804b12b <_svfprintf_r+0x1edb>
 804ab16:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab19:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
 804ab20:	e9 6c e7 ff ff       	jmp    8049291 <_svfprintf_r+0x41>
 804ab25:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ab2b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab2f:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab32:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab36:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab39:	89 04 24             	mov    %eax,(%esp)
 804ab3c:	e8 7f 61 00 00       	call   8050cc0 <__ssprint_r>
 804ab41:	85 c0                	test   %eax,%eax
 804ab43:	0f 85 d7 e8 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804ab49:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ab4f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ab52:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804ab58:	e9 d9 fc ff ff       	jmp    804a836 <_svfprintf_r+0x15e6>
 804ab5d:	83 c0 01             	add    $0x1,%eax
 804ab60:	01 da                	add    %ebx,%edx
 804ab62:	c7 07 8c 47 05 08    	movl   $0x805478c,(%edi)
 804ab68:	83 c7 08             	add    $0x8,%edi
 804ab6b:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804ab6e:	83 f8 07             	cmp    $0x7,%eax
 804ab71:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804ab77:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804ab7d:	7e 33                	jle    804abb2 <_svfprintf_r+0x1962>
 804ab7f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ab85:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab89:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab8c:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab90:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab93:	89 04 24             	mov    %eax,(%esp)
 804ab96:	e8 25 61 00 00       	call   8050cc0 <__ssprint_r>
 804ab9b:	85 c0                	test   %eax,%eax
 804ab9d:	0f 85 7d e8 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804aba3:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804aba9:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804abac:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804abb2:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
 804abb8:	83 c0 01             	add    $0x1,%eax
 804abbb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804abc1:	89 1f                	mov    %ebx,(%edi)
 804abc3:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804abc9:	01 da                	add    %ebx,%edx
 804abcb:	83 f8 07             	cmp    $0x7,%eax
 804abce:	89 5f 04             	mov    %ebx,0x4(%edi)
 804abd1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804abd7:	0f 8f 86 f5 ff ff    	jg     804a163 <_svfprintf_r+0xf13>
 804abdd:	83 c7 08             	add    $0x8,%edi
 804abe0:	89 d1                	mov    %edx,%ecx
 804abe2:	e9 15 f1 ff ff       	jmp    8049cfc <_svfprintf_r+0xaac>
 804abe7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804abed:	89 44 24 08          	mov    %eax,0x8(%esp)
 804abf1:	8b 45 0c             	mov    0xc(%ebp),%eax
 804abf4:	89 44 24 04          	mov    %eax,0x4(%esp)
 804abf8:	8b 45 08             	mov    0x8(%ebp),%eax
 804abfb:	89 04 24             	mov    %eax,(%esp)
 804abfe:	e8 bd 60 00 00       	call   8050cc0 <__ssprint_r>
 804ac03:	85 c0                	test   %eax,%eax
 804ac05:	0f 85 15 e8 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804ac0b:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ac11:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ac14:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804ac1a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804ac20:	e9 62 fc ff ff       	jmp    804a887 <_svfprintf_r+0x1637>
 804ac25:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
 804ac2c:	00 00 00 
 804ac2f:	e9 07 fd ff ff       	jmp    804a93b <_svfprintf_r+0x16eb>
 804ac34:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804ac3a:	89 04 24             	mov    %eax,(%esp)
 804ac3d:	e8 8e e5 ff ff       	call   80491d0 <strlen>
 804ac42:	e9 6a e8 ff ff       	jmp    80494b1 <_svfprintf_r+0x261>
 804ac47:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ac4d:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac51:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac54:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac58:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac5b:	89 04 24             	mov    %eax,(%esp)
 804ac5e:	e8 5d 60 00 00       	call   8050cc0 <__ssprint_r>
 804ac63:	85 c0                	test   %eax,%eax
 804ac65:	0f 85 b5 e7 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804ac6b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804ac71:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ac74:	e9 76 f6 ff ff       	jmp    804a2ef <_svfprintf_r+0x109f>
 804ac79:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ac7f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac83:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac86:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac8a:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac8d:	89 04 24             	mov    %eax,(%esp)
 804ac90:	e8 2b 60 00 00       	call   8050cc0 <__ssprint_r>
 804ac95:	85 c0                	test   %eax,%eax
 804ac97:	0f 85 83 e7 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804ac9d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804aca3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804aca6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804acac:	e9 f4 f8 ff ff       	jmp    804a5a5 <_svfprintf_r+0x1355>
 804acb1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804acb7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804acbb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804acbe:	89 44 24 04          	mov    %eax,0x4(%esp)
 804acc2:	8b 45 08             	mov    0x8(%ebp),%eax
 804acc5:	89 04 24             	mov    %eax,(%esp)
 804acc8:	e8 f3 5f 00 00       	call   8050cc0 <__ssprint_r>
 804accd:	85 c0                	test   %eax,%eax
 804accf:	0f 85 4b e7 ff ff    	jne    8049420 <_svfprintf_r+0x1d0>
 804acd5:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804acdb:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804acde:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
 804ace4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804acea:	e9 fa f8 ff ff       	jmp    804a5e9 <_svfprintf_r+0x1399>
 804acef:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804acf5:	b0 06                	mov    $0x6,%al
 804acf7:	89 75 14             	mov    %esi,0x14(%ebp)
 804acfa:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ad01:	00 00 00 
 804ad04:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ad0b:	00 00 00 
 804ad0e:	83 fa 06             	cmp    $0x6,%edx
 804ad11:	0f 46 c2             	cmovbe %edx,%eax
 804ad14:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804ad1a:	85 c0                	test   %eax,%eax
 804ad1c:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804ad22:	c7 85 28 ff ff ff 1e 	movl   $0x805461e,-0xd8(%ebp)
 804ad29:	46 05 08 
 804ad2c:	0f 49 d0             	cmovns %eax,%edx
 804ad2f:	31 db                	xor    %ebx,%ebx
 804ad31:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
 804ad37:	e9 b7 e7 ff ff       	jmp    80494f3 <_svfprintf_r+0x2a3>
 804ad3c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804ad43:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804ad48:	e9 9d ea ff ff       	jmp    80497ea <_svfprintf_r+0x59a>
 804ad4d:	ba 03 00 00 00       	mov    $0x3,%edx
 804ad52:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804ad58:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804ad5c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804ad62:	89 44 24 18          	mov    %eax,0x18(%esp)
 804ad66:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804ad6c:	89 44 24 14          	mov    %eax,0x14(%esp)
 804ad70:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804ad76:	dd 54 24 04          	fstl   0x4(%esp)
 804ad7a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ad7e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804ad84:	89 44 24 10          	mov    %eax,0x10(%esp)
 804ad88:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad8b:	89 04 24             	mov    %eax,(%esp)
 804ad8e:	e8 3d 27 00 00       	call   804d4d0 <_dtoa_r>
 804ad93:	83 fb 47             	cmp    $0x47,%ebx
 804ad96:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
 804ad9c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804ada2:	75 09                	jne    804adad <_svfprintf_r+0x1b5d>
 804ada4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804adab:	74 5b                	je     804ae08 <_svfprintf_r+0x1bb8>
 804adad:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804adb3:	89 f0                	mov    %esi,%eax
 804adb5:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
 804adbb:	01 d1                	add    %edx,%ecx
 804adbd:	84 c0                	test   %al,%al
 804adbf:	0f 84 14 fc ff ff    	je     804a9d9 <_svfprintf_r+0x1789>
 804adc5:	80 3a 30             	cmpb   $0x30,(%edx)
 804adc8:	0f 84 37 02 00 00    	je     804b005 <_svfprintf_r+0x1db5>
 804adce:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804add4:	01 c1                	add    %eax,%ecx
 804add6:	e9 fe fb ff ff       	jmp    804a9d9 <_svfprintf_r+0x1789>
 804addb:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804ade1:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
 804ade7:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804adec:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804adf3:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804adfa:	00 00 00 
 804adfd:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804ae03:	e9 e4 e6 ff ff       	jmp    80494ec <_svfprintf_r+0x29c>
 804ae08:	dd d8                	fstp   %st(0)
 804ae0a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804ae10:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804ae16:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804ae1c:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
 804ae22:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804ae28:	83 f8 fd             	cmp    $0xfffffffd,%eax
 804ae2b:	7c 48                	jl     804ae75 <_svfprintf_r+0x1c25>
 804ae2d:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
 804ae33:	7c 40                	jl     804ae75 <_svfprintf_r+0x1c25>
 804ae35:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804ae3b:	e9 ea fb ff ff       	jmp    804aa2a <_svfprintf_r+0x17da>
 804ae40:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804ae46:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804ae4d:	89 75 14             	mov    %esi,0x14(%ebp)
 804ae50:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ae57:	00 00 00 
 804ae5a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804ae60:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804ae66:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ae6d:	00 00 00 
 804ae70:	e9 73 e6 ff ff       	jmp    80494e8 <_svfprintf_r+0x298>
 804ae75:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
 804ae7c:	8d 48 ff             	lea    -0x1(%eax),%ecx
 804ae7f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
 804ae86:	85 c9                	test   %ecx,%ecx
 804ae88:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 804ae8e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
 804ae94:	0f 88 2c 02 00 00    	js     804b0c6 <_svfprintf_r+0x1e76>
 804ae9a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
 804aea1:	83 f9 09             	cmp    $0x9,%ecx
 804aea4:	0f 8f ea 00 00 00    	jg     804af94 <_svfprintf_r+0x1d44>
 804aeaa:	83 c1 30             	add    $0x30,%ecx
 804aead:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
 804aeb4:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
 804aeba:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
 804aec0:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804aec6:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
 804aecc:	29 d0                	sub    %edx,%eax
 804aece:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
 804aed4:	89 da                	mov    %ebx,%edx
 804aed6:	01 c2                	add    %eax,%edx
 804aed8:	83 fb 01             	cmp    $0x1,%ebx
 804aedb:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804aee1:	0f 8e 21 02 00 00    	jle    804b108 <_svfprintf_r+0x1eb8>
 804aee7:	31 c0                	xor    %eax,%eax
 804aee9:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
 804aef0:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
 804aef7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804aefe:	00 00 00 
 804af01:	e9 60 fb ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804af06:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804af0c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804af13:	00 00 00 
 804af16:	e9 68 e4 ff ff       	jmp    8049383 <_svfprintf_r+0x133>
 804af1b:	ba 02 00 00 00       	mov    $0x2,%edx
 804af20:	e9 2d fe ff ff       	jmp    804ad52 <_svfprintf_r+0x1b02>
 804af25:	d9 e0                	fchs   
 804af27:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
 804af2e:	e9 38 fa ff ff       	jmp    804a96b <_svfprintf_r+0x171b>
 804af33:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
 804af39:	ba 01 00 00 00       	mov    $0x1,%edx
 804af3e:	85 c9                	test   %ecx,%ecx
 804af40:	0f 8e 5a 01 00 00    	jle    804b0a0 <_svfprintf_r+0x1e50>
 804af46:	31 c0                	xor    %eax,%eax
 804af48:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
 804af4e:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804af55:	00 00 00 
 804af58:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804af5e:	0f 49 c2             	cmovns %edx,%eax
 804af61:	e9 00 fb ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804af66:	85 c0                	test   %eax,%eax
 804af68:	0f 8e 06 01 00 00    	jle    804b074 <_svfprintf_r+0x1e24>
 804af6e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804af74:	85 f6                	test   %esi,%esi
 804af76:	0f 85 d4 00 00 00    	jne    804b050 <_svfprintf_r+0x1e00>
 804af7c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804af83:	0f 85 c7 00 00 00    	jne    804b050 <_svfprintf_r+0x1e00>
 804af89:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804af8f:	e9 d2 fa ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804af94:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
 804af9a:	89 f3                	mov    %esi,%ebx
 804af9c:	b8 67 66 66 66       	mov    $0x66666667,%eax
 804afa1:	83 eb 01             	sub    $0x1,%ebx
 804afa4:	f7 e9                	imul   %ecx
 804afa6:	89 c8                	mov    %ecx,%eax
 804afa8:	c1 f8 1f             	sar    $0x1f,%eax
 804afab:	c1 fa 02             	sar    $0x2,%edx
 804afae:	29 c2                	sub    %eax,%edx
 804afb0:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804afb3:	01 c0                	add    %eax,%eax
 804afb5:	29 c1                	sub    %eax,%ecx
 804afb7:	83 fa 09             	cmp    $0x9,%edx
 804afba:	8d 41 30             	lea    0x30(%ecx),%eax
 804afbd:	89 d1                	mov    %edx,%ecx
 804afbf:	88 03                	mov    %al,(%ebx)
 804afc1:	7f d9                	jg     804af9c <_svfprintf_r+0x1d4c>
 804afc3:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804afc6:	83 c1 30             	add    $0x30,%ecx
 804afc9:	39 f0                	cmp    %esi,%eax
 804afcb:	88 4b ff             	mov    %cl,-0x1(%ebx)
 804afce:	0f 83 6a 01 00 00    	jae    804b13e <_svfprintf_r+0x1eee>
 804afd4:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804afda:	eb 07                	jmp    804afe3 <_svfprintf_r+0x1d93>
 804afdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804afe0:	0f b6 08             	movzbl (%eax),%ecx
 804afe3:	83 c0 01             	add    $0x1,%eax
 804afe6:	83 c2 01             	add    $0x1,%edx
 804afe9:	39 f0                	cmp    %esi,%eax
 804afeb:	88 4a ff             	mov    %cl,-0x1(%edx)
 804afee:	75 f0                	jne    804afe0 <_svfprintf_r+0x1d90>
 804aff0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804aff6:	29 d8                	sub    %ebx,%eax
 804aff8:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804affe:	01 d0                	add    %edx,%eax
 804b000:	e9 bb fe ff ff       	jmp    804aec0 <_svfprintf_r+0x1c70>
 804b005:	d9 ee                	fldz   
 804b007:	d9 c9                	fxch   %st(1)
 804b009:	db e9                	fucomi %st(1),%st
 804b00b:	dd d9                	fstp   %st(1)
 804b00d:	7a 06                	jp     804b015 <_svfprintf_r+0x1dc5>
 804b00f:	0f 84 b9 fd ff ff    	je     804adce <_svfprintf_r+0x1b7e>
 804b015:	b8 01 00 00 00       	mov    $0x1,%eax
 804b01a:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 804b020:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
 804b026:	01 c1                	add    %eax,%ecx
 804b028:	e9 ac f9 ff ff       	jmp    804a9d9 <_svfprintf_r+0x1789>
 804b02d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804b033:	31 c0                	xor    %eax,%eax
 804b035:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804b03c:	00 00 00 
 804b03f:	83 c2 01             	add    $0x1,%edx
 804b042:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b048:	0f 49 c2             	cmovns %edx,%eax
 804b04b:	e9 16 fa ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804b050:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804b056:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b05c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
 804b060:	89 c2                	mov    %eax,%edx
 804b062:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804b068:	31 c0                	xor    %eax,%eax
 804b06a:	85 d2                	test   %edx,%edx
 804b06c:	0f 49 c2             	cmovns %edx,%eax
 804b06f:	e9 f2 f9 ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804b074:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804b07a:	85 db                	test   %ebx,%ebx
 804b07c:	75 2f                	jne    804b0ad <_svfprintf_r+0x1e5d>
 804b07e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804b085:	75 26                	jne    804b0ad <_svfprintf_r+0x1e5d>
 804b087:	b8 01 00 00 00       	mov    $0x1,%eax
 804b08c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804b093:	00 00 00 
 804b096:	e9 cb f9 ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804b09b:	90                   	nop
 804b09c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b0a0:	b2 02                	mov    $0x2,%dl
 804b0a2:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
 804b0a8:	e9 99 fe ff ff       	jmp    804af46 <_svfprintf_r+0x1cf6>
 804b0ad:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b0b3:	31 c0                	xor    %eax,%eax
 804b0b5:	83 c2 02             	add    $0x2,%edx
 804b0b8:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b0be:	0f 49 c2             	cmovns %edx,%eax
 804b0c1:	e9 a0 f9 ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804b0c6:	f7 d9                	neg    %ecx
 804b0c8:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
 804b0cf:	e9 cd fd ff ff       	jmp    804aea1 <_svfprintf_r+0x1c51>
 804b0d4:	8b 55 14             	mov    0x14(%ebp),%edx
 804b0d7:	8b 45 14             	mov    0x14(%ebp),%eax
 804b0da:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b0e0:	8b 12                	mov    (%edx),%edx
 804b0e2:	83 c0 04             	add    $0x4,%eax
 804b0e5:	89 45 14             	mov    %eax,0x14(%ebp)
 804b0e8:	85 d2                	test   %edx,%edx
 804b0ea:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804b0f0:	0f 89 a9 e2 ff ff    	jns    804939f <_svfprintf_r+0x14f>
 804b0f6:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804b0fd:	ff ff ff 
 804b100:	89 c8                	mov    %ecx,%eax
 804b102:	e9 76 e2 ff ff       	jmp    804937d <_svfprintf_r+0x12d>
 804b107:	90                   	nop
 804b108:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804b10e:	83 e0 01             	and    $0x1,%eax
 804b111:	0f 85 d0 fd ff ff    	jne    804aee7 <_svfprintf_r+0x1c97>
 804b117:	85 d2                	test   %edx,%edx
 804b119:	0f 49 c2             	cmovns %edx,%eax
 804b11c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b123:	00 00 00 
 804b126:	e9 3b f9 ff ff       	jmp    804aa66 <_svfprintf_r+0x1816>
 804b12b:	8b 45 08             	mov    0x8(%ebp),%eax
 804b12e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804b134:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804b139:	e9 f5 e2 ff ff       	jmp    8049433 <_svfprintf_r+0x1e3>
 804b13e:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
 804b144:	e9 77 fd ff ff       	jmp    804aec0 <_svfprintf_r+0x1c70>
 804b149:	66 90                	xchg   %ax,%ax
 804b14b:	66 90                	xchg   %ax,%ax
 804b14d:	66 90                	xchg   %ax,%ax
 804b14f:	90                   	nop

0804b150 <_vfprintf_r>:
 804b150:	55                   	push   %ebp
 804b151:	89 e5                	mov    %esp,%ebp
 804b153:	57                   	push   %edi
 804b154:	56                   	push   %esi
 804b155:	53                   	push   %ebx
 804b156:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
 804b15c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b15f:	89 04 24             	mov    %eax,(%esp)
 804b162:	e8 39 41 00 00       	call   804f2a0 <_localeconv_r>
 804b167:	8b 00                	mov    (%eax),%eax
 804b169:	89 04 24             	mov    %eax,(%esp)
 804b16c:	89 85 18 ff ff ff    	mov    %eax,-0xe8(%ebp)
 804b172:	e8 59 e0 ff ff       	call   80491d0 <strlen>
 804b177:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b17a:	85 db                	test   %ebx,%ebx
 804b17c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
 804b182:	74 0e                	je     804b192 <_vfprintf_r+0x42>
 804b184:	8b 45 08             	mov    0x8(%ebp),%eax
 804b187:	8b 48 38             	mov    0x38(%eax),%ecx
 804b18a:	85 c9                	test   %ecx,%ecx
 804b18c:	0f 84 56 02 00 00    	je     804b3e8 <_vfprintf_r+0x298>
 804b192:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b195:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b199:	f6 c4 20             	test   $0x20,%ah
 804b19c:	75 11                	jne    804b1af <_vfprintf_r+0x5f>
 804b19e:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b1a1:	80 cc 20             	or     $0x20,%ah
 804b1a4:	81 62 64 ff df ff ff 	andl   $0xffffdfff,0x64(%edx)
 804b1ab:	66 89 42 0c          	mov    %ax,0xc(%edx)
 804b1af:	a8 08                	test   $0x8,%al
 804b1b1:	0f 84 59 01 00 00    	je     804b310 <_vfprintf_r+0x1c0>
 804b1b7:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b1ba:	8b 52 10             	mov    0x10(%edx),%edx
 804b1bd:	85 d2                	test   %edx,%edx
 804b1bf:	0f 84 4b 01 00 00    	je     804b310 <_vfprintf_r+0x1c0>
 804b1c5:	83 e0 1a             	and    $0x1a,%eax
 804b1c8:	66 83 f8 0a          	cmp    $0xa,%ax
 804b1cc:	0f 84 68 01 00 00    	je     804b33a <_vfprintf_r+0x1ea>
 804b1d2:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804b1d5:	8d 55 a7             	lea    -0x59(%ebp),%edx
 804b1d8:	89 c7                	mov    %eax,%edi
 804b1da:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 804b1e0:	90                   	nop
 804b1e1:	90                   	nop
 804b1e2:	29 d0                	sub    %edx,%eax
 804b1e4:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 804b1eb:	00 00 00 
 804b1ee:	90                   	nop
 804b1ef:	90                   	nop
 804b1f0:	90                   	nop
 804b1f1:	90                   	nop
 804b1f2:	90                   	nop
 804b1f3:	90                   	nop
 804b1f4:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 804b1fb:	00 00 00 
 804b1fe:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
 804b205:	00 00 00 
 804b208:	c7 85 08 ff ff ff 00 	movl   $0x0,-0xf8(%ebp)
 804b20f:	00 00 00 
 804b212:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
 804b219:	00 00 00 
 804b21c:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
 804b223:	00 00 00 
 804b226:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
 804b22c:	8b 45 10             	mov    0x10(%ebp),%eax
 804b22f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804b232:	0f b6 00             	movzbl (%eax),%eax
 804b235:	3c 25                	cmp    $0x25,%al
 804b237:	74 4c                	je     804b285 <_vfprintf_r+0x135>
 804b239:	84 c0                	test   %al,%al
 804b23b:	75 07                	jne    804b244 <_vfprintf_r+0xf4>
 804b23d:	eb 46                	jmp    804b285 <_vfprintf_r+0x135>
 804b23f:	90                   	nop
 804b240:	84 c0                	test   %al,%al
 804b242:	74 0a                	je     804b24e <_vfprintf_r+0xfe>
 804b244:	83 c3 01             	add    $0x1,%ebx
 804b247:	0f b6 03             	movzbl (%ebx),%eax
 804b24a:	3c 25                	cmp    $0x25,%al
 804b24c:	75 f2                	jne    804b240 <_vfprintf_r+0xf0>
 804b24e:	89 de                	mov    %ebx,%esi
 804b250:	2b 75 10             	sub    0x10(%ebp),%esi
 804b253:	74 30                	je     804b285 <_vfprintf_r+0x135>
 804b255:	8b 45 10             	mov    0x10(%ebp),%eax
 804b258:	83 c7 08             	add    $0x8,%edi
 804b25b:	89 77 fc             	mov    %esi,-0x4(%edi)
 804b25e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
 804b264:	89 47 f8             	mov    %eax,-0x8(%edi)
 804b267:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b26d:	83 c0 01             	add    $0x1,%eax
 804b270:	83 f8 07             	cmp    $0x7,%eax
 804b273:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b279:	0f 8f f9 00 00 00    	jg     804b378 <_vfprintf_r+0x228>
 804b27f:	01 b5 28 ff ff ff    	add    %esi,-0xd8(%ebp)
 804b285:	80 3b 00             	cmpb   $0x0,(%ebx)
 804b288:	0f 84 12 01 00 00    	je     804b3a0 <_vfprintf_r+0x250>
 804b28e:	8d 43 01             	lea    0x1(%ebx),%eax
 804b291:	be 20 00 00 00       	mov    $0x20,%esi
 804b296:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b29d:	31 db                	xor    %ebx,%ebx
 804b29f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804b2a6:	ff ff ff 
 804b2a9:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804b2b0:	00 00 00 
 804b2b3:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
 804b2ba:	00 00 00 
 804b2bd:	8d 48 01             	lea    0x1(%eax),%ecx
 804b2c0:	0f be 00             	movsbl (%eax),%eax
 804b2c3:	8d 50 e0             	lea    -0x20(%eax),%edx
 804b2c6:	83 fa 58             	cmp    $0x58,%edx
 804b2c9:	0f 87 f2 07 00 00    	ja     804bac1 <_vfprintf_r+0x971>
 804b2cf:	ff 24 95 ac 47 05 08 	jmp    *0x80547ac(,%edx,4)
 804b2d6:	66 90                	xchg   %ax,%ax
 804b2d8:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b2df:	89 c8                	mov    %ecx,%eax
 804b2e1:	eb da                	jmp    804b2bd <_vfprintf_r+0x16d>
 804b2e3:	8b 45 14             	mov    0x14(%ebp),%eax
 804b2e6:	8b 55 14             	mov    0x14(%ebp),%edx
 804b2e9:	8b 00                	mov    (%eax),%eax
 804b2eb:	83 c2 04             	add    $0x4,%edx
 804b2ee:	89 55 14             	mov    %edx,0x14(%ebp)
 804b2f1:	85 c0                	test   %eax,%eax
 804b2f3:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
 804b2f9:	79 e4                	jns    804b2df <_vfprintf_r+0x18f>
 804b2fb:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
 804b301:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
 804b308:	89 c8                	mov    %ecx,%eax
 804b30a:	eb b1                	jmp    804b2bd <_vfprintf_r+0x16d>
 804b30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b310:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b313:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b317:	8b 45 08             	mov    0x8(%ebp),%eax
 804b31a:	89 04 24             	mov    %eax,(%esp)
 804b31d:	e8 ae 1e 00 00       	call   804d1d0 <__swsetup_r>
 804b322:	85 c0                	test   %eax,%eax
 804b324:	75 42                	jne    804b368 <_vfprintf_r+0x218>
 804b326:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b329:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b32d:	83 e0 1a             	and    $0x1a,%eax
 804b330:	66 83 f8 0a          	cmp    $0xa,%ax
 804b334:	0f 85 98 fe ff ff    	jne    804b1d2 <_vfprintf_r+0x82>
 804b33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b33d:	66 83 78 0e 00       	cmpw   $0x0,0xe(%eax)
 804b342:	0f 88 8a fe ff ff    	js     804b1d2 <_vfprintf_r+0x82>
 804b348:	8b 45 14             	mov    0x14(%ebp),%eax
 804b34b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804b34e:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b351:	89 04 24             	mov    %eax,(%esp)
 804b354:	8b 45 08             	mov    0x8(%ebp),%eax
 804b357:	e8 94 1d 00 00       	call   804d0f0 <__sbprintf>
 804b35c:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b362:	5b                   	pop    %ebx
 804b363:	5e                   	pop    %esi
 804b364:	5f                   	pop    %edi
 804b365:	5d                   	pop    %ebp
 804b366:	c3                   	ret    
 804b367:	90                   	nop
 804b368:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b36e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804b373:	5b                   	pop    %ebx
 804b374:	5e                   	pop    %esi
 804b375:	5f                   	pop    %edi
 804b376:	5d                   	pop    %ebp
 804b377:	c3                   	ret    
 804b378:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804b37e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b382:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b385:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b389:	8b 45 08             	mov    0x8(%ebp),%eax
 804b38c:	89 04 24             	mov    %eax,(%esp)
 804b38f:	e8 1c 6a 00 00       	call   8051db0 <__sprint_r>
 804b394:	85 c0                	test   %eax,%eax
 804b396:	75 30                	jne    804b3c8 <_vfprintf_r+0x278>
 804b398:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804b39b:	e9 df fe ff ff       	jmp    804b27f <_vfprintf_r+0x12f>
 804b3a0:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 804b3a6:	85 c0                	test   %eax,%eax
 804b3a8:	74 1e                	je     804b3c8 <_vfprintf_r+0x278>
 804b3aa:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804b3b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b3b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b3b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 804b3be:	89 04 24             	mov    %eax,(%esp)
 804b3c1:	e8 ea 69 00 00       	call   8051db0 <__sprint_r>
 804b3c6:	66 90                	xchg   %ax,%ax
 804b3c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b3cb:	f6 40 0c 40          	testb  $0x40,0xc(%eax)
 804b3cf:	75 97                	jne    804b368 <_vfprintf_r+0x218>
 804b3d1:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
 804b3d7:	81 c4 1c 01 00 00    	add    $0x11c,%esp
 804b3dd:	5b                   	pop    %ebx
 804b3de:	5e                   	pop    %esi
 804b3df:	5f                   	pop    %edi
 804b3e0:	5d                   	pop    %ebp
 804b3e1:	c3                   	ret    
 804b3e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b3e8:	89 04 24             	mov    %eax,(%esp)
 804b3eb:	e8 50 36 00 00       	call   804ea40 <__sinit>
 804b3f0:	e9 9d fd ff ff       	jmp    804b192 <_vfprintf_r+0x42>
 804b3f5:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 804b3fa:	89 c8                	mov    %ecx,%eax
 804b3fc:	e9 bc fe ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804b401:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b407:	8b 45 14             	mov    0x14(%ebp),%eax
 804b40a:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b40d:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b414:	8d 70 04             	lea    0x4(%eax),%esi
 804b417:	8b 00                	mov    (%eax),%eax
 804b419:	85 c0                	test   %eax,%eax
 804b41b:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b421:	0f 84 0a 18 00 00    	je     804cc31 <_vfprintf_r+0x1ae1>
 804b427:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b42d:	85 c0                	test   %eax,%eax
 804b42f:	0f 88 41 17 00 00    	js     804cb76 <_vfprintf_r+0x1a26>
 804b435:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b439:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804b43f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804b446:	00 
 804b447:	89 04 24             	mov    %eax,(%esp)
 804b44a:	e8 31 47 00 00       	call   804fb80 <memchr>
 804b44f:	85 c0                	test   %eax,%eax
 804b451:	0f 84 2b 19 00 00    	je     804cd82 <_vfprintf_r+0x1c32>
 804b457:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b45d:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804b463:	39 d0                	cmp    %edx,%eax
 804b465:	0f 4f c2             	cmovg  %edx,%eax
 804b468:	89 c2                	mov    %eax,%edx
 804b46a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b471:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804b477:	31 c0                	xor    %eax,%eax
 804b479:	85 d2                	test   %edx,%edx
 804b47b:	0f 49 c2             	cmovns %edx,%eax
 804b47e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b484:	89 75 14             	mov    %esi,0x14(%ebp)
 804b487:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804b48e:	00 00 00 
 804b491:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b498:	00 00 00 
 804b49b:	90                   	nop
 804b49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b4a0:	84 db                	test   %bl,%bl
 804b4a2:	74 07                	je     804b4ab <_vfprintf_r+0x35b>
 804b4a4:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
 804b4ab:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b4b1:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804b4b7:	89 c8                	mov    %ecx,%eax
 804b4b9:	89 f2                	mov    %esi,%edx
 804b4bb:	83 c0 02             	add    $0x2,%eax
 804b4be:	83 e2 02             	and    $0x2,%edx
 804b4c1:	89 95 34 ff ff ff    	mov    %edx,-0xcc(%ebp)
 804b4c7:	89 f2                	mov    %esi,%edx
 804b4c9:	0f 44 c1             	cmove  %ecx,%eax
 804b4cc:	81 e2 84 00 00 00    	and    $0x84,%edx
 804b4d2:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b4d8:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
 804b4de:	0f 85 1c 06 00 00    	jne    804bb00 <_vfprintf_r+0x9b0>
 804b4e4:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804b4ea:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804b4f0:	85 f6                	test   %esi,%esi
 804b4f2:	0f 8e 08 06 00 00    	jle    804bb00 <_vfprintf_r+0x9b0>
 804b4f8:	83 fe 10             	cmp    $0x10,%esi
 804b4fb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804b501:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b507:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804b50d:	7f 11                	jg     804b520 <_vfprintf_r+0x3d0>
 804b50f:	eb 6b                	jmp    804b57c <_vfprintf_r+0x42c>
 804b511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804b518:	83 ee 10             	sub    $0x10,%esi
 804b51b:	83 fe 10             	cmp    $0x10,%esi
 804b51e:	7e 5c                	jle    804b57c <_vfprintf_r+0x42c>
 804b520:	83 c0 01             	add    $0x1,%eax
 804b523:	83 c1 10             	add    $0x10,%ecx
 804b526:	c7 07 20 49 05 08    	movl   $0x8054920,(%edi)
 804b52c:	83 c7 08             	add    $0x8,%edi
 804b52f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804b536:	83 f8 07             	cmp    $0x7,%eax
 804b539:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804b53f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b545:	7e d1                	jle    804b518 <_vfprintf_r+0x3c8>
 804b547:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b54a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804b54e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b552:	8b 45 08             	mov    0x8(%ebp),%eax
 804b555:	89 04 24             	mov    %eax,(%esp)
 804b558:	e8 53 68 00 00       	call   8051db0 <__sprint_r>
 804b55d:	85 c0                	test   %eax,%eax
 804b55f:	0f 85 63 fe ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804b565:	83 ee 10             	sub    $0x10,%esi
 804b568:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804b56e:	83 fe 10             	cmp    $0x10,%esi
 804b571:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804b577:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804b57a:	7f a4                	jg     804b520 <_vfprintf_r+0x3d0>
 804b57c:	83 c0 01             	add    $0x1,%eax
 804b57f:	01 f1                	add    %esi,%ecx
 804b581:	83 f8 07             	cmp    $0x7,%eax
 804b584:	c7 07 20 49 05 08    	movl   $0x8054920,(%edi)
 804b58a:	89 77 04             	mov    %esi,0x4(%edi)
 804b58d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804b593:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804b599:	0f 8f 16 0e 00 00    	jg     804c3b5 <_vfprintf_r+0x1265>
 804b59f:	83 c7 08             	add    $0x8,%edi
 804b5a2:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b5a9:	e9 58 05 00 00       	jmp    804bb06 <_vfprintf_r+0x9b6>
 804b5ae:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b5b5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b5bb:	8b 45 14             	mov    0x14(%ebp),%eax
 804b5be:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b5c1:	0f 85 15 02 00 00    	jne    804b7dc <_vfprintf_r+0x68c>
 804b5c7:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b5ce:	0f 84 08 02 00 00    	je     804b7dc <_vfprintf_r+0x68c>
 804b5d4:	0f b7 08             	movzwl (%eax),%ecx
 804b5d7:	83 c0 04             	add    $0x4,%eax
 804b5da:	89 45 14             	mov    %eax,0x14(%ebp)
 804b5dd:	b8 01 00 00 00       	mov    $0x1,%eax
 804b5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b5e8:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804b5ef:	31 db                	xor    %ebx,%ebx
 804b5f1:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
 804b5f7:	89 f2                	mov    %esi,%edx
 804b5f9:	80 e2 7f             	and    $0x7f,%dl
 804b5fc:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
 804b603:	0f 48 d6             	cmovs  %esi,%edx
 804b606:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
 804b60c:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804b612:	85 d2                	test   %edx,%edx
 804b614:	75 08                	jne    804b61e <_vfprintf_r+0x4ce>
 804b616:	85 c9                	test   %ecx,%ecx
 804b618:	0f 84 ea 08 00 00    	je     804bf08 <_vfprintf_r+0xdb8>
 804b61e:	3c 01                	cmp    $0x1,%al
 804b620:	0f 84 6a 0d 00 00    	je     804c390 <_vfprintf_r+0x1240>
 804b626:	3c 02                	cmp    $0x2,%al
 804b628:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804b62b:	0f 85 bf 0b 00 00    	jne    804c1f0 <_vfprintf_r+0x10a0>
 804b631:	8b b5 08 ff ff ff    	mov    -0xf8(%ebp),%esi
 804b637:	90                   	nop
 804b638:	89 ca                	mov    %ecx,%edx
 804b63a:	83 e8 01             	sub    $0x1,%eax
 804b63d:	83 e2 0f             	and    $0xf,%edx
 804b640:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
 804b644:	c1 e9 04             	shr    $0x4,%ecx
 804b647:	85 c9                	test   %ecx,%ecx
 804b649:	88 10                	mov    %dl,(%eax)
 804b64b:	75 eb                	jne    804b638 <_vfprintf_r+0x4e8>
 804b64d:	8d 55 a8             	lea    -0x58(%ebp),%edx
 804b650:	29 c2                	sub    %eax,%edx
 804b652:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b658:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804b65e:	66 90                	xchg   %ax,%ax
 804b660:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804b666:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
 804b66c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b673:	00 00 00 
 804b676:	39 c2                	cmp    %eax,%edx
 804b678:	0f 4d c2             	cmovge %edx,%eax
 804b67b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b681:	e9 1a fe ff ff       	jmp    804b4a0 <_vfprintf_r+0x350>
 804b686:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
 804b68d:	00 00 00 
 804b690:	89 c8                	mov    %ecx,%eax
 804b692:	e9 26 fc ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804b697:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804b69d:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6a0:	31 ff                	xor    %edi,%edi
 804b6a2:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 804b6a9:	00 00 00 
 804b6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804b6b0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 804b6b3:	83 c1 01             	add    $0x1,%ecx
 804b6b6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
 804b6b9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
 804b6bd:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6c0:	83 fa 09             	cmp    $0x9,%edx
 804b6c3:	76 eb                	jbe    804b6b0 <_vfprintf_r+0x560>
 804b6c5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
 804b6cb:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804b6d1:	e9 ed fb ff ff       	jmp    804b2c3 <_vfprintf_r+0x173>
 804b6d6:	8d 41 01             	lea    0x1(%ecx),%eax
 804b6d9:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804b6df:	0f be 01             	movsbl (%ecx),%eax
 804b6e2:	83 f8 2a             	cmp    $0x2a,%eax
 804b6e5:	0f 84 1e 19 00 00    	je     804d009 <_vfprintf_r+0x1eb9>
 804b6eb:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b6ee:	31 c9                	xor    %ecx,%ecx
 804b6f0:	83 fa 09             	cmp    $0x9,%edx
 804b6f3:	0f 87 8d 17 00 00    	ja     804ce86 <_vfprintf_r+0x1d36>
 804b6f9:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
 804b6ff:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804b705:	8d 76 00             	lea    0x0(%esi),%esi
 804b708:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 804b70b:	83 c7 01             	add    $0x1,%edi
 804b70e:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
 804b711:	0f be 47 ff          	movsbl -0x1(%edi),%eax
 804b715:	8d 50 d0             	lea    -0x30(%eax),%edx
 804b718:	83 fa 09             	cmp    $0x9,%edx
 804b71b:	76 eb                	jbe    804b708 <_vfprintf_r+0x5b8>
 804b71d:	85 c9                	test   %ecx,%ecx
 804b71f:	89 ca                	mov    %ecx,%edx
 804b721:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804b726:	0f 48 d1             	cmovs  %ecx,%edx
 804b729:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804b72f:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 804b735:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804b73b:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804b741:	e9 7d fb ff ff       	jmp    804b2c3 <_vfprintf_r+0x173>
 804b746:	8b 45 14             	mov    0x14(%ebp),%eax
 804b749:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b74c:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 804b753:	8b 08                	mov    (%eax),%ecx
 804b755:	83 c0 04             	add    $0x4,%eax
 804b758:	89 45 14             	mov    %eax,0x14(%ebp)
 804b75b:	b8 02 00 00 00       	mov    $0x2,%eax
 804b760:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 804b767:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
 804b76e:	c7 85 08 ff ff ff 0d 	movl   $0x805460d,-0xf8(%ebp)
 804b775:	46 05 08 
 804b778:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
 804b77f:	00 00 00 
 804b782:	e9 61 fe ff ff       	jmp    804b5e8 <_vfprintf_r+0x498>
 804b787:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b78e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b795:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b79b:	8b 45 14             	mov    0x14(%ebp),%eax
 804b79e:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b7a1:	75 60                	jne    804b803 <_vfprintf_r+0x6b3>
 804b7a3:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b7aa:	74 57                	je     804b803 <_vfprintf_r+0x6b3>
 804b7ac:	0f b7 08             	movzwl (%eax),%ecx
 804b7af:	83 c0 04             	add    $0x4,%eax
 804b7b2:	89 45 14             	mov    %eax,0x14(%ebp)
 804b7b5:	31 c0                	xor    %eax,%eax
 804b7b7:	e9 2c fe ff ff       	jmp    804b5e8 <_vfprintf_r+0x498>
 804b7bc:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b7c3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b7ca:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b7d0:	8b 45 14             	mov    0x14(%ebp),%eax
 804b7d3:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b7d6:	0f 84 eb fd ff ff    	je     804b5c7 <_vfprintf_r+0x477>
 804b7dc:	8b 08                	mov    (%eax),%ecx
 804b7de:	83 c0 04             	add    $0x4,%eax
 804b7e1:	89 45 14             	mov    %eax,0x14(%ebp)
 804b7e4:	b8 01 00 00 00       	mov    $0x1,%eax
 804b7e9:	e9 fa fd ff ff       	jmp    804b5e8 <_vfprintf_r+0x498>
 804b7ee:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b7f5:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b7fb:	8b 45 14             	mov    0x14(%ebp),%eax
 804b7fe:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b801:	74 a0                	je     804b7a3 <_vfprintf_r+0x653>
 804b803:	8b 08                	mov    (%eax),%ecx
 804b805:	83 c0 04             	add    $0x4,%eax
 804b808:	89 45 14             	mov    %eax,0x14(%ebp)
 804b80b:	31 c0                	xor    %eax,%eax
 804b80d:	e9 d6 fd ff ff       	jmp    804b5e8 <_vfprintf_r+0x498>
 804b812:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
 804b819:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b820:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b826:	8b 45 14             	mov    0x14(%ebp),%eax
 804b829:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b82c:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b832:	0f 85 d3 01 00 00    	jne    804ba0b <_vfprintf_r+0x8bb>
 804b838:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b83f:	0f 84 c6 01 00 00    	je     804ba0b <_vfprintf_r+0x8bb>
 804b845:	0f bf 08             	movswl (%eax),%ecx
 804b848:	83 c0 04             	add    $0x4,%eax
 804b84b:	89 45 14             	mov    %eax,0x14(%ebp)
 804b84e:	85 c9                	test   %ecx,%ecx
 804b850:	0f 88 9b 0e 00 00    	js     804c6f1 <_vfprintf_r+0x15a1>
 804b856:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b85d:	b8 01 00 00 00       	mov    $0x1,%eax
 804b862:	e9 8a fd ff ff       	jmp    804b5f1 <_vfprintf_r+0x4a1>
 804b867:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
 804b86e:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b874:	8b 45 14             	mov    0x14(%ebp),%eax
 804b877:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b87a:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b880:	0f 84 2a 10 00 00    	je     804c8b0 <_vfprintf_r+0x1760>
 804b886:	db 28                	fldt   (%eax)
 804b888:	83 c0 0c             	add    $0xc,%eax
 804b88b:	89 45 14             	mov    %eax,0x14(%ebp)
 804b88e:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804b894:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804b89a:	dd 1c 24             	fstpl  (%esp)
 804b89d:	e8 fe 51 00 00       	call   8050aa0 <__fpclassifyd>
 804b8a2:	83 f8 01             	cmp    $0x1,%eax
 804b8a5:	0f 85 5e 0e 00 00    	jne    804c709 <_vfprintf_r+0x15b9>
 804b8ab:	90                   	nop
 804b8ac:	90                   	nop
 804b8ad:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804b8b3:	d9 c9                	fxch   %st(1)
 804b8b5:	df e9                	fucomip %st(1),%st
 804b8b7:	dd d8                	fstp   %st(0)
 804b8b9:	0f 87 4d 14 00 00    	ja     804cd0c <_vfprintf_r+0x1bbc>
 804b8bf:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804b8c6:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804b8cd:	ba ec 45 05 08       	mov    $0x80545ec,%edx
 804b8d2:	b8 f0 45 05 08       	mov    $0x80545f0,%eax
 804b8d7:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804b8de:	00 00 00 
 804b8e1:	0f 4e c2             	cmovle %edx,%eax
 804b8e4:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804b8ea:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804b8f1:	ff ff ff 
 804b8f4:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804b8fb:	00 00 00 
 804b8fe:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804b905:	00 00 00 
 804b908:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804b90f:	00 00 00 
 804b912:	e9 89 fb ff ff       	jmp    804b4a0 <_vfprintf_r+0x350>
 804b917:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
 804b91e:	89 c8                	mov    %ecx,%eax
 804b920:	e9 98 f9 ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804b925:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b92c:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b932:	8b 45 14             	mov    0x14(%ebp),%eax
 804b935:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b938:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b93e:	c7 85 08 ff ff ff 0d 	movl   $0x805460d,-0xf8(%ebp)
 804b945:	46 05 08 
 804b948:	0f 85 0d 01 00 00    	jne    804ba5b <_vfprintf_r+0x90b>
 804b94e:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b955:	0f 84 00 01 00 00    	je     804ba5b <_vfprintf_r+0x90b>
 804b95b:	0f b7 08             	movzwl (%eax),%ecx
 804b95e:	83 c0 04             	add    $0x4,%eax
 804b961:	89 45 14             	mov    %eax,0x14(%ebp)
 804b964:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804b96b:	b8 02 00 00 00       	mov    $0x2,%eax
 804b970:	0f 84 72 fc ff ff    	je     804b5e8 <_vfprintf_r+0x498>
 804b976:	85 c9                	test   %ecx,%ecx
 804b978:	0f 84 6a fc ff ff    	je     804b5e8 <_vfprintf_r+0x498>
 804b97e:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
 804b985:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
 804b98c:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
 804b993:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
 804b999:	e9 4a fc ff ff       	jmp    804b5e8 <_vfprintf_r+0x498>
 804b99e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b9a5:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b9a8:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804b9ae:	0f 85 30 01 00 00    	jne    804bae4 <_vfprintf_r+0x994>
 804b9b4:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
 804b9bb:	0f 84 23 01 00 00    	je     804bae4 <_vfprintf_r+0x994>
 804b9c1:	8b 45 14             	mov    0x14(%ebp),%eax
 804b9c4:	0f b7 95 28 ff ff ff 	movzwl -0xd8(%ebp),%edx
 804b9cb:	8b 00                	mov    (%eax),%eax
 804b9cd:	66 89 10             	mov    %dx,(%eax)
 804b9d0:	8b 45 14             	mov    0x14(%ebp),%eax
 804b9d3:	83 c0 04             	add    $0x4,%eax
 804b9d6:	89 45 14             	mov    %eax,0x14(%ebp)
 804b9d9:	e9 4e f8 ff ff       	jmp    804b22c <_vfprintf_r+0xdc>
 804b9de:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
 804b9e5:	89 c8                	mov    %ecx,%eax
 804b9e7:	e9 d1 f8 ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804b9ec:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804b9f3:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804b9f9:	8b 45 14             	mov    0x14(%ebp),%eax
 804b9fc:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804b9ff:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804ba05:	0f 84 2d fe ff ff    	je     804b838 <_vfprintf_r+0x6e8>
 804ba0b:	8b 08                	mov    (%eax),%ecx
 804ba0d:	83 c0 04             	add    $0x4,%eax
 804ba10:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba13:	e9 36 fe ff ff       	jmp    804b84e <_vfprintf_r+0x6fe>
 804ba18:	84 db                	test   %bl,%bl
 804ba1a:	89 c8                	mov    %ecx,%eax
 804ba1c:	0f 44 de             	cmove  %esi,%ebx
 804ba1f:	e9 99 f8 ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804ba24:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
 804ba2b:	89 c8                	mov    %ecx,%eax
 804ba2d:	e9 8b f8 ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804ba32:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
 804ba39:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804ba3f:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba42:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804ba45:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804ba4b:	c7 85 08 ff ff ff fc 	movl   $0x80545fc,-0xf8(%ebp)
 804ba52:	45 05 08 
 804ba55:	0f 84 f3 fe ff ff    	je     804b94e <_vfprintf_r+0x7fe>
 804ba5b:	8b 08                	mov    (%eax),%ecx
 804ba5d:	83 c0 04             	add    $0x4,%eax
 804ba60:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba63:	e9 fc fe ff ff       	jmp    804b964 <_vfprintf_r+0x814>
 804ba68:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804ba6e:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba71:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804ba74:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804ba7b:	8b 00                	mov    (%eax),%eax
 804ba7d:	88 45 80             	mov    %al,-0x80(%ebp)
 804ba80:	8b 45 14             	mov    0x14(%ebp),%eax
 804ba83:	83 c0 04             	add    $0x4,%eax
 804ba86:	89 45 14             	mov    %eax,0x14(%ebp)
 804ba89:	8d 45 80             	lea    -0x80(%ebp),%eax
 804ba8c:	31 db                	xor    %ebx,%ebx
 804ba8e:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
 804ba95:	00 00 00 
 804ba98:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804ba9f:	00 00 00 
 804baa2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804baa9:	00 00 00 
 804baac:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804bab3:	00 00 00 
 804bab6:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804babc:	e9 ea f9 ff ff       	jmp    804b4ab <_vfprintf_r+0x35b>
 804bac1:	85 c0                	test   %eax,%eax
 804bac3:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
 804bac9:	89 4d 10             	mov    %ecx,0x10(%ebp)
 804bacc:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
 804bad2:	0f 84 c8 f8 ff ff    	je     804b3a0 <_vfprintf_r+0x250>
 804bad8:	88 45 80             	mov    %al,-0x80(%ebp)
 804badb:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
 804bae2:	eb a5                	jmp    804ba89 <_vfprintf_r+0x939>
 804bae4:	8b 45 14             	mov    0x14(%ebp),%eax
 804bae7:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
 804baed:	8b 00                	mov    (%eax),%eax
 804baef:	89 10                	mov    %edx,(%eax)
 804baf1:	8b 45 14             	mov    0x14(%ebp),%eax
 804baf4:	83 c0 04             	add    $0x4,%eax
 804baf7:	89 45 14             	mov    %eax,0x14(%ebp)
 804bafa:	e9 2d f7 ff ff       	jmp    804b22c <_vfprintf_r+0xdc>
 804baff:	90                   	nop
 804bb00:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bb06:	84 db                	test   %bl,%bl
 804bb08:	74 33                	je     804bb3d <_vfprintf_r+0x9ed>
 804bb0a:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
 804bb10:	83 c1 01             	add    $0x1,%ecx
 804bb13:	89 07                	mov    %eax,(%edi)
 804bb15:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bb1b:	83 c7 08             	add    $0x8,%edi
 804bb1e:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804bb25:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bb2b:	83 c0 01             	add    $0x1,%eax
 804bb2e:	83 f8 07             	cmp    $0x7,%eax
 804bb31:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bb37:	0f 8f 43 06 00 00    	jg     804c180 <_vfprintf_r+0x1030>
 804bb3d:	8b 9d 34 ff ff ff    	mov    -0xcc(%ebp),%ebx
 804bb43:	85 db                	test   %ebx,%ebx
 804bb45:	74 33                	je     804bb7a <_vfprintf_r+0xa2a>
 804bb47:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
 804bb4d:	83 c1 02             	add    $0x2,%ecx
 804bb50:	89 07                	mov    %eax,(%edi)
 804bb52:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bb58:	83 c7 08             	add    $0x8,%edi
 804bb5b:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
 804bb62:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bb68:	83 c0 01             	add    $0x1,%eax
 804bb6b:	83 f8 07             	cmp    $0x7,%eax
 804bb6e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bb74:	0f 8f 3e 06 00 00    	jg     804c1b8 <_vfprintf_r+0x1068>
 804bb7a:	81 bd 30 ff ff ff 80 	cmpl   $0x80,-0xd0(%ebp)
 804bb81:	00 00 00 
 804bb84:	0f 84 c6 03 00 00    	je     804bf50 <_vfprintf_r+0xe00>
 804bb8a:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804bb90:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
 804bb96:	85 f6                	test   %esi,%esi
 804bb98:	0f 8e d2 00 00 00    	jle    804bc70 <_vfprintf_r+0xb20>
 804bb9e:	83 fe 10             	cmp    $0x10,%esi
 804bba1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bba7:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bbad:	7f 11                	jg     804bbc0 <_vfprintf_r+0xa70>
 804bbaf:	eb 6b                	jmp    804bc1c <_vfprintf_r+0xacc>
 804bbb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804bbb8:	83 ee 10             	sub    $0x10,%esi
 804bbbb:	83 fe 10             	cmp    $0x10,%esi
 804bbbe:	7e 5c                	jle    804bc1c <_vfprintf_r+0xacc>
 804bbc0:	83 c0 01             	add    $0x1,%eax
 804bbc3:	83 c1 10             	add    $0x10,%ecx
 804bbc6:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804bbcc:	83 c7 08             	add    $0x8,%edi
 804bbcf:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bbd6:	83 f8 07             	cmp    $0x7,%eax
 804bbd9:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bbdf:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bbe5:	7e d1                	jle    804bbb8 <_vfprintf_r+0xa68>
 804bbe7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bbea:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bbee:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bbf2:	8b 45 08             	mov    0x8(%ebp),%eax
 804bbf5:	89 04 24             	mov    %eax,(%esp)
 804bbf8:	e8 b3 61 00 00       	call   8051db0 <__sprint_r>
 804bbfd:	85 c0                	test   %eax,%eax
 804bbff:	0f 85 c3 f7 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bc05:	83 ee 10             	sub    $0x10,%esi
 804bc08:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bc0e:	83 fe 10             	cmp    $0x10,%esi
 804bc11:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bc17:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bc1a:	7f a4                	jg     804bbc0 <_vfprintf_r+0xa70>
 804bc1c:	83 c0 01             	add    $0x1,%eax
 804bc1f:	01 f1                	add    %esi,%ecx
 804bc21:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804bc27:	83 c7 08             	add    $0x8,%edi
 804bc2a:	89 77 fc             	mov    %esi,-0x4(%edi)
 804bc2d:	83 f8 07             	cmp    $0x7,%eax
 804bc30:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bc36:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bc3c:	7e 32                	jle    804bc70 <_vfprintf_r+0xb20>
 804bc3e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804bc44:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bc48:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bc4b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bc4f:	8b 45 08             	mov    0x8(%ebp),%eax
 804bc52:	89 04 24             	mov    %eax,(%esp)
 804bc55:	e8 56 61 00 00       	call   8051db0 <__sprint_r>
 804bc5a:	85 c0                	test   %eax,%eax
 804bc5c:	0f 85 66 f7 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bc62:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bc68:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bc6b:	90                   	nop
 804bc6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804bc70:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
 804bc77:	01 00 00 
 804bc7a:	0f 85 50 01 00 00    	jne    804bdd0 <_vfprintf_r+0xc80>
 804bc80:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804bc86:	89 07                	mov    %eax,(%edi)
 804bc88:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
 804bc8e:	01 c1                	add    %eax,%ecx
 804bc90:	89 47 04             	mov    %eax,0x4(%edi)
 804bc93:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bc99:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bc9f:	83 c0 01             	add    $0x1,%eax
 804bca2:	83 f8 07             	cmp    $0x7,%eax
 804bca5:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bcab:	0f 8f 6a 04 00 00    	jg     804c11b <_vfprintf_r+0xfcb>
 804bcb1:	83 c7 08             	add    $0x8,%edi
 804bcb4:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
 804bcbb:	0f 84 d7 00 00 00    	je     804bd98 <_vfprintf_r+0xc48>
 804bcc1:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804bcc7:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804bccd:	85 f6                	test   %esi,%esi
 804bccf:	0f 8e c3 00 00 00    	jle    804bd98 <_vfprintf_r+0xc48>
 804bcd5:	83 fe 10             	cmp    $0x10,%esi
 804bcd8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bcde:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bce4:	7f 0a                	jg     804bcf0 <_vfprintf_r+0xba0>
 804bce6:	eb 64                	jmp    804bd4c <_vfprintf_r+0xbfc>
 804bce8:	83 ee 10             	sub    $0x10,%esi
 804bceb:	83 fe 10             	cmp    $0x10,%esi
 804bcee:	7e 5c                	jle    804bd4c <_vfprintf_r+0xbfc>
 804bcf0:	83 c0 01             	add    $0x1,%eax
 804bcf3:	83 c1 10             	add    $0x10,%ecx
 804bcf6:	c7 07 20 49 05 08    	movl   $0x8054920,(%edi)
 804bcfc:	83 c7 08             	add    $0x8,%edi
 804bcff:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bd06:	83 f8 07             	cmp    $0x7,%eax
 804bd09:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bd0f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bd15:	7e d1                	jle    804bce8 <_vfprintf_r+0xb98>
 804bd17:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bd1a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bd1e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bd22:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd25:	89 04 24             	mov    %eax,(%esp)
 804bd28:	e8 83 60 00 00       	call   8051db0 <__sprint_r>
 804bd2d:	85 c0                	test   %eax,%eax
 804bd2f:	0f 85 93 f6 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bd35:	83 ee 10             	sub    $0x10,%esi
 804bd38:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bd3e:	83 fe 10             	cmp    $0x10,%esi
 804bd41:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bd47:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bd4a:	7f a4                	jg     804bcf0 <_vfprintf_r+0xba0>
 804bd4c:	83 c0 01             	add    $0x1,%eax
 804bd4f:	01 f1                	add    %esi,%ecx
 804bd51:	83 f8 07             	cmp    $0x7,%eax
 804bd54:	c7 07 20 49 05 08    	movl   $0x8054920,(%edi)
 804bd5a:	89 77 04             	mov    %esi,0x4(%edi)
 804bd5d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bd63:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bd69:	7e 2d                	jle    804bd98 <_vfprintf_r+0xc48>
 804bd6b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804bd71:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bd75:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bd78:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bd7c:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd7f:	89 04 24             	mov    %eax,(%esp)
 804bd82:	e8 29 60 00 00       	call   8051db0 <__sprint_r>
 804bd87:	85 c0                	test   %eax,%eax
 804bd89:	0f 85 39 f6 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bd8f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bd95:	8d 76 00             	lea    0x0(%esi),%esi
 804bd98:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
 804bd9e:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
 804bda4:	39 c2                	cmp    %eax,%edx
 804bda6:	0f 4d c2             	cmovge %edx,%eax
 804bda9:	01 85 28 ff ff ff    	add    %eax,-0xd8(%ebp)
 804bdaf:	85 c9                	test   %ecx,%ecx
 804bdb1:	0f 85 99 03 00 00    	jne    804c150 <_vfprintf_r+0x1000>
 804bdb7:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 804bdbe:	00 00 00 
 804bdc1:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bdc4:	e9 63 f4 ff ff       	jmp    804b22c <_vfprintf_r+0xdc>
 804bdc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804bdd0:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804bdd7:	0f 8e 5b 02 00 00    	jle    804c038 <_vfprintf_r+0xee8>
 804bddd:	90                   	nop
 804bdde:	90                   	nop
 804bddf:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804bde5:	df e9                	fucomip %st(1),%st
 804bde7:	dd d8                	fstp   %st(0)
 804bde9:	0f 8a 59 04 00 00    	jp     804c248 <_vfprintf_r+0x10f8>
 804bdef:	0f 85 53 04 00 00    	jne    804c248 <_vfprintf_r+0x10f8>
 804bdf5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bdfb:	83 c1 01             	add    $0x1,%ecx
 804bdfe:	83 c7 08             	add    $0x8,%edi
 804be01:	c7 47 f8 e7 42 05 08 	movl   $0x80542e7,-0x8(%edi)
 804be08:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804be0f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804be15:	83 c0 01             	add    $0x1,%eax
 804be18:	83 f8 07             	cmp    $0x7,%eax
 804be1b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804be21:	0f 8f 9c 0a 00 00    	jg     804c8c3 <_vfprintf_r+0x1773>
 804be27:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804be2d:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
 804be33:	7c 0d                	jl     804be42 <_vfprintf_r+0xcf2>
 804be35:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804be3c:	0f 84 72 fe ff ff    	je     804bcb4 <_vfprintf_r+0xb64>
 804be42:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804be48:	83 c7 08             	add    $0x8,%edi
 804be4b:	89 47 f8             	mov    %eax,-0x8(%edi)
 804be4e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804be54:	89 47 fc             	mov    %eax,-0x4(%edi)
 804be57:	01 c1                	add    %eax,%ecx
 804be59:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804be5f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804be65:	83 c0 01             	add    $0x1,%eax
 804be68:	83 f8 07             	cmp    $0x7,%eax
 804be6b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804be71:	0f 8f 43 0c 00 00    	jg     804caba <_vfprintf_r+0x196a>
 804be77:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804be7d:	8d 70 ff             	lea    -0x1(%eax),%esi
 804be80:	85 f6                	test   %esi,%esi
 804be82:	0f 8e 2c fe ff ff    	jle    804bcb4 <_vfprintf_r+0xb64>
 804be88:	83 fe 10             	cmp    $0x10,%esi
 804be8b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804be91:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804be97:	7f 13                	jg     804beac <_vfprintf_r+0xd5c>
 804be99:	e9 d4 05 00 00       	jmp    804c472 <_vfprintf_r+0x1322>
 804be9e:	66 90                	xchg   %ax,%ax
 804bea0:	83 ee 10             	sub    $0x10,%esi
 804bea3:	83 fe 10             	cmp    $0x10,%esi
 804bea6:	0f 8e c6 05 00 00    	jle    804c472 <_vfprintf_r+0x1322>
 804beac:	83 c0 01             	add    $0x1,%eax
 804beaf:	83 c1 10             	add    $0x10,%ecx
 804beb2:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804beb8:	83 c7 08             	add    $0x8,%edi
 804bebb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bec2:	83 f8 07             	cmp    $0x7,%eax
 804bec5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804becb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bed1:	7e cd                	jle    804bea0 <_vfprintf_r+0xd50>
 804bed3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bed6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804beda:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bede:	8b 45 08             	mov    0x8(%ebp),%eax
 804bee1:	89 04 24             	mov    %eax,(%esp)
 804bee4:	e8 c7 5e 00 00       	call   8051db0 <__sprint_r>
 804bee9:	85 c0                	test   %eax,%eax
 804beeb:	0f 85 d7 f4 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bef1:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bef7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804befa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bf00:	eb 9e                	jmp    804bea0 <_vfprintf_r+0xd50>
 804bf02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804bf08:	84 c0                	test   %al,%al
 804bf0a:	75 2c                	jne    804bf38 <_vfprintf_r+0xde8>
 804bf0c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804bf13:	74 23                	je     804bf38 <_vfprintf_r+0xde8>
 804bf15:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804bf1b:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 804bf1f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804bf25:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804bf28:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804bf2e:	e9 2d f7 ff ff       	jmp    804b660 <_vfprintf_r+0x510>
 804bf33:	90                   	nop
 804bf34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804bf38:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804bf3b:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
 804bf42:	00 00 00 
 804bf45:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804bf4b:	e9 10 f7 ff ff       	jmp    804b660 <_vfprintf_r+0x510>
 804bf50:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
 804bf56:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
 804bf5c:	85 f6                	test   %esi,%esi
 804bf5e:	0f 8e 26 fc ff ff    	jle    804bb8a <_vfprintf_r+0xa3a>
 804bf64:	83 fe 10             	cmp    $0x10,%esi
 804bf67:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bf6d:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804bf73:	7f 0b                	jg     804bf80 <_vfprintf_r+0xe30>
 804bf75:	eb 65                	jmp    804bfdc <_vfprintf_r+0xe8c>
 804bf77:	90                   	nop
 804bf78:	83 ee 10             	sub    $0x10,%esi
 804bf7b:	83 fe 10             	cmp    $0x10,%esi
 804bf7e:	7e 5c                	jle    804bfdc <_vfprintf_r+0xe8c>
 804bf80:	83 c0 01             	add    $0x1,%eax
 804bf83:	83 c1 10             	add    $0x10,%ecx
 804bf86:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804bf8c:	83 c7 08             	add    $0x8,%edi
 804bf8f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804bf96:	83 f8 07             	cmp    $0x7,%eax
 804bf99:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bf9f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bfa5:	7e d1                	jle    804bf78 <_vfprintf_r+0xe28>
 804bfa7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bfaa:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804bfae:	89 44 24 04          	mov    %eax,0x4(%esp)
 804bfb2:	8b 45 08             	mov    0x8(%ebp),%eax
 804bfb5:	89 04 24             	mov    %eax,(%esp)
 804bfb8:	e8 f3 5d 00 00       	call   8051db0 <__sprint_r>
 804bfbd:	85 c0                	test   %eax,%eax
 804bfbf:	0f 85 03 f4 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804bfc5:	83 ee 10             	sub    $0x10,%esi
 804bfc8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804bfce:	83 fe 10             	cmp    $0x10,%esi
 804bfd1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804bfd7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804bfda:	7f a4                	jg     804bf80 <_vfprintf_r+0xe30>
 804bfdc:	83 c0 01             	add    $0x1,%eax
 804bfdf:	01 f1                	add    %esi,%ecx
 804bfe1:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804bfe7:	83 c7 08             	add    $0x8,%edi
 804bfea:	89 77 fc             	mov    %esi,-0x4(%edi)
 804bfed:	83 f8 07             	cmp    $0x7,%eax
 804bff0:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804bff6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804bffc:	0f 8e 88 fb ff ff    	jle    804bb8a <_vfprintf_r+0xa3a>
 804c002:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c008:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c00c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c00f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c013:	8b 45 08             	mov    0x8(%ebp),%eax
 804c016:	89 04 24             	mov    %eax,(%esp)
 804c019:	e8 92 5d 00 00       	call   8051db0 <__sprint_r>
 804c01e:	85 c0                	test   %eax,%eax
 804c020:	0f 85 a2 f3 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c026:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c02c:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c02f:	e9 56 fb ff ff       	jmp    804bb8a <_vfprintf_r+0xa3a>
 804c034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c038:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
 804c03f:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804c045:	0f 8e b7 05 00 00    	jle    804c602 <_vfprintf_r+0x14b2>
 804c04b:	89 07                	mov    %eax,(%edi)
 804c04d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c053:	8d 51 01             	lea    0x1(%ecx),%edx
 804c056:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804c05d:	83 c7 08             	add    $0x8,%edi
 804c060:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c066:	83 c0 01             	add    $0x1,%eax
 804c069:	83 f8 07             	cmp    $0x7,%eax
 804c06c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c072:	0f 8f f9 05 00 00    	jg     804c671 <_vfprintf_r+0x1521>
 804c078:	8b 9d 18 ff ff ff    	mov    -0xe8(%ebp),%ebx
 804c07e:	83 c0 01             	add    $0x1,%eax
 804c081:	83 c7 08             	add    $0x8,%edi
 804c084:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c08a:	89 5f f8             	mov    %ebx,-0x8(%edi)
 804c08d:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
 804c093:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804c096:	01 da                	add    %ebx,%edx
 804c098:	83 f8 07             	cmp    $0x7,%eax
 804c09b:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c0a1:	0f 8f 12 06 00 00    	jg     804c6b9 <_vfprintf_r+0x1569>
 804c0a7:	90                   	nop
 804c0a8:	90                   	nop
 804c0a9:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c0af:	df e9                	fucomip %st(1),%st
 804c0b1:	dd d8                	fstp   %st(0)
 804c0b3:	7a 06                	jp     804c0bb <_vfprintf_r+0xf6b>
 804c0b5:	0f 84 33 03 00 00    	je     804c3ee <_vfprintf_r+0x129e>
 804c0bb:	8b 8d 2c ff ff ff    	mov    -0xd4(%ebp),%ecx
 804c0c1:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804c0c7:	83 c1 01             	add    $0x1,%ecx
 804c0ca:	89 0f                	mov    %ecx,(%edi)
 804c0cc:	8d 4b ff             	lea    -0x1(%ebx),%ecx
 804c0cf:	89 4f 04             	mov    %ecx,0x4(%edi)
 804c0d2:	01 ca                	add    %ecx,%edx
 804c0d4:	83 c0 01             	add    $0x1,%eax
 804c0d7:	83 f8 07             	cmp    $0x7,%eax
 804c0da:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c0e0:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c0e6:	0f 8f 4d 05 00 00    	jg     804c639 <_vfprintf_r+0x14e9>
 804c0ec:	83 c7 08             	add    $0x8,%edi
 804c0ef:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
 804c0f5:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
 804c0fb:	89 0f                	mov    %ecx,(%edi)
 804c0fd:	89 5f 04             	mov    %ebx,0x4(%edi)
 804c100:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
 804c103:	83 c0 01             	add    $0x1,%eax
 804c106:	83 f8 07             	cmp    $0x7,%eax
 804c109:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c10f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c115:	0f 8e 96 fb ff ff    	jle    804bcb1 <_vfprintf_r+0xb61>
 804c11b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c121:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c125:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c128:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c12c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c12f:	89 04 24             	mov    %eax,(%esp)
 804c132:	e8 79 5c 00 00       	call   8051db0 <__sprint_r>
 804c137:	85 c0                	test   %eax,%eax
 804c139:	0f 85 89 f2 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c13f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c145:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c148:	e9 67 fb ff ff       	jmp    804bcb4 <_vfprintf_r+0xb64>
 804c14d:	8d 76 00             	lea    0x0(%esi),%esi
 804c150:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c156:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c15d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c161:	8b 45 08             	mov    0x8(%ebp),%eax
 804c164:	89 04 24             	mov    %eax,(%esp)
 804c167:	e8 44 5c 00 00       	call   8051db0 <__sprint_r>
 804c16c:	85 c0                	test   %eax,%eax
 804c16e:	0f 84 43 fc ff ff    	je     804bdb7 <_vfprintf_r+0xc67>
 804c174:	e9 4f f2 ff ff       	jmp    804b3c8 <_vfprintf_r+0x278>
 804c179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804c180:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c186:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c18d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c191:	8b 45 08             	mov    0x8(%ebp),%eax
 804c194:	89 04 24             	mov    %eax,(%esp)
 804c197:	e8 14 5c 00 00       	call   8051db0 <__sprint_r>
 804c19c:	85 c0                	test   %eax,%eax
 804c19e:	0f 85 24 f2 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c1a4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c1aa:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c1ad:	e9 8b f9 ff ff       	jmp    804bb3d <_vfprintf_r+0x9ed>
 804c1b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c1b8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c1be:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c1c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c1c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 804c1cc:	89 04 24             	mov    %eax,(%esp)
 804c1cf:	e8 dc 5b 00 00       	call   8051db0 <__sprint_r>
 804c1d4:	85 c0                	test   %eax,%eax
 804c1d6:	0f 85 ec f1 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c1dc:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c1e2:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c1e5:	e9 90 f9 ff ff       	jmp    804bb7a <_vfprintf_r+0xa2a>
 804c1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c1f0:	89 c2                	mov    %eax,%edx
 804c1f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c1f8:	89 c8                	mov    %ecx,%eax
 804c1fa:	83 ea 01             	sub    $0x1,%edx
 804c1fd:	83 e0 07             	and    $0x7,%eax
 804c200:	c1 e9 03             	shr    $0x3,%ecx
 804c203:	83 c0 30             	add    $0x30,%eax
 804c206:	85 c9                	test   %ecx,%ecx
 804c208:	88 02                	mov    %al,(%edx)
 804c20a:	75 ec                	jne    804c1f8 <_vfprintf_r+0x10a8>
 804c20c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c213:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
 804c219:	0f 84 5b 01 00 00    	je     804c37a <_vfprintf_r+0x122a>
 804c21f:	3c 30                	cmp    $0x30,%al
 804c221:	74 0b                	je     804c22e <_vfprintf_r+0x10de>
 804c223:	83 ad 2c ff ff ff 01 	subl   $0x1,-0xd4(%ebp)
 804c22a:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 804c22e:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c231:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804c237:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c23d:	e9 1e f4 ff ff       	jmp    804b660 <_vfprintf_r+0x510>
 804c242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c248:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804c24e:	85 db                	test   %ebx,%ebx
 804c250:	0f 8e 9f 06 00 00    	jle    804c8f5 <_vfprintf_r+0x17a5>
 804c256:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804c25c:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
 804c262:	01 d0                	add    %edx,%eax
 804c264:	89 c3                	mov    %eax,%ebx
 804c266:	29 d3                	sub    %edx,%ebx
 804c268:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804c26e:	89 d0                	mov    %edx,%eax
 804c270:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804c276:	39 d3                	cmp    %edx,%ebx
 804c278:	0f 4f da             	cmovg  %edx,%ebx
 804c27b:	85 db                	test   %ebx,%ebx
 804c27d:	7e 28                	jle    804c2a7 <_vfprintf_r+0x1157>
 804c27f:	89 07                	mov    %eax,(%edi)
 804c281:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c287:	01 d9                	add    %ebx,%ecx
 804c289:	89 5f 04             	mov    %ebx,0x4(%edi)
 804c28c:	83 c7 08             	add    $0x8,%edi
 804c28f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c295:	83 c0 01             	add    $0x1,%eax
 804c298:	83 f8 07             	cmp    $0x7,%eax
 804c29b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c2a1:	0f 8f e2 08 00 00    	jg     804cb89 <_vfprintf_r+0x1a39>
 804c2a7:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
 804c2ad:	31 c0                	xor    %eax,%eax
 804c2af:	85 db                	test   %ebx,%ebx
 804c2b1:	0f 49 c3             	cmovns %ebx,%eax
 804c2b4:	29 c6                	sub    %eax,%esi
 804c2b6:	85 f6                	test   %esi,%esi
 804c2b8:	0f 8e 13 02 00 00    	jle    804c4d1 <_vfprintf_r+0x1381>
 804c2be:	83 fe 10             	cmp    $0x10,%esi
 804c2c1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c2c7:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c2cd:	7f 15                	jg     804c2e4 <_vfprintf_r+0x1194>
 804c2cf:	e9 ae 01 00 00       	jmp    804c482 <_vfprintf_r+0x1332>
 804c2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c2d8:	83 ee 10             	sub    $0x10,%esi
 804c2db:	83 fe 10             	cmp    $0x10,%esi
 804c2de:	0f 8e 9e 01 00 00    	jle    804c482 <_vfprintf_r+0x1332>
 804c2e4:	83 c0 01             	add    $0x1,%eax
 804c2e7:	83 c1 10             	add    $0x10,%ecx
 804c2ea:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c2f0:	83 c7 08             	add    $0x8,%edi
 804c2f3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c2fa:	83 f8 07             	cmp    $0x7,%eax
 804c2fd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c303:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c309:	7e cd                	jle    804c2d8 <_vfprintf_r+0x1188>
 804c30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c30e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c312:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c316:	8b 45 08             	mov    0x8(%ebp),%eax
 804c319:	89 04 24             	mov    %eax,(%esp)
 804c31c:	e8 8f 5a 00 00       	call   8051db0 <__sprint_r>
 804c321:	85 c0                	test   %eax,%eax
 804c323:	0f 85 9f f0 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c329:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c32f:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c332:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c338:	eb 9e                	jmp    804c2d8 <_vfprintf_r+0x1188>
 804c33a:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c33d:	be cd cc cc cc       	mov    $0xcccccccd,%esi
 804c342:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 804c348:	89 c7                	mov    %eax,%edi
 804c34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c350:	89 c8                	mov    %ecx,%eax
 804c352:	83 ef 01             	sub    $0x1,%edi
 804c355:	f7 e6                	mul    %esi
 804c357:	c1 ea 03             	shr    $0x3,%edx
 804c35a:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804c35d:	01 c0                	add    %eax,%eax
 804c35f:	29 c1                	sub    %eax,%ecx
 804c361:	83 c1 30             	add    $0x30,%ecx
 804c364:	85 d2                	test   %edx,%edx
 804c366:	88 0f                	mov    %cl,(%edi)
 804c368:	89 d1                	mov    %edx,%ecx
 804c36a:	75 e4                	jne    804c350 <_vfprintf_r+0x1200>
 804c36c:	89 fa                	mov    %edi,%edx
 804c36e:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%ebp)
 804c374:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
 804c37a:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804c37d:	29 d0                	sub    %edx,%eax
 804c37f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c385:	e9 d6 f2 ff ff       	jmp    804b660 <_vfprintf_r+0x510>
 804c38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c390:	83 f9 09             	cmp    $0x9,%ecx
 804c393:	77 a5                	ja     804c33a <_vfprintf_r+0x11ea>
 804c395:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 804c39b:	83 c1 30             	add    $0x30,%ecx
 804c39e:	88 4d a7             	mov    %cl,-0x59(%ebp)
 804c3a1:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804c3a7:	8d 45 a7             	lea    -0x59(%ebp),%eax
 804c3aa:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804c3b0:	e9 ab f2 ff ff       	jmp    804b660 <_vfprintf_r+0x510>
 804c3b5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c3bb:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c3c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 804c3c9:	89 04 24             	mov    %eax,(%esp)
 804c3cc:	e8 df 59 00 00       	call   8051db0 <__sprint_r>
 804c3d1:	85 c0                	test   %eax,%eax
 804c3d3:	0f 85 ef ef ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c3d9:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804c3e0:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c3e3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c3e9:	e9 18 f7 ff ff       	jmp    804bb06 <_vfprintf_r+0x9b6>
 804c3ee:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804c3f4:	8d 73 ff             	lea    -0x1(%ebx),%esi
 804c3f7:	85 f6                	test   %esi,%esi
 804c3f9:	0f 8e f0 fc ff ff    	jle    804c0ef <_vfprintf_r+0xf9f>
 804c3ff:	83 fe 10             	cmp    $0x10,%esi
 804c402:	0f 8e a1 02 00 00    	jle    804c6a9 <_vfprintf_r+0x1559>
 804c408:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c40e:	eb 0c                	jmp    804c41c <_vfprintf_r+0x12cc>
 804c410:	83 ee 10             	sub    $0x10,%esi
 804c413:	83 fe 10             	cmp    $0x10,%esi
 804c416:	0f 8e 8d 02 00 00    	jle    804c6a9 <_vfprintf_r+0x1559>
 804c41c:	83 c0 01             	add    $0x1,%eax
 804c41f:	83 c2 10             	add    $0x10,%edx
 804c422:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c428:	83 c7 08             	add    $0x8,%edi
 804c42b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c432:	83 f8 07             	cmp    $0x7,%eax
 804c435:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c43b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c441:	7e cd                	jle    804c410 <_vfprintf_r+0x12c0>
 804c443:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c446:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c44a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c44e:	8b 45 08             	mov    0x8(%ebp),%eax
 804c451:	89 04 24             	mov    %eax,(%esp)
 804c454:	e8 57 59 00 00       	call   8051db0 <__sprint_r>
 804c459:	85 c0                	test   %eax,%eax
 804c45b:	0f 85 67 ef ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c461:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c467:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c46a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c470:	eb 9e                	jmp    804c410 <_vfprintf_r+0x12c0>
 804c472:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c478:	01 f1                	add    %esi,%ecx
 804c47a:	89 77 04             	mov    %esi,0x4(%edi)
 804c47d:	e9 81 fc ff ff       	jmp    804c103 <_vfprintf_r+0xfb3>
 804c482:	83 c0 01             	add    $0x1,%eax
 804c485:	01 f1                	add    %esi,%ecx
 804c487:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c48d:	83 c7 08             	add    $0x8,%edi
 804c490:	89 77 fc             	mov    %esi,-0x4(%edi)
 804c493:	83 f8 07             	cmp    $0x7,%eax
 804c496:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c49c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c4a2:	7e 2d                	jle    804c4d1 <_vfprintf_r+0x1381>
 804c4a4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c4aa:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c4ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c4b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 804c4b8:	89 04 24             	mov    %eax,(%esp)
 804c4bb:	e8 f0 58 00 00       	call   8051db0 <__sprint_r>
 804c4c0:	85 c0                	test   %eax,%eax
 804c4c2:	0f 85 00 ef ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c4c8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c4ce:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c4d1:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804c4d7:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c4dd:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
 804c4e3:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
 804c4e9:	89 c6                	mov    %eax,%esi
 804c4eb:	7c 0d                	jl     804c4fa <_vfprintf_r+0x13aa>
 804c4ed:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c4f4:	0f 84 61 05 00 00    	je     804ca5b <_vfprintf_r+0x190b>
 804c4fa:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804c500:	89 07                	mov    %eax,(%edi)
 804c502:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804c508:	01 c1                	add    %eax,%ecx
 804c50a:	89 47 04             	mov    %eax,0x4(%edi)
 804c50d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c513:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c519:	83 c0 01             	add    $0x1,%eax
 804c51c:	83 f8 07             	cmp    $0x7,%eax
 804c51f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c525:	0f 8f 90 06 00 00    	jg     804cbbb <_vfprintf_r+0x1a6b>
 804c52b:	83 c7 08             	add    $0x8,%edi
 804c52e:	89 d0                	mov    %edx,%eax
 804c530:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804c536:	89 f2                	mov    %esi,%edx
 804c538:	29 f3                	sub    %esi,%ebx
 804c53a:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804c540:	29 c6                	sub    %eax,%esi
 804c542:	39 de                	cmp    %ebx,%esi
 804c544:	0f 4e de             	cmovle %esi,%ebx
 804c547:	85 db                	test   %ebx,%ebx
 804c549:	7e 29                	jle    804c574 <_vfprintf_r+0x1424>
 804c54b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c551:	01 d9                	add    %ebx,%ecx
 804c553:	83 c7 08             	add    $0x8,%edi
 804c556:	89 57 f8             	mov    %edx,-0x8(%edi)
 804c559:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804c55c:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c562:	83 c0 01             	add    $0x1,%eax
 804c565:	83 f8 07             	cmp    $0x7,%eax
 804c568:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c56e:	0f 8f 7f 06 00 00    	jg     804cbf3 <_vfprintf_r+0x1aa3>
 804c574:	31 c0                	xor    %eax,%eax
 804c576:	85 db                	test   %ebx,%ebx
 804c578:	0f 49 c3             	cmovns %ebx,%eax
 804c57b:	29 c6                	sub    %eax,%esi
 804c57d:	85 f6                	test   %esi,%esi
 804c57f:	0f 8e 2f f7 ff ff    	jle    804bcb4 <_vfprintf_r+0xb64>
 804c585:	83 fe 10             	cmp    $0x10,%esi
 804c588:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c58e:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 804c594:	7f 16                	jg     804c5ac <_vfprintf_r+0x145c>
 804c596:	e9 d7 fe ff ff       	jmp    804c472 <_vfprintf_r+0x1322>
 804c59b:	90                   	nop
 804c59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804c5a0:	83 ee 10             	sub    $0x10,%esi
 804c5a3:	83 fe 10             	cmp    $0x10,%esi
 804c5a6:	0f 8e c6 fe ff ff    	jle    804c472 <_vfprintf_r+0x1322>
 804c5ac:	83 c0 01             	add    $0x1,%eax
 804c5af:	83 c1 10             	add    $0x10,%ecx
 804c5b2:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c5b8:	83 c7 08             	add    $0x8,%edi
 804c5bb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c5c2:	83 f8 07             	cmp    $0x7,%eax
 804c5c5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c5cb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c5d1:	7e cd                	jle    804c5a0 <_vfprintf_r+0x1450>
 804c5d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c5d6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804c5da:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c5de:	8b 45 08             	mov    0x8(%ebp),%eax
 804c5e1:	89 04 24             	mov    %eax,(%esp)
 804c5e4:	e8 c7 57 00 00       	call   8051db0 <__sprint_r>
 804c5e9:	85 c0                	test   %eax,%eax
 804c5eb:	0f 85 d7 ed ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c5f1:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c5f7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c5fa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c600:	eb 9e                	jmp    804c5a0 <_vfprintf_r+0x1450>
 804c602:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804c609:	0f 85 3c fa ff ff    	jne    804c04b <_vfprintf_r+0xefb>
 804c60f:	89 07                	mov    %eax,(%edi)
 804c611:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c617:	8d 51 01             	lea    0x1(%ecx),%edx
 804c61a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
 804c621:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c627:	83 c0 01             	add    $0x1,%eax
 804c62a:	83 f8 07             	cmp    $0x7,%eax
 804c62d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c633:	0f 8e b3 fa ff ff    	jle    804c0ec <_vfprintf_r+0xf9c>
 804c639:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c63f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c643:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c646:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c64a:	8b 45 08             	mov    0x8(%ebp),%eax
 804c64d:	89 04 24             	mov    %eax,(%esp)
 804c650:	e8 5b 57 00 00       	call   8051db0 <__sprint_r>
 804c655:	85 c0                	test   %eax,%eax
 804c657:	0f 85 6b ed ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c65d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c663:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c666:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c66c:	e9 7e fa ff ff       	jmp    804c0ef <_vfprintf_r+0xf9f>
 804c671:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c677:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c67b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c67e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c682:	8b 45 08             	mov    0x8(%ebp),%eax
 804c685:	89 04 24             	mov    %eax,(%esp)
 804c688:	e8 23 57 00 00       	call   8051db0 <__sprint_r>
 804c68d:	85 c0                	test   %eax,%eax
 804c68f:	0f 85 33 ed ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c695:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c69b:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c69e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c6a4:	e9 cf f9 ff ff       	jmp    804c078 <_vfprintf_r+0xf28>
 804c6a9:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c6af:	01 f2                	add    %esi,%edx
 804c6b1:	89 77 04             	mov    %esi,0x4(%edi)
 804c6b4:	e9 1b fa ff ff       	jmp    804c0d4 <_vfprintf_r+0xf84>
 804c6b9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c6bf:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c6c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c6c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 804c6cd:	89 04 24             	mov    %eax,(%esp)
 804c6d0:	e8 db 56 00 00       	call   8051db0 <__sprint_r>
 804c6d5:	85 c0                	test   %eax,%eax
 804c6d7:	0f 85 eb ec ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c6dd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c6e3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c6e6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c6ec:	e9 b6 f9 ff ff       	jmp    804c0a7 <_vfprintf_r+0xf57>
 804c6f1:	f7 d9                	neg    %ecx
 804c6f3:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804c6f8:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804c6ff:	b8 01 00 00 00       	mov    $0x1,%eax
 804c704:	e9 e8 ee ff ff       	jmp    804b5f1 <_vfprintf_r+0x4a1>
 804c709:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c70f:	dd 1c 24             	fstpl  (%esp)
 804c712:	e8 89 43 00 00       	call   8050aa0 <__fpclassifyd>
 804c717:	85 c0                	test   %eax,%eax
 804c719:	0f 84 e4 02 00 00    	je     804ca03 <_vfprintf_r+0x18b3>
 804c71f:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
 804c725:	83 e3 df             	and    $0xffffffdf,%ebx
 804c728:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
 804c72f:	0f 84 b1 07 00 00    	je     804cee6 <_vfprintf_r+0x1d96>
 804c735:	83 fb 47             	cmp    $0x47,%ebx
 804c738:	75 16                	jne    804c750 <_vfprintf_r+0x1600>
 804c73a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804c740:	b8 01 00 00 00       	mov    $0x1,%eax
 804c745:	85 d2                	test   %edx,%edx
 804c747:	0f 45 c2             	cmovne %edx,%eax
 804c74a:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 804c750:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804c756:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
 804c75c:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
 804c762:	80 cc 01             	or     $0x1,%ah
 804c765:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
 804c76b:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 804c771:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
 804c778:	85 c0                	test   %eax,%eax
 804c77a:	0f 88 58 07 00 00    	js     804ced8 <_vfprintf_r+0x1d88>
 804c780:	83 fb 46             	cmp    $0x46,%ebx
 804c783:	0f 94 c0             	sete   %al
 804c786:	89 c6                	mov    %eax,%esi
 804c788:	0f 84 f0 04 00 00    	je     804cc7e <_vfprintf_r+0x1b2e>
 804c78e:	83 fb 45             	cmp    $0x45,%ebx
 804c791:	0f 85 37 07 00 00    	jne    804cece <_vfprintf_r+0x1d7e>
 804c797:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804c79d:	dd 54 24 04          	fstl   0x4(%esp)
 804c7a1:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 804c7a8:	00 
 804c7a9:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804c7af:	8d 70 01             	lea    0x1(%eax),%esi
 804c7b2:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804c7b8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804c7bc:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804c7c2:	89 44 24 18          	mov    %eax,0x18(%esp)
 804c7c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804c7cc:	89 44 24 14          	mov    %eax,0x14(%esp)
 804c7d0:	8b 45 08             	mov    0x8(%ebp),%eax
 804c7d3:	89 74 24 10          	mov    %esi,0x10(%esp)
 804c7d7:	89 04 24             	mov    %eax,(%esp)
 804c7da:	e8 f1 0c 00 00       	call   804d4d0 <_dtoa_r>
 804c7df:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804c7e5:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
 804c7e8:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804c7ee:	90                   	nop
 804c7ef:	90                   	nop
 804c7f0:	d9 c9                	fxch   %st(1)
 804c7f2:	df e9                	fucomip %st(1),%st
 804c7f4:	dd d8                	fstp   %st(0)
 804c7f6:	0f 8a f8 01 00 00    	jp     804c9f4 <_vfprintf_r+0x18a4>
 804c7fc:	89 c8                	mov    %ecx,%eax
 804c7fe:	0f 85 f0 01 00 00    	jne    804c9f4 <_vfprintf_r+0x18a4>
 804c804:	2b 85 2c ff ff ff    	sub    -0xd4(%ebp),%eax
 804c80a:	83 fb 47             	cmp    $0x47,%ebx
 804c80d:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804c813:	0f 84 4b 05 00 00    	je     804cd64 <_vfprintf_r+0x1c14>
 804c819:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
 804c820:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804c826:	0f 8e 92 05 00 00    	jle    804cdbe <_vfprintf_r+0x1c6e>
 804c82c:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
 804c833:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804c839:	0f 84 b6 06 00 00    	je     804cef5 <_vfprintf_r+0x1da5>
 804c83f:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
 804c845:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
 804c84b:	0f 8f 4a 06 00 00    	jg     804ce9b <_vfprintf_r+0x1d4b>
 804c851:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804c857:	83 e0 01             	and    $0x1,%eax
 804c85a:	0f 85 79 07 00 00    	jne    804cfd9 <_vfprintf_r+0x1e89>
 804c860:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804c866:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804c86d:	00 00 00 
 804c870:	85 d2                	test   %edx,%edx
 804c872:	0f 49 c2             	cmovns %edx,%eax
 804c875:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804c87b:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
 804c882:	0f 85 95 04 00 00    	jne    804cd1d <_vfprintf_r+0x1bcd>
 804c888:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804c88e:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
 804c894:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804c89b:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804c8a2:	00 00 00 
 804c8a5:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804c8ab:	e9 f0 eb ff ff       	jmp    804b4a0 <_vfprintf_r+0x350>
 804c8b0:	dd 00                	fldl   (%eax)
 804c8b2:	83 c0 08             	add    $0x8,%eax
 804c8b5:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804c8bb:	89 45 14             	mov    %eax,0x14(%ebp)
 804c8be:	e9 d1 ef ff ff       	jmp    804b894 <_vfprintf_r+0x744>
 804c8c3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804c8c9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c8cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c8d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c8d4:	8b 45 08             	mov    0x8(%ebp),%eax
 804c8d7:	89 04 24             	mov    %eax,(%esp)
 804c8da:	e8 d1 54 00 00       	call   8051db0 <__sprint_r>
 804c8df:	85 c0                	test   %eax,%eax
 804c8e1:	0f 85 e1 ea ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c8e7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804c8ed:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c8f0:	e9 32 f5 ff ff       	jmp    804be27 <_vfprintf_r+0xcd7>
 804c8f5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c8fb:	83 c1 01             	add    $0x1,%ecx
 804c8fe:	83 c7 08             	add    $0x8,%edi
 804c901:	c7 47 f8 e7 42 05 08 	movl   $0x80542e7,-0x8(%edi)
 804c908:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
 804c90f:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
 804c915:	83 c0 01             	add    $0x1,%eax
 804c918:	83 f8 07             	cmp    $0x7,%eax
 804c91b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c921:	0f 8f 5b 01 00 00    	jg     804ca82 <_vfprintf_r+0x1932>
 804c927:	85 db                	test   %ebx,%ebx
 804c929:	0f 84 33 01 00 00    	je     804ca62 <_vfprintf_r+0x1912>
 804c92f:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
 804c935:	83 c7 08             	add    $0x8,%edi
 804c938:	89 47 f8             	mov    %eax,-0x8(%edi)
 804c93b:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
 804c941:	89 47 fc             	mov    %eax,-0x4(%edi)
 804c944:	8d 14 01             	lea    (%ecx,%eax,1),%edx
 804c947:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c94d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c953:	83 c0 01             	add    $0x1,%eax
 804c956:	83 f8 07             	cmp    $0x7,%eax
 804c959:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c95f:	0f 8f e3 04 00 00    	jg     804ce48 <_vfprintf_r+0x1cf8>
 804c965:	f7 db                	neg    %ebx
 804c967:	85 db                	test   %ebx,%ebx
 804c969:	0f 8e d2 01 00 00    	jle    804cb41 <_vfprintf_r+0x19f1>
 804c96f:	83 fb 10             	cmp    $0x10,%ebx
 804c972:	0f 8e 74 01 00 00    	jle    804caec <_vfprintf_r+0x199c>
 804c978:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
 804c97e:	eb 0c                	jmp    804c98c <_vfprintf_r+0x183c>
 804c980:	83 eb 10             	sub    $0x10,%ebx
 804c983:	83 fb 10             	cmp    $0x10,%ebx
 804c986:	0f 8e 60 01 00 00    	jle    804caec <_vfprintf_r+0x199c>
 804c98c:	83 c0 01             	add    $0x1,%eax
 804c98f:	83 c2 10             	add    $0x10,%edx
 804c992:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804c998:	83 c7 08             	add    $0x8,%edi
 804c99b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
 804c9a2:	83 f8 07             	cmp    $0x7,%eax
 804c9a5:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804c9ab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804c9b1:	7e cd                	jle    804c980 <_vfprintf_r+0x1830>
 804c9b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c9b6:	89 74 24 08          	mov    %esi,0x8(%esp)
 804c9ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c9be:	8b 45 08             	mov    0x8(%ebp),%eax
 804c9c1:	89 04 24             	mov    %eax,(%esp)
 804c9c4:	e8 e7 53 00 00       	call   8051db0 <__sprint_r>
 804c9c9:	85 c0                	test   %eax,%eax
 804c9cb:	0f 85 f7 e9 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804c9d1:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804c9d7:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804c9da:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804c9e0:	eb 9e                	jmp    804c980 <_vfprintf_r+0x1830>
 804c9e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804c9e8:	8d 50 01             	lea    0x1(%eax),%edx
 804c9eb:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
 804c9f1:	c6 00 30             	movb   $0x30,(%eax)
 804c9f4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804c9fa:	39 c1                	cmp    %eax,%ecx
 804c9fc:	77 ea                	ja     804c9e8 <_vfprintf_r+0x1898>
 804c9fe:	e9 01 fe ff ff       	jmp    804c804 <_vfprintf_r+0x16b4>
 804ca03:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
 804ca0a:	ba f4 45 05 08       	mov    $0x80545f4,%edx
 804ca0f:	b8 f8 45 05 08       	mov    $0x80545f8,%eax
 804ca14:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804ca1b:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
 804ca22:	00 00 00 
 804ca25:	0f 4e c2             	cmovle %edx,%eax
 804ca28:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804ca2e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
 804ca35:	ff ff ff 
 804ca38:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
 804ca3f:	00 00 00 
 804ca42:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ca49:	00 00 00 
 804ca4c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ca53:	00 00 00 
 804ca56:	e9 45 ea ff ff       	jmp    804b4a0 <_vfprintf_r+0x350>
 804ca5b:	89 d0                	mov    %edx,%eax
 804ca5d:	e9 ce fa ff ff       	jmp    804c530 <_vfprintf_r+0x13e0>
 804ca62:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
 804ca68:	85 d2                	test   %edx,%edx
 804ca6a:	0f 85 bf fe ff ff    	jne    804c92f <_vfprintf_r+0x17df>
 804ca70:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804ca77:	0f 84 37 f2 ff ff    	je     804bcb4 <_vfprintf_r+0xb64>
 804ca7d:	e9 ad fe ff ff       	jmp    804c92f <_vfprintf_r+0x17df>
 804ca82:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ca88:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ca8c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ca8f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ca93:	8b 45 08             	mov    0x8(%ebp),%eax
 804ca96:	89 04 24             	mov    %eax,(%esp)
 804ca99:	e8 12 53 00 00       	call   8051db0 <__sprint_r>
 804ca9e:	85 c0                	test   %eax,%eax
 804caa0:	0f 85 22 e9 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804caa6:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804caac:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804caaf:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cab5:	e9 6d fe ff ff       	jmp    804c927 <_vfprintf_r+0x17d7>
 804caba:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cac0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cac4:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cac7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cacb:	8b 45 08             	mov    0x8(%ebp),%eax
 804cace:	89 04 24             	mov    %eax,(%esp)
 804cad1:	e8 da 52 00 00       	call   8051db0 <__sprint_r>
 804cad6:	85 c0                	test   %eax,%eax
 804cad8:	0f 85 ea e8 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804cade:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cae4:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cae7:	e9 8b f3 ff ff       	jmp    804be77 <_vfprintf_r+0xd27>
 804caec:	83 c0 01             	add    $0x1,%eax
 804caef:	01 da                	add    %ebx,%edx
 804caf1:	c7 07 10 49 05 08    	movl   $0x8054910,(%edi)
 804caf7:	83 c7 08             	add    $0x8,%edi
 804cafa:	89 5f fc             	mov    %ebx,-0x4(%edi)
 804cafd:	83 f8 07             	cmp    $0x7,%eax
 804cb00:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804cb06:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804cb0c:	7e 33                	jle    804cb41 <_vfprintf_r+0x19f1>
 804cb0e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cb14:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cb18:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cb1b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cb1f:	8b 45 08             	mov    0x8(%ebp),%eax
 804cb22:	89 04 24             	mov    %eax,(%esp)
 804cb25:	e8 86 52 00 00       	call   8051db0 <__sprint_r>
 804cb2a:	85 c0                	test   %eax,%eax
 804cb2c:	0f 85 96 e8 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804cb32:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804cb38:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cb3b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804cb41:	8b 9d 2c ff ff ff    	mov    -0xd4(%ebp),%ebx
 804cb47:	83 c0 01             	add    $0x1,%eax
 804cb4a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 804cb50:	89 1f                	mov    %ebx,(%edi)
 804cb52:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804cb58:	01 da                	add    %ebx,%edx
 804cb5a:	83 f8 07             	cmp    $0x7,%eax
 804cb5d:	89 5f 04             	mov    %ebx,0x4(%edi)
 804cb60:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 804cb66:	0f 8f af f5 ff ff    	jg     804c11b <_vfprintf_r+0xfcb>
 804cb6c:	83 c7 08             	add    $0x8,%edi
 804cb6f:	89 d1                	mov    %edx,%ecx
 804cb71:	e9 3e f1 ff ff       	jmp    804bcb4 <_vfprintf_r+0xb64>
 804cb76:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804cb7c:	89 04 24             	mov    %eax,(%esp)
 804cb7f:	e8 4c c6 ff ff       	call   80491d0 <strlen>
 804cb84:	e9 df e8 ff ff       	jmp    804b468 <_vfprintf_r+0x318>
 804cb89:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cb8f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cb93:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cb96:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cb9a:	8b 45 08             	mov    0x8(%ebp),%eax
 804cb9d:	89 04 24             	mov    %eax,(%esp)
 804cba0:	e8 0b 52 00 00       	call   8051db0 <__sprint_r>
 804cba5:	85 c0                	test   %eax,%eax
 804cba7:	0f 85 1b e8 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804cbad:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cbb3:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cbb6:	e9 ec f6 ff ff       	jmp    804c2a7 <_vfprintf_r+0x1157>
 804cbbb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cbc1:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cbc5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cbc8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cbcc:	8b 45 08             	mov    0x8(%ebp),%eax
 804cbcf:	89 04 24             	mov    %eax,(%esp)
 804cbd2:	e8 d9 51 00 00       	call   8051db0 <__sprint_r>
 804cbd7:	85 c0                	test   %eax,%eax
 804cbd9:	0f 85 e9 e7 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804cbdf:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cbe5:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cbe8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cbee:	e9 3d f9 ff ff       	jmp    804c530 <_vfprintf_r+0x13e0>
 804cbf3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cbf9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cbfd:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cc00:	89 44 24 04          	mov    %eax,0x4(%esp)
 804cc04:	8b 45 08             	mov    0x8(%ebp),%eax
 804cc07:	89 04 24             	mov    %eax,(%esp)
 804cc0a:	e8 a1 51 00 00       	call   8051db0 <__sprint_r>
 804cc0f:	85 c0                	test   %eax,%eax
 804cc11:	0f 85 b1 e7 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804cc17:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
 804cc1d:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804cc20:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
 804cc26:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
 804cc2c:	e9 43 f9 ff ff       	jmp    804c574 <_vfprintf_r+0x1424>
 804cc31:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804cc37:	b0 06                	mov    $0x6,%al
 804cc39:	89 75 14             	mov    %esi,0x14(%ebp)
 804cc3c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cc43:	00 00 00 
 804cc46:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804cc4d:	00 00 00 
 804cc50:	83 fa 06             	cmp    $0x6,%edx
 804cc53:	0f 46 c2             	cmovbe %edx,%eax
 804cc56:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804cc5c:	85 c0                	test   %eax,%eax
 804cc5e:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cc64:	c7 85 2c ff ff ff 1e 	movl   $0x805461e,-0xd4(%ebp)
 804cc6b:	46 05 08 
 804cc6e:	0f 49 d0             	cmovns %eax,%edx
 804cc71:	31 db                	xor    %ebx,%ebx
 804cc73:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
 804cc79:	e9 2d e8 ff ff       	jmp    804b4ab <_vfprintf_r+0x35b>
 804cc7e:	ba 03 00 00 00       	mov    $0x3,%edx
 804cc83:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
 804cc89:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804cc8d:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
 804cc93:	89 44 24 18          	mov    %eax,0x18(%esp)
 804cc97:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
 804cc9d:	89 44 24 14          	mov    %eax,0x14(%esp)
 804cca1:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804cca7:	dd 54 24 04          	fstl   0x4(%esp)
 804ccab:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ccaf:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804ccb5:	89 44 24 10          	mov    %eax,0x10(%esp)
 804ccb9:	8b 45 08             	mov    0x8(%ebp),%eax
 804ccbc:	89 04 24             	mov    %eax,(%esp)
 804ccbf:	e8 0c 08 00 00       	call   804d4d0 <_dtoa_r>
 804ccc4:	83 fb 47             	cmp    $0x47,%ebx
 804ccc7:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
 804cccd:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
 804ccd3:	75 09                	jne    804ccde <_vfprintf_r+0x1b8e>
 804ccd5:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804ccdc:	74 6c                	je     804cd4a <_vfprintf_r+0x1bfa>
 804ccde:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
 804cce4:	89 f0                	mov    %esi,%eax
 804cce6:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
 804ccec:	01 d1                	add    %edx,%ecx
 804ccee:	84 c0                	test   %al,%al
 804ccf0:	0f 84 f8 fa ff ff    	je     804c7ee <_vfprintf_r+0x169e>
 804ccf6:	80 3a 30             	cmpb   $0x30,(%edx)
 804ccf9:	0f 84 b2 02 00 00    	je     804cfb1 <_vfprintf_r+0x1e61>
 804ccff:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cd05:	01 c1                	add    %eax,%ecx
 804cd07:	e9 e2 fa ff ff       	jmp    804c7ee <_vfprintf_r+0x169e>
 804cd0c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804cd13:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804cd18:	e9 a9 eb ff ff       	jmp    804b8c6 <_vfprintf_r+0x776>
 804cd1d:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804cd23:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
 804cd29:	bb 2d 00 00 00       	mov    $0x2d,%ebx
 804cd2e:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
 804cd35:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cd3c:	00 00 00 
 804cd3f:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804cd45:	e9 5a e7 ff ff       	jmp    804b4a4 <_vfprintf_r+0x354>
 804cd4a:	dd d8                	fstp   %st(0)
 804cd4c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804cd52:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
 804cd58:	8b 85 2c ff ff ff    	mov    -0xd4(%ebp),%eax
 804cd5e:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
 804cd64:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 804cd6a:	83 f8 fd             	cmp    $0xfffffffd,%eax
 804cd6d:	7c 48                	jl     804cdb7 <_vfprintf_r+0x1c67>
 804cd6f:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
 804cd75:	7c 40                	jl     804cdb7 <_vfprintf_r+0x1c67>
 804cd77:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
 804cd7d:	e9 bd fa ff ff       	jmp    804c83f <_vfprintf_r+0x16ef>
 804cd82:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804cd88:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
 804cd8f:	89 75 14             	mov    %esi,0x14(%ebp)
 804cd92:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804cd99:	00 00 00 
 804cd9c:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
 804cda2:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cda8:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804cdaf:	00 00 00 
 804cdb2:	e9 e9 e6 ff ff       	jmp    804b4a0 <_vfprintf_r+0x350>
 804cdb7:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
 804cdbe:	8d 48 ff             	lea    -0x1(%eax),%ecx
 804cdc1:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
 804cdc8:	85 c9                	test   %ecx,%ecx
 804cdca:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 804cdd0:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
 804cdd6:	0f 88 af 02 00 00    	js     804d08b <_vfprintf_r+0x1f3b>
 804cddc:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
 804cde3:	83 f9 09             	cmp    $0x9,%ecx
 804cde6:	0f 8f 33 01 00 00    	jg     804cf1f <_vfprintf_r+0x1dcf>
 804cdec:	83 c1 30             	add    $0x30,%ecx
 804cdef:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
 804cdf6:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
 804cdfc:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
 804ce02:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
 804ce08:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
 804ce0e:	29 d0                	sub    %edx,%eax
 804ce10:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
 804ce16:	89 da                	mov    %ebx,%edx
 804ce18:	01 c2                	add    %eax,%edx
 804ce1a:	83 fb 01             	cmp    $0x1,%ebx
 804ce1d:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804ce23:	0f 8e 3f 02 00 00    	jle    804d068 <_vfprintf_r+0x1f18>
 804ce29:	31 c0                	xor    %eax,%eax
 804ce2b:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
 804ce32:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
 804ce39:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804ce40:	00 00 00 
 804ce43:	e9 33 fa ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804ce48:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804ce4e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ce52:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ce55:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ce59:	8b 45 08             	mov    0x8(%ebp),%eax
 804ce5c:	89 04 24             	mov    %eax,(%esp)
 804ce5f:	e8 4c 4f 00 00       	call   8051db0 <__sprint_r>
 804ce64:	85 c0                	test   %eax,%eax
 804ce66:	0f 85 5c e5 ff ff    	jne    804b3c8 <_vfprintf_r+0x278>
 804ce6c:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 804ce72:	8d 7d a8             	lea    -0x58(%ebp),%edi
 804ce75:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 804ce7b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804ce81:	e9 df fa ff ff       	jmp    804c965 <_vfprintf_r+0x1815>
 804ce86:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804ce8c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 804ce93:	00 00 00 
 804ce96:	e9 28 e4 ff ff       	jmp    804b2c3 <_vfprintf_r+0x173>
 804ce9b:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
 804cea1:	ba 01 00 00 00       	mov    $0x1,%edx
 804cea6:	85 c9                	test   %ecx,%ecx
 804cea8:	0f 8e 4e 01 00 00    	jle    804cffc <_vfprintf_r+0x1eac>
 804ceae:	31 c0                	xor    %eax,%eax
 804ceb0:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
 804ceb6:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804cebd:	00 00 00 
 804cec0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804cec6:	0f 49 c2             	cmovns %edx,%eax
 804cec9:	e9 ad f9 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804cece:	ba 02 00 00 00       	mov    $0x2,%edx
 804ced3:	e9 ab fd ff ff       	jmp    804cc83 <_vfprintf_r+0x1b33>
 804ced8:	d9 e0                	fchs   
 804ceda:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
 804cee1:	e9 9a f8 ff ff       	jmp    804c780 <_vfprintf_r+0x1630>
 804cee6:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
 804ceed:	00 00 00 
 804cef0:	e9 5b f8 ff ff       	jmp    804c750 <_vfprintf_r+0x1600>
 804cef5:	85 c0                	test   %eax,%eax
 804cef7:	0f 8e 43 01 00 00    	jle    804d040 <_vfprintf_r+0x1ef0>
 804cefd:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
 804cf03:	85 f6                	test   %esi,%esi
 804cf05:	0f 85 82 00 00 00    	jne    804cf8d <_vfprintf_r+0x1e3d>
 804cf0b:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804cf12:	75 79                	jne    804cf8d <_vfprintf_r+0x1e3d>
 804cf14:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cf1a:	e9 5c f9 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804cf1f:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
 804cf25:	89 f3                	mov    %esi,%ebx
 804cf27:	b8 67 66 66 66       	mov    $0x66666667,%eax
 804cf2c:	83 eb 01             	sub    $0x1,%ebx
 804cf2f:	f7 e9                	imul   %ecx
 804cf31:	89 c8                	mov    %ecx,%eax
 804cf33:	c1 f8 1f             	sar    $0x1f,%eax
 804cf36:	c1 fa 02             	sar    $0x2,%edx
 804cf39:	29 c2                	sub    %eax,%edx
 804cf3b:	8d 04 92             	lea    (%edx,%edx,4),%eax
 804cf3e:	01 c0                	add    %eax,%eax
 804cf40:	29 c1                	sub    %eax,%ecx
 804cf42:	83 fa 09             	cmp    $0x9,%edx
 804cf45:	8d 41 30             	lea    0x30(%ecx),%eax
 804cf48:	89 d1                	mov    %edx,%ecx
 804cf4a:	88 03                	mov    %al,(%ebx)
 804cf4c:	7f d9                	jg     804cf27 <_vfprintf_r+0x1dd7>
 804cf4e:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804cf51:	83 c1 30             	add    $0x30,%ecx
 804cf54:	39 f0                	cmp    %esi,%eax
 804cf56:	88 4b ff             	mov    %cl,-0x1(%ebx)
 804cf59:	0f 83 53 01 00 00    	jae    804d0b2 <_vfprintf_r+0x1f62>
 804cf5f:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804cf65:	eb 04                	jmp    804cf6b <_vfprintf_r+0x1e1b>
 804cf67:	90                   	nop
 804cf68:	0f b6 08             	movzbl (%eax),%ecx
 804cf6b:	83 c0 01             	add    $0x1,%eax
 804cf6e:	83 c2 01             	add    $0x1,%edx
 804cf71:	39 f0                	cmp    %esi,%eax
 804cf73:	88 4a ff             	mov    %cl,-0x1(%edx)
 804cf76:	75 f0                	jne    804cf68 <_vfprintf_r+0x1e18>
 804cf78:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 804cf7e:	29 d8                	sub    %ebx,%eax
 804cf80:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
 804cf86:	01 d0                	add    %edx,%eax
 804cf88:	e9 75 fe ff ff       	jmp    804ce02 <_vfprintf_r+0x1cb2>
 804cf8d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804cf93:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 804cf99:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
 804cf9d:	89 c2                	mov    %eax,%edx
 804cf9f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
 804cfa5:	31 c0                	xor    %eax,%eax
 804cfa7:	85 d2                	test   %edx,%edx
 804cfa9:	0f 49 c2             	cmovns %edx,%eax
 804cfac:	e9 ca f8 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804cfb1:	90                   	nop
 804cfb2:	90                   	nop
 804cfb3:	d9 c9                	fxch   %st(1)
 804cfb5:	db e9                	fucomi %st(1),%st
 804cfb7:	dd d9                	fstp   %st(1)
 804cfb9:	7a 06                	jp     804cfc1 <_vfprintf_r+0x1e71>
 804cfbb:	0f 84 3e fd ff ff    	je     804ccff <_vfprintf_r+0x1baf>
 804cfc1:	b8 01 00 00 00       	mov    $0x1,%eax
 804cfc6:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 804cfcc:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
 804cfd2:	01 c1                	add    %eax,%ecx
 804cfd4:	e9 15 f8 ff ff       	jmp    804c7ee <_vfprintf_r+0x169e>
 804cfd9:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
 804cfdf:	31 c0                	xor    %eax,%eax
 804cfe1:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
 804cfe8:	00 00 00 
 804cfeb:	83 c2 01             	add    $0x1,%edx
 804cfee:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804cff4:	0f 49 c2             	cmovns %edx,%eax
 804cff7:	e9 7f f8 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804cffc:	b2 02                	mov    $0x2,%dl
 804cffe:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
 804d004:	e9 a5 fe ff ff       	jmp    804ceae <_vfprintf_r+0x1d5e>
 804d009:	8b 55 14             	mov    0x14(%ebp),%edx
 804d00c:	8b 45 14             	mov    0x14(%ebp),%eax
 804d00f:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
 804d015:	8b 12                	mov    (%edx),%edx
 804d017:	83 c0 04             	add    $0x4,%eax
 804d01a:	89 45 14             	mov    %eax,0x14(%ebp)
 804d01d:	85 d2                	test   %edx,%edx
 804d01f:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 804d025:	0f 89 b4 e2 ff ff    	jns    804b2df <_vfprintf_r+0x18f>
 804d02b:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
 804d032:	ff ff ff 
 804d035:	89 c8                	mov    %ecx,%eax
 804d037:	e9 81 e2 ff ff       	jmp    804b2bd <_vfprintf_r+0x16d>
 804d03c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d040:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
 804d046:	85 db                	test   %ebx,%ebx
 804d048:	75 4f                	jne    804d099 <_vfprintf_r+0x1f49>
 804d04a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
 804d051:	75 46                	jne    804d099 <_vfprintf_r+0x1f49>
 804d053:	b8 01 00 00 00       	mov    $0x1,%eax
 804d058:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
 804d05f:	00 00 00 
 804d062:	e9 14 f8 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804d067:	90                   	nop
 804d068:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804d06e:	83 e0 01             	and    $0x1,%eax
 804d071:	0f 85 b2 fd ff ff    	jne    804ce29 <_vfprintf_r+0x1cd9>
 804d077:	85 d2                	test   %edx,%edx
 804d079:	0f 49 c2             	cmovns %edx,%eax
 804d07c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
 804d083:	00 00 00 
 804d086:	e9 f0 f7 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804d08b:	f7 d9                	neg    %ecx
 804d08d:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
 804d094:	e9 4a fd ff ff       	jmp    804cde3 <_vfprintf_r+0x1c93>
 804d099:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 804d09f:	31 c0                	xor    %eax,%eax
 804d0a1:	83 c2 02             	add    $0x2,%edx
 804d0a4:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
 804d0aa:	0f 49 c2             	cmovns %edx,%eax
 804d0ad:	e9 c9 f7 ff ff       	jmp    804c87b <_vfprintf_r+0x172b>
 804d0b2:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
 804d0b8:	e9 45 fd ff ff       	jmp    804ce02 <_vfprintf_r+0x1cb2>
 804d0bd:	8d 76 00             	lea    0x0(%esi),%esi

0804d0c0 <vfprintf>:
 804d0c0:	55                   	push   %ebp
 804d0c1:	89 e5                	mov    %esp,%ebp
 804d0c3:	83 ec 18             	sub    $0x18,%esp
 804d0c6:	e8 15 21 00 00       	call   804f1e0 <__getreent>
 804d0cb:	8b 55 10             	mov    0x10(%ebp),%edx
 804d0ce:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804d0d2:	8b 55 0c             	mov    0xc(%ebp),%edx
 804d0d5:	89 04 24             	mov    %eax,(%esp)
 804d0d8:	89 54 24 08          	mov    %edx,0x8(%esp)
 804d0dc:	8b 55 08             	mov    0x8(%ebp),%edx
 804d0df:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d0e3:	e8 68 e0 ff ff       	call   804b150 <_vfprintf_r>
 804d0e8:	c9                   	leave  
 804d0e9:	c3                   	ret    
 804d0ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804d0f0 <__sbprintf>:
 804d0f0:	55                   	push   %ebp
 804d0f1:	89 e5                	mov    %esp,%ebp
 804d0f3:	57                   	push   %edi
 804d0f4:	89 c7                	mov    %eax,%edi
 804d0f6:	56                   	push   %esi
 804d0f7:	53                   	push   %ebx
 804d0f8:	89 d3                	mov    %edx,%ebx
 804d0fa:	81 ec 9c 04 00 00    	sub    $0x49c,%esp
 804d100:	0f b7 42 0c          	movzwl 0xc(%edx),%eax
 804d104:	c7 85 88 fb ff ff 00 	movl   $0x400,-0x478(%ebp)
 804d10b:	04 00 00 
 804d10e:	c7 85 94 fb ff ff 00 	movl   $0x400,-0x46c(%ebp)
 804d115:	04 00 00 
 804d118:	c7 85 98 fb ff ff 00 	movl   $0x0,-0x468(%ebp)
 804d11f:	00 00 00 
 804d122:	83 e0 fd             	and    $0xfffffffd,%eax
 804d125:	66 89 85 8c fb ff ff 	mov    %ax,-0x474(%ebp)
 804d12c:	8b 42 64             	mov    0x64(%edx),%eax
 804d12f:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 804d135:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
 804d139:	66 89 85 8e fb ff ff 	mov    %ax,-0x472(%ebp)
 804d140:	8b 42 1c             	mov    0x1c(%edx),%eax
 804d143:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
 804d149:	8b 42 24             	mov    0x24(%edx),%eax
 804d14c:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
 804d152:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804d156:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d15a:	89 3c 24             	mov    %edi,(%esp)
 804d15d:	89 85 a4 fb ff ff    	mov    %eax,-0x45c(%ebp)
 804d163:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 804d169:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
 804d16f:	89 85 90 fb ff ff    	mov    %eax,-0x470(%ebp)
 804d175:	8b 45 08             	mov    0x8(%ebp),%eax
 804d178:	89 95 74 fb ff ff    	mov    %edx,-0x48c(%ebp)
 804d17e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804d182:	e8 c9 df ff ff       	call   804b150 <_vfprintf_r>
 804d187:	85 c0                	test   %eax,%eax
 804d189:	89 c6                	mov    %eax,%esi
 804d18b:	78 1c                	js     804d1a9 <__sbprintf+0xb9>
 804d18d:	8b 95 74 fb ff ff    	mov    -0x48c(%ebp),%edx
 804d193:	89 3c 24             	mov    %edi,(%esp)
 804d196:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d19a:	e8 31 17 00 00       	call   804e8d0 <_fflush_r>
 804d19f:	85 c0                	test   %eax,%eax
 804d1a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d1a6:	0f 45 f0             	cmovne %eax,%esi
 804d1a9:	f6 85 8c fb ff ff 40 	testb  $0x40,-0x474(%ebp)
 804d1b0:	74 05                	je     804d1b7 <__sbprintf+0xc7>
 804d1b2:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 804d1b7:	81 c4 9c 04 00 00    	add    $0x49c,%esp
 804d1bd:	89 f0                	mov    %esi,%eax
 804d1bf:	5b                   	pop    %ebx
 804d1c0:	5e                   	pop    %esi
 804d1c1:	5f                   	pop    %edi
 804d1c2:	5d                   	pop    %ebp
 804d1c3:	c3                   	ret    
 804d1c4:	66 90                	xchg   %ax,%ax
 804d1c6:	66 90                	xchg   %ax,%ax
 804d1c8:	66 90                	xchg   %ax,%ax
 804d1ca:	66 90                	xchg   %ax,%ax
 804d1cc:	66 90                	xchg   %ax,%ax
 804d1ce:	66 90                	xchg   %ax,%ax

0804d1d0 <__swsetup_r>:
 804d1d0:	55                   	push   %ebp
 804d1d1:	89 e5                	mov    %esp,%ebp
 804d1d3:	53                   	push   %ebx
 804d1d4:	83 ec 14             	sub    $0x14,%esp
 804d1d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804d1da:	e8 01 20 00 00       	call   804f1e0 <__getreent>
 804d1df:	85 c0                	test   %eax,%eax
 804d1e1:	74 0b                	je     804d1ee <__swsetup_r+0x1e>
 804d1e3:	8b 50 38             	mov    0x38(%eax),%edx
 804d1e6:	85 d2                	test   %edx,%edx
 804d1e8:	0f 84 a2 00 00 00    	je     804d290 <__swsetup_r+0xc0>
 804d1ee:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d1f2:	a8 08                	test   $0x8,%al
 804d1f4:	74 2a                	je     804d220 <__swsetup_r+0x50>
 804d1f6:	8b 53 10             	mov    0x10(%ebx),%edx
 804d1f9:	85 d2                	test   %edx,%edx
 804d1fb:	74 3d                	je     804d23a <__swsetup_r+0x6a>
 804d1fd:	a8 01                	test   $0x1,%al
 804d1ff:	75 5f                	jne    804d260 <__swsetup_r+0x90>
 804d201:	31 c9                	xor    %ecx,%ecx
 804d203:	a8 02                	test   $0x2,%al
 804d205:	75 03                	jne    804d20a <__swsetup_r+0x3a>
 804d207:	8b 4b 14             	mov    0x14(%ebx),%ecx
 804d20a:	31 c0                	xor    %eax,%eax
 804d20c:	85 d2                	test   %edx,%edx
 804d20e:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804d211:	74 62                	je     804d275 <__swsetup_r+0xa5>
 804d213:	83 c4 14             	add    $0x14,%esp
 804d216:	5b                   	pop    %ebx
 804d217:	5d                   	pop    %ebp
 804d218:	c3                   	ret    
 804d219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d220:	a8 10                	test   $0x10,%al
 804d222:	0f 84 b8 00 00 00    	je     804d2e0 <__swsetup_r+0x110>
 804d228:	a8 04                	test   $0x4,%al
 804d22a:	75 74                	jne    804d2a0 <__swsetup_r+0xd0>
 804d22c:	8b 53 10             	mov    0x10(%ebx),%edx
 804d22f:	83 c8 08             	or     $0x8,%eax
 804d232:	85 d2                	test   %edx,%edx
 804d234:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804d238:	75 c3                	jne    804d1fd <__swsetup_r+0x2d>
 804d23a:	89 c1                	mov    %eax,%ecx
 804d23c:	66 81 e1 80 02       	and    $0x280,%cx
 804d241:	66 81 f9 00 02       	cmp    $0x200,%cx
 804d246:	74 b5                	je     804d1fd <__swsetup_r+0x2d>
 804d248:	8b 45 08             	mov    0x8(%ebp),%eax
 804d24b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804d24f:	89 04 24             	mov    %eax,(%esp)
 804d252:	e8 a9 20 00 00       	call   804f300 <__smakebuf_r>
 804d257:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d25b:	8b 53 10             	mov    0x10(%ebx),%edx
 804d25e:	eb 9d                	jmp    804d1fd <__swsetup_r+0x2d>
 804d260:	8b 43 14             	mov    0x14(%ebx),%eax
 804d263:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804d26a:	f7 d8                	neg    %eax
 804d26c:	89 43 18             	mov    %eax,0x18(%ebx)
 804d26f:	31 c0                	xor    %eax,%eax
 804d271:	85 d2                	test   %edx,%edx
 804d273:	75 9e                	jne    804d213 <__swsetup_r+0x43>
 804d275:	0f b7 53 0c          	movzwl 0xc(%ebx),%edx
 804d279:	f6 c2 80             	test   $0x80,%dl
 804d27c:	74 95                	je     804d213 <__swsetup_r+0x43>
 804d27e:	83 ca 40             	or     $0x40,%edx
 804d281:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d286:	66 89 53 0c          	mov    %dx,0xc(%ebx)
 804d28a:	eb 87                	jmp    804d213 <__swsetup_r+0x43>
 804d28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d290:	89 04 24             	mov    %eax,(%esp)
 804d293:	e8 a8 17 00 00       	call   804ea40 <__sinit>
 804d298:	e9 51 ff ff ff       	jmp    804d1ee <__swsetup_r+0x1e>
 804d29d:	8d 76 00             	lea    0x0(%esi),%esi
 804d2a0:	8b 53 30             	mov    0x30(%ebx),%edx
 804d2a3:	85 d2                	test   %edx,%edx
 804d2a5:	74 21                	je     804d2c8 <__swsetup_r+0xf8>
 804d2a7:	8d 4b 40             	lea    0x40(%ebx),%ecx
 804d2aa:	39 ca                	cmp    %ecx,%edx
 804d2ac:	74 13                	je     804d2c1 <__swsetup_r+0xf1>
 804d2ae:	8b 45 08             	mov    0x8(%ebp),%eax
 804d2b1:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d2b5:	89 04 24             	mov    %eax,(%esp)
 804d2b8:	e8 d3 1b 00 00       	call   804ee90 <_free_r>
 804d2bd:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804d2c1:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 804d2c8:	8b 53 10             	mov    0x10(%ebx),%edx
 804d2cb:	83 e0 db             	and    $0xffffffdb,%eax
 804d2ce:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804d2d5:	89 13                	mov    %edx,(%ebx)
 804d2d7:	e9 53 ff ff ff       	jmp    804d22f <__swsetup_r+0x5f>
 804d2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d2e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d2e3:	83 c8 40             	or     $0x40,%eax
 804d2e6:	c7 01 09 00 00 00    	movl   $0x9,(%ecx)
 804d2ec:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804d2f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804d2f5:	e9 19 ff ff ff       	jmp    804d213 <__swsetup_r+0x43>
 804d2fa:	66 90                	xchg   %ax,%ax
 804d2fc:	66 90                	xchg   %ax,%ax
 804d2fe:	66 90                	xchg   %ax,%ax

0804d300 <quorem>:
 804d300:	55                   	push   %ebp
 804d301:	89 c1                	mov    %eax,%ecx
 804d303:	89 e5                	mov    %esp,%ebp
 804d305:	57                   	push   %edi
 804d306:	89 d7                	mov    %edx,%edi
 804d308:	56                   	push   %esi
 804d309:	53                   	push   %ebx
 804d30a:	83 ec 3c             	sub    $0x3c,%esp
 804d30d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804d310:	8b 42 10             	mov    0x10(%edx),%eax
 804d313:	3b 41 10             	cmp    0x10(%ecx),%eax
 804d316:	89 55 c8             	mov    %edx,-0x38(%ebp)
 804d319:	89 ca                	mov    %ecx,%edx
 804d31b:	0f 8f 9f 01 00 00    	jg     804d4c0 <quorem+0x1c0>
 804d321:	83 e8 01             	sub    $0x1,%eax
 804d324:	83 c7 14             	add    $0x14,%edi
 804d327:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d32a:	c1 e0 02             	shl    $0x2,%eax
 804d32d:	83 c2 14             	add    $0x14,%edx
 804d330:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
 804d333:	01 d0                	add    %edx,%eax
 804d335:	89 55 d8             	mov    %edx,-0x28(%ebp)
 804d338:	8b 13                	mov    (%ebx),%edx
 804d33a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804d33d:	8b 00                	mov    (%eax),%eax
 804d33f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 804d342:	8d 4a 01             	lea    0x1(%edx),%ecx
 804d345:	31 d2                	xor    %edx,%edx
 804d347:	f7 f1                	div    %ecx
 804d349:	85 c0                	test   %eax,%eax
 804d34b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804d34e:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804d351:	0f 84 b5 00 00 00    	je     804d40c <quorem+0x10c>
 804d357:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d35a:	31 f6                	xor    %esi,%esi
 804d35c:	89 fa                	mov    %edi,%edx
 804d35e:	89 7d c0             	mov    %edi,-0x40(%ebp)
 804d361:	89 f7                	mov    %esi,%edi
 804d363:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 804d36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d370:	83 c2 04             	add    $0x4,%edx
 804d373:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d376:	83 c0 04             	add    $0x4,%eax
 804d379:	0f b7 ce             	movzwl %si,%ecx
 804d37c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
 804d380:	03 4d dc             	add    -0x24(%ebp),%ecx
 804d383:	c1 ee 10             	shr    $0x10,%esi
 804d386:	0f af 75 e0          	imul   -0x20(%ebp),%esi
 804d38a:	89 cb                	mov    %ecx,%ebx
 804d38c:	0f b7 c9             	movzwl %cx,%ecx
 804d38f:	c1 eb 10             	shr    $0x10,%ebx
 804d392:	29 cf                	sub    %ecx,%edi
 804d394:	01 f3                	add    %esi,%ebx
 804d396:	89 de                	mov    %ebx,%esi
 804d398:	0f b7 db             	movzwl %bx,%ebx
 804d39b:	c1 ee 10             	shr    $0x10,%esi
 804d39e:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804d3a1:	8b 70 fc             	mov    -0x4(%eax),%esi
 804d3a4:	0f b7 ce             	movzwl %si,%ecx
 804d3a7:	01 f9                	add    %edi,%ecx
 804d3a9:	c1 ee 10             	shr    $0x10,%esi
 804d3ac:	29 de                	sub    %ebx,%esi
 804d3ae:	89 cb                	mov    %ecx,%ebx
 804d3b0:	c1 fb 10             	sar    $0x10,%ebx
 804d3b3:	0f b7 c9             	movzwl %cx,%ecx
 804d3b6:	01 de                	add    %ebx,%esi
 804d3b8:	89 f7                	mov    %esi,%edi
 804d3ba:	c1 e6 10             	shl    $0x10,%esi
 804d3bd:	09 ce                	or     %ecx,%esi
 804d3bf:	c1 ff 10             	sar    $0x10,%edi
 804d3c2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
 804d3c5:	89 70 fc             	mov    %esi,-0x4(%eax)
 804d3c8:	73 a6                	jae    804d370 <quorem+0x70>
 804d3ca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804d3cd:	8b 7d c0             	mov    -0x40(%ebp),%edi
 804d3d0:	8b 10                	mov    (%eax),%edx
 804d3d2:	85 d2                	test   %edx,%edx
 804d3d4:	75 36                	jne    804d40c <quorem+0x10c>
 804d3d6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804d3d9:	89 c2                	mov    %eax,%edx
 804d3db:	83 e8 04             	sub    $0x4,%eax
 804d3de:	39 c1                	cmp    %eax,%ecx
 804d3e0:	73 21                	jae    804d403 <quorem+0x103>
 804d3e2:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d3e5:	85 f6                	test   %esi,%esi
 804d3e7:	75 1a                	jne    804d403 <quorem+0x103>
 804d3e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804d3ec:	eb 08                	jmp    804d3f6 <quorem+0xf6>
 804d3ee:	66 90                	xchg   %ax,%ax
 804d3f0:	8b 18                	mov    (%eax),%ebx
 804d3f2:	85 db                	test   %ebx,%ebx
 804d3f4:	75 0a                	jne    804d400 <quorem+0x100>
 804d3f6:	83 e8 04             	sub    $0x4,%eax
 804d3f9:	83 ea 01             	sub    $0x1,%edx
 804d3fc:	39 c1                	cmp    %eax,%ecx
 804d3fe:	72 f0                	jb     804d3f0 <quorem+0xf0>
 804d400:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804d403:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d406:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804d409:	89 50 10             	mov    %edx,0x10(%eax)
 804d40c:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804d40f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804d413:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d416:	89 04 24             	mov    %eax,(%esp)
 804d419:	e8 22 30 00 00       	call   8050440 <__mcmp>
 804d41e:	85 c0                	test   %eax,%eax
 804d420:	0f 88 8e 00 00 00    	js     804d4b4 <quorem+0x1b4>
 804d426:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804d429:	31 f6                	xor    %esi,%esi
 804d42b:	83 c0 01             	add    $0x1,%eax
 804d42e:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804d431:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d438:	83 c7 04             	add    $0x4,%edi
 804d43b:	8b 4f fc             	mov    -0x4(%edi),%ecx
 804d43e:	83 c0 04             	add    $0x4,%eax
 804d441:	8b 58 fc             	mov    -0x4(%eax),%ebx
 804d444:	0f b7 d1             	movzwl %cx,%edx
 804d447:	29 d6                	sub    %edx,%esi
 804d449:	0f b7 d3             	movzwl %bx,%edx
 804d44c:	01 f2                	add    %esi,%edx
 804d44e:	c1 e9 10             	shr    $0x10,%ecx
 804d451:	c1 eb 10             	shr    $0x10,%ebx
 804d454:	29 cb                	sub    %ecx,%ebx
 804d456:	89 d1                	mov    %edx,%ecx
 804d458:	c1 f9 10             	sar    $0x10,%ecx
 804d45b:	0f b7 d2             	movzwl %dx,%edx
 804d45e:	01 cb                	add    %ecx,%ebx
 804d460:	89 de                	mov    %ebx,%esi
 804d462:	c1 e3 10             	shl    $0x10,%ebx
 804d465:	09 d3                	or     %edx,%ebx
 804d467:	c1 fe 10             	sar    $0x10,%esi
 804d46a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 804d46d:	89 58 fc             	mov    %ebx,-0x4(%eax)
 804d470:	73 c6                	jae    804d438 <quorem+0x138>
 804d472:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804d475:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 804d478:	8d 14 b8             	lea    (%eax,%edi,4),%edx
 804d47b:	8b 02                	mov    (%edx),%eax
 804d47d:	85 c0                	test   %eax,%eax
 804d47f:	75 33                	jne    804d4b4 <quorem+0x1b4>
 804d481:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804d484:	8d 42 fc             	lea    -0x4(%edx),%eax
 804d487:	39 c1                	cmp    %eax,%ecx
 804d489:	73 20                	jae    804d4ab <quorem+0x1ab>
 804d48b:	8b 72 fc             	mov    -0x4(%edx),%esi
 804d48e:	85 f6                	test   %esi,%esi
 804d490:	75 19                	jne    804d4ab <quorem+0x1ab>
 804d492:	89 fa                	mov    %edi,%edx
 804d494:	eb 08                	jmp    804d49e <quorem+0x19e>
 804d496:	66 90                	xchg   %ax,%ax
 804d498:	8b 18                	mov    (%eax),%ebx
 804d49a:	85 db                	test   %ebx,%ebx
 804d49c:	75 0a                	jne    804d4a8 <quorem+0x1a8>
 804d49e:	83 e8 04             	sub    $0x4,%eax
 804d4a1:	83 ea 01             	sub    $0x1,%edx
 804d4a4:	39 c1                	cmp    %eax,%ecx
 804d4a6:	72 f0                	jb     804d498 <quorem+0x198>
 804d4a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804d4ab:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804d4ae:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 804d4b1:	89 78 10             	mov    %edi,0x10(%eax)
 804d4b4:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804d4b7:	83 c4 3c             	add    $0x3c,%esp
 804d4ba:	5b                   	pop    %ebx
 804d4bb:	5e                   	pop    %esi
 804d4bc:	5f                   	pop    %edi
 804d4bd:	5d                   	pop    %ebp
 804d4be:	c3                   	ret    
 804d4bf:	90                   	nop
 804d4c0:	83 c4 3c             	add    $0x3c,%esp
 804d4c3:	31 c0                	xor    %eax,%eax
 804d4c5:	5b                   	pop    %ebx
 804d4c6:	5e                   	pop    %esi
 804d4c7:	5f                   	pop    %edi
 804d4c8:	5d                   	pop    %ebp
 804d4c9:	c3                   	ret    
 804d4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804d4d0 <_dtoa_r>:
 804d4d0:	55                   	push   %ebp
 804d4d1:	89 e5                	mov    %esp,%ebp
 804d4d3:	57                   	push   %edi
 804d4d4:	56                   	push   %esi
 804d4d5:	53                   	push   %ebx
 804d4d6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 804d4dc:	8b 75 08             	mov    0x8(%ebp),%esi
 804d4df:	dd 45 0c             	fldl   0xc(%ebp)
 804d4e2:	8b 5d 20             	mov    0x20(%ebp),%ebx
 804d4e5:	dd 5d c0             	fstpl  -0x40(%ebp)
 804d4e8:	8b 46 40             	mov    0x40(%esi),%eax
 804d4eb:	85 c0                	test   %eax,%eax
 804d4ed:	74 23                	je     804d512 <_dtoa_r+0x42>
 804d4ef:	8b 4e 44             	mov    0x44(%esi),%ecx
 804d4f2:	ba 01 00 00 00       	mov    $0x1,%edx
 804d4f7:	d3 e2                	shl    %cl,%edx
 804d4f9:	89 48 04             	mov    %ecx,0x4(%eax)
 804d4fc:	89 50 08             	mov    %edx,0x8(%eax)
 804d4ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 804d503:	89 34 24             	mov    %esi,(%esp)
 804d506:	e8 15 28 00 00       	call   804fd20 <_Bfree>
 804d50b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
 804d512:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 804d515:	85 ff                	test   %edi,%edi
 804d517:	0f 88 3b 02 00 00    	js     804d758 <_dtoa_r+0x288>
 804d51d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804d523:	89 f8                	mov    %edi,%eax
 804d525:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
 804d52a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
 804d52f:	0f 84 e3 01 00 00    	je     804d718 <_dtoa_r+0x248>
 804d535:	dd 45 c0             	fldl   -0x40(%ebp)
 804d538:	d9 ee                	fldz   
 804d53a:	d9 c9                	fxch   %st(1)
 804d53c:	db e9                	fucomi %st(1),%st
 804d53e:	dd d9                	fstp   %st(1)
 804d540:	7a 36                	jp     804d578 <_dtoa_r+0xa8>
 804d542:	75 34                	jne    804d578 <_dtoa_r+0xa8>
 804d544:	dd d8                	fstp   %st(0)
 804d546:	8b 4d 24             	mov    0x24(%ebp),%ecx
 804d549:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804d54c:	85 c9                	test   %ecx,%ecx
 804d54e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804d554:	0f 84 4e 02 00 00    	je     804d7a8 <_dtoa_r+0x2d8>
 804d55a:	8b 45 24             	mov    0x24(%ebp),%eax
 804d55d:	c7 00 e8 42 05 08    	movl   $0x80542e8,(%eax)
 804d563:	b8 e7 42 05 08       	mov    $0x80542e7,%eax
 804d568:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804d56e:	5b                   	pop    %ebx
 804d56f:	5e                   	pop    %esi
 804d570:	5f                   	pop    %edi
 804d571:	5d                   	pop    %ebp
 804d572:	c3                   	ret    
 804d573:	90                   	nop
 804d574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d578:	8d 45 e0             	lea    -0x20(%ebp),%eax
 804d57b:	89 fb                	mov    %edi,%ebx
 804d57d:	89 44 24 10          	mov    %eax,0x10(%esp)
 804d581:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 804d584:	dd 54 24 04          	fstl   0x4(%esp)
 804d588:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804d58c:	dd 5d b8             	fstpl  -0x48(%ebp)
 804d58f:	89 34 24             	mov    %esi,(%esp)
 804d592:	c1 eb 14             	shr    $0x14,%ebx
 804d595:	e8 f6 31 00 00       	call   8050790 <__d2b>
 804d59a:	85 db                	test   %ebx,%ebx
 804d59c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804d59f:	0f 85 db 01 00 00    	jne    804d780 <_dtoa_r+0x2b0>
 804d5a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804d5a8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 804d5ab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804d5ae:	01 c3                	add    %eax,%ebx
 804d5b0:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
 804d5b6:	0f 8c ec 07 00 00    	jl     804dda8 <_dtoa_r+0x8d8>
 804d5bc:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804d5bf:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
 804d5c4:	89 f8                	mov    %edi,%eax
 804d5c6:	29 d9                	sub    %ebx,%ecx
 804d5c8:	d3 e0                	shl    %cl,%eax
 804d5ca:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
 804d5d0:	d3 ea                	shr    %cl,%edx
 804d5d2:	09 d0                	or     %edx,%eax
 804d5d4:	31 d2                	xor    %edx,%edx
 804d5d6:	83 eb 01             	sub    $0x1,%ebx
 804d5d9:	89 55 cc             	mov    %edx,-0x34(%ebp)
 804d5dc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804d5df:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804d5e2:	df 6d c8             	fildll -0x38(%ebp)
 804d5e5:	dd 5d b8             	fstpl  -0x48(%ebp)
 804d5e8:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
 804d5ef:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
 804d5f6:	dd 45 b8             	fldl   -0x48(%ebp)
 804d5f9:	d8 25 40 49 05 08    	fsubs  0x8054940
 804d5ff:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 804d602:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804d605:	dc 0d 58 49 05 08    	fmull  0x8054958
 804d60b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804d60f:	b4 0c                	mov    $0xc,%ah
 804d611:	dc 05 60 49 05 08    	faddl  0x8054960
 804d617:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804d61b:	db 45 d4             	fildl  -0x2c(%ebp)
 804d61e:	dc 0d 68 49 05 08    	fmull  0x8054968
 804d624:	de c1                	faddp  %st,%st(1)
 804d626:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d629:	db 55 b8             	fistl  -0x48(%ebp)
 804d62c:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d62f:	d9 ee                	fldz   
 804d631:	df e9                	fucomip %st(1),%st
 804d633:	0f 87 27 07 00 00    	ja     804dd60 <_dtoa_r+0x890>
 804d639:	dd d8                	fstp   %st(0)
 804d63b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
 804d63f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
 804d646:	77 24                	ja     804d66c <_dtoa_r+0x19c>
 804d648:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d64b:	dd 04 c5 20 4a 05 08 	fldl   0x8054a20(,%eax,8)
 804d652:	dd 45 c0             	fldl   -0x40(%ebp)
 804d655:	d9 c9                	fxch   %st(1)
 804d657:	df e9                	fucomip %st(1),%st
 804d659:	dd d8                	fstp   %st(0)
 804d65b:	0f 86 5f 07 00 00    	jbe    804ddc0 <_dtoa_r+0x8f0>
 804d661:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804d665:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
 804d66c:	89 d0                	mov    %edx,%eax
 804d66e:	29 d8                	sub    %ebx,%eax
 804d670:	83 e8 01             	sub    $0x1,%eax
 804d673:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
 804d67a:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804d67d:	0f 88 0d 07 00 00    	js     804dd90 <_dtoa_r+0x8c0>
 804d683:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d686:	85 c0                	test   %eax,%eax
 804d688:	0f 88 ea 06 00 00    	js     804dd78 <_dtoa_r+0x8a8>
 804d68e:	01 45 ac             	add    %eax,-0x54(%ebp)
 804d691:	89 45 94             	mov    %eax,-0x6c(%ebp)
 804d694:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804d69b:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
 804d69f:	0f 87 0b 03 00 00    	ja     804d9b0 <_dtoa_r+0x4e0>
 804d6a5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
 804d6a9:	0f 8e 23 10 00 00    	jle    804e6d2 <_dtoa_r+0x1202>
 804d6af:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
 804d6b3:	31 c0                	xor    %eax,%eax
 804d6b5:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
 804d6b9:	0f 84 43 0d 00 00    	je     804e402 <_dtoa_r+0xf32>
 804d6bf:	0f 8e f3 00 00 00    	jle    804d7b8 <_dtoa_r+0x2e8>
 804d6c5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
 804d6c9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
 804d6d0:	0f 84 f3 00 00 00    	je     804d7c9 <_dtoa_r+0x2f9>
 804d6d6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
 804d6da:	0f 85 d7 02 00 00    	jne    804d9b7 <_dtoa_r+0x4e7>
 804d6e0:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804d6e3:	03 5d 18             	add    0x18(%ebp),%ebx
 804d6e6:	89 5d 90             	mov    %ebx,-0x70(%ebp)
 804d6e9:	83 c3 01             	add    $0x1,%ebx
 804d6ec:	83 fb 0e             	cmp    $0xe,%ebx
 804d6ef:	0f 96 c2             	setbe  %dl
 804d6f2:	85 db                	test   %ebx,%ebx
 804d6f4:	89 5d a8             	mov    %ebx,-0x58(%ebp)
 804d6f7:	0f 8e a7 08 00 00    	jle    804dfa4 <_dtoa_r+0xad4>
 804d6fd:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804d700:	83 fb 0e             	cmp    $0xe,%ebx
 804d703:	89 df                	mov    %ebx,%edi
 804d705:	0f 96 45 b4          	setbe  -0x4c(%ebp)
 804d709:	20 45 b4             	and    %al,-0x4c(%ebp)
 804d70c:	e9 d6 00 00 00       	jmp    804d7e7 <_dtoa_r+0x317>
 804d711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d718:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804d71b:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804d71e:	85 d2                	test   %edx,%edx
 804d720:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
 804d726:	b8 39 49 05 08       	mov    $0x8054939,%eax
 804d72b:	74 43                	je     804d770 <_dtoa_r+0x2a0>
 804d72d:	8b 5d 24             	mov    0x24(%ebp),%ebx
 804d730:	85 db                	test   %ebx,%ebx
 804d732:	0f 84 30 fe ff ff    	je     804d568 <_dtoa_r+0x98>
 804d738:	8b 75 24             	mov    0x24(%ebp),%esi
 804d73b:	8d 50 08             	lea    0x8(%eax),%edx
 804d73e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
 804d742:	8d 48 03             	lea    0x3(%eax),%ecx
 804d745:	0f 44 d1             	cmove  %ecx,%edx
 804d748:	89 16                	mov    %edx,(%esi)
 804d74a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804d750:	5b                   	pop    %ebx
 804d751:	5e                   	pop    %esi
 804d752:	5f                   	pop    %edi
 804d753:	5d                   	pop    %ebp
 804d754:	c3                   	ret    
 804d755:	8d 76 00             	lea    0x0(%esi),%esi
 804d758:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
 804d75e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 804d764:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 804d767:	e9 b7 fd ff ff       	jmp    804d523 <_dtoa_r+0x53>
 804d76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d770:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
 804d776:	ba 30 49 05 08       	mov    $0x8054930,%edx
 804d77b:	0f 44 c2             	cmove  %edx,%eax
 804d77e:	eb ad                	jmp    804d72d <_dtoa_r+0x25d>
 804d780:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804d783:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
 804d789:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804d78c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
 804d793:	25 ff ff 0f 00       	and    $0xfffff,%eax
 804d798:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
 804d79d:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804d7a0:	e9 51 fe ff ff       	jmp    804d5f6 <_dtoa_r+0x126>
 804d7a5:	8d 76 00             	lea    0x0(%esi),%esi
 804d7a8:	b8 e7 42 05 08       	mov    $0x80542e7,%eax
 804d7ad:	e9 b6 fd ff ff       	jmp    804d568 <_dtoa_r+0x98>
 804d7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d7b8:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804d7bc:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
 804d7c3:	0f 85 ee 01 00 00    	jne    804d9b7 <_dtoa_r+0x4e7>
 804d7c9:	8b 55 18             	mov    0x18(%ebp),%edx
 804d7cc:	85 d2                	test   %edx,%edx
 804d7ce:	0f 8e b6 07 00 00    	jle    804df8a <_dtoa_r+0xaba>
 804d7d4:	8b 7d 18             	mov    0x18(%ebp),%edi
 804d7d7:	83 ff 0e             	cmp    $0xe,%edi
 804d7da:	0f 96 45 b4          	setbe  -0x4c(%ebp)
 804d7de:	20 45 b4             	and    %al,-0x4c(%ebp)
 804d7e1:	89 7d 90             	mov    %edi,-0x70(%ebp)
 804d7e4:	89 7d a8             	mov    %edi,-0x58(%ebp)
 804d7e7:	83 ff 17             	cmp    $0x17,%edi
 804d7ea:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804d7f1:	0f 86 e5 0e 00 00    	jbe    804e6dc <_dtoa_r+0x120c>
 804d7f7:	b9 01 00 00 00       	mov    $0x1,%ecx
 804d7fc:	b8 04 00 00 00       	mov    $0x4,%eax
 804d801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d808:	01 c0                	add    %eax,%eax
 804d80a:	89 ca                	mov    %ecx,%edx
 804d80c:	8d 58 14             	lea    0x14(%eax),%ebx
 804d80f:	39 fb                	cmp    %edi,%ebx
 804d811:	8d 49 01             	lea    0x1(%ecx),%ecx
 804d814:	76 f2                	jbe    804d808 <_dtoa_r+0x338>
 804d816:	89 56 44             	mov    %edx,0x44(%esi)
 804d819:	89 54 24 04          	mov    %edx,0x4(%esp)
 804d81d:	89 34 24             	mov    %esi,(%esp)
 804d820:	e8 5b 24 00 00       	call   804fc80 <_Balloc>
 804d825:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
 804d829:	89 c7                	mov    %eax,%edi
 804d82b:	89 46 40             	mov    %eax,0x40(%esi)
 804d82e:	0f 84 bb 01 00 00    	je     804d9ef <_dtoa_r+0x51f>
 804d834:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804d837:	dd 45 c0             	fldl   -0x40(%ebp)
 804d83a:	85 db                	test   %ebx,%ebx
 804d83c:	0f 8e de 07 00 00    	jle    804e020 <_dtoa_r+0xb50>
 804d842:	89 d8                	mov    %ebx,%eax
 804d844:	83 e0 0f             	and    $0xf,%eax
 804d847:	dd 04 c5 20 4a 05 08 	fldl   0x8054a20(,%eax,8)
 804d84e:	89 d8                	mov    %ebx,%eax
 804d850:	c1 f8 04             	sar    $0x4,%eax
 804d853:	a8 10                	test   $0x10,%al
 804d855:	0f 84 cd 05 00 00    	je     804de28 <_dtoa_r+0x958>
 804d85b:	dd 05 00 4a 05 08    	fldl   0x8054a00
 804d861:	83 e0 0f             	and    $0xf,%eax
 804d864:	b9 03 00 00 00       	mov    $0x3,%ecx
 804d869:	d8 fa                	fdivr  %st(2),%st
 804d86b:	85 c0                	test   %eax,%eax
 804d86d:	74 22                	je     804d891 <_dtoa_r+0x3c1>
 804d86f:	31 d2                	xor    %edx,%edx
 804d871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804d878:	a8 01                	test   $0x1,%al
 804d87a:	74 0e                	je     804d88a <_dtoa_r+0x3ba>
 804d87c:	d9 c9                	fxch   %st(1)
 804d87e:	dc 0c d5 e0 49 05 08 	fmull  0x80549e0(,%edx,8)
 804d885:	d9 c9                	fxch   %st(1)
 804d887:	83 c1 01             	add    $0x1,%ecx
 804d88a:	83 c2 01             	add    $0x1,%edx
 804d88d:	d1 f8                	sar    %eax
 804d88f:	75 e7                	jne    804d878 <_dtoa_r+0x3a8>
 804d891:	de f1                	fdivp  %st,%st(1)
 804d893:	8b 45 9c             	mov    -0x64(%ebp),%eax
 804d896:	85 c0                	test   %eax,%eax
 804d898:	74 0a                	je     804d8a4 <_dtoa_r+0x3d4>
 804d89a:	d9 e8                	fld1   
 804d89c:	df e9                	fucomip %st(1),%st
 804d89e:	0f 87 92 0b 00 00    	ja     804e436 <_dtoa_r+0xf66>
 804d8a4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804d8a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804d8aa:	db 45 d4             	fildl  -0x2c(%ebp)
 804d8ad:	d8 c9                	fmul   %st(1),%st
 804d8af:	d8 05 4c 49 05 08    	fadds  0x805494c
 804d8b5:	dd 5d c0             	fstpl  -0x40(%ebp)
 804d8b8:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804d8bf:	85 c0                	test   %eax,%eax
 804d8c1:	0f 84 89 05 00 00    	je     804de50 <_dtoa_r+0x980>
 804d8c7:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804d8ca:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 804d8cd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804d8d0:	8b 45 98             	mov    -0x68(%ebp),%eax
 804d8d3:	85 c0                	test   %eax,%eax
 804d8d5:	0f 84 b5 07 00 00    	je     804e090 <_dtoa_r+0xbc0>
 804d8db:	d9 05 54 49 05 08    	flds   0x8054954
 804d8e1:	8d 57 01             	lea    0x1(%edi),%edx
 804d8e4:	dc 34 cd 18 4a 05 08 	fdivl  0x8054a18(,%ecx,8)
 804d8eb:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804d8ee:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804d8f2:	b4 0c                	mov    $0xc,%ah
 804d8f4:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804d8f8:	dc 65 c0             	fsubl  -0x40(%ebp)
 804d8fb:	d9 c9                	fxch   %st(1)
 804d8fd:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d900:	db 55 d4             	fistl  -0x2c(%ebp)
 804d903:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d906:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804d909:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d90c:	83 c0 30             	add    $0x30,%eax
 804d90f:	db 45 d4             	fildl  -0x2c(%ebp)
 804d912:	de e9                	fsubrp %st,%st(1)
 804d914:	d9 c9                	fxch   %st(1)
 804d916:	88 07                	mov    %al,(%edi)
 804d918:	db e9                	fucomi %st(1),%st
 804d91a:	77 7f                	ja     804d99b <_dtoa_r+0x4cb>
 804d91c:	d9 c1                	fld    %st(1)
 804d91e:	d8 2d 44 49 05 08    	fsubrs 0x8054944
 804d924:	d9 c9                	fxch   %st(1)
 804d926:	db e9                	fucomi %st(1),%st
 804d928:	dd d9                	fstp   %st(1)
 804d92a:	0f 87 33 0c 00 00    	ja     804e563 <_dtoa_r+0x1093>
 804d930:	83 f9 01             	cmp    $0x1,%ecx
 804d933:	0f 8e c4 06 00 00    	jle    804dffd <_dtoa_r+0xb2d>
 804d939:	01 f9                	add    %edi,%ecx
 804d93b:	d9 05 48 49 05 08    	flds   0x8054948
 804d941:	eb 25                	jmp    804d968 <_dtoa_r+0x498>
 804d943:	90                   	nop
 804d944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804d948:	d9 c1                	fld    %st(1)
 804d94a:	d8 2d 44 49 05 08    	fsubrs 0x8054944
 804d950:	d9 c9                	fxch   %st(1)
 804d952:	db e9                	fucomi %st(1),%st
 804d954:	dd d9                	fstp   %st(1)
 804d956:	0f 87 14 0c 00 00    	ja     804e570 <_dtoa_r+0x10a0>
 804d95c:	39 ca                	cmp    %ecx,%edx
 804d95e:	0f 84 a4 06 00 00    	je     804e008 <_dtoa_r+0xb38>
 804d964:	d9 c9                	fxch   %st(1)
 804d966:	d9 ca                	fxch   %st(2)
 804d968:	dc c9                	fmul   %st,%st(1)
 804d96a:	83 c2 01             	add    $0x1,%edx
 804d96d:	dc ca                	fmul   %st,%st(2)
 804d96f:	d9 ca                	fxch   %st(2)
 804d971:	d9 6d d0             	fldcw  -0x30(%ebp)
 804d974:	db 55 d4             	fistl  -0x2c(%ebp)
 804d977:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804d97a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804d97d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804d980:	83 c0 30             	add    $0x30,%eax
 804d983:	db 45 d4             	fildl  -0x2c(%ebp)
 804d986:	de e9                	fsubrp %st,%st(1)
 804d988:	d9 c9                	fxch   %st(1)
 804d98a:	88 42 ff             	mov    %al,-0x1(%edx)
 804d98d:	db e9                	fucomi %st(1),%st
 804d98f:	76 b7                	jbe    804d948 <_dtoa_r+0x478>
 804d991:	dd d8                	fstp   %st(0)
 804d993:	dd d8                	fstp   %st(0)
 804d995:	dd d8                	fstp   %st(0)
 804d997:	dd d8                	fstp   %st(0)
 804d999:	eb 06                	jmp    804d9a1 <_dtoa_r+0x4d1>
 804d99b:	dd d8                	fstp   %st(0)
 804d99d:	dd d8                	fstp   %st(0)
 804d99f:	dd d8                	fstp   %st(0)
 804d9a1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804d9a4:	89 fb                	mov    %edi,%ebx
 804d9a6:	89 d7                	mov    %edx,%edi
 804d9a8:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804d9ab:	e9 70 03 00 00       	jmp    804dd20 <_dtoa_r+0x850>
 804d9b0:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
 804d9b7:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804d9be:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804d9c5:	00 
 804d9c6:	89 34 24             	mov    %esi,(%esp)
 804d9c9:	e8 b2 22 00 00       	call   804fc80 <_Balloc>
 804d9ce:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
 804d9d5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
 804d9dc:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
 804d9e3:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
 804d9ea:	89 c7                	mov    %eax,%edi
 804d9ec:	89 46 40             	mov    %eax,0x40(%esi)
 804d9ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804d9f2:	85 c0                	test   %eax,%eax
 804d9f4:	0f 88 2e 01 00 00    	js     804db28 <_dtoa_r+0x658>
 804d9fa:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
 804d9fe:	0f 8f 24 01 00 00    	jg     804db28 <_dtoa_r+0x658>
 804da04:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804da07:	dd 04 c5 20 4a 05 08 	fldl   0x8054a20(,%eax,8)
 804da0e:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804da11:	85 c0                	test   %eax,%eax
 804da13:	7f 0e                	jg     804da23 <_dtoa_r+0x553>
 804da15:	8b 45 18             	mov    0x18(%ebp),%eax
 804da18:	c1 e8 1f             	shr    $0x1f,%eax
 804da1b:	84 c0                	test   %al,%al
 804da1d:	0f 85 9d 07 00 00    	jne    804e1c0 <_dtoa_r+0xcf0>
 804da23:	dd 45 c0             	fldl   -0x40(%ebp)
 804da26:	d9 c0                	fld    %st(0)
 804da28:	d8 f2                	fdiv   %st(2),%st
 804da2a:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804da2d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
 804da31:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804da35:	b4 0c                	mov    $0xc,%ah
 804da37:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804da3b:	8d 47 01             	lea    0x1(%edi),%eax
 804da3e:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804da41:	d9 6d d0             	fldcw  -0x30(%ebp)
 804da44:	db 5d d4             	fistpl -0x2c(%ebp)
 804da47:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804da4a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804da4d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804da50:	8d 42 30             	lea    0x30(%edx),%eax
 804da53:	db 45 d4             	fildl  -0x2c(%ebp)
 804da56:	d8 ca                	fmul   %st(2),%st
 804da58:	88 07                	mov    %al,(%edi)
 804da5a:	de e9                	fsubrp %st,%st(1)
 804da5c:	74 66                	je     804dac4 <_dtoa_r+0x5f4>
 804da5e:	d8 0d 48 49 05 08    	fmuls  0x8054948
 804da64:	d9 ee                	fldz   
 804da66:	d9 c9                	fxch   %st(1)
 804da68:	db e9                	fucomi %st(1),%st
 804da6a:	dd d9                	fstp   %st(1)
 804da6c:	0f 8b 33 0c 00 00    	jnp    804e6a5 <_dtoa_r+0x11d5>
 804da72:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804da75:	8d 47 02             	lea    0x2(%edi),%eax
 804da78:	d9 05 48 49 05 08    	flds   0x8054948
 804da7e:	01 fb                	add    %edi,%ebx
 804da80:	eb 19                	jmp    804da9b <_dtoa_r+0x5cb>
 804da82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804da88:	dc c9                	fmul   %st,%st(1)
 804da8a:	83 c0 01             	add    $0x1,%eax
 804da8d:	d9 ee                	fldz   
 804da8f:	d9 ca                	fxch   %st(2)
 804da91:	db ea                	fucomi %st(2),%st
 804da93:	dd da                	fstp   %st(2)
 804da95:	0f 8b 73 09 00 00    	jnp    804e40e <_dtoa_r+0xf3e>
 804da9b:	d9 c1                	fld    %st(1)
 804da9d:	39 d8                	cmp    %ebx,%eax
 804da9f:	d8 f3                	fdiv   %st(3),%st
 804daa1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804daa4:	d9 6d d0             	fldcw  -0x30(%ebp)
 804daa7:	db 5d d4             	fistpl -0x2c(%ebp)
 804daaa:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804daad:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804dab0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804dab3:	8d 4a 30             	lea    0x30(%edx),%ecx
 804dab6:	db 45 d4             	fildl  -0x2c(%ebp)
 804dab9:	d8 cb                	fmul   %st(3),%st
 804dabb:	88 48 ff             	mov    %cl,-0x1(%eax)
 804dabe:	de ea                	fsubrp %st,%st(2)
 804dac0:	75 c6                	jne    804da88 <_dtoa_r+0x5b8>
 804dac2:	dd d8                	fstp   %st(0)
 804dac4:	d8 c0                	fadd   %st(0),%st
 804dac6:	db e9                	fucomi %st(1),%st
 804dac8:	77 1e                	ja     804dae8 <_dtoa_r+0x618>
 804daca:	d9 c9                	fxch   %st(1)
 804dacc:	df e9                	fucomip %st(1),%st
 804dace:	dd d8                	fstp   %st(0)
 804dad0:	0f 8a 44 09 00 00    	jp     804e41a <_dtoa_r+0xf4a>
 804dad6:	0f 85 3e 09 00 00    	jne    804e41a <_dtoa_r+0xf4a>
 804dadc:	83 e2 01             	and    $0x1,%edx
 804dadf:	90                   	nop
 804dae0:	0f 84 34 09 00 00    	je     804e41a <_dtoa_r+0xf4a>
 804dae6:	eb 04                	jmp    804daec <_dtoa_r+0x61c>
 804dae8:	dd d8                	fstp   %st(0)
 804daea:	dd d8                	fstp   %st(0)
 804daec:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804daef:	89 fb                	mov    %edi,%ebx
 804daf1:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
 804daf5:	89 cf                	mov    %ecx,%edi
 804daf7:	8b 4d b8             	mov    -0x48(%ebp),%ecx
 804dafa:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
 804dafd:	eb 0f                	jmp    804db0e <_dtoa_r+0x63e>
 804daff:	90                   	nop
 804db00:	39 d3                	cmp    %edx,%ebx
 804db02:	0f 84 75 09 00 00    	je     804e47d <_dtoa_r+0xfad>
 804db08:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
 804db0c:	89 d7                	mov    %edx,%edi
 804db0e:	3c 39                	cmp    $0x39,%al
 804db10:	8d 57 ff             	lea    -0x1(%edi),%edx
 804db13:	74 eb                	je     804db00 <_dtoa_r+0x630>
 804db15:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804db18:	83 c0 01             	add    $0x1,%eax
 804db1b:	88 02                	mov    %al,(%edx)
 804db1d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
 804db20:	e9 fb 01 00 00       	jmp    804dd20 <_dtoa_r+0x850>
 804db25:	8d 76 00             	lea    0x0(%esi),%esi
 804db28:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804db2b:	85 c9                	test   %ecx,%ecx
 804db2d:	0f 85 9d 02 00 00    	jne    804ddd0 <_dtoa_r+0x900>
 804db33:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804db36:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804db39:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804db40:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804db43:	85 c0                	test   %eax,%eax
 804db45:	7e 14                	jle    804db5b <_dtoa_r+0x68b>
 804db47:	85 db                	test   %ebx,%ebx
 804db49:	7e 10                	jle    804db5b <_dtoa_r+0x68b>
 804db4b:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804db4e:	39 d8                	cmp    %ebx,%eax
 804db50:	0f 4f c3             	cmovg  %ebx,%eax
 804db53:	29 45 a0             	sub    %eax,-0x60(%ebp)
 804db56:	29 c3                	sub    %eax,%ebx
 804db58:	29 45 ac             	sub    %eax,-0x54(%ebp)
 804db5b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804db5e:	85 c0                	test   %eax,%eax
 804db60:	7e 61                	jle    804dbc3 <_dtoa_r+0x6f3>
 804db62:	8b 45 98             	mov    -0x68(%ebp),%eax
 804db65:	85 c0                	test   %eax,%eax
 804db67:	0f 84 72 04 00 00    	je     804dfdf <_dtoa_r+0xb0f>
 804db6d:	85 d2                	test   %edx,%edx
 804db6f:	7e 47                	jle    804dbb8 <_dtoa_r+0x6e8>
 804db71:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804db74:	89 54 24 08          	mov    %edx,0x8(%esp)
 804db78:	89 34 24             	mov    %esi,(%esp)
 804db7b:	89 55 88             	mov    %edx,-0x78(%ebp)
 804db7e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804db82:	e8 79 26 00 00       	call   8050200 <__pow5mult>
 804db87:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
 804db8a:	89 34 24             	mov    %esi,(%esp)
 804db8d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804db91:	89 44 24 04          	mov    %eax,0x4(%esp)
 804db95:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804db98:	e8 93 24 00 00       	call   8050030 <__multiply>
 804db9d:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
 804dba0:	89 34 24             	mov    %esi,(%esp)
 804dba3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804dba7:	89 45 8c             	mov    %eax,-0x74(%ebp)
 804dbaa:	e8 71 21 00 00       	call   804fd20 <_Bfree>
 804dbaf:	8b 45 8c             	mov    -0x74(%ebp),%eax
 804dbb2:	8b 55 88             	mov    -0x78(%ebp),%edx
 804dbb5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804dbb8:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dbbb:	29 d0                	sub    %edx,%eax
 804dbbd:	0f 85 1f 04 00 00    	jne    804dfe2 <_dtoa_r+0xb12>
 804dbc3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804dbca:	00 
 804dbcb:	89 34 24             	mov    %esi,(%esp)
 804dbce:	e8 2d 24 00 00       	call   8050000 <__i2b>
 804dbd3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
 804dbd6:	85 c9                	test   %ecx,%ecx
 804dbd8:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dbdb:	7e 13                	jle    804dbf0 <_dtoa_r+0x720>
 804dbdd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804dbe1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dbe5:	89 34 24             	mov    %esi,(%esp)
 804dbe8:	e8 13 26 00 00       	call   8050200 <__pow5mult>
 804dbed:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dbf0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
 804dbf4:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
 804dbfb:	0f 8e f7 05 00 00    	jle    804e1f8 <_dtoa_r+0xd28>
 804dc01:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804dc04:	ba 01 00 00 00       	mov    $0x1,%edx
 804dc09:	85 c0                	test   %eax,%eax
 804dc0b:	0f 85 27 05 00 00    	jne    804e138 <_dtoa_r+0xc68>
 804dc11:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804dc14:	01 d0                	add    %edx,%eax
 804dc16:	83 e0 1f             	and    $0x1f,%eax
 804dc19:	89 c2                	mov    %eax,%edx
 804dc1b:	0f 84 57 03 00 00    	je     804df78 <_dtoa_r+0xaa8>
 804dc21:	b8 20 00 00 00       	mov    $0x20,%eax
 804dc26:	29 d0                	sub    %edx,%eax
 804dc28:	83 f8 04             	cmp    $0x4,%eax
 804dc2b:	0f 8e 8c 0a 00 00    	jle    804e6bd <_dtoa_r+0x11ed>
 804dc31:	b8 1c 00 00 00       	mov    $0x1c,%eax
 804dc36:	29 d0                	sub    %edx,%eax
 804dc38:	01 45 a0             	add    %eax,-0x60(%ebp)
 804dc3b:	01 c3                	add    %eax,%ebx
 804dc3d:	01 45 ac             	add    %eax,-0x54(%ebp)
 804dc40:	8b 45 a0             	mov    -0x60(%ebp),%eax
 804dc43:	85 c0                	test   %eax,%eax
 804dc45:	7e 16                	jle    804dc5d <_dtoa_r+0x78d>
 804dc47:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dc4b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dc4e:	89 34 24             	mov    %esi,(%esp)
 804dc51:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dc55:	e8 c6 26 00 00       	call   8050320 <__lshift>
 804dc5a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804dc5d:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804dc60:	85 c0                	test   %eax,%eax
 804dc62:	7e 16                	jle    804dc7a <_dtoa_r+0x7aa>
 804dc64:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dc68:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dc6b:	89 34 24             	mov    %esi,(%esp)
 804dc6e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dc72:	e8 a9 26 00 00       	call   8050320 <__lshift>
 804dc77:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dc7a:	8b 45 9c             	mov    -0x64(%ebp),%eax
 804dc7d:	85 c0                	test   %eax,%eax
 804dc7f:	0f 85 d3 04 00 00    	jne    804e158 <_dtoa_r+0xc88>
 804dc85:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804dc89:	0f 8e 11 02 00 00    	jle    804dea0 <_dtoa_r+0x9d0>
 804dc8f:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dc92:	85 c0                	test   %eax,%eax
 804dc94:	0f 8f 06 02 00 00    	jg     804dea0 <_dtoa_r+0x9d0>
 804dc9a:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dc9d:	85 c0                	test   %eax,%eax
 804dc9f:	0f 85 e0 01 00 00    	jne    804de85 <_dtoa_r+0x9b5>
 804dca5:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dca8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804dcaf:	00 
 804dcb0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
 804dcb7:	00 
 804dcb8:	89 34 24             	mov    %esi,(%esp)
 804dcbb:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dcbf:	e8 7c 20 00 00       	call   804fd40 <__multadd>
 804dcc4:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dcc7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dccb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dcce:	89 04 24             	mov    %eax,(%esp)
 804dcd1:	e8 6a 27 00 00       	call   8050440 <__mcmp>
 804dcd6:	85 c0                	test   %eax,%eax
 804dcd8:	0f 8e a7 01 00 00    	jle    804de85 <_dtoa_r+0x9b5>
 804dcde:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
 804dce2:	89 fb                	mov    %edi,%ebx
 804dce4:	83 c7 01             	add    $0x1,%edi
 804dce7:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
 804dceb:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804dcf2:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dcf5:	89 34 24             	mov    %esi,(%esp)
 804dcf8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dcfc:	e8 1f 20 00 00       	call   804fd20 <_Bfree>
 804dd01:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804dd04:	85 c0                	test   %eax,%eax
 804dd06:	74 18                	je     804dd20 <_dtoa_r+0x850>
 804dd08:	39 45 c0             	cmp    %eax,-0x40(%ebp)
 804dd0b:	0f 85 a7 02 00 00    	jne    804dfb8 <_dtoa_r+0xae8>
 804dd11:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804dd14:	89 34 24             	mov    %esi,(%esp)
 804dd17:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dd1b:	e8 00 20 00 00       	call   804fd20 <_Bfree>
 804dd20:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dd23:	89 34 24             	mov    %esi,(%esp)
 804dd26:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dd2a:	e8 f1 1f 00 00       	call   804fd20 <_Bfree>
 804dd2f:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804dd32:	8b 75 1c             	mov    0x1c(%ebp),%esi
 804dd35:	c6 07 00             	movb   $0x0,(%edi)
 804dd38:	83 c0 01             	add    $0x1,%eax
 804dd3b:	89 06                	mov    %eax,(%esi)
 804dd3d:	8b 45 24             	mov    0x24(%ebp),%eax
 804dd40:	85 c0                	test   %eax,%eax
 804dd42:	0f 84 90 02 00 00    	je     804dfd8 <_dtoa_r+0xb08>
 804dd48:	8b 45 24             	mov    0x24(%ebp),%eax
 804dd4b:	89 38                	mov    %edi,(%eax)
 804dd4d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804dd53:	89 d8                	mov    %ebx,%eax
 804dd55:	5b                   	pop    %ebx
 804dd56:	5e                   	pop    %esi
 804dd57:	5f                   	pop    %edi
 804dd58:	5d                   	pop    %ebp
 804dd59:	c3                   	ret    
 804dd5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804dd60:	db 45 b8             	fildl  -0x48(%ebp)
 804dd63:	df e9                	fucomip %st(1),%st
 804dd65:	dd d8                	fstp   %st(0)
 804dd67:	7a 06                	jp     804dd6f <_dtoa_r+0x89f>
 804dd69:	0f 84 cc f8 ff ff    	je     804d63b <_dtoa_r+0x16b>
 804dd6f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804dd73:	e9 c3 f8 ff ff       	jmp    804d63b <_dtoa_r+0x16b>
 804dd78:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804dd7b:	29 45 a0             	sub    %eax,-0x60(%ebp)
 804dd7e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
 804dd85:	f7 d8                	neg    %eax
 804dd87:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804dd8a:	e9 0c f9 ff ff       	jmp    804d69b <_dtoa_r+0x1cb>
 804dd8f:	90                   	nop
 804dd90:	f7 d8                	neg    %eax
 804dd92:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804dd95:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
 804dd9c:	e9 e2 f8 ff ff       	jmp    804d683 <_dtoa_r+0x1b3>
 804dda1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804dda8:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804ddab:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
 804ddb0:	29 d9                	sub    %ebx,%ecx
 804ddb2:	d3 e0                	shl    %cl,%eax
 804ddb4:	e9 1b f8 ff ff       	jmp    804d5d4 <_dtoa_r+0x104>
 804ddb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804ddc0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
 804ddc7:	e9 a0 f8 ff ff       	jmp    804d66c <_dtoa_r+0x19c>
 804ddcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ddd0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
 804ddd4:	0f 8e fe 06 00 00    	jle    804e4d8 <_dtoa_r+0x1008>
 804ddda:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804dddd:	83 e8 01             	sub    $0x1,%eax
 804dde0:	39 45 b0             	cmp    %eax,-0x50(%ebp)
 804dde3:	0f 8c 3b 06 00 00    	jl     804e424 <_dtoa_r+0xf54>
 804dde9:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804ddec:	29 c2                	sub    %eax,%edx
 804ddee:	8b 4d a8             	mov    -0x58(%ebp),%ecx
 804ddf1:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804ddf4:	85 c9                	test   %ecx,%ecx
 804ddf6:	89 c8                	mov    %ecx,%eax
 804ddf8:	0f 88 83 07 00 00    	js     804e581 <_dtoa_r+0x10b1>
 804ddfe:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804de05:	00 
 804de06:	89 34 24             	mov    %esi,(%esp)
 804de09:	89 55 8c             	mov    %edx,-0x74(%ebp)
 804de0c:	01 45 a0             	add    %eax,-0x60(%ebp)
 804de0f:	01 45 ac             	add    %eax,-0x54(%ebp)
 804de12:	e8 e9 21 00 00       	call   8050000 <__i2b>
 804de17:	8b 55 8c             	mov    -0x74(%ebp),%edx
 804de1a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804de1d:	e9 1e fd ff ff       	jmp    804db40 <_dtoa_r+0x670>
 804de22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804de28:	d9 c1                	fld    %st(1)
 804de2a:	b9 02 00 00 00       	mov    $0x2,%ecx
 804de2f:	e9 37 fa ff ff       	jmp    804d86b <_dtoa_r+0x39b>
 804de34:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804de37:	db 45 d4             	fildl  -0x2c(%ebp)
 804de3a:	d8 c9                	fmul   %st(1),%st
 804de3c:	d8 05 4c 49 05 08    	fadds  0x805494c
 804de42:	dd 5d c0             	fstpl  -0x40(%ebp)
 804de45:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804de4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804de50:	d8 25 50 49 05 08    	fsubs  0x8054950
 804de56:	dd 45 c0             	fldl   -0x40(%ebp)
 804de59:	d9 c9                	fxch   %st(1)
 804de5b:	db e9                	fucomi %st(1),%st
 804de5d:	0f 87 0d 02 00 00    	ja     804e070 <_dtoa_r+0xba0>
 804de63:	d9 c9                	fxch   %st(1)
 804de65:	d9 e0                	fchs   
 804de67:	df e9                	fucomip %st(1),%st
 804de69:	dd d8                	fstp   %st(0)
 804de6b:	0f 86 a7 01 00 00    	jbe    804e018 <_dtoa_r+0xb48>
 804de71:	dd d8                	fstp   %st(0)
 804de73:	eb 02                	jmp    804de77 <_dtoa_r+0x9a7>
 804de75:	dd d8                	fstp   %st(0)
 804de77:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804de7e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804de85:	8b 45 18             	mov    0x18(%ebp),%eax
 804de88:	89 fb                	mov    %edi,%ebx
 804de8a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804de91:	f7 d0                	not    %eax
 804de93:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804de96:	e9 57 fe ff ff       	jmp    804dcf2 <_dtoa_r+0x822>
 804de9b:	90                   	nop
 804de9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804dea0:	8b 45 98             	mov    -0x68(%ebp),%eax
 804dea3:	85 c0                	test   %eax,%eax
 804dea5:	0f 85 c5 03 00 00    	jne    804e270 <_dtoa_r+0xda0>
 804deab:	89 75 08             	mov    %esi,0x8(%ebp)
 804deae:	bb 01 00 00 00       	mov    $0x1,%ebx
 804deb3:	8b 75 a4             	mov    -0x5c(%ebp),%esi
 804deb6:	eb 24                	jmp    804dedc <_dtoa_r+0xa0c>
 804deb8:	8b 45 08             	mov    0x8(%ebp),%eax
 804debb:	83 c3 01             	add    $0x1,%ebx
 804debe:	89 74 24 04          	mov    %esi,0x4(%esp)
 804dec2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804dec9:	00 
 804deca:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804ded1:	00 
 804ded2:	89 04 24             	mov    %eax,(%esp)
 804ded5:	e8 66 1e 00 00       	call   804fd40 <__multadd>
 804deda:	89 c6                	mov    %eax,%esi
 804dedc:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804dedf:	89 f0                	mov    %esi,%eax
 804dee1:	e8 1a f4 ff ff       	call   804d300 <quorem>
 804dee6:	83 c0 30             	add    $0x30,%eax
 804dee9:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
 804deec:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
 804def0:	7c c6                	jl     804deb8 <_dtoa_r+0x9e8>
 804def2:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804def5:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804def8:	ba 01 00 00 00       	mov    $0x1,%edx
 804defd:	89 75 a4             	mov    %esi,-0x5c(%ebp)
 804df00:	8b 75 08             	mov    0x8(%ebp),%esi
 804df03:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804df0a:	85 c0                	test   %eax,%eax
 804df0c:	0f 4f d0             	cmovg  %eax,%edx
 804df0f:	01 fa                	add    %edi,%edx
 804df11:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804df14:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804df1b:	00 
 804df1c:	89 34 24             	mov    %esi,(%esp)
 804df1f:	89 55 ac             	mov    %edx,-0x54(%ebp)
 804df22:	89 44 24 04          	mov    %eax,0x4(%esp)
 804df26:	e8 f5 23 00 00       	call   8050320 <__lshift>
 804df2b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
 804df2e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804df32:	89 04 24             	mov    %eax,(%esp)
 804df35:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804df38:	e8 03 25 00 00       	call   8050440 <__mcmp>
 804df3d:	8b 55 ac             	mov    -0x54(%ebp),%edx
 804df40:	83 f8 00             	cmp    $0x0,%eax
 804df43:	0f 8e 41 06 00 00    	jle    804e58a <_dtoa_r+0x10ba>
 804df49:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 804df4d:	eb 0f                	jmp    804df5e <_dtoa_r+0xa8e>
 804df4f:	90                   	nop
 804df50:	39 c7                	cmp    %eax,%edi
 804df52:	0f 84 70 05 00 00    	je     804e4c8 <_dtoa_r+0xff8>
 804df58:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
 804df5c:	89 c2                	mov    %eax,%edx
 804df5e:	80 f9 39             	cmp    $0x39,%cl
 804df61:	8d 42 ff             	lea    -0x1(%edx),%eax
 804df64:	74 ea                	je     804df50 <_dtoa_r+0xa80>
 804df66:	83 c1 01             	add    $0x1,%ecx
 804df69:	89 fb                	mov    %edi,%ebx
 804df6b:	88 08                	mov    %cl,(%eax)
 804df6d:	89 d7                	mov    %edx,%edi
 804df6f:	e9 7e fd ff ff       	jmp    804dcf2 <_dtoa_r+0x822>
 804df74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804df78:	b8 1c 00 00 00       	mov    $0x1c,%eax
 804df7d:	01 45 a0             	add    %eax,-0x60(%ebp)
 804df80:	01 c3                	add    %eax,%ebx
 804df82:	01 45 ac             	add    %eax,-0x54(%ebp)
 804df85:	e9 b6 fc ff ff       	jmp    804dc40 <_dtoa_r+0x770>
 804df8a:	ba 01 00 00 00       	mov    $0x1,%edx
 804df8f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
 804df96:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
 804df9d:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
 804dfa4:	21 c2                	and    %eax,%edx
 804dfa6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
 804dfa9:	31 d2                	xor    %edx,%edx
 804dfab:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
 804dfb2:	e9 62 f8 ff ff       	jmp    804d819 <_dtoa_r+0x349>
 804dfb7:	90                   	nop
 804dfb8:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804dfbb:	85 d2                	test   %edx,%edx
 804dfbd:	0f 84 4e fd ff ff    	je     804dd11 <_dtoa_r+0x841>
 804dfc3:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804dfc6:	89 34 24             	mov    %esi,(%esp)
 804dfc9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dfcd:	e8 4e 1d 00 00       	call   804fd20 <_Bfree>
 804dfd2:	e9 3a fd ff ff       	jmp    804dd11 <_dtoa_r+0x841>
 804dfd7:	90                   	nop
 804dfd8:	89 d8                	mov    %ebx,%eax
 804dfda:	e9 89 f5 ff ff       	jmp    804d568 <_dtoa_r+0x98>
 804dfdf:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804dfe2:	89 44 24 08          	mov    %eax,0x8(%esp)
 804dfe6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804dfe9:	89 34 24             	mov    %esi,(%esp)
 804dfec:	89 44 24 04          	mov    %eax,0x4(%esp)
 804dff0:	e8 0b 22 00 00       	call   8050200 <__pow5mult>
 804dff5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804dff8:	e9 c6 fb ff ff       	jmp    804dbc3 <_dtoa_r+0x6f3>
 804dffd:	dd d8                	fstp   %st(0)
 804dfff:	dd d8                	fstp   %st(0)
 804e001:	eb 15                	jmp    804e018 <_dtoa_r+0xb48>
 804e003:	90                   	nop
 804e004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e008:	dd d8                	fstp   %st(0)
 804e00a:	dd d8                	fstp   %st(0)
 804e00c:	dd d8                	fstp   %st(0)
 804e00e:	eb 08                	jmp    804e018 <_dtoa_r+0xb48>
 804e010:	dd d8                	fstp   %st(0)
 804e012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e018:	dd 5d c0             	fstpl  -0x40(%ebp)
 804e01b:	e9 cf f9 ff ff       	jmp    804d9ef <_dtoa_r+0x51f>
 804e020:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804e023:	f7 d8                	neg    %eax
 804e025:	0f 84 6a 04 00 00    	je     804e495 <_dtoa_r+0xfc5>
 804e02b:	89 c2                	mov    %eax,%edx
 804e02d:	b9 02 00 00 00       	mov    $0x2,%ecx
 804e032:	83 e2 0f             	and    $0xf,%edx
 804e035:	c1 f8 04             	sar    $0x4,%eax
 804e038:	dd 04 d5 20 4a 05 08 	fldl   0x8054a20(,%edx,8)
 804e03f:	85 c0                	test   %eax,%eax
 804e041:	d8 c9                	fmul   %st(1),%st
 804e043:	0f 84 4a f8 ff ff    	je     804d893 <_dtoa_r+0x3c3>
 804e049:	31 d2                	xor    %edx,%edx
 804e04b:	90                   	nop
 804e04c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e050:	a8 01                	test   $0x1,%al
 804e052:	74 0a                	je     804e05e <_dtoa_r+0xb8e>
 804e054:	dc 0c d5 e0 49 05 08 	fmull  0x80549e0(,%edx,8)
 804e05b:	83 c1 01             	add    $0x1,%ecx
 804e05e:	83 c2 01             	add    $0x1,%edx
 804e061:	d1 f8                	sar    %eax
 804e063:	75 eb                	jne    804e050 <_dtoa_r+0xb80>
 804e065:	e9 29 f8 ff ff       	jmp    804d893 <_dtoa_r+0x3c3>
 804e06a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e070:	dd d8                	fstp   %st(0)
 804e072:	dd d8                	fstp   %st(0)
 804e074:	dd d8                	fstp   %st(0)
 804e076:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804e07d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804e084:	e9 55 fc ff ff       	jmp    804dcde <_dtoa_r+0x80e>
 804e089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e090:	d9 7d d2             	fnstcw -0x2e(%ebp)
 804e093:	8d 41 ff             	lea    -0x1(%ecx),%eax
 804e096:	dd 45 c0             	fldl   -0x40(%ebp)
 804e099:	dc 0c c5 20 4a 05 08 	fmull  0x8054a20(,%eax,8)
 804e0a0:	d9 c9                	fxch   %st(1)
 804e0a2:	89 45 88             	mov    %eax,-0x78(%ebp)
 804e0a5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
 804e0a9:	8d 57 01             	lea    0x1(%edi),%edx
 804e0ac:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
 804e0af:	b4 0c                	mov    $0xc,%ah
 804e0b1:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
 804e0b5:	d9 6d d0             	fldcw  -0x30(%ebp)
 804e0b8:	db 55 d4             	fistl  -0x2c(%ebp)
 804e0bb:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804e0be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804e0c1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804e0c4:	83 c0 30             	add    $0x30,%eax
 804e0c7:	83 f9 01             	cmp    $0x1,%ecx
 804e0ca:	db 45 d4             	fildl  -0x2c(%ebp)
 804e0cd:	de e9                	fsubrp %st,%st(1)
 804e0cf:	88 07                	mov    %al,(%edi)
 804e0d1:	89 d0                	mov    %edx,%eax
 804e0d3:	74 37                	je     804e10c <_dtoa_r+0xc3c>
 804e0d5:	d9 05 48 49 05 08    	flds   0x8054948
 804e0db:	eb 05                	jmp    804e0e2 <_dtoa_r+0xc12>
 804e0dd:	8d 76 00             	lea    0x0(%esi),%esi
 804e0e0:	d9 c9                	fxch   %st(1)
 804e0e2:	dc c9                	fmul   %st,%st(1)
 804e0e4:	d9 c9                	fxch   %st(1)
 804e0e6:	83 c0 01             	add    $0x1,%eax
 804e0e9:	d9 6d d0             	fldcw  -0x30(%ebp)
 804e0ec:	db 55 d4             	fistl  -0x2c(%ebp)
 804e0ef:	d9 6d d2             	fldcw  -0x2e(%ebp)
 804e0f2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 804e0f5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804e0f8:	83 c1 30             	add    $0x30,%ecx
 804e0fb:	39 d8                	cmp    %ebx,%eax
 804e0fd:	db 45 d4             	fildl  -0x2c(%ebp)
 804e100:	de e9                	fsubrp %st,%st(1)
 804e102:	88 48 ff             	mov    %cl,-0x1(%eax)
 804e105:	75 d9                	jne    804e0e0 <_dtoa_r+0xc10>
 804e107:	dd d9                	fstp   %st(1)
 804e109:	03 55 88             	add    -0x78(%ebp),%edx
 804e10c:	d9 05 54 49 05 08    	flds   0x8054954
 804e112:	d9 c2                	fld    %st(2)
 804e114:	d8 c1                	fadd   %st(1),%st
 804e116:	d9 ca                	fxch   %st(2)
 804e118:	db ea                	fucomi %st(2),%st
 804e11a:	dd da                	fstp   %st(2)
 804e11c:	0f 86 7f 03 00 00    	jbe    804e4a1 <_dtoa_r+0xfd1>
 804e122:	dd d8                	fstp   %st(0)
 804e124:	dd d8                	fstp   %st(0)
 804e126:	dd d8                	fstp   %st(0)
 804e128:	dd d8                	fstp   %st(0)
 804e12a:	89 fb                	mov    %edi,%ebx
 804e12c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
 804e130:	89 d7                	mov    %edx,%edi
 804e132:	e9 d7 f9 ff ff       	jmp    804db0e <_dtoa_r+0x63e>
 804e137:	90                   	nop
 804e138:	8b 4d b0             	mov    -0x50(%ebp),%ecx
 804e13b:	8b 41 10             	mov    0x10(%ecx),%eax
 804e13e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
 804e142:	89 04 24             	mov    %eax,(%esp)
 804e145:	e8 d6 1d 00 00       	call   804ff20 <__hi0bits>
 804e14a:	ba 20 00 00 00       	mov    $0x20,%edx
 804e14f:	29 c2                	sub    %eax,%edx
 804e151:	e9 bb fa ff ff       	jmp    804dc11 <_dtoa_r+0x741>
 804e156:	66 90                	xchg   %ax,%ax
 804e158:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804e15b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e15f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e162:	89 04 24             	mov    %eax,(%esp)
 804e165:	e8 d6 22 00 00       	call   8050440 <__mcmp>
 804e16a:	85 c0                	test   %eax,%eax
 804e16c:	0f 89 13 fb ff ff    	jns    804dc85 <_dtoa_r+0x7b5>
 804e172:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e175:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e17c:	00 
 804e17d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e184:	00 
 804e185:	89 34 24             	mov    %esi,(%esp)
 804e188:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e18c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804e190:	e8 ab 1b 00 00       	call   804fd40 <__multadd>
 804e195:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e198:	85 c9                	test   %ecx,%ecx
 804e19a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804e19d:	0f 85 8d 00 00 00    	jne    804e230 <_dtoa_r+0xd60>
 804e1a3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
 804e1a7:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e1aa:	7f 0a                	jg     804e1b6 <_dtoa_r+0xce6>
 804e1ac:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804e1b0:	0f 8f ff 04 00 00    	jg     804e6b5 <_dtoa_r+0x11e5>
 804e1b6:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e1b9:	e9 ed fc ff ff       	jmp    804deab <_dtoa_r+0x9db>
 804e1be:	66 90                	xchg   %ax,%ax
 804e1c0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
 804e1c3:	85 db                	test   %ebx,%ebx
 804e1c5:	0f 85 aa fc ff ff    	jne    804de75 <_dtoa_r+0x9a5>
 804e1cb:	d8 0d 50 49 05 08    	fmuls  0x8054950
 804e1d1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804e1d8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 804e1df:	dd 45 c0             	fldl   -0x40(%ebp)
 804e1e2:	d9 c9                	fxch   %st(1)
 804e1e4:	df e9                	fucomip %st(1),%st
 804e1e6:	dd d8                	fstp   %st(0)
 804e1e8:	0f 83 97 fc ff ff    	jae    804de85 <_dtoa_r+0x9b5>
 804e1ee:	e9 eb fa ff ff       	jmp    804dcde <_dtoa_r+0x80e>
 804e1f3:	90                   	nop
 804e1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e1f8:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804e1fb:	85 c0                	test   %eax,%eax
 804e1fd:	0f 85 fe f9 ff ff    	jne    804dc01 <_dtoa_r+0x731>
 804e203:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804e206:	a9 ff ff 0f 00       	test   $0xfffff,%eax
 804e20b:	0f 85 f0 f9 ff ff    	jne    804dc01 <_dtoa_r+0x731>
 804e211:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
 804e216:	0f 84 e5 f9 ff ff    	je     804dc01 <_dtoa_r+0x731>
 804e21c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
 804e220:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
 804e224:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
 804e22b:	e9 d1 f9 ff ff       	jmp    804dc01 <_dtoa_r+0x731>
 804e230:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e233:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e23a:	00 
 804e23b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e242:	00 
 804e243:	89 34 24             	mov    %esi,(%esp)
 804e246:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e24a:	e8 f1 1a 00 00       	call   804fd40 <__multadd>
 804e24f:	8b 55 90             	mov    -0x70(%ebp),%edx
 804e252:	85 d2                	test   %edx,%edx
 804e254:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e257:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e25a:	7f 0a                	jg     804e266 <_dtoa_r+0xd96>
 804e25c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
 804e260:	0f 8f 4f 04 00 00    	jg     804e6b5 <_dtoa_r+0x11e5>
 804e266:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e270:	85 db                	test   %ebx,%ebx
 804e272:	7e 16                	jle    804e28a <_dtoa_r+0xdba>
 804e274:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e277:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 804e27b:	89 34 24             	mov    %esi,(%esp)
 804e27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e282:	e8 99 20 00 00       	call   8050320 <__lshift>
 804e287:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e28a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
 804e28d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e290:	85 db                	test   %ebx,%ebx
 804e292:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e295:	0f 85 11 03 00 00    	jne    804e5ac <_dtoa_r+0x10dc>
 804e29b:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e29e:	8d 5f 01             	lea    0x1(%edi),%ebx
 804e2a1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
 804e2a4:	01 f8                	add    %edi,%eax
 804e2a6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
 804e2a9:	89 45 90             	mov    %eax,-0x70(%ebp)
 804e2ac:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804e2af:	83 e0 01             	and    $0x1,%eax
 804e2b2:	89 45 9c             	mov    %eax,-0x64(%ebp)
 804e2b5:	eb 2e                	jmp    804e2e5 <_dtoa_r+0xe15>
 804e2b7:	90                   	nop
 804e2b8:	e8 83 1a 00 00       	call   804fd40 <__multadd>
 804e2bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e2c4:	00 
 804e2c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e2cc:	00 
 804e2cd:	89 34 24             	mov    %esi,(%esp)
 804e2d0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e2d3:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e2d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e2da:	e8 61 1a 00 00       	call   804fd40 <__multadd>
 804e2df:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e2e2:	83 c3 01             	add    $0x1,%ebx
 804e2e5:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e2e8:	8d 43 ff             	lea    -0x1(%ebx),%eax
 804e2eb:	89 45 98             	mov    %eax,-0x68(%ebp)
 804e2ee:	89 f8                	mov    %edi,%eax
 804e2f0:	e8 0b f0 ff ff       	call   804d300 <quorem>
 804e2f5:	89 3c 24             	mov    %edi,(%esp)
 804e2f8:	8d 48 30             	lea    0x30(%eax),%ecx
 804e2fb:	89 4d a0             	mov    %ecx,-0x60(%ebp)
 804e2fe:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804e301:	89 45 94             	mov    %eax,-0x6c(%ebp)
 804e304:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804e308:	e8 33 21 00 00       	call   8050440 <__mcmp>
 804e30d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
 804e310:	89 34 24             	mov    %esi,(%esp)
 804e313:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804e317:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e31a:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804e31d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e321:	e8 6a 21 00 00       	call   8050490 <__mdiff>
 804e326:	8b 48 0c             	mov    0xc(%eax),%ecx
 804e329:	89 c2                	mov    %eax,%edx
 804e32b:	85 c9                	test   %ecx,%ecx
 804e32d:	0f 85 c5 00 00 00    	jne    804e3f8 <_dtoa_r+0xf28>
 804e333:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e337:	89 3c 24             	mov    %edi,(%esp)
 804e33a:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e33d:	e8 fe 20 00 00       	call   8050440 <__mcmp>
 804e342:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804e345:	89 54 24 04          	mov    %edx,0x4(%esp)
 804e349:	89 34 24             	mov    %esi,(%esp)
 804e34c:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e34f:	e8 cc 19 00 00       	call   804fd20 <_Bfree>
 804e354:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e357:	89 c1                	mov    %eax,%ecx
 804e359:	0b 4d 14             	or     0x14(%ebp),%ecx
 804e35c:	75 0b                	jne    804e369 <_dtoa_r+0xe99>
 804e35e:	8b 55 9c             	mov    -0x64(%ebp),%edx
 804e361:	85 d2                	test   %edx,%edx
 804e363:	0f 84 fb 02 00 00    	je     804e664 <_dtoa_r+0x1194>
 804e369:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804e36c:	85 d2                	test   %edx,%edx
 804e36e:	0f 88 7f 01 00 00    	js     804e4f3 <_dtoa_r+0x1023>
 804e374:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804e377:	0b 4d 14             	or     0x14(%ebp),%ecx
 804e37a:	75 0b                	jne    804e387 <_dtoa_r+0xeb7>
 804e37c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
 804e37f:	85 c9                	test   %ecx,%ecx
 804e381:	0f 84 6c 01 00 00    	je     804e4f3 <_dtoa_r+0x1023>
 804e387:	85 c0                	test   %eax,%eax
 804e389:	0f 8f 82 02 00 00    	jg     804e611 <_dtoa_r+0x1141>
 804e38f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e393:	89 da                	mov    %ebx,%edx
 804e395:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
 804e398:	88 43 ff             	mov    %al,-0x1(%ebx)
 804e39b:	0f 84 8d 02 00 00    	je     804e62e <_dtoa_r+0x115e>
 804e3a1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 804e3a5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e3ac:	00 
 804e3ad:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e3b4:	00 
 804e3b5:	89 34 24             	mov    %esi,(%esp)
 804e3b8:	e8 83 19 00 00       	call   804fd40 <__multadd>
 804e3bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e3c4:	00 
 804e3c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804e3cc:	00 
 804e3cd:	89 34 24             	mov    %esi,(%esp)
 804e3d0:	89 c7                	mov    %eax,%edi
 804e3d2:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e3d5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
 804e3d8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e3db:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e3df:	0f 85 d3 fe ff ff    	jne    804e2b8 <_dtoa_r+0xde8>
 804e3e5:	e8 56 19 00 00       	call   804fd40 <__multadd>
 804e3ea:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e3ed:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e3f0:	e9 ed fe ff ff       	jmp    804e2e2 <_dtoa_r+0xe12>
 804e3f5:	8d 76 00             	lea    0x0(%esi),%esi
 804e3f8:	b8 01 00 00 00       	mov    $0x1,%eax
 804e3fd:	e9 43 ff ff ff       	jmp    804e345 <_dtoa_r+0xe75>
 804e402:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
 804e409:	e9 d2 f2 ff ff       	jmp    804d6e0 <_dtoa_r+0x210>
 804e40e:	0f 85 87 f6 ff ff    	jne    804da9b <_dtoa_r+0x5cb>
 804e414:	dd d8                	fstp   %st(0)
 804e416:	dd d8                	fstp   %st(0)
 804e418:	dd d8                	fstp   %st(0)
 804e41a:	89 fb                	mov    %edi,%ebx
 804e41c:	8b 7d c0             	mov    -0x40(%ebp),%edi
 804e41f:	e9 fc f8 ff ff       	jmp    804dd20 <_dtoa_r+0x850>
 804e424:	89 c2                	mov    %eax,%edx
 804e426:	2b 55 b0             	sub    -0x50(%ebp),%edx
 804e429:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804e42c:	01 55 94             	add    %edx,-0x6c(%ebp)
 804e42f:	31 d2                	xor    %edx,%edx
 804e431:	e9 b8 f9 ff ff       	jmp    804ddee <_dtoa_r+0x91e>
 804e436:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804e439:	85 c0                	test   %eax,%eax
 804e43b:	0f 84 f3 f9 ff ff    	je     804de34 <_dtoa_r+0x964>
 804e441:	8b 45 90             	mov    -0x70(%ebp),%eax
 804e444:	85 c0                	test   %eax,%eax
 804e446:	0f 8e c4 fb ff ff    	jle    804e010 <_dtoa_r+0xb40>
 804e44c:	d8 0d 48 49 05 08    	fmuls  0x8054948
 804e452:	83 c1 01             	add    $0x1,%ecx
 804e455:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 804e458:	8b 5d b8             	mov    -0x48(%ebp),%ebx
 804e45b:	89 c1                	mov    %eax,%ecx
 804e45d:	83 eb 01             	sub    $0x1,%ebx
 804e460:	db 45 d4             	fildl  -0x2c(%ebp)
 804e463:	d8 c9                	fmul   %st(1),%st
 804e465:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
 804e468:	d8 05 4c 49 05 08    	fadds  0x805494c
 804e46e:	dd 5d c0             	fstpl  -0x40(%ebp)
 804e471:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
 804e478:	e9 53 f4 ff ff       	jmp    804d8d0 <_dtoa_r+0x400>
 804e47d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e480:	c6 03 30             	movb   $0x30,(%ebx)
 804e483:	83 c0 01             	add    $0x1,%eax
 804e486:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804e489:	b8 31 00 00 00       	mov    $0x31,%eax
 804e48e:	88 02                	mov    %al,(%edx)
 804e490:	e9 8b f8 ff ff       	jmp    804dd20 <_dtoa_r+0x850>
 804e495:	d9 c0                	fld    %st(0)
 804e497:	b9 02 00 00 00       	mov    $0x2,%ecx
 804e49c:	e9 f2 f3 ff ff       	jmp    804d893 <_dtoa_r+0x3c3>
 804e4a1:	de e2                	fsubp  %st,%st(2)
 804e4a3:	d9 c9                	fxch   %st(1)
 804e4a5:	df e9                	fucomip %st(1),%st
 804e4a7:	dd d8                	fstp   %st(0)
 804e4a9:	0f 86 69 fb ff ff    	jbe    804e018 <_dtoa_r+0xb48>
 804e4af:	dd d8                	fstp   %st(0)
 804e4b1:	eb 07                	jmp    804e4ba <_dtoa_r+0xfea>
 804e4b3:	90                   	nop
 804e4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e4b8:	89 c2                	mov    %eax,%edx
 804e4ba:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
 804e4be:	8d 42 ff             	lea    -0x1(%edx),%eax
 804e4c1:	74 f5                	je     804e4b8 <_dtoa_r+0xfe8>
 804e4c3:	e9 d9 f4 ff ff       	jmp    804d9a1 <_dtoa_r+0x4d1>
 804e4c8:	c6 07 31             	movb   $0x31,(%edi)
 804e4cb:	89 fb                	mov    %edi,%ebx
 804e4cd:	89 d7                	mov    %edx,%edi
 804e4cf:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
 804e4d3:	e9 1a f8 ff ff       	jmp    804dcf2 <_dtoa_r+0x822>
 804e4d8:	8b 55 8c             	mov    -0x74(%ebp),%edx
 804e4db:	85 d2                	test   %edx,%edx
 804e4dd:	0f 84 1b 01 00 00    	je     804e5fe <_dtoa_r+0x112e>
 804e4e3:	05 33 04 00 00       	add    $0x433,%eax
 804e4e8:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e4eb:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e4ee:	e9 0b f9 ff ff       	jmp    804ddfe <_dtoa_r+0x92e>
 804e4f3:	85 c0                	test   %eax,%eax
 804e4f5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e4f8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e4fb:	7e 45                	jle    804e542 <_dtoa_r+0x1072>
 804e4fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804e500:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804e507:	00 
 804e508:	89 34 24             	mov    %esi,(%esp)
 804e50b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e50f:	e8 0c 1e 00 00       	call   8050320 <__lshift>
 804e514:	8b 5d b0             	mov    -0x50(%ebp),%ebx
 804e517:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e51b:	89 04 24             	mov    %eax,(%esp)
 804e51e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804e521:	e8 1a 1f 00 00       	call   8050440 <__mcmp>
 804e526:	83 f8 00             	cmp    $0x0,%eax
 804e529:	0f 8e 5b 01 00 00    	jle    804e68a <_dtoa_r+0x11ba>
 804e52f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
 804e533:	0f 84 0c 01 00 00    	je     804e645 <_dtoa_r+0x1175>
 804e539:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804e53c:	83 c0 31             	add    $0x31,%eax
 804e53f:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804e542:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e545:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e549:	89 cb                	mov    %ecx,%ebx
 804e54b:	88 03                	mov    %al,(%ebx)
 804e54d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e550:	89 fb                	mov    %edi,%ebx
 804e552:	8d 79 01             	lea    0x1(%ecx),%edi
 804e555:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e558:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e55b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e55e:	e9 8f f7 ff ff       	jmp    804dcf2 <_dtoa_r+0x822>
 804e563:	dd d8                	fstp   %st(0)
 804e565:	dd d8                	fstp   %st(0)
 804e567:	dd d8                	fstp   %st(0)
 804e569:	eb 0d                	jmp    804e578 <_dtoa_r+0x10a8>
 804e56b:	90                   	nop
 804e56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804e570:	dd d8                	fstp   %st(0)
 804e572:	dd d8                	fstp   %st(0)
 804e574:	dd d8                	fstp   %st(0)
 804e576:	dd d8                	fstp   %st(0)
 804e578:	89 fb                	mov    %edi,%ebx
 804e57a:	89 d7                	mov    %edx,%edi
 804e57c:	e9 8d f5 ff ff       	jmp    804db0e <_dtoa_r+0x63e>
 804e581:	29 cb                	sub    %ecx,%ebx
 804e583:	31 c0                	xor    %eax,%eax
 804e585:	e9 74 f8 ff ff       	jmp    804ddfe <_dtoa_r+0x92e>
 804e58a:	75 0e                	jne    804e59a <_dtoa_r+0x10ca>
 804e58c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
 804e590:	74 08                	je     804e59a <_dtoa_r+0x10ca>
 804e592:	e9 b2 f9 ff ff       	jmp    804df49 <_dtoa_r+0xa79>
 804e597:	90                   	nop
 804e598:	89 c2                	mov    %eax,%edx
 804e59a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
 804e59e:	8d 42 ff             	lea    -0x1(%edx),%eax
 804e5a1:	74 f5                	je     804e598 <_dtoa_r+0x10c8>
 804e5a3:	89 fb                	mov    %edi,%ebx
 804e5a5:	89 d7                	mov    %edx,%edi
 804e5a7:	e9 46 f7 ff ff       	jmp    804dcf2 <_dtoa_r+0x822>
 804e5ac:	8b 40 04             	mov    0x4(%eax),%eax
 804e5af:	89 34 24             	mov    %esi,(%esp)
 804e5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e5b6:	e8 c5 16 00 00       	call   804fc80 <_Balloc>
 804e5bb:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804e5be:	89 c3                	mov    %eax,%ebx
 804e5c0:	8b 41 10             	mov    0x10(%ecx),%eax
 804e5c3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
 804e5ca:	89 44 24 08          	mov    %eax,0x8(%esp)
 804e5ce:	89 c8                	mov    %ecx,%eax
 804e5d0:	83 c0 0c             	add    $0xc,%eax
 804e5d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e5d7:	8d 43 0c             	lea    0xc(%ebx),%eax
 804e5da:	89 04 24             	mov    %eax,(%esp)
 804e5dd:	e8 36 16 00 00       	call   804fc18 <memcpy>
 804e5e2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804e5e9:	00 
 804e5ea:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e5ee:	89 34 24             	mov    %esi,(%esp)
 804e5f1:	e8 2a 1d 00 00       	call   8050320 <__lshift>
 804e5f6:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804e5f9:	e9 9d fc ff ff       	jmp    804e29b <_dtoa_r+0xdcb>
 804e5fe:	b8 36 00 00 00       	mov    $0x36,%eax
 804e603:	8b 55 b0             	mov    -0x50(%ebp),%edx
 804e606:	2b 45 e0             	sub    -0x20(%ebp),%eax
 804e609:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e60c:	e9 ed f7 ff ff       	jmp    804ddfe <_dtoa_r+0x92e>
 804e611:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
 804e615:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e618:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e61b:	74 28                	je     804e645 <_dtoa_r+0x1175>
 804e61d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
 804e621:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e624:	83 c0 01             	add    $0x1,%eax
 804e627:	89 cb                	mov    %ecx,%ebx
 804e629:	e9 1d ff ff ff       	jmp    804e54b <_dtoa_r+0x107b>
 804e62e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e631:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e634:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e637:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e63a:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e63d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e640:	e9 cc f8 ff ff       	jmp    804df11 <_dtoa_r+0xa41>
 804e645:	8b 45 98             	mov    -0x68(%ebp),%eax
 804e648:	b9 39 00 00 00       	mov    $0x39,%ecx
 804e64d:	8d 50 01             	lea    0x1(%eax),%edx
 804e650:	c6 00 39             	movb   $0x39,(%eax)
 804e653:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804e656:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804e659:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804e65c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804e65f:	e9 fa f8 ff ff       	jmp    804df5e <_dtoa_r+0xa8e>
 804e664:	8b 5d a0             	mov    -0x60(%ebp),%ebx
 804e667:	89 7d a4             	mov    %edi,-0x5c(%ebp)
 804e66a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
 804e66d:	83 fb 39             	cmp    $0x39,%ebx
 804e670:	74 d3                	je     804e645 <_dtoa_r+0x1175>
 804e672:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804e675:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804e678:	83 c0 31             	add    $0x31,%eax
 804e67b:	85 c9                	test   %ecx,%ecx
 804e67d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
 804e680:	0f 4e c3             	cmovle %ebx,%eax
 804e683:	89 cb                	mov    %ecx,%ebx
 804e685:	e9 c1 fe ff ff       	jmp    804e54b <_dtoa_r+0x107b>
 804e68a:	0f 85 b2 fe ff ff    	jne    804e542 <_dtoa_r+0x1072>
 804e690:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
 804e694:	0f 84 a8 fe ff ff    	je     804e542 <_dtoa_r+0x1072>
 804e69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e6a0:	e9 8a fe ff ff       	jmp    804e52f <_dtoa_r+0x105f>
 804e6a5:	0f 85 c7 f3 ff ff    	jne    804da72 <_dtoa_r+0x5a2>
 804e6ab:	dd d8                	fstp   %st(0)
 804e6ad:	dd d8                	fstp   %st(0)
 804e6af:	90                   	nop
 804e6b0:	e9 65 fd ff ff       	jmp    804e41a <_dtoa_r+0xf4a>
 804e6b5:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804e6b8:	e9 dd f5 ff ff       	jmp    804dc9a <_dtoa_r+0x7ca>
 804e6bd:	8d 76 00             	lea    0x0(%esi),%esi
 804e6c0:	0f 84 7a f5 ff ff    	je     804dc40 <_dtoa_r+0x770>
 804e6c6:	b8 3c 00 00 00       	mov    $0x3c,%eax
 804e6cb:	29 d0                	sub    %edx,%eax
 804e6cd:	e9 ab f8 ff ff       	jmp    804df7d <_dtoa_r+0xaad>
 804e6d2:	b8 01 00 00 00       	mov    $0x1,%eax
 804e6d7:	e9 d9 ef ff ff       	jmp    804d6b5 <_dtoa_r+0x1e5>
 804e6dc:	31 d2                	xor    %edx,%edx
 804e6de:	e9 36 f1 ff ff       	jmp    804d819 <_dtoa_r+0x349>
 804e6e3:	66 90                	xchg   %ax,%ax
 804e6e5:	66 90                	xchg   %ax,%ax
 804e6e7:	66 90                	xchg   %ax,%ax
 804e6e9:	66 90                	xchg   %ax,%ax
 804e6eb:	66 90                	xchg   %ax,%ax
 804e6ed:	66 90                	xchg   %ax,%ax
 804e6ef:	90                   	nop

0804e6f0 <__sflush_r>:
 804e6f0:	55                   	push   %ebp
 804e6f1:	89 e5                	mov    %esp,%ebp
 804e6f3:	57                   	push   %edi
 804e6f4:	56                   	push   %esi
 804e6f5:	53                   	push   %ebx
 804e6f6:	83 ec 1c             	sub    $0x1c,%esp
 804e6f9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804e6fc:	0f b7 47 0c          	movzwl 0xc(%edi),%eax
 804e700:	a8 08                	test   $0x8,%al
 804e702:	0f 85 c8 00 00 00    	jne    804e7d0 <__sflush_r+0xe0>
 804e708:	8b 77 04             	mov    0x4(%edi),%esi
 804e70b:	89 c1                	mov    %eax,%ecx
 804e70d:	80 cd 08             	or     $0x8,%ch
 804e710:	66 89 4f 0c          	mov    %cx,0xc(%edi)
 804e714:	85 f6                	test   %esi,%esi
 804e716:	0f 8e 0c 01 00 00    	jle    804e828 <__sflush_r+0x138>
 804e71c:	8b 57 28             	mov    0x28(%edi),%edx
 804e71f:	85 d2                	test   %edx,%edx
 804e721:	0f 84 98 00 00 00    	je     804e7bf <__sflush_r+0xcf>
 804e727:	8b 75 08             	mov    0x8(%ebp),%esi
 804e72a:	f6 c4 10             	test   $0x10,%ah
 804e72d:	8b 1e                	mov    (%esi),%ebx
 804e72f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 804e735:	0f 84 fd 00 00 00    	je     804e838 <__sflush_r+0x148>
 804e73b:	8b 47 50             	mov    0x50(%edi),%eax
 804e73e:	83 e1 04             	and    $0x4,%ecx
 804e741:	74 0d                	je     804e750 <__sflush_r+0x60>
 804e743:	8b 4f 30             	mov    0x30(%edi),%ecx
 804e746:	2b 47 04             	sub    0x4(%edi),%eax
 804e749:	85 c9                	test   %ecx,%ecx
 804e74b:	74 03                	je     804e750 <__sflush_r+0x60>
 804e74d:	2b 47 3c             	sub    0x3c(%edi),%eax
 804e750:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804e757:	00 
 804e758:	89 44 24 08          	mov    %eax,0x8(%esp)
 804e75c:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e75f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e763:	8b 45 08             	mov    0x8(%ebp),%eax
 804e766:	89 04 24             	mov    %eax,(%esp)
 804e769:	ff d2                	call   *%edx
 804e76b:	83 f8 ff             	cmp    $0xffffffff,%eax
 804e76e:	0f 84 f4 00 00 00    	je     804e868 <__sflush_r+0x178>
 804e774:	0f b7 57 0c          	movzwl 0xc(%edi),%edx
 804e778:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
 804e77f:	89 d1                	mov    %edx,%ecx
 804e781:	80 e5 f7             	and    $0xf7,%ch
 804e784:	80 e6 10             	and    $0x10,%dh
 804e787:	66 89 4f 0c          	mov    %cx,0xc(%edi)
 804e78b:	8b 4f 10             	mov    0x10(%edi),%ecx
 804e78e:	89 0f                	mov    %ecx,(%edi)
 804e790:	0f 85 25 01 00 00    	jne    804e8bb <__sflush_r+0x1cb>
 804e796:	8b 45 08             	mov    0x8(%ebp),%eax
 804e799:	89 18                	mov    %ebx,(%eax)
 804e79b:	8b 47 30             	mov    0x30(%edi),%eax
 804e79e:	85 c0                	test   %eax,%eax
 804e7a0:	74 1d                	je     804e7bf <__sflush_r+0xcf>
 804e7a2:	8d 57 40             	lea    0x40(%edi),%edx
 804e7a5:	39 d0                	cmp    %edx,%eax
 804e7a7:	74 0f                	je     804e7b8 <__sflush_r+0xc8>
 804e7a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 804e7b0:	89 04 24             	mov    %eax,(%esp)
 804e7b3:	e8 d8 06 00 00       	call   804ee90 <_free_r>
 804e7b8:	c7 47 30 00 00 00 00 	movl   $0x0,0x30(%edi)
 804e7bf:	31 c0                	xor    %eax,%eax
 804e7c1:	83 c4 1c             	add    $0x1c,%esp
 804e7c4:	5b                   	pop    %ebx
 804e7c5:	5e                   	pop    %esi
 804e7c6:	5f                   	pop    %edi
 804e7c7:	5d                   	pop    %ebp
 804e7c8:	c3                   	ret    
 804e7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e7d0:	8b 77 10             	mov    0x10(%edi),%esi
 804e7d3:	85 f6                	test   %esi,%esi
 804e7d5:	74 e8                	je     804e7bf <__sflush_r+0xcf>
 804e7d7:	8b 1f                	mov    (%edi),%ebx
 804e7d9:	31 c9                	xor    %ecx,%ecx
 804e7db:	89 37                	mov    %esi,(%edi)
 804e7dd:	29 f3                	sub    %esi,%ebx
 804e7df:	a8 03                	test   $0x3,%al
 804e7e1:	75 03                	jne    804e7e6 <__sflush_r+0xf6>
 804e7e3:	8b 4f 14             	mov    0x14(%edi),%ecx
 804e7e6:	85 db                	test   %ebx,%ebx
 804e7e8:	89 4f 08             	mov    %ecx,0x8(%edi)
 804e7eb:	7f 0b                	jg     804e7f8 <__sflush_r+0x108>
 804e7ed:	eb d0                	jmp    804e7bf <__sflush_r+0xcf>
 804e7ef:	90                   	nop
 804e7f0:	29 c3                	sub    %eax,%ebx
 804e7f2:	01 c6                	add    %eax,%esi
 804e7f4:	85 db                	test   %ebx,%ebx
 804e7f6:	7e c7                	jle    804e7bf <__sflush_r+0xcf>
 804e7f8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804e7fc:	89 74 24 08          	mov    %esi,0x8(%esp)
 804e800:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e803:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e807:	8b 45 08             	mov    0x8(%ebp),%eax
 804e80a:	89 04 24             	mov    %eax,(%esp)
 804e80d:	ff 57 24             	call   *0x24(%edi)
 804e810:	85 c0                	test   %eax,%eax
 804e812:	7f dc                	jg     804e7f0 <__sflush_r+0x100>
 804e814:	66 83 4f 0c 40       	orw    $0x40,0xc(%edi)
 804e819:	83 c4 1c             	add    $0x1c,%esp
 804e81c:	5b                   	pop    %ebx
 804e81d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804e822:	5e                   	pop    %esi
 804e823:	5f                   	pop    %edi
 804e824:	5d                   	pop    %ebp
 804e825:	c3                   	ret    
 804e826:	66 90                	xchg   %ax,%ax
 804e828:	8b 5f 3c             	mov    0x3c(%edi),%ebx
 804e82b:	85 db                	test   %ebx,%ebx
 804e82d:	0f 8f e9 fe ff ff    	jg     804e71c <__sflush_r+0x2c>
 804e833:	eb 8a                	jmp    804e7bf <__sflush_r+0xcf>
 804e835:	8d 76 00             	lea    0x0(%esi),%esi
 804e838:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804e83f:	00 
 804e840:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804e847:	00 
 804e848:	8b 47 1c             	mov    0x1c(%edi),%eax
 804e84b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e84f:	8b 45 08             	mov    0x8(%ebp),%eax
 804e852:	89 04 24             	mov    %eax,(%esp)
 804e855:	ff d2                	call   *%edx
 804e857:	83 f8 ff             	cmp    $0xffffffff,%eax
 804e85a:	74 3c                	je     804e898 <__sflush_r+0x1a8>
 804e85c:	0f b7 4f 0c          	movzwl 0xc(%edi),%ecx
 804e860:	8b 57 28             	mov    0x28(%edi),%edx
 804e863:	e9 d6 fe ff ff       	jmp    804e73e <__sflush_r+0x4e>
 804e868:	8b 55 08             	mov    0x8(%ebp),%edx
 804e86b:	8b 12                	mov    (%edx),%edx
 804e86d:	85 d2                	test   %edx,%edx
 804e86f:	0f 84 ff fe ff ff    	je     804e774 <__sflush_r+0x84>
 804e875:	83 fa 1d             	cmp    $0x1d,%edx
 804e878:	74 05                	je     804e87f <__sflush_r+0x18f>
 804e87a:	83 fa 16             	cmp    $0x16,%edx
 804e87d:	75 95                	jne    804e814 <__sflush_r+0x124>
 804e87f:	8b 47 10             	mov    0x10(%edi),%eax
 804e882:	66 81 67 0c ff f7    	andw   $0xf7ff,0xc(%edi)
 804e888:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
 804e88f:	89 07                	mov    %eax,(%edi)
 804e891:	e9 00 ff ff ff       	jmp    804e796 <__sflush_r+0xa6>
 804e896:	66 90                	xchg   %ax,%ax
 804e898:	8b 55 08             	mov    0x8(%ebp),%edx
 804e89b:	8b 12                	mov    (%edx),%edx
 804e89d:	85 d2                	test   %edx,%edx
 804e89f:	74 bb                	je     804e85c <__sflush_r+0x16c>
 804e8a1:	83 fa 16             	cmp    $0x16,%edx
 804e8a4:	74 09                	je     804e8af <__sflush_r+0x1bf>
 804e8a6:	83 fa 1d             	cmp    $0x1d,%edx
 804e8a9:	0f 85 65 ff ff ff    	jne    804e814 <__sflush_r+0x124>
 804e8af:	8b 45 08             	mov    0x8(%ebp),%eax
 804e8b2:	89 18                	mov    %ebx,(%eax)
 804e8b4:	31 c0                	xor    %eax,%eax
 804e8b6:	e9 06 ff ff ff       	jmp    804e7c1 <__sflush_r+0xd1>
 804e8bb:	89 47 50             	mov    %eax,0x50(%edi)
 804e8be:	e9 d3 fe ff ff       	jmp    804e796 <__sflush_r+0xa6>
 804e8c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e8d0 <_fflush_r>:
 804e8d0:	55                   	push   %ebp
 804e8d1:	89 e5                	mov    %esp,%ebp
 804e8d3:	56                   	push   %esi
 804e8d4:	53                   	push   %ebx
 804e8d5:	83 ec 10             	sub    $0x10,%esp
 804e8d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804e8db:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e8de:	85 db                	test   %ebx,%ebx
 804e8e0:	74 07                	je     804e8e9 <_fflush_r+0x19>
 804e8e2:	8b 43 38             	mov    0x38(%ebx),%eax
 804e8e5:	85 c0                	test   %eax,%eax
 804e8e7:	74 2f                	je     804e918 <_fflush_r+0x48>
 804e8e9:	66 83 7e 0c 00       	cmpw   $0x0,0xc(%esi)
 804e8ee:	75 10                	jne    804e900 <_fflush_r+0x30>
 804e8f0:	83 c4 10             	add    $0x10,%esp
 804e8f3:	31 c0                	xor    %eax,%eax
 804e8f5:	5b                   	pop    %ebx
 804e8f6:	5e                   	pop    %esi
 804e8f7:	5d                   	pop    %ebp
 804e8f8:	c3                   	ret    
 804e8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e900:	89 75 0c             	mov    %esi,0xc(%ebp)
 804e903:	89 5d 08             	mov    %ebx,0x8(%ebp)
 804e906:	83 c4 10             	add    $0x10,%esp
 804e909:	5b                   	pop    %ebx
 804e90a:	5e                   	pop    %esi
 804e90b:	5d                   	pop    %ebp
 804e90c:	e9 df fd ff ff       	jmp    804e6f0 <__sflush_r>
 804e911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e918:	89 1c 24             	mov    %ebx,(%esp)
 804e91b:	e8 20 01 00 00       	call   804ea40 <__sinit>
 804e920:	eb c7                	jmp    804e8e9 <_fflush_r+0x19>
 804e922:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804e929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e930 <fflush>:
 804e930:	55                   	push   %ebp
 804e931:	89 e5                	mov    %esp,%ebp
 804e933:	53                   	push   %ebx
 804e934:	83 ec 14             	sub    $0x14,%esp
 804e937:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804e93a:	85 db                	test   %ebx,%ebx
 804e93c:	74 1a                	je     804e958 <fflush+0x28>
 804e93e:	e8 9d 08 00 00       	call   804f1e0 <__getreent>
 804e943:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804e947:	89 04 24             	mov    %eax,(%esp)
 804e94a:	e8 81 ff ff ff       	call   804e8d0 <_fflush_r>
 804e94f:	83 c4 14             	add    $0x14,%esp
 804e952:	5b                   	pop    %ebx
 804e953:	5d                   	pop    %ebp
 804e954:	c3                   	ret    
 804e955:	8d 76 00             	lea    0x0(%esi),%esi
 804e958:	a1 70 49 05 08       	mov    0x8054970,%eax
 804e95d:	c7 44 24 04 d0 e8 04 	movl   $0x804e8d0,0x4(%esp)
 804e964:	08 
 804e965:	89 04 24             	mov    %eax,(%esp)
 804e968:	e8 f3 07 00 00       	call   804f160 <_fwalk_reent>
 804e96d:	83 c4 14             	add    $0x14,%esp
 804e970:	5b                   	pop    %ebx
 804e971:	5d                   	pop    %ebp
 804e972:	c3                   	ret    
 804e973:	66 90                	xchg   %ax,%ax
 804e975:	66 90                	xchg   %ax,%ax
 804e977:	66 90                	xchg   %ax,%ax
 804e979:	66 90                	xchg   %ax,%ax
 804e97b:	66 90                	xchg   %ax,%ax
 804e97d:	66 90                	xchg   %ax,%ax
 804e97f:	90                   	nop

0804e980 <__fp_lock>:
 804e980:	55                   	push   %ebp
 804e981:	31 c0                	xor    %eax,%eax
 804e983:	89 e5                	mov    %esp,%ebp
 804e985:	5d                   	pop    %ebp
 804e986:	c3                   	ret    
 804e987:	89 f6                	mov    %esi,%esi
 804e989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e990 <__fp_unlock>:
 804e990:	55                   	push   %ebp
 804e991:	31 c0                	xor    %eax,%eax
 804e993:	89 e5                	mov    %esp,%ebp
 804e995:	5d                   	pop    %ebp
 804e996:	c3                   	ret    
 804e997:	89 f6                	mov    %esi,%esi
 804e999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804e9a0 <_cleanup_r>:
 804e9a0:	55                   	push   %ebp
 804e9a1:	89 e5                	mov    %esp,%ebp
 804e9a3:	83 ec 18             	sub    $0x18,%esp
 804e9a6:	8b 45 08             	mov    0x8(%ebp),%eax
 804e9a9:	c7 44 24 04 d0 30 05 	movl   $0x80530d0,0x4(%esp)
 804e9b0:	08 
 804e9b1:	89 04 24             	mov    %eax,(%esp)
 804e9b4:	e8 37 07 00 00       	call   804f0f0 <_fwalk>
 804e9b9:	c9                   	leave  
 804e9ba:	c3                   	ret    
 804e9bb:	90                   	nop
 804e9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0804e9c0 <__sfmoreglue>:
 804e9c0:	55                   	push   %ebp
 804e9c1:	89 e5                	mov    %esp,%ebp
 804e9c3:	57                   	push   %edi
 804e9c4:	56                   	push   %esi
 804e9c5:	53                   	push   %ebx
 804e9c6:	83 ec 1c             	sub    $0x1c,%esp
 804e9c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e9cc:	8d 7e ff             	lea    -0x1(%esi),%edi
 804e9cf:	6b ff 68             	imul   $0x68,%edi,%edi
 804e9d2:	8d 47 74             	lea    0x74(%edi),%eax
 804e9d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 804e9d9:	8b 45 08             	mov    0x8(%ebp),%eax
 804e9dc:	89 04 24             	mov    %eax,(%esp)
 804e9df:	e8 5c 0a 00 00       	call   804f440 <_malloc_r>
 804e9e4:	85 c0                	test   %eax,%eax
 804e9e6:	89 c3                	mov    %eax,%ebx
 804e9e8:	74 26                	je     804ea10 <__sfmoreglue+0x50>
 804e9ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804e9f0:	83 c7 68             	add    $0x68,%edi
 804e9f3:	89 70 04             	mov    %esi,0x4(%eax)
 804e9f6:	8d 40 0c             	lea    0xc(%eax),%eax
 804e9f9:	89 43 08             	mov    %eax,0x8(%ebx)
 804e9fc:	89 7c 24 08          	mov    %edi,0x8(%esp)
 804ea00:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ea07:	00 
 804ea08:	89 04 24             	mov    %eax,(%esp)
 804ea0b:	e8 24 a5 ff ff       	call   8048f34 <memset>
 804ea10:	83 c4 1c             	add    $0x1c,%esp
 804ea13:	89 d8                	mov    %ebx,%eax
 804ea15:	5b                   	pop    %ebx
 804ea16:	5e                   	pop    %esi
 804ea17:	5f                   	pop    %edi
 804ea18:	5d                   	pop    %ebp
 804ea19:	c3                   	ret    
 804ea1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804ea20 <_cleanup>:
 804ea20:	55                   	push   %ebp
 804ea21:	89 e5                	mov    %esp,%ebp
 804ea23:	83 ec 18             	sub    $0x18,%esp
 804ea26:	a1 70 49 05 08       	mov    0x8054970,%eax
 804ea2b:	c7 44 24 04 d0 30 05 	movl   $0x80530d0,0x4(%esp)
 804ea32:	08 
 804ea33:	89 04 24             	mov    %eax,(%esp)
 804ea36:	e8 b5 06 00 00       	call   804f0f0 <_fwalk>
 804ea3b:	c9                   	leave  
 804ea3c:	c3                   	ret    
 804ea3d:	8d 76 00             	lea    0x0(%esi),%esi

0804ea40 <__sinit>:
 804ea40:	55                   	push   %ebp
 804ea41:	89 e5                	mov    %esp,%ebp
 804ea43:	56                   	push   %esi
 804ea44:	53                   	push   %ebx
 804ea45:	83 ec 10             	sub    $0x10,%esp
 804ea48:	8b 75 08             	mov    0x8(%ebp),%esi
 804ea4b:	8b 46 38             	mov    0x38(%esi),%eax
 804ea4e:	85 c0                	test   %eax,%eax
 804ea50:	0f 85 a8 01 00 00    	jne    804ebfe <__sinit+0x1be>
 804ea56:	8b 5e 04             	mov    0x4(%esi),%ebx
 804ea59:	8d 86 ec 02 00 00    	lea    0x2ec(%esi),%eax
 804ea5f:	31 d2                	xor    %edx,%edx
 804ea61:	89 86 e8 02 00 00    	mov    %eax,0x2e8(%esi)
 804ea67:	b8 04 00 00 00       	mov    $0x4,%eax
 804ea6c:	c7 46 3c a0 e9 04 08 	movl   $0x804e9a0,0x3c(%esi)
 804ea73:	c7 86 e0 02 00 00 00 	movl   $0x0,0x2e0(%esi)
 804ea7a:	00 00 00 
 804ea7d:	c7 86 e4 02 00 00 03 	movl   $0x3,0x2e4(%esi)
 804ea84:	00 00 00 
 804ea87:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804ea8b:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804ea8e:	66 89 53 0e          	mov    %dx,0xe(%ebx)
 804ea92:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804ea98:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804ea9f:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804eaa6:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804eaad:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804eab4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804eabb:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804eac2:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804eac9:	00 
 804eaca:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ead1:	00 
 804ead2:	89 04 24             	mov    %eax,(%esp)
 804ead5:	e8 5a a4 ff ff       	call   8048f34 <memset>
 804eada:	b8 01 00 00 00       	mov    $0x1,%eax
 804eadf:	b9 09 00 00 00       	mov    $0x9,%ecx
 804eae4:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804eae7:	c7 43 20 10 0b 05 08 	movl   $0x8050b10,0x20(%ebx)
 804eaee:	c7 43 24 70 0b 05 08 	movl   $0x8050b70,0x24(%ebx)
 804eaf5:	c7 43 28 e0 0b 05 08 	movl   $0x8050be0,0x28(%ebx)
 804eafc:	c7 43 2c 30 0c 05 08 	movl   $0x8050c30,0x2c(%ebx)
 804eb03:	8b 5e 08             	mov    0x8(%esi),%ebx
 804eb06:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804eb0a:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804eb0d:	66 89 4b 0c          	mov    %cx,0xc(%ebx)
 804eb11:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804eb17:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804eb1e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804eb25:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804eb2c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804eb33:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804eb3a:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804eb41:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804eb48:	00 
 804eb49:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804eb50:	00 
 804eb51:	89 04 24             	mov    %eax,(%esp)
 804eb54:	e8 db a3 ff ff       	call   8048f34 <memset>
 804eb59:	b8 12 00 00 00       	mov    $0x12,%eax
 804eb5e:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804eb61:	c7 43 20 10 0b 05 08 	movl   $0x8050b10,0x20(%ebx)
 804eb68:	c7 43 24 70 0b 05 08 	movl   $0x8050b70,0x24(%ebx)
 804eb6f:	c7 43 28 e0 0b 05 08 	movl   $0x8050be0,0x28(%ebx)
 804eb76:	c7 43 2c 30 0c 05 08 	movl   $0x8050c30,0x2c(%ebx)
 804eb7d:	8b 5e 0c             	mov    0xc(%esi),%ebx
 804eb80:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804eb84:	b8 02 00 00 00       	mov    $0x2,%eax
 804eb89:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804eb8d:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804eb90:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804eb96:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804eb9d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804eba4:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804ebab:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804ebb2:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804ebb9:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804ebc0:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804ebc7:	00 
 804ebc8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ebcf:	00 
 804ebd0:	89 04 24             	mov    %eax,(%esp)
 804ebd3:	e8 5c a3 ff ff       	call   8048f34 <memset>
 804ebd8:	89 5b 1c             	mov    %ebx,0x1c(%ebx)
 804ebdb:	c7 43 20 10 0b 05 08 	movl   $0x8050b10,0x20(%ebx)
 804ebe2:	c7 43 24 70 0b 05 08 	movl   $0x8050b70,0x24(%ebx)
 804ebe9:	c7 43 28 e0 0b 05 08 	movl   $0x8050be0,0x28(%ebx)
 804ebf0:	c7 43 2c 30 0c 05 08 	movl   $0x8050c30,0x2c(%ebx)
 804ebf7:	c7 46 38 01 00 00 00 	movl   $0x1,0x38(%esi)
 804ebfe:	83 c4 10             	add    $0x10,%esp
 804ec01:	5b                   	pop    %ebx
 804ec02:	5e                   	pop    %esi
 804ec03:	5d                   	pop    %ebp
 804ec04:	c3                   	ret    
 804ec05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ec09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ec10 <__sfp>:
 804ec10:	55                   	push   %ebp
 804ec11:	89 e5                	mov    %esp,%ebp
 804ec13:	56                   	push   %esi
 804ec14:	53                   	push   %ebx
 804ec15:	83 ec 10             	sub    $0x10,%esp
 804ec18:	8b 35 70 49 05 08    	mov    0x8054970,%esi
 804ec1e:	8b 4e 38             	mov    0x38(%esi),%ecx
 804ec21:	85 c9                	test   %ecx,%ecx
 804ec23:	0f 84 bf 00 00 00    	je     804ece8 <__sfp+0xd8>
 804ec29:	81 c6 e0 02 00 00    	add    $0x2e0,%esi
 804ec2f:	8b 46 04             	mov    0x4(%esi),%eax
 804ec32:	8b 5e 08             	mov    0x8(%esi),%ebx
 804ec35:	83 e8 01             	sub    $0x1,%eax
 804ec38:	79 15                	jns    804ec4f <__sfp+0x3f>
 804ec3a:	e9 99 00 00 00       	jmp    804ecd8 <__sfp+0xc8>
 804ec3f:	90                   	nop
 804ec40:	83 e8 01             	sub    $0x1,%eax
 804ec43:	83 c3 68             	add    $0x68,%ebx
 804ec46:	83 f8 ff             	cmp    $0xffffffff,%eax
 804ec49:	0f 84 89 00 00 00    	je     804ecd8 <__sfp+0xc8>
 804ec4f:	66 83 7b 0c 00       	cmpw   $0x0,0xc(%ebx)
 804ec54:	75 ea                	jne    804ec40 <__sfp+0x30>
 804ec56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804ec5b:	ba 01 00 00 00       	mov    $0x1,%edx
 804ec60:	66 89 43 0e          	mov    %ax,0xe(%ebx)
 804ec64:	8d 43 5c             	lea    0x5c(%ebx),%eax
 804ec67:	66 89 53 0c          	mov    %dx,0xc(%ebx)
 804ec6b:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
 804ec72:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 804ec78:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 804ec7f:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804ec86:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804ec8d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 804ec94:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804ec9b:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804eca2:	00 
 804eca3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ecaa:	00 
 804ecab:	89 04 24             	mov    %eax,(%esp)
 804ecae:	e8 81 a2 ff ff       	call   8048f34 <memset>
 804ecb3:	89 d8                	mov    %ebx,%eax
 804ecb5:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 804ecbc:	c7 43 34 00 00 00 00 	movl   $0x0,0x34(%ebx)
 804ecc3:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
 804ecca:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
 804ecd1:	83 c4 10             	add    $0x10,%esp
 804ecd4:	5b                   	pop    %ebx
 804ecd5:	5e                   	pop    %esi
 804ecd6:	5d                   	pop    %ebp
 804ecd7:	c3                   	ret    
 804ecd8:	8b 06                	mov    (%esi),%eax
 804ecda:	85 c0                	test   %eax,%eax
 804ecdc:	74 17                	je     804ecf5 <__sfp+0xe5>
 804ecde:	89 c6                	mov    %eax,%esi
 804ece0:	e9 4a ff ff ff       	jmp    804ec2f <__sfp+0x1f>
 804ece5:	8d 76 00             	lea    0x0(%esi),%esi
 804ece8:	89 34 24             	mov    %esi,(%esp)
 804eceb:	e8 50 fd ff ff       	call   804ea40 <__sinit>
 804ecf0:	e9 34 ff ff ff       	jmp    804ec29 <__sfp+0x19>
 804ecf5:	8b 45 08             	mov    0x8(%ebp),%eax
 804ecf8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 804ecff:	00 
 804ed00:	89 04 24             	mov    %eax,(%esp)
 804ed03:	e8 b8 fc ff ff       	call   804e9c0 <__sfmoreglue>
 804ed08:	85 c0                	test   %eax,%eax
 804ed0a:	89 06                	mov    %eax,(%esi)
 804ed0c:	75 d0                	jne    804ecde <__sfp+0xce>
 804ed0e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ed11:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804ed17:	31 c0                	xor    %eax,%eax
 804ed19:	eb b6                	jmp    804ecd1 <__sfp+0xc1>
 804ed1b:	90                   	nop
 804ed1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0804ed20 <__sfp_lock_acquire>:
 804ed20:	55                   	push   %ebp
 804ed21:	89 e5                	mov    %esp,%ebp
 804ed23:	5d                   	pop    %ebp
 804ed24:	c3                   	ret    
 804ed25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed30 <__sfp_lock_release>:
 804ed30:	55                   	push   %ebp
 804ed31:	89 e5                	mov    %esp,%ebp
 804ed33:	5d                   	pop    %ebp
 804ed34:	c3                   	ret    
 804ed35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed40 <__sinit_lock_acquire>:
 804ed40:	55                   	push   %ebp
 804ed41:	89 e5                	mov    %esp,%ebp
 804ed43:	5d                   	pop    %ebp
 804ed44:	c3                   	ret    
 804ed45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed50 <__sinit_lock_release>:
 804ed50:	55                   	push   %ebp
 804ed51:	89 e5                	mov    %esp,%ebp
 804ed53:	5d                   	pop    %ebp
 804ed54:	c3                   	ret    
 804ed55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ed59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ed60 <__fp_lock_all>:
 804ed60:	55                   	push   %ebp
 804ed61:	89 e5                	mov    %esp,%ebp
 804ed63:	83 ec 18             	sub    $0x18,%esp
 804ed66:	e8 75 04 00 00       	call   804f1e0 <__getreent>
 804ed6b:	c7 44 24 04 80 e9 04 	movl   $0x804e980,0x4(%esp)
 804ed72:	08 
 804ed73:	89 04 24             	mov    %eax,(%esp)
 804ed76:	e8 75 03 00 00       	call   804f0f0 <_fwalk>
 804ed7b:	c9                   	leave  
 804ed7c:	c3                   	ret    
 804ed7d:	8d 76 00             	lea    0x0(%esi),%esi

0804ed80 <__fp_unlock_all>:
 804ed80:	55                   	push   %ebp
 804ed81:	89 e5                	mov    %esp,%ebp
 804ed83:	83 ec 18             	sub    $0x18,%esp
 804ed86:	e8 55 04 00 00       	call   804f1e0 <__getreent>
 804ed8b:	c7 44 24 04 90 e9 04 	movl   $0x804e990,0x4(%esp)
 804ed92:	08 
 804ed93:	89 04 24             	mov    %eax,(%esp)
 804ed96:	e8 55 03 00 00       	call   804f0f0 <_fwalk>
 804ed9b:	c9                   	leave  
 804ed9c:	c3                   	ret    
 804ed9d:	66 90                	xchg   %ax,%ax
 804ed9f:	90                   	nop

0804eda0 <_malloc_trim_r>:
 804eda0:	55                   	push   %ebp
 804eda1:	89 e5                	mov    %esp,%ebp
 804eda3:	57                   	push   %edi
 804eda4:	56                   	push   %esi
 804eda5:	53                   	push   %ebx
 804eda6:	83 ec 1c             	sub    $0x1c,%esp
 804eda9:	8b 75 08             	mov    0x8(%ebp),%esi
 804edac:	89 34 24             	mov    %esi,(%esp)
 804edaf:	e8 ac 0e 00 00       	call   804fc60 <__malloc_lock>
 804edb4:	a1 48 80 05 08       	mov    0x8058048,%eax
 804edb9:	8b 58 04             	mov    0x4(%eax),%ebx
 804edbc:	83 e3 fc             	and    $0xfffffffc,%ebx
 804edbf:	89 d8                	mov    %ebx,%eax
 804edc1:	2b 45 0c             	sub    0xc(%ebp),%eax
 804edc4:	05 ef 0f 00 00       	add    $0xfef,%eax
 804edc9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 804edce:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
 804edd4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 804edda:	7e 1c                	jle    804edf8 <_malloc_trim_r+0x58>
 804eddc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ede3:	00 
 804ede4:	89 34 24             	mov    %esi,(%esp)
 804ede7:	e8 74 1c 00 00       	call   8050a60 <_sbrk_r>
 804edec:	8b 15 48 80 05 08    	mov    0x8058048,%edx
 804edf2:	01 da                	add    %ebx,%edx
 804edf4:	39 d0                	cmp    %edx,%eax
 804edf6:	74 18                	je     804ee10 <_malloc_trim_r+0x70>
 804edf8:	89 34 24             	mov    %esi,(%esp)
 804edfb:	e8 70 0e 00 00       	call   804fc70 <__malloc_unlock>
 804ee00:	83 c4 1c             	add    $0x1c,%esp
 804ee03:	31 c0                	xor    %eax,%eax
 804ee05:	5b                   	pop    %ebx
 804ee06:	5e                   	pop    %esi
 804ee07:	5f                   	pop    %edi
 804ee08:	5d                   	pop    %ebp
 804ee09:	c3                   	ret    
 804ee0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ee10:	89 f8                	mov    %edi,%eax
 804ee12:	f7 d8                	neg    %eax
 804ee14:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ee18:	89 34 24             	mov    %esi,(%esp)
 804ee1b:	e8 40 1c 00 00       	call   8050a60 <_sbrk_r>
 804ee20:	83 f8 ff             	cmp    $0xffffffff,%eax
 804ee23:	74 2b                	je     804ee50 <_malloc_trim_r+0xb0>
 804ee25:	a1 48 80 05 08       	mov    0x8058048,%eax
 804ee2a:	29 fb                	sub    %edi,%ebx
 804ee2c:	83 cb 01             	or     $0x1,%ebx
 804ee2f:	29 3d 20 dd 06 08    	sub    %edi,0x806dd20
 804ee35:	89 58 04             	mov    %ebx,0x4(%eax)
 804ee38:	89 34 24             	mov    %esi,(%esp)
 804ee3b:	e8 30 0e 00 00       	call   804fc70 <__malloc_unlock>
 804ee40:	83 c4 1c             	add    $0x1c,%esp
 804ee43:	b8 01 00 00 00       	mov    $0x1,%eax
 804ee48:	5b                   	pop    %ebx
 804ee49:	5e                   	pop    %esi
 804ee4a:	5f                   	pop    %edi
 804ee4b:	5d                   	pop    %ebp
 804ee4c:	c3                   	ret    
 804ee4d:	8d 76 00             	lea    0x0(%esi),%esi
 804ee50:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804ee57:	00 
 804ee58:	89 34 24             	mov    %esi,(%esp)
 804ee5b:	e8 00 1c 00 00       	call   8050a60 <_sbrk_r>
 804ee60:	8b 15 48 80 05 08    	mov    0x8058048,%edx
 804ee66:	89 c1                	mov    %eax,%ecx
 804ee68:	29 d1                	sub    %edx,%ecx
 804ee6a:	83 f9 0f             	cmp    $0xf,%ecx
 804ee6d:	7e 89                	jle    804edf8 <_malloc_trim_r+0x58>
 804ee6f:	2b 05 20 80 05 08    	sub    0x8058020,%eax
 804ee75:	83 c9 01             	or     $0x1,%ecx
 804ee78:	89 4a 04             	mov    %ecx,0x4(%edx)
 804ee7b:	a3 20 dd 06 08       	mov    %eax,0x806dd20
 804ee80:	e9 73 ff ff ff       	jmp    804edf8 <_malloc_trim_r+0x58>
 804ee85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ee89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ee90 <_free_r>:
 804ee90:	55                   	push   %ebp
 804ee91:	89 e5                	mov    %esp,%ebp
 804ee93:	57                   	push   %edi
 804ee94:	56                   	push   %esi
 804ee95:	53                   	push   %ebx
 804ee96:	83 ec 1c             	sub    $0x1c,%esp
 804ee99:	8b 75 0c             	mov    0xc(%ebp),%esi
 804ee9c:	8b 45 08             	mov    0x8(%ebp),%eax
 804ee9f:	85 f6                	test   %esi,%esi
 804eea1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804eea4:	0f 84 fe 00 00 00    	je     804efa8 <_free_r+0x118>
 804eeaa:	89 04 24             	mov    %eax,(%esp)
 804eead:	e8 ae 0d 00 00       	call   804fc60 <__malloc_lock>
 804eeb2:	8b 7e fc             	mov    -0x4(%esi),%edi
 804eeb5:	8d 56 f8             	lea    -0x8(%esi),%edx
 804eeb8:	89 f8                	mov    %edi,%eax
 804eeba:	83 e0 fe             	and    $0xfffffffe,%eax
 804eebd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804eec0:	8b 59 04             	mov    0x4(%ecx),%ebx
 804eec3:	83 e3 fc             	and    $0xfffffffc,%ebx
 804eec6:	39 0d 48 80 05 08    	cmp    %ecx,0x8058048
 804eecc:	0f 84 0e 01 00 00    	je     804efe0 <_free_r+0x150>
 804eed2:	83 e7 01             	and    $0x1,%edi
 804eed5:	89 59 04             	mov    %ebx,0x4(%ecx)
 804eed8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 804eedf:	75 1f                	jne    804ef00 <_free_r+0x70>
 804eee1:	8b 76 f8             	mov    -0x8(%esi),%esi
 804eee4:	29 f2                	sub    %esi,%edx
 804eee6:	01 f0                	add    %esi,%eax
 804eee8:	8b 72 08             	mov    0x8(%edx),%esi
 804eeeb:	81 fe 48 80 05 08    	cmp    $0x8058048,%esi
 804eef1:	0f 84 39 01 00 00    	je     804f030 <_free_r+0x1a0>
 804eef7:	8b 7a 0c             	mov    0xc(%edx),%edi
 804eefa:	89 7e 0c             	mov    %edi,0xc(%esi)
 804eefd:	89 77 08             	mov    %esi,0x8(%edi)
 804ef00:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
 804ef05:	75 21                	jne    804ef28 <_free_r+0x98>
 804ef07:	8b 75 e0             	mov    -0x20(%ebp),%esi
 804ef0a:	01 d8                	add    %ebx,%eax
 804ef0c:	8b 59 08             	mov    0x8(%ecx),%ebx
 804ef0f:	85 f6                	test   %esi,%esi
 804ef11:	75 0c                	jne    804ef1f <_free_r+0x8f>
 804ef13:	81 fb 48 80 05 08    	cmp    $0x8058048,%ebx
 804ef19:	0f 84 21 01 00 00    	je     804f040 <_free_r+0x1b0>
 804ef1f:	8b 49 0c             	mov    0xc(%ecx),%ecx
 804ef22:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804ef25:	89 59 08             	mov    %ebx,0x8(%ecx)
 804ef28:	89 c1                	mov    %eax,%ecx
 804ef2a:	83 c9 01             	or     $0x1,%ecx
 804ef2d:	89 4a 04             	mov    %ecx,0x4(%edx)
 804ef30:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 804ef33:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804ef36:	85 c9                	test   %ecx,%ecx
 804ef38:	75 56                	jne    804ef90 <_free_r+0x100>
 804ef3a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
 804ef3f:	76 6f                	jbe    804efb0 <_free_r+0x120>
 804ef41:	89 c1                	mov    %eax,%ecx
 804ef43:	c1 e9 09             	shr    $0x9,%ecx
 804ef46:	83 f9 04             	cmp    $0x4,%ecx
 804ef49:	0f 87 21 01 00 00    	ja     804f070 <_free_r+0x1e0>
 804ef4f:	89 c1                	mov    %eax,%ecx
 804ef51:	c1 e9 06             	shr    $0x6,%ecx
 804ef54:	83 c1 38             	add    $0x38,%ecx
 804ef57:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804ef5a:	8d 34 9d 40 80 05 08 	lea    0x8058040(,%ebx,4),%esi
 804ef61:	8b 5e 08             	mov    0x8(%esi),%ebx
 804ef64:	39 f3                	cmp    %esi,%ebx
 804ef66:	0f 84 14 01 00 00    	je     804f080 <_free_r+0x1f0>
 804ef6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ef70:	8b 4b 04             	mov    0x4(%ebx),%ecx
 804ef73:	83 e1 fc             	and    $0xfffffffc,%ecx
 804ef76:	39 c8                	cmp    %ecx,%eax
 804ef78:	73 07                	jae    804ef81 <_free_r+0xf1>
 804ef7a:	8b 5b 08             	mov    0x8(%ebx),%ebx
 804ef7d:	39 de                	cmp    %ebx,%esi
 804ef7f:	75 ef                	jne    804ef70 <_free_r+0xe0>
 804ef81:	8b 43 0c             	mov    0xc(%ebx),%eax
 804ef84:	89 42 0c             	mov    %eax,0xc(%edx)
 804ef87:	89 5a 08             	mov    %ebx,0x8(%edx)
 804ef8a:	89 50 08             	mov    %edx,0x8(%eax)
 804ef8d:	89 53 0c             	mov    %edx,0xc(%ebx)
 804ef90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804ef93:	89 45 08             	mov    %eax,0x8(%ebp)
 804ef96:	83 c4 1c             	add    $0x1c,%esp
 804ef99:	5b                   	pop    %ebx
 804ef9a:	5e                   	pop    %esi
 804ef9b:	5f                   	pop    %edi
 804ef9c:	5d                   	pop    %ebp
 804ef9d:	e9 ce 0c 00 00       	jmp    804fc70 <__malloc_unlock>
 804efa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804efa8:	83 c4 1c             	add    $0x1c,%esp
 804efab:	5b                   	pop    %ebx
 804efac:	5e                   	pop    %esi
 804efad:	5f                   	pop    %edi
 804efae:	5d                   	pop    %ebp
 804efaf:	c3                   	ret    
 804efb0:	c1 e8 03             	shr    $0x3,%eax
 804efb3:	bb 01 00 00 00       	mov    $0x1,%ebx
 804efb8:	89 c1                	mov    %eax,%ecx
 804efba:	c1 f9 02             	sar    $0x2,%ecx
 804efbd:	8d 04 c5 40 80 05 08 	lea    0x8058040(,%eax,8),%eax
 804efc4:	d3 e3                	shl    %cl,%ebx
 804efc6:	8b 48 08             	mov    0x8(%eax),%ecx
 804efc9:	09 1d 44 80 05 08    	or     %ebx,0x8058044
 804efcf:	89 42 0c             	mov    %eax,0xc(%edx)
 804efd2:	89 4a 08             	mov    %ecx,0x8(%edx)
 804efd5:	89 50 08             	mov    %edx,0x8(%eax)
 804efd8:	89 51 0c             	mov    %edx,0xc(%ecx)
 804efdb:	eb b3                	jmp    804ef90 <_free_r+0x100>
 804efdd:	8d 76 00             	lea    0x0(%esi),%esi
 804efe0:	01 d8                	add    %ebx,%eax
 804efe2:	83 e7 01             	and    $0x1,%edi
 804efe5:	75 13                	jne    804effa <_free_r+0x16a>
 804efe7:	8b 4e f8             	mov    -0x8(%esi),%ecx
 804efea:	29 ca                	sub    %ecx,%edx
 804efec:	01 c8                	add    %ecx,%eax
 804efee:	8b 5a 08             	mov    0x8(%edx),%ebx
 804eff1:	8b 4a 0c             	mov    0xc(%edx),%ecx
 804eff4:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804eff7:	89 59 08             	mov    %ebx,0x8(%ecx)
 804effa:	89 c1                	mov    %eax,%ecx
 804effc:	83 c9 01             	or     $0x1,%ecx
 804efff:	3b 05 24 80 05 08    	cmp    0x8058024,%eax
 804f005:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f008:	89 15 48 80 05 08    	mov    %edx,0x8058048
 804f00e:	72 80                	jb     804ef90 <_free_r+0x100>
 804f010:	a1 50 dd 06 08       	mov    0x806dd50,%eax
 804f015:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f019:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f01c:	89 04 24             	mov    %eax,(%esp)
 804f01f:	e8 7c fd ff ff       	call   804eda0 <_malloc_trim_r>
 804f024:	e9 67 ff ff ff       	jmp    804ef90 <_free_r+0x100>
 804f029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f030:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
 804f037:	e9 c4 fe ff ff       	jmp    804ef00 <_free_r+0x70>
 804f03c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f040:	89 c1                	mov    %eax,%ecx
 804f042:	83 c9 01             	or     $0x1,%ecx
 804f045:	89 15 54 80 05 08    	mov    %edx,0x8058054
 804f04b:	89 15 50 80 05 08    	mov    %edx,0x8058050
 804f051:	c7 42 0c 48 80 05 08 	movl   $0x8058048,0xc(%edx)
 804f058:	c7 42 08 48 80 05 08 	movl   $0x8058048,0x8(%edx)
 804f05f:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f062:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804f065:	e9 26 ff ff ff       	jmp    804ef90 <_free_r+0x100>
 804f06a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f070:	83 f9 14             	cmp    $0x14,%ecx
 804f073:	77 23                	ja     804f098 <_free_r+0x208>
 804f075:	83 c1 5b             	add    $0x5b,%ecx
 804f078:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f07b:	e9 da fe ff ff       	jmp    804ef5a <_free_r+0xca>
 804f080:	c1 f9 02             	sar    $0x2,%ecx
 804f083:	b8 01 00 00 00       	mov    $0x1,%eax
 804f088:	d3 e0                	shl    %cl,%eax
 804f08a:	09 05 44 80 05 08    	or     %eax,0x8058044
 804f090:	89 d8                	mov    %ebx,%eax
 804f092:	e9 ed fe ff ff       	jmp    804ef84 <_free_r+0xf4>
 804f097:	90                   	nop
 804f098:	83 f9 54             	cmp    $0x54,%ecx
 804f09b:	77 10                	ja     804f0ad <_free_r+0x21d>
 804f09d:	89 c1                	mov    %eax,%ecx
 804f09f:	c1 e9 0c             	shr    $0xc,%ecx
 804f0a2:	83 c1 6e             	add    $0x6e,%ecx
 804f0a5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0a8:	e9 ad fe ff ff       	jmp    804ef5a <_free_r+0xca>
 804f0ad:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
 804f0b3:	77 10                	ja     804f0c5 <_free_r+0x235>
 804f0b5:	89 c1                	mov    %eax,%ecx
 804f0b7:	c1 e9 0f             	shr    $0xf,%ecx
 804f0ba:	83 c1 77             	add    $0x77,%ecx
 804f0bd:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0c0:	e9 95 fe ff ff       	jmp    804ef5a <_free_r+0xca>
 804f0c5:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
 804f0cb:	77 10                	ja     804f0dd <_free_r+0x24d>
 804f0cd:	89 c1                	mov    %eax,%ecx
 804f0cf:	c1 e9 12             	shr    $0x12,%ecx
 804f0d2:	83 c1 7c             	add    $0x7c,%ecx
 804f0d5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
 804f0d8:	e9 7d fe ff ff       	jmp    804ef5a <_free_r+0xca>
 804f0dd:	bb fc 00 00 00       	mov    $0xfc,%ebx
 804f0e2:	b9 7e 00 00 00       	mov    $0x7e,%ecx
 804f0e7:	e9 6e fe ff ff       	jmp    804ef5a <_free_r+0xca>
 804f0ec:	66 90                	xchg   %ax,%ax
 804f0ee:	66 90                	xchg   %ax,%ax

0804f0f0 <_fwalk>:
 804f0f0:	55                   	push   %ebp
 804f0f1:	89 e5                	mov    %esp,%ebp
 804f0f3:	57                   	push   %edi
 804f0f4:	56                   	push   %esi
 804f0f5:	53                   	push   %ebx
 804f0f6:	83 ec 1c             	sub    $0x1c,%esp
 804f0f9:	8b 75 08             	mov    0x8(%ebp),%esi
 804f0fc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804f103:	81 c6 e0 02 00 00    	add    $0x2e0,%esi
 804f109:	74 3d                	je     804f148 <_fwalk+0x58>
 804f10b:	90                   	nop
 804f10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f110:	8b 7e 04             	mov    0x4(%esi),%edi
 804f113:	8b 5e 08             	mov    0x8(%esi),%ebx
 804f116:	83 ef 01             	sub    $0x1,%edi
 804f119:	78 27                	js     804f142 <_fwalk+0x52>
 804f11b:	90                   	nop
 804f11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f120:	66 83 7b 0c 01       	cmpw   $0x1,0xc(%ebx)
 804f125:	76 10                	jbe    804f137 <_fwalk+0x47>
 804f127:	66 83 7b 0e ff       	cmpw   $0xffff,0xe(%ebx)
 804f12c:	74 09                	je     804f137 <_fwalk+0x47>
 804f12e:	89 1c 24             	mov    %ebx,(%esp)
 804f131:	ff 55 0c             	call   *0xc(%ebp)
 804f134:	09 45 e4             	or     %eax,-0x1c(%ebp)
 804f137:	83 ef 01             	sub    $0x1,%edi
 804f13a:	83 c3 68             	add    $0x68,%ebx
 804f13d:	83 ff ff             	cmp    $0xffffffff,%edi
 804f140:	75 de                	jne    804f120 <_fwalk+0x30>
 804f142:	8b 36                	mov    (%esi),%esi
 804f144:	85 f6                	test   %esi,%esi
 804f146:	75 c8                	jne    804f110 <_fwalk+0x20>
 804f148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f14b:	83 c4 1c             	add    $0x1c,%esp
 804f14e:	5b                   	pop    %ebx
 804f14f:	5e                   	pop    %esi
 804f150:	5f                   	pop    %edi
 804f151:	5d                   	pop    %ebp
 804f152:	c3                   	ret    
 804f153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f160 <_fwalk_reent>:
 804f160:	55                   	push   %ebp
 804f161:	89 e5                	mov    %esp,%ebp
 804f163:	57                   	push   %edi
 804f164:	56                   	push   %esi
 804f165:	53                   	push   %ebx
 804f166:	83 ec 1c             	sub    $0x1c,%esp
 804f169:	8b 7d 08             	mov    0x8(%ebp),%edi
 804f16c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804f173:	81 c7 e0 02 00 00    	add    $0x2e0,%edi
 804f179:	74 4c                	je     804f1c7 <_fwalk_reent+0x67>
 804f17b:	90                   	nop
 804f17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f180:	8b 77 04             	mov    0x4(%edi),%esi
 804f183:	8b 5f 08             	mov    0x8(%edi),%ebx
 804f186:	83 ee 01             	sub    $0x1,%esi
 804f189:	78 36                	js     804f1c1 <_fwalk_reent+0x61>
 804f18b:	89 d8                	mov    %ebx,%eax
 804f18d:	89 f3                	mov    %esi,%ebx
 804f18f:	89 c6                	mov    %eax,%esi
 804f191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f198:	66 83 7e 0c 01       	cmpw   $0x1,0xc(%esi)
 804f19d:	76 17                	jbe    804f1b6 <_fwalk_reent+0x56>
 804f19f:	66 83 7e 0e ff       	cmpw   $0xffff,0xe(%esi)
 804f1a4:	74 10                	je     804f1b6 <_fwalk_reent+0x56>
 804f1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 804f1a9:	89 74 24 04          	mov    %esi,0x4(%esp)
 804f1ad:	89 04 24             	mov    %eax,(%esp)
 804f1b0:	ff 55 0c             	call   *0xc(%ebp)
 804f1b3:	09 45 e4             	or     %eax,-0x1c(%ebp)
 804f1b6:	83 eb 01             	sub    $0x1,%ebx
 804f1b9:	83 c6 68             	add    $0x68,%esi
 804f1bc:	83 fb ff             	cmp    $0xffffffff,%ebx
 804f1bf:	75 d7                	jne    804f198 <_fwalk_reent+0x38>
 804f1c1:	8b 3f                	mov    (%edi),%edi
 804f1c3:	85 ff                	test   %edi,%edi
 804f1c5:	75 b9                	jne    804f180 <_fwalk_reent+0x20>
 804f1c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f1ca:	83 c4 1c             	add    $0x1c,%esp
 804f1cd:	5b                   	pop    %ebx
 804f1ce:	5e                   	pop    %esi
 804f1cf:	5f                   	pop    %edi
 804f1d0:	5d                   	pop    %ebp
 804f1d1:	c3                   	ret    
 804f1d2:	66 90                	xchg   %ax,%ax
 804f1d4:	66 90                	xchg   %ax,%ax
 804f1d6:	66 90                	xchg   %ax,%ax
 804f1d8:	66 90                	xchg   %ax,%ax
 804f1da:	66 90                	xchg   %ax,%ax
 804f1dc:	66 90                	xchg   %ax,%ax
 804f1de:	66 90                	xchg   %ax,%ax

0804f1e0 <__getreent>:
 804f1e0:	55                   	push   %ebp
 804f1e1:	a1 40 7b 05 08       	mov    0x8057b40,%eax
 804f1e6:	89 e5                	mov    %esp,%ebp
 804f1e8:	5d                   	pop    %ebp
 804f1e9:	c3                   	ret    
 804f1ea:	66 90                	xchg   %ax,%ax
 804f1ec:	66 90                	xchg   %ax,%ax
 804f1ee:	66 90                	xchg   %ax,%ax

0804f1f0 <_setlocale_r>:
 804f1f0:	55                   	push   %ebp
 804f1f1:	89 e5                	mov    %esp,%ebp
 804f1f3:	53                   	push   %ebx
 804f1f4:	83 ec 14             	sub    $0x14,%esp
 804f1f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804f1fa:	85 db                	test   %ebx,%ebx
 804f1fc:	74 14                	je     804f212 <_setlocale_r+0x22>
 804f1fe:	c7 44 24 04 76 49 05 	movl   $0x8054976,0x4(%esp)
 804f205:	08 
 804f206:	89 1c 24             	mov    %ebx,(%esp)
 804f209:	e8 42 1a 00 00       	call   8050c50 <strcmp>
 804f20e:	85 c0                	test   %eax,%eax
 804f210:	75 0e                	jne    804f220 <_setlocale_r+0x30>
 804f212:	83 c4 14             	add    $0x14,%esp
 804f215:	b8 74 49 05 08       	mov    $0x8054974,%eax
 804f21a:	5b                   	pop    %ebx
 804f21b:	5d                   	pop    %ebp
 804f21c:	c3                   	ret    
 804f21d:	8d 76 00             	lea    0x0(%esi),%esi
 804f220:	c7 44 24 04 74 49 05 	movl   $0x8054974,0x4(%esp)
 804f227:	08 
 804f228:	89 1c 24             	mov    %ebx,(%esp)
 804f22b:	e8 20 1a 00 00       	call   8050c50 <strcmp>
 804f230:	85 c0                	test   %eax,%eax
 804f232:	74 de                	je     804f212 <_setlocale_r+0x22>
 804f234:	89 1c 24             	mov    %ebx,(%esp)
 804f237:	c7 44 24 04 d7 42 05 	movl   $0x80542d7,0x4(%esp)
 804f23e:	08 
 804f23f:	e8 0c 1a 00 00       	call   8050c50 <strcmp>
 804f244:	89 c2                	mov    %eax,%edx
 804f246:	31 c0                	xor    %eax,%eax
 804f248:	85 d2                	test   %edx,%edx
 804f24a:	ba 74 49 05 08       	mov    $0x8054974,%edx
 804f24f:	0f 44 c2             	cmove  %edx,%eax
 804f252:	83 c4 14             	add    $0x14,%esp
 804f255:	5b                   	pop    %ebx
 804f256:	5d                   	pop    %ebp
 804f257:	c3                   	ret    
 804f258:	90                   	nop
 804f259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804f260 <__locale_charset>:
 804f260:	55                   	push   %ebp
 804f261:	b8 c0 7f 05 08       	mov    $0x8057fc0,%eax
 804f266:	89 e5                	mov    %esp,%ebp
 804f268:	5d                   	pop    %ebp
 804f269:	c3                   	ret    
 804f26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f270 <__locale_mb_cur_max>:
 804f270:	55                   	push   %ebp
 804f271:	a1 18 80 05 08       	mov    0x8058018,%eax
 804f276:	89 e5                	mov    %esp,%ebp
 804f278:	5d                   	pop    %ebp
 804f279:	c3                   	ret    
 804f27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f280 <__locale_msgcharset>:
 804f280:	55                   	push   %ebp
 804f281:	b8 a0 7f 05 08       	mov    $0x8057fa0,%eax
 804f286:	89 e5                	mov    %esp,%ebp
 804f288:	5d                   	pop    %ebp
 804f289:	c3                   	ret    
 804f28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f290 <__locale_cjk_lang>:
 804f290:	55                   	push   %ebp
 804f291:	31 c0                	xor    %eax,%eax
 804f293:	89 e5                	mov    %esp,%ebp
 804f295:	5d                   	pop    %ebp
 804f296:	c3                   	ret    
 804f297:	89 f6                	mov    %esi,%esi
 804f299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f2a0 <_localeconv_r>:
 804f2a0:	55                   	push   %ebp
 804f2a1:	b8 e0 7f 05 08       	mov    $0x8057fe0,%eax
 804f2a6:	89 e5                	mov    %esp,%ebp
 804f2a8:	5d                   	pop    %ebp
 804f2a9:	c3                   	ret    
 804f2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0804f2b0 <setlocale>:
 804f2b0:	55                   	push   %ebp
 804f2b1:	89 e5                	mov    %esp,%ebp
 804f2b3:	83 ec 18             	sub    $0x18,%esp
 804f2b6:	e8 25 ff ff ff       	call   804f1e0 <__getreent>
 804f2bb:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f2be:	89 54 24 08          	mov    %edx,0x8(%esp)
 804f2c2:	8b 55 08             	mov    0x8(%ebp),%edx
 804f2c5:	89 04 24             	mov    %eax,(%esp)
 804f2c8:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f2cc:	e8 1f ff ff ff       	call   804f1f0 <_setlocale_r>
 804f2d1:	c9                   	leave  
 804f2d2:	c3                   	ret    
 804f2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804f2e0 <localeconv>:
 804f2e0:	55                   	push   %ebp
 804f2e1:	89 e5                	mov    %esp,%ebp
 804f2e3:	83 ec 08             	sub    $0x8,%esp
 804f2e6:	e8 f5 fe ff ff       	call   804f1e0 <__getreent>
 804f2eb:	b8 e0 7f 05 08       	mov    $0x8057fe0,%eax
 804f2f0:	c9                   	leave  
 804f2f1:	c3                   	ret    
 804f2f2:	66 90                	xchg   %ax,%ax
 804f2f4:	66 90                	xchg   %ax,%ax
 804f2f6:	66 90                	xchg   %ax,%ax
 804f2f8:	66 90                	xchg   %ax,%ax
 804f2fa:	66 90                	xchg   %ax,%ax
 804f2fc:	66 90                	xchg   %ax,%ax
 804f2fe:	66 90                	xchg   %ax,%ax

0804f300 <__smakebuf_r>:
 804f300:	55                   	push   %ebp
 804f301:	89 e5                	mov    %esp,%ebp
 804f303:	57                   	push   %edi
 804f304:	56                   	push   %esi
 804f305:	53                   	push   %ebx
 804f306:	83 ec 5c             	sub    $0x5c,%esp
 804f309:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804f30c:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f310:	a8 02                	test   $0x2,%al
 804f312:	0f 85 c0 00 00 00    	jne    804f3d8 <__smakebuf_r+0xd8>
 804f318:	0f bf 53 0e          	movswl 0xe(%ebx),%edx
 804f31c:	66 85 d2             	test   %dx,%dx
 804f31f:	78 4b                	js     804f36c <__smakebuf_r+0x6c>
 804f321:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804f324:	89 44 24 08          	mov    %eax,0x8(%esp)
 804f328:	8b 45 08             	mov    0x8(%ebp),%eax
 804f32b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f32f:	89 04 24             	mov    %eax,(%esp)
 804f332:	e8 39 3f 00 00       	call   8053270 <_fstat_r>
 804f337:	85 c0                	test   %eax,%eax
 804f339:	78 2d                	js     804f368 <__smakebuf_r+0x68>
 804f33b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804f33e:	31 c9                	xor    %ecx,%ecx
 804f340:	25 00 f0 00 00       	and    $0xf000,%eax
 804f345:	3d 00 20 00 00       	cmp    $0x2000,%eax
 804f34a:	0f 94 c1             	sete   %cl
 804f34d:	3d 00 80 00 00       	cmp    $0x8000,%eax
 804f352:	89 cf                	mov    %ecx,%edi
 804f354:	0f 84 96 00 00 00    	je     804f3f0 <__smakebuf_r+0xf0>
 804f35a:	66 81 4b 0c 00 08    	orw    $0x800,0xc(%ebx)
 804f360:	be 00 04 00 00       	mov    $0x400,%esi
 804f365:	eb 24                	jmp    804f38b <__smakebuf_r+0x8b>
 804f367:	90                   	nop
 804f368:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f36c:	89 c2                	mov    %eax,%edx
 804f36e:	66 81 e2 80 00       	and    $0x80,%dx
 804f373:	66 83 fa 01          	cmp    $0x1,%dx
 804f377:	19 f6                	sbb    %esi,%esi
 804f379:	80 cc 08             	or     $0x8,%ah
 804f37c:	81 e6 c0 03 00 00    	and    $0x3c0,%esi
 804f382:	31 ff                	xor    %edi,%edi
 804f384:	83 c6 40             	add    $0x40,%esi
 804f387:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804f38b:	8b 45 08             	mov    0x8(%ebp),%eax
 804f38e:	89 74 24 04          	mov    %esi,0x4(%esp)
 804f392:	89 04 24             	mov    %eax,(%esp)
 804f395:	e8 a6 00 00 00       	call   804f440 <_malloc_r>
 804f39a:	85 c0                	test   %eax,%eax
 804f39c:	74 2a                	je     804f3c8 <__smakebuf_r+0xc8>
 804f39e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f3a1:	c7 41 3c a0 e9 04 08 	movl   $0x804e9a0,0x3c(%ecx)
 804f3a8:	66 81 4b 0c 80 00    	orw    $0x80,0xc(%ebx)
 804f3ae:	85 ff                	test   %edi,%edi
 804f3b0:	89 03                	mov    %eax,(%ebx)
 804f3b2:	89 43 10             	mov    %eax,0x10(%ebx)
 804f3b5:	89 73 14             	mov    %esi,0x14(%ebx)
 804f3b8:	75 5e                	jne    804f418 <__smakebuf_r+0x118>
 804f3ba:	83 c4 5c             	add    $0x5c,%esp
 804f3bd:	5b                   	pop    %ebx
 804f3be:	5e                   	pop    %esi
 804f3bf:	5f                   	pop    %edi
 804f3c0:	5d                   	pop    %ebp
 804f3c1:	c3                   	ret    
 804f3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f3c8:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 804f3cc:	f6 c4 02             	test   $0x2,%ah
 804f3cf:	75 e9                	jne    804f3ba <__smakebuf_r+0xba>
 804f3d1:	83 c8 02             	or     $0x2,%eax
 804f3d4:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 804f3d8:	8d 43 43             	lea    0x43(%ebx),%eax
 804f3db:	89 03                	mov    %eax,(%ebx)
 804f3dd:	89 43 10             	mov    %eax,0x10(%ebx)
 804f3e0:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
 804f3e7:	83 c4 5c             	add    $0x5c,%esp
 804f3ea:	5b                   	pop    %ebx
 804f3eb:	5e                   	pop    %esi
 804f3ec:	5f                   	pop    %edi
 804f3ed:	5d                   	pop    %ebp
 804f3ee:	c3                   	ret    
 804f3ef:	90                   	nop
 804f3f0:	81 7b 28 e0 0b 05 08 	cmpl   $0x8050be0,0x28(%ebx)
 804f3f7:	0f 85 5d ff ff ff    	jne    804f35a <__smakebuf_r+0x5a>
 804f3fd:	66 81 4b 0c 00 04    	orw    $0x400,0xc(%ebx)
 804f403:	be 00 04 00 00       	mov    $0x400,%esi
 804f408:	c7 43 4c 00 04 00 00 	movl   $0x400,0x4c(%ebx)
 804f40f:	e9 77 ff ff ff       	jmp    804f38b <__smakebuf_r+0x8b>
 804f414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f418:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 804f41c:	89 0c 24             	mov    %ecx,(%esp)
 804f41f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f423:	e8 68 43 00 00       	call   8053790 <_isatty_r>
 804f428:	85 c0                	test   %eax,%eax
 804f42a:	74 8e                	je     804f3ba <__smakebuf_r+0xba>
 804f42c:	66 83 4b 0c 01       	orw    $0x1,0xc(%ebx)
 804f431:	eb 87                	jmp    804f3ba <__smakebuf_r+0xba>
 804f433:	66 90                	xchg   %ax,%ax
 804f435:	66 90                	xchg   %ax,%ax
 804f437:	66 90                	xchg   %ax,%ax
 804f439:	66 90                	xchg   %ax,%ax
 804f43b:	66 90                	xchg   %ax,%ax
 804f43d:	66 90                	xchg   %ax,%ax
 804f43f:	90                   	nop

0804f440 <_malloc_r>:
 804f440:	55                   	push   %ebp
 804f441:	89 e5                	mov    %esp,%ebp
 804f443:	57                   	push   %edi
 804f444:	56                   	push   %esi
 804f445:	53                   	push   %ebx
 804f446:	83 ec 2c             	sub    $0x2c,%esp
 804f449:	8b 45 0c             	mov    0xc(%ebp),%eax
 804f44c:	8d 50 0b             	lea    0xb(%eax),%edx
 804f44f:	83 fa 16             	cmp    $0x16,%edx
 804f452:	76 6c                	jbe    804f4c0 <_malloc_r+0x80>
 804f454:	89 d7                	mov    %edx,%edi
 804f456:	83 e7 f8             	and    $0xfffffff8,%edi
 804f459:	89 fe                	mov    %edi,%esi
 804f45b:	c1 ee 1f             	shr    $0x1f,%esi
 804f45e:	39 c7                	cmp    %eax,%edi
 804f460:	8b 45 08             	mov    0x8(%ebp),%eax
 804f463:	89 f2                	mov    %esi,%edx
 804f465:	72 67                	jb     804f4ce <_malloc_r+0x8e>
 804f467:	84 d2                	test   %dl,%dl
 804f469:	75 63                	jne    804f4ce <_malloc_r+0x8e>
 804f46b:	89 04 24             	mov    %eax,(%esp)
 804f46e:	e8 ed 07 00 00       	call   804fc60 <__malloc_lock>
 804f473:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
 804f479:	77 65                	ja     804f4e0 <_malloc_r+0xa0>
 804f47b:	89 fa                	mov    %edi,%edx
 804f47d:	c1 ea 03             	shr    $0x3,%edx
 804f480:	8d 04 d5 40 80 05 08 	lea    0x8058040(,%edx,8),%eax
 804f487:	8b 58 0c             	mov    0xc(%eax),%ebx
 804f48a:	39 c3                	cmp    %eax,%ebx
 804f48c:	0f 84 3e 05 00 00    	je     804f9d0 <_malloc_r+0x590>
 804f492:	8b 43 04             	mov    0x4(%ebx),%eax
 804f495:	83 e0 fc             	and    $0xfffffffc,%eax
 804f498:	8b 53 0c             	mov    0xc(%ebx),%edx
 804f49b:	8b 4b 08             	mov    0x8(%ebx),%ecx
 804f49e:	89 51 0c             	mov    %edx,0xc(%ecx)
 804f4a1:	89 4a 08             	mov    %ecx,0x8(%edx)
 804f4a4:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
 804f4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 804f4ac:	89 04 24             	mov    %eax,(%esp)
 804f4af:	e8 bc 07 00 00       	call   804fc70 <__malloc_unlock>
 804f4b4:	8d 43 08             	lea    0x8(%ebx),%eax
 804f4b7:	83 c4 2c             	add    $0x2c,%esp
 804f4ba:	5b                   	pop    %ebx
 804f4bb:	5e                   	pop    %esi
 804f4bc:	5f                   	pop    %edi
 804f4bd:	5d                   	pop    %ebp
 804f4be:	c3                   	ret    
 804f4bf:	90                   	nop
 804f4c0:	bf 10 00 00 00       	mov    $0x10,%edi
 804f4c5:	31 d2                	xor    %edx,%edx
 804f4c7:	39 c7                	cmp    %eax,%edi
 804f4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 804f4cc:	73 99                	jae    804f467 <_malloc_r+0x27>
 804f4ce:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 804f4d4:	83 c4 2c             	add    $0x2c,%esp
 804f4d7:	31 c0                	xor    %eax,%eax
 804f4d9:	5b                   	pop    %ebx
 804f4da:	5e                   	pop    %esi
 804f4db:	5f                   	pop    %edi
 804f4dc:	5d                   	pop    %ebp
 804f4dd:	c3                   	ret    
 804f4de:	66 90                	xchg   %ax,%ax
 804f4e0:	89 fe                	mov    %edi,%esi
 804f4e2:	c1 ee 09             	shr    $0x9,%esi
 804f4e5:	85 f6                	test   %esi,%esi
 804f4e7:	0f 84 ab 01 00 00    	je     804f698 <_malloc_r+0x258>
 804f4ed:	83 fe 04             	cmp    $0x4,%esi
 804f4f0:	0f 87 8a 03 00 00    	ja     804f880 <_malloc_r+0x440>
 804f4f6:	89 fe                	mov    %edi,%esi
 804f4f8:	c1 ee 06             	shr    $0x6,%esi
 804f4fb:	83 c6 38             	add    $0x38,%esi
 804f4fe:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804f501:	8d 0c 85 40 80 05 08 	lea    0x8058040(,%eax,4),%ecx
 804f508:	8b 59 0c             	mov    0xc(%ecx),%ebx
 804f50b:	39 d9                	cmp    %ebx,%ecx
 804f50d:	75 18                	jne    804f527 <_malloc_r+0xe7>
 804f50f:	eb 28                	jmp    804f539 <_malloc_r+0xf9>
 804f511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f518:	85 d2                	test   %edx,%edx
 804f51a:	0f 89 78 ff ff ff    	jns    804f498 <_malloc_r+0x58>
 804f520:	8b 5b 0c             	mov    0xc(%ebx),%ebx
 804f523:	39 d9                	cmp    %ebx,%ecx
 804f525:	74 12                	je     804f539 <_malloc_r+0xf9>
 804f527:	8b 43 04             	mov    0x4(%ebx),%eax
 804f52a:	83 e0 fc             	and    $0xfffffffc,%eax
 804f52d:	89 c2                	mov    %eax,%edx
 804f52f:	29 fa                	sub    %edi,%edx
 804f531:	83 fa 0f             	cmp    $0xf,%edx
 804f534:	7e e2                	jle    804f518 <_malloc_r+0xd8>
 804f536:	83 ee 01             	sub    $0x1,%esi
 804f539:	8d 46 01             	lea    0x1(%esi),%eax
 804f53c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f53f:	8b 1d 50 80 05 08    	mov    0x8058050,%ebx
 804f545:	a1 44 80 05 08       	mov    0x8058044,%eax
 804f54a:	81 fb 48 80 05 08    	cmp    $0x8058048,%ebx
 804f550:	74 6b                	je     804f5bd <_malloc_r+0x17d>
 804f552:	8b 73 04             	mov    0x4(%ebx),%esi
 804f555:	83 e6 fc             	and    $0xfffffffc,%esi
 804f558:	89 f0                	mov    %esi,%eax
 804f55a:	29 f8                	sub    %edi,%eax
 804f55c:	83 f8 0f             	cmp    $0xf,%eax
 804f55f:	0f 8f a3 03 00 00    	jg     804f908 <_malloc_r+0x4c8>
 804f565:	85 c0                	test   %eax,%eax
 804f567:	c7 05 54 80 05 08 48 	movl   $0x8058048,0x8058054
 804f56e:	80 05 08 
 804f571:	c7 05 50 80 05 08 48 	movl   $0x8058048,0x8058050
 804f578:	80 05 08 
 804f57b:	0f 89 27 01 00 00    	jns    804f6a8 <_malloc_r+0x268>
 804f581:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
 804f587:	0f 87 1b 03 00 00    	ja     804f8a8 <_malloc_r+0x468>
 804f58d:	c1 ee 03             	shr    $0x3,%esi
 804f590:	b8 01 00 00 00       	mov    $0x1,%eax
 804f595:	89 f1                	mov    %esi,%ecx
 804f597:	8d 14 f5 40 80 05 08 	lea    0x8058040(,%esi,8),%edx
 804f59e:	c1 f9 02             	sar    $0x2,%ecx
 804f5a1:	d3 e0                	shl    %cl,%eax
 804f5a3:	8b 4a 08             	mov    0x8(%edx),%ecx
 804f5a6:	0b 05 44 80 05 08    	or     0x8058044,%eax
 804f5ac:	89 53 0c             	mov    %edx,0xc(%ebx)
 804f5af:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804f5b2:	a3 44 80 05 08       	mov    %eax,0x8058044
 804f5b7:	89 5a 08             	mov    %ebx,0x8(%edx)
 804f5ba:	89 59 0c             	mov    %ebx,0xc(%ecx)
 804f5bd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804f5c0:	be 01 00 00 00       	mov    $0x1,%esi
 804f5c5:	c1 f9 02             	sar    $0x2,%ecx
 804f5c8:	d3 e6                	shl    %cl,%esi
 804f5ca:	39 c6                	cmp    %eax,%esi
 804f5cc:	0f 87 f6 00 00 00    	ja     804f6c8 <_malloc_r+0x288>
 804f5d2:	85 f0                	test   %esi,%eax
 804f5d4:	0f 85 76 03 00 00    	jne    804f950 <_malloc_r+0x510>
 804f5da:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804f5dd:	01 f6                	add    %esi,%esi
 804f5df:	83 e2 fc             	and    $0xfffffffc,%edx
 804f5e2:	85 f0                	test   %esi,%eax
 804f5e4:	8d 4a 04             	lea    0x4(%edx),%ecx
 804f5e7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f5ea:	0f 85 60 03 00 00    	jne    804f950 <_malloc_r+0x510>
 804f5f0:	89 ca                	mov    %ecx,%edx
 804f5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f5f8:	01 f6                	add    %esi,%esi
 804f5fa:	83 c2 04             	add    $0x4,%edx
 804f5fd:	85 f0                	test   %esi,%eax
 804f5ff:	74 f7                	je     804f5f8 <_malloc_r+0x1b8>
 804f601:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 804f604:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804f607:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f60a:	8d 34 c5 40 80 05 08 	lea    0x8058040(,%eax,8),%esi
 804f611:	89 f1                	mov    %esi,%ecx
 804f613:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804f616:	8b 59 0c             	mov    0xc(%ecx),%ebx
 804f619:	39 d9                	cmp    %ebx,%ecx
 804f61b:	75 1e                	jne    804f63b <_malloc_r+0x1fb>
 804f61d:	e9 36 03 00 00       	jmp    804f958 <_malloc_r+0x518>
 804f622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f628:	85 d2                	test   %edx,%edx
 804f62a:	0f 89 c0 03 00 00    	jns    804f9f0 <_malloc_r+0x5b0>
 804f630:	8b 5b 0c             	mov    0xc(%ebx),%ebx
 804f633:	39 d9                	cmp    %ebx,%ecx
 804f635:	0f 84 1d 03 00 00    	je     804f958 <_malloc_r+0x518>
 804f63b:	8b 43 04             	mov    0x4(%ebx),%eax
 804f63e:	83 e0 fc             	and    $0xfffffffc,%eax
 804f641:	89 c2                	mov    %eax,%edx
 804f643:	29 fa                	sub    %edi,%edx
 804f645:	83 fa 0f             	cmp    $0xf,%edx
 804f648:	7e de                	jle    804f628 <_malloc_r+0x1e8>
 804f64a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
 804f64d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
 804f650:	83 cf 01             	or     $0x1,%edi
 804f653:	8b 73 08             	mov    0x8(%ebx),%esi
 804f656:	89 7b 04             	mov    %edi,0x4(%ebx)
 804f659:	89 4e 0c             	mov    %ecx,0xc(%esi)
 804f65c:	89 71 08             	mov    %esi,0x8(%ecx)
 804f65f:	89 d1                	mov    %edx,%ecx
 804f661:	83 c9 01             	or     $0x1,%ecx
 804f664:	a3 54 80 05 08       	mov    %eax,0x8058054
 804f669:	a3 50 80 05 08       	mov    %eax,0x8058050
 804f66e:	c7 40 0c 48 80 05 08 	movl   $0x8058048,0xc(%eax)
 804f675:	c7 40 08 48 80 05 08 	movl   $0x8058048,0x8(%eax)
 804f67c:	89 48 04             	mov    %ecx,0x4(%eax)
 804f67f:	89 14 10             	mov    %edx,(%eax,%edx,1)
 804f682:	8b 45 08             	mov    0x8(%ebp),%eax
 804f685:	89 04 24             	mov    %eax,(%esp)
 804f688:	e8 e3 05 00 00       	call   804fc70 <__malloc_unlock>
 804f68d:	8d 43 08             	lea    0x8(%ebx),%eax
 804f690:	e9 22 fe ff ff       	jmp    804f4b7 <_malloc_r+0x77>
 804f695:	8d 76 00             	lea    0x0(%esi),%esi
 804f698:	b8 7e 00 00 00       	mov    $0x7e,%eax
 804f69d:	be 3f 00 00 00       	mov    $0x3f,%esi
 804f6a2:	e9 5a fe ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804f6a7:	90                   	nop
 804f6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 804f6ab:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
 804f6b0:	89 04 24             	mov    %eax,(%esp)
 804f6b3:	e8 b8 05 00 00       	call   804fc70 <__malloc_unlock>
 804f6b8:	83 c4 2c             	add    $0x2c,%esp
 804f6bb:	8d 43 08             	lea    0x8(%ebx),%eax
 804f6be:	5b                   	pop    %ebx
 804f6bf:	5e                   	pop    %esi
 804f6c0:	5f                   	pop    %edi
 804f6c1:	5d                   	pop    %ebp
 804f6c2:	c3                   	ret    
 804f6c3:	90                   	nop
 804f6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f6c8:	8b 1d 48 80 05 08    	mov    0x8058048,%ebx
 804f6ce:	8b 73 04             	mov    0x4(%ebx),%esi
 804f6d1:	83 e6 fc             	and    $0xfffffffc,%esi
 804f6d4:	39 f7                	cmp    %esi,%edi
 804f6d6:	77 0d                	ja     804f6e5 <_malloc_r+0x2a5>
 804f6d8:	89 f0                	mov    %esi,%eax
 804f6da:	29 f8                	sub    %edi,%eax
 804f6dc:	83 f8 0f             	cmp    $0xf,%eax
 804f6df:	0f 8f 6b 01 00 00    	jg     804f850 <_malloc_r+0x410>
 804f6e5:	8b 0d 50 dd 06 08    	mov    0x806dd50,%ecx
 804f6eb:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 804f6ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f6f1:	01 f9                	add    %edi,%ecx
 804f6f3:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
 804f6f9:	83 c1 10             	add    $0x10,%ecx
 804f6fc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 804f701:	83 3d 20 80 05 08 ff 	cmpl   $0xffffffff,0x8058020
 804f708:	0f 44 c1             	cmove  %ecx,%eax
 804f70b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804f70e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804f712:	8b 45 08             	mov    0x8(%ebp),%eax
 804f715:	89 04 24             	mov    %eax,(%esp)
 804f718:	e8 43 13 00 00       	call   8050a60 <_sbrk_r>
 804f71d:	83 f8 ff             	cmp    $0xffffffff,%eax
 804f720:	89 c1                	mov    %eax,%ecx
 804f722:	0f 84 17 03 00 00    	je     804fa3f <_malloc_r+0x5ff>
 804f728:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 804f72b:	0f 87 02 03 00 00    	ja     804fa33 <_malloc_r+0x5f3>
 804f731:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804f734:	03 15 20 dd 06 08    	add    0x806dd20,%edx
 804f73a:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
 804f73d:	89 15 20 dd 06 08    	mov    %edx,0x806dd20
 804f743:	0f 84 a9 03 00 00    	je     804faf2 <_malloc_r+0x6b2>
 804f749:	83 3d 20 80 05 08 ff 	cmpl   $0xffffffff,0x8058020
 804f750:	0f 84 ca 03 00 00    	je     804fb20 <_malloc_r+0x6e0>
 804f756:	89 c8                	mov    %ecx,%eax
 804f758:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 804f75b:	01 d0                	add    %edx,%eax
 804f75d:	a3 20 dd 06 08       	mov    %eax,0x806dd20
 804f762:	89 c8                	mov    %ecx,%eax
 804f764:	ba 00 10 00 00       	mov    $0x1000,%edx
 804f769:	83 e0 07             	and    $0x7,%eax
 804f76c:	74 0c                	je     804f77a <_malloc_r+0x33a>
 804f76e:	29 c1                	sub    %eax,%ecx
 804f770:	ba 08 10 00 00       	mov    $0x1008,%edx
 804f775:	8d 49 08             	lea    0x8(%ecx),%ecx
 804f778:	29 c2                	sub    %eax,%edx
 804f77a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804f77d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f780:	01 c8                	add    %ecx,%eax
 804f782:	25 ff 0f 00 00       	and    $0xfff,%eax
 804f787:	29 c2                	sub    %eax,%edx
 804f789:	8b 45 08             	mov    0x8(%ebp),%eax
 804f78c:	89 54 24 04          	mov    %edx,0x4(%esp)
 804f790:	89 55 e0             	mov    %edx,-0x20(%ebp)
 804f793:	89 04 24             	mov    %eax,(%esp)
 804f796:	e8 c5 12 00 00       	call   8050a60 <_sbrk_r>
 804f79b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804f79e:	83 f8 ff             	cmp    $0xffffffff,%eax
 804f7a1:	0f 84 6d 03 00 00    	je     804fb14 <_malloc_r+0x6d4>
 804f7a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804f7aa:	29 c8                	sub    %ecx,%eax
 804f7ac:	01 d0                	add    %edx,%eax
 804f7ae:	83 c8 01             	or     $0x1,%eax
 804f7b1:	03 15 20 dd 06 08    	add    0x806dd20,%edx
 804f7b7:	81 fb 40 80 05 08    	cmp    $0x8058040,%ebx
 804f7bd:	89 0d 48 80 05 08    	mov    %ecx,0x8058048
 804f7c3:	89 41 04             	mov    %eax,0x4(%ecx)
 804f7c6:	89 15 20 dd 06 08    	mov    %edx,0x806dd20
 804f7cc:	0f 84 f2 02 00 00    	je     804fac4 <_malloc_r+0x684>
 804f7d2:	83 fe 0f             	cmp    $0xf,%esi
 804f7d5:	0f 86 8d 02 00 00    	jbe    804fa68 <_malloc_r+0x628>
 804f7db:	8b 43 04             	mov    0x4(%ebx),%eax
 804f7de:	83 ee 0c             	sub    $0xc,%esi
 804f7e1:	83 e6 f8             	and    $0xfffffff8,%esi
 804f7e4:	83 e0 01             	and    $0x1,%eax
 804f7e7:	09 f0                	or     %esi,%eax
 804f7e9:	83 fe 0f             	cmp    $0xf,%esi
 804f7ec:	89 43 04             	mov    %eax,0x4(%ebx)
 804f7ef:	a1 48 80 05 08       	mov    0x8058048,%eax
 804f7f4:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
 804f7fb:	00 
 804f7fc:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
 804f803:	00 
 804f804:	0f 87 a2 02 00 00    	ja     804faac <_malloc_r+0x66c>
 804f80a:	3b 15 4c dd 06 08    	cmp    0x806dd4c,%edx
 804f810:	76 06                	jbe    804f818 <_malloc_r+0x3d8>
 804f812:	89 15 4c dd 06 08    	mov    %edx,0x806dd4c
 804f818:	3b 15 48 dd 06 08    	cmp    0x806dd48,%edx
 804f81e:	76 06                	jbe    804f826 <_malloc_r+0x3e6>
 804f820:	89 15 48 dd 06 08    	mov    %edx,0x806dd48
 804f826:	8b 50 04             	mov    0x4(%eax),%edx
 804f829:	89 c3                	mov    %eax,%ebx
 804f82b:	83 e2 fc             	and    $0xfffffffc,%edx
 804f82e:	89 d0                	mov    %edx,%eax
 804f830:	29 f8                	sub    %edi,%eax
 804f832:	39 d7                	cmp    %edx,%edi
 804f834:	77 05                	ja     804f83b <_malloc_r+0x3fb>
 804f836:	83 f8 0f             	cmp    $0xf,%eax
 804f839:	7f 15                	jg     804f850 <_malloc_r+0x410>
 804f83b:	8b 45 08             	mov    0x8(%ebp),%eax
 804f83e:	89 04 24             	mov    %eax,(%esp)
 804f841:	e8 2a 04 00 00       	call   804fc70 <__malloc_unlock>
 804f846:	31 c0                	xor    %eax,%eax
 804f848:	e9 6a fc ff ff       	jmp    804f4b7 <_malloc_r+0x77>
 804f84d:	8d 76 00             	lea    0x0(%esi),%esi
 804f850:	89 fa                	mov    %edi,%edx
 804f852:	83 c8 01             	or     $0x1,%eax
 804f855:	83 ca 01             	or     $0x1,%edx
 804f858:	89 53 04             	mov    %edx,0x4(%ebx)
 804f85b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
 804f85e:	89 15 48 80 05 08    	mov    %edx,0x8058048
 804f864:	89 42 04             	mov    %eax,0x4(%edx)
 804f867:	8b 45 08             	mov    0x8(%ebp),%eax
 804f86a:	89 04 24             	mov    %eax,(%esp)
 804f86d:	e8 fe 03 00 00       	call   804fc70 <__malloc_unlock>
 804f872:	83 c4 2c             	add    $0x2c,%esp
 804f875:	8d 43 08             	lea    0x8(%ebx),%eax
 804f878:	5b                   	pop    %ebx
 804f879:	5e                   	pop    %esi
 804f87a:	5f                   	pop    %edi
 804f87b:	5d                   	pop    %ebp
 804f87c:	c3                   	ret    
 804f87d:	8d 76 00             	lea    0x0(%esi),%esi
 804f880:	83 fe 14             	cmp    $0x14,%esi
 804f883:	0f 86 8f 01 00 00    	jbe    804fa18 <_malloc_r+0x5d8>
 804f889:	83 fe 54             	cmp    $0x54,%esi
 804f88c:	0f 87 be 01 00 00    	ja     804fa50 <_malloc_r+0x610>
 804f892:	89 fe                	mov    %edi,%esi
 804f894:	c1 ee 0c             	shr    $0xc,%esi
 804f897:	83 c6 6e             	add    $0x6e,%esi
 804f89a:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804f89d:	e9 5f fc ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804f8a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f8a8:	89 f1                	mov    %esi,%ecx
 804f8aa:	c1 e9 09             	shr    $0x9,%ecx
 804f8ad:	83 f9 04             	cmp    $0x4,%ecx
 804f8b0:	0f 86 6d 01 00 00    	jbe    804fa23 <_malloc_r+0x5e3>
 804f8b6:	83 f9 14             	cmp    $0x14,%ecx
 804f8b9:	0f 87 0f 02 00 00    	ja     804face <_malloc_r+0x68e>
 804f8bf:	83 c1 5b             	add    $0x5b,%ecx
 804f8c2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804f8c5:	8d 04 85 40 80 05 08 	lea    0x8058040(,%eax,4),%eax
 804f8cc:	8b 50 08             	mov    0x8(%eax),%edx
 804f8cf:	39 c2                	cmp    %eax,%edx
 804f8d1:	0f 84 a1 01 00 00    	je     804fa78 <_malloc_r+0x638>
 804f8d7:	90                   	nop
 804f8d8:	8b 4a 04             	mov    0x4(%edx),%ecx
 804f8db:	83 e1 fc             	and    $0xfffffffc,%ecx
 804f8de:	39 ce                	cmp    %ecx,%esi
 804f8e0:	73 07                	jae    804f8e9 <_malloc_r+0x4a9>
 804f8e2:	8b 52 08             	mov    0x8(%edx),%edx
 804f8e5:	39 d0                	cmp    %edx,%eax
 804f8e7:	75 ef                	jne    804f8d8 <_malloc_r+0x498>
 804f8e9:	8b 4a 0c             	mov    0xc(%edx),%ecx
 804f8ec:	a1 44 80 05 08       	mov    0x8058044,%eax
 804f8f1:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 804f8f4:	89 53 08             	mov    %edx,0x8(%ebx)
 804f8f7:	89 59 08             	mov    %ebx,0x8(%ecx)
 804f8fa:	89 5a 0c             	mov    %ebx,0xc(%edx)
 804f8fd:	e9 bb fc ff ff       	jmp    804f5bd <_malloc_r+0x17d>
 804f902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f908:	89 c1                	mov    %eax,%ecx
 804f90a:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
 804f90d:	83 c9 01             	or     $0x1,%ecx
 804f910:	83 cf 01             	or     $0x1,%edi
 804f913:	89 7b 04             	mov    %edi,0x4(%ebx)
 804f916:	89 15 54 80 05 08    	mov    %edx,0x8058054
 804f91c:	89 15 50 80 05 08    	mov    %edx,0x8058050
 804f922:	c7 42 0c 48 80 05 08 	movl   $0x8058048,0xc(%edx)
 804f929:	c7 42 08 48 80 05 08 	movl   $0x8058048,0x8(%edx)
 804f930:	89 4a 04             	mov    %ecx,0x4(%edx)
 804f933:	89 04 02             	mov    %eax,(%edx,%eax,1)
 804f936:	8b 45 08             	mov    0x8(%ebp),%eax
 804f939:	89 04 24             	mov    %eax,(%esp)
 804f93c:	e8 2f 03 00 00       	call   804fc70 <__malloc_unlock>
 804f941:	8d 43 08             	lea    0x8(%ebx),%eax
 804f944:	e9 6e fb ff ff       	jmp    804f4b7 <_malloc_r+0x77>
 804f949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f950:	89 75 dc             	mov    %esi,-0x24(%ebp)
 804f953:	e9 af fc ff ff       	jmp    804f607 <_malloc_r+0x1c7>
 804f958:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
 804f95c:	83 c1 08             	add    $0x8,%ecx
 804f95f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
 804f963:	0f 85 ad fc ff ff    	jne    804f616 <_malloc_r+0x1d6>
 804f969:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804f96c:	eb 12                	jmp    804f980 <_malloc_r+0x540>
 804f96e:	66 90                	xchg   %ax,%ax
 804f970:	8d 56 f8             	lea    -0x8(%esi),%edx
 804f973:	8b 36                	mov    (%esi),%esi
 804f975:	83 e8 01             	sub    $0x1,%eax
 804f978:	39 d6                	cmp    %edx,%esi
 804f97a:	0f 85 ea 01 00 00    	jne    804fb6a <_malloc_r+0x72a>
 804f980:	a8 03                	test   $0x3,%al
 804f982:	75 ec                	jne    804f970 <_malloc_r+0x530>
 804f984:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804f987:	f7 d0                	not    %eax
 804f989:	23 05 44 80 05 08    	and    0x8058044,%eax
 804f98f:	a3 44 80 05 08       	mov    %eax,0x8058044
 804f994:	d1 65 dc             	shll   -0x24(%ebp)
 804f997:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804f99a:	39 c2                	cmp    %eax,%edx
 804f99c:	0f 87 26 fd ff ff    	ja     804f6c8 <_malloc_r+0x288>
 804f9a2:	85 d2                	test   %edx,%edx
 804f9a4:	0f 84 1e fd ff ff    	je     804f6c8 <_malloc_r+0x288>
 804f9aa:	85 c2                	test   %eax,%edx
 804f9ac:	0f 85 c2 01 00 00    	jne    804fb74 <_malloc_r+0x734>
 804f9b2:	8b 75 e0             	mov    -0x20(%ebp),%esi
 804f9b5:	89 f1                	mov    %esi,%ecx
 804f9b7:	01 d2                	add    %edx,%edx
 804f9b9:	83 c1 04             	add    $0x4,%ecx
 804f9bc:	85 d0                	test   %edx,%eax
 804f9be:	74 f7                	je     804f9b7 <_malloc_r+0x577>
 804f9c0:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804f9c3:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804f9c6:	e9 3c fc ff ff       	jmp    804f607 <_malloc_r+0x1c7>
 804f9cb:	90                   	nop
 804f9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804f9d0:	8d 43 08             	lea    0x8(%ebx),%eax
 804f9d3:	8b 5b 14             	mov    0x14(%ebx),%ebx
 804f9d6:	39 d8                	cmp    %ebx,%eax
 804f9d8:	0f 85 b4 fa ff ff    	jne    804f492 <_malloc_r+0x52>
 804f9de:	8d 42 02             	lea    0x2(%edx),%eax
 804f9e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804f9e4:	e9 56 fb ff ff       	jmp    804f53f <_malloc_r+0xff>
 804f9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804f9f0:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
 804f9f5:	8b 53 08             	mov    0x8(%ebx),%edx
 804f9f8:	8b 43 0c             	mov    0xc(%ebx),%eax
 804f9fb:	89 42 0c             	mov    %eax,0xc(%edx)
 804f9fe:	89 50 08             	mov    %edx,0x8(%eax)
 804fa01:	8b 45 08             	mov    0x8(%ebp),%eax
 804fa04:	89 04 24             	mov    %eax,(%esp)
 804fa07:	e8 64 02 00 00       	call   804fc70 <__malloc_unlock>
 804fa0c:	8d 43 08             	lea    0x8(%ebx),%eax
 804fa0f:	e9 a3 fa ff ff       	jmp    804f4b7 <_malloc_r+0x77>
 804fa14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fa18:	83 c6 5b             	add    $0x5b,%esi
 804fa1b:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804fa1e:	e9 de fa ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804fa23:	89 f1                	mov    %esi,%ecx
 804fa25:	c1 e9 06             	shr    $0x6,%ecx
 804fa28:	83 c1 38             	add    $0x38,%ecx
 804fa2b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fa2e:	e9 92 fe ff ff       	jmp    804f8c5 <_malloc_r+0x485>
 804fa33:	81 fb 40 80 05 08    	cmp    $0x8058040,%ebx
 804fa39:	0f 84 f2 fc ff ff    	je     804f731 <_malloc_r+0x2f1>
 804fa3f:	8b 1d 48 80 05 08    	mov    0x8058048,%ebx
 804fa45:	8b 53 04             	mov    0x4(%ebx),%edx
 804fa48:	83 e2 fc             	and    $0xfffffffc,%edx
 804fa4b:	e9 de fd ff ff       	jmp    804f82e <_malloc_r+0x3ee>
 804fa50:	81 fe 54 01 00 00    	cmp    $0x154,%esi
 804fa56:	77 3c                	ja     804fa94 <_malloc_r+0x654>
 804fa58:	89 fe                	mov    %edi,%esi
 804fa5a:	c1 ee 0f             	shr    $0xf,%esi
 804fa5d:	83 c6 77             	add    $0x77,%esi
 804fa60:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804fa63:	e9 99 fa ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804fa68:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
 804fa6f:	89 cb                	mov    %ecx,%ebx
 804fa71:	31 d2                	xor    %edx,%edx
 804fa73:	e9 b6 fd ff ff       	jmp    804f82e <_malloc_r+0x3ee>
 804fa78:	c1 f9 02             	sar    $0x2,%ecx
 804fa7b:	b8 01 00 00 00       	mov    $0x1,%eax
 804fa80:	d3 e0                	shl    %cl,%eax
 804fa82:	89 d1                	mov    %edx,%ecx
 804fa84:	0b 05 44 80 05 08    	or     0x8058044,%eax
 804fa8a:	a3 44 80 05 08       	mov    %eax,0x8058044
 804fa8f:	e9 5d fe ff ff       	jmp    804f8f1 <_malloc_r+0x4b1>
 804fa94:	81 fe 54 05 00 00    	cmp    $0x554,%esi
 804fa9a:	77 47                	ja     804fae3 <_malloc_r+0x6a3>
 804fa9c:	89 fe                	mov    %edi,%esi
 804fa9e:	c1 ee 12             	shr    $0x12,%esi
 804faa1:	83 c6 7c             	add    $0x7c,%esi
 804faa4:	8d 04 36             	lea    (%esi,%esi,1),%eax
 804faa7:	e9 55 fa ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804faac:	8b 45 08             	mov    0x8(%ebp),%eax
 804faaf:	83 c3 08             	add    $0x8,%ebx
 804fab2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804fab6:	89 04 24             	mov    %eax,(%esp)
 804fab9:	e8 d2 f3 ff ff       	call   804ee90 <_free_r>
 804fabe:	8b 15 20 dd 06 08    	mov    0x806dd20,%edx
 804fac4:	a1 48 80 05 08       	mov    0x8058048,%eax
 804fac9:	e9 3c fd ff ff       	jmp    804f80a <_malloc_r+0x3ca>
 804face:	83 f9 54             	cmp    $0x54,%ecx
 804fad1:	77 58                	ja     804fb2b <_malloc_r+0x6eb>
 804fad3:	89 f1                	mov    %esi,%ecx
 804fad5:	c1 e9 0c             	shr    $0xc,%ecx
 804fad8:	83 c1 6e             	add    $0x6e,%ecx
 804fadb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fade:	e9 e2 fd ff ff       	jmp    804f8c5 <_malloc_r+0x485>
 804fae3:	b8 fc 00 00 00       	mov    $0xfc,%eax
 804fae8:	be 7e 00 00 00       	mov    $0x7e,%esi
 804faed:	e9 0f fa ff ff       	jmp    804f501 <_malloc_r+0xc1>
 804faf2:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
 804faf9:	0f 85 4a fc ff ff    	jne    804f749 <_malloc_r+0x309>
 804faff:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 804fb02:	a1 48 80 05 08       	mov    0x8058048,%eax
 804fb07:	01 f1                	add    %esi,%ecx
 804fb09:	83 c9 01             	or     $0x1,%ecx
 804fb0c:	89 48 04             	mov    %ecx,0x4(%eax)
 804fb0f:	e9 f6 fc ff ff       	jmp    804f80a <_malloc_r+0x3ca>
 804fb14:	b8 01 00 00 00       	mov    $0x1,%eax
 804fb19:	31 d2                	xor    %edx,%edx
 804fb1b:	e9 91 fc ff ff       	jmp    804f7b1 <_malloc_r+0x371>
 804fb20:	89 0d 20 80 05 08    	mov    %ecx,0x8058020
 804fb26:	e9 37 fc ff ff       	jmp    804f762 <_malloc_r+0x322>
 804fb2b:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
 804fb31:	77 10                	ja     804fb43 <_malloc_r+0x703>
 804fb33:	89 f1                	mov    %esi,%ecx
 804fb35:	c1 e9 0f             	shr    $0xf,%ecx
 804fb38:	83 c1 77             	add    $0x77,%ecx
 804fb3b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fb3e:	e9 82 fd ff ff       	jmp    804f8c5 <_malloc_r+0x485>
 804fb43:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
 804fb49:	77 10                	ja     804fb5b <_malloc_r+0x71b>
 804fb4b:	89 f1                	mov    %esi,%ecx
 804fb4d:	c1 e9 12             	shr    $0x12,%ecx
 804fb50:	83 c1 7c             	add    $0x7c,%ecx
 804fb53:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
 804fb56:	e9 6a fd ff ff       	jmp    804f8c5 <_malloc_r+0x485>
 804fb5b:	b8 fc 00 00 00       	mov    $0xfc,%eax
 804fb60:	b9 7e 00 00 00       	mov    $0x7e,%ecx
 804fb65:	e9 5b fd ff ff       	jmp    804f8c5 <_malloc_r+0x485>
 804fb6a:	a1 44 80 05 08       	mov    0x8058044,%eax
 804fb6f:	e9 20 fe ff ff       	jmp    804f994 <_malloc_r+0x554>
 804fb74:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804fb77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804fb7a:	e9 88 fa ff ff       	jmp    804f607 <_malloc_r+0x1c7>
 804fb7f:	90                   	nop

0804fb80 <memchr>:
 804fb80:	55                   	push   %ebp
 804fb81:	89 e5                	mov    %esp,%ebp
 804fb83:	57                   	push   %edi
 804fb84:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 804fb88:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fb8b:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fb8e:	31 d2                	xor    %edx,%edx
 804fb90:	85 c9                	test   %ecx,%ecx
 804fb92:	74 79                	je     804fc0d <L20>
 804fb94:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fb9a:	74 28                	je     804fbc4 <L5>
 804fb9c:	3a 07                	cmp    (%edi),%al
 804fb9e:	74 6a                	je     804fc0a <L15>
 804fba0:	47                   	inc    %edi
 804fba1:	49                   	dec    %ecx
 804fba2:	74 69                	je     804fc0d <L20>
 804fba4:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fbaa:	74 18                	je     804fbc4 <L5>
 804fbac:	3a 07                	cmp    (%edi),%al
 804fbae:	74 5a                	je     804fc0a <L15>
 804fbb0:	47                   	inc    %edi
 804fbb1:	49                   	dec    %ecx
 804fbb2:	74 59                	je     804fc0d <L20>
 804fbb4:	f7 c7 03 00 00 00    	test   $0x3,%edi
 804fbba:	74 08                	je     804fbc4 <L5>
 804fbbc:	3a 07                	cmp    (%edi),%al
 804fbbe:	74 4a                	je     804fc0a <L15>
 804fbc0:	47                   	inc    %edi
 804fbc1:	49                   	dec    %ecx
 804fbc2:	74 49                	je     804fc0d <L20>

0804fbc4 <L5>:
 804fbc4:	88 c4                	mov    %al,%ah
 804fbc6:	89 c2                	mov    %eax,%edx
 804fbc8:	c1 e2 10             	shl    $0x10,%edx
 804fbcb:	09 d0                	or     %edx,%eax
 804fbcd:	53                   	push   %ebx
 804fbce:	66 90                	xchg   %ax,%ax

0804fbd0 <L8>:
 804fbd0:	83 e9 04             	sub    $0x4,%ecx
 804fbd3:	72 1c                	jb     804fbf1 <L9>
 804fbd5:	8b 17                	mov    (%edi),%edx
 804fbd7:	83 c7 04             	add    $0x4,%edi
 804fbda:	31 c2                	xor    %eax,%edx
 804fbdc:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
 804fbe2:	f7 d2                	not    %edx
 804fbe4:	21 d3                	and    %edx,%ebx
 804fbe6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
 804fbec:	74 e2                	je     804fbd0 <L8>
 804fbee:	83 ef 04             	sub    $0x4,%edi

0804fbf1 <L9>:
 804fbf1:	5b                   	pop    %ebx
 804fbf2:	31 d2                	xor    %edx,%edx
 804fbf4:	83 c1 04             	add    $0x4,%ecx
 804fbf7:	74 14                	je     804fc0d <L20>
 804fbf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804fc00 <L10>:
 804fc00:	3a 07                	cmp    (%edi),%al
 804fc02:	74 06                	je     804fc0a <L15>
 804fc04:	47                   	inc    %edi
 804fc05:	49                   	dec    %ecx
 804fc06:	75 f8                	jne    804fc00 <L10>
 804fc08:	31 ff                	xor    %edi,%edi

0804fc0a <L15>:
 804fc0a:	4a                   	dec    %edx
 804fc0b:	21 fa                	and    %edi,%edx

0804fc0d <L20>:
 804fc0d:	89 d0                	mov    %edx,%eax
 804fc0f:	8d 65 fc             	lea    -0x4(%ebp),%esp
 804fc12:	5f                   	pop    %edi
 804fc13:	c9                   	leave  
 804fc14:	c3                   	ret    
 804fc15:	66 90                	xchg   %ax,%ax
 804fc17:	90                   	nop

0804fc18 <memcpy>:
 804fc18:	55                   	push   %ebp
 804fc19:	89 e5                	mov    %esp,%ebp
 804fc1b:	56                   	push   %esi
 804fc1c:	57                   	push   %edi
 804fc1d:	53                   	push   %ebx
 804fc1e:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fc21:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fc24:	8b 75 0c             	mov    0xc(%ebp),%esi
 804fc27:	fc                   	cld    
 804fc28:	83 f9 08             	cmp    $0x8,%ecx
 804fc2b:	76 26                	jbe    804fc53 <memcpy+0x3b>
 804fc2d:	89 fa                	mov    %edi,%edx
 804fc2f:	89 cb                	mov    %ecx,%ebx
 804fc31:	83 e2 03             	and    $0x3,%edx
 804fc34:	74 10                	je     804fc46 <memcpy+0x2e>
 804fc36:	b9 04 00 00 00       	mov    $0x4,%ecx
 804fc3b:	29 d1                	sub    %edx,%ecx
 804fc3d:	83 e1 03             	and    $0x3,%ecx
 804fc40:	29 cb                	sub    %ecx,%ebx
 804fc42:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 804fc44:	89 d9                	mov    %ebx,%ecx
 804fc46:	c1 e9 02             	shr    $0x2,%ecx
 804fc49:	8d 76 00             	lea    0x0(%esi),%esi
 804fc4c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 804fc4e:	89 d9                	mov    %ebx,%ecx
 804fc50:	83 e1 03             	and    $0x3,%ecx
 804fc53:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 804fc55:	8b 45 08             	mov    0x8(%ebp),%eax
 804fc58:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804fc5b:	5b                   	pop    %ebx
 804fc5c:	5f                   	pop    %edi
 804fc5d:	5e                   	pop    %esi
 804fc5e:	c9                   	leave  
 804fc5f:	c3                   	ret    

0804fc60 <__malloc_lock>:
 804fc60:	55                   	push   %ebp
 804fc61:	89 e5                	mov    %esp,%ebp
 804fc63:	5d                   	pop    %ebp
 804fc64:	c3                   	ret    
 804fc65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fc69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804fc70 <__malloc_unlock>:
 804fc70:	55                   	push   %ebp
 804fc71:	89 e5                	mov    %esp,%ebp
 804fc73:	5d                   	pop    %ebp
 804fc74:	c3                   	ret    
 804fc75:	66 90                	xchg   %ax,%ax
 804fc77:	66 90                	xchg   %ax,%ax
 804fc79:	66 90                	xchg   %ax,%ax
 804fc7b:	66 90                	xchg   %ax,%ax
 804fc7d:	66 90                	xchg   %ax,%ax
 804fc7f:	90                   	nop

0804fc80 <_Balloc>:
 804fc80:	55                   	push   %ebp
 804fc81:	89 e5                	mov    %esp,%ebp
 804fc83:	57                   	push   %edi
 804fc84:	56                   	push   %esi
 804fc85:	53                   	push   %ebx
 804fc86:	83 ec 1c             	sub    $0x1c,%esp
 804fc89:	8b 75 08             	mov    0x8(%ebp),%esi
 804fc8c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804fc8f:	8b 46 4c             	mov    0x4c(%esi),%eax
 804fc92:	85 c0                	test   %eax,%eax
 804fc94:	74 2a                	je     804fcc0 <_Balloc+0x40>
 804fc96:	8d 14 98             	lea    (%eax,%ebx,4),%edx
 804fc99:	8b 02                	mov    (%edx),%eax
 804fc9b:	85 c0                	test   %eax,%eax
 804fc9d:	74 49                	je     804fce8 <_Balloc+0x68>
 804fc9f:	8b 08                	mov    (%eax),%ecx
 804fca1:	89 0a                	mov    %ecx,(%edx)
 804fca3:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
 804fcaa:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 804fcb1:	83 c4 1c             	add    $0x1c,%esp
 804fcb4:	5b                   	pop    %ebx
 804fcb5:	5e                   	pop    %esi
 804fcb6:	5f                   	pop    %edi
 804fcb7:	5d                   	pop    %ebp
 804fcb8:	c3                   	ret    
 804fcb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804fcc0:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
 804fcc7:	00 
 804fcc8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 804fccf:	00 
 804fcd0:	89 34 24             	mov    %esi,(%esp)
 804fcd3:	e8 08 32 00 00       	call   8052ee0 <_calloc_r>
 804fcd8:	85 c0                	test   %eax,%eax
 804fcda:	89 46 4c             	mov    %eax,0x4c(%esi)
 804fcdd:	75 b7                	jne    804fc96 <_Balloc+0x16>
 804fcdf:	31 c0                	xor    %eax,%eax
 804fce1:	eb ce                	jmp    804fcb1 <_Balloc+0x31>
 804fce3:	90                   	nop
 804fce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fce8:	89 d9                	mov    %ebx,%ecx
 804fcea:	bf 01 00 00 00       	mov    $0x1,%edi
 804fcef:	d3 e7                	shl    %cl,%edi
 804fcf1:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
 804fcf8:	89 44 24 08          	mov    %eax,0x8(%esp)
 804fcfc:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804fd03:	00 
 804fd04:	89 34 24             	mov    %esi,(%esp)
 804fd07:	e8 d4 31 00 00       	call   8052ee0 <_calloc_r>
 804fd0c:	85 c0                	test   %eax,%eax
 804fd0e:	74 cf                	je     804fcdf <_Balloc+0x5f>
 804fd10:	89 58 04             	mov    %ebx,0x4(%eax)
 804fd13:	89 78 08             	mov    %edi,0x8(%eax)
 804fd16:	eb 8b                	jmp    804fca3 <_Balloc+0x23>
 804fd18:	90                   	nop
 804fd19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

0804fd20 <_Bfree>:
 804fd20:	55                   	push   %ebp
 804fd21:	89 e5                	mov    %esp,%ebp
 804fd23:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd26:	85 c0                	test   %eax,%eax
 804fd28:	74 12                	je     804fd3c <_Bfree+0x1c>
 804fd2a:	8b 55 08             	mov    0x8(%ebp),%edx
 804fd2d:	8b 48 04             	mov    0x4(%eax),%ecx
 804fd30:	8b 52 4c             	mov    0x4c(%edx),%edx
 804fd33:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
 804fd36:	8b 0a                	mov    (%edx),%ecx
 804fd38:	89 08                	mov    %ecx,(%eax)
 804fd3a:	89 02                	mov    %eax,(%edx)
 804fd3c:	5d                   	pop    %ebp
 804fd3d:	c3                   	ret    
 804fd3e:	66 90                	xchg   %ax,%ax

0804fd40 <__multadd>:
 804fd40:	55                   	push   %ebp
 804fd41:	89 e5                	mov    %esp,%ebp
 804fd43:	57                   	push   %edi
 804fd44:	56                   	push   %esi
 804fd45:	53                   	push   %ebx
 804fd46:	83 ec 2c             	sub    $0x2c,%esp
 804fd49:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd4c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 804fd4f:	8b 40 10             	mov    0x10(%eax),%eax
 804fd52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804fd55:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd58:	8d 78 14             	lea    0x14(%eax),%edi
 804fd5b:	31 c0                	xor    %eax,%eax
 804fd5d:	8d 76 00             	lea    0x0(%esi),%esi
 804fd60:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
 804fd63:	0f b7 d1             	movzwl %cx,%edx
 804fd66:	0f af 55 10          	imul   0x10(%ebp),%edx
 804fd6a:	c1 e9 10             	shr    $0x10,%ecx
 804fd6d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
 804fd71:	01 da                	add    %ebx,%edx
 804fd73:	89 d3                	mov    %edx,%ebx
 804fd75:	0f b7 d2             	movzwl %dx,%edx
 804fd78:	c1 eb 10             	shr    $0x10,%ebx
 804fd7b:	01 d9                	add    %ebx,%ecx
 804fd7d:	89 ce                	mov    %ecx,%esi
 804fd7f:	c1 e1 10             	shl    $0x10,%ecx
 804fd82:	01 d1                	add    %edx,%ecx
 804fd84:	c1 ee 10             	shr    $0x10,%esi
 804fd87:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
 804fd8a:	83 c0 01             	add    $0x1,%eax
 804fd8d:	89 f3                	mov    %esi,%ebx
 804fd8f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 804fd92:	7f cc                	jg     804fd60 <__multadd+0x20>
 804fd94:	85 f6                	test   %esi,%esi
 804fd96:	74 1b                	je     804fdb3 <__multadd+0x73>
 804fd98:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fd9b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 804fd9e:	3b 78 08             	cmp    0x8(%eax),%edi
 804fda1:	7d 1d                	jge    804fdc0 <__multadd+0x80>
 804fda3:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fda6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804fda9:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
 804fdad:	83 c0 01             	add    $0x1,%eax
 804fdb0:	89 47 10             	mov    %eax,0x10(%edi)
 804fdb3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fdb6:	83 c4 2c             	add    $0x2c,%esp
 804fdb9:	5b                   	pop    %ebx
 804fdba:	5e                   	pop    %esi
 804fdbb:	5f                   	pop    %edi
 804fdbc:	5d                   	pop    %ebp
 804fdbd:	c3                   	ret    
 804fdbe:	66 90                	xchg   %ax,%ax
 804fdc0:	8b 40 04             	mov    0x4(%eax),%eax
 804fdc3:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804fdc6:	83 c0 01             	add    $0x1,%eax
 804fdc9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fdcd:	8b 45 08             	mov    0x8(%ebp),%eax
 804fdd0:	89 04 24             	mov    %eax,(%esp)
 804fdd3:	e8 a8 fe ff ff       	call   804fc80 <_Balloc>
 804fdd8:	89 c3                	mov    %eax,%ebx
 804fdda:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fddd:	8b 40 10             	mov    0x10(%eax),%eax
 804fde0:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
 804fde7:	89 44 24 08          	mov    %eax,0x8(%esp)
 804fdeb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fdee:	83 c0 0c             	add    $0xc,%eax
 804fdf1:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fdf5:	8d 43 0c             	lea    0xc(%ebx),%eax
 804fdf8:	89 04 24             	mov    %eax,(%esp)
 804fdfb:	e8 18 fe ff ff       	call   804fc18 <memcpy>
 804fe00:	8b 45 0c             	mov    0xc(%ebp),%eax
 804fe03:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fe06:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 804fe09:	8b 50 04             	mov    0x4(%eax),%edx
 804fe0c:	8b 45 08             	mov    0x8(%ebp),%eax
 804fe0f:	8b 40 4c             	mov    0x4c(%eax),%eax
 804fe12:	8d 04 90             	lea    (%eax,%edx,4),%eax
 804fe15:	8b 10                	mov    (%eax),%edx
 804fe17:	89 17                	mov    %edx,(%edi)
 804fe19:	89 38                	mov    %edi,(%eax)
 804fe1b:	eb 86                	jmp    804fda3 <__multadd+0x63>
 804fe1d:	8d 76 00             	lea    0x0(%esi),%esi

0804fe20 <__s2b>:
 804fe20:	55                   	push   %ebp
 804fe21:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
 804fe26:	89 e5                	mov    %esp,%ebp
 804fe28:	57                   	push   %edi
 804fe29:	56                   	push   %esi
 804fe2a:	53                   	push   %ebx
 804fe2b:	83 ec 2c             	sub    $0x2c,%esp
 804fe2e:	8b 45 14             	mov    0x14(%ebp),%eax
 804fe31:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804fe34:	8b 75 0c             	mov    0xc(%ebp),%esi
 804fe37:	8d 48 08             	lea    0x8(%eax),%ecx
 804fe3a:	89 c8                	mov    %ecx,%eax
 804fe3c:	f7 ea                	imul   %edx
 804fe3e:	c1 f9 1f             	sar    $0x1f,%ecx
 804fe41:	d1 fa                	sar    %edx
 804fe43:	29 ca                	sub    %ecx,%edx
 804fe45:	83 fa 01             	cmp    $0x1,%edx
 804fe48:	0f 8e be 00 00 00    	jle    804ff0c <__s2b+0xec>
 804fe4e:	b8 01 00 00 00       	mov    $0x1,%eax
 804fe53:	31 c9                	xor    %ecx,%ecx
 804fe55:	8d 76 00             	lea    0x0(%esi),%esi
 804fe58:	01 c0                	add    %eax,%eax
 804fe5a:	83 c1 01             	add    $0x1,%ecx
 804fe5d:	39 c2                	cmp    %eax,%edx
 804fe5f:	7f f7                	jg     804fe58 <__s2b+0x38>
 804fe61:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804fe65:	89 1c 24             	mov    %ebx,(%esp)
 804fe68:	e8 13 fe ff ff       	call   804fc80 <_Balloc>
 804fe6d:	8b 55 18             	mov    0x18(%ebp),%edx
 804fe70:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
 804fe74:	89 50 14             	mov    %edx,0x14(%eax)
 804fe77:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 804fe7e:	0f 8e 7c 00 00 00    	jle    804ff00 <__s2b+0xe0>
 804fe84:	8d 4e 09             	lea    0x9(%esi),%ecx
 804fe87:	03 75 10             	add    0x10(%ebp),%esi
 804fe8a:	89 cf                	mov    %ecx,%edi
 804fe8c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 804fe8f:	90                   	nop
 804fe90:	83 c7 01             	add    $0x1,%edi
 804fe93:	0f be 57 ff          	movsbl -0x1(%edi),%edx
 804fe97:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804fe9e:	00 
 804fe9f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fea3:	89 1c 24             	mov    %ebx,(%esp)
 804fea6:	83 ea 30             	sub    $0x30,%edx
 804fea9:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804fead:	e8 8e fe ff ff       	call   804fd40 <__multadd>
 804feb2:	39 f7                	cmp    %esi,%edi
 804feb4:	75 da                	jne    804fe90 <__s2b+0x70>
 804feb6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804feb9:	8b 7d 10             	mov    0x10(%ebp),%edi
 804febc:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
 804fec0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804fec3:	39 4d 14             	cmp    %ecx,0x14(%ebp)
 804fec6:	7e 2e                	jle    804fef6 <__s2b+0xd6>
 804fec8:	8b 7d 14             	mov    0x14(%ebp),%edi
 804fecb:	29 cf                	sub    %ecx,%edi
 804fecd:	01 f7                	add    %esi,%edi
 804fecf:	90                   	nop
 804fed0:	83 c6 01             	add    $0x1,%esi
 804fed3:	0f be 56 ff          	movsbl -0x1(%esi),%edx
 804fed7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 804fede:	00 
 804fedf:	89 44 24 04          	mov    %eax,0x4(%esp)
 804fee3:	89 1c 24             	mov    %ebx,(%esp)
 804fee6:	83 ea 30             	sub    $0x30,%edx
 804fee9:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804feed:	e8 4e fe ff ff       	call   804fd40 <__multadd>
 804fef2:	39 fe                	cmp    %edi,%esi
 804fef4:	75 da                	jne    804fed0 <__s2b+0xb0>
 804fef6:	83 c4 2c             	add    $0x2c,%esp
 804fef9:	5b                   	pop    %ebx
 804fefa:	5e                   	pop    %esi
 804fefb:	5f                   	pop    %edi
 804fefc:	5d                   	pop    %ebp
 804fefd:	c3                   	ret    
 804fefe:	66 90                	xchg   %ax,%ax
 804ff00:	83 c6 0a             	add    $0xa,%esi
 804ff03:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
 804ff0a:	eb b4                	jmp    804fec0 <__s2b+0xa0>
 804ff0c:	31 c9                	xor    %ecx,%ecx
 804ff0e:	e9 4e ff ff ff       	jmp    804fe61 <__s2b+0x41>
 804ff13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ff19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

0804ff20 <__hi0bits>:
 804ff20:	55                   	push   %ebp
 804ff21:	31 c9                	xor    %ecx,%ecx
 804ff23:	89 e5                	mov    %esp,%ebp
 804ff25:	8b 55 08             	mov    0x8(%ebp),%edx
 804ff28:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
 804ff2e:	75 05                	jne    804ff35 <__hi0bits+0x15>
 804ff30:	c1 e2 10             	shl    $0x10,%edx
 804ff33:	b1 10                	mov    $0x10,%cl
 804ff35:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804ff3b:	75 06                	jne    804ff43 <__hi0bits+0x23>
 804ff3d:	83 c1 08             	add    $0x8,%ecx
 804ff40:	c1 e2 08             	shl    $0x8,%edx
 804ff43:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
 804ff49:	75 06                	jne    804ff51 <__hi0bits+0x31>
 804ff4b:	83 c1 04             	add    $0x4,%ecx
 804ff4e:	c1 e2 04             	shl    $0x4,%edx
 804ff51:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
 804ff57:	75 06                	jne    804ff5f <__hi0bits+0x3f>
 804ff59:	83 c1 02             	add    $0x2,%ecx
 804ff5c:	c1 e2 02             	shl    $0x2,%edx
 804ff5f:	85 d2                	test   %edx,%edx
 804ff61:	89 c8                	mov    %ecx,%eax
 804ff63:	78 0d                	js     804ff72 <__hi0bits+0x52>
 804ff65:	81 e2 00 00 00 40    	and    $0x40000000,%edx
 804ff6b:	b8 20 00 00 00       	mov    $0x20,%eax
 804ff70:	75 06                	jne    804ff78 <__hi0bits+0x58>
 804ff72:	5d                   	pop    %ebp
 804ff73:	c3                   	ret    
 804ff74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804ff78:	8d 41 01             	lea    0x1(%ecx),%eax
 804ff7b:	5d                   	pop    %ebp
 804ff7c:	c3                   	ret    
 804ff7d:	8d 76 00             	lea    0x0(%esi),%esi

0804ff80 <__lo0bits>:
 804ff80:	55                   	push   %ebp
 804ff81:	89 e5                	mov    %esp,%ebp
 804ff83:	53                   	push   %ebx
 804ff84:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804ff87:	8b 13                	mov    (%ebx),%edx
 804ff89:	f6 c2 07             	test   $0x7,%dl
 804ff8c:	74 1a                	je     804ffa8 <__lo0bits+0x28>
 804ff8e:	31 c0                	xor    %eax,%eax
 804ff90:	f6 c2 01             	test   $0x1,%dl
 804ff93:	75 0f                	jne    804ffa4 <__lo0bits+0x24>
 804ff95:	f6 c2 02             	test   $0x2,%dl
 804ff98:	75 56                	jne    804fff0 <__lo0bits+0x70>
 804ff9a:	c1 ea 02             	shr    $0x2,%edx
 804ff9d:	b8 02 00 00 00       	mov    $0x2,%eax
 804ffa2:	89 13                	mov    %edx,(%ebx)
 804ffa4:	5b                   	pop    %ebx
 804ffa5:	5d                   	pop    %ebp
 804ffa6:	c3                   	ret    
 804ffa7:	90                   	nop
 804ffa8:	31 c9                	xor    %ecx,%ecx
 804ffaa:	66 85 d2             	test   %dx,%dx
 804ffad:	75 05                	jne    804ffb4 <__lo0bits+0x34>
 804ffaf:	c1 ea 10             	shr    $0x10,%edx
 804ffb2:	b1 10                	mov    $0x10,%cl
 804ffb4:	84 d2                	test   %dl,%dl
 804ffb6:	75 06                	jne    804ffbe <__lo0bits+0x3e>
 804ffb8:	83 c1 08             	add    $0x8,%ecx
 804ffbb:	c1 ea 08             	shr    $0x8,%edx
 804ffbe:	f6 c2 0f             	test   $0xf,%dl
 804ffc1:	75 06                	jne    804ffc9 <__lo0bits+0x49>
 804ffc3:	83 c1 04             	add    $0x4,%ecx
 804ffc6:	c1 ea 04             	shr    $0x4,%edx
 804ffc9:	f6 c2 03             	test   $0x3,%dl
 804ffcc:	75 06                	jne    804ffd4 <__lo0bits+0x54>
 804ffce:	83 c1 02             	add    $0x2,%ecx
 804ffd1:	c1 ea 02             	shr    $0x2,%edx
 804ffd4:	f6 c2 01             	test   $0x1,%dl
 804ffd7:	75 0c                	jne    804ffe5 <__lo0bits+0x65>
 804ffd9:	d1 ea                	shr    %edx
 804ffdb:	b8 20 00 00 00       	mov    $0x20,%eax
 804ffe0:	74 c2                	je     804ffa4 <__lo0bits+0x24>
 804ffe2:	83 c1 01             	add    $0x1,%ecx
 804ffe5:	89 13                	mov    %edx,(%ebx)
 804ffe7:	89 c8                	mov    %ecx,%eax
 804ffe9:	5b                   	pop    %ebx
 804ffea:	5d                   	pop    %ebp
 804ffeb:	c3                   	ret    
 804ffec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 804fff0:	d1 ea                	shr    %edx
 804fff2:	b0 01                	mov    $0x1,%al
 804fff4:	89 13                	mov    %edx,(%ebx)
 804fff6:	5b                   	pop    %ebx
 804fff7:	5d                   	pop    %ebp
 804fff8:	c3                   	ret    
 804fff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08050000 <__i2b>:
 8050000:	55                   	push   %ebp
 8050001:	89 e5                	mov    %esp,%ebp
 8050003:	83 ec 18             	sub    $0x18,%esp
 8050006:	8b 45 08             	mov    0x8(%ebp),%eax
 8050009:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8050010:	00 
 8050011:	89 04 24             	mov    %eax,(%esp)
 8050014:	e8 67 fc ff ff       	call   804fc80 <_Balloc>
 8050019:	8b 55 0c             	mov    0xc(%ebp),%edx
 805001c:	89 50 14             	mov    %edx,0x14(%eax)
 805001f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 8050026:	c9                   	leave  
 8050027:	c3                   	ret    
 8050028:	90                   	nop
 8050029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08050030 <__multiply>:
 8050030:	55                   	push   %ebp
 8050031:	89 e5                	mov    %esp,%ebp
 8050033:	57                   	push   %edi
 8050034:	56                   	push   %esi
 8050035:	53                   	push   %ebx
 8050036:	83 ec 3c             	sub    $0x3c,%esp
 8050039:	8b 75 0c             	mov    0xc(%ebp),%esi
 805003c:	8b 45 10             	mov    0x10(%ebp),%eax
 805003f:	8b 7e 10             	mov    0x10(%esi),%edi
 8050042:	8b 58 10             	mov    0x10(%eax),%ebx
 8050045:	39 df                	cmp    %ebx,%edi
 8050047:	7d 0e                	jge    8050057 <__multiply+0x27>
 8050049:	89 f8                	mov    %edi,%eax
 805004b:	89 df                	mov    %ebx,%edi
 805004d:	89 c3                	mov    %eax,%ebx
 805004f:	89 f0                	mov    %esi,%eax
 8050051:	8b 75 10             	mov    0x10(%ebp),%esi
 8050054:	89 45 10             	mov    %eax,0x10(%ebp)
 8050057:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
 805005a:	3b 46 08             	cmp    0x8(%esi),%eax
 805005d:	89 45 c8             	mov    %eax,-0x38(%ebp)
 8050060:	0f 9f c0             	setg   %al
 8050063:	0f b6 c0             	movzbl %al,%eax
 8050066:	03 46 04             	add    0x4(%esi),%eax
 8050069:	89 44 24 04          	mov    %eax,0x4(%esp)
 805006d:	8b 45 08             	mov    0x8(%ebp),%eax
 8050070:	89 04 24             	mov    %eax,(%esp)
 8050073:	e8 08 fc ff ff       	call   804fc80 <_Balloc>
 8050078:	8b 55 c8             	mov    -0x38(%ebp),%edx
 805007b:	89 45 c0             	mov    %eax,-0x40(%ebp)
 805007e:	8d 40 14             	lea    0x14(%eax),%eax
 8050081:	8d 14 90             	lea    (%eax,%edx,4),%edx
 8050084:	89 d1                	mov    %edx,%ecx
 8050086:	39 c8                	cmp    %ecx,%eax
 8050088:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 805008b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 805008e:	73 15                	jae    80500a5 <__multiply+0x75>
 8050090:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 8050093:	90                   	nop
 8050094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050098:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 805009e:	83 c0 04             	add    $0x4,%eax
 80500a1:	39 c2                	cmp    %eax,%edx
 80500a3:	77 f3                	ja     8050098 <__multiply+0x68>
 80500a5:	8d 46 14             	lea    0x14(%esi),%eax
 80500a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 80500ab:	8d 04 b8             	lea    (%eax,%edi,4),%eax
 80500ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80500b1:	8b 45 10             	mov    0x10(%ebp),%eax
 80500b4:	83 c0 14             	add    $0x14,%eax
 80500b7:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
 80500ba:	39 f8                	cmp    %edi,%eax
 80500bc:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80500bf:	89 7d cc             	mov    %edi,-0x34(%ebp)
 80500c2:	0f 83 e8 00 00 00    	jae    80501b0 <__multiply+0x180>
 80500c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80500cb:	8b 00                	mov    (%eax),%eax
 80500cd:	0f b7 f8             	movzwl %ax,%edi
 80500d0:	85 ff                	test   %edi,%edi
 80500d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80500d5:	74 5a                	je     8050131 <__multiply+0x101>
 80500d7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80500da:	31 db                	xor    %ebx,%ebx
 80500dc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80500df:	eb 09                	jmp    80500ea <__multiply+0xba>
 80500e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80500e8:	89 fa                	mov    %edi,%edx
 80500ea:	8b 0e                	mov    (%esi),%ecx
 80500ec:	83 c6 04             	add    $0x4,%esi
 80500ef:	0f b7 3a             	movzwl (%edx),%edi
 80500f2:	0f b7 c1             	movzwl %cx,%eax
 80500f5:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
 80500f9:	c1 e9 10             	shr    $0x10,%ecx
 80500fc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
 8050100:	01 f8                	add    %edi,%eax
 8050102:	01 d8                	add    %ebx,%eax
 8050104:	8b 1a                	mov    (%edx),%ebx
 8050106:	8d 7a 04             	lea    0x4(%edx),%edi
 8050109:	c1 eb 10             	shr    $0x10,%ebx
 805010c:	01 d9                	add    %ebx,%ecx
 805010e:	89 c3                	mov    %eax,%ebx
 8050110:	c1 eb 10             	shr    $0x10,%ebx
 8050113:	0f b7 c0             	movzwl %ax,%eax
 8050116:	01 d9                	add    %ebx,%ecx
 8050118:	89 cb                	mov    %ecx,%ebx
 805011a:	c1 e1 10             	shl    $0x10,%ecx
 805011d:	09 c1                	or     %eax,%ecx
 805011f:	c1 eb 10             	shr    $0x10,%ebx
 8050122:	39 75 dc             	cmp    %esi,-0x24(%ebp)
 8050125:	89 0a                	mov    %ecx,(%edx)
 8050127:	77 bf                	ja     80500e8 <__multiply+0xb8>
 8050129:	8b 45 d8             	mov    -0x28(%ebp),%eax
 805012c:	89 5a 04             	mov    %ebx,0x4(%edx)
 805012f:	8b 00                	mov    (%eax),%eax
 8050131:	c1 e8 10             	shr    $0x10,%eax
 8050134:	85 c0                	test   %eax,%eax
 8050136:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8050139:	74 61                	je     805019c <__multiply+0x16c>
 805013b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 805013e:	31 ff                	xor    %edi,%edi
 8050140:	89 fe                	mov    %edi,%esi
 8050142:	8b 10                	mov    (%eax),%edx
 8050144:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050147:	8b 45 d0             	mov    -0x30(%ebp),%eax
 805014a:	89 d3                	mov    %edx,%ebx
 805014c:	eb 05                	jmp    8050153 <__multiply+0x123>
 805014e:	66 90                	xchg   %ax,%ax
 8050150:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8050153:	0f b7 08             	movzwl (%eax),%ecx
 8050156:	c1 eb 10             	shr    $0x10,%ebx
 8050159:	0f b7 d2             	movzwl %dx,%edx
 805015c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
 8050160:	83 c0 04             	add    $0x4,%eax
 8050163:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
 8050166:	01 f7                	add    %esi,%edi
 8050168:	8b 75 e0             	mov    -0x20(%ebp),%esi
 805016b:	89 fb                	mov    %edi,%ebx
 805016d:	c1 e3 10             	shl    $0x10,%ebx
 8050170:	09 d3                	or     %edx,%ebx
 8050172:	89 1e                	mov    %ebx,(%esi)
 8050174:	8b 5e 04             	mov    0x4(%esi),%ebx
 8050177:	8d 4e 04             	lea    0x4(%esi),%ecx
 805017a:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
 805017e:	c1 ef 10             	shr    $0x10,%edi
 8050181:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
 8050185:	0f b7 f3             	movzwl %bx,%esi
 8050188:	01 f2                	add    %esi,%edx
 805018a:	01 fa                	add    %edi,%edx
 805018c:	89 d6                	mov    %edx,%esi
 805018e:	c1 ee 10             	shr    $0x10,%esi
 8050191:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 8050194:	77 ba                	ja     8050150 <__multiply+0x120>
 8050196:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8050199:	89 50 04             	mov    %edx,0x4(%eax)
 805019c:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
 80501a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80501a3:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 80501a7:	39 45 cc             	cmp    %eax,-0x34(%ebp)
 80501aa:	0f 87 18 ff ff ff    	ja     80500c8 <__multiply+0x98>
 80501b0:	8b 75 c8             	mov    -0x38(%ebp),%esi
 80501b3:	85 f6                	test   %esi,%esi
 80501b5:	7e 29                	jle    80501e0 <__multiply+0x1b0>
 80501b7:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 80501ba:	8b 5f fc             	mov    -0x4(%edi),%ebx
 80501bd:	85 db                	test   %ebx,%ebx
 80501bf:	75 1f                	jne    80501e0 <__multiply+0x1b0>
 80501c1:	8b 55 c8             	mov    -0x38(%ebp),%edx
 80501c4:	89 d0                	mov    %edx,%eax
 80501c6:	c1 e0 02             	shl    $0x2,%eax
 80501c9:	29 c7                	sub    %eax,%edi
 80501cb:	89 f8                	mov    %edi,%eax
 80501cd:	eb 09                	jmp    80501d8 <__multiply+0x1a8>
 80501cf:	90                   	nop
 80501d0:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
 80501d4:	85 c9                	test   %ecx,%ecx
 80501d6:	75 05                	jne    80501dd <__multiply+0x1ad>
 80501d8:	83 ea 01             	sub    $0x1,%edx
 80501db:	75 f3                	jne    80501d0 <__multiply+0x1a0>
 80501dd:	89 55 c8             	mov    %edx,-0x38(%ebp)
 80501e0:	8b 45 c0             	mov    -0x40(%ebp),%eax
 80501e3:	8b 7d c8             	mov    -0x38(%ebp),%edi
 80501e6:	89 78 10             	mov    %edi,0x10(%eax)
 80501e9:	83 c4 3c             	add    $0x3c,%esp
 80501ec:	5b                   	pop    %ebx
 80501ed:	5e                   	pop    %esi
 80501ee:	5f                   	pop    %edi
 80501ef:	5d                   	pop    %ebp
 80501f0:	c3                   	ret    
 80501f1:	eb 0d                	jmp    8050200 <__pow5mult>
 80501f3:	90                   	nop
 80501f4:	90                   	nop
 80501f5:	90                   	nop
 80501f6:	90                   	nop
 80501f7:	90                   	nop
 80501f8:	90                   	nop
 80501f9:	90                   	nop
 80501fa:	90                   	nop
 80501fb:	90                   	nop
 80501fc:	90                   	nop
 80501fd:	90                   	nop
 80501fe:	90                   	nop
 80501ff:	90                   	nop

08050200 <__pow5mult>:
 8050200:	55                   	push   %ebp
 8050201:	89 e5                	mov    %esp,%ebp
 8050203:	57                   	push   %edi
 8050204:	56                   	push   %esi
 8050205:	53                   	push   %ebx
 8050206:	83 ec 2c             	sub    $0x2c,%esp
 8050209:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805020c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805020f:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8050212:	89 d8                	mov    %ebx,%eax
 8050214:	83 e0 03             	and    $0x3,%eax
 8050217:	0f 85 a3 00 00 00    	jne    80502c0 <__pow5mult+0xc0>
 805021d:	c1 fb 02             	sar    $0x2,%ebx
 8050220:	85 db                	test   %ebx,%ebx
 8050222:	74 5c                	je     8050280 <__pow5mult+0x80>
 8050224:	8b 71 48             	mov    0x48(%ecx),%esi
 8050227:	85 f6                	test   %esi,%esi
 8050229:	0f 84 bd 00 00 00    	je     80502ec <__pow5mult+0xec>
 805022f:	f6 c3 01             	test   $0x1,%bl
 8050232:	75 15                	jne    8050249 <__pow5mult+0x49>
 8050234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050238:	d1 fb                	sar    %ebx
 805023a:	74 44                	je     8050280 <__pow5mult+0x80>
 805023c:	8b 06                	mov    (%esi),%eax
 805023e:	85 c0                	test   %eax,%eax
 8050240:	74 4e                	je     8050290 <__pow5mult+0x90>
 8050242:	89 c6                	mov    %eax,%esi
 8050244:	f6 c3 01             	test   $0x1,%bl
 8050247:	74 ef                	je     8050238 <__pow5mult+0x38>
 8050249:	89 0c 24             	mov    %ecx,(%esp)
 805024c:	89 74 24 08          	mov    %esi,0x8(%esp)
 8050250:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8050254:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050257:	e8 d4 fd ff ff       	call   8050030 <__multiply>
 805025c:	85 ff                	test   %edi,%edi
 805025e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050261:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050264:	74 52                	je     80502b8 <__pow5mult+0xb8>
 8050266:	8b 57 04             	mov    0x4(%edi),%edx
 8050269:	d1 fb                	sar    %ebx
 805026b:	8b 41 4c             	mov    0x4c(%ecx),%eax
 805026e:	8d 04 90             	lea    (%eax,%edx,4),%eax
 8050271:	8b 10                	mov    (%eax),%edx
 8050273:	89 17                	mov    %edx,(%edi)
 8050275:	89 38                	mov    %edi,(%eax)
 8050277:	8b 7d e0             	mov    -0x20(%ebp),%edi
 805027a:	75 c0                	jne    805023c <__pow5mult+0x3c>
 805027c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050280:	83 c4 2c             	add    $0x2c,%esp
 8050283:	89 f8                	mov    %edi,%eax
 8050285:	5b                   	pop    %ebx
 8050286:	5e                   	pop    %esi
 8050287:	5f                   	pop    %edi
 8050288:	5d                   	pop    %ebp
 8050289:	c3                   	ret    
 805028a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050290:	89 74 24 08          	mov    %esi,0x8(%esp)
 8050294:	89 74 24 04          	mov    %esi,0x4(%esp)
 8050298:	89 0c 24             	mov    %ecx,(%esp)
 805029b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 805029e:	e8 8d fd ff ff       	call   8050030 <__multiply>
 80502a3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80502a6:	89 06                	mov    %eax,(%esi)
 80502a8:	89 c6                	mov    %eax,%esi
 80502aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 80502b0:	eb 92                	jmp    8050244 <__pow5mult+0x44>
 80502b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80502b8:	8b 7d e0             	mov    -0x20(%ebp),%edi
 80502bb:	e9 78 ff ff ff       	jmp    8050238 <__pow5mult+0x38>
 80502c0:	8b 04 85 7c 49 05 08 	mov    0x805497c(,%eax,4),%eax
 80502c7:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80502cb:	89 0c 24             	mov    %ecx,(%esp)
 80502ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 80502d5:	00 
 80502d6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80502da:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 80502dd:	e8 5e fa ff ff       	call   804fd40 <__multadd>
 80502e2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80502e5:	89 c7                	mov    %eax,%edi
 80502e7:	e9 31 ff ff ff       	jmp    805021d <__pow5mult+0x1d>
 80502ec:	89 0c 24             	mov    %ecx,(%esp)
 80502ef:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80502f6:	00 
 80502f7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 80502fa:	e8 81 f9 ff ff       	call   804fc80 <_Balloc>
 80502ff:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050302:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
 8050309:	89 c6                	mov    %eax,%esi
 805030b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 8050312:	89 41 48             	mov    %eax,0x48(%ecx)
 8050315:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 805031b:	e9 0f ff ff ff       	jmp    805022f <__pow5mult+0x2f>

08050320 <__lshift>:
 8050320:	55                   	push   %ebp
 8050321:	89 e5                	mov    %esp,%ebp
 8050323:	57                   	push   %edi
 8050324:	56                   	push   %esi
 8050325:	53                   	push   %ebx
 8050326:	83 ec 2c             	sub    $0x2c,%esp
 8050329:	8b 45 0c             	mov    0xc(%ebp),%eax
 805032c:	8b 75 10             	mov    0x10(%ebp),%esi
 805032f:	89 c7                	mov    %eax,%edi
 8050331:	8b 50 04             	mov    0x4(%eax),%edx
 8050334:	8b 40 10             	mov    0x10(%eax),%eax
 8050337:	89 f3                	mov    %esi,%ebx
 8050339:	c1 fb 05             	sar    $0x5,%ebx
 805033c:	01 d8                	add    %ebx,%eax
 805033e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8050341:	83 c0 01             	add    $0x1,%eax
 8050344:	89 c1                	mov    %eax,%ecx
 8050346:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8050349:	8b 47 08             	mov    0x8(%edi),%eax
 805034c:	39 c1                	cmp    %eax,%ecx
 805034e:	7e 09                	jle    8050359 <__lshift+0x39>
 8050350:	01 c0                	add    %eax,%eax
 8050352:	83 c2 01             	add    $0x1,%edx
 8050355:	39 c1                	cmp    %eax,%ecx
 8050357:	7f f7                	jg     8050350 <__lshift+0x30>
 8050359:	8b 45 08             	mov    0x8(%ebp),%eax
 805035c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8050360:	89 04 24             	mov    %eax,(%esp)
 8050363:	e8 18 f9 ff ff       	call   804fc80 <_Balloc>
 8050368:	85 db                	test   %ebx,%ebx
 805036a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 805036d:	8d 50 14             	lea    0x14(%eax),%edx
 8050370:	7e 17                	jle    8050389 <__lshift+0x69>
 8050372:	31 c0                	xor    %eax,%eax
 8050374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050378:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
 805037f:	83 c0 01             	add    $0x1,%eax
 8050382:	39 d8                	cmp    %ebx,%eax
 8050384:	75 f2                	jne    8050378 <__lshift+0x58>
 8050386:	8d 14 82             	lea    (%edx,%eax,4),%edx
 8050389:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805038c:	8b 45 0c             	mov    0xc(%ebp),%eax
 805038f:	8b 4f 10             	mov    0x10(%edi),%ecx
 8050392:	83 c0 14             	add    $0x14,%eax
 8050395:	83 e6 1f             	and    $0x1f,%esi
 8050398:	89 75 e0             	mov    %esi,-0x20(%ebp)
 805039b:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
 805039e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80503a1:	74 7d                	je     8050420 <__lshift+0x100>
 80503a3:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
 80503aa:	29 75 dc             	sub    %esi,-0x24(%ebp)
 80503ad:	31 f6                	xor    %esi,%esi
 80503af:	eb 09                	jmp    80503ba <__lshift+0x9a>
 80503b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80503b8:	89 fa                	mov    %edi,%edx
 80503ba:	8b 18                	mov    (%eax),%ebx
 80503bc:	83 c0 04             	add    $0x4,%eax
 80503bf:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 80503c3:	8d 7a 04             	lea    0x4(%edx),%edi
 80503c6:	d3 e3                	shl    %cl,%ebx
 80503c8:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
 80503cc:	09 f3                	or     %esi,%ebx
 80503ce:	89 1a                	mov    %ebx,(%edx)
 80503d0:	8b 70 fc             	mov    -0x4(%eax),%esi
 80503d3:	d3 ee                	shr    %cl,%esi
 80503d5:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 80503d8:	77 de                	ja     80503b8 <__lshift+0x98>
 80503da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80503dd:	89 72 04             	mov    %esi,0x4(%edx)
 80503e0:	83 c0 02             	add    $0x2,%eax
 80503e3:	85 f6                	test   %esi,%esi
 80503e5:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
 80503e9:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80503ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80503ef:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 80503f2:	8b 75 0c             	mov    0xc(%ebp),%esi
 80503f5:	83 e8 01             	sub    $0x1,%eax
 80503f8:	89 47 10             	mov    %eax,0x10(%edi)
 80503fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80503fe:	8b 50 04             	mov    0x4(%eax),%edx
 8050401:	8b 45 08             	mov    0x8(%ebp),%eax
 8050404:	8b 40 4c             	mov    0x4c(%eax),%eax
 8050407:	8d 04 90             	lea    (%eax,%edx,4),%eax
 805040a:	8b 10                	mov    (%eax),%edx
 805040c:	89 16                	mov    %edx,(%esi)
 805040e:	89 30                	mov    %esi,(%eax)
 8050410:	83 c4 2c             	add    $0x2c,%esp
 8050413:	89 f8                	mov    %edi,%eax
 8050415:	5b                   	pop    %ebx
 8050416:	5e                   	pop    %esi
 8050417:	5f                   	pop    %edi
 8050418:	5d                   	pop    %ebp
 8050419:	c3                   	ret    
 805041a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050420:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 8050423:	90                   	nop
 8050424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050428:	83 c0 04             	add    $0x4,%eax
 805042b:	8b 48 fc             	mov    -0x4(%eax),%ecx
 805042e:	83 c2 04             	add    $0x4,%edx
 8050431:	39 c3                	cmp    %eax,%ebx
 8050433:	89 4a fc             	mov    %ecx,-0x4(%edx)
 8050436:	77 f0                	ja     8050428 <__lshift+0x108>
 8050438:	eb b2                	jmp    80503ec <__lshift+0xcc>
 805043a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08050440 <__mcmp>:
 8050440:	55                   	push   %ebp
 8050441:	89 e5                	mov    %esp,%ebp
 8050443:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8050446:	8b 55 0c             	mov    0xc(%ebp),%edx
 8050449:	53                   	push   %ebx
 805044a:	8b 41 10             	mov    0x10(%ecx),%eax
 805044d:	8b 5a 10             	mov    0x10(%edx),%ebx
 8050450:	29 d8                	sub    %ebx,%eax
 8050452:	85 c0                	test   %eax,%eax
 8050454:	75 27                	jne    805047d <__mcmp+0x3d>
 8050456:	c1 e3 02             	shl    $0x2,%ebx
 8050459:	83 c1 14             	add    $0x14,%ecx
 805045c:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
 805045f:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
 8050463:	eb 07                	jmp    805046c <__mcmp+0x2c>
 8050465:	8d 76 00             	lea    0x0(%esi),%esi
 8050468:	39 c1                	cmp    %eax,%ecx
 805046a:	73 14                	jae    8050480 <__mcmp+0x40>
 805046c:	83 ea 04             	sub    $0x4,%edx
 805046f:	83 e8 04             	sub    $0x4,%eax
 8050472:	8b 1a                	mov    (%edx),%ebx
 8050474:	39 18                	cmp    %ebx,(%eax)
 8050476:	74 f0                	je     8050468 <__mcmp+0x28>
 8050478:	19 c0                	sbb    %eax,%eax
 805047a:	83 c8 01             	or     $0x1,%eax
 805047d:	5b                   	pop    %ebx
 805047e:	5d                   	pop    %ebp
 805047f:	c3                   	ret    
 8050480:	31 c0                	xor    %eax,%eax
 8050482:	5b                   	pop    %ebx
 8050483:	5d                   	pop    %ebp
 8050484:	c3                   	ret    
 8050485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08050490 <__mdiff>:
 8050490:	55                   	push   %ebp
 8050491:	89 e5                	mov    %esp,%ebp
 8050493:	57                   	push   %edi
 8050494:	56                   	push   %esi
 8050495:	53                   	push   %ebx
 8050496:	83 ec 2c             	sub    $0x2c,%esp
 8050499:	8b 75 0c             	mov    0xc(%ebp),%esi
 805049c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805049f:	89 34 24             	mov    %esi,(%esp)
 80504a2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80504a6:	e8 95 ff ff ff       	call   8050440 <__mcmp>
 80504ab:	85 c0                	test   %eax,%eax
 80504ad:	0f 84 25 01 00 00    	je     80505d8 <__mdiff+0x148>
 80504b3:	0f 88 0f 01 00 00    	js     80505c8 <__mdiff+0x138>
 80504b9:	31 ff                	xor    %edi,%edi
 80504bb:	8b 46 04             	mov    0x4(%esi),%eax
 80504be:	83 c6 14             	add    $0x14,%esi
 80504c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80504c5:	8b 45 08             	mov    0x8(%ebp),%eax
 80504c8:	89 04 24             	mov    %eax,(%esp)
 80504cb:	e8 b0 f7 ff ff       	call   804fc80 <_Balloc>
 80504d0:	8d 4b 14             	lea    0x14(%ebx),%ecx
 80504d3:	89 c2                	mov    %eax,%edx
 80504d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80504d8:	89 78 0c             	mov    %edi,0xc(%eax)
 80504db:	8b 46 fc             	mov    -0x4(%esi),%eax
 80504de:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 80504e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80504e4:	8d 04 86             	lea    (%esi,%eax,4),%eax
 80504e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80504ea:	8b 43 10             	mov    0x10(%ebx),%eax
 80504ed:	31 db                	xor    %ebx,%ebx
 80504ef:	8d 04 81             	lea    (%ecx,%eax,4),%eax
 80504f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80504f5:	89 d0                	mov    %edx,%eax
 80504f7:	83 c0 14             	add    $0x14,%eax
 80504fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050500:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8050503:	83 c0 04             	add    $0x4,%eax
 8050506:	83 c1 04             	add    $0x4,%ecx
 8050509:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 805050d:	8b 3e                	mov    (%esi),%edi
 805050f:	8b 71 fc             	mov    -0x4(%ecx),%esi
 8050512:	0f b7 d7             	movzwl %di,%edx
 8050515:	01 da                	add    %ebx,%edx
 8050517:	0f b7 de             	movzwl %si,%ebx
 805051a:	29 da                	sub    %ebx,%edx
 805051c:	c1 ef 10             	shr    $0x10,%edi
 805051f:	89 d3                	mov    %edx,%ebx
 8050521:	c1 ee 10             	shr    $0x10,%esi
 8050524:	0f b7 d2             	movzwl %dx,%edx
 8050527:	c1 fb 10             	sar    $0x10,%ebx
 805052a:	29 f7                	sub    %esi,%edi
 805052c:	01 df                	add    %ebx,%edi
 805052e:	89 fb                	mov    %edi,%ebx
 8050530:	c1 e7 10             	shl    $0x10,%edi
 8050533:	09 d7                	or     %edx,%edi
 8050535:	c1 fb 10             	sar    $0x10,%ebx
 8050538:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
 805053b:	89 78 fc             	mov    %edi,-0x4(%eax)
 805053e:	77 c0                	ja     8050500 <__mdiff+0x70>
 8050540:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8050543:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 8050546:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8050549:	89 75 e0             	mov    %esi,-0x20(%ebp)
 805054c:	39 f1                	cmp    %esi,%ecx
 805054e:	76 3f                	jbe    805058f <__mdiff+0xff>
 8050550:	8b 3e                	mov    (%esi),%edi
 8050552:	83 c6 04             	add    $0x4,%esi
 8050555:	83 c0 04             	add    $0x4,%eax
 8050558:	0f b7 d7             	movzwl %di,%edx
 805055b:	01 da                	add    %ebx,%edx
 805055d:	89 d3                	mov    %edx,%ebx
 805055f:	0f b7 d2             	movzwl %dx,%edx
 8050562:	c1 fb 10             	sar    $0x10,%ebx
 8050565:	c1 ef 10             	shr    $0x10,%edi
 8050568:	01 df                	add    %ebx,%edi
 805056a:	89 fb                	mov    %edi,%ebx
 805056c:	c1 e7 10             	shl    $0x10,%edi
 805056f:	09 d7                	or     %edx,%edi
 8050571:	c1 fb 10             	sar    $0x10,%ebx
 8050574:	39 f1                	cmp    %esi,%ecx
 8050576:	89 78 fc             	mov    %edi,-0x4(%eax)
 8050579:	77 d5                	ja     8050550 <__mdiff+0xc0>
 805057b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 805057e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 8050581:	f7 d0                	not    %eax
 8050583:	01 c8                	add    %ecx,%eax
 8050585:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050588:	c1 e8 02             	shr    $0x2,%eax
 805058b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
 805058f:	85 ff                	test   %edi,%edi
 8050591:	75 23                	jne    80505b6 <__mdiff+0x126>
 8050593:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8050596:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
 805059d:	29 d0                	sub    %edx,%eax
 805059f:	89 ca                	mov    %ecx,%edx
 80505a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80505a8:	83 ea 01             	sub    $0x1,%edx
 80505ab:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
 80505af:	85 c9                	test   %ecx,%ecx
 80505b1:	74 f5                	je     80505a8 <__mdiff+0x118>
 80505b3:	89 55 dc             	mov    %edx,-0x24(%ebp)
 80505b6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80505b9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 80505bc:	89 48 10             	mov    %ecx,0x10(%eax)
 80505bf:	83 c4 2c             	add    $0x2c,%esp
 80505c2:	5b                   	pop    %ebx
 80505c3:	5e                   	pop    %esi
 80505c4:	5f                   	pop    %edi
 80505c5:	5d                   	pop    %ebp
 80505c6:	c3                   	ret    
 80505c7:	90                   	nop
 80505c8:	89 f0                	mov    %esi,%eax
 80505ca:	bf 01 00 00 00       	mov    $0x1,%edi
 80505cf:	89 de                	mov    %ebx,%esi
 80505d1:	89 c3                	mov    %eax,%ebx
 80505d3:	e9 e3 fe ff ff       	jmp    80504bb <__mdiff+0x2b>
 80505d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80505db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80505e2:	00 
 80505e3:	89 04 24             	mov    %eax,(%esp)
 80505e6:	e8 95 f6 ff ff       	call   804fc80 <_Balloc>
 80505eb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
 80505f2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80505f9:	83 c4 2c             	add    $0x2c,%esp
 80505fc:	5b                   	pop    %ebx
 80505fd:	5e                   	pop    %esi
 80505fe:	5f                   	pop    %edi
 80505ff:	5d                   	pop    %ebp
 8050600:	c3                   	ret    
 8050601:	eb 0d                	jmp    8050610 <__ulp>
 8050603:	90                   	nop
 8050604:	90                   	nop
 8050605:	90                   	nop
 8050606:	90                   	nop
 8050607:	90                   	nop
 8050608:	90                   	nop
 8050609:	90                   	nop
 805060a:	90                   	nop
 805060b:	90                   	nop
 805060c:	90                   	nop
 805060d:	90                   	nop
 805060e:	90                   	nop
 805060f:	90                   	nop

08050610 <__ulp>:
 8050610:	55                   	push   %ebp
 8050611:	89 e5                	mov    %esp,%ebp
 8050613:	83 ec 08             	sub    $0x8,%esp
 8050616:	dd 45 08             	fldl   0x8(%ebp)
 8050619:	dd 5d f8             	fstpl  -0x8(%ebp)
 805061c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 805061f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
 8050625:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
 805062b:	85 c9                	test   %ecx,%ecx
 805062d:	7e 11                	jle    8050640 <__ulp+0x30>
 805062f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8050632:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8050639:	dd 45 f8             	fldl   -0x8(%ebp)
 805063c:	c9                   	leave  
 805063d:	c3                   	ret    
 805063e:	66 90                	xchg   %ax,%ax
 8050640:	f7 d9                	neg    %ecx
 8050642:	c1 f9 14             	sar    $0x14,%ecx
 8050645:	83 f9 13             	cmp    $0x13,%ecx
 8050648:	7e 26                	jle    8050670 <__ulp+0x60>
 805064a:	83 f9 32             	cmp    $0x32,%ecx
 805064d:	b8 01 00 00 00       	mov    $0x1,%eax
 8050652:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8050659:	7f 0b                	jg     8050666 <__ulp+0x56>
 805065b:	ba 33 00 00 00       	mov    $0x33,%edx
 8050660:	29 ca                	sub    %ecx,%edx
 8050662:	89 d1                	mov    %edx,%ecx
 8050664:	d3 e0                	shl    %cl,%eax
 8050666:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8050669:	dd 45 f8             	fldl   -0x8(%ebp)
 805066c:	c9                   	leave  
 805066d:	c3                   	ret    
 805066e:	66 90                	xchg   %ax,%ax
 8050670:	b8 00 00 08 00       	mov    $0x80000,%eax
 8050675:	d3 f8                	sar    %cl,%eax
 8050677:	89 45 fc             	mov    %eax,-0x4(%ebp)
 805067a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8050681:	dd 45 f8             	fldl   -0x8(%ebp)
 8050684:	c9                   	leave  
 8050685:	c3                   	ret    
 8050686:	8d 76 00             	lea    0x0(%esi),%esi
 8050689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08050690 <__b2d>:
 8050690:	55                   	push   %ebp
 8050691:	89 e5                	mov    %esp,%ebp
 8050693:	57                   	push   %edi
 8050694:	56                   	push   %esi
 8050695:	53                   	push   %ebx
 8050696:	83 ec 18             	sub    $0x18,%esp
 8050699:	8b 45 08             	mov    0x8(%ebp),%eax
 805069c:	8d 78 14             	lea    0x14(%eax),%edi
 805069f:	8b 40 10             	mov    0x10(%eax),%eax
 80506a2:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
 80506a5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80506a8:	8d 43 fc             	lea    -0x4(%ebx),%eax
 80506ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80506ae:	89 34 24             	mov    %esi,(%esp)
 80506b1:	e8 6a f8 ff ff       	call   804ff20 <__hi0bits>
 80506b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80506b9:	ba 20 00 00 00       	mov    $0x20,%edx
 80506be:	29 c2                	sub    %eax,%edx
 80506c0:	83 f8 0a             	cmp    $0xa,%eax
 80506c3:	89 11                	mov    %edx,(%ecx)
 80506c5:	7f 41                	jg     8050708 <__b2d+0x78>
 80506c7:	b9 0b 00 00 00       	mov    $0xb,%ecx
 80506cc:	89 f2                	mov    %esi,%edx
 80506ce:	29 c1                	sub    %eax,%ecx
 80506d0:	d3 ea                	shr    %cl,%edx
 80506d2:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
 80506d8:	89 55 ec             	mov    %edx,-0x14(%ebp)
 80506db:	31 d2                	xor    %edx,%edx
 80506dd:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
 80506e0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 80506e7:	73 05                	jae    80506ee <__b2d+0x5e>
 80506e9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80506ec:	d3 ea                	shr    %cl,%edx
 80506ee:	8d 48 15             	lea    0x15(%eax),%ecx
 80506f1:	d3 e6                	shl    %cl,%esi
 80506f3:	09 f2                	or     %esi,%edx
 80506f5:	89 55 e8             	mov    %edx,-0x18(%ebp)
 80506f8:	dd 45 e8             	fldl   -0x18(%ebp)
 80506fb:	83 c4 18             	add    $0x18,%esp
 80506fe:	5b                   	pop    %ebx
 80506ff:	5e                   	pop    %esi
 8050700:	5f                   	pop    %edi
 8050701:	5d                   	pop    %ebp
 8050702:	c3                   	ret    
 8050703:	90                   	nop
 8050704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050708:	31 d2                	xor    %edx,%edx
 805070a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
 805070d:	73 09                	jae    8050718 <__b2d+0x88>
 805070f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8050712:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8050715:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050718:	89 c3                	mov    %eax,%ebx
 805071a:	83 eb 0b             	sub    $0xb,%ebx
 805071d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
 8050720:	74 4e                	je     8050770 <__b2d+0xe0>
 8050722:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 8050726:	bb 2b 00 00 00       	mov    $0x2b,%ebx
 805072b:	29 c3                	sub    %eax,%ebx
 805072d:	89 d0                	mov    %edx,%eax
 805072f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 8050736:	d3 e6                	shl    %cl,%esi
 8050738:	89 d9                	mov    %ebx,%ecx
 805073a:	d3 e8                	shr    %cl,%eax
 805073c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 805073f:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
 8050745:	09 c6                	or     %eax,%esi
 8050747:	31 c0                	xor    %eax,%eax
 8050749:	89 75 ec             	mov    %esi,-0x14(%ebp)
 805074c:	39 f9                	cmp    %edi,%ecx
 805074e:	76 07                	jbe    8050757 <__b2d+0xc7>
 8050750:	8b 41 fc             	mov    -0x4(%ecx),%eax
 8050753:	89 d9                	mov    %ebx,%ecx
 8050755:	d3 e8                	shr    %cl,%eax
 8050757:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
 805075b:	d3 e2                	shl    %cl,%edx
 805075d:	09 d0                	or     %edx,%eax
 805075f:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8050762:	dd 45 e8             	fldl   -0x18(%ebp)
 8050765:	83 c4 18             	add    $0x18,%esp
 8050768:	5b                   	pop    %ebx
 8050769:	5e                   	pop    %esi
 805076a:	5f                   	pop    %edi
 805076b:	5d                   	pop    %ebp
 805076c:	c3                   	ret    
 805076d:	8d 76 00             	lea    0x0(%esi),%esi
 8050770:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
 8050776:	89 75 ec             	mov    %esi,-0x14(%ebp)
 8050779:	89 55 e8             	mov    %edx,-0x18(%ebp)
 805077c:	dd 45 e8             	fldl   -0x18(%ebp)
 805077f:	83 c4 18             	add    $0x18,%esp
 8050782:	5b                   	pop    %ebx
 8050783:	5e                   	pop    %esi
 8050784:	5f                   	pop    %edi
 8050785:	5d                   	pop    %ebp
 8050786:	c3                   	ret    
 8050787:	89 f6                	mov    %esi,%esi
 8050789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08050790 <__d2b>:
 8050790:	55                   	push   %ebp
 8050791:	89 e5                	mov    %esp,%ebp
 8050793:	57                   	push   %edi
 8050794:	56                   	push   %esi
 8050795:	53                   	push   %ebx
 8050796:	83 ec 2c             	sub    $0x2c,%esp
 8050799:	8b 45 08             	mov    0x8(%ebp),%eax
 805079c:	dd 45 0c             	fldl   0xc(%ebp)
 805079f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80507a6:	00 
 80507a7:	dd 5d d0             	fstpl  -0x30(%ebp)
 80507aa:	89 04 24             	mov    %eax,(%esp)
 80507ad:	e8 ce f4 ff ff       	call   804fc80 <_Balloc>
 80507b2:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 80507b5:	89 c6                	mov    %eax,%esi
 80507b7:	89 d8                	mov    %ebx,%eax
 80507b9:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
 80507bf:	25 ff ff 0f 00       	and    $0xfffff,%eax
 80507c4:	c1 eb 14             	shr    $0x14,%ebx
 80507c7:	85 db                	test   %ebx,%ebx
 80507c9:	74 05                	je     80507d0 <__d2b+0x40>
 80507cb:	0d 00 00 10 00       	or     $0x100000,%eax
 80507d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80507d3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80507d6:	85 c0                	test   %eax,%eax
 80507d8:	74 56                	je     8050830 <__d2b+0xa0>
 80507da:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80507dd:	8d 45 e0             	lea    -0x20(%ebp),%eax
 80507e0:	89 04 24             	mov    %eax,(%esp)
 80507e3:	e8 98 f7 ff ff       	call   804ff80 <__lo0bits>
 80507e8:	85 c0                	test   %eax,%eax
 80507ea:	0f 85 90 00 00 00    	jne    8050880 <__d2b+0xf0>
 80507f0:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80507f3:	89 56 14             	mov    %edx,0x14(%esi)
 80507f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 80507f9:	83 fa 01             	cmp    $0x1,%edx
 80507fc:	19 ff                	sbb    %edi,%edi
 80507fe:	83 c7 02             	add    $0x2,%edi
 8050801:	85 db                	test   %ebx,%ebx
 8050803:	89 56 18             	mov    %edx,0x18(%esi)
 8050806:	89 7e 10             	mov    %edi,0x10(%esi)
 8050809:	74 49                	je     8050854 <__d2b+0xc4>
 805080b:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805080e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
 8050815:	89 11                	mov    %edx,(%ecx)
 8050817:	ba 35 00 00 00       	mov    $0x35,%edx
 805081c:	29 c2                	sub    %eax,%edx
 805081e:	8b 45 18             	mov    0x18(%ebp),%eax
 8050821:	89 10                	mov    %edx,(%eax)
 8050823:	83 c4 2c             	add    $0x2c,%esp
 8050826:	89 f0                	mov    %esi,%eax
 8050828:	5b                   	pop    %ebx
 8050829:	5e                   	pop    %esi
 805082a:	5f                   	pop    %edi
 805082b:	5d                   	pop    %ebp
 805082c:	c3                   	ret    
 805082d:	8d 76 00             	lea    0x0(%esi),%esi
 8050830:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8050833:	bf 01 00 00 00       	mov    $0x1,%edi
 8050838:	89 04 24             	mov    %eax,(%esp)
 805083b:	e8 40 f7 ff ff       	call   804ff80 <__lo0bits>
 8050840:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050843:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
 805084a:	89 56 14             	mov    %edx,0x14(%esi)
 805084d:	83 c0 20             	add    $0x20,%eax
 8050850:	85 db                	test   %ebx,%ebx
 8050852:	75 b7                	jne    805080b <__d2b+0x7b>
 8050854:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8050857:	2d 32 04 00 00       	sub    $0x432,%eax
 805085c:	89 01                	mov    %eax,(%ecx)
 805085e:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
 8050862:	c1 e7 05             	shl    $0x5,%edi
 8050865:	89 04 24             	mov    %eax,(%esp)
 8050868:	e8 b3 f6 ff ff       	call   804ff20 <__hi0bits>
 805086d:	29 c7                	sub    %eax,%edi
 805086f:	8b 45 18             	mov    0x18(%ebp),%eax
 8050872:	89 38                	mov    %edi,(%eax)
 8050874:	83 c4 2c             	add    $0x2c,%esp
 8050877:	89 f0                	mov    %esi,%eax
 8050879:	5b                   	pop    %ebx
 805087a:	5e                   	pop    %esi
 805087b:	5f                   	pop    %edi
 805087c:	5d                   	pop    %ebp
 805087d:	c3                   	ret    
 805087e:	66 90                	xchg   %ax,%ax
 8050880:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050883:	b9 20 00 00 00       	mov    $0x20,%ecx
 8050888:	29 c1                	sub    %eax,%ecx
 805088a:	89 d7                	mov    %edx,%edi
 805088c:	d3 e7                	shl    %cl,%edi
 805088e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8050891:	09 f9                	or     %edi,%ecx
 8050893:	89 4e 14             	mov    %ecx,0x14(%esi)
 8050896:	89 c1                	mov    %eax,%ecx
 8050898:	d3 ea                	shr    %cl,%edx
 805089a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 805089d:	e9 57 ff ff ff       	jmp    80507f9 <__d2b+0x69>
 80508a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80508a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080508b0 <__ratio>:
 80508b0:	55                   	push   %ebp
 80508b1:	89 e5                	mov    %esp,%ebp
 80508b3:	56                   	push   %esi
 80508b4:	53                   	push   %ebx
 80508b5:	83 ec 30             	sub    $0x30,%esp
 80508b8:	8b 75 08             	mov    0x8(%ebp),%esi
 80508bb:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80508be:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80508c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80508c5:	89 34 24             	mov    %esi,(%esp)
 80508c8:	e8 c3 fd ff ff       	call   8050690 <__b2d>
 80508cd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 80508d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80508d4:	89 1c 24             	mov    %ebx,(%esp)
 80508d7:	dd 55 e0             	fstl   -0x20(%ebp)
 80508da:	dd 5d d8             	fstpl  -0x28(%ebp)
 80508dd:	e8 ae fd ff ff       	call   8050690 <__b2d>
 80508e2:	8b 46 10             	mov    0x10(%esi),%eax
 80508e5:	2b 43 10             	sub    0x10(%ebx),%eax
 80508e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80508eb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 80508ee:	c1 e0 05             	shl    $0x5,%eax
 80508f1:	01 d0                	add    %edx,%eax
 80508f3:	dd 55 d0             	fstl   -0x30(%ebp)
 80508f6:	85 c0                	test   %eax,%eax
 80508f8:	dd 45 d8             	fldl   -0x28(%ebp)
 80508fb:	7e 1b                	jle    8050918 <__ratio+0x68>
 80508fd:	dd d8                	fstp   %st(0)
 80508ff:	c1 e0 14             	shl    $0x14,%eax
 8050902:	01 45 e4             	add    %eax,-0x1c(%ebp)
 8050905:	dd 45 e0             	fldl   -0x20(%ebp)
 8050908:	83 c4 30             	add    $0x30,%esp
 805090b:	5b                   	pop    %ebx
 805090c:	de f1                	fdivp  %st,%st(1)
 805090e:	5e                   	pop    %esi
 805090f:	5d                   	pop    %ebp
 8050910:	c3                   	ret    
 8050911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050918:	dd d9                	fstp   %st(1)
 805091a:	c1 e0 14             	shl    $0x14,%eax
 805091d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
 8050920:	dd 45 d0             	fldl   -0x30(%ebp)
 8050923:	83 c4 30             	add    $0x30,%esp
 8050926:	5b                   	pop    %ebx
 8050927:	de f9                	fdivrp %st,%st(1)
 8050929:	5e                   	pop    %esi
 805092a:	5d                   	pop    %ebp
 805092b:	c3                   	ret    
 805092c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050930 <_mprec_log10>:
 8050930:	55                   	push   %ebp
 8050931:	89 e5                	mov    %esp,%ebp
 8050933:	8b 45 08             	mov    0x8(%ebp),%eax
 8050936:	83 f8 17             	cmp    $0x17,%eax
 8050939:	7e 1d                	jle    8050958 <_mprec_log10+0x28>
 805093b:	d9 e8                	fld1   
 805093d:	d9 05 48 49 05 08    	flds   0x8054948
 8050943:	90                   	nop
 8050944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050948:	83 e8 01             	sub    $0x1,%eax
 805094b:	dc c9                	fmul   %st,%st(1)
 805094d:	75 f9                	jne    8050948 <_mprec_log10+0x18>
 805094f:	dd d8                	fstp   %st(0)
 8050951:	5d                   	pop    %ebp
 8050952:	c3                   	ret    
 8050953:	90                   	nop
 8050954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050958:	dd 04 c5 20 4a 05 08 	fldl   0x8054a20(,%eax,8)
 805095f:	5d                   	pop    %ebp
 8050960:	c3                   	ret    
 8050961:	eb 0d                	jmp    8050970 <__copybits>
 8050963:	90                   	nop
 8050964:	90                   	nop
 8050965:	90                   	nop
 8050966:	90                   	nop
 8050967:	90                   	nop
 8050968:	90                   	nop
 8050969:	90                   	nop
 805096a:	90                   	nop
 805096b:	90                   	nop
 805096c:	90                   	nop
 805096d:	90                   	nop
 805096e:	90                   	nop
 805096f:	90                   	nop

08050970 <__copybits>:
 8050970:	55                   	push   %ebp
 8050971:	89 e5                	mov    %esp,%ebp
 8050973:	57                   	push   %edi
 8050974:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050977:	56                   	push   %esi
 8050978:	8b 75 0c             	mov    0xc(%ebp),%esi
 805097b:	8b 45 08             	mov    0x8(%ebp),%eax
 805097e:	53                   	push   %ebx
 805097f:	8b 4f 10             	mov    0x10(%edi),%ecx
 8050982:	8d 56 ff             	lea    -0x1(%esi),%edx
 8050985:	c1 fa 05             	sar    $0x5,%edx
 8050988:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
 805098c:	8d 57 14             	lea    0x14(%edi),%edx
 805098f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
 8050992:	39 da                	cmp    %ebx,%edx
 8050994:	73 34                	jae    80509ca <__copybits+0x5a>
 8050996:	89 c1                	mov    %eax,%ecx
 8050998:	83 c2 04             	add    $0x4,%edx
 805099b:	8b 42 fc             	mov    -0x4(%edx),%eax
 805099e:	83 c1 04             	add    $0x4,%ecx
 80509a1:	39 d3                	cmp    %edx,%ebx
 80509a3:	89 41 fc             	mov    %eax,-0x4(%ecx)
 80509a6:	77 f0                	ja     8050998 <__copybits+0x28>
 80509a8:	8b 45 08             	mov    0x8(%ebp),%eax
 80509ab:	29 fb                	sub    %edi,%ebx
 80509ad:	8d 53 eb             	lea    -0x15(%ebx),%edx
 80509b0:	c1 ea 02             	shr    $0x2,%edx
 80509b3:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
 80509b7:	39 c6                	cmp    %eax,%esi
 80509b9:	76 13                	jbe    80509ce <__copybits+0x5e>
 80509bb:	90                   	nop
 80509bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80509c0:	83 c0 04             	add    $0x4,%eax
 80509c3:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
 80509ca:	39 c6                	cmp    %eax,%esi
 80509cc:	77 f2                	ja     80509c0 <__copybits+0x50>
 80509ce:	5b                   	pop    %ebx
 80509cf:	5e                   	pop    %esi
 80509d0:	5f                   	pop    %edi
 80509d1:	5d                   	pop    %ebp
 80509d2:	c3                   	ret    
 80509d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80509d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080509e0 <__any_on>:
 80509e0:	55                   	push   %ebp
 80509e1:	89 e5                	mov    %esp,%ebp
 80509e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80509e6:	57                   	push   %edi
 80509e7:	56                   	push   %esi
 80509e8:	53                   	push   %ebx
 80509e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80509ec:	8d 50 14             	lea    0x14(%eax),%edx
 80509ef:	8b 40 10             	mov    0x10(%eax),%eax
 80509f2:	c1 fb 05             	sar    $0x5,%ebx
 80509f5:	39 d8                	cmp    %ebx,%eax
 80509f7:	7d 2f                	jge    8050a28 <__any_on+0x48>
 80509f9:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
 80509fc:	39 da                	cmp    %ebx,%edx
 80509fe:	73 1d                	jae    8050a1d <__any_on+0x3d>
 8050a00:	8d 43 fc             	lea    -0x4(%ebx),%eax
 8050a03:	8b 5b fc             	mov    -0x4(%ebx),%ebx
 8050a06:	85 db                	test   %ebx,%ebx
 8050a08:	74 0f                	je     8050a19 <__any_on+0x39>
 8050a0a:	eb 44                	jmp    8050a50 <__any_on+0x70>
 8050a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050a10:	83 e8 04             	sub    $0x4,%eax
 8050a13:	8b 08                	mov    (%eax),%ecx
 8050a15:	85 c9                	test   %ecx,%ecx
 8050a17:	75 37                	jne    8050a50 <__any_on+0x70>
 8050a19:	39 c2                	cmp    %eax,%edx
 8050a1b:	72 f3                	jb     8050a10 <__any_on+0x30>
 8050a1d:	31 c0                	xor    %eax,%eax
 8050a1f:	5b                   	pop    %ebx
 8050a20:	5e                   	pop    %esi
 8050a21:	5f                   	pop    %edi
 8050a22:	5d                   	pop    %ebp
 8050a23:	c3                   	ret    
 8050a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050a28:	7e 1e                	jle    8050a48 <__any_on+0x68>
 8050a2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8050a2d:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
 8050a30:	83 e1 1f             	and    $0x1f,%ecx
 8050a33:	74 c7                	je     80509fc <__any_on+0x1c>
 8050a35:	8b 3b                	mov    (%ebx),%edi
 8050a37:	b8 01 00 00 00       	mov    $0x1,%eax
 8050a3c:	89 fe                	mov    %edi,%esi
 8050a3e:	d3 ee                	shr    %cl,%esi
 8050a40:	d3 e6                	shl    %cl,%esi
 8050a42:	39 fe                	cmp    %edi,%esi
 8050a44:	75 d9                	jne    8050a1f <__any_on+0x3f>
 8050a46:	eb b4                	jmp    80509fc <__any_on+0x1c>
 8050a48:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
 8050a4b:	eb af                	jmp    80509fc <__any_on+0x1c>
 8050a4d:	8d 76 00             	lea    0x0(%esi),%esi
 8050a50:	5b                   	pop    %ebx
 8050a51:	b8 01 00 00 00       	mov    $0x1,%eax
 8050a56:	5e                   	pop    %esi
 8050a57:	5f                   	pop    %edi
 8050a58:	5d                   	pop    %ebp
 8050a59:	c3                   	ret    
 8050a5a:	66 90                	xchg   %ax,%ax
 8050a5c:	66 90                	xchg   %ax,%ax
 8050a5e:	66 90                	xchg   %ax,%ax

08050a60 <_sbrk_r>:
 8050a60:	55                   	push   %ebp
 8050a61:	89 e5                	mov    %esp,%ebp
 8050a63:	83 ec 18             	sub    $0x18,%esp
 8050a66:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050a69:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 8050a70:	00 00 00 
 8050a73:	89 04 24             	mov    %eax,(%esp)
 8050a76:	e8 75 79 ff ff       	call   80483f0 <sbrk>
 8050a7b:	83 f8 ff             	cmp    $0xffffffff,%eax
 8050a7e:	74 08                	je     8050a88 <_sbrk_r+0x28>
 8050a80:	c9                   	leave  
 8050a81:	c3                   	ret    
 8050a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050a88:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 8050a8e:	85 d2                	test   %edx,%edx
 8050a90:	74 ee                	je     8050a80 <_sbrk_r+0x20>
 8050a92:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8050a95:	89 11                	mov    %edx,(%ecx)
 8050a97:	c9                   	leave  
 8050a98:	c3                   	ret    
 8050a99:	66 90                	xchg   %ax,%ax
 8050a9b:	66 90                	xchg   %ax,%ax
 8050a9d:	66 90                	xchg   %ax,%ax
 8050a9f:	90                   	nop

08050aa0 <__fpclassifyd>:
 8050aa0:	55                   	push   %ebp
 8050aa1:	b8 02 00 00 00       	mov    $0x2,%eax
 8050aa6:	89 e5                	mov    %esp,%ebp
 8050aa8:	53                   	push   %ebx
 8050aa9:	83 ec 0c             	sub    $0xc,%esp
 8050aac:	dd 45 08             	fldl   0x8(%ebp)
 8050aaf:	dd 5d f0             	fstpl  -0x10(%ebp)
 8050ab2:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8050ab5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8050ab8:	89 d3                	mov    %edx,%ebx
 8050aba:	09 cb                	or     %ecx,%ebx
 8050abc:	75 0a                	jne    8050ac8 <__fpclassifyd+0x28>
 8050abe:	83 c4 0c             	add    $0xc,%esp
 8050ac1:	5b                   	pop    %ebx
 8050ac2:	5d                   	pop    %ebp
 8050ac3:	c3                   	ret    
 8050ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050ac8:	85 d2                	test   %edx,%edx
 8050aca:	0f 94 c2             	sete   %dl
 8050acd:	75 08                	jne    8050ad7 <__fpclassifyd+0x37>
 8050acf:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
 8050ad5:	74 e7                	je     8050abe <__fpclassifyd+0x1e>
 8050ad7:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
 8050add:	b8 04 00 00 00       	mov    $0x4,%eax
 8050ae2:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
 8050ae8:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
 8050aee:	76 ce                	jbe    8050abe <__fpclassifyd+0x1e>
 8050af0:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
 8050af6:	b0 03                	mov    $0x3,%al
 8050af8:	76 c4                	jbe    8050abe <__fpclassifyd+0x1e>
 8050afa:	31 c0                	xor    %eax,%eax
 8050afc:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
 8050b02:	0f 94 c0             	sete   %al
 8050b05:	21 d0                	and    %edx,%eax
 8050b07:	eb b5                	jmp    8050abe <__fpclassifyd+0x1e>
 8050b09:	66 90                	xchg   %ax,%ax
 8050b0b:	66 90                	xchg   %ax,%ax
 8050b0d:	66 90                	xchg   %ax,%ax
 8050b0f:	90                   	nop

08050b10 <__sread>:
 8050b10:	55                   	push   %ebp
 8050b11:	89 e5                	mov    %esp,%ebp
 8050b13:	53                   	push   %ebx
 8050b14:	83 ec 14             	sub    $0x14,%esp
 8050b17:	8b 45 14             	mov    0x14(%ebp),%eax
 8050b1a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050b1d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8050b21:	8b 45 10             	mov    0x10(%ebp),%eax
 8050b24:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050b28:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050b30:	8b 45 08             	mov    0x8(%ebp),%eax
 8050b33:	89 04 24             	mov    %eax,(%esp)
 8050b36:	e8 75 2d 00 00       	call   80538b0 <_read_r>
 8050b3b:	85 c0                	test   %eax,%eax
 8050b3d:	78 09                	js     8050b48 <__sread+0x38>
 8050b3f:	01 43 50             	add    %eax,0x50(%ebx)
 8050b42:	83 c4 14             	add    $0x14,%esp
 8050b45:	5b                   	pop    %ebx
 8050b46:	5d                   	pop    %ebp
 8050b47:	c3                   	ret    
 8050b48:	66 81 63 0c ff ef    	andw   $0xefff,0xc(%ebx)
 8050b4e:	83 c4 14             	add    $0x14,%esp
 8050b51:	5b                   	pop    %ebx
 8050b52:	5d                   	pop    %ebp
 8050b53:	c3                   	ret    
 8050b54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050b5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

08050b60 <__seofread>:
 8050b60:	55                   	push   %ebp
 8050b61:	31 c0                	xor    %eax,%eax
 8050b63:	89 e5                	mov    %esp,%ebp
 8050b65:	5d                   	pop    %ebp
 8050b66:	c3                   	ret    
 8050b67:	89 f6                	mov    %esi,%esi
 8050b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08050b70 <__swrite>:
 8050b70:	55                   	push   %ebp
 8050b71:	89 e5                	mov    %esp,%ebp
 8050b73:	57                   	push   %edi
 8050b74:	56                   	push   %esi
 8050b75:	53                   	push   %ebx
 8050b76:	83 ec 2c             	sub    $0x2c,%esp
 8050b79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050b7c:	8b 75 08             	mov    0x8(%ebp),%esi
 8050b7f:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050b82:	8b 55 14             	mov    0x14(%ebp),%edx
 8050b85:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050b89:	f6 c4 01             	test   $0x1,%ah
 8050b8c:	74 2a                	je     8050bb8 <__swrite+0x48>
 8050b8e:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8050b95:	00 
 8050b96:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8050b9d:	00 
 8050b9e:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050ba2:	89 34 24             	mov    %esi,(%esp)
 8050ba5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8050ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050bac:	e8 1f 2c 00 00       	call   80537d0 <_lseek_r>
 8050bb1:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050bb5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8050bb8:	80 e4 ef             	and    $0xef,%ah
 8050bbb:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8050bbf:	89 7d 10             	mov    %edi,0x10(%ebp)
 8050bc2:	89 55 14             	mov    %edx,0x14(%ebp)
 8050bc5:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050bc9:	89 75 08             	mov    %esi,0x8(%ebp)
 8050bcc:	89 45 0c             	mov    %eax,0xc(%ebp)
 8050bcf:	83 c4 2c             	add    $0x2c,%esp
 8050bd2:	5b                   	pop    %ebx
 8050bd3:	5e                   	pop    %esi
 8050bd4:	5f                   	pop    %edi
 8050bd5:	5d                   	pop    %ebp
 8050bd6:	e9 b5 22 00 00       	jmp    8052e90 <_write_r>
 8050bdb:	90                   	nop
 8050bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050be0 <__sseek>:
 8050be0:	55                   	push   %ebp
 8050be1:	89 e5                	mov    %esp,%ebp
 8050be3:	53                   	push   %ebx
 8050be4:	83 ec 14             	sub    $0x14,%esp
 8050be7:	8b 45 14             	mov    0x14(%ebp),%eax
 8050bea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050bed:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8050bf1:	8b 45 10             	mov    0x10(%ebp),%eax
 8050bf4:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050bf8:	0f bf 43 0e          	movswl 0xe(%ebx),%eax
 8050bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050c00:	8b 45 08             	mov    0x8(%ebp),%eax
 8050c03:	89 04 24             	mov    %eax,(%esp)
 8050c06:	e8 c5 2b 00 00       	call   80537d0 <_lseek_r>
 8050c0b:	83 f8 ff             	cmp    $0xffffffff,%eax
 8050c0e:	74 10                	je     8050c20 <__sseek+0x40>
 8050c10:	66 81 4b 0c 00 10    	orw    $0x1000,0xc(%ebx)
 8050c16:	89 43 50             	mov    %eax,0x50(%ebx)
 8050c19:	83 c4 14             	add    $0x14,%esp
 8050c1c:	5b                   	pop    %ebx
 8050c1d:	5d                   	pop    %ebp
 8050c1e:	c3                   	ret    
 8050c1f:	90                   	nop
 8050c20:	66 81 63 0c ff ef    	andw   $0xefff,0xc(%ebx)
 8050c26:	83 c4 14             	add    $0x14,%esp
 8050c29:	5b                   	pop    %ebx
 8050c2a:	5d                   	pop    %ebp
 8050c2b:	c3                   	ret    
 8050c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08050c30 <__sclose>:
 8050c30:	55                   	push   %ebp
 8050c31:	89 e5                	mov    %esp,%ebp
 8050c33:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050c36:	0f bf 40 0e          	movswl 0xe(%eax),%eax
 8050c3a:	89 45 0c             	mov    %eax,0xc(%ebp)
 8050c3d:	5d                   	pop    %ebp
 8050c3e:	e9 5d 23 00 00       	jmp    8052fa0 <_close_r>
 8050c43:	66 90                	xchg   %ax,%ax
 8050c45:	66 90                	xchg   %ax,%ax
 8050c47:	66 90                	xchg   %ax,%ax
 8050c49:	66 90                	xchg   %ax,%ax
 8050c4b:	66 90                	xchg   %ax,%ax
 8050c4d:	66 90                	xchg   %ax,%ax
 8050c4f:	90                   	nop

08050c50 <strcmp>:
 8050c50:	55                   	push   %ebp
 8050c51:	89 e5                	mov    %esp,%ebp
 8050c53:	8b 45 08             	mov    0x8(%ebp),%eax
 8050c56:	8b 55 0c             	mov    0xc(%ebp),%edx
 8050c59:	53                   	push   %ebx
 8050c5a:	89 c1                	mov    %eax,%ecx
 8050c5c:	09 d1                	or     %edx,%ecx
 8050c5e:	83 e1 03             	and    $0x3,%ecx
 8050c61:	75 17                	jne    8050c7a <strcmp+0x2a>
 8050c63:	8b 08                	mov    (%eax),%ecx
 8050c65:	3b 0a                	cmp    (%edx),%ecx
 8050c67:	74 33                	je     8050c9c <strcmp+0x4c>
 8050c69:	eb 0f                	jmp    8050c7a <strcmp+0x2a>
 8050c6b:	90                   	nop
 8050c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050c70:	3a 0a                	cmp    (%edx),%cl
 8050c72:	75 0d                	jne    8050c81 <strcmp+0x31>
 8050c74:	83 c0 01             	add    $0x1,%eax
 8050c77:	83 c2 01             	add    $0x1,%edx
 8050c7a:	0f b6 08             	movzbl (%eax),%ecx
 8050c7d:	84 c9                	test   %cl,%cl
 8050c7f:	75 ef                	jne    8050c70 <strcmp+0x20>
 8050c81:	0f b6 00             	movzbl (%eax),%eax
 8050c84:	0f b6 12             	movzbl (%edx),%edx
 8050c87:	5b                   	pop    %ebx
 8050c88:	5d                   	pop    %ebp
 8050c89:	29 d0                	sub    %edx,%eax
 8050c8b:	c3                   	ret    
 8050c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050c90:	83 c0 04             	add    $0x4,%eax
 8050c93:	83 c2 04             	add    $0x4,%edx
 8050c96:	8b 08                	mov    (%eax),%ecx
 8050c98:	3b 0a                	cmp    (%edx),%ecx
 8050c9a:	75 de                	jne    8050c7a <strcmp+0x2a>
 8050c9c:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
 8050ca2:	f7 d1                	not    %ecx
 8050ca4:	21 cb                	and    %ecx,%ebx
 8050ca6:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
 8050cac:	74 e2                	je     8050c90 <strcmp+0x40>
 8050cae:	31 c0                	xor    %eax,%eax
 8050cb0:	5b                   	pop    %ebx
 8050cb1:	5d                   	pop    %ebp
 8050cb2:	c3                   	ret    
 8050cb3:	66 90                	xchg   %ax,%ax
 8050cb5:	66 90                	xchg   %ax,%ax
 8050cb7:	66 90                	xchg   %ax,%ax
 8050cb9:	66 90                	xchg   %ax,%ax
 8050cbb:	66 90                	xchg   %ax,%ax
 8050cbd:	66 90                	xchg   %ax,%ax
 8050cbf:	90                   	nop

08050cc0 <__ssprint_r>:
 8050cc0:	55                   	push   %ebp
 8050cc1:	89 e5                	mov    %esp,%ebp
 8050cc3:	57                   	push   %edi
 8050cc4:	56                   	push   %esi
 8050cc5:	53                   	push   %ebx
 8050cc6:	83 ec 2c             	sub    $0x2c,%esp
 8050cc9:	8b 45 10             	mov    0x10(%ebp),%eax
 8050ccc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050ccf:	8b 00                	mov    (%eax),%eax
 8050cd1:	89 c7                	mov    %eax,%edi
 8050cd3:	8b 45 10             	mov    0x10(%ebp),%eax
 8050cd6:	8b 40 08             	mov    0x8(%eax),%eax
 8050cd9:	85 c0                	test   %eax,%eax
 8050cdb:	0f 84 af 01 00 00    	je     8050e90 <__ssprint_r+0x1d0>
 8050ce1:	31 c9                	xor    %ecx,%ecx
 8050ce3:	31 d2                	xor    %edx,%edx
 8050ce5:	8b 03                	mov    (%ebx),%eax
 8050ce7:	89 ce                	mov    %ecx,%esi
 8050ce9:	85 f6                	test   %esi,%esi
 8050ceb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8050cee:	0f 84 ec 00 00 00    	je     8050de0 <__ssprint_r+0x120>
 8050cf4:	8b 53 08             	mov    0x8(%ebx),%edx
 8050cf7:	39 d6                	cmp    %edx,%esi
 8050cf9:	0f 82 fc 00 00 00    	jb     8050dfb <__ssprint_r+0x13b>
 8050cff:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
 8050d03:	66 f7 c1 80 04       	test   $0x480,%cx
 8050d08:	0f 84 fa 00 00 00    	je     8050e08 <__ssprint_r+0x148>
 8050d0e:	8b 53 10             	mov    0x10(%ebx),%edx
 8050d11:	29 d0                	sub    %edx,%eax
 8050d13:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8050d16:	8b 43 14             	mov    0x14(%ebx),%eax
 8050d19:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8050d1c:	8d 04 40             	lea    (%eax,%eax,2),%eax
 8050d1f:	89 c2                	mov    %eax,%edx
 8050d21:	c1 ea 1f             	shr    $0x1f,%edx
 8050d24:	01 d0                	add    %edx,%eax
 8050d26:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050d29:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050d2c:	d1 7d e0             	sarl   -0x20(%ebp)
 8050d2f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
 8050d33:	39 45 e0             	cmp    %eax,-0x20(%ebp)
 8050d36:	0f 83 34 01 00 00    	jae    8050e70 <__ssprint_r+0x1b0>
 8050d3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8050d3f:	80 e5 04             	and    $0x4,%ch
 8050d42:	0f 84 c8 00 00 00    	je     8050e10 <__ssprint_r+0x150>
 8050d48:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050d4c:	8b 45 08             	mov    0x8(%ebp),%eax
 8050d4f:	89 04 24             	mov    %eax,(%esp)
 8050d52:	e8 e9 e6 ff ff       	call   804f440 <_malloc_r>
 8050d57:	85 c0                	test   %eax,%eax
 8050d59:	89 c2                	mov    %eax,%edx
 8050d5b:	0f 84 e1 00 00 00    	je     8050e42 <__ssprint_r+0x182>
 8050d61:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050d64:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8050d67:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050d6b:	8b 43 10             	mov    0x10(%ebx),%eax
 8050d6e:	89 14 24             	mov    %edx,(%esp)
 8050d71:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050d75:	e8 9e ee ff ff       	call   804fc18 <memcpy>
 8050d7a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8050d7e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8050d81:	66 25 7f fb          	and    $0xfb7f,%ax
 8050d85:	0c 80                	or     $0x80,%al
 8050d87:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8050d8b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8050d8e:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8050d91:	89 53 10             	mov    %edx,0x10(%ebx)
 8050d94:	89 4b 14             	mov    %ecx,0x14(%ebx)
 8050d97:	2b 4d dc             	sub    -0x24(%ebp),%ecx
 8050d9a:	01 d0                	add    %edx,%eax
 8050d9c:	89 03                	mov    %eax,(%ebx)
 8050d9e:	89 f2                	mov    %esi,%edx
 8050da0:	89 4b 08             	mov    %ecx,0x8(%ebx)
 8050da3:	89 f1                	mov    %esi,%ecx
 8050da5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8050da9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8050dac:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8050daf:	89 04 24             	mov    %eax,(%esp)
 8050db2:	89 55 dc             	mov    %edx,-0x24(%ebp)
 8050db5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8050db9:	e8 62 2a 00 00       	call   8053820 <memmove>
 8050dbe:	8b 03                	mov    (%ebx),%eax
 8050dc0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8050dc3:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8050dc6:	29 53 08             	sub    %edx,0x8(%ebx)
 8050dc9:	01 c8                	add    %ecx,%eax
 8050dcb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8050dce:	89 03                	mov    %eax,(%ebx)
 8050dd0:	8b 51 08             	mov    0x8(%ecx),%edx
 8050dd3:	29 f2                	sub    %esi,%edx
 8050dd5:	85 d2                	test   %edx,%edx
 8050dd7:	89 51 08             	mov    %edx,0x8(%ecx)
 8050dda:	0f 84 98 00 00 00    	je     8050e78 <__ssprint_r+0x1b8>
 8050de0:	8b 77 04             	mov    0x4(%edi),%esi
 8050de3:	83 c7 08             	add    $0x8,%edi
 8050de6:	8b 4f f8             	mov    -0x8(%edi),%ecx
 8050de9:	85 f6                	test   %esi,%esi
 8050deb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8050dee:	74 f0                	je     8050de0 <__ssprint_r+0x120>
 8050df0:	8b 53 08             	mov    0x8(%ebx),%edx
 8050df3:	39 d6                	cmp    %edx,%esi
 8050df5:	0f 83 04 ff ff ff    	jae    8050cff <__ssprint_r+0x3f>
 8050dfb:	89 f2                	mov    %esi,%edx
 8050dfd:	89 f1                	mov    %esi,%ecx
 8050dff:	eb a4                	jmp    8050da5 <__ssprint_r+0xe5>
 8050e01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050e08:	89 d1                	mov    %edx,%ecx
 8050e0a:	eb 99                	jmp    8050da5 <__ssprint_r+0xe5>
 8050e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8050e10:	89 44 24 08          	mov    %eax,0x8(%esp)
 8050e14:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8050e17:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050e1b:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e1e:	89 04 24             	mov    %eax,(%esp)
 8050e21:	e8 da 2a 00 00       	call   8053900 <_realloc_r>
 8050e26:	85 c0                	test   %eax,%eax
 8050e28:	89 c2                	mov    %eax,%edx
 8050e2a:	0f 85 5b ff ff ff    	jne    8050d8b <__ssprint_r+0xcb>
 8050e30:	8b 43 10             	mov    0x10(%ebx),%eax
 8050e33:	89 44 24 04          	mov    %eax,0x4(%esp)
 8050e37:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e3a:	89 04 24             	mov    %eax,(%esp)
 8050e3d:	e8 4e e0 ff ff       	call   804ee90 <_free_r>
 8050e42:	8b 45 08             	mov    0x8(%ebp),%eax
 8050e45:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8050e4b:	8b 45 10             	mov    0x10(%ebp),%eax
 8050e4e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 8050e53:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8050e5a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050e61:	83 c4 2c             	add    $0x2c,%esp
 8050e64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8050e69:	5b                   	pop    %ebx
 8050e6a:	5e                   	pop    %esi
 8050e6b:	5f                   	pop    %edi
 8050e6c:	5d                   	pop    %ebp
 8050e6d:	c3                   	ret    
 8050e6e:	66 90                	xchg   %ax,%ax
 8050e70:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8050e73:	e9 c7 fe ff ff       	jmp    8050d3f <__ssprint_r+0x7f>
 8050e78:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
 8050e7f:	83 c4 2c             	add    $0x2c,%esp
 8050e82:	31 c0                	xor    %eax,%eax
 8050e84:	5b                   	pop    %ebx
 8050e85:	5e                   	pop    %esi
 8050e86:	5f                   	pop    %edi
 8050e87:	5d                   	pop    %ebp
 8050e88:	c3                   	ret    
 8050e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050e90:	8b 45 10             	mov    0x10(%ebp),%eax
 8050e93:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050e9a:	83 c4 2c             	add    $0x2c,%esp
 8050e9d:	31 c0                	xor    %eax,%eax
 8050e9f:	5b                   	pop    %ebx
 8050ea0:	5e                   	pop    %esi
 8050ea1:	5f                   	pop    %edi
 8050ea2:	5d                   	pop    %ebp
 8050ea3:	c3                   	ret    
 8050ea4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050eaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

08050eb0 <_svfiprintf_r>:
 8050eb0:	55                   	push   %ebp
 8050eb1:	89 e5                	mov    %esp,%ebp
 8050eb3:	57                   	push   %edi
 8050eb4:	56                   	push   %esi
 8050eb5:	53                   	push   %ebx
 8050eb6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
 8050ebc:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050ebf:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
 8050ec3:	74 0b                	je     8050ed0 <_svfiprintf_r+0x20>
 8050ec5:	8b 50 10             	mov    0x10(%eax),%edx
 8050ec8:	85 d2                	test   %edx,%edx
 8050eca:	0f 84 1c 0d 00 00    	je     8051bec <_svfiprintf_r+0xd3c>
 8050ed0:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8050ed3:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 8050ed6:	89 c6                	mov    %eax,%esi
 8050ed8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8050ede:	29 d8                	sub    %ebx,%eax
 8050ee0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 8050ee7:	00 00 00 
 8050eea:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8050ef1:	00 00 00 
 8050ef4:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
 8050efb:	00 00 00 
 8050efe:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
 8050f05:	00 00 00 
 8050f08:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
 8050f0e:	8b 45 10             	mov    0x10(%ebp),%eax
 8050f11:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8050f14:	0f b6 00             	movzbl (%eax),%eax
 8050f17:	84 c0                	test   %al,%al
 8050f19:	74 58                	je     8050f73 <_svfiprintf_r+0xc3>
 8050f1b:	3c 25                	cmp    $0x25,%al
 8050f1d:	75 13                	jne    8050f32 <_svfiprintf_r+0x82>
 8050f1f:	eb 52                	jmp    8050f73 <_svfiprintf_r+0xc3>
 8050f21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8050f28:	84 c0                	test   %al,%al
 8050f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050f30:	74 0a                	je     8050f3c <_svfiprintf_r+0x8c>
 8050f32:	83 c3 01             	add    $0x1,%ebx
 8050f35:	0f b6 03             	movzbl (%ebx),%eax
 8050f38:	3c 25                	cmp    $0x25,%al
 8050f3a:	75 ec                	jne    8050f28 <_svfiprintf_r+0x78>
 8050f3c:	89 df                	mov    %ebx,%edi
 8050f3e:	2b 7d 10             	sub    0x10(%ebp),%edi
 8050f41:	74 30                	je     8050f73 <_svfiprintf_r+0xc3>
 8050f43:	8b 45 10             	mov    0x10(%ebp),%eax
 8050f46:	83 c6 08             	add    $0x8,%esi
 8050f49:	89 7e fc             	mov    %edi,-0x4(%esi)
 8050f4c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
 8050f52:	89 46 f8             	mov    %eax,-0x8(%esi)
 8050f55:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8050f5b:	83 c0 01             	add    $0x1,%eax
 8050f5e:	83 f8 07             	cmp    $0x7,%eax
 8050f61:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8050f67:	0f 8f eb 0a 00 00    	jg     8051a58 <_svfiprintf_r+0xba8>
 8050f6d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
 8050f73:	80 3b 00             	cmpb   $0x0,(%ebx)
 8050f76:	0f 84 11 09 00 00    	je     805188d <_svfiprintf_r+0x9dd>
 8050f7c:	8d 43 01             	lea    0x1(%ebx),%eax
 8050f7f:	31 ff                	xor    %edi,%edi
 8050f81:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8050f88:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8050f8f:	ff ff ff 
 8050f92:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
 8050f99:	00 00 00 
 8050f9c:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
 8050fa3:	00 00 00 
 8050fa6:	8d 50 01             	lea    0x1(%eax),%edx
 8050fa9:	0f be 00             	movsbl (%eax),%eax
 8050fac:	8d 48 e0             	lea    -0x20(%eax),%ecx
 8050faf:	83 f9 58             	cmp    $0x58,%ecx
 8050fb2:	0f 87 63 03 00 00    	ja     805131b <_svfiprintf_r+0x46b>
 8050fb8:	ff 24 8d e8 4a 05 08 	jmp    *0x8054ae8(,%ecx,4)
 8050fbf:	90                   	nop
 8050fc0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8050fc7:	89 d0                	mov    %edx,%eax
 8050fc9:	eb db                	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8050fcb:	8b 45 14             	mov    0x14(%ebp),%eax
 8050fce:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8050fd1:	8b 00                	mov    (%eax),%eax
 8050fd3:	83 c3 04             	add    $0x4,%ebx
 8050fd6:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8050fd9:	85 c0                	test   %eax,%eax
 8050fdb:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
 8050fe1:	79 e4                	jns    8050fc7 <_svfiprintf_r+0x117>
 8050fe3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
 8050fe9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
 8050ff0:	89 d0                	mov    %edx,%eax
 8050ff2:	eb b2                	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8050ff4:	bf 2b 00 00 00       	mov    $0x2b,%edi
 8050ff9:	89 d0                	mov    %edx,%eax
 8050ffb:	eb a9                	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8050ffd:	8b 45 14             	mov    0x14(%ebp),%eax
 8051000:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 8051007:	89 55 10             	mov    %edx,0x10(%ebp)
 805100a:	ba 02 00 00 00       	mov    $0x2,%edx
 805100f:	8b 08                	mov    (%eax),%ecx
 8051011:	83 c0 04             	add    $0x4,%eax
 8051014:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805101b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
 8051022:	89 45 14             	mov    %eax,0x14(%ebp)
 8051025:	c7 85 44 ff ff ff 0d 	movl   $0x805460d,-0xbc(%ebp)
 805102c:	46 05 08 
 805102f:	90                   	nop
 8051030:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051037:	31 ff                	xor    %edi,%edi
 8051039:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
 805103f:	89 d8                	mov    %ebx,%eax
 8051041:	24 7f                	and    $0x7f,%al
 8051043:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
 805104a:	0f 48 c3             	cmovs  %ebx,%eax
 805104d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
 8051053:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8051059:	85 c0                	test   %eax,%eax
 805105b:	75 08                	jne    8051065 <_svfiprintf_r+0x1b5>
 805105d:	85 c9                	test   %ecx,%ecx
 805105f:	0f 84 03 08 00 00    	je     8051868 <_svfiprintf_r+0x9b8>
 8051065:	80 fa 01             	cmp    $0x1,%dl
 8051068:	0f 84 8a 0a 00 00    	je     8051af8 <_svfiprintf_r+0xc48>
 805106e:	80 fa 02             	cmp    $0x2,%dl
 8051071:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 8051074:	0f 85 86 01 00 00    	jne    8051200 <_svfiprintf_r+0x350>
 805107a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
 8051080:	89 c8                	mov    %ecx,%eax
 8051082:	83 eb 01             	sub    $0x1,%ebx
 8051085:	83 e0 0f             	and    $0xf,%eax
 8051088:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
 805108c:	c1 e9 04             	shr    $0x4,%ecx
 805108f:	85 c9                	test   %ecx,%ecx
 8051091:	88 03                	mov    %al,(%ebx)
 8051093:	75 eb                	jne    8051080 <_svfiprintf_r+0x1d0>
 8051095:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8051098:	29 d8                	sub    %ebx,%eax
 805109a:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 80510a0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 80510a6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
 80510ac:	39 c1                	cmp    %eax,%ecx
 80510ae:	0f 4d c1             	cmovge %ecx,%eax
 80510b1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80510b7:	89 f8                	mov    %edi,%eax
 80510b9:	3c 01                	cmp    $0x1,%al
 80510bb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
 80510c2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 80510c8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
 80510ce:	89 d0                	mov    %edx,%eax
 80510d0:	89 cf                	mov    %ecx,%edi
 80510d2:	83 c0 02             	add    $0x2,%eax
 80510d5:	83 e7 02             	and    $0x2,%edi
 80510d8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
 80510de:	89 cf                	mov    %ecx,%edi
 80510e0:	0f 44 c2             	cmove  %edx,%eax
 80510e3:	81 e7 84 00 00 00    	and    $0x84,%edi
 80510e9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80510ef:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 80510f5:	0f 85 cd 04 00 00    	jne    80515c8 <_svfiprintf_r+0x718>
 80510fb:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 8051101:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 8051107:	85 ff                	test   %edi,%edi
 8051109:	0f 8e b9 04 00 00    	jle    80515c8 <_svfiprintf_r+0x718>
 805110f:	83 ff 10             	cmp    $0x10,%edi
 8051112:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051118:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805111e:	7e 7c                	jle    805119c <_svfiprintf_r+0x2ec>
 8051120:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
 8051126:	89 f1                	mov    %esi,%ecx
 8051128:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805112b:	8b 75 0c             	mov    0xc(%ebp),%esi
 805112e:	eb 08                	jmp    8051138 <_svfiprintf_r+0x288>
 8051130:	83 ef 10             	sub    $0x10,%edi
 8051133:	83 ff 10             	cmp    $0x10,%edi
 8051136:	7e 5c                	jle    8051194 <_svfiprintf_r+0x2e4>
 8051138:	83 c0 01             	add    $0x1,%eax
 805113b:	83 c2 10             	add    $0x10,%edx
 805113e:	c7 01 5c 4c 05 08    	movl   $0x8054c5c,(%ecx)
 8051144:	83 c1 08             	add    $0x8,%ecx
 8051147:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 805114e:	83 f8 07             	cmp    $0x7,%eax
 8051151:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051157:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805115d:	7e d1                	jle    8051130 <_svfiprintf_r+0x280>
 805115f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051165:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051169:	89 74 24 04          	mov    %esi,0x4(%esp)
 805116d:	89 1c 24             	mov    %ebx,(%esp)
 8051170:	e8 4b fb ff ff       	call   8050cc0 <__ssprint_r>
 8051175:	85 c0                	test   %eax,%eax
 8051177:	0f 85 3b 07 00 00    	jne    80518b8 <_svfiprintf_r+0xa08>
 805117d:	83 ef 10             	sub    $0x10,%edi
 8051180:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051186:	83 ff 10             	cmp    $0x10,%edi
 8051189:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805118f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 8051192:	7f a4                	jg     8051138 <_svfiprintf_r+0x288>
 8051194:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
 805119a:	89 ce                	mov    %ecx,%esi
 805119c:	83 c0 01             	add    $0x1,%eax
 805119f:	01 fa                	add    %edi,%edx
 80511a1:	c7 06 5c 4c 05 08    	movl   $0x8054c5c,(%esi)
 80511a7:	83 c6 08             	add    $0x8,%esi
 80511aa:	89 7e fc             	mov    %edi,-0x4(%esi)
 80511ad:	83 f8 07             	cmp    $0x7,%eax
 80511b0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80511b6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80511bc:	0f 8e 12 04 00 00    	jle    80515d4 <_svfiprintf_r+0x724>
 80511c2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80511c8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80511cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80511cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 80511d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80511d6:	89 04 24             	mov    %eax,(%esp)
 80511d9:	e8 e2 fa ff ff       	call   8050cc0 <__ssprint_r>
 80511de:	85 c0                	test   %eax,%eax
 80511e0:	0f 85 d2 06 00 00    	jne    80518b8 <_svfiprintf_r+0xa08>
 80511e6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80511ec:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80511ef:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80511f5:	e9 da 03 00 00       	jmp    80515d4 <_svfiprintf_r+0x724>
 80511fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051200:	89 c8                	mov    %ecx,%eax
 8051202:	83 eb 01             	sub    $0x1,%ebx
 8051205:	83 e0 07             	and    $0x7,%eax
 8051208:	c1 e9 03             	shr    $0x3,%ecx
 805120b:	83 c0 30             	add    $0x30,%eax
 805120e:	85 c9                	test   %ecx,%ecx
 8051210:	88 03                	mov    %al,(%ebx)
 8051212:	75 ec                	jne    8051200 <_svfiprintf_r+0x350>
 8051214:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 805121b:	89 da                	mov    %ebx,%edx
 805121d:	0f 84 72 fe ff ff    	je     8051095 <_svfiprintf_r+0x1e5>
 8051223:	3c 30                	cmp    $0x30,%al
 8051225:	0f 84 6a fe ff ff    	je     8051095 <_svfiprintf_r+0x1e5>
 805122b:	83 eb 01             	sub    $0x1,%ebx
 805122e:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8051231:	29 d8                	sub    %ebx,%eax
 8051233:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 8051237:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 805123d:	e9 5e fe ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 8051242:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051249:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051250:	89 55 10             	mov    %edx,0x10(%ebp)
 8051253:	8b 45 14             	mov    0x14(%ebp),%eax
 8051256:	0f 85 48 01 00 00    	jne    80513a4 <_svfiprintf_r+0x4f4>
 805125c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8051263:	0f 84 3b 01 00 00    	je     80513a4 <_svfiprintf_r+0x4f4>
 8051269:	0f b7 08             	movzwl (%eax),%ecx
 805126c:	83 c0 04             	add    $0x4,%eax
 805126f:	31 d2                	xor    %edx,%edx
 8051271:	89 45 14             	mov    %eax,0x14(%ebp)
 8051274:	e9 b7 fd ff ff       	jmp    8051030 <_svfiprintf_r+0x180>
 8051279:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051280:	89 f8                	mov    %edi,%eax
 8051282:	89 55 10             	mov    %edx,0x10(%ebp)
 8051285:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 805128b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051292:	8b 45 14             	mov    0x14(%ebp),%eax
 8051295:	75 0d                	jne    80512a4 <_svfiprintf_r+0x3f4>
 8051297:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 805129e:	0f 85 f2 08 00 00    	jne    8051b96 <_svfiprintf_r+0xce6>
 80512a4:	8b 08                	mov    (%eax),%ecx
 80512a6:	83 c0 04             	add    $0x4,%eax
 80512a9:	89 45 14             	mov    %eax,0x14(%ebp)
 80512ac:	85 c9                	test   %ecx,%ecx
 80512ae:	0f 88 f3 08 00 00    	js     8051ba7 <_svfiprintf_r+0xcf7>
 80512b4:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 80512bb:	ba 01 00 00 00       	mov    $0x1,%edx
 80512c0:	e9 74 fd ff ff       	jmp    8051039 <_svfiprintf_r+0x189>
 80512c5:	0f be 02             	movsbl (%edx),%eax
 80512c8:	8d 5a 01             	lea    0x1(%edx),%ebx
 80512cb:	83 f8 2a             	cmp    $0x2a,%eax
 80512ce:	0f 84 af 09 00 00    	je     8051c83 <_svfiprintf_r+0xdd3>
 80512d4:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80512d7:	31 d2                	xor    %edx,%edx
 80512d9:	83 f9 09             	cmp    $0x9,%ecx
 80512dc:	0f 87 90 09 00 00    	ja     8051c72 <_svfiprintf_r+0xdc2>
 80512e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80512e8:	8d 04 92             	lea    (%edx,%edx,4),%eax
 80512eb:	83 c3 01             	add    $0x1,%ebx
 80512ee:	8d 14 41             	lea    (%ecx,%eax,2),%edx
 80512f1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
 80512f5:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80512f8:	83 f9 09             	cmp    $0x9,%ecx
 80512fb:	76 eb                	jbe    80512e8 <_svfiprintf_r+0x438>
 80512fd:	85 d2                	test   %edx,%edx
 80512ff:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8051304:	0f 48 d1             	cmovs  %ecx,%edx
 8051307:	8d 48 e0             	lea    -0x20(%eax),%ecx
 805130a:	83 f9 58             	cmp    $0x58,%ecx
 805130d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
 8051313:	89 da                	mov    %ebx,%edx
 8051315:	0f 86 9d fc ff ff    	jbe    8050fb8 <_svfiprintf_r+0x108>
 805131b:	89 fb                	mov    %edi,%ebx
 805131d:	85 c0                	test   %eax,%eax
 805131f:	89 55 10             	mov    %edx,0x10(%ebp)
 8051322:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 8051328:	0f 84 5f 05 00 00    	je     805188d <_svfiprintf_r+0x9dd>
 805132e:	88 45 80             	mov    %al,-0x80(%ebp)
 8051331:	8d 5d 80             	lea    -0x80(%ebp),%ebx
 8051334:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805133b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 8051342:	00 00 00 
 8051345:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 805134c:	00 00 00 
 805134f:	e9 5a 01 00 00       	jmp    80514ae <_svfiprintf_r+0x5fe>
 8051354:	31 db                	xor    %ebx,%ebx
 8051356:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8051359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051360:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
 8051363:	83 c2 01             	add    $0x1,%edx
 8051366:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
 8051369:	0f be 42 ff          	movsbl -0x1(%edx),%eax
 805136d:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8051370:	83 f9 09             	cmp    $0x9,%ecx
 8051373:	76 eb                	jbe    8051360 <_svfiprintf_r+0x4b0>
 8051375:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
 805137b:	e9 2c fc ff ff       	jmp    8050fac <_svfiprintf_r+0xfc>
 8051380:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
 8051387:	00 00 00 
 805138a:	89 d0                	mov    %edx,%eax
 805138c:	e9 15 fc ff ff       	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8051391:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051398:	89 55 10             	mov    %edx,0x10(%ebp)
 805139b:	8b 45 14             	mov    0x14(%ebp),%eax
 805139e:	0f 84 b8 fe ff ff    	je     805125c <_svfiprintf_r+0x3ac>
 80513a4:	8b 08                	mov    (%eax),%ecx
 80513a6:	83 c0 04             	add    $0x4,%eax
 80513a9:	31 d2                	xor    %edx,%edx
 80513ab:	89 45 14             	mov    %eax,0x14(%ebp)
 80513ae:	e9 7d fc ff ff       	jmp    8051030 <_svfiprintf_r+0x180>
 80513b3:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80513ba:	89 f8                	mov    %edi,%eax
 80513bc:	89 55 10             	mov    %edx,0x10(%ebp)
 80513bf:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80513c5:	0f 85 a2 07 00 00    	jne    8051b6d <_svfiprintf_r+0xcbd>
 80513cb:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80513d2:	0f 84 95 07 00 00    	je     8051b6d <_svfiprintf_r+0xcbd>
 80513d8:	8b 45 14             	mov    0x14(%ebp),%eax
 80513db:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
 80513e2:	8b 00                	mov    (%eax),%eax
 80513e4:	66 89 18             	mov    %bx,(%eax)
 80513e7:	8b 45 14             	mov    0x14(%ebp),%eax
 80513ea:	83 c0 04             	add    $0x4,%eax
 80513ed:	89 45 14             	mov    %eax,0x14(%ebp)
 80513f0:	e9 19 fb ff ff       	jmp    8050f0e <_svfiprintf_r+0x5e>
 80513f5:	89 fb                	mov    %edi,%ebx
 80513f7:	89 55 10             	mov    %edx,0x10(%ebp)
 80513fa:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 8051400:	c7 85 44 ff ff ff 0d 	movl   $0x805460d,-0xbc(%ebp)
 8051407:	46 05 08 
 805140a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8051411:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051414:	75 0d                	jne    8051423 <_svfiprintf_r+0x573>
 8051416:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 805141d:	0f 85 65 07 00 00    	jne    8051b88 <_svfiprintf_r+0xcd8>
 8051423:	8b 0b                	mov    (%ebx),%ecx
 8051425:	83 c3 04             	add    $0x4,%ebx
 8051428:	89 5d 14             	mov    %ebx,0x14(%ebp)
 805142b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8051432:	ba 02 00 00 00       	mov    $0x2,%edx
 8051437:	0f 84 f3 fb ff ff    	je     8051030 <_svfiprintf_r+0x180>
 805143d:	85 c9                	test   %ecx,%ecx
 805143f:	0f 84 eb fb ff ff    	je     8051030 <_svfiprintf_r+0x180>
 8051445:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805144c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
 8051452:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 8051459:	e9 d2 fb ff ff       	jmp    8051030 <_svfiprintf_r+0x180>
 805145e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
 8051465:	89 d0                	mov    %edx,%eax
 8051467:	e9 3a fb ff ff       	jmp    8050fa6 <_svfiprintf_r+0xf6>
 805146c:	89 f8                	mov    %edi,%eax
 805146e:	89 55 10             	mov    %edx,0x10(%ebp)
 8051471:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 8051477:	e9 0f fe ff ff       	jmp    805128b <_svfiprintf_r+0x3db>
 805147c:	8b 45 14             	mov    0x14(%ebp),%eax
 805147f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
 8051482:	89 55 10             	mov    %edx,0x10(%ebp)
 8051485:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805148c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 8051493:	00 00 00 
 8051496:	8b 00                	mov    (%eax),%eax
 8051498:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 805149f:	00 00 00 
 80514a2:	88 45 80             	mov    %al,-0x80(%ebp)
 80514a5:	8b 45 14             	mov    0x14(%ebp),%eax
 80514a8:	83 c0 04             	add    $0x4,%eax
 80514ab:	89 45 14             	mov    %eax,0x14(%ebp)
 80514ae:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 80514b5:	00 00 00 
 80514b8:	e9 05 fc ff ff       	jmp    80510c2 <_svfiprintf_r+0x212>
 80514bd:	89 fb                	mov    %edi,%ebx
 80514bf:	89 55 10             	mov    %edx,0x10(%ebp)
 80514c2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
 80514c8:	c7 85 44 ff ff ff fc 	movl   $0x80545fc,-0xbc(%ebp)
 80514cf:	45 05 08 
 80514d2:	e9 33 ff ff ff       	jmp    805140a <_svfiprintf_r+0x55a>
 80514d7:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 80514de:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80514e5:	89 55 10             	mov    %edx,0x10(%ebp)
 80514e8:	8b 45 14             	mov    0x14(%ebp),%eax
 80514eb:	75 39                	jne    8051526 <_svfiprintf_r+0x676>
 80514ed:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80514f4:	74 30                	je     8051526 <_svfiprintf_r+0x676>
 80514f6:	0f b7 08             	movzwl (%eax),%ecx
 80514f9:	83 c0 04             	add    $0x4,%eax
 80514fc:	ba 01 00 00 00       	mov    $0x1,%edx
 8051501:	89 45 14             	mov    %eax,0x14(%ebp)
 8051504:	e9 27 fb ff ff       	jmp    8051030 <_svfiprintf_r+0x180>
 8051509:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
 8051510:	89 d0                	mov    %edx,%eax
 8051512:	e9 8f fa ff ff       	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8051517:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 805151e:	89 55 10             	mov    %edx,0x10(%ebp)
 8051521:	8b 45 14             	mov    0x14(%ebp),%eax
 8051524:	74 c7                	je     80514ed <_svfiprintf_r+0x63d>
 8051526:	8b 08                	mov    (%eax),%ecx
 8051528:	83 c0 04             	add    $0x4,%eax
 805152b:	ba 01 00 00 00       	mov    $0x1,%edx
 8051530:	89 45 14             	mov    %eax,0x14(%ebp)
 8051533:	e9 f8 fa ff ff       	jmp    8051030 <_svfiprintf_r+0x180>
 8051538:	8b 45 14             	mov    0x14(%ebp),%eax
 805153b:	89 55 10             	mov    %edx,0x10(%ebp)
 805153e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051545:	8b 18                	mov    (%eax),%ebx
 8051547:	8d 50 04             	lea    0x4(%eax),%edx
 805154a:	85 db                	test   %ebx,%ebx
 805154c:	0f 84 cc 06 00 00    	je     8051c1e <_svfiprintf_r+0xd6e>
 8051552:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051558:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
 805155e:	85 ff                	test   %edi,%edi
 8051560:	0f 88 59 06 00 00    	js     8051bbf <_svfiprintf_r+0xd0f>
 8051566:	89 7c 24 08          	mov    %edi,0x8(%esp)
 805156a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8051571:	00 
 8051572:	89 1c 24             	mov    %ebx,(%esp)
 8051575:	e8 06 e6 ff ff       	call   804fb80 <memchr>
 805157a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 8051580:	85 c0                	test   %eax,%eax
 8051582:	0f 84 c5 06 00 00    	je     8051c4d <_svfiprintf_r+0xd9d>
 8051588:	29 d8                	sub    %ebx,%eax
 805158a:	39 f8                	cmp    %edi,%eax
 805158c:	0f 4f c7             	cmovg  %edi,%eax
 805158f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8051596:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 805159c:	89 55 14             	mov    %edx,0x14(%ebp)
 805159f:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 80515a6:	00 00 00 
 80515a9:	e9 f2 fa ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 80515ae:	89 f8                	mov    %edi,%eax
 80515b0:	84 c0                	test   %al,%al
 80515b2:	b8 20 00 00 00       	mov    $0x20,%eax
 80515b7:	0f 44 f8             	cmove  %eax,%edi
 80515ba:	89 d0                	mov    %edx,%eax
 80515bc:	e9 e5 f9 ff ff       	jmp    8050fa6 <_svfiprintf_r+0xf6>
 80515c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80515c8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80515ce:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80515d4:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
 80515db:	74 2e                	je     805160b <_svfiprintf_r+0x75b>
 80515dd:	83 c0 01             	add    $0x1,%eax
 80515e0:	83 c2 01             	add    $0x1,%edx
 80515e3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
 80515e9:	83 c6 08             	add    $0x8,%esi
 80515ec:	89 4e f8             	mov    %ecx,-0x8(%esi)
 80515ef:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
 80515f6:	83 f8 07             	cmp    $0x7,%eax
 80515f9:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80515ff:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051605:	0f 8f b5 04 00 00    	jg     8051ac0 <_svfiprintf_r+0xc10>
 805160b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
 8051611:	85 c9                	test   %ecx,%ecx
 8051613:	74 2e                	je     8051643 <_svfiprintf_r+0x793>
 8051615:	83 c0 01             	add    $0x1,%eax
 8051618:	83 c2 02             	add    $0x2,%edx
 805161b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
 8051621:	83 c6 08             	add    $0x8,%esi
 8051624:	89 4e f8             	mov    %ecx,-0x8(%esi)
 8051627:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
 805162e:	83 f8 07             	cmp    $0x7,%eax
 8051631:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051637:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805163d:	0f 8f 45 04 00 00    	jg     8051a88 <_svfiprintf_r+0xbd8>
 8051643:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
 805164a:	00 00 00 
 805164d:	0f 84 9d 02 00 00    	je     80518f0 <_svfiprintf_r+0xa40>
 8051653:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051659:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
 805165f:	85 ff                	test   %edi,%edi
 8051661:	0f 8e e1 00 00 00    	jle    8051748 <_svfiprintf_r+0x898>
 8051667:	83 ff 10             	cmp    $0x10,%edi
 805166a:	0f 8e 7c 00 00 00    	jle    80516ec <_svfiprintf_r+0x83c>
 8051670:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
 8051676:	89 f1                	mov    %esi,%ecx
 8051678:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805167b:	8b 75 0c             	mov    0xc(%ebp),%esi
 805167e:	eb 08                	jmp    8051688 <_svfiprintf_r+0x7d8>
 8051680:	83 ef 10             	sub    $0x10,%edi
 8051683:	83 ff 10             	cmp    $0x10,%edi
 8051686:	7e 5c                	jle    80516e4 <_svfiprintf_r+0x834>
 8051688:	83 c0 01             	add    $0x1,%eax
 805168b:	83 c2 10             	add    $0x10,%edx
 805168e:	c7 01 4c 4c 05 08    	movl   $0x8054c4c,(%ecx)
 8051694:	83 c1 08             	add    $0x8,%ecx
 8051697:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 805169e:	83 f8 07             	cmp    $0x7,%eax
 80516a1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80516a7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80516ad:	7e d1                	jle    8051680 <_svfiprintf_r+0x7d0>
 80516af:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80516b5:	89 44 24 08          	mov    %eax,0x8(%esp)
 80516b9:	89 74 24 04          	mov    %esi,0x4(%esp)
 80516bd:	89 1c 24             	mov    %ebx,(%esp)
 80516c0:	e8 fb f5 ff ff       	call   8050cc0 <__ssprint_r>
 80516c5:	85 c0                	test   %eax,%eax
 80516c7:	0f 85 eb 01 00 00    	jne    80518b8 <_svfiprintf_r+0xa08>
 80516cd:	83 ef 10             	sub    $0x10,%edi
 80516d0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80516d6:	83 ff 10             	cmp    $0x10,%edi
 80516d9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80516df:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 80516e2:	7f a4                	jg     8051688 <_svfiprintf_r+0x7d8>
 80516e4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 80516ea:	89 ce                	mov    %ecx,%esi
 80516ec:	83 c0 01             	add    $0x1,%eax
 80516ef:	01 fa                	add    %edi,%edx
 80516f1:	c7 06 4c 4c 05 08    	movl   $0x8054c4c,(%esi)
 80516f7:	83 c6 08             	add    $0x8,%esi
 80516fa:	89 7e fc             	mov    %edi,-0x4(%esi)
 80516fd:	83 f8 07             	cmp    $0x7,%eax
 8051700:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051706:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805170c:	7e 3a                	jle    8051748 <_svfiprintf_r+0x898>
 805170e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051714:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051718:	8b 45 0c             	mov    0xc(%ebp),%eax
 805171b:	89 44 24 04          	mov    %eax,0x4(%esp)
 805171f:	8b 45 08             	mov    0x8(%ebp),%eax
 8051722:	89 04 24             	mov    %eax,(%esp)
 8051725:	e8 96 f5 ff ff       	call   8050cc0 <__ssprint_r>
 805172a:	85 c0                	test   %eax,%eax
 805172c:	0f 85 86 01 00 00    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051732:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051738:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805173b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051748:	89 1e                	mov    %ebx,(%esi)
 805174a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
 8051750:	83 c0 01             	add    $0x1,%eax
 8051753:	83 c6 08             	add    $0x8,%esi
 8051756:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805175c:	89 5e fc             	mov    %ebx,-0x4(%esi)
 805175f:	01 da                	add    %ebx,%edx
 8051761:	83 f8 07             	cmp    $0x7,%eax
 8051764:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805176a:	0f 8f 80 02 00 00    	jg     80519f0 <_svfiprintf_r+0xb40>
 8051770:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
 8051777:	0f 84 b9 00 00 00    	je     8051836 <_svfiprintf_r+0x986>
 805177d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 8051783:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 8051789:	85 ff                	test   %edi,%edi
 805178b:	0f 8e a5 00 00 00    	jle    8051836 <_svfiprintf_r+0x986>
 8051791:	83 ff 10             	cmp    $0x10,%edi
 8051794:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805179a:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
 80517a0:	7e 71                	jle    8051813 <_svfiprintf_r+0x963>
 80517a2:	89 f1                	mov    %esi,%ecx
 80517a4:	8b 75 08             	mov    0x8(%ebp),%esi
 80517a7:	eb 0f                	jmp    80517b8 <_svfiprintf_r+0x908>
 80517a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80517b0:	83 ef 10             	sub    $0x10,%edi
 80517b3:	83 ff 10             	cmp    $0x10,%edi
 80517b6:	7e 59                	jle    8051811 <_svfiprintf_r+0x961>
 80517b8:	83 c0 01             	add    $0x1,%eax
 80517bb:	83 c2 10             	add    $0x10,%edx
 80517be:	c7 01 5c 4c 05 08    	movl   $0x8054c5c,(%ecx)
 80517c4:	83 c1 08             	add    $0x8,%ecx
 80517c7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 80517ce:	83 f8 07             	cmp    $0x7,%eax
 80517d1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80517d7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80517dd:	7e d1                	jle    80517b0 <_svfiprintf_r+0x900>
 80517df:	8b 45 0c             	mov    0xc(%ebp),%eax
 80517e2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80517e6:	89 34 24             	mov    %esi,(%esp)
 80517e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80517ed:	e8 ce f4 ff ff       	call   8050cc0 <__ssprint_r>
 80517f2:	85 c0                	test   %eax,%eax
 80517f4:	0f 85 be 00 00 00    	jne    80518b8 <_svfiprintf_r+0xa08>
 80517fa:	83 ef 10             	sub    $0x10,%edi
 80517fd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051803:	83 ff 10             	cmp    $0x10,%edi
 8051806:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805180c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 805180f:	7f a7                	jg     80517b8 <_svfiprintf_r+0x908>
 8051811:	89 ce                	mov    %ecx,%esi
 8051813:	83 c0 01             	add    $0x1,%eax
 8051816:	01 fa                	add    %edi,%edx
 8051818:	83 f8 07             	cmp    $0x7,%eax
 805181b:	c7 06 5c 4c 05 08    	movl   $0x8054c5c,(%esi)
 8051821:	89 7e 04             	mov    %edi,0x4(%esi)
 8051824:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805182a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051830:	0f 8f ee 02 00 00    	jg     8051b24 <_svfiprintf_r+0xc74>
 8051836:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 805183c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
 8051842:	39 c6                	cmp    %eax,%esi
 8051844:	0f 4d c6             	cmovge %esi,%eax
 8051847:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 805184d:	85 d2                	test   %edx,%edx
 805184f:	0f 85 d3 01 00 00    	jne    8051a28 <_svfiprintf_r+0xb78>
 8051855:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 805185c:	00 00 00 
 805185f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051862:	e9 a7 f6 ff ff       	jmp    8050f0e <_svfiprintf_r+0x5e>
 8051867:	90                   	nop
 8051868:	84 d2                	test   %dl,%dl
 805186a:	75 6c                	jne    80518d8 <_svfiprintf_r+0xa28>
 805186c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8051873:	74 63                	je     80518d8 <_svfiprintf_r+0xa28>
 8051875:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 805187b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 805187e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 8051882:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051888:	e9 13 f8 ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 805188d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 8051893:	85 c0                	test   %eax,%eax
 8051895:	74 21                	je     80518b8 <_svfiprintf_r+0xa08>
 8051897:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 805189d:	89 44 24 08          	mov    %eax,0x8(%esp)
 80518a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80518a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80518a8:	8b 45 08             	mov    0x8(%ebp),%eax
 80518ab:	89 04 24             	mov    %eax,(%esp)
 80518ae:	e8 0d f4 ff ff       	call   8050cc0 <__ssprint_r>
 80518b3:	90                   	nop
 80518b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80518b8:	8b 75 0c             	mov    0xc(%ebp),%esi
 80518bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80518c0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
 80518c4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
 80518cb:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 80518d1:	5b                   	pop    %ebx
 80518d2:	5e                   	pop    %esi
 80518d3:	5f                   	pop    %edi
 80518d4:	5d                   	pop    %ebp
 80518d5:	c3                   	ret    
 80518d6:	66 90                	xchg   %ax,%ax
 80518d8:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
 80518df:	00 00 00 
 80518e2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 80518e5:	e9 b6 f7 ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 80518ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80518f0:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 80518f6:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 80518fc:	85 ff                	test   %edi,%edi
 80518fe:	0f 8e 4f fd ff ff    	jle    8051653 <_svfiprintf_r+0x7a3>
 8051904:	83 ff 10             	cmp    $0x10,%edi
 8051907:	0f 8e 7f 00 00 00    	jle    805198c <_svfiprintf_r+0xadc>
 805190d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
 8051913:	89 f1                	mov    %esi,%ecx
 8051915:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8051918:	8b 75 0c             	mov    0xc(%ebp),%esi
 805191b:	eb 0b                	jmp    8051928 <_svfiprintf_r+0xa78>
 805191d:	8d 76 00             	lea    0x0(%esi),%esi
 8051920:	83 ef 10             	sub    $0x10,%edi
 8051923:	83 ff 10             	cmp    $0x10,%edi
 8051926:	7e 5c                	jle    8051984 <_svfiprintf_r+0xad4>
 8051928:	83 c0 01             	add    $0x1,%eax
 805192b:	83 c2 10             	add    $0x10,%edx
 805192e:	c7 01 4c 4c 05 08    	movl   $0x8054c4c,(%ecx)
 8051934:	83 c1 08             	add    $0x8,%ecx
 8051937:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
 805193e:	83 f8 07             	cmp    $0x7,%eax
 8051941:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051947:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 805194d:	7e d1                	jle    8051920 <_svfiprintf_r+0xa70>
 805194f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051955:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051959:	89 74 24 04          	mov    %esi,0x4(%esp)
 805195d:	89 1c 24             	mov    %ebx,(%esp)
 8051960:	e8 5b f3 ff ff       	call   8050cc0 <__ssprint_r>
 8051965:	85 c0                	test   %eax,%eax
 8051967:	0f 85 4b ff ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 805196d:	83 ef 10             	sub    $0x10,%edi
 8051970:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051976:	83 ff 10             	cmp    $0x10,%edi
 8051979:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 805197f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 8051982:	7f a4                	jg     8051928 <_svfiprintf_r+0xa78>
 8051984:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
 805198a:	89 ce                	mov    %ecx,%esi
 805198c:	83 c0 01             	add    $0x1,%eax
 805198f:	01 fa                	add    %edi,%edx
 8051991:	c7 06 4c 4c 05 08    	movl   $0x8054c4c,(%esi)
 8051997:	83 c6 08             	add    $0x8,%esi
 805199a:	89 7e fc             	mov    %edi,-0x4(%esi)
 805199d:	83 f8 07             	cmp    $0x7,%eax
 80519a0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80519a6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80519ac:	0f 8e a1 fc ff ff    	jle    8051653 <_svfiprintf_r+0x7a3>
 80519b2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80519b8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80519bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80519bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 80519c3:	8b 45 08             	mov    0x8(%ebp),%eax
 80519c6:	89 04 24             	mov    %eax,(%esp)
 80519c9:	e8 f2 f2 ff ff       	call   8050cc0 <__ssprint_r>
 80519ce:	85 c0                	test   %eax,%eax
 80519d0:	0f 85 e2 fe ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 80519d6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80519dc:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80519df:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80519e5:	e9 69 fc ff ff       	jmp    8051653 <_svfiprintf_r+0x7a3>
 80519ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80519f0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 80519f6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80519fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 80519fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a01:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a04:	89 04 24             	mov    %eax,(%esp)
 8051a07:	e8 b4 f2 ff ff       	call   8050cc0 <__ssprint_r>
 8051a0c:	85 c0                	test   %eax,%eax
 8051a0e:	0f 85 a4 fe ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051a14:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051a1a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051a1d:	e9 4e fd ff ff       	jmp    8051770 <_svfiprintf_r+0x8c0>
 8051a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051a28:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a2e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a32:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a35:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a39:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a3c:	89 04 24             	mov    %eax,(%esp)
 8051a3f:	e8 7c f2 ff ff       	call   8050cc0 <__ssprint_r>
 8051a44:	85 c0                	test   %eax,%eax
 8051a46:	0f 84 09 fe ff ff    	je     8051855 <_svfiprintf_r+0x9a5>
 8051a4c:	e9 67 fe ff ff       	jmp    80518b8 <_svfiprintf_r+0xa08>
 8051a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051a58:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a5e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a62:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a65:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a69:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a6c:	89 04 24             	mov    %eax,(%esp)
 8051a6f:	e8 4c f2 ff ff       	call   8050cc0 <__ssprint_r>
 8051a74:	85 c0                	test   %eax,%eax
 8051a76:	0f 85 3c fe ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051a7c:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051a7f:	e9 e9 f4 ff ff       	jmp    8050f6d <_svfiprintf_r+0xbd>
 8051a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051a88:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051a8e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051a92:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051a95:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051a99:	8b 45 08             	mov    0x8(%ebp),%eax
 8051a9c:	89 04 24             	mov    %eax,(%esp)
 8051a9f:	e8 1c f2 ff ff       	call   8050cc0 <__ssprint_r>
 8051aa4:	85 c0                	test   %eax,%eax
 8051aa6:	0f 85 0c fe ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051aac:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051ab2:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051ab5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051abb:	e9 83 fb ff ff       	jmp    8051643 <_svfiprintf_r+0x793>
 8051ac0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051ac6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051aca:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051acd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 8051ad4:	89 04 24             	mov    %eax,(%esp)
 8051ad7:	e8 e4 f1 ff ff       	call   8050cc0 <__ssprint_r>
 8051adc:	85 c0                	test   %eax,%eax
 8051ade:	0f 85 d4 fd ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051ae4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051aea:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051aed:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051af3:	e9 13 fb ff ff       	jmp    805160b <_svfiprintf_r+0x75b>
 8051af8:	83 f9 09             	cmp    $0x9,%ecx
 8051afb:	76 56                	jbe    8051b53 <_svfiprintf_r+0xca3>
 8051afd:	8d 5d a8             	lea    -0x58(%ebp),%ebx
 8051b00:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
 8051b05:	83 eb 01             	sub    $0x1,%ebx
 8051b08:	f7 e1                	mul    %ecx
 8051b0a:	c1 ea 03             	shr    $0x3,%edx
 8051b0d:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8051b10:	01 c0                	add    %eax,%eax
 8051b12:	29 c1                	sub    %eax,%ecx
 8051b14:	83 c1 30             	add    $0x30,%ecx
 8051b17:	85 d2                	test   %edx,%edx
 8051b19:	88 0b                	mov    %cl,(%ebx)
 8051b1b:	89 d1                	mov    %edx,%ecx
 8051b1d:	75 e1                	jne    8051b00 <_svfiprintf_r+0xc50>
 8051b1f:	e9 71 f5 ff ff       	jmp    8051095 <_svfiprintf_r+0x1e5>
 8051b24:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8051b2a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051b2e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051b31:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051b35:	8b 45 08             	mov    0x8(%ebp),%eax
 8051b38:	89 04 24             	mov    %eax,(%esp)
 8051b3b:	e8 80 f1 ff ff       	call   8050cc0 <__ssprint_r>
 8051b40:	85 c0                	test   %eax,%eax
 8051b42:	0f 85 70 fd ff ff    	jne    80518b8 <_svfiprintf_r+0xa08>
 8051b48:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051b4e:	e9 e3 fc ff ff       	jmp    8051836 <_svfiprintf_r+0x986>
 8051b53:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 8051b59:	83 c1 30             	add    $0x30,%ecx
 8051b5c:	88 4d a7             	mov    %cl,-0x59(%ebp)
 8051b5f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
 8051b62:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051b68:	e9 33 f5 ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 8051b6d:	8b 45 14             	mov    0x14(%ebp),%eax
 8051b70:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
 8051b76:	8b 00                	mov    (%eax),%eax
 8051b78:	89 18                	mov    %ebx,(%eax)
 8051b7a:	8b 45 14             	mov    0x14(%ebp),%eax
 8051b7d:	83 c0 04             	add    $0x4,%eax
 8051b80:	89 45 14             	mov    %eax,0x14(%ebp)
 8051b83:	e9 86 f3 ff ff       	jmp    8050f0e <_svfiprintf_r+0x5e>
 8051b88:	0f b7 0b             	movzwl (%ebx),%ecx
 8051b8b:	83 c3 04             	add    $0x4,%ebx
 8051b8e:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8051b91:	e9 95 f8 ff ff       	jmp    805142b <_svfiprintf_r+0x57b>
 8051b96:	0f bf 08             	movswl (%eax),%ecx
 8051b99:	83 c0 04             	add    $0x4,%eax
 8051b9c:	89 45 14             	mov    %eax,0x14(%ebp)
 8051b9f:	85 c9                	test   %ecx,%ecx
 8051ba1:	0f 89 0d f7 ff ff    	jns    80512b4 <_svfiprintf_r+0x404>
 8051ba7:	f7 d9                	neg    %ecx
 8051ba9:	bf 2d 00 00 00       	mov    $0x2d,%edi
 8051bae:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
 8051bb5:	ba 01 00 00 00       	mov    $0x1,%edx
 8051bba:	e9 7a f4 ff ff       	jmp    8051039 <_svfiprintf_r+0x189>
 8051bbf:	89 1c 24             	mov    %ebx,(%esp)
 8051bc2:	e8 09 76 ff ff       	call   80491d0 <strlen>
 8051bc7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
 8051bcd:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8051bd4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051bdb:	00 00 00 
 8051bde:	89 55 14             	mov    %edx,0x14(%ebp)
 8051be1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051be7:	e9 b4 f4 ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 8051bec:	8b 45 08             	mov    0x8(%ebp),%eax
 8051bef:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 8051bf6:	00 
 8051bf7:	89 04 24             	mov    %eax,(%esp)
 8051bfa:	e8 41 d8 ff ff       	call   804f440 <_malloc_r>
 8051bff:	8b 75 0c             	mov    0xc(%ebp),%esi
 8051c02:	85 c0                	test   %eax,%eax
 8051c04:	89 06                	mov    %eax,(%esi)
 8051c06:	89 46 10             	mov    %eax,0x10(%esi)
 8051c09:	0f 84 a3 00 00 00    	je     8051cb2 <_svfiprintf_r+0xe02>
 8051c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051c12:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
 8051c19:	e9 b2 f2 ff ff       	jmp    8050ed0 <_svfiprintf_r+0x20>
 8051c1e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8051c24:	b8 06 00 00 00       	mov    $0x6,%eax
 8051c29:	89 55 14             	mov    %edx,0x14(%ebp)
 8051c2c:	83 ff 06             	cmp    $0x6,%edi
 8051c2f:	0f 46 c7             	cmovbe %edi,%eax
 8051c32:	85 c0                	test   %eax,%eax
 8051c34:	0f 49 d8             	cmovns %eax,%ebx
 8051c37:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
 8051c3d:	bb 1e 46 05 08       	mov    $0x805461e,%ebx
 8051c42:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051c48:	e9 61 f8 ff ff       	jmp    80514ae <_svfiprintf_r+0x5fe>
 8051c4d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8051c53:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8051c5a:	89 55 14             	mov    %edx,0x14(%ebp)
 8051c5d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051c64:	00 00 00 
 8051c67:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8051c6d:	e9 2e f4 ff ff       	jmp    80510a0 <_svfiprintf_r+0x1f0>
 8051c72:	89 da                	mov    %ebx,%edx
 8051c74:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8051c7b:	00 00 00 
 8051c7e:	e9 29 f3 ff ff       	jmp    8050fac <_svfiprintf_r+0xfc>
 8051c83:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051c86:	89 da                	mov    %ebx,%edx
 8051c88:	8b 45 14             	mov    0x14(%ebp),%eax
 8051c8b:	8b 09                	mov    (%ecx),%ecx
 8051c8d:	83 c0 04             	add    $0x4,%eax
 8051c90:	89 45 14             	mov    %eax,0x14(%ebp)
 8051c93:	85 c9                	test   %ecx,%ecx
 8051c95:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 8051c9b:	0f 89 26 f3 ff ff    	jns    8050fc7 <_svfiprintf_r+0x117>
 8051ca1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8051ca8:	ff ff ff 
 8051cab:	89 d0                	mov    %edx,%eax
 8051cad:	e9 f4 f2 ff ff       	jmp    8050fa6 <_svfiprintf_r+0xf6>
 8051cb2:	8b 45 08             	mov    0x8(%ebp),%eax
 8051cb5:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8051cbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051cc0:	e9 06 fc ff ff       	jmp    80518cb <_svfiprintf_r+0xa1b>
 8051cc5:	66 90                	xchg   %ax,%ax
 8051cc7:	66 90                	xchg   %ax,%ax
 8051cc9:	66 90                	xchg   %ax,%ax
 8051ccb:	66 90                	xchg   %ax,%ax
 8051ccd:	66 90                	xchg   %ax,%ax
 8051ccf:	90                   	nop

08051cd0 <__sprint_r.part.0>:
 8051cd0:	55                   	push   %ebp
 8051cd1:	89 e5                	mov    %esp,%ebp
 8051cd3:	57                   	push   %edi
 8051cd4:	56                   	push   %esi
 8051cd5:	53                   	push   %ebx
 8051cd6:	83 ec 2c             	sub    $0x2c,%esp
 8051cd9:	f6 42 65 20          	testb  $0x20,0x65(%edx)
 8051cdd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8051ce0:	89 c8                	mov    %ecx,%eax
 8051ce2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 8051ce5:	0f 84 a5 00 00 00    	je     8051d90 <__sprint_r.part.0+0xc0>
 8051ceb:	8b 40 08             	mov    0x8(%eax),%eax
 8051cee:	8b 09                	mov    (%ecx),%ecx
 8051cf0:	85 c0                	test   %eax,%eax
 8051cf2:	89 4d d8             	mov    %ecx,-0x28(%ebp)
 8051cf5:	0f 84 8a 00 00 00    	je     8051d85 <__sprint_r.part.0+0xb5>
 8051cfb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 8051cfe:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8051d01:	31 ff                	xor    %edi,%edi
 8051d03:	8b 58 04             	mov    0x4(%eax),%ebx
 8051d06:	8b 30                	mov    (%eax),%esi
 8051d08:	c1 eb 02             	shr    $0x2,%ebx
 8051d0b:	85 db                	test   %ebx,%ebx
 8051d0d:	7e 5c                	jle    8051d6b <__sprint_r.part.0+0x9b>
 8051d0f:	89 5d e0             	mov    %ebx,-0x20(%ebp)
 8051d12:	89 f3                	mov    %esi,%ebx
 8051d14:	89 fe                	mov    %edi,%esi
 8051d16:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8051d19:	eb 0d                	jmp    8051d28 <__sprint_r.part.0+0x58>
 8051d1b:	90                   	nop
 8051d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051d20:	83 c6 01             	add    $0x1,%esi
 8051d23:	39 75 e0             	cmp    %esi,-0x20(%ebp)
 8051d26:	74 40                	je     8051d68 <__sprint_r.part.0+0x98>
 8051d28:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8051d2c:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 8051d2f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051d33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8051d36:	89 04 24             	mov    %eax,(%esp)
 8051d39:	e8 b2 13 00 00       	call   80530f0 <_fputwc_r>
 8051d3e:	83 f8 ff             	cmp    $0xffffffff,%eax
 8051d41:	75 dd                	jne    8051d20 <__sprint_r.part.0+0x50>
 8051d43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051d48:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8051d4b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8051d52:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
 8051d59:	83 c4 2c             	add    $0x2c,%esp
 8051d5c:	5b                   	pop    %ebx
 8051d5d:	5e                   	pop    %esi
 8051d5e:	5f                   	pop    %edi
 8051d5f:	5d                   	pop    %ebp
 8051d60:	c3                   	ret    
 8051d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051d68:	8b 5d e0             	mov    -0x20(%ebp),%ebx
 8051d6b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8051d6e:	c1 e3 02             	shl    $0x2,%ebx
 8051d71:	83 45 d8 08          	addl   $0x8,-0x28(%ebp)
 8051d75:	8b 41 08             	mov    0x8(%ecx),%eax
 8051d78:	29 d8                	sub    %ebx,%eax
 8051d7a:	85 c0                	test   %eax,%eax
 8051d7c:	89 41 08             	mov    %eax,0x8(%ecx)
 8051d7f:	0f 85 79 ff ff ff    	jne    8051cfe <__sprint_r.part.0+0x2e>
 8051d85:	31 c0                	xor    %eax,%eax
 8051d87:	eb bf                	jmp    8051d48 <__sprint_r.part.0+0x78>
 8051d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8051d90:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8051d93:	89 54 24 04          	mov    %edx,0x4(%esp)
 8051d97:	89 44 24 08          	mov    %eax,0x8(%esp)
 8051d9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8051d9e:	89 04 24             	mov    %eax,(%esp)
 8051da1:	e8 1a 15 00 00       	call   80532c0 <__sfvwrite_r>
 8051da6:	eb a0                	jmp    8051d48 <__sprint_r.part.0+0x78>
 8051da8:	90                   	nop
 8051da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08051db0 <__sprint_r>:
 8051db0:	55                   	push   %ebp
 8051db1:	89 e5                	mov    %esp,%ebp
 8051db3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8051db6:	8b 45 08             	mov    0x8(%ebp),%eax
 8051db9:	8b 55 0c             	mov    0xc(%ebp),%edx
 8051dbc:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 8051dc0:	74 06                	je     8051dc8 <__sprint_r+0x18>
 8051dc2:	5d                   	pop    %ebp
 8051dc3:	e9 08 ff ff ff       	jmp    8051cd0 <__sprint_r.part.0>
 8051dc8:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
 8051dcf:	31 c0                	xor    %eax,%eax
 8051dd1:	5d                   	pop    %ebp
 8051dd2:	c3                   	ret    
 8051dd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08051de0 <_vfiprintf_r>:
 8051de0:	55                   	push   %ebp
 8051de1:	89 e5                	mov    %esp,%ebp
 8051de3:	57                   	push   %edi
 8051de4:	56                   	push   %esi
 8051de5:	53                   	push   %ebx
 8051de6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
 8051dec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8051def:	85 db                	test   %ebx,%ebx
 8051df1:	74 0e                	je     8051e01 <_vfiprintf_r+0x21>
 8051df3:	8b 45 08             	mov    0x8(%ebp),%eax
 8051df6:	8b 48 38             	mov    0x38(%eax),%ecx
 8051df9:	85 c9                	test   %ecx,%ecx
 8051dfb:	0f 84 c7 01 00 00    	je     8051fc8 <_vfiprintf_r+0x1e8>
 8051e01:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051e04:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 8051e08:	f6 c4 20             	test   $0x20,%ah
 8051e0b:	75 11                	jne    8051e1e <_vfiprintf_r+0x3e>
 8051e0d:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8051e10:	80 cc 20             	or     $0x20,%ah
 8051e13:	81 67 64 ff df ff ff 	andl   $0xffffdfff,0x64(%edi)
 8051e1a:	66 89 47 0c          	mov    %ax,0xc(%edi)
 8051e1e:	a8 08                	test   $0x8,%al
 8051e20:	0f 84 3a 01 00 00    	je     8051f60 <_vfiprintf_r+0x180>
 8051e26:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8051e29:	8b 57 10             	mov    0x10(%edi),%edx
 8051e2c:	85 d2                	test   %edx,%edx
 8051e2e:	0f 84 2c 01 00 00    	je     8051f60 <_vfiprintf_r+0x180>
 8051e34:	83 e0 1a             	and    $0x1a,%eax
 8051e37:	66 83 f8 0a          	cmp    $0xa,%ax
 8051e3b:	0f 84 49 01 00 00    	je     8051f8a <_vfiprintf_r+0x1aa>
 8051e41:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8051e44:	8d 7d a7             	lea    -0x59(%ebp),%edi
 8051e47:	89 c6                	mov    %eax,%esi
 8051e49:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8051e4f:	29 f8                	sub    %edi,%eax
 8051e51:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
 8051e58:	00 00 00 
 8051e5b:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8051e62:	00 00 00 
 8051e65:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
 8051e6c:	00 00 00 
 8051e6f:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
 8051e76:	00 00 00 
 8051e79:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
 8051e7f:	8b 45 10             	mov    0x10(%ebp),%eax
 8051e82:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8051e85:	0f b6 00             	movzbl (%eax),%eax
 8051e88:	84 c0                	test   %al,%al
 8051e8a:	74 5b                	je     8051ee7 <_vfiprintf_r+0x107>
 8051e8c:	3c 25                	cmp    $0x25,%al
 8051e8e:	75 12                	jne    8051ea2 <_vfiprintf_r+0xc2>
 8051e90:	eb 55                	jmp    8051ee7 <_vfiprintf_r+0x107>
 8051e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051e98:	84 c0                	test   %al,%al
 8051e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051ea0:	74 0a                	je     8051eac <_vfiprintf_r+0xcc>
 8051ea2:	83 c3 01             	add    $0x1,%ebx
 8051ea5:	0f b6 03             	movzbl (%ebx),%eax
 8051ea8:	3c 25                	cmp    $0x25,%al
 8051eaa:	75 ec                	jne    8051e98 <_vfiprintf_r+0xb8>
 8051eac:	89 df                	mov    %ebx,%edi
 8051eae:	2b 7d 10             	sub    0x10(%ebp),%edi
 8051eb1:	74 34                	je     8051ee7 <_vfiprintf_r+0x107>
 8051eb3:	8b 45 10             	mov    0x10(%ebp),%eax
 8051eb6:	83 c6 08             	add    $0x8,%esi
 8051eb9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8051ebf:	89 7e fc             	mov    %edi,-0x4(%esi)
 8051ec2:	89 46 f8             	mov    %eax,-0x8(%esi)
 8051ec5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8051ecb:	01 fa                	add    %edi,%edx
 8051ecd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8051ed3:	83 c0 01             	add    $0x1,%eax
 8051ed6:	83 f8 07             	cmp    $0x7,%eax
 8051ed9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 8051edf:	7f 57                	jg     8051f38 <_vfiprintf_r+0x158>
 8051ee1:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
 8051ee7:	80 3b 00             	cmpb   $0x0,(%ebx)
 8051eea:	0f 84 f9 07 00 00    	je     80526e9 <_vfiprintf_r+0x909>
 8051ef0:	83 c3 01             	add    $0x1,%ebx
 8051ef3:	31 ff                	xor    %edi,%edi
 8051ef5:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8051efc:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8051f03:	ff ff ff 
 8051f06:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
 8051f0d:	00 00 00 
 8051f10:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
 8051f17:	00 00 00 
 8051f1a:	0f be 03             	movsbl (%ebx),%eax
 8051f1d:	8d 53 01             	lea    0x1(%ebx),%edx
 8051f20:	8d 48 e0             	lea    -0x20(%eax),%ecx
 8051f23:	83 f9 58             	cmp    $0x58,%ecx
 8051f26:	0f 87 15 06 00 00    	ja     8052541 <_vfiprintf_r+0x761>
 8051f2c:	ff 24 8d 6c 4c 05 08 	jmp    *0x8054c6c(,%ecx,4)
 8051f33:	90                   	nop
 8051f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051f38:	85 d2                	test   %edx,%edx
 8051f3a:	0f 85 e8 0b 00 00    	jne    8052b28 <_vfiprintf_r+0xd48>
 8051f40:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8051f47:	00 00 00 
 8051f4a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8051f4d:	eb 92                	jmp    8051ee1 <_vfiprintf_r+0x101>
 8051f4f:	90                   	nop
 8051f50:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8051f57:	89 d3                	mov    %edx,%ebx
 8051f59:	eb bf                	jmp    8051f1a <_vfiprintf_r+0x13a>
 8051f5b:	90                   	nop
 8051f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8051f60:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f63:	89 44 24 04          	mov    %eax,0x4(%esp)
 8051f67:	8b 45 08             	mov    0x8(%ebp),%eax
 8051f6a:	89 04 24             	mov    %eax,(%esp)
 8051f6d:	e8 5e b2 ff ff       	call   804d1d0 <__swsetup_r>
 8051f72:	85 c0                	test   %eax,%eax
 8051f74:	75 42                	jne    8051fb8 <_vfiprintf_r+0x1d8>
 8051f76:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f79:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 8051f7d:	83 e0 1a             	and    $0x1a,%eax
 8051f80:	66 83 f8 0a          	cmp    $0xa,%ax
 8051f84:	0f 85 b7 fe ff ff    	jne    8051e41 <_vfiprintf_r+0x61>
 8051f8a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8051f8d:	66 83 78 0e 00       	cmpw   $0x0,0xe(%eax)
 8051f92:	0f 88 a9 fe ff ff    	js     8051e41 <_vfiprintf_r+0x61>
 8051f98:	8b 45 14             	mov    0x14(%ebp),%eax
 8051f9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8051f9e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8051fa1:	89 04 24             	mov    %eax,(%esp)
 8051fa4:	8b 45 08             	mov    0x8(%ebp),%eax
 8051fa7:	e8 04 0e 00 00       	call   8052db0 <__sbprintf>
 8051fac:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8051fb2:	5b                   	pop    %ebx
 8051fb3:	5e                   	pop    %esi
 8051fb4:	5f                   	pop    %edi
 8051fb5:	5d                   	pop    %ebp
 8051fb6:	c3                   	ret    
 8051fb7:	90                   	nop
 8051fb8:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8051fbe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8051fc3:	5b                   	pop    %ebx
 8051fc4:	5e                   	pop    %esi
 8051fc5:	5f                   	pop    %edi
 8051fc6:	5d                   	pop    %ebp
 8051fc7:	c3                   	ret    
 8051fc8:	89 04 24             	mov    %eax,(%esp)
 8051fcb:	e8 70 ca ff ff       	call   804ea40 <__sinit>
 8051fd0:	e9 2c fe ff ff       	jmp    8051e01 <_vfiprintf_r+0x21>
 8051fd5:	8b 45 14             	mov    0x14(%ebp),%eax
 8051fd8:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051fdb:	8b 00                	mov    (%eax),%eax
 8051fdd:	83 c1 04             	add    $0x4,%ecx
 8051fe0:	89 4d 14             	mov    %ecx,0x14(%ebp)
 8051fe3:	85 c0                	test   %eax,%eax
 8051fe5:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
 8051feb:	0f 89 66 ff ff ff    	jns    8051f57 <_vfiprintf_r+0x177>
 8051ff1:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
 8051ff7:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
 8051ffe:	89 d3                	mov    %edx,%ebx
 8052000:	e9 15 ff ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 8052005:	bf 2b 00 00 00       	mov    $0x2b,%edi
 805200a:	89 d3                	mov    %edx,%ebx
 805200c:	e9 09 ff ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 8052011:	8b 45 14             	mov    0x14(%ebp),%eax
 8052014:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 805201b:	89 55 10             	mov    %edx,0x10(%ebp)
 805201e:	ba 02 00 00 00       	mov    $0x2,%edx
 8052023:	8b 08                	mov    (%eax),%ecx
 8052025:	83 c0 04             	add    $0x4,%eax
 8052028:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 805202f:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
 8052036:	89 45 14             	mov    %eax,0x14(%ebp)
 8052039:	c7 85 40 ff ff ff 0d 	movl   $0x805460d,-0xc0(%ebp)
 8052040:	46 05 08 
 8052043:	90                   	nop
 8052044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052048:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 805204f:	31 ff                	xor    %edi,%edi
 8052051:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
 8052057:	89 d8                	mov    %ebx,%eax
 8052059:	24 7f                	and    $0x7f,%al
 805205b:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
 8052062:	0f 48 c3             	cmovs  %ebx,%eax
 8052065:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
 805206b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8052071:	85 c0                	test   %eax,%eax
 8052073:	75 08                	jne    805207d <_vfiprintf_r+0x29d>
 8052075:	85 c9                	test   %ecx,%ecx
 8052077:	0f 84 8b 08 00 00    	je     8052908 <_vfiprintf_r+0xb28>
 805207d:	80 fa 01             	cmp    $0x1,%dl
 8052080:	0f 84 52 0a 00 00    	je     8052ad8 <_vfiprintf_r+0xcf8>
 8052086:	80 fa 02             	cmp    $0x2,%dl
 8052089:	8d 45 a8             	lea    -0x58(%ebp),%eax
 805208c:	0f 85 ee 09 00 00    	jne    8052a80 <_vfiprintf_r+0xca0>
 8052092:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
 8052098:	89 ca                	mov    %ecx,%edx
 805209a:	83 e8 01             	sub    $0x1,%eax
 805209d:	83 e2 0f             	and    $0xf,%edx
 80520a0:	0f b6 14 13          	movzbl (%ebx,%edx,1),%edx
 80520a4:	c1 e9 04             	shr    $0x4,%ecx
 80520a7:	85 c9                	test   %ecx,%ecx
 80520a9:	88 10                	mov    %dl,(%eax)
 80520ab:	75 eb                	jne    8052098 <_vfiprintf_r+0x2b8>
 80520ad:	8d 4d a8             	lea    -0x58(%ebp),%ecx
 80520b0:	29 c1                	sub    %eax,%ecx
 80520b2:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 80520b8:	89 8d 58 ff ff ff    	mov    %ecx,-0xa8(%ebp)
 80520be:	66 90                	xchg   %ax,%ax
 80520c0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 80520c6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
 80520cc:	39 c1                	cmp    %eax,%ecx
 80520ce:	0f 4d c1             	cmovge %ecx,%eax
 80520d1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 80520d7:	89 f8                	mov    %edi,%eax
 80520d9:	3c 01                	cmp    $0x1,%al
 80520db:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
 80520e2:	8b 9d 60 ff ff ff    	mov    -0xa0(%ebp),%ebx
 80520e8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
 80520ee:	89 d8                	mov    %ebx,%eax
 80520f0:	89 cf                	mov    %ecx,%edi
 80520f2:	83 c0 02             	add    $0x2,%eax
 80520f5:	83 e7 02             	and    $0x2,%edi
 80520f8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
 80520fe:	89 cf                	mov    %ecx,%edi
 8052100:	0f 44 c3             	cmove  %ebx,%eax
 8052103:	81 e7 84 00 00 00    	and    $0x84,%edi
 8052109:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 805210f:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
 8052115:	0f 85 b5 04 00 00    	jne    80525d0 <_vfiprintf_r+0x7f0>
 805211b:	8b 9d 54 ff ff ff    	mov    -0xac(%ebp),%ebx
 8052121:	2b 9d 60 ff ff ff    	sub    -0xa0(%ebp),%ebx
 8052127:	85 db                	test   %ebx,%ebx
 8052129:	0f 8e a1 04 00 00    	jle    80525d0 <_vfiprintf_r+0x7f0>
 805212f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052135:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 805213b:	83 c0 01             	add    $0x1,%eax
 805213e:	83 fb 10             	cmp    $0x10,%ebx
 8052141:	7e 5b                	jle    805219e <_vfiprintf_r+0x3be>
 8052143:	8b bd 78 ff ff ff    	mov    -0x88(%ebp),%edi
 8052149:	eb 15                	jmp    8052160 <_vfiprintf_r+0x380>
 805214b:	90                   	nop
 805214c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052150:	8d 47 02             	lea    0x2(%edi),%eax
 8052153:	83 c6 08             	add    $0x8,%esi
 8052156:	89 cf                	mov    %ecx,%edi
 8052158:	83 eb 10             	sub    $0x10,%ebx
 805215b:	83 fb 10             	cmp    $0x10,%ebx
 805215e:	7e 3e                	jle    805219e <_vfiprintf_r+0x3be>
 8052160:	8d 4f 01             	lea    0x1(%edi),%ecx
 8052163:	83 c2 10             	add    $0x10,%edx
 8052166:	83 f9 07             	cmp    $0x7,%ecx
 8052169:	c7 06 e0 4d 05 08    	movl   $0x8054de0,(%esi)
 805216f:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 8052176:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805217c:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052182:	7e cc                	jle    8052150 <_vfiprintf_r+0x370>
 8052184:	85 d2                	test   %edx,%edx
 8052186:	0f 85 14 04 00 00    	jne    80525a0 <_vfiprintf_r+0x7c0>
 805218c:	83 eb 10             	sub    $0x10,%ebx
 805218f:	31 ff                	xor    %edi,%edi
 8052191:	83 fb 10             	cmp    $0x10,%ebx
 8052194:	b8 01 00 00 00       	mov    $0x1,%eax
 8052199:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805219c:	7f c2                	jg     8052160 <_vfiprintf_r+0x380>
 805219e:	01 da                	add    %ebx,%edx
 80521a0:	83 f8 07             	cmp    $0x7,%eax
 80521a3:	c7 06 e0 4d 05 08    	movl   $0x8054de0,(%esi)
 80521a9:	89 5e 04             	mov    %ebx,0x4(%esi)
 80521ac:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80521b2:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80521b8:	0f 8f 02 09 00 00    	jg     8052ac0 <_vfiprintf_r+0xce0>
 80521be:	83 c6 08             	add    $0x8,%esi
 80521c1:	8d 48 01             	lea    0x1(%eax),%ecx
 80521c4:	e9 16 04 00 00       	jmp    80525df <_vfiprintf_r+0x7ff>
 80521c9:	8b 45 14             	mov    0x14(%ebp),%eax
 80521cc:	89 55 10             	mov    %edx,0x10(%ebp)
 80521cf:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 80521d6:	8d 58 04             	lea    0x4(%eax),%ebx
 80521d9:	8b 00                	mov    (%eax),%eax
 80521db:	85 c0                	test   %eax,%eax
 80521dd:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 80521e3:	0f 84 e9 0a 00 00    	je     8052cd2 <_vfiprintf_r+0xef2>
 80521e9:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 80521ef:	85 ff                	test   %edi,%edi
 80521f1:	0f 88 7e 0a 00 00    	js     8052c75 <_vfiprintf_r+0xe95>
 80521f7:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 80521fd:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8052201:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8052208:	00 
 8052209:	89 04 24             	mov    %eax,(%esp)
 805220c:	e8 6f d9 ff ff       	call   804fb80 <memchr>
 8052211:	85 c0                	test   %eax,%eax
 8052213:	0f 84 f0 0a 00 00    	je     8052d09 <_vfiprintf_r+0xf29>
 8052219:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 805221f:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052222:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052229:	00 00 00 
 805222c:	39 f8                	cmp    %edi,%eax
 805222e:	0f 4f c7             	cmovg  %edi,%eax
 8052231:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052238:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 805223e:	e9 7d fe ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052243:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
 805224a:	89 d3                	mov    %edx,%ebx
 805224c:	e9 c9 fc ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 8052251:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052258:	89 f9                	mov    %edi,%ecx
 805225a:	89 55 10             	mov    %edx,0x10(%ebp)
 805225d:	8b 7d 14             	mov    0x14(%ebp),%edi
 8052260:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 8052266:	c7 85 40 ff ff ff 0d 	movl   $0x805460d,-0xc0(%ebp)
 805226d:	46 05 08 
 8052270:	0f 85 44 01 00 00    	jne    80523ba <_vfiprintf_r+0x5da>
 8052276:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 805227d:	0f 84 37 01 00 00    	je     80523ba <_vfiprintf_r+0x5da>
 8052283:	0f b7 0f             	movzwl (%edi),%ecx
 8052286:	83 c7 04             	add    $0x4,%edi
 8052289:	89 7d 14             	mov    %edi,0x14(%ebp)
 805228c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8052293:	ba 02 00 00 00       	mov    $0x2,%edx
 8052298:	0f 84 aa fd ff ff    	je     8052048 <_vfiprintf_r+0x268>
 805229e:	85 c9                	test   %ecx,%ecx
 80522a0:	0f 84 a2 fd ff ff    	je     8052048 <_vfiprintf_r+0x268>
 80522a6:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
 80522ad:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
 80522b3:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
 80522ba:	e9 89 fd ff ff       	jmp    8052048 <_vfiprintf_r+0x268>
 80522bf:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80522c6:	89 f8                	mov    %edi,%eax
 80522c8:	89 55 10             	mov    %edx,0x10(%ebp)
 80522cb:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80522d1:	0f 85 a9 02 00 00    	jne    8052580 <_vfiprintf_r+0x7a0>
 80522d7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 80522de:	0f 84 9c 02 00 00    	je     8052580 <_vfiprintf_r+0x7a0>
 80522e4:	8b 45 14             	mov    0x14(%ebp),%eax
 80522e7:	0f b7 bd 50 ff ff ff 	movzwl -0xb0(%ebp),%edi
 80522ee:	8b 00                	mov    (%eax),%eax
 80522f0:	66 89 38             	mov    %di,(%eax)
 80522f3:	8b 45 14             	mov    0x14(%ebp),%eax
 80522f6:	83 c0 04             	add    $0x4,%eax
 80522f9:	89 45 14             	mov    %eax,0x14(%ebp)
 80522fc:	e9 7e fb ff ff       	jmp    8051e7f <_vfiprintf_r+0x9f>
 8052301:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052308:	89 55 10             	mov    %edx,0x10(%ebp)
 805230b:	8b 45 14             	mov    0x14(%ebp),%eax
 805230e:	75 73                	jne    8052383 <_vfiprintf_r+0x5a3>
 8052310:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052317:	74 6a                	je     8052383 <_vfiprintf_r+0x5a3>
 8052319:	0f b7 08             	movzwl (%eax),%ecx
 805231c:	83 c0 04             	add    $0x4,%eax
 805231f:	ba 01 00 00 00       	mov    $0x1,%edx
 8052324:	89 45 14             	mov    %eax,0x14(%ebp)
 8052327:	e9 1c fd ff ff       	jmp    8052048 <_vfiprintf_r+0x268>
 805232c:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052333:	89 55 10             	mov    %edx,0x10(%ebp)
 8052336:	8b 45 14             	mov    0x14(%ebp),%eax
 8052339:	0f 85 f3 01 00 00    	jne    8052532 <_vfiprintf_r+0x752>
 805233f:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052346:	0f 84 e6 01 00 00    	je     8052532 <_vfiprintf_r+0x752>
 805234c:	0f b7 08             	movzwl (%eax),%ecx
 805234f:	83 c0 04             	add    $0x4,%eax
 8052352:	31 d2                	xor    %edx,%edx
 8052354:	89 45 14             	mov    %eax,0x14(%ebp)
 8052357:	e9 ec fc ff ff       	jmp    8052048 <_vfiprintf_r+0x268>
 805235c:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
 8052363:	00 00 00 
 8052366:	89 d3                	mov    %edx,%ebx
 8052368:	e9 ad fb ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 805236d:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 8052374:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 805237b:	89 55 10             	mov    %edx,0x10(%ebp)
 805237e:	8b 45 14             	mov    0x14(%ebp),%eax
 8052381:	74 8d                	je     8052310 <_vfiprintf_r+0x530>
 8052383:	8b 08                	mov    (%eax),%ecx
 8052385:	83 c0 04             	add    $0x4,%eax
 8052388:	ba 01 00 00 00       	mov    $0x1,%edx
 805238d:	89 45 14             	mov    %eax,0x14(%ebp)
 8052390:	e9 b3 fc ff ff       	jmp    8052048 <_vfiprintf_r+0x268>
 8052395:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 805239c:	89 f9                	mov    %edi,%ecx
 805239e:	89 55 10             	mov    %edx,0x10(%ebp)
 80523a1:	8b 7d 14             	mov    0x14(%ebp),%edi
 80523a4:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 80523aa:	c7 85 40 ff ff ff fc 	movl   $0x80545fc,-0xc0(%ebp)
 80523b1:	45 05 08 
 80523b4:	0f 84 bc fe ff ff    	je     8052276 <_vfiprintf_r+0x496>
 80523ba:	8b 0f                	mov    (%edi),%ecx
 80523bc:	83 c7 04             	add    $0x4,%edi
 80523bf:	89 7d 14             	mov    %edi,0x14(%ebp)
 80523c2:	e9 c5 fe ff ff       	jmp    805228c <_vfiprintf_r+0x4ac>
 80523c7:	8b 45 14             	mov    0x14(%ebp),%eax
 80523ca:	89 55 10             	mov    %edx,0x10(%ebp)
 80523cd:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 80523d4:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 80523db:	00 00 00 
 80523de:	8b 00                	mov    (%eax),%eax
 80523e0:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 80523e7:	00 00 00 
 80523ea:	88 45 80             	mov    %al,-0x80(%ebp)
 80523ed:	8b 45 14             	mov    0x14(%ebp),%eax
 80523f0:	83 c0 04             	add    $0x4,%eax
 80523f3:	89 45 14             	mov    %eax,0x14(%ebp)
 80523f6:	8d 45 80             	lea    -0x80(%ebp),%eax
 80523f9:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 80523ff:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052406:	00 00 00 
 8052409:	e9 d4 fc ff ff       	jmp    80520e2 <_vfiprintf_r+0x302>
 805240e:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052415:	89 f8                	mov    %edi,%eax
 8052417:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 805241d:	8b 45 14             	mov    0x14(%ebp),%eax
 8052420:	89 55 10             	mov    %edx,0x10(%ebp)
 8052423:	0f 85 bd 00 00 00    	jne    80524e6 <_vfiprintf_r+0x706>
 8052429:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
 8052430:	0f 84 b0 00 00 00    	je     80524e6 <_vfiprintf_r+0x706>
 8052436:	0f bf 08             	movswl (%eax),%ecx
 8052439:	83 c0 04             	add    $0x4,%eax
 805243c:	89 45 14             	mov    %eax,0x14(%ebp)
 805243f:	85 c9                	test   %ecx,%ecx
 8052441:	0f 88 e6 07 00 00    	js     8052c2d <_vfiprintf_r+0xe4d>
 8052447:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 805244e:	ba 01 00 00 00       	mov    $0x1,%edx
 8052453:	e9 f9 fb ff ff       	jmp    8052051 <_vfiprintf_r+0x271>
 8052458:	89 f8                	mov    %edi,%eax
 805245a:	89 d3                	mov    %edx,%ebx
 805245c:	84 c0                	test   %al,%al
 805245e:	b8 20 00 00 00       	mov    $0x20,%eax
 8052463:	0f 44 f8             	cmove  %eax,%edi
 8052466:	e9 af fa ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 805246b:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
 8052472:	89 d3                	mov    %edx,%ebx
 8052474:	e9 a1 fa ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 8052479:	0f be 02             	movsbl (%edx),%eax
 805247c:	8d 5a 01             	lea    0x1(%edx),%ebx
 805247f:	83 f8 2a             	cmp    $0x2a,%eax
 8052482:	0f 84 be 08 00 00    	je     8052d46 <_vfiprintf_r+0xf66>
 8052488:	8d 48 d0             	lea    -0x30(%eax),%ecx
 805248b:	31 d2                	xor    %edx,%edx
 805248d:	83 f9 09             	cmp    $0x9,%ecx
 8052490:	0f 87 9f 08 00 00    	ja     8052d35 <_vfiprintf_r+0xf55>
 8052496:	66 90                	xchg   %ax,%ax
 8052498:	8d 04 92             	lea    (%edx,%edx,4),%eax
 805249b:	83 c3 01             	add    $0x1,%ebx
 805249e:	8d 14 41             	lea    (%ecx,%eax,2),%edx
 80524a1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
 80524a5:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80524a8:	83 f9 09             	cmp    $0x9,%ecx
 80524ab:	76 eb                	jbe    8052498 <_vfiprintf_r+0x6b8>
 80524ad:	85 d2                	test   %edx,%edx
 80524af:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80524b4:	0f 48 d1             	cmovs  %ecx,%edx
 80524b7:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
 80524bd:	89 da                	mov    %ebx,%edx
 80524bf:	e9 5c fa ff ff       	jmp    8051f20 <_vfiprintf_r+0x140>
 80524c4:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 80524cb:	89 f8                	mov    %edi,%eax
 80524cd:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 80524d4:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
 80524da:	8b 45 14             	mov    0x14(%ebp),%eax
 80524dd:	89 55 10             	mov    %edx,0x10(%ebp)
 80524e0:	0f 84 43 ff ff ff    	je     8052429 <_vfiprintf_r+0x649>
 80524e6:	8b 08                	mov    (%eax),%ecx
 80524e8:	83 c0 04             	add    $0x4,%eax
 80524eb:	89 45 14             	mov    %eax,0x14(%ebp)
 80524ee:	e9 4c ff ff ff       	jmp    805243f <_vfiprintf_r+0x65f>
 80524f3:	31 db                	xor    %ebx,%ebx
 80524f5:	8d 48 d0             	lea    -0x30(%eax),%ecx
 80524f8:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
 80524fb:	83 c2 01             	add    $0x1,%edx
 80524fe:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
 8052501:	0f be 42 ff          	movsbl -0x1(%edx),%eax
 8052505:	8d 48 d0             	lea    -0x30(%eax),%ecx
 8052508:	83 f9 09             	cmp    $0x9,%ecx
 805250b:	76 eb                	jbe    80524f8 <_vfiprintf_r+0x718>
 805250d:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
 8052513:	e9 08 fa ff ff       	jmp    8051f20 <_vfiprintf_r+0x140>
 8052518:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
 805251f:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
 8052526:	89 55 10             	mov    %edx,0x10(%ebp)
 8052529:	8b 45 14             	mov    0x14(%ebp),%eax
 805252c:	0f 84 0d fe ff ff    	je     805233f <_vfiprintf_r+0x55f>
 8052532:	8b 08                	mov    (%eax),%ecx
 8052534:	83 c0 04             	add    $0x4,%eax
 8052537:	31 d2                	xor    %edx,%edx
 8052539:	89 45 14             	mov    %eax,0x14(%ebp)
 805253c:	e9 07 fb ff ff       	jmp    8052048 <_vfiprintf_r+0x268>
 8052541:	89 f9                	mov    %edi,%ecx
 8052543:	85 c0                	test   %eax,%eax
 8052545:	89 55 10             	mov    %edx,0x10(%ebp)
 8052548:	88 8d 71 ff ff ff    	mov    %cl,-0x8f(%ebp)
 805254e:	0f 84 95 01 00 00    	je     80526e9 <_vfiprintf_r+0x909>
 8052554:	88 45 80             	mov    %al,-0x80(%ebp)
 8052557:	8d 45 80             	lea    -0x80(%ebp),%eax
 805255a:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
 8052561:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
 8052568:	00 00 00 
 805256b:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
 8052572:	00 00 00 
 8052575:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 805257b:	e9 7f fe ff ff       	jmp    80523ff <_vfiprintf_r+0x61f>
 8052580:	8b 45 14             	mov    0x14(%ebp),%eax
 8052583:	8b bd 50 ff ff ff    	mov    -0xb0(%ebp),%edi
 8052589:	8b 00                	mov    (%eax),%eax
 805258b:	89 38                	mov    %edi,(%eax)
 805258d:	8b 45 14             	mov    0x14(%ebp),%eax
 8052590:	83 c0 04             	add    $0x4,%eax
 8052593:	89 45 14             	mov    %eax,0x14(%ebp)
 8052596:	e9 e4 f8 ff ff       	jmp    8051e7f <_vfiprintf_r+0x9f>
 805259b:	90                   	nop
 805259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80525a0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80525a3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80525a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80525ac:	e8 1f f7 ff ff       	call   8051cd0 <__sprint_r.part.0>
 80525b1:	85 c0                	test   %eax,%eax
 80525b3:	0f 85 4f 01 00 00    	jne    8052708 <_vfiprintf_r+0x928>
 80525b9:	8b bd 78 ff ff ff    	mov    -0x88(%ebp),%edi
 80525bf:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80525c2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80525c8:	8d 47 01             	lea    0x1(%edi),%eax
 80525cb:	e9 88 fb ff ff       	jmp    8052158 <_vfiprintf_r+0x378>
 80525d0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80525d6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80525dc:	8d 48 01             	lea    0x1(%eax),%ecx
 80525df:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
 80525e6:	74 2f                	je     8052617 <_vfiprintf_r+0x837>
 80525e8:	83 c2 01             	add    $0x1,%edx
 80525eb:	83 f9 07             	cmp    $0x7,%ecx
 80525ee:	8d 85 71 ff ff ff    	lea    -0x8f(%ebp),%eax
 80525f4:	89 06                	mov    %eax,(%esi)
 80525f6:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
 80525fd:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052603:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052609:	0f 8f 41 04 00 00    	jg     8052a50 <_vfiprintf_r+0xc70>
 805260f:	89 c8                	mov    %ecx,%eax
 8052611:	83 c6 08             	add    $0x8,%esi
 8052614:	83 c1 01             	add    $0x1,%ecx
 8052617:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
 805261d:	85 db                	test   %ebx,%ebx
 805261f:	74 2f                	je     8052650 <_vfiprintf_r+0x870>
 8052621:	83 c2 02             	add    $0x2,%edx
 8052624:	83 f9 07             	cmp    $0x7,%ecx
 8052627:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
 805262d:	89 06                	mov    %eax,(%esi)
 805262f:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
 8052636:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 805263c:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 8052642:	0f 8f 20 04 00 00    	jg     8052a68 <_vfiprintf_r+0xc88>
 8052648:	89 c8                	mov    %ecx,%eax
 805264a:	83 c6 08             	add    $0x8,%esi
 805264d:	83 c1 01             	add    $0x1,%ecx
 8052650:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
 8052657:	00 00 00 
 805265a:	0f 84 28 03 00 00    	je     8052988 <_vfiprintf_r+0xba8>
 8052660:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
 8052666:	2b 9d 58 ff ff ff    	sub    -0xa8(%ebp),%ebx
 805266c:	85 db                	test   %ebx,%ebx
 805266e:	7f 13                	jg     8052683 <_vfiprintf_r+0x8a3>
 8052670:	e9 db 00 00 00       	jmp    8052750 <_vfiprintf_r+0x970>
 8052675:	8d 76 00             	lea    0x0(%esi),%esi
 8052678:	8d 48 02             	lea    0x2(%eax),%ecx
 805267b:	83 c6 08             	add    $0x8,%esi
 805267e:	89 f8                	mov    %edi,%eax
 8052680:	83 eb 10             	sub    $0x10,%ebx
 8052683:	83 fb 10             	cmp    $0x10,%ebx
 8052686:	c7 06 d0 4d 05 08    	movl   $0x8054dd0,(%esi)
 805268c:	0f 8e 4e 02 00 00    	jle    80528e0 <_vfiprintf_r+0xb00>
 8052692:	8d 78 01             	lea    0x1(%eax),%edi
 8052695:	83 c2 10             	add    $0x10,%edx
 8052698:	83 ff 07             	cmp    $0x7,%edi
 805269b:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80526a2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80526a8:	89 bd 78 ff ff ff    	mov    %edi,-0x88(%ebp)
 80526ae:	7e c8                	jle    8052678 <_vfiprintf_r+0x898>
 80526b0:	85 d2                	test   %edx,%edx
 80526b2:	75 0c                	jne    80526c0 <_vfiprintf_r+0x8e0>
 80526b4:	b9 01 00 00 00       	mov    $0x1,%ecx
 80526b9:	31 c0                	xor    %eax,%eax
 80526bb:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80526be:	eb c0                	jmp    8052680 <_vfiprintf_r+0x8a0>
 80526c0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80526c3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80526c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80526cc:	e8 ff f5 ff ff       	call   8051cd0 <__sprint_r.part.0>
 80526d1:	85 c0                	test   %eax,%eax
 80526d3:	75 33                	jne    8052708 <_vfiprintf_r+0x928>
 80526d5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 80526db:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80526de:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80526e4:	8d 48 01             	lea    0x1(%eax),%ecx
 80526e7:	eb 97                	jmp    8052680 <_vfiprintf_r+0x8a0>
 80526e9:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
 80526ef:	85 c0                	test   %eax,%eax
 80526f1:	74 15                	je     8052708 <_vfiprintf_r+0x928>
 80526f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 80526f6:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80526fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80526ff:	e8 cc f5 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052708:	8b 45 0c             	mov    0xc(%ebp),%eax
 805270b:	f6 40 0c 40          	testb  $0x40,0xc(%eax)
 805270f:	0f 85 a3 f8 ff ff    	jne    8051fb8 <_vfiprintf_r+0x1d8>
 8052715:	8b 85 50 ff ff ff    	mov    -0xb0(%ebp),%eax
 805271b:	81 c4 cc 00 00 00    	add    $0xcc,%esp
 8052721:	5b                   	pop    %ebx
 8052722:	5e                   	pop    %esi
 8052723:	5f                   	pop    %edi
 8052724:	5d                   	pop    %ebp
 8052725:	c3                   	ret    
 8052726:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052729:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 805272f:	8b 45 08             	mov    0x8(%ebp),%eax
 8052732:	e8 99 f5 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052737:	85 c0                	test   %eax,%eax
 8052739:	75 cd                	jne    8052708 <_vfiprintf_r+0x928>
 805273b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052741:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052744:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 805274a:	8d 48 01             	lea    0x1(%eax),%ecx
 805274d:	8d 76 00             	lea    0x0(%esi),%esi
 8052750:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052756:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 805275c:	89 06                	mov    %eax,(%esi)
 805275e:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 8052764:	01 c2                	add    %eax,%edx
 8052766:	83 f9 07             	cmp    $0x7,%ecx
 8052769:	89 46 04             	mov    %eax,0x4(%esi)
 805276c:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052772:	0f 8e ef 01 00 00    	jle    8052967 <_vfiprintf_r+0xb87>
 8052778:	85 d2                	test   %edx,%edx
 805277a:	0f 85 81 03 00 00    	jne    8052b01 <_vfiprintf_r+0xd21>
 8052780:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 8052787:	00 00 00 
 805278a:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805278d:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
 8052794:	0f 84 ce 00 00 00    	je     8052868 <_vfiprintf_r+0xa88>
 805279a:	8b 9d 54 ff ff ff    	mov    -0xac(%ebp),%ebx
 80527a0:	2b 9d 60 ff ff ff    	sub    -0xa0(%ebp),%ebx
 80527a6:	85 db                	test   %ebx,%ebx
 80527a8:	0f 8e ba 00 00 00    	jle    8052868 <_vfiprintf_r+0xa88>
 80527ae:	8b 8d 78 ff ff ff    	mov    -0x88(%ebp),%ecx
 80527b4:	83 fb 10             	cmp    $0x10,%ebx
 80527b7:	8d 79 01             	lea    0x1(%ecx),%edi
 80527ba:	7f 14                	jg     80527d0 <_vfiprintf_r+0x9f0>
 80527bc:	eb 50                	jmp    805280e <_vfiprintf_r+0xa2e>
 80527be:	66 90                	xchg   %ax,%ax
 80527c0:	8d 79 02             	lea    0x2(%ecx),%edi
 80527c3:	83 c6 08             	add    $0x8,%esi
 80527c6:	89 c1                	mov    %eax,%ecx
 80527c8:	83 eb 10             	sub    $0x10,%ebx
 80527cb:	83 fb 10             	cmp    $0x10,%ebx
 80527ce:	7e 3e                	jle    805280e <_vfiprintf_r+0xa2e>
 80527d0:	8d 41 01             	lea    0x1(%ecx),%eax
 80527d3:	83 c2 10             	add    $0x10,%edx
 80527d6:	83 f8 07             	cmp    $0x7,%eax
 80527d9:	c7 06 e0 4d 05 08    	movl   $0x8054de0,(%esi)
 80527df:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80527e6:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80527ec:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
 80527f2:	7e cc                	jle    80527c0 <_vfiprintf_r+0x9e0>
 80527f4:	85 d2                	test   %edx,%edx
 80527f6:	0f 85 b4 00 00 00    	jne    80528b0 <_vfiprintf_r+0xad0>
 80527fc:	83 eb 10             	sub    $0x10,%ebx
 80527ff:	31 c9                	xor    %ecx,%ecx
 8052801:	83 fb 10             	cmp    $0x10,%ebx
 8052804:	bf 01 00 00 00       	mov    $0x1,%edi
 8052809:	8d 75 a8             	lea    -0x58(%ebp),%esi
 805280c:	7f c2                	jg     80527d0 <_vfiprintf_r+0x9f0>
 805280e:	01 da                	add    %ebx,%edx
 8052810:	83 ff 07             	cmp    $0x7,%edi
 8052813:	c7 06 e0 4d 05 08    	movl   $0x8054de0,(%esi)
 8052819:	89 5e 04             	mov    %ebx,0x4(%esi)
 805281c:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052822:	89 bd 78 ff ff ff    	mov    %edi,-0x88(%ebp)
 8052828:	7e 3e                	jle    8052868 <_vfiprintf_r+0xa88>
 805282a:	85 d2                	test   %edx,%edx
 805282c:	75 19                	jne    8052847 <_vfiprintf_r+0xa67>
 805282e:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 8052834:	8b bd 60 ff ff ff    	mov    -0xa0(%ebp),%edi
 805283a:	39 c7                	cmp    %eax,%edi
 805283c:	0f 4d c7             	cmovge %edi,%eax
 805283f:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 8052845:	eb 55                	jmp    805289c <_vfiprintf_r+0xabc>
 8052847:	8b 55 0c             	mov    0xc(%ebp),%edx
 805284a:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052850:	8b 45 08             	mov    0x8(%ebp),%eax
 8052853:	e8 78 f4 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052858:	85 c0                	test   %eax,%eax
 805285a:	0f 85 a8 fe ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052860:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052866:	66 90                	xchg   %ax,%ax
 8052868:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 805286e:	8b bd 60 ff ff ff    	mov    -0xa0(%ebp),%edi
 8052874:	39 c7                	cmp    %eax,%edi
 8052876:	0f 4d c7             	cmovge %edi,%eax
 8052879:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
 805287f:	85 d2                	test   %edx,%edx
 8052881:	74 19                	je     805289c <_vfiprintf_r+0xabc>
 8052883:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052886:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 805288c:	8b 45 08             	mov    0x8(%ebp),%eax
 805288f:	e8 3c f4 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052894:	85 c0                	test   %eax,%eax
 8052896:	0f 85 6c fe ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 805289c:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
 80528a3:	00 00 00 
 80528a6:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80528a9:	e9 d1 f5 ff ff       	jmp    8051e7f <_vfiprintf_r+0x9f>
 80528ae:	66 90                	xchg   %ax,%ax
 80528b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80528b3:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 80528b9:	8b 45 08             	mov    0x8(%ebp),%eax
 80528bc:	e8 0f f4 ff ff       	call   8051cd0 <__sprint_r.part.0>
 80528c1:	85 c0                	test   %eax,%eax
 80528c3:	0f 85 3f fe ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 80528c9:	8b 8d 78 ff ff ff    	mov    -0x88(%ebp),%ecx
 80528cf:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80528d2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 80528d8:	8d 79 01             	lea    0x1(%ecx),%edi
 80528db:	e9 e8 fe ff ff       	jmp    80527c8 <_vfiprintf_r+0x9e8>
 80528e0:	01 da                	add    %ebx,%edx
 80528e2:	83 f9 07             	cmp    $0x7,%ecx
 80528e5:	89 5e 04             	mov    %ebx,0x4(%esi)
 80528e8:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80528ee:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 80528f4:	7f 42                	jg     8052938 <_vfiprintf_r+0xb58>
 80528f6:	83 c6 08             	add    $0x8,%esi
 80528f9:	83 c1 01             	add    $0x1,%ecx
 80528fc:	e9 4f fe ff ff       	jmp    8052750 <_vfiprintf_r+0x970>
 8052901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8052908:	84 d2                	test   %dl,%dl
 805290a:	75 64                	jne    8052970 <_vfiprintf_r+0xb90>
 805290c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8052913:	74 5b                	je     8052970 <_vfiprintf_r+0xb90>
 8052915:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 805291b:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
 805291f:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052925:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8052928:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 805292e:	e9 8d f7 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052933:	90                   	nop
 8052934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052938:	85 d2                	test   %edx,%edx
 805293a:	0f 85 e6 fd ff ff    	jne    8052726 <_vfiprintf_r+0x946>
 8052940:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052946:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052949:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
 8052950:	00 00 00 
 8052953:	89 45 a8             	mov    %eax,-0x58(%ebp)
 8052956:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 805295c:	89 45 ac             	mov    %eax,-0x54(%ebp)
 805295f:	89 c2                	mov    %eax,%edx
 8052961:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
 8052967:	83 c6 08             	add    $0x8,%esi
 805296a:	e9 1e fe ff ff       	jmp    805278d <_vfiprintf_r+0x9ad>
 805296f:	90                   	nop
 8052970:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052973:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
 805297a:	00 00 00 
 805297d:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 8052983:	e9 38 f7 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052988:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
 805298e:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
 8052994:	85 ff                	test   %edi,%edi
 8052996:	0f 8e c4 fc ff ff    	jle    8052660 <_vfiprintf_r+0x880>
 805299c:	83 ff 10             	cmp    $0x10,%edi
 805299f:	7f 17                	jg     80529b8 <_vfiprintf_r+0xbd8>
 80529a1:	e9 88 03 00 00       	jmp    8052d2e <_vfiprintf_r+0xf4e>
 80529a6:	66 90                	xchg   %ax,%ax
 80529a8:	8d 58 02             	lea    0x2(%eax),%ebx
 80529ab:	83 c6 08             	add    $0x8,%esi
 80529ae:	89 c8                	mov    %ecx,%eax
 80529b0:	83 ef 10             	sub    $0x10,%edi
 80529b3:	83 ff 10             	cmp    $0x10,%edi
 80529b6:	7e 3a                	jle    80529f2 <_vfiprintf_r+0xc12>
 80529b8:	8d 48 01             	lea    0x1(%eax),%ecx
 80529bb:	83 c2 10             	add    $0x10,%edx
 80529be:	83 f9 07             	cmp    $0x7,%ecx
 80529c1:	c7 06 d0 4d 05 08    	movl   $0x8054dd0,(%esi)
 80529c7:	c7 46 04 10 00 00 00 	movl   $0x10,0x4(%esi)
 80529ce:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 80529d4:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
 80529da:	7e cc                	jle    80529a8 <_vfiprintf_r+0xbc8>
 80529dc:	85 d2                	test   %edx,%edx
 80529de:	75 40                	jne    8052a20 <_vfiprintf_r+0xc40>
 80529e0:	83 ef 10             	sub    $0x10,%edi
 80529e3:	31 c0                	xor    %eax,%eax
 80529e5:	83 ff 10             	cmp    $0x10,%edi
 80529e8:	bb 01 00 00 00       	mov    $0x1,%ebx
 80529ed:	8d 75 a8             	lea    -0x58(%ebp),%esi
 80529f0:	7f c6                	jg     80529b8 <_vfiprintf_r+0xbd8>
 80529f2:	01 fa                	add    %edi,%edx
 80529f4:	83 fb 07             	cmp    $0x7,%ebx
 80529f7:	c7 06 d0 4d 05 08    	movl   $0x8054dd0,(%esi)
 80529fd:	89 7e 04             	mov    %edi,0x4(%esi)
 8052a00:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
 8052a06:	89 9d 78 ff ff ff    	mov    %ebx,-0x88(%ebp)
 8052a0c:	0f 8f 97 01 00 00    	jg     8052ba9 <_vfiprintf_r+0xdc9>
 8052a12:	83 c6 08             	add    $0x8,%esi
 8052a15:	89 d8                	mov    %ebx,%eax
 8052a17:	8d 4b 01             	lea    0x1(%ebx),%ecx
 8052a1a:	e9 41 fc ff ff       	jmp    8052660 <_vfiprintf_r+0x880>
 8052a1f:	90                   	nop
 8052a20:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052a23:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052a29:	8b 45 08             	mov    0x8(%ebp),%eax
 8052a2c:	e8 9f f2 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052a31:	85 c0                	test   %eax,%eax
 8052a33:	0f 85 cf fc ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052a39:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052a3f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a42:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052a48:	8d 58 01             	lea    0x1(%eax),%ebx
 8052a4b:	e9 60 ff ff ff       	jmp    80529b0 <_vfiprintf_r+0xbd0>
 8052a50:	85 d2                	test   %edx,%edx
 8052a52:	0f 85 f1 00 00 00    	jne    8052b49 <_vfiprintf_r+0xd69>
 8052a58:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052a5d:	31 c0                	xor    %eax,%eax
 8052a5f:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a62:	e9 b0 fb ff ff       	jmp    8052617 <_vfiprintf_r+0x837>
 8052a67:	90                   	nop
 8052a68:	85 d2                	test   %edx,%edx
 8052a6a:	0f 85 09 01 00 00    	jne    8052b79 <_vfiprintf_r+0xd99>
 8052a70:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052a75:	31 c0                	xor    %eax,%eax
 8052a77:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052a7a:	e9 d1 fb ff ff       	jmp    8052650 <_vfiprintf_r+0x870>
 8052a7f:	90                   	nop
 8052a80:	89 c2                	mov    %eax,%edx
 8052a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8052a88:	89 c8                	mov    %ecx,%eax
 8052a8a:	83 ea 01             	sub    $0x1,%edx
 8052a8d:	83 e0 07             	and    $0x7,%eax
 8052a90:	c1 e9 03             	shr    $0x3,%ecx
 8052a93:	83 c0 30             	add    $0x30,%eax
 8052a96:	85 c9                	test   %ecx,%ecx
 8052a98:	88 02                	mov    %al,(%edx)
 8052a9a:	75 ec                	jne    8052a88 <_vfiprintf_r+0xca8>
 8052a9c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
 8052aa3:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
 8052aa9:	0f 85 5b 01 00 00    	jne    8052c0a <_vfiprintf_r+0xe2a>
 8052aaf:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052ab2:	29 d0                	sub    %edx,%eax
 8052ab4:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052aba:	e9 01 f6 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052abf:	90                   	nop
 8052ac0:	85 d2                	test   %edx,%edx
 8052ac2:	0f 85 7d 01 00 00    	jne    8052c45 <_vfiprintf_r+0xe65>
 8052ac8:	31 c0                	xor    %eax,%eax
 8052aca:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052acf:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052ad2:	e9 08 fb ff ff       	jmp    80525df <_vfiprintf_r+0x7ff>
 8052ad7:	90                   	nop
 8052ad8:	83 f9 09             	cmp    $0x9,%ecx
 8052adb:	0f 87 df 00 00 00    	ja     8052bc0 <_vfiprintf_r+0xde0>
 8052ae1:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
 8052ae7:	83 c1 30             	add    $0x30,%ecx
 8052aea:	88 4d a7             	mov    %cl,-0x59(%ebp)
 8052aed:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052af3:	8d 45 a7             	lea    -0x59(%ebp),%eax
 8052af6:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
 8052afc:	e9 bf f5 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052b01:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b04:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b0a:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b0d:	e8 be f1 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052b12:	85 c0                	test   %eax,%eax
 8052b14:	0f 85 ee fb ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052b1a:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052b20:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b23:	e9 65 fc ff ff       	jmp    805278d <_vfiprintf_r+0x9ad>
 8052b28:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b2b:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b31:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b34:	e8 97 f1 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052b39:	85 c0                	test   %eax,%eax
 8052b3b:	0f 85 c7 fb ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052b41:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b44:	e9 98 f3 ff ff       	jmp    8051ee1 <_vfiprintf_r+0x101>
 8052b49:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b4c:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b52:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b55:	e8 76 f1 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052b5a:	85 c0                	test   %eax,%eax
 8052b5c:	0f 85 a6 fb ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052b62:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052b68:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b6b:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052b71:	8d 48 01             	lea    0x1(%eax),%ecx
 8052b74:	e9 9e fa ff ff       	jmp    8052617 <_vfiprintf_r+0x837>
 8052b79:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052b7c:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052b82:	8b 45 08             	mov    0x8(%ebp),%eax
 8052b85:	e8 46 f1 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052b8a:	85 c0                	test   %eax,%eax
 8052b8c:	0f 85 76 fb ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052b92:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052b98:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052b9b:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052ba1:	8d 48 01             	lea    0x1(%eax),%ecx
 8052ba4:	e9 a7 fa ff ff       	jmp    8052650 <_vfiprintf_r+0x870>
 8052ba9:	85 d2                	test   %edx,%edx
 8052bab:	0f 85 f1 00 00 00    	jne    8052ca2 <_vfiprintf_r+0xec2>
 8052bb1:	b9 01 00 00 00       	mov    $0x1,%ecx
 8052bb6:	31 c0                	xor    %eax,%eax
 8052bb8:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052bbb:	e9 a0 fa ff ff       	jmp    8052660 <_vfiprintf_r+0x880>
 8052bc0:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052bc3:	bb cd cc cc cc       	mov    $0xcccccccd,%ebx
 8052bc8:	89 b5 60 ff ff ff    	mov    %esi,-0xa0(%ebp)
 8052bce:	89 c6                	mov    %eax,%esi
 8052bd0:	89 c8                	mov    %ecx,%eax
 8052bd2:	83 ee 01             	sub    $0x1,%esi
 8052bd5:	f7 e3                	mul    %ebx
 8052bd7:	c1 ea 03             	shr    $0x3,%edx
 8052bda:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8052bdd:	01 c0                	add    %eax,%eax
 8052bdf:	29 c1                	sub    %eax,%ecx
 8052be1:	83 c1 30             	add    $0x30,%ecx
 8052be4:	85 d2                	test   %edx,%edx
 8052be6:	88 0e                	mov    %cl,(%esi)
 8052be8:	89 d1                	mov    %edx,%ecx
 8052bea:	75 e4                	jne    8052bd0 <_vfiprintf_r+0xdf0>
 8052bec:	89 f1                	mov    %esi,%ecx
 8052bee:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052bf1:	29 c8                	sub    %ecx,%eax
 8052bf3:	89 b5 44 ff ff ff    	mov    %esi,-0xbc(%ebp)
 8052bf9:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
 8052bff:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052c05:	e9 b6 f4 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052c0a:	3c 30                	cmp    $0x30,%al
 8052c0c:	74 0b                	je     8052c19 <_vfiprintf_r+0xe39>
 8052c0e:	83 ad 44 ff ff ff 01 	subl   $0x1,-0xbc(%ebp)
 8052c15:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
 8052c19:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8052c1c:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
 8052c22:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052c28:	e9 93 f4 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052c2d:	f7 d9                	neg    %ecx
 8052c2f:	bf 2d 00 00 00       	mov    $0x2d,%edi
 8052c34:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
 8052c3b:	ba 01 00 00 00       	mov    $0x1,%edx
 8052c40:	e9 0c f4 ff ff       	jmp    8052051 <_vfiprintf_r+0x271>
 8052c45:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052c48:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052c4e:	8b 45 08             	mov    0x8(%ebp),%eax
 8052c51:	e8 7a f0 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052c56:	85 c0                	test   %eax,%eax
 8052c58:	0f 85 aa fa ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052c5e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052c64:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052c67:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052c6d:	8d 48 01             	lea    0x1(%eax),%ecx
 8052c70:	e9 6a f9 ff ff       	jmp    80525df <_vfiprintf_r+0x7ff>
 8052c75:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
 8052c7b:	89 04 24             	mov    %eax,(%esp)
 8052c7e:	e8 4d 65 ff ff       	call   80491d0 <strlen>
 8052c83:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052c8a:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052c8d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052c94:	00 00 00 
 8052c97:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052c9d:	e9 1e f4 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052ca2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052ca5:	8d 8d 74 ff ff ff    	lea    -0x8c(%ebp),%ecx
 8052cab:	8b 45 08             	mov    0x8(%ebp),%eax
 8052cae:	e8 1d f0 ff ff       	call   8051cd0 <__sprint_r.part.0>
 8052cb3:	85 c0                	test   %eax,%eax
 8052cb5:	0f 85 4d fa ff ff    	jne    8052708 <_vfiprintf_r+0x928>
 8052cbb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 8052cc1:	8d 75 a8             	lea    -0x58(%ebp),%esi
 8052cc4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
 8052cca:	8d 48 01             	lea    0x1(%eax),%ecx
 8052ccd:	e9 8e f9 ff ff       	jmp    8052660 <_vfiprintf_r+0x880>
 8052cd2:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
 8052cd8:	b0 06                	mov    $0x6,%al
 8052cda:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052cdd:	83 ff 06             	cmp    $0x6,%edi
 8052ce0:	0f 46 c7             	cmovbe %edi,%eax
 8052ce3:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
 8052ce9:	85 c0                	test   %eax,%eax
 8052ceb:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052cf1:	c7 85 44 ff ff ff 1e 	movl   $0x805461e,-0xbc(%ebp)
 8052cf8:	46 05 08 
 8052cfb:	0f 49 f8             	cmovns %eax,%edi
 8052cfe:	89 bd 60 ff ff ff    	mov    %edi,-0xa0(%ebp)
 8052d04:	e9 f6 f6 ff ff       	jmp    80523ff <_vfiprintf_r+0x61f>
 8052d09:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
 8052d0f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
 8052d16:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8052d19:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052d20:	00 00 00 
 8052d23:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
 8052d29:	e9 92 f3 ff ff       	jmp    80520c0 <_vfiprintf_r+0x2e0>
 8052d2e:	89 cb                	mov    %ecx,%ebx
 8052d30:	e9 bd fc ff ff       	jmp    80529f2 <_vfiprintf_r+0xc12>
 8052d35:	89 da                	mov    %ebx,%edx
 8052d37:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
 8052d3e:	00 00 00 
 8052d41:	e9 da f1 ff ff       	jmp    8051f20 <_vfiprintf_r+0x140>
 8052d46:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052d49:	89 da                	mov    %ebx,%edx
 8052d4b:	8b 45 14             	mov    0x14(%ebp),%eax
 8052d4e:	8b 09                	mov    (%ecx),%ecx
 8052d50:	83 c0 04             	add    $0x4,%eax
 8052d53:	89 45 14             	mov    %eax,0x14(%ebp)
 8052d56:	85 c9                	test   %ecx,%ecx
 8052d58:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
 8052d5e:	0f 89 f3 f1 ff ff    	jns    8051f57 <_vfiprintf_r+0x177>
 8052d64:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
 8052d6b:	ff ff ff 
 8052d6e:	89 d3                	mov    %edx,%ebx
 8052d70:	e9 a5 f1 ff ff       	jmp    8051f1a <_vfiprintf_r+0x13a>
 8052d75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08052d80 <vfiprintf>:
 8052d80:	55                   	push   %ebp
 8052d81:	89 e5                	mov    %esp,%ebp
 8052d83:	83 ec 18             	sub    $0x18,%esp
 8052d86:	e8 55 c4 ff ff       	call   804f1e0 <__getreent>
 8052d8b:	8b 55 10             	mov    0x10(%ebp),%edx
 8052d8e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8052d92:	8b 55 0c             	mov    0xc(%ebp),%edx
 8052d95:	89 04 24             	mov    %eax,(%esp)
 8052d98:	89 54 24 08          	mov    %edx,0x8(%esp)
 8052d9c:	8b 55 08             	mov    0x8(%ebp),%edx
 8052d9f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052da3:	e8 38 f0 ff ff       	call   8051de0 <_vfiprintf_r>
 8052da8:	c9                   	leave  
 8052da9:	c3                   	ret    
 8052daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08052db0 <__sbprintf>:
 8052db0:	55                   	push   %ebp
 8052db1:	89 e5                	mov    %esp,%ebp
 8052db3:	57                   	push   %edi
 8052db4:	89 c7                	mov    %eax,%edi
 8052db6:	56                   	push   %esi
 8052db7:	53                   	push   %ebx
 8052db8:	89 d3                	mov    %edx,%ebx
 8052dba:	81 ec 9c 04 00 00    	sub    $0x49c,%esp
 8052dc0:	0f b7 42 0c          	movzwl 0xc(%edx),%eax
 8052dc4:	c7 85 88 fb ff ff 00 	movl   $0x400,-0x478(%ebp)
 8052dcb:	04 00 00 
 8052dce:	c7 85 94 fb ff ff 00 	movl   $0x400,-0x46c(%ebp)
 8052dd5:	04 00 00 
 8052dd8:	c7 85 98 fb ff ff 00 	movl   $0x0,-0x468(%ebp)
 8052ddf:	00 00 00 
 8052de2:	83 e0 fd             	and    $0xfffffffd,%eax
 8052de5:	66 89 85 8c fb ff ff 	mov    %ax,-0x474(%ebp)
 8052dec:	8b 42 64             	mov    0x64(%edx),%eax
 8052def:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
 8052df5:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
 8052df9:	66 89 85 8e fb ff ff 	mov    %ax,-0x472(%ebp)
 8052e00:	8b 42 1c             	mov    0x1c(%edx),%eax
 8052e03:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
 8052e09:	8b 42 24             	mov    0x24(%edx),%eax
 8052e0c:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
 8052e12:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8052e16:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052e1a:	89 3c 24             	mov    %edi,(%esp)
 8052e1d:	89 85 a4 fb ff ff    	mov    %eax,-0x45c(%ebp)
 8052e23:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
 8052e29:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
 8052e2f:	89 85 90 fb ff ff    	mov    %eax,-0x470(%ebp)
 8052e35:	8b 45 08             	mov    0x8(%ebp),%eax
 8052e38:	89 95 74 fb ff ff    	mov    %edx,-0x48c(%ebp)
 8052e3e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8052e42:	e8 99 ef ff ff       	call   8051de0 <_vfiprintf_r>
 8052e47:	85 c0                	test   %eax,%eax
 8052e49:	89 c6                	mov    %eax,%esi
 8052e4b:	78 1c                	js     8052e69 <__sbprintf+0xb9>
 8052e4d:	8b 95 74 fb ff ff    	mov    -0x48c(%ebp),%edx
 8052e53:	89 3c 24             	mov    %edi,(%esp)
 8052e56:	89 54 24 04          	mov    %edx,0x4(%esp)
 8052e5a:	e8 71 ba ff ff       	call   804e8d0 <_fflush_r>
 8052e5f:	85 c0                	test   %eax,%eax
 8052e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8052e66:	0f 45 f0             	cmovne %eax,%esi
 8052e69:	f6 85 8c fb ff ff 40 	testb  $0x40,-0x474(%ebp)
 8052e70:	74 05                	je     8052e77 <__sbprintf+0xc7>
 8052e72:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 8052e77:	81 c4 9c 04 00 00    	add    $0x49c,%esp
 8052e7d:	89 f0                	mov    %esi,%eax
 8052e7f:	5b                   	pop    %ebx
 8052e80:	5e                   	pop    %esi
 8052e81:	5f                   	pop    %edi
 8052e82:	5d                   	pop    %ebp
 8052e83:	c3                   	ret    
 8052e84:	66 90                	xchg   %ax,%ax
 8052e86:	66 90                	xchg   %ax,%ax
 8052e88:	66 90                	xchg   %ax,%ax
 8052e8a:	66 90                	xchg   %ax,%ax
 8052e8c:	66 90                	xchg   %ax,%ax
 8052e8e:	66 90                	xchg   %ax,%ax

08052e90 <_write_r>:
 8052e90:	55                   	push   %ebp
 8052e91:	89 e5                	mov    %esp,%ebp
 8052e93:	83 ec 18             	sub    $0x18,%esp
 8052e96:	8b 45 14             	mov    0x14(%ebp),%eax
 8052e99:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 8052ea0:	00 00 00 
 8052ea3:	89 44 24 08          	mov    %eax,0x8(%esp)
 8052ea7:	8b 45 10             	mov    0x10(%ebp),%eax
 8052eaa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8052eae:	8b 45 0c             	mov    0xc(%ebp),%eax
 8052eb1:	89 04 24             	mov    %eax,(%esp)
 8052eb4:	e8 07 55 ff ff       	call   80483c0 <write>
 8052eb9:	83 f8 ff             	cmp    $0xffffffff,%eax
 8052ebc:	74 02                	je     8052ec0 <_write_r+0x30>
 8052ebe:	c9                   	leave  
 8052ebf:	c3                   	ret    
 8052ec0:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 8052ec6:	85 d2                	test   %edx,%edx
 8052ec8:	74 f4                	je     8052ebe <_write_r+0x2e>
 8052eca:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8052ecd:	89 11                	mov    %edx,(%ecx)
 8052ecf:	c9                   	leave  
 8052ed0:	c3                   	ret    
 8052ed1:	66 90                	xchg   %ax,%ax
 8052ed3:	66 90                	xchg   %ax,%ax
 8052ed5:	66 90                	xchg   %ax,%ax
 8052ed7:	66 90                	xchg   %ax,%ax
 8052ed9:	66 90                	xchg   %ax,%ax
 8052edb:	66 90                	xchg   %ax,%ax
 8052edd:	66 90                	xchg   %ax,%ax
 8052edf:	90                   	nop

08052ee0 <_calloc_r>:
 8052ee0:	55                   	push   %ebp
 8052ee1:	89 e5                	mov    %esp,%ebp
 8052ee3:	53                   	push   %ebx
 8052ee4:	83 ec 14             	sub    $0x14,%esp
 8052ee7:	8b 45 10             	mov    0x10(%ebp),%eax
 8052eea:	0f af 45 0c          	imul   0xc(%ebp),%eax
 8052eee:	89 44 24 04          	mov    %eax,0x4(%esp)
 8052ef2:	8b 45 08             	mov    0x8(%ebp),%eax
 8052ef5:	89 04 24             	mov    %eax,(%esp)
 8052ef8:	e8 43 c5 ff ff       	call   804f440 <_malloc_r>
 8052efd:	85 c0                	test   %eax,%eax
 8052eff:	89 c3                	mov    %eax,%ebx
 8052f01:	0f 84 91 00 00 00    	je     8052f98 <_calloc_r+0xb8>
 8052f07:	8b 40 fc             	mov    -0x4(%eax),%eax
 8052f0a:	83 e0 fc             	and    $0xfffffffc,%eax
 8052f0d:	83 e8 04             	sub    $0x4,%eax
 8052f10:	83 f8 24             	cmp    $0x24,%eax
 8052f13:	77 63                	ja     8052f78 <_calloc_r+0x98>
 8052f15:	83 f8 13             	cmp    $0x13,%eax
 8052f18:	89 da                	mov    %ebx,%edx
 8052f1a:	77 1c                	ja     8052f38 <_calloc_r+0x58>
 8052f1c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
 8052f22:	89 d8                	mov    %ebx,%eax
 8052f24:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
 8052f2b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8052f32:	83 c4 14             	add    $0x14,%esp
 8052f35:	5b                   	pop    %ebx
 8052f36:	5d                   	pop    %ebp
 8052f37:	c3                   	ret    
 8052f38:	83 f8 1b             	cmp    $0x1b,%eax
 8052f3b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 8052f41:	8d 53 08             	lea    0x8(%ebx),%edx
 8052f44:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 8052f4b:	76 cf                	jbe    8052f1c <_calloc_r+0x3c>
 8052f4d:	83 f8 24             	cmp    $0x24,%eax
 8052f50:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8052f57:	8d 53 10             	lea    0x10(%ebx),%edx
 8052f5a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
 8052f61:	75 b9                	jne    8052f1c <_calloc_r+0x3c>
 8052f63:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 8052f6a:	8d 53 18             	lea    0x18(%ebx),%edx
 8052f6d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 8052f74:	eb a6                	jmp    8052f1c <_calloc_r+0x3c>
 8052f76:	66 90                	xchg   %ax,%ax
 8052f78:	89 1c 24             	mov    %ebx,(%esp)
 8052f7b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8052f7f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8052f86:	00 
 8052f87:	e8 a8 5f ff ff       	call   8048f34 <memset>
 8052f8c:	83 c4 14             	add    $0x14,%esp
 8052f8f:	89 d8                	mov    %ebx,%eax
 8052f91:	5b                   	pop    %ebx
 8052f92:	5d                   	pop    %ebp
 8052f93:	c3                   	ret    
 8052f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8052f98:	31 c0                	xor    %eax,%eax
 8052f9a:	eb 96                	jmp    8052f32 <_calloc_r+0x52>
 8052f9c:	66 90                	xchg   %ax,%ax
 8052f9e:	66 90                	xchg   %ax,%ax

08052fa0 <_close_r>:
 8052fa0:	55                   	push   %ebp
 8052fa1:	89 e5                	mov    %esp,%ebp
 8052fa3:	83 ec 18             	sub    $0x18,%esp
 8052fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8052fa9:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 8052fb0:	00 00 00 
 8052fb3:	89 04 24             	mov    %eax,(%esp)
 8052fb6:	e8 85 54 ff ff       	call   8048440 <close>
 8052fbb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8052fbe:	74 08                	je     8052fc8 <_close_r+0x28>
 8052fc0:	c9                   	leave  
 8052fc1:	c3                   	ret    
 8052fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8052fc8:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 8052fce:	85 d2                	test   %edx,%edx
 8052fd0:	74 ee                	je     8052fc0 <_close_r+0x20>
 8052fd2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8052fd5:	89 11                	mov    %edx,(%ecx)
 8052fd7:	c9                   	leave  
 8052fd8:	c3                   	ret    
 8052fd9:	66 90                	xchg   %ax,%ax
 8052fdb:	66 90                	xchg   %ax,%ax
 8052fdd:	66 90                	xchg   %ax,%ax
 8052fdf:	90                   	nop

08052fe0 <_fclose_r>:
 8052fe0:	55                   	push   %ebp
 8052fe1:	89 e5                	mov    %esp,%ebp
 8052fe3:	57                   	push   %edi
 8052fe4:	56                   	push   %esi
 8052fe5:	53                   	push   %ebx
 8052fe6:	83 ec 1c             	sub    $0x1c,%esp
 8052fe9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8052fec:	8b 75 08             	mov    0x8(%ebp),%esi
 8052fef:	85 db                	test   %ebx,%ebx
 8052ff1:	74 16                	je     8053009 <_fclose_r+0x29>
 8052ff3:	85 f6                	test   %esi,%esi
 8052ff5:	74 0b                	je     8053002 <_fclose_r+0x22>
 8052ff7:	8b 56 38             	mov    0x38(%esi),%edx
 8052ffa:	85 d2                	test   %edx,%edx
 8052ffc:	0f 84 9e 00 00 00    	je     80530a0 <_fclose_r+0xc0>
 8053002:	66 83 7b 0c 00       	cmpw   $0x0,0xc(%ebx)
 8053007:	75 0f                	jne    8053018 <_fclose_r+0x38>
 8053009:	83 c4 1c             	add    $0x1c,%esp
 805300c:	31 c0                	xor    %eax,%eax
 805300e:	5b                   	pop    %ebx
 805300f:	5e                   	pop    %esi
 8053010:	5f                   	pop    %edi
 8053011:	5d                   	pop    %ebp
 8053012:	c3                   	ret    
 8053013:	90                   	nop
 8053014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053018:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805301c:	89 34 24             	mov    %esi,(%esp)
 805301f:	e8 ac b8 ff ff       	call   804e8d0 <_fflush_r>
 8053024:	89 c7                	mov    %eax,%edi
 8053026:	8b 43 2c             	mov    0x2c(%ebx),%eax
 8053029:	85 c0                	test   %eax,%eax
 805302b:	74 16                	je     8053043 <_fclose_r+0x63>
 805302d:	8b 53 1c             	mov    0x1c(%ebx),%edx
 8053030:	89 34 24             	mov    %esi,(%esp)
 8053033:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053037:	ff d0                	call   *%eax
 8053039:	85 c0                	test   %eax,%eax
 805303b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8053040:	0f 48 f8             	cmovs  %eax,%edi
 8053043:	f6 43 0c 80          	testb  $0x80,0xc(%ebx)
 8053047:	75 67                	jne    80530b0 <_fclose_r+0xd0>
 8053049:	8b 43 30             	mov    0x30(%ebx),%eax
 805304c:	85 c0                	test   %eax,%eax
 805304e:	74 1a                	je     805306a <_fclose_r+0x8a>
 8053050:	8d 53 40             	lea    0x40(%ebx),%edx
 8053053:	39 d0                	cmp    %edx,%eax
 8053055:	74 0c                	je     8053063 <_fclose_r+0x83>
 8053057:	89 44 24 04          	mov    %eax,0x4(%esp)
 805305b:	89 34 24             	mov    %esi,(%esp)
 805305e:	e8 2d be ff ff       	call   804ee90 <_free_r>
 8053063:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
 805306a:	8b 43 44             	mov    0x44(%ebx),%eax
 805306d:	85 c0                	test   %eax,%eax
 805306f:	74 13                	je     8053084 <_fclose_r+0xa4>
 8053071:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053075:	89 34 24             	mov    %esi,(%esp)
 8053078:	e8 13 be ff ff       	call   804ee90 <_free_r>
 805307d:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
 8053084:	e8 97 bc ff ff       	call   804ed20 <__sfp_lock_acquire>
 8053089:	31 c0                	xor    %eax,%eax
 805308b:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 805308f:	e8 9c bc ff ff       	call   804ed30 <__sfp_lock_release>
 8053094:	83 c4 1c             	add    $0x1c,%esp
 8053097:	89 f8                	mov    %edi,%eax
 8053099:	5b                   	pop    %ebx
 805309a:	5e                   	pop    %esi
 805309b:	5f                   	pop    %edi
 805309c:	5d                   	pop    %ebp
 805309d:	c3                   	ret    
 805309e:	66 90                	xchg   %ax,%ax
 80530a0:	89 34 24             	mov    %esi,(%esp)
 80530a3:	e8 98 b9 ff ff       	call   804ea40 <__sinit>
 80530a8:	e9 55 ff ff ff       	jmp    8053002 <_fclose_r+0x22>
 80530ad:	8d 76 00             	lea    0x0(%esi),%esi
 80530b0:	8b 43 10             	mov    0x10(%ebx),%eax
 80530b3:	89 34 24             	mov    %esi,(%esp)
 80530b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80530ba:	e8 d1 bd ff ff       	call   804ee90 <_free_r>
 80530bf:	eb 88                	jmp    8053049 <_fclose_r+0x69>
 80530c1:	eb 0d                	jmp    80530d0 <fclose>
 80530c3:	90                   	nop
 80530c4:	90                   	nop
 80530c5:	90                   	nop
 80530c6:	90                   	nop
 80530c7:	90                   	nop
 80530c8:	90                   	nop
 80530c9:	90                   	nop
 80530ca:	90                   	nop
 80530cb:	90                   	nop
 80530cc:	90                   	nop
 80530cd:	90                   	nop
 80530ce:	90                   	nop
 80530cf:	90                   	nop

080530d0 <fclose>:
 80530d0:	55                   	push   %ebp
 80530d1:	89 e5                	mov    %esp,%ebp
 80530d3:	83 ec 18             	sub    $0x18,%esp
 80530d6:	e8 05 c1 ff ff       	call   804f1e0 <__getreent>
 80530db:	8b 55 08             	mov    0x8(%ebp),%edx
 80530de:	89 54 24 04          	mov    %edx,0x4(%esp)
 80530e2:	89 04 24             	mov    %eax,(%esp)
 80530e5:	e8 f6 fe ff ff       	call   8052fe0 <_fclose_r>
 80530ea:	c9                   	leave  
 80530eb:	c3                   	ret    
 80530ec:	66 90                	xchg   %ax,%ax
 80530ee:	66 90                	xchg   %ax,%ax

080530f0 <_fputwc_r>:
 80530f0:	55                   	push   %ebp
 80530f1:	89 e5                	mov    %esp,%ebp
 80530f3:	57                   	push   %edi
 80530f4:	56                   	push   %esi
 80530f5:	53                   	push   %ebx
 80530f6:	83 ec 2c             	sub    $0x2c,%esp
 80530f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80530fc:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053100:	f6 c4 20             	test   $0x20,%ah
 8053103:	75 0e                	jne    8053113 <_fputwc_r+0x23>
 8053105:	81 4b 64 00 20 00 00 	orl    $0x2000,0x64(%ebx)
 805310c:	80 cc 20             	or     $0x20,%ah
 805310f:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053113:	e8 58 c1 ff ff       	call   804f270 <__locale_mb_cur_max>
 8053118:	83 f8 01             	cmp    $0x1,%eax
 805311b:	0f 84 cf 00 00 00    	je     80531f0 <_fputwc_r+0x100>
 8053121:	8d 43 5c             	lea    0x5c(%ebx),%eax
 8053124:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8053128:	8b 45 0c             	mov    0xc(%ebp),%eax
 805312b:	89 44 24 08          	mov    %eax,0x8(%esp)
 805312f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8053132:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053136:	8b 45 08             	mov    0x8(%ebp),%eax
 8053139:	89 04 24             	mov    %eax,(%esp)
 805313c:	e8 df 0f 00 00       	call   8054120 <_wcrtomb_r>
 8053141:	83 f8 ff             	cmp    $0xffffffff,%eax
 8053144:	89 c7                	mov    %eax,%edi
 8053146:	74 60                	je     80531a8 <_fputwc_r+0xb8>
 8053148:	85 ff                	test   %edi,%edi
 805314a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 805314e:	74 48                	je     8053198 <_fputwc_r+0xa8>
 8053150:	31 f6                	xor    %esi,%esi
 8053152:	eb 17                	jmp    805316b <_fputwc_r+0x7b>
 8053154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053158:	8b 13                	mov    (%ebx),%edx
 805315a:	88 02                	mov    %al,(%edx)
 805315c:	83 03 01             	addl   $0x1,(%ebx)
 805315f:	83 c6 01             	add    $0x1,%esi
 8053162:	39 fe                	cmp    %edi,%esi
 8053164:	73 32                	jae    8053198 <_fputwc_r+0xa8>
 8053166:	0f b6 44 35 e7       	movzbl -0x19(%ebp,%esi,1),%eax
 805316b:	8b 4b 08             	mov    0x8(%ebx),%ecx
 805316e:	8d 51 ff             	lea    -0x1(%ecx),%edx
 8053171:	85 d2                	test   %edx,%edx
 8053173:	89 53 08             	mov    %edx,0x8(%ebx)
 8053176:	79 e0                	jns    8053158 <_fputwc_r+0x68>
 8053178:	3b 53 18             	cmp    0x18(%ebx),%edx
 805317b:	7c 43                	jl     80531c0 <_fputwc_r+0xd0>
 805317d:	8b 13                	mov    (%ebx),%edx
 805317f:	88 02                	mov    %al,(%edx)
 8053181:	8b 03                	mov    (%ebx),%eax
 8053183:	80 38 0a             	cmpb   $0xa,(%eax)
 8053186:	0f 84 8c 00 00 00    	je     8053218 <_fputwc_r+0x128>
 805318c:	83 c6 01             	add    $0x1,%esi
 805318f:	83 c0 01             	add    $0x1,%eax
 8053192:	39 fe                	cmp    %edi,%esi
 8053194:	89 03                	mov    %eax,(%ebx)
 8053196:	72 ce                	jb     8053166 <_fputwc_r+0x76>
 8053198:	8b 45 0c             	mov    0xc(%ebp),%eax
 805319b:	83 c4 2c             	add    $0x2c,%esp
 805319e:	5b                   	pop    %ebx
 805319f:	5e                   	pop    %esi
 80531a0:	5f                   	pop    %edi
 80531a1:	5d                   	pop    %ebp
 80531a2:	c3                   	ret    
 80531a3:	90                   	nop
 80531a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80531a8:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
 80531ad:	83 c4 2c             	add    $0x2c,%esp
 80531b0:	5b                   	pop    %ebx
 80531b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80531b6:	5e                   	pop    %esi
 80531b7:	5f                   	pop    %edi
 80531b8:	5d                   	pop    %ebp
 80531b9:	c3                   	ret    
 80531ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80531c0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80531c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80531c8:	8b 45 08             	mov    0x8(%ebp),%eax
 80531cb:	89 04 24             	mov    %eax,(%esp)
 80531ce:	e8 fd 0d 00 00       	call   8053fd0 <__swbuf_r>
 80531d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 80531d6:	0f 94 c0             	sete   %al
 80531d9:	84 c0                	test   %al,%al
 80531db:	74 82                	je     805315f <_fputwc_r+0x6f>
 80531dd:	83 c4 2c             	add    $0x2c,%esp
 80531e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80531e5:	5b                   	pop    %ebx
 80531e6:	5e                   	pop    %esi
 80531e7:	5f                   	pop    %edi
 80531e8:	5d                   	pop    %ebp
 80531e9:	c3                   	ret    
 80531ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80531f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80531f3:	83 e8 01             	sub    $0x1,%eax
 80531f6:	3d fe 00 00 00       	cmp    $0xfe,%eax
 80531fb:	0f 87 20 ff ff ff    	ja     8053121 <_fputwc_r+0x31>
 8053201:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
 8053205:	bf 01 00 00 00       	mov    $0x1,%edi
 805320a:	88 45 e7             	mov    %al,-0x19(%ebp)
 805320d:	e9 3e ff ff ff       	jmp    8053150 <_fputwc_r+0x60>
 8053212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053218:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 805321c:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 8053223:	00 
 8053224:	eb a2                	jmp    80531c8 <_fputwc_r+0xd8>
 8053226:	8d 76 00             	lea    0x0(%esi),%esi
 8053229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08053230 <fputwc>:
 8053230:	55                   	push   %ebp
 8053231:	89 e5                	mov    %esp,%ebp
 8053233:	83 ec 18             	sub    $0x18,%esp
 8053236:	e8 a5 bf ff ff       	call   804f1e0 <__getreent>
 805323b:	85 c0                	test   %eax,%eax
 805323d:	74 15                	je     8053254 <fputwc+0x24>
 805323f:	8b 50 38             	mov    0x38(%eax),%edx
 8053242:	85 d2                	test   %edx,%edx
 8053244:	75 0e                	jne    8053254 <fputwc+0x24>
 8053246:	89 04 24             	mov    %eax,(%esp)
 8053249:	89 45 f4             	mov    %eax,-0xc(%ebp)
 805324c:	e8 ef b7 ff ff       	call   804ea40 <__sinit>
 8053251:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8053254:	8b 55 0c             	mov    0xc(%ebp),%edx
 8053257:	89 04 24             	mov    %eax,(%esp)
 805325a:	89 54 24 08          	mov    %edx,0x8(%esp)
 805325e:	8b 55 08             	mov    0x8(%ebp),%edx
 8053261:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053265:	e8 86 fe ff ff       	call   80530f0 <_fputwc_r>
 805326a:	c9                   	leave  
 805326b:	c3                   	ret    
 805326c:	66 90                	xchg   %ax,%ax
 805326e:	66 90                	xchg   %ax,%ax

08053270 <_fstat_r>:
 8053270:	55                   	push   %ebp
 8053271:	89 e5                	mov    %esp,%ebp
 8053273:	83 ec 18             	sub    $0x18,%esp
 8053276:	8b 45 10             	mov    0x10(%ebp),%eax
 8053279:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 8053280:	00 00 00 
 8053283:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053287:	8b 45 0c             	mov    0xc(%ebp),%eax
 805328a:	89 04 24             	mov    %eax,(%esp)
 805328d:	e8 be 51 ff ff       	call   8048450 <fstat>
 8053292:	83 f8 ff             	cmp    $0xffffffff,%eax
 8053295:	74 09                	je     80532a0 <_fstat_r+0x30>
 8053297:	c9                   	leave  
 8053298:	c3                   	ret    
 8053299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80532a0:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 80532a6:	85 d2                	test   %edx,%edx
 80532a8:	74 ed                	je     8053297 <_fstat_r+0x27>
 80532aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80532ad:	89 11                	mov    %edx,(%ecx)
 80532af:	c9                   	leave  
 80532b0:	c3                   	ret    
 80532b1:	66 90                	xchg   %ax,%ax
 80532b3:	66 90                	xchg   %ax,%ax
 80532b5:	66 90                	xchg   %ax,%ax
 80532b7:	66 90                	xchg   %ax,%ax
 80532b9:	66 90                	xchg   %ax,%ax
 80532bb:	66 90                	xchg   %ax,%ax
 80532bd:	66 90                	xchg   %ax,%ax
 80532bf:	90                   	nop

080532c0 <__sfvwrite_r>:
 80532c0:	55                   	push   %ebp
 80532c1:	89 e5                	mov    %esp,%ebp
 80532c3:	57                   	push   %edi
 80532c4:	56                   	push   %esi
 80532c5:	53                   	push   %ebx
 80532c6:	83 ec 3c             	sub    $0x3c,%esp
 80532c9:	8b 45 10             	mov    0x10(%ebp),%eax
 80532cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80532cf:	8b 48 08             	mov    0x8(%eax),%ecx
 80532d2:	85 c9                	test   %ecx,%ecx
 80532d4:	74 7e                	je     8053354 <__sfvwrite_r+0x94>
 80532d6:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 80532da:	a8 08                	test   $0x8,%al
 80532dc:	0f 84 7e 00 00 00    	je     8053360 <__sfvwrite_r+0xa0>
 80532e2:	8b 53 10             	mov    0x10(%ebx),%edx
 80532e5:	85 d2                	test   %edx,%edx
 80532e7:	74 77                	je     8053360 <__sfvwrite_r+0xa0>
 80532e9:	8b 7d 10             	mov    0x10(%ebp),%edi
 80532ec:	a8 02                	test   $0x2,%al
 80532ee:	8b 3f                	mov    (%edi),%edi
 80532f0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80532f3:	0f 84 92 00 00 00    	je     805338b <__sfvwrite_r+0xcb>
 80532f9:	31 ff                	xor    %edi,%edi
 80532fb:	31 f6                	xor    %esi,%esi
 80532fd:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 8053300:	89 fb                	mov    %edi,%ebx
 8053302:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8053305:	8d 76 00             	lea    0x0(%esi),%esi
 8053308:	85 f6                	test   %esi,%esi
 805330a:	0f 84 00 01 00 00    	je     8053410 <__sfvwrite_r+0x150>
 8053310:	81 fe 00 fc ff 7f    	cmp    $0x7ffffc00,%esi
 8053316:	b8 00 fc ff 7f       	mov    $0x7ffffc00,%eax
 805331b:	0f 46 c6             	cmovbe %esi,%eax
 805331e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8053322:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053326:	8b 47 1c             	mov    0x1c(%edi),%eax
 8053329:	89 44 24 04          	mov    %eax,0x4(%esp)
 805332d:	8b 45 08             	mov    0x8(%ebp),%eax
 8053330:	89 04 24             	mov    %eax,(%esp)
 8053333:	ff 57 24             	call   *0x24(%edi)
 8053336:	85 c0                	test   %eax,%eax
 8053338:	0f 8e 2a 04 00 00    	jle    8053768 <__sfvwrite_r+0x4a8>
 805333e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053341:	01 c3                	add    %eax,%ebx
 8053343:	29 c6                	sub    %eax,%esi
 8053345:	8b 49 08             	mov    0x8(%ecx),%ecx
 8053348:	29 c1                	sub    %eax,%ecx
 805334a:	8b 45 10             	mov    0x10(%ebp),%eax
 805334d:	85 c9                	test   %ecx,%ecx
 805334f:	89 48 08             	mov    %ecx,0x8(%eax)
 8053352:	75 b4                	jne    8053308 <__sfvwrite_r+0x48>
 8053354:	31 c0                	xor    %eax,%eax
 8053356:	83 c4 3c             	add    $0x3c,%esp
 8053359:	5b                   	pop    %ebx
 805335a:	5e                   	pop    %esi
 805335b:	5f                   	pop    %edi
 805335c:	5d                   	pop    %ebp
 805335d:	c3                   	ret    
 805335e:	66 90                	xchg   %ax,%ax
 8053360:	8b 45 08             	mov    0x8(%ebp),%eax
 8053363:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053367:	89 04 24             	mov    %eax,(%esp)
 805336a:	e8 61 9e ff ff       	call   804d1d0 <__swsetup_r>
 805336f:	85 c0                	test   %eax,%eax
 8053371:	0f 85 f8 03 00 00    	jne    805376f <__sfvwrite_r+0x4af>
 8053377:	8b 7d 10             	mov    0x10(%ebp),%edi
 805337a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805337e:	8b 3f                	mov    (%edi),%edi
 8053380:	a8 02                	test   $0x2,%al
 8053382:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8053385:	0f 85 6e ff ff ff    	jne    80532f9 <__sfvwrite_r+0x39>
 805338b:	a8 01                	test   $0x1,%al
 805338d:	0f 85 95 00 00 00    	jne    8053428 <__sfvwrite_r+0x168>
 8053393:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 805339a:	31 ff                	xor    %edi,%edi
 805339c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80533a0:	85 ff                	test   %edi,%edi
 80533a2:	74 5b                	je     80533ff <__sfvwrite_r+0x13f>
 80533a4:	f6 c4 02             	test   $0x2,%ah
 80533a7:	8b 73 08             	mov    0x8(%ebx),%esi
 80533aa:	0f 84 30 01 00 00    	je     80534e0 <__sfvwrite_r+0x220>
 80533b0:	39 f7                	cmp    %esi,%edi
 80533b2:	0f 82 d8 01 00 00    	jb     8053590 <__sfvwrite_r+0x2d0>
 80533b8:	66 a9 80 04          	test   $0x480,%ax
 80533bc:	0f 85 16 02 00 00    	jne    80535d8 <__sfvwrite_r+0x318>
 80533c2:	8b 03                	mov    (%ebx),%eax
 80533c4:	89 f2                	mov    %esi,%edx
 80533c6:	89 54 24 08          	mov    %edx,0x8(%esp)
 80533ca:	89 55 dc             	mov    %edx,-0x24(%ebp)
 80533cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80533d0:	89 04 24             	mov    %eax,(%esp)
 80533d3:	89 54 24 04          	mov    %edx,0x4(%esp)
 80533d7:	e8 44 04 00 00       	call   8053820 <memmove>
 80533dc:	8b 55 dc             	mov    -0x24(%ebp),%edx
 80533df:	01 13                	add    %edx,(%ebx)
 80533e1:	29 73 08             	sub    %esi,0x8(%ebx)
 80533e4:	89 fe                	mov    %edi,%esi
 80533e6:	8b 45 10             	mov    0x10(%ebp),%eax
 80533e9:	29 f7                	sub    %esi,%edi
 80533eb:	01 75 e0             	add    %esi,-0x20(%ebp)
 80533ee:	29 70 08             	sub    %esi,0x8(%eax)
 80533f1:	0f 84 5d ff ff ff    	je     8053354 <__sfvwrite_r+0x94>
 80533f7:	85 ff                	test   %edi,%edi
 80533f9:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 80533fd:	75 a5                	jne    80533a4 <__sfvwrite_r+0xe4>
 80533ff:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8053402:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 8053406:	8b 11                	mov    (%ecx),%edx
 8053408:	8b 79 04             	mov    0x4(%ecx),%edi
 805340b:	89 55 e0             	mov    %edx,-0x20(%ebp)
 805340e:	eb 90                	jmp    80533a0 <__sfvwrite_r+0xe0>
 8053410:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053413:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 8053417:	8b 18                	mov    (%eax),%ebx
 8053419:	8b 70 04             	mov    0x4(%eax),%esi
 805341c:	e9 e7 fe ff ff       	jmp    8053308 <__sfvwrite_r+0x48>
 8053421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053428:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 805342f:	31 ff                	xor    %edi,%edi
 8053431:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8053438:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 805343f:	90                   	nop
 8053440:	85 ff                	test   %edi,%edi
 8053442:	74 7f                	je     80534c3 <__sfvwrite_r+0x203>
 8053444:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8053447:	85 c0                	test   %eax,%eax
 8053449:	0f 84 51 01 00 00    	je     80535a0 <__sfvwrite_r+0x2e0>
 805344f:	8b 75 d8             	mov    -0x28(%ebp),%esi
 8053452:	8b 0b                	mov    (%ebx),%ecx
 8053454:	8b 53 08             	mov    0x8(%ebx),%edx
 8053457:	8b 43 14             	mov    0x14(%ebx),%eax
 805345a:	39 fe                	cmp    %edi,%esi
 805345c:	0f 47 f7             	cmova  %edi,%esi
 805345f:	3b 4b 10             	cmp    0x10(%ebx),%ecx
 8053462:	76 0a                	jbe    805346e <__sfvwrite_r+0x1ae>
 8053464:	01 c2                	add    %eax,%edx
 8053466:	39 d6                	cmp    %edx,%esi
 8053468:	0f 8f 4a 02 00 00    	jg     80536b8 <__sfvwrite_r+0x3f8>
 805346e:	39 c6                	cmp    %eax,%esi
 8053470:	0f 8c da 00 00 00    	jl     8053550 <__sfvwrite_r+0x290>
 8053476:	89 44 24 0c          	mov    %eax,0xc(%esp)
 805347a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 805347d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8053481:	8b 43 1c             	mov    0x1c(%ebx),%eax
 8053484:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053488:	8b 45 08             	mov    0x8(%ebp),%eax
 805348b:	89 04 24             	mov    %eax,(%esp)
 805348e:	ff 53 24             	call   *0x24(%ebx)
 8053491:	85 c0                	test   %eax,%eax
 8053493:	89 c6                	mov    %eax,%esi
 8053495:	0f 8e 9d 00 00 00    	jle    8053538 <__sfvwrite_r+0x278>
 805349b:	29 75 d8             	sub    %esi,-0x28(%ebp)
 805349e:	0f 84 cd 00 00 00    	je     8053571 <__sfvwrite_r+0x2b1>
 80534a4:	8b 45 10             	mov    0x10(%ebp),%eax
 80534a7:	29 f7                	sub    %esi,%edi
 80534a9:	8b 55 10             	mov    0x10(%ebp),%edx
 80534ac:	01 75 e0             	add    %esi,-0x20(%ebp)
 80534af:	8b 40 08             	mov    0x8(%eax),%eax
 80534b2:	29 f0                	sub    %esi,%eax
 80534b4:	85 c0                	test   %eax,%eax
 80534b6:	89 42 08             	mov    %eax,0x8(%edx)
 80534b9:	0f 84 95 fe ff ff    	je     8053354 <__sfvwrite_r+0x94>
 80534bf:	85 ff                	test   %edi,%edi
 80534c1:	75 81                	jne    8053444 <__sfvwrite_r+0x184>
 80534c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80534c6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 80534cd:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
 80534d1:	8b 08                	mov    (%eax),%ecx
 80534d3:	8b 78 04             	mov    0x4(%eax),%edi
 80534d6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 80534d9:	e9 62 ff ff ff       	jmp    8053440 <__sfvwrite_r+0x180>
 80534de:	66 90                	xchg   %ax,%ax
 80534e0:	8b 03                	mov    (%ebx),%eax
 80534e2:	3b 43 10             	cmp    0x10(%ebx),%eax
 80534e5:	77 0b                	ja     80534f2 <__sfvwrite_r+0x232>
 80534e7:	8b 4b 14             	mov    0x14(%ebx),%ecx
 80534ea:	39 cf                	cmp    %ecx,%edi
 80534ec:	0f 83 86 01 00 00    	jae    8053678 <__sfvwrite_r+0x3b8>
 80534f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
 80534f5:	39 f7                	cmp    %esi,%edi
 80534f7:	0f 46 f7             	cmovbe %edi,%esi
 80534fa:	89 74 24 08          	mov    %esi,0x8(%esp)
 80534fe:	89 04 24             	mov    %eax,(%esp)
 8053501:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053505:	e8 16 03 00 00       	call   8053820 <memmove>
 805350a:	8b 43 08             	mov    0x8(%ebx),%eax
 805350d:	01 33                	add    %esi,(%ebx)
 805350f:	29 f0                	sub    %esi,%eax
 8053511:	85 c0                	test   %eax,%eax
 8053513:	89 43 08             	mov    %eax,0x8(%ebx)
 8053516:	0f 85 ca fe ff ff    	jne    80533e6 <__sfvwrite_r+0x126>
 805351c:	8b 45 08             	mov    0x8(%ebp),%eax
 805351f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053523:	89 04 24             	mov    %eax,(%esp)
 8053526:	e8 a5 b3 ff ff       	call   804e8d0 <_fflush_r>
 805352b:	85 c0                	test   %eax,%eax
 805352d:	0f 84 b3 fe ff ff    	je     80533e6 <__sfvwrite_r+0x126>
 8053533:	90                   	nop
 8053534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053538:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805353c:	83 c8 40             	or     $0x40,%eax
 805353f:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053543:	83 c4 3c             	add    $0x3c,%esp
 8053546:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 805354b:	5b                   	pop    %ebx
 805354c:	5e                   	pop    %esi
 805354d:	5f                   	pop    %edi
 805354e:	5d                   	pop    %ebp
 805354f:	c3                   	ret    
 8053550:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8053553:	89 74 24 08          	mov    %esi,0x8(%esp)
 8053557:	89 0c 24             	mov    %ecx,(%esp)
 805355a:	89 44 24 04          	mov    %eax,0x4(%esp)
 805355e:	e8 bd 02 00 00       	call   8053820 <memmove>
 8053563:	29 73 08             	sub    %esi,0x8(%ebx)
 8053566:	01 33                	add    %esi,(%ebx)
 8053568:	29 75 d8             	sub    %esi,-0x28(%ebp)
 805356b:	0f 85 33 ff ff ff    	jne    80534a4 <__sfvwrite_r+0x1e4>
 8053571:	8b 45 08             	mov    0x8(%ebp),%eax
 8053574:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8053578:	89 04 24             	mov    %eax,(%esp)
 805357b:	e8 50 b3 ff ff       	call   804e8d0 <_fflush_r>
 8053580:	85 c0                	test   %eax,%eax
 8053582:	75 b4                	jne    8053538 <__sfvwrite_r+0x278>
 8053584:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 805358b:	e9 14 ff ff ff       	jmp    80534a4 <__sfvwrite_r+0x1e4>
 8053590:	89 fe                	mov    %edi,%esi
 8053592:	8b 03                	mov    (%ebx),%eax
 8053594:	89 fa                	mov    %edi,%edx
 8053596:	e9 2b fe ff ff       	jmp    80533c6 <__sfvwrite_r+0x106>
 805359b:	90                   	nop
 805359c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80535a0:	8b 75 e0             	mov    -0x20(%ebp),%esi
 80535a3:	89 7c 24 08          	mov    %edi,0x8(%esp)
 80535a7:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 80535ae:	00 
 80535af:	89 34 24             	mov    %esi,(%esp)
 80535b2:	e8 c9 c5 ff ff       	call   804fb80 <memchr>
 80535b7:	85 c0                	test   %eax,%eax
 80535b9:	0f 84 91 01 00 00    	je     8053750 <__sfvwrite_r+0x490>
 80535bf:	83 c0 01             	add    $0x1,%eax
 80535c2:	89 45 d8             	mov    %eax,-0x28(%ebp)
 80535c5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 80535cc:	29 75 d8             	sub    %esi,-0x28(%ebp)
 80535cf:	e9 7b fe ff ff       	jmp    805344f <__sfvwrite_r+0x18f>
 80535d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80535d8:	8b 53 14             	mov    0x14(%ebx),%edx
 80535db:	8b 0b                	mov    (%ebx),%ecx
 80535dd:	8b 73 10             	mov    0x10(%ebx),%esi
 80535e0:	8d 14 52             	lea    (%edx,%edx,2),%edx
 80535e3:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 80535e6:	89 d1                	mov    %edx,%ecx
 80535e8:	c1 e9 1f             	shr    $0x1f,%ecx
 80535eb:	29 75 dc             	sub    %esi,-0x24(%ebp)
 80535ee:	01 ca                	add    %ecx,%edx
 80535f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 80535f3:	d1 fa                	sar    %edx
 80535f5:	8d 4c 0f 01          	lea    0x1(%edi,%ecx,1),%ecx
 80535f9:	39 ca                	cmp    %ecx,%edx
 80535fb:	0f 83 f7 00 00 00    	jae    80536f8 <__sfvwrite_r+0x438>
 8053601:	89 ca                	mov    %ecx,%edx
 8053603:	f6 c4 04             	test   $0x4,%ah
 8053606:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053609:	0f 84 f7 00 00 00    	je     8053706 <__sfvwrite_r+0x446>
 805360f:	8b 45 08             	mov    0x8(%ebp),%eax
 8053612:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8053616:	89 04 24             	mov    %eax,(%esp)
 8053619:	e8 22 be ff ff       	call   804f440 <_malloc_r>
 805361e:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8053621:	85 c0                	test   %eax,%eax
 8053623:	89 c6                	mov    %eax,%esi
 8053625:	0f 84 4e 01 00 00    	je     8053779 <__sfvwrite_r+0x4b9>
 805362b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 805362e:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053631:	89 44 24 08          	mov    %eax,0x8(%esp)
 8053635:	8b 43 10             	mov    0x10(%ebx),%eax
 8053638:	89 34 24             	mov    %esi,(%esp)
 805363b:	89 44 24 04          	mov    %eax,0x4(%esp)
 805363f:	e8 d4 c5 ff ff       	call   804fc18 <memcpy>
 8053644:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053648:	8b 55 d8             	mov    -0x28(%ebp),%edx
 805364b:	66 25 7f fb          	and    $0xfb7f,%ax
 805364f:	0c 80                	or     $0x80,%al
 8053651:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8053655:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 8053658:	89 53 14             	mov    %edx,0x14(%ebx)
 805365b:	89 73 10             	mov    %esi,0x10(%ebx)
 805365e:	89 c8                	mov    %ecx,%eax
 8053660:	29 ca                	sub    %ecx,%edx
 8053662:	01 f0                	add    %esi,%eax
 8053664:	89 fe                	mov    %edi,%esi
 8053666:	89 53 08             	mov    %edx,0x8(%ebx)
 8053669:	89 fa                	mov    %edi,%edx
 805366b:	89 03                	mov    %eax,(%ebx)
 805366d:	e9 54 fd ff ff       	jmp    80533c6 <__sfvwrite_r+0x106>
 8053672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053678:	81 ff ff ff ff 7f    	cmp    $0x7fffffff,%edi
 805367e:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
 8053683:	0f 46 c7             	cmovbe %edi,%eax
 8053686:	99                   	cltd   
 8053687:	f7 f9                	idiv   %ecx
 8053689:	0f af c1             	imul   %ecx,%eax
 805368c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8053690:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8053693:	89 44 24 08          	mov    %eax,0x8(%esp)
 8053697:	8b 43 1c             	mov    0x1c(%ebx),%eax
 805369a:	89 44 24 04          	mov    %eax,0x4(%esp)
 805369e:	8b 45 08             	mov    0x8(%ebp),%eax
 80536a1:	89 04 24             	mov    %eax,(%esp)
 80536a4:	ff 53 24             	call   *0x24(%ebx)
 80536a7:	85 c0                	test   %eax,%eax
 80536a9:	0f 8e 89 fe ff ff    	jle    8053538 <__sfvwrite_r+0x278>
 80536af:	89 c6                	mov    %eax,%esi
 80536b1:	e9 30 fd ff ff       	jmp    80533e6 <__sfvwrite_r+0x126>
 80536b6:	66 90                	xchg   %ax,%ax
 80536b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 80536bb:	89 54 24 08          	mov    %edx,0x8(%esp)
 80536bf:	89 0c 24             	mov    %ecx,(%esp)
 80536c2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 80536c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80536c9:	e8 52 01 00 00       	call   8053820 <memmove>
 80536ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80536d1:	8b 45 08             	mov    0x8(%ebp),%eax
 80536d4:	01 13                	add    %edx,(%ebx)
 80536d6:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80536da:	89 04 24             	mov    %eax,(%esp)
 80536dd:	e8 ee b1 ff ff       	call   804e8d0 <_fflush_r>
 80536e2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80536e5:	85 c0                	test   %eax,%eax
 80536e7:	0f 85 4b fe ff ff    	jne    8053538 <__sfvwrite_r+0x278>
 80536ed:	89 d6                	mov    %edx,%esi
 80536ef:	e9 a7 fd ff ff       	jmp    805349b <__sfvwrite_r+0x1db>
 80536f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80536f8:	f6 c4 04             	test   $0x4,%ah
 80536fb:	89 d1                	mov    %edx,%ecx
 80536fd:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053700:	0f 85 09 ff ff ff    	jne    805360f <__sfvwrite_r+0x34f>
 8053706:	8b 45 08             	mov    0x8(%ebp),%eax
 8053709:	89 74 24 04          	mov    %esi,0x4(%esp)
 805370d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8053711:	89 04 24             	mov    %eax,(%esp)
 8053714:	e8 e7 01 00 00       	call   8053900 <_realloc_r>
 8053719:	8b 55 d8             	mov    -0x28(%ebp),%edx
 805371c:	85 c0                	test   %eax,%eax
 805371e:	89 c6                	mov    %eax,%esi
 8053720:	0f 85 2f ff ff ff    	jne    8053655 <__sfvwrite_r+0x395>
 8053726:	8b 43 10             	mov    0x10(%ebx),%eax
 8053729:	89 44 24 04          	mov    %eax,0x4(%esp)
 805372d:	8b 45 08             	mov    0x8(%ebp),%eax
 8053730:	89 04 24             	mov    %eax,(%esp)
 8053733:	e8 58 b7 ff ff       	call   804ee90 <_free_r>
 8053738:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 805373c:	8b 7d 08             	mov    0x8(%ebp),%edi
 805373f:	24 7f                	and    $0x7f,%al
 8053741:	c7 07 0c 00 00 00    	movl   $0xc,(%edi)
 8053747:	e9 f0 fd ff ff       	jmp    805353c <__sfvwrite_r+0x27c>
 805374c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053750:	8d 47 01             	lea    0x1(%edi),%eax
 8053753:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8053756:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 805375d:	e9 ed fc ff ff       	jmp    805344f <__sfvwrite_r+0x18f>
 8053762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053768:	89 fb                	mov    %edi,%ebx
 805376a:	e9 c9 fd ff ff       	jmp    8053538 <__sfvwrite_r+0x278>
 805376f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8053774:	e9 dd fb ff ff       	jmp    8053356 <__sfvwrite_r+0x96>
 8053779:	8b 45 08             	mov    0x8(%ebp),%eax
 805377c:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8053782:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053786:	e9 b1 fd ff ff       	jmp    805353c <__sfvwrite_r+0x27c>
 805378b:	66 90                	xchg   %ax,%ax
 805378d:	66 90                	xchg   %ax,%ax
 805378f:	90                   	nop

08053790 <_isatty_r>:
 8053790:	55                   	push   %ebp
 8053791:	89 e5                	mov    %esp,%ebp
 8053793:	83 ec 18             	sub    $0x18,%esp
 8053796:	8b 45 0c             	mov    0xc(%ebp),%eax
 8053799:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 80537a0:	00 00 00 
 80537a3:	89 04 24             	mov    %eax,(%esp)
 80537a6:	e8 c5 4c ff ff       	call   8048470 <isatty>
 80537ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 80537ae:	74 08                	je     80537b8 <_isatty_r+0x28>
 80537b0:	c9                   	leave  
 80537b1:	c3                   	ret    
 80537b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80537b8:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 80537be:	85 d2                	test   %edx,%edx
 80537c0:	74 ee                	je     80537b0 <_isatty_r+0x20>
 80537c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80537c5:	89 11                	mov    %edx,(%ecx)
 80537c7:	c9                   	leave  
 80537c8:	c3                   	ret    
 80537c9:	66 90                	xchg   %ax,%ax
 80537cb:	66 90                	xchg   %ax,%ax
 80537cd:	66 90                	xchg   %ax,%ax
 80537cf:	90                   	nop

080537d0 <_lseek_r>:
 80537d0:	55                   	push   %ebp
 80537d1:	89 e5                	mov    %esp,%ebp
 80537d3:	83 ec 18             	sub    $0x18,%esp
 80537d6:	8b 45 14             	mov    0x14(%ebp),%eax
 80537d9:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 80537e0:	00 00 00 
 80537e3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80537e7:	8b 45 10             	mov    0x10(%ebp),%eax
 80537ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 80537ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 80537f1:	89 04 24             	mov    %eax,(%esp)
 80537f4:	e8 e7 4b ff ff       	call   80483e0 <lseek>
 80537f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 80537fc:	74 02                	je     8053800 <_lseek_r+0x30>
 80537fe:	c9                   	leave  
 80537ff:	c3                   	ret    
 8053800:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 8053806:	85 d2                	test   %edx,%edx
 8053808:	74 f4                	je     80537fe <_lseek_r+0x2e>
 805380a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805380d:	89 11                	mov    %edx,(%ecx)
 805380f:	c9                   	leave  
 8053810:	c3                   	ret    
 8053811:	66 90                	xchg   %ax,%ax
 8053813:	66 90                	xchg   %ax,%ax
 8053815:	66 90                	xchg   %ax,%ax
 8053817:	66 90                	xchg   %ax,%ax
 8053819:	66 90                	xchg   %ax,%ax
 805381b:	66 90                	xchg   %ax,%ax
 805381d:	66 90                	xchg   %ax,%ax
 805381f:	90                   	nop

08053820 <memmove>:
 8053820:	55                   	push   %ebp
 8053821:	89 e5                	mov    %esp,%ebp
 8053823:	56                   	push   %esi
 8053824:	57                   	push   %edi
 8053825:	53                   	push   %ebx
 8053826:	8b 7d 08             	mov    0x8(%ebp),%edi
 8053829:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805382c:	8b 75 0c             	mov    0xc(%ebp),%esi
 805382f:	fc                   	cld    
 8053830:	39 fe                	cmp    %edi,%esi
 8053832:	73 43                	jae    8053877 <memmove+0x57>
 8053834:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
 8053838:	39 df                	cmp    %ebx,%edi
 805383a:	77 3b                	ja     8053877 <memmove+0x57>
 805383c:	01 ce                	add    %ecx,%esi
 805383e:	01 cf                	add    %ecx,%edi
 8053840:	fd                   	std    
 8053841:	83 f9 08             	cmp    $0x8,%ecx
 8053844:	76 2b                	jbe    8053871 <memmove+0x51>
 8053846:	89 fa                	mov    %edi,%edx
 8053848:	89 cb                	mov    %ecx,%ebx
 805384a:	83 e2 03             	and    $0x3,%edx
 805384d:	74 0c                	je     805385b <memmove+0x3b>
 805384f:	89 d1                	mov    %edx,%ecx
 8053851:	4e                   	dec    %esi
 8053852:	4f                   	dec    %edi
 8053853:	29 cb                	sub    %ecx,%ebx
 8053855:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8053857:	89 d9                	mov    %ebx,%ecx
 8053859:	46                   	inc    %esi
 805385a:	47                   	inc    %edi
 805385b:	c1 e9 02             	shr    $0x2,%ecx
 805385e:	83 ee 04             	sub    $0x4,%esi
 8053861:	83 ef 04             	sub    $0x4,%edi
 8053864:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8053866:	83 c6 04             	add    $0x4,%esi
 8053869:	83 c7 04             	add    $0x4,%edi
 805386c:	89 d9                	mov    %ebx,%ecx
 805386e:	83 e1 03             	and    $0x3,%ecx
 8053871:	4e                   	dec    %esi
 8053872:	4f                   	dec    %edi
 8053873:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8053875:	eb 2a                	jmp    80538a1 <memmove+0x81>
 8053877:	83 f9 08             	cmp    $0x8,%ecx
 805387a:	76 23                	jbe    805389f <memmove+0x7f>
 805387c:	89 fa                	mov    %edi,%edx
 805387e:	89 cb                	mov    %ecx,%ebx
 8053880:	83 e2 03             	and    $0x3,%edx
 8053883:	74 10                	je     8053895 <memmove+0x75>
 8053885:	b9 04 00 00 00       	mov    $0x4,%ecx
 805388a:	29 d1                	sub    %edx,%ecx
 805388c:	83 e1 03             	and    $0x3,%ecx
 805388f:	29 cb                	sub    %ecx,%ebx
 8053891:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 8053893:	89 d9                	mov    %ebx,%ecx
 8053895:	c1 e9 02             	shr    $0x2,%ecx
 8053898:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 805389a:	89 d9                	mov    %ebx,%ecx
 805389c:	83 e1 03             	and    $0x3,%ecx
 805389f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
 80538a1:	8b 45 08             	mov    0x8(%ebp),%eax
 80538a4:	fc                   	cld    
 80538a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80538a8:	5b                   	pop    %ebx
 80538a9:	5f                   	pop    %edi
 80538aa:	5e                   	pop    %esi
 80538ab:	c9                   	leave  
 80538ac:	c3                   	ret    
 80538ad:	66 90                	xchg   %ax,%ax
 80538af:	90                   	nop

080538b0 <_read_r>:
 80538b0:	55                   	push   %ebp
 80538b1:	89 e5                	mov    %esp,%ebp
 80538b3:	83 ec 18             	sub    $0x18,%esp
 80538b6:	8b 45 14             	mov    0x14(%ebp),%eax
 80538b9:	c7 05 54 dd 06 08 00 	movl   $0x0,0x806dd54
 80538c0:	00 00 00 
 80538c3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80538c7:	8b 45 10             	mov    0x10(%ebp),%eax
 80538ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 80538ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 80538d1:	89 04 24             	mov    %eax,(%esp)
 80538d4:	e8 d7 4a ff ff       	call   80483b0 <read>
 80538d9:	83 f8 ff             	cmp    $0xffffffff,%eax
 80538dc:	74 02                	je     80538e0 <_read_r+0x30>
 80538de:	c9                   	leave  
 80538df:	c3                   	ret    
 80538e0:	8b 15 54 dd 06 08    	mov    0x806dd54,%edx
 80538e6:	85 d2                	test   %edx,%edx
 80538e8:	74 f4                	je     80538de <_read_r+0x2e>
 80538ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80538ed:	89 11                	mov    %edx,(%ecx)
 80538ef:	c9                   	leave  
 80538f0:	c3                   	ret    
 80538f1:	66 90                	xchg   %ax,%ax
 80538f3:	66 90                	xchg   %ax,%ax
 80538f5:	66 90                	xchg   %ax,%ax
 80538f7:	66 90                	xchg   %ax,%ax
 80538f9:	66 90                	xchg   %ax,%ax
 80538fb:	66 90                	xchg   %ax,%ax
 80538fd:	66 90                	xchg   %ax,%ax
 80538ff:	90                   	nop

08053900 <_realloc_r>:
 8053900:	55                   	push   %ebp
 8053901:	89 e5                	mov    %esp,%ebp
 8053903:	57                   	push   %edi
 8053904:	56                   	push   %esi
 8053905:	53                   	push   %ebx
 8053906:	83 ec 3c             	sub    $0x3c,%esp
 8053909:	8b 45 08             	mov    0x8(%ebp),%eax
 805390c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805390f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8053912:	8b 45 10             	mov    0x10(%ebp),%eax
 8053915:	85 ff                	test   %edi,%edi
 8053917:	89 45 e0             	mov    %eax,-0x20(%ebp)
 805391a:	0f 84 50 02 00 00    	je     8053b70 <_realloc_r+0x270>
 8053920:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053923:	8d 77 f8             	lea    -0x8(%edi),%esi
 8053926:	89 04 24             	mov    %eax,(%esp)
 8053929:	e8 32 c3 ff ff       	call   804fc60 <__malloc_lock>
 805392e:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053931:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053934:	89 c3                	mov    %eax,%ebx
 8053936:	8d 51 0b             	lea    0xb(%ecx),%edx
 8053939:	83 e3 fc             	and    $0xfffffffc,%ebx
 805393c:	83 fa 16             	cmp    $0x16,%edx
 805393f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8053942:	0f 87 00 01 00 00    	ja     8053a48 <_realloc_r+0x148>
 8053948:	31 d2                	xor    %edx,%edx
 805394a:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
 8053951:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
 8053958:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 805395b:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
 805395e:	0f 82 1c 02 00 00    	jb     8053b80 <_realloc_r+0x280>
 8053964:	84 d2                	test   %dl,%dl
 8053966:	0f 85 14 02 00 00    	jne    8053b80 <_realloc_r+0x280>
 805396c:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
 805396f:	0f 8d eb 00 00 00    	jge    8053a60 <_realloc_r+0x160>
 8053975:	8b 0d 48 80 05 08    	mov    0x8058048,%ecx
 805397b:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
 805397e:	39 d1                	cmp    %edx,%ecx
 8053980:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 8053983:	0f 84 6f 02 00 00    	je     8053bf8 <_realloc_r+0x2f8>
 8053989:	8b 4a 04             	mov    0x4(%edx),%ecx
 805398c:	89 c8                	mov    %ecx,%eax
 805398e:	83 e0 fe             	and    $0xfffffffe,%eax
 8053991:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
 8053996:	0f 84 f4 00 00 00    	je     8053a90 <_realloc_r+0x190>
 805399c:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 80539a3:	31 d2                	xor    %edx,%edx
 80539a5:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
 80539a9:	0f 85 39 01 00 00    	jne    8053ae8 <_realloc_r+0x1e8>
 80539af:	89 f1                	mov    %esi,%ecx
 80539b1:	2b 4f f8             	sub    -0x8(%edi),%ecx
 80539b4:	8b 41 04             	mov    0x4(%ecx),%eax
 80539b7:	83 e0 fc             	and    $0xfffffffc,%eax
 80539ba:	85 d2                	test   %edx,%edx
 80539bc:	0f 84 f6 02 00 00    	je     8053cb8 <_realloc_r+0x3b8>
 80539c2:	3b 55 cc             	cmp    -0x34(%ebp),%edx
 80539c5:	0f 84 f5 02 00 00    	je     8053cc0 <_realloc_r+0x3c0>
 80539cb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 80539ce:	8b 55 d0             	mov    -0x30(%ebp),%edx
 80539d1:	01 d8                	add    %ebx,%eax
 80539d3:	01 c2                	add    %eax,%edx
 80539d5:	3b 55 d8             	cmp    -0x28(%ebp),%edx
 80539d8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 80539db:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 80539de:	0f 8c ac 01 00 00    	jl     8053b90 <_realloc_r+0x290>
 80539e4:	8b 42 0c             	mov    0xc(%edx),%eax
 80539e7:	83 eb 04             	sub    $0x4,%ebx
 80539ea:	8b 52 08             	mov    0x8(%edx),%edx
 80539ed:	83 fb 24             	cmp    $0x24,%ebx
 80539f0:	8d 71 08             	lea    0x8(%ecx),%esi
 80539f3:	89 42 0c             	mov    %eax,0xc(%edx)
 80539f6:	89 50 08             	mov    %edx,0x8(%eax)
 80539f9:	8b 41 0c             	mov    0xc(%ecx),%eax
 80539fc:	8b 51 08             	mov    0x8(%ecx),%edx
 80539ff:	89 42 0c             	mov    %eax,0xc(%edx)
 8053a02:	89 50 08             	mov    %edx,0x8(%eax)
 8053a05:	0f 87 85 03 00 00    	ja     8053d90 <_realloc_r+0x490>
 8053a0b:	83 fb 13             	cmp    $0x13,%ebx
 8053a0e:	89 f0                	mov    %esi,%eax
 8053a10:	76 1a                	jbe    8053a2c <_realloc_r+0x12c>
 8053a12:	8b 07                	mov    (%edi),%eax
 8053a14:	83 fb 1b             	cmp    $0x1b,%ebx
 8053a17:	89 41 08             	mov    %eax,0x8(%ecx)
 8053a1a:	8b 47 04             	mov    0x4(%edi),%eax
 8053a1d:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053a20:	0f 87 8f 03 00 00    	ja     8053db5 <_realloc_r+0x4b5>
 8053a26:	8d 41 10             	lea    0x10(%ecx),%eax
 8053a29:	83 c7 08             	add    $0x8,%edi
 8053a2c:	8b 17                	mov    (%edi),%edx
 8053a2e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8053a31:	89 10                	mov    %edx,(%eax)
 8053a33:	8b 57 04             	mov    0x4(%edi),%edx
 8053a36:	89 50 04             	mov    %edx,0x4(%eax)
 8053a39:	8b 57 08             	mov    0x8(%edi),%edx
 8053a3c:	89 f7                	mov    %esi,%edi
 8053a3e:	89 ce                	mov    %ecx,%esi
 8053a40:	89 50 08             	mov    %edx,0x8(%eax)
 8053a43:	8b 41 04             	mov    0x4(%ecx),%eax
 8053a46:	eb 1b                	jmp    8053a63 <_realloc_r+0x163>
 8053a48:	83 e2 f8             	and    $0xfffffff8,%edx
 8053a4b:	89 55 dc             	mov    %edx,-0x24(%ebp)
 8053a4e:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053a51:	c1 ea 1f             	shr    $0x1f,%edx
 8053a54:	e9 ff fe ff ff       	jmp    8053958 <_realloc_r+0x58>
 8053a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053a60:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8053a63:	89 da                	mov    %ebx,%edx
 8053a65:	2b 55 dc             	sub    -0x24(%ebp),%edx
 8053a68:	83 fa 0f             	cmp    $0xf,%edx
 8053a6b:	77 4b                	ja     8053ab8 <_realloc_r+0x1b8>
 8053a6d:	83 e0 01             	and    $0x1,%eax
 8053a70:	09 d8                	or     %ebx,%eax
 8053a72:	89 46 04             	mov    %eax,0x4(%esi)
 8053a75:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
 8053a7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053a7d:	89 04 24             	mov    %eax,(%esp)
 8053a80:	e8 eb c1 ff ff       	call   804fc70 <__malloc_unlock>
 8053a85:	89 f8                	mov    %edi,%eax
 8053a87:	83 c4 3c             	add    $0x3c,%esp
 8053a8a:	5b                   	pop    %ebx
 8053a8b:	5e                   	pop    %esi
 8053a8c:	5f                   	pop    %edi
 8053a8d:	5d                   	pop    %ebp
 8053a8e:	c3                   	ret    
 8053a8f:	90                   	nop
 8053a90:	83 e1 fc             	and    $0xfffffffc,%ecx
 8053a93:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 8053a96:	01 d9                	add    %ebx,%ecx
 8053a98:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
 8053a9b:	0f 8c 04 ff ff ff    	jl     80539a5 <_realloc_r+0xa5>
 8053aa1:	8b 5a 0c             	mov    0xc(%edx),%ebx
 8053aa4:	8b 52 08             	mov    0x8(%edx),%edx
 8053aa7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8053aaa:	89 5a 0c             	mov    %ebx,0xc(%edx)
 8053aad:	89 53 08             	mov    %edx,0x8(%ebx)
 8053ab0:	89 cb                	mov    %ecx,%ebx
 8053ab2:	eb af                	jmp    8053a63 <_realloc_r+0x163>
 8053ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053ab8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053abb:	83 e0 01             	and    $0x1,%eax
 8053abe:	09 d8                	or     %ebx,%eax
 8053ac0:	89 46 04             	mov    %eax,0x4(%esi)
 8053ac3:	89 d0                	mov    %edx,%eax
 8053ac5:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
 8053ac8:	83 c8 01             	or     $0x1,%eax
 8053acb:	89 41 04             	mov    %eax,0x4(%ecx)
 8053ace:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053ad1:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
 8053ad6:	83 c1 08             	add    $0x8,%ecx
 8053ad9:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8053add:	89 04 24             	mov    %eax,(%esp)
 8053ae0:	e8 ab b3 ff ff       	call   804ee90 <_free_r>
 8053ae5:	eb 93                	jmp    8053a7a <_realloc_r+0x17a>
 8053ae7:	90                   	nop
 8053ae8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8053aeb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053aef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053af2:	89 04 24             	mov    %eax,(%esp)
 8053af5:	e8 46 b9 ff ff       	call   804f440 <_malloc_r>
 8053afa:	85 c0                	test   %eax,%eax
 8053afc:	89 c1                	mov    %eax,%ecx
 8053afe:	0f 84 65 03 00 00    	je     8053e69 <_realloc_r+0x569>
 8053b04:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053b07:	8d 51 f8             	lea    -0x8(%ecx),%edx
 8053b0a:	89 55 e0             	mov    %edx,-0x20(%ebp)
 8053b0d:	89 c2                	mov    %eax,%edx
 8053b0f:	83 e2 fe             	and    $0xfffffffe,%edx
 8053b12:	01 f2                	add    %esi,%edx
 8053b14:	39 55 e0             	cmp    %edx,-0x20(%ebp)
 8053b17:	0f 84 63 02 00 00    	je     8053d80 <_realloc_r+0x480>
 8053b1d:	83 eb 04             	sub    $0x4,%ebx
 8053b20:	83 fb 24             	cmp    $0x24,%ebx
 8053b23:	0f 87 6f 01 00 00    	ja     8053c98 <_realloc_r+0x398>
 8053b29:	83 fb 13             	cmp    $0x13,%ebx
 8053b2c:	0f 87 ee 00 00 00    	ja     8053c20 <_realloc_r+0x320>
 8053b32:	89 c8                	mov    %ecx,%eax
 8053b34:	89 fa                	mov    %edi,%edx
 8053b36:	8b 1a                	mov    (%edx),%ebx
 8053b38:	89 18                	mov    %ebx,(%eax)
 8053b3a:	8b 5a 04             	mov    0x4(%edx),%ebx
 8053b3d:	89 58 04             	mov    %ebx,0x4(%eax)
 8053b40:	8b 52 08             	mov    0x8(%edx),%edx
 8053b43:	89 50 08             	mov    %edx,0x8(%eax)
 8053b46:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8053b49:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053b4d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053b50:	89 34 24             	mov    %esi,(%esp)
 8053b53:	e8 38 b3 ff ff       	call   804ee90 <_free_r>
 8053b58:	89 34 24             	mov    %esi,(%esp)
 8053b5b:	e8 10 c1 ff ff       	call   804fc70 <__malloc_unlock>
 8053b60:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053b63:	83 c4 3c             	add    $0x3c,%esp
 8053b66:	5b                   	pop    %ebx
 8053b67:	5e                   	pop    %esi
 8053b68:	5f                   	pop    %edi
 8053b69:	89 c8                	mov    %ecx,%eax
 8053b6b:	5d                   	pop    %ebp
 8053b6c:	c3                   	ret    
 8053b6d:	8d 76 00             	lea    0x0(%esi),%esi
 8053b70:	89 45 0c             	mov    %eax,0xc(%ebp)
 8053b73:	83 c4 3c             	add    $0x3c,%esp
 8053b76:	5b                   	pop    %ebx
 8053b77:	5e                   	pop    %esi
 8053b78:	5f                   	pop    %edi
 8053b79:	5d                   	pop    %ebp
 8053b7a:	e9 c1 b8 ff ff       	jmp    804f440 <_malloc_r>
 8053b7f:	90                   	nop
 8053b80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053b83:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
 8053b89:	31 c0                	xor    %eax,%eax
 8053b8b:	e9 f7 fe ff ff       	jmp    8053a87 <_realloc_r+0x187>
 8053b90:	89 c2                	mov    %eax,%edx
 8053b92:	3b 55 d8             	cmp    -0x28(%ebp),%edx
 8053b95:	0f 8c 4d ff ff ff    	jl     8053ae8 <_realloc_r+0x1e8>
 8053b9b:	8b 71 08             	mov    0x8(%ecx),%esi
 8053b9e:	83 eb 04             	sub    $0x4,%ebx
 8053ba1:	8b 41 0c             	mov    0xc(%ecx),%eax
 8053ba4:	83 fb 24             	cmp    $0x24,%ebx
 8053ba7:	89 46 0c             	mov    %eax,0xc(%esi)
 8053baa:	89 70 08             	mov    %esi,0x8(%eax)
 8053bad:	8d 71 08             	lea    0x8(%ecx),%esi
 8053bb0:	0f 87 88 00 00 00    	ja     8053c3e <_realloc_r+0x33e>
 8053bb6:	83 fb 13             	cmp    $0x13,%ebx
 8053bb9:	89 f0                	mov    %esi,%eax
 8053bbb:	76 1a                	jbe    8053bd7 <_realloc_r+0x2d7>
 8053bbd:	8b 07                	mov    (%edi),%eax
 8053bbf:	83 fb 1b             	cmp    $0x1b,%ebx
 8053bc2:	89 41 08             	mov    %eax,0x8(%ecx)
 8053bc5:	8b 47 04             	mov    0x4(%edi),%eax
 8053bc8:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053bcb:	0f 87 17 02 00 00    	ja     8053de8 <_realloc_r+0x4e8>
 8053bd1:	8d 41 10             	lea    0x10(%ecx),%eax
 8053bd4:	83 c7 08             	add    $0x8,%edi
 8053bd7:	8b 1f                	mov    (%edi),%ebx
 8053bd9:	89 18                	mov    %ebx,(%eax)
 8053bdb:	8b 5f 04             	mov    0x4(%edi),%ebx
 8053bde:	89 58 04             	mov    %ebx,0x4(%eax)
 8053be1:	8b 5f 08             	mov    0x8(%edi),%ebx
 8053be4:	89 f7                	mov    %esi,%edi
 8053be6:	89 ce                	mov    %ecx,%esi
 8053be8:	89 58 08             	mov    %ebx,0x8(%eax)
 8053beb:	89 d3                	mov    %edx,%ebx
 8053bed:	8b 41 04             	mov    0x4(%ecx),%eax
 8053bf0:	e9 6e fe ff ff       	jmp    8053a63 <_realloc_r+0x163>
 8053bf5:	8d 76 00             	lea    0x0(%esi),%esi
 8053bf8:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8053bfb:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8053bfe:	8b 48 04             	mov    0x4(%eax),%ecx
 8053c01:	83 c2 10             	add    $0x10,%edx
 8053c04:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 8053c07:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
 8053c0b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 8053c0e:	01 d9                	add    %ebx,%ecx
 8053c10:	39 d1                	cmp    %edx,%ecx
 8053c12:	7d 54                	jge    8053c68 <_realloc_r+0x368>
 8053c14:	89 c2                	mov    %eax,%edx
 8053c16:	e9 8a fd ff ff       	jmp    80539a5 <_realloc_r+0xa5>
 8053c1b:	90                   	nop
 8053c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053c20:	8b 07                	mov    (%edi),%eax
 8053c22:	83 fb 1b             	cmp    $0x1b,%ebx
 8053c25:	89 01                	mov    %eax,(%ecx)
 8053c27:	8b 47 04             	mov    0x4(%edi),%eax
 8053c2a:	89 41 04             	mov    %eax,0x4(%ecx)
 8053c2d:	0f 87 2d 01 00 00    	ja     8053d60 <_realloc_r+0x460>
 8053c33:	8d 41 08             	lea    0x8(%ecx),%eax
 8053c36:	8d 57 08             	lea    0x8(%edi),%edx
 8053c39:	e9 f8 fe ff ff       	jmp    8053b36 <_realloc_r+0x236>
 8053c3e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053c42:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053c46:	89 f7                	mov    %esi,%edi
 8053c48:	89 34 24             	mov    %esi,(%esp)
 8053c4b:	89 55 d8             	mov    %edx,-0x28(%ebp)
 8053c4e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053c51:	e8 ca fb ff ff       	call   8053820 <memmove>
 8053c56:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053c59:	8b 55 d8             	mov    -0x28(%ebp),%edx
 8053c5c:	8b 41 04             	mov    0x4(%ecx),%eax
 8053c5f:	89 ce                	mov    %ecx,%esi
 8053c61:	89 d3                	mov    %edx,%ebx
 8053c63:	e9 fb fd ff ff       	jmp    8053a63 <_realloc_r+0x163>
 8053c68:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053c6b:	29 d9                	sub    %ebx,%ecx
 8053c6d:	01 de                	add    %ebx,%esi
 8053c6f:	83 c9 01             	or     $0x1,%ecx
 8053c72:	89 35 48 80 05 08    	mov    %esi,0x8058048
 8053c78:	89 4e 04             	mov    %ecx,0x4(%esi)
 8053c7b:	8b 47 fc             	mov    -0x4(%edi),%eax
 8053c7e:	83 e0 01             	and    $0x1,%eax
 8053c81:	09 d8                	or     %ebx,%eax
 8053c83:	89 47 fc             	mov    %eax,-0x4(%edi)
 8053c86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053c89:	89 04 24             	mov    %eax,(%esp)
 8053c8c:	e8 df bf ff ff       	call   804fc70 <__malloc_unlock>
 8053c91:	89 f8                	mov    %edi,%eax
 8053c93:	e9 ef fd ff ff       	jmp    8053a87 <_realloc_r+0x187>
 8053c98:	89 0c 24             	mov    %ecx,(%esp)
 8053c9b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053c9f:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053ca3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053ca6:	e8 75 fb ff ff       	call   8053820 <memmove>
 8053cab:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053cae:	e9 93 fe ff ff       	jmp    8053b46 <_realloc_r+0x246>
 8053cb3:	90                   	nop
 8053cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053cb8:	8d 14 18             	lea    (%eax,%ebx,1),%edx
 8053cbb:	e9 d2 fe ff ff       	jmp    8053b92 <_realloc_r+0x292>
 8053cc0:	8d 14 18             	lea    (%eax,%ebx,1),%edx
 8053cc3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8053cc6:	01 d0                	add    %edx,%eax
 8053cc8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8053ccb:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8053cce:	83 c0 10             	add    $0x10,%eax
 8053cd1:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
 8053cd4:	0f 8c b8 fe ff ff    	jl     8053b92 <_realloc_r+0x292>
 8053cda:	8b 41 0c             	mov    0xc(%ecx),%eax
 8053cdd:	83 eb 04             	sub    $0x4,%ebx
 8053ce0:	8b 51 08             	mov    0x8(%ecx),%edx
 8053ce3:	83 fb 24             	cmp    $0x24,%ebx
 8053ce6:	8d 71 08             	lea    0x8(%ecx),%esi
 8053ce9:	89 42 0c             	mov    %eax,0xc(%edx)
 8053cec:	89 50 08             	mov    %edx,0x8(%eax)
 8053cef:	0f 87 3d 01 00 00    	ja     8053e32 <_realloc_r+0x532>
 8053cf5:	83 fb 13             	cmp    $0x13,%ebx
 8053cf8:	89 f0                	mov    %esi,%eax
 8053cfa:	76 1a                	jbe    8053d16 <_realloc_r+0x416>
 8053cfc:	8b 07                	mov    (%edi),%eax
 8053cfe:	83 fb 1b             	cmp    $0x1b,%ebx
 8053d01:	89 41 08             	mov    %eax,0x8(%ecx)
 8053d04:	8b 47 04             	mov    0x4(%edi),%eax
 8053d07:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053d0a:	0f 87 3d 01 00 00    	ja     8053e4d <_realloc_r+0x54d>
 8053d10:	8d 41 10             	lea    0x10(%ecx),%eax
 8053d13:	83 c7 08             	add    $0x8,%edi
 8053d16:	8b 17                	mov    (%edi),%edx
 8053d18:	89 10                	mov    %edx,(%eax)
 8053d1a:	8b 57 04             	mov    0x4(%edi),%edx
 8053d1d:	89 50 04             	mov    %edx,0x4(%eax)
 8053d20:	8b 57 08             	mov    0x8(%edi),%edx
 8053d23:	89 50 08             	mov    %edx,0x8(%eax)
 8053d26:	8b 5d dc             	mov    -0x24(%ebp),%ebx
 8053d29:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8053d2c:	89 d8                	mov    %ebx,%eax
 8053d2e:	29 df                	sub    %ebx,%edi
 8053d30:	01 c8                	add    %ecx,%eax
 8053d32:	83 cf 01             	or     $0x1,%edi
 8053d35:	a3 48 80 05 08       	mov    %eax,0x8058048
 8053d3a:	89 78 04             	mov    %edi,0x4(%eax)
 8053d3d:	8b 41 04             	mov    0x4(%ecx),%eax
 8053d40:	83 e0 01             	and    $0x1,%eax
 8053d43:	09 d8                	or     %ebx,%eax
 8053d45:	89 41 04             	mov    %eax,0x4(%ecx)
 8053d48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053d4b:	89 04 24             	mov    %eax,(%esp)
 8053d4e:	e8 1d bf ff ff       	call   804fc70 <__malloc_unlock>
 8053d53:	89 f0                	mov    %esi,%eax
 8053d55:	e9 2d fd ff ff       	jmp    8053a87 <_realloc_r+0x187>
 8053d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053d60:	8b 47 08             	mov    0x8(%edi),%eax
 8053d63:	83 fb 24             	cmp    $0x24,%ebx
 8053d66:	89 41 08             	mov    %eax,0x8(%ecx)
 8053d69:	8b 47 0c             	mov    0xc(%edi),%eax
 8053d6c:	89 41 0c             	mov    %eax,0xc(%ecx)
 8053d6f:	74 60                	je     8053dd1 <_realloc_r+0x4d1>
 8053d71:	8d 41 10             	lea    0x10(%ecx),%eax
 8053d74:	8d 57 10             	lea    0x10(%edi),%edx
 8053d77:	e9 ba fd ff ff       	jmp    8053b36 <_realloc_r+0x236>
 8053d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053d80:	8b 51 fc             	mov    -0x4(%ecx),%edx
 8053d83:	83 e2 fc             	and    $0xfffffffc,%edx
 8053d86:	01 d3                	add    %edx,%ebx
 8053d88:	e9 d6 fc ff ff       	jmp    8053a63 <_realloc_r+0x163>
 8053d8d:	8d 76 00             	lea    0x0(%esi),%esi
 8053d90:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053d94:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053d98:	89 f7                	mov    %esi,%edi
 8053d9a:	89 34 24             	mov    %esi,(%esp)
 8053d9d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053da0:	e8 7b fa ff ff       	call   8053820 <memmove>
 8053da5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053da8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8053dab:	8b 41 04             	mov    0x4(%ecx),%eax
 8053dae:	89 ce                	mov    %ecx,%esi
 8053db0:	e9 ae fc ff ff       	jmp    8053a63 <_realloc_r+0x163>
 8053db5:	8b 47 08             	mov    0x8(%edi),%eax
 8053db8:	83 fb 24             	cmp    $0x24,%ebx
 8053dbb:	89 41 10             	mov    %eax,0x10(%ecx)
 8053dbe:	8b 47 0c             	mov    0xc(%edi),%eax
 8053dc1:	89 41 14             	mov    %eax,0x14(%ecx)
 8053dc4:	74 3e                	je     8053e04 <_realloc_r+0x504>
 8053dc6:	8d 41 18             	lea    0x18(%ecx),%eax
 8053dc9:	83 c7 10             	add    $0x10,%edi
 8053dcc:	e9 5b fc ff ff       	jmp    8053a2c <_realloc_r+0x12c>
 8053dd1:	8b 47 10             	mov    0x10(%edi),%eax
 8053dd4:	8d 57 18             	lea    0x18(%edi),%edx
 8053dd7:	89 41 10             	mov    %eax,0x10(%ecx)
 8053dda:	8b 5f 14             	mov    0x14(%edi),%ebx
 8053ddd:	8d 41 18             	lea    0x18(%ecx),%eax
 8053de0:	89 59 14             	mov    %ebx,0x14(%ecx)
 8053de3:	e9 4e fd ff ff       	jmp    8053b36 <_realloc_r+0x236>
 8053de8:	8b 47 08             	mov    0x8(%edi),%eax
 8053deb:	83 fb 24             	cmp    $0x24,%ebx
 8053dee:	89 41 10             	mov    %eax,0x10(%ecx)
 8053df1:	8b 47 0c             	mov    0xc(%edi),%eax
 8053df4:	89 41 14             	mov    %eax,0x14(%ecx)
 8053df7:	74 22                	je     8053e1b <_realloc_r+0x51b>
 8053df9:	8d 41 18             	lea    0x18(%ecx),%eax
 8053dfc:	83 c7 10             	add    $0x10,%edi
 8053dff:	e9 d3 fd ff ff       	jmp    8053bd7 <_realloc_r+0x2d7>
 8053e04:	8b 47 10             	mov    0x10(%edi),%eax
 8053e07:	83 c7 18             	add    $0x18,%edi
 8053e0a:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e0d:	8b 57 fc             	mov    -0x4(%edi),%edx
 8053e10:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e13:	89 51 1c             	mov    %edx,0x1c(%ecx)
 8053e16:	e9 11 fc ff ff       	jmp    8053a2c <_realloc_r+0x12c>
 8053e1b:	8b 47 10             	mov    0x10(%edi),%eax
 8053e1e:	83 c7 18             	add    $0x18,%edi
 8053e21:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e24:	8b 5f fc             	mov    -0x4(%edi),%ebx
 8053e27:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e2a:	89 59 1c             	mov    %ebx,0x1c(%ecx)
 8053e2d:	e9 a5 fd ff ff       	jmp    8053bd7 <_realloc_r+0x2d7>
 8053e32:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8053e36:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8053e3a:	89 34 24             	mov    %esi,(%esp)
 8053e3d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8053e40:	e8 db f9 ff ff       	call   8053820 <memmove>
 8053e45:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8053e48:	e9 d9 fe ff ff       	jmp    8053d26 <_realloc_r+0x426>
 8053e4d:	8b 47 08             	mov    0x8(%edi),%eax
 8053e50:	83 fb 24             	cmp    $0x24,%ebx
 8053e53:	89 41 10             	mov    %eax,0x10(%ecx)
 8053e56:	8b 47 0c             	mov    0xc(%edi),%eax
 8053e59:	89 41 14             	mov    %eax,0x14(%ecx)
 8053e5c:	74 1d                	je     8053e7b <_realloc_r+0x57b>
 8053e5e:	8d 41 18             	lea    0x18(%ecx),%eax
 8053e61:	83 c7 10             	add    $0x10,%edi
 8053e64:	e9 ad fe ff ff       	jmp    8053d16 <_realloc_r+0x416>
 8053e69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8053e6c:	89 04 24             	mov    %eax,(%esp)
 8053e6f:	e8 fc bd ff ff       	call   804fc70 <__malloc_unlock>
 8053e74:	31 c0                	xor    %eax,%eax
 8053e76:	e9 0c fc ff ff       	jmp    8053a87 <_realloc_r+0x187>
 8053e7b:	8b 47 10             	mov    0x10(%edi),%eax
 8053e7e:	83 c7 18             	add    $0x18,%edi
 8053e81:	89 41 18             	mov    %eax,0x18(%ecx)
 8053e84:	8b 57 fc             	mov    -0x4(%edi),%edx
 8053e87:	8d 41 20             	lea    0x20(%ecx),%eax
 8053e8a:	89 51 1c             	mov    %edx,0x1c(%ecx)
 8053e8d:	e9 84 fe ff ff       	jmp    8053d16 <_realloc_r+0x416>
 8053e92:	66 90                	xchg   %ax,%ax
 8053e94:	66 90                	xchg   %ax,%ax
 8053e96:	66 90                	xchg   %ax,%ax
 8053e98:	66 90                	xchg   %ax,%ax
 8053e9a:	66 90                	xchg   %ax,%ax
 8053e9c:	66 90                	xchg   %ax,%ax
 8053e9e:	66 90                	xchg   %ax,%ax

08053ea0 <cleanup_glue>:
 8053ea0:	55                   	push   %ebp
 8053ea1:	89 e5                	mov    %esp,%ebp
 8053ea3:	56                   	push   %esi
 8053ea4:	53                   	push   %ebx
 8053ea5:	83 ec 10             	sub    $0x10,%esp
 8053ea8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8053eab:	8b 75 08             	mov    0x8(%ebp),%esi
 8053eae:	8b 03                	mov    (%ebx),%eax
 8053eb0:	85 c0                	test   %eax,%eax
 8053eb2:	74 0c                	je     8053ec0 <cleanup_glue+0x20>
 8053eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053eb8:	89 34 24             	mov    %esi,(%esp)
 8053ebb:	e8 e0 ff ff ff       	call   8053ea0 <cleanup_glue>
 8053ec0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 8053ec3:	89 75 08             	mov    %esi,0x8(%ebp)
 8053ec6:	83 c4 10             	add    $0x10,%esp
 8053ec9:	5b                   	pop    %ebx
 8053eca:	5e                   	pop    %esi
 8053ecb:	5d                   	pop    %ebp
 8053ecc:	e9 bf af ff ff       	jmp    804ee90 <_free_r>
 8053ed1:	eb 0d                	jmp    8053ee0 <_reclaim_reent>
 8053ed3:	90                   	nop
 8053ed4:	90                   	nop
 8053ed5:	90                   	nop
 8053ed6:	90                   	nop
 8053ed7:	90                   	nop
 8053ed8:	90                   	nop
 8053ed9:	90                   	nop
 8053eda:	90                   	nop
 8053edb:	90                   	nop
 8053edc:	90                   	nop
 8053edd:	90                   	nop
 8053ede:	90                   	nop
 8053edf:	90                   	nop

08053ee0 <_reclaim_reent>:
 8053ee0:	55                   	push   %ebp
 8053ee1:	89 e5                	mov    %esp,%ebp
 8053ee3:	57                   	push   %edi
 8053ee4:	56                   	push   %esi
 8053ee5:	53                   	push   %ebx
 8053ee6:	83 ec 1c             	sub    $0x1c,%esp
 8053ee9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8053eec:	3b 1d 40 7b 05 08    	cmp    0x8057b40,%ebx
 8053ef2:	0f 84 a6 00 00 00    	je     8053f9e <_reclaim_reent+0xbe>
 8053ef8:	8b 53 4c             	mov    0x4c(%ebx),%edx
 8053efb:	85 d2                	test   %edx,%edx
 8053efd:	74 46                	je     8053f45 <_reclaim_reent+0x65>
 8053eff:	31 c0                	xor    %eax,%eax
 8053f01:	31 f6                	xor    %esi,%esi
 8053f03:	90                   	nop
 8053f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8053f08:	8b 04 82             	mov    (%edx,%eax,4),%eax
 8053f0b:	85 c0                	test   %eax,%eax
 8053f0d:	75 0b                	jne    8053f1a <_reclaim_reent+0x3a>
 8053f0f:	eb 1e                	jmp    8053f2f <_reclaim_reent+0x4f>
 8053f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8053f18:	89 f8                	mov    %edi,%eax
 8053f1a:	8b 38                	mov    (%eax),%edi
 8053f1c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f20:	89 1c 24             	mov    %ebx,(%esp)
 8053f23:	e8 68 af ff ff       	call   804ee90 <_free_r>
 8053f28:	85 ff                	test   %edi,%edi
 8053f2a:	75 ec                	jne    8053f18 <_reclaim_reent+0x38>
 8053f2c:	8b 53 4c             	mov    0x4c(%ebx),%edx
 8053f2f:	83 c6 01             	add    $0x1,%esi
 8053f32:	83 fe 20             	cmp    $0x20,%esi
 8053f35:	89 f0                	mov    %esi,%eax
 8053f37:	75 cf                	jne    8053f08 <_reclaim_reent+0x28>
 8053f39:	89 54 24 04          	mov    %edx,0x4(%esp)
 8053f3d:	89 1c 24             	mov    %ebx,(%esp)
 8053f40:	e8 4b af ff ff       	call   804ee90 <_free_r>
 8053f45:	8b 43 40             	mov    0x40(%ebx),%eax
 8053f48:	85 c0                	test   %eax,%eax
 8053f4a:	74 0c                	je     8053f58 <_reclaim_reent+0x78>
 8053f4c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f50:	89 1c 24             	mov    %ebx,(%esp)
 8053f53:	e8 38 af ff ff       	call   804ee90 <_free_r>
 8053f58:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
 8053f5e:	85 c0                	test   %eax,%eax
 8053f60:	74 22                	je     8053f84 <_reclaim_reent+0xa4>
 8053f62:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
 8053f68:	39 f0                	cmp    %esi,%eax
 8053f6a:	75 06                	jne    8053f72 <_reclaim_reent+0x92>
 8053f6c:	eb 16                	jmp    8053f84 <_reclaim_reent+0xa4>
 8053f6e:	66 90                	xchg   %ax,%ax
 8053f70:	89 f8                	mov    %edi,%eax
 8053f72:	8b 38                	mov    (%eax),%edi
 8053f74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f78:	89 1c 24             	mov    %ebx,(%esp)
 8053f7b:	e8 10 af ff ff       	call   804ee90 <_free_r>
 8053f80:	39 fe                	cmp    %edi,%esi
 8053f82:	75 ec                	jne    8053f70 <_reclaim_reent+0x90>
 8053f84:	8b 43 54             	mov    0x54(%ebx),%eax
 8053f87:	85 c0                	test   %eax,%eax
 8053f89:	74 0c                	je     8053f97 <_reclaim_reent+0xb7>
 8053f8b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053f8f:	89 1c 24             	mov    %ebx,(%esp)
 8053f92:	e8 f9 ae ff ff       	call   804ee90 <_free_r>
 8053f97:	8b 43 38             	mov    0x38(%ebx),%eax
 8053f9a:	85 c0                	test   %eax,%eax
 8053f9c:	75 08                	jne    8053fa6 <_reclaim_reent+0xc6>
 8053f9e:	83 c4 1c             	add    $0x1c,%esp
 8053fa1:	5b                   	pop    %ebx
 8053fa2:	5e                   	pop    %esi
 8053fa3:	5f                   	pop    %edi
 8053fa4:	5d                   	pop    %ebp
 8053fa5:	c3                   	ret    
 8053fa6:	89 1c 24             	mov    %ebx,(%esp)
 8053fa9:	ff 53 3c             	call   *0x3c(%ebx)
 8053fac:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
 8053fb2:	85 c0                	test   %eax,%eax
 8053fb4:	74 e8                	je     8053f9e <_reclaim_reent+0xbe>
 8053fb6:	89 1c 24             	mov    %ebx,(%esp)
 8053fb9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8053fbd:	e8 de fe ff ff       	call   8053ea0 <cleanup_glue>
 8053fc2:	83 c4 1c             	add    $0x1c,%esp
 8053fc5:	5b                   	pop    %ebx
 8053fc6:	5e                   	pop    %esi
 8053fc7:	5f                   	pop    %edi
 8053fc8:	5d                   	pop    %ebp
 8053fc9:	c3                   	ret    
 8053fca:	66 90                	xchg   %ax,%ax
 8053fcc:	66 90                	xchg   %ax,%ax
 8053fce:	66 90                	xchg   %ax,%ax

08053fd0 <__swbuf_r>:
 8053fd0:	55                   	push   %ebp
 8053fd1:	89 e5                	mov    %esp,%ebp
 8053fd3:	57                   	push   %edi
 8053fd4:	56                   	push   %esi
 8053fd5:	53                   	push   %ebx
 8053fd6:	83 ec 1c             	sub    $0x1c,%esp
 8053fd9:	8b 75 08             	mov    0x8(%ebp),%esi
 8053fdc:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8053fdf:	85 f6                	test   %esi,%esi
 8053fe1:	74 0b                	je     8053fee <__swbuf_r+0x1e>
 8053fe3:	8b 46 38             	mov    0x38(%esi),%eax
 8053fe6:	85 c0                	test   %eax,%eax
 8053fe8:	0f 84 da 00 00 00    	je     80540c8 <__swbuf_r+0xf8>
 8053fee:	8b 43 18             	mov    0x18(%ebx),%eax
 8053ff1:	89 43 08             	mov    %eax,0x8(%ebx)
 8053ff4:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 8053ff8:	a8 08                	test   $0x8,%al
 8053ffa:	0f 84 a8 00 00 00    	je     80540a8 <__swbuf_r+0xd8>
 8054000:	8b 53 10             	mov    0x10(%ebx),%edx
 8054003:	85 d2                	test   %edx,%edx
 8054005:	0f 84 9d 00 00 00    	je     80540a8 <__swbuf_r+0xd8>
 805400b:	f6 c4 20             	test   $0x20,%ah
 805400e:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
 8054012:	74 3c                	je     8054050 <__swbuf_r+0x80>
 8054014:	8b 03                	mov    (%ebx),%eax
 8054016:	89 c1                	mov    %eax,%ecx
 8054018:	29 d1                	sub    %edx,%ecx
 805401a:	3b 4b 14             	cmp    0x14(%ebx),%ecx
 805401d:	89 ca                	mov    %ecx,%edx
 805401f:	7d 4a                	jge    805406b <__swbuf_r+0x9b>
 8054021:	83 c2 01             	add    $0x1,%edx
 8054024:	8d 48 01             	lea    0x1(%eax),%ecx
 8054027:	89 0b                	mov    %ecx,(%ebx)
 8054029:	89 f9                	mov    %edi,%ecx
 805402b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
 805402f:	88 08                	mov    %cl,(%eax)
 8054031:	39 53 14             	cmp    %edx,0x14(%ebx)
 8054034:	74 52                	je     8054088 <__swbuf_r+0xb8>
 8054036:	f6 43 0c 01          	testb  $0x1,0xc(%ebx)
 805403a:	89 f8                	mov    %edi,%eax
 805403c:	74 05                	je     8054043 <__swbuf_r+0x73>
 805403e:	83 ff 0a             	cmp    $0xa,%edi
 8054041:	74 45                	je     8054088 <__swbuf_r+0xb8>
 8054043:	83 c4 1c             	add    $0x1c,%esp
 8054046:	5b                   	pop    %ebx
 8054047:	5e                   	pop    %esi
 8054048:	5f                   	pop    %edi
 8054049:	5d                   	pop    %ebp
 805404a:	c3                   	ret    
 805404b:	90                   	nop
 805404c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054050:	80 cc 20             	or     $0x20,%ah
 8054053:	66 89 43 0c          	mov    %ax,0xc(%ebx)
 8054057:	8b 03                	mov    (%ebx),%eax
 8054059:	81 63 64 ff df ff ff 	andl   $0xffffdfff,0x64(%ebx)
 8054060:	89 c1                	mov    %eax,%ecx
 8054062:	29 d1                	sub    %edx,%ecx
 8054064:	3b 4b 14             	cmp    0x14(%ebx),%ecx
 8054067:	89 ca                	mov    %ecx,%edx
 8054069:	7c b6                	jl     8054021 <__swbuf_r+0x51>
 805406b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805406f:	89 34 24             	mov    %esi,(%esp)
 8054072:	e8 59 a8 ff ff       	call   804e8d0 <_fflush_r>
 8054077:	85 c0                	test   %eax,%eax
 8054079:	75 5d                	jne    80540d8 <__swbuf_r+0x108>
 805407b:	8b 03                	mov    (%ebx),%eax
 805407d:	ba 01 00 00 00       	mov    $0x1,%edx
 8054082:	eb a0                	jmp    8054024 <__swbuf_r+0x54>
 8054084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054088:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 805408c:	89 34 24             	mov    %esi,(%esp)
 805408f:	e8 3c a8 ff ff       	call   804e8d0 <_fflush_r>
 8054094:	85 c0                	test   %eax,%eax
 8054096:	75 40                	jne    80540d8 <__swbuf_r+0x108>
 8054098:	83 c4 1c             	add    $0x1c,%esp
 805409b:	89 f8                	mov    %edi,%eax
 805409d:	5b                   	pop    %ebx
 805409e:	5e                   	pop    %esi
 805409f:	5f                   	pop    %edi
 80540a0:	5d                   	pop    %ebp
 80540a1:	c3                   	ret    
 80540a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80540a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80540ac:	89 34 24             	mov    %esi,(%esp)
 80540af:	e8 1c 91 ff ff       	call   804d1d0 <__swsetup_r>
 80540b4:	85 c0                	test   %eax,%eax
 80540b6:	75 20                	jne    80540d8 <__swbuf_r+0x108>
 80540b8:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
 80540bc:	8b 53 10             	mov    0x10(%ebx),%edx
 80540bf:	e9 47 ff ff ff       	jmp    805400b <__swbuf_r+0x3b>
 80540c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80540c8:	89 34 24             	mov    %esi,(%esp)
 80540cb:	e8 70 a9 ff ff       	call   804ea40 <__sinit>
 80540d0:	e9 19 ff ff ff       	jmp    8053fee <__swbuf_r+0x1e>
 80540d5:	8d 76 00             	lea    0x0(%esi),%esi
 80540d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80540dd:	e9 61 ff ff ff       	jmp    8054043 <__swbuf_r+0x73>
 80540e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80540e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080540f0 <__swbuf>:
 80540f0:	55                   	push   %ebp
 80540f1:	89 e5                	mov    %esp,%ebp
 80540f3:	83 ec 18             	sub    $0x18,%esp
 80540f6:	e8 e5 b0 ff ff       	call   804f1e0 <__getreent>
 80540fb:	8b 55 0c             	mov    0xc(%ebp),%edx
 80540fe:	89 54 24 08          	mov    %edx,0x8(%esp)
 8054102:	8b 55 08             	mov    0x8(%ebp),%edx
 8054105:	89 04 24             	mov    %eax,(%esp)
 8054108:	89 54 24 04          	mov    %edx,0x4(%esp)
 805410c:	e8 bf fe ff ff       	call   8053fd0 <__swbuf_r>
 8054111:	c9                   	leave  
 8054112:	c3                   	ret    
 8054113:	66 90                	xchg   %ax,%ax
 8054115:	66 90                	xchg   %ax,%ax
 8054117:	66 90                	xchg   %ax,%ax
 8054119:	66 90                	xchg   %ax,%ax
 805411b:	66 90                	xchg   %ax,%ax
 805411d:	66 90                	xchg   %ax,%ax
 805411f:	90                   	nop

08054120 <_wcrtomb_r>:
 8054120:	55                   	push   %ebp
 8054121:	89 e5                	mov    %esp,%ebp
 8054123:	57                   	push   %edi
 8054124:	56                   	push   %esi
 8054125:	53                   	push   %ebx
 8054126:	83 ec 3c             	sub    $0x3c,%esp
 8054129:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805412c:	8b 75 14             	mov    0x14(%ebp),%esi
 805412f:	85 ff                	test   %edi,%edi
 8054131:	74 45                	je     8054178 <_wcrtomb_r+0x58>
 8054133:	8b 1d 48 84 05 08    	mov    0x8058448,%ebx
 8054139:	e8 22 b1 ff ff       	call   804f260 <__locale_charset>
 805413e:	89 74 24 10          	mov    %esi,0x10(%esp)
 8054142:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8054146:	89 44 24 0c          	mov    %eax,0xc(%esp)
 805414a:	8b 45 10             	mov    0x10(%ebp),%eax
 805414d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8054151:	8b 45 08             	mov    0x8(%ebp),%eax
 8054154:	89 04 24             	mov    %eax,(%esp)
 8054157:	ff d3                	call   *%ebx
 8054159:	83 f8 ff             	cmp    $0xffffffff,%eax
 805415c:	75 0f                	jne    805416d <_wcrtomb_r+0x4d>
 805415e:	8b 55 08             	mov    0x8(%ebp),%edx
 8054161:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8054167:	c7 02 8a 00 00 00    	movl   $0x8a,(%edx)
 805416d:	83 c4 3c             	add    $0x3c,%esp
 8054170:	5b                   	pop    %ebx
 8054171:	5e                   	pop    %esi
 8054172:	5f                   	pop    %edi
 8054173:	5d                   	pop    %ebp
 8054174:	c3                   	ret    
 8054175:	8d 76 00             	lea    0x0(%esi),%esi
 8054178:	8b 3d 48 84 05 08    	mov    0x8058448,%edi
 805417e:	e8 dd b0 ff ff       	call   804f260 <__locale_charset>
 8054183:	89 74 24 10          	mov    %esi,0x10(%esp)
 8054187:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 805418e:	00 
 805418f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8054193:	8d 45 de             	lea    -0x22(%ebp),%eax
 8054196:	89 44 24 04          	mov    %eax,0x4(%esp)
 805419a:	8b 45 08             	mov    0x8(%ebp),%eax
 805419d:	89 04 24             	mov    %eax,(%esp)
 80541a0:	ff d7                	call   *%edi
 80541a2:	eb b5                	jmp    8054159 <_wcrtomb_r+0x39>
 80541a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80541aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

080541b0 <wcrtomb>:
 80541b0:	55                   	push   %ebp
 80541b1:	89 e5                	mov    %esp,%ebp
 80541b3:	57                   	push   %edi
 80541b4:	56                   	push   %esi
 80541b5:	53                   	push   %ebx
 80541b6:	83 ec 3c             	sub    $0x3c,%esp
 80541b9:	8b 7d 08             	mov    0x8(%ebp),%edi
 80541bc:	e8 1f b0 ff ff       	call   804f1e0 <__getreent>
 80541c1:	85 ff                	test   %edi,%edi
 80541c3:	89 c3                	mov    %eax,%ebx
 80541c5:	74 49                	je     8054210 <wcrtomb+0x60>
 80541c7:	8b 35 48 84 05 08    	mov    0x8058448,%esi
 80541cd:	e8 8e b0 ff ff       	call   804f260 <__locale_charset>
 80541d2:	8b 55 10             	mov    0x10(%ebp),%edx
 80541d5:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80541d9:	89 1c 24             	mov    %ebx,(%esp)
 80541dc:	89 54 24 10          	mov    %edx,0x10(%esp)
 80541e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80541e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80541e7:	89 44 24 08          	mov    %eax,0x8(%esp)
 80541eb:	ff d6                	call   *%esi
 80541ed:	83 f8 ff             	cmp    $0xffffffff,%eax
 80541f0:	75 0f                	jne    8054201 <wcrtomb+0x51>
 80541f2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80541f5:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
 80541fb:	c7 03 8a 00 00 00    	movl   $0x8a,(%ebx)
 8054201:	83 c4 3c             	add    $0x3c,%esp
 8054204:	5b                   	pop    %ebx
 8054205:	5e                   	pop    %esi
 8054206:	5f                   	pop    %edi
 8054207:	5d                   	pop    %ebp
 8054208:	c3                   	ret    
 8054209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8054210:	8b 3d 48 84 05 08    	mov    0x8058448,%edi
 8054216:	e8 45 b0 ff ff       	call   804f260 <__locale_charset>
 805421b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805421e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8054225:	00 
 8054226:	89 1c 24             	mov    %ebx,(%esp)
 8054229:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 805422d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8054231:	8d 45 de             	lea    -0x22(%ebp),%eax
 8054234:	89 44 24 04          	mov    %eax,0x4(%esp)
 8054238:	ff d7                	call   *%edi
 805423a:	eb b1                	jmp    80541ed <wcrtomb+0x3d>
 805423c:	66 90                	xchg   %ax,%ax
 805423e:	66 90                	xchg   %ax,%ax

08054240 <__ascii_wctomb>:
 8054240:	55                   	push   %ebp
 8054241:	89 e5                	mov    %esp,%ebp
 8054243:	8b 45 0c             	mov    0xc(%ebp),%eax
 8054246:	8b 55 10             	mov    0x10(%ebp),%edx
 8054249:	85 c0                	test   %eax,%eax
 805424b:	74 13                	je     8054260 <__ascii_wctomb+0x20>
 805424d:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 8054253:	77 13                	ja     8054268 <__ascii_wctomb+0x28>
 8054255:	88 10                	mov    %dl,(%eax)
 8054257:	b8 01 00 00 00       	mov    $0x1,%eax
 805425c:	5d                   	pop    %ebp
 805425d:	c3                   	ret    
 805425e:	66 90                	xchg   %ax,%ax
 8054260:	31 c0                	xor    %eax,%eax
 8054262:	5d                   	pop    %ebp
 8054263:	c3                   	ret    
 8054264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8054268:	8b 45 08             	mov    0x8(%ebp),%eax
 805426b:	c7 00 8a 00 00 00    	movl   $0x8a,(%eax)
 8054271:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8054276:	5d                   	pop    %ebp
 8054277:	c3                   	ret    
 8054278:	90                   	nop
 8054279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08054280 <_wctomb_r>:
 8054280:	55                   	push   %ebp
 8054281:	89 e5                	mov    %esp,%ebp
 8054283:	53                   	push   %ebx
 8054284:	83 ec 24             	sub    $0x24,%esp
 8054287:	8b 1d 48 84 05 08    	mov    0x8058448,%ebx
 805428d:	e8 ce af ff ff       	call   804f260 <__locale_charset>
 8054292:	8b 55 14             	mov    0x14(%ebp),%edx
 8054295:	89 54 24 10          	mov    %edx,0x10(%esp)
 8054299:	89 44 24 0c          	mov    %eax,0xc(%esp)
 805429d:	8b 45 10             	mov    0x10(%ebp),%eax
 80542a0:	89 44 24 08          	mov    %eax,0x8(%esp)
 80542a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80542a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80542ab:	8b 45 08             	mov    0x8(%ebp),%eax
 80542ae:	89 04 24             	mov    %eax,(%esp)
 80542b1:	ff d3                	call   *%ebx
 80542b3:	83 c4 24             	add    $0x24,%esp
 80542b6:	5b                   	pop    %ebx
 80542b7:	5d                   	pop    %ebp
 80542b8:	c3                   	ret    
