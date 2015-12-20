
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
c010002b:	e9 d0 04 00 00       	jmp    c0100500 <init>

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
c0100066:	e8 f5 0c 00 00       	call   c0100d60 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 fe 0c 00 00       	call   c0100d70 <get_ucr3>
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
c01000d7:	a1 00 a0 10 c0       	mov    0xc010a000,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 00 a0 10 c0       	mov    %eax,0xc010a000
c01000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
c01000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
c0100102:	74 54                	je     c0100158 <mm_malloc+0x108>
c0100104:	89 d8                	mov    %ebx,%eax
c0100106:	c1 e8 16             	shr    $0x16,%eax
c0100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
c010010c:	f6 01 01             	testb  $0x1,(%ecx)
c010010f:	75 a7                	jne    c01000b8 <mm_malloc+0x68>
c0100111:	a1 00 b0 10 c0       	mov    0xc010b000,%eax
c0100116:	89 c6                	mov    %eax,%esi
c0100118:	83 c0 01             	add    $0x1,%eax
c010011b:	c1 e6 0c             	shl    $0xc,%esi
c010011e:	81 c6 00 c0 10 c0    	add    $0xc010c000,%esi
c0100124:	a3 00 b0 10 c0       	mov    %eax,0xc010b000
c0100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
c010012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100134:	83 c8 07             	or     $0x7,%eax
c0100137:	89 01                	mov    %eax,(%ecx)
c0100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100140:	00 
c0100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100148:	00 
c0100149:	89 34 24             	mov    %esi,(%esp)
c010014c:	e8 87 14 00 00       	call   c01015d8 <memset>
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
c0100178:	c7 44 24 10 64 7e 10 	movl   $0xc0107e64,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c c8 7e 10 	movl   $0xc0107ec8,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 53 7e 10 	movl   $0xc0107e53,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 74 7e 10 c0 	movl   $0xc0107e74,(%esp)
c010019f:	e8 ec 0e 00 00       	call   c0101090 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 6c 7e 10 	movl   $0xc0107e6c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c c8 7e 10 	movl   $0xc0107ec8,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 53 7e 10 	movl   $0xc0107e53,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 74 7e 10 c0 	movl   $0xc0107e74,(%esp)
c01001ee:	e8 9d 0e 00 00       	call   c0101090 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 64 7e 10 	movl   $0xc0107e64,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c c8 7e 10 	movl   $0xc0107ec8,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 53 7e 10 	movl   $0xc0107e53,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 74 7e 10 c0 	movl   $0xc0107e74,(%esp)
c010022e:	e8 5d 0e 00 00       	call   c0101090 <printk>
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
c0100258:	c7 44 24 10 6c 7e 10 	movl   $0xc0107e6c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c c8 7e 10 	movl   $0xc0107ec8,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 53 7e 10 	movl   $0xc0107e53,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 74 7e 10 c0 	movl   $0xc0107e74,(%esp)
c010027f:	e8 0c 0e 00 00       	call   c0101090 <printk>
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
c01002a8:	c7 44 24 10 40 7e 10 	movl   $0xc0107e40,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c be 7e 10 	movl   $0xc0107ebe,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 53 7e 10 	movl   $0xc0107e53,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 74 7e 10 c0 	movl   $0xc0107e74,(%esp)
c01002cf:	e8 bc 0d 00 00       	call   c0101090 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 00 a0 10 c0       	mov    0xc010a000,%eax
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
c010039a:	e8 71 03 00 00       	call   c0100710 <irq_handle>
c010039f:	83 c4 04             	add    $0x4,%esp
c01003a2:	61                   	popa   
c01003a3:	83 c4 08             	add    $0x8,%esp
c01003a6:	cf                   	iret   
c01003a7:	66 90                	xchg   %ax,%ax
c01003a9:	66 90                	xchg   %ax,%ax
c01003ab:	66 90                	xchg   %ax,%ax
c01003ad:	66 90                	xchg   %ax,%ax
c01003af:	90                   	nop

c01003b0 <fs_open>:
c01003b0:	55                   	push   %ebp
c01003b1:	89 e5                	mov    %esp,%ebp
c01003b3:	57                   	push   %edi
c01003b4:	56                   	push   %esi
c01003b5:	53                   	push   %ebx
c01003b6:	83 ec 0c             	sub    $0xc,%esp
c01003b9:	8b 7d 08             	mov    0x8(%ebp),%edi
c01003bc:	85 ff                	test   %edi,%edi
c01003be:	0f 84 7f 00 00 00    	je     c0100443 <fs_open+0x93>
c01003c4:	be 00 80 10 c0       	mov    $0xc0108000,%esi
c01003c9:	31 db                	xor    %ebx,%ebx
c01003cb:	eb 0e                	jmp    c01003db <fs_open+0x2b>
c01003cd:	8d 76 00             	lea    0x0(%esi),%esi
c01003d0:	83 c3 01             	add    $0x1,%ebx
c01003d3:	83 c6 0c             	add    $0xc,%esi
c01003d6:	83 fb 19             	cmp    $0x19,%ebx
c01003d9:	74 3d                	je     c0100418 <fs_open+0x68>
c01003db:	83 ec 08             	sub    $0x8,%esp
c01003de:	ff 36                	pushl  (%esi)
c01003e0:	57                   	push   %edi
c01003e1:	e8 7a 12 00 00       	call   c0101660 <strcmp>
c01003e6:	83 c4 10             	add    $0x10,%esp
c01003e9:	85 c0                	test   %eax,%eax
c01003eb:	75 e3                	jne    c01003d0 <fs_open+0x20>
c01003ed:	8d 43 03             	lea    0x3(%ebx),%eax
c01003f0:	8d 14 5b             	lea    (%ebx,%ebx,2),%edx
c01003f3:	c6 04 c5 00 c0 12 c0 	movb   $0x1,-0x3fed4000(,%eax,8)
c01003fa:	01 
c01003fb:	8b 14 95 08 80 10 c0 	mov    -0x3fef7ff8(,%edx,4),%edx
c0100402:	89 14 c5 04 c0 12 c0 	mov    %edx,-0x3fed3ffc(,%eax,8)
c0100409:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010040c:	5b                   	pop    %ebx
c010040d:	5e                   	pop    %esi
c010040e:	5f                   	pop    %edi
c010040f:	5d                   	pop    %ebp
c0100410:	c3                   	ret    
c0100411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100418:	83 ec 0c             	sub    $0xc,%esp
c010041b:	68 ea 7e 10 c0       	push   $0xc0107eea
c0100420:	68 c0 7f 10 c0       	push   $0xc0107fc0
c0100425:	6a 39                	push   $0x39
c0100427:	68 d7 7e 10 c0       	push   $0xc0107ed7
c010042c:	68 74 7e 10 c0       	push   $0xc0107e74
c0100431:	e8 5a 0c 00 00       	call   c0101090 <printk>
c0100436:	b8 01 00 00 00       	mov    $0x1,%eax
c010043b:	d6                   	(bad)  
c010043c:	83 c4 20             	add    $0x20,%esp
c010043f:	b0 1c                	mov    $0x1c,%al
c0100441:	eb ad                	jmp    c01003f0 <fs_open+0x40>
c0100443:	83 ec 0c             	sub    $0xc,%esp
c0100446:	68 ce 7e 10 c0       	push   $0xc0107ece
c010044b:	68 c0 7f 10 c0       	push   $0xc0107fc0
c0100450:	6a 32                	push   $0x32
c0100452:	68 d7 7e 10 c0       	push   $0xc0107ed7
c0100457:	68 74 7e 10 c0       	push   $0xc0107e74
c010045c:	e8 2f 0c 00 00       	call   c0101090 <printk>
c0100461:	b8 01 00 00 00       	mov    $0x1,%eax
c0100466:	d6                   	(bad)  
c0100467:	83 c4 20             	add    $0x20,%esp
c010046a:	e9 55 ff ff ff       	jmp    c01003c4 <fs_open+0x14>
c010046f:	90                   	nop

c0100470 <init_cond>:
c0100470:	55                   	push   %ebp
c0100471:	89 e5                	mov    %esp,%ebp
c0100473:	53                   	push   %ebx
c0100474:	83 ec 04             	sub    $0x4,%esp
c0100477:	e8 24 0a 00 00       	call   c0100ea0 <init_segment>
c010047c:	e8 ef 03 00 00       	call   c0100870 <init_idt>
c0100481:	e8 7a 03 00 00       	call   c0100800 <init_i8259>
c0100486:	e8 65 0c 00 00       	call   c01010f0 <init_serial>
c010048b:	e8 20 0e 00 00       	call   c01012b0 <init_ide>
c0100490:	fb                   	sti    
c0100491:	e8 1a 09 00 00       	call   c0100db0 <init_mm>
c0100496:	68 bf 81 10 c0       	push   $0xc01081bf
c010049b:	6a 4a                	push   $0x4a
c010049d:	68 2c 81 10 c0       	push   $0xc010812c
c01004a2:	68 40 81 10 c0       	push   $0xc0108140
c01004a7:	e8 e4 0b 00 00       	call   c0101090 <printk>
c01004ac:	e8 1f 08 00 00       	call   c0100cd0 <video_mapping_write_test>
c01004b1:	e8 9a 0a 00 00       	call   c0100f50 <loader>
c01004b6:	89 c3                	mov    %eax,%ebx
c01004b8:	e8 33 08 00 00       	call   c0100cf0 <video_mapping_read_test>
c01004bd:	e8 7e 08 00 00       	call   c0100d40 <video_mapping_clear>
c01004c2:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01004c7:	bd 00 00 00 00       	mov    $0x0,%ebp
c01004cc:	83 ec 10             	sub    $0x10,%esp
c01004cf:	ff d3                	call   *%ebx
c01004d1:	68 bf 81 10 c0       	push   $0xc01081bf
c01004d6:	6a 6b                	push   $0x6b
c01004d8:	68 2c 81 10 c0       	push   $0xc010812c
c01004dd:	68 74 81 10 c0       	push   $0xc0108174
c01004e2:	e8 a9 0b 00 00       	call   c0101090 <printk>
c01004e7:	b8 01 00 00 00       	mov    $0x1,%eax
c01004ec:	d6                   	(bad)  
c01004ed:	83 c4 20             	add    $0x20,%esp
c01004f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004f3:	c9                   	leave  
c01004f4:	c3                   	ret    
c01004f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01004f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100500 <init>:
c0100500:	55                   	push   %ebp
c0100501:	89 e5                	mov    %esp,%ebp
c0100503:	83 ec 08             	sub    $0x8,%esp
c0100506:	e8 15 09 00 00       	call   c0100e20 <init_page>
c010050b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100511:	b8 70 04 10 c0       	mov    $0xc0100470,%eax
c0100516:	ff e0                	jmp    *%eax
c0100518:	68 c9 81 10 c0       	push   $0xc01081c9
c010051d:	6a 24                	push   $0x24
c010051f:	68 2c 81 10 c0       	push   $0xc010812c
c0100524:	68 74 81 10 c0       	push   $0xc0108174
c0100529:	e8 62 0b 00 00       	call   c0101090 <printk>
c010052e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100533:	d6                   	(bad)  
c0100534:	83 c4 10             	add    $0x10,%esp
c0100537:	c9                   	leave  
c0100538:	c3                   	ret    
c0100539:	66 90                	xchg   %ax,%ax
c010053b:	66 90                	xchg   %ax,%ax
c010053d:	66 90                	xchg   %ax,%ax
c010053f:	90                   	nop

c0100540 <do_syscall>:
c0100540:	55                   	push   %ebp
c0100541:	89 e5                	mov    %esp,%ebp
c0100543:	56                   	push   %esi
c0100544:	53                   	push   %ebx
c0100545:	8b 75 08             	mov    0x8(%ebp),%esi
c0100548:	8b 46 1c             	mov    0x1c(%esi),%eax
c010054b:	83 f8 04             	cmp    $0x4,%eax
c010054e:	0f 84 9c 00 00 00    	je     c01005f0 <do_syscall+0xb0>
c0100554:	76 4a                	jbe    c01005a0 <do_syscall+0x60>
c0100556:	83 f8 05             	cmp    $0x5,%eax
c0100559:	74 25                	je     c0100580 <do_syscall+0x40>
c010055b:	83 f8 2d             	cmp    $0x2d,%eax
c010055e:	75 60                	jne    c01005c0 <do_syscall+0x80>
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	ff 76 10             	pushl  0x10(%esi)
c0100566:	e8 15 08 00 00       	call   c0100d80 <mm_brk>
c010056b:	c7 46 1c 00 00 00 00 	movl   $0x0,0x1c(%esi)
c0100572:	83 c4 10             	add    $0x10,%esp
c0100575:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100578:	5b                   	pop    %ebx
c0100579:	5e                   	pop    %esi
c010057a:	5d                   	pop    %ebp
c010057b:	c3                   	ret    
c010057c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100580:	83 ec 08             	sub    $0x8,%esp
c0100583:	ff 76 18             	pushl  0x18(%esi)
c0100586:	ff 76 10             	pushl  0x10(%esi)
c0100589:	e8 22 fe ff ff       	call   c01003b0 <fs_open>
c010058e:	83 c4 10             	add    $0x10,%esp
c0100591:	89 46 1c             	mov    %eax,0x1c(%esi)
c0100594:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100597:	5b                   	pop    %ebx
c0100598:	5e                   	pop    %esi
c0100599:	5d                   	pop    %ebp
c010059a:	c3                   	ret    
c010059b:	90                   	nop
c010059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005a0:	85 c0                	test   %eax,%eax
c01005a2:	75 1c                	jne    c01005c0 <do_syscall+0x80>
c01005a4:	fa                   	cli    
c01005a5:	83 ec 08             	sub    $0x8,%esp
c01005a8:	ff 76 18             	pushl  0x18(%esi)
c01005ab:	ff 76 10             	pushl  0x10(%esi)
c01005ae:	e8 ad 00 00 00       	call   c0100660 <add_irq_handle>
c01005b3:	fb                   	sti    
c01005b4:	83 c4 10             	add    $0x10,%esp
c01005b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01005ba:	5b                   	pop    %ebx
c01005bb:	5e                   	pop    %esi
c01005bc:	5d                   	pop    %ebp
c01005bd:	c3                   	ret    
c01005be:	66 90                	xchg   %ax,%ax
c01005c0:	83 ec 0c             	sub    $0xc,%esp
c01005c3:	50                   	push   %eax
c01005c4:	68 60 82 10 c0       	push   $0xc0108260
c01005c9:	6a 30                	push   $0x30
c01005cb:	68 ec 81 10 c0       	push   $0xc01081ec
c01005d0:	68 0c 82 10 c0       	push   $0xc010820c
c01005d5:	e8 b6 0a 00 00       	call   c0101090 <printk>
c01005da:	b8 01 00 00 00       	mov    $0x1,%eax
c01005df:	d6                   	(bad)  
c01005e0:	83 c4 20             	add    $0x20,%esp
c01005e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01005e6:	5b                   	pop    %ebx
c01005e7:	5e                   	pop    %esi
c01005e8:	5d                   	pop    %ebp
c01005e9:	c3                   	ret    
c01005ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01005f0:	8b 46 10             	mov    0x10(%esi),%eax
c01005f3:	83 e8 01             	sub    $0x1,%eax
c01005f6:	83 f8 01             	cmp    $0x1,%eax
c01005f9:	76 27                	jbe    c0100622 <do_syscall+0xe2>
c01005fb:	83 ec 0c             	sub    $0xc,%esp
c01005fe:	68 ce 81 10 c0       	push   $0xc01081ce
c0100603:	68 60 82 10 c0       	push   $0xc0108260
c0100608:	6a 24                	push   $0x24
c010060a:	68 ec 81 10 c0       	push   $0xc01081ec
c010060f:	68 74 7e 10 c0       	push   $0xc0107e74
c0100614:	e8 77 0a 00 00       	call   c0101090 <printk>
c0100619:	b8 01 00 00 00       	mov    $0x1,%eax
c010061e:	d6                   	(bad)  
c010061f:	83 c4 20             	add    $0x20,%esp
c0100622:	8b 46 14             	mov    0x14(%esi),%eax
c0100625:	85 c0                	test   %eax,%eax
c0100627:	74 25                	je     c010064e <do_syscall+0x10e>
c0100629:	31 db                	xor    %ebx,%ebx
c010062b:	90                   	nop
c010062c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100630:	8b 46 18             	mov    0x18(%esi),%eax
c0100633:	83 ec 0c             	sub    $0xc,%esp
c0100636:	83 c3 01             	add    $0x1,%ebx
c0100639:	0f be 44 03 ff       	movsbl -0x1(%ebx,%eax,1),%eax
c010063e:	50                   	push   %eax
c010063f:	e8 ec 0a 00 00       	call   c0101130 <serial_printc>
c0100644:	8b 46 14             	mov    0x14(%esi),%eax
c0100647:	83 c4 10             	add    $0x10,%esp
c010064a:	39 c3                	cmp    %eax,%ebx
c010064c:	72 e2                	jb     c0100630 <do_syscall+0xf0>
c010064e:	89 46 1c             	mov    %eax,0x1c(%esi)
c0100651:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100654:	5b                   	pop    %ebx
c0100655:	5e                   	pop    %esi
c0100656:	5d                   	pop    %ebp
c0100657:	c3                   	ret    
c0100658:	66 90                	xchg   %ax,%ax
c010065a:	66 90                	xchg   %ax,%ax
c010065c:	66 90                	xchg   %ax,%ax
c010065e:	66 90                	xchg   %ax,%ax

c0100660 <add_irq_handle>:
c0100660:	55                   	push   %ebp
c0100661:	89 e5                	mov    %esp,%ebp
c0100663:	53                   	push   %ebx
c0100664:	83 ec 04             	sub    $0x4,%esp
c0100667:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010066a:	83 fb 0f             	cmp    $0xf,%ebx
c010066d:	7f 71                	jg     c01006e0 <add_irq_handle+0x80>
c010066f:	a1 00 c1 12 c0       	mov    0xc012c100,%eax
c0100674:	83 f8 20             	cmp    $0x20,%eax
c0100677:	7e 2c                	jle    c01006a5 <add_irq_handle+0x45>
c0100679:	83 ec 0c             	sub    $0xc,%esp
c010067c:	68 9a 82 10 c0       	push   $0xc010829a
c0100681:	68 81 83 10 c0       	push   $0xc0108381
c0100686:	6a 16                	push   $0x16
c0100688:	68 7e 82 10 c0       	push   $0xc010827e
c010068d:	68 74 7e 10 c0       	push   $0xc0107e74
c0100692:	e8 f9 09 00 00       	call   c0101090 <printk>
c0100697:	b8 01 00 00 00       	mov    $0x1,%eax
c010069c:	d6                   	(bad)  
c010069d:	a1 00 c1 12 c0       	mov    0xc012c100,%eax
c01006a2:	83 c4 20             	add    $0x20,%esp
c01006a5:	8d 50 01             	lea    0x1(%eax),%edx
c01006a8:	89 15 00 c1 12 c0    	mov    %edx,0xc012c100
c01006ae:	8b 55 0c             	mov    0xc(%ebp),%edx
c01006b1:	89 14 c5 80 c1 12 c0 	mov    %edx,-0x3fed3e80(,%eax,8)
c01006b8:	8b 14 9d 40 c1 12 c0 	mov    -0x3fed3ec0(,%ebx,4),%edx
c01006bf:	89 14 c5 84 c1 12 c0 	mov    %edx,-0x3fed3e7c(,%eax,8)
c01006c6:	8d 04 c5 80 c1 12 c0 	lea    -0x3fed3e80(,%eax,8),%eax
c01006cd:	89 04 9d 40 c1 12 c0 	mov    %eax,-0x3fed3ec0(,%ebx,4)
c01006d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006d7:	c9                   	leave  
c01006d8:	c3                   	ret    
c01006d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01006e0:	83 ec 0c             	sub    $0xc,%esp
c01006e3:	68 6b 82 10 c0       	push   $0xc010826b
c01006e8:	68 81 83 10 c0       	push   $0xc0108381
c01006ed:	6a 15                	push   $0x15
c01006ef:	68 7e 82 10 c0       	push   $0xc010827e
c01006f4:	68 74 7e 10 c0       	push   $0xc0107e74
c01006f9:	e8 92 09 00 00       	call   c0101090 <printk>
c01006fe:	b8 01 00 00 00       	mov    $0x1,%eax
c0100703:	d6                   	(bad)  
c0100704:	83 c4 20             	add    $0x20,%esp
c0100707:	e9 63 ff ff ff       	jmp    c010066f <add_irq_handle+0xf>
c010070c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100710 <irq_handle>:
c0100710:	55                   	push   %ebp
c0100711:	89 e5                	mov    %esp,%ebp
c0100713:	53                   	push   %ebx
c0100714:	83 ec 04             	sub    $0x4,%esp
c0100717:	8b 55 08             	mov    0x8(%ebp),%edx
c010071a:	8b 42 20             	mov    0x20(%edx),%eax
c010071d:	85 c0                	test   %eax,%eax
c010071f:	0f 88 9b 00 00 00    	js     c01007c0 <irq_handle+0xb0>
c0100725:	3d 80 00 00 00       	cmp    $0x80,%eax
c010072a:	0f 84 b8 00 00 00    	je     c01007e8 <irq_handle+0xd8>
c0100730:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100735:	7e 59                	jle    c0100790 <irq_handle+0x80>
c0100737:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c010073d:	83 fb 0f             	cmp    $0xf,%ebx
c0100740:	7f 1e                	jg     c0100760 <irq_handle+0x50>
c0100742:	8b 1c 9d 40 c1 12 c0 	mov    -0x3fed3ec0(,%ebx,4),%ebx
c0100749:	85 db                	test   %ebx,%ebx
c010074b:	74 0c                	je     c0100759 <irq_handle+0x49>
c010074d:	8d 76 00             	lea    0x0(%esi),%esi
c0100750:	ff 13                	call   *(%ebx)
c0100752:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100755:	85 db                	test   %ebx,%ebx
c0100757:	75 f7                	jne    c0100750 <irq_handle+0x40>
c0100759:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010075c:	c9                   	leave  
c010075d:	c3                   	ret    
c010075e:	66 90                	xchg   %ax,%ax
c0100760:	83 ec 0c             	sub    $0xc,%esp
c0100763:	68 b8 82 10 c0       	push   $0xc01082b8
c0100768:	68 76 83 10 c0       	push   $0xc0108376
c010076d:	6a 32                	push   $0x32
c010076f:	68 7e 82 10 c0       	push   $0xc010827e
c0100774:	68 74 7e 10 c0       	push   $0xc0107e74
c0100779:	e8 12 09 00 00       	call   c0101090 <printk>
c010077e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100783:	d6                   	(bad)  
c0100784:	83 c4 20             	add    $0x20,%esp
c0100787:	eb b9                	jmp    c0100742 <irq_handle+0x32>
c0100789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100790:	83 ec 08             	sub    $0x8,%esp
c0100793:	ff 72 28             	pushl  0x28(%edx)
c0100796:	50                   	push   %eax
c0100797:	68 76 83 10 c0       	push   $0xc0108376
c010079c:	6a 2f                	push   $0x2f
c010079e:	68 7e 82 10 c0       	push   $0xc010827e
c01007a3:	68 1c 83 10 c0       	push   $0xc010831c
c01007a8:	e8 e3 08 00 00       	call   c0101090 <printk>
c01007ad:	b8 01 00 00 00       	mov    $0x1,%eax
c01007b2:	d6                   	(bad)  
c01007b3:	83 c4 20             	add    $0x20,%esp
c01007b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01007b9:	c9                   	leave  
c01007ba:	c3                   	ret    
c01007bb:	90                   	nop
c01007bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01007c0:	68 76 83 10 c0       	push   $0xc0108376
c01007c5:	6a 29                	push   $0x29
c01007c7:	68 7e 82 10 c0       	push   $0xc010827e
c01007cc:	68 d0 82 10 c0       	push   $0xc01082d0
c01007d1:	e8 ba 08 00 00       	call   c0101090 <printk>
c01007d6:	b8 01 00 00 00       	mov    $0x1,%eax
c01007db:	d6                   	(bad)  
c01007dc:	83 c4 10             	add    $0x10,%esp
c01007df:	e9 75 ff ff ff       	jmp    c0100759 <irq_handle+0x49>
c01007e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01007e8:	89 55 08             	mov    %edx,0x8(%ebp)
c01007eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01007ee:	c9                   	leave  
c01007ef:	e9 4c fd ff ff       	jmp    c0100540 <do_syscall>
c01007f4:	66 90                	xchg   %ax,%ax
c01007f6:	66 90                	xchg   %ax,%ax
c01007f8:	66 90                	xchg   %ax,%ax
c01007fa:	66 90                	xchg   %ax,%ax
c01007fc:	66 90                	xchg   %ax,%ax
c01007fe:	66 90                	xchg   %ax,%ax

c0100800 <init_i8259>:
c0100800:	55                   	push   %ebp
c0100801:	ba 21 00 00 00       	mov    $0x21,%edx
c0100806:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010080b:	89 e5                	mov    %esp,%ebp
c010080d:	ee                   	out    %al,(%dx)
c010080e:	b2 a1                	mov    $0xa1,%dl
c0100810:	ee                   	out    %al,(%dx)
c0100811:	b8 11 00 00 00       	mov    $0x11,%eax
c0100816:	b2 20                	mov    $0x20,%dl
c0100818:	ee                   	out    %al,(%dx)
c0100819:	b8 20 00 00 00       	mov    $0x20,%eax
c010081e:	b2 21                	mov    $0x21,%dl
c0100820:	ee                   	out    %al,(%dx)
c0100821:	b8 04 00 00 00       	mov    $0x4,%eax
c0100826:	ee                   	out    %al,(%dx)
c0100827:	b8 03 00 00 00       	mov    $0x3,%eax
c010082c:	ee                   	out    %al,(%dx)
c010082d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100832:	b2 a0                	mov    $0xa0,%dl
c0100834:	ee                   	out    %al,(%dx)
c0100835:	b8 28 00 00 00       	mov    $0x28,%eax
c010083a:	b2 a1                	mov    $0xa1,%dl
c010083c:	ee                   	out    %al,(%dx)
c010083d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100842:	ee                   	out    %al,(%dx)
c0100843:	b8 03 00 00 00       	mov    $0x3,%eax
c0100848:	ee                   	out    %al,(%dx)
c0100849:	b8 68 00 00 00       	mov    $0x68,%eax
c010084e:	b2 20                	mov    $0x20,%dl
c0100850:	ee                   	out    %al,(%dx)
c0100851:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100856:	ee                   	out    %al,(%dx)
c0100857:	b8 68 00 00 00       	mov    $0x68,%eax
c010085c:	b2 a0                	mov    $0xa0,%dl
c010085e:	ee                   	out    %al,(%dx)
c010085f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100864:	ee                   	out    %al,(%dx)
c0100865:	5d                   	pop    %ebp
c0100866:	c3                   	ret    
c0100867:	66 90                	xchg   %ax,%ax
c0100869:	66 90                	xchg   %ax,%ax
c010086b:	66 90                	xchg   %ax,%ax
c010086d:	66 90                	xchg   %ax,%ax
c010086f:	90                   	nop

c0100870 <init_idt>:
c0100870:	55                   	push   %ebp
c0100871:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100876:	b8 c0 c2 12 c0       	mov    $0xc012c2c0,%eax
c010087b:	89 d1                	mov    %edx,%ecx
c010087d:	c1 ea 10             	shr    $0x10,%edx
c0100880:	89 e5                	mov    %esp,%ebp
c0100882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100888:	66 89 08             	mov    %cx,(%eax)
c010088b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100891:	83 c0 08             	add    $0x8,%eax
c0100894:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100898:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010089c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c01008a0:	3d c0 ca 12 c0       	cmp    $0xc012cac0,%eax
c01008a5:	75 e1                	jne    c0100888 <init_idt+0x18>
c01008a7:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c01008ac:	ba 08 00 00 00       	mov    $0x8,%edx
c01008b1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01008b6:	66 a3 c0 c2 12 c0    	mov    %ax,0xc012c2c0
c01008bc:	c1 e8 10             	shr    $0x10,%eax
c01008bf:	66 89 15 c2 c2 12 c0 	mov    %dx,0xc012c2c2
c01008c6:	66 a3 c6 c2 12 c0    	mov    %ax,0xc012c2c6
c01008cc:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c01008d1:	ba 08 00 00 00       	mov    $0x8,%edx
c01008d6:	66 a3 c8 c2 12 c0    	mov    %ax,0xc012c2c8
c01008dc:	c1 e8 10             	shr    $0x10,%eax
c01008df:	66 89 0d ca c2 12 c0 	mov    %cx,0xc012c2ca
c01008e6:	66 a3 ce c2 12 c0    	mov    %ax,0xc012c2ce
c01008ec:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c01008f1:	66 89 15 d2 c2 12 c0 	mov    %dx,0xc012c2d2
c01008f8:	66 a3 d0 c2 12 c0    	mov    %ax,0xc012c2d0
c01008fe:	c1 e8 10             	shr    $0x10,%eax
c0100901:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100906:	66 a3 d6 c2 12 c0    	mov    %ax,0xc012c2d6
c010090c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100911:	ba 08 00 00 00       	mov    $0x8,%edx
c0100916:	66 a3 d8 c2 12 c0    	mov    %ax,0xc012c2d8
c010091c:	c1 e8 10             	shr    $0x10,%eax
c010091f:	66 89 0d da c2 12 c0 	mov    %cx,0xc012c2da
c0100926:	66 a3 de c2 12 c0    	mov    %ax,0xc012c2de
c010092c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100931:	66 89 15 e2 c2 12 c0 	mov    %dx,0xc012c2e2
c0100938:	66 a3 e0 c2 12 c0    	mov    %ax,0xc012c2e0
c010093e:	c1 e8 10             	shr    $0x10,%eax
c0100941:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100946:	66 a3 e6 c2 12 c0    	mov    %ax,0xc012c2e6
c010094c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100951:	ba 08 00 00 00       	mov    $0x8,%edx
c0100956:	66 a3 e8 c2 12 c0    	mov    %ax,0xc012c2e8
c010095c:	c1 e8 10             	shr    $0x10,%eax
c010095f:	66 89 0d ea c2 12 c0 	mov    %cx,0xc012c2ea
c0100966:	66 a3 ee c2 12 c0    	mov    %ax,0xc012c2ee
c010096c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100971:	66 89 15 f2 c2 12 c0 	mov    %dx,0xc012c2f2
c0100978:	66 a3 f0 c2 12 c0    	mov    %ax,0xc012c2f0
c010097e:	c1 e8 10             	shr    $0x10,%eax
c0100981:	c6 05 c4 c2 12 c0 00 	movb   $0x0,0xc012c2c4
c0100988:	c6 05 c5 c2 12 c0 8f 	movb   $0x8f,0xc012c2c5
c010098f:	c6 05 cc c2 12 c0 00 	movb   $0x0,0xc012c2cc
c0100996:	b9 08 00 00 00       	mov    $0x8,%ecx
c010099b:	c6 05 cd c2 12 c0 8f 	movb   $0x8f,0xc012c2cd
c01009a2:	c6 05 d4 c2 12 c0 00 	movb   $0x0,0xc012c2d4
c01009a9:	ba 08 00 00 00       	mov    $0x8,%edx
c01009ae:	c6 05 d5 c2 12 c0 8f 	movb   $0x8f,0xc012c2d5
c01009b5:	c6 05 dc c2 12 c0 00 	movb   $0x0,0xc012c2dc
c01009bc:	c6 05 dd c2 12 c0 8f 	movb   $0x8f,0xc012c2dd
c01009c3:	c6 05 e4 c2 12 c0 00 	movb   $0x0,0xc012c2e4
c01009ca:	c6 05 e5 c2 12 c0 8f 	movb   $0x8f,0xc012c2e5
c01009d1:	c6 05 ec c2 12 c0 00 	movb   $0x0,0xc012c2ec
c01009d8:	c6 05 ed c2 12 c0 8f 	movb   $0x8f,0xc012c2ed
c01009df:	c6 05 f4 c2 12 c0 00 	movb   $0x0,0xc012c2f4
c01009e6:	c6 05 f5 c2 12 c0 8f 	movb   $0x8f,0xc012c2f5
c01009ed:	66 a3 f6 c2 12 c0    	mov    %ax,0xc012c2f6
c01009f3:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c01009f8:	66 a3 f8 c2 12 c0    	mov    %ax,0xc012c2f8
c01009fe:	c1 e8 10             	shr    $0x10,%eax
c0100a01:	66 89 0d fa c2 12 c0 	mov    %cx,0xc012c2fa
c0100a08:	66 a3 fe c2 12 c0    	mov    %ax,0xc012c2fe
c0100a0e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0100a13:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a18:	66 a3 00 c3 12 c0    	mov    %ax,0xc012c300
c0100a1e:	c1 e8 10             	shr    $0x10,%eax
c0100a21:	66 89 15 02 c3 12 c0 	mov    %dx,0xc012c302
c0100a28:	66 a3 06 c3 12 c0    	mov    %ax,0xc012c306
c0100a2e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100a33:	66 89 0d 0a c3 12 c0 	mov    %cx,0xc012c30a
c0100a3a:	66 a3 08 c3 12 c0    	mov    %ax,0xc012c308
c0100a40:	c1 e8 10             	shr    $0x10,%eax
c0100a43:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a48:	66 a3 0e c3 12 c0    	mov    %ax,0xc012c30e
c0100a4e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100a53:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a58:	66 a3 10 c3 12 c0    	mov    %ax,0xc012c310
c0100a5e:	c1 e8 10             	shr    $0x10,%eax
c0100a61:	66 89 15 12 c3 12 c0 	mov    %dx,0xc012c312
c0100a68:	66 a3 16 c3 12 c0    	mov    %ax,0xc012c316
c0100a6e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100a73:	66 89 0d 1a c3 12 c0 	mov    %cx,0xc012c31a
c0100a7a:	66 a3 18 c3 12 c0    	mov    %ax,0xc012c318
c0100a80:	c1 e8 10             	shr    $0x10,%eax
c0100a83:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a88:	66 a3 1e c3 12 c0    	mov    %ax,0xc012c31e
c0100a8e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100a93:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a98:	66 a3 20 c3 12 c0    	mov    %ax,0xc012c320
c0100a9e:	c1 e8 10             	shr    $0x10,%eax
c0100aa1:	66 89 15 22 c3 12 c0 	mov    %dx,0xc012c322
c0100aa8:	66 a3 26 c3 12 c0    	mov    %ax,0xc012c326
c0100aae:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0100ab3:	66 89 0d 2a c3 12 c0 	mov    %cx,0xc012c32a
c0100aba:	66 a3 28 c3 12 c0    	mov    %ax,0xc012c328
c0100ac0:	c1 e8 10             	shr    $0x10,%eax
c0100ac3:	c6 05 fc c2 12 c0 00 	movb   $0x0,0xc012c2fc
c0100aca:	c6 05 fd c2 12 c0 8f 	movb   $0x8f,0xc012c2fd
c0100ad1:	c6 05 04 c3 12 c0 00 	movb   $0x0,0xc012c304
c0100ad8:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100add:	c6 05 05 c3 12 c0 8f 	movb   $0x8f,0xc012c305
c0100ae4:	c6 05 0c c3 12 c0 00 	movb   $0x0,0xc012c30c
c0100aeb:	ba 08 00 00 00       	mov    $0x8,%edx
c0100af0:	c6 05 0d c3 12 c0 8f 	movb   $0x8f,0xc012c30d
c0100af7:	c6 05 14 c3 12 c0 00 	movb   $0x0,0xc012c314
c0100afe:	c6 05 15 c3 12 c0 8f 	movb   $0x8f,0xc012c315
c0100b05:	c6 05 1c c3 12 c0 00 	movb   $0x0,0xc012c31c
c0100b0c:	c6 05 1d c3 12 c0 8f 	movb   $0x8f,0xc012c31d
c0100b13:	c6 05 24 c3 12 c0 00 	movb   $0x0,0xc012c324
c0100b1a:	c6 05 25 c3 12 c0 8f 	movb   $0x8f,0xc012c325
c0100b21:	c6 05 2c c3 12 c0 00 	movb   $0x0,0xc012c32c
c0100b28:	66 a3 2e c3 12 c0    	mov    %ax,0xc012c32e
c0100b2e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0100b33:	66 89 0d c2 c6 12 c0 	mov    %cx,0xc012c6c2
c0100b3a:	66 a3 30 c3 12 c0    	mov    %ax,0xc012c330
c0100b40:	c1 e8 10             	shr    $0x10,%eax
c0100b43:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100b48:	66 a3 36 c3 12 c0    	mov    %ax,0xc012c336
c0100b4e:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100b53:	66 89 15 32 c3 12 c0 	mov    %dx,0xc012c332
c0100b5a:	66 a3 c0 c6 12 c0    	mov    %ax,0xc012c6c0
c0100b60:	c1 e8 10             	shr    $0x10,%eax
c0100b63:	ba 08 00 00 00       	mov    $0x8,%edx
c0100b68:	66 a3 c6 c6 12 c0    	mov    %ax,0xc012c6c6
c0100b6e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100b73:	66 89 0d ca c3 12 c0 	mov    %cx,0xc012c3ca
c0100b7a:	66 a3 c0 c3 12 c0    	mov    %ax,0xc012c3c0
c0100b80:	c1 e8 10             	shr    $0x10,%eax
c0100b83:	b9 ff 07 00 00       	mov    $0x7ff,%ecx
c0100b88:	66 a3 c6 c3 12 c0    	mov    %ax,0xc012c3c6
c0100b8e:	b8 77 03 10 c0       	mov    $0xc0100377,%eax
c0100b93:	66 89 0d 80 c2 12 c0 	mov    %cx,0xc012c280
c0100b9a:	66 a3 c8 c3 12 c0    	mov    %ax,0xc012c3c8
c0100ba0:	c1 e8 10             	shr    $0x10,%eax
c0100ba3:	66 89 15 c2 c3 12 c0 	mov    %dx,0xc012c3c2
c0100baa:	66 a3 ce c3 12 c0    	mov    %ax,0xc012c3ce
c0100bb0:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100bb5:	ba 08 00 00 00       	mov    $0x8,%edx
c0100bba:	66 a3 30 c4 12 c0    	mov    %ax,0xc012c430
c0100bc0:	c1 e8 10             	shr    $0x10,%eax
c0100bc3:	c6 05 2d c3 12 c0 8f 	movb   $0x8f,0xc012c32d
c0100bca:	66 a3 36 c4 12 c0    	mov    %ax,0xc012c436
c0100bd0:	b8 c0 c2 12 c0       	mov    $0xc012c2c0,%eax
c0100bd5:	c6 05 34 c3 12 c0 00 	movb   $0x0,0xc012c334
c0100bdc:	66 a3 82 c2 12 c0    	mov    %ax,0xc012c282
c0100be2:	c1 e8 10             	shr    $0x10,%eax
c0100be5:	c6 05 35 c3 12 c0 8f 	movb   $0x8f,0xc012c335
c0100bec:	66 a3 84 c2 12 c0    	mov    %ax,0xc012c284
c0100bf2:	c6 05 c4 c6 12 c0 00 	movb   $0x0,0xc012c6c4
c0100bf9:	b8 80 c2 12 c0       	mov    $0xc012c280,%eax
c0100bfe:	c6 05 c5 c6 12 c0 ef 	movb   $0xef,0xc012c6c5
c0100c05:	c6 05 c4 c3 12 c0 00 	movb   $0x0,0xc012c3c4
c0100c0c:	c6 05 c5 c3 12 c0 8e 	movb   $0x8e,0xc012c3c5
c0100c13:	c6 05 cc c3 12 c0 00 	movb   $0x0,0xc012c3cc
c0100c1a:	c6 05 cd c3 12 c0 8e 	movb   $0x8e,0xc012c3cd
c0100c21:	66 89 15 32 c4 12 c0 	mov    %dx,0xc012c432
c0100c28:	c6 05 34 c4 12 c0 00 	movb   $0x0,0xc012c434
c0100c2f:	c6 05 35 c4 12 c0 8e 	movb   $0x8e,0xc012c435
c0100c36:	0f 01 18             	lidtl  (%eax)
c0100c39:	5d                   	pop    %ebp
c0100c3a:	c3                   	ret    
c0100c3b:	66 90                	xchg   %ax,%ax
c0100c3d:	66 90                	xchg   %ax,%ax
c0100c3f:	90                   	nop

c0100c40 <create_video_mapping>:
c0100c40:	55                   	push   %ebp
c0100c41:	89 e5                	mov    %esp,%ebp
c0100c43:	53                   	push   %ebx
c0100c44:	83 ec 04             	sub    $0x4,%esp
c0100c47:	e8 14 01 00 00       	call   c0100d60 <get_updir>
c0100c4c:	89 c3                	mov    %eax,%ebx
c0100c4e:	e8 0d 01 00 00       	call   c0100d60 <get_updir>
c0100c53:	39 c3                	cmp    %eax,%ebx
c0100c55:	74 27                	je     c0100c7e <create_video_mapping+0x3e>
c0100c57:	83 ec 0c             	sub    $0xc,%esp
c0100c5a:	68 90 83 10 c0       	push   $0xc0108390
c0100c5f:	68 f3 83 10 c0       	push   $0xc01083f3
c0100c64:	6a 19                	push   $0x19
c0100c66:	68 b6 83 10 c0       	push   $0xc01083b6
c0100c6b:	68 74 7e 10 c0       	push   $0xc0107e74
c0100c70:	e8 1b 04 00 00       	call   c0101090 <printk>
c0100c75:	b8 01 00 00 00       	mov    $0x1,%eax
c0100c7a:	d6                   	(bad)  
c0100c7b:	83 c4 20             	add    $0x20,%esp
c0100c7e:	ba 00 d0 12 00       	mov    $0x12d000,%edx
c0100c83:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100c88:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c0100c8d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100c93:	83 ca 07             	or     $0x7,%edx
c0100c96:	89 13                	mov    %edx,(%ebx)
c0100c98:	90                   	nop
c0100c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100ca0:	89 ca                	mov    %ecx,%edx
c0100ca2:	83 c0 04             	add    $0x4,%eax
c0100ca5:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100cab:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100cb1:	83 ca 07             	or     $0x7,%edx
c0100cb4:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100cb7:	3d c0 d2 12 c0       	cmp    $0xc012d2c0,%eax
c0100cbc:	75 e2                	jne    c0100ca0 <create_video_mapping+0x60>
c0100cbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100cc1:	c9                   	leave  
c0100cc2:	c3                   	ret    
c0100cc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100cd0 <video_mapping_write_test>:
c0100cd0:	55                   	push   %ebp
c0100cd1:	31 c0                	xor    %eax,%eax
c0100cd3:	89 e5                	mov    %esp,%ebp
c0100cd5:	8d 76 00             	lea    0x0(%esi),%esi
c0100cd8:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100cdf:	83 c0 01             	add    $0x1,%eax
c0100ce2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100ce7:	75 ef                	jne    c0100cd8 <video_mapping_write_test+0x8>
c0100ce9:	5d                   	pop    %ebp
c0100cea:	c3                   	ret    
c0100ceb:	90                   	nop
c0100cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100cf0 <video_mapping_read_test>:
c0100cf0:	55                   	push   %ebp
c0100cf1:	89 e5                	mov    %esp,%ebp
c0100cf3:	56                   	push   %esi
c0100cf4:	be 01 00 00 00       	mov    $0x1,%esi
c0100cf9:	53                   	push   %ebx
c0100cfa:	31 db                	xor    %ebx,%ebx
c0100cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100d00:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100d07:	74 24                	je     c0100d2d <video_mapping_read_test+0x3d>
c0100d09:	83 ec 0c             	sub    $0xc,%esp
c0100d0c:	68 cf 83 10 c0       	push   $0xc01083cf
c0100d11:	68 db 83 10 c0       	push   $0xc01083db
c0100d16:	6a 30                	push   $0x30
c0100d18:	68 b6 83 10 c0       	push   $0xc01083b6
c0100d1d:	68 74 7e 10 c0       	push   $0xc0107e74
c0100d22:	e8 69 03 00 00       	call   c0101090 <printk>
c0100d27:	89 f0                	mov    %esi,%eax
c0100d29:	d6                   	(bad)  
c0100d2a:	83 c4 20             	add    $0x20,%esp
c0100d2d:	83 c3 01             	add    $0x1,%ebx
c0100d30:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100d36:	75 c8                	jne    c0100d00 <video_mapping_read_test+0x10>
c0100d38:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100d3b:	5b                   	pop    %ebx
c0100d3c:	5e                   	pop    %esi
c0100d3d:	5d                   	pop    %ebp
c0100d3e:	c3                   	ret    
c0100d3f:	90                   	nop

c0100d40 <video_mapping_clear>:
c0100d40:	55                   	push   %ebp
c0100d41:	89 e5                	mov    %esp,%ebp
c0100d43:	83 ec 0c             	sub    $0xc,%esp
c0100d46:	68 00 fa 00 00       	push   $0xfa00
c0100d4b:	6a 00                	push   $0x0
c0100d4d:	68 00 00 0a 00       	push   $0xa0000
c0100d52:	e8 81 08 00 00       	call   c01015d8 <memset>
c0100d57:	83 c4 10             	add    $0x10,%esp
c0100d5a:	c9                   	leave  
c0100d5b:	c3                   	ret    
c0100d5c:	66 90                	xchg   %ax,%ax
c0100d5e:	66 90                	xchg   %ax,%ax

c0100d60 <get_updir>:
c0100d60:	55                   	push   %ebp
c0100d61:	b8 00 f0 12 c0       	mov    $0xc012f000,%eax
c0100d66:	89 e5                	mov    %esp,%ebp
c0100d68:	5d                   	pop    %ebp
c0100d69:	c3                   	ret    
c0100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100d70 <get_ucr3>:
c0100d70:	55                   	push   %ebp
c0100d71:	a1 04 e0 12 c0       	mov    0xc012e004,%eax
c0100d76:	89 e5                	mov    %esp,%ebp
c0100d78:	5d                   	pop    %ebp
c0100d79:	c3                   	ret    
c0100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100d80 <mm_brk>:
c0100d80:	55                   	push   %ebp
c0100d81:	89 e5                	mov    %esp,%ebp
c0100d83:	53                   	push   %ebx
c0100d84:	83 ec 04             	sub    $0x4,%esp
c0100d87:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100d8a:	a1 00 e0 12 c0       	mov    0xc012e000,%eax
c0100d8f:	39 d8                	cmp    %ebx,%eax
c0100d91:	73 11                	jae    c0100da4 <mm_brk+0x24>
c0100d93:	89 da                	mov    %ebx,%edx
c0100d95:	83 ec 08             	sub    $0x8,%esp
c0100d98:	29 c2                	sub    %eax,%edx
c0100d9a:	52                   	push   %edx
c0100d9b:	50                   	push   %eax
c0100d9c:	e8 af f2 ff ff       	call   c0100050 <mm_malloc>
c0100da1:	83 c4 10             	add    $0x10,%esp
c0100da4:	89 1d 00 e0 12 c0    	mov    %ebx,0xc012e000
c0100daa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100dad:	c9                   	leave  
c0100dae:	c3                   	ret    
c0100daf:	90                   	nop

c0100db0 <init_mm>:
c0100db0:	55                   	push   %ebp
c0100db1:	89 e5                	mov    %esp,%ebp
c0100db3:	53                   	push   %ebx
c0100db4:	83 ec 04             	sub    $0x4,%esp
c0100db7:	e8 54 00 00 00       	call   c0100e10 <get_kpdir>
c0100dbc:	83 ec 04             	sub    $0x4,%esp
c0100dbf:	89 c3                	mov    %eax,%ebx
c0100dc1:	68 00 10 00 00       	push   $0x1000
c0100dc6:	6a 00                	push   $0x0
c0100dc8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100dce:	68 00 f0 12 c0       	push   $0xc012f000
c0100dd3:	e8 00 08 00 00       	call   c01015d8 <memset>
c0100dd8:	83 c4 0c             	add    $0xc,%esp
c0100ddb:	68 80 00 00 00       	push   $0x80
c0100de0:	53                   	push   %ebx
c0100de1:	68 00 fc 12 c0       	push   $0xc012fc00
c0100de6:	e8 a5 07 00 00       	call   c0101590 <memcpy>
c0100deb:	b8 00 f0 12 00       	mov    $0x12f000,%eax
c0100df0:	83 c4 10             	add    $0x10,%esp
c0100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100df6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100dfb:	a3 04 e0 12 c0       	mov    %eax,0xc012e004
c0100e00:	c9                   	leave  
c0100e01:	c3                   	ret    
c0100e02:	66 90                	xchg   %ax,%ax
c0100e04:	66 90                	xchg   %ax,%ax
c0100e06:	66 90                	xchg   %ax,%ax
c0100e08:	66 90                	xchg   %ax,%ax
c0100e0a:	66 90                	xchg   %ax,%ax
c0100e0c:	66 90                	xchg   %ax,%ax
c0100e0e:	66 90                	xchg   %ax,%ax

c0100e10 <get_kpdir>:
c0100e10:	55                   	push   %ebp
c0100e11:	b8 00 10 15 c0       	mov    $0xc0151000,%eax
c0100e16:	89 e5                	mov    %esp,%ebp
c0100e18:	5d                   	pop    %ebp
c0100e19:	c3                   	ret    
c0100e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100e20 <init_page>:
c0100e20:	55                   	push   %ebp
c0100e21:	89 e5                	mov    %esp,%ebp
c0100e23:	57                   	push   %edi
c0100e24:	83 ec 08             	sub    $0x8,%esp
c0100e27:	68 00 10 00 00       	push   $0x1000
c0100e2c:	6a 00                	push   $0x0
c0100e2e:	68 00 10 15 00       	push   $0x151000
c0100e33:	e8 a0 07 00 00       	call   c01015d8 <memset>
c0100e38:	b9 00 10 15 00       	mov    $0x151000,%ecx
c0100e3d:	83 c4 10             	add    $0x10,%esp
c0100e40:	ba 00 10 13 00       	mov    $0x131000,%edx
c0100e45:	8d 76 00             	lea    0x0(%esi),%esi
c0100e48:	89 d0                	mov    %edx,%eax
c0100e4a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100e50:	83 c1 04             	add    $0x4,%ecx
c0100e53:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100e58:	83 c8 07             	or     $0x7,%eax
c0100e5b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100e5e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100e64:	81 fa 00 10 15 00    	cmp    $0x151000,%edx
c0100e6a:	75 dc                	jne    c0100e48 <init_page+0x28>
c0100e6c:	bf fc 0f 15 00       	mov    $0x150ffc,%edi
c0100e71:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100e76:	fd                   	std    
c0100e77:	ab                   	stos   %eax,%es:(%edi)
c0100e78:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100e7d:	7d f8                	jge    c0100e77 <init_page+0x57>
c0100e7f:	b8 00 10 15 00       	mov    $0x151000,%eax
c0100e84:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100e89:	0f 22 d8             	mov    %eax,%cr3
c0100e8c:	0f 20 c0             	mov    %cr0,%eax
c0100e8f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100e94:	0f 22 c0             	mov    %eax,%cr0
c0100e97:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100e9a:	c9                   	leave  
c0100e9b:	c3                   	ret    
c0100e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100ea0 <init_segment>:
c0100ea0:	55                   	push   %ebp
c0100ea1:	89 e5                	mov    %esp,%ebp
c0100ea3:	83 ec 0c             	sub    $0xc,%esp
c0100ea6:	6a 18                	push   $0x18
c0100ea8:	6a 00                	push   $0x0
c0100eaa:	68 08 00 13 c0       	push   $0xc0130008
c0100eaf:	e8 24 07 00 00       	call   c01015d8 <memset>
c0100eb4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100eb9:	31 c9                	xor    %ecx,%ecx
c0100ebb:	b8 08 00 13 c0       	mov    $0xc0130008,%eax
c0100ec0:	66 89 15 10 00 13 c0 	mov    %dx,0xc0130010
c0100ec7:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100ecc:	66 89 0d 12 00 13 c0 	mov    %cx,0xc0130012
c0100ed3:	66 89 15 18 00 13 c0 	mov    %dx,0xc0130018
c0100eda:	ba 17 00 00 00       	mov    $0x17,%edx
c0100edf:	31 c9                	xor    %ecx,%ecx
c0100ee1:	66 89 15 00 00 13 c0 	mov    %dx,0xc0130000
c0100ee8:	66 a3 02 00 13 c0    	mov    %ax,0xc0130002
c0100eee:	c1 e8 10             	shr    $0x10,%eax
c0100ef1:	66 a3 04 00 13 c0    	mov    %ax,0xc0130004
c0100ef7:	c6 05 14 00 13 c0 00 	movb   $0x0,0xc0130014
c0100efe:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c0100f03:	c6 05 15 00 13 c0 9a 	movb   $0x9a,0xc0130015
c0100f0a:	c6 05 16 00 13 c0 cf 	movb   $0xcf,0xc0130016
c0100f11:	c6 05 17 00 13 c0 00 	movb   $0x0,0xc0130017
c0100f18:	66 89 0d 1a 00 13 c0 	mov    %cx,0xc013001a
c0100f1f:	c6 05 1c 00 13 c0 00 	movb   $0x0,0xc013001c
c0100f26:	c6 05 1d 00 13 c0 92 	movb   $0x92,0xc013001d
c0100f2d:	c6 05 1e 00 13 c0 cf 	movb   $0xcf,0xc013001e
c0100f34:	c6 05 1f 00 13 c0 00 	movb   $0x0,0xc013001f
c0100f3b:	0f 01 10             	lgdtl  (%eax)
c0100f3e:	83 c4 10             	add    $0x10,%esp
c0100f41:	c9                   	leave  
c0100f42:	c3                   	ret    
c0100f43:	66 90                	xchg   %ax,%ax
c0100f45:	66 90                	xchg   %ax,%ax
c0100f47:	66 90                	xchg   %ax,%ax
c0100f49:	66 90                	xchg   %ax,%ax
c0100f4b:	66 90                	xchg   %ax,%ax
c0100f4d:	66 90                	xchg   %ax,%ax
c0100f4f:	90                   	nop

c0100f50 <loader>:
c0100f50:	55                   	push   %ebp
c0100f51:	89 e5                	mov    %esp,%ebp
c0100f53:	57                   	push   %edi
c0100f54:	56                   	push   %esi
c0100f55:	53                   	push   %ebx
c0100f56:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100f5c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100f62:	68 00 10 00 00       	push   $0x1000
c0100f67:	6a 00                	push   $0x0
c0100f69:	53                   	push   %ebx
c0100f6a:	e8 81 02 00 00       	call   c01011f0 <ide_read>
c0100f6f:	83 c4 10             	add    $0x10,%esp
c0100f72:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100f79:	45 4c 46 
c0100f7c:	74 06                	je     c0100f84 <loader+0x34>
c0100f7e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f83:	d6                   	(bad)  
c0100f84:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100f8a:	83 fa 34             	cmp    $0x34,%edx
c0100f8d:	74 06                	je     c0100f95 <loader+0x45>
c0100f8f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f94:	d6                   	(bad)  
c0100f95:	31 f6                	xor    %esi,%esi
c0100f97:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100f9e:	00 
c0100f9f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100fa3:	75 1c                	jne    c0100fc1 <loader+0x71>
c0100fa5:	eb 71                	jmp    c0101018 <loader+0xc8>
c0100fa7:	89 f6                	mov    %esi,%esi
c0100fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100fb0:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100fb7:	83 c6 01             	add    $0x1,%esi
c0100fba:	83 c3 20             	add    $0x20,%ebx
c0100fbd:	39 f0                	cmp    %esi,%eax
c0100fbf:	7e 57                	jle    c0101018 <loader+0xc8>
c0100fc1:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100fc5:	75 e9                	jne    c0100fb0 <loader+0x60>
c0100fc7:	83 ec 08             	sub    $0x8,%esp
c0100fca:	ff 33                	pushl  (%ebx)
c0100fcc:	ff 73 f4             	pushl  -0xc(%ebx)
c0100fcf:	e8 7c f0 ff ff       	call   c0100050 <mm_malloc>
c0100fd4:	83 c4 0c             	add    $0xc,%esp
c0100fd7:	ff 73 fc             	pushl  -0x4(%ebx)
c0100fda:	ff 73 f0             	pushl  -0x10(%ebx)
c0100fdd:	50                   	push   %eax
c0100fde:	89 c7                	mov    %eax,%edi
c0100fe0:	e8 0b 02 00 00       	call   c01011f0 <ide_read>
c0100fe5:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0100fe8:	8b 0b                	mov    (%ebx),%ecx
c0100fea:	83 c4 0c             	add    $0xc,%esp
c0100fed:	29 d1                	sub    %edx,%ecx
c0100fef:	01 fa                	add    %edi,%edx
c0100ff1:	51                   	push   %ecx
c0100ff2:	6a 00                	push   $0x0
c0100ff4:	52                   	push   %edx
c0100ff5:	e8 de 05 00 00       	call   c01015d8 <memset>
c0100ffa:	8b 03                	mov    (%ebx),%eax
c0100ffc:	03 43 f4             	add    -0xc(%ebx),%eax
c0100fff:	83 c4 10             	add    $0x10,%esp
c0101002:	83 e8 01             	sub    $0x1,%eax
c0101005:	3b 05 00 e0 12 c0    	cmp    0xc012e000,%eax
c010100b:	76 a3                	jbe    c0100fb0 <loader+0x60>
c010100d:	a3 00 e0 12 c0       	mov    %eax,0xc012e000
c0101012:	eb 9c                	jmp    c0100fb0 <loader+0x60>
c0101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101018:	83 ec 08             	sub    $0x8,%esp
c010101b:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0101021:	68 00 00 10 00       	push   $0x100000
c0101026:	68 00 00 f0 bf       	push   $0xbff00000
c010102b:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0101031:	e8 1a f0 ff ff       	call   c0100050 <mm_malloc>
c0101036:	e8 05 fc ff ff       	call   c0100c40 <create_video_mapping>
c010103b:	e8 30 fd ff ff       	call   c0100d70 <get_ucr3>
c0101040:	0f 22 d8             	mov    %eax,%cr3
c0101043:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0101049:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010104c:	5b                   	pop    %ebx
c010104d:	5e                   	pop    %esi
c010104e:	5f                   	pop    %edi
c010104f:	5d                   	pop    %ebp
c0101050:	c3                   	ret    
c0101051:	66 90                	xchg   %ax,%ax
c0101053:	66 90                	xchg   %ax,%ax
c0101055:	66 90                	xchg   %ax,%ax
c0101057:	66 90                	xchg   %ax,%ax
c0101059:	66 90                	xchg   %ax,%ax
c010105b:	66 90                	xchg   %ax,%ax
c010105d:	66 90                	xchg   %ax,%ax
c010105f:	90                   	nop

c0101060 <sbrk>:
c0101060:	55                   	push   %ebp
c0101061:	89 e5                	mov    %esp,%ebp
c0101063:	83 ec 08             	sub    $0x8,%esp
c0101066:	68 1e 84 10 c0       	push   $0xc010841e
c010106b:	6a 08                	push   $0x8
c010106d:	68 08 84 10 c0       	push   $0xc0108408
c0101072:	68 74 81 10 c0       	push   $0xc0108174
c0101077:	e8 14 00 00 00       	call   c0101090 <printk>
c010107c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101081:	d6                   	(bad)  
c0101082:	30 c0                	xor    %al,%al
c0101084:	c9                   	leave  
c0101085:	c3                   	ret    
c0101086:	66 90                	xchg   %ax,%ax
c0101088:	66 90                	xchg   %ax,%ax
c010108a:	66 90                	xchg   %ax,%ax
c010108c:	66 90                	xchg   %ax,%ax
c010108e:	66 90                	xchg   %ax,%ax

c0101090 <printk>:
c0101090:	55                   	push   %ebp
c0101091:	89 e5                	mov    %esp,%ebp
c0101093:	56                   	push   %esi
c0101094:	53                   	push   %ebx
c0101095:	8d 45 0c             	lea    0xc(%ebp),%eax
c0101098:	50                   	push   %eax
c0101099:	ff 75 08             	pushl  0x8(%ebp)
c010109c:	68 00 01 00 00       	push   $0x100
c01010a1:	68 00 20 15 c0       	push   $0xc0152000
c01010a6:	e8 b5 06 00 00       	call   c0101760 <vsnprintf>
c01010ab:	83 c4 10             	add    $0x10,%esp
c01010ae:	85 c0                	test   %eax,%eax
c01010b0:	89 c6                	mov    %eax,%esi
c01010b2:	7e 26                	jle    c01010da <printk+0x4a>
c01010b4:	31 db                	xor    %ebx,%ebx
c01010b6:	8d 76 00             	lea    0x0(%esi),%esi
c01010b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01010c0:	0f be 93 00 20 15 c0 	movsbl -0x3feae000(%ebx),%edx
c01010c7:	83 ec 0c             	sub    $0xc,%esp
c01010ca:	83 c3 01             	add    $0x1,%ebx
c01010cd:	52                   	push   %edx
c01010ce:	e8 5d 00 00 00       	call   c0101130 <serial_printc>
c01010d3:	83 c4 10             	add    $0x10,%esp
c01010d6:	39 f3                	cmp    %esi,%ebx
c01010d8:	75 e6                	jne    c01010c0 <printk+0x30>
c01010da:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01010dd:	5b                   	pop    %ebx
c01010de:	5e                   	pop    %esi
c01010df:	5d                   	pop    %ebp
c01010e0:	c3                   	ret    
c01010e1:	66 90                	xchg   %ax,%ax
c01010e3:	66 90                	xchg   %ax,%ax
c01010e5:	66 90                	xchg   %ax,%ax
c01010e7:	66 90                	xchg   %ax,%ax
c01010e9:	66 90                	xchg   %ax,%ax
c01010eb:	66 90                	xchg   %ax,%ax
c01010ed:	66 90                	xchg   %ax,%ax
c01010ef:	90                   	nop

c01010f0 <init_serial>:
c01010f0:	55                   	push   %ebp
c01010f1:	ba f9 03 00 00       	mov    $0x3f9,%edx
c01010f6:	31 c0                	xor    %eax,%eax
c01010f8:	89 e5                	mov    %esp,%ebp
c01010fa:	ee                   	out    %al,(%dx)
c01010fb:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0101100:	b2 fb                	mov    $0xfb,%dl
c0101102:	ee                   	out    %al,(%dx)
c0101103:	b8 01 00 00 00       	mov    $0x1,%eax
c0101108:	b2 f8                	mov    $0xf8,%dl
c010110a:	ee                   	out    %al,(%dx)
c010110b:	31 c0                	xor    %eax,%eax
c010110d:	b2 f9                	mov    $0xf9,%dl
c010110f:	ee                   	out    %al,(%dx)
c0101110:	b8 03 00 00 00       	mov    $0x3,%eax
c0101115:	b2 fb                	mov    $0xfb,%dl
c0101117:	ee                   	out    %al,(%dx)
c0101118:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c010111d:	b2 fa                	mov    $0xfa,%dl
c010111f:	ee                   	out    %al,(%dx)
c0101120:	b8 0b 00 00 00       	mov    $0xb,%eax
c0101125:	b2 fc                	mov    $0xfc,%dl
c0101127:	ee                   	out    %al,(%dx)
c0101128:	5d                   	pop    %ebp
c0101129:	c3                   	ret    
c010112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101130 <serial_printc>:
c0101130:	55                   	push   %ebp
c0101131:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0101136:	89 e5                	mov    %esp,%ebp
c0101138:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010113b:	90                   	nop
c010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101140:	ec                   	in     (%dx),%al
c0101141:	a8 20                	test   $0x20,%al
c0101143:	74 fb                	je     c0101140 <serial_printc+0x10>
c0101145:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010114a:	89 c8                	mov    %ecx,%eax
c010114c:	ee                   	out    %al,(%dx)
c010114d:	5d                   	pop    %ebp
c010114e:	c3                   	ret    
c010114f:	90                   	nop

c0101150 <ramdisk_read>:
c0101150:	55                   	push   %ebp
c0101151:	89 e5                	mov    %esp,%ebp
c0101153:	53                   	push   %ebx
c0101154:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101157:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010115a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010115d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101160:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101165:	76 06                	jbe    c010116d <ramdisk_read+0x1d>
c0101167:	b8 01 00 00 00       	mov    $0x1,%eax
c010116c:	d6                   	(bad)  
c010116d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0101170:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101173:	89 55 0c             	mov    %edx,0xc(%ebp)
c0101176:	5b                   	pop    %ebx
c0101177:	5d                   	pop    %ebp
c0101178:	e9 13 04 00 00       	jmp    c0101590 <memcpy>
c010117d:	8d 76 00             	lea    0x0(%esi),%esi

c0101180 <ramdisk_write>:
c0101180:	55                   	push   %ebp
c0101181:	89 e5                	mov    %esp,%ebp
c0101183:	53                   	push   %ebx
c0101184:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101187:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010118a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010118d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101190:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101195:	76 06                	jbe    c010119d <ramdisk_write+0x1d>
c0101197:	b8 01 00 00 00       	mov    $0x1,%eax
c010119c:	d6                   	(bad)  
c010119d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01011a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01011a3:	89 55 08             	mov    %edx,0x8(%ebp)
c01011a6:	5b                   	pop    %ebx
c01011a7:	5d                   	pop    %ebp
c01011a8:	e9 e3 03 00 00       	jmp    c0101590 <memcpy>
c01011ad:	66 90                	xchg   %ax,%ax
c01011af:	90                   	nop

c01011b0 <ide_intr>:
c01011b0:	55                   	push   %ebp
c01011b1:	c7 05 04 21 15 c0 01 	movl   $0x1,0xc0152104
c01011b8:	00 00 00 
c01011bb:	89 e5                	mov    %esp,%ebp
c01011bd:	5d                   	pop    %ebp
c01011be:	c3                   	ret    
c01011bf:	90                   	nop

c01011c0 <ide_writeback>:
c01011c0:	a1 00 21 15 c0       	mov    0xc0152100,%eax
c01011c5:	83 c0 01             	add    $0x1,%eax
c01011c8:	83 f8 64             	cmp    $0x64,%eax
c01011cb:	a3 00 21 15 c0       	mov    %eax,0xc0152100
c01011d0:	74 06                	je     c01011d8 <ide_writeback+0x18>
c01011d2:	c3                   	ret    
c01011d3:	90                   	nop
c01011d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01011d8:	55                   	push   %ebp
c01011d9:	89 e5                	mov    %esp,%ebp
c01011db:	83 ec 08             	sub    $0x8,%esp
c01011de:	e8 dd 01 00 00       	call   c01013c0 <buf_writeback>
c01011e3:	c7 05 00 21 15 c0 00 	movl   $0x0,0xc0152100
c01011ea:	00 00 00 
c01011ed:	c9                   	leave  
c01011ee:	c3                   	ret    
c01011ef:	90                   	nop

c01011f0 <ide_read>:
c01011f0:	55                   	push   %ebp
c01011f1:	89 e5                	mov    %esp,%ebp
c01011f3:	57                   	push   %edi
c01011f4:	56                   	push   %esi
c01011f5:	53                   	push   %ebx
c01011f6:	83 ec 0c             	sub    $0xc,%esp
c01011f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01011fc:	8b 45 10             	mov    0x10(%ebp),%eax
c01011ff:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101202:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101205:	29 df                	sub    %ebx,%edi
c0101207:	85 c0                	test   %eax,%eax
c0101209:	74 1b                	je     c0101226 <ide_read+0x36>
c010120b:	90                   	nop
c010120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101210:	83 ec 0c             	sub    $0xc,%esp
c0101213:	53                   	push   %ebx
c0101214:	e8 07 02 00 00       	call   c0101420 <read_byte>
c0101219:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010121c:	83 c3 01             	add    $0x1,%ebx
c010121f:	83 c4 10             	add    $0x10,%esp
c0101222:	39 f3                	cmp    %esi,%ebx
c0101224:	75 ea                	jne    c0101210 <ide_read+0x20>
c0101226:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101229:	5b                   	pop    %ebx
c010122a:	5e                   	pop    %esi
c010122b:	5f                   	pop    %edi
c010122c:	5d                   	pop    %ebp
c010122d:	c3                   	ret    
c010122e:	66 90                	xchg   %ax,%ax

c0101230 <ide_write>:
c0101230:	55                   	push   %ebp
c0101231:	89 e5                	mov    %esp,%ebp
c0101233:	57                   	push   %edi
c0101234:	56                   	push   %esi
c0101235:	53                   	push   %ebx
c0101236:	83 ec 0c             	sub    $0xc,%esp
c0101239:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010123c:	8b 45 10             	mov    0x10(%ebp),%eax
c010123f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101242:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101245:	29 df                	sub    %ebx,%edi
c0101247:	85 c0                	test   %eax,%eax
c0101249:	74 1d                	je     c0101268 <ide_write+0x38>
c010124b:	90                   	nop
c010124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101250:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101254:	83 ec 08             	sub    $0x8,%esp
c0101257:	50                   	push   %eax
c0101258:	53                   	push   %ebx
c0101259:	83 c3 01             	add    $0x1,%ebx
c010125c:	e8 ef 01 00 00       	call   c0101450 <write_byte>
c0101261:	83 c4 10             	add    $0x10,%esp
c0101264:	39 f3                	cmp    %esi,%ebx
c0101266:	75 e8                	jne    c0101250 <ide_write+0x20>
c0101268:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010126b:	5b                   	pop    %ebx
c010126c:	5e                   	pop    %esi
c010126d:	5f                   	pop    %edi
c010126e:	5d                   	pop    %ebp
c010126f:	c3                   	ret    

c0101270 <clear_ide_intr>:
c0101270:	55                   	push   %ebp
c0101271:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101278:	00 00 00 
c010127b:	89 e5                	mov    %esp,%ebp
c010127d:	5d                   	pop    %ebp
c010127e:	c3                   	ret    
c010127f:	90                   	nop

c0101280 <wait_ide_intr>:
c0101280:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101285:	55                   	push   %ebp
c0101286:	89 e5                	mov    %esp,%ebp
c0101288:	85 c0                	test   %eax,%eax
c010128a:	75 0e                	jne    c010129a <wait_ide_intr+0x1a>
c010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101290:	f4                   	hlt    
c0101291:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101296:	85 c0                	test   %eax,%eax
c0101298:	74 f6                	je     c0101290 <wait_ide_intr+0x10>
c010129a:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c01012a1:	00 00 00 
c01012a4:	5d                   	pop    %ebp
c01012a5:	c3                   	ret    
c01012a6:	8d 76 00             	lea    0x0(%esi),%esi
c01012a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01012b0 <init_ide>:
c01012b0:	55                   	push   %ebp
c01012b1:	89 e5                	mov    %esp,%ebp
c01012b3:	83 ec 08             	sub    $0x8,%esp
c01012b6:	e8 d5 00 00 00       	call   c0101390 <buf_init>
c01012bb:	83 ec 08             	sub    $0x8,%esp
c01012be:	68 c0 11 10 c0       	push   $0xc01011c0
c01012c3:	6a 00                	push   $0x0
c01012c5:	e8 96 f3 ff ff       	call   c0100660 <add_irq_handle>
c01012ca:	58                   	pop    %eax
c01012cb:	5a                   	pop    %edx
c01012cc:	68 b0 11 10 c0       	push   $0xc01011b0
c01012d1:	6a 0e                	push   $0xe
c01012d3:	e8 88 f3 ff ff       	call   c0100660 <add_irq_handle>
c01012d8:	83 c4 10             	add    $0x10,%esp
c01012db:	c9                   	leave  
c01012dc:	c3                   	ret    
c01012dd:	66 90                	xchg   %ax,%ax
c01012df:	90                   	nop

c01012e0 <buf_fetch>:
c01012e0:	55                   	push   %ebp
c01012e1:	89 c2                	mov    %eax,%edx
c01012e3:	89 e5                	mov    %esp,%ebp
c01012e5:	57                   	push   %edi
c01012e6:	56                   	push   %esi
c01012e7:	53                   	push   %ebx
c01012e8:	89 c3                	mov    %eax,%ebx
c01012ea:	83 e3 7f             	and    $0x7f,%ebx
c01012ed:	89 d8                	mov    %ebx,%eax
c01012ef:	83 ec 1c             	sub    $0x1c,%esp
c01012f2:	c1 e0 09             	shl    $0x9,%eax
c01012f5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c01012f8:	8d 81 40 21 15 c0    	lea    -0x3feadec0(%ecx),%eax
c01012fe:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101302:	74 5c                	je     c0101360 <buf_fetch+0x80>
c0101304:	89 d7                	mov    %edx,%edi
c0101306:	89 da                	mov    %ebx,%edx
c0101308:	c1 e2 09             	shl    $0x9,%edx
c010130b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010130e:	8d 91 40 21 15 c0    	lea    -0x3feadec0(%ecx),%edx
c0101314:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010131a:	74 54                	je     c0101370 <buf_fetch+0x90>
c010131c:	8d 72 06             	lea    0x6(%edx),%esi
c010131f:	83 ec 08             	sub    $0x8,%esp
c0101322:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101325:	57                   	push   %edi
c0101326:	56                   	push   %esi
c0101327:	e8 a4 01 00 00       	call   c01014d0 <disk_do_read>
c010132c:	89 da                	mov    %ebx,%edx
c010132e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101331:	83 c4 10             	add    $0x10,%esp
c0101334:	c1 e2 09             	shl    $0x9,%edx
c0101337:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010133a:	c6 81 44 21 15 c0 01 	movb   $0x1,-0x3feadebc(%ecx)
c0101341:	89 b9 40 21 15 c0    	mov    %edi,-0x3feadec0(%ecx)
c0101347:	c6 81 45 21 15 c0 00 	movb   $0x0,-0x3feadebb(%ecx)
c010134e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101351:	5b                   	pop    %ebx
c0101352:	5e                   	pop    %esi
c0101353:	5f                   	pop    %edi
c0101354:	5d                   	pop    %ebp
c0101355:	c3                   	ret    
c0101356:	8d 76 00             	lea    0x0(%esi),%esi
c0101359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101360:	39 91 40 21 15 c0    	cmp    %edx,-0x3feadec0(%ecx)
c0101366:	75 9c                	jne    c0101304 <buf_fetch+0x24>
c0101368:	eb e4                	jmp    c010134e <buf_fetch+0x6e>
c010136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101370:	8d 72 06             	lea    0x6(%edx),%esi
c0101373:	83 ec 08             	sub    $0x8,%esp
c0101376:	ff b1 40 21 15 c0    	pushl  -0x3feadec0(%ecx)
c010137c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010137f:	56                   	push   %esi
c0101380:	e8 8b 01 00 00       	call   c0101510 <disk_do_write>
c0101385:	83 c4 10             	add    $0x10,%esp
c0101388:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010138b:	eb 92                	jmp    c010131f <buf_fetch+0x3f>
c010138d:	8d 76 00             	lea    0x0(%esi),%esi

c0101390 <buf_init>:
c0101390:	55                   	push   %ebp
c0101391:	b8 44 21 15 c0       	mov    $0xc0152144,%eax
c0101396:	89 e5                	mov    %esp,%ebp
c0101398:	90                   	nop
c0101399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01013a0:	c6 00 00             	movb   $0x0,(%eax)
c01013a3:	05 08 02 00 00       	add    $0x208,%eax
c01013a8:	3d 44 25 16 c0       	cmp    $0xc0162544,%eax
c01013ad:	75 f1                	jne    c01013a0 <buf_init+0x10>
c01013af:	5d                   	pop    %ebp
c01013b0:	c3                   	ret    
c01013b1:	eb 0d                	jmp    c01013c0 <buf_writeback>
c01013b3:	90                   	nop
c01013b4:	90                   	nop
c01013b5:	90                   	nop
c01013b6:	90                   	nop
c01013b7:	90                   	nop
c01013b8:	90                   	nop
c01013b9:	90                   	nop
c01013ba:	90                   	nop
c01013bb:	90                   	nop
c01013bc:	90                   	nop
c01013bd:	90                   	nop
c01013be:	90                   	nop
c01013bf:	90                   	nop

c01013c0 <buf_writeback>:
c01013c0:	55                   	push   %ebp
c01013c1:	89 e5                	mov    %esp,%ebp
c01013c3:	53                   	push   %ebx
c01013c4:	bb 46 21 15 c0       	mov    $0xc0152146,%ebx
c01013c9:	83 ec 04             	sub    $0x4,%esp
c01013cc:	eb 10                	jmp    c01013de <buf_writeback+0x1e>
c01013ce:	66 90                	xchg   %ax,%ax
c01013d0:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01013d6:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c01013dc:	74 32                	je     c0101410 <buf_writeback+0x50>
c01013de:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01013e2:	75 ec                	jne    c01013d0 <buf_writeback+0x10>
c01013e4:	83 ec 08             	sub    $0x8,%esp
c01013e7:	ff 73 fa             	pushl  -0x6(%ebx)
c01013ea:	53                   	push   %ebx
c01013eb:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01013f1:	e8 1a 01 00 00       	call   c0101510 <disk_do_write>
c01013f6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c01013fd:	83 c4 10             	add    $0x10,%esp
c0101400:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c0101406:	75 d6                	jne    c01013de <buf_writeback+0x1e>
c0101408:	90                   	nop
c0101409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101410:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101413:	c9                   	leave  
c0101414:	c3                   	ret    
c0101415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101420 <read_byte>:
c0101420:	55                   	push   %ebp
c0101421:	89 e5                	mov    %esp,%ebp
c0101423:	53                   	push   %ebx
c0101424:	83 ec 04             	sub    $0x4,%esp
c0101427:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010142a:	89 d8                	mov    %ebx,%eax
c010142c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101432:	c1 e8 09             	shr    $0x9,%eax
c0101435:	e8 a6 fe ff ff       	call   c01012e0 <buf_fetch>
c010143a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010143f:	83 c4 04             	add    $0x4,%esp
c0101442:	5b                   	pop    %ebx
c0101443:	5d                   	pop    %ebp
c0101444:	c3                   	ret    
c0101445:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101450 <write_byte>:
c0101450:	55                   	push   %ebp
c0101451:	89 e5                	mov    %esp,%ebp
c0101453:	56                   	push   %esi
c0101454:	53                   	push   %ebx
c0101455:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101458:	8b 75 0c             	mov    0xc(%ebp),%esi
c010145b:	89 d8                	mov    %ebx,%eax
c010145d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101463:	c1 e8 09             	shr    $0x9,%eax
c0101466:	e8 75 fe ff ff       	call   c01012e0 <buf_fetch>
c010146b:	89 f2                	mov    %esi,%edx
c010146d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101471:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101475:	5b                   	pop    %ebx
c0101476:	5e                   	pop    %esi
c0101477:	5d                   	pop    %ebp
c0101478:	c3                   	ret    
c0101479:	66 90                	xchg   %ax,%ax
c010147b:	66 90                	xchg   %ax,%ax
c010147d:	66 90                	xchg   %ax,%ax
c010147f:	90                   	nop

c0101480 <ide_prepare>:
c0101480:	55                   	push   %ebp
c0101481:	89 c1                	mov    %eax,%ecx
c0101483:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101488:	89 e5                	mov    %esp,%ebp
c010148a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101490:	ec                   	in     (%dx),%al
c0101491:	83 e0 c0             	and    $0xffffffc0,%eax
c0101494:	3c 40                	cmp    $0x40,%al
c0101496:	75 f8                	jne    c0101490 <ide_prepare+0x10>
c0101498:	ba f1 01 00 00       	mov    $0x1f1,%edx
c010149d:	31 c0                	xor    %eax,%eax
c010149f:	ee                   	out    %al,(%dx)
c01014a0:	b8 01 00 00 00       	mov    $0x1,%eax
c01014a5:	b2 f2                	mov    $0xf2,%dl
c01014a7:	ee                   	out    %al,(%dx)
c01014a8:	b2 f3                	mov    $0xf3,%dl
c01014aa:	89 c8                	mov    %ecx,%eax
c01014ac:	ee                   	out    %al,(%dx)
c01014ad:	89 c8                	mov    %ecx,%eax
c01014af:	b2 f4                	mov    $0xf4,%dl
c01014b1:	c1 e8 08             	shr    $0x8,%eax
c01014b4:	ee                   	out    %al,(%dx)
c01014b5:	89 c8                	mov    %ecx,%eax
c01014b7:	b2 f5                	mov    $0xf5,%dl
c01014b9:	c1 e8 10             	shr    $0x10,%eax
c01014bc:	ee                   	out    %al,(%dx)
c01014bd:	89 c8                	mov    %ecx,%eax
c01014bf:	b2 f6                	mov    $0xf6,%dl
c01014c1:	c1 e8 18             	shr    $0x18,%eax
c01014c4:	83 c8 e0             	or     $0xffffffe0,%eax
c01014c7:	ee                   	out    %al,(%dx)
c01014c8:	5d                   	pop    %ebp
c01014c9:	c3                   	ret    
c01014ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01014d0 <disk_do_read>:
c01014d0:	55                   	push   %ebp
c01014d1:	89 e5                	mov    %esp,%ebp
c01014d3:	53                   	push   %ebx
c01014d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014d7:	e8 a4 ff ff ff       	call   c0101480 <ide_prepare>
c01014dc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01014e1:	b8 20 00 00 00       	mov    $0x20,%eax
c01014e6:	ee                   	out    %al,(%dx)
c01014e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014ea:	b2 f0                	mov    $0xf0,%dl
c01014ec:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01014f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01014f8:	ed                   	in     (%dx),%eax
c01014f9:	89 01                	mov    %eax,(%ecx)
c01014fb:	83 c1 04             	add    $0x4,%ecx
c01014fe:	39 d9                	cmp    %ebx,%ecx
c0101500:	75 f6                	jne    c01014f8 <disk_do_read+0x28>
c0101502:	5b                   	pop    %ebx
c0101503:	5d                   	pop    %ebp
c0101504:	c3                   	ret    
c0101505:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101510 <disk_do_write>:
c0101510:	55                   	push   %ebp
c0101511:	89 e5                	mov    %esp,%ebp
c0101513:	53                   	push   %ebx
c0101514:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101517:	e8 64 ff ff ff       	call   c0101480 <ide_prepare>
c010151c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101521:	b8 30 00 00 00       	mov    $0x30,%eax
c0101526:	ee                   	out    %al,(%dx)
c0101527:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010152a:	b2 f0                	mov    $0xf0,%dl
c010152c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101538:	8b 01                	mov    (%ecx),%eax
c010153a:	ef                   	out    %eax,(%dx)
c010153b:	83 c1 04             	add    $0x4,%ecx
c010153e:	39 d9                	cmp    %ebx,%ecx
c0101540:	75 f6                	jne    c0101538 <disk_do_write+0x28>
c0101542:	5b                   	pop    %ebx
c0101543:	5d                   	pop    %ebp
c0101544:	c3                   	ret    
c0101545:	66 90                	xchg   %ax,%ax
c0101547:	66 90                	xchg   %ax,%ax
c0101549:	66 90                	xchg   %ax,%ax
c010154b:	66 90                	xchg   %ax,%ax
c010154d:	66 90                	xchg   %ax,%ax
c010154f:	90                   	nop

c0101550 <dma_prepare>:
c0101550:	55                   	push   %ebp
c0101551:	89 e5                	mov    %esp,%ebp
c0101553:	83 ec 08             	sub    $0x8,%esp
c0101556:	68 8c 84 10 c0       	push   $0xc010848c
c010155b:	6a 1d                	push   $0x1d
c010155d:	68 23 84 10 c0       	push   $0xc0108423
c0101562:	68 40 84 10 c0       	push   $0xc0108440
c0101567:	e8 24 fb ff ff       	call   c0101090 <printk>
c010156c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101571:	d6                   	(bad)  
c0101572:	83 c4 10             	add    $0x10,%esp
c0101575:	c9                   	leave  
c0101576:	c3                   	ret    
c0101577:	89 f6                	mov    %esi,%esi
c0101579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101580 <dma_issue_read>:
c0101580:	55                   	push   %ebp
c0101581:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101586:	89 e5                	mov    %esp,%ebp
c0101588:	ec                   	in     (%dx),%al
c0101589:	83 c8 09             	or     $0x9,%eax
c010158c:	ee                   	out    %al,(%dx)
c010158d:	5d                   	pop    %ebp
c010158e:	c3                   	ret    
c010158f:	90                   	nop

c0101590 <memcpy>:
c0101590:	55                   	push   %ebp
c0101591:	89 e5                	mov    %esp,%ebp
c0101593:	56                   	push   %esi
c0101594:	57                   	push   %edi
c0101595:	53                   	push   %ebx
c0101596:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101599:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010159c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010159f:	fc                   	cld    
c01015a0:	83 f9 08             	cmp    $0x8,%ecx
c01015a3:	76 26                	jbe    c01015cb <memcpy+0x3b>
c01015a5:	89 fa                	mov    %edi,%edx
c01015a7:	89 cb                	mov    %ecx,%ebx
c01015a9:	83 e2 03             	and    $0x3,%edx
c01015ac:	74 10                	je     c01015be <memcpy+0x2e>
c01015ae:	b9 04 00 00 00       	mov    $0x4,%ecx
c01015b3:	29 d1                	sub    %edx,%ecx
c01015b5:	83 e1 03             	and    $0x3,%ecx
c01015b8:	29 cb                	sub    %ecx,%ebx
c01015ba:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01015bc:	89 d9                	mov    %ebx,%ecx
c01015be:	c1 e9 02             	shr    $0x2,%ecx
c01015c1:	8d 76 00             	lea    0x0(%esi),%esi
c01015c4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01015c6:	89 d9                	mov    %ebx,%ecx
c01015c8:	83 e1 03             	and    $0x3,%ecx
c01015cb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01015cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01015d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01015d3:	5b                   	pop    %ebx
c01015d4:	5f                   	pop    %edi
c01015d5:	5e                   	pop    %esi
c01015d6:	c9                   	leave  
c01015d7:	c3                   	ret    

c01015d8 <memset>:
c01015d8:	55                   	push   %ebp
c01015d9:	89 e5                	mov    %esp,%ebp
c01015db:	57                   	push   %edi
c01015dc:	8b 7d 08             	mov    0x8(%ebp),%edi
c01015df:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01015e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01015e6:	fc                   	cld    
c01015e7:	83 f9 10             	cmp    $0x10,%ecx
c01015ea:	76 69                	jbe    c0101655 <memset+0x7d>
c01015ec:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01015f2:	74 4c                	je     c0101640 <memset+0x68>
c01015f4:	88 07                	mov    %al,(%edi)
c01015f6:	47                   	inc    %edi
c01015f7:	49                   	dec    %ecx
c01015f8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01015fe:	74 40                	je     c0101640 <memset+0x68>
c0101600:	88 07                	mov    %al,(%edi)
c0101602:	47                   	inc    %edi
c0101603:	49                   	dec    %ecx
c0101604:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010160a:	74 34                	je     c0101640 <memset+0x68>
c010160c:	88 07                	mov    %al,(%edi)
c010160e:	47                   	inc    %edi
c010160f:	49                   	dec    %ecx
c0101610:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101616:	74 28                	je     c0101640 <memset+0x68>
c0101618:	88 07                	mov    %al,(%edi)
c010161a:	47                   	inc    %edi
c010161b:	49                   	dec    %ecx
c010161c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101622:	74 1c                	je     c0101640 <memset+0x68>
c0101624:	88 07                	mov    %al,(%edi)
c0101626:	47                   	inc    %edi
c0101627:	49                   	dec    %ecx
c0101628:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010162e:	74 10                	je     c0101640 <memset+0x68>
c0101630:	88 07                	mov    %al,(%edi)
c0101632:	47                   	inc    %edi
c0101633:	49                   	dec    %ecx
c0101634:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010163a:	74 04                	je     c0101640 <memset+0x68>
c010163c:	88 07                	mov    %al,(%edi)
c010163e:	47                   	inc    %edi
c010163f:	49                   	dec    %ecx
c0101640:	88 c4                	mov    %al,%ah
c0101642:	89 c2                	mov    %eax,%edx
c0101644:	c1 e2 10             	shl    $0x10,%edx
c0101647:	09 d0                	or     %edx,%eax
c0101649:	89 ca                	mov    %ecx,%edx
c010164b:	c1 e9 02             	shr    $0x2,%ecx
c010164e:	83 e2 03             	and    $0x3,%edx
c0101651:	f3 ab                	rep stos %eax,%es:(%edi)
c0101653:	89 d1                	mov    %edx,%ecx
c0101655:	f3 aa                	rep stos %al,%es:(%edi)
c0101657:	8b 45 08             	mov    0x8(%ebp),%eax
c010165a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010165d:	5f                   	pop    %edi
c010165e:	c9                   	leave  
c010165f:	c3                   	ret    

c0101660 <strcmp>:
c0101660:	55                   	push   %ebp
c0101661:	89 e5                	mov    %esp,%ebp
c0101663:	8b 45 08             	mov    0x8(%ebp),%eax
c0101666:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101669:	53                   	push   %ebx
c010166a:	89 c1                	mov    %eax,%ecx
c010166c:	09 d1                	or     %edx,%ecx
c010166e:	83 e1 03             	and    $0x3,%ecx
c0101671:	75 17                	jne    c010168a <strcmp+0x2a>
c0101673:	8b 08                	mov    (%eax),%ecx
c0101675:	3b 0a                	cmp    (%edx),%ecx
c0101677:	74 33                	je     c01016ac <strcmp+0x4c>
c0101679:	eb 0f                	jmp    c010168a <strcmp+0x2a>
c010167b:	90                   	nop
c010167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101680:	3a 0a                	cmp    (%edx),%cl
c0101682:	75 0d                	jne    c0101691 <strcmp+0x31>
c0101684:	83 c0 01             	add    $0x1,%eax
c0101687:	83 c2 01             	add    $0x1,%edx
c010168a:	0f b6 08             	movzbl (%eax),%ecx
c010168d:	84 c9                	test   %cl,%cl
c010168f:	75 ef                	jne    c0101680 <strcmp+0x20>
c0101691:	0f b6 00             	movzbl (%eax),%eax
c0101694:	0f b6 12             	movzbl (%edx),%edx
c0101697:	5b                   	pop    %ebx
c0101698:	5d                   	pop    %ebp
c0101699:	29 d0                	sub    %edx,%eax
c010169b:	c3                   	ret    
c010169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01016a0:	83 c0 04             	add    $0x4,%eax
c01016a3:	83 c2 04             	add    $0x4,%edx
c01016a6:	8b 08                	mov    (%eax),%ecx
c01016a8:	3b 0a                	cmp    (%edx),%ecx
c01016aa:	75 de                	jne    c010168a <strcmp+0x2a>
c01016ac:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c01016b2:	f7 d1                	not    %ecx
c01016b4:	21 cb                	and    %ecx,%ebx
c01016b6:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c01016bc:	74 e2                	je     c01016a0 <strcmp+0x40>
c01016be:	31 c0                	xor    %eax,%eax
c01016c0:	5b                   	pop    %ebx
c01016c1:	5d                   	pop    %ebp
c01016c2:	c3                   	ret    
c01016c3:	66 90                	xchg   %ax,%ax
c01016c5:	66 90                	xchg   %ax,%ax
c01016c7:	66 90                	xchg   %ax,%ax
c01016c9:	66 90                	xchg   %ax,%ax
c01016cb:	66 90                	xchg   %ax,%ax
c01016cd:	66 90                	xchg   %ax,%ax
c01016cf:	90                   	nop

c01016d0 <_vsnprintf_r>:
c01016d0:	55                   	push   %ebp
c01016d1:	89 e5                	mov    %esp,%ebp
c01016d3:	56                   	push   %esi
c01016d4:	53                   	push   %ebx
c01016d5:	83 c4 80             	add    $0xffffff80,%esp
c01016d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01016db:	8b 75 08             	mov    0x8(%ebp),%esi
c01016de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01016e1:	85 db                	test   %ebx,%ebx
c01016e3:	78 63                	js     c0101748 <_vsnprintf_r+0x78>
c01016e5:	ba 08 02 00 00       	mov    $0x208,%edx
c01016ea:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c01016ef:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c01016f3:	8d 53 ff             	lea    -0x1(%ebx),%edx
c01016f6:	89 45 90             	mov    %eax,-0x70(%ebp)
c01016f9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01016fc:	31 c0                	xor    %eax,%eax
c01016fe:	85 db                	test   %ebx,%ebx
c0101700:	0f 45 c2             	cmovne %edx,%eax
c0101703:	89 45 98             	mov    %eax,-0x68(%ebp)
c0101706:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0101709:	8b 45 18             	mov    0x18(%ebp),%eax
c010170c:	89 34 24             	mov    %esi,(%esp)
c010170f:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c0101713:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101717:	8b 45 14             	mov    0x14(%ebp),%eax
c010171a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010171e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0101721:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101725:	e8 86 00 00 00       	call   c01017b0 <_svfprintf_r>
c010172a:	83 f8 ff             	cmp    $0xffffffff,%eax
c010172d:	7c 11                	jl     c0101740 <_vsnprintf_r+0x70>
c010172f:	85 db                	test   %ebx,%ebx
c0101731:	74 06                	je     c0101739 <_vsnprintf_r+0x69>
c0101733:	8b 55 90             	mov    -0x70(%ebp),%edx
c0101736:	c6 02 00             	movb   $0x0,(%edx)
c0101739:	83 ec 80             	sub    $0xffffff80,%esp
c010173c:	5b                   	pop    %ebx
c010173d:	5e                   	pop    %esi
c010173e:	5d                   	pop    %ebp
c010173f:	c3                   	ret    
c0101740:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101746:	eb e7                	jmp    c010172f <_vsnprintf_r+0x5f>
c0101748:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c010174e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101753:	eb e4                	jmp    c0101739 <_vsnprintf_r+0x69>
c0101755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101760 <vsnprintf>:
c0101760:	55                   	push   %ebp
c0101761:	89 e5                	mov    %esp,%ebp
c0101763:	83 ec 28             	sub    $0x28,%esp
c0101766:	e8 35 00 00 00       	call   c01017a0 <__getreent>
c010176b:	8b 55 14             	mov    0x14(%ebp),%edx
c010176e:	89 54 24 10          	mov    %edx,0x10(%esp)
c0101772:	8b 55 10             	mov    0x10(%ebp),%edx
c0101775:	89 04 24             	mov    %eax,(%esp)
c0101778:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010177c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010177f:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101783:	8b 55 08             	mov    0x8(%ebp),%edx
c0101786:	89 54 24 04          	mov    %edx,0x4(%esp)
c010178a:	e8 41 ff ff ff       	call   c01016d0 <_vsnprintf_r>
c010178f:	c9                   	leave  
c0101790:	c3                   	ret    
c0101791:	66 90                	xchg   %ax,%ax
c0101793:	66 90                	xchg   %ax,%ax
c0101795:	66 90                	xchg   %ax,%ax
c0101797:	66 90                	xchg   %ax,%ax
c0101799:	66 90                	xchg   %ax,%ax
c010179b:	66 90                	xchg   %ax,%ax
c010179d:	66 90                	xchg   %ax,%ax
c010179f:	90                   	nop

c01017a0 <__getreent>:
c01017a0:	55                   	push   %ebp
c01017a1:	a1 20 a0 10 c0       	mov    0xc010a020,%eax
c01017a6:	89 e5                	mov    %esp,%ebp
c01017a8:	5d                   	pop    %ebp
c01017a9:	c3                   	ret    
c01017aa:	66 90                	xchg   %ax,%ax
c01017ac:	66 90                	xchg   %ax,%ax
c01017ae:	66 90                	xchg   %ax,%ax

c01017b0 <_svfprintf_r>:
c01017b0:	55                   	push   %ebp
c01017b1:	89 e5                	mov    %esp,%ebp
c01017b3:	57                   	push   %edi
c01017b4:	56                   	push   %esi
c01017b5:	53                   	push   %ebx
c01017b6:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c01017bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01017bf:	89 04 24             	mov    %eax,(%esp)
c01017c2:	e8 89 33 00 00       	call   c0104b50 <_localeconv_r>
c01017c7:	8b 00                	mov    (%eax),%eax
c01017c9:	89 04 24             	mov    %eax,(%esp)
c01017cc:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c01017d2:	e8 69 4a 00 00       	call   c0106240 <strlen>
c01017d7:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c01017dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017e0:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c01017e4:	74 0b                	je     c01017f1 <_svfprintf_r+0x41>
c01017e6:	8b 40 10             	mov    0x10(%eax),%eax
c01017e9:	85 c0                	test   %eax,%eax
c01017eb:	0f 84 62 18 00 00    	je     c0103053 <_svfprintf_r+0x18a3>
c01017f1:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01017f4:	8d 55 a7             	lea    -0x59(%ebp),%edx
c01017f7:	89 c7                	mov    %eax,%edi
c01017f9:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01017ff:	90                   	nop
c0101800:	90                   	nop
c0101801:	29 d0                	sub    %edx,%eax
c0101803:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c010180a:	00 00 00 
c010180d:	90                   	nop
c010180e:	90                   	nop
c010180f:	90                   	nop
c0101810:	90                   	nop
c0101811:	90                   	nop
c0101812:	90                   	nop
c0101813:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c010181a:	00 00 00 
c010181d:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c0101824:	00 00 00 
c0101827:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c010182e:	00 00 00 
c0101831:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c0101838:	00 00 00 
c010183b:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c0101842:	00 00 00 
c0101845:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c010184b:	8b 45 10             	mov    0x10(%ebp),%eax
c010184e:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101851:	0f b6 00             	movzbl (%eax),%eax
c0101854:	3c 25                	cmp    $0x25,%al
c0101856:	74 4d                	je     c01018a5 <_svfprintf_r+0xf5>
c0101858:	84 c0                	test   %al,%al
c010185a:	75 08                	jne    c0101864 <_svfprintf_r+0xb4>
c010185c:	eb 47                	jmp    c01018a5 <_svfprintf_r+0xf5>
c010185e:	66 90                	xchg   %ax,%ax
c0101860:	84 c0                	test   %al,%al
c0101862:	74 0a                	je     c010186e <_svfprintf_r+0xbe>
c0101864:	83 c3 01             	add    $0x1,%ebx
c0101867:	0f b6 03             	movzbl (%ebx),%eax
c010186a:	3c 25                	cmp    $0x25,%al
c010186c:	75 f2                	jne    c0101860 <_svfprintf_r+0xb0>
c010186e:	89 de                	mov    %ebx,%esi
c0101870:	2b 75 10             	sub    0x10(%ebp),%esi
c0101873:	74 30                	je     c01018a5 <_svfprintf_r+0xf5>
c0101875:	8b 45 10             	mov    0x10(%ebp),%eax
c0101878:	83 c7 08             	add    $0x8,%edi
c010187b:	89 77 fc             	mov    %esi,-0x4(%edi)
c010187e:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c0101884:	89 47 f8             	mov    %eax,-0x8(%edi)
c0101887:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010188d:	83 c0 01             	add    $0x1,%eax
c0101890:	83 f8 07             	cmp    $0x7,%eax
c0101893:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101899:	0f 8f 91 00 00 00    	jg     c0101930 <_svfprintf_r+0x180>
c010189f:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c01018a5:	80 3b 00             	cmpb   $0x0,(%ebx)
c01018a8:	0f 84 aa 00 00 00    	je     c0101958 <_svfprintf_r+0x1a8>
c01018ae:	8d 43 01             	lea    0x1(%ebx),%eax
c01018b1:	be 20 00 00 00       	mov    $0x20,%esi
c01018b6:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01018bd:	31 db                	xor    %ebx,%ebx
c01018bf:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c01018c6:	ff ff ff 
c01018c9:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c01018d0:	00 00 00 
c01018d3:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c01018da:	00 00 00 
c01018dd:	8d 48 01             	lea    0x1(%eax),%ecx
c01018e0:	0f be 00             	movsbl (%eax),%eax
c01018e3:	8d 50 e0             	lea    -0x20(%eax),%edx
c01018e6:	83 fa 58             	cmp    $0x58,%edx
c01018e9:	0f 87 8f 07 00 00    	ja     c010207e <_svfprintf_r+0x8ce>
c01018ef:	ff 24 95 dc 84 10 c0 	jmp    *-0x3fef7b24(,%edx,4)
c01018f6:	66 90                	xchg   %ax,%ax
c01018f8:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c01018ff:	89 c8                	mov    %ecx,%eax
c0101901:	eb da                	jmp    c01018dd <_svfprintf_r+0x12d>
c0101903:	8b 45 14             	mov    0x14(%ebp),%eax
c0101906:	8b 55 14             	mov    0x14(%ebp),%edx
c0101909:	8b 00                	mov    (%eax),%eax
c010190b:	83 c2 04             	add    $0x4,%edx
c010190e:	89 55 14             	mov    %edx,0x14(%ebp)
c0101911:	85 c0                	test   %eax,%eax
c0101913:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c0101919:	79 e4                	jns    c01018ff <_svfprintf_r+0x14f>
c010191b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c0101921:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c0101928:	89 c8                	mov    %ecx,%eax
c010192a:	eb b1                	jmp    c01018dd <_svfprintf_r+0x12d>
c010192c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101930:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101936:	89 44 24 08          	mov    %eax,0x8(%esp)
c010193a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010193d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101941:	8b 45 08             	mov    0x8(%ebp),%eax
c0101944:	89 04 24             	mov    %eax,(%esp)
c0101947:	e8 74 49 00 00       	call   c01062c0 <__ssprint_r>
c010194c:	85 c0                	test   %eax,%eax
c010194e:	75 30                	jne    c0101980 <_svfprintf_r+0x1d0>
c0101950:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101953:	e9 47 ff ff ff       	jmp    c010189f <_svfprintf_r+0xef>
c0101958:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010195e:	85 c0                	test   %eax,%eax
c0101960:	74 1e                	je     c0101980 <_svfprintf_r+0x1d0>
c0101962:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101968:	89 44 24 08          	mov    %eax,0x8(%esp)
c010196c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010196f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101973:	8b 45 08             	mov    0x8(%ebp),%eax
c0101976:	89 04 24             	mov    %eax,(%esp)
c0101979:	e8 42 49 00 00       	call   c01062c0 <__ssprint_r>
c010197e:	66 90                	xchg   %ax,%ax
c0101980:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101983:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101988:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c010198c:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c0101993:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c0101999:	5b                   	pop    %ebx
c010199a:	5e                   	pop    %esi
c010199b:	5f                   	pop    %edi
c010199c:	5d                   	pop    %ebp
c010199d:	c3                   	ret    
c010199e:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c01019a3:	89 c8                	mov    %ecx,%eax
c01019a5:	e9 33 ff ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c01019aa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01019b0:	8b 45 14             	mov    0x14(%ebp),%eax
c01019b3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01019b6:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01019bd:	8d 70 04             	lea    0x4(%eax),%esi
c01019c0:	8b 00                	mov    (%eax),%eax
c01019c2:	85 c0                	test   %eax,%eax
c01019c4:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01019ca:	0f 84 7f 18 00 00    	je     c010324f <_svfprintf_r+0x1a9f>
c01019d0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01019d6:	85 c0                	test   %eax,%eax
c01019d8:	0f 88 b6 17 00 00    	js     c0103194 <_svfprintf_r+0x19e4>
c01019de:	89 44 24 08          	mov    %eax,0x8(%esp)
c01019e2:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01019e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01019ef:	00 
c01019f0:	89 04 24             	mov    %eax,(%esp)
c01019f3:	e8 f8 38 00 00       	call   c01052f0 <memchr>
c01019f8:	85 c0                	test   %eax,%eax
c01019fa:	0f 84 a0 19 00 00    	je     c01033a0 <_svfprintf_r+0x1bf0>
c0101a00:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101a06:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0101a0c:	39 d0                	cmp    %edx,%eax
c0101a0e:	0f 4f c2             	cmovg  %edx,%eax
c0101a11:	89 c2                	mov    %eax,%edx
c0101a13:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101a1a:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0101a20:	31 c0                	xor    %eax,%eax
c0101a22:	85 d2                	test   %edx,%edx
c0101a24:	0f 49 c2             	cmovns %edx,%eax
c0101a27:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101a2d:	89 75 14             	mov    %esi,0x14(%ebp)
c0101a30:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101a37:	00 00 00 
c0101a3a:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101a41:	00 00 00 
c0101a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101a48:	84 db                	test   %bl,%bl
c0101a4a:	74 07                	je     c0101a53 <_svfprintf_r+0x2a3>
c0101a4c:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c0101a53:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101a59:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c0101a5f:	89 c8                	mov    %ecx,%eax
c0101a61:	89 f2                	mov    %esi,%edx
c0101a63:	83 c0 02             	add    $0x2,%eax
c0101a66:	83 e2 02             	and    $0x2,%edx
c0101a69:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c0101a6f:	89 f2                	mov    %esi,%edx
c0101a71:	0f 44 c1             	cmove  %ecx,%eax
c0101a74:	81 e2 84 00 00 00    	and    $0x84,%edx
c0101a7a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101a80:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c0101a86:	0f 85 1c 06 00 00    	jne    c01020a8 <_svfprintf_r+0x8f8>
c0101a8c:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0101a92:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0101a98:	85 f6                	test   %esi,%esi
c0101a9a:	0f 8e 08 06 00 00    	jle    c01020a8 <_svfprintf_r+0x8f8>
c0101aa0:	83 fe 10             	cmp    $0x10,%esi
c0101aa3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101aa9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101aaf:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101ab5:	7f 11                	jg     c0101ac8 <_svfprintf_r+0x318>
c0101ab7:	eb 6b                	jmp    c0101b24 <_svfprintf_r+0x374>
c0101ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101ac0:	83 ee 10             	sub    $0x10,%esi
c0101ac3:	83 fe 10             	cmp    $0x10,%esi
c0101ac6:	7e 5c                	jle    c0101b24 <_svfprintf_r+0x374>
c0101ac8:	83 c0 01             	add    $0x1,%eax
c0101acb:	83 c1 10             	add    $0x10,%ecx
c0101ace:	c7 07 50 86 10 c0    	movl   $0xc0108650,(%edi)
c0101ad4:	83 c7 08             	add    $0x8,%edi
c0101ad7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0101ade:	83 f8 07             	cmp    $0x7,%eax
c0101ae1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101ae7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101aed:	7e d1                	jle    c0101ac0 <_svfprintf_r+0x310>
c0101aef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101af2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0101af6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101afa:	8b 45 08             	mov    0x8(%ebp),%eax
c0101afd:	89 04 24             	mov    %eax,(%esp)
c0101b00:	e8 bb 47 00 00       	call   c01062c0 <__ssprint_r>
c0101b05:	85 c0                	test   %eax,%eax
c0101b07:	0f 85 73 fe ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0101b0d:	83 ee 10             	sub    $0x10,%esi
c0101b10:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101b16:	83 fe 10             	cmp    $0x10,%esi
c0101b19:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101b1f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101b22:	7f a4                	jg     c0101ac8 <_svfprintf_r+0x318>
c0101b24:	83 c0 01             	add    $0x1,%eax
c0101b27:	01 f1                	add    %esi,%ecx
c0101b29:	83 f8 07             	cmp    $0x7,%eax
c0101b2c:	c7 07 50 86 10 c0    	movl   $0xc0108650,(%edi)
c0101b32:	89 77 04             	mov    %esi,0x4(%edi)
c0101b35:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101b3b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101b41:	0f 8f 16 0e 00 00    	jg     c010295d <_svfprintf_r+0x11ad>
c0101b47:	83 c7 08             	add    $0x8,%edi
c0101b4a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101b51:	e9 58 05 00 00       	jmp    c01020ae <_svfprintf_r+0x8fe>
c0101b56:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101b5d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b63:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b66:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b69:	0f 85 fd 04 00 00    	jne    c010206c <_svfprintf_r+0x8bc>
c0101b6f:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101b76:	0f 84 f0 04 00 00    	je     c010206c <_svfprintf_r+0x8bc>
c0101b7c:	0f b7 08             	movzwl (%eax),%ecx
c0101b7f:	83 c0 04             	add    $0x4,%eax
c0101b82:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b85:	b8 01 00 00 00       	mov    $0x1,%eax
c0101b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101b90:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101b97:	31 db                	xor    %ebx,%ebx
c0101b99:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c0101b9f:	89 f2                	mov    %esi,%edx
c0101ba1:	80 e2 7f             	and    $0x7f,%dl
c0101ba4:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c0101bab:	0f 48 d6             	cmovs  %esi,%edx
c0101bae:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c0101bb4:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101bba:	85 d2                	test   %edx,%edx
c0101bbc:	75 08                	jne    c0101bc6 <_svfprintf_r+0x416>
c0101bbe:	85 c9                	test   %ecx,%ecx
c0101bc0:	0f 84 ea 08 00 00    	je     c01024b0 <_svfprintf_r+0xd00>
c0101bc6:	3c 01                	cmp    $0x1,%al
c0101bc8:	0f 84 6a 0d 00 00    	je     c0102938 <_svfprintf_r+0x1188>
c0101bce:	3c 02                	cmp    $0x2,%al
c0101bd0:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101bd3:	0f 85 bf 0b 00 00    	jne    c0102798 <_svfprintf_r+0xfe8>
c0101bd9:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c0101bdf:	90                   	nop
c0101be0:	89 ca                	mov    %ecx,%edx
c0101be2:	83 e8 01             	sub    $0x1,%eax
c0101be5:	83 e2 0f             	and    $0xf,%edx
c0101be8:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c0101bec:	c1 e9 04             	shr    $0x4,%ecx
c0101bef:	85 c9                	test   %ecx,%ecx
c0101bf1:	88 10                	mov    %dl,(%eax)
c0101bf3:	75 eb                	jne    c0101be0 <_svfprintf_r+0x430>
c0101bf5:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0101bf8:	29 c2                	sub    %eax,%edx
c0101bfa:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101c00:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0101c06:	66 90                	xchg   %ax,%ax
c0101c08:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101c0e:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0101c14:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101c1b:	00 00 00 
c0101c1e:	39 c2                	cmp    %eax,%edx
c0101c20:	0f 4d c2             	cmovge %edx,%eax
c0101c23:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101c29:	e9 1a fe ff ff       	jmp    c0101a48 <_svfprintf_r+0x298>
c0101c2e:	84 db                	test   %bl,%bl
c0101c30:	89 c8                	mov    %ecx,%eax
c0101c32:	0f 44 de             	cmove  %esi,%ebx
c0101c35:	e9 a3 fc ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0101c3a:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0101c41:	89 c8                	mov    %ecx,%eax
c0101c43:	e9 95 fc ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0101c48:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c0101c4f:	00 00 00 
c0101c52:	89 c8                	mov    %ecx,%eax
c0101c54:	e9 84 fc ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0101c59:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101c5f:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c62:	31 ff                	xor    %edi,%edi
c0101c64:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101c6b:	00 00 00 
c0101c6e:	66 90                	xchg   %ax,%ax
c0101c70:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c0101c73:	83 c1 01             	add    $0x1,%ecx
c0101c76:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c0101c79:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c0101c7d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c80:	83 fa 09             	cmp    $0x9,%edx
c0101c83:	76 eb                	jbe    c0101c70 <_svfprintf_r+0x4c0>
c0101c85:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c0101c8b:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101c91:	e9 4d fc ff ff       	jmp    c01018e3 <_svfprintf_r+0x133>
c0101c96:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101c9d:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101ca4:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101caa:	8b 45 14             	mov    0x14(%ebp),%eax
c0101cad:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101cb0:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101cb6:	0f 85 61 02 00 00    	jne    c0101f1d <_svfprintf_r+0x76d>
c0101cbc:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101cc3:	0f 84 54 02 00 00    	je     c0101f1d <_svfprintf_r+0x76d>
c0101cc9:	0f bf 08             	movswl (%eax),%ecx
c0101ccc:	83 c0 04             	add    $0x4,%eax
c0101ccf:	89 45 14             	mov    %eax,0x14(%ebp)
c0101cd2:	85 c9                	test   %ecx,%ecx
c0101cd4:	0f 88 53 02 00 00    	js     c0101f2d <_svfprintf_r+0x77d>
c0101cda:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101ce1:	b8 01 00 00 00       	mov    $0x1,%eax
c0101ce6:	e9 ae fe ff ff       	jmp    c0101b99 <_svfprintf_r+0x3e9>
c0101ceb:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0101cf2:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101cf8:	8b 45 14             	mov    0x14(%ebp),%eax
c0101cfb:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101cfe:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101d04:	0f 84 15 10 00 00    	je     c0102d1f <_svfprintf_r+0x156f>
c0101d0a:	db 28                	fldt   (%eax)
c0101d0c:	83 c0 0c             	add    $0xc,%eax
c0101d0f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d12:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0101d18:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101d1e:	dd 1c 24             	fstpl  (%esp)
c0101d21:	e8 aa 44 00 00       	call   c01061d0 <__fpclassifyd>
c0101d26:	83 f8 01             	cmp    $0x1,%eax
c0101d29:	0f 85 82 0f 00 00    	jne    c0102cb1 <_svfprintf_r+0x1501>
c0101d2f:	d9 ee                	fldz   
c0101d31:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101d37:	d9 c9                	fxch   %st(1)
c0101d39:	df e9                	fucomip %st(1),%st
c0101d3b:	dd d8                	fstp   %st(0)
c0101d3d:	0f 87 59 15 00 00    	ja     c010329c <_svfprintf_r+0x1aec>
c0101d43:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101d4a:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0101d51:	ba 9e 84 10 c0       	mov    $0xc010849e,%edx
c0101d56:	b8 a2 84 10 c0       	mov    $0xc01084a2,%eax
c0101d5b:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0101d62:	00 00 00 
c0101d65:	0f 4e c2             	cmovle %edx,%eax
c0101d68:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101d6e:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0101d75:	ff ff ff 
c0101d78:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0101d7f:	00 00 00 
c0101d82:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101d89:	00 00 00 
c0101d8c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101d93:	00 00 00 
c0101d96:	e9 ad fc ff ff       	jmp    c0101a48 <_svfprintf_r+0x298>
c0101d9b:	8d 41 01             	lea    0x1(%ecx),%eax
c0101d9e:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101da4:	0f be 01             	movsbl (%ecx),%eax
c0101da7:	83 f8 2a             	cmp    $0x2a,%eax
c0101daa:	0f 84 84 18 00 00    	je     c0103634 <_svfprintf_r+0x1e84>
c0101db0:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101db3:	31 c9                	xor    %ecx,%ecx
c0101db5:	83 fa 09             	cmp    $0x9,%edx
c0101db8:	0f 87 a8 16 00 00    	ja     c0103466 <_svfprintf_r+0x1cb6>
c0101dbe:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c0101dc4:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101dd0:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0101dd3:	83 c7 01             	add    $0x1,%edi
c0101dd6:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0101dd9:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c0101ddd:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101de0:	83 fa 09             	cmp    $0x9,%edx
c0101de3:	76 eb                	jbe    c0101dd0 <_svfprintf_r+0x620>
c0101de5:	85 c9                	test   %ecx,%ecx
c0101de7:	89 ca                	mov    %ecx,%edx
c0101de9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101dee:	0f 48 d1             	cmovs  %ecx,%edx
c0101df1:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101df7:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c0101dfd:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101e03:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0101e09:	e9 d5 fa ff ff       	jmp    c01018e3 <_svfprintf_r+0x133>
c0101e0e:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e11:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e14:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101e1b:	8b 08                	mov    (%eax),%ecx
c0101e1d:	83 c0 04             	add    $0x4,%eax
c0101e20:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e23:	b8 02 00 00 00       	mov    $0x2,%eax
c0101e28:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101e2f:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0101e36:	c7 85 18 ff ff ff bf 	movl   $0xc01084bf,-0xe8(%ebp)
c0101e3d:	84 10 c0 
c0101e40:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0101e47:	00 00 00 
c0101e4a:	e9 41 fd ff ff       	jmp    c0101b90 <_svfprintf_r+0x3e0>
c0101e4f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101e56:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e5c:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e5f:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e62:	0f 85 87 00 00 00    	jne    c0101eef <_svfprintf_r+0x73f>
c0101e68:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101e6f:	74 7e                	je     c0101eef <_svfprintf_r+0x73f>
c0101e71:	0f b7 08             	movzwl (%eax),%ecx
c0101e74:	83 c0 04             	add    $0x4,%eax
c0101e77:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e7a:	31 c0                	xor    %eax,%eax
c0101e7c:	e9 0f fd ff ff       	jmp    c0101b90 <_svfprintf_r+0x3e0>
c0101e81:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c0101e88:	89 c8                	mov    %ecx,%eax
c0101e8a:	e9 4e fa ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0101e8f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101e96:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e99:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101e9f:	0f 85 97 0b 00 00    	jne    c0102a3c <_svfprintf_r+0x128c>
c0101ea5:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101eac:	0f 84 8a 0b 00 00    	je     c0102a3c <_svfprintf_r+0x128c>
c0101eb2:	8b 45 14             	mov    0x14(%ebp),%eax
c0101eb5:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c0101ebc:	8b 00                	mov    (%eax),%eax
c0101ebe:	66 89 10             	mov    %dx,(%eax)
c0101ec1:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ec4:	83 c0 04             	add    $0x4,%eax
c0101ec7:	89 45 14             	mov    %eax,0x14(%ebp)
c0101eca:	e9 7c f9 ff ff       	jmp    c010184b <_svfprintf_r+0x9b>
c0101ecf:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101ed6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101edd:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ee3:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ee6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ee9:	0f 84 79 ff ff ff    	je     c0101e68 <_svfprintf_r+0x6b8>
c0101eef:	8b 08                	mov    (%eax),%ecx
c0101ef1:	83 c0 04             	add    $0x4,%eax
c0101ef4:	89 45 14             	mov    %eax,0x14(%ebp)
c0101ef7:	31 c0                	xor    %eax,%eax
c0101ef9:	e9 92 fc ff ff       	jmp    c0101b90 <_svfprintf_r+0x3e0>
c0101efe:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101f05:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101f0b:	8b 45 14             	mov    0x14(%ebp),%eax
c0101f0e:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101f11:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101f17:	0f 84 9f fd ff ff    	je     c0101cbc <_svfprintf_r+0x50c>
c0101f1d:	8b 08                	mov    (%eax),%ecx
c0101f1f:	83 c0 04             	add    $0x4,%eax
c0101f22:	89 45 14             	mov    %eax,0x14(%ebp)
c0101f25:	85 c9                	test   %ecx,%ecx
c0101f27:	0f 89 ad fd ff ff    	jns    c0101cda <_svfprintf_r+0x52a>
c0101f2d:	f7 d9                	neg    %ecx
c0101f2f:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0101f34:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0101f3b:	b8 01 00 00 00       	mov    $0x1,%eax
c0101f40:	e9 54 fc ff ff       	jmp    c0101b99 <_svfprintf_r+0x3e9>
c0101f45:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c0101f4c:	89 c8                	mov    %ecx,%eax
c0101f4e:	e9 8a f9 ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0101f53:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101f5a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101f60:	8b 45 14             	mov    0x14(%ebp),%eax
c0101f63:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101f66:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101f6c:	c7 85 18 ff ff ff bf 	movl   $0xc01084bf,-0xe8(%ebp)
c0101f73:	84 10 c0 
c0101f76:	75 71                	jne    c0101fe9 <_svfprintf_r+0x839>
c0101f78:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101f7f:	74 68                	je     c0101fe9 <_svfprintf_r+0x839>
c0101f81:	0f b7 08             	movzwl (%eax),%ecx
c0101f84:	83 c0 04             	add    $0x4,%eax
c0101f87:	89 45 14             	mov    %eax,0x14(%ebp)
c0101f8a:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0101f91:	b8 02 00 00 00       	mov    $0x2,%eax
c0101f96:	0f 84 f4 fb ff ff    	je     c0101b90 <_svfprintf_r+0x3e0>
c0101f9c:	85 c9                	test   %ecx,%ecx
c0101f9e:	0f 84 ec fb ff ff    	je     c0101b90 <_svfprintf_r+0x3e0>
c0101fa4:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c0101fab:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101fb2:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101fb9:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c0101fbf:	e9 cc fb ff ff       	jmp    c0101b90 <_svfprintf_r+0x3e0>
c0101fc4:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101fcb:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101fd1:	8b 45 14             	mov    0x14(%ebp),%eax
c0101fd4:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101fd7:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101fdd:	c7 85 18 ff ff ff ae 	movl   $0xc01084ae,-0xe8(%ebp)
c0101fe4:	84 10 c0 
c0101fe7:	74 8f                	je     c0101f78 <_svfprintf_r+0x7c8>
c0101fe9:	8b 08                	mov    (%eax),%ecx
c0101feb:	83 c0 04             	add    $0x4,%eax
c0101fee:	89 45 14             	mov    %eax,0x14(%ebp)
c0101ff1:	eb 97                	jmp    c0101f8a <_svfprintf_r+0x7da>
c0101ff3:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ff9:	8b 45 14             	mov    0x14(%ebp),%eax
c0101ffc:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101fff:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0102006:	8b 00                	mov    (%eax),%eax
c0102008:	88 45 80             	mov    %al,-0x80(%ebp)
c010200b:	8b 45 14             	mov    0x14(%ebp),%eax
c010200e:	83 c0 04             	add    $0x4,%eax
c0102011:	89 45 14             	mov    %eax,0x14(%ebp)
c0102014:	8d 45 80             	lea    -0x80(%ebp),%eax
c0102017:	31 db                	xor    %ebx,%ebx
c0102019:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0102020:	00 00 00 
c0102023:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c010202a:	00 00 00 
c010202d:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102034:	00 00 00 
c0102037:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010203e:	00 00 00 
c0102041:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102047:	e9 07 fa ff ff       	jmp    c0101a53 <_svfprintf_r+0x2a3>
c010204c:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0102053:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010205a:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102060:	8b 45 14             	mov    0x14(%ebp),%eax
c0102063:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102066:	0f 84 03 fb ff ff    	je     c0101b6f <_svfprintf_r+0x3bf>
c010206c:	8b 08                	mov    (%eax),%ecx
c010206e:	83 c0 04             	add    $0x4,%eax
c0102071:	89 45 14             	mov    %eax,0x14(%ebp)
c0102074:	b8 01 00 00 00       	mov    $0x1,%eax
c0102079:	e9 12 fb ff ff       	jmp    c0101b90 <_svfprintf_r+0x3e0>
c010207e:	85 c0                	test   %eax,%eax
c0102080:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102086:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102089:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c010208f:	0f 84 c3 f8 ff ff    	je     c0101958 <_svfprintf_r+0x1a8>
c0102095:	88 45 80             	mov    %al,-0x80(%ebp)
c0102098:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010209f:	e9 70 ff ff ff       	jmp    c0102014 <_svfprintf_r+0x864>
c01020a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01020a8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01020ae:	84 db                	test   %bl,%bl
c01020b0:	74 33                	je     c01020e5 <_svfprintf_r+0x935>
c01020b2:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c01020b8:	83 c1 01             	add    $0x1,%ecx
c01020bb:	89 07                	mov    %eax,(%edi)
c01020bd:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020c3:	83 c7 08             	add    $0x8,%edi
c01020c6:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01020cd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01020d3:	83 c0 01             	add    $0x1,%eax
c01020d6:	83 f8 07             	cmp    $0x7,%eax
c01020d9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01020df:	0f 8f 7b 06 00 00    	jg     c0102760 <_svfprintf_r+0xfb0>
c01020e5:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c01020eb:	85 db                	test   %ebx,%ebx
c01020ed:	74 33                	je     c0102122 <_svfprintf_r+0x972>
c01020ef:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01020f5:	83 c1 02             	add    $0x2,%ecx
c01020f8:	89 07                	mov    %eax,(%edi)
c01020fa:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102100:	83 c7 08             	add    $0x8,%edi
c0102103:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c010210a:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102110:	83 c0 01             	add    $0x1,%eax
c0102113:	83 f8 07             	cmp    $0x7,%eax
c0102116:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010211c:	0f 8f 06 06 00 00    	jg     c0102728 <_svfprintf_r+0xf78>
c0102122:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0102129:	00 00 00 
c010212c:	0f 84 c6 03 00 00    	je     c01024f8 <_svfprintf_r+0xd48>
c0102132:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0102138:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c010213e:	85 f6                	test   %esi,%esi
c0102140:	0f 8e d2 00 00 00    	jle    c0102218 <_svfprintf_r+0xa68>
c0102146:	83 fe 10             	cmp    $0x10,%esi
c0102149:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010214f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102155:	7f 11                	jg     c0102168 <_svfprintf_r+0x9b8>
c0102157:	eb 6b                	jmp    c01021c4 <_svfprintf_r+0xa14>
c0102159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102160:	83 ee 10             	sub    $0x10,%esi
c0102163:	83 fe 10             	cmp    $0x10,%esi
c0102166:	7e 5c                	jle    c01021c4 <_svfprintf_r+0xa14>
c0102168:	83 c0 01             	add    $0x1,%eax
c010216b:	83 c1 10             	add    $0x10,%ecx
c010216e:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102174:	83 c7 08             	add    $0x8,%edi
c0102177:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010217e:	83 f8 07             	cmp    $0x7,%eax
c0102181:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102187:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010218d:	7e d1                	jle    c0102160 <_svfprintf_r+0x9b0>
c010218f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102192:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102196:	89 44 24 04          	mov    %eax,0x4(%esp)
c010219a:	8b 45 08             	mov    0x8(%ebp),%eax
c010219d:	89 04 24             	mov    %eax,(%esp)
c01021a0:	e8 1b 41 00 00       	call   c01062c0 <__ssprint_r>
c01021a5:	85 c0                	test   %eax,%eax
c01021a7:	0f 85 d3 f7 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01021ad:	83 ee 10             	sub    $0x10,%esi
c01021b0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01021b6:	83 fe 10             	cmp    $0x10,%esi
c01021b9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01021bf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01021c2:	7f a4                	jg     c0102168 <_svfprintf_r+0x9b8>
c01021c4:	83 c0 01             	add    $0x1,%eax
c01021c7:	01 f1                	add    %esi,%ecx
c01021c9:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c01021cf:	83 c7 08             	add    $0x8,%edi
c01021d2:	89 77 fc             	mov    %esi,-0x4(%edi)
c01021d5:	83 f8 07             	cmp    $0x7,%eax
c01021d8:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01021de:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01021e4:	7e 32                	jle    c0102218 <_svfprintf_r+0xa68>
c01021e6:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01021ec:	89 44 24 08          	mov    %eax,0x8(%esp)
c01021f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021f3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01021f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01021fa:	89 04 24             	mov    %eax,(%esp)
c01021fd:	e8 be 40 00 00       	call   c01062c0 <__ssprint_r>
c0102202:	85 c0                	test   %eax,%eax
c0102204:	0f 85 76 f7 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c010220a:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102210:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102213:	90                   	nop
c0102214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102218:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c010221f:	01 00 00 
c0102222:	0f 85 50 01 00 00    	jne    c0102378 <_svfprintf_r+0xbc8>
c0102228:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010222e:	89 07                	mov    %eax,(%edi)
c0102230:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c0102236:	01 c1                	add    %eax,%ecx
c0102238:	89 47 04             	mov    %eax,0x4(%edi)
c010223b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102241:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102247:	83 c0 01             	add    $0x1,%eax
c010224a:	83 f8 07             	cmp    $0x7,%eax
c010224d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102253:	0f 8f 6a 04 00 00    	jg     c01026c3 <_svfprintf_r+0xf13>
c0102259:	83 c7 08             	add    $0x8,%edi
c010225c:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c0102263:	0f 84 d7 00 00 00    	je     c0102340 <_svfprintf_r+0xb90>
c0102269:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010226f:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102275:	85 f6                	test   %esi,%esi
c0102277:	0f 8e c3 00 00 00    	jle    c0102340 <_svfprintf_r+0xb90>
c010227d:	83 fe 10             	cmp    $0x10,%esi
c0102280:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102286:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010228c:	7f 0a                	jg     c0102298 <_svfprintf_r+0xae8>
c010228e:	eb 64                	jmp    c01022f4 <_svfprintf_r+0xb44>
c0102290:	83 ee 10             	sub    $0x10,%esi
c0102293:	83 fe 10             	cmp    $0x10,%esi
c0102296:	7e 5c                	jle    c01022f4 <_svfprintf_r+0xb44>
c0102298:	83 c0 01             	add    $0x1,%eax
c010229b:	83 c1 10             	add    $0x10,%ecx
c010229e:	c7 07 50 86 10 c0    	movl   $0xc0108650,(%edi)
c01022a4:	83 c7 08             	add    $0x8,%edi
c01022a7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01022ae:	83 f8 07             	cmp    $0x7,%eax
c01022b1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01022b7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01022bd:	7e d1                	jle    c0102290 <_svfprintf_r+0xae0>
c01022bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022c2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01022c6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cd:	89 04 24             	mov    %eax,(%esp)
c01022d0:	e8 eb 3f 00 00       	call   c01062c0 <__ssprint_r>
c01022d5:	85 c0                	test   %eax,%eax
c01022d7:	0f 85 a3 f6 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01022dd:	83 ee 10             	sub    $0x10,%esi
c01022e0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01022e6:	83 fe 10             	cmp    $0x10,%esi
c01022e9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01022ef:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01022f2:	7f a4                	jg     c0102298 <_svfprintf_r+0xae8>
c01022f4:	83 c0 01             	add    $0x1,%eax
c01022f7:	01 f1                	add    %esi,%ecx
c01022f9:	83 f8 07             	cmp    $0x7,%eax
c01022fc:	c7 07 50 86 10 c0    	movl   $0xc0108650,(%edi)
c0102302:	89 77 04             	mov    %esi,0x4(%edi)
c0102305:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010230b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102311:	7e 2d                	jle    c0102340 <_svfprintf_r+0xb90>
c0102313:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102319:	89 44 24 08          	mov    %eax,0x8(%esp)
c010231d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102320:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102324:	8b 45 08             	mov    0x8(%ebp),%eax
c0102327:	89 04 24             	mov    %eax,(%esp)
c010232a:	e8 91 3f 00 00       	call   c01062c0 <__ssprint_r>
c010232f:	85 c0                	test   %eax,%eax
c0102331:	0f 85 49 f6 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102337:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010233d:	8d 76 00             	lea    0x0(%esi),%esi
c0102340:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c0102346:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c010234c:	39 c2                	cmp    %eax,%edx
c010234e:	0f 4d c2             	cmovge %edx,%eax
c0102351:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c0102357:	85 c9                	test   %ecx,%ecx
c0102359:	0f 85 99 03 00 00    	jne    c01026f8 <_svfprintf_r+0xf48>
c010235f:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0102366:	00 00 00 
c0102369:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010236c:	e9 da f4 ff ff       	jmp    c010184b <_svfprintf_r+0x9b>
c0102371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102378:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c010237f:	0f 8e 5b 02 00 00    	jle    c01025e0 <_svfprintf_r+0xe30>
c0102385:	d9 ee                	fldz   
c0102387:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c010238d:	df e9                	fucomip %st(1),%st
c010238f:	dd d8                	fstp   %st(0)
c0102391:	0f 8a 59 04 00 00    	jp     c01027f0 <_svfprintf_r+0x1040>
c0102397:	0f 85 53 04 00 00    	jne    c01027f0 <_svfprintf_r+0x1040>
c010239d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01023a3:	83 c1 01             	add    $0x1,%ecx
c01023a6:	83 c7 08             	add    $0x8,%edi
c01023a9:	c7 47 f8 d7 84 10 c0 	movl   $0xc01084d7,-0x8(%edi)
c01023b0:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01023b7:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01023bd:	83 c0 01             	add    $0x1,%eax
c01023c0:	83 f8 07             	cmp    $0x7,%eax
c01023c3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01023c9:	0f 8f 63 09 00 00    	jg     c0102d32 <_svfprintf_r+0x1582>
c01023cf:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c01023d5:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c01023db:	7c 0d                	jl     c01023ea <_svfprintf_r+0xc3a>
c01023dd:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01023e4:	0f 84 72 fe ff ff    	je     c010225c <_svfprintf_r+0xaac>
c01023ea:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c01023f0:	83 c7 08             	add    $0x8,%edi
c01023f3:	89 47 f8             	mov    %eax,-0x8(%edi)
c01023f6:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c01023fc:	89 47 fc             	mov    %eax,-0x4(%edi)
c01023ff:	01 c1                	add    %eax,%ecx
c0102401:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102407:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010240d:	83 c0 01             	add    $0x1,%eax
c0102410:	83 f8 07             	cmp    $0x7,%eax
c0102413:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102419:	0f 8f dc 0b 00 00    	jg     c0102ffb <_svfprintf_r+0x184b>
c010241f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102425:	8d 70 ff             	lea    -0x1(%eax),%esi
c0102428:	85 f6                	test   %esi,%esi
c010242a:	0f 8e 2c fe ff ff    	jle    c010225c <_svfprintf_r+0xaac>
c0102430:	83 fe 10             	cmp    $0x10,%esi
c0102433:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102439:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010243f:	7f 13                	jg     c0102454 <_svfprintf_r+0xca4>
c0102441:	e9 e6 05 00 00       	jmp    c0102a2c <_svfprintf_r+0x127c>
c0102446:	66 90                	xchg   %ax,%ax
c0102448:	83 ee 10             	sub    $0x10,%esi
c010244b:	83 fe 10             	cmp    $0x10,%esi
c010244e:	0f 8e d8 05 00 00    	jle    c0102a2c <_svfprintf_r+0x127c>
c0102454:	83 c0 01             	add    $0x1,%eax
c0102457:	83 c1 10             	add    $0x10,%ecx
c010245a:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102460:	83 c7 08             	add    $0x8,%edi
c0102463:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010246a:	83 f8 07             	cmp    $0x7,%eax
c010246d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102473:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102479:	7e cd                	jle    c0102448 <_svfprintf_r+0xc98>
c010247b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010247e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102482:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102486:	8b 45 08             	mov    0x8(%ebp),%eax
c0102489:	89 04 24             	mov    %eax,(%esp)
c010248c:	e8 2f 3e 00 00       	call   c01062c0 <__ssprint_r>
c0102491:	85 c0                	test   %eax,%eax
c0102493:	0f 85 e7 f4 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102499:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010249f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01024a2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01024a8:	eb 9e                	jmp    c0102448 <_svfprintf_r+0xc98>
c01024aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01024b0:	84 c0                	test   %al,%al
c01024b2:	75 2c                	jne    c01024e0 <_svfprintf_r+0xd30>
c01024b4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01024bb:	74 23                	je     c01024e0 <_svfprintf_r+0xd30>
c01024bd:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c01024c3:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c01024c7:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01024cd:	8d 45 a7             	lea    -0x59(%ebp),%eax
c01024d0:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01024d6:	e9 2d f7 ff ff       	jmp    c0101c08 <_svfprintf_r+0x458>
c01024db:	90                   	nop
c01024dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01024e0:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01024e3:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c01024ea:	00 00 00 
c01024ed:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01024f3:	e9 10 f7 ff ff       	jmp    c0101c08 <_svfprintf_r+0x458>
c01024f8:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01024fe:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102504:	85 f6                	test   %esi,%esi
c0102506:	0f 8e 26 fc ff ff    	jle    c0102132 <_svfprintf_r+0x982>
c010250c:	83 fe 10             	cmp    $0x10,%esi
c010250f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102515:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010251b:	7f 0b                	jg     c0102528 <_svfprintf_r+0xd78>
c010251d:	eb 65                	jmp    c0102584 <_svfprintf_r+0xdd4>
c010251f:	90                   	nop
c0102520:	83 ee 10             	sub    $0x10,%esi
c0102523:	83 fe 10             	cmp    $0x10,%esi
c0102526:	7e 5c                	jle    c0102584 <_svfprintf_r+0xdd4>
c0102528:	83 c0 01             	add    $0x1,%eax
c010252b:	83 c1 10             	add    $0x10,%ecx
c010252e:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102534:	83 c7 08             	add    $0x8,%edi
c0102537:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010253e:	83 f8 07             	cmp    $0x7,%eax
c0102541:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102547:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010254d:	7e d1                	jle    c0102520 <_svfprintf_r+0xd70>
c010254f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102552:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102556:	89 44 24 04          	mov    %eax,0x4(%esp)
c010255a:	8b 45 08             	mov    0x8(%ebp),%eax
c010255d:	89 04 24             	mov    %eax,(%esp)
c0102560:	e8 5b 3d 00 00       	call   c01062c0 <__ssprint_r>
c0102565:	85 c0                	test   %eax,%eax
c0102567:	0f 85 13 f4 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c010256d:	83 ee 10             	sub    $0x10,%esi
c0102570:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102576:	83 fe 10             	cmp    $0x10,%esi
c0102579:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010257f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102582:	7f a4                	jg     c0102528 <_svfprintf_r+0xd78>
c0102584:	83 c0 01             	add    $0x1,%eax
c0102587:	01 f1                	add    %esi,%ecx
c0102589:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c010258f:	83 c7 08             	add    $0x8,%edi
c0102592:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102595:	83 f8 07             	cmp    $0x7,%eax
c0102598:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010259e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01025a4:	0f 8e 88 fb ff ff    	jle    c0102132 <_svfprintf_r+0x982>
c01025aa:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025b0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025b7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01025be:	89 04 24             	mov    %eax,(%esp)
c01025c1:	e8 fa 3c 00 00       	call   c01062c0 <__ssprint_r>
c01025c6:	85 c0                	test   %eax,%eax
c01025c8:	0f 85 b2 f3 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01025ce:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025d4:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025d7:	e9 56 fb ff ff       	jmp    c0102132 <_svfprintf_r+0x982>
c01025dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01025e0:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c01025e7:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01025ed:	0f 8e df 05 00 00    	jle    c0102bd2 <_svfprintf_r+0x1422>
c01025f3:	89 07                	mov    %eax,(%edi)
c01025f5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01025fb:	8d 51 01             	lea    0x1(%ecx),%edx
c01025fe:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102605:	83 c7 08             	add    $0x8,%edi
c0102608:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010260e:	83 c0 01             	add    $0x1,%eax
c0102611:	83 f8 07             	cmp    $0x7,%eax
c0102614:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010261a:	0f 8f 59 06 00 00    	jg     c0102c79 <_svfprintf_r+0x14c9>
c0102620:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c0102626:	83 c0 01             	add    $0x1,%eax
c0102629:	83 c7 08             	add    $0x8,%edi
c010262c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102632:	89 5f f8             	mov    %ebx,-0x8(%edi)
c0102635:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c010263b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c010263e:	01 da                	add    %ebx,%edx
c0102640:	83 f8 07             	cmp    $0x7,%eax
c0102643:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102649:	0f 8f f2 05 00 00    	jg     c0102c41 <_svfprintf_r+0x1491>
c010264f:	d9 ee                	fldz   
c0102651:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102657:	df e9                	fucomip %st(1),%st
c0102659:	dd d8                	fstp   %st(0)
c010265b:	7a 06                	jp     c0102663 <_svfprintf_r+0xeb3>
c010265d:	0f 84 33 03 00 00    	je     c0102996 <_svfprintf_r+0x11e6>
c0102663:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c0102669:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c010266f:	83 c1 01             	add    $0x1,%ecx
c0102672:	89 0f                	mov    %ecx,(%edi)
c0102674:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c0102677:	89 4f 04             	mov    %ecx,0x4(%edi)
c010267a:	01 ca                	add    %ecx,%edx
c010267c:	83 c0 01             	add    $0x1,%eax
c010267f:	83 f8 07             	cmp    $0x7,%eax
c0102682:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102688:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010268e:	0f 8f 75 05 00 00    	jg     c0102c09 <_svfprintf_r+0x1459>
c0102694:	83 c7 08             	add    $0x8,%edi
c0102697:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c010269d:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c01026a3:	89 0f                	mov    %ecx,(%edi)
c01026a5:	89 5f 04             	mov    %ebx,0x4(%edi)
c01026a8:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c01026ab:	83 c0 01             	add    $0x1,%eax
c01026ae:	83 f8 07             	cmp    $0x7,%eax
c01026b1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01026b7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01026bd:	0f 8e 96 fb ff ff    	jle    c0102259 <_svfprintf_r+0xaa9>
c01026c3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01026c9:	89 44 24 08          	mov    %eax,0x8(%esp)
c01026cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026d0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01026d7:	89 04 24             	mov    %eax,(%esp)
c01026da:	e8 e1 3b 00 00       	call   c01062c0 <__ssprint_r>
c01026df:	85 c0                	test   %eax,%eax
c01026e1:	0f 85 99 f2 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01026e7:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01026ed:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01026f0:	e9 67 fb ff ff       	jmp    c010225c <_svfprintf_r+0xaac>
c01026f5:	8d 76 00             	lea    0x0(%esi),%esi
c01026f8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01026fe:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102702:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102705:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102709:	8b 45 08             	mov    0x8(%ebp),%eax
c010270c:	89 04 24             	mov    %eax,(%esp)
c010270f:	e8 ac 3b 00 00       	call   c01062c0 <__ssprint_r>
c0102714:	85 c0                	test   %eax,%eax
c0102716:	0f 84 43 fc ff ff    	je     c010235f <_svfprintf_r+0xbaf>
c010271c:	e9 5f f2 ff ff       	jmp    c0101980 <_svfprintf_r+0x1d0>
c0102721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102728:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010272e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102732:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102735:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102739:	8b 45 08             	mov    0x8(%ebp),%eax
c010273c:	89 04 24             	mov    %eax,(%esp)
c010273f:	e8 7c 3b 00 00       	call   c01062c0 <__ssprint_r>
c0102744:	85 c0                	test   %eax,%eax
c0102746:	0f 85 34 f2 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c010274c:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102752:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102755:	e9 c8 f9 ff ff       	jmp    c0102122 <_svfprintf_r+0x972>
c010275a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102760:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102766:	89 44 24 08          	mov    %eax,0x8(%esp)
c010276a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010276d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102771:	8b 45 08             	mov    0x8(%ebp),%eax
c0102774:	89 04 24             	mov    %eax,(%esp)
c0102777:	e8 44 3b 00 00       	call   c01062c0 <__ssprint_r>
c010277c:	85 c0                	test   %eax,%eax
c010277e:	0f 85 fc f1 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102784:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010278a:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010278d:	e9 53 f9 ff ff       	jmp    c01020e5 <_svfprintf_r+0x935>
c0102792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102798:	89 c2                	mov    %eax,%edx
c010279a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01027a0:	89 c8                	mov    %ecx,%eax
c01027a2:	83 ea 01             	sub    $0x1,%edx
c01027a5:	83 e0 07             	and    $0x7,%eax
c01027a8:	c1 e9 03             	shr    $0x3,%ecx
c01027ab:	83 c0 30             	add    $0x30,%eax
c01027ae:	85 c9                	test   %ecx,%ecx
c01027b0:	88 02                	mov    %al,(%edx)
c01027b2:	75 ec                	jne    c01027a0 <_svfprintf_r+0xff0>
c01027b4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01027bb:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c01027c1:	0f 84 5b 01 00 00    	je     c0102922 <_svfprintf_r+0x1172>
c01027c7:	3c 30                	cmp    $0x30,%al
c01027c9:	74 0b                	je     c01027d6 <_svfprintf_r+0x1026>
c01027cb:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c01027d2:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c01027d6:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01027d9:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c01027df:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01027e5:	e9 1e f4 ff ff       	jmp    c0101c08 <_svfprintf_r+0x458>
c01027ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01027f0:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01027f6:	85 db                	test   %ebx,%ebx
c01027f8:	0f 8e 66 05 00 00    	jle    c0102d64 <_svfprintf_r+0x15b4>
c01027fe:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0102804:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c010280a:	01 d0                	add    %edx,%eax
c010280c:	89 c3                	mov    %eax,%ebx
c010280e:	29 d3                	sub    %edx,%ebx
c0102810:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102816:	89 d0                	mov    %edx,%eax
c0102818:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c010281e:	39 d3                	cmp    %edx,%ebx
c0102820:	0f 4f da             	cmovg  %edx,%ebx
c0102823:	85 db                	test   %ebx,%ebx
c0102825:	7e 28                	jle    c010284f <_svfprintf_r+0x109f>
c0102827:	89 07                	mov    %eax,(%edi)
c0102829:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010282f:	01 d9                	add    %ebx,%ecx
c0102831:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102834:	83 c7 08             	add    $0x8,%edi
c0102837:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010283d:	83 c0 01             	add    $0x1,%eax
c0102840:	83 f8 07             	cmp    $0x7,%eax
c0102843:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102849:	0f 8f 58 09 00 00    	jg     c01031a7 <_svfprintf_r+0x19f7>
c010284f:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c0102855:	31 c0                	xor    %eax,%eax
c0102857:	85 db                	test   %ebx,%ebx
c0102859:	0f 49 c3             	cmovns %ebx,%eax
c010285c:	29 c6                	sub    %eax,%esi
c010285e:	85 f6                	test   %esi,%esi
c0102860:	0f 8e 40 02 00 00    	jle    c0102aa6 <_svfprintf_r+0x12f6>
c0102866:	83 fe 10             	cmp    $0x10,%esi
c0102869:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010286f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102875:	7f 15                	jg     c010288c <_svfprintf_r+0x10dc>
c0102877:	e9 db 01 00 00       	jmp    c0102a57 <_svfprintf_r+0x12a7>
c010287c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102880:	83 ee 10             	sub    $0x10,%esi
c0102883:	83 fe 10             	cmp    $0x10,%esi
c0102886:	0f 8e cb 01 00 00    	jle    c0102a57 <_svfprintf_r+0x12a7>
c010288c:	83 c0 01             	add    $0x1,%eax
c010288f:	83 c1 10             	add    $0x10,%ecx
c0102892:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102898:	83 c7 08             	add    $0x8,%edi
c010289b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01028a2:	83 f8 07             	cmp    $0x7,%eax
c01028a5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01028ab:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01028b1:	7e cd                	jle    c0102880 <_svfprintf_r+0x10d0>
c01028b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028b6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01028ba:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028be:	8b 45 08             	mov    0x8(%ebp),%eax
c01028c1:	89 04 24             	mov    %eax,(%esp)
c01028c4:	e8 f7 39 00 00       	call   c01062c0 <__ssprint_r>
c01028c9:	85 c0                	test   %eax,%eax
c01028cb:	0f 85 af f0 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01028d1:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01028d7:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01028da:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01028e0:	eb 9e                	jmp    c0102880 <_svfprintf_r+0x10d0>
c01028e2:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01028e5:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c01028ea:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c01028f0:	89 c7                	mov    %eax,%edi
c01028f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01028f8:	89 c8                	mov    %ecx,%eax
c01028fa:	83 ef 01             	sub    $0x1,%edi
c01028fd:	f7 e6                	mul    %esi
c01028ff:	c1 ea 03             	shr    $0x3,%edx
c0102902:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0102905:	01 c0                	add    %eax,%eax
c0102907:	29 c1                	sub    %eax,%ecx
c0102909:	83 c1 30             	add    $0x30,%ecx
c010290c:	85 d2                	test   %edx,%edx
c010290e:	88 0f                	mov    %cl,(%edi)
c0102910:	89 d1                	mov    %edx,%ecx
c0102912:	75 e4                	jne    c01028f8 <_svfprintf_r+0x1148>
c0102914:	89 fa                	mov    %edi,%edx
c0102916:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c010291c:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0102922:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102925:	29 d0                	sub    %edx,%eax
c0102927:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010292d:	e9 d6 f2 ff ff       	jmp    c0101c08 <_svfprintf_r+0x458>
c0102932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102938:	83 f9 09             	cmp    $0x9,%ecx
c010293b:	77 a5                	ja     c01028e2 <_svfprintf_r+0x1132>
c010293d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102943:	83 c1 30             	add    $0x30,%ecx
c0102946:	88 4d a7             	mov    %cl,-0x59(%ebp)
c0102949:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010294f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102952:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102958:	e9 ab f2 ff ff       	jmp    c0101c08 <_svfprintf_r+0x458>
c010295d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102963:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102967:	8b 45 0c             	mov    0xc(%ebp),%eax
c010296a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010296e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102971:	89 04 24             	mov    %eax,(%esp)
c0102974:	e8 47 39 00 00       	call   c01062c0 <__ssprint_r>
c0102979:	85 c0                	test   %eax,%eax
c010297b:	0f 85 ff ef ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102981:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102988:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010298b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102991:	e9 18 f7 ff ff       	jmp    c01020ae <_svfprintf_r+0x8fe>
c0102996:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c010299c:	8d 73 ff             	lea    -0x1(%ebx),%esi
c010299f:	85 f6                	test   %esi,%esi
c01029a1:	0f 8e f0 fc ff ff    	jle    c0102697 <_svfprintf_r+0xee7>
c01029a7:	83 fe 10             	cmp    $0x10,%esi
c01029aa:	7e 70                	jle    c0102a1c <_svfprintf_r+0x126c>
c01029ac:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01029b2:	eb 0c                	jmp    c01029c0 <_svfprintf_r+0x1210>
c01029b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01029b8:	83 ee 10             	sub    $0x10,%esi
c01029bb:	83 fe 10             	cmp    $0x10,%esi
c01029be:	7e 5c                	jle    c0102a1c <_svfprintf_r+0x126c>
c01029c0:	83 c0 01             	add    $0x1,%eax
c01029c3:	83 c2 10             	add    $0x10,%edx
c01029c6:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c01029cc:	83 c7 08             	add    $0x8,%edi
c01029cf:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01029d6:	83 f8 07             	cmp    $0x7,%eax
c01029d9:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01029df:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01029e5:	7e d1                	jle    c01029b8 <_svfprintf_r+0x1208>
c01029e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029ea:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01029ee:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01029f5:	89 04 24             	mov    %eax,(%esp)
c01029f8:	e8 c3 38 00 00       	call   c01062c0 <__ssprint_r>
c01029fd:	85 c0                	test   %eax,%eax
c01029ff:	0f 85 7b ef ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102a05:	83 ee 10             	sub    $0x10,%esi
c0102a08:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102a0e:	83 fe 10             	cmp    $0x10,%esi
c0102a11:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a17:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102a1a:	7f a4                	jg     c01029c0 <_svfprintf_r+0x1210>
c0102a1c:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102a22:	01 f2                	add    %esi,%edx
c0102a24:	89 77 04             	mov    %esi,0x4(%edi)
c0102a27:	e9 50 fc ff ff       	jmp    c010267c <_svfprintf_r+0xecc>
c0102a2c:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102a32:	01 f1                	add    %esi,%ecx
c0102a34:	89 77 04             	mov    %esi,0x4(%edi)
c0102a37:	e9 6f fc ff ff       	jmp    c01026ab <_svfprintf_r+0xefb>
c0102a3c:	8b 45 14             	mov    0x14(%ebp),%eax
c0102a3f:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c0102a45:	8b 00                	mov    (%eax),%eax
c0102a47:	89 10                	mov    %edx,(%eax)
c0102a49:	8b 45 14             	mov    0x14(%ebp),%eax
c0102a4c:	83 c0 04             	add    $0x4,%eax
c0102a4f:	89 45 14             	mov    %eax,0x14(%ebp)
c0102a52:	e9 f4 ed ff ff       	jmp    c010184b <_svfprintf_r+0x9b>
c0102a57:	83 c0 01             	add    $0x1,%eax
c0102a5a:	01 f1                	add    %esi,%ecx
c0102a5c:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102a62:	83 c7 08             	add    $0x8,%edi
c0102a65:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102a68:	83 f8 07             	cmp    $0x7,%eax
c0102a6b:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a71:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a77:	7e 2d                	jle    c0102aa6 <_svfprintf_r+0x12f6>
c0102a79:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102a7f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a83:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a86:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a8d:	89 04 24             	mov    %eax,(%esp)
c0102a90:	e8 2b 38 00 00       	call   c01062c0 <__ssprint_r>
c0102a95:	85 c0                	test   %eax,%eax
c0102a97:	0f 85 e3 ee ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102a9d:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102aa3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102aa6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102aac:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0102ab2:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0102ab8:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c0102abe:	89 c6                	mov    %eax,%esi
c0102ac0:	7c 0d                	jl     c0102acf <_svfprintf_r+0x131f>
c0102ac2:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102ac9:	0f 84 5e 05 00 00    	je     c010302d <_svfprintf_r+0x187d>
c0102acf:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102ad5:	89 07                	mov    %eax,(%edi)
c0102ad7:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102add:	01 c1                	add    %eax,%ecx
c0102adf:	89 47 04             	mov    %eax,0x4(%edi)
c0102ae2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102ae8:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102aee:	83 c0 01             	add    $0x1,%eax
c0102af1:	83 f8 07             	cmp    $0x7,%eax
c0102af4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102afa:	0f 8f d9 06 00 00    	jg     c01031d9 <_svfprintf_r+0x1a29>
c0102b00:	83 c7 08             	add    $0x8,%edi
c0102b03:	89 d0                	mov    %edx,%eax
c0102b05:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c0102b0b:	89 f2                	mov    %esi,%edx
c0102b0d:	29 f3                	sub    %esi,%ebx
c0102b0f:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c0102b15:	29 c6                	sub    %eax,%esi
c0102b17:	39 de                	cmp    %ebx,%esi
c0102b19:	0f 4e de             	cmovle %esi,%ebx
c0102b1c:	85 db                	test   %ebx,%ebx
c0102b1e:	7e 29                	jle    c0102b49 <_svfprintf_r+0x1399>
c0102b20:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b26:	01 d9                	add    %ebx,%ecx
c0102b28:	83 c7 08             	add    $0x8,%edi
c0102b2b:	89 57 f8             	mov    %edx,-0x8(%edi)
c0102b2e:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102b31:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102b37:	83 c0 01             	add    $0x1,%eax
c0102b3a:	83 f8 07             	cmp    $0x7,%eax
c0102b3d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102b43:	0f 8f c8 06 00 00    	jg     c0103211 <_svfprintf_r+0x1a61>
c0102b49:	31 c0                	xor    %eax,%eax
c0102b4b:	85 db                	test   %ebx,%ebx
c0102b4d:	0f 49 c3             	cmovns %ebx,%eax
c0102b50:	29 c6                	sub    %eax,%esi
c0102b52:	85 f6                	test   %esi,%esi
c0102b54:	0f 8e 02 f7 ff ff    	jle    c010225c <_svfprintf_r+0xaac>
c0102b5a:	83 fe 10             	cmp    $0x10,%esi
c0102b5d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b63:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102b69:	7f 11                	jg     c0102b7c <_svfprintf_r+0x13cc>
c0102b6b:	e9 bc fe ff ff       	jmp    c0102a2c <_svfprintf_r+0x127c>
c0102b70:	83 ee 10             	sub    $0x10,%esi
c0102b73:	83 fe 10             	cmp    $0x10,%esi
c0102b76:	0f 8e b0 fe ff ff    	jle    c0102a2c <_svfprintf_r+0x127c>
c0102b7c:	83 c0 01             	add    $0x1,%eax
c0102b7f:	83 c1 10             	add    $0x10,%ecx
c0102b82:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102b88:	83 c7 08             	add    $0x8,%edi
c0102b8b:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102b92:	83 f8 07             	cmp    $0x7,%eax
c0102b95:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102b9b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102ba1:	7e cd                	jle    c0102b70 <_svfprintf_r+0x13c0>
c0102ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ba6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102baa:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102bae:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bb1:	89 04 24             	mov    %eax,(%esp)
c0102bb4:	e8 07 37 00 00       	call   c01062c0 <__ssprint_r>
c0102bb9:	85 c0                	test   %eax,%eax
c0102bbb:	0f 85 bf ed ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102bc1:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102bc7:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102bca:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102bd0:	eb 9e                	jmp    c0102b70 <_svfprintf_r+0x13c0>
c0102bd2:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102bd9:	0f 85 14 fa ff ff    	jne    c01025f3 <_svfprintf_r+0xe43>
c0102bdf:	89 07                	mov    %eax,(%edi)
c0102be1:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102be7:	8d 51 01             	lea    0x1(%ecx),%edx
c0102bea:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102bf1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102bf7:	83 c0 01             	add    $0x1,%eax
c0102bfa:	83 f8 07             	cmp    $0x7,%eax
c0102bfd:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c03:	0f 8e 8b fa ff ff    	jle    c0102694 <_svfprintf_r+0xee4>
c0102c09:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c0f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c16:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c1d:	89 04 24             	mov    %eax,(%esp)
c0102c20:	e8 9b 36 00 00       	call   c01062c0 <__ssprint_r>
c0102c25:	85 c0                	test   %eax,%eax
c0102c27:	0f 85 53 ed ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102c2d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102c33:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102c36:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c3c:	e9 56 fa ff ff       	jmp    c0102697 <_svfprintf_r+0xee7>
c0102c41:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c47:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c4e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c52:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c55:	89 04 24             	mov    %eax,(%esp)
c0102c58:	e8 63 36 00 00       	call   c01062c0 <__ssprint_r>
c0102c5d:	85 c0                	test   %eax,%eax
c0102c5f:	0f 85 1b ed ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102c65:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102c6b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102c6e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c74:	e9 d6 f9 ff ff       	jmp    c010264f <_svfprintf_r+0xe9f>
c0102c79:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c7f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c83:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c86:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c8d:	89 04 24             	mov    %eax,(%esp)
c0102c90:	e8 2b 36 00 00       	call   c01062c0 <__ssprint_r>
c0102c95:	85 c0                	test   %eax,%eax
c0102c97:	0f 85 e3 ec ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102c9d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102ca3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ca6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102cac:	e9 6f f9 ff ff       	jmp    c0102620 <_svfprintf_r+0xe70>
c0102cb1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102cb7:	dd 1c 24             	fstpl  (%esp)
c0102cba:	e8 11 35 00 00       	call   c01061d0 <__fpclassifyd>
c0102cbf:	85 c0                	test   %eax,%eax
c0102cc1:	0f 85 a3 01 00 00    	jne    c0102e6a <_svfprintf_r+0x16ba>
c0102cc7:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0102cce:	ba a6 84 10 c0       	mov    $0xc01084a6,%edx
c0102cd3:	b8 aa 84 10 c0       	mov    $0xc01084aa,%eax
c0102cd8:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102cdf:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0102ce6:	00 00 00 
c0102ce9:	0f 4e c2             	cmovle %edx,%eax
c0102cec:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102cf2:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0102cf9:	ff ff ff 
c0102cfc:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0102d03:	00 00 00 
c0102d06:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102d0d:	00 00 00 
c0102d10:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0102d17:	00 00 00 
c0102d1a:	e9 29 ed ff ff       	jmp    c0101a48 <_svfprintf_r+0x298>
c0102d1f:	dd 00                	fldl   (%eax)
c0102d21:	83 c0 08             	add    $0x8,%eax
c0102d24:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102d2a:	89 45 14             	mov    %eax,0x14(%ebp)
c0102d2d:	e9 e6 ef ff ff       	jmp    c0101d18 <_svfprintf_r+0x568>
c0102d32:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102d38:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d3f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d46:	89 04 24             	mov    %eax,(%esp)
c0102d49:	e8 72 35 00 00       	call   c01062c0 <__ssprint_r>
c0102d4e:	85 c0                	test   %eax,%eax
c0102d50:	0f 85 2a ec ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102d56:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102d5c:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102d5f:	e9 6b f6 ff ff       	jmp    c01023cf <_svfprintf_r+0xc1f>
c0102d64:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102d6a:	83 c1 01             	add    $0x1,%ecx
c0102d6d:	83 c7 08             	add    $0x8,%edi
c0102d70:	c7 47 f8 d7 84 10 c0 	movl   $0xc01084d7,-0x8(%edi)
c0102d77:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102d7e:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102d84:	83 c0 01             	add    $0x1,%eax
c0102d87:	83 f8 07             	cmp    $0x7,%eax
c0102d8a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102d90:	0f 8f ef 02 00 00    	jg     c0103085 <_svfprintf_r+0x18d5>
c0102d96:	85 db                	test   %ebx,%ebx
c0102d98:	75 17                	jne    c0102db1 <_svfprintf_r+0x1601>
c0102d9a:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c0102da0:	85 d2                	test   %edx,%edx
c0102da2:	75 0d                	jne    c0102db1 <_svfprintf_r+0x1601>
c0102da4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102dab:	0f 84 ab f4 ff ff    	je     c010225c <_svfprintf_r+0xaac>
c0102db1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102db7:	83 c7 08             	add    $0x8,%edi
c0102dba:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102dbd:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102dc3:	89 47 fc             	mov    %eax,-0x4(%edi)
c0102dc6:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0102dc9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102dcf:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102dd5:	83 c0 01             	add    $0x1,%eax
c0102dd8:	83 f8 07             	cmp    $0x7,%eax
c0102ddb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102de1:	0f 8f 60 03 00 00    	jg     c0103147 <_svfprintf_r+0x1997>
c0102de7:	f7 db                	neg    %ebx
c0102de9:	85 db                	test   %ebx,%ebx
c0102deb:	0f 8e 21 03 00 00    	jle    c0103112 <_svfprintf_r+0x1962>
c0102df1:	83 fb 10             	cmp    $0x10,%ebx
c0102df4:	0f 8e c3 02 00 00    	jle    c01030bd <_svfprintf_r+0x190d>
c0102dfa:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0102e00:	eb 12                	jmp    c0102e14 <_svfprintf_r+0x1664>
c0102e02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102e08:	83 eb 10             	sub    $0x10,%ebx
c0102e0b:	83 fb 10             	cmp    $0x10,%ebx
c0102e0e:	0f 8e a9 02 00 00    	jle    c01030bd <_svfprintf_r+0x190d>
c0102e14:	83 c0 01             	add    $0x1,%eax
c0102e17:	83 c2 10             	add    $0x10,%edx
c0102e1a:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c0102e20:	83 c7 08             	add    $0x8,%edi
c0102e23:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102e2a:	83 f8 07             	cmp    $0x7,%eax
c0102e2d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102e33:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102e39:	7e cd                	jle    c0102e08 <_svfprintf_r+0x1658>
c0102e3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e3e:	89 74 24 08          	mov    %esi,0x8(%esp)
c0102e42:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e46:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e49:	89 04 24             	mov    %eax,(%esp)
c0102e4c:	e8 6f 34 00 00       	call   c01062c0 <__ssprint_r>
c0102e51:	85 c0                	test   %eax,%eax
c0102e53:	0f 85 27 eb ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0102e59:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102e5f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102e62:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102e68:	eb 9e                	jmp    c0102e08 <_svfprintf_r+0x1658>
c0102e6a:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c0102e70:	83 e3 df             	and    $0xffffffdf,%ebx
c0102e73:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c0102e7a:	0f 84 05 03 00 00    	je     c0103185 <_svfprintf_r+0x19d5>
c0102e80:	83 fb 47             	cmp    $0x47,%ebx
c0102e83:	75 16                	jne    c0102e9b <_svfprintf_r+0x16eb>
c0102e85:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0102e8b:	b8 01 00 00 00       	mov    $0x1,%eax
c0102e90:	85 d2                	test   %edx,%edx
c0102e92:	0f 45 c2             	cmovne %edx,%eax
c0102e95:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102e9b:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102ea1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102ea7:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c0102ead:	80 cc 01             	or     $0x1,%ah
c0102eb0:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c0102eb6:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0102ebc:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c0102ec3:	85 c0                	test   %eax,%eax
c0102ec5:	0f 88 ba 05 00 00    	js     c0103485 <_svfprintf_r+0x1cd5>
c0102ecb:	83 fb 46             	cmp    $0x46,%ebx
c0102ece:	0f 94 c0             	sete   %al
c0102ed1:	89 c6                	mov    %eax,%esi
c0102ed3:	0f 84 d4 03 00 00    	je     c01032ad <_svfprintf_r+0x1afd>
c0102ed9:	83 fb 45             	cmp    $0x45,%ebx
c0102edc:	0f 85 99 05 00 00    	jne    c010347b <_svfprintf_r+0x1ccb>
c0102ee2:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0102ee8:	dd 54 24 04          	fstl   0x4(%esp)
c0102eec:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0102ef3:	00 
c0102ef4:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0102efa:	8d 70 01             	lea    0x1(%eax),%esi
c0102efd:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0102f03:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0102f07:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0102f0d:	89 44 24 18          	mov    %eax,0x18(%esp)
c0102f11:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0102f17:	89 44 24 14          	mov    %eax,0x14(%esp)
c0102f1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f1e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0102f22:	89 04 24             	mov    %eax,(%esp)
c0102f25:	e8 56 09 00 00       	call   c0103880 <_dtoa_r>
c0102f2a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102f30:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0102f33:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0102f39:	d9 ee                	fldz   
c0102f3b:	d9 c9                	fxch   %st(1)
c0102f3d:	df e9                	fucomip %st(1),%st
c0102f3f:	dd d8                	fstp   %st(0)
c0102f41:	0f 8a fd 00 00 00    	jp     c0103044 <_svfprintf_r+0x1894>
c0102f47:	89 c8                	mov    %ecx,%eax
c0102f49:	0f 85 f5 00 00 00    	jne    c0103044 <_svfprintf_r+0x1894>
c0102f4f:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102f55:	83 fb 47             	cmp    $0x47,%ebx
c0102f58:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0102f5e:	0f 84 1e 04 00 00    	je     c0103382 <_svfprintf_r+0x1bd2>
c0102f64:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c0102f6b:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0102f71:	0f 8e 65 04 00 00    	jle    c01033dc <_svfprintf_r+0x1c2c>
c0102f77:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c0102f7e:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c0102f84:	0f 84 3c 05 00 00    	je     c01034c6 <_svfprintf_r+0x1d16>
c0102f8a:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c0102f90:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c0102f96:	0f 8f f7 04 00 00    	jg     c0103493 <_svfprintf_r+0x1ce3>
c0102f9c:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102fa2:	83 e0 01             	and    $0x1,%eax
c0102fa5:	0f 85 e2 05 00 00    	jne    c010358d <_svfprintf_r+0x1ddd>
c0102fab:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102fb1:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0102fb8:	00 00 00 
c0102fbb:	85 d2                	test   %edx,%edx
c0102fbd:	0f 49 c2             	cmovns %edx,%eax
c0102fc0:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102fc6:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c0102fcd:	0f 85 68 03 00 00    	jne    c010333b <_svfprintf_r+0x1b8b>
c0102fd3:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102fd9:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0102fdf:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102fe6:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102fed:	00 00 00 
c0102ff0:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0102ff6:	e9 4d ea ff ff       	jmp    c0101a48 <_svfprintf_r+0x298>
c0102ffb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103001:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103005:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103008:	89 44 24 04          	mov    %eax,0x4(%esp)
c010300c:	8b 45 08             	mov    0x8(%ebp),%eax
c010300f:	89 04 24             	mov    %eax,(%esp)
c0103012:	e8 a9 32 00 00       	call   c01062c0 <__ssprint_r>
c0103017:	85 c0                	test   %eax,%eax
c0103019:	0f 85 61 e9 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c010301f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103025:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103028:	e9 f2 f3 ff ff       	jmp    c010241f <_svfprintf_r+0xc6f>
c010302d:	89 d0                	mov    %edx,%eax
c010302f:	e9 d1 fa ff ff       	jmp    c0102b05 <_svfprintf_r+0x1355>
c0103034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103038:	8d 50 01             	lea    0x1(%eax),%edx
c010303b:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0103041:	c6 00 30             	movb   $0x30,(%eax)
c0103044:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c010304a:	39 c1                	cmp    %eax,%ecx
c010304c:	77 ea                	ja     c0103038 <_svfprintf_r+0x1888>
c010304e:	e9 fc fe ff ff       	jmp    c0102f4f <_svfprintf_r+0x179f>
c0103053:	8b 45 08             	mov    0x8(%ebp),%eax
c0103056:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c010305d:	00 
c010305e:	89 04 24             	mov    %eax,(%esp)
c0103061:	e8 4a 1b 00 00       	call   c0104bb0 <_malloc_r>
c0103066:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103069:	85 c0                	test   %eax,%eax
c010306b:	89 02                	mov    %eax,(%edx)
c010306d:	89 42 10             	mov    %eax,0x10(%edx)
c0103070:	0f 84 15 06 00 00    	je     c010368b <_svfprintf_r+0x1edb>
c0103076:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103079:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0103080:	e9 6c e7 ff ff       	jmp    c01017f1 <_svfprintf_r+0x41>
c0103085:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010308b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010308f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103092:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103096:	8b 45 08             	mov    0x8(%ebp),%eax
c0103099:	89 04 24             	mov    %eax,(%esp)
c010309c:	e8 1f 32 00 00       	call   c01062c0 <__ssprint_r>
c01030a1:	85 c0                	test   %eax,%eax
c01030a3:	0f 85 d7 e8 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01030a9:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01030af:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030b2:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030b8:	e9 d9 fc ff ff       	jmp    c0102d96 <_svfprintf_r+0x15e6>
c01030bd:	83 c0 01             	add    $0x1,%eax
c01030c0:	01 da                	add    %ebx,%edx
c01030c2:	c7 07 40 86 10 c0    	movl   $0xc0108640,(%edi)
c01030c8:	83 c7 08             	add    $0x8,%edi
c01030cb:	89 5f fc             	mov    %ebx,-0x4(%edi)
c01030ce:	83 f8 07             	cmp    $0x7,%eax
c01030d1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01030d7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01030dd:	7e 33                	jle    c0103112 <_svfprintf_r+0x1962>
c01030df:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01030e5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030ec:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030f3:	89 04 24             	mov    %eax,(%esp)
c01030f6:	e8 c5 31 00 00       	call   c01062c0 <__ssprint_r>
c01030fb:	85 c0                	test   %eax,%eax
c01030fd:	0f 85 7d e8 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0103103:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0103109:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010310c:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103112:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0103118:	83 c0 01             	add    $0x1,%eax
c010311b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103121:	89 1f                	mov    %ebx,(%edi)
c0103123:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103129:	01 da                	add    %ebx,%edx
c010312b:	83 f8 07             	cmp    $0x7,%eax
c010312e:	89 5f 04             	mov    %ebx,0x4(%edi)
c0103131:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103137:	0f 8f 86 f5 ff ff    	jg     c01026c3 <_svfprintf_r+0xf13>
c010313d:	83 c7 08             	add    $0x8,%edi
c0103140:	89 d1                	mov    %edx,%ecx
c0103142:	e9 15 f1 ff ff       	jmp    c010225c <_svfprintf_r+0xaac>
c0103147:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010314d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103151:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103154:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103158:	8b 45 08             	mov    0x8(%ebp),%eax
c010315b:	89 04 24             	mov    %eax,(%esp)
c010315e:	e8 5d 31 00 00       	call   c01062c0 <__ssprint_r>
c0103163:	85 c0                	test   %eax,%eax
c0103165:	0f 85 15 e8 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c010316b:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0103171:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103174:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010317a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103180:	e9 62 fc ff ff       	jmp    c0102de7 <_svfprintf_r+0x1637>
c0103185:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c010318c:	00 00 00 
c010318f:	e9 07 fd ff ff       	jmp    c0102e9b <_svfprintf_r+0x16eb>
c0103194:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010319a:	89 04 24             	mov    %eax,(%esp)
c010319d:	e8 9e 30 00 00       	call   c0106240 <strlen>
c01031a2:	e9 6a e8 ff ff       	jmp    c0101a11 <_svfprintf_r+0x261>
c01031a7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01031ad:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01031bb:	89 04 24             	mov    %eax,(%esp)
c01031be:	e8 fd 30 00 00       	call   c01062c0 <__ssprint_r>
c01031c3:	85 c0                	test   %eax,%eax
c01031c5:	0f 85 b5 e7 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01031cb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01031d1:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01031d4:	e9 76 f6 ff ff       	jmp    c010284f <_svfprintf_r+0x109f>
c01031d9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01031df:	89 44 24 08          	mov    %eax,0x8(%esp)
c01031e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031e6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ed:	89 04 24             	mov    %eax,(%esp)
c01031f0:	e8 cb 30 00 00       	call   c01062c0 <__ssprint_r>
c01031f5:	85 c0                	test   %eax,%eax
c01031f7:	0f 85 83 e7 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c01031fd:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103203:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103206:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010320c:	e9 f4 f8 ff ff       	jmp    c0102b05 <_svfprintf_r+0x1355>
c0103211:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103217:	89 44 24 08          	mov    %eax,0x8(%esp)
c010321b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010321e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103222:	8b 45 08             	mov    0x8(%ebp),%eax
c0103225:	89 04 24             	mov    %eax,(%esp)
c0103228:	e8 93 30 00 00       	call   c01062c0 <__ssprint_r>
c010322d:	85 c0                	test   %eax,%eax
c010322f:	0f 85 4b e7 ff ff    	jne    c0101980 <_svfprintf_r+0x1d0>
c0103235:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c010323b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010323e:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c0103244:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010324a:	e9 fa f8 ff ff       	jmp    c0102b49 <_svfprintf_r+0x1399>
c010324f:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103255:	b0 06                	mov    $0x6,%al
c0103257:	89 75 14             	mov    %esi,0x14(%ebp)
c010325a:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103261:	00 00 00 
c0103264:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010326b:	00 00 00 
c010326e:	83 fa 06             	cmp    $0x6,%edx
c0103271:	0f 46 c2             	cmovbe %edx,%eax
c0103274:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c010327a:	85 c0                	test   %eax,%eax
c010327c:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103282:	c7 85 28 ff ff ff d0 	movl   $0xc01084d0,-0xd8(%ebp)
c0103289:	84 10 c0 
c010328c:	0f 49 d0             	cmovns %eax,%edx
c010328f:	31 db                	xor    %ebx,%ebx
c0103291:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c0103297:	e9 b7 e7 ff ff       	jmp    c0101a53 <_svfprintf_r+0x2a3>
c010329c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01032a3:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01032a8:	e9 9d ea ff ff       	jmp    c0101d4a <_svfprintf_r+0x59a>
c01032ad:	ba 03 00 00 00       	mov    $0x3,%edx
c01032b2:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c01032b8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c01032bc:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c01032c2:	89 44 24 18          	mov    %eax,0x18(%esp)
c01032c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c01032cc:	89 44 24 14          	mov    %eax,0x14(%esp)
c01032d0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01032d6:	dd 54 24 04          	fstl   0x4(%esp)
c01032da:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01032de:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c01032e4:	89 44 24 10          	mov    %eax,0x10(%esp)
c01032e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01032eb:	89 04 24             	mov    %eax,(%esp)
c01032ee:	e8 8d 05 00 00       	call   c0103880 <_dtoa_r>
c01032f3:	83 fb 47             	cmp    $0x47,%ebx
c01032f6:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01032fc:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103302:	75 09                	jne    c010330d <_svfprintf_r+0x1b5d>
c0103304:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010330b:	74 5b                	je     c0103368 <_svfprintf_r+0x1bb8>
c010330d:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0103313:	89 f0                	mov    %esi,%eax
c0103315:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c010331b:	01 d1                	add    %edx,%ecx
c010331d:	84 c0                	test   %al,%al
c010331f:	0f 84 14 fc ff ff    	je     c0102f39 <_svfprintf_r+0x1789>
c0103325:	80 3a 30             	cmpb   $0x30,(%edx)
c0103328:	0f 84 37 02 00 00    	je     c0103565 <_svfprintf_r+0x1db5>
c010332e:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103334:	01 c1                	add    %eax,%ecx
c0103336:	e9 fe fb ff ff       	jmp    c0102f39 <_svfprintf_r+0x1789>
c010333b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103341:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0103347:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c010334c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0103353:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010335a:	00 00 00 
c010335d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0103363:	e9 e4 e6 ff ff       	jmp    c0101a4c <_svfprintf_r+0x29c>
c0103368:	dd d8                	fstp   %st(0)
c010336a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103370:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0103376:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010337c:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c0103382:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103388:	83 f8 fd             	cmp    $0xfffffffd,%eax
c010338b:	7c 48                	jl     c01033d5 <_svfprintf_r+0x1c25>
c010338d:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c0103393:	7c 40                	jl     c01033d5 <_svfprintf_r+0x1c25>
c0103395:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c010339b:	e9 ea fb ff ff       	jmp    c0102f8a <_svfprintf_r+0x17da>
c01033a0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01033a6:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01033ad:	89 75 14             	mov    %esi,0x14(%ebp)
c01033b0:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01033b7:	00 00 00 
c01033ba:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01033c0:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01033c6:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01033cd:	00 00 00 
c01033d0:	e9 73 e6 ff ff       	jmp    c0101a48 <_svfprintf_r+0x298>
c01033d5:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c01033dc:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033df:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c01033e6:	85 c9                	test   %ecx,%ecx
c01033e8:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c01033ee:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c01033f4:	0f 88 2c 02 00 00    	js     c0103626 <_svfprintf_r+0x1e76>
c01033fa:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c0103401:	83 f9 09             	cmp    $0x9,%ecx
c0103404:	0f 8f ea 00 00 00    	jg     c01034f4 <_svfprintf_r+0x1d44>
c010340a:	83 c1 30             	add    $0x30,%ecx
c010340d:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c0103414:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c010341a:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c0103420:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103426:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c010342c:	29 d0                	sub    %edx,%eax
c010342e:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c0103434:	89 da                	mov    %ebx,%edx
c0103436:	01 c2                	add    %eax,%edx
c0103438:	83 fb 01             	cmp    $0x1,%ebx
c010343b:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103441:	0f 8e 21 02 00 00    	jle    c0103668 <_svfprintf_r+0x1eb8>
c0103447:	31 c0                	xor    %eax,%eax
c0103449:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c0103450:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c0103457:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010345e:	00 00 00 
c0103461:	e9 60 fb ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c0103466:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c010346c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103473:	00 00 00 
c0103476:	e9 68 e4 ff ff       	jmp    c01018e3 <_svfprintf_r+0x133>
c010347b:	ba 02 00 00 00       	mov    $0x2,%edx
c0103480:	e9 2d fe ff ff       	jmp    c01032b2 <_svfprintf_r+0x1b02>
c0103485:	d9 e0                	fchs   
c0103487:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c010348e:	e9 38 fa ff ff       	jmp    c0102ecb <_svfprintf_r+0x171b>
c0103493:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c0103499:	ba 01 00 00 00       	mov    $0x1,%edx
c010349e:	85 c9                	test   %ecx,%ecx
c01034a0:	0f 8e 5a 01 00 00    	jle    c0103600 <_svfprintf_r+0x1e50>
c01034a6:	31 c0                	xor    %eax,%eax
c01034a8:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c01034ae:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c01034b5:	00 00 00 
c01034b8:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01034be:	0f 49 c2             	cmovns %edx,%eax
c01034c1:	e9 00 fb ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c01034c6:	85 c0                	test   %eax,%eax
c01034c8:	0f 8e 06 01 00 00    	jle    c01035d4 <_svfprintf_r+0x1e24>
c01034ce:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c01034d4:	85 f6                	test   %esi,%esi
c01034d6:	0f 85 d4 00 00 00    	jne    c01035b0 <_svfprintf_r+0x1e00>
c01034dc:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01034e3:	0f 85 c7 00 00 00    	jne    c01035b0 <_svfprintf_r+0x1e00>
c01034e9:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01034ef:	e9 d2 fa ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c01034f4:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c01034fa:	89 f3                	mov    %esi,%ebx
c01034fc:	b8 67 66 66 66       	mov    $0x66666667,%eax
c0103501:	83 eb 01             	sub    $0x1,%ebx
c0103504:	f7 e9                	imul   %ecx
c0103506:	89 c8                	mov    %ecx,%eax
c0103508:	c1 f8 1f             	sar    $0x1f,%eax
c010350b:	c1 fa 02             	sar    $0x2,%edx
c010350e:	29 c2                	sub    %eax,%edx
c0103510:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0103513:	01 c0                	add    %eax,%eax
c0103515:	29 c1                	sub    %eax,%ecx
c0103517:	83 fa 09             	cmp    $0x9,%edx
c010351a:	8d 41 30             	lea    0x30(%ecx),%eax
c010351d:	89 d1                	mov    %edx,%ecx
c010351f:	88 03                	mov    %al,(%ebx)
c0103521:	7f d9                	jg     c01034fc <_svfprintf_r+0x1d4c>
c0103523:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0103526:	83 c1 30             	add    $0x30,%ecx
c0103529:	39 f0                	cmp    %esi,%eax
c010352b:	88 4b ff             	mov    %cl,-0x1(%ebx)
c010352e:	0f 83 6a 01 00 00    	jae    c010369e <_svfprintf_r+0x1eee>
c0103534:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c010353a:	eb 07                	jmp    c0103543 <_svfprintf_r+0x1d93>
c010353c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103540:	0f b6 08             	movzbl (%eax),%ecx
c0103543:	83 c0 01             	add    $0x1,%eax
c0103546:	83 c2 01             	add    $0x1,%edx
c0103549:	39 f0                	cmp    %esi,%eax
c010354b:	88 4a ff             	mov    %cl,-0x1(%edx)
c010354e:	75 f0                	jne    c0103540 <_svfprintf_r+0x1d90>
c0103550:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103556:	29 d8                	sub    %ebx,%eax
c0103558:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c010355e:	01 d0                	add    %edx,%eax
c0103560:	e9 bb fe ff ff       	jmp    c0103420 <_svfprintf_r+0x1c70>
c0103565:	d9 ee                	fldz   
c0103567:	d9 c9                	fxch   %st(1)
c0103569:	db e9                	fucomi %st(1),%st
c010356b:	dd d9                	fstp   %st(1)
c010356d:	7a 06                	jp     c0103575 <_svfprintf_r+0x1dc5>
c010356f:	0f 84 b9 fd ff ff    	je     c010332e <_svfprintf_r+0x1b7e>
c0103575:	b8 01 00 00 00       	mov    $0x1,%eax
c010357a:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c0103580:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c0103586:	01 c1                	add    %eax,%ecx
c0103588:	e9 ac f9 ff ff       	jmp    c0102f39 <_svfprintf_r+0x1789>
c010358d:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103593:	31 c0                	xor    %eax,%eax
c0103595:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c010359c:	00 00 00 
c010359f:	83 c2 01             	add    $0x1,%edx
c01035a2:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01035a8:	0f 49 c2             	cmovns %edx,%eax
c01035ab:	e9 16 fa ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c01035b0:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c01035b6:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01035bc:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c01035c0:	89 c2                	mov    %eax,%edx
c01035c2:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01035c8:	31 c0                	xor    %eax,%eax
c01035ca:	85 d2                	test   %edx,%edx
c01035cc:	0f 49 c2             	cmovns %edx,%eax
c01035cf:	e9 f2 f9 ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c01035d4:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c01035da:	85 db                	test   %ebx,%ebx
c01035dc:	75 2f                	jne    c010360d <_svfprintf_r+0x1e5d>
c01035de:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01035e5:	75 26                	jne    c010360d <_svfprintf_r+0x1e5d>
c01035e7:	b8 01 00 00 00       	mov    $0x1,%eax
c01035ec:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c01035f3:	00 00 00 
c01035f6:	e9 cb f9 ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c01035fb:	90                   	nop
c01035fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103600:	b2 02                	mov    $0x2,%dl
c0103602:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c0103608:	e9 99 fe ff ff       	jmp    c01034a6 <_svfprintf_r+0x1cf6>
c010360d:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103613:	31 c0                	xor    %eax,%eax
c0103615:	83 c2 02             	add    $0x2,%edx
c0103618:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010361e:	0f 49 c2             	cmovns %edx,%eax
c0103621:	e9 a0 f9 ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c0103626:	f7 d9                	neg    %ecx
c0103628:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c010362f:	e9 cd fd ff ff       	jmp    c0103401 <_svfprintf_r+0x1c51>
c0103634:	8b 55 14             	mov    0x14(%ebp),%edx
c0103637:	8b 45 14             	mov    0x14(%ebp),%eax
c010363a:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0103640:	8b 12                	mov    (%edx),%edx
c0103642:	83 c0 04             	add    $0x4,%eax
c0103645:	89 45 14             	mov    %eax,0x14(%ebp)
c0103648:	85 d2                	test   %edx,%edx
c010364a:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0103650:	0f 89 a9 e2 ff ff    	jns    c01018ff <_svfprintf_r+0x14f>
c0103656:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c010365d:	ff ff ff 
c0103660:	89 c8                	mov    %ecx,%eax
c0103662:	e9 76 e2 ff ff       	jmp    c01018dd <_svfprintf_r+0x12d>
c0103667:	90                   	nop
c0103668:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c010366e:	83 e0 01             	and    $0x1,%eax
c0103671:	0f 85 d0 fd ff ff    	jne    c0103447 <_svfprintf_r+0x1c97>
c0103677:	85 d2                	test   %edx,%edx
c0103679:	0f 49 c2             	cmovns %edx,%eax
c010367c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103683:	00 00 00 
c0103686:	e9 3b f9 ff ff       	jmp    c0102fc6 <_svfprintf_r+0x1816>
c010368b:	8b 45 08             	mov    0x8(%ebp),%eax
c010368e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0103694:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103699:	e9 f5 e2 ff ff       	jmp    c0101993 <_svfprintf_r+0x1e3>
c010369e:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c01036a4:	e9 77 fd ff ff       	jmp    c0103420 <_svfprintf_r+0x1c70>
c01036a9:	66 90                	xchg   %ax,%ax
c01036ab:	66 90                	xchg   %ax,%ax
c01036ad:	66 90                	xchg   %ax,%ax
c01036af:	90                   	nop

c01036b0 <quorem>:
c01036b0:	55                   	push   %ebp
c01036b1:	89 c1                	mov    %eax,%ecx
c01036b3:	89 e5                	mov    %esp,%ebp
c01036b5:	57                   	push   %edi
c01036b6:	89 d7                	mov    %edx,%edi
c01036b8:	56                   	push   %esi
c01036b9:	53                   	push   %ebx
c01036ba:	83 ec 3c             	sub    $0x3c,%esp
c01036bd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01036c0:	8b 42 10             	mov    0x10(%edx),%eax
c01036c3:	3b 41 10             	cmp    0x10(%ecx),%eax
c01036c6:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01036c9:	89 ca                	mov    %ecx,%edx
c01036cb:	0f 8f 9f 01 00 00    	jg     c0103870 <quorem+0x1c0>
c01036d1:	83 e8 01             	sub    $0x1,%eax
c01036d4:	83 c7 14             	add    $0x14,%edi
c01036d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01036da:	c1 e0 02             	shl    $0x2,%eax
c01036dd:	83 c2 14             	add    $0x14,%edx
c01036e0:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c01036e3:	01 d0                	add    %edx,%eax
c01036e5:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01036e8:	8b 13                	mov    (%ebx),%edx
c01036ea:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01036ed:	8b 00                	mov    (%eax),%eax
c01036ef:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c01036f2:	8d 4a 01             	lea    0x1(%edx),%ecx
c01036f5:	31 d2                	xor    %edx,%edx
c01036f7:	f7 f1                	div    %ecx
c01036f9:	85 c0                	test   %eax,%eax
c01036fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01036fe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103701:	0f 84 b5 00 00 00    	je     c01037bc <quorem+0x10c>
c0103707:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010370a:	31 f6                	xor    %esi,%esi
c010370c:	89 fa                	mov    %edi,%edx
c010370e:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0103711:	89 f7                	mov    %esi,%edi
c0103713:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c010371a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103720:	83 c2 04             	add    $0x4,%edx
c0103723:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103726:	83 c0 04             	add    $0x4,%eax
c0103729:	0f b7 ce             	movzwl %si,%ecx
c010372c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c0103730:	03 4d dc             	add    -0x24(%ebp),%ecx
c0103733:	c1 ee 10             	shr    $0x10,%esi
c0103736:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c010373a:	89 cb                	mov    %ecx,%ebx
c010373c:	0f b7 c9             	movzwl %cx,%ecx
c010373f:	c1 eb 10             	shr    $0x10,%ebx
c0103742:	29 cf                	sub    %ecx,%edi
c0103744:	01 f3                	add    %esi,%ebx
c0103746:	89 de                	mov    %ebx,%esi
c0103748:	0f b7 db             	movzwl %bx,%ebx
c010374b:	c1 ee 10             	shr    $0x10,%esi
c010374e:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0103751:	8b 70 fc             	mov    -0x4(%eax),%esi
c0103754:	0f b7 ce             	movzwl %si,%ecx
c0103757:	01 f9                	add    %edi,%ecx
c0103759:	c1 ee 10             	shr    $0x10,%esi
c010375c:	29 de                	sub    %ebx,%esi
c010375e:	89 cb                	mov    %ecx,%ebx
c0103760:	c1 fb 10             	sar    $0x10,%ebx
c0103763:	0f b7 c9             	movzwl %cx,%ecx
c0103766:	01 de                	add    %ebx,%esi
c0103768:	89 f7                	mov    %esi,%edi
c010376a:	c1 e6 10             	shl    $0x10,%esi
c010376d:	09 ce                	or     %ecx,%esi
c010376f:	c1 ff 10             	sar    $0x10,%edi
c0103772:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c0103775:	89 70 fc             	mov    %esi,-0x4(%eax)
c0103778:	73 a6                	jae    c0103720 <quorem+0x70>
c010377a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010377d:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0103780:	8b 10                	mov    (%eax),%edx
c0103782:	85 d2                	test   %edx,%edx
c0103784:	75 36                	jne    c01037bc <quorem+0x10c>
c0103786:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103789:	89 c2                	mov    %eax,%edx
c010378b:	83 e8 04             	sub    $0x4,%eax
c010378e:	39 c1                	cmp    %eax,%ecx
c0103790:	73 21                	jae    c01037b3 <quorem+0x103>
c0103792:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103795:	85 f6                	test   %esi,%esi
c0103797:	75 1a                	jne    c01037b3 <quorem+0x103>
c0103799:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010379c:	eb 08                	jmp    c01037a6 <quorem+0xf6>
c010379e:	66 90                	xchg   %ax,%ax
c01037a0:	8b 18                	mov    (%eax),%ebx
c01037a2:	85 db                	test   %ebx,%ebx
c01037a4:	75 0a                	jne    c01037b0 <quorem+0x100>
c01037a6:	83 e8 04             	sub    $0x4,%eax
c01037a9:	83 ea 01             	sub    $0x1,%edx
c01037ac:	39 c1                	cmp    %eax,%ecx
c01037ae:	72 f0                	jb     c01037a0 <quorem+0xf0>
c01037b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01037b3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01037b6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01037b9:	89 50 10             	mov    %edx,0x10(%eax)
c01037bc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01037bf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01037c3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01037c6:	89 04 24             	mov    %eax,(%esp)
c01037c9:	e8 a2 23 00 00       	call   c0105b70 <__mcmp>
c01037ce:	85 c0                	test   %eax,%eax
c01037d0:	0f 88 8e 00 00 00    	js     c0103864 <quorem+0x1b4>
c01037d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01037d9:	31 f6                	xor    %esi,%esi
c01037db:	83 c0 01             	add    $0x1,%eax
c01037de:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01037e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01037e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01037e8:	83 c7 04             	add    $0x4,%edi
c01037eb:	8b 4f fc             	mov    -0x4(%edi),%ecx
c01037ee:	83 c0 04             	add    $0x4,%eax
c01037f1:	8b 58 fc             	mov    -0x4(%eax),%ebx
c01037f4:	0f b7 d1             	movzwl %cx,%edx
c01037f7:	29 d6                	sub    %edx,%esi
c01037f9:	0f b7 d3             	movzwl %bx,%edx
c01037fc:	01 f2                	add    %esi,%edx
c01037fe:	c1 e9 10             	shr    $0x10,%ecx
c0103801:	c1 eb 10             	shr    $0x10,%ebx
c0103804:	29 cb                	sub    %ecx,%ebx
c0103806:	89 d1                	mov    %edx,%ecx
c0103808:	c1 f9 10             	sar    $0x10,%ecx
c010380b:	0f b7 d2             	movzwl %dx,%edx
c010380e:	01 cb                	add    %ecx,%ebx
c0103810:	89 de                	mov    %ebx,%esi
c0103812:	c1 e3 10             	shl    $0x10,%ebx
c0103815:	09 d3                	or     %edx,%ebx
c0103817:	c1 fe 10             	sar    $0x10,%esi
c010381a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c010381d:	89 58 fc             	mov    %ebx,-0x4(%eax)
c0103820:	73 c6                	jae    c01037e8 <quorem+0x138>
c0103822:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103825:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103828:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c010382b:	8b 02                	mov    (%edx),%eax
c010382d:	85 c0                	test   %eax,%eax
c010382f:	75 33                	jne    c0103864 <quorem+0x1b4>
c0103831:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103834:	8d 42 fc             	lea    -0x4(%edx),%eax
c0103837:	39 c1                	cmp    %eax,%ecx
c0103839:	73 20                	jae    c010385b <quorem+0x1ab>
c010383b:	8b 72 fc             	mov    -0x4(%edx),%esi
c010383e:	85 f6                	test   %esi,%esi
c0103840:	75 19                	jne    c010385b <quorem+0x1ab>
c0103842:	89 fa                	mov    %edi,%edx
c0103844:	eb 08                	jmp    c010384e <quorem+0x19e>
c0103846:	66 90                	xchg   %ax,%ax
c0103848:	8b 18                	mov    (%eax),%ebx
c010384a:	85 db                	test   %ebx,%ebx
c010384c:	75 0a                	jne    c0103858 <quorem+0x1a8>
c010384e:	83 e8 04             	sub    $0x4,%eax
c0103851:	83 ea 01             	sub    $0x1,%edx
c0103854:	39 c1                	cmp    %eax,%ecx
c0103856:	72 f0                	jb     c0103848 <quorem+0x198>
c0103858:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c010385b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010385e:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103861:	89 78 10             	mov    %edi,0x10(%eax)
c0103864:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103867:	83 c4 3c             	add    $0x3c,%esp
c010386a:	5b                   	pop    %ebx
c010386b:	5e                   	pop    %esi
c010386c:	5f                   	pop    %edi
c010386d:	5d                   	pop    %ebp
c010386e:	c3                   	ret    
c010386f:	90                   	nop
c0103870:	83 c4 3c             	add    $0x3c,%esp
c0103873:	31 c0                	xor    %eax,%eax
c0103875:	5b                   	pop    %ebx
c0103876:	5e                   	pop    %esi
c0103877:	5f                   	pop    %edi
c0103878:	5d                   	pop    %ebp
c0103879:	c3                   	ret    
c010387a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0103880 <_dtoa_r>:
c0103880:	55                   	push   %ebp
c0103881:	89 e5                	mov    %esp,%ebp
c0103883:	57                   	push   %edi
c0103884:	56                   	push   %esi
c0103885:	53                   	push   %ebx
c0103886:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c010388c:	8b 75 08             	mov    0x8(%ebp),%esi
c010388f:	dd 45 0c             	fldl   0xc(%ebp)
c0103892:	8b 5d 20             	mov    0x20(%ebp),%ebx
c0103895:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103898:	8b 46 40             	mov    0x40(%esi),%eax
c010389b:	85 c0                	test   %eax,%eax
c010389d:	74 23                	je     c01038c2 <_dtoa_r+0x42>
c010389f:	8b 4e 44             	mov    0x44(%esi),%ecx
c01038a2:	ba 01 00 00 00       	mov    $0x1,%edx
c01038a7:	d3 e2                	shl    %cl,%edx
c01038a9:	89 48 04             	mov    %ecx,0x4(%eax)
c01038ac:	89 50 08             	mov    %edx,0x8(%eax)
c01038af:	89 44 24 04          	mov    %eax,0x4(%esp)
c01038b3:	89 34 24             	mov    %esi,(%esp)
c01038b6:	e8 95 1b 00 00       	call   c0105450 <_Bfree>
c01038bb:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c01038c2:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c01038c5:	85 ff                	test   %edi,%edi
c01038c7:	0f 88 3b 02 00 00    	js     c0103b08 <_dtoa_r+0x288>
c01038cd:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c01038d3:	89 f8                	mov    %edi,%eax
c01038d5:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c01038da:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c01038df:	0f 84 e3 01 00 00    	je     c0103ac8 <_dtoa_r+0x248>
c01038e5:	dd 45 c0             	fldl   -0x40(%ebp)
c01038e8:	d9 ee                	fldz   
c01038ea:	d9 c9                	fxch   %st(1)
c01038ec:	db e9                	fucomi %st(1),%st
c01038ee:	dd d9                	fstp   %st(1)
c01038f0:	7a 36                	jp     c0103928 <_dtoa_r+0xa8>
c01038f2:	75 34                	jne    c0103928 <_dtoa_r+0xa8>
c01038f4:	dd d8                	fstp   %st(0)
c01038f6:	8b 4d 24             	mov    0x24(%ebp),%ecx
c01038f9:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01038fc:	85 c9                	test   %ecx,%ecx
c01038fe:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0103904:	0f 84 4e 02 00 00    	je     c0103b58 <_dtoa_r+0x2d8>
c010390a:	8b 45 24             	mov    0x24(%ebp),%eax
c010390d:	c7 00 d8 84 10 c0    	movl   $0xc01084d8,(%eax)
c0103913:	b8 d7 84 10 c0       	mov    $0xc01084d7,%eax
c0103918:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c010391e:	5b                   	pop    %ebx
c010391f:	5e                   	pop    %esi
c0103920:	5f                   	pop    %edi
c0103921:	5d                   	pop    %ebp
c0103922:	c3                   	ret    
c0103923:	90                   	nop
c0103924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103928:	8d 45 e0             	lea    -0x20(%ebp),%eax
c010392b:	89 fb                	mov    %edi,%ebx
c010392d:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103931:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0103934:	dd 54 24 04          	fstl   0x4(%esp)
c0103938:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010393c:	dd 5d b8             	fstpl  -0x48(%ebp)
c010393f:	89 34 24             	mov    %esi,(%esp)
c0103942:	c1 eb 14             	shr    $0x14,%ebx
c0103945:	e8 76 25 00 00       	call   c0105ec0 <__d2b>
c010394a:	85 db                	test   %ebx,%ebx
c010394c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010394f:	0f 85 db 01 00 00    	jne    c0103b30 <_dtoa_r+0x2b0>
c0103955:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103958:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c010395b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010395e:	01 c3                	add    %eax,%ebx
c0103960:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c0103966:	0f 8c ec 07 00 00    	jl     c0104158 <_dtoa_r+0x8d8>
c010396c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010396f:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c0103974:	89 f8                	mov    %edi,%eax
c0103976:	29 d9                	sub    %ebx,%ecx
c0103978:	d3 e0                	shl    %cl,%eax
c010397a:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c0103980:	d3 ea                	shr    %cl,%edx
c0103982:	09 d0                	or     %edx,%eax
c0103984:	31 d2                	xor    %edx,%edx
c0103986:	83 eb 01             	sub    $0x1,%ebx
c0103989:	89 55 cc             	mov    %edx,-0x34(%ebp)
c010398c:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010398f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103992:	df 6d c8             	fildll -0x38(%ebp)
c0103995:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103998:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c010399f:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c01039a6:	dd 45 b8             	fldl   -0x48(%ebp)
c01039a9:	d8 25 70 86 10 c0    	fsubs  0xc0108670
c01039af:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c01039b2:	d9 7d d2             	fnstcw -0x2e(%ebp)
c01039b5:	dc 0d 88 86 10 c0    	fmull  0xc0108688
c01039bb:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01039bf:	b4 0c                	mov    $0xc,%ah
c01039c1:	dc 05 90 86 10 c0    	faddl  0xc0108690
c01039c7:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c01039cb:	db 45 d4             	fildl  -0x2c(%ebp)
c01039ce:	dc 0d 98 86 10 c0    	fmull  0xc0108698
c01039d4:	de c1                	faddp  %st,%st(1)
c01039d6:	d9 6d d0             	fldcw  -0x30(%ebp)
c01039d9:	db 55 b8             	fistl  -0x48(%ebp)
c01039dc:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01039df:	d9 ee                	fldz   
c01039e1:	df e9                	fucomip %st(1),%st
c01039e3:	0f 87 27 07 00 00    	ja     c0104110 <_dtoa_r+0x890>
c01039e9:	dd d8                	fstp   %st(0)
c01039eb:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c01039ef:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c01039f6:	77 24                	ja     c0103a1c <_dtoa_r+0x19c>
c01039f8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01039fb:	dd 04 c5 60 87 10 c0 	fldl   -0x3fef78a0(,%eax,8)
c0103a02:	dd 45 c0             	fldl   -0x40(%ebp)
c0103a05:	d9 c9                	fxch   %st(1)
c0103a07:	df e9                	fucomip %st(1),%st
c0103a09:	dd d8                	fstp   %st(0)
c0103a0b:	0f 86 5f 07 00 00    	jbe    c0104170 <_dtoa_r+0x8f0>
c0103a11:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103a15:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0103a1c:	89 d0                	mov    %edx,%eax
c0103a1e:	29 d8                	sub    %ebx,%eax
c0103a20:	83 e8 01             	sub    $0x1,%eax
c0103a23:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c0103a2a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103a2d:	0f 88 0d 07 00 00    	js     c0104140 <_dtoa_r+0x8c0>
c0103a33:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103a36:	85 c0                	test   %eax,%eax
c0103a38:	0f 88 ea 06 00 00    	js     c0104128 <_dtoa_r+0x8a8>
c0103a3e:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103a41:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103a44:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0103a4b:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c0103a4f:	0f 87 0b 03 00 00    	ja     c0103d60 <_dtoa_r+0x4e0>
c0103a55:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c0103a59:	0f 8e 23 10 00 00    	jle    c0104a82 <_dtoa_r+0x1202>
c0103a5f:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c0103a63:	31 c0                	xor    %eax,%eax
c0103a65:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c0103a69:	0f 84 43 0d 00 00    	je     c01047b2 <_dtoa_r+0xf32>
c0103a6f:	0f 8e f3 00 00 00    	jle    c0103b68 <_dtoa_r+0x2e8>
c0103a75:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c0103a79:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103a80:	0f 84 f3 00 00 00    	je     c0103b79 <_dtoa_r+0x2f9>
c0103a86:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c0103a8a:	0f 85 d7 02 00 00    	jne    c0103d67 <_dtoa_r+0x4e7>
c0103a90:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103a93:	03 5d 18             	add    0x18(%ebp),%ebx
c0103a96:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c0103a99:	83 c3 01             	add    $0x1,%ebx
c0103a9c:	83 fb 0e             	cmp    $0xe,%ebx
c0103a9f:	0f 96 c2             	setbe  %dl
c0103aa2:	85 db                	test   %ebx,%ebx
c0103aa4:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c0103aa7:	0f 8e a7 08 00 00    	jle    c0104354 <_dtoa_r+0xad4>
c0103aad:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103ab0:	83 fb 0e             	cmp    $0xe,%ebx
c0103ab3:	89 df                	mov    %ebx,%edi
c0103ab5:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103ab9:	20 45 b4             	and    %al,-0x4c(%ebp)
c0103abc:	e9 d6 00 00 00       	jmp    c0103b97 <_dtoa_r+0x317>
c0103ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103ac8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0103acb:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0103ace:	85 d2                	test   %edx,%edx
c0103ad0:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0103ad6:	b8 69 86 10 c0       	mov    $0xc0108669,%eax
c0103adb:	74 43                	je     c0103b20 <_dtoa_r+0x2a0>
c0103add:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0103ae0:	85 db                	test   %ebx,%ebx
c0103ae2:	0f 84 30 fe ff ff    	je     c0103918 <_dtoa_r+0x98>
c0103ae8:	8b 75 24             	mov    0x24(%ebp),%esi
c0103aeb:	8d 50 08             	lea    0x8(%eax),%edx
c0103aee:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0103af2:	8d 48 03             	lea    0x3(%eax),%ecx
c0103af5:	0f 44 d1             	cmove  %ecx,%edx
c0103af8:	89 16                	mov    %edx,(%esi)
c0103afa:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103b00:	5b                   	pop    %ebx
c0103b01:	5e                   	pop    %esi
c0103b02:	5f                   	pop    %edi
c0103b03:	5d                   	pop    %ebp
c0103b04:	c3                   	ret    
c0103b05:	8d 76 00             	lea    0x0(%esi),%esi
c0103b08:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c0103b0e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c0103b14:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c0103b17:	e9 b7 fd ff ff       	jmp    c01038d3 <_dtoa_r+0x53>
c0103b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b20:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c0103b26:	ba 60 86 10 c0       	mov    $0xc0108660,%edx
c0103b2b:	0f 44 c2             	cmove  %edx,%eax
c0103b2e:	eb ad                	jmp    c0103add <_dtoa_r+0x25d>
c0103b30:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0103b33:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c0103b39:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103b3c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103b43:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0103b48:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c0103b4d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103b50:	e9 51 fe ff ff       	jmp    c01039a6 <_dtoa_r+0x126>
c0103b55:	8d 76 00             	lea    0x0(%esi),%esi
c0103b58:	b8 d7 84 10 c0       	mov    $0xc01084d7,%eax
c0103b5d:	e9 b6 fd ff ff       	jmp    c0103918 <_dtoa_r+0x98>
c0103b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103b68:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0103b6c:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0103b73:	0f 85 ee 01 00 00    	jne    c0103d67 <_dtoa_r+0x4e7>
c0103b79:	8b 55 18             	mov    0x18(%ebp),%edx
c0103b7c:	85 d2                	test   %edx,%edx
c0103b7e:	0f 8e b6 07 00 00    	jle    c010433a <_dtoa_r+0xaba>
c0103b84:	8b 7d 18             	mov    0x18(%ebp),%edi
c0103b87:	83 ff 0e             	cmp    $0xe,%edi
c0103b8a:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103b8e:	20 45 b4             	and    %al,-0x4c(%ebp)
c0103b91:	89 7d 90             	mov    %edi,-0x70(%ebp)
c0103b94:	89 7d a8             	mov    %edi,-0x58(%ebp)
c0103b97:	83 ff 17             	cmp    $0x17,%edi
c0103b9a:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103ba1:	0f 86 e5 0e 00 00    	jbe    c0104a8c <_dtoa_r+0x120c>
c0103ba7:	b9 01 00 00 00       	mov    $0x1,%ecx
c0103bac:	b8 04 00 00 00       	mov    $0x4,%eax
c0103bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103bb8:	01 c0                	add    %eax,%eax
c0103bba:	89 ca                	mov    %ecx,%edx
c0103bbc:	8d 58 14             	lea    0x14(%eax),%ebx
c0103bbf:	39 fb                	cmp    %edi,%ebx
c0103bc1:	8d 49 01             	lea    0x1(%ecx),%ecx
c0103bc4:	76 f2                	jbe    c0103bb8 <_dtoa_r+0x338>
c0103bc6:	89 56 44             	mov    %edx,0x44(%esi)
c0103bc9:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103bcd:	89 34 24             	mov    %esi,(%esp)
c0103bd0:	e8 db 17 00 00       	call   c01053b0 <_Balloc>
c0103bd5:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0103bd9:	89 c7                	mov    %eax,%edi
c0103bdb:	89 46 40             	mov    %eax,0x40(%esi)
c0103bde:	0f 84 bb 01 00 00    	je     c0103d9f <_dtoa_r+0x51f>
c0103be4:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103be7:	dd 45 c0             	fldl   -0x40(%ebp)
c0103bea:	85 db                	test   %ebx,%ebx
c0103bec:	0f 8e de 07 00 00    	jle    c01043d0 <_dtoa_r+0xb50>
c0103bf2:	89 d8                	mov    %ebx,%eax
c0103bf4:	83 e0 0f             	and    $0xf,%eax
c0103bf7:	dd 04 c5 60 87 10 c0 	fldl   -0x3fef78a0(,%eax,8)
c0103bfe:	89 d8                	mov    %ebx,%eax
c0103c00:	c1 f8 04             	sar    $0x4,%eax
c0103c03:	a8 10                	test   $0x10,%al
c0103c05:	0f 84 cd 05 00 00    	je     c01041d8 <_dtoa_r+0x958>
c0103c0b:	dd 05 40 87 10 c0    	fldl   0xc0108740
c0103c11:	83 e0 0f             	and    $0xf,%eax
c0103c14:	b9 03 00 00 00       	mov    $0x3,%ecx
c0103c19:	d8 fa                	fdivr  %st(2),%st
c0103c1b:	85 c0                	test   %eax,%eax
c0103c1d:	74 22                	je     c0103c41 <_dtoa_r+0x3c1>
c0103c1f:	31 d2                	xor    %edx,%edx
c0103c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103c28:	a8 01                	test   $0x1,%al
c0103c2a:	74 0e                	je     c0103c3a <_dtoa_r+0x3ba>
c0103c2c:	d9 c9                	fxch   %st(1)
c0103c2e:	dc 0c d5 20 87 10 c0 	fmull  -0x3fef78e0(,%edx,8)
c0103c35:	d9 c9                	fxch   %st(1)
c0103c37:	83 c1 01             	add    $0x1,%ecx
c0103c3a:	83 c2 01             	add    $0x1,%edx
c0103c3d:	d1 f8                	sar    %eax
c0103c3f:	75 e7                	jne    c0103c28 <_dtoa_r+0x3a8>
c0103c41:	de f1                	fdivp  %st,%st(1)
c0103c43:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103c46:	85 c0                	test   %eax,%eax
c0103c48:	74 0a                	je     c0103c54 <_dtoa_r+0x3d4>
c0103c4a:	d9 e8                	fld1   
c0103c4c:	df e9                	fucomip %st(1),%st
c0103c4e:	0f 87 92 0b 00 00    	ja     c01047e6 <_dtoa_r+0xf66>
c0103c54:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0103c57:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103c5a:	db 45 d4             	fildl  -0x2c(%ebp)
c0103c5d:	d8 c9                	fmul   %st(1),%st
c0103c5f:	d8 05 7c 86 10 c0    	fadds  0xc010867c
c0103c65:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103c68:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0103c6f:	85 c0                	test   %eax,%eax
c0103c71:	0f 84 89 05 00 00    	je     c0104200 <_dtoa_r+0x980>
c0103c77:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103c7a:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0103c7d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103c80:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103c83:	85 c0                	test   %eax,%eax
c0103c85:	0f 84 b5 07 00 00    	je     c0104440 <_dtoa_r+0xbc0>
c0103c8b:	d9 05 84 86 10 c0    	flds   0xc0108684
c0103c91:	8d 57 01             	lea    0x1(%edi),%edx
c0103c94:	dc 34 cd 58 87 10 c0 	fdivl  -0x3fef78a8(,%ecx,8)
c0103c9b:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103c9e:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103ca2:	b4 0c                	mov    $0xc,%ah
c0103ca4:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103ca8:	dc 65 c0             	fsubl  -0x40(%ebp)
c0103cab:	d9 c9                	fxch   %st(1)
c0103cad:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103cb0:	db 55 d4             	fistl  -0x2c(%ebp)
c0103cb3:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103cb6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103cb9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103cbc:	83 c0 30             	add    $0x30,%eax
c0103cbf:	db 45 d4             	fildl  -0x2c(%ebp)
c0103cc2:	de e9                	fsubrp %st,%st(1)
c0103cc4:	d9 c9                	fxch   %st(1)
c0103cc6:	88 07                	mov    %al,(%edi)
c0103cc8:	db e9                	fucomi %st(1),%st
c0103cca:	77 7f                	ja     c0103d4b <_dtoa_r+0x4cb>
c0103ccc:	d9 c1                	fld    %st(1)
c0103cce:	d8 2d 74 86 10 c0    	fsubrs 0xc0108674
c0103cd4:	d9 c9                	fxch   %st(1)
c0103cd6:	db e9                	fucomi %st(1),%st
c0103cd8:	dd d9                	fstp   %st(1)
c0103cda:	0f 87 33 0c 00 00    	ja     c0104913 <_dtoa_r+0x1093>
c0103ce0:	83 f9 01             	cmp    $0x1,%ecx
c0103ce3:	0f 8e c4 06 00 00    	jle    c01043ad <_dtoa_r+0xb2d>
c0103ce9:	01 f9                	add    %edi,%ecx
c0103ceb:	d9 05 78 86 10 c0    	flds   0xc0108678
c0103cf1:	eb 25                	jmp    c0103d18 <_dtoa_r+0x498>
c0103cf3:	90                   	nop
c0103cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103cf8:	d9 c1                	fld    %st(1)
c0103cfa:	d8 2d 74 86 10 c0    	fsubrs 0xc0108674
c0103d00:	d9 c9                	fxch   %st(1)
c0103d02:	db e9                	fucomi %st(1),%st
c0103d04:	dd d9                	fstp   %st(1)
c0103d06:	0f 87 14 0c 00 00    	ja     c0104920 <_dtoa_r+0x10a0>
c0103d0c:	39 ca                	cmp    %ecx,%edx
c0103d0e:	0f 84 a4 06 00 00    	je     c01043b8 <_dtoa_r+0xb38>
c0103d14:	d9 c9                	fxch   %st(1)
c0103d16:	d9 ca                	fxch   %st(2)
c0103d18:	dc c9                	fmul   %st,%st(1)
c0103d1a:	83 c2 01             	add    $0x1,%edx
c0103d1d:	dc ca                	fmul   %st,%st(2)
c0103d1f:	d9 ca                	fxch   %st(2)
c0103d21:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103d24:	db 55 d4             	fistl  -0x2c(%ebp)
c0103d27:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103d2a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103d2d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103d30:	83 c0 30             	add    $0x30,%eax
c0103d33:	db 45 d4             	fildl  -0x2c(%ebp)
c0103d36:	de e9                	fsubrp %st,%st(1)
c0103d38:	d9 c9                	fxch   %st(1)
c0103d3a:	88 42 ff             	mov    %al,-0x1(%edx)
c0103d3d:	db e9                	fucomi %st(1),%st
c0103d3f:	76 b7                	jbe    c0103cf8 <_dtoa_r+0x478>
c0103d41:	dd d8                	fstp   %st(0)
c0103d43:	dd d8                	fstp   %st(0)
c0103d45:	dd d8                	fstp   %st(0)
c0103d47:	dd d8                	fstp   %st(0)
c0103d49:	eb 06                	jmp    c0103d51 <_dtoa_r+0x4d1>
c0103d4b:	dd d8                	fstp   %st(0)
c0103d4d:	dd d8                	fstp   %st(0)
c0103d4f:	dd d8                	fstp   %st(0)
c0103d51:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103d54:	89 fb                	mov    %edi,%ebx
c0103d56:	89 d7                	mov    %edx,%edi
c0103d58:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103d5b:	e9 70 03 00 00       	jmp    c01040d0 <_dtoa_r+0x850>
c0103d60:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c0103d67:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103d6e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103d75:	00 
c0103d76:	89 34 24             	mov    %esi,(%esp)
c0103d79:	e8 32 16 00 00       	call   c01053b0 <_Balloc>
c0103d7e:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103d85:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c0103d8c:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c0103d93:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c0103d9a:	89 c7                	mov    %eax,%edi
c0103d9c:	89 46 40             	mov    %eax,0x40(%esi)
c0103d9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103da2:	85 c0                	test   %eax,%eax
c0103da4:	0f 88 2e 01 00 00    	js     c0103ed8 <_dtoa_r+0x658>
c0103daa:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c0103dae:	0f 8f 24 01 00 00    	jg     c0103ed8 <_dtoa_r+0x658>
c0103db4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103db7:	dd 04 c5 60 87 10 c0 	fldl   -0x3fef78a0(,%eax,8)
c0103dbe:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103dc1:	85 c0                	test   %eax,%eax
c0103dc3:	7f 0e                	jg     c0103dd3 <_dtoa_r+0x553>
c0103dc5:	8b 45 18             	mov    0x18(%ebp),%eax
c0103dc8:	c1 e8 1f             	shr    $0x1f,%eax
c0103dcb:	84 c0                	test   %al,%al
c0103dcd:	0f 85 9d 07 00 00    	jne    c0104570 <_dtoa_r+0xcf0>
c0103dd3:	dd 45 c0             	fldl   -0x40(%ebp)
c0103dd6:	d9 c0                	fld    %st(0)
c0103dd8:	d8 f2                	fdiv   %st(2),%st
c0103dda:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103ddd:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0103de1:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103de5:	b4 0c                	mov    $0xc,%ah
c0103de7:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103deb:	8d 47 01             	lea    0x1(%edi),%eax
c0103dee:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103df1:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103df4:	db 5d d4             	fistpl -0x2c(%ebp)
c0103df7:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103dfa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103dfd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103e00:	8d 42 30             	lea    0x30(%edx),%eax
c0103e03:	db 45 d4             	fildl  -0x2c(%ebp)
c0103e06:	d8 ca                	fmul   %st(2),%st
c0103e08:	88 07                	mov    %al,(%edi)
c0103e0a:	de e9                	fsubrp %st,%st(1)
c0103e0c:	74 66                	je     c0103e74 <_dtoa_r+0x5f4>
c0103e0e:	d8 0d 78 86 10 c0    	fmuls  0xc0108678
c0103e14:	d9 ee                	fldz   
c0103e16:	d9 c9                	fxch   %st(1)
c0103e18:	db e9                	fucomi %st(1),%st
c0103e1a:	dd d9                	fstp   %st(1)
c0103e1c:	0f 8b 33 0c 00 00    	jnp    c0104a55 <_dtoa_r+0x11d5>
c0103e22:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103e25:	8d 47 02             	lea    0x2(%edi),%eax
c0103e28:	d9 05 78 86 10 c0    	flds   0xc0108678
c0103e2e:	01 fb                	add    %edi,%ebx
c0103e30:	eb 19                	jmp    c0103e4b <_dtoa_r+0x5cb>
c0103e32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103e38:	dc c9                	fmul   %st,%st(1)
c0103e3a:	83 c0 01             	add    $0x1,%eax
c0103e3d:	d9 ee                	fldz   
c0103e3f:	d9 ca                	fxch   %st(2)
c0103e41:	db ea                	fucomi %st(2),%st
c0103e43:	dd da                	fstp   %st(2)
c0103e45:	0f 8b 73 09 00 00    	jnp    c01047be <_dtoa_r+0xf3e>
c0103e4b:	d9 c1                	fld    %st(1)
c0103e4d:	39 d8                	cmp    %ebx,%eax
c0103e4f:	d8 f3                	fdiv   %st(3),%st
c0103e51:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103e54:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103e57:	db 5d d4             	fistpl -0x2c(%ebp)
c0103e5a:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103e5d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103e60:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103e63:	8d 4a 30             	lea    0x30(%edx),%ecx
c0103e66:	db 45 d4             	fildl  -0x2c(%ebp)
c0103e69:	d8 cb                	fmul   %st(3),%st
c0103e6b:	88 48 ff             	mov    %cl,-0x1(%eax)
c0103e6e:	de ea                	fsubrp %st,%st(2)
c0103e70:	75 c6                	jne    c0103e38 <_dtoa_r+0x5b8>
c0103e72:	dd d8                	fstp   %st(0)
c0103e74:	d8 c0                	fadd   %st(0),%st
c0103e76:	db e9                	fucomi %st(1),%st
c0103e78:	77 1e                	ja     c0103e98 <_dtoa_r+0x618>
c0103e7a:	d9 c9                	fxch   %st(1)
c0103e7c:	df e9                	fucomip %st(1),%st
c0103e7e:	dd d8                	fstp   %st(0)
c0103e80:	0f 8a 44 09 00 00    	jp     c01047ca <_dtoa_r+0xf4a>
c0103e86:	0f 85 3e 09 00 00    	jne    c01047ca <_dtoa_r+0xf4a>
c0103e8c:	83 e2 01             	and    $0x1,%edx
c0103e8f:	90                   	nop
c0103e90:	0f 84 34 09 00 00    	je     c01047ca <_dtoa_r+0xf4a>
c0103e96:	eb 04                	jmp    c0103e9c <_dtoa_r+0x61c>
c0103e98:	dd d8                	fstp   %st(0)
c0103e9a:	dd d8                	fstp   %st(0)
c0103e9c:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0103e9f:	89 fb                	mov    %edi,%ebx
c0103ea1:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c0103ea5:	89 cf                	mov    %ecx,%edi
c0103ea7:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c0103eaa:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c0103ead:	eb 0f                	jmp    c0103ebe <_dtoa_r+0x63e>
c0103eaf:	90                   	nop
c0103eb0:	39 d3                	cmp    %edx,%ebx
c0103eb2:	0f 84 75 09 00 00    	je     c010482d <_dtoa_r+0xfad>
c0103eb8:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0103ebc:	89 d7                	mov    %edx,%edi
c0103ebe:	3c 39                	cmp    $0x39,%al
c0103ec0:	8d 57 ff             	lea    -0x1(%edi),%edx
c0103ec3:	74 eb                	je     c0103eb0 <_dtoa_r+0x630>
c0103ec5:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0103ec8:	83 c0 01             	add    $0x1,%eax
c0103ecb:	88 02                	mov    %al,(%edx)
c0103ecd:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0103ed0:	e9 fb 01 00 00       	jmp    c01040d0 <_dtoa_r+0x850>
c0103ed5:	8d 76 00             	lea    0x0(%esi),%esi
c0103ed8:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0103edb:	85 c9                	test   %ecx,%ecx
c0103edd:	0f 85 9d 02 00 00    	jne    c0104180 <_dtoa_r+0x900>
c0103ee3:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0103ee6:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0103ee9:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0103ef0:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103ef3:	85 c0                	test   %eax,%eax
c0103ef5:	7e 14                	jle    c0103f0b <_dtoa_r+0x68b>
c0103ef7:	85 db                	test   %ebx,%ebx
c0103ef9:	7e 10                	jle    c0103f0b <_dtoa_r+0x68b>
c0103efb:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103efe:	39 d8                	cmp    %ebx,%eax
c0103f00:	0f 4f c3             	cmovg  %ebx,%eax
c0103f03:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103f06:	29 c3                	sub    %eax,%ebx
c0103f08:	29 45 ac             	sub    %eax,-0x54(%ebp)
c0103f0b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103f0e:	85 c0                	test   %eax,%eax
c0103f10:	7e 61                	jle    c0103f73 <_dtoa_r+0x6f3>
c0103f12:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103f15:	85 c0                	test   %eax,%eax
c0103f17:	0f 84 72 04 00 00    	je     c010438f <_dtoa_r+0xb0f>
c0103f1d:	85 d2                	test   %edx,%edx
c0103f1f:	7e 47                	jle    c0103f68 <_dtoa_r+0x6e8>
c0103f21:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f24:	89 54 24 08          	mov    %edx,0x8(%esp)
c0103f28:	89 34 24             	mov    %esi,(%esp)
c0103f2b:	89 55 88             	mov    %edx,-0x78(%ebp)
c0103f2e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f32:	e8 f9 19 00 00       	call   c0105930 <__pow5mult>
c0103f37:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103f3a:	89 34 24             	mov    %esi,(%esp)
c0103f3d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103f41:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f45:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103f48:	e8 13 18 00 00       	call   c0105760 <__multiply>
c0103f4d:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103f50:	89 34 24             	mov    %esi,(%esp)
c0103f53:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0103f57:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0103f5a:	e8 f1 14 00 00       	call   c0105450 <_Bfree>
c0103f5f:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0103f62:	8b 55 88             	mov    -0x78(%ebp),%edx
c0103f65:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103f68:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103f6b:	29 d0                	sub    %edx,%eax
c0103f6d:	0f 85 1f 04 00 00    	jne    c0104392 <_dtoa_r+0xb12>
c0103f73:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103f7a:	00 
c0103f7b:	89 34 24             	mov    %esi,(%esp)
c0103f7e:	e8 ad 17 00 00       	call   c0105730 <__i2b>
c0103f83:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0103f86:	85 c9                	test   %ecx,%ecx
c0103f88:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103f8b:	7e 13                	jle    c0103fa0 <_dtoa_r+0x720>
c0103f8d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103f91:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f95:	89 34 24             	mov    %esi,(%esp)
c0103f98:	e8 93 19 00 00       	call   c0105930 <__pow5mult>
c0103f9d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103fa0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103fa4:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103fab:	0f 8e f7 05 00 00    	jle    c01045a8 <_dtoa_r+0xd28>
c0103fb1:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103fb4:	ba 01 00 00 00       	mov    $0x1,%edx
c0103fb9:	85 c0                	test   %eax,%eax
c0103fbb:	0f 85 27 05 00 00    	jne    c01044e8 <_dtoa_r+0xc68>
c0103fc1:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103fc4:	01 d0                	add    %edx,%eax
c0103fc6:	83 e0 1f             	and    $0x1f,%eax
c0103fc9:	89 c2                	mov    %eax,%edx
c0103fcb:	0f 84 57 03 00 00    	je     c0104328 <_dtoa_r+0xaa8>
c0103fd1:	b8 20 00 00 00       	mov    $0x20,%eax
c0103fd6:	29 d0                	sub    %edx,%eax
c0103fd8:	83 f8 04             	cmp    $0x4,%eax
c0103fdb:	0f 8e 8c 0a 00 00    	jle    c0104a6d <_dtoa_r+0x11ed>
c0103fe1:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0103fe6:	29 d0                	sub    %edx,%eax
c0103fe8:	01 45 a0             	add    %eax,-0x60(%ebp)
c0103feb:	01 c3                	add    %eax,%ebx
c0103fed:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103ff0:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103ff3:	85 c0                	test   %eax,%eax
c0103ff5:	7e 16                	jle    c010400d <_dtoa_r+0x78d>
c0103ff7:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ffb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103ffe:	89 34 24             	mov    %esi,(%esp)
c0104001:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104005:	e8 46 1a 00 00       	call   c0105a50 <__lshift>
c010400a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010400d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104010:	85 c0                	test   %eax,%eax
c0104012:	7e 16                	jle    c010402a <_dtoa_r+0x7aa>
c0104014:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104018:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010401b:	89 34 24             	mov    %esi,(%esp)
c010401e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104022:	e8 29 1a 00 00       	call   c0105a50 <__lshift>
c0104027:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010402a:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010402d:	85 c0                	test   %eax,%eax
c010402f:	0f 85 d3 04 00 00    	jne    c0104508 <_dtoa_r+0xc88>
c0104035:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104039:	0f 8e 11 02 00 00    	jle    c0104250 <_dtoa_r+0x9d0>
c010403f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104042:	85 c0                	test   %eax,%eax
c0104044:	0f 8f 06 02 00 00    	jg     c0104250 <_dtoa_r+0x9d0>
c010404a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010404d:	85 c0                	test   %eax,%eax
c010404f:	0f 85 e0 01 00 00    	jne    c0104235 <_dtoa_r+0x9b5>
c0104055:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104058:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010405f:	00 
c0104060:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c0104067:	00 
c0104068:	89 34 24             	mov    %esi,(%esp)
c010406b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010406f:	e8 fc 13 00 00       	call   c0105470 <__multadd>
c0104074:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0104077:	89 44 24 04          	mov    %eax,0x4(%esp)
c010407b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010407e:	89 04 24             	mov    %eax,(%esp)
c0104081:	e8 ea 1a 00 00       	call   c0105b70 <__mcmp>
c0104086:	85 c0                	test   %eax,%eax
c0104088:	0f 8e a7 01 00 00    	jle    c0104235 <_dtoa_r+0x9b5>
c010408e:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0104092:	89 fb                	mov    %edi,%ebx
c0104094:	83 c7 01             	add    $0x1,%edi
c0104097:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c010409b:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01040a2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01040a5:	89 34 24             	mov    %esi,(%esp)
c01040a8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01040ac:	e8 9f 13 00 00       	call   c0105450 <_Bfree>
c01040b1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01040b4:	85 c0                	test   %eax,%eax
c01040b6:	74 18                	je     c01040d0 <_dtoa_r+0x850>
c01040b8:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c01040bb:	0f 85 a7 02 00 00    	jne    c0104368 <_dtoa_r+0xae8>
c01040c1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01040c4:	89 34 24             	mov    %esi,(%esp)
c01040c7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01040cb:	e8 80 13 00 00       	call   c0105450 <_Bfree>
c01040d0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01040d3:	89 34 24             	mov    %esi,(%esp)
c01040d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01040da:	e8 71 13 00 00       	call   c0105450 <_Bfree>
c01040df:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01040e2:	8b 75 1c             	mov    0x1c(%ebp),%esi
c01040e5:	c6 07 00             	movb   $0x0,(%edi)
c01040e8:	83 c0 01             	add    $0x1,%eax
c01040eb:	89 06                	mov    %eax,(%esi)
c01040ed:	8b 45 24             	mov    0x24(%ebp),%eax
c01040f0:	85 c0                	test   %eax,%eax
c01040f2:	0f 84 90 02 00 00    	je     c0104388 <_dtoa_r+0xb08>
c01040f8:	8b 45 24             	mov    0x24(%ebp),%eax
c01040fb:	89 38                	mov    %edi,(%eax)
c01040fd:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0104103:	89 d8                	mov    %ebx,%eax
c0104105:	5b                   	pop    %ebx
c0104106:	5e                   	pop    %esi
c0104107:	5f                   	pop    %edi
c0104108:	5d                   	pop    %ebp
c0104109:	c3                   	ret    
c010410a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104110:	db 45 b8             	fildl  -0x48(%ebp)
c0104113:	df e9                	fucomip %st(1),%st
c0104115:	dd d8                	fstp   %st(0)
c0104117:	7a 06                	jp     c010411f <_dtoa_r+0x89f>
c0104119:	0f 84 cc f8 ff ff    	je     c01039eb <_dtoa_r+0x16b>
c010411f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104123:	e9 c3 f8 ff ff       	jmp    c01039eb <_dtoa_r+0x16b>
c0104128:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010412b:	29 45 a0             	sub    %eax,-0x60(%ebp)
c010412e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0104135:	f7 d8                	neg    %eax
c0104137:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010413a:	e9 0c f9 ff ff       	jmp    c0103a4b <_dtoa_r+0x1cb>
c010413f:	90                   	nop
c0104140:	f7 d8                	neg    %eax
c0104142:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104145:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c010414c:	e9 e2 f8 ff ff       	jmp    c0103a33 <_dtoa_r+0x1b3>
c0104151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104158:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010415b:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c0104160:	29 d9                	sub    %ebx,%ecx
c0104162:	d3 e0                	shl    %cl,%eax
c0104164:	e9 1b f8 ff ff       	jmp    c0103984 <_dtoa_r+0x104>
c0104169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104170:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0104177:	e9 a0 f8 ff ff       	jmp    c0103a1c <_dtoa_r+0x19c>
c010417c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104180:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0104184:	0f 8e fe 06 00 00    	jle    c0104888 <_dtoa_r+0x1008>
c010418a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010418d:	83 e8 01             	sub    $0x1,%eax
c0104190:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0104193:	0f 8c 3b 06 00 00    	jl     c01047d4 <_dtoa_r+0xf54>
c0104199:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010419c:	29 c2                	sub    %eax,%edx
c010419e:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01041a1:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01041a4:	85 c9                	test   %ecx,%ecx
c01041a6:	89 c8                	mov    %ecx,%eax
c01041a8:	0f 88 83 07 00 00    	js     c0104931 <_dtoa_r+0x10b1>
c01041ae:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01041b5:	00 
c01041b6:	89 34 24             	mov    %esi,(%esp)
c01041b9:	89 55 8c             	mov    %edx,-0x74(%ebp)
c01041bc:	01 45 a0             	add    %eax,-0x60(%ebp)
c01041bf:	01 45 ac             	add    %eax,-0x54(%ebp)
c01041c2:	e8 69 15 00 00       	call   c0105730 <__i2b>
c01041c7:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01041ca:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01041cd:	e9 1e fd ff ff       	jmp    c0103ef0 <_dtoa_r+0x670>
c01041d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01041d8:	d9 c1                	fld    %st(1)
c01041da:	b9 02 00 00 00       	mov    $0x2,%ecx
c01041df:	e9 37 fa ff ff       	jmp    c0103c1b <_dtoa_r+0x39b>
c01041e4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01041e7:	db 45 d4             	fildl  -0x2c(%ebp)
c01041ea:	d8 c9                	fmul   %st(1),%st
c01041ec:	d8 05 7c 86 10 c0    	fadds  0xc010867c
c01041f2:	dd 5d c0             	fstpl  -0x40(%ebp)
c01041f5:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c01041fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104200:	d8 25 80 86 10 c0    	fsubs  0xc0108680
c0104206:	dd 45 c0             	fldl   -0x40(%ebp)
c0104209:	d9 c9                	fxch   %st(1)
c010420b:	db e9                	fucomi %st(1),%st
c010420d:	0f 87 0d 02 00 00    	ja     c0104420 <_dtoa_r+0xba0>
c0104213:	d9 c9                	fxch   %st(1)
c0104215:	d9 e0                	fchs   
c0104217:	df e9                	fucomip %st(1),%st
c0104219:	dd d8                	fstp   %st(0)
c010421b:	0f 86 a7 01 00 00    	jbe    c01043c8 <_dtoa_r+0xb48>
c0104221:	dd d8                	fstp   %st(0)
c0104223:	eb 02                	jmp    c0104227 <_dtoa_r+0x9a7>
c0104225:	dd d8                	fstp   %st(0)
c0104227:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010422e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104235:	8b 45 18             	mov    0x18(%ebp),%eax
c0104238:	89 fb                	mov    %edi,%ebx
c010423a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0104241:	f7 d0                	not    %eax
c0104243:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104246:	e9 57 fe ff ff       	jmp    c01040a2 <_dtoa_r+0x822>
c010424b:	90                   	nop
c010424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104250:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104253:	85 c0                	test   %eax,%eax
c0104255:	0f 85 c5 03 00 00    	jne    c0104620 <_dtoa_r+0xda0>
c010425b:	89 75 08             	mov    %esi,0x8(%ebp)
c010425e:	bb 01 00 00 00       	mov    $0x1,%ebx
c0104263:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c0104266:	eb 24                	jmp    c010428c <_dtoa_r+0xa0c>
c0104268:	8b 45 08             	mov    0x8(%ebp),%eax
c010426b:	83 c3 01             	add    $0x1,%ebx
c010426e:	89 74 24 04          	mov    %esi,0x4(%esp)
c0104272:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104279:	00 
c010427a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104281:	00 
c0104282:	89 04 24             	mov    %eax,(%esp)
c0104285:	e8 e6 11 00 00       	call   c0105470 <__multadd>
c010428a:	89 c6                	mov    %eax,%esi
c010428c:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010428f:	89 f0                	mov    %esi,%eax
c0104291:	e8 1a f4 ff ff       	call   c01036b0 <quorem>
c0104296:	83 c0 30             	add    $0x30,%eax
c0104299:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c010429c:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c01042a0:	7c c6                	jl     c0104268 <_dtoa_r+0x9e8>
c01042a2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01042a5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01042a8:	ba 01 00 00 00       	mov    $0x1,%edx
c01042ad:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c01042b0:	8b 75 08             	mov    0x8(%ebp),%esi
c01042b3:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01042ba:	85 c0                	test   %eax,%eax
c01042bc:	0f 4f d0             	cmovg  %eax,%edx
c01042bf:	01 fa                	add    %edi,%edx
c01042c1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01042c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01042cb:	00 
c01042cc:	89 34 24             	mov    %esi,(%esp)
c01042cf:	89 55 ac             	mov    %edx,-0x54(%ebp)
c01042d2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01042d6:	e8 75 17 00 00       	call   c0105a50 <__lshift>
c01042db:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c01042de:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01042e2:	89 04 24             	mov    %eax,(%esp)
c01042e5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01042e8:	e8 83 18 00 00       	call   c0105b70 <__mcmp>
c01042ed:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01042f0:	83 f8 00             	cmp    $0x0,%eax
c01042f3:	0f 8e 41 06 00 00    	jle    c010493a <_dtoa_r+0x10ba>
c01042f9:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c01042fd:	eb 0f                	jmp    c010430e <_dtoa_r+0xa8e>
c01042ff:	90                   	nop
c0104300:	39 c7                	cmp    %eax,%edi
c0104302:	0f 84 70 05 00 00    	je     c0104878 <_dtoa_r+0xff8>
c0104308:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c010430c:	89 c2                	mov    %eax,%edx
c010430e:	80 f9 39             	cmp    $0x39,%cl
c0104311:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104314:	74 ea                	je     c0104300 <_dtoa_r+0xa80>
c0104316:	83 c1 01             	add    $0x1,%ecx
c0104319:	89 fb                	mov    %edi,%ebx
c010431b:	88 08                	mov    %cl,(%eax)
c010431d:	89 d7                	mov    %edx,%edi
c010431f:	e9 7e fd ff ff       	jmp    c01040a2 <_dtoa_r+0x822>
c0104324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104328:	b8 1c 00 00 00       	mov    $0x1c,%eax
c010432d:	01 45 a0             	add    %eax,-0x60(%ebp)
c0104330:	01 c3                	add    %eax,%ebx
c0104332:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104335:	e9 b6 fc ff ff       	jmp    c0103ff0 <_dtoa_r+0x770>
c010433a:	ba 01 00 00 00       	mov    $0x1,%edx
c010433f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c0104346:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c010434d:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c0104354:	21 c2                	and    %eax,%edx
c0104356:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c0104359:	31 d2                	xor    %edx,%edx
c010435b:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0104362:	e9 62 f8 ff ff       	jmp    c0103bc9 <_dtoa_r+0x349>
c0104367:	90                   	nop
c0104368:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010436b:	85 d2                	test   %edx,%edx
c010436d:	0f 84 4e fd ff ff    	je     c01040c1 <_dtoa_r+0x841>
c0104373:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104376:	89 34 24             	mov    %esi,(%esp)
c0104379:	89 44 24 04          	mov    %eax,0x4(%esp)
c010437d:	e8 ce 10 00 00       	call   c0105450 <_Bfree>
c0104382:	e9 3a fd ff ff       	jmp    c01040c1 <_dtoa_r+0x841>
c0104387:	90                   	nop
c0104388:	89 d8                	mov    %ebx,%eax
c010438a:	e9 89 f5 ff ff       	jmp    c0103918 <_dtoa_r+0x98>
c010438f:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104392:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104396:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104399:	89 34 24             	mov    %esi,(%esp)
c010439c:	89 44 24 04          	mov    %eax,0x4(%esp)
c01043a0:	e8 8b 15 00 00       	call   c0105930 <__pow5mult>
c01043a5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01043a8:	e9 c6 fb ff ff       	jmp    c0103f73 <_dtoa_r+0x6f3>
c01043ad:	dd d8                	fstp   %st(0)
c01043af:	dd d8                	fstp   %st(0)
c01043b1:	eb 15                	jmp    c01043c8 <_dtoa_r+0xb48>
c01043b3:	90                   	nop
c01043b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01043b8:	dd d8                	fstp   %st(0)
c01043ba:	dd d8                	fstp   %st(0)
c01043bc:	dd d8                	fstp   %st(0)
c01043be:	eb 08                	jmp    c01043c8 <_dtoa_r+0xb48>
c01043c0:	dd d8                	fstp   %st(0)
c01043c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01043c8:	dd 5d c0             	fstpl  -0x40(%ebp)
c01043cb:	e9 cf f9 ff ff       	jmp    c0103d9f <_dtoa_r+0x51f>
c01043d0:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01043d3:	f7 d8                	neg    %eax
c01043d5:	0f 84 6a 04 00 00    	je     c0104845 <_dtoa_r+0xfc5>
c01043db:	89 c2                	mov    %eax,%edx
c01043dd:	b9 02 00 00 00       	mov    $0x2,%ecx
c01043e2:	83 e2 0f             	and    $0xf,%edx
c01043e5:	c1 f8 04             	sar    $0x4,%eax
c01043e8:	dd 04 d5 60 87 10 c0 	fldl   -0x3fef78a0(,%edx,8)
c01043ef:	85 c0                	test   %eax,%eax
c01043f1:	d8 c9                	fmul   %st(1),%st
c01043f3:	0f 84 4a f8 ff ff    	je     c0103c43 <_dtoa_r+0x3c3>
c01043f9:	31 d2                	xor    %edx,%edx
c01043fb:	90                   	nop
c01043fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104400:	a8 01                	test   $0x1,%al
c0104402:	74 0a                	je     c010440e <_dtoa_r+0xb8e>
c0104404:	dc 0c d5 20 87 10 c0 	fmull  -0x3fef78e0(,%edx,8)
c010440b:	83 c1 01             	add    $0x1,%ecx
c010440e:	83 c2 01             	add    $0x1,%edx
c0104411:	d1 f8                	sar    %eax
c0104413:	75 eb                	jne    c0104400 <_dtoa_r+0xb80>
c0104415:	e9 29 f8 ff ff       	jmp    c0103c43 <_dtoa_r+0x3c3>
c010441a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104420:	dd d8                	fstp   %st(0)
c0104422:	dd d8                	fstp   %st(0)
c0104424:	dd d8                	fstp   %st(0)
c0104426:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010442d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104434:	e9 55 fc ff ff       	jmp    c010408e <_dtoa_r+0x80e>
c0104439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104440:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0104443:	8d 41 ff             	lea    -0x1(%ecx),%eax
c0104446:	dd 45 c0             	fldl   -0x40(%ebp)
c0104449:	dc 0c c5 60 87 10 c0 	fmull  -0x3fef78a0(,%eax,8)
c0104450:	d9 c9                	fxch   %st(1)
c0104452:	89 45 88             	mov    %eax,-0x78(%ebp)
c0104455:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0104459:	8d 57 01             	lea    0x1(%edi),%edx
c010445c:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c010445f:	b4 0c                	mov    $0xc,%ah
c0104461:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0104465:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104468:	db 55 d4             	fistl  -0x2c(%ebp)
c010446b:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010446e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104471:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104474:	83 c0 30             	add    $0x30,%eax
c0104477:	83 f9 01             	cmp    $0x1,%ecx
c010447a:	db 45 d4             	fildl  -0x2c(%ebp)
c010447d:	de e9                	fsubrp %st,%st(1)
c010447f:	88 07                	mov    %al,(%edi)
c0104481:	89 d0                	mov    %edx,%eax
c0104483:	74 37                	je     c01044bc <_dtoa_r+0xc3c>
c0104485:	d9 05 78 86 10 c0    	flds   0xc0108678
c010448b:	eb 05                	jmp    c0104492 <_dtoa_r+0xc12>
c010448d:	8d 76 00             	lea    0x0(%esi),%esi
c0104490:	d9 c9                	fxch   %st(1)
c0104492:	dc c9                	fmul   %st,%st(1)
c0104494:	d9 c9                	fxch   %st(1)
c0104496:	83 c0 01             	add    $0x1,%eax
c0104499:	d9 6d d0             	fldcw  -0x30(%ebp)
c010449c:	db 55 d4             	fistl  -0x2c(%ebp)
c010449f:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01044a2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c01044a5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01044a8:	83 c1 30             	add    $0x30,%ecx
c01044ab:	39 d8                	cmp    %ebx,%eax
c01044ad:	db 45 d4             	fildl  -0x2c(%ebp)
c01044b0:	de e9                	fsubrp %st,%st(1)
c01044b2:	88 48 ff             	mov    %cl,-0x1(%eax)
c01044b5:	75 d9                	jne    c0104490 <_dtoa_r+0xc10>
c01044b7:	dd d9                	fstp   %st(1)
c01044b9:	03 55 88             	add    -0x78(%ebp),%edx
c01044bc:	d9 05 84 86 10 c0    	flds   0xc0108684
c01044c2:	d9 c2                	fld    %st(2)
c01044c4:	d8 c1                	fadd   %st(1),%st
c01044c6:	d9 ca                	fxch   %st(2)
c01044c8:	db ea                	fucomi %st(2),%st
c01044ca:	dd da                	fstp   %st(2)
c01044cc:	0f 86 7f 03 00 00    	jbe    c0104851 <_dtoa_r+0xfd1>
c01044d2:	dd d8                	fstp   %st(0)
c01044d4:	dd d8                	fstp   %st(0)
c01044d6:	dd d8                	fstp   %st(0)
c01044d8:	dd d8                	fstp   %st(0)
c01044da:	89 fb                	mov    %edi,%ebx
c01044dc:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c01044e0:	89 d7                	mov    %edx,%edi
c01044e2:	e9 d7 f9 ff ff       	jmp    c0103ebe <_dtoa_r+0x63e>
c01044e7:	90                   	nop
c01044e8:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c01044eb:	8b 41 10             	mov    0x10(%ecx),%eax
c01044ee:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c01044f2:	89 04 24             	mov    %eax,(%esp)
c01044f5:	e8 56 11 00 00       	call   c0105650 <__hi0bits>
c01044fa:	ba 20 00 00 00       	mov    $0x20,%edx
c01044ff:	29 c2                	sub    %eax,%edx
c0104501:	e9 bb fa ff ff       	jmp    c0103fc1 <_dtoa_r+0x741>
c0104506:	66 90                	xchg   %ax,%ax
c0104508:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010450b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010450f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104512:	89 04 24             	mov    %eax,(%esp)
c0104515:	e8 56 16 00 00       	call   c0105b70 <__mcmp>
c010451a:	85 c0                	test   %eax,%eax
c010451c:	0f 89 13 fb ff ff    	jns    c0104035 <_dtoa_r+0x7b5>
c0104522:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104525:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010452c:	00 
c010452d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104534:	00 
c0104535:	89 34 24             	mov    %esi,(%esp)
c0104538:	89 44 24 04          	mov    %eax,0x4(%esp)
c010453c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104540:	e8 2b 0f 00 00       	call   c0105470 <__multadd>
c0104545:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104548:	85 c9                	test   %ecx,%ecx
c010454a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010454d:	0f 85 8d 00 00 00    	jne    c01045e0 <_dtoa_r+0xd60>
c0104553:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c0104557:	8b 45 90             	mov    -0x70(%ebp),%eax
c010455a:	7f 0a                	jg     c0104566 <_dtoa_r+0xce6>
c010455c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104560:	0f 8f ff 04 00 00    	jg     c0104a65 <_dtoa_r+0x11e5>
c0104566:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104569:	e9 ed fc ff ff       	jmp    c010425b <_dtoa_r+0x9db>
c010456e:	66 90                	xchg   %ax,%ax
c0104570:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104573:	85 db                	test   %ebx,%ebx
c0104575:	0f 85 aa fc ff ff    	jne    c0104225 <_dtoa_r+0x9a5>
c010457b:	d8 0d 80 86 10 c0    	fmuls  0xc0108680
c0104581:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0104588:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c010458f:	dd 45 c0             	fldl   -0x40(%ebp)
c0104592:	d9 c9                	fxch   %st(1)
c0104594:	df e9                	fucomip %st(1),%st
c0104596:	dd d8                	fstp   %st(0)
c0104598:	0f 83 97 fc ff ff    	jae    c0104235 <_dtoa_r+0x9b5>
c010459e:	e9 eb fa ff ff       	jmp    c010408e <_dtoa_r+0x80e>
c01045a3:	90                   	nop
c01045a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01045a8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01045ab:	85 c0                	test   %eax,%eax
c01045ad:	0f 85 fe f9 ff ff    	jne    c0103fb1 <_dtoa_r+0x731>
c01045b3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01045b6:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c01045bb:	0f 85 f0 f9 ff ff    	jne    c0103fb1 <_dtoa_r+0x731>
c01045c1:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c01045c6:	0f 84 e5 f9 ff ff    	je     c0103fb1 <_dtoa_r+0x731>
c01045cc:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c01045d0:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c01045d4:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c01045db:	e9 d1 f9 ff ff       	jmp    c0103fb1 <_dtoa_r+0x731>
c01045e0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01045e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045ea:	00 
c01045eb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01045f2:	00 
c01045f3:	89 34 24             	mov    %esi,(%esp)
c01045f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045fa:	e8 71 0e 00 00       	call   c0105470 <__multadd>
c01045ff:	8b 55 90             	mov    -0x70(%ebp),%edx
c0104602:	85 d2                	test   %edx,%edx
c0104604:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104607:	8b 45 90             	mov    -0x70(%ebp),%eax
c010460a:	7f 0a                	jg     c0104616 <_dtoa_r+0xd96>
c010460c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104610:	0f 8f 4f 04 00 00    	jg     c0104a65 <_dtoa_r+0x11e5>
c0104616:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104620:	85 db                	test   %ebx,%ebx
c0104622:	7e 16                	jle    c010463a <_dtoa_r+0xdba>
c0104624:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104627:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010462b:	89 34 24             	mov    %esi,(%esp)
c010462e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104632:	e8 19 14 00 00       	call   c0105a50 <__lshift>
c0104637:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010463a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c010463d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104640:	85 db                	test   %ebx,%ebx
c0104642:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104645:	0f 85 11 03 00 00    	jne    c010495c <_dtoa_r+0x10dc>
c010464b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010464e:	8d 5f 01             	lea    0x1(%edi),%ebx
c0104651:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c0104654:	01 f8                	add    %edi,%eax
c0104656:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c0104659:	89 45 90             	mov    %eax,-0x70(%ebp)
c010465c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010465f:	83 e0 01             	and    $0x1,%eax
c0104662:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0104665:	eb 2e                	jmp    c0104695 <_dtoa_r+0xe15>
c0104667:	90                   	nop
c0104668:	e8 03 0e 00 00       	call   c0105470 <__multadd>
c010466d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104674:	00 
c0104675:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010467c:	00 
c010467d:	89 34 24             	mov    %esi,(%esp)
c0104680:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104683:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104686:	89 44 24 04          	mov    %eax,0x4(%esp)
c010468a:	e8 e1 0d 00 00       	call   c0105470 <__multadd>
c010468f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104692:	83 c3 01             	add    $0x1,%ebx
c0104695:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104698:	8d 43 ff             	lea    -0x1(%ebx),%eax
c010469b:	89 45 98             	mov    %eax,-0x68(%ebp)
c010469e:	89 f8                	mov    %edi,%eax
c01046a0:	e8 0b f0 ff ff       	call   c01036b0 <quorem>
c01046a5:	89 3c 24             	mov    %edi,(%esp)
c01046a8:	8d 48 30             	lea    0x30(%eax),%ecx
c01046ab:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c01046ae:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c01046b1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01046b4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01046b8:	e8 b3 14 00 00       	call   c0105b70 <__mcmp>
c01046bd:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c01046c0:	89 34 24             	mov    %esi,(%esp)
c01046c3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01046c7:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01046ca:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01046cd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046d1:	e8 ea 14 00 00       	call   c0105bc0 <__mdiff>
c01046d6:	8b 48 0c             	mov    0xc(%eax),%ecx
c01046d9:	89 c2                	mov    %eax,%edx
c01046db:	85 c9                	test   %ecx,%ecx
c01046dd:	0f 85 c5 00 00 00    	jne    c01047a8 <_dtoa_r+0xf28>
c01046e3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046e7:	89 3c 24             	mov    %edi,(%esp)
c01046ea:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01046ed:	e8 7e 14 00 00       	call   c0105b70 <__mcmp>
c01046f2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01046f5:	89 54 24 04          	mov    %edx,0x4(%esp)
c01046f9:	89 34 24             	mov    %esi,(%esp)
c01046fc:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01046ff:	e8 4c 0d 00 00       	call   c0105450 <_Bfree>
c0104704:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104707:	89 c1                	mov    %eax,%ecx
c0104709:	0b 4d 14             	or     0x14(%ebp),%ecx
c010470c:	75 0b                	jne    c0104719 <_dtoa_r+0xe99>
c010470e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0104711:	85 d2                	test   %edx,%edx
c0104713:	0f 84 fb 02 00 00    	je     c0104a14 <_dtoa_r+0x1194>
c0104719:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010471c:	85 d2                	test   %edx,%edx
c010471e:	0f 88 7f 01 00 00    	js     c01048a3 <_dtoa_r+0x1023>
c0104724:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104727:	0b 4d 14             	or     0x14(%ebp),%ecx
c010472a:	75 0b                	jne    c0104737 <_dtoa_r+0xeb7>
c010472c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c010472f:	85 c9                	test   %ecx,%ecx
c0104731:	0f 84 6c 01 00 00    	je     c01048a3 <_dtoa_r+0x1023>
c0104737:	85 c0                	test   %eax,%eax
c0104739:	0f 8f 82 02 00 00    	jg     c01049c1 <_dtoa_r+0x1141>
c010473f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104743:	89 da                	mov    %ebx,%edx
c0104745:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c0104748:	88 43 ff             	mov    %al,-0x1(%ebx)
c010474b:	0f 84 8d 02 00 00    	je     c01049de <_dtoa_r+0x115e>
c0104751:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0104755:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010475c:	00 
c010475d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104764:	00 
c0104765:	89 34 24             	mov    %esi,(%esp)
c0104768:	e8 03 0d 00 00       	call   c0105470 <__multadd>
c010476d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104774:	00 
c0104775:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010477c:	00 
c010477d:	89 34 24             	mov    %esi,(%esp)
c0104780:	89 c7                	mov    %eax,%edi
c0104782:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104785:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c0104788:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010478b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010478f:	0f 85 d3 fe ff ff    	jne    c0104668 <_dtoa_r+0xde8>
c0104795:	e8 d6 0c 00 00       	call   c0105470 <__multadd>
c010479a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010479d:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01047a0:	e9 ed fe ff ff       	jmp    c0104692 <_dtoa_r+0xe12>
c01047a5:	8d 76 00             	lea    0x0(%esi),%esi
c01047a8:	b8 01 00 00 00       	mov    $0x1,%eax
c01047ad:	e9 43 ff ff ff       	jmp    c01046f5 <_dtoa_r+0xe75>
c01047b2:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01047b9:	e9 d2 f2 ff ff       	jmp    c0103a90 <_dtoa_r+0x210>
c01047be:	0f 85 87 f6 ff ff    	jne    c0103e4b <_dtoa_r+0x5cb>
c01047c4:	dd d8                	fstp   %st(0)
c01047c6:	dd d8                	fstp   %st(0)
c01047c8:	dd d8                	fstp   %st(0)
c01047ca:	89 fb                	mov    %edi,%ebx
c01047cc:	8b 7d c0             	mov    -0x40(%ebp),%edi
c01047cf:	e9 fc f8 ff ff       	jmp    c01040d0 <_dtoa_r+0x850>
c01047d4:	89 c2                	mov    %eax,%edx
c01047d6:	2b 55 b0             	sub    -0x50(%ebp),%edx
c01047d9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01047dc:	01 55 94             	add    %edx,-0x6c(%ebp)
c01047df:	31 d2                	xor    %edx,%edx
c01047e1:	e9 b8 f9 ff ff       	jmp    c010419e <_dtoa_r+0x91e>
c01047e6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01047e9:	85 c0                	test   %eax,%eax
c01047eb:	0f 84 f3 f9 ff ff    	je     c01041e4 <_dtoa_r+0x964>
c01047f1:	8b 45 90             	mov    -0x70(%ebp),%eax
c01047f4:	85 c0                	test   %eax,%eax
c01047f6:	0f 8e c4 fb ff ff    	jle    c01043c0 <_dtoa_r+0xb40>
c01047fc:	d8 0d 78 86 10 c0    	fmuls  0xc0108678
c0104802:	83 c1 01             	add    $0x1,%ecx
c0104805:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104808:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c010480b:	89 c1                	mov    %eax,%ecx
c010480d:	83 eb 01             	sub    $0x1,%ebx
c0104810:	db 45 d4             	fildl  -0x2c(%ebp)
c0104813:	d8 c9                	fmul   %st(1),%st
c0104815:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c0104818:	d8 05 7c 86 10 c0    	fadds  0xc010867c
c010481e:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104821:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0104828:	e9 53 f4 ff ff       	jmp    c0103c80 <_dtoa_r+0x400>
c010482d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104830:	c6 03 30             	movb   $0x30,(%ebx)
c0104833:	83 c0 01             	add    $0x1,%eax
c0104836:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104839:	b8 31 00 00 00       	mov    $0x31,%eax
c010483e:	88 02                	mov    %al,(%edx)
c0104840:	e9 8b f8 ff ff       	jmp    c01040d0 <_dtoa_r+0x850>
c0104845:	d9 c0                	fld    %st(0)
c0104847:	b9 02 00 00 00       	mov    $0x2,%ecx
c010484c:	e9 f2 f3 ff ff       	jmp    c0103c43 <_dtoa_r+0x3c3>
c0104851:	de e2                	fsubp  %st,%st(2)
c0104853:	d9 c9                	fxch   %st(1)
c0104855:	df e9                	fucomip %st(1),%st
c0104857:	dd d8                	fstp   %st(0)
c0104859:	0f 86 69 fb ff ff    	jbe    c01043c8 <_dtoa_r+0xb48>
c010485f:	dd d8                	fstp   %st(0)
c0104861:	eb 07                	jmp    c010486a <_dtoa_r+0xfea>
c0104863:	90                   	nop
c0104864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104868:	89 c2                	mov    %eax,%edx
c010486a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c010486e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104871:	74 f5                	je     c0104868 <_dtoa_r+0xfe8>
c0104873:	e9 d9 f4 ff ff       	jmp    c0103d51 <_dtoa_r+0x4d1>
c0104878:	c6 07 31             	movb   $0x31,(%edi)
c010487b:	89 fb                	mov    %edi,%ebx
c010487d:	89 d7                	mov    %edx,%edi
c010487f:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0104883:	e9 1a f8 ff ff       	jmp    c01040a2 <_dtoa_r+0x822>
c0104888:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010488b:	85 d2                	test   %edx,%edx
c010488d:	0f 84 1b 01 00 00    	je     c01049ae <_dtoa_r+0x112e>
c0104893:	05 33 04 00 00       	add    $0x433,%eax
c0104898:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010489b:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010489e:	e9 0b f9 ff ff       	jmp    c01041ae <_dtoa_r+0x92e>
c01048a3:	85 c0                	test   %eax,%eax
c01048a5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c01048a8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c01048ab:	7e 45                	jle    c01048f2 <_dtoa_r+0x1072>
c01048ad:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01048b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01048b7:	00 
c01048b8:	89 34 24             	mov    %esi,(%esp)
c01048bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01048bf:	e8 8c 11 00 00       	call   c0105a50 <__lshift>
c01048c4:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c01048c7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01048cb:	89 04 24             	mov    %eax,(%esp)
c01048ce:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01048d1:	e8 9a 12 00 00       	call   c0105b70 <__mcmp>
c01048d6:	83 f8 00             	cmp    $0x0,%eax
c01048d9:	0f 8e 5b 01 00 00    	jle    c0104a3a <_dtoa_r+0x11ba>
c01048df:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c01048e3:	0f 84 0c 01 00 00    	je     c01049f5 <_dtoa_r+0x1175>
c01048e9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01048ec:	83 c0 31             	add    $0x31,%eax
c01048ef:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01048f2:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01048f5:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c01048f9:	89 cb                	mov    %ecx,%ebx
c01048fb:	88 03                	mov    %al,(%ebx)
c01048fd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104900:	89 fb                	mov    %edi,%ebx
c0104902:	8d 79 01             	lea    0x1(%ecx),%edi
c0104905:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104908:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010490b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010490e:	e9 8f f7 ff ff       	jmp    c01040a2 <_dtoa_r+0x822>
c0104913:	dd d8                	fstp   %st(0)
c0104915:	dd d8                	fstp   %st(0)
c0104917:	dd d8                	fstp   %st(0)
c0104919:	eb 0d                	jmp    c0104928 <_dtoa_r+0x10a8>
c010491b:	90                   	nop
c010491c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104920:	dd d8                	fstp   %st(0)
c0104922:	dd d8                	fstp   %st(0)
c0104924:	dd d8                	fstp   %st(0)
c0104926:	dd d8                	fstp   %st(0)
c0104928:	89 fb                	mov    %edi,%ebx
c010492a:	89 d7                	mov    %edx,%edi
c010492c:	e9 8d f5 ff ff       	jmp    c0103ebe <_dtoa_r+0x63e>
c0104931:	29 cb                	sub    %ecx,%ebx
c0104933:	31 c0                	xor    %eax,%eax
c0104935:	e9 74 f8 ff ff       	jmp    c01041ae <_dtoa_r+0x92e>
c010493a:	75 0e                	jne    c010494a <_dtoa_r+0x10ca>
c010493c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104940:	74 08                	je     c010494a <_dtoa_r+0x10ca>
c0104942:	e9 b2 f9 ff ff       	jmp    c01042f9 <_dtoa_r+0xa79>
c0104947:	90                   	nop
c0104948:	89 c2                	mov    %eax,%edx
c010494a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c010494e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104951:	74 f5                	je     c0104948 <_dtoa_r+0x10c8>
c0104953:	89 fb                	mov    %edi,%ebx
c0104955:	89 d7                	mov    %edx,%edi
c0104957:	e9 46 f7 ff ff       	jmp    c01040a2 <_dtoa_r+0x822>
c010495c:	8b 40 04             	mov    0x4(%eax),%eax
c010495f:	89 34 24             	mov    %esi,(%esp)
c0104962:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104966:	e8 45 0a 00 00       	call   c01053b0 <_Balloc>
c010496b:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c010496e:	89 c3                	mov    %eax,%ebx
c0104970:	8b 41 10             	mov    0x10(%ecx),%eax
c0104973:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c010497a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010497e:	89 c8                	mov    %ecx,%eax
c0104980:	83 c0 0c             	add    $0xc,%eax
c0104983:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104987:	8d 43 0c             	lea    0xc(%ebx),%eax
c010498a:	89 04 24             	mov    %eax,(%esp)
c010498d:	e8 fe cb ff ff       	call   c0101590 <memcpy>
c0104992:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104999:	00 
c010499a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010499e:	89 34 24             	mov    %esi,(%esp)
c01049a1:	e8 aa 10 00 00       	call   c0105a50 <__lshift>
c01049a6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01049a9:	e9 9d fc ff ff       	jmp    c010464b <_dtoa_r+0xdcb>
c01049ae:	b8 36 00 00 00       	mov    $0x36,%eax
c01049b3:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01049b6:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01049b9:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01049bc:	e9 ed f7 ff ff       	jmp    c01041ae <_dtoa_r+0x92e>
c01049c1:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c01049c5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c01049c8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c01049cb:	74 28                	je     c01049f5 <_dtoa_r+0x1175>
c01049cd:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c01049d1:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01049d4:	83 c0 01             	add    $0x1,%eax
c01049d7:	89 cb                	mov    %ecx,%ebx
c01049d9:	e9 1d ff ff ff       	jmp    c01048fb <_dtoa_r+0x107b>
c01049de:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01049e1:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c01049e4:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c01049e7:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01049ea:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01049ed:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01049f0:	e9 cc f8 ff ff       	jmp    c01042c1 <_dtoa_r+0xa41>
c01049f5:	8b 45 98             	mov    -0x68(%ebp),%eax
c01049f8:	b9 39 00 00 00       	mov    $0x39,%ecx
c01049fd:	8d 50 01             	lea    0x1(%eax),%edx
c0104a00:	c6 00 39             	movb   $0x39,(%eax)
c0104a03:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104a06:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104a09:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104a0c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104a0f:	e9 fa f8 ff ff       	jmp    c010430e <_dtoa_r+0xa8e>
c0104a14:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104a17:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104a1a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104a1d:	83 fb 39             	cmp    $0x39,%ebx
c0104a20:	74 d3                	je     c01049f5 <_dtoa_r+0x1175>
c0104a22:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104a25:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104a28:	83 c0 31             	add    $0x31,%eax
c0104a2b:	85 c9                	test   %ecx,%ecx
c0104a2d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104a30:	0f 4e c3             	cmovle %ebx,%eax
c0104a33:	89 cb                	mov    %ecx,%ebx
c0104a35:	e9 c1 fe ff ff       	jmp    c01048fb <_dtoa_r+0x107b>
c0104a3a:	0f 85 b2 fe ff ff    	jne    c01048f2 <_dtoa_r+0x1072>
c0104a40:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104a44:	0f 84 a8 fe ff ff    	je     c01048f2 <_dtoa_r+0x1072>
c0104a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104a50:	e9 8a fe ff ff       	jmp    c01048df <_dtoa_r+0x105f>
c0104a55:	0f 85 c7 f3 ff ff    	jne    c0103e22 <_dtoa_r+0x5a2>
c0104a5b:	dd d8                	fstp   %st(0)
c0104a5d:	dd d8                	fstp   %st(0)
c0104a5f:	90                   	nop
c0104a60:	e9 65 fd ff ff       	jmp    c01047ca <_dtoa_r+0xf4a>
c0104a65:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104a68:	e9 dd f5 ff ff       	jmp    c010404a <_dtoa_r+0x7ca>
c0104a6d:	8d 76 00             	lea    0x0(%esi),%esi
c0104a70:	0f 84 7a f5 ff ff    	je     c0103ff0 <_dtoa_r+0x770>
c0104a76:	b8 3c 00 00 00       	mov    $0x3c,%eax
c0104a7b:	29 d0                	sub    %edx,%eax
c0104a7d:	e9 ab f8 ff ff       	jmp    c010432d <_dtoa_r+0xaad>
c0104a82:	b8 01 00 00 00       	mov    $0x1,%eax
c0104a87:	e9 d9 ef ff ff       	jmp    c0103a65 <_dtoa_r+0x1e5>
c0104a8c:	31 d2                	xor    %edx,%edx
c0104a8e:	e9 36 f1 ff ff       	jmp    c0103bc9 <_dtoa_r+0x349>
c0104a93:	66 90                	xchg   %ax,%ax
c0104a95:	66 90                	xchg   %ax,%ax
c0104a97:	66 90                	xchg   %ax,%ax
c0104a99:	66 90                	xchg   %ax,%ax
c0104a9b:	66 90                	xchg   %ax,%ax
c0104a9d:	66 90                	xchg   %ax,%ax
c0104a9f:	90                   	nop

c0104aa0 <_setlocale_r>:
c0104aa0:	55                   	push   %ebp
c0104aa1:	89 e5                	mov    %esp,%ebp
c0104aa3:	53                   	push   %ebx
c0104aa4:	83 ec 14             	sub    $0x14,%esp
c0104aa7:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0104aaa:	85 db                	test   %ebx,%ebx
c0104aac:	74 14                	je     c0104ac2 <_setlocale_r+0x22>
c0104aae:	c7 44 24 04 a0 86 10 	movl   $0xc01086a0,0x4(%esp)
c0104ab5:	c0 
c0104ab6:	89 1c 24             	mov    %ebx,(%esp)
c0104ab9:	e8 a2 cb ff ff       	call   c0101660 <strcmp>
c0104abe:	85 c0                	test   %eax,%eax
c0104ac0:	75 0e                	jne    c0104ad0 <_setlocale_r+0x30>
c0104ac2:	83 c4 14             	add    $0x14,%esp
c0104ac5:	b8 9c 84 10 c0       	mov    $0xc010849c,%eax
c0104aca:	5b                   	pop    %ebx
c0104acb:	5d                   	pop    %ebp
c0104acc:	c3                   	ret    
c0104acd:	8d 76 00             	lea    0x0(%esi),%esi
c0104ad0:	c7 44 24 04 9c 84 10 	movl   $0xc010849c,0x4(%esp)
c0104ad7:	c0 
c0104ad8:	89 1c 24             	mov    %ebx,(%esp)
c0104adb:	e8 80 cb ff ff       	call   c0101660 <strcmp>
c0104ae0:	85 c0                	test   %eax,%eax
c0104ae2:	74 de                	je     c0104ac2 <_setlocale_r+0x22>
c0104ae4:	89 1c 24             	mov    %ebx,(%esp)
c0104ae7:	c7 44 24 04 d6 84 10 	movl   $0xc01084d6,0x4(%esp)
c0104aee:	c0 
c0104aef:	e8 6c cb ff ff       	call   c0101660 <strcmp>
c0104af4:	89 c2                	mov    %eax,%edx
c0104af6:	31 c0                	xor    %eax,%eax
c0104af8:	85 d2                	test   %edx,%edx
c0104afa:	ba 9c 84 10 c0       	mov    $0xc010849c,%edx
c0104aff:	0f 44 c2             	cmove  %edx,%eax
c0104b02:	83 c4 14             	add    $0x14,%esp
c0104b05:	5b                   	pop    %ebx
c0104b06:	5d                   	pop    %ebp
c0104b07:	c3                   	ret    
c0104b08:	90                   	nop
c0104b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0104b10 <__locale_charset>:
c0104b10:	55                   	push   %ebp
c0104b11:	b8 a0 a4 10 c0       	mov    $0xc010a4a0,%eax
c0104b16:	89 e5                	mov    %esp,%ebp
c0104b18:	5d                   	pop    %ebp
c0104b19:	c3                   	ret    
c0104b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104b20 <__locale_mb_cur_max>:
c0104b20:	55                   	push   %ebp
c0104b21:	a1 f8 a4 10 c0       	mov    0xc010a4f8,%eax
c0104b26:	89 e5                	mov    %esp,%ebp
c0104b28:	5d                   	pop    %ebp
c0104b29:	c3                   	ret    
c0104b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104b30 <__locale_msgcharset>:
c0104b30:	55                   	push   %ebp
c0104b31:	b8 80 a4 10 c0       	mov    $0xc010a480,%eax
c0104b36:	89 e5                	mov    %esp,%ebp
c0104b38:	5d                   	pop    %ebp
c0104b39:	c3                   	ret    
c0104b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104b40 <__locale_cjk_lang>:
c0104b40:	55                   	push   %ebp
c0104b41:	31 c0                	xor    %eax,%eax
c0104b43:	89 e5                	mov    %esp,%ebp
c0104b45:	5d                   	pop    %ebp
c0104b46:	c3                   	ret    
c0104b47:	89 f6                	mov    %esi,%esi
c0104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0104b50 <_localeconv_r>:
c0104b50:	55                   	push   %ebp
c0104b51:	b8 c0 a4 10 c0       	mov    $0xc010a4c0,%eax
c0104b56:	89 e5                	mov    %esp,%ebp
c0104b58:	5d                   	pop    %ebp
c0104b59:	c3                   	ret    
c0104b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104b60 <setlocale>:
c0104b60:	55                   	push   %ebp
c0104b61:	89 e5                	mov    %esp,%ebp
c0104b63:	83 ec 18             	sub    $0x18,%esp
c0104b66:	e8 35 cc ff ff       	call   c01017a0 <__getreent>
c0104b6b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104b6e:	89 54 24 08          	mov    %edx,0x8(%esp)
c0104b72:	8b 55 08             	mov    0x8(%ebp),%edx
c0104b75:	89 04 24             	mov    %eax,(%esp)
c0104b78:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104b7c:	e8 1f ff ff ff       	call   c0104aa0 <_setlocale_r>
c0104b81:	c9                   	leave  
c0104b82:	c3                   	ret    
c0104b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0104b90 <localeconv>:
c0104b90:	55                   	push   %ebp
c0104b91:	89 e5                	mov    %esp,%ebp
c0104b93:	83 ec 08             	sub    $0x8,%esp
c0104b96:	e8 05 cc ff ff       	call   c01017a0 <__getreent>
c0104b9b:	b8 c0 a4 10 c0       	mov    $0xc010a4c0,%eax
c0104ba0:	c9                   	leave  
c0104ba1:	c3                   	ret    
c0104ba2:	66 90                	xchg   %ax,%ax
c0104ba4:	66 90                	xchg   %ax,%ax
c0104ba6:	66 90                	xchg   %ax,%ax
c0104ba8:	66 90                	xchg   %ax,%ax
c0104baa:	66 90                	xchg   %ax,%ax
c0104bac:	66 90                	xchg   %ax,%ax
c0104bae:	66 90                	xchg   %ax,%ax

c0104bb0 <_malloc_r>:
c0104bb0:	55                   	push   %ebp
c0104bb1:	89 e5                	mov    %esp,%ebp
c0104bb3:	57                   	push   %edi
c0104bb4:	56                   	push   %esi
c0104bb5:	53                   	push   %ebx
c0104bb6:	83 ec 2c             	sub    $0x2c,%esp
c0104bb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104bbc:	8d 50 0b             	lea    0xb(%eax),%edx
c0104bbf:	83 fa 16             	cmp    $0x16,%edx
c0104bc2:	76 6c                	jbe    c0104c30 <_malloc_r+0x80>
c0104bc4:	89 d7                	mov    %edx,%edi
c0104bc6:	83 e7 f8             	and    $0xfffffff8,%edi
c0104bc9:	89 fe                	mov    %edi,%esi
c0104bcb:	c1 ee 1f             	shr    $0x1f,%esi
c0104bce:	39 c7                	cmp    %eax,%edi
c0104bd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104bd3:	89 f2                	mov    %esi,%edx
c0104bd5:	72 67                	jb     c0104c3e <_malloc_r+0x8e>
c0104bd7:	84 d2                	test   %dl,%dl
c0104bd9:	75 63                	jne    c0104c3e <_malloc_r+0x8e>
c0104bdb:	89 04 24             	mov    %eax,(%esp)
c0104bde:	e8 ad 07 00 00       	call   c0105390 <__malloc_lock>
c0104be3:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0104be9:	77 65                	ja     c0104c50 <_malloc_r+0xa0>
c0104beb:	89 fa                	mov    %edi,%edx
c0104bed:	c1 ea 03             	shr    $0x3,%edx
c0104bf0:	8d 04 d5 20 a5 10 c0 	lea    -0x3fef5ae0(,%edx,8),%eax
c0104bf7:	8b 58 0c             	mov    0xc(%eax),%ebx
c0104bfa:	39 c3                	cmp    %eax,%ebx
c0104bfc:	0f 84 3e 05 00 00    	je     c0105140 <_malloc_r+0x590>
c0104c02:	8b 43 04             	mov    0x4(%ebx),%eax
c0104c05:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c08:	8b 53 0c             	mov    0xc(%ebx),%edx
c0104c0b:	8b 4b 08             	mov    0x8(%ebx),%ecx
c0104c0e:	89 51 0c             	mov    %edx,0xc(%ecx)
c0104c11:	89 4a 08             	mov    %ecx,0x8(%edx)
c0104c14:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104c19:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c1c:	89 04 24             	mov    %eax,(%esp)
c0104c1f:	e8 7c 07 00 00       	call   c01053a0 <__malloc_unlock>
c0104c24:	8d 43 08             	lea    0x8(%ebx),%eax
c0104c27:	83 c4 2c             	add    $0x2c,%esp
c0104c2a:	5b                   	pop    %ebx
c0104c2b:	5e                   	pop    %esi
c0104c2c:	5f                   	pop    %edi
c0104c2d:	5d                   	pop    %ebp
c0104c2e:	c3                   	ret    
c0104c2f:	90                   	nop
c0104c30:	bf 10 00 00 00       	mov    $0x10,%edi
c0104c35:	31 d2                	xor    %edx,%edx
c0104c37:	39 c7                	cmp    %eax,%edi
c0104c39:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c3c:	73 99                	jae    c0104bd7 <_malloc_r+0x27>
c0104c3e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0104c44:	83 c4 2c             	add    $0x2c,%esp
c0104c47:	31 c0                	xor    %eax,%eax
c0104c49:	5b                   	pop    %ebx
c0104c4a:	5e                   	pop    %esi
c0104c4b:	5f                   	pop    %edi
c0104c4c:	5d                   	pop    %ebp
c0104c4d:	c3                   	ret    
c0104c4e:	66 90                	xchg   %ax,%ax
c0104c50:	89 fe                	mov    %edi,%esi
c0104c52:	c1 ee 09             	shr    $0x9,%esi
c0104c55:	85 f6                	test   %esi,%esi
c0104c57:	0f 84 ab 01 00 00    	je     c0104e08 <_malloc_r+0x258>
c0104c5d:	83 fe 04             	cmp    $0x4,%esi
c0104c60:	0f 87 8a 03 00 00    	ja     c0104ff0 <_malloc_r+0x440>
c0104c66:	89 fe                	mov    %edi,%esi
c0104c68:	c1 ee 06             	shr    $0x6,%esi
c0104c6b:	83 c6 38             	add    $0x38,%esi
c0104c6e:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104c71:	8d 0c 85 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,4),%ecx
c0104c78:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104c7b:	39 d9                	cmp    %ebx,%ecx
c0104c7d:	75 18                	jne    c0104c97 <_malloc_r+0xe7>
c0104c7f:	eb 28                	jmp    c0104ca9 <_malloc_r+0xf9>
c0104c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104c88:	85 d2                	test   %edx,%edx
c0104c8a:	0f 89 78 ff ff ff    	jns    c0104c08 <_malloc_r+0x58>
c0104c90:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104c93:	39 d9                	cmp    %ebx,%ecx
c0104c95:	74 12                	je     c0104ca9 <_malloc_r+0xf9>
c0104c97:	8b 43 04             	mov    0x4(%ebx),%eax
c0104c9a:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c9d:	89 c2                	mov    %eax,%edx
c0104c9f:	29 fa                	sub    %edi,%edx
c0104ca1:	83 fa 0f             	cmp    $0xf,%edx
c0104ca4:	7e e2                	jle    c0104c88 <_malloc_r+0xd8>
c0104ca6:	83 ee 01             	sub    $0x1,%esi
c0104ca9:	8d 46 01             	lea    0x1(%esi),%eax
c0104cac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104caf:	8b 1d 30 a5 10 c0    	mov    0xc010a530,%ebx
c0104cb5:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c0104cba:	81 fb 28 a5 10 c0    	cmp    $0xc010a528,%ebx
c0104cc0:	74 6b                	je     c0104d2d <_malloc_r+0x17d>
c0104cc2:	8b 73 04             	mov    0x4(%ebx),%esi
c0104cc5:	83 e6 fc             	and    $0xfffffffc,%esi
c0104cc8:	89 f0                	mov    %esi,%eax
c0104cca:	29 f8                	sub    %edi,%eax
c0104ccc:	83 f8 0f             	cmp    $0xf,%eax
c0104ccf:	0f 8f a3 03 00 00    	jg     c0105078 <_malloc_r+0x4c8>
c0104cd5:	85 c0                	test   %eax,%eax
c0104cd7:	c7 05 34 a5 10 c0 28 	movl   $0xc010a528,0xc010a534
c0104cde:	a5 10 c0 
c0104ce1:	c7 05 30 a5 10 c0 28 	movl   $0xc010a528,0xc010a530
c0104ce8:	a5 10 c0 
c0104ceb:	0f 89 27 01 00 00    	jns    c0104e18 <_malloc_r+0x268>
c0104cf1:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0104cf7:	0f 87 1b 03 00 00    	ja     c0105018 <_malloc_r+0x468>
c0104cfd:	c1 ee 03             	shr    $0x3,%esi
c0104d00:	b8 01 00 00 00       	mov    $0x1,%eax
c0104d05:	89 f1                	mov    %esi,%ecx
c0104d07:	8d 14 f5 20 a5 10 c0 	lea    -0x3fef5ae0(,%esi,8),%edx
c0104d0e:	c1 f9 02             	sar    $0x2,%ecx
c0104d11:	d3 e0                	shl    %cl,%eax
c0104d13:	8b 4a 08             	mov    0x8(%edx),%ecx
c0104d16:	0b 05 24 a5 10 c0    	or     0xc010a524,%eax
c0104d1c:	89 53 0c             	mov    %edx,0xc(%ebx)
c0104d1f:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0104d22:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c0104d27:	89 5a 08             	mov    %ebx,0x8(%edx)
c0104d2a:	89 59 0c             	mov    %ebx,0xc(%ecx)
c0104d2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104d30:	be 01 00 00 00       	mov    $0x1,%esi
c0104d35:	c1 f9 02             	sar    $0x2,%ecx
c0104d38:	d3 e6                	shl    %cl,%esi
c0104d3a:	39 c6                	cmp    %eax,%esi
c0104d3c:	0f 87 f6 00 00 00    	ja     c0104e38 <_malloc_r+0x288>
c0104d42:	85 f0                	test   %esi,%eax
c0104d44:	0f 85 76 03 00 00    	jne    c01050c0 <_malloc_r+0x510>
c0104d4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104d4d:	01 f6                	add    %esi,%esi
c0104d4f:	83 e2 fc             	and    $0xfffffffc,%edx
c0104d52:	85 f0                	test   %esi,%eax
c0104d54:	8d 4a 04             	lea    0x4(%edx),%ecx
c0104d57:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104d5a:	0f 85 60 03 00 00    	jne    c01050c0 <_malloc_r+0x510>
c0104d60:	89 ca                	mov    %ecx,%edx
c0104d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104d68:	01 f6                	add    %esi,%esi
c0104d6a:	83 c2 04             	add    $0x4,%edx
c0104d6d:	85 f0                	test   %esi,%eax
c0104d6f:	74 f7                	je     c0104d68 <_malloc_r+0x1b8>
c0104d71:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104d74:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104d77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104d7a:	8d 34 c5 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,8),%esi
c0104d81:	89 f1                	mov    %esi,%ecx
c0104d83:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104d86:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104d89:	39 d9                	cmp    %ebx,%ecx
c0104d8b:	75 1e                	jne    c0104dab <_malloc_r+0x1fb>
c0104d8d:	e9 36 03 00 00       	jmp    c01050c8 <_malloc_r+0x518>
c0104d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104d98:	85 d2                	test   %edx,%edx
c0104d9a:	0f 89 c0 03 00 00    	jns    c0105160 <_malloc_r+0x5b0>
c0104da0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104da3:	39 d9                	cmp    %ebx,%ecx
c0104da5:	0f 84 1d 03 00 00    	je     c01050c8 <_malloc_r+0x518>
c0104dab:	8b 43 04             	mov    0x4(%ebx),%eax
c0104dae:	83 e0 fc             	and    $0xfffffffc,%eax
c0104db1:	89 c2                	mov    %eax,%edx
c0104db3:	29 fa                	sub    %edi,%edx
c0104db5:	83 fa 0f             	cmp    $0xf,%edx
c0104db8:	7e de                	jle    c0104d98 <_malloc_r+0x1e8>
c0104dba:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c0104dbd:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c0104dc0:	83 cf 01             	or     $0x1,%edi
c0104dc3:	8b 73 08             	mov    0x8(%ebx),%esi
c0104dc6:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104dc9:	89 4e 0c             	mov    %ecx,0xc(%esi)
c0104dcc:	89 71 08             	mov    %esi,0x8(%ecx)
c0104dcf:	89 d1                	mov    %edx,%ecx
c0104dd1:	83 c9 01             	or     $0x1,%ecx
c0104dd4:	a3 34 a5 10 c0       	mov    %eax,0xc010a534
c0104dd9:	a3 30 a5 10 c0       	mov    %eax,0xc010a530
c0104dde:	c7 40 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%eax)
c0104de5:	c7 40 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%eax)
c0104dec:	89 48 04             	mov    %ecx,0x4(%eax)
c0104def:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0104df2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104df5:	89 04 24             	mov    %eax,(%esp)
c0104df8:	e8 a3 05 00 00       	call   c01053a0 <__malloc_unlock>
c0104dfd:	8d 43 08             	lea    0x8(%ebx),%eax
c0104e00:	e9 22 fe ff ff       	jmp    c0104c27 <_malloc_r+0x77>
c0104e05:	8d 76 00             	lea    0x0(%esi),%esi
c0104e08:	b8 7e 00 00 00       	mov    $0x7e,%eax
c0104e0d:	be 3f 00 00 00       	mov    $0x3f,%esi
c0104e12:	e9 5a fe ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c0104e17:	90                   	nop
c0104e18:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e1b:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0104e20:	89 04 24             	mov    %eax,(%esp)
c0104e23:	e8 78 05 00 00       	call   c01053a0 <__malloc_unlock>
c0104e28:	83 c4 2c             	add    $0x2c,%esp
c0104e2b:	8d 43 08             	lea    0x8(%ebx),%eax
c0104e2e:	5b                   	pop    %ebx
c0104e2f:	5e                   	pop    %esi
c0104e30:	5f                   	pop    %edi
c0104e31:	5d                   	pop    %ebp
c0104e32:	c3                   	ret    
c0104e33:	90                   	nop
c0104e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104e38:	8b 1d 28 a5 10 c0    	mov    0xc010a528,%ebx
c0104e3e:	8b 73 04             	mov    0x4(%ebx),%esi
c0104e41:	83 e6 fc             	and    $0xfffffffc,%esi
c0104e44:	39 f7                	cmp    %esi,%edi
c0104e46:	77 0d                	ja     c0104e55 <_malloc_r+0x2a5>
c0104e48:	89 f0                	mov    %esi,%eax
c0104e4a:	29 f8                	sub    %edi,%eax
c0104e4c:	83 f8 0f             	cmp    $0xf,%eax
c0104e4f:	0f 8f 6b 01 00 00    	jg     c0104fc0 <_malloc_r+0x410>
c0104e55:	8b 0d 90 25 16 c0    	mov    0xc0162590,%ecx
c0104e5b:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c0104e5e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104e61:	01 f9                	add    %edi,%ecx
c0104e63:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c0104e69:	83 c1 10             	add    $0x10,%ecx
c0104e6c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104e71:	83 3d 00 a5 10 c0 ff 	cmpl   $0xffffffff,0xc010a500
c0104e78:	0f 44 c1             	cmove  %ecx,%eax
c0104e7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104e7e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104e82:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e85:	89 04 24             	mov    %eax,(%esp)
c0104e88:	e8 03 13 00 00       	call   c0106190 <_sbrk_r>
c0104e8d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104e90:	89 c1                	mov    %eax,%ecx
c0104e92:	0f 84 17 03 00 00    	je     c01051af <_malloc_r+0x5ff>
c0104e98:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0104e9b:	0f 87 02 03 00 00    	ja     c01051a3 <_malloc_r+0x5f3>
c0104ea1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104ea4:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104eaa:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c0104ead:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104eb3:	0f 84 a9 03 00 00    	je     c0105262 <_malloc_r+0x6b2>
c0104eb9:	83 3d 00 a5 10 c0 ff 	cmpl   $0xffffffff,0xc010a500
c0104ec0:	0f 84 ca 03 00 00    	je     c0105290 <_malloc_r+0x6e0>
c0104ec6:	89 c8                	mov    %ecx,%eax
c0104ec8:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104ecb:	01 d0                	add    %edx,%eax
c0104ecd:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0104ed2:	89 c8                	mov    %ecx,%eax
c0104ed4:	ba 00 10 00 00       	mov    $0x1000,%edx
c0104ed9:	83 e0 07             	and    $0x7,%eax
c0104edc:	74 0c                	je     c0104eea <_malloc_r+0x33a>
c0104ede:	29 c1                	sub    %eax,%ecx
c0104ee0:	ba 08 10 00 00       	mov    $0x1008,%edx
c0104ee5:	8d 49 08             	lea    0x8(%ecx),%ecx
c0104ee8:	29 c2                	sub    %eax,%edx
c0104eea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104eed:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104ef0:	01 c8                	add    %ecx,%eax
c0104ef2:	25 ff 0f 00 00       	and    $0xfff,%eax
c0104ef7:	29 c2                	sub    %eax,%edx
c0104ef9:	8b 45 08             	mov    0x8(%ebp),%eax
c0104efc:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104f00:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0104f03:	89 04 24             	mov    %eax,(%esp)
c0104f06:	e8 85 12 00 00       	call   c0106190 <_sbrk_r>
c0104f0b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104f0e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104f11:	0f 84 6d 03 00 00    	je     c0105284 <_malloc_r+0x6d4>
c0104f17:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104f1a:	29 c8                	sub    %ecx,%eax
c0104f1c:	01 d0                	add    %edx,%eax
c0104f1e:	83 c8 01             	or     $0x1,%eax
c0104f21:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104f27:	81 fb 20 a5 10 c0    	cmp    $0xc010a520,%ebx
c0104f2d:	89 0d 28 a5 10 c0    	mov    %ecx,0xc010a528
c0104f33:	89 41 04             	mov    %eax,0x4(%ecx)
c0104f36:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104f3c:	0f 84 f2 02 00 00    	je     c0105234 <_malloc_r+0x684>
c0104f42:	83 fe 0f             	cmp    $0xf,%esi
c0104f45:	0f 86 8d 02 00 00    	jbe    c01051d8 <_malloc_r+0x628>
c0104f4b:	8b 43 04             	mov    0x4(%ebx),%eax
c0104f4e:	83 ee 0c             	sub    $0xc,%esi
c0104f51:	83 e6 f8             	and    $0xfffffff8,%esi
c0104f54:	83 e0 01             	and    $0x1,%eax
c0104f57:	09 f0                	or     %esi,%eax
c0104f59:	83 fe 0f             	cmp    $0xf,%esi
c0104f5c:	89 43 04             	mov    %eax,0x4(%ebx)
c0104f5f:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c0104f64:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c0104f6b:	00 
c0104f6c:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c0104f73:	00 
c0104f74:	0f 87 a2 02 00 00    	ja     c010521c <_malloc_r+0x66c>
c0104f7a:	3b 15 8c 25 16 c0    	cmp    0xc016258c,%edx
c0104f80:	76 06                	jbe    c0104f88 <_malloc_r+0x3d8>
c0104f82:	89 15 8c 25 16 c0    	mov    %edx,0xc016258c
c0104f88:	3b 15 88 25 16 c0    	cmp    0xc0162588,%edx
c0104f8e:	76 06                	jbe    c0104f96 <_malloc_r+0x3e6>
c0104f90:	89 15 88 25 16 c0    	mov    %edx,0xc0162588
c0104f96:	8b 50 04             	mov    0x4(%eax),%edx
c0104f99:	89 c3                	mov    %eax,%ebx
c0104f9b:	83 e2 fc             	and    $0xfffffffc,%edx
c0104f9e:	89 d0                	mov    %edx,%eax
c0104fa0:	29 f8                	sub    %edi,%eax
c0104fa2:	39 d7                	cmp    %edx,%edi
c0104fa4:	77 05                	ja     c0104fab <_malloc_r+0x3fb>
c0104fa6:	83 f8 0f             	cmp    $0xf,%eax
c0104fa9:	7f 15                	jg     c0104fc0 <_malloc_r+0x410>
c0104fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fae:	89 04 24             	mov    %eax,(%esp)
c0104fb1:	e8 ea 03 00 00       	call   c01053a0 <__malloc_unlock>
c0104fb6:	31 c0                	xor    %eax,%eax
c0104fb8:	e9 6a fc ff ff       	jmp    c0104c27 <_malloc_r+0x77>
c0104fbd:	8d 76 00             	lea    0x0(%esi),%esi
c0104fc0:	89 fa                	mov    %edi,%edx
c0104fc2:	83 c8 01             	or     $0x1,%eax
c0104fc5:	83 ca 01             	or     $0x1,%edx
c0104fc8:	89 53 04             	mov    %edx,0x4(%ebx)
c0104fcb:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104fce:	89 15 28 a5 10 c0    	mov    %edx,0xc010a528
c0104fd4:	89 42 04             	mov    %eax,0x4(%edx)
c0104fd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fda:	89 04 24             	mov    %eax,(%esp)
c0104fdd:	e8 be 03 00 00       	call   c01053a0 <__malloc_unlock>
c0104fe2:	83 c4 2c             	add    $0x2c,%esp
c0104fe5:	8d 43 08             	lea    0x8(%ebx),%eax
c0104fe8:	5b                   	pop    %ebx
c0104fe9:	5e                   	pop    %esi
c0104fea:	5f                   	pop    %edi
c0104feb:	5d                   	pop    %ebp
c0104fec:	c3                   	ret    
c0104fed:	8d 76 00             	lea    0x0(%esi),%esi
c0104ff0:	83 fe 14             	cmp    $0x14,%esi
c0104ff3:	0f 86 8f 01 00 00    	jbe    c0105188 <_malloc_r+0x5d8>
c0104ff9:	83 fe 54             	cmp    $0x54,%esi
c0104ffc:	0f 87 be 01 00 00    	ja     c01051c0 <_malloc_r+0x610>
c0105002:	89 fe                	mov    %edi,%esi
c0105004:	c1 ee 0c             	shr    $0xc,%esi
c0105007:	83 c6 6e             	add    $0x6e,%esi
c010500a:	8d 04 36             	lea    (%esi,%esi,1),%eax
c010500d:	e9 5f fc ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c0105012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105018:	89 f1                	mov    %esi,%ecx
c010501a:	c1 e9 09             	shr    $0x9,%ecx
c010501d:	83 f9 04             	cmp    $0x4,%ecx
c0105020:	0f 86 6d 01 00 00    	jbe    c0105193 <_malloc_r+0x5e3>
c0105026:	83 f9 14             	cmp    $0x14,%ecx
c0105029:	0f 87 0f 02 00 00    	ja     c010523e <_malloc_r+0x68e>
c010502f:	83 c1 5b             	add    $0x5b,%ecx
c0105032:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105035:	8d 04 85 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,4),%eax
c010503c:	8b 50 08             	mov    0x8(%eax),%edx
c010503f:	39 c2                	cmp    %eax,%edx
c0105041:	0f 84 a1 01 00 00    	je     c01051e8 <_malloc_r+0x638>
c0105047:	90                   	nop
c0105048:	8b 4a 04             	mov    0x4(%edx),%ecx
c010504b:	83 e1 fc             	and    $0xfffffffc,%ecx
c010504e:	39 ce                	cmp    %ecx,%esi
c0105050:	73 07                	jae    c0105059 <_malloc_r+0x4a9>
c0105052:	8b 52 08             	mov    0x8(%edx),%edx
c0105055:	39 d0                	cmp    %edx,%eax
c0105057:	75 ef                	jne    c0105048 <_malloc_r+0x498>
c0105059:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010505c:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c0105061:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0105064:	89 53 08             	mov    %edx,0x8(%ebx)
c0105067:	89 59 08             	mov    %ebx,0x8(%ecx)
c010506a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c010506d:	e9 bb fc ff ff       	jmp    c0104d2d <_malloc_r+0x17d>
c0105072:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105078:	89 c1                	mov    %eax,%ecx
c010507a:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c010507d:	83 c9 01             	or     $0x1,%ecx
c0105080:	83 cf 01             	or     $0x1,%edi
c0105083:	89 7b 04             	mov    %edi,0x4(%ebx)
c0105086:	89 15 34 a5 10 c0    	mov    %edx,0xc010a534
c010508c:	89 15 30 a5 10 c0    	mov    %edx,0xc010a530
c0105092:	c7 42 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%edx)
c0105099:	c7 42 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%edx)
c01050a0:	89 4a 04             	mov    %ecx,0x4(%edx)
c01050a3:	89 04 02             	mov    %eax,(%edx,%eax,1)
c01050a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01050a9:	89 04 24             	mov    %eax,(%esp)
c01050ac:	e8 ef 02 00 00       	call   c01053a0 <__malloc_unlock>
c01050b1:	8d 43 08             	lea    0x8(%ebx),%eax
c01050b4:	e9 6e fb ff ff       	jmp    c0104c27 <_malloc_r+0x77>
c01050b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01050c0:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01050c3:	e9 af fc ff ff       	jmp    c0104d77 <_malloc_r+0x1c7>
c01050c8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01050cc:	83 c1 08             	add    $0x8,%ecx
c01050cf:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c01050d3:	0f 85 ad fc ff ff    	jne    c0104d86 <_malloc_r+0x1d6>
c01050d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01050dc:	eb 12                	jmp    c01050f0 <_malloc_r+0x540>
c01050de:	66 90                	xchg   %ax,%ax
c01050e0:	8d 56 f8             	lea    -0x8(%esi),%edx
c01050e3:	8b 36                	mov    (%esi),%esi
c01050e5:	83 e8 01             	sub    $0x1,%eax
c01050e8:	39 d6                	cmp    %edx,%esi
c01050ea:	0f 85 ea 01 00 00    	jne    c01052da <_malloc_r+0x72a>
c01050f0:	a8 03                	test   $0x3,%al
c01050f2:	75 ec                	jne    c01050e0 <_malloc_r+0x530>
c01050f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050f7:	f7 d0                	not    %eax
c01050f9:	23 05 24 a5 10 c0    	and    0xc010a524,%eax
c01050ff:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c0105104:	d1 65 dc             	shll   -0x24(%ebp)
c0105107:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010510a:	39 c2                	cmp    %eax,%edx
c010510c:	0f 87 26 fd ff ff    	ja     c0104e38 <_malloc_r+0x288>
c0105112:	85 d2                	test   %edx,%edx
c0105114:	0f 84 1e fd ff ff    	je     c0104e38 <_malloc_r+0x288>
c010511a:	85 c2                	test   %eax,%edx
c010511c:	0f 85 c2 01 00 00    	jne    c01052e4 <_malloc_r+0x734>
c0105122:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0105125:	89 f1                	mov    %esi,%ecx
c0105127:	01 d2                	add    %edx,%edx
c0105129:	83 c1 04             	add    $0x4,%ecx
c010512c:	85 d0                	test   %edx,%eax
c010512e:	74 f7                	je     c0105127 <_malloc_r+0x577>
c0105130:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105133:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105136:	e9 3c fc ff ff       	jmp    c0104d77 <_malloc_r+0x1c7>
c010513b:	90                   	nop
c010513c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105140:	8d 43 08             	lea    0x8(%ebx),%eax
c0105143:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0105146:	39 d8                	cmp    %ebx,%eax
c0105148:	0f 85 b4 fa ff ff    	jne    c0104c02 <_malloc_r+0x52>
c010514e:	8d 42 02             	lea    0x2(%edx),%eax
c0105151:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105154:	e9 56 fb ff ff       	jmp    c0104caf <_malloc_r+0xff>
c0105159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105160:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0105165:	8b 53 08             	mov    0x8(%ebx),%edx
c0105168:	8b 43 0c             	mov    0xc(%ebx),%eax
c010516b:	89 42 0c             	mov    %eax,0xc(%edx)
c010516e:	89 50 08             	mov    %edx,0x8(%eax)
c0105171:	8b 45 08             	mov    0x8(%ebp),%eax
c0105174:	89 04 24             	mov    %eax,(%esp)
c0105177:	e8 24 02 00 00       	call   c01053a0 <__malloc_unlock>
c010517c:	8d 43 08             	lea    0x8(%ebx),%eax
c010517f:	e9 a3 fa ff ff       	jmp    c0104c27 <_malloc_r+0x77>
c0105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105188:	83 c6 5b             	add    $0x5b,%esi
c010518b:	8d 04 36             	lea    (%esi,%esi,1),%eax
c010518e:	e9 de fa ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c0105193:	89 f1                	mov    %esi,%ecx
c0105195:	c1 e9 06             	shr    $0x6,%ecx
c0105198:	83 c1 38             	add    $0x38,%ecx
c010519b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010519e:	e9 92 fe ff ff       	jmp    c0105035 <_malloc_r+0x485>
c01051a3:	81 fb 20 a5 10 c0    	cmp    $0xc010a520,%ebx
c01051a9:	0f 84 f2 fc ff ff    	je     c0104ea1 <_malloc_r+0x2f1>
c01051af:	8b 1d 28 a5 10 c0    	mov    0xc010a528,%ebx
c01051b5:	8b 53 04             	mov    0x4(%ebx),%edx
c01051b8:	83 e2 fc             	and    $0xfffffffc,%edx
c01051bb:	e9 de fd ff ff       	jmp    c0104f9e <_malloc_r+0x3ee>
c01051c0:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c01051c6:	77 3c                	ja     c0105204 <_malloc_r+0x654>
c01051c8:	89 fe                	mov    %edi,%esi
c01051ca:	c1 ee 0f             	shr    $0xf,%esi
c01051cd:	83 c6 77             	add    $0x77,%esi
c01051d0:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01051d3:	e9 99 fa ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c01051d8:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c01051df:	89 cb                	mov    %ecx,%ebx
c01051e1:	31 d2                	xor    %edx,%edx
c01051e3:	e9 b6 fd ff ff       	jmp    c0104f9e <_malloc_r+0x3ee>
c01051e8:	c1 f9 02             	sar    $0x2,%ecx
c01051eb:	b8 01 00 00 00       	mov    $0x1,%eax
c01051f0:	d3 e0                	shl    %cl,%eax
c01051f2:	89 d1                	mov    %edx,%ecx
c01051f4:	0b 05 24 a5 10 c0    	or     0xc010a524,%eax
c01051fa:	a3 24 a5 10 c0       	mov    %eax,0xc010a524
c01051ff:	e9 5d fe ff ff       	jmp    c0105061 <_malloc_r+0x4b1>
c0105204:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c010520a:	77 47                	ja     c0105253 <_malloc_r+0x6a3>
c010520c:	89 fe                	mov    %edi,%esi
c010520e:	c1 ee 12             	shr    $0x12,%esi
c0105211:	83 c6 7c             	add    $0x7c,%esi
c0105214:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105217:	e9 55 fa ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c010521c:	8b 45 08             	mov    0x8(%ebp),%eax
c010521f:	83 c3 08             	add    $0x8,%ebx
c0105222:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105226:	89 04 24             	mov    %eax,(%esp)
c0105229:	e8 52 22 00 00       	call   c0107480 <_free_r>
c010522e:	8b 15 60 25 16 c0    	mov    0xc0162560,%edx
c0105234:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c0105239:	e9 3c fd ff ff       	jmp    c0104f7a <_malloc_r+0x3ca>
c010523e:	83 f9 54             	cmp    $0x54,%ecx
c0105241:	77 58                	ja     c010529b <_malloc_r+0x6eb>
c0105243:	89 f1                	mov    %esi,%ecx
c0105245:	c1 e9 0c             	shr    $0xc,%ecx
c0105248:	83 c1 6e             	add    $0x6e,%ecx
c010524b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010524e:	e9 e2 fd ff ff       	jmp    c0105035 <_malloc_r+0x485>
c0105253:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105258:	be 7e 00 00 00       	mov    $0x7e,%esi
c010525d:	e9 0f fa ff ff       	jmp    c0104c71 <_malloc_r+0xc1>
c0105262:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c0105269:	0f 85 4a fc ff ff    	jne    c0104eb9 <_malloc_r+0x309>
c010526f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105272:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c0105277:	01 f1                	add    %esi,%ecx
c0105279:	83 c9 01             	or     $0x1,%ecx
c010527c:	89 48 04             	mov    %ecx,0x4(%eax)
c010527f:	e9 f6 fc ff ff       	jmp    c0104f7a <_malloc_r+0x3ca>
c0105284:	b8 01 00 00 00       	mov    $0x1,%eax
c0105289:	31 d2                	xor    %edx,%edx
c010528b:	e9 91 fc ff ff       	jmp    c0104f21 <_malloc_r+0x371>
c0105290:	89 0d 00 a5 10 c0    	mov    %ecx,0xc010a500
c0105296:	e9 37 fc ff ff       	jmp    c0104ed2 <_malloc_r+0x322>
c010529b:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01052a1:	77 10                	ja     c01052b3 <_malloc_r+0x703>
c01052a3:	89 f1                	mov    %esi,%ecx
c01052a5:	c1 e9 0f             	shr    $0xf,%ecx
c01052a8:	83 c1 77             	add    $0x77,%ecx
c01052ab:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01052ae:	e9 82 fd ff ff       	jmp    c0105035 <_malloc_r+0x485>
c01052b3:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c01052b9:	77 10                	ja     c01052cb <_malloc_r+0x71b>
c01052bb:	89 f1                	mov    %esi,%ecx
c01052bd:	c1 e9 12             	shr    $0x12,%ecx
c01052c0:	83 c1 7c             	add    $0x7c,%ecx
c01052c3:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01052c6:	e9 6a fd ff ff       	jmp    c0105035 <_malloc_r+0x485>
c01052cb:	b8 fc 00 00 00       	mov    $0xfc,%eax
c01052d0:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c01052d5:	e9 5b fd ff ff       	jmp    c0105035 <_malloc_r+0x485>
c01052da:	a1 24 a5 10 c0       	mov    0xc010a524,%eax
c01052df:	e9 20 fe ff ff       	jmp    c0105104 <_malloc_r+0x554>
c01052e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01052e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052ea:	e9 88 fa ff ff       	jmp    c0104d77 <_malloc_r+0x1c7>
c01052ef:	90                   	nop

c01052f0 <memchr>:
c01052f0:	55                   	push   %ebp
c01052f1:	89 e5                	mov    %esp,%ebp
c01052f3:	57                   	push   %edi
c01052f4:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01052f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01052fb:	8b 7d 08             	mov    0x8(%ebp),%edi
c01052fe:	31 d2                	xor    %edx,%edx
c0105300:	85 c9                	test   %ecx,%ecx
c0105302:	74 79                	je     c010537d <L20>
c0105304:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010530a:	74 28                	je     c0105334 <L5>
c010530c:	3a 07                	cmp    (%edi),%al
c010530e:	74 6a                	je     c010537a <L15>
c0105310:	47                   	inc    %edi
c0105311:	49                   	dec    %ecx
c0105312:	74 69                	je     c010537d <L20>
c0105314:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010531a:	74 18                	je     c0105334 <L5>
c010531c:	3a 07                	cmp    (%edi),%al
c010531e:	74 5a                	je     c010537a <L15>
c0105320:	47                   	inc    %edi
c0105321:	49                   	dec    %ecx
c0105322:	74 59                	je     c010537d <L20>
c0105324:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010532a:	74 08                	je     c0105334 <L5>
c010532c:	3a 07                	cmp    (%edi),%al
c010532e:	74 4a                	je     c010537a <L15>
c0105330:	47                   	inc    %edi
c0105331:	49                   	dec    %ecx
c0105332:	74 49                	je     c010537d <L20>

c0105334 <L5>:
c0105334:	88 c4                	mov    %al,%ah
c0105336:	89 c2                	mov    %eax,%edx
c0105338:	c1 e2 10             	shl    $0x10,%edx
c010533b:	09 d0                	or     %edx,%eax
c010533d:	53                   	push   %ebx
c010533e:	66 90                	xchg   %ax,%ax

c0105340 <L8>:
c0105340:	83 e9 04             	sub    $0x4,%ecx
c0105343:	72 1c                	jb     c0105361 <L9>
c0105345:	8b 17                	mov    (%edi),%edx
c0105347:	83 c7 04             	add    $0x4,%edi
c010534a:	31 c2                	xor    %eax,%edx
c010534c:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c0105352:	f7 d2                	not    %edx
c0105354:	21 d3                	and    %edx,%ebx
c0105356:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c010535c:	74 e2                	je     c0105340 <L8>
c010535e:	83 ef 04             	sub    $0x4,%edi

c0105361 <L9>:
c0105361:	5b                   	pop    %ebx
c0105362:	31 d2                	xor    %edx,%edx
c0105364:	83 c1 04             	add    $0x4,%ecx
c0105367:	74 14                	je     c010537d <L20>
c0105369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105370 <L10>:
c0105370:	3a 07                	cmp    (%edi),%al
c0105372:	74 06                	je     c010537a <L15>
c0105374:	47                   	inc    %edi
c0105375:	49                   	dec    %ecx
c0105376:	75 f8                	jne    c0105370 <L10>
c0105378:	31 ff                	xor    %edi,%edi

c010537a <L15>:
c010537a:	4a                   	dec    %edx
c010537b:	21 fa                	and    %edi,%edx

c010537d <L20>:
c010537d:	89 d0                	mov    %edx,%eax
c010537f:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0105382:	5f                   	pop    %edi
c0105383:	c9                   	leave  
c0105384:	c3                   	ret    
c0105385:	66 90                	xchg   %ax,%ax
c0105387:	66 90                	xchg   %ax,%ax
c0105389:	66 90                	xchg   %ax,%ax
c010538b:	66 90                	xchg   %ax,%ax
c010538d:	66 90                	xchg   %ax,%ax
c010538f:	90                   	nop

c0105390 <__malloc_lock>:
c0105390:	55                   	push   %ebp
c0105391:	89 e5                	mov    %esp,%ebp
c0105393:	5d                   	pop    %ebp
c0105394:	c3                   	ret    
c0105395:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01053a0 <__malloc_unlock>:
c01053a0:	55                   	push   %ebp
c01053a1:	89 e5                	mov    %esp,%ebp
c01053a3:	5d                   	pop    %ebp
c01053a4:	c3                   	ret    
c01053a5:	66 90                	xchg   %ax,%ax
c01053a7:	66 90                	xchg   %ax,%ax
c01053a9:	66 90                	xchg   %ax,%ax
c01053ab:	66 90                	xchg   %ax,%ax
c01053ad:	66 90                	xchg   %ax,%ax
c01053af:	90                   	nop

c01053b0 <_Balloc>:
c01053b0:	55                   	push   %ebp
c01053b1:	89 e5                	mov    %esp,%ebp
c01053b3:	57                   	push   %edi
c01053b4:	56                   	push   %esi
c01053b5:	53                   	push   %ebx
c01053b6:	83 ec 1c             	sub    $0x1c,%esp
c01053b9:	8b 75 08             	mov    0x8(%ebp),%esi
c01053bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01053bf:	8b 46 4c             	mov    0x4c(%esi),%eax
c01053c2:	85 c0                	test   %eax,%eax
c01053c4:	74 2a                	je     c01053f0 <_Balloc+0x40>
c01053c6:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c01053c9:	8b 02                	mov    (%edx),%eax
c01053cb:	85 c0                	test   %eax,%eax
c01053cd:	74 49                	je     c0105418 <_Balloc+0x68>
c01053cf:	8b 08                	mov    (%eax),%ecx
c01053d1:	89 0a                	mov    %ecx,(%edx)
c01053d3:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c01053da:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c01053e1:	83 c4 1c             	add    $0x1c,%esp
c01053e4:	5b                   	pop    %ebx
c01053e5:	5e                   	pop    %esi
c01053e6:	5f                   	pop    %edi
c01053e7:	5d                   	pop    %ebp
c01053e8:	c3                   	ret    
c01053e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01053f0:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c01053f7:	00 
c01053f8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c01053ff:	00 
c0105400:	89 34 24             	mov    %esi,(%esp)
c0105403:	e8 c8 1e 00 00       	call   c01072d0 <_calloc_r>
c0105408:	85 c0                	test   %eax,%eax
c010540a:	89 46 4c             	mov    %eax,0x4c(%esi)
c010540d:	75 b7                	jne    c01053c6 <_Balloc+0x16>
c010540f:	31 c0                	xor    %eax,%eax
c0105411:	eb ce                	jmp    c01053e1 <_Balloc+0x31>
c0105413:	90                   	nop
c0105414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105418:	89 d9                	mov    %ebx,%ecx
c010541a:	bf 01 00 00 00       	mov    $0x1,%edi
c010541f:	d3 e7                	shl    %cl,%edi
c0105421:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c0105428:	89 44 24 08          	mov    %eax,0x8(%esp)
c010542c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105433:	00 
c0105434:	89 34 24             	mov    %esi,(%esp)
c0105437:	e8 94 1e 00 00       	call   c01072d0 <_calloc_r>
c010543c:	85 c0                	test   %eax,%eax
c010543e:	74 cf                	je     c010540f <_Balloc+0x5f>
c0105440:	89 58 04             	mov    %ebx,0x4(%eax)
c0105443:	89 78 08             	mov    %edi,0x8(%eax)
c0105446:	eb 8b                	jmp    c01053d3 <_Balloc+0x23>
c0105448:	90                   	nop
c0105449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105450 <_Bfree>:
c0105450:	55                   	push   %ebp
c0105451:	89 e5                	mov    %esp,%ebp
c0105453:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105456:	85 c0                	test   %eax,%eax
c0105458:	74 12                	je     c010546c <_Bfree+0x1c>
c010545a:	8b 55 08             	mov    0x8(%ebp),%edx
c010545d:	8b 48 04             	mov    0x4(%eax),%ecx
c0105460:	8b 52 4c             	mov    0x4c(%edx),%edx
c0105463:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c0105466:	8b 0a                	mov    (%edx),%ecx
c0105468:	89 08                	mov    %ecx,(%eax)
c010546a:	89 02                	mov    %eax,(%edx)
c010546c:	5d                   	pop    %ebp
c010546d:	c3                   	ret    
c010546e:	66 90                	xchg   %ax,%ax

c0105470 <__multadd>:
c0105470:	55                   	push   %ebp
c0105471:	89 e5                	mov    %esp,%ebp
c0105473:	57                   	push   %edi
c0105474:	56                   	push   %esi
c0105475:	53                   	push   %ebx
c0105476:	83 ec 2c             	sub    $0x2c,%esp
c0105479:	8b 45 0c             	mov    0xc(%ebp),%eax
c010547c:	8b 5d 14             	mov    0x14(%ebp),%ebx
c010547f:	8b 40 10             	mov    0x10(%eax),%eax
c0105482:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105485:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105488:	8d 78 14             	lea    0x14(%eax),%edi
c010548b:	31 c0                	xor    %eax,%eax
c010548d:	8d 76 00             	lea    0x0(%esi),%esi
c0105490:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c0105493:	0f b7 d1             	movzwl %cx,%edx
c0105496:	0f af 55 10          	imul   0x10(%ebp),%edx
c010549a:	c1 e9 10             	shr    $0x10,%ecx
c010549d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c01054a1:	01 da                	add    %ebx,%edx
c01054a3:	89 d3                	mov    %edx,%ebx
c01054a5:	0f b7 d2             	movzwl %dx,%edx
c01054a8:	c1 eb 10             	shr    $0x10,%ebx
c01054ab:	01 d9                	add    %ebx,%ecx
c01054ad:	89 ce                	mov    %ecx,%esi
c01054af:	c1 e1 10             	shl    $0x10,%ecx
c01054b2:	01 d1                	add    %edx,%ecx
c01054b4:	c1 ee 10             	shr    $0x10,%esi
c01054b7:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c01054ba:	83 c0 01             	add    $0x1,%eax
c01054bd:	89 f3                	mov    %esi,%ebx
c01054bf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01054c2:	7f cc                	jg     c0105490 <__multadd+0x20>
c01054c4:	85 f6                	test   %esi,%esi
c01054c6:	74 1b                	je     c01054e3 <__multadd+0x73>
c01054c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01054cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c01054ce:	3b 78 08             	cmp    0x8(%eax),%edi
c01054d1:	7d 1d                	jge    c01054f0 <__multadd+0x80>
c01054d3:	8b 7d 0c             	mov    0xc(%ebp),%edi
c01054d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01054d9:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c01054dd:	83 c0 01             	add    $0x1,%eax
c01054e0:	89 47 10             	mov    %eax,0x10(%edi)
c01054e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01054e6:	83 c4 2c             	add    $0x2c,%esp
c01054e9:	5b                   	pop    %ebx
c01054ea:	5e                   	pop    %esi
c01054eb:	5f                   	pop    %edi
c01054ec:	5d                   	pop    %ebp
c01054ed:	c3                   	ret    
c01054ee:	66 90                	xchg   %ax,%ax
c01054f0:	8b 40 04             	mov    0x4(%eax),%eax
c01054f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01054f6:	83 c0 01             	add    $0x1,%eax
c01054f9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01054fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0105500:	89 04 24             	mov    %eax,(%esp)
c0105503:	e8 a8 fe ff ff       	call   c01053b0 <_Balloc>
c0105508:	89 c3                	mov    %eax,%ebx
c010550a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010550d:	8b 40 10             	mov    0x10(%eax),%eax
c0105510:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0105517:	89 44 24 08          	mov    %eax,0x8(%esp)
c010551b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010551e:	83 c0 0c             	add    $0xc,%eax
c0105521:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105525:	8d 43 0c             	lea    0xc(%ebx),%eax
c0105528:	89 04 24             	mov    %eax,(%esp)
c010552b:	e8 60 c0 ff ff       	call   c0101590 <memcpy>
c0105530:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105533:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105536:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0105539:	8b 50 04             	mov    0x4(%eax),%edx
c010553c:	8b 45 08             	mov    0x8(%ebp),%eax
c010553f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105542:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105545:	8b 10                	mov    (%eax),%edx
c0105547:	89 17                	mov    %edx,(%edi)
c0105549:	89 38                	mov    %edi,(%eax)
c010554b:	eb 86                	jmp    c01054d3 <__multadd+0x63>
c010554d:	8d 76 00             	lea    0x0(%esi),%esi

c0105550 <__s2b>:
c0105550:	55                   	push   %ebp
c0105551:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c0105556:	89 e5                	mov    %esp,%ebp
c0105558:	57                   	push   %edi
c0105559:	56                   	push   %esi
c010555a:	53                   	push   %ebx
c010555b:	83 ec 2c             	sub    $0x2c,%esp
c010555e:	8b 45 14             	mov    0x14(%ebp),%eax
c0105561:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105564:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105567:	8d 48 08             	lea    0x8(%eax),%ecx
c010556a:	89 c8                	mov    %ecx,%eax
c010556c:	f7 ea                	imul   %edx
c010556e:	c1 f9 1f             	sar    $0x1f,%ecx
c0105571:	d1 fa                	sar    %edx
c0105573:	29 ca                	sub    %ecx,%edx
c0105575:	83 fa 01             	cmp    $0x1,%edx
c0105578:	0f 8e be 00 00 00    	jle    c010563c <__s2b+0xec>
c010557e:	b8 01 00 00 00       	mov    $0x1,%eax
c0105583:	31 c9                	xor    %ecx,%ecx
c0105585:	8d 76 00             	lea    0x0(%esi),%esi
c0105588:	01 c0                	add    %eax,%eax
c010558a:	83 c1 01             	add    $0x1,%ecx
c010558d:	39 c2                	cmp    %eax,%edx
c010558f:	7f f7                	jg     c0105588 <__s2b+0x38>
c0105591:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0105595:	89 1c 24             	mov    %ebx,(%esp)
c0105598:	e8 13 fe ff ff       	call   c01053b0 <_Balloc>
c010559d:	8b 55 18             	mov    0x18(%ebp),%edx
c01055a0:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c01055a4:	89 50 14             	mov    %edx,0x14(%eax)
c01055a7:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01055ae:	0f 8e 7c 00 00 00    	jle    c0105630 <__s2b+0xe0>
c01055b4:	8d 4e 09             	lea    0x9(%esi),%ecx
c01055b7:	03 75 10             	add    0x10(%ebp),%esi
c01055ba:	89 cf                	mov    %ecx,%edi
c01055bc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01055bf:	90                   	nop
c01055c0:	83 c7 01             	add    $0x1,%edi
c01055c3:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c01055c7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01055ce:	00 
c01055cf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01055d3:	89 1c 24             	mov    %ebx,(%esp)
c01055d6:	83 ea 30             	sub    $0x30,%edx
c01055d9:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01055dd:	e8 8e fe ff ff       	call   c0105470 <__multadd>
c01055e2:	39 f7                	cmp    %esi,%edi
c01055e4:	75 da                	jne    c01055c0 <__s2b+0x70>
c01055e6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01055e9:	8b 7d 10             	mov    0x10(%ebp),%edi
c01055ec:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c01055f0:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01055f3:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c01055f6:	7e 2e                	jle    c0105626 <__s2b+0xd6>
c01055f8:	8b 7d 14             	mov    0x14(%ebp),%edi
c01055fb:	29 cf                	sub    %ecx,%edi
c01055fd:	01 f7                	add    %esi,%edi
c01055ff:	90                   	nop
c0105600:	83 c6 01             	add    $0x1,%esi
c0105603:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c0105607:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010560e:	00 
c010560f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105613:	89 1c 24             	mov    %ebx,(%esp)
c0105616:	83 ea 30             	sub    $0x30,%edx
c0105619:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010561d:	e8 4e fe ff ff       	call   c0105470 <__multadd>
c0105622:	39 fe                	cmp    %edi,%esi
c0105624:	75 da                	jne    c0105600 <__s2b+0xb0>
c0105626:	83 c4 2c             	add    $0x2c,%esp
c0105629:	5b                   	pop    %ebx
c010562a:	5e                   	pop    %esi
c010562b:	5f                   	pop    %edi
c010562c:	5d                   	pop    %ebp
c010562d:	c3                   	ret    
c010562e:	66 90                	xchg   %ax,%ax
c0105630:	83 c6 0a             	add    $0xa,%esi
c0105633:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c010563a:	eb b4                	jmp    c01055f0 <__s2b+0xa0>
c010563c:	31 c9                	xor    %ecx,%ecx
c010563e:	e9 4e ff ff ff       	jmp    c0105591 <__s2b+0x41>
c0105643:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105650 <__hi0bits>:
c0105650:	55                   	push   %ebp
c0105651:	31 c9                	xor    %ecx,%ecx
c0105653:	89 e5                	mov    %esp,%ebp
c0105655:	8b 55 08             	mov    0x8(%ebp),%edx
c0105658:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c010565e:	75 05                	jne    c0105665 <__hi0bits+0x15>
c0105660:	c1 e2 10             	shl    $0x10,%edx
c0105663:	b1 10                	mov    $0x10,%cl
c0105665:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c010566b:	75 06                	jne    c0105673 <__hi0bits+0x23>
c010566d:	83 c1 08             	add    $0x8,%ecx
c0105670:	c1 e2 08             	shl    $0x8,%edx
c0105673:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c0105679:	75 06                	jne    c0105681 <__hi0bits+0x31>
c010567b:	83 c1 04             	add    $0x4,%ecx
c010567e:	c1 e2 04             	shl    $0x4,%edx
c0105681:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c0105687:	75 06                	jne    c010568f <__hi0bits+0x3f>
c0105689:	83 c1 02             	add    $0x2,%ecx
c010568c:	c1 e2 02             	shl    $0x2,%edx
c010568f:	85 d2                	test   %edx,%edx
c0105691:	89 c8                	mov    %ecx,%eax
c0105693:	78 0d                	js     c01056a2 <__hi0bits+0x52>
c0105695:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c010569b:	b8 20 00 00 00       	mov    $0x20,%eax
c01056a0:	75 06                	jne    c01056a8 <__hi0bits+0x58>
c01056a2:	5d                   	pop    %ebp
c01056a3:	c3                   	ret    
c01056a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01056a8:	8d 41 01             	lea    0x1(%ecx),%eax
c01056ab:	5d                   	pop    %ebp
c01056ac:	c3                   	ret    
c01056ad:	8d 76 00             	lea    0x0(%esi),%esi

c01056b0 <__lo0bits>:
c01056b0:	55                   	push   %ebp
c01056b1:	89 e5                	mov    %esp,%ebp
c01056b3:	53                   	push   %ebx
c01056b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01056b7:	8b 13                	mov    (%ebx),%edx
c01056b9:	f6 c2 07             	test   $0x7,%dl
c01056bc:	74 1a                	je     c01056d8 <__lo0bits+0x28>
c01056be:	31 c0                	xor    %eax,%eax
c01056c0:	f6 c2 01             	test   $0x1,%dl
c01056c3:	75 0f                	jne    c01056d4 <__lo0bits+0x24>
c01056c5:	f6 c2 02             	test   $0x2,%dl
c01056c8:	75 56                	jne    c0105720 <__lo0bits+0x70>
c01056ca:	c1 ea 02             	shr    $0x2,%edx
c01056cd:	b8 02 00 00 00       	mov    $0x2,%eax
c01056d2:	89 13                	mov    %edx,(%ebx)
c01056d4:	5b                   	pop    %ebx
c01056d5:	5d                   	pop    %ebp
c01056d6:	c3                   	ret    
c01056d7:	90                   	nop
c01056d8:	31 c9                	xor    %ecx,%ecx
c01056da:	66 85 d2             	test   %dx,%dx
c01056dd:	75 05                	jne    c01056e4 <__lo0bits+0x34>
c01056df:	c1 ea 10             	shr    $0x10,%edx
c01056e2:	b1 10                	mov    $0x10,%cl
c01056e4:	84 d2                	test   %dl,%dl
c01056e6:	75 06                	jne    c01056ee <__lo0bits+0x3e>
c01056e8:	83 c1 08             	add    $0x8,%ecx
c01056eb:	c1 ea 08             	shr    $0x8,%edx
c01056ee:	f6 c2 0f             	test   $0xf,%dl
c01056f1:	75 06                	jne    c01056f9 <__lo0bits+0x49>
c01056f3:	83 c1 04             	add    $0x4,%ecx
c01056f6:	c1 ea 04             	shr    $0x4,%edx
c01056f9:	f6 c2 03             	test   $0x3,%dl
c01056fc:	75 06                	jne    c0105704 <__lo0bits+0x54>
c01056fe:	83 c1 02             	add    $0x2,%ecx
c0105701:	c1 ea 02             	shr    $0x2,%edx
c0105704:	f6 c2 01             	test   $0x1,%dl
c0105707:	75 0c                	jne    c0105715 <__lo0bits+0x65>
c0105709:	d1 ea                	shr    %edx
c010570b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105710:	74 c2                	je     c01056d4 <__lo0bits+0x24>
c0105712:	83 c1 01             	add    $0x1,%ecx
c0105715:	89 13                	mov    %edx,(%ebx)
c0105717:	89 c8                	mov    %ecx,%eax
c0105719:	5b                   	pop    %ebx
c010571a:	5d                   	pop    %ebp
c010571b:	c3                   	ret    
c010571c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105720:	d1 ea                	shr    %edx
c0105722:	b0 01                	mov    $0x1,%al
c0105724:	89 13                	mov    %edx,(%ebx)
c0105726:	5b                   	pop    %ebx
c0105727:	5d                   	pop    %ebp
c0105728:	c3                   	ret    
c0105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105730 <__i2b>:
c0105730:	55                   	push   %ebp
c0105731:	89 e5                	mov    %esp,%ebp
c0105733:	83 ec 18             	sub    $0x18,%esp
c0105736:	8b 45 08             	mov    0x8(%ebp),%eax
c0105739:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105740:	00 
c0105741:	89 04 24             	mov    %eax,(%esp)
c0105744:	e8 67 fc ff ff       	call   c01053b0 <_Balloc>
c0105749:	8b 55 0c             	mov    0xc(%ebp),%edx
c010574c:	89 50 14             	mov    %edx,0x14(%eax)
c010574f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105756:	c9                   	leave  
c0105757:	c3                   	ret    
c0105758:	90                   	nop
c0105759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105760 <__multiply>:
c0105760:	55                   	push   %ebp
c0105761:	89 e5                	mov    %esp,%ebp
c0105763:	57                   	push   %edi
c0105764:	56                   	push   %esi
c0105765:	53                   	push   %ebx
c0105766:	83 ec 3c             	sub    $0x3c,%esp
c0105769:	8b 75 0c             	mov    0xc(%ebp),%esi
c010576c:	8b 45 10             	mov    0x10(%ebp),%eax
c010576f:	8b 7e 10             	mov    0x10(%esi),%edi
c0105772:	8b 58 10             	mov    0x10(%eax),%ebx
c0105775:	39 df                	cmp    %ebx,%edi
c0105777:	7d 0e                	jge    c0105787 <__multiply+0x27>
c0105779:	89 f8                	mov    %edi,%eax
c010577b:	89 df                	mov    %ebx,%edi
c010577d:	89 c3                	mov    %eax,%ebx
c010577f:	89 f0                	mov    %esi,%eax
c0105781:	8b 75 10             	mov    0x10(%ebp),%esi
c0105784:	89 45 10             	mov    %eax,0x10(%ebp)
c0105787:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c010578a:	3b 46 08             	cmp    0x8(%esi),%eax
c010578d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105790:	0f 9f c0             	setg   %al
c0105793:	0f b6 c0             	movzbl %al,%eax
c0105796:	03 46 04             	add    0x4(%esi),%eax
c0105799:	89 44 24 04          	mov    %eax,0x4(%esp)
c010579d:	8b 45 08             	mov    0x8(%ebp),%eax
c01057a0:	89 04 24             	mov    %eax,(%esp)
c01057a3:	e8 08 fc ff ff       	call   c01053b0 <_Balloc>
c01057a8:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01057ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01057ae:	8d 40 14             	lea    0x14(%eax),%eax
c01057b1:	8d 14 90             	lea    (%eax,%edx,4),%edx
c01057b4:	89 d1                	mov    %edx,%ecx
c01057b6:	39 c8                	cmp    %ecx,%eax
c01057b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01057bb:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01057be:	73 15                	jae    c01057d5 <__multiply+0x75>
c01057c0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c01057c3:	90                   	nop
c01057c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01057c8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01057ce:	83 c0 04             	add    $0x4,%eax
c01057d1:	39 c2                	cmp    %eax,%edx
c01057d3:	77 f3                	ja     c01057c8 <__multiply+0x68>
c01057d5:	8d 46 14             	lea    0x14(%esi),%eax
c01057d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01057db:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c01057de:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01057e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01057e4:	83 c0 14             	add    $0x14,%eax
c01057e7:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c01057ea:	39 f8                	cmp    %edi,%eax
c01057ec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01057ef:	89 7d cc             	mov    %edi,-0x34(%ebp)
c01057f2:	0f 83 e8 00 00 00    	jae    c01058e0 <__multiply+0x180>
c01057f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01057fb:	8b 00                	mov    (%eax),%eax
c01057fd:	0f b7 f8             	movzwl %ax,%edi
c0105800:	85 ff                	test   %edi,%edi
c0105802:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105805:	74 5a                	je     c0105861 <__multiply+0x101>
c0105807:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010580a:	31 db                	xor    %ebx,%ebx
c010580c:	8b 75 d0             	mov    -0x30(%ebp),%esi
c010580f:	eb 09                	jmp    c010581a <__multiply+0xba>
c0105811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105818:	89 fa                	mov    %edi,%edx
c010581a:	8b 0e                	mov    (%esi),%ecx
c010581c:	83 c6 04             	add    $0x4,%esi
c010581f:	0f b7 3a             	movzwl (%edx),%edi
c0105822:	0f b7 c1             	movzwl %cx,%eax
c0105825:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c0105829:	c1 e9 10             	shr    $0x10,%ecx
c010582c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105830:	01 f8                	add    %edi,%eax
c0105832:	01 d8                	add    %ebx,%eax
c0105834:	8b 1a                	mov    (%edx),%ebx
c0105836:	8d 7a 04             	lea    0x4(%edx),%edi
c0105839:	c1 eb 10             	shr    $0x10,%ebx
c010583c:	01 d9                	add    %ebx,%ecx
c010583e:	89 c3                	mov    %eax,%ebx
c0105840:	c1 eb 10             	shr    $0x10,%ebx
c0105843:	0f b7 c0             	movzwl %ax,%eax
c0105846:	01 d9                	add    %ebx,%ecx
c0105848:	89 cb                	mov    %ecx,%ebx
c010584a:	c1 e1 10             	shl    $0x10,%ecx
c010584d:	09 c1                	or     %eax,%ecx
c010584f:	c1 eb 10             	shr    $0x10,%ebx
c0105852:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c0105855:	89 0a                	mov    %ecx,(%edx)
c0105857:	77 bf                	ja     c0105818 <__multiply+0xb8>
c0105859:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010585c:	89 5a 04             	mov    %ebx,0x4(%edx)
c010585f:	8b 00                	mov    (%eax),%eax
c0105861:	c1 e8 10             	shr    $0x10,%eax
c0105864:	85 c0                	test   %eax,%eax
c0105866:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105869:	74 61                	je     c01058cc <__multiply+0x16c>
c010586b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010586e:	31 ff                	xor    %edi,%edi
c0105870:	89 fe                	mov    %edi,%esi
c0105872:	8b 10                	mov    (%eax),%edx
c0105874:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105877:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010587a:	89 d3                	mov    %edx,%ebx
c010587c:	eb 05                	jmp    c0105883 <__multiply+0x123>
c010587e:	66 90                	xchg   %ax,%ax
c0105880:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0105883:	0f b7 08             	movzwl (%eax),%ecx
c0105886:	c1 eb 10             	shr    $0x10,%ebx
c0105889:	0f b7 d2             	movzwl %dx,%edx
c010588c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105890:	83 c0 04             	add    $0x4,%eax
c0105893:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c0105896:	01 f7                	add    %esi,%edi
c0105898:	8b 75 e0             	mov    -0x20(%ebp),%esi
c010589b:	89 fb                	mov    %edi,%ebx
c010589d:	c1 e3 10             	shl    $0x10,%ebx
c01058a0:	09 d3                	or     %edx,%ebx
c01058a2:	89 1e                	mov    %ebx,(%esi)
c01058a4:	8b 5e 04             	mov    0x4(%esi),%ebx
c01058a7:	8d 4e 04             	lea    0x4(%esi),%ecx
c01058aa:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c01058ae:	c1 ef 10             	shr    $0x10,%edi
c01058b1:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c01058b5:	0f b7 f3             	movzwl %bx,%esi
c01058b8:	01 f2                	add    %esi,%edx
c01058ba:	01 fa                	add    %edi,%edx
c01058bc:	89 d6                	mov    %edx,%esi
c01058be:	c1 ee 10             	shr    $0x10,%esi
c01058c1:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c01058c4:	77 ba                	ja     c0105880 <__multiply+0x120>
c01058c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01058c9:	89 50 04             	mov    %edx,0x4(%eax)
c01058cc:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c01058d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01058d3:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c01058d7:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c01058da:	0f 87 18 ff ff ff    	ja     c01057f8 <__multiply+0x98>
c01058e0:	8b 75 c8             	mov    -0x38(%ebp),%esi
c01058e3:	85 f6                	test   %esi,%esi
c01058e5:	7e 29                	jle    c0105910 <__multiply+0x1b0>
c01058e7:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c01058ea:	8b 5f fc             	mov    -0x4(%edi),%ebx
c01058ed:	85 db                	test   %ebx,%ebx
c01058ef:	75 1f                	jne    c0105910 <__multiply+0x1b0>
c01058f1:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01058f4:	89 d0                	mov    %edx,%eax
c01058f6:	c1 e0 02             	shl    $0x2,%eax
c01058f9:	29 c7                	sub    %eax,%edi
c01058fb:	89 f8                	mov    %edi,%eax
c01058fd:	eb 09                	jmp    c0105908 <__multiply+0x1a8>
c01058ff:	90                   	nop
c0105900:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105904:	85 c9                	test   %ecx,%ecx
c0105906:	75 05                	jne    c010590d <__multiply+0x1ad>
c0105908:	83 ea 01             	sub    $0x1,%edx
c010590b:	75 f3                	jne    c0105900 <__multiply+0x1a0>
c010590d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105910:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105913:	8b 7d c8             	mov    -0x38(%ebp),%edi
c0105916:	89 78 10             	mov    %edi,0x10(%eax)
c0105919:	83 c4 3c             	add    $0x3c,%esp
c010591c:	5b                   	pop    %ebx
c010591d:	5e                   	pop    %esi
c010591e:	5f                   	pop    %edi
c010591f:	5d                   	pop    %ebp
c0105920:	c3                   	ret    
c0105921:	eb 0d                	jmp    c0105930 <__pow5mult>
c0105923:	90                   	nop
c0105924:	90                   	nop
c0105925:	90                   	nop
c0105926:	90                   	nop
c0105927:	90                   	nop
c0105928:	90                   	nop
c0105929:	90                   	nop
c010592a:	90                   	nop
c010592b:	90                   	nop
c010592c:	90                   	nop
c010592d:	90                   	nop
c010592e:	90                   	nop
c010592f:	90                   	nop

c0105930 <__pow5mult>:
c0105930:	55                   	push   %ebp
c0105931:	89 e5                	mov    %esp,%ebp
c0105933:	57                   	push   %edi
c0105934:	56                   	push   %esi
c0105935:	53                   	push   %ebx
c0105936:	83 ec 2c             	sub    $0x2c,%esp
c0105939:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010593c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010593f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105942:	89 d8                	mov    %ebx,%eax
c0105944:	83 e0 03             	and    $0x3,%eax
c0105947:	0f 85 a3 00 00 00    	jne    c01059f0 <__pow5mult+0xc0>
c010594d:	c1 fb 02             	sar    $0x2,%ebx
c0105950:	85 db                	test   %ebx,%ebx
c0105952:	74 5c                	je     c01059b0 <__pow5mult+0x80>
c0105954:	8b 71 48             	mov    0x48(%ecx),%esi
c0105957:	85 f6                	test   %esi,%esi
c0105959:	0f 84 bd 00 00 00    	je     c0105a1c <__pow5mult+0xec>
c010595f:	f6 c3 01             	test   $0x1,%bl
c0105962:	75 15                	jne    c0105979 <__pow5mult+0x49>
c0105964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105968:	d1 fb                	sar    %ebx
c010596a:	74 44                	je     c01059b0 <__pow5mult+0x80>
c010596c:	8b 06                	mov    (%esi),%eax
c010596e:	85 c0                	test   %eax,%eax
c0105970:	74 4e                	je     c01059c0 <__pow5mult+0x90>
c0105972:	89 c6                	mov    %eax,%esi
c0105974:	f6 c3 01             	test   $0x1,%bl
c0105977:	74 ef                	je     c0105968 <__pow5mult+0x38>
c0105979:	89 0c 24             	mov    %ecx,(%esp)
c010597c:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105980:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0105984:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105987:	e8 d4 fd ff ff       	call   c0105760 <__multiply>
c010598c:	85 ff                	test   %edi,%edi
c010598e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105991:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105994:	74 52                	je     c01059e8 <__pow5mult+0xb8>
c0105996:	8b 57 04             	mov    0x4(%edi),%edx
c0105999:	d1 fb                	sar    %ebx
c010599b:	8b 41 4c             	mov    0x4c(%ecx),%eax
c010599e:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01059a1:	8b 10                	mov    (%eax),%edx
c01059a3:	89 17                	mov    %edx,(%edi)
c01059a5:	89 38                	mov    %edi,(%eax)
c01059a7:	8b 7d e0             	mov    -0x20(%ebp),%edi
c01059aa:	75 c0                	jne    c010596c <__pow5mult+0x3c>
c01059ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01059b0:	83 c4 2c             	add    $0x2c,%esp
c01059b3:	89 f8                	mov    %edi,%eax
c01059b5:	5b                   	pop    %ebx
c01059b6:	5e                   	pop    %esi
c01059b7:	5f                   	pop    %edi
c01059b8:	5d                   	pop    %ebp
c01059b9:	c3                   	ret    
c01059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01059c0:	89 74 24 08          	mov    %esi,0x8(%esp)
c01059c4:	89 74 24 04          	mov    %esi,0x4(%esp)
c01059c8:	89 0c 24             	mov    %ecx,(%esp)
c01059cb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01059ce:	e8 8d fd ff ff       	call   c0105760 <__multiply>
c01059d3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01059d6:	89 06                	mov    %eax,(%esi)
c01059d8:	89 c6                	mov    %eax,%esi
c01059da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01059e0:	eb 92                	jmp    c0105974 <__pow5mult+0x44>
c01059e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01059e8:	8b 7d e0             	mov    -0x20(%ebp),%edi
c01059eb:	e9 78 ff ff ff       	jmp    c0105968 <__pow5mult+0x38>
c01059f0:	8b 04 85 bc 86 10 c0 	mov    -0x3fef7944(,%eax,4),%eax
c01059f7:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01059fb:	89 0c 24             	mov    %ecx,(%esp)
c01059fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0105a05:	00 
c0105a06:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105a0a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105a0d:	e8 5e fa ff ff       	call   c0105470 <__multadd>
c0105a12:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105a15:	89 c7                	mov    %eax,%edi
c0105a17:	e9 31 ff ff ff       	jmp    c010594d <__pow5mult+0x1d>
c0105a1c:	89 0c 24             	mov    %ecx,(%esp)
c0105a1f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105a26:	00 
c0105a27:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105a2a:	e8 81 f9 ff ff       	call   c01053b0 <_Balloc>
c0105a2f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105a32:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c0105a39:	89 c6                	mov    %eax,%esi
c0105a3b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105a42:	89 41 48             	mov    %eax,0x48(%ecx)
c0105a45:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105a4b:	e9 0f ff ff ff       	jmp    c010595f <__pow5mult+0x2f>

c0105a50 <__lshift>:
c0105a50:	55                   	push   %ebp
c0105a51:	89 e5                	mov    %esp,%ebp
c0105a53:	57                   	push   %edi
c0105a54:	56                   	push   %esi
c0105a55:	53                   	push   %ebx
c0105a56:	83 ec 2c             	sub    $0x2c,%esp
c0105a59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a5c:	8b 75 10             	mov    0x10(%ebp),%esi
c0105a5f:	89 c7                	mov    %eax,%edi
c0105a61:	8b 50 04             	mov    0x4(%eax),%edx
c0105a64:	8b 40 10             	mov    0x10(%eax),%eax
c0105a67:	89 f3                	mov    %esi,%ebx
c0105a69:	c1 fb 05             	sar    $0x5,%ebx
c0105a6c:	01 d8                	add    %ebx,%eax
c0105a6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105a71:	83 c0 01             	add    $0x1,%eax
c0105a74:	89 c1                	mov    %eax,%ecx
c0105a76:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a79:	8b 47 08             	mov    0x8(%edi),%eax
c0105a7c:	39 c1                	cmp    %eax,%ecx
c0105a7e:	7e 09                	jle    c0105a89 <__lshift+0x39>
c0105a80:	01 c0                	add    %eax,%eax
c0105a82:	83 c2 01             	add    $0x1,%edx
c0105a85:	39 c1                	cmp    %eax,%ecx
c0105a87:	7f f7                	jg     c0105a80 <__lshift+0x30>
c0105a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a8c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105a90:	89 04 24             	mov    %eax,(%esp)
c0105a93:	e8 18 f9 ff ff       	call   c01053b0 <_Balloc>
c0105a98:	85 db                	test   %ebx,%ebx
c0105a9a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105a9d:	8d 50 14             	lea    0x14(%eax),%edx
c0105aa0:	7e 17                	jle    c0105ab9 <__lshift+0x69>
c0105aa2:	31 c0                	xor    %eax,%eax
c0105aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105aa8:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c0105aaf:	83 c0 01             	add    $0x1,%eax
c0105ab2:	39 d8                	cmp    %ebx,%eax
c0105ab4:	75 f2                	jne    c0105aa8 <__lshift+0x58>
c0105ab6:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0105ab9:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105abc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105abf:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105ac2:	83 c0 14             	add    $0x14,%eax
c0105ac5:	83 e6 1f             	and    $0x1f,%esi
c0105ac8:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105acb:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c0105ace:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105ad1:	74 7d                	je     c0105b50 <__lshift+0x100>
c0105ad3:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c0105ada:	29 75 dc             	sub    %esi,-0x24(%ebp)
c0105add:	31 f6                	xor    %esi,%esi
c0105adf:	eb 09                	jmp    c0105aea <__lshift+0x9a>
c0105ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105ae8:	89 fa                	mov    %edi,%edx
c0105aea:	8b 18                	mov    (%eax),%ebx
c0105aec:	83 c0 04             	add    $0x4,%eax
c0105aef:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105af3:	8d 7a 04             	lea    0x4(%edx),%edi
c0105af6:	d3 e3                	shl    %cl,%ebx
c0105af8:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c0105afc:	09 f3                	or     %esi,%ebx
c0105afe:	89 1a                	mov    %ebx,(%edx)
c0105b00:	8b 70 fc             	mov    -0x4(%eax),%esi
c0105b03:	d3 ee                	shr    %cl,%esi
c0105b05:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105b08:	77 de                	ja     c0105ae8 <__lshift+0x98>
c0105b0a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105b0d:	89 72 04             	mov    %esi,0x4(%edx)
c0105b10:	83 c0 02             	add    $0x2,%eax
c0105b13:	85 f6                	test   %esi,%esi
c0105b15:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c0105b19:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105b1f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0105b22:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105b25:	83 e8 01             	sub    $0x1,%eax
c0105b28:	89 47 10             	mov    %eax,0x10(%edi)
c0105b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b2e:	8b 50 04             	mov    0x4(%eax),%edx
c0105b31:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b34:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105b37:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105b3a:	8b 10                	mov    (%eax),%edx
c0105b3c:	89 16                	mov    %edx,(%esi)
c0105b3e:	89 30                	mov    %esi,(%eax)
c0105b40:	83 c4 2c             	add    $0x2c,%esp
c0105b43:	89 f8                	mov    %edi,%eax
c0105b45:	5b                   	pop    %ebx
c0105b46:	5e                   	pop    %esi
c0105b47:	5f                   	pop    %edi
c0105b48:	5d                   	pop    %ebp
c0105b49:	c3                   	ret    
c0105b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105b50:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0105b53:	90                   	nop
c0105b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105b58:	83 c0 04             	add    $0x4,%eax
c0105b5b:	8b 48 fc             	mov    -0x4(%eax),%ecx
c0105b5e:	83 c2 04             	add    $0x4,%edx
c0105b61:	39 c3                	cmp    %eax,%ebx
c0105b63:	89 4a fc             	mov    %ecx,-0x4(%edx)
c0105b66:	77 f0                	ja     c0105b58 <__lshift+0x108>
c0105b68:	eb b2                	jmp    c0105b1c <__lshift+0xcc>
c0105b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105b70 <__mcmp>:
c0105b70:	55                   	push   %ebp
c0105b71:	89 e5                	mov    %esp,%ebp
c0105b73:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0105b76:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105b79:	53                   	push   %ebx
c0105b7a:	8b 41 10             	mov    0x10(%ecx),%eax
c0105b7d:	8b 5a 10             	mov    0x10(%edx),%ebx
c0105b80:	29 d8                	sub    %ebx,%eax
c0105b82:	85 c0                	test   %eax,%eax
c0105b84:	75 27                	jne    c0105bad <__mcmp+0x3d>
c0105b86:	c1 e3 02             	shl    $0x2,%ebx
c0105b89:	83 c1 14             	add    $0x14,%ecx
c0105b8c:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c0105b8f:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c0105b93:	eb 07                	jmp    c0105b9c <__mcmp+0x2c>
c0105b95:	8d 76 00             	lea    0x0(%esi),%esi
c0105b98:	39 c1                	cmp    %eax,%ecx
c0105b9a:	73 14                	jae    c0105bb0 <__mcmp+0x40>
c0105b9c:	83 ea 04             	sub    $0x4,%edx
c0105b9f:	83 e8 04             	sub    $0x4,%eax
c0105ba2:	8b 1a                	mov    (%edx),%ebx
c0105ba4:	39 18                	cmp    %ebx,(%eax)
c0105ba6:	74 f0                	je     c0105b98 <__mcmp+0x28>
c0105ba8:	19 c0                	sbb    %eax,%eax
c0105baa:	83 c8 01             	or     $0x1,%eax
c0105bad:	5b                   	pop    %ebx
c0105bae:	5d                   	pop    %ebp
c0105baf:	c3                   	ret    
c0105bb0:	31 c0                	xor    %eax,%eax
c0105bb2:	5b                   	pop    %ebx
c0105bb3:	5d                   	pop    %ebp
c0105bb4:	c3                   	ret    
c0105bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105bc0 <__mdiff>:
c0105bc0:	55                   	push   %ebp
c0105bc1:	89 e5                	mov    %esp,%ebp
c0105bc3:	57                   	push   %edi
c0105bc4:	56                   	push   %esi
c0105bc5:	53                   	push   %ebx
c0105bc6:	83 ec 2c             	sub    $0x2c,%esp
c0105bc9:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105bcc:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105bcf:	89 34 24             	mov    %esi,(%esp)
c0105bd2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105bd6:	e8 95 ff ff ff       	call   c0105b70 <__mcmp>
c0105bdb:	85 c0                	test   %eax,%eax
c0105bdd:	0f 84 25 01 00 00    	je     c0105d08 <__mdiff+0x148>
c0105be3:	0f 88 0f 01 00 00    	js     c0105cf8 <__mdiff+0x138>
c0105be9:	31 ff                	xor    %edi,%edi
c0105beb:	8b 46 04             	mov    0x4(%esi),%eax
c0105bee:	83 c6 14             	add    $0x14,%esi
c0105bf1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105bf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bf8:	89 04 24             	mov    %eax,(%esp)
c0105bfb:	e8 b0 f7 ff ff       	call   c01053b0 <_Balloc>
c0105c00:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0105c03:	89 c2                	mov    %eax,%edx
c0105c05:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105c08:	89 78 0c             	mov    %edi,0xc(%eax)
c0105c0b:	8b 46 fc             	mov    -0x4(%esi),%eax
c0105c0e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0105c11:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105c14:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0105c17:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c1a:	8b 43 10             	mov    0x10(%ebx),%eax
c0105c1d:	31 db                	xor    %ebx,%ebx
c0105c1f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0105c22:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c25:	89 d0                	mov    %edx,%eax
c0105c27:	83 c0 14             	add    $0x14,%eax
c0105c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105c30:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105c33:	83 c0 04             	add    $0x4,%eax
c0105c36:	83 c1 04             	add    $0x4,%ecx
c0105c39:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c0105c3d:	8b 3e                	mov    (%esi),%edi
c0105c3f:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0105c42:	0f b7 d7             	movzwl %di,%edx
c0105c45:	01 da                	add    %ebx,%edx
c0105c47:	0f b7 de             	movzwl %si,%ebx
c0105c4a:	29 da                	sub    %ebx,%edx
c0105c4c:	c1 ef 10             	shr    $0x10,%edi
c0105c4f:	89 d3                	mov    %edx,%ebx
c0105c51:	c1 ee 10             	shr    $0x10,%esi
c0105c54:	0f b7 d2             	movzwl %dx,%edx
c0105c57:	c1 fb 10             	sar    $0x10,%ebx
c0105c5a:	29 f7                	sub    %esi,%edi
c0105c5c:	01 df                	add    %ebx,%edi
c0105c5e:	89 fb                	mov    %edi,%ebx
c0105c60:	c1 e7 10             	shl    $0x10,%edi
c0105c63:	09 d7                	or     %edx,%edi
c0105c65:	c1 fb 10             	sar    $0x10,%ebx
c0105c68:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c0105c6b:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105c6e:	77 c0                	ja     c0105c30 <__mdiff+0x70>
c0105c70:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105c73:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105c76:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c79:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105c7c:	39 f1                	cmp    %esi,%ecx
c0105c7e:	76 3f                	jbe    c0105cbf <__mdiff+0xff>
c0105c80:	8b 3e                	mov    (%esi),%edi
c0105c82:	83 c6 04             	add    $0x4,%esi
c0105c85:	83 c0 04             	add    $0x4,%eax
c0105c88:	0f b7 d7             	movzwl %di,%edx
c0105c8b:	01 da                	add    %ebx,%edx
c0105c8d:	89 d3                	mov    %edx,%ebx
c0105c8f:	0f b7 d2             	movzwl %dx,%edx
c0105c92:	c1 fb 10             	sar    $0x10,%ebx
c0105c95:	c1 ef 10             	shr    $0x10,%edi
c0105c98:	01 df                	add    %ebx,%edi
c0105c9a:	89 fb                	mov    %edi,%ebx
c0105c9c:	c1 e7 10             	shl    $0x10,%edi
c0105c9f:	09 d7                	or     %edx,%edi
c0105ca1:	c1 fb 10             	sar    $0x10,%ebx
c0105ca4:	39 f1                	cmp    %esi,%ecx
c0105ca6:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105ca9:	77 d5                	ja     c0105c80 <__mdiff+0xc0>
c0105cab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105cae:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105cb1:	f7 d0                	not    %eax
c0105cb3:	01 c8                	add    %ecx,%eax
c0105cb5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105cb8:	c1 e8 02             	shr    $0x2,%eax
c0105cbb:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c0105cbf:	85 ff                	test   %edi,%edi
c0105cc1:	75 23                	jne    c0105ce6 <__mdiff+0x126>
c0105cc3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105cc6:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c0105ccd:	29 d0                	sub    %edx,%eax
c0105ccf:	89 ca                	mov    %ecx,%edx
c0105cd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105cd8:	83 ea 01             	sub    $0x1,%edx
c0105cdb:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105cdf:	85 c9                	test   %ecx,%ecx
c0105ce1:	74 f5                	je     c0105cd8 <__mdiff+0x118>
c0105ce3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105ce6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105ce9:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105cec:	89 48 10             	mov    %ecx,0x10(%eax)
c0105cef:	83 c4 2c             	add    $0x2c,%esp
c0105cf2:	5b                   	pop    %ebx
c0105cf3:	5e                   	pop    %esi
c0105cf4:	5f                   	pop    %edi
c0105cf5:	5d                   	pop    %ebp
c0105cf6:	c3                   	ret    
c0105cf7:	90                   	nop
c0105cf8:	89 f0                	mov    %esi,%eax
c0105cfa:	bf 01 00 00 00       	mov    $0x1,%edi
c0105cff:	89 de                	mov    %ebx,%esi
c0105d01:	89 c3                	mov    %eax,%ebx
c0105d03:	e9 e3 fe ff ff       	jmp    c0105beb <__mdiff+0x2b>
c0105d08:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d0b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105d12:	00 
c0105d13:	89 04 24             	mov    %eax,(%esp)
c0105d16:	e8 95 f6 ff ff       	call   c01053b0 <_Balloc>
c0105d1b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105d22:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0105d29:	83 c4 2c             	add    $0x2c,%esp
c0105d2c:	5b                   	pop    %ebx
c0105d2d:	5e                   	pop    %esi
c0105d2e:	5f                   	pop    %edi
c0105d2f:	5d                   	pop    %ebp
c0105d30:	c3                   	ret    
c0105d31:	eb 0d                	jmp    c0105d40 <__ulp>
c0105d33:	90                   	nop
c0105d34:	90                   	nop
c0105d35:	90                   	nop
c0105d36:	90                   	nop
c0105d37:	90                   	nop
c0105d38:	90                   	nop
c0105d39:	90                   	nop
c0105d3a:	90                   	nop
c0105d3b:	90                   	nop
c0105d3c:	90                   	nop
c0105d3d:	90                   	nop
c0105d3e:	90                   	nop
c0105d3f:	90                   	nop

c0105d40 <__ulp>:
c0105d40:	55                   	push   %ebp
c0105d41:	89 e5                	mov    %esp,%ebp
c0105d43:	83 ec 08             	sub    $0x8,%esp
c0105d46:	dd 45 08             	fldl   0x8(%ebp)
c0105d49:	dd 5d f8             	fstpl  -0x8(%ebp)
c0105d4c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c0105d4f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c0105d55:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c0105d5b:	85 c9                	test   %ecx,%ecx
c0105d5d:	7e 11                	jle    c0105d70 <__ulp+0x30>
c0105d5f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0105d62:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105d69:	dd 45 f8             	fldl   -0x8(%ebp)
c0105d6c:	c9                   	leave  
c0105d6d:	c3                   	ret    
c0105d6e:	66 90                	xchg   %ax,%ax
c0105d70:	f7 d9                	neg    %ecx
c0105d72:	c1 f9 14             	sar    $0x14,%ecx
c0105d75:	83 f9 13             	cmp    $0x13,%ecx
c0105d78:	7e 26                	jle    c0105da0 <__ulp+0x60>
c0105d7a:	83 f9 32             	cmp    $0x32,%ecx
c0105d7d:	b8 01 00 00 00       	mov    $0x1,%eax
c0105d82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105d89:	7f 0b                	jg     c0105d96 <__ulp+0x56>
c0105d8b:	ba 33 00 00 00       	mov    $0x33,%edx
c0105d90:	29 ca                	sub    %ecx,%edx
c0105d92:	89 d1                	mov    %edx,%ecx
c0105d94:	d3 e0                	shl    %cl,%eax
c0105d96:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d99:	dd 45 f8             	fldl   -0x8(%ebp)
c0105d9c:	c9                   	leave  
c0105d9d:	c3                   	ret    
c0105d9e:	66 90                	xchg   %ax,%ax
c0105da0:	b8 00 00 08 00       	mov    $0x80000,%eax
c0105da5:	d3 f8                	sar    %cl,%eax
c0105da7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105daa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105db1:	dd 45 f8             	fldl   -0x8(%ebp)
c0105db4:	c9                   	leave  
c0105db5:	c3                   	ret    
c0105db6:	8d 76 00             	lea    0x0(%esi),%esi
c0105db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105dc0 <__b2d>:
c0105dc0:	55                   	push   %ebp
c0105dc1:	89 e5                	mov    %esp,%ebp
c0105dc3:	57                   	push   %edi
c0105dc4:	56                   	push   %esi
c0105dc5:	53                   	push   %ebx
c0105dc6:	83 ec 18             	sub    $0x18,%esp
c0105dc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dcc:	8d 78 14             	lea    0x14(%eax),%edi
c0105dcf:	8b 40 10             	mov    0x10(%eax),%eax
c0105dd2:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0105dd5:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0105dd8:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105ddb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105dde:	89 34 24             	mov    %esi,(%esp)
c0105de1:	e8 6a f8 ff ff       	call   c0105650 <__hi0bits>
c0105de6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105de9:	ba 20 00 00 00       	mov    $0x20,%edx
c0105dee:	29 c2                	sub    %eax,%edx
c0105df0:	83 f8 0a             	cmp    $0xa,%eax
c0105df3:	89 11                	mov    %edx,(%ecx)
c0105df5:	7f 41                	jg     c0105e38 <__b2d+0x78>
c0105df7:	b9 0b 00 00 00       	mov    $0xb,%ecx
c0105dfc:	89 f2                	mov    %esi,%edx
c0105dfe:	29 c1                	sub    %eax,%ecx
c0105e00:	d3 ea                	shr    %cl,%edx
c0105e02:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0105e08:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0105e0b:	31 d2                	xor    %edx,%edx
c0105e0d:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105e10:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105e17:	73 05                	jae    c0105e1e <__b2d+0x5e>
c0105e19:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105e1c:	d3 ea                	shr    %cl,%edx
c0105e1e:	8d 48 15             	lea    0x15(%eax),%ecx
c0105e21:	d3 e6                	shl    %cl,%esi
c0105e23:	09 f2                	or     %esi,%edx
c0105e25:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105e28:	dd 45 e8             	fldl   -0x18(%ebp)
c0105e2b:	83 c4 18             	add    $0x18,%esp
c0105e2e:	5b                   	pop    %ebx
c0105e2f:	5e                   	pop    %esi
c0105e30:	5f                   	pop    %edi
c0105e31:	5d                   	pop    %ebp
c0105e32:	c3                   	ret    
c0105e33:	90                   	nop
c0105e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105e38:	31 d2                	xor    %edx,%edx
c0105e3a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105e3d:	73 09                	jae    c0105e48 <__b2d+0x88>
c0105e3f:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105e42:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0105e45:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105e48:	89 c3                	mov    %eax,%ebx
c0105e4a:	83 eb 0b             	sub    $0xb,%ebx
c0105e4d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0105e50:	74 4e                	je     c0105ea0 <__b2d+0xe0>
c0105e52:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105e56:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0105e5b:	29 c3                	sub    %eax,%ebx
c0105e5d:	89 d0                	mov    %edx,%eax
c0105e5f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105e66:	d3 e6                	shl    %cl,%esi
c0105e68:	89 d9                	mov    %ebx,%ecx
c0105e6a:	d3 e8                	shr    %cl,%eax
c0105e6c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105e6f:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105e75:	09 c6                	or     %eax,%esi
c0105e77:	31 c0                	xor    %eax,%eax
c0105e79:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105e7c:	39 f9                	cmp    %edi,%ecx
c0105e7e:	76 07                	jbe    c0105e87 <__b2d+0xc7>
c0105e80:	8b 41 fc             	mov    -0x4(%ecx),%eax
c0105e83:	89 d9                	mov    %ebx,%ecx
c0105e85:	d3 e8                	shr    %cl,%eax
c0105e87:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105e8b:	d3 e2                	shl    %cl,%edx
c0105e8d:	09 d0                	or     %edx,%eax
c0105e8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e92:	dd 45 e8             	fldl   -0x18(%ebp)
c0105e95:	83 c4 18             	add    $0x18,%esp
c0105e98:	5b                   	pop    %ebx
c0105e99:	5e                   	pop    %esi
c0105e9a:	5f                   	pop    %edi
c0105e9b:	5d                   	pop    %ebp
c0105e9c:	c3                   	ret    
c0105e9d:	8d 76 00             	lea    0x0(%esi),%esi
c0105ea0:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105ea6:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105ea9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105eac:	dd 45 e8             	fldl   -0x18(%ebp)
c0105eaf:	83 c4 18             	add    $0x18,%esp
c0105eb2:	5b                   	pop    %ebx
c0105eb3:	5e                   	pop    %esi
c0105eb4:	5f                   	pop    %edi
c0105eb5:	5d                   	pop    %ebp
c0105eb6:	c3                   	ret    
c0105eb7:	89 f6                	mov    %esi,%esi
c0105eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105ec0 <__d2b>:
c0105ec0:	55                   	push   %ebp
c0105ec1:	89 e5                	mov    %esp,%ebp
c0105ec3:	57                   	push   %edi
c0105ec4:	56                   	push   %esi
c0105ec5:	53                   	push   %ebx
c0105ec6:	83 ec 2c             	sub    $0x2c,%esp
c0105ec9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ecc:	dd 45 0c             	fldl   0xc(%ebp)
c0105ecf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105ed6:	00 
c0105ed7:	dd 5d d0             	fstpl  -0x30(%ebp)
c0105eda:	89 04 24             	mov    %eax,(%esp)
c0105edd:	e8 ce f4 ff ff       	call   c01053b0 <_Balloc>
c0105ee2:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0105ee5:	89 c6                	mov    %eax,%esi
c0105ee7:	89 d8                	mov    %ebx,%eax
c0105ee9:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c0105eef:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0105ef4:	c1 eb 14             	shr    $0x14,%ebx
c0105ef7:	85 db                	test   %ebx,%ebx
c0105ef9:	74 05                	je     c0105f00 <__d2b+0x40>
c0105efb:	0d 00 00 10 00       	or     $0x100000,%eax
c0105f00:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f03:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105f06:	85 c0                	test   %eax,%eax
c0105f08:	74 56                	je     c0105f60 <__d2b+0xa0>
c0105f0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f0d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105f10:	89 04 24             	mov    %eax,(%esp)
c0105f13:	e8 98 f7 ff ff       	call   c01056b0 <__lo0bits>
c0105f18:	85 c0                	test   %eax,%eax
c0105f1a:	0f 85 90 00 00 00    	jne    c0105fb0 <__d2b+0xf0>
c0105f20:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105f23:	89 56 14             	mov    %edx,0x14(%esi)
c0105f26:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f29:	83 fa 01             	cmp    $0x1,%edx
c0105f2c:	19 ff                	sbb    %edi,%edi
c0105f2e:	83 c7 02             	add    $0x2,%edi
c0105f31:	85 db                	test   %ebx,%ebx
c0105f33:	89 56 18             	mov    %edx,0x18(%esi)
c0105f36:	89 7e 10             	mov    %edi,0x10(%esi)
c0105f39:	74 49                	je     c0105f84 <__d2b+0xc4>
c0105f3b:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105f3e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0105f45:	89 11                	mov    %edx,(%ecx)
c0105f47:	ba 35 00 00 00       	mov    $0x35,%edx
c0105f4c:	29 c2                	sub    %eax,%edx
c0105f4e:	8b 45 18             	mov    0x18(%ebp),%eax
c0105f51:	89 10                	mov    %edx,(%eax)
c0105f53:	83 c4 2c             	add    $0x2c,%esp
c0105f56:	89 f0                	mov    %esi,%eax
c0105f58:	5b                   	pop    %ebx
c0105f59:	5e                   	pop    %esi
c0105f5a:	5f                   	pop    %edi
c0105f5b:	5d                   	pop    %ebp
c0105f5c:	c3                   	ret    
c0105f5d:	8d 76 00             	lea    0x0(%esi),%esi
c0105f60:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0105f63:	bf 01 00 00 00       	mov    $0x1,%edi
c0105f68:	89 04 24             	mov    %eax,(%esp)
c0105f6b:	e8 40 f7 ff ff       	call   c01056b0 <__lo0bits>
c0105f70:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f73:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c0105f7a:	89 56 14             	mov    %edx,0x14(%esi)
c0105f7d:	83 c0 20             	add    $0x20,%eax
c0105f80:	85 db                	test   %ebx,%ebx
c0105f82:	75 b7                	jne    c0105f3b <__d2b+0x7b>
c0105f84:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105f87:	2d 32 04 00 00       	sub    $0x432,%eax
c0105f8c:	89 01                	mov    %eax,(%ecx)
c0105f8e:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c0105f92:	c1 e7 05             	shl    $0x5,%edi
c0105f95:	89 04 24             	mov    %eax,(%esp)
c0105f98:	e8 b3 f6 ff ff       	call   c0105650 <__hi0bits>
c0105f9d:	29 c7                	sub    %eax,%edi
c0105f9f:	8b 45 18             	mov    0x18(%ebp),%eax
c0105fa2:	89 38                	mov    %edi,(%eax)
c0105fa4:	83 c4 2c             	add    $0x2c,%esp
c0105fa7:	89 f0                	mov    %esi,%eax
c0105fa9:	5b                   	pop    %ebx
c0105faa:	5e                   	pop    %esi
c0105fab:	5f                   	pop    %edi
c0105fac:	5d                   	pop    %ebp
c0105fad:	c3                   	ret    
c0105fae:	66 90                	xchg   %ax,%ax
c0105fb0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105fb3:	b9 20 00 00 00       	mov    $0x20,%ecx
c0105fb8:	29 c1                	sub    %eax,%ecx
c0105fba:	89 d7                	mov    %edx,%edi
c0105fbc:	d3 e7                	shl    %cl,%edi
c0105fbe:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105fc1:	09 f9                	or     %edi,%ecx
c0105fc3:	89 4e 14             	mov    %ecx,0x14(%esi)
c0105fc6:	89 c1                	mov    %eax,%ecx
c0105fc8:	d3 ea                	shr    %cl,%edx
c0105fca:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0105fcd:	e9 57 ff ff ff       	jmp    c0105f29 <__d2b+0x69>
c0105fd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105fe0 <__ratio>:
c0105fe0:	55                   	push   %ebp
c0105fe1:	89 e5                	mov    %esp,%ebp
c0105fe3:	56                   	push   %esi
c0105fe4:	53                   	push   %ebx
c0105fe5:	83 ec 30             	sub    $0x30,%esp
c0105fe8:	8b 75 08             	mov    0x8(%ebp),%esi
c0105feb:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0105fee:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105ff1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105ff5:	89 34 24             	mov    %esi,(%esp)
c0105ff8:	e8 c3 fd ff ff       	call   c0105dc0 <__b2d>
c0105ffd:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0106000:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106004:	89 1c 24             	mov    %ebx,(%esp)
c0106007:	dd 55 e0             	fstl   -0x20(%ebp)
c010600a:	dd 5d d8             	fstpl  -0x28(%ebp)
c010600d:	e8 ae fd ff ff       	call   c0105dc0 <__b2d>
c0106012:	8b 46 10             	mov    0x10(%esi),%eax
c0106015:	2b 43 10             	sub    0x10(%ebx),%eax
c0106018:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010601b:	2b 55 f4             	sub    -0xc(%ebp),%edx
c010601e:	c1 e0 05             	shl    $0x5,%eax
c0106021:	01 d0                	add    %edx,%eax
c0106023:	dd 55 d0             	fstl   -0x30(%ebp)
c0106026:	85 c0                	test   %eax,%eax
c0106028:	dd 45 d8             	fldl   -0x28(%ebp)
c010602b:	7e 1b                	jle    c0106048 <__ratio+0x68>
c010602d:	dd d8                	fstp   %st(0)
c010602f:	c1 e0 14             	shl    $0x14,%eax
c0106032:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0106035:	dd 45 e0             	fldl   -0x20(%ebp)
c0106038:	83 c4 30             	add    $0x30,%esp
c010603b:	5b                   	pop    %ebx
c010603c:	de f1                	fdivp  %st,%st(1)
c010603e:	5e                   	pop    %esi
c010603f:	5d                   	pop    %ebp
c0106040:	c3                   	ret    
c0106041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106048:	dd d9                	fstp   %st(1)
c010604a:	c1 e0 14             	shl    $0x14,%eax
c010604d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c0106050:	dd 45 d0             	fldl   -0x30(%ebp)
c0106053:	83 c4 30             	add    $0x30,%esp
c0106056:	5b                   	pop    %ebx
c0106057:	de f9                	fdivrp %st,%st(1)
c0106059:	5e                   	pop    %esi
c010605a:	5d                   	pop    %ebp
c010605b:	c3                   	ret    
c010605c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0106060 <_mprec_log10>:
c0106060:	55                   	push   %ebp
c0106061:	89 e5                	mov    %esp,%ebp
c0106063:	8b 45 08             	mov    0x8(%ebp),%eax
c0106066:	83 f8 17             	cmp    $0x17,%eax
c0106069:	7e 1d                	jle    c0106088 <_mprec_log10+0x28>
c010606b:	d9 e8                	fld1   
c010606d:	d9 05 78 86 10 c0    	flds   0xc0108678
c0106073:	90                   	nop
c0106074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106078:	83 e8 01             	sub    $0x1,%eax
c010607b:	dc c9                	fmul   %st,%st(1)
c010607d:	75 f9                	jne    c0106078 <_mprec_log10+0x18>
c010607f:	dd d8                	fstp   %st(0)
c0106081:	5d                   	pop    %ebp
c0106082:	c3                   	ret    
c0106083:	90                   	nop
c0106084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106088:	dd 04 c5 60 87 10 c0 	fldl   -0x3fef78a0(,%eax,8)
c010608f:	5d                   	pop    %ebp
c0106090:	c3                   	ret    
c0106091:	eb 0d                	jmp    c01060a0 <__copybits>
c0106093:	90                   	nop
c0106094:	90                   	nop
c0106095:	90                   	nop
c0106096:	90                   	nop
c0106097:	90                   	nop
c0106098:	90                   	nop
c0106099:	90                   	nop
c010609a:	90                   	nop
c010609b:	90                   	nop
c010609c:	90                   	nop
c010609d:	90                   	nop
c010609e:	90                   	nop
c010609f:	90                   	nop

c01060a0 <__copybits>:
c01060a0:	55                   	push   %ebp
c01060a1:	89 e5                	mov    %esp,%ebp
c01060a3:	57                   	push   %edi
c01060a4:	8b 7d 10             	mov    0x10(%ebp),%edi
c01060a7:	56                   	push   %esi
c01060a8:	8b 75 0c             	mov    0xc(%ebp),%esi
c01060ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01060ae:	53                   	push   %ebx
c01060af:	8b 4f 10             	mov    0x10(%edi),%ecx
c01060b2:	8d 56 ff             	lea    -0x1(%esi),%edx
c01060b5:	c1 fa 05             	sar    $0x5,%edx
c01060b8:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c01060bc:	8d 57 14             	lea    0x14(%edi),%edx
c01060bf:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c01060c2:	39 da                	cmp    %ebx,%edx
c01060c4:	73 34                	jae    c01060fa <__copybits+0x5a>
c01060c6:	89 c1                	mov    %eax,%ecx
c01060c8:	83 c2 04             	add    $0x4,%edx
c01060cb:	8b 42 fc             	mov    -0x4(%edx),%eax
c01060ce:	83 c1 04             	add    $0x4,%ecx
c01060d1:	39 d3                	cmp    %edx,%ebx
c01060d3:	89 41 fc             	mov    %eax,-0x4(%ecx)
c01060d6:	77 f0                	ja     c01060c8 <__copybits+0x28>
c01060d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01060db:	29 fb                	sub    %edi,%ebx
c01060dd:	8d 53 eb             	lea    -0x15(%ebx),%edx
c01060e0:	c1 ea 02             	shr    $0x2,%edx
c01060e3:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c01060e7:	39 c6                	cmp    %eax,%esi
c01060e9:	76 13                	jbe    c01060fe <__copybits+0x5e>
c01060eb:	90                   	nop
c01060ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060f0:	83 c0 04             	add    $0x4,%eax
c01060f3:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c01060fa:	39 c6                	cmp    %eax,%esi
c01060fc:	77 f2                	ja     c01060f0 <__copybits+0x50>
c01060fe:	5b                   	pop    %ebx
c01060ff:	5e                   	pop    %esi
c0106100:	5f                   	pop    %edi
c0106101:	5d                   	pop    %ebp
c0106102:	c3                   	ret    
c0106103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106110 <__any_on>:
c0106110:	55                   	push   %ebp
c0106111:	89 e5                	mov    %esp,%ebp
c0106113:	8b 45 08             	mov    0x8(%ebp),%eax
c0106116:	57                   	push   %edi
c0106117:	56                   	push   %esi
c0106118:	53                   	push   %ebx
c0106119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010611c:	8d 50 14             	lea    0x14(%eax),%edx
c010611f:	8b 40 10             	mov    0x10(%eax),%eax
c0106122:	c1 fb 05             	sar    $0x5,%ebx
c0106125:	39 d8                	cmp    %ebx,%eax
c0106127:	7d 2f                	jge    c0106158 <__any_on+0x48>
c0106129:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c010612c:	39 da                	cmp    %ebx,%edx
c010612e:	73 1d                	jae    c010614d <__any_on+0x3d>
c0106130:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0106133:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0106136:	85 db                	test   %ebx,%ebx
c0106138:	74 0f                	je     c0106149 <__any_on+0x39>
c010613a:	eb 44                	jmp    c0106180 <__any_on+0x70>
c010613c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106140:	83 e8 04             	sub    $0x4,%eax
c0106143:	8b 08                	mov    (%eax),%ecx
c0106145:	85 c9                	test   %ecx,%ecx
c0106147:	75 37                	jne    c0106180 <__any_on+0x70>
c0106149:	39 c2                	cmp    %eax,%edx
c010614b:	72 f3                	jb     c0106140 <__any_on+0x30>
c010614d:	31 c0                	xor    %eax,%eax
c010614f:	5b                   	pop    %ebx
c0106150:	5e                   	pop    %esi
c0106151:	5f                   	pop    %edi
c0106152:	5d                   	pop    %ebp
c0106153:	c3                   	ret    
c0106154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106158:	7e 1e                	jle    c0106178 <__any_on+0x68>
c010615a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c010615d:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0106160:	83 e1 1f             	and    $0x1f,%ecx
c0106163:	74 c7                	je     c010612c <__any_on+0x1c>
c0106165:	8b 3b                	mov    (%ebx),%edi
c0106167:	b8 01 00 00 00       	mov    $0x1,%eax
c010616c:	89 fe                	mov    %edi,%esi
c010616e:	d3 ee                	shr    %cl,%esi
c0106170:	d3 e6                	shl    %cl,%esi
c0106172:	39 fe                	cmp    %edi,%esi
c0106174:	75 d9                	jne    c010614f <__any_on+0x3f>
c0106176:	eb b4                	jmp    c010612c <__any_on+0x1c>
c0106178:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c010617b:	eb af                	jmp    c010612c <__any_on+0x1c>
c010617d:	8d 76 00             	lea    0x0(%esi),%esi
c0106180:	5b                   	pop    %ebx
c0106181:	b8 01 00 00 00       	mov    $0x1,%eax
c0106186:	5e                   	pop    %esi
c0106187:	5f                   	pop    %edi
c0106188:	5d                   	pop    %ebp
c0106189:	c3                   	ret    
c010618a:	66 90                	xchg   %ax,%ax
c010618c:	66 90                	xchg   %ax,%ax
c010618e:	66 90                	xchg   %ax,%ax

c0106190 <_sbrk_r>:
c0106190:	55                   	push   %ebp
c0106191:	89 e5                	mov    %esp,%ebp
c0106193:	83 ec 18             	sub    $0x18,%esp
c0106196:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106199:	c7 05 94 25 16 c0 00 	movl   $0x0,0xc0162594
c01061a0:	00 00 00 
c01061a3:	89 04 24             	mov    %eax,(%esp)
c01061a6:	e8 b5 ae ff ff       	call   c0101060 <sbrk>
c01061ab:	83 f8 ff             	cmp    $0xffffffff,%eax
c01061ae:	74 08                	je     c01061b8 <_sbrk_r+0x28>
c01061b0:	c9                   	leave  
c01061b1:	c3                   	ret    
c01061b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01061b8:	8b 15 94 25 16 c0    	mov    0xc0162594,%edx
c01061be:	85 d2                	test   %edx,%edx
c01061c0:	74 ee                	je     c01061b0 <_sbrk_r+0x20>
c01061c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01061c5:	89 11                	mov    %edx,(%ecx)
c01061c7:	c9                   	leave  
c01061c8:	c3                   	ret    
c01061c9:	66 90                	xchg   %ax,%ax
c01061cb:	66 90                	xchg   %ax,%ax
c01061cd:	66 90                	xchg   %ax,%ax
c01061cf:	90                   	nop

c01061d0 <__fpclassifyd>:
c01061d0:	55                   	push   %ebp
c01061d1:	b8 02 00 00 00       	mov    $0x2,%eax
c01061d6:	89 e5                	mov    %esp,%ebp
c01061d8:	53                   	push   %ebx
c01061d9:	83 ec 0c             	sub    $0xc,%esp
c01061dc:	dd 45 08             	fldl   0x8(%ebp)
c01061df:	dd 5d f0             	fstpl  -0x10(%ebp)
c01061e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01061e5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c01061e8:	89 d3                	mov    %edx,%ebx
c01061ea:	09 cb                	or     %ecx,%ebx
c01061ec:	75 0a                	jne    c01061f8 <__fpclassifyd+0x28>
c01061ee:	83 c4 0c             	add    $0xc,%esp
c01061f1:	5b                   	pop    %ebx
c01061f2:	5d                   	pop    %ebp
c01061f3:	c3                   	ret    
c01061f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01061f8:	85 d2                	test   %edx,%edx
c01061fa:	0f 94 c2             	sete   %dl
c01061fd:	75 08                	jne    c0106207 <__fpclassifyd+0x37>
c01061ff:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c0106205:	74 e7                	je     c01061ee <__fpclassifyd+0x1e>
c0106207:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c010620d:	b8 04 00 00 00       	mov    $0x4,%eax
c0106212:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c0106218:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c010621e:	76 ce                	jbe    c01061ee <__fpclassifyd+0x1e>
c0106220:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c0106226:	b0 03                	mov    $0x3,%al
c0106228:	76 c4                	jbe    c01061ee <__fpclassifyd+0x1e>
c010622a:	31 c0                	xor    %eax,%eax
c010622c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c0106232:	0f 94 c0             	sete   %al
c0106235:	21 d0                	and    %edx,%eax
c0106237:	eb b5                	jmp    c01061ee <__fpclassifyd+0x1e>
c0106239:	66 90                	xchg   %ax,%ax
c010623b:	66 90                	xchg   %ax,%ax
c010623d:	66 90                	xchg   %ax,%ax
c010623f:	90                   	nop

c0106240 <strlen>:
c0106240:	55                   	push   %ebp
c0106241:	89 e5                	mov    %esp,%ebp
c0106243:	57                   	push   %edi
c0106244:	8b 55 08             	mov    0x8(%ebp),%edx
c0106247:	89 d7                	mov    %edx,%edi
c0106249:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010624f:	74 25                	je     c0106276 <L5>
c0106251:	8a 0f                	mov    (%edi),%cl
c0106253:	47                   	inc    %edi
c0106254:	84 c9                	test   %cl,%cl
c0106256:	74 56                	je     c01062ae <L15>
c0106258:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010625e:	74 16                	je     c0106276 <L5>
c0106260:	8a 0f                	mov    (%edi),%cl
c0106262:	47                   	inc    %edi
c0106263:	84 c9                	test   %cl,%cl
c0106265:	74 47                	je     c01062ae <L15>
c0106267:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010626d:	74 07                	je     c0106276 <L5>
c010626f:	8a 0f                	mov    (%edi),%cl
c0106271:	47                   	inc    %edi
c0106272:	84 c9                	test   %cl,%cl
c0106274:	74 38                	je     c01062ae <L15>

c0106276 <L5>:
c0106276:	83 ef 04             	sub    $0x4,%edi
c0106279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0106280 <L10>:
c0106280:	83 c7 04             	add    $0x4,%edi
c0106283:	8b 0f                	mov    (%edi),%ecx
c0106285:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c010628b:	f7 d1                	not    %ecx
c010628d:	21 c8                	and    %ecx,%eax
c010628f:	a9 80 80 80 80       	test   $0x80808080,%eax
c0106294:	74 ea                	je     c0106280 <L10>
c0106296:	f7 d1                	not    %ecx
c0106298:	47                   	inc    %edi
c0106299:	84 c9                	test   %cl,%cl
c010629b:	74 11                	je     c01062ae <L15>
c010629d:	47                   	inc    %edi
c010629e:	c1 e9 08             	shr    $0x8,%ecx
c01062a1:	84 c9                	test   %cl,%cl
c01062a3:	74 09                	je     c01062ae <L15>
c01062a5:	47                   	inc    %edi
c01062a6:	c1 e9 08             	shr    $0x8,%ecx
c01062a9:	84 c9                	test   %cl,%cl
c01062ab:	74 01                	je     c01062ae <L15>
c01062ad:	47                   	inc    %edi

c01062ae <L15>:
c01062ae:	29 d7                	sub    %edx,%edi
c01062b0:	8d 47 ff             	lea    -0x1(%edi),%eax
c01062b3:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01062b6:	5f                   	pop    %edi
c01062b7:	c9                   	leave  
c01062b8:	c3                   	ret    
c01062b9:	66 90                	xchg   %ax,%ax
c01062bb:	66 90                	xchg   %ax,%ax
c01062bd:	66 90                	xchg   %ax,%ax
c01062bf:	90                   	nop

c01062c0 <__ssprint_r>:
c01062c0:	55                   	push   %ebp
c01062c1:	89 e5                	mov    %esp,%ebp
c01062c3:	57                   	push   %edi
c01062c4:	56                   	push   %esi
c01062c5:	53                   	push   %ebx
c01062c6:	83 ec 2c             	sub    $0x2c,%esp
c01062c9:	8b 45 10             	mov    0x10(%ebp),%eax
c01062cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01062cf:	8b 00                	mov    (%eax),%eax
c01062d1:	89 c7                	mov    %eax,%edi
c01062d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01062d6:	8b 40 08             	mov    0x8(%eax),%eax
c01062d9:	85 c0                	test   %eax,%eax
c01062db:	0f 84 af 01 00 00    	je     c0106490 <__ssprint_r+0x1d0>
c01062e1:	31 c9                	xor    %ecx,%ecx
c01062e3:	31 d2                	xor    %edx,%edx
c01062e5:	8b 03                	mov    (%ebx),%eax
c01062e7:	89 ce                	mov    %ecx,%esi
c01062e9:	85 f6                	test   %esi,%esi
c01062eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01062ee:	0f 84 ec 00 00 00    	je     c01063e0 <__ssprint_r+0x120>
c01062f4:	8b 53 08             	mov    0x8(%ebx),%edx
c01062f7:	39 d6                	cmp    %edx,%esi
c01062f9:	0f 82 fc 00 00 00    	jb     c01063fb <__ssprint_r+0x13b>
c01062ff:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c0106303:	66 f7 c1 80 04       	test   $0x480,%cx
c0106308:	0f 84 fa 00 00 00    	je     c0106408 <__ssprint_r+0x148>
c010630e:	8b 53 10             	mov    0x10(%ebx),%edx
c0106311:	29 d0                	sub    %edx,%eax
c0106313:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106316:	8b 43 14             	mov    0x14(%ebx),%eax
c0106319:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010631c:	8d 04 40             	lea    (%eax,%eax,2),%eax
c010631f:	89 c2                	mov    %eax,%edx
c0106321:	c1 ea 1f             	shr    $0x1f,%edx
c0106324:	01 d0                	add    %edx,%eax
c0106326:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106329:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010632c:	d1 7d e0             	sarl   -0x20(%ebp)
c010632f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c0106333:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0106336:	0f 83 34 01 00 00    	jae    c0106470 <__ssprint_r+0x1b0>
c010633c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010633f:	80 e5 04             	and    $0x4,%ch
c0106342:	0f 84 c8 00 00 00    	je     c0106410 <__ssprint_r+0x150>
c0106348:	89 44 24 04          	mov    %eax,0x4(%esp)
c010634c:	8b 45 08             	mov    0x8(%ebp),%eax
c010634f:	89 04 24             	mov    %eax,(%esp)
c0106352:	e8 59 e8 ff ff       	call   c0104bb0 <_malloc_r>
c0106357:	85 c0                	test   %eax,%eax
c0106359:	89 c2                	mov    %eax,%edx
c010635b:	0f 84 e1 00 00 00    	je     c0106442 <__ssprint_r+0x182>
c0106361:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106364:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0106367:	89 44 24 08          	mov    %eax,0x8(%esp)
c010636b:	8b 43 10             	mov    0x10(%ebx),%eax
c010636e:	89 14 24             	mov    %edx,(%esp)
c0106371:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106375:	e8 16 b2 ff ff       	call   c0101590 <memcpy>
c010637a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c010637e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106381:	66 25 7f fb          	and    $0xfb7f,%ax
c0106385:	0c 80                	or     $0x80,%al
c0106387:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c010638b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010638e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106391:	89 53 10             	mov    %edx,0x10(%ebx)
c0106394:	89 4b 14             	mov    %ecx,0x14(%ebx)
c0106397:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c010639a:	01 d0                	add    %edx,%eax
c010639c:	89 03                	mov    %eax,(%ebx)
c010639e:	89 f2                	mov    %esi,%edx
c01063a0:	89 4b 08             	mov    %ecx,0x8(%ebx)
c01063a3:	89 f1                	mov    %esi,%ecx
c01063a5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01063a9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01063ac:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01063af:	89 04 24             	mov    %eax,(%esp)
c01063b2:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01063b5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01063b9:	e8 22 13 00 00       	call   c01076e0 <memmove>
c01063be:	8b 03                	mov    (%ebx),%eax
c01063c0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01063c3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01063c6:	29 53 08             	sub    %edx,0x8(%ebx)
c01063c9:	01 c8                	add    %ecx,%eax
c01063cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01063ce:	89 03                	mov    %eax,(%ebx)
c01063d0:	8b 51 08             	mov    0x8(%ecx),%edx
c01063d3:	29 f2                	sub    %esi,%edx
c01063d5:	85 d2                	test   %edx,%edx
c01063d7:	89 51 08             	mov    %edx,0x8(%ecx)
c01063da:	0f 84 98 00 00 00    	je     c0106478 <__ssprint_r+0x1b8>
c01063e0:	8b 77 04             	mov    0x4(%edi),%esi
c01063e3:	83 c7 08             	add    $0x8,%edi
c01063e6:	8b 4f f8             	mov    -0x8(%edi),%ecx
c01063e9:	85 f6                	test   %esi,%esi
c01063eb:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01063ee:	74 f0                	je     c01063e0 <__ssprint_r+0x120>
c01063f0:	8b 53 08             	mov    0x8(%ebx),%edx
c01063f3:	39 d6                	cmp    %edx,%esi
c01063f5:	0f 83 04 ff ff ff    	jae    c01062ff <__ssprint_r+0x3f>
c01063fb:	89 f2                	mov    %esi,%edx
c01063fd:	89 f1                	mov    %esi,%ecx
c01063ff:	eb a4                	jmp    c01063a5 <__ssprint_r+0xe5>
c0106401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106408:	89 d1                	mov    %edx,%ecx
c010640a:	eb 99                	jmp    c01063a5 <__ssprint_r+0xe5>
c010640c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106410:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106414:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106417:	89 44 24 04          	mov    %eax,0x4(%esp)
c010641b:	8b 45 08             	mov    0x8(%ebp),%eax
c010641e:	89 04 24             	mov    %eax,(%esp)
c0106421:	e8 4a 13 00 00       	call   c0107770 <_realloc_r>
c0106426:	85 c0                	test   %eax,%eax
c0106428:	89 c2                	mov    %eax,%edx
c010642a:	0f 85 5b ff ff ff    	jne    c010638b <__ssprint_r+0xcb>
c0106430:	8b 43 10             	mov    0x10(%ebx),%eax
c0106433:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106437:	8b 45 08             	mov    0x8(%ebp),%eax
c010643a:	89 04 24             	mov    %eax,(%esp)
c010643d:	e8 3e 10 00 00       	call   c0107480 <_free_r>
c0106442:	8b 45 08             	mov    0x8(%ebp),%eax
c0106445:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010644b:	8b 45 10             	mov    0x10(%ebp),%eax
c010644e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106453:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010645a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106461:	83 c4 2c             	add    $0x2c,%esp
c0106464:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106469:	5b                   	pop    %ebx
c010646a:	5e                   	pop    %esi
c010646b:	5f                   	pop    %edi
c010646c:	5d                   	pop    %ebp
c010646d:	c3                   	ret    
c010646e:	66 90                	xchg   %ax,%ax
c0106470:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106473:	e9 c7 fe ff ff       	jmp    c010633f <__ssprint_r+0x7f>
c0106478:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c010647f:	83 c4 2c             	add    $0x2c,%esp
c0106482:	31 c0                	xor    %eax,%eax
c0106484:	5b                   	pop    %ebx
c0106485:	5e                   	pop    %esi
c0106486:	5f                   	pop    %edi
c0106487:	5d                   	pop    %ebp
c0106488:	c3                   	ret    
c0106489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106490:	8b 45 10             	mov    0x10(%ebp),%eax
c0106493:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010649a:	83 c4 2c             	add    $0x2c,%esp
c010649d:	31 c0                	xor    %eax,%eax
c010649f:	5b                   	pop    %ebx
c01064a0:	5e                   	pop    %esi
c01064a1:	5f                   	pop    %edi
c01064a2:	5d                   	pop    %ebp
c01064a3:	c3                   	ret    
c01064a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01064aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c01064b0 <_svfiprintf_r>:
c01064b0:	55                   	push   %ebp
c01064b1:	89 e5                	mov    %esp,%ebp
c01064b3:	57                   	push   %edi
c01064b4:	56                   	push   %esi
c01064b5:	53                   	push   %ebx
c01064b6:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c01064bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01064bf:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c01064c3:	74 0b                	je     c01064d0 <_svfiprintf_r+0x20>
c01064c5:	8b 50 10             	mov    0x10(%eax),%edx
c01064c8:	85 d2                	test   %edx,%edx
c01064ca:	0f 84 1c 0d 00 00    	je     c01071ec <_svfiprintf_r+0xd3c>
c01064d0:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01064d3:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01064d6:	89 c6                	mov    %eax,%esi
c01064d8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01064de:	29 d8                	sub    %ebx,%eax
c01064e0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c01064e7:	00 00 00 
c01064ea:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01064f1:	00 00 00 
c01064f4:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01064fb:	00 00 00 
c01064fe:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c0106505:	00 00 00 
c0106508:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c010650e:	8b 45 10             	mov    0x10(%ebp),%eax
c0106511:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0106514:	0f b6 00             	movzbl (%eax),%eax
c0106517:	84 c0                	test   %al,%al
c0106519:	74 58                	je     c0106573 <_svfiprintf_r+0xc3>
c010651b:	3c 25                	cmp    $0x25,%al
c010651d:	75 13                	jne    c0106532 <_svfiprintf_r+0x82>
c010651f:	eb 52                	jmp    c0106573 <_svfiprintf_r+0xc3>
c0106521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106528:	84 c0                	test   %al,%al
c010652a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106530:	74 0a                	je     c010653c <_svfiprintf_r+0x8c>
c0106532:	83 c3 01             	add    $0x1,%ebx
c0106535:	0f b6 03             	movzbl (%ebx),%eax
c0106538:	3c 25                	cmp    $0x25,%al
c010653a:	75 ec                	jne    c0106528 <_svfiprintf_r+0x78>
c010653c:	89 df                	mov    %ebx,%edi
c010653e:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106541:	74 30                	je     c0106573 <_svfiprintf_r+0xc3>
c0106543:	8b 45 10             	mov    0x10(%ebp),%eax
c0106546:	83 c6 08             	add    $0x8,%esi
c0106549:	89 7e fc             	mov    %edi,-0x4(%esi)
c010654c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106552:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106555:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010655b:	83 c0 01             	add    $0x1,%eax
c010655e:	83 f8 07             	cmp    $0x7,%eax
c0106561:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106567:	0f 8f eb 0a 00 00    	jg     c0107058 <_svfiprintf_r+0xba8>
c010656d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106573:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106576:	0f 84 11 09 00 00    	je     c0106e8d <_svfiprintf_r+0x9dd>
c010657c:	8d 43 01             	lea    0x1(%ebx),%eax
c010657f:	31 ff                	xor    %edi,%edi
c0106581:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106588:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c010658f:	ff ff ff 
c0106592:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0106599:	00 00 00 
c010659c:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c01065a3:	00 00 00 
c01065a6:	8d 50 01             	lea    0x1(%eax),%edx
c01065a9:	0f be 00             	movsbl (%eax),%eax
c01065ac:	8d 48 e0             	lea    -0x20(%eax),%ecx
c01065af:	83 f9 58             	cmp    $0x58,%ecx
c01065b2:	0f 87 63 03 00 00    	ja     c010691b <_svfiprintf_r+0x46b>
c01065b8:	ff 24 8d 28 88 10 c0 	jmp    *-0x3fef77d8(,%ecx,4)
c01065bf:	90                   	nop
c01065c0:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c01065c7:	89 d0                	mov    %edx,%eax
c01065c9:	eb db                	jmp    c01065a6 <_svfiprintf_r+0xf6>
c01065cb:	8b 45 14             	mov    0x14(%ebp),%eax
c01065ce:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01065d1:	8b 00                	mov    (%eax),%eax
c01065d3:	83 c3 04             	add    $0x4,%ebx
c01065d6:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01065d9:	85 c0                	test   %eax,%eax
c01065db:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c01065e1:	79 e4                	jns    c01065c7 <_svfiprintf_r+0x117>
c01065e3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c01065e9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c01065f0:	89 d0                	mov    %edx,%eax
c01065f2:	eb b2                	jmp    c01065a6 <_svfiprintf_r+0xf6>
c01065f4:	bf 2b 00 00 00       	mov    $0x2b,%edi
c01065f9:	89 d0                	mov    %edx,%eax
c01065fb:	eb a9                	jmp    c01065a6 <_svfiprintf_r+0xf6>
c01065fd:	8b 45 14             	mov    0x14(%ebp),%eax
c0106600:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106607:	89 55 10             	mov    %edx,0x10(%ebp)
c010660a:	ba 02 00 00 00       	mov    $0x2,%edx
c010660f:	8b 08                	mov    (%eax),%ecx
c0106611:	83 c0 04             	add    $0x4,%eax
c0106614:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010661b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c0106622:	89 45 14             	mov    %eax,0x14(%ebp)
c0106625:	c7 85 44 ff ff ff bf 	movl   $0xc01084bf,-0xbc(%ebp)
c010662c:	84 10 c0 
c010662f:	90                   	nop
c0106630:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106637:	31 ff                	xor    %edi,%edi
c0106639:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c010663f:	89 d8                	mov    %ebx,%eax
c0106641:	24 7f                	and    $0x7f,%al
c0106643:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c010664a:	0f 48 c3             	cmovs  %ebx,%eax
c010664d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106653:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106659:	85 c0                	test   %eax,%eax
c010665b:	75 08                	jne    c0106665 <_svfiprintf_r+0x1b5>
c010665d:	85 c9                	test   %ecx,%ecx
c010665f:	0f 84 03 08 00 00    	je     c0106e68 <_svfiprintf_r+0x9b8>
c0106665:	80 fa 01             	cmp    $0x1,%dl
c0106668:	0f 84 8a 0a 00 00    	je     c01070f8 <_svfiprintf_r+0xc48>
c010666e:	80 fa 02             	cmp    $0x2,%dl
c0106671:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106674:	0f 85 86 01 00 00    	jne    c0106800 <_svfiprintf_r+0x350>
c010667a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106680:	89 c8                	mov    %ecx,%eax
c0106682:	83 eb 01             	sub    $0x1,%ebx
c0106685:	83 e0 0f             	and    $0xf,%eax
c0106688:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c010668c:	c1 e9 04             	shr    $0x4,%ecx
c010668f:	85 c9                	test   %ecx,%ecx
c0106691:	88 03                	mov    %al,(%ebx)
c0106693:	75 eb                	jne    c0106680 <_svfiprintf_r+0x1d0>
c0106695:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106698:	29 d8                	sub    %ebx,%eax
c010669a:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01066a0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01066a6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c01066ac:	39 c1                	cmp    %eax,%ecx
c01066ae:	0f 4d c1             	cmovge %ecx,%eax
c01066b1:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01066b7:	89 f8                	mov    %edi,%eax
c01066b9:	3c 01                	cmp    $0x1,%al
c01066bb:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c01066c2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01066c8:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c01066ce:	89 d0                	mov    %edx,%eax
c01066d0:	89 cf                	mov    %ecx,%edi
c01066d2:	83 c0 02             	add    $0x2,%eax
c01066d5:	83 e7 02             	and    $0x2,%edi
c01066d8:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c01066de:	89 cf                	mov    %ecx,%edi
c01066e0:	0f 44 c2             	cmove  %edx,%eax
c01066e3:	81 e7 84 00 00 00    	and    $0x84,%edi
c01066e9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01066ef:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c01066f5:	0f 85 cd 04 00 00    	jne    c0106bc8 <_svfiprintf_r+0x718>
c01066fb:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106701:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106707:	85 ff                	test   %edi,%edi
c0106709:	0f 8e b9 04 00 00    	jle    c0106bc8 <_svfiprintf_r+0x718>
c010670f:	83 ff 10             	cmp    $0x10,%edi
c0106712:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106718:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010671e:	7e 7c                	jle    c010679c <_svfiprintf_r+0x2ec>
c0106720:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c0106726:	89 f1                	mov    %esi,%ecx
c0106728:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010672b:	8b 75 0c             	mov    0xc(%ebp),%esi
c010672e:	eb 08                	jmp    c0106738 <_svfiprintf_r+0x288>
c0106730:	83 ef 10             	sub    $0x10,%edi
c0106733:	83 ff 10             	cmp    $0x10,%edi
c0106736:	7e 5c                	jle    c0106794 <_svfiprintf_r+0x2e4>
c0106738:	83 c0 01             	add    $0x1,%eax
c010673b:	83 c2 10             	add    $0x10,%edx
c010673e:	c7 01 9c 89 10 c0    	movl   $0xc010899c,(%ecx)
c0106744:	83 c1 08             	add    $0x8,%ecx
c0106747:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010674e:	83 f8 07             	cmp    $0x7,%eax
c0106751:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106757:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010675d:	7e d1                	jle    c0106730 <_svfiprintf_r+0x280>
c010675f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106765:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106769:	89 74 24 04          	mov    %esi,0x4(%esp)
c010676d:	89 1c 24             	mov    %ebx,(%esp)
c0106770:	e8 4b fb ff ff       	call   c01062c0 <__ssprint_r>
c0106775:	85 c0                	test   %eax,%eax
c0106777:	0f 85 3b 07 00 00    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c010677d:	83 ef 10             	sub    $0x10,%edi
c0106780:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106786:	83 ff 10             	cmp    $0x10,%edi
c0106789:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010678f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106792:	7f a4                	jg     c0106738 <_svfiprintf_r+0x288>
c0106794:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c010679a:	89 ce                	mov    %ecx,%esi
c010679c:	83 c0 01             	add    $0x1,%eax
c010679f:	01 fa                	add    %edi,%edx
c01067a1:	c7 06 9c 89 10 c0    	movl   $0xc010899c,(%esi)
c01067a7:	83 c6 08             	add    $0x8,%esi
c01067aa:	89 7e fc             	mov    %edi,-0x4(%esi)
c01067ad:	83 f8 07             	cmp    $0x7,%eax
c01067b0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01067b6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01067bc:	0f 8e 12 04 00 00    	jle    c0106bd4 <_svfiprintf_r+0x724>
c01067c2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01067c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01067cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01067cf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01067d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01067d6:	89 04 24             	mov    %eax,(%esp)
c01067d9:	e8 e2 fa ff ff       	call   c01062c0 <__ssprint_r>
c01067de:	85 c0                	test   %eax,%eax
c01067e0:	0f 85 d2 06 00 00    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c01067e6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01067ec:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01067ef:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01067f5:	e9 da 03 00 00       	jmp    c0106bd4 <_svfiprintf_r+0x724>
c01067fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106800:	89 c8                	mov    %ecx,%eax
c0106802:	83 eb 01             	sub    $0x1,%ebx
c0106805:	83 e0 07             	and    $0x7,%eax
c0106808:	c1 e9 03             	shr    $0x3,%ecx
c010680b:	83 c0 30             	add    $0x30,%eax
c010680e:	85 c9                	test   %ecx,%ecx
c0106810:	88 03                	mov    %al,(%ebx)
c0106812:	75 ec                	jne    c0106800 <_svfiprintf_r+0x350>
c0106814:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c010681b:	89 da                	mov    %ebx,%edx
c010681d:	0f 84 72 fe ff ff    	je     c0106695 <_svfiprintf_r+0x1e5>
c0106823:	3c 30                	cmp    $0x30,%al
c0106825:	0f 84 6a fe ff ff    	je     c0106695 <_svfiprintf_r+0x1e5>
c010682b:	83 eb 01             	sub    $0x1,%ebx
c010682e:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106831:	29 d8                	sub    %ebx,%eax
c0106833:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0106837:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010683d:	e9 5e fe ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c0106842:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106849:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106850:	89 55 10             	mov    %edx,0x10(%ebp)
c0106853:	8b 45 14             	mov    0x14(%ebp),%eax
c0106856:	0f 85 48 01 00 00    	jne    c01069a4 <_svfiprintf_r+0x4f4>
c010685c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106863:	0f 84 3b 01 00 00    	je     c01069a4 <_svfiprintf_r+0x4f4>
c0106869:	0f b7 08             	movzwl (%eax),%ecx
c010686c:	83 c0 04             	add    $0x4,%eax
c010686f:	31 d2                	xor    %edx,%edx
c0106871:	89 45 14             	mov    %eax,0x14(%ebp)
c0106874:	e9 b7 fd ff ff       	jmp    c0106630 <_svfiprintf_r+0x180>
c0106879:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106880:	89 f8                	mov    %edi,%eax
c0106882:	89 55 10             	mov    %edx,0x10(%ebp)
c0106885:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c010688b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106892:	8b 45 14             	mov    0x14(%ebp),%eax
c0106895:	75 0d                	jne    c01068a4 <_svfiprintf_r+0x3f4>
c0106897:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c010689e:	0f 85 f2 08 00 00    	jne    c0107196 <_svfiprintf_r+0xce6>
c01068a4:	8b 08                	mov    (%eax),%ecx
c01068a6:	83 c0 04             	add    $0x4,%eax
c01068a9:	89 45 14             	mov    %eax,0x14(%ebp)
c01068ac:	85 c9                	test   %ecx,%ecx
c01068ae:	0f 88 f3 08 00 00    	js     c01071a7 <_svfiprintf_r+0xcf7>
c01068b4:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01068bb:	ba 01 00 00 00       	mov    $0x1,%edx
c01068c0:	e9 74 fd ff ff       	jmp    c0106639 <_svfiprintf_r+0x189>
c01068c5:	0f be 02             	movsbl (%edx),%eax
c01068c8:	8d 5a 01             	lea    0x1(%edx),%ebx
c01068cb:	83 f8 2a             	cmp    $0x2a,%eax
c01068ce:	0f 84 af 09 00 00    	je     c0107283 <_svfiprintf_r+0xdd3>
c01068d4:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01068d7:	31 d2                	xor    %edx,%edx
c01068d9:	83 f9 09             	cmp    $0x9,%ecx
c01068dc:	0f 87 90 09 00 00    	ja     c0107272 <_svfiprintf_r+0xdc2>
c01068e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01068e8:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01068eb:	83 c3 01             	add    $0x1,%ebx
c01068ee:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c01068f1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c01068f5:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01068f8:	83 f9 09             	cmp    $0x9,%ecx
c01068fb:	76 eb                	jbe    c01068e8 <_svfiprintf_r+0x438>
c01068fd:	85 d2                	test   %edx,%edx
c01068ff:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0106904:	0f 48 d1             	cmovs  %ecx,%edx
c0106907:	8d 48 e0             	lea    -0x20(%eax),%ecx
c010690a:	83 f9 58             	cmp    $0x58,%ecx
c010690d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c0106913:	89 da                	mov    %ebx,%edx
c0106915:	0f 86 9d fc ff ff    	jbe    c01065b8 <_svfiprintf_r+0x108>
c010691b:	89 fb                	mov    %edi,%ebx
c010691d:	85 c0                	test   %eax,%eax
c010691f:	89 55 10             	mov    %edx,0x10(%ebp)
c0106922:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106928:	0f 84 5f 05 00 00    	je     c0106e8d <_svfiprintf_r+0x9dd>
c010692e:	88 45 80             	mov    %al,-0x80(%ebp)
c0106931:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106934:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010693b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106942:	00 00 00 
c0106945:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010694c:	00 00 00 
c010694f:	e9 5a 01 00 00       	jmp    c0106aae <_svfiprintf_r+0x5fe>
c0106954:	31 db                	xor    %ebx,%ebx
c0106956:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106960:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106963:	83 c2 01             	add    $0x1,%edx
c0106966:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106969:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c010696d:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106970:	83 f9 09             	cmp    $0x9,%ecx
c0106973:	76 eb                	jbe    c0106960 <_svfiprintf_r+0x4b0>
c0106975:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c010697b:	e9 2c fc ff ff       	jmp    c01065ac <_svfiprintf_r+0xfc>
c0106980:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106987:	00 00 00 
c010698a:	89 d0                	mov    %edx,%eax
c010698c:	e9 15 fc ff ff       	jmp    c01065a6 <_svfiprintf_r+0xf6>
c0106991:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106998:	89 55 10             	mov    %edx,0x10(%ebp)
c010699b:	8b 45 14             	mov    0x14(%ebp),%eax
c010699e:	0f 84 b8 fe ff ff    	je     c010685c <_svfiprintf_r+0x3ac>
c01069a4:	8b 08                	mov    (%eax),%ecx
c01069a6:	83 c0 04             	add    $0x4,%eax
c01069a9:	31 d2                	xor    %edx,%edx
c01069ab:	89 45 14             	mov    %eax,0x14(%ebp)
c01069ae:	e9 7d fc ff ff       	jmp    c0106630 <_svfiprintf_r+0x180>
c01069b3:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069ba:	89 f8                	mov    %edi,%eax
c01069bc:	89 55 10             	mov    %edx,0x10(%ebp)
c01069bf:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c01069c5:	0f 85 a2 07 00 00    	jne    c010716d <_svfiprintf_r+0xcbd>
c01069cb:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01069d2:	0f 84 95 07 00 00    	je     c010716d <_svfiprintf_r+0xcbd>
c01069d8:	8b 45 14             	mov    0x14(%ebp),%eax
c01069db:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c01069e2:	8b 00                	mov    (%eax),%eax
c01069e4:	66 89 18             	mov    %bx,(%eax)
c01069e7:	8b 45 14             	mov    0x14(%ebp),%eax
c01069ea:	83 c0 04             	add    $0x4,%eax
c01069ed:	89 45 14             	mov    %eax,0x14(%ebp)
c01069f0:	e9 19 fb ff ff       	jmp    c010650e <_svfiprintf_r+0x5e>
c01069f5:	89 fb                	mov    %edi,%ebx
c01069f7:	89 55 10             	mov    %edx,0x10(%ebp)
c01069fa:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106a00:	c7 85 44 ff ff ff bf 	movl   $0xc01084bf,-0xbc(%ebp)
c0106a07:	84 10 c0 
c0106a0a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106a11:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106a14:	75 0d                	jne    c0106a23 <_svfiprintf_r+0x573>
c0106a16:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106a1d:	0f 85 65 07 00 00    	jne    c0107188 <_svfiprintf_r+0xcd8>
c0106a23:	8b 0b                	mov    (%ebx),%ecx
c0106a25:	83 c3 04             	add    $0x4,%ebx
c0106a28:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0106a2b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106a32:	ba 02 00 00 00       	mov    $0x2,%edx
c0106a37:	0f 84 f3 fb ff ff    	je     c0106630 <_svfiprintf_r+0x180>
c0106a3d:	85 c9                	test   %ecx,%ecx
c0106a3f:	0f 84 eb fb ff ff    	je     c0106630 <_svfiprintf_r+0x180>
c0106a45:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c0106a4c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c0106a52:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106a59:	e9 d2 fb ff ff       	jmp    c0106630 <_svfiprintf_r+0x180>
c0106a5e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c0106a65:	89 d0                	mov    %edx,%eax
c0106a67:	e9 3a fb ff ff       	jmp    c01065a6 <_svfiprintf_r+0xf6>
c0106a6c:	89 f8                	mov    %edi,%eax
c0106a6e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a71:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106a77:	e9 0f fe ff ff       	jmp    c010688b <_svfiprintf_r+0x3db>
c0106a7c:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a7f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106a82:	89 55 10             	mov    %edx,0x10(%ebp)
c0106a85:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106a8c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106a93:	00 00 00 
c0106a96:	8b 00                	mov    (%eax),%eax
c0106a98:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c0106a9f:	00 00 00 
c0106aa2:	88 45 80             	mov    %al,-0x80(%ebp)
c0106aa5:	8b 45 14             	mov    0x14(%ebp),%eax
c0106aa8:	83 c0 04             	add    $0x4,%eax
c0106aab:	89 45 14             	mov    %eax,0x14(%ebp)
c0106aae:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106ab5:	00 00 00 
c0106ab8:	e9 05 fc ff ff       	jmp    c01066c2 <_svfiprintf_r+0x212>
c0106abd:	89 fb                	mov    %edi,%ebx
c0106abf:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ac2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106ac8:	c7 85 44 ff ff ff ae 	movl   $0xc01084ae,-0xbc(%ebp)
c0106acf:	84 10 c0 
c0106ad2:	e9 33 ff ff ff       	jmp    c0106a0a <_svfiprintf_r+0x55a>
c0106ad7:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106ade:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106ae5:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ae8:	8b 45 14             	mov    0x14(%ebp),%eax
c0106aeb:	75 39                	jne    c0106b26 <_svfiprintf_r+0x676>
c0106aed:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106af4:	74 30                	je     c0106b26 <_svfiprintf_r+0x676>
c0106af6:	0f b7 08             	movzwl (%eax),%ecx
c0106af9:	83 c0 04             	add    $0x4,%eax
c0106afc:	ba 01 00 00 00       	mov    $0x1,%edx
c0106b01:	89 45 14             	mov    %eax,0x14(%ebp)
c0106b04:	e9 27 fb ff ff       	jmp    c0106630 <_svfiprintf_r+0x180>
c0106b09:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c0106b10:	89 d0                	mov    %edx,%eax
c0106b12:	e9 8f fa ff ff       	jmp    c01065a6 <_svfiprintf_r+0xf6>
c0106b17:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106b1e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106b21:	8b 45 14             	mov    0x14(%ebp),%eax
c0106b24:	74 c7                	je     c0106aed <_svfiprintf_r+0x63d>
c0106b26:	8b 08                	mov    (%eax),%ecx
c0106b28:	83 c0 04             	add    $0x4,%eax
c0106b2b:	ba 01 00 00 00       	mov    $0x1,%edx
c0106b30:	89 45 14             	mov    %eax,0x14(%ebp)
c0106b33:	e9 f8 fa ff ff       	jmp    c0106630 <_svfiprintf_r+0x180>
c0106b38:	8b 45 14             	mov    0x14(%ebp),%eax
c0106b3b:	89 55 10             	mov    %edx,0x10(%ebp)
c0106b3e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106b45:	8b 18                	mov    (%eax),%ebx
c0106b47:	8d 50 04             	lea    0x4(%eax),%edx
c0106b4a:	85 db                	test   %ebx,%ebx
c0106b4c:	0f 84 cc 06 00 00    	je     c010721e <_svfiprintf_r+0xd6e>
c0106b52:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106b58:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c0106b5e:	85 ff                	test   %edi,%edi
c0106b60:	0f 88 59 06 00 00    	js     c01071bf <_svfiprintf_r+0xd0f>
c0106b66:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0106b6a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106b71:	00 
c0106b72:	89 1c 24             	mov    %ebx,(%esp)
c0106b75:	e8 76 e7 ff ff       	call   c01052f0 <memchr>
c0106b7a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106b80:	85 c0                	test   %eax,%eax
c0106b82:	0f 84 c5 06 00 00    	je     c010724d <_svfiprintf_r+0xd9d>
c0106b88:	29 d8                	sub    %ebx,%eax
c0106b8a:	39 f8                	cmp    %edi,%eax
c0106b8c:	0f 4f c7             	cmovg  %edi,%eax
c0106b8f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106b96:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106b9c:	89 55 14             	mov    %edx,0x14(%ebp)
c0106b9f:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106ba6:	00 00 00 
c0106ba9:	e9 f2 fa ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c0106bae:	89 f8                	mov    %edi,%eax
c0106bb0:	84 c0                	test   %al,%al
c0106bb2:	b8 20 00 00 00       	mov    $0x20,%eax
c0106bb7:	0f 44 f8             	cmove  %eax,%edi
c0106bba:	89 d0                	mov    %edx,%eax
c0106bbc:	e9 e5 f9 ff ff       	jmp    c01065a6 <_svfiprintf_r+0xf6>
c0106bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106bc8:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106bce:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106bd4:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c0106bdb:	74 2e                	je     c0106c0b <_svfiprintf_r+0x75b>
c0106bdd:	83 c0 01             	add    $0x1,%eax
c0106be0:	83 c2 01             	add    $0x1,%edx
c0106be3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0106be9:	83 c6 08             	add    $0x8,%esi
c0106bec:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106bef:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0106bf6:	83 f8 07             	cmp    $0x7,%eax
c0106bf9:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106bff:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c05:	0f 8f b5 04 00 00    	jg     c01070c0 <_svfiprintf_r+0xc10>
c0106c0b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0106c11:	85 c9                	test   %ecx,%ecx
c0106c13:	74 2e                	je     c0106c43 <_svfiprintf_r+0x793>
c0106c15:	83 c0 01             	add    $0x1,%eax
c0106c18:	83 c2 02             	add    $0x2,%edx
c0106c1b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0106c21:	83 c6 08             	add    $0x8,%esi
c0106c24:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106c27:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c0106c2e:	83 f8 07             	cmp    $0x7,%eax
c0106c31:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c37:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c3d:	0f 8f 45 04 00 00    	jg     c0107088 <_svfiprintf_r+0xbd8>
c0106c43:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c0106c4a:	00 00 00 
c0106c4d:	0f 84 9d 02 00 00    	je     c0106ef0 <_svfiprintf_r+0xa40>
c0106c53:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106c59:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c0106c5f:	85 ff                	test   %edi,%edi
c0106c61:	0f 8e e1 00 00 00    	jle    c0106d48 <_svfiprintf_r+0x898>
c0106c67:	83 ff 10             	cmp    $0x10,%edi
c0106c6a:	0f 8e 7c 00 00 00    	jle    c0106cec <_svfiprintf_r+0x83c>
c0106c70:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c0106c76:	89 f1                	mov    %esi,%ecx
c0106c78:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106c7b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106c7e:	eb 08                	jmp    c0106c88 <_svfiprintf_r+0x7d8>
c0106c80:	83 ef 10             	sub    $0x10,%edi
c0106c83:	83 ff 10             	cmp    $0x10,%edi
c0106c86:	7e 5c                	jle    c0106ce4 <_svfiprintf_r+0x834>
c0106c88:	83 c0 01             	add    $0x1,%eax
c0106c8b:	83 c2 10             	add    $0x10,%edx
c0106c8e:	c7 01 8c 89 10 c0    	movl   $0xc010898c,(%ecx)
c0106c94:	83 c1 08             	add    $0x8,%ecx
c0106c97:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106c9e:	83 f8 07             	cmp    $0x7,%eax
c0106ca1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106ca7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106cad:	7e d1                	jle    c0106c80 <_svfiprintf_r+0x7d0>
c0106caf:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106cb5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106cb9:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106cbd:	89 1c 24             	mov    %ebx,(%esp)
c0106cc0:	e8 fb f5 ff ff       	call   c01062c0 <__ssprint_r>
c0106cc5:	85 c0                	test   %eax,%eax
c0106cc7:	0f 85 eb 01 00 00    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0106ccd:	83 ef 10             	sub    $0x10,%edi
c0106cd0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106cd6:	83 ff 10             	cmp    $0x10,%edi
c0106cd9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106cdf:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106ce2:	7f a4                	jg     c0106c88 <_svfiprintf_r+0x7d8>
c0106ce4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0106cea:	89 ce                	mov    %ecx,%esi
c0106cec:	83 c0 01             	add    $0x1,%eax
c0106cef:	01 fa                	add    %edi,%edx
c0106cf1:	c7 06 8c 89 10 c0    	movl   $0xc010898c,(%esi)
c0106cf7:	83 c6 08             	add    $0x8,%esi
c0106cfa:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106cfd:	83 f8 07             	cmp    $0x7,%eax
c0106d00:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106d06:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106d0c:	7e 3a                	jle    c0106d48 <_svfiprintf_r+0x898>
c0106d0e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106d14:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106d18:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106d1b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106d1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d22:	89 04 24             	mov    %eax,(%esp)
c0106d25:	e8 96 f5 ff ff       	call   c01062c0 <__ssprint_r>
c0106d2a:	85 c0                	test   %eax,%eax
c0106d2c:	0f 85 86 01 00 00    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0106d32:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106d38:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106d3b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106d48:	89 1e                	mov    %ebx,(%esi)
c0106d4a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c0106d50:	83 c0 01             	add    $0x1,%eax
c0106d53:	83 c6 08             	add    $0x8,%esi
c0106d56:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106d5c:	89 5e fc             	mov    %ebx,-0x4(%esi)
c0106d5f:	01 da                	add    %ebx,%edx
c0106d61:	83 f8 07             	cmp    $0x7,%eax
c0106d64:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106d6a:	0f 8f 80 02 00 00    	jg     c0106ff0 <_svfiprintf_r+0xb40>
c0106d70:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c0106d77:	0f 84 b9 00 00 00    	je     c0106e36 <_svfiprintf_r+0x986>
c0106d7d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106d83:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106d89:	85 ff                	test   %edi,%edi
c0106d8b:	0f 8e a5 00 00 00    	jle    c0106e36 <_svfiprintf_r+0x986>
c0106d91:	83 ff 10             	cmp    $0x10,%edi
c0106d94:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106d9a:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0106da0:	7e 71                	jle    c0106e13 <_svfiprintf_r+0x963>
c0106da2:	89 f1                	mov    %esi,%ecx
c0106da4:	8b 75 08             	mov    0x8(%ebp),%esi
c0106da7:	eb 0f                	jmp    c0106db8 <_svfiprintf_r+0x908>
c0106da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106db0:	83 ef 10             	sub    $0x10,%edi
c0106db3:	83 ff 10             	cmp    $0x10,%edi
c0106db6:	7e 59                	jle    c0106e11 <_svfiprintf_r+0x961>
c0106db8:	83 c0 01             	add    $0x1,%eax
c0106dbb:	83 c2 10             	add    $0x10,%edx
c0106dbe:	c7 01 9c 89 10 c0    	movl   $0xc010899c,(%ecx)
c0106dc4:	83 c1 08             	add    $0x8,%ecx
c0106dc7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106dce:	83 f8 07             	cmp    $0x7,%eax
c0106dd1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106dd7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106ddd:	7e d1                	jle    c0106db0 <_svfiprintf_r+0x900>
c0106ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106de2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0106de6:	89 34 24             	mov    %esi,(%esp)
c0106de9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ded:	e8 ce f4 ff ff       	call   c01062c0 <__ssprint_r>
c0106df2:	85 c0                	test   %eax,%eax
c0106df4:	0f 85 be 00 00 00    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0106dfa:	83 ef 10             	sub    $0x10,%edi
c0106dfd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e03:	83 ff 10             	cmp    $0x10,%edi
c0106e06:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106e0c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106e0f:	7f a7                	jg     c0106db8 <_svfiprintf_r+0x908>
c0106e11:	89 ce                	mov    %ecx,%esi
c0106e13:	83 c0 01             	add    $0x1,%eax
c0106e16:	01 fa                	add    %edi,%edx
c0106e18:	83 f8 07             	cmp    $0x7,%eax
c0106e1b:	c7 06 9c 89 10 c0    	movl   $0xc010899c,(%esi)
c0106e21:	89 7e 04             	mov    %edi,0x4(%esi)
c0106e24:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e2a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e30:	0f 8f ee 02 00 00    	jg     c0107124 <_svfiprintf_r+0xc74>
c0106e36:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c0106e3c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0106e42:	39 c6                	cmp    %eax,%esi
c0106e44:	0f 4d c6             	cmovge %esi,%eax
c0106e47:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c0106e4d:	85 d2                	test   %edx,%edx
c0106e4f:	0f 85 d3 01 00 00    	jne    c0107028 <_svfiprintf_r+0xb78>
c0106e55:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106e5c:	00 00 00 
c0106e5f:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106e62:	e9 a7 f6 ff ff       	jmp    c010650e <_svfiprintf_r+0x5e>
c0106e67:	90                   	nop
c0106e68:	84 d2                	test   %dl,%dl
c0106e6a:	75 6c                	jne    c0106ed8 <_svfiprintf_r+0xa28>
c0106e6c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106e73:	74 63                	je     c0106ed8 <_svfiprintf_r+0xa28>
c0106e75:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0106e7b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106e7e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0106e82:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106e88:	e9 13 f8 ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c0106e8d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0106e93:	85 c0                	test   %eax,%eax
c0106e95:	74 21                	je     c0106eb8 <_svfiprintf_r+0xa08>
c0106e97:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e9d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106ea1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ea4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0106eab:	89 04 24             	mov    %eax,(%esp)
c0106eae:	e8 0d f4 ff ff       	call   c01062c0 <__ssprint_r>
c0106eb3:	90                   	nop
c0106eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106eb8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106ebb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106ec0:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c0106ec4:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c0106ecb:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0106ed1:	5b                   	pop    %ebx
c0106ed2:	5e                   	pop    %esi
c0106ed3:	5f                   	pop    %edi
c0106ed4:	5d                   	pop    %ebp
c0106ed5:	c3                   	ret    
c0106ed6:	66 90                	xchg   %ax,%ax
c0106ed8:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c0106edf:	00 00 00 
c0106ee2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106ee5:	e9 b6 f7 ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c0106eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106ef0:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106ef6:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106efc:	85 ff                	test   %edi,%edi
c0106efe:	0f 8e 4f fd ff ff    	jle    c0106c53 <_svfiprintf_r+0x7a3>
c0106f04:	83 ff 10             	cmp    $0x10,%edi
c0106f07:	0f 8e 7f 00 00 00    	jle    c0106f8c <_svfiprintf_r+0xadc>
c0106f0d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0106f13:	89 f1                	mov    %esi,%ecx
c0106f15:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106f18:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106f1b:	eb 0b                	jmp    c0106f28 <_svfiprintf_r+0xa78>
c0106f1d:	8d 76 00             	lea    0x0(%esi),%esi
c0106f20:	83 ef 10             	sub    $0x10,%edi
c0106f23:	83 ff 10             	cmp    $0x10,%edi
c0106f26:	7e 5c                	jle    c0106f84 <_svfiprintf_r+0xad4>
c0106f28:	83 c0 01             	add    $0x1,%eax
c0106f2b:	83 c2 10             	add    $0x10,%edx
c0106f2e:	c7 01 8c 89 10 c0    	movl   $0xc010898c,(%ecx)
c0106f34:	83 c1 08             	add    $0x8,%ecx
c0106f37:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106f3e:	83 f8 07             	cmp    $0x7,%eax
c0106f41:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106f47:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106f4d:	7e d1                	jle    c0106f20 <_svfiprintf_r+0xa70>
c0106f4f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f55:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f59:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106f5d:	89 1c 24             	mov    %ebx,(%esp)
c0106f60:	e8 5b f3 ff ff       	call   c01062c0 <__ssprint_r>
c0106f65:	85 c0                	test   %eax,%eax
c0106f67:	0f 85 4b ff ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0106f6d:	83 ef 10             	sub    $0x10,%edi
c0106f70:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106f76:	83 ff 10             	cmp    $0x10,%edi
c0106f79:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106f7f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106f82:	7f a4                	jg     c0106f28 <_svfiprintf_r+0xa78>
c0106f84:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c0106f8a:	89 ce                	mov    %ecx,%esi
c0106f8c:	83 c0 01             	add    $0x1,%eax
c0106f8f:	01 fa                	add    %edi,%edx
c0106f91:	c7 06 8c 89 10 c0    	movl   $0xc010898c,(%esi)
c0106f97:	83 c6 08             	add    $0x8,%esi
c0106f9a:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106f9d:	83 f8 07             	cmp    $0x7,%eax
c0106fa0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106fa6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106fac:	0f 8e a1 fc ff ff    	jle    c0106c53 <_svfiprintf_r+0x7a3>
c0106fb2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106fb8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106fbf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fc6:	89 04 24             	mov    %eax,(%esp)
c0106fc9:	e8 f2 f2 ff ff       	call   c01062c0 <__ssprint_r>
c0106fce:	85 c0                	test   %eax,%eax
c0106fd0:	0f 85 e2 fe ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0106fd6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106fdc:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106fdf:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106fe5:	e9 69 fc ff ff       	jmp    c0106c53 <_svfiprintf_r+0x7a3>
c0106fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106ff0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106ff6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106ffa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ffd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107001:	8b 45 08             	mov    0x8(%ebp),%eax
c0107004:	89 04 24             	mov    %eax,(%esp)
c0107007:	e8 b4 f2 ff ff       	call   c01062c0 <__ssprint_r>
c010700c:	85 c0                	test   %eax,%eax
c010700e:	0f 85 a4 fe ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0107014:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010701a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010701d:	e9 4e fd ff ff       	jmp    c0106d70 <_svfiprintf_r+0x8c0>
c0107022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107028:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010702e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107032:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107035:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107039:	8b 45 08             	mov    0x8(%ebp),%eax
c010703c:	89 04 24             	mov    %eax,(%esp)
c010703f:	e8 7c f2 ff ff       	call   c01062c0 <__ssprint_r>
c0107044:	85 c0                	test   %eax,%eax
c0107046:	0f 84 09 fe ff ff    	je     c0106e55 <_svfiprintf_r+0x9a5>
c010704c:	e9 67 fe ff ff       	jmp    c0106eb8 <_svfiprintf_r+0xa08>
c0107051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107058:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010705e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107062:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107065:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107069:	8b 45 08             	mov    0x8(%ebp),%eax
c010706c:	89 04 24             	mov    %eax,(%esp)
c010706f:	e8 4c f2 ff ff       	call   c01062c0 <__ssprint_r>
c0107074:	85 c0                	test   %eax,%eax
c0107076:	0f 85 3c fe ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c010707c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010707f:	e9 e9 f4 ff ff       	jmp    c010656d <_svfiprintf_r+0xbd>
c0107084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107088:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010708e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107092:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107095:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107099:	8b 45 08             	mov    0x8(%ebp),%eax
c010709c:	89 04 24             	mov    %eax,(%esp)
c010709f:	e8 1c f2 ff ff       	call   c01062c0 <__ssprint_r>
c01070a4:	85 c0                	test   %eax,%eax
c01070a6:	0f 85 0c fe ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c01070ac:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01070b2:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01070b5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01070bb:	e9 83 fb ff ff       	jmp    c0106c43 <_svfiprintf_r+0x793>
c01070c0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01070c6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01070ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c01070cd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01070d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01070d4:	89 04 24             	mov    %eax,(%esp)
c01070d7:	e8 e4 f1 ff ff       	call   c01062c0 <__ssprint_r>
c01070dc:	85 c0                	test   %eax,%eax
c01070de:	0f 85 d4 fd ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c01070e4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01070ea:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01070ed:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01070f3:	e9 13 fb ff ff       	jmp    c0106c0b <_svfiprintf_r+0x75b>
c01070f8:	83 f9 09             	cmp    $0x9,%ecx
c01070fb:	76 56                	jbe    c0107153 <_svfiprintf_r+0xca3>
c01070fd:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107100:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0107105:	83 eb 01             	sub    $0x1,%ebx
c0107108:	f7 e1                	mul    %ecx
c010710a:	c1 ea 03             	shr    $0x3,%edx
c010710d:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0107110:	01 c0                	add    %eax,%eax
c0107112:	29 c1                	sub    %eax,%ecx
c0107114:	83 c1 30             	add    $0x30,%ecx
c0107117:	85 d2                	test   %edx,%edx
c0107119:	88 0b                	mov    %cl,(%ebx)
c010711b:	89 d1                	mov    %edx,%ecx
c010711d:	75 e1                	jne    c0107100 <_svfiprintf_r+0xc50>
c010711f:	e9 71 f5 ff ff       	jmp    c0106695 <_svfiprintf_r+0x1e5>
c0107124:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010712a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010712e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107131:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107135:	8b 45 08             	mov    0x8(%ebp),%eax
c0107138:	89 04 24             	mov    %eax,(%esp)
c010713b:	e8 80 f1 ff ff       	call   c01062c0 <__ssprint_r>
c0107140:	85 c0                	test   %eax,%eax
c0107142:	0f 85 70 fd ff ff    	jne    c0106eb8 <_svfiprintf_r+0xa08>
c0107148:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010714e:	e9 e3 fc ff ff       	jmp    c0106e36 <_svfiprintf_r+0x986>
c0107153:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0107159:	83 c1 30             	add    $0x30,%ecx
c010715c:	88 4d a7             	mov    %cl,-0x59(%ebp)
c010715f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0107162:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107168:	e9 33 f5 ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c010716d:	8b 45 14             	mov    0x14(%ebp),%eax
c0107170:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c0107176:	8b 00                	mov    (%eax),%eax
c0107178:	89 18                	mov    %ebx,(%eax)
c010717a:	8b 45 14             	mov    0x14(%ebp),%eax
c010717d:	83 c0 04             	add    $0x4,%eax
c0107180:	89 45 14             	mov    %eax,0x14(%ebp)
c0107183:	e9 86 f3 ff ff       	jmp    c010650e <_svfiprintf_r+0x5e>
c0107188:	0f b7 0b             	movzwl (%ebx),%ecx
c010718b:	83 c3 04             	add    $0x4,%ebx
c010718e:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0107191:	e9 95 f8 ff ff       	jmp    c0106a2b <_svfiprintf_r+0x57b>
c0107196:	0f bf 08             	movswl (%eax),%ecx
c0107199:	83 c0 04             	add    $0x4,%eax
c010719c:	89 45 14             	mov    %eax,0x14(%ebp)
c010719f:	85 c9                	test   %ecx,%ecx
c01071a1:	0f 89 0d f7 ff ff    	jns    c01068b4 <_svfiprintf_r+0x404>
c01071a7:	f7 d9                	neg    %ecx
c01071a9:	bf 2d 00 00 00       	mov    $0x2d,%edi
c01071ae:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c01071b5:	ba 01 00 00 00       	mov    $0x1,%edx
c01071ba:	e9 7a f4 ff ff       	jmp    c0106639 <_svfiprintf_r+0x189>
c01071bf:	89 1c 24             	mov    %ebx,(%esp)
c01071c2:	e8 79 f0 ff ff       	call   c0106240 <strlen>
c01071c7:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01071cd:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01071d4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01071db:	00 00 00 
c01071de:	89 55 14             	mov    %edx,0x14(%ebp)
c01071e1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01071e7:	e9 b4 f4 ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c01071ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01071ef:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c01071f6:	00 
c01071f7:	89 04 24             	mov    %eax,(%esp)
c01071fa:	e8 b1 d9 ff ff       	call   c0104bb0 <_malloc_r>
c01071ff:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107202:	85 c0                	test   %eax,%eax
c0107204:	89 06                	mov    %eax,(%esi)
c0107206:	89 46 10             	mov    %eax,0x10(%esi)
c0107209:	0f 84 a3 00 00 00    	je     c01072b2 <_svfiprintf_r+0xe02>
c010720f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107212:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0107219:	e9 b2 f2 ff ff       	jmp    c01064d0 <_svfiprintf_r+0x20>
c010721e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107224:	b8 06 00 00 00       	mov    $0x6,%eax
c0107229:	89 55 14             	mov    %edx,0x14(%ebp)
c010722c:	83 ff 06             	cmp    $0x6,%edi
c010722f:	0f 46 c7             	cmovbe %edi,%eax
c0107232:	85 c0                	test   %eax,%eax
c0107234:	0f 49 d8             	cmovns %eax,%ebx
c0107237:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c010723d:	bb d0 84 10 c0       	mov    $0xc01084d0,%ebx
c0107242:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107248:	e9 61 f8 ff ff       	jmp    c0106aae <_svfiprintf_r+0x5fe>
c010724d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0107253:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010725a:	89 55 14             	mov    %edx,0x14(%ebp)
c010725d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107264:	00 00 00 
c0107267:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010726d:	e9 2e f4 ff ff       	jmp    c01066a0 <_svfiprintf_r+0x1f0>
c0107272:	89 da                	mov    %ebx,%edx
c0107274:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010727b:	00 00 00 
c010727e:	e9 29 f3 ff ff       	jmp    c01065ac <_svfiprintf_r+0xfc>
c0107283:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0107286:	89 da                	mov    %ebx,%edx
c0107288:	8b 45 14             	mov    0x14(%ebp),%eax
c010728b:	8b 09                	mov    (%ecx),%ecx
c010728d:	83 c0 04             	add    $0x4,%eax
c0107290:	89 45 14             	mov    %eax,0x14(%ebp)
c0107293:	85 c9                	test   %ecx,%ecx
c0107295:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010729b:	0f 89 26 f3 ff ff    	jns    c01065c7 <_svfiprintf_r+0x117>
c01072a1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c01072a8:	ff ff ff 
c01072ab:	89 d0                	mov    %edx,%eax
c01072ad:	e9 f4 f2 ff ff       	jmp    c01065a6 <_svfiprintf_r+0xf6>
c01072b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01072b5:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01072bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01072c0:	e9 06 fc ff ff       	jmp    c0106ecb <_svfiprintf_r+0xa1b>
c01072c5:	66 90                	xchg   %ax,%ax
c01072c7:	66 90                	xchg   %ax,%ax
c01072c9:	66 90                	xchg   %ax,%ax
c01072cb:	66 90                	xchg   %ax,%ax
c01072cd:	66 90                	xchg   %ax,%ax
c01072cf:	90                   	nop

c01072d0 <_calloc_r>:
c01072d0:	55                   	push   %ebp
c01072d1:	89 e5                	mov    %esp,%ebp
c01072d3:	53                   	push   %ebx
c01072d4:	83 ec 14             	sub    $0x14,%esp
c01072d7:	8b 45 10             	mov    0x10(%ebp),%eax
c01072da:	0f af 45 0c          	imul   0xc(%ebp),%eax
c01072de:	89 44 24 04          	mov    %eax,0x4(%esp)
c01072e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01072e5:	89 04 24             	mov    %eax,(%esp)
c01072e8:	e8 c3 d8 ff ff       	call   c0104bb0 <_malloc_r>
c01072ed:	85 c0                	test   %eax,%eax
c01072ef:	89 c3                	mov    %eax,%ebx
c01072f1:	0f 84 91 00 00 00    	je     c0107388 <_calloc_r+0xb8>
c01072f7:	8b 40 fc             	mov    -0x4(%eax),%eax
c01072fa:	83 e0 fc             	and    $0xfffffffc,%eax
c01072fd:	83 e8 04             	sub    $0x4,%eax
c0107300:	83 f8 24             	cmp    $0x24,%eax
c0107303:	77 63                	ja     c0107368 <_calloc_r+0x98>
c0107305:	83 f8 13             	cmp    $0x13,%eax
c0107308:	89 da                	mov    %ebx,%edx
c010730a:	77 1c                	ja     c0107328 <_calloc_r+0x58>
c010730c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c0107312:	89 d8                	mov    %ebx,%eax
c0107314:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c010731b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c0107322:	83 c4 14             	add    $0x14,%esp
c0107325:	5b                   	pop    %ebx
c0107326:	5d                   	pop    %ebp
c0107327:	c3                   	ret    
c0107328:	83 f8 1b             	cmp    $0x1b,%eax
c010732b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0107331:	8d 53 08             	lea    0x8(%ebx),%edx
c0107334:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c010733b:	76 cf                	jbe    c010730c <_calloc_r+0x3c>
c010733d:	83 f8 24             	cmp    $0x24,%eax
c0107340:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107347:	8d 53 10             	lea    0x10(%ebx),%edx
c010734a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c0107351:	75 b9                	jne    c010730c <_calloc_r+0x3c>
c0107353:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c010735a:	8d 53 18             	lea    0x18(%ebx),%edx
c010735d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c0107364:	eb a6                	jmp    c010730c <_calloc_r+0x3c>
c0107366:	66 90                	xchg   %ax,%ax
c0107368:	89 1c 24             	mov    %ebx,(%esp)
c010736b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010736f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107376:	00 
c0107377:	e8 5c a2 ff ff       	call   c01015d8 <memset>
c010737c:	83 c4 14             	add    $0x14,%esp
c010737f:	89 d8                	mov    %ebx,%eax
c0107381:	5b                   	pop    %ebx
c0107382:	5d                   	pop    %ebp
c0107383:	c3                   	ret    
c0107384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107388:	31 c0                	xor    %eax,%eax
c010738a:	eb 96                	jmp    c0107322 <_calloc_r+0x52>
c010738c:	66 90                	xchg   %ax,%ax
c010738e:	66 90                	xchg   %ax,%ax

c0107390 <_malloc_trim_r>:
c0107390:	55                   	push   %ebp
c0107391:	89 e5                	mov    %esp,%ebp
c0107393:	57                   	push   %edi
c0107394:	56                   	push   %esi
c0107395:	53                   	push   %ebx
c0107396:	83 ec 1c             	sub    $0x1c,%esp
c0107399:	8b 75 08             	mov    0x8(%ebp),%esi
c010739c:	89 34 24             	mov    %esi,(%esp)
c010739f:	e8 ec df ff ff       	call   c0105390 <__malloc_lock>
c01073a4:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c01073a9:	8b 58 04             	mov    0x4(%eax),%ebx
c01073ac:	83 e3 fc             	and    $0xfffffffc,%ebx
c01073af:	89 d8                	mov    %ebx,%eax
c01073b1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01073b4:	05 ef 0f 00 00       	add    $0xfef,%eax
c01073b9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01073be:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c01073c4:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c01073ca:	7e 1c                	jle    c01073e8 <_malloc_trim_r+0x58>
c01073cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01073d3:	00 
c01073d4:	89 34 24             	mov    %esi,(%esp)
c01073d7:	e8 b4 ed ff ff       	call   c0106190 <_sbrk_r>
c01073dc:	8b 15 28 a5 10 c0    	mov    0xc010a528,%edx
c01073e2:	01 da                	add    %ebx,%edx
c01073e4:	39 d0                	cmp    %edx,%eax
c01073e6:	74 18                	je     c0107400 <_malloc_trim_r+0x70>
c01073e8:	89 34 24             	mov    %esi,(%esp)
c01073eb:	e8 b0 df ff ff       	call   c01053a0 <__malloc_unlock>
c01073f0:	83 c4 1c             	add    $0x1c,%esp
c01073f3:	31 c0                	xor    %eax,%eax
c01073f5:	5b                   	pop    %ebx
c01073f6:	5e                   	pop    %esi
c01073f7:	5f                   	pop    %edi
c01073f8:	5d                   	pop    %ebp
c01073f9:	c3                   	ret    
c01073fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107400:	89 f8                	mov    %edi,%eax
c0107402:	f7 d8                	neg    %eax
c0107404:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107408:	89 34 24             	mov    %esi,(%esp)
c010740b:	e8 80 ed ff ff       	call   c0106190 <_sbrk_r>
c0107410:	83 f8 ff             	cmp    $0xffffffff,%eax
c0107413:	74 2b                	je     c0107440 <_malloc_trim_r+0xb0>
c0107415:	a1 28 a5 10 c0       	mov    0xc010a528,%eax
c010741a:	29 fb                	sub    %edi,%ebx
c010741c:	83 cb 01             	or     $0x1,%ebx
c010741f:	29 3d 60 25 16 c0    	sub    %edi,0xc0162560
c0107425:	89 58 04             	mov    %ebx,0x4(%eax)
c0107428:	89 34 24             	mov    %esi,(%esp)
c010742b:	e8 70 df ff ff       	call   c01053a0 <__malloc_unlock>
c0107430:	83 c4 1c             	add    $0x1c,%esp
c0107433:	b8 01 00 00 00       	mov    $0x1,%eax
c0107438:	5b                   	pop    %ebx
c0107439:	5e                   	pop    %esi
c010743a:	5f                   	pop    %edi
c010743b:	5d                   	pop    %ebp
c010743c:	c3                   	ret    
c010743d:	8d 76 00             	lea    0x0(%esi),%esi
c0107440:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107447:	00 
c0107448:	89 34 24             	mov    %esi,(%esp)
c010744b:	e8 40 ed ff ff       	call   c0106190 <_sbrk_r>
c0107450:	8b 15 28 a5 10 c0    	mov    0xc010a528,%edx
c0107456:	89 c1                	mov    %eax,%ecx
c0107458:	29 d1                	sub    %edx,%ecx
c010745a:	83 f9 0f             	cmp    $0xf,%ecx
c010745d:	7e 89                	jle    c01073e8 <_malloc_trim_r+0x58>
c010745f:	2b 05 00 a5 10 c0    	sub    0xc010a500,%eax
c0107465:	83 c9 01             	or     $0x1,%ecx
c0107468:	89 4a 04             	mov    %ecx,0x4(%edx)
c010746b:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0107470:	e9 73 ff ff ff       	jmp    c01073e8 <_malloc_trim_r+0x58>
c0107475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0107480 <_free_r>:
c0107480:	55                   	push   %ebp
c0107481:	89 e5                	mov    %esp,%ebp
c0107483:	57                   	push   %edi
c0107484:	56                   	push   %esi
c0107485:	53                   	push   %ebx
c0107486:	83 ec 1c             	sub    $0x1c,%esp
c0107489:	8b 75 0c             	mov    0xc(%ebp),%esi
c010748c:	8b 45 08             	mov    0x8(%ebp),%eax
c010748f:	85 f6                	test   %esi,%esi
c0107491:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107494:	0f 84 fe 00 00 00    	je     c0107598 <_free_r+0x118>
c010749a:	89 04 24             	mov    %eax,(%esp)
c010749d:	e8 ee de ff ff       	call   c0105390 <__malloc_lock>
c01074a2:	8b 7e fc             	mov    -0x4(%esi),%edi
c01074a5:	8d 56 f8             	lea    -0x8(%esi),%edx
c01074a8:	89 f8                	mov    %edi,%eax
c01074aa:	83 e0 fe             	and    $0xfffffffe,%eax
c01074ad:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c01074b0:	8b 59 04             	mov    0x4(%ecx),%ebx
c01074b3:	83 e3 fc             	and    $0xfffffffc,%ebx
c01074b6:	39 0d 28 a5 10 c0    	cmp    %ecx,0xc010a528
c01074bc:	0f 84 0e 01 00 00    	je     c01075d0 <_free_r+0x150>
c01074c2:	83 e7 01             	and    $0x1,%edi
c01074c5:	89 59 04             	mov    %ebx,0x4(%ecx)
c01074c8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01074cf:	75 1f                	jne    c01074f0 <_free_r+0x70>
c01074d1:	8b 76 f8             	mov    -0x8(%esi),%esi
c01074d4:	29 f2                	sub    %esi,%edx
c01074d6:	01 f0                	add    %esi,%eax
c01074d8:	8b 72 08             	mov    0x8(%edx),%esi
c01074db:	81 fe 28 a5 10 c0    	cmp    $0xc010a528,%esi
c01074e1:	0f 84 39 01 00 00    	je     c0107620 <_free_r+0x1a0>
c01074e7:	8b 7a 0c             	mov    0xc(%edx),%edi
c01074ea:	89 7e 0c             	mov    %edi,0xc(%esi)
c01074ed:	89 77 08             	mov    %esi,0x8(%edi)
c01074f0:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c01074f5:	75 21                	jne    c0107518 <_free_r+0x98>
c01074f7:	8b 75 e0             	mov    -0x20(%ebp),%esi
c01074fa:	01 d8                	add    %ebx,%eax
c01074fc:	8b 59 08             	mov    0x8(%ecx),%ebx
c01074ff:	85 f6                	test   %esi,%esi
c0107501:	75 0c                	jne    c010750f <_free_r+0x8f>
c0107503:	81 fb 28 a5 10 c0    	cmp    $0xc010a528,%ebx
c0107509:	0f 84 21 01 00 00    	je     c0107630 <_free_r+0x1b0>
c010750f:	8b 49 0c             	mov    0xc(%ecx),%ecx
c0107512:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107515:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107518:	89 c1                	mov    %eax,%ecx
c010751a:	83 c9 01             	or     $0x1,%ecx
c010751d:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107520:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107523:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107526:	85 c9                	test   %ecx,%ecx
c0107528:	75 56                	jne    c0107580 <_free_r+0x100>
c010752a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010752f:	76 6f                	jbe    c01075a0 <_free_r+0x120>
c0107531:	89 c1                	mov    %eax,%ecx
c0107533:	c1 e9 09             	shr    $0x9,%ecx
c0107536:	83 f9 04             	cmp    $0x4,%ecx
c0107539:	0f 87 21 01 00 00    	ja     c0107660 <_free_r+0x1e0>
c010753f:	89 c1                	mov    %eax,%ecx
c0107541:	c1 e9 06             	shr    $0x6,%ecx
c0107544:	83 c1 38             	add    $0x38,%ecx
c0107547:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010754a:	8d 34 9d 20 a5 10 c0 	lea    -0x3fef5ae0(,%ebx,4),%esi
c0107551:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107554:	39 f3                	cmp    %esi,%ebx
c0107556:	0f 84 14 01 00 00    	je     c0107670 <_free_r+0x1f0>
c010755c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107560:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107563:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107566:	39 c8                	cmp    %ecx,%eax
c0107568:	73 07                	jae    c0107571 <_free_r+0xf1>
c010756a:	8b 5b 08             	mov    0x8(%ebx),%ebx
c010756d:	39 de                	cmp    %ebx,%esi
c010756f:	75 ef                	jne    c0107560 <_free_r+0xe0>
c0107571:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107574:	89 42 0c             	mov    %eax,0xc(%edx)
c0107577:	89 5a 08             	mov    %ebx,0x8(%edx)
c010757a:	89 50 08             	mov    %edx,0x8(%eax)
c010757d:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107583:	89 45 08             	mov    %eax,0x8(%ebp)
c0107586:	83 c4 1c             	add    $0x1c,%esp
c0107589:	5b                   	pop    %ebx
c010758a:	5e                   	pop    %esi
c010758b:	5f                   	pop    %edi
c010758c:	5d                   	pop    %ebp
c010758d:	e9 0e de ff ff       	jmp    c01053a0 <__malloc_unlock>
c0107592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107598:	83 c4 1c             	add    $0x1c,%esp
c010759b:	5b                   	pop    %ebx
c010759c:	5e                   	pop    %esi
c010759d:	5f                   	pop    %edi
c010759e:	5d                   	pop    %ebp
c010759f:	c3                   	ret    
c01075a0:	c1 e8 03             	shr    $0x3,%eax
c01075a3:	bb 01 00 00 00       	mov    $0x1,%ebx
c01075a8:	89 c1                	mov    %eax,%ecx
c01075aa:	c1 f9 02             	sar    $0x2,%ecx
c01075ad:	8d 04 c5 20 a5 10 c0 	lea    -0x3fef5ae0(,%eax,8),%eax
c01075b4:	d3 e3                	shl    %cl,%ebx
c01075b6:	8b 48 08             	mov    0x8(%eax),%ecx
c01075b9:	09 1d 24 a5 10 c0    	or     %ebx,0xc010a524
c01075bf:	89 42 0c             	mov    %eax,0xc(%edx)
c01075c2:	89 4a 08             	mov    %ecx,0x8(%edx)
c01075c5:	89 50 08             	mov    %edx,0x8(%eax)
c01075c8:	89 51 0c             	mov    %edx,0xc(%ecx)
c01075cb:	eb b3                	jmp    c0107580 <_free_r+0x100>
c01075cd:	8d 76 00             	lea    0x0(%esi),%esi
c01075d0:	01 d8                	add    %ebx,%eax
c01075d2:	83 e7 01             	and    $0x1,%edi
c01075d5:	75 13                	jne    c01075ea <_free_r+0x16a>
c01075d7:	8b 4e f8             	mov    -0x8(%esi),%ecx
c01075da:	29 ca                	sub    %ecx,%edx
c01075dc:	01 c8                	add    %ecx,%eax
c01075de:	8b 5a 08             	mov    0x8(%edx),%ebx
c01075e1:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01075e4:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01075e7:	89 59 08             	mov    %ebx,0x8(%ecx)
c01075ea:	89 c1                	mov    %eax,%ecx
c01075ec:	83 c9 01             	or     $0x1,%ecx
c01075ef:	3b 05 04 a5 10 c0    	cmp    0xc010a504,%eax
c01075f5:	89 4a 04             	mov    %ecx,0x4(%edx)
c01075f8:	89 15 28 a5 10 c0    	mov    %edx,0xc010a528
c01075fe:	72 80                	jb     c0107580 <_free_r+0x100>
c0107600:	a1 90 25 16 c0       	mov    0xc0162590,%eax
c0107605:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107609:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010760c:	89 04 24             	mov    %eax,(%esp)
c010760f:	e8 7c fd ff ff       	call   c0107390 <_malloc_trim_r>
c0107614:	e9 67 ff ff ff       	jmp    c0107580 <_free_r+0x100>
c0107619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107620:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0107627:	e9 c4 fe ff ff       	jmp    c01074f0 <_free_r+0x70>
c010762c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107630:	89 c1                	mov    %eax,%ecx
c0107632:	83 c9 01             	or     $0x1,%ecx
c0107635:	89 15 34 a5 10 c0    	mov    %edx,0xc010a534
c010763b:	89 15 30 a5 10 c0    	mov    %edx,0xc010a530
c0107641:	c7 42 0c 28 a5 10 c0 	movl   $0xc010a528,0xc(%edx)
c0107648:	c7 42 08 28 a5 10 c0 	movl   $0xc010a528,0x8(%edx)
c010764f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107652:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107655:	e9 26 ff ff ff       	jmp    c0107580 <_free_r+0x100>
c010765a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107660:	83 f9 14             	cmp    $0x14,%ecx
c0107663:	77 23                	ja     c0107688 <_free_r+0x208>
c0107665:	83 c1 5b             	add    $0x5b,%ecx
c0107668:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010766b:	e9 da fe ff ff       	jmp    c010754a <_free_r+0xca>
c0107670:	c1 f9 02             	sar    $0x2,%ecx
c0107673:	b8 01 00 00 00       	mov    $0x1,%eax
c0107678:	d3 e0                	shl    %cl,%eax
c010767a:	09 05 24 a5 10 c0    	or     %eax,0xc010a524
c0107680:	89 d8                	mov    %ebx,%eax
c0107682:	e9 ed fe ff ff       	jmp    c0107574 <_free_r+0xf4>
c0107687:	90                   	nop
c0107688:	83 f9 54             	cmp    $0x54,%ecx
c010768b:	77 10                	ja     c010769d <_free_r+0x21d>
c010768d:	89 c1                	mov    %eax,%ecx
c010768f:	c1 e9 0c             	shr    $0xc,%ecx
c0107692:	83 c1 6e             	add    $0x6e,%ecx
c0107695:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107698:	e9 ad fe ff ff       	jmp    c010754a <_free_r+0xca>
c010769d:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01076a3:	77 10                	ja     c01076b5 <_free_r+0x235>
c01076a5:	89 c1                	mov    %eax,%ecx
c01076a7:	c1 e9 0f             	shr    $0xf,%ecx
c01076aa:	83 c1 77             	add    $0x77,%ecx
c01076ad:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01076b0:	e9 95 fe ff ff       	jmp    c010754a <_free_r+0xca>
c01076b5:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c01076bb:	77 10                	ja     c01076cd <_free_r+0x24d>
c01076bd:	89 c1                	mov    %eax,%ecx
c01076bf:	c1 e9 12             	shr    $0x12,%ecx
c01076c2:	83 c1 7c             	add    $0x7c,%ecx
c01076c5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c01076c8:	e9 7d fe ff ff       	jmp    c010754a <_free_r+0xca>
c01076cd:	bb fc 00 00 00       	mov    $0xfc,%ebx
c01076d2:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c01076d7:	e9 6e fe ff ff       	jmp    c010754a <_free_r+0xca>
c01076dc:	66 90                	xchg   %ax,%ax
c01076de:	66 90                	xchg   %ax,%ax

c01076e0 <memmove>:
c01076e0:	55                   	push   %ebp
c01076e1:	89 e5                	mov    %esp,%ebp
c01076e3:	56                   	push   %esi
c01076e4:	57                   	push   %edi
c01076e5:	53                   	push   %ebx
c01076e6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01076e9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01076ec:	8b 75 0c             	mov    0xc(%ebp),%esi
c01076ef:	fc                   	cld    
c01076f0:	39 fe                	cmp    %edi,%esi
c01076f2:	73 43                	jae    c0107737 <memmove+0x57>
c01076f4:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c01076f8:	39 df                	cmp    %ebx,%edi
c01076fa:	77 3b                	ja     c0107737 <memmove+0x57>
c01076fc:	01 ce                	add    %ecx,%esi
c01076fe:	01 cf                	add    %ecx,%edi
c0107700:	fd                   	std    
c0107701:	83 f9 08             	cmp    $0x8,%ecx
c0107704:	76 2b                	jbe    c0107731 <memmove+0x51>
c0107706:	89 fa                	mov    %edi,%edx
c0107708:	89 cb                	mov    %ecx,%ebx
c010770a:	83 e2 03             	and    $0x3,%edx
c010770d:	74 0c                	je     c010771b <memmove+0x3b>
c010770f:	89 d1                	mov    %edx,%ecx
c0107711:	4e                   	dec    %esi
c0107712:	4f                   	dec    %edi
c0107713:	29 cb                	sub    %ecx,%ebx
c0107715:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107717:	89 d9                	mov    %ebx,%ecx
c0107719:	46                   	inc    %esi
c010771a:	47                   	inc    %edi
c010771b:	c1 e9 02             	shr    $0x2,%ecx
c010771e:	83 ee 04             	sub    $0x4,%esi
c0107721:	83 ef 04             	sub    $0x4,%edi
c0107724:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107726:	83 c6 04             	add    $0x4,%esi
c0107729:	83 c7 04             	add    $0x4,%edi
c010772c:	89 d9                	mov    %ebx,%ecx
c010772e:	83 e1 03             	and    $0x3,%ecx
c0107731:	4e                   	dec    %esi
c0107732:	4f                   	dec    %edi
c0107733:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107735:	eb 2a                	jmp    c0107761 <memmove+0x81>
c0107737:	83 f9 08             	cmp    $0x8,%ecx
c010773a:	76 23                	jbe    c010775f <memmove+0x7f>
c010773c:	89 fa                	mov    %edi,%edx
c010773e:	89 cb                	mov    %ecx,%ebx
c0107740:	83 e2 03             	and    $0x3,%edx
c0107743:	74 10                	je     c0107755 <memmove+0x75>
c0107745:	b9 04 00 00 00       	mov    $0x4,%ecx
c010774a:	29 d1                	sub    %edx,%ecx
c010774c:	83 e1 03             	and    $0x3,%ecx
c010774f:	29 cb                	sub    %ecx,%ebx
c0107751:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107753:	89 d9                	mov    %ebx,%ecx
c0107755:	c1 e9 02             	shr    $0x2,%ecx
c0107758:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010775a:	89 d9                	mov    %ebx,%ecx
c010775c:	83 e1 03             	and    $0x3,%ecx
c010775f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107761:	8b 45 08             	mov    0x8(%ebp),%eax
c0107764:	fc                   	cld    
c0107765:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107768:	5b                   	pop    %ebx
c0107769:	5f                   	pop    %edi
c010776a:	5e                   	pop    %esi
c010776b:	c9                   	leave  
c010776c:	c3                   	ret    
c010776d:	66 90                	xchg   %ax,%ax
c010776f:	90                   	nop

c0107770 <_realloc_r>:
c0107770:	55                   	push   %ebp
c0107771:	89 e5                	mov    %esp,%ebp
c0107773:	57                   	push   %edi
c0107774:	56                   	push   %esi
c0107775:	53                   	push   %ebx
c0107776:	83 ec 3c             	sub    $0x3c,%esp
c0107779:	8b 45 08             	mov    0x8(%ebp),%eax
c010777c:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010777f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107782:	8b 45 10             	mov    0x10(%ebp),%eax
c0107785:	85 ff                	test   %edi,%edi
c0107787:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010778a:	0f 84 50 02 00 00    	je     c01079e0 <_realloc_r+0x270>
c0107790:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107793:	8d 77 f8             	lea    -0x8(%edi),%esi
c0107796:	89 04 24             	mov    %eax,(%esp)
c0107799:	e8 f2 db ff ff       	call   c0105390 <__malloc_lock>
c010779e:	8b 47 fc             	mov    -0x4(%edi),%eax
c01077a1:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01077a4:	89 c3                	mov    %eax,%ebx
c01077a6:	8d 51 0b             	lea    0xb(%ecx),%edx
c01077a9:	83 e3 fc             	and    $0xfffffffc,%ebx
c01077ac:	83 fa 16             	cmp    $0x16,%edx
c01077af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01077b2:	0f 87 00 01 00 00    	ja     c01078b8 <_realloc_r+0x148>
c01077b8:	31 d2                	xor    %edx,%edx
c01077ba:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c01077c1:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01077c8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01077cb:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c01077ce:	0f 82 1c 02 00 00    	jb     c01079f0 <_realloc_r+0x280>
c01077d4:	84 d2                	test   %dl,%dl
c01077d6:	0f 85 14 02 00 00    	jne    c01079f0 <_realloc_r+0x280>
c01077dc:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c01077df:	0f 8d eb 00 00 00    	jge    c01078d0 <_realloc_r+0x160>
c01077e5:	8b 0d 28 a5 10 c0    	mov    0xc010a528,%ecx
c01077eb:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c01077ee:	39 d1                	cmp    %edx,%ecx
c01077f0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c01077f3:	0f 84 6f 02 00 00    	je     c0107a68 <_realloc_r+0x2f8>
c01077f9:	8b 4a 04             	mov    0x4(%edx),%ecx
c01077fc:	89 c8                	mov    %ecx,%eax
c01077fe:	83 e0 fe             	and    $0xfffffffe,%eax
c0107801:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c0107806:	0f 84 f4 00 00 00    	je     c0107900 <_realloc_r+0x190>
c010780c:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c0107813:	31 d2                	xor    %edx,%edx
c0107815:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c0107819:	0f 85 39 01 00 00    	jne    c0107958 <_realloc_r+0x1e8>
c010781f:	89 f1                	mov    %esi,%ecx
c0107821:	2b 4f f8             	sub    -0x8(%edi),%ecx
c0107824:	8b 41 04             	mov    0x4(%ecx),%eax
c0107827:	83 e0 fc             	and    $0xfffffffc,%eax
c010782a:	85 d2                	test   %edx,%edx
c010782c:	0f 84 f6 02 00 00    	je     c0107b28 <_realloc_r+0x3b8>
c0107832:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0107835:	0f 84 f5 02 00 00    	je     c0107b30 <_realloc_r+0x3c0>
c010783b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c010783e:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107841:	01 d8                	add    %ebx,%eax
c0107843:	01 c2                	add    %eax,%edx
c0107845:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107848:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010784b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010784e:	0f 8c ac 01 00 00    	jl     c0107a00 <_realloc_r+0x290>
c0107854:	8b 42 0c             	mov    0xc(%edx),%eax
c0107857:	83 eb 04             	sub    $0x4,%ebx
c010785a:	8b 52 08             	mov    0x8(%edx),%edx
c010785d:	83 fb 24             	cmp    $0x24,%ebx
c0107860:	8d 71 08             	lea    0x8(%ecx),%esi
c0107863:	89 42 0c             	mov    %eax,0xc(%edx)
c0107866:	89 50 08             	mov    %edx,0x8(%eax)
c0107869:	8b 41 0c             	mov    0xc(%ecx),%eax
c010786c:	8b 51 08             	mov    0x8(%ecx),%edx
c010786f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107872:	89 50 08             	mov    %edx,0x8(%eax)
c0107875:	0f 87 85 03 00 00    	ja     c0107c00 <_realloc_r+0x490>
c010787b:	83 fb 13             	cmp    $0x13,%ebx
c010787e:	89 f0                	mov    %esi,%eax
c0107880:	76 1a                	jbe    c010789c <_realloc_r+0x12c>
c0107882:	8b 07                	mov    (%edi),%eax
c0107884:	83 fb 1b             	cmp    $0x1b,%ebx
c0107887:	89 41 08             	mov    %eax,0x8(%ecx)
c010788a:	8b 47 04             	mov    0x4(%edi),%eax
c010788d:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107890:	0f 87 8f 03 00 00    	ja     c0107c25 <_realloc_r+0x4b5>
c0107896:	8d 41 10             	lea    0x10(%ecx),%eax
c0107899:	83 c7 08             	add    $0x8,%edi
c010789c:	8b 17                	mov    (%edi),%edx
c010789e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c01078a1:	89 10                	mov    %edx,(%eax)
c01078a3:	8b 57 04             	mov    0x4(%edi),%edx
c01078a6:	89 50 04             	mov    %edx,0x4(%eax)
c01078a9:	8b 57 08             	mov    0x8(%edi),%edx
c01078ac:	89 f7                	mov    %esi,%edi
c01078ae:	89 ce                	mov    %ecx,%esi
c01078b0:	89 50 08             	mov    %edx,0x8(%eax)
c01078b3:	8b 41 04             	mov    0x4(%ecx),%eax
c01078b6:	eb 1b                	jmp    c01078d3 <_realloc_r+0x163>
c01078b8:	83 e2 f8             	and    $0xfffffff8,%edx
c01078bb:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01078be:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01078c1:	c1 ea 1f             	shr    $0x1f,%edx
c01078c4:	e9 ff fe ff ff       	jmp    c01077c8 <_realloc_r+0x58>
c01078c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01078d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01078d3:	89 da                	mov    %ebx,%edx
c01078d5:	2b 55 dc             	sub    -0x24(%ebp),%edx
c01078d8:	83 fa 0f             	cmp    $0xf,%edx
c01078db:	77 4b                	ja     c0107928 <_realloc_r+0x1b8>
c01078dd:	83 e0 01             	and    $0x1,%eax
c01078e0:	09 d8                	or     %ebx,%eax
c01078e2:	89 46 04             	mov    %eax,0x4(%esi)
c01078e5:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c01078ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01078ed:	89 04 24             	mov    %eax,(%esp)
c01078f0:	e8 ab da ff ff       	call   c01053a0 <__malloc_unlock>
c01078f5:	89 f8                	mov    %edi,%eax
c01078f7:	83 c4 3c             	add    $0x3c,%esp
c01078fa:	5b                   	pop    %ebx
c01078fb:	5e                   	pop    %esi
c01078fc:	5f                   	pop    %edi
c01078fd:	5d                   	pop    %ebp
c01078fe:	c3                   	ret    
c01078ff:	90                   	nop
c0107900:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107903:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107906:	01 d9                	add    %ebx,%ecx
c0107908:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c010790b:	0f 8c 04 ff ff ff    	jl     c0107815 <_realloc_r+0xa5>
c0107911:	8b 5a 0c             	mov    0xc(%edx),%ebx
c0107914:	8b 52 08             	mov    0x8(%edx),%edx
c0107917:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010791a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c010791d:	89 53 08             	mov    %edx,0x8(%ebx)
c0107920:	89 cb                	mov    %ecx,%ebx
c0107922:	eb af                	jmp    c01078d3 <_realloc_r+0x163>
c0107924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107928:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010792b:	83 e0 01             	and    $0x1,%eax
c010792e:	09 d8                	or     %ebx,%eax
c0107930:	89 46 04             	mov    %eax,0x4(%esi)
c0107933:	89 d0                	mov    %edx,%eax
c0107935:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c0107938:	83 c8 01             	or     $0x1,%eax
c010793b:	89 41 04             	mov    %eax,0x4(%ecx)
c010793e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107941:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107946:	83 c1 08             	add    $0x8,%ecx
c0107949:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010794d:	89 04 24             	mov    %eax,(%esp)
c0107950:	e8 2b fb ff ff       	call   c0107480 <_free_r>
c0107955:	eb 93                	jmp    c01078ea <_realloc_r+0x17a>
c0107957:	90                   	nop
c0107958:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010795b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010795f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107962:	89 04 24             	mov    %eax,(%esp)
c0107965:	e8 46 d2 ff ff       	call   c0104bb0 <_malloc_r>
c010796a:	85 c0                	test   %eax,%eax
c010796c:	89 c1                	mov    %eax,%ecx
c010796e:	0f 84 65 03 00 00    	je     c0107cd9 <_realloc_r+0x569>
c0107974:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107977:	8d 51 f8             	lea    -0x8(%ecx),%edx
c010797a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010797d:	89 c2                	mov    %eax,%edx
c010797f:	83 e2 fe             	and    $0xfffffffe,%edx
c0107982:	01 f2                	add    %esi,%edx
c0107984:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107987:	0f 84 63 02 00 00    	je     c0107bf0 <_realloc_r+0x480>
c010798d:	83 eb 04             	sub    $0x4,%ebx
c0107990:	83 fb 24             	cmp    $0x24,%ebx
c0107993:	0f 87 6f 01 00 00    	ja     c0107b08 <_realloc_r+0x398>
c0107999:	83 fb 13             	cmp    $0x13,%ebx
c010799c:	0f 87 ee 00 00 00    	ja     c0107a90 <_realloc_r+0x320>
c01079a2:	89 c8                	mov    %ecx,%eax
c01079a4:	89 fa                	mov    %edi,%edx
c01079a6:	8b 1a                	mov    (%edx),%ebx
c01079a8:	89 18                	mov    %ebx,(%eax)
c01079aa:	8b 5a 04             	mov    0x4(%edx),%ebx
c01079ad:	89 58 04             	mov    %ebx,0x4(%eax)
c01079b0:	8b 52 08             	mov    0x8(%edx),%edx
c01079b3:	89 50 08             	mov    %edx,0x8(%eax)
c01079b6:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c01079b9:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01079bd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01079c0:	89 34 24             	mov    %esi,(%esp)
c01079c3:	e8 b8 fa ff ff       	call   c0107480 <_free_r>
c01079c8:	89 34 24             	mov    %esi,(%esp)
c01079cb:	e8 d0 d9 ff ff       	call   c01053a0 <__malloc_unlock>
c01079d0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01079d3:	83 c4 3c             	add    $0x3c,%esp
c01079d6:	5b                   	pop    %ebx
c01079d7:	5e                   	pop    %esi
c01079d8:	5f                   	pop    %edi
c01079d9:	89 c8                	mov    %ecx,%eax
c01079db:	5d                   	pop    %ebp
c01079dc:	c3                   	ret    
c01079dd:	8d 76 00             	lea    0x0(%esi),%esi
c01079e0:	89 45 0c             	mov    %eax,0xc(%ebp)
c01079e3:	83 c4 3c             	add    $0x3c,%esp
c01079e6:	5b                   	pop    %ebx
c01079e7:	5e                   	pop    %esi
c01079e8:	5f                   	pop    %edi
c01079e9:	5d                   	pop    %ebp
c01079ea:	e9 c1 d1 ff ff       	jmp    c0104bb0 <_malloc_r>
c01079ef:	90                   	nop
c01079f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01079f3:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01079f9:	31 c0                	xor    %eax,%eax
c01079fb:	e9 f7 fe ff ff       	jmp    c01078f7 <_realloc_r+0x187>
c0107a00:	89 c2                	mov    %eax,%edx
c0107a02:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107a05:	0f 8c 4d ff ff ff    	jl     c0107958 <_realloc_r+0x1e8>
c0107a0b:	8b 71 08             	mov    0x8(%ecx),%esi
c0107a0e:	83 eb 04             	sub    $0x4,%ebx
c0107a11:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107a14:	83 fb 24             	cmp    $0x24,%ebx
c0107a17:	89 46 0c             	mov    %eax,0xc(%esi)
c0107a1a:	89 70 08             	mov    %esi,0x8(%eax)
c0107a1d:	8d 71 08             	lea    0x8(%ecx),%esi
c0107a20:	0f 87 88 00 00 00    	ja     c0107aae <_realloc_r+0x33e>
c0107a26:	83 fb 13             	cmp    $0x13,%ebx
c0107a29:	89 f0                	mov    %esi,%eax
c0107a2b:	76 1a                	jbe    c0107a47 <_realloc_r+0x2d7>
c0107a2d:	8b 07                	mov    (%edi),%eax
c0107a2f:	83 fb 1b             	cmp    $0x1b,%ebx
c0107a32:	89 41 08             	mov    %eax,0x8(%ecx)
c0107a35:	8b 47 04             	mov    0x4(%edi),%eax
c0107a38:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107a3b:	0f 87 17 02 00 00    	ja     c0107c58 <_realloc_r+0x4e8>
c0107a41:	8d 41 10             	lea    0x10(%ecx),%eax
c0107a44:	83 c7 08             	add    $0x8,%edi
c0107a47:	8b 1f                	mov    (%edi),%ebx
c0107a49:	89 18                	mov    %ebx,(%eax)
c0107a4b:	8b 5f 04             	mov    0x4(%edi),%ebx
c0107a4e:	89 58 04             	mov    %ebx,0x4(%eax)
c0107a51:	8b 5f 08             	mov    0x8(%edi),%ebx
c0107a54:	89 f7                	mov    %esi,%edi
c0107a56:	89 ce                	mov    %ecx,%esi
c0107a58:	89 58 08             	mov    %ebx,0x8(%eax)
c0107a5b:	89 d3                	mov    %edx,%ebx
c0107a5d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107a60:	e9 6e fe ff ff       	jmp    c01078d3 <_realloc_r+0x163>
c0107a65:	8d 76 00             	lea    0x0(%esi),%esi
c0107a68:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0107a6b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0107a6e:	8b 48 04             	mov    0x4(%eax),%ecx
c0107a71:	83 c2 10             	add    $0x10,%edx
c0107a74:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107a77:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c0107a7b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0107a7e:	01 d9                	add    %ebx,%ecx
c0107a80:	39 d1                	cmp    %edx,%ecx
c0107a82:	7d 54                	jge    c0107ad8 <_realloc_r+0x368>
c0107a84:	89 c2                	mov    %eax,%edx
c0107a86:	e9 8a fd ff ff       	jmp    c0107815 <_realloc_r+0xa5>
c0107a8b:	90                   	nop
c0107a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107a90:	8b 07                	mov    (%edi),%eax
c0107a92:	83 fb 1b             	cmp    $0x1b,%ebx
c0107a95:	89 01                	mov    %eax,(%ecx)
c0107a97:	8b 47 04             	mov    0x4(%edi),%eax
c0107a9a:	89 41 04             	mov    %eax,0x4(%ecx)
c0107a9d:	0f 87 2d 01 00 00    	ja     c0107bd0 <_realloc_r+0x460>
c0107aa3:	8d 41 08             	lea    0x8(%ecx),%eax
c0107aa6:	8d 57 08             	lea    0x8(%edi),%edx
c0107aa9:	e9 f8 fe ff ff       	jmp    c01079a6 <_realloc_r+0x236>
c0107aae:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107ab2:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107ab6:	89 f7                	mov    %esi,%edi
c0107ab8:	89 34 24             	mov    %esi,(%esp)
c0107abb:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0107abe:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107ac1:	e8 1a fc ff ff       	call   c01076e0 <memmove>
c0107ac6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107ac9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0107acc:	8b 41 04             	mov    0x4(%ecx),%eax
c0107acf:	89 ce                	mov    %ecx,%esi
c0107ad1:	89 d3                	mov    %edx,%ebx
c0107ad3:	e9 fb fd ff ff       	jmp    c01078d3 <_realloc_r+0x163>
c0107ad8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107adb:	29 d9                	sub    %ebx,%ecx
c0107add:	01 de                	add    %ebx,%esi
c0107adf:	83 c9 01             	or     $0x1,%ecx
c0107ae2:	89 35 28 a5 10 c0    	mov    %esi,0xc010a528
c0107ae8:	89 4e 04             	mov    %ecx,0x4(%esi)
c0107aeb:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107aee:	83 e0 01             	and    $0x1,%eax
c0107af1:	09 d8                	or     %ebx,%eax
c0107af3:	89 47 fc             	mov    %eax,-0x4(%edi)
c0107af6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107af9:	89 04 24             	mov    %eax,(%esp)
c0107afc:	e8 9f d8 ff ff       	call   c01053a0 <__malloc_unlock>
c0107b01:	89 f8                	mov    %edi,%eax
c0107b03:	e9 ef fd ff ff       	jmp    c01078f7 <_realloc_r+0x187>
c0107b08:	89 0c 24             	mov    %ecx,(%esp)
c0107b0b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107b0f:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107b13:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107b16:	e8 c5 fb ff ff       	call   c01076e0 <memmove>
c0107b1b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107b1e:	e9 93 fe ff ff       	jmp    c01079b6 <_realloc_r+0x246>
c0107b23:	90                   	nop
c0107b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107b28:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107b2b:	e9 d2 fe ff ff       	jmp    c0107a02 <_realloc_r+0x292>
c0107b30:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0107b33:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0107b36:	01 d0                	add    %edx,%eax
c0107b38:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107b3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0107b3e:	83 c0 10             	add    $0x10,%eax
c0107b41:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0107b44:	0f 8c b8 fe ff ff    	jl     c0107a02 <_realloc_r+0x292>
c0107b4a:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107b4d:	83 eb 04             	sub    $0x4,%ebx
c0107b50:	8b 51 08             	mov    0x8(%ecx),%edx
c0107b53:	83 fb 24             	cmp    $0x24,%ebx
c0107b56:	8d 71 08             	lea    0x8(%ecx),%esi
c0107b59:	89 42 0c             	mov    %eax,0xc(%edx)
c0107b5c:	89 50 08             	mov    %edx,0x8(%eax)
c0107b5f:	0f 87 3d 01 00 00    	ja     c0107ca2 <_realloc_r+0x532>
c0107b65:	83 fb 13             	cmp    $0x13,%ebx
c0107b68:	89 f0                	mov    %esi,%eax
c0107b6a:	76 1a                	jbe    c0107b86 <_realloc_r+0x416>
c0107b6c:	8b 07                	mov    (%edi),%eax
c0107b6e:	83 fb 1b             	cmp    $0x1b,%ebx
c0107b71:	89 41 08             	mov    %eax,0x8(%ecx)
c0107b74:	8b 47 04             	mov    0x4(%edi),%eax
c0107b77:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107b7a:	0f 87 3d 01 00 00    	ja     c0107cbd <_realloc_r+0x54d>
c0107b80:	8d 41 10             	lea    0x10(%ecx),%eax
c0107b83:	83 c7 08             	add    $0x8,%edi
c0107b86:	8b 17                	mov    (%edi),%edx
c0107b88:	89 10                	mov    %edx,(%eax)
c0107b8a:	8b 57 04             	mov    0x4(%edi),%edx
c0107b8d:	89 50 04             	mov    %edx,0x4(%eax)
c0107b90:	8b 57 08             	mov    0x8(%edi),%edx
c0107b93:	89 50 08             	mov    %edx,0x8(%eax)
c0107b96:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107b99:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0107b9c:	89 d8                	mov    %ebx,%eax
c0107b9e:	29 df                	sub    %ebx,%edi
c0107ba0:	01 c8                	add    %ecx,%eax
c0107ba2:	83 cf 01             	or     $0x1,%edi
c0107ba5:	a3 28 a5 10 c0       	mov    %eax,0xc010a528
c0107baa:	89 78 04             	mov    %edi,0x4(%eax)
c0107bad:	8b 41 04             	mov    0x4(%ecx),%eax
c0107bb0:	83 e0 01             	and    $0x1,%eax
c0107bb3:	09 d8                	or     %ebx,%eax
c0107bb5:	89 41 04             	mov    %eax,0x4(%ecx)
c0107bb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107bbb:	89 04 24             	mov    %eax,(%esp)
c0107bbe:	e8 dd d7 ff ff       	call   c01053a0 <__malloc_unlock>
c0107bc3:	89 f0                	mov    %esi,%eax
c0107bc5:	e9 2d fd ff ff       	jmp    c01078f7 <_realloc_r+0x187>
c0107bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107bd0:	8b 47 08             	mov    0x8(%edi),%eax
c0107bd3:	83 fb 24             	cmp    $0x24,%ebx
c0107bd6:	89 41 08             	mov    %eax,0x8(%ecx)
c0107bd9:	8b 47 0c             	mov    0xc(%edi),%eax
c0107bdc:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107bdf:	74 60                	je     c0107c41 <_realloc_r+0x4d1>
c0107be1:	8d 41 10             	lea    0x10(%ecx),%eax
c0107be4:	8d 57 10             	lea    0x10(%edi),%edx
c0107be7:	e9 ba fd ff ff       	jmp    c01079a6 <_realloc_r+0x236>
c0107bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107bf0:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0107bf3:	83 e2 fc             	and    $0xfffffffc,%edx
c0107bf6:	01 d3                	add    %edx,%ebx
c0107bf8:	e9 d6 fc ff ff       	jmp    c01078d3 <_realloc_r+0x163>
c0107bfd:	8d 76 00             	lea    0x0(%esi),%esi
c0107c00:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107c04:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107c08:	89 f7                	mov    %esi,%edi
c0107c0a:	89 34 24             	mov    %esi,(%esp)
c0107c0d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107c10:	e8 cb fa ff ff       	call   c01076e0 <memmove>
c0107c15:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107c18:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107c1b:	8b 41 04             	mov    0x4(%ecx),%eax
c0107c1e:	89 ce                	mov    %ecx,%esi
c0107c20:	e9 ae fc ff ff       	jmp    c01078d3 <_realloc_r+0x163>
c0107c25:	8b 47 08             	mov    0x8(%edi),%eax
c0107c28:	83 fb 24             	cmp    $0x24,%ebx
c0107c2b:	89 41 10             	mov    %eax,0x10(%ecx)
c0107c2e:	8b 47 0c             	mov    0xc(%edi),%eax
c0107c31:	89 41 14             	mov    %eax,0x14(%ecx)
c0107c34:	74 3e                	je     c0107c74 <_realloc_r+0x504>
c0107c36:	8d 41 18             	lea    0x18(%ecx),%eax
c0107c39:	83 c7 10             	add    $0x10,%edi
c0107c3c:	e9 5b fc ff ff       	jmp    c010789c <_realloc_r+0x12c>
c0107c41:	8b 47 10             	mov    0x10(%edi),%eax
c0107c44:	8d 57 18             	lea    0x18(%edi),%edx
c0107c47:	89 41 10             	mov    %eax,0x10(%ecx)
c0107c4a:	8b 5f 14             	mov    0x14(%edi),%ebx
c0107c4d:	8d 41 18             	lea    0x18(%ecx),%eax
c0107c50:	89 59 14             	mov    %ebx,0x14(%ecx)
c0107c53:	e9 4e fd ff ff       	jmp    c01079a6 <_realloc_r+0x236>
c0107c58:	8b 47 08             	mov    0x8(%edi),%eax
c0107c5b:	83 fb 24             	cmp    $0x24,%ebx
c0107c5e:	89 41 10             	mov    %eax,0x10(%ecx)
c0107c61:	8b 47 0c             	mov    0xc(%edi),%eax
c0107c64:	89 41 14             	mov    %eax,0x14(%ecx)
c0107c67:	74 22                	je     c0107c8b <_realloc_r+0x51b>
c0107c69:	8d 41 18             	lea    0x18(%ecx),%eax
c0107c6c:	83 c7 10             	add    $0x10,%edi
c0107c6f:	e9 d3 fd ff ff       	jmp    c0107a47 <_realloc_r+0x2d7>
c0107c74:	8b 47 10             	mov    0x10(%edi),%eax
c0107c77:	83 c7 18             	add    $0x18,%edi
c0107c7a:	89 41 18             	mov    %eax,0x18(%ecx)
c0107c7d:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107c80:	8d 41 20             	lea    0x20(%ecx),%eax
c0107c83:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107c86:	e9 11 fc ff ff       	jmp    c010789c <_realloc_r+0x12c>
c0107c8b:	8b 47 10             	mov    0x10(%edi),%eax
c0107c8e:	83 c7 18             	add    $0x18,%edi
c0107c91:	89 41 18             	mov    %eax,0x18(%ecx)
c0107c94:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0107c97:	8d 41 20             	lea    0x20(%ecx),%eax
c0107c9a:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c0107c9d:	e9 a5 fd ff ff       	jmp    c0107a47 <_realloc_r+0x2d7>
c0107ca2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107ca6:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107caa:	89 34 24             	mov    %esi,(%esp)
c0107cad:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107cb0:	e8 2b fa ff ff       	call   c01076e0 <memmove>
c0107cb5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107cb8:	e9 d9 fe ff ff       	jmp    c0107b96 <_realloc_r+0x426>
c0107cbd:	8b 47 08             	mov    0x8(%edi),%eax
c0107cc0:	83 fb 24             	cmp    $0x24,%ebx
c0107cc3:	89 41 10             	mov    %eax,0x10(%ecx)
c0107cc6:	8b 47 0c             	mov    0xc(%edi),%eax
c0107cc9:	89 41 14             	mov    %eax,0x14(%ecx)
c0107ccc:	74 1d                	je     c0107ceb <_realloc_r+0x57b>
c0107cce:	8d 41 18             	lea    0x18(%ecx),%eax
c0107cd1:	83 c7 10             	add    $0x10,%edi
c0107cd4:	e9 ad fe ff ff       	jmp    c0107b86 <_realloc_r+0x416>
c0107cd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107cdc:	89 04 24             	mov    %eax,(%esp)
c0107cdf:	e8 bc d6 ff ff       	call   c01053a0 <__malloc_unlock>
c0107ce4:	31 c0                	xor    %eax,%eax
c0107ce6:	e9 0c fc ff ff       	jmp    c01078f7 <_realloc_r+0x187>
c0107ceb:	8b 47 10             	mov    0x10(%edi),%eax
c0107cee:	83 c7 18             	add    $0x18,%edi
c0107cf1:	89 41 18             	mov    %eax,0x18(%ecx)
c0107cf4:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107cf7:	8d 41 20             	lea    0x20(%ecx),%eax
c0107cfa:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107cfd:	e9 84 fe ff ff       	jmp    c0107b86 <_realloc_r+0x416>
c0107d02:	66 90                	xchg   %ax,%ax
c0107d04:	66 90                	xchg   %ax,%ax
c0107d06:	66 90                	xchg   %ax,%ax
c0107d08:	66 90                	xchg   %ax,%ax
c0107d0a:	66 90                	xchg   %ax,%ax
c0107d0c:	66 90                	xchg   %ax,%ax
c0107d0e:	66 90                	xchg   %ax,%ax

c0107d10 <cleanup_glue>:
c0107d10:	55                   	push   %ebp
c0107d11:	89 e5                	mov    %esp,%ebp
c0107d13:	56                   	push   %esi
c0107d14:	53                   	push   %ebx
c0107d15:	83 ec 10             	sub    $0x10,%esp
c0107d18:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0107d1b:	8b 75 08             	mov    0x8(%ebp),%esi
c0107d1e:	8b 03                	mov    (%ebx),%eax
c0107d20:	85 c0                	test   %eax,%eax
c0107d22:	74 0c                	je     c0107d30 <cleanup_glue+0x20>
c0107d24:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107d28:	89 34 24             	mov    %esi,(%esp)
c0107d2b:	e8 e0 ff ff ff       	call   c0107d10 <cleanup_glue>
c0107d30:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0107d33:	89 75 08             	mov    %esi,0x8(%ebp)
c0107d36:	83 c4 10             	add    $0x10,%esp
c0107d39:	5b                   	pop    %ebx
c0107d3a:	5e                   	pop    %esi
c0107d3b:	5d                   	pop    %ebp
c0107d3c:	e9 3f f7 ff ff       	jmp    c0107480 <_free_r>
c0107d41:	eb 0d                	jmp    c0107d50 <_reclaim_reent>
c0107d43:	90                   	nop
c0107d44:	90                   	nop
c0107d45:	90                   	nop
c0107d46:	90                   	nop
c0107d47:	90                   	nop
c0107d48:	90                   	nop
c0107d49:	90                   	nop
c0107d4a:	90                   	nop
c0107d4b:	90                   	nop
c0107d4c:	90                   	nop
c0107d4d:	90                   	nop
c0107d4e:	90                   	nop
c0107d4f:	90                   	nop

c0107d50 <_reclaim_reent>:
c0107d50:	55                   	push   %ebp
c0107d51:	89 e5                	mov    %esp,%ebp
c0107d53:	57                   	push   %edi
c0107d54:	56                   	push   %esi
c0107d55:	53                   	push   %ebx
c0107d56:	83 ec 1c             	sub    $0x1c,%esp
c0107d59:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107d5c:	3b 1d 20 a0 10 c0    	cmp    0xc010a020,%ebx
c0107d62:	0f 84 a6 00 00 00    	je     c0107e0e <_reclaim_reent+0xbe>
c0107d68:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107d6b:	85 d2                	test   %edx,%edx
c0107d6d:	74 46                	je     c0107db5 <_reclaim_reent+0x65>
c0107d6f:	31 c0                	xor    %eax,%eax
c0107d71:	31 f6                	xor    %esi,%esi
c0107d73:	90                   	nop
c0107d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107d78:	8b 04 82             	mov    (%edx,%eax,4),%eax
c0107d7b:	85 c0                	test   %eax,%eax
c0107d7d:	75 0b                	jne    c0107d8a <_reclaim_reent+0x3a>
c0107d7f:	eb 1e                	jmp    c0107d9f <_reclaim_reent+0x4f>
c0107d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107d88:	89 f8                	mov    %edi,%eax
c0107d8a:	8b 38                	mov    (%eax),%edi
c0107d8c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107d90:	89 1c 24             	mov    %ebx,(%esp)
c0107d93:	e8 e8 f6 ff ff       	call   c0107480 <_free_r>
c0107d98:	85 ff                	test   %edi,%edi
c0107d9a:	75 ec                	jne    c0107d88 <_reclaim_reent+0x38>
c0107d9c:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107d9f:	83 c6 01             	add    $0x1,%esi
c0107da2:	83 fe 20             	cmp    $0x20,%esi
c0107da5:	89 f0                	mov    %esi,%eax
c0107da7:	75 cf                	jne    c0107d78 <_reclaim_reent+0x28>
c0107da9:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107dad:	89 1c 24             	mov    %ebx,(%esp)
c0107db0:	e8 cb f6 ff ff       	call   c0107480 <_free_r>
c0107db5:	8b 43 40             	mov    0x40(%ebx),%eax
c0107db8:	85 c0                	test   %eax,%eax
c0107dba:	74 0c                	je     c0107dc8 <_reclaim_reent+0x78>
c0107dbc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107dc0:	89 1c 24             	mov    %ebx,(%esp)
c0107dc3:	e8 b8 f6 ff ff       	call   c0107480 <_free_r>
c0107dc8:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c0107dce:	85 c0                	test   %eax,%eax
c0107dd0:	74 22                	je     c0107df4 <_reclaim_reent+0xa4>
c0107dd2:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0107dd8:	39 f0                	cmp    %esi,%eax
c0107dda:	75 06                	jne    c0107de2 <_reclaim_reent+0x92>
c0107ddc:	eb 16                	jmp    c0107df4 <_reclaim_reent+0xa4>
c0107dde:	66 90                	xchg   %ax,%ax
c0107de0:	89 f8                	mov    %edi,%eax
c0107de2:	8b 38                	mov    (%eax),%edi
c0107de4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107de8:	89 1c 24             	mov    %ebx,(%esp)
c0107deb:	e8 90 f6 ff ff       	call   c0107480 <_free_r>
c0107df0:	39 fe                	cmp    %edi,%esi
c0107df2:	75 ec                	jne    c0107de0 <_reclaim_reent+0x90>
c0107df4:	8b 43 54             	mov    0x54(%ebx),%eax
c0107df7:	85 c0                	test   %eax,%eax
c0107df9:	74 0c                	je     c0107e07 <_reclaim_reent+0xb7>
c0107dfb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107dff:	89 1c 24             	mov    %ebx,(%esp)
c0107e02:	e8 79 f6 ff ff       	call   c0107480 <_free_r>
c0107e07:	8b 43 38             	mov    0x38(%ebx),%eax
c0107e0a:	85 c0                	test   %eax,%eax
c0107e0c:	75 08                	jne    c0107e16 <_reclaim_reent+0xc6>
c0107e0e:	83 c4 1c             	add    $0x1c,%esp
c0107e11:	5b                   	pop    %ebx
c0107e12:	5e                   	pop    %esi
c0107e13:	5f                   	pop    %edi
c0107e14:	5d                   	pop    %ebp
c0107e15:	c3                   	ret    
c0107e16:	89 1c 24             	mov    %ebx,(%esp)
c0107e19:	ff 53 3c             	call   *0x3c(%ebx)
c0107e1c:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0107e22:	85 c0                	test   %eax,%eax
c0107e24:	74 e8                	je     c0107e0e <_reclaim_reent+0xbe>
c0107e26:	89 1c 24             	mov    %ebx,(%esp)
c0107e29:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107e2d:	e8 de fe ff ff       	call   c0107d10 <cleanup_glue>
c0107e32:	83 c4 1c             	add    $0x1c,%esp
c0107e35:	5b                   	pop    %ebx
c0107e36:	5e                   	pop    %esi
c0107e37:	5f                   	pop    %edi
c0107e38:	5d                   	pop    %ebp
c0107e39:	c3                   	ret    
