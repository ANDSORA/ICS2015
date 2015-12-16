
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
c010002b:	e9 00 04 00 00       	jmp    c0100430 <init>

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
c0100066:	e8 55 0b 00 00       	call   c0100bc0 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 5e 0b 00 00       	call   c0100bd0 <get_ucr3>
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
c010014c:	e8 97 12 00 00       	call   c01013e8 <memset>
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
c0100178:	c7 44 24 10 94 14 10 	movl   $0xc0101494,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c f8 14 10 	movl   $0xc01014f8,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 83 14 10 	movl   $0xc0101483,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 a4 14 10 c0 	movl   $0xc01014a4,(%esp)
c010019f:	e8 4c 0d 00 00       	call   c0100ef0 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 9c 14 10 	movl   $0xc010149c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c f8 14 10 	movl   $0xc01014f8,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 83 14 10 	movl   $0xc0101483,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 a4 14 10 c0 	movl   $0xc01014a4,(%esp)
c01001ee:	e8 fd 0c 00 00       	call   c0100ef0 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 94 14 10 	movl   $0xc0101494,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c f8 14 10 	movl   $0xc01014f8,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 83 14 10 	movl   $0xc0101483,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 a4 14 10 c0 	movl   $0xc01014a4,(%esp)
c010022e:	e8 bd 0c 00 00       	call   c0100ef0 <printk>
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
c0100258:	c7 44 24 10 9c 14 10 	movl   $0xc010149c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c f8 14 10 	movl   $0xc01014f8,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 83 14 10 	movl   $0xc0101483,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 a4 14 10 c0 	movl   $0xc01014a4,(%esp)
c010027f:	e8 6c 0c 00 00       	call   c0100ef0 <printk>
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
c01002a8:	c7 44 24 10 70 14 10 	movl   $0xc0101470,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c ee 14 10 	movl   $0xc01014ee,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 83 14 10 	movl   $0xc0101483,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 a4 14 10 c0 	movl   $0xc01014a4,(%esp)
c01002cf:	e8 1c 0c 00 00       	call   c0100ef0 <printk>
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
c010039a:	e8 01 02 00 00       	call   c01005a0 <irq_handle>
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
c01003b7:	e8 44 09 00 00       	call   c0100d00 <init_segment>
c01003bc:	e8 3f 03 00 00       	call   c0100700 <init_idt>
c01003c1:	e8 4a 08 00 00       	call   c0100c10 <init_mm>
c01003c6:	68 8f 15 10 c0       	push   $0xc010158f
c01003cb:	6a 4a                	push   $0x4a
c01003cd:	68 fe 14 10 c0       	push   $0xc01014fe
c01003d2:	68 10 15 10 c0       	push   $0xc0101510
c01003d7:	e8 14 0b 00 00       	call   c0100ef0 <printk>
c01003dc:	e8 4f 07 00 00       	call   c0100b30 <video_mapping_write_test>
c01003e1:	e8 ca 09 00 00       	call   c0100db0 <loader>
c01003e6:	89 c3                	mov    %eax,%ebx
c01003e8:	e8 63 07 00 00       	call   c0100b50 <video_mapping_read_test>
c01003ed:	e8 ae 07 00 00       	call   c0100ba0 <video_mapping_clear>
c01003f2:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c01003f7:	bd 00 00 00 00       	mov    $0x0,%ebp
c01003fc:	83 ec 10             	sub    $0x10,%esp
c01003ff:	ff d3                	call   *%ebx
c0100401:	68 8f 15 10 c0       	push   $0xc010158f
c0100406:	6a 6b                	push   $0x6b
c0100408:	68 fe 14 10 c0       	push   $0xc01014fe
c010040d:	68 44 15 10 c0       	push   $0xc0101544
c0100412:	e8 d9 0a 00 00       	call   c0100ef0 <printk>
c0100417:	b8 01 00 00 00       	mov    $0x1,%eax
c010041c:	d6                   	(bad)  
c010041d:	83 c4 20             	add    $0x20,%esp
c0100420:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100423:	c9                   	leave  
c0100424:	c3                   	ret    
c0100425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100430 <init>:
c0100430:	55                   	push   %ebp
c0100431:	89 e5                	mov    %esp,%ebp
c0100433:	83 ec 08             	sub    $0x8,%esp
c0100436:	e8 45 08 00 00       	call   c0100c80 <init_page>
c010043b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100441:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100446:	ff e0                	jmp    *%eax
c0100448:	68 99 15 10 c0       	push   $0xc0101599
c010044d:	6a 24                	push   $0x24
c010044f:	68 fe 14 10 c0       	push   $0xc01014fe
c0100454:	68 44 15 10 c0       	push   $0xc0101544
c0100459:	e8 92 0a 00 00       	call   c0100ef0 <printk>
c010045e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100463:	d6                   	(bad)  
c0100464:	83 c4 10             	add    $0x10,%esp
c0100467:	c9                   	leave  
c0100468:	c3                   	ret    
c0100469:	66 90                	xchg   %ax,%ax
c010046b:	66 90                	xchg   %ax,%ax
c010046d:	66 90                	xchg   %ax,%ax
c010046f:	90                   	nop

c0100470 <do_syscall>:
c0100470:	55                   	push   %ebp
c0100471:	89 e5                	mov    %esp,%ebp
c0100473:	53                   	push   %ebx
c0100474:	83 ec 04             	sub    $0x4,%esp
c0100477:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010047a:	8b 43 1c             	mov    0x1c(%ebx),%eax
c010047d:	85 c0                	test   %eax,%eax
c010047f:	74 4f                	je     c01004d0 <do_syscall+0x60>
c0100481:	83 f8 2d             	cmp    $0x2d,%eax
c0100484:	74 2a                	je     c01004b0 <do_syscall+0x40>
c0100486:	83 ec 0c             	sub    $0xc,%esp
c0100489:	50                   	push   %eax
c010048a:	68 14 16 10 c0       	push   $0xc0101614
c010048f:	6a 20                	push   $0x20
c0100491:	68 a0 15 10 c0       	push   $0xc01015a0
c0100496:	68 c0 15 10 c0       	push   $0xc01015c0
c010049b:	e8 50 0a 00 00       	call   c0100ef0 <printk>
c01004a0:	b8 01 00 00 00       	mov    $0x1,%eax
c01004a5:	d6                   	(bad)  
c01004a6:	83 c4 20             	add    $0x20,%esp
c01004a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004ac:	c9                   	leave  
c01004ad:	c3                   	ret    
c01004ae:	66 90                	xchg   %ax,%ax
c01004b0:	83 ec 0c             	sub    $0xc,%esp
c01004b3:	ff 73 10             	pushl  0x10(%ebx)
c01004b6:	e8 25 07 00 00       	call   c0100be0 <mm_brk>
c01004bb:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
c01004c2:	83 c4 10             	add    $0x10,%esp
c01004c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004c8:	c9                   	leave  
c01004c9:	c3                   	ret    
c01004ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01004d0:	fa                   	cli    
c01004d1:	83 ec 08             	sub    $0x8,%esp
c01004d4:	ff 73 18             	pushl  0x18(%ebx)
c01004d7:	ff 73 10             	pushl  0x10(%ebx)
c01004da:	e8 11 00 00 00       	call   c01004f0 <add_irq_handle>
c01004df:	fb                   	sti    
c01004e0:	83 c4 10             	add    $0x10,%esp
c01004e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004e6:	c9                   	leave  
c01004e7:	c3                   	ret    
c01004e8:	66 90                	xchg   %ax,%ax
c01004ea:	66 90                	xchg   %ax,%ax
c01004ec:	66 90                	xchg   %ax,%ax
c01004ee:	66 90                	xchg   %ax,%ax

c01004f0 <add_irq_handle>:
c01004f0:	55                   	push   %ebp
c01004f1:	89 e5                	mov    %esp,%ebp
c01004f3:	53                   	push   %ebx
c01004f4:	83 ec 04             	sub    $0x4,%esp
c01004f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01004fa:	83 fb 0f             	cmp    $0xf,%ebx
c01004fd:	7f 71                	jg     c0100570 <add_irq_handle+0x80>
c01004ff:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100504:	83 f8 20             	cmp    $0x20,%eax
c0100507:	7e 2c                	jle    c0100535 <add_irq_handle+0x45>
c0100509:	83 ec 0c             	sub    $0xc,%esp
c010050c:	68 4e 16 10 c0       	push   $0xc010164e
c0100511:	68 35 17 10 c0       	push   $0xc0101735
c0100516:	6a 16                	push   $0x16
c0100518:	68 32 16 10 c0       	push   $0xc0101632
c010051d:	68 a4 14 10 c0       	push   $0xc01014a4
c0100522:	e8 c9 09 00 00       	call   c0100ef0 <printk>
c0100527:	b8 01 00 00 00       	mov    $0x1,%eax
c010052c:	d6                   	(bad)  
c010052d:	a1 00 40 12 c0       	mov    0xc0124000,%eax
c0100532:	83 c4 20             	add    $0x20,%esp
c0100535:	8d 50 01             	lea    0x1(%eax),%edx
c0100538:	89 15 00 40 12 c0    	mov    %edx,0xc0124000
c010053e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100541:	89 14 c5 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,8)
c0100548:	8b 14 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%edx
c010054f:	89 14 c5 84 40 12 c0 	mov    %edx,-0x3fedbf7c(,%eax,8)
c0100556:	8d 04 c5 80 40 12 c0 	lea    -0x3fedbf80(,%eax,8),%eax
c010055d:	89 04 9d 40 40 12 c0 	mov    %eax,-0x3fedbfc0(,%ebx,4)
c0100564:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100567:	c9                   	leave  
c0100568:	c3                   	ret    
c0100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100570:	83 ec 0c             	sub    $0xc,%esp
c0100573:	68 1f 16 10 c0       	push   $0xc010161f
c0100578:	68 35 17 10 c0       	push   $0xc0101735
c010057d:	6a 15                	push   $0x15
c010057f:	68 32 16 10 c0       	push   $0xc0101632
c0100584:	68 a4 14 10 c0       	push   $0xc01014a4
c0100589:	e8 62 09 00 00       	call   c0100ef0 <printk>
c010058e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100593:	d6                   	(bad)  
c0100594:	83 c4 20             	add    $0x20,%esp
c0100597:	e9 63 ff ff ff       	jmp    c01004ff <add_irq_handle+0xf>
c010059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01005a0 <irq_handle>:
c01005a0:	55                   	push   %ebp
c01005a1:	89 e5                	mov    %esp,%ebp
c01005a3:	53                   	push   %ebx
c01005a4:	83 ec 04             	sub    $0x4,%esp
c01005a7:	8b 55 08             	mov    0x8(%ebp),%edx
c01005aa:	8b 42 20             	mov    0x20(%edx),%eax
c01005ad:	85 c0                	test   %eax,%eax
c01005af:	0f 88 9b 00 00 00    	js     c0100650 <irq_handle+0xb0>
c01005b5:	3d 80 00 00 00       	cmp    $0x80,%eax
c01005ba:	0f 84 b8 00 00 00    	je     c0100678 <irq_handle+0xd8>
c01005c0:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c01005c5:	7e 59                	jle    c0100620 <irq_handle+0x80>
c01005c7:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c01005cd:	83 fb 0f             	cmp    $0xf,%ebx
c01005d0:	7f 1e                	jg     c01005f0 <irq_handle+0x50>
c01005d2:	8b 1c 9d 40 40 12 c0 	mov    -0x3fedbfc0(,%ebx,4),%ebx
c01005d9:	85 db                	test   %ebx,%ebx
c01005db:	74 0c                	je     c01005e9 <irq_handle+0x49>
c01005dd:	8d 76 00             	lea    0x0(%esi),%esi
c01005e0:	ff 13                	call   *(%ebx)
c01005e2:	8b 5b 04             	mov    0x4(%ebx),%ebx
c01005e5:	85 db                	test   %ebx,%ebx
c01005e7:	75 f7                	jne    c01005e0 <irq_handle+0x40>
c01005e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005ec:	c9                   	leave  
c01005ed:	c3                   	ret    
c01005ee:	66 90                	xchg   %ax,%ax
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 6c 16 10 c0       	push   $0xc010166c
c01005f8:	68 2a 17 10 c0       	push   $0xc010172a
c01005fd:	6a 30                	push   $0x30
c01005ff:	68 32 16 10 c0       	push   $0xc0101632
c0100604:	68 a4 14 10 c0       	push   $0xc01014a4
c0100609:	e8 e2 08 00 00       	call   c0100ef0 <printk>
c010060e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100613:	d6                   	(bad)  
c0100614:	83 c4 20             	add    $0x20,%esp
c0100617:	eb b9                	jmp    c01005d2 <irq_handle+0x32>
c0100619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100620:	83 ec 08             	sub    $0x8,%esp
c0100623:	ff 72 28             	pushl  0x28(%edx)
c0100626:	50                   	push   %eax
c0100627:	68 2a 17 10 c0       	push   $0xc010172a
c010062c:	6a 2d                	push   $0x2d
c010062e:	68 32 16 10 c0       	push   $0xc0101632
c0100633:	68 d0 16 10 c0       	push   $0xc01016d0
c0100638:	e8 b3 08 00 00       	call   c0100ef0 <printk>
c010063d:	b8 01 00 00 00       	mov    $0x1,%eax
c0100642:	d6                   	(bad)  
c0100643:	83 c4 20             	add    $0x20,%esp
c0100646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100649:	c9                   	leave  
c010064a:	c3                   	ret    
c010064b:	90                   	nop
c010064c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100650:	68 2a 17 10 c0       	push   $0xc010172a
c0100655:	6a 29                	push   $0x29
c0100657:	68 32 16 10 c0       	push   $0xc0101632
c010065c:	68 84 16 10 c0       	push   $0xc0101684
c0100661:	e8 8a 08 00 00       	call   c0100ef0 <printk>
c0100666:	b8 01 00 00 00       	mov    $0x1,%eax
c010066b:	d6                   	(bad)  
c010066c:	83 c4 10             	add    $0x10,%esp
c010066f:	e9 75 ff ff ff       	jmp    c01005e9 <irq_handle+0x49>
c0100674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100678:	89 55 08             	mov    %edx,0x8(%ebp)
c010067b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010067e:	c9                   	leave  
c010067f:	e9 ec fd ff ff       	jmp    c0100470 <do_syscall>
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
c0100aa3:	53                   	push   %ebx
c0100aa4:	83 ec 04             	sub    $0x4,%esp
c0100aa7:	e8 14 01 00 00       	call   c0100bc0 <get_updir>
c0100aac:	89 c3                	mov    %eax,%ebx
c0100aae:	e8 0d 01 00 00       	call   c0100bc0 <get_updir>
c0100ab3:	39 c3                	cmp    %eax,%ebx
c0100ab5:	74 27                	je     c0100ade <create_video_mapping+0x3e>
c0100ab7:	83 ec 0c             	sub    $0xc,%esp
c0100aba:	68 44 17 10 c0       	push   $0xc0101744
c0100abf:	68 a7 17 10 c0       	push   $0xc01017a7
c0100ac4:	6a 19                	push   $0x19
c0100ac6:	68 6a 17 10 c0       	push   $0xc010176a
c0100acb:	68 a4 14 10 c0       	push   $0xc01014a4
c0100ad0:	e8 1b 04 00 00       	call   c0100ef0 <printk>
c0100ad5:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ada:	d6                   	(bad)  
c0100adb:	83 c4 20             	add    $0x20,%esp
c0100ade:	ba 00 50 12 00       	mov    $0x125000,%edx
c0100ae3:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100ae8:	b8 80 52 12 c0       	mov    $0xc0125280,%eax
c0100aed:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100af3:	83 ca 07             	or     $0x7,%edx
c0100af6:	89 13                	mov    %edx,(%ebx)
c0100af8:	90                   	nop
c0100af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b00:	89 ca                	mov    %ecx,%edx
c0100b02:	83 c0 04             	add    $0x4,%eax
c0100b05:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b0b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b11:	83 ca 07             	or     $0x7,%edx
c0100b14:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b17:	3d c0 52 12 c0       	cmp    $0xc01252c0,%eax
c0100b1c:	75 e2                	jne    c0100b00 <create_video_mapping+0x60>
c0100b1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b21:	c9                   	leave  
c0100b22:	c3                   	ret    
c0100b23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b30 <video_mapping_write_test>:
c0100b30:	55                   	push   %ebp
c0100b31:	31 c0                	xor    %eax,%eax
c0100b33:	89 e5                	mov    %esp,%ebp
c0100b35:	8d 76 00             	lea    0x0(%esi),%esi
c0100b38:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100b3f:	83 c0 01             	add    $0x1,%eax
c0100b42:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100b47:	75 ef                	jne    c0100b38 <video_mapping_write_test+0x8>
c0100b49:	5d                   	pop    %ebp
c0100b4a:	c3                   	ret    
c0100b4b:	90                   	nop
c0100b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100b50 <video_mapping_read_test>:
c0100b50:	55                   	push   %ebp
c0100b51:	89 e5                	mov    %esp,%ebp
c0100b53:	56                   	push   %esi
c0100b54:	be 01 00 00 00       	mov    $0x1,%esi
c0100b59:	53                   	push   %ebx
c0100b5a:	31 db                	xor    %ebx,%ebx
c0100b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b60:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100b67:	74 24                	je     c0100b8d <video_mapping_read_test+0x3d>
c0100b69:	83 ec 0c             	sub    $0xc,%esp
c0100b6c:	68 83 17 10 c0       	push   $0xc0101783
c0100b71:	68 8f 17 10 c0       	push   $0xc010178f
c0100b76:	6a 30                	push   $0x30
c0100b78:	68 6a 17 10 c0       	push   $0xc010176a
c0100b7d:	68 a4 14 10 c0       	push   $0xc01014a4
c0100b82:	e8 69 03 00 00       	call   c0100ef0 <printk>
c0100b87:	89 f0                	mov    %esi,%eax
c0100b89:	d6                   	(bad)  
c0100b8a:	83 c4 20             	add    $0x20,%esp
c0100b8d:	83 c3 01             	add    $0x1,%ebx
c0100b90:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100b96:	75 c8                	jne    c0100b60 <video_mapping_read_test+0x10>
c0100b98:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100b9b:	5b                   	pop    %ebx
c0100b9c:	5e                   	pop    %esi
c0100b9d:	5d                   	pop    %ebp
c0100b9e:	c3                   	ret    
c0100b9f:	90                   	nop

c0100ba0 <video_mapping_clear>:
c0100ba0:	55                   	push   %ebp
c0100ba1:	89 e5                	mov    %esp,%ebp
c0100ba3:	83 ec 0c             	sub    $0xc,%esp
c0100ba6:	68 00 fa 00 00       	push   $0xfa00
c0100bab:	6a 00                	push   $0x0
c0100bad:	68 00 00 0a 00       	push   $0xa0000
c0100bb2:	e8 31 08 00 00       	call   c01013e8 <memset>
c0100bb7:	83 c4 10             	add    $0x10,%esp
c0100bba:	c9                   	leave  
c0100bbb:	c3                   	ret    
c0100bbc:	66 90                	xchg   %ax,%ax
c0100bbe:	66 90                	xchg   %ax,%ax

c0100bc0 <get_updir>:
c0100bc0:	55                   	push   %ebp
c0100bc1:	b8 00 70 12 c0       	mov    $0xc0127000,%eax
c0100bc6:	89 e5                	mov    %esp,%ebp
c0100bc8:	5d                   	pop    %ebp
c0100bc9:	c3                   	ret    
c0100bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100bd0 <get_ucr3>:
c0100bd0:	55                   	push   %ebp
c0100bd1:	a1 04 60 12 c0       	mov    0xc0126004,%eax
c0100bd6:	89 e5                	mov    %esp,%ebp
c0100bd8:	5d                   	pop    %ebp
c0100bd9:	c3                   	ret    
c0100bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100be0 <mm_brk>:
c0100be0:	55                   	push   %ebp
c0100be1:	89 e5                	mov    %esp,%ebp
c0100be3:	53                   	push   %ebx
c0100be4:	83 ec 04             	sub    $0x4,%esp
c0100be7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100bea:	a1 00 60 12 c0       	mov    0xc0126000,%eax
c0100bef:	39 d8                	cmp    %ebx,%eax
c0100bf1:	73 11                	jae    c0100c04 <mm_brk+0x24>
c0100bf3:	89 da                	mov    %ebx,%edx
c0100bf5:	83 ec 08             	sub    $0x8,%esp
c0100bf8:	29 c2                	sub    %eax,%edx
c0100bfa:	52                   	push   %edx
c0100bfb:	50                   	push   %eax
c0100bfc:	e8 4f f4 ff ff       	call   c0100050 <mm_malloc>
c0100c01:	83 c4 10             	add    $0x10,%esp
c0100c04:	89 1d 00 60 12 c0    	mov    %ebx,0xc0126000
c0100c0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c0d:	c9                   	leave  
c0100c0e:	c3                   	ret    
c0100c0f:	90                   	nop

c0100c10 <init_mm>:
c0100c10:	55                   	push   %ebp
c0100c11:	89 e5                	mov    %esp,%ebp
c0100c13:	53                   	push   %ebx
c0100c14:	83 ec 04             	sub    $0x4,%esp
c0100c17:	e8 54 00 00 00       	call   c0100c70 <get_kpdir>
c0100c1c:	83 ec 04             	sub    $0x4,%esp
c0100c1f:	89 c3                	mov    %eax,%ebx
c0100c21:	68 00 10 00 00       	push   $0x1000
c0100c26:	6a 00                	push   $0x0
c0100c28:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100c2e:	68 00 70 12 c0       	push   $0xc0127000
c0100c33:	e8 b0 07 00 00       	call   c01013e8 <memset>
c0100c38:	83 c4 0c             	add    $0xc,%esp
c0100c3b:	68 80 00 00 00       	push   $0x80
c0100c40:	53                   	push   %ebx
c0100c41:	68 00 7c 12 c0       	push   $0xc0127c00
c0100c46:	e8 55 07 00 00       	call   c01013a0 <memcpy>
c0100c4b:	b8 00 70 12 00       	mov    $0x127000,%eax
c0100c50:	83 c4 10             	add    $0x10,%esp
c0100c53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c56:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100c5b:	a3 04 60 12 c0       	mov    %eax,0xc0126004
c0100c60:	c9                   	leave  
c0100c61:	c3                   	ret    
c0100c62:	66 90                	xchg   %ax,%ax
c0100c64:	66 90                	xchg   %ax,%ax
c0100c66:	66 90                	xchg   %ax,%ax
c0100c68:	66 90                	xchg   %ax,%ax
c0100c6a:	66 90                	xchg   %ax,%ax
c0100c6c:	66 90                	xchg   %ax,%ax
c0100c6e:	66 90                	xchg   %ax,%ax

c0100c70 <get_kpdir>:
c0100c70:	55                   	push   %ebp
c0100c71:	b8 00 90 14 c0       	mov    $0xc0149000,%eax
c0100c76:	89 e5                	mov    %esp,%ebp
c0100c78:	5d                   	pop    %ebp
c0100c79:	c3                   	ret    
c0100c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c80 <init_page>:
c0100c80:	55                   	push   %ebp
c0100c81:	89 e5                	mov    %esp,%ebp
c0100c83:	57                   	push   %edi
c0100c84:	83 ec 08             	sub    $0x8,%esp
c0100c87:	68 00 10 00 00       	push   $0x1000
c0100c8c:	6a 00                	push   $0x0
c0100c8e:	68 00 90 14 00       	push   $0x149000
c0100c93:	e8 50 07 00 00       	call   c01013e8 <memset>
c0100c98:	b9 00 90 14 00       	mov    $0x149000,%ecx
c0100c9d:	83 c4 10             	add    $0x10,%esp
c0100ca0:	ba 00 90 12 00       	mov    $0x129000,%edx
c0100ca5:	8d 76 00             	lea    0x0(%esi),%esi
c0100ca8:	89 d0                	mov    %edx,%eax
c0100caa:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100cb0:	83 c1 04             	add    $0x4,%ecx
c0100cb3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cb8:	83 c8 07             	or     $0x7,%eax
c0100cbb:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100cbe:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100cc4:	81 fa 00 90 14 00    	cmp    $0x149000,%edx
c0100cca:	75 dc                	jne    c0100ca8 <init_page+0x28>
c0100ccc:	bf fc 8f 14 00       	mov    $0x148ffc,%edi
c0100cd1:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100cd6:	fd                   	std    
c0100cd7:	ab                   	stos   %eax,%es:(%edi)
c0100cd8:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100cdd:	7d f8                	jge    c0100cd7 <init_page+0x57>
c0100cdf:	b8 00 90 14 00       	mov    $0x149000,%eax
c0100ce4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100ce9:	0f 22 d8             	mov    %eax,%cr3
c0100cec:	0f 20 c0             	mov    %cr0,%eax
c0100cef:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100cf4:	0f 22 c0             	mov    %eax,%cr0
c0100cf7:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100cfa:	c9                   	leave  
c0100cfb:	c3                   	ret    
c0100cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d00 <init_segment>:
c0100d00:	55                   	push   %ebp
c0100d01:	89 e5                	mov    %esp,%ebp
c0100d03:	83 ec 0c             	sub    $0xc,%esp
c0100d06:	6a 18                	push   $0x18
c0100d08:	6a 00                	push   $0x0
c0100d0a:	68 08 80 12 c0       	push   $0xc0128008
c0100d0f:	e8 d4 06 00 00       	call   c01013e8 <memset>
c0100d14:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d19:	31 c9                	xor    %ecx,%ecx
c0100d1b:	b8 08 80 12 c0       	mov    $0xc0128008,%eax
c0100d20:	66 89 15 10 80 12 c0 	mov    %dx,0xc0128010
c0100d27:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d2c:	66 89 0d 12 80 12 c0 	mov    %cx,0xc0128012
c0100d33:	66 89 15 18 80 12 c0 	mov    %dx,0xc0128018
c0100d3a:	ba 17 00 00 00       	mov    $0x17,%edx
c0100d3f:	31 c9                	xor    %ecx,%ecx
c0100d41:	66 89 15 00 80 12 c0 	mov    %dx,0xc0128000
c0100d48:	66 a3 02 80 12 c0    	mov    %ax,0xc0128002
c0100d4e:	c1 e8 10             	shr    $0x10,%eax
c0100d51:	66 a3 04 80 12 c0    	mov    %ax,0xc0128004
c0100d57:	c6 05 14 80 12 c0 00 	movb   $0x0,0xc0128014
c0100d5e:	b8 00 80 12 c0       	mov    $0xc0128000,%eax
c0100d63:	c6 05 15 80 12 c0 9a 	movb   $0x9a,0xc0128015
c0100d6a:	c6 05 16 80 12 c0 cf 	movb   $0xcf,0xc0128016
c0100d71:	c6 05 17 80 12 c0 00 	movb   $0x0,0xc0128017
c0100d78:	66 89 0d 1a 80 12 c0 	mov    %cx,0xc012801a
c0100d7f:	c6 05 1c 80 12 c0 00 	movb   $0x0,0xc012801c
c0100d86:	c6 05 1d 80 12 c0 92 	movb   $0x92,0xc012801d
c0100d8d:	c6 05 1e 80 12 c0 cf 	movb   $0xcf,0xc012801e
c0100d94:	c6 05 1f 80 12 c0 00 	movb   $0x0,0xc012801f
c0100d9b:	0f 01 10             	lgdtl  (%eax)
c0100d9e:	83 c4 10             	add    $0x10,%esp
c0100da1:	c9                   	leave  
c0100da2:	c3                   	ret    
c0100da3:	66 90                	xchg   %ax,%ax
c0100da5:	66 90                	xchg   %ax,%ax
c0100da7:	66 90                	xchg   %ax,%ax
c0100da9:	66 90                	xchg   %ax,%ax
c0100dab:	66 90                	xchg   %ax,%ax
c0100dad:	66 90                	xchg   %ax,%ax
c0100daf:	90                   	nop

c0100db0 <loader>:
c0100db0:	55                   	push   %ebp
c0100db1:	89 e5                	mov    %esp,%ebp
c0100db3:	57                   	push   %edi
c0100db4:	56                   	push   %esi
c0100db5:	53                   	push   %ebx
c0100db6:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100dbc:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100dc2:	68 00 10 00 00       	push   $0x1000
c0100dc7:	6a 00                	push   $0x0
c0100dc9:	53                   	push   %ebx
c0100dca:	e8 91 01 00 00       	call   c0100f60 <ramdisk_read>
c0100dcf:	83 c4 10             	add    $0x10,%esp
c0100dd2:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100dd9:	45 4c 46 
c0100ddc:	74 06                	je     c0100de4 <loader+0x34>
c0100dde:	b8 01 00 00 00       	mov    $0x1,%eax
c0100de3:	d6                   	(bad)  
c0100de4:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100dea:	83 fa 34             	cmp    $0x34,%edx
c0100ded:	74 06                	je     c0100df5 <loader+0x45>
c0100def:	b8 01 00 00 00       	mov    $0x1,%eax
c0100df4:	d6                   	(bad)  
c0100df5:	31 f6                	xor    %esi,%esi
c0100df7:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100dfe:	00 
c0100dff:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e03:	75 1c                	jne    c0100e21 <loader+0x71>
c0100e05:	eb 79                	jmp    c0100e80 <loader+0xd0>
c0100e07:	89 f6                	mov    %esi,%esi
c0100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e10:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e17:	83 c6 01             	add    $0x1,%esi
c0100e1a:	83 c3 20             	add    $0x20,%ebx
c0100e1d:	39 f0                	cmp    %esi,%eax
c0100e1f:	7e 5f                	jle    c0100e80 <loader+0xd0>
c0100e21:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100e25:	75 e9                	jne    c0100e10 <loader+0x60>
c0100e27:	83 ec 08             	sub    $0x8,%esp
c0100e2a:	ff 33                	pushl  (%ebx)
c0100e2c:	ff 73 f4             	pushl  -0xc(%ebx)
c0100e2f:	e8 1c f2 ff ff       	call   c0100050 <mm_malloc>
c0100e34:	83 c4 0c             	add    $0xc,%esp
c0100e37:	ff 73 fc             	pushl  -0x4(%ebx)
c0100e3a:	ff 73 f0             	pushl  -0x10(%ebx)
c0100e3d:	50                   	push   %eax
c0100e3e:	89 c7                	mov    %eax,%edi
c0100e40:	e8 1b 01 00 00       	call   c0100f60 <ramdisk_read>
c0100e45:	8b 43 fc             	mov    -0x4(%ebx),%eax
c0100e48:	8b 13                	mov    (%ebx),%edx
c0100e4a:	83 c4 0c             	add    $0xc,%esp
c0100e4d:	29 c2                	sub    %eax,%edx
c0100e4f:	52                   	push   %edx
c0100e50:	6a 00                	push   $0x0
c0100e52:	03 43 f0             	add    -0x10(%ebx),%eax
c0100e55:	01 c7                	add    %eax,%edi
c0100e57:	57                   	push   %edi
c0100e58:	e8 8b 05 00 00       	call   c01013e8 <memset>
c0100e5d:	8b 03                	mov    (%ebx),%eax
c0100e5f:	03 43 f4             	add    -0xc(%ebx),%eax
c0100e62:	83 c4 10             	add    $0x10,%esp
c0100e65:	83 e8 01             	sub    $0x1,%eax
c0100e68:	3b 05 00 60 12 c0    	cmp    0xc0126000,%eax
c0100e6e:	76 a0                	jbe    c0100e10 <loader+0x60>
c0100e70:	a3 00 60 12 c0       	mov    %eax,0xc0126000
c0100e75:	eb 99                	jmp    c0100e10 <loader+0x60>
c0100e77:	89 f6                	mov    %esi,%esi
c0100e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e80:	83 ec 08             	sub    $0x8,%esp
c0100e83:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100e89:	68 00 00 10 00       	push   $0x100000
c0100e8e:	68 00 00 f0 bf       	push   $0xbff00000
c0100e93:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100e99:	e8 b2 f1 ff ff       	call   c0100050 <mm_malloc>
c0100e9e:	e8 fd fb ff ff       	call   c0100aa0 <create_video_mapping>
c0100ea3:	e8 28 fd ff ff       	call   c0100bd0 <get_ucr3>
c0100ea8:	0f 22 d8             	mov    %eax,%cr3
c0100eab:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100eb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100eb4:	5b                   	pop    %ebx
c0100eb5:	5e                   	pop    %esi
c0100eb6:	5f                   	pop    %edi
c0100eb7:	5d                   	pop    %ebp
c0100eb8:	c3                   	ret    
c0100eb9:	66 90                	xchg   %ax,%ax
c0100ebb:	66 90                	xchg   %ax,%ax
c0100ebd:	66 90                	xchg   %ax,%ax
c0100ebf:	90                   	nop

c0100ec0 <sbrk>:
c0100ec0:	55                   	push   %ebp
c0100ec1:	89 e5                	mov    %esp,%ebp
c0100ec3:	83 ec 08             	sub    $0x8,%esp
c0100ec6:	68 d2 17 10 c0       	push   $0xc01017d2
c0100ecb:	6a 08                	push   $0x8
c0100ecd:	68 bc 17 10 c0       	push   $0xc01017bc
c0100ed2:	68 44 15 10 c0       	push   $0xc0101544
c0100ed7:	e8 14 00 00 00       	call   c0100ef0 <printk>
c0100edc:	b8 01 00 00 00       	mov    $0x1,%eax
c0100ee1:	d6                   	(bad)  
c0100ee2:	30 c0                	xor    %al,%al
c0100ee4:	c9                   	leave  
c0100ee5:	c3                   	ret    
c0100ee6:	66 90                	xchg   %ax,%ax
c0100ee8:	66 90                	xchg   %ax,%ax
c0100eea:	66 90                	xchg   %ax,%ax
c0100eec:	66 90                	xchg   %ax,%ax
c0100eee:	66 90                	xchg   %ax,%ax

c0100ef0 <printk>:
c0100ef0:	55                   	push   %ebp
c0100ef1:	89 e5                	mov    %esp,%ebp
c0100ef3:	5d                   	pop    %ebp
c0100ef4:	c3                   	ret    
c0100ef5:	66 90                	xchg   %ax,%ax
c0100ef7:	66 90                	xchg   %ax,%ax
c0100ef9:	66 90                	xchg   %ax,%ax
c0100efb:	66 90                	xchg   %ax,%ax
c0100efd:	66 90                	xchg   %ax,%ax
c0100eff:	90                   	nop

c0100f00 <init_serial>:
c0100f00:	55                   	push   %ebp
c0100f01:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100f06:	31 c0                	xor    %eax,%eax
c0100f08:	89 e5                	mov    %esp,%ebp
c0100f0a:	ee                   	out    %al,(%dx)
c0100f0b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100f10:	b2 fb                	mov    $0xfb,%dl
c0100f12:	ee                   	out    %al,(%dx)
c0100f13:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f18:	b2 f8                	mov    $0xf8,%dl
c0100f1a:	ee                   	out    %al,(%dx)
c0100f1b:	31 c0                	xor    %eax,%eax
c0100f1d:	b2 f9                	mov    $0xf9,%dl
c0100f1f:	ee                   	out    %al,(%dx)
c0100f20:	b8 03 00 00 00       	mov    $0x3,%eax
c0100f25:	b2 fb                	mov    $0xfb,%dl
c0100f27:	ee                   	out    %al,(%dx)
c0100f28:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100f2d:	b2 fa                	mov    $0xfa,%dl
c0100f2f:	ee                   	out    %al,(%dx)
c0100f30:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100f35:	b2 fc                	mov    $0xfc,%dl
c0100f37:	ee                   	out    %al,(%dx)
c0100f38:	5d                   	pop    %ebp
c0100f39:	c3                   	ret    
c0100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100f40 <serial_printc>:
c0100f40:	55                   	push   %ebp
c0100f41:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100f46:	89 e5                	mov    %esp,%ebp
c0100f48:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f4b:	90                   	nop
c0100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100f50:	ec                   	in     (%dx),%al
c0100f51:	a8 20                	test   $0x20,%al
c0100f53:	74 fb                	je     c0100f50 <serial_printc+0x10>
c0100f55:	ba f8 03 00 00       	mov    $0x3f8,%edx
c0100f5a:	89 c8                	mov    %ecx,%eax
c0100f5c:	ee                   	out    %al,(%dx)
c0100f5d:	5d                   	pop    %ebp
c0100f5e:	c3                   	ret    
c0100f5f:	90                   	nop

c0100f60 <ramdisk_read>:
c0100f60:	55                   	push   %ebp
c0100f61:	89 e5                	mov    %esp,%ebp
c0100f63:	53                   	push   %ebx
c0100f64:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f67:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f6a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f6d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100f70:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100f75:	76 06                	jbe    c0100f7d <ramdisk_read+0x1d>
c0100f77:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f7c:	d6                   	(bad)  
c0100f7d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0100f80:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100f83:	89 55 0c             	mov    %edx,0xc(%ebp)
c0100f86:	5b                   	pop    %ebx
c0100f87:	5d                   	pop    %ebp
c0100f88:	e9 13 04 00 00       	jmp    c01013a0 <memcpy>
c0100f8d:	8d 76 00             	lea    0x0(%esi),%esi

c0100f90 <ramdisk_write>:
c0100f90:	55                   	push   %ebp
c0100f91:	89 e5                	mov    %esp,%ebp
c0100f93:	53                   	push   %ebx
c0100f94:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100f97:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0100f9a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100f9d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0100fa0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0100fa5:	76 06                	jbe    c0100fad <ramdisk_write+0x1d>
c0100fa7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fac:	d6                   	(bad)  
c0100fad:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0100fb0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0100fb3:	89 55 08             	mov    %edx,0x8(%ebp)
c0100fb6:	5b                   	pop    %ebx
c0100fb7:	5d                   	pop    %ebp
c0100fb8:	e9 e3 03 00 00       	jmp    c01013a0 <memcpy>
c0100fbd:	66 90                	xchg   %ax,%ax
c0100fbf:	90                   	nop

c0100fc0 <ide_intr>:
c0100fc0:	55                   	push   %ebp
c0100fc1:	c7 05 04 a0 14 c0 01 	movl   $0x1,0xc014a004
c0100fc8:	00 00 00 
c0100fcb:	89 e5                	mov    %esp,%ebp
c0100fcd:	5d                   	pop    %ebp
c0100fce:	c3                   	ret    
c0100fcf:	90                   	nop

c0100fd0 <ide_writeback>:
c0100fd0:	a1 00 a0 14 c0       	mov    0xc014a000,%eax
c0100fd5:	83 c0 01             	add    $0x1,%eax
c0100fd8:	83 f8 64             	cmp    $0x64,%eax
c0100fdb:	a3 00 a0 14 c0       	mov    %eax,0xc014a000
c0100fe0:	74 06                	je     c0100fe8 <ide_writeback+0x18>
c0100fe2:	c3                   	ret    
c0100fe3:	90                   	nop
c0100fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100fe8:	55                   	push   %ebp
c0100fe9:	89 e5                	mov    %esp,%ebp
c0100feb:	83 ec 08             	sub    $0x8,%esp
c0100fee:	e8 dd 01 00 00       	call   c01011d0 <buf_writeback>
c0100ff3:	c7 05 00 a0 14 c0 00 	movl   $0x0,0xc014a000
c0100ffa:	00 00 00 
c0100ffd:	c9                   	leave  
c0100ffe:	c3                   	ret    
c0100fff:	90                   	nop

c0101000 <ide_read>:
c0101000:	55                   	push   %ebp
c0101001:	89 e5                	mov    %esp,%ebp
c0101003:	57                   	push   %edi
c0101004:	56                   	push   %esi
c0101005:	53                   	push   %ebx
c0101006:	83 ec 0c             	sub    $0xc,%esp
c0101009:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010100c:	8b 45 10             	mov    0x10(%ebp),%eax
c010100f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101012:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101015:	29 df                	sub    %ebx,%edi
c0101017:	85 c0                	test   %eax,%eax
c0101019:	74 1b                	je     c0101036 <ide_read+0x36>
c010101b:	90                   	nop
c010101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101020:	83 ec 0c             	sub    $0xc,%esp
c0101023:	53                   	push   %ebx
c0101024:	e8 07 02 00 00       	call   c0101230 <read_byte>
c0101029:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010102c:	83 c3 01             	add    $0x1,%ebx
c010102f:	83 c4 10             	add    $0x10,%esp
c0101032:	39 f3                	cmp    %esi,%ebx
c0101034:	75 ea                	jne    c0101020 <ide_read+0x20>
c0101036:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101039:	5b                   	pop    %ebx
c010103a:	5e                   	pop    %esi
c010103b:	5f                   	pop    %edi
c010103c:	5d                   	pop    %ebp
c010103d:	c3                   	ret    
c010103e:	66 90                	xchg   %ax,%ax

c0101040 <ide_write>:
c0101040:	55                   	push   %ebp
c0101041:	89 e5                	mov    %esp,%ebp
c0101043:	57                   	push   %edi
c0101044:	56                   	push   %esi
c0101045:	53                   	push   %ebx
c0101046:	83 ec 0c             	sub    $0xc,%esp
c0101049:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010104c:	8b 45 10             	mov    0x10(%ebp),%eax
c010104f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101052:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101055:	29 df                	sub    %ebx,%edi
c0101057:	85 c0                	test   %eax,%eax
c0101059:	74 1d                	je     c0101078 <ide_write+0x38>
c010105b:	90                   	nop
c010105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101060:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101064:	83 ec 08             	sub    $0x8,%esp
c0101067:	50                   	push   %eax
c0101068:	53                   	push   %ebx
c0101069:	83 c3 01             	add    $0x1,%ebx
c010106c:	e8 ef 01 00 00       	call   c0101260 <write_byte>
c0101071:	83 c4 10             	add    $0x10,%esp
c0101074:	39 f3                	cmp    %esi,%ebx
c0101076:	75 e8                	jne    c0101060 <ide_write+0x20>
c0101078:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010107b:	5b                   	pop    %ebx
c010107c:	5e                   	pop    %esi
c010107d:	5f                   	pop    %edi
c010107e:	5d                   	pop    %ebp
c010107f:	c3                   	ret    

c0101080 <clear_ide_intr>:
c0101080:	55                   	push   %ebp
c0101081:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c0101088:	00 00 00 
c010108b:	89 e5                	mov    %esp,%ebp
c010108d:	5d                   	pop    %ebp
c010108e:	c3                   	ret    
c010108f:	90                   	nop

c0101090 <wait_ide_intr>:
c0101090:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c0101095:	55                   	push   %ebp
c0101096:	89 e5                	mov    %esp,%ebp
c0101098:	85 c0                	test   %eax,%eax
c010109a:	75 0e                	jne    c01010aa <wait_ide_intr+0x1a>
c010109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010a0:	f4                   	hlt    
c01010a1:	a1 04 a0 14 c0       	mov    0xc014a004,%eax
c01010a6:	85 c0                	test   %eax,%eax
c01010a8:	74 f6                	je     c01010a0 <wait_ide_intr+0x10>
c01010aa:	c7 05 04 a0 14 c0 00 	movl   $0x0,0xc014a004
c01010b1:	00 00 00 
c01010b4:	5d                   	pop    %ebp
c01010b5:	c3                   	ret    
c01010b6:	8d 76 00             	lea    0x0(%esi),%esi
c01010b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01010c0 <init_ide>:
c01010c0:	55                   	push   %ebp
c01010c1:	89 e5                	mov    %esp,%ebp
c01010c3:	83 ec 08             	sub    $0x8,%esp
c01010c6:	e8 d5 00 00 00       	call   c01011a0 <buf_init>
c01010cb:	83 ec 08             	sub    $0x8,%esp
c01010ce:	68 d0 0f 10 c0       	push   $0xc0100fd0
c01010d3:	6a 00                	push   $0x0
c01010d5:	e8 16 f4 ff ff       	call   c01004f0 <add_irq_handle>
c01010da:	58                   	pop    %eax
c01010db:	5a                   	pop    %edx
c01010dc:	68 c0 0f 10 c0       	push   $0xc0100fc0
c01010e1:	6a 0e                	push   $0xe
c01010e3:	e8 08 f4 ff ff       	call   c01004f0 <add_irq_handle>
c01010e8:	83 c4 10             	add    $0x10,%esp
c01010eb:	c9                   	leave  
c01010ec:	c3                   	ret    
c01010ed:	66 90                	xchg   %ax,%ax
c01010ef:	90                   	nop

c01010f0 <buf_fetch>:
c01010f0:	55                   	push   %ebp
c01010f1:	89 c2                	mov    %eax,%edx
c01010f3:	89 e5                	mov    %esp,%ebp
c01010f5:	57                   	push   %edi
c01010f6:	56                   	push   %esi
c01010f7:	53                   	push   %ebx
c01010f8:	89 c3                	mov    %eax,%ebx
c01010fa:	83 e3 7f             	and    $0x7f,%ebx
c01010fd:	89 d8                	mov    %ebx,%eax
c01010ff:	83 ec 1c             	sub    $0x1c,%esp
c0101102:	c1 e0 09             	shl    $0x9,%eax
c0101105:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101108:	8d 81 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%eax
c010110e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101112:	74 5c                	je     c0101170 <buf_fetch+0x80>
c0101114:	89 d7                	mov    %edx,%edi
c0101116:	89 da                	mov    %ebx,%edx
c0101118:	c1 e2 09             	shl    $0x9,%edx
c010111b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010111e:	8d 91 40 a0 14 c0    	lea    -0x3feb5fc0(%ecx),%edx
c0101124:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010112a:	74 54                	je     c0101180 <buf_fetch+0x90>
c010112c:	8d 72 06             	lea    0x6(%edx),%esi
c010112f:	83 ec 08             	sub    $0x8,%esp
c0101132:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101135:	57                   	push   %edi
c0101136:	56                   	push   %esi
c0101137:	e8 a4 01 00 00       	call   c01012e0 <disk_do_read>
c010113c:	89 da                	mov    %ebx,%edx
c010113e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101141:	83 c4 10             	add    $0x10,%esp
c0101144:	c1 e2 09             	shl    $0x9,%edx
c0101147:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010114a:	c6 81 44 a0 14 c0 01 	movb   $0x1,-0x3feb5fbc(%ecx)
c0101151:	89 b9 40 a0 14 c0    	mov    %edi,-0x3feb5fc0(%ecx)
c0101157:	c6 81 45 a0 14 c0 00 	movb   $0x0,-0x3feb5fbb(%ecx)
c010115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101161:	5b                   	pop    %ebx
c0101162:	5e                   	pop    %esi
c0101163:	5f                   	pop    %edi
c0101164:	5d                   	pop    %ebp
c0101165:	c3                   	ret    
c0101166:	8d 76 00             	lea    0x0(%esi),%esi
c0101169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101170:	39 91 40 a0 14 c0    	cmp    %edx,-0x3feb5fc0(%ecx)
c0101176:	75 9c                	jne    c0101114 <buf_fetch+0x24>
c0101178:	eb e4                	jmp    c010115e <buf_fetch+0x6e>
c010117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101180:	8d 72 06             	lea    0x6(%edx),%esi
c0101183:	83 ec 08             	sub    $0x8,%esp
c0101186:	ff b1 40 a0 14 c0    	pushl  -0x3feb5fc0(%ecx)
c010118c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010118f:	56                   	push   %esi
c0101190:	e8 8b 01 00 00       	call   c0101320 <disk_do_write>
c0101195:	83 c4 10             	add    $0x10,%esp
c0101198:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010119b:	eb 92                	jmp    c010112f <buf_fetch+0x3f>
c010119d:	8d 76 00             	lea    0x0(%esi),%esi

c01011a0 <buf_init>:
c01011a0:	55                   	push   %ebp
c01011a1:	b8 44 a0 14 c0       	mov    $0xc014a044,%eax
c01011a6:	89 e5                	mov    %esp,%ebp
c01011a8:	90                   	nop
c01011a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01011b0:	c6 00 00             	movb   $0x0,(%eax)
c01011b3:	05 08 02 00 00       	add    $0x208,%eax
c01011b8:	3d 44 a4 15 c0       	cmp    $0xc015a444,%eax
c01011bd:	75 f1                	jne    c01011b0 <buf_init+0x10>
c01011bf:	5d                   	pop    %ebp
c01011c0:	c3                   	ret    
c01011c1:	eb 0d                	jmp    c01011d0 <buf_writeback>
c01011c3:	90                   	nop
c01011c4:	90                   	nop
c01011c5:	90                   	nop
c01011c6:	90                   	nop
c01011c7:	90                   	nop
c01011c8:	90                   	nop
c01011c9:	90                   	nop
c01011ca:	90                   	nop
c01011cb:	90                   	nop
c01011cc:	90                   	nop
c01011cd:	90                   	nop
c01011ce:	90                   	nop
c01011cf:	90                   	nop

c01011d0 <buf_writeback>:
c01011d0:	55                   	push   %ebp
c01011d1:	89 e5                	mov    %esp,%ebp
c01011d3:	53                   	push   %ebx
c01011d4:	bb 46 a0 14 c0       	mov    $0xc014a046,%ebx
c01011d9:	83 ec 04             	sub    $0x4,%esp
c01011dc:	eb 10                	jmp    c01011ee <buf_writeback+0x1e>
c01011de:	66 90                	xchg   %ax,%ax
c01011e0:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01011e6:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c01011ec:	74 32                	je     c0101220 <buf_writeback+0x50>
c01011ee:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01011f2:	75 ec                	jne    c01011e0 <buf_writeback+0x10>
c01011f4:	83 ec 08             	sub    $0x8,%esp
c01011f7:	ff 73 fa             	pushl  -0x6(%ebx)
c01011fa:	53                   	push   %ebx
c01011fb:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101201:	e8 1a 01 00 00       	call   c0101320 <disk_do_write>
c0101206:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c010120d:	83 c4 10             	add    $0x10,%esp
c0101210:	81 fb 46 a4 15 c0    	cmp    $0xc015a446,%ebx
c0101216:	75 d6                	jne    c01011ee <buf_writeback+0x1e>
c0101218:	90                   	nop
c0101219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101220:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101223:	c9                   	leave  
c0101224:	c3                   	ret    
c0101225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101230 <read_byte>:
c0101230:	55                   	push   %ebp
c0101231:	89 e5                	mov    %esp,%ebp
c0101233:	53                   	push   %ebx
c0101234:	83 ec 04             	sub    $0x4,%esp
c0101237:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010123a:	89 d8                	mov    %ebx,%eax
c010123c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101242:	c1 e8 09             	shr    $0x9,%eax
c0101245:	e8 a6 fe ff ff       	call   c01010f0 <buf_fetch>
c010124a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c010124f:	83 c4 04             	add    $0x4,%esp
c0101252:	5b                   	pop    %ebx
c0101253:	5d                   	pop    %ebp
c0101254:	c3                   	ret    
c0101255:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101260 <write_byte>:
c0101260:	55                   	push   %ebp
c0101261:	89 e5                	mov    %esp,%ebp
c0101263:	56                   	push   %esi
c0101264:	53                   	push   %ebx
c0101265:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101268:	8b 75 0c             	mov    0xc(%ebp),%esi
c010126b:	89 d8                	mov    %ebx,%eax
c010126d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101273:	c1 e8 09             	shr    $0x9,%eax
c0101276:	e8 75 fe ff ff       	call   c01010f0 <buf_fetch>
c010127b:	89 f2                	mov    %esi,%edx
c010127d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101281:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101285:	5b                   	pop    %ebx
c0101286:	5e                   	pop    %esi
c0101287:	5d                   	pop    %ebp
c0101288:	c3                   	ret    
c0101289:	66 90                	xchg   %ax,%ax
c010128b:	66 90                	xchg   %ax,%ax
c010128d:	66 90                	xchg   %ax,%ax
c010128f:	90                   	nop

c0101290 <ide_prepare>:
c0101290:	55                   	push   %ebp
c0101291:	89 c1                	mov    %eax,%ecx
c0101293:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101298:	89 e5                	mov    %esp,%ebp
c010129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01012a0:	ec                   	in     (%dx),%al
c01012a1:	83 e0 c0             	and    $0xffffffc0,%eax
c01012a4:	3c 40                	cmp    $0x40,%al
c01012a6:	75 f8                	jne    c01012a0 <ide_prepare+0x10>
c01012a8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c01012ad:	31 c0                	xor    %eax,%eax
c01012af:	ee                   	out    %al,(%dx)
c01012b0:	b8 01 00 00 00       	mov    $0x1,%eax
c01012b5:	b2 f2                	mov    $0xf2,%dl
c01012b7:	ee                   	out    %al,(%dx)
c01012b8:	b2 f3                	mov    $0xf3,%dl
c01012ba:	89 c8                	mov    %ecx,%eax
c01012bc:	ee                   	out    %al,(%dx)
c01012bd:	89 c8                	mov    %ecx,%eax
c01012bf:	b2 f4                	mov    $0xf4,%dl
c01012c1:	c1 e8 08             	shr    $0x8,%eax
c01012c4:	ee                   	out    %al,(%dx)
c01012c5:	89 c8                	mov    %ecx,%eax
c01012c7:	b2 f5                	mov    $0xf5,%dl
c01012c9:	c1 e8 10             	shr    $0x10,%eax
c01012cc:	ee                   	out    %al,(%dx)
c01012cd:	89 c8                	mov    %ecx,%eax
c01012cf:	b2 f6                	mov    $0xf6,%dl
c01012d1:	c1 e8 18             	shr    $0x18,%eax
c01012d4:	83 c8 e0             	or     $0xffffffe0,%eax
c01012d7:	ee                   	out    %al,(%dx)
c01012d8:	5d                   	pop    %ebp
c01012d9:	c3                   	ret    
c01012da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01012e0 <disk_do_read>:
c01012e0:	55                   	push   %ebp
c01012e1:	89 e5                	mov    %esp,%ebp
c01012e3:	53                   	push   %ebx
c01012e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012e7:	e8 a4 ff ff ff       	call   c0101290 <ide_prepare>
c01012ec:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01012f1:	b8 20 00 00 00       	mov    $0x20,%eax
c01012f6:	ee                   	out    %al,(%dx)
c01012f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01012fa:	b2 f0                	mov    $0xf0,%dl
c01012fc:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101308:	ed                   	in     (%dx),%eax
c0101309:	89 01                	mov    %eax,(%ecx)
c010130b:	83 c1 04             	add    $0x4,%ecx
c010130e:	39 d9                	cmp    %ebx,%ecx
c0101310:	75 f6                	jne    c0101308 <disk_do_read+0x28>
c0101312:	5b                   	pop    %ebx
c0101313:	5d                   	pop    %ebp
c0101314:	c3                   	ret    
c0101315:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101320 <disk_do_write>:
c0101320:	55                   	push   %ebp
c0101321:	89 e5                	mov    %esp,%ebp
c0101323:	53                   	push   %ebx
c0101324:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101327:	e8 64 ff ff ff       	call   c0101290 <ide_prepare>
c010132c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101331:	b8 30 00 00 00       	mov    $0x30,%eax
c0101336:	ee                   	out    %al,(%dx)
c0101337:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010133a:	b2 f0                	mov    $0xf0,%dl
c010133c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101348:	8b 01                	mov    (%ecx),%eax
c010134a:	ef                   	out    %eax,(%dx)
c010134b:	83 c1 04             	add    $0x4,%ecx
c010134e:	39 d9                	cmp    %ebx,%ecx
c0101350:	75 f6                	jne    c0101348 <disk_do_write+0x28>
c0101352:	5b                   	pop    %ebx
c0101353:	5d                   	pop    %ebp
c0101354:	c3                   	ret    
c0101355:	66 90                	xchg   %ax,%ax
c0101357:	66 90                	xchg   %ax,%ax
c0101359:	66 90                	xchg   %ax,%ax
c010135b:	66 90                	xchg   %ax,%ax
c010135d:	66 90                	xchg   %ax,%ax
c010135f:	90                   	nop

c0101360 <dma_prepare>:
c0101360:	55                   	push   %ebp
c0101361:	89 e5                	mov    %esp,%ebp
c0101363:	83 ec 08             	sub    $0x8,%esp
c0101366:	68 40 18 10 c0       	push   $0xc0101840
c010136b:	6a 1d                	push   $0x1d
c010136d:	68 d7 17 10 c0       	push   $0xc01017d7
c0101372:	68 f4 17 10 c0       	push   $0xc01017f4
c0101377:	e8 74 fb ff ff       	call   c0100ef0 <printk>
c010137c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101381:	d6                   	(bad)  
c0101382:	83 c4 10             	add    $0x10,%esp
c0101385:	c9                   	leave  
c0101386:	c3                   	ret    
c0101387:	89 f6                	mov    %esi,%esi
c0101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101390 <dma_issue_read>:
c0101390:	55                   	push   %ebp
c0101391:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101396:	89 e5                	mov    %esp,%ebp
c0101398:	ec                   	in     (%dx),%al
c0101399:	83 c8 09             	or     $0x9,%eax
c010139c:	ee                   	out    %al,(%dx)
c010139d:	5d                   	pop    %ebp
c010139e:	c3                   	ret    
c010139f:	90                   	nop

c01013a0 <memcpy>:
c01013a0:	55                   	push   %ebp
c01013a1:	89 e5                	mov    %esp,%ebp
c01013a3:	56                   	push   %esi
c01013a4:	57                   	push   %edi
c01013a5:	53                   	push   %ebx
c01013a6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013ac:	8b 75 0c             	mov    0xc(%ebp),%esi
c01013af:	fc                   	cld    
c01013b0:	83 f9 08             	cmp    $0x8,%ecx
c01013b3:	76 26                	jbe    c01013db <memcpy+0x3b>
c01013b5:	89 fa                	mov    %edi,%edx
c01013b7:	89 cb                	mov    %ecx,%ebx
c01013b9:	83 e2 03             	and    $0x3,%edx
c01013bc:	74 10                	je     c01013ce <memcpy+0x2e>
c01013be:	b9 04 00 00 00       	mov    $0x4,%ecx
c01013c3:	29 d1                	sub    %edx,%ecx
c01013c5:	83 e1 03             	and    $0x3,%ecx
c01013c8:	29 cb                	sub    %ecx,%ebx
c01013ca:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013cc:	89 d9                	mov    %ebx,%ecx
c01013ce:	c1 e9 02             	shr    $0x2,%ecx
c01013d1:	8d 76 00             	lea    0x0(%esi),%esi
c01013d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01013d6:	89 d9                	mov    %ebx,%ecx
c01013d8:	83 e1 03             	and    $0x3,%ecx
c01013db:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01013dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01013e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01013e3:	5b                   	pop    %ebx
c01013e4:	5f                   	pop    %edi
c01013e5:	5e                   	pop    %esi
c01013e6:	c9                   	leave  
c01013e7:	c3                   	ret    

c01013e8 <memset>:
c01013e8:	55                   	push   %ebp
c01013e9:	89 e5                	mov    %esp,%ebp
c01013eb:	57                   	push   %edi
c01013ec:	8b 7d 08             	mov    0x8(%ebp),%edi
c01013ef:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01013f3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01013f6:	fc                   	cld    
c01013f7:	83 f9 10             	cmp    $0x10,%ecx
c01013fa:	76 69                	jbe    c0101465 <memset+0x7d>
c01013fc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101402:	74 4c                	je     c0101450 <memset+0x68>
c0101404:	88 07                	mov    %al,(%edi)
c0101406:	47                   	inc    %edi
c0101407:	49                   	dec    %ecx
c0101408:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010140e:	74 40                	je     c0101450 <memset+0x68>
c0101410:	88 07                	mov    %al,(%edi)
c0101412:	47                   	inc    %edi
c0101413:	49                   	dec    %ecx
c0101414:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010141a:	74 34                	je     c0101450 <memset+0x68>
c010141c:	88 07                	mov    %al,(%edi)
c010141e:	47                   	inc    %edi
c010141f:	49                   	dec    %ecx
c0101420:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101426:	74 28                	je     c0101450 <memset+0x68>
c0101428:	88 07                	mov    %al,(%edi)
c010142a:	47                   	inc    %edi
c010142b:	49                   	dec    %ecx
c010142c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101432:	74 1c                	je     c0101450 <memset+0x68>
c0101434:	88 07                	mov    %al,(%edi)
c0101436:	47                   	inc    %edi
c0101437:	49                   	dec    %ecx
c0101438:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010143e:	74 10                	je     c0101450 <memset+0x68>
c0101440:	88 07                	mov    %al,(%edi)
c0101442:	47                   	inc    %edi
c0101443:	49                   	dec    %ecx
c0101444:	f7 c7 07 00 00 00    	test   $0x7,%edi
c010144a:	74 04                	je     c0101450 <memset+0x68>
c010144c:	88 07                	mov    %al,(%edi)
c010144e:	47                   	inc    %edi
c010144f:	49                   	dec    %ecx
c0101450:	88 c4                	mov    %al,%ah
c0101452:	89 c2                	mov    %eax,%edx
c0101454:	c1 e2 10             	shl    $0x10,%edx
c0101457:	09 d0                	or     %edx,%eax
c0101459:	89 ca                	mov    %ecx,%edx
c010145b:	c1 e9 02             	shr    $0x2,%ecx
c010145e:	83 e2 03             	and    $0x3,%edx
c0101461:	f3 ab                	rep stos %eax,%es:(%edi)
c0101463:	89 d1                	mov    %edx,%ecx
c0101465:	f3 aa                	rep stos %al,%es:(%edi)
c0101467:	8b 45 08             	mov    0x8(%ebp),%eax
c010146a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010146d:	5f                   	pop    %edi
c010146e:	c9                   	leave  
c010146f:	c3                   	ret    
